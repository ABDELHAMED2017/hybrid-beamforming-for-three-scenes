function  mytoc(t1)
global N_loop;
t2 = clock;
myt=etime(t2,t1) ;
wholetime = N_loop/10*myt ;
wholeh=fix(wholetime/3600);
wholem=fix((wholetime-3600*wholeh)/60);
wholes=wholetime-wholeh*3600-wholem*60;
%disp(['ִ��10��ѭ������ʱ��Ϊ��',num2str(mym),'��',num2str(mys),'��']);
disp(['����������ʱ��Ϊ��',num2str(wholeh) 'Сʱ',num2str(wholem),'��',num2str(wholes),'��']);
