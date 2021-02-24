clear all;

num_of_sample = 5;
for s = 5:num_of_sample
    disp(['指令: ' num2str(s)]); %% 印出觀察用
    
    tic
    
    input_dir = ['0' num2str(s) '_01'];
    output_dir = ['features/' num2str(s)];

    if exist(output_dir, 'dir')
        rmdir(output_dir, 's');
    end
    mkdir(output_dir);


    files = dir('*.wav');
    num_of_files = length(files);
    for i = 1:num_of_files
        [y, fs] = audioread([files(i).folder '/' files(i).name]);
        [cepstra, aspectrum, pspectrum] = melfcc(y, fs, 'wintime', 0.032, 'hoptime', 0.016, 'dither', 1);
        delta_cepstra = deltas(cepstra);
        delta_delta_cepstra = deltas(delta_cepstra);
        mfcc = [cepstra; delta_cepstra; delta_delta_cepstra];
        save([output_dir '/' files(i).name '.txt'], 'mfcc', '-ascii');
    end
    toc
end