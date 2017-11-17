ch_path = '/home/dmalt/bst/brainstorm_db/mentrot/data/biomag2010/@rawdataset02/channel_ctf_acc1.mat';
ch = load(ch_path);
ch = ch.Channel;
ch_used = ups.bst.PickChannels(ch, 'MEG');
ch_meg = ch(ch_used);
n_ch = length(ch_meg);

meg_loc_3d = zeros(n_ch,3);
for i_ch = 1:n_ch
    meg_loc_3d(i_ch,:) = mean(ch_meg(i_ch).Loc,2);
end
data_path = '/home/dmalt/github/matlab/PSIICOS/scripts/biomag2010/pwr.mat';
data = load(data_path);
data = data.pwr;

plot_topo(meg_loc_3d, data);
