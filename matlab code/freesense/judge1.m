function accuracy=judge1(data,label)
%����ÿһ�����ݺ��������ݼ��ľ��룬�õ����Ϊ�������ݵ�����˳��
for ii=1:(size(data,2))
data1=data;
data1{ii}={};
data1(cellfun(@isempty,data1))=[];
data2={data{1,ii}};
distance=dis(data1,data2);
[a,b]=sort(distance);
sort_dis(ii)=b(1);
end
%����˳���ж��Ƿ����׼ȷ
for ii=1:size(label,2)
    raw=char(label{1,ii});
    label_1(ii)=int64(raw(1));
end
label_k = find([true;diff(label_1(:))~=0;true]);
label_r = [label_k(1:end-1) diff(label_k)];

for jj=1:size(sort_dis,2)
    if (label_r(jj,1)<= sort_dis(jj) && sort_dis(jj)<=label_r(jj,2)+label_r(jj,1)+1)
        right(jj)=1;
    else 
        right(jj)=0;
    end
end
accuracy=sum(right)/length(right);
    