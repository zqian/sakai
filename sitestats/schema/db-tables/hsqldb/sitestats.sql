create table SST_EVENTS (ID bigint generated by default as identity (start with 1), USER_ID varchar(99) not null, SITE_ID varchar(99) not null, EVENT_ID varchar(32) not null, EVENT_DATE date not null, EVENT_COUNT bigint not null, primary key (ID));
create table SST_JOB_RUN (ID bigint generated by default as identity (start with 1), JOB_START_DATE timestamp, JOB_END_DATE timestamp, START_EVENT_ID bigint, END_EVENT_ID bigint, LAST_EVENT_DATE timestamp, primary key (ID));
create table SST_PREFERENCES (ID bigint generated by default as identity (start with 1), SITE_ID varchar(99) not null, PREFS longvarchar not null, primary key (ID));
create table SST_PRESENCES (ID bigint generated by default as identity (start with 1), SITE_ID varchar(99) not null, USER_ID varchar(99) not null, DATE date not null, DURATION bigint default 0 not null, LAST_VISIT_START_TIME timestamp default null, primary key (ID));
create table SST_REPORTS (ID bigint generated by default as identity (start with 1), SITE_ID varchar(99), TITLE varchar(255) not null, DESCRIPTION longvarchar, HIDDEN bit, REPORT_DEF longvarchar not null, CREATED_BY varchar(99) not null, CREATED_ON timestamp not null, MODIFIED_BY varchar(99), MODIFIED_ON timestamp, primary key (ID));
create table SST_RESOURCES (ID bigint generated by default as identity (start with 1), USER_ID varchar(99) not null, SITE_ID varchar(99) not null, RESOURCE_REF varchar(255) not null, RESOURCE_ACTION varchar(12) not null, RESOURCE_DATE date not null, RESOURCE_COUNT bigint not null, primary key (ID));
create table SST_SITEACTIVITY (ID bigint generated by default as identity (start with 1), SITE_ID varchar(99) not null, ACTIVITY_DATE date not null, EVENT_ID varchar(32) not null, ACTIVITY_COUNT bigint not null, primary key (ID));
create table SST_SITEVISITS (ID bigint generated by default as identity (start with 1), SITE_ID varchar(99) not null, VISITS_DATE date not null, TOTAL_VISITS bigint not null, TOTAL_UNIQUE bigint not null, primary key (ID));
create index SST_EVENTS_USER_ID_IX on SST_EVENTS (USER_ID);
create index SST_EVENTS_SITE_ID_IX on SST_EVENTS (SITE_ID);
create index SST_EVENTS_SITEEVENTUSER_ID_IX on SST_EVENTS (USER_ID, SITE_ID, EVENT_ID);
create index SST_EVENTS_EVENT_ID_IX on SST_EVENTS (EVENT_ID);
create index SST_EVENTS_DATE_IX on SST_EVENTS (EVENT_DATE);
create index SST_PREFERENCES_SITE_ID_IX on SST_PREFERENCES (SITE_ID);
create index SST_PRESENCE_DATE_IX on SST_PRESENCES (DATE);
create index SST_PRESENCE_USER_ID_IX on SST_PRESENCES (USER_ID);
create index SST_PRESENCE_SITE_ID_IX on SST_PRESENCES (SITE_ID);
create index SST_PRESENCE_SITEUSERDATE_ID_IX on SST_PRESENCES (SITE_ID, USER_ID, DATE);
create index SST_REPORTS_SITE_ID_IX on SST_REPORTS (SITE_ID);
create index SST_RESOURCES_USER_ID_IX on SST_RESOURCES (USER_ID);
create index SST_RESOURCES_SITE_ID_IX on SST_RESOURCES (SITE_ID);
create index SST_RESOURCES_RES_ACT_IDX on SST_RESOURCES (RESOURCE_ACTION);
create index SST_RESOURCES_DATE_IX on SST_RESOURCES (RESOURCE_DATE);
create index SST_SITEACTIVITY_EVENT_ID_IX on SST_SITEACTIVITY (EVENT_ID);
create index SST_SITEACTIVITY_DATE_IX on SST_SITEACTIVITY (ACTIVITY_DATE);
create index SST_SITEACTIVITY_SITE_ID_IX on SST_SITEACTIVITY (SITE_ID);
create index SST_SITEVISITS_DATE_IX on SST_SITEVISITS (VISITS_DATE);
create index SST_SITEVISITS_SITE_ID_IX on SST_SITEVISITS (SITE_ID);
