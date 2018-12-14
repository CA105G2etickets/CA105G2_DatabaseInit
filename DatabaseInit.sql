--------------------------------------------------------
--       _________________   ___      _____           --
--       | ____|_   _|_ _|___| | ____|_   _|__        --
--       |  _|   | |  | |/ __| |/ / _ \| |/ __|       --
--       | |___  | |  | | (__|   <  __/| |\__ \       -- 
--       |_____| |_| |___\___|_|\_\___||_||___/       --
--                                                    --
--------------------------------------------------------
--            _    _ _ _____     _     _              --
--           / \  | | |_   _|_ _| |__ | | ___         --
--          / _ \ | | | | |/ _` | '_ \| |/ _ \        --
--         / ___ \| | | | | (_| | |_) | |  __/        --
--        /_/   \_\_|_| |_|\__,_|_.__/|_|\___|        --
--                                                    --
--------------------------------------------------------

--------------------------------------------------------
-------------------------備忘錄--------------------------
-- • MEMBER表格大頭貼未新增
-- • TRANSACTION_HISTORY表格上線時可使用DEFAULT CURRENT_TIMESTAMP,新增資料時會自動填入日期時間(但不包含修改資料時)
--------------------------------------------------------



--------------------------------------------------------
--  丟掉表格
--------------------------------------------------------
alter session set deferred_segment_creation=false;

-----DROP TABLE-----
DROP TABLE RESALE_ORD;
DROP TABLE TICKET;
DROP TABLE TICKET_ORDER;

DROP TABLE ADVERTISEMENT;
DROP TABLE FAVORITE_EVENT;

DROP TABLE SEATING_AREA ;
DROP TABLE TICKET_TYPE ;
DROP TABLE EVENT; 
DROP TABLE EVENT_TITLE;

DROP TABLE VENUE;
DROP TABLE TICKET_REFUND_POLICY;
DROP TABLE EVENT_CLASSIFICATION;

DROP TABLE PERMISSION;
DROP TABLE PERMISSION_LIST;
DROP TABLE ADMINISTRATOR;
DROP TABLE NEWS;
DROP TABLE NEWS_CLASSIFICATION;
DROP TABLE TRANSACTION_HISTORY;
DROP TABLE FAQ;
DROP TABLE MEMBER;

-----DROP SEQUENCE-----

DROP SEQUENCE TICKET_SEQ;
DROP SEQUENCE TICKET_ORDER_SEQ;
DROP SEQUENCE RESALE_ORD_SEQ;

DROP SEQUENCE AD_SEQ;
DROP SEQUENCE VENUE_SEQ;
DROP SEQUENCE EVETIT_SEQ;

DROP SEQUENCE permission_list_no_seq;
DROP SEQUENCE administrator_no_seq;
DROP SEQUENCE news_N_seq;
DROP SEQUENCE news_S_seq;
DROP SEQUENCE news_E_seq;
DROP SEQUENCE transaction_history_no_seq;
DROP SEQUENCE faq_no_seq;
DROP SEQUENCE member_no_seq;










----------------------------------------------------------------------------------------------------------------
--  <其他開始>
----------------------------------------------------------------------------------------------------------------
--------------------------------------------------------
--  建立表格
--------------------------------------------------------
--------------------------------------------------------
--  for Table MEMBER
--------------------------------------------------------
CREATE TABLE MEMBER (
  MEMBER_NO  Varchar2(7) PRIMARY KEY NOT NULL, 
  MEMBER_FULLNAME  VARCHAR2(20), 
  EMAIL  VARCHAR2(50) NOT NULL, 
  PHONE  VARCHAR2(11), 
  IDCARD  VARCHAR2(10), 
  MEMBER_ACCOUNT  VARCHAR2(20), 
  MEMBER_PASSWORD  VARCHAR2(20), 
  EWALLET_BALANCE  NUMBER(6,0), 
  CREATION_DATE  TIMESTAMP, 
  PROFILE_PICTURE  BLOB, 
  MEMBER_STATUS  VARCHAR2(20) NOT NULL);
    
CREATE SEQUENCE member_no_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

Insert into MEMBER (MEMBER_NO,MEMBER_FULLNAME,EMAIL,PHONE,IDCARD,MEMBER_ACCOUNT,MEMBER_PASSWORD,EWALLET_BALANCE,CREATION_DATE,PROFILE_PICTURE,MEMBER_STATUS) values ('M'||LPAD(to_char(member_no_seq.NEXTVAL), 6, '0'), '吳冠宏', 'vladylo98@gmail.com', '0911-484363', 'H179034814' , 'vladylo98' , '123456' , '98376' , to_timestamp('1991/9/1  18:27:31','YYYY/MM/DD   HH24:MI:SS') , null , 'normal' );
Insert into MEMBER (MEMBER_NO,MEMBER_FULLNAME,EMAIL,PHONE,IDCARD,MEMBER_ACCOUNT,MEMBER_PASSWORD,EWALLET_BALANCE,CREATION_DATE,PROFILE_PICTURE,MEMBER_STATUS) values ('M'||LPAD(to_char(member_no_seq.NEXTVAL), 6, '0'), '路依珊', 'LuoYiShan@rhyta.com', '0933-169030', 'Y274969950' , 'Thos1958' , 'eoGh4ohy' , '2245' , to_timestamp('1991/11/13  00:42:24','YYYY/MM/DD   HH24:MI:SS') , null , 'normal' );
Insert into MEMBER (MEMBER_NO,MEMBER_FULLNAME,EMAIL,PHONE,IDCARD,MEMBER_ACCOUNT,MEMBER_PASSWORD,EWALLET_BALANCE,CREATION_DATE,PROFILE_PICTURE,MEMBER_STATUS) values ('M'||LPAD(to_char(member_no_seq.NEXTVAL), 6, '0'), '姚儒玉', 'YaoRuYu@jourrapide.com', '0902-277481' , 'V265219642' , 'Toopece40' , 'ooy0Eec0zoo' , '4586' , to_timestamp('1992/10/22  09:08:55','YYYY/MM/DD   HH24:MI:SS') , null , 'normal' );
Insert into MEMBER (MEMBER_NO,MEMBER_FULLNAME,EMAIL,PHONE,IDCARD,MEMBER_ACCOUNT,MEMBER_PASSWORD,EWALLET_BALANCE,CREATION_DATE,PROFILE_PICTURE,MEMBER_STATUS) values ('M'||LPAD(to_char(member_no_seq.NEXTVAL), 6, '0'), '潘怡帆', 'PanYiFan@dayrep.com', '0937-626715' , 'T270735473' , 'Hunned' , 'rieZoow2' , '6543' , to_timestamp('1993/7/30  14:08:07','YYYY/MM/DD   HH24:MI:SS') , null , 'normal' );
Insert into MEMBER (MEMBER_NO,MEMBER_FULLNAME,EMAIL,PHONE,IDCARD,MEMBER_ACCOUNT,MEMBER_PASSWORD,EWALLET_BALANCE,CREATION_DATE,PROFILE_PICTURE,MEMBER_STATUS) values ('M'||LPAD(to_char(member_no_seq.NEXTVAL), 6, '0'), '莊睿倩', 'ZhuangRuiQing@dayrep.com', '0937-521590' , 'H200290577' , 'Etwithe61' , 'Cie6feow' , '82015' , to_timestamp('1996/6/10  09:16:52','YYYY/MM/DD   HH24:MI:SS') , null , 'normal' );
Insert into MEMBER (MEMBER_NO,MEMBER_FULLNAME,EMAIL,PHONE,IDCARD,MEMBER_ACCOUNT,MEMBER_PASSWORD,EWALLET_BALANCE,CREATION_DATE,PROFILE_PICTURE,MEMBER_STATUS) values ('M'||LPAD(to_char(member_no_seq.NEXTVAL), 6, '0'), '戴佳芳', 'DaiJiaFang@dayrep.com', '0994-464268' , 'V271833158' , 'Anducalliew' , 'ieGhae7yai' , '7071' , to_timestamp('1998/9/4  22:18:10','YYYY/MM/DD   HH24:MI:SS') , null , 'normal' );
Insert into MEMBER (MEMBER_NO,MEMBER_FULLNAME,EMAIL,PHONE,IDCARD,MEMBER_ACCOUNT,MEMBER_PASSWORD,EWALLET_BALANCE,CREATION_DATE,PROFILE_PICTURE,MEMBER_STATUS) values ('M'||LPAD(to_char(member_no_seq.NEXTVAL), 6, '0'), '尹丞恩', 'YinChengEn@teleworm.us', '0917-059007' , 'E127239706' , 'Lorm1979' , 'petadohTh9' , '2925' , to_timestamp('1998/12/15  21:15:07','YYYY/MM/DD   HH24:MI:SS') , null , 'normal' );
Insert into MEMBER (MEMBER_NO,MEMBER_FULLNAME,EMAIL,PHONE,IDCARD,MEMBER_ACCOUNT,MEMBER_PASSWORD,EWALLET_BALANCE,CREATION_DATE,PROFILE_PICTURE,MEMBER_STATUS) values ('M'||LPAD(to_char(member_no_seq.NEXTVAL), 6, '0'), '郭志廷', 'GuoZhiTing@jourrapide.com', '0907-434925', 'L165236446' , 'Foody1996' , 'aeHoo6shi' , '5365' , to_timestamp('1999/5/31  04:54:17','YYYY/MM/DD   HH24:MI:SS') , null , 'normal' );
Insert into MEMBER (MEMBER_NO,MEMBER_FULLNAME,EMAIL,PHONE,IDCARD,MEMBER_ACCOUNT,MEMBER_PASSWORD,EWALLET_BALANCE,CREATION_DATE,PROFILE_PICTURE,MEMBER_STATUS) values ('M'||LPAD(to_char(member_no_seq.NEXTVAL), 6, '0'), '葉佳芳', 'SheJiaFang@armyspy.com', '0958-557370' , 'L209596367' , 'Puntore' , 'rahMee4ee' , '7865' , to_timestamp('2002/5/19  00:54:14','YYYY/MM/DD   HH24:MI:SS') , null , 'normal' );
Insert into MEMBER (MEMBER_NO,MEMBER_FULLNAME,EMAIL,PHONE,IDCARD,MEMBER_ACCOUNT,MEMBER_PASSWORD,EWALLET_BALANCE,CREATION_DATE,PROFILE_PICTURE,MEMBER_STATUS) values ('M'||LPAD(to_char(member_no_seq.NEXTVAL), 6, '0'), '羅伯諺', 'LuoBaYan@jourrapide.com', '0902-456073' , 'R118671723' , 'Andelibubled' , 'VimiNg1eom' , '2807' , to_timestamp('2003/7/2  04:22:27','YYYY/MM/DD   HH24:MI:SS') , null , 'normal' );
Insert into MEMBER (MEMBER_NO,MEMBER_FULLNAME,EMAIL,PHONE,IDCARD,MEMBER_ACCOUNT,MEMBER_PASSWORD,EWALLET_BALANCE,CREATION_DATE,PROFILE_PICTURE,MEMBER_STATUS) values ('M'||LPAD(to_char(member_no_seq.NEXTVAL), 6, '0'), '傅維宇', 'FuYiYu@rhyta.com', '0985-692227' , 'I169183305' , 'Warvervaind' , 'Juang2xifo' , '1388' , to_timestamp('2004/2/5  17:32:37','YYYY/MM/DD   HH24:MI:SS') , null , 'normal' );
Insert into MEMBER (MEMBER_NO,MEMBER_FULLNAME,EMAIL,PHONE,IDCARD,MEMBER_ACCOUNT,MEMBER_PASSWORD,EWALLET_BALANCE,CREATION_DATE,PROFILE_PICTURE,MEMBER_STATUS) values ('M'||LPAD(to_char(member_no_seq.NEXTVAL), 6, '0'), '方怡萱', 'WangYiXuan@dayrep.com', '0977-966322' , 'O285639654' , 'Salletch' , 'pah7Aej7' , '1415' , to_timestamp('2004/11/25  11:51:22','YYYY/MM/DD   HH24:MI:SS') , null , 'normal' );
Insert into MEMBER (MEMBER_NO,MEMBER_FULLNAME,EMAIL,PHONE,IDCARD,MEMBER_ACCOUNT,MEMBER_PASSWORD,EWALLET_BALANCE,CREATION_DATE,PROFILE_PICTURE,MEMBER_STATUS) values ('M'||LPAD(to_char(member_no_seq.NEXTVAL), 6, '0'), '牛雅琪', 'NiuYaQi@jourrapide.com', '0962-409820' , 'P296829261' , 'Ingend1956' , 'die4shohShae' , '7819' , to_timestamp('2006/5/27  09:14:25','YYYY/MM/DD   HH24:MI:SS') , null , 'normal' );
Insert into MEMBER (MEMBER_NO,MEMBER_FULLNAME,EMAIL,PHONE,IDCARD,MEMBER_ACCOUNT,MEMBER_PASSWORD,EWALLET_BALANCE,CREATION_DATE,PROFILE_PICTURE,MEMBER_STATUS) values ('M'||LPAD(to_char(member_no_seq.NEXTVAL), 6, '0'), '蘇靜宜', 'SuJingYi@rhyta.com', '0927-178732' , 'Y264467921' , 'Eatexturink' , 'woaZ5pooG6oa' , '47902' , to_timestamp('2008/3/18  12:09:40','YYYY/MM/DD   HH24:MI:SS') , null , 'normal' );
Insert into MEMBER (MEMBER_NO,MEMBER_FULLNAME,EMAIL,PHONE,IDCARD,MEMBER_ACCOUNT,MEMBER_PASSWORD,EWALLET_BALANCE,CREATION_DATE,PROFILE_PICTURE,MEMBER_STATUS) values ('M'||LPAD(to_char(member_no_seq.NEXTVAL), 6, '0'), '史琬婷', 'ShiWanTing@teleworm.us', '0947-324070' , 'C276106794' , 'Thentry' , 'Feix9teu8hi' , '1683' , to_timestamp('2011/4/2  00:12:20','YYYY/MM/DD   HH24:MI:SS') , null , 'normal' );
Insert into MEMBER (MEMBER_NO,MEMBER_FULLNAME,EMAIL,PHONE,IDCARD,MEMBER_ACCOUNT,MEMBER_PASSWORD,EWALLET_BALANCE,CREATION_DATE,PROFILE_PICTURE,MEMBER_STATUS) values ('M'||LPAD(to_char(member_no_seq.NEXTVAL), 6, '0'), '吳隆衣', 'WuLongYi@jourrapide.com', '0989-092989' , 'C141647806' , 'Tintles' , 'aiDee0zeeTh' , '3880' , to_timestamp('2012/3/23  19:49:48','YYYY/MM/DD   HH24:MI:SS') , null , 'normal' );
Insert into MEMBER (MEMBER_NO,MEMBER_FULLNAME,EMAIL,PHONE,IDCARD,MEMBER_ACCOUNT,MEMBER_PASSWORD,EWALLET_BALANCE,CREATION_DATE,PROFILE_PICTURE,MEMBER_STATUS) values ('M'||LPAD(to_char(member_no_seq.NEXTVAL), 6, '0'), '郭貿昌', 'GuoMaoChang@rhyta.com', '0916-441993' , 'N110910088' , 'Howeenton' , 'ew7Uo0ai' , '6602' , to_timestamp('2013/9/30  11:00:06','YYYY/MM/DD   HH24:MI:SS') , null , 'normal' );
Insert into MEMBER (MEMBER_NO,MEMBER_FULLNAME,EMAIL,PHONE,IDCARD,MEMBER_ACCOUNT,MEMBER_PASSWORD,EWALLET_BALANCE,CREATION_DATE,PROFILE_PICTURE,MEMBER_STATUS) values ('M'||LPAD(to_char(member_no_seq.NEXTVAL), 6, '0'), '白承峰', 'BoZhengFeng@dayrep.com', '0964-194913' , 'A160072505' , 'Thadince' , 'acheiY1kaef' , '1932' , to_timestamp('2016/10/10  06:46:39','YYYY/MM/DD   HH24:MI:SS') , null , 'normal' );
Insert into MEMBER (MEMBER_NO,MEMBER_FULLNAME,EMAIL,PHONE,IDCARD,MEMBER_ACCOUNT,MEMBER_PASSWORD,EWALLET_BALANCE,CREATION_DATE,PROFILE_PICTURE,MEMBER_STATUS) values ('M'||LPAD(to_char(member_no_seq.NEXTVAL), 6, '0'), '洪淑惠', 'HongChuHui@teleworm.us', '0987-653650' , 'E249007273' , 'Thaide1992' , 'nai0eiR6ifu' , '3423' , to_timestamp('2018/7/25  20:38:16','YYYY/MM/DD   HH24:MI:SS') , null , 'normal' );
Insert into MEMBER (MEMBER_NO,MEMBER_FULLNAME,EMAIL,PHONE,IDCARD,MEMBER_ACCOUNT,MEMBER_PASSWORD,EWALLET_BALANCE,CREATION_DATE,PROFILE_PICTURE,MEMBER_STATUS) values ('M'||LPAD(to_char(member_no_seq.NEXTVAL), 6, '0'), '段嘉瑩', 'DuanJiaYing@teleworm.us', '0972-258975' , 'A289803497' , 'Betre1933' , 'UMah2ohx' , '65693' , to_timestamp('2018/12/10  03:00:30','YYYY/MM/DD   HH24:MI:SS') , null , 'normal' );



--------------------------------------------------------
--  for Table FAQ
--------------------------------------------------------
CREATE TABLE FAQ (
  FAQ_NO    VARCHAR2(6)  PRIMARY KEY  NOT NULL, 
  QUESTION  VARCHAR2(1000), 
  ANSWER VARCHAR2(4000), 
  FAQ_CLASSIFICATION VARCHAR2(20));
    
CREATE SEQUENCE faq_no_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

Insert into FAQ (FAQ_NO,QUESTION,ANSWER,FAQ_CLASSIFICATION) values ('FAQ'||LPAD(to_char(faq_no_seq.NEXTVAL), 3, '0'),'如何加入會員？','每人限制僅可申請一個會員帳號，此會員帳號需綁定電子郵件進行驗證，通過驗證後，才可開始於網站購票。','購票');
Insert into FAQ (FAQ_NO,QUESTION,ANSWER,FAQ_CLASSIFICATION) values ('FAQ'||LPAD(to_char(faq_no_seq.NEXTVAL), 3, '0'),'如何加入會員？','每人限制僅可申請一個會員帳號，此會員帳號需綁定電子郵件進行驗證，通過驗證後，才可開始於網站購票。','購物');
Insert into FAQ (FAQ_NO,QUESTION,ANSWER,FAQ_CLASSIFICATION) values ('FAQ'||LPAD(to_char(faq_no_seq.NEXTVAL), 3, '0'),'為什麼我收不到系統通知信？','請先檢查垃圾郵件。','其他');
Insert into FAQ (FAQ_NO,QUESTION,ANSWER,FAQ_CLASSIFICATION) values ('FAQ'||LPAD(to_char(faq_no_seq.NEXTVAL), 3, '0'),'可以在超商購票嗎？','本系統目前僅供網站與APP購票。','購票');
Insert into FAQ (FAQ_NO,QUESTION,ANSWER,FAQ_CLASSIFICATION) values ('FAQ'||LPAD(to_char(faq_no_seq.NEXTVAL), 3, '0'),'一筆訂單最多可買幾張票？','購票張數依活動有不同的規定，購票前請於活動資訊查詢每個活動的購票需知。','購票');
Insert into FAQ (FAQ_NO,QUESTION,ANSWER,FAQ_CLASSIFICATION) values ('FAQ'||LPAD(to_char(faq_no_seq.NEXTVAL), 3, '0'),'退票相關流程為何？','依文化部於中華民國107年5月16日文藝字第10710128232號公告','退票');
Insert into FAQ (FAQ_NO,QUESTION,ANSWER,FAQ_CLASSIFICATION) values ('FAQ'||LPAD(to_char(faq_no_seq.NEXTVAL), 3, '0'),'可以換票嗎？','換票等同於退票，請將原先購買的票券辦理退票，再另行購買，或可至票券轉讓平台進行轉讓','退票');
Insert into FAQ (FAQ_NO,QUESTION,ANSWER,FAQ_CLASSIFICATION) values ('FAQ'||LPAD(to_char(faq_no_seq.NEXTVAL), 3, '0'),'購票可以開立發票嗎？','票券內含代徵娛樂稅，免開立發票。','其他');
Insert into FAQ (FAQ_NO,QUESTION,ANSWER,FAQ_CLASSIFICATION) values ('FAQ'||LPAD(to_char(faq_no_seq.NEXTVAL), 3, '0'),'購物流程為何？','STEP 1：請先加入會員。STEP 2：將您欲購買的商品，放入購物車，並開始進入結帳程序。STEP 3：選擇付款方式以及填寫您的收貨地址。STEP 4：完成結帳程序。','購物');
Insert into FAQ (FAQ_NO,QUESTION,ANSWER,FAQ_CLASSIFICATION) values ('FAQ'||LPAD(to_char(faq_no_seq.NEXTVAL), 3, '0'),'團購是什麼？','就是大家一起購買，透過團體訂購爭取折扣。','團購');
Insert into FAQ (FAQ_NO,QUESTION,ANSWER,FAQ_CLASSIFICATION) values ('FAQ'||LPAD(to_char(faq_no_seq.NEXTVAL), 3, '0'),'為什麼沒人加入我發起的團購？','主動尋找團員才是合購的成功之道哦！如果您剛開始使用合購，建議您先運用自己的人脈快速成團，並慢慢吸納一些固定的團員，如此您的合購才會越來越成功哦。','團購');
Insert into FAQ (FAQ_NO,QUESTION,ANSWER,FAQ_CLASSIFICATION) values ('FAQ'||LPAD(to_char(faq_no_seq.NEXTVAL), 3, '0'),'可以轉讓票嗎？','請至票券轉讓平台進行轉讓。','轉讓票');
Insert into FAQ (FAQ_NO,QUESTION,ANSWER,FAQ_CLASSIFICATION) values ('FAQ'||LPAD(to_char(faq_no_seq.NEXTVAL), 3, '0'),'為什麼我下載不了APP？','因為我們並沒有將APP上架。','其他');



--------------------------------------------------------
--  for Table TRANSACTION_HISTORY
--------------------------------------------------------
CREATE TABLE TRANSACTION_HISTORY (
  TRANSACTION_HISTORY_NO  VARCHAR2(11) PRIMARY KEY NOT NULL,
  MEMBER_NO  VARCHAR2(7),
  TRANSACTION_DATETIME  TIMESTAMP,
  TRANSACTION_CATEGORY  VARCHAR2(20),
  EXPENDITURES  NUMBER(6,0) CHECK (EXPENDITURES >= 0),
  RECEIPT  NUMBER(6,0) CHECK (RECEIPT >= 0),
  EWALLET_BALANCE  NUMBER(6,0) CHECK (EWALLET_BALANCE >= 0),
  DESCRIPTION  VARCHAR2(50),
  CONSTRAINT FK_MEMBER_NO FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO));
    
CREATE SEQUENCE transaction_history_no_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

Insert into TRANSACTION_HISTORY values 
('20180225'||'-'||LPAD(to_char(transaction_history_no_seq.NEXTVAL), 2, '0')
,'M000001'
, to_timestamp('2018/2/5  17:32:37','YYYY/MM/DD  HH24:MI:SS') 
,'購票'
,'2500'
,'0'
,'1000'
,'TO_20181225_000001');
Insert into TRANSACTION_HISTORY values 
('20180828'||'-'||LPAD(to_char(transaction_history_no_seq.NEXTVAL), 2, '0')
,'M000005'
, to_timestamp('2018/8/28  10:12:12','YYYY/MM/DD  HH24:MI:SS') 
,'購票'
,'5800'
,'0'
,'9500'
,'TO_20181225_000002');
Insert into TRANSACTION_HISTORY values 
('20181205'||'-'||LPAD(to_char(transaction_history_no_seq.NEXTVAL), 2, '0')
,'M000014'
, to_timestamp('2018/12/5  19:55:39','YYYY/MM/DD  HH24:MI:SS') 
,'購票'
,'1000'
,'0'
,'200'
,'TO_20181225_000003');



--------------------------------------------------------
--  for Table NEWS_CLASSIFICATION
--------------------------------------------------------
CREATE TABLE NEWS_CLASSIFICATION (
  NEWS_CLASSIFICATION_NO  VARCHAR2(1) PRIMARY KEY  NOT NULL,
  NEWS_CLASSIFICATION  VARCHAR2(20));


Insert into NEWS_CLASSIFICATION (NEWS_CLASSIFICATION_NO,NEWS_CLASSIFICATION) values ('N','最新消息');
Insert into NEWS_CLASSIFICATION (NEWS_CLASSIFICATION_NO,NEWS_CLASSIFICATION) values ('S','網站公告');
Insert into NEWS_CLASSIFICATION (NEWS_CLASSIFICATION_NO,NEWS_CLASSIFICATION) values ('E','節目異動');



--------------------------------------------------------
--  for Table NEWS
--------------------------------------------------------
CREATE TABLE NEWS (
  NEWS_NO  VARCHAR2(3)  PRIMARY KEY  NOT NULL,
  NEWS_CLASSIFICATION_NO  VARCHAR2(1),
  NEWS_TITLE  VARCHAR2(300),
  NEWS_CONTENT  VARCHAR2(4000),
  ANNOUNCE_DATE  DATE,
  ADMINISTRATOR_NO  VARCHAR2(4),
  CONSTRAINT NEWS_CLASSIFICATION_NO_FK FOREIGN KEY(NEWS_CLASSIFICATION_NO) REFERENCES NEWS_CLASSIFICATION(NEWS_CLASSIFICATION_NO));

CREATE SEQUENCE news_N_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE news_S_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE news_E_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

Insert into NEWS (NEWS_NO,NEWS_CLASSIFICATION_NO,NEWS_TITLE,NEWS_CONTENT,ANNOUNCE_DATE,ADMINISTRATOR_NO) 
values (
  'S'||LPAD(to_char(news_S_seq.NEXTVAL), 2, '0')
  ,'S'
  ,'ETIckeTs娛樂會員加入辦法'
  ,'會員加入辦法如下：
    •每人限制僅可申請一個會員帳號，此會員帳號需綁定電子郵件。
    •電子郵件需進行驗證，通過驗證後，才可開始於ETIckeTs娛樂網站購票購物。
    •選定之會員帳號，經電子郵件驗證完成後，恕無法要求更換，請務必謹慎選定常用帳號。
    •請務必詳關會員服務條款及隱私權條款，確認同意後再進行驗證作業。'
  , TO_DATE('1970/1/1','YYYY/MM/DD') 
  ,'A001'
  );

Insert into NEWS (NEWS_NO,NEWS_CLASSIFICATION_NO,NEWS_TITLE,NEWS_CONTENT,ANNOUNCE_DATE,ADMINISTRATOR_NO) 
values (
  'S'||LPAD(to_char(news_S_seq.NEXTVAL), 2, '0')
  ,'S'
  ,'來信客服信箱查詢方式之說明'
  ,'為能清楚明確地協助處理信件問題，煩請於上班時間來信ETIckeTs娛樂客服信箱ca105.java.002@gmail.com（適逢國定假日暫停服務）。
    來信的信件內容，請儘量包含下列項目：
　 ◆信件主旨：問題簡述
　 ◆信件內容：（請務必用key in方式附上）
　　  (1)購票會員帳號(Email)：
　　  (2)問題詳述：（請避免只提供不完整敘述及資訊）
    在此先感謝各位的配合，ETIckeTs娛樂客服將依來信之問題描述，儘快協助處理及回覆，謝謝！'
  , TO_DATE('1970/1/1','YYYY/MM/DD') 
  ,'A001'
  );
  
Insert into NEWS (NEWS_NO,NEWS_CLASSIFICATION_NO,NEWS_TITLE,NEWS_CONTENT,ANNOUNCE_DATE,ADMINISTRATOR_NO) 
values (
  'N'||LPAD(to_char(news_N_seq.NEXTVAL), 2, '0')
  ,'N'
  ,'電子錢包儲值方法'
  ,'電子錢包儲值方法如下：
    •本網站僅限信用卡繳款。'
  , TO_DATE('1970/1/1','YYYY/MM/DD') 
  ,'A001'
  );



--------------------------------------------------------
--  for Table ADMINISTRATOR
--------------------------------------------------------
CREATE TABLE ADMINISTRATOR (
  ADMINISTRATOR_NO  VARCHAR2(4)  PRIMARY KEY  NOT NULL,
  ADMINISTRATOR_NAME  VARCHAR2(20),
  ADMINISTRATOR_ACCOUNT  VARCHAR2(20),
  ADMINISTRATOR_PASSWORD  VARCHAR2(20),
  CREATION_DATE  TIMESTAMP,
  ADMINISTRATOR_PICTURE  BLOB,
  ADMINISTRATOR_STATUS  VARCHAR2(20)  NOT NULL);
    
CREATE SEQUENCE administrator_no_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

Insert into ADMINISTRATOR (ADMINISTRATOR_NO,ADMINISTRATOR_NAME,ADMINISTRATOR_ACCOUNT,ADMINISTRATOR_PASSWORD,CREATION_DATE,ADMINISTRATOR_PICTURE,ADMINISTRATOR_STATUS)
values ('A'||LPAD(to_char(administrator_no_seq.NEXTVAL), 3, '0'),'吳永志','peter','123456',to_timestamp('1970/1/1  00:00:00','YYYY/MM/DD HH24:MI:SS'),null,'normal');
Insert into ADMINISTRATOR (ADMINISTRATOR_NO,ADMINISTRATOR_NAME,ADMINISTRATOR_ACCOUNT,ADMINISTRATOR_PASSWORD,CREATION_DATE,ADMINISTRATOR_PICTURE,ADMINISTRATOR_STATUS)
values ('A'||LPAD(to_char(administrator_no_seq.NEXTVAL), 3, '0'),'郭小明','kmj','kmj',to_timestamp('1970/1/1  00:00:00','YYYY/MM/DD HH24:MI:SS'),null,'normal');
Insert into ADMINISTRATOR (ADMINISTRATOR_NO,ADMINISTRATOR_NAME,ADMINISTRATOR_ACCOUNT,ADMINISTRATOR_PASSWORD,CREATION_DATE,ADMINISTRATOR_PICTURE,ADMINISTRATOR_STATUS)
values ('A'||LPAD(to_char(administrator_no_seq.NEXTVAL), 3, '0'),'吳口隹石頁','wilson27561','wilson27561',to_timestamp('1970/1/1  00:00:00','YYYY/MM/DD HH24:MI:SS'),null,'normal');
Insert into ADMINISTRATOR (ADMINISTRATOR_NO,ADMINISTRATOR_NAME,ADMINISTRATOR_ACCOUNT,ADMINISTRATOR_PASSWORD,CREATION_DATE,ADMINISTRATOR_PICTURE,ADMINISTRATOR_STATUS)
values ('A'||LPAD(to_char(administrator_no_seq.NEXTVAL), 3, '0'),'戴佩佩','blue1166nina','blue1166nina',to_timestamp('1970/1/1  00:00:00','YYYY/MM/DD HH24:MI:SS'),null,'normal');
Insert into ADMINISTRATOR (ADMINISTRATOR_NO,ADMINISTRATOR_NAME,ADMINISTRATOR_ACCOUNT,ADMINISTRATOR_PASSWORD,CREATION_DATE,ADMINISTRATOR_PICTURE,ADMINISTRATOR_STATUS)
values ('A'||LPAD(to_char(administrator_no_seq.NEXTVAL), 3, '0'),'李小賢','shane08302002','shane08302002',to_timestamp('1970/1/1  00:00:00','YYYY/MM/DD HH24:MI:SS'),null,'normal');
Insert into ADMINISTRATOR (ADMINISTRATOR_NO,ADMINISTRATOR_NAME,ADMINISTRATOR_ACCOUNT,ADMINISTRATOR_PASSWORD,CREATION_DATE,ADMINISTRATOR_PICTURE,ADMINISTRATOR_STATUS)
values ('A'||LPAD(to_char(administrator_no_seq.NEXTVAL), 3, '0'),'黃bear','gn59077474','gn59077474',to_timestamp('1970/1/1  00:00:00','YYYY/MM/DD HH24:MI:SS'),null,'normal');
Insert into ADMINISTRATOR (ADMINISTRATOR_NO,ADMINISTRATOR_NAME,ADMINISTRATOR_ACCOUNT,ADMINISTRATOR_PASSWORD,CREATION_DATE,ADMINISTRATOR_PICTURE,ADMINISTRATOR_STATUS)
values ('A'||LPAD(to_char(administrator_no_seq.NEXTVAL), 3, '0'),'吳老森','inoplattw','inoplattw',to_timestamp('1970/1/1  00:00:00','YYYY/MM/DD HH24:MI:SS'),null,'normal');
Insert into ADMINISTRATOR (ADMINISTRATOR_NO,ADMINISTRATOR_NAME,ADMINISTRATOR_ACCOUNT,ADMINISTRATOR_PASSWORD,CREATION_DATE,ADMINISTRATOR_PICTURE,ADMINISTRATOR_STATUS)
values ('A'||LPAD(to_char(administrator_no_seq.NEXTVAL), 3, '0'),'李晨','lichi750626','lichi750626',to_timestamp('1970/1/1  00:00:00','YYYY/MM/DD HH24:MI:SS'),null,'normal');



--------------------------------------------------------
--  for Table PERMISSION_LIST
--------------------------------------------------------
CREATE TABLE PERMISSION_LIST (
  PERMISSION_LIST_NO  VARCHAR2(4)  PRIMARY KEY  NOT NULL,
  PERMISSION  VARCHAR2(50));
    
CREATE SEQUENCE permission_list_no_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

Insert into PERMISSION_LIST (PERMISSION_LIST_NO,PERMISSION) values ('PL'||LPAD(to_char(permission_list_no_seq.NEXTVAL), 2, '0'),'公告管理');
Insert into PERMISSION_LIST (PERMISSION_LIST_NO,PERMISSION) values ('PL'||LPAD(to_char(permission_list_no_seq.NEXTVAL), 2, '0'),'商品管理');
Insert into PERMISSION_LIST (PERMISSION_LIST_NO,PERMISSION) values ('PL'||LPAD(to_char(permission_list_no_seq.NEXTVAL), 2, '0'),'團購管理');
Insert into PERMISSION_LIST (PERMISSION_LIST_NO,PERMISSION) values ('PL'||LPAD(to_char(permission_list_no_seq.NEXTVAL), 2, '0'),'會員');
Insert into PERMISSION_LIST (PERMISSION_LIST_NO,PERMISSION) values ('PL'||LPAD(to_char(permission_list_no_seq.NEXTVAL), 2, '0'),'活動管理');
Insert into PERMISSION_LIST (PERMISSION_LIST_NO,PERMISSION) values ('PL'||LPAD(to_char(permission_list_no_seq.NEXTVAL), 2, '0'),'購票狀況查詢');
Insert into PERMISSION_LIST (PERMISSION_LIST_NO,PERMISSION) values ('PL'||LPAD(to_char(permission_list_no_seq.NEXTVAL), 2, '0'),'常見問題管理');
Insert into PERMISSION_LIST (PERMISSION_LIST_NO,PERMISSION) values ('PL'||LPAD(to_char(permission_list_no_seq.NEXTVAL), 2, '0'),'管理員管理');
Insert into PERMISSION_LIST (PERMISSION_LIST_NO,PERMISSION) values ('PL'||LPAD(to_char(permission_list_no_seq.NEXTVAL), 2, '0'),'場地管理');



--------------------------------------------------------
--  for Table PERMISSION
--------------------------------------------------------
CREATE TABLE PERMISSION (
  PERMISSION_LIST_NO  VARCHAR2(4), 
  ADMINISTRATOR_NO  VARCHAR2(4), 
  CONSTRAINT FK_PERMISSION_LIST_NO FOREIGN KEY(PERMISSION_LIST_NO) REFERENCES PERMISSION_LIST(PERMISSION_LIST_NO),
  CONSTRAINT FK_ADMINISTRATOR_NO FOREIGN KEY(ADMINISTRATOR_NO) REFERENCES ADMINISTRATOR(ADMINISTRATOR_NO));
    
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL01','A001');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL02','A001');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL03','A001');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL04','A001');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL05','A001');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL06','A001');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL07','A001');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL08','A001');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL09','A001');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL01','A002');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL02','A002');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL03','A002');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL04','A002');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL05','A002');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL06','A002');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL07','A002');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL08','A002');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL09','A002');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL01','A003');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL02','A003');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL03','A003');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL04','A003');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL05','A003');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL06','A003');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL07','A003');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL08','A003');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL09','A003');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL01','A004');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL02','A004');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL03','A004');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL04','A004');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL05','A004');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL06','A004');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL07','A004');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL08','A004');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL09','A004');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL01','A005');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL02','A005');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL03','A005');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL04','A005');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL05','A005');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL06','A005');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL07','A005');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL08','A005');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL09','A005');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL01','A006');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL02','A006');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL03','A006');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL04','A006');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL05','A006');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL06','A006');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL07','A006');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL08','A006');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL09','A006');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL01','A007');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL02','A007');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL03','A007');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL04','A007');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL05','A007');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL06','A007');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL07','A007');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL08','A007');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL09','A007');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL01','A008');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL02','A008');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL03','A008');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL04','A008');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL05','A008');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL06','A008');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL07','A008');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL08','A008');
Insert into PERMISSION (PERMISSION_LIST_NO,ADMINISTRATOR_NO) values ('PL09','A008');
----------------------------------------------------------------------------------------------------------------
--  </其他結束>
----------------------------------------------------------------------------------------------------------------










----------------------------------------------------------------------------------------------------------------
--  <活動開始>
----------------------------------------------------------------------------------------------------------------
--------------------------------------------------------
--  建立表格
--------------------------------------------------------
--------------------------------------------------------
--  for Table EVENT_CLASSIFICATION 
--------------------------------------------------------
CREATE TABLE EVENT_CLASSIFICATION(
    EVECLASS_NO VARCHAR2(1) NOT NULL,
    EVECLASS_NAME VARCHAR2(15) NOT NULL,
    
    CONSTRAINT EVECLASS_PK PRIMARY KEY (EVECLASS_NO)
);

INSERT INTO EVENT_CLASSIFICATION VALUES ('A', '演唱會');
INSERT INTO EVENT_CLASSIFICATION VALUES ('B', '音樂會');
INSERT INTO EVENT_CLASSIFICATION VALUES ('C', '音樂劇');
INSERT INTO EVENT_CLASSIFICATION VALUES ('D', '戲劇');
INSERT INTO EVENT_CLASSIFICATION VALUES ('E', '舞蹈');
INSERT INTO EVENT_CLASSIFICATION VALUES ('F', '展覽');
INSERT INTO EVENT_CLASSIFICATION VALUES ('G', '親子');
INSERT INTO EVENT_CLASSIFICATION VALUES ('H', '講座');
INSERT INTO EVENT_CLASSIFICATION VALUES ('I', '運動');
INSERT INTO EVENT_CLASSIFICATION VALUES ('J', '其他');

--------------------------------------------------------
--  for Table TICKET_REFUND_POLICY 
--------------------------------------------------------
CREATE TABLE TICKET_REFUND_POLICY(
    TICREFPOLICY_NO VARCHAR2(4) NOT NULL,
    TICREFPOLICY_NAME VARCHAR2(9) NOT NULL,
    TICREFPOLICY_CONTENT VARCHAR2(500) NOT NULL,
    
    CONSTRAINT TICREFPOLICY_PK PRIMARY KEY (TICREFPOLICY_NO)
);

INSERT INTO TICKET_REFUND_POLICY VALUES ('TRP1','方案一','演出前10天內不可退票，退換票手續費上限為票面價格的10%。');
INSERT INTO TICKET_REFUND_POLICY VALUES ('TRP2','方案二','購票後3天內可退票，退換票手續費上限為票面價格的5%。');
INSERT INTO TICKET_REFUND_POLICY VALUES ('TRP3','方案三','演出前20天內不可退票，退換票手續費上限為票面價格的10%。');
INSERT INTO TICKET_REFUND_POLICY VALUES ('TRP4','方案四','演出日前31天以前退票手續費上限為票面價格的10%。演出日前11~30天退票手續費上限為票面價格的30%。演出日前3~10天退票手續費上限為票面價格的50%。演出日前2天不可退票。');

--------------------------------------------------------
--  for Table VENUE 
--------------------------------------------------------
CREATE TABLE VENUE(
    VENUE_NO VARCHAR2(4) NOT NULL,
    VENUE_NAME VARCHAR2(30) NOT NULL,
    ADDRESS VARCHAR2(150),
    LATITUDE NUMBER(10,8),
    LONGITUDE NUMBER(11,8),
    VENUE_INFO CLOB,
    VENUE_LOCATIONPIC BLOB,
    
    CONSTRAINT VENUE_PK PRIMARY KEY (VENUE_NO)
);

CREATE SEQUENCE VENUE_SEQ 
INCREMENT BY 1 
START WITH 1 
MAXVALUE 9999 
MINVALUE 1 
CYCLE 
NOCACHE;

--------------------------------------------------------
--  for Table EVENT_TITLE (EVETIT)
--------------------------------------------------------
CREATE TABLE EVENT_TITLE(
    EVETIT_NO VARCHAR2(5) NOT NULL,
    EVECLASS_NO VARCHAR2(1) NOT NULL ,
    TICREFPOLICY_NO Varchar2(4) NOT NULL,
    EVETIT_NAME Varchar2(200) NOT NULL ,
    EVETIT_STARTDATE Date,
    EVETIT_ENDDATE Date,
    EVETIT_POSTER BLOB,
    INFO CLOB,
    NOTICES CLOB,
    ETICPURCHASERULES CLOB,
    ETICRULES CLOB,
    REFUNDRULES CLOB,
    EVETIT_SESSIONS Number NOT NULL,
    EVETIT_STATUS Varchar2(9) NOT NULL,
    LAUNCHDATE Date,
    OFFDATE Date,
    PROMOTIONRANKING Number NOT NULL,
    
    CONSTRAINT EVETIT_PK PRIMARY KEY (EVETIT_NO),
    CONSTRAINT EVETIT_FK_EVECLASS FOREIGN KEY (EVECLASS_NO) REFERENCES EVENT_CLASSIFICATION (EVECLASS_NO),
    CONSTRAINT EVETIT_FK_TICREFPOLICY FOREIGN KEY (TICREFPOLICY_NO) REFERENCES TICKET_REFUND_POLICY (TICREFPOLICY_NO)
);

CREATE SEQUENCE EVETIT_SEQ 
INCREMENT BY 1 
START WITH 1 
MAXVALUE 9999 
MINVALUE 1 
CYCLE 
NOCACHE;

--------------------------------------------------------
--  for Table EVENT (EVE)
--------------------------------------------------------
CREATE TABLE EVENT(
    EVE_NO VARCHAR2(7) NOT NULL,
    EVETIT_NO VARCHAR2(5) NOT NULL,
    VENUE_NO VARCHAR2(4) NOT NULL,
    EVE_SESSION VARCHAR2(2) NOT NULL,
    EVE_SESSIONNAME VARCHAR2(100),
    EVE_SEATMAP BLOB,
    EVE_STARTDATE Timestamp,
    EVE_ENDDATE Timestamp,
    EVE_ONSALEDATE Timestamp,
    EVE_OFFSALEDATE Timestamp,
    TICLIMIT Number,
    FULLREFUNDENDDATE Timestamp,
    EVE_STATUS Varchar2(6) NOT NULL,
    
    CONSTRAINT EVE_PK PRIMARY KEY (EVE_NO),
    CONSTRAINT EVE_FK_EVETIT FOREIGN KEY (EVETIT_NO) REFERENCES EVENT_TITLE (EVETIT_NO),
    CONSTRAINT EVE_FK_VENUE FOREIGN KEY (VENUE_NO) REFERENCES VENUE (VENUE_NO)
); 

--------------------------------------------------------
--  for Table TICKET_TYPE (TICTYPE)
--------------------------------------------------------
CREATE TABLE TICKET_TYPE(
    TICTYPE_NO VARCHAR2(8) NOT NULL,
    EVE_NO VARCHAR2(7) NOT NULL,
    TICTYPE_ENAME Varchar2(1) NOT NULL,
    TICTYPE_COLOR Varchar2(7),
    TICTYPE_NAME Varchar2(30) NOT NULL,
    TICTYPE_PRICE Number,
    
    CONSTRAINT TICTYPE_PK PRIMARY KEY (TICTYPE_NO),
    CONSTRAINT TICTYPE_FK_EVE FOREIGN KEY (EVE_NO) REFERENCES EVENT (EVE_NO)
);

--------------------------------------------------------
--  for Table SEATING_AREA (TICAREA)
--------------------------------------------------------
CREATE TABLE SEATING_AREA(
    TICAREA_NO VARCHAR(10) NOT NULL,
    EVE_NO VARCHAR(7) NOT NULL,
    TICTYPE_NO VARCHAR(8) NOT NULL,
    TICAREA_ENAME VARCHAR(2) NOT NULL,
    TICAREA_COLOR  VARCHAR2(7),
    TICAREA_NAME Varchar2(15) NOT NULL,
    TICTOTALNUMBER Number,
    TICBOOKEDNUMBER Number DEFAULT 0,
    
    CONSTRAINT TICAREA_PK PRIMARY KEY (TICAREA_NO),
    CONSTRAINT TICAREA_FK_EVE FOREIGN KEY (EVE_NO) REFERENCES EVENT (EVE_NO),
    CONSTRAINT TICAREA_FK_TICTYPE FOREIGN KEY (TICTYPE_NO) REFERENCES TICKET_TYPE (TICTYPE_NO)
);

--------------------------------------------------------
--  for Table ADVERTISEMENT
--------------------------------------------------------
CREATE TABLE ADVERTISEMENT(
  AD_NO VARCHAR2(6) NOT NULL, 
  EVETIT_NO VARCHAR2(5) NOT NULL, 
  AD_STARTDATE DATE,
  AD_ENDDATE DATE,
  
  CONSTRAINT AD_PK PRIMARY KEY (AD_NO),
  CONSTRAINT AD_FK_EVETIT FOREIGN KEY (EVETIT_NO) REFERENCES EVENT_TITLE(EVETIT_NO)
);

CREATE SEQUENCE AD_SEQ 
INCREMENT BY 1 
START WITH 1 
MAXVALUE 9999 
MINVALUE 1 
CYCLE 
NOCACHE;

--------------------------------------------------------
--  for Table FAVORITE_EVENT
--------------------------------------------------------
CREATE TABLE FAVORITE_EVENT(
    MEMBER_NO VARCHAR2(7) NOT NULL,
    EVETIT_NO VARCHAR2(5) NOT NULL,
    
    CONSTRAINT FAVEVE_FK_EVE FOREIGN KEY (EVETIT_NO) REFERENCES EVENT_TITLE(EVETIT_NO),
    CONSTRAINT FAVEVE_FK_MEM FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO),   
    CONSTRAINT FAVEVE_PK PRIMARY KEY (MEMBER_NO, EVETIT_NO)
);

--------------------------------------------------------
--  for Table TICKET_ORDER
--------------------------------------------------------
CREATE TABLE TICKET_ORDER(
    TICKET_ORDER_NO VARCHAR2(30) NOT NULL,
    MEMBER_NO VARCHAR2(7) NOT NULL,
    TICAREA_NO VARCHAR2(10) NOT NULL,
    TOTAL_PRICE NUMBER(10),
    TOTAL_AMOUNT NUMBER(10),
    TICKET_ORDER_TIME TIMESTAMP,
    PAYMENT_METHOD VARCHAR2(12),
    TICKET_ORDER_STATUS VARCHAR2(12) NOT NULL,
    
    CONSTRAINT TICKET_ORDER_FK_TICAREA FOREIGN KEY (TICAREA_NO) REFERENCES SEATING_AREA (TICAREA_NO),
    CONSTRAINT TICKET_ORDER_FK_MEMBER FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO),
    CONSTRAINT TICKET_ORDER_PK PRIMARY KEY (TICKET_ORDER_NO)
);

CREATE SEQUENCE TICKET_ORDER_SEQ
INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE;

--------------------------------------------------------
--  for Table TICKET
--------------------------------------------------------
CREATE TABLE TICKET(
    TICKET_NO VARCHAR2(30) NOT NULL,
    TICAREA_NO VARCHAR2(10) NOT NULL,
    TICKET_ORDER_NO VARCHAR2(30) NOT NULL,
    MEMBER_NO VARCHAR2(7) NOT NULL,
    TICKET_STATUS VARCHAR2(9) NOT NULL,
    TICKET_CREATE_TIME TIMESTAMP,
    TICKET_RESALE_STATUS VARCHAR2(12) NOT NULL,
    TICKET_RESALE_PRICE NUMBER(10),
    IS_FROM_RESALE VARCHAR2(3),
    
    CONSTRAINT TICKET_FK_TICAREA FOREIGN KEY (TICAREA_NO) REFERENCES SEATING_AREA (TICAREA_NO),
    CONSTRAINT TICKET_FK_TICKET_ORDER FOREIGN KEY (TICKET_ORDER_NO) REFERENCES TICKET_ORDER (TICKET_ORDER_NO),
    CONSTRAINT TICKET_FK FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO),
    CONSTRAINT TICKET_PK PRIMARY KEY (TICKET_NO)
);

CREATE SEQUENCE TICKET_SEQ
INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE;

--------------------------------------------------------
--  for Table RESALE_ORD
--------------------------------------------------------
CREATE TABLE RESALE_ORD(
    RESALE_ORDNO VARCHAR2(30) NOT NULL,
    TICKET_NO VARCHAR2(30) NOT NULL,
    MEMBER_SELLER_NO VARCHAR2(7) NOT NULL,
    MEMBER_BUYER_NO VARCHAR2(7),
    RESALE_ORDPRICE NUMBER,
    RESALE_ORDSTATUS VARCHAR2(12) NOT NULL,
    RESALE_ORD_CREATETIME TIMESTAMP NOT NULL,
    RESALE_ORD_COMPLETETIME TIMESTAMP,
    PAYMENT_METHOD VARCHAR2(12),
    CONSTRAINT RESALE_ORD_FK_TICKET FOREIGN KEY (TICKET_NO) REFERENCES TICKET (TICKET_NO),
    CONSTRAINT RESALE_ORD_FK_SELLER FOREIGN KEY (MEMBER_SELLER_NO) REFERENCES MEMBER (MEMBER_NO),
    CONSTRAINT RESALE_ORD_FK_BUYER FOREIGN KEY (MEMBER_BUYER_NO) REFERENCES MEMBER (MEMBER_NO),
    CONSTRAINT RESALE_ORD_PK PRIMARY KEY (RESALE_ORDNO)
);

CREATE SEQUENCE RESALE_ORD_SEQ
INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE;





----------------------------------------------------------------------------------------------------------------
--  資料輸入  ***************************************************************************************************
----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--  【我們的購票測試活動主題: 威肯演唱會 ***E0001***】
-----------------------------------------------------------------------------------
--------------------------------------------------------
--  for Table EVENT_TITLE (EVETIT)
--------------------------------------------------------
INSERT INTO EVENT_TITLE
(EVETIT_NO, EVECLASS_NO, TICREFPOLICY_NO, EVETIT_NAME, 
EVETIT_STARTDATE, EVETIT_ENDDATE, EVETIT_SESSIONS, EVETIT_STATUS, 
LAUNCHDATE, OFFDATE, PROMOTIONRANKING)
VALUES
('E'||LPAD(to_char(EVETIT_SEQ.NEXTVAL), 4, '0'), 'A',  'TRP2', 'THE WEEKND ASIA – LIVE IN TAIPEI　威肯2019台北演唱會', 
TO_DATE('2019-03-01','YYYY-MM-DD'), TO_DATE('2019-03-02','YYYY-MM-DD'), 2, 'confirmed', 
TO_DATE('2018-10-01','YYYY-MM-DD'), TO_DATE('2019-03-02','YYYY-MM-DD'), '5');
--------------------------------------------------------
-- FOR TABLE VENUE 
--------------------------------------------------------
INSERT INTO VENUE (VENUE_NO, VENUE_NAME, ADDRESS, LATITUDE, LONGITUDE)
VALUES
('V'||LPAD(to_char(VENUE_SEQ.NEXTVAL), 3, '0'), '台北南港C3廣場', '11568台北市南港區經貿二路168號', 25.059246, 121.615595);
--------------------------------------------------------
--  for Table EVENT (EVE)
--------------------------------------------------------
INSERT INTO EVENT
(EVE_NO, EVETIT_NO, VENUE_NO, EVE_SESSION, EVE_SESSIONNAME, EVE_STARTDATE, EVE_ENDDATE, EVE_ONSALEDATE, EVE_OFFSALEDATE, TICLIMIT, EVE_STATUS)
VALUES
('E000101', 'E0001', 'V001', '01', '2019/3/1第一場', 
TO_TIMESTAMP('2019-03-01 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2019-03-01 23:00', 'YYYY-MM-DD HH24:MI'), 
TO_TIMESTAMP('2018-10-06 11:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2019-03-01 18:00', 'YYYY-MM-DD HH24:MI'), 4, 'normal');

INSERT INTO EVENT
(EVE_NO, EVETIT_NO, VENUE_NO, EVE_SESSION, EVE_SESSIONNAME, EVE_STARTDATE, EVE_ENDDATE, EVE_ONSALEDATE, EVE_OFFSALEDATE, TICLIMIT, EVE_STATUS)
VALUES
('E000102', 'E0001', 'V001', '02', '2019/3/1第二場', 
TO_TIMESTAMP('2019-03-02 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2019-03-02 23:00', 'YYYY-MM-DD HH24:MI'), 
TO_TIMESTAMP('2018-10-06 11:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2019-03-02 18:00', 'YYYY-MM-DD HH24:MI'), 4, 'normal');

--------------------------------------------------------
--  E000101 2019/3/1第一場
--------------------------------------------------------
--------------------------------------------------------
--  for Table TICKET_TYPE (TICTYPE)
--------------------------------------------------------
INSERT INTO TICKET_TYPE
(TICTYPE_NO, EVE_NO, TICTYPE_ENAME, TICTYPE_COLOR, TICTYPE_NAME, TICTYPE_PRICE)
VALUES
('E000101A', 'E000101', 'A', '#EE7700', '搖滾A區', 6500);
INSERT INTO TICKET_TYPE
(TICTYPE_NO, EVE_NO, TICTYPE_ENAME, TICTYPE_COLOR, TICTYPE_NAME, TICTYPE_PRICE)
VALUES
('E000101B', 'E000101', 'B', '#BB5500', '搖滾B區', 5800);
INSERT INTO TICKET_TYPE
(TICTYPE_NO, EVE_NO, TICTYPE_ENAME, TICTYPE_COLOR, TICTYPE_NAME, TICTYPE_PRICE)
VALUES
('E000101C', 'E000101', 'C', '#A0522D', '搖滾C區', 3800);
INSERT INTO TICKET_TYPE
(TICTYPE_NO, EVE_NO, TICTYPE_ENAME, TICTYPE_COLOR, TICTYPE_NAME, TICTYPE_PRICE)
VALUES
('E000101D', 'E000101', 'D', '#8B4513', '搖滾D區', 2500);
--------------------------------------------------------
--  for Table SEATING_AREA (TICAREA)
--------------------------------------------------------
INSERT INTO SEATING_AREA
(TICAREA_NO, EVE_NO, TICTYPE_NO, TICAREA_ENAME, TICAREA_COLOR, TICAREA_NAME, TICTOTALNUMBER, TICBOOKEDNUMBER)
VALUES
('E000101A01', 'E000101', 'E000101A', '01', '#EE7700', '搖滾A區', 800, 800);
INSERT INTO SEATING_AREA
(TICAREA_NO, EVE_NO, TICTYPE_NO, TICAREA_ENAME, TICAREA_COLOR, TICAREA_NAME, TICTOTALNUMBER, TICBOOKEDNUMBER)
VALUES
('E000101B01', 'E000101', 'E000101B', '01', '#BB5500', '搖滾B區', 800, 500);
INSERT INTO SEATING_AREA
(TICAREA_NO, EVE_NO, TICTYPE_NO, TICAREA_ENAME, TICAREA_COLOR, TICAREA_NAME, TICTOTALNUMBER, TICBOOKEDNUMBER)
VALUES
('E000101C01', 'E000101', 'E000101C', '01', '#A0522D', '搖滾C區', 800, 100);
INSERT INTO SEATING_AREA
(TICAREA_NO, EVE_NO, TICTYPE_NO, TICAREA_ENAME, TICAREA_COLOR, TICAREA_NAME, TICTOTALNUMBER, TICBOOKEDNUMBER)
VALUES
('E000101D01', 'E000101', 'E000101D', '01', '#8B4513', '搖滾D區', 500, 500);
--------------------------------------------------------
--  E000102 2019/3/2第二場
--------------------------------------------------------
--------------------------------------------------------
--  for Table TICKET_TYPE (TICTYPE)
--------------------------------------------------------
INSERT INTO TICKET_TYPE
(TICTYPE_NO, EVE_NO, TICTYPE_ENAME, TICTYPE_COLOR, TICTYPE_NAME, TICTYPE_PRICE)
VALUES
('E000102A', 'E000102', 'A', '#EE7700', '搖滾A區', 6500);
INSERT INTO TICKET_TYPE
(TICTYPE_NO, EVE_NO, TICTYPE_ENAME, TICTYPE_COLOR, TICTYPE_NAME, TICTYPE_PRICE)
VALUES
('E000102B', 'E000102', 'B', '#BB5500', '搖滾B區', 5800);
INSERT INTO TICKET_TYPE
(TICTYPE_NO, EVE_NO, TICTYPE_ENAME, TICTYPE_COLOR, TICTYPE_NAME, TICTYPE_PRICE)
VALUES
('E000102C', 'E000102', 'C', '#A0522D', '搖滾C區', 3800);
INSERT INTO TICKET_TYPE
(TICTYPE_NO, EVE_NO, TICTYPE_ENAME, TICTYPE_COLOR, TICTYPE_NAME, TICTYPE_PRICE)
VALUES
('E000102D', 'E000102', 'D', '#8B4513', '搖滾D區', 2500);
--------------------------------------------------------
--  for Table SEATING_AREA (TICAREA)
--------------------------------------------------------
INSERT INTO SEATING_AREA
(TICAREA_NO, EVE_NO, TICTYPE_NO, TICAREA_ENAME, TICAREA_COLOR, TICAREA_NAME, TICTOTALNUMBER, TICBOOKEDNUMBER)
VALUES
('E000102A01', 'E000102', 'E000101A', '01', '#EE7700', '搖滾A區', 800, 800);
INSERT INTO SEATING_AREA
(TICAREA_NO, EVE_NO, TICTYPE_NO, TICAREA_ENAME, TICAREA_COLOR, TICAREA_NAME, TICTOTALNUMBER, TICBOOKEDNUMBER)
VALUES
('E000102B01', 'E000102', 'E000101B', '01', '#BB5500', '搖滾B區', 800, 500);
INSERT INTO SEATING_AREA
(TICAREA_NO, EVE_NO, TICTYPE_NO, TICAREA_ENAME, TICAREA_COLOR, TICAREA_NAME, TICTOTALNUMBER, TICBOOKEDNUMBER)
VALUES
('E000102C01', 'E000102', 'E000101C', '01', '#A0522D', '搖滾C區', 800, 50);
INSERT INTO SEATING_AREA
(TICAREA_NO, EVE_NO, TICTYPE_NO, TICAREA_ENAME, TICAREA_COLOR, TICAREA_NAME, TICTOTALNUMBER, TICBOOKEDNUMBER)
VALUES
('E000102D01', 'E000102', 'E000101D', '01', '#8B4513', '搖滾D區', 500, 500);

--------------------------------------------------------
--  for Table TICKET_ORDER
--------------------------------------------------------
INSERT INTO TICKET_ORDER(TICKET_ORDER_NO,MEMBER_NO,TICAREA_NO,TOTAL_PRICE,TOTAL_AMOUNT,TICKET_ORDER_TIME,PAYMENT_METHOD,TICKET_ORDER_STATUS)
VALUES ('TO_20181225_'||LPAD(to_char(TICKET_ORDER_SEQ.NEXTVAL), 6, '0'),'M000001','E000101A01',5000,3,TO_TIMESTAMP('2018-12-25 18:30', 'YYYY-MM-DD HH24:MI'),'CREDIT','COMPLETE2');
INSERT INTO TICKET_ORDER(TICKET_ORDER_NO,MEMBER_NO,TICAREA_NO,TOTAL_PRICE,TOTAL_AMOUNT,TICKET_ORDER_TIME,PAYMENT_METHOD,TICKET_ORDER_STATUS)
VALUES ('TO_20181225_'||LPAD(to_char(TICKET_ORDER_SEQ.NEXTVAL), 6, '0'),'M000001','E000101A01',5500,4,TO_TIMESTAMP('2018-12-25 19:30', 'YYYY-MM-DD HH24:MI'),'','CANCEL3');
INSERT INTO TICKET_ORDER(TICKET_ORDER_NO,MEMBER_NO,TICAREA_NO,TOTAL_PRICE,TOTAL_AMOUNT,TICKET_ORDER_TIME,PAYMENT_METHOD,TICKET_ORDER_STATUS)
VALUES ('TO_20181225_'||LPAD(to_char(TICKET_ORDER_SEQ.NEXTVAL), 6, '0'),'M000001','E000101A01',6000,5,TO_TIMESTAMP('2018-12-25 20:30', 'YYYY-MM-DD HH24:MI'),'','CANCEL3');

--------------------------------------------------------
--  for Table TICKET
--------------------------------------------------------
INSERT INTO TICKET (TICKET_NO,TICAREA_NO,TICKET_ORDER_NO,MEMBER_NO,TICKET_STATUS,TICKET_CREATE_TIME,TICKET_RESALE_STATUS,TICKET_RESALE_PRICE,IS_FROM_RESALE) 
VALUES('T_20181225_'||LPAD(to_char(TICKET_seq.NEXTVAL), 6, '0'),'E000101A01','TO_20181225_000001','M000001','ACTIVE1',TO_TIMESTAMP('2018-12-25 18:40', 'YYYY-MM-DD HH24:MI'),'NONE1',0,'NO');
INSERT INTO TICKET (TICKET_NO,TICAREA_NO,TICKET_ORDER_NO,MEMBER_NO,TICKET_STATUS,TICKET_CREATE_TIME,TICKET_RESALE_STATUS,TICKET_RESALE_PRICE,IS_FROM_RESALE) 
VALUES('T_20181225_'||LPAD(to_char(TICKET_seq.NEXTVAL), 6, '0'),'E000101A01','TO_20181225_000001','M000001','ACTIVE1',TO_TIMESTAMP('2018-12-25 18:40', 'YYYY-MM-DD HH24:MI'),'NONE1',0,'NO');
INSERT INTO TICKET (TICKET_NO,TICAREA_NO,TICKET_ORDER_NO,MEMBER_NO,TICKET_STATUS,TICKET_CREATE_TIME,TICKET_RESALE_STATUS,TICKET_RESALE_PRICE,IS_FROM_RESALE) 
VALUES('T_20181225_'||LPAD(to_char(TICKET_seq.NEXTVAL), 6, '0'),'E000101A01','TO_20181225_000001','M000002','ACTIVE1',TO_TIMESTAMP('2018-12-25 18:40', 'YYYY-MM-DD HH24:MI'),'NONE1',0,'YES');

--------------------------------------------------------
--  for Table RESALE_ORD
--------------------------------------------------------
INSERT INTO RESALE_ORD(RESALE_ORDNO,TICKET_NO,MEMBER_SELLER_NO,MEMBER_BUYER_NO,RESALE_ORDPRICE,RESALE_ORDSTATUS,RESALE_ORD_CREATETIME,RESALE_ORD_COMPLETETIME,PAYMENT_METHOD)
VALUES ('R_20181226_'||LPAD(to_char(RESALE_ORD_SEQ.NEXTVAL), 6, '0'),'T_20181225_000003','M000001','M000002',2999,'CANCEL3',TO_TIMESTAMP('2018-12-26 07:30', 'YYYY-MM-DD HH24:MI'),'','');
INSERT INTO RESALE_ORD(RESALE_ORDNO,TICKET_NO,MEMBER_SELLER_NO,MEMBER_BUYER_NO,RESALE_ORDPRICE,RESALE_ORDSTATUS,RESALE_ORD_CREATETIME,RESALE_ORD_COMPLETETIME,PAYMENT_METHOD)
VALUES ('R_20181226_'||LPAD(to_char(RESALE_ORD_SEQ.NEXTVAL), 6, '0'),'T_20181225_000003','M000001','M000002',1999,'CANCEL3',TO_TIMESTAMP('2018-12-26 09:30', 'YYYY-MM-DD HH24:MI'),'','');
INSERT INTO RESALE_ORD(RESALE_ORDNO,TICKET_NO,MEMBER_SELLER_NO,MEMBER_BUYER_NO,RESALE_ORDPRICE,RESALE_ORDSTATUS,RESALE_ORD_CREATETIME,RESALE_ORD_COMPLETETIME,PAYMENT_METHOD)
VALUES ('R_20181226_'||LPAD(to_char(RESALE_ORD_SEQ.NEXTVAL), 6, '0'),'T_20181225_000003','M000001','M000002',999,'COMPLETE2',TO_TIMESTAMP('2018-12-26 10:30', 'YYYY-MM-DD HH24:MI'),TO_TIMESTAMP('2018-12-26 10:40', 'YYYY-MM-DD HH24:MI'),'EWALLET');



-----------------------------------------------------------------------------------
--  【其他的裝飾活動主題】
-----------------------------------------------------------------------------------
--------------------------------------------------------
--  蕭敬騰娛樂先生世界巡迴演唱會-雅聞倍優高雄站 ***E0002***
--------------------------------------------------------
INSERT INTO EVENT_TITLE
(EVETIT_NO, EVECLASS_NO, TICREFPOLICY_NO, EVETIT_NAME, 
EVETIT_STARTDATE, EVETIT_ENDDATE, EVETIT_SESSIONS, EVETIT_STATUS, 
LAUNCHDATE, OFFDATE, PROMOTIONRANKING)
VALUES
('E'||LPAD(to_char(EVETIT_SEQ.NEXTVAL), 4, '0'), 'A',  'TRP2', '蕭敬騰娛樂先生世界巡迴演唱會-雅聞倍優高雄站', 
TO_DATE('2019-01-19','YYYY-MM-DD'), TO_DATE('2019-01-20','YYYY-MM-DD'), 2, 'confirmed', 
TO_DATE('2018-08-01','YYYY-MM-DD'), TO_DATE('2019-01-20','YYYY-MM-DD'), '5');
--------------------------------------------------------
--  五月天2019「人生無限公司」無限放大最終回到台中洲際棒球場 ***E0003***
--------------------------------------------------------
INSERT INTO EVENT_TITLE
(EVETIT_NO, EVECLASS_NO, TICREFPOLICY_NO, EVETIT_NAME, 
EVETIT_STARTDATE, EVETIT_ENDDATE, EVETIT_SESSIONS, EVETIT_STATUS, 
LAUNCHDATE, OFFDATE, PROMOTIONRANKING)
VALUES
('E'||LPAD(to_char(EVETIT_SEQ.NEXTVAL), 4, '0'), 'A',  'TRP2', '五月天2019「人生無限公司」無限放大最終回到台中洲際棒球場', 
TO_DATE('2018-12-22','YYYY-MM-DD'), TO_DATE('2019-01-06','YYYY-MM-DD'), 10, 'confirmed', 
TO_DATE('2018-07-01','YYYY-MM-DD'), TO_DATE('2019-01-06','YYYY-MM-DD'), '5');
--------------------------------------------------------
--  學友 經典世界巡迴演唱會–2019高雄站 ***E0004***
--------------------------------------------------------
INSERT INTO EVENT_TITLE
(EVETIT_NO, EVECLASS_NO, TICREFPOLICY_NO, EVETIT_NAME, 
EVETIT_STARTDATE, EVETIT_ENDDATE, EVETIT_SESSIONS, EVETIT_STATUS, 
LAUNCHDATE, OFFDATE, PROMOTIONRANKING)
VALUES
('E'||LPAD(to_char(EVETIT_SEQ.NEXTVAL), 4, '0'), 'A',  'TRP2', '學友 經典世界巡迴演唱會–2019高雄站', 
TO_DATE('2019-01-04','YYYY-MM-DD'), TO_DATE('2019-01-06','YYYY-MM-DD'), 3, 'confirmed', 
TO_DATE('2018-10-01','YYYY-MM-DD'), TO_DATE('2019-01-06','YYYY-MM-DD'), '5');
--------------------------------------------------------
--  Jim Gaffigan Quality Time Tour 2019 Live in Taipei ***E0005***
--------------------------------------------------------
INSERT INTO EVENT_TITLE
(EVETIT_NO, EVECLASS_NO, TICREFPOLICY_NO, EVETIT_NAME, 
EVETIT_STARTDATE, EVETIT_ENDDATE, EVETIT_SESSIONS, EVETIT_STATUS, 
LAUNCHDATE, OFFDATE, PROMOTIONRANKING)
VALUES
('E'||LPAD(to_char(EVETIT_SEQ.NEXTVAL), 4, '0'), 'J',  'TRP2', 'Jim Gaffigan Quality Time Tour 2019 Live in Taipei', 
TO_DATE('2019-03-31','YYYY-MM-DD'), TO_DATE('2019-03-31','YYYY-MM-DD'), 1, 'confirmed', 
TO_DATE('2018-12-12','YYYY-MM-DD'), TO_DATE('2019-03-31','YYYY-MM-DD'), '5');
--------------------------------------------------------
--  《Since 5566》台北小巨蛋演唱會 - 一段愛與我們的故事 ***E0006*** 
--------------------------------------------------------
INSERT INTO EVENT_TITLE
(EVETIT_NO, EVECLASS_NO, TICREFPOLICY_NO, EVETIT_NAME, 
EVETIT_STARTDATE, EVETIT_ENDDATE, EVETIT_SESSIONS, EVETIT_STATUS, 
LAUNCHDATE, OFFDATE, PROMOTIONRANKING)
VALUES
('E'||LPAD(to_char(EVETIT_SEQ.NEXTVAL), 4, '0'), 'A',  'TRP2', '《Since 5566》台北小巨蛋演唱會 - 一段愛與我們的故事', 
TO_DATE('2019-02-23','YYYY-MM-DD'), TO_DATE('2019-02-23','YYYY-MM-DD'), 1, 'confirmed', 
TO_DATE('2018-12-01','YYYY-MM-DD'), TO_DATE('2019-02-23','YYYY-MM-DD'), '5');
--------------------------------------------------------
--  MAROON 5 RED PILL BLUES TOUR LIVE IN KAOHSIUNG ***E0007*** 
--------------------------------------------------------
INSERT INTO EVENT_TITLE
(EVETIT_NO, EVECLASS_NO, TICREFPOLICY_NO, EVETIT_NAME, 
EVETIT_STARTDATE, EVETIT_ENDDATE, EVETIT_SESSIONS, EVETIT_STATUS, 
LAUNCHDATE, OFFDATE, PROMOTIONRANKING)
VALUES
('E'||LPAD(to_char(EVETIT_SEQ.NEXTVAL), 4, '0'), 'A',  'TRP2', 'MAROON 5 RED PILL BLUES TOUR LIVE IN KAOHSIUNG', 
TO_DATE('2019-03-01','YYYY-MM-DD'), TO_DATE('2019-03-01','YYYY-MM-DD'), 1, 'confirmed', 
TO_DATE('2018-12-01','YYYY-MM-DD'), TO_DATE('2019-03-01','YYYY-MM-DD'), '5');
--------------------------------------------------------
--  Mr.Children Tour 2018-19 重力與呼吸 Live in Taiwan ***E0008*** 
--------------------------------------------------------
INSERT INTO EVENT_TITLE
(EVETIT_NO, EVECLASS_NO, TICREFPOLICY_NO, EVETIT_NAME, 
EVETIT_STARTDATE, EVETIT_ENDDATE, EVETIT_SESSIONS, EVETIT_STATUS, 
LAUNCHDATE, OFFDATE, PROMOTIONRANKING)
VALUES
('E'||LPAD(to_char(EVETIT_SEQ.NEXTVAL), 4, '0'), 'A',  'TRP2', 'Mr.Children Tour 2018-19 重力與呼吸 Live in Taiwan', 
TO_DATE('2019-02-01','YYYY-MM-DD'), TO_DATE('2019-02-02','YYYY-MM-DD'), 1, 'confirmed', 
TO_DATE('2018-12-01','YYYY-MM-DD'), TO_DATE('2019-02-02','YYYY-MM-DD'), '5');




-----------------------------------------------------------------------------------
--  【與活動主題相關資料】
-----------------------------------------------------------------------------------
--------------------------------------------------------
-- FOR TABLE ADVERTISEMENT
--------------------------------------------------------
INSERT INTO ADVERTISEMENT VALUES ('AD'||LPAD(TO_CHAR(AD_SEQ.NEXTVAL),4,'0'), 'E0001', TO_DATE('2018-01-01','YYYY-MM-DD'), TO_DATE('2019-02-01','YYYY-MM-DD'));
INSERT INTO ADVERTISEMENT VALUES ('AD'||LPAD(TO_CHAR(AD_SEQ.NEXTVAL),4,'0'), 'E0002', TO_DATE('2018-01-01','YYYY-MM-DD'), TO_DATE('2019-02-01','YYYY-MM-DD'));
INSERT INTO ADVERTISEMENT VALUES ('AD'||LPAD(TO_CHAR(AD_SEQ.NEXTVAL),4,'0'), 'E0003', TO_DATE('2018-01-01','YYYY-MM-DD'), TO_DATE('2019-02-01','YYYY-MM-DD'));
INSERT INTO ADVERTISEMENT VALUES ('AD'||LPAD(TO_CHAR(AD_SEQ.NEXTVAL),4,'0'), 'E0004', TO_DATE('2018-01-01','YYYY-MM-DD'), TO_DATE('2019-02-01','YYYY-MM-DD'));
--------------------------------------------------------
-- FOR TABLE FAVORITE_EVENT
--------------------------------------------------------
INSERT INTO FAVORITE_EVENT VALUES ('M000001', 'E0001');
INSERT INTO FAVORITE_EVENT VALUES ('M000001', 'E0002');
INSERT INTO FAVORITE_EVENT VALUES ('M000001', 'E0003');
INSERT INTO FAVORITE_EVENT VALUES ('M000001', 'E0004');



----------------------------------------------------------------------------------------------------------------
--  </活動結束>
----------------------------------------------------------------------------------------------------------------














----------------------------------------------------------------------------------------------------------------
--  <商品團購開始>
----------------------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------------------
--  </商品團購結束>
----------------------------------------------------------------------------------------------------------------

commit;