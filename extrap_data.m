function data_hr = extrap_data(surf_hr, surf_lr, data_lr)

    verts_hr = surf_hr.Vertices;
    faces_hr = surf_hr.Faces;

    vx_hr = verts_hr(:,1);
    vy_hr = verts_hr(:,2);
    vz_hr = verts_hr(:,3);

    verts_lr = surf_lr.Vertices;
    vert_inds_lr = 1:size(data_lr, 1);

    vx_lr_ = verts_lr(vert_inds_lr, 1);
    vy_lr_ = verts_lr(vert_inds_lr, 2);
    vz_lr_ = verts_lr(vert_inds_lr, 3);

    % ------------ Extrapolate data onto HR surface ------- %
    F_data = scatteredInterpolant(vx_lr_, vy_lr_, vz_lr_, data_lr);
    data_hr = F_data(vx_hr, vy_hr, vz_hr);
end
