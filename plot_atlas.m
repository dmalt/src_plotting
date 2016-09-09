function h = plot_atlas(surf_hr, atlas, mask, brain_opacity)
% DESCRIPTION:
% Plot significant patches of atlas on brain surface
% USAGE:
% h = plot_atlas(surf_hr, atlas, mask)
% INPUT:
% surf_hr   - hight resolution brain surface imported from brainstorm
% atlas 	- atlas on HR surface imoprted from brainstorm
% 			  Hint: import original surface from bst (not inflated)
%             to a variable surf_hr_orig and run
%             atlas = surf_hr_orig.Atlas(2)
%             to get Destrieux atlas
% mask      - binary array with ones corresponding to patches
%             we want to plot.
%             For test run mask can be set up like this:
%             mask = zeros(m_length = length(atlas.Scouts),1);
%             mask(10:50) = 1;
%             mask = logical(mask);
% brain_opacity - scalar between 0 and 1. default = 1
% OUTPUT:
% h - handle to camlight; 
% to reset lighting after moving the camera, run
% camlight(h,'left')
% _______________________________________________________________

	if nargin < 4
		brain_opacity = 1;
	end
	% ---- Setup faces and vertices --- %	 
	verts_hr = surf_hr.Vertices;
	faces_hr = surf_hr.Faces;

	vx_hr = verts_hr(:,1);
	vy_hr = verts_hr(:,2);
	vz_hr = verts_hr(:,3);

	% --- Mask out atlas patches --- %
	sig_scouts = atlas.Scouts(mask);

	% --- Plot brain --- %
	brain_col = [0.9,0.9,0.9];
	trisurf(faces_hr, vx_hr, vy_hr, vz_hr, 'EdgeColor', 'None', 'FaceColor', brain_col, 'FaceAlpha', brain_opacity);

	% --- Plot atlas --- %
	cmap = lines(length(sig_scouts));
	for i = 1:length(sig_scouts)
		verts_id_sc = sig_scouts(i).Vertices;
		faces_sc = prune_faces(faces_hr, verts_id_sc);
		hold on;
		trisurf(faces_sc, vx_hr, vy_hr, vz_hr, 'EdgeColor', 'None', 'FaceColor', cmap(i,:) );
	end

	% --- Setup plotting params --- %
	axis equal
	grid off
	axis off
	view(0,0)
	h = camlight(0,0); 
	lighting phong;
end

function faces_ = prune_faces(faces, idx)
% Remove faces if one of 3 vertex indices is in idx
% ________________________________________________

	mask_faces = ismember(faces(:,1), idx) | ismember(faces(:,2), idx) |  ismember(faces(:,3), idx);
	faces_ = faces(mask_faces,:);
end