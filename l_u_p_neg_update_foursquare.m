function [l_u_neg_i, l_p_neg_i] = l_u_p_neg_update_foursquare( trainset,rank_gamma_p,rank_delta,u_l,p_l,matrix_feature,lamda,i )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%��ȡ��user_unique_m(i_test)���û���gamma
    temp_gamma_old=rank_gamma_p(:,trainset(i==trainset(:,12),16));
    temp_gamma=repmat(temp_gamma_old',[1 1 matrix_feature]);
    %��ȡ��user_unique_m(i_test)���û���delta
    temp_delta=repmat(rank_delta(:,trainset(i==trainset(:,12),16))',[1 1 matrix_feature]);
    temp_u_l=-u_l(trainset(i==trainset(:,12),1),:,:);
    temp_up_l_u=sum(temp_gamma .* temp_delta .* temp_u_l,1);

    temp_p_l=-p_l(trainset(i==trainset(:,12),2),:,:);
    temp_up_l_p=sum(temp_gamma .* temp_delta .* temp_p_l,1);
    
    
    %�ڶ��н���취����temp_dowm����Ϊ1*4*64,ֱ����temp_up�ж��õ�Ԫ������������ĺô��ǿ���ֱ�Ӹ�ֵ��u_l_new
    temp_dowm=lamda .* (sum(temp_gamma_old,2));
    temp_dowm_new=repmat(temp_dowm',[1 1 matrix_feature]);
%     temp_u_l_new=temp_up ./ temp_dowm_new;
    
    l_u_neg_i=temp_up_l_u ./ temp_dowm_new;
    l_p_neg_i=temp_up_l_p ./ temp_dowm_new;

end

