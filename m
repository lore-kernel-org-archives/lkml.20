Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1874AA02B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196985; cv=fail; b=iVw4HARxbVT8YB/3F0qip5cqMhvqNfSEnTEme8pwVLlA7D07z2kt5UGrLGfw9ftKreEsjTg51ovK5GxfNpXS2kZc3SGtpcYFBVjoC7hJsXspUTO7249UyYPPqO1XjsymjOtbvmzjz/Lp6QuOaa8LOEXHfBu0A7x/KOP4GH435J4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196985; c=relaxed/simple;
	bh=nPp31XCZQKhtosQcORih3yxwk1Qzl+3bbxmaGocz/0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R5w7oFL7IxylTv9crZZJPz2OZyyppDi82PdVHJN/rPaqiRn3lP2xx7XkytsrItxBLAt1j9EYIWXSNNpx0xP5207I3ivEBnyfsE+0NDzC6ktMPM4QGxd5MiJAaaxZsXotTO/KmcBMDv0x4Z8ZwpdyrMWtTf42eYAU7oE9it3L1rU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VcAiHqKu; arc=fail smtp.client-ip=52.101.48.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VcAiHqKu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhZNUYlV8UUX5pIwhNNk2vXIHxpM+idzYFB+JehmYq8SYLDKGXZi9EcKdveMEFwbNRo/9gXDSgmvOCF0BACxBCmrisMoAcBWJj5CasEytY7wW7XGAgVrKaSUvkVJTuhAkyUUBTdN2Y/XiTwXTcJe0yUT5W6b8l+L+XA4gba2T/oBsFO/c9BJzUemzXw5E2JuX9OSEEypuDeMJSqQ2KYJf+cwbADd5fpJKoZV+C0LGHRB76457cuhBJ761W2AjTJL/V/fTeWfTICpANu4ZS46gKQP4dwMKQ6LwVkrgO5WB+q3zkm25nQiCsoc58JtN3MR7NlXn6mDcPGfjgRDwoMSCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTFJdHxgRAfhIWAUhD/DRScVBoaxUizH7aHqY/JI46k=;
 b=VVO8onEENUrWgYep9NkNHxDO+DJqxit8QLqu3DWqxQQ4RZwcbqoNugxT9M86Mgl6jZRUHGan4z9R+2RHnwqRpDFWHQXzPoInhX9mazsCFoVvh1XMosXa97xxFDSpe7os++86Dv2Q55WmT/+sp6yk1GcDbSxcjWXY59VR/qLMUgGfRtdV3YPBwNfL7dpZ9Ydn2EW2hkZI9aabGJw0Hwj2Dye4B2KMDt38hJtJatJcodBUeuMENV45ff6gf0/6yWsBbgA91iRaN+4csVSQhsH4jy2LF1bQjyuxF5HUD5jy4/RWHqfuB6yga82uWB4osG/mGBzeAaL9n4quD78gaO8b+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTFJdHxgRAfhIWAUhD/DRScVBoaxUizH7aHqY/JI46k=;
 b=VcAiHqKut5L2/xm5SNpFBnSy+gi7+v48PFswu/MTrX70qf+rSqXZQsYNJUB59XuO6NDKKb58dqASLHUFwZ4KghtLk4dNjDd1T6NEHo1Lex0JbCUd4bejGwwB93BBdmwNur4AUE7FWhIUs+0UClRVDx+Q0hAau6SvVLqAf3tawWtCjO/KmAWDEB88/HKKD6A0Fud6NV5x6Wl1im4CRWOYCuo9Z/7Gsdl9C9stC52P3hGUW0MnjgnTHqiUkdOiYFbjZadvpZaJNgju3anRnIMrAgGIK0mNfxzY51Begn9kv9qwOCFEwNOa+4sLHTQNppTI8o88IPD1vYp0D3/1J7/kiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SJ5PPF0C60B25BF.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:22:56 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:22:56 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Newton Liu <newtonl@nvidia.com>,
	Richard Cheng <icheng@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fenghua Yu <fenghuay@nvidia.com>
Subject: [PATCH RFC v2 04/19] resctrl: Add node-scope MBM total event
Date: Mon, 31 Aug 2026 10:22:30 -0700
Message-ID: <20260831172245.42253-5-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0096.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::11) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SJ5PPF0C60B25BF:EE_
X-MS-Office365-Filtering-Correlation-Id: d73785d6-a8b7-4d88-edc3-08df07847f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|18002099003|22082099003|56012099006|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	bSi9lyeDXsn92EHJ8uZCyI4dfrvH2AXrYjiNmEmseQTHAqBMRlaK4OGx66pUSFjiMGRJEfuULsbkIvFaYBTFJelWhFaGYPYgIRlsX05v/wKOeqQLS23BDb5WLHpiPUuN/IMAXwaf1L31soBV23ElGsqtyqsm3Lb9ilgohrEruVJu0VvmplMFpgP+1vrXAgpf+CZXd/kLcfl98AVEw036jWzD2OcOSIzrppmo8jjaAsvDDqarKkmBAAfFqYgxt0QCLPm/+UYzYw+fMoNmxLUdVX37GZ3SMFi4rJrBqIw2tbda9QTMvfZsLioF/mcG2Po7NqB1ifO4m/4aEa9rc6j0wXgzEvrH8xIxH+dFQJ1lcznWv/LTiXeQA2ovemfXW4bTP0IjpAB1kYxlbyhp6jLo5wVFe5r3Z+Ul1B2hcbcQKRDHzxwKK7sOm0Jyr3J0ylU+paU3Ju4ufMH8moW3JvqHBt8NGTd5SkQmphtjbBRIDLPSZwQKPLR2Zu0dzC3aVvtQIsamcloXV7ULaPRFkZNBltsyxK13RRx62O1VTylbUgKwYUI2hkPiaXJNtrJsWy9h13h3HatR8V8lCTf4DkOxgtyQx8tpv2+WXs95QMCkMlrfG2NU8RNCrS6n52Z+7XoFmWSIvlHx8L1AFgBWxbERSuVhREnbU7TiemjK/kEkoQWQUxLx20inBaG+qVC0DiF6MhOx7O9aOVQgkvBSXdN/lw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U0TG693KFiO7VBBYASA+OgWUnnEv0ZXUTuYL0uQbmajQS8vTu+N58UI++mKb?=
 =?us-ascii?Q?mM3LOHKwCKPXRLVfb/agzKg5xJCAy481K1CC3DHu6XDkKeTkvIBM44lhwjXR?=
 =?us-ascii?Q?GRb26iDoU3T04kusPr56O6g4uKvKTDS6Fw65bihogwGHVQFL7BEkjOj/AJOy?=
 =?us-ascii?Q?TouRnfSJS7zgvoUvIzt99BVY3ZejvJj+P8fZHNzZtvQwNe/JpWXMFE65jca2?=
 =?us-ascii?Q?kDoA5BFEqVI8p8ulgeKIDGKxgrZH1ZNAAnMH+3eYPQq+v19CGc5re+PssYyB?=
 =?us-ascii?Q?qsvjyTO4hv5eaClypd1VOaknVK171WGib2SxCly8bf0sMWkuleeSRYi7fYfX?=
 =?us-ascii?Q?vFMy1bnKk/96nxeS+ksb6auhSReA1TAy3tFQan04auY7yFoONhmGo0VUbh/R?=
 =?us-ascii?Q?8ZRXkQAmk9tulG+2LZWhdqDE/6eGJMvcYsTPpP1FnCZfg5n+UZv6rek09vji?=
 =?us-ascii?Q?+/vDrfAwcr+1k64N/xCACgPPP2MS+niurWttKPiBFUh1wrPHlRmIA0DsDT1a?=
 =?us-ascii?Q?wT470yNHMWZxKCCoGnXu101LCbyxDvhbnsCfb8iTv1jb6ak99UPtN1PC4Lrl?=
 =?us-ascii?Q?rWDwRN3enYl5DYhJmC3IlNYDlW6XuSSRE8KcEHKseS/JJQ4SeZLPV8yrMdNQ?=
 =?us-ascii?Q?uxj63CRdDpVJubJqDlVGoZlTOMJtbQWXhB5mw4P4hs9BJ8SWXP3K7zQIGmQG?=
 =?us-ascii?Q?HPXNQgvo5caWa50kETjkBbbw8CsykG2IC7iaeKKe+/RtedgUUtKsuS83qyR1?=
 =?us-ascii?Q?NZZin4h18gXqig9HjL5DJZcfNfKV9EKufY5zXhHk7dfAlkDFjZaqjHoksL94?=
 =?us-ascii?Q?o7+IyHvsUacFeRwTCUjoIBOciiMG3ZnhO3rNh1ASIoviWa3G1TFgmA/X6Yzh?=
 =?us-ascii?Q?gP8ablFP0NTcwdEYg5IHBi2rsSJHG3jEKJp8nyfpdcMhd2Qo33i+3LijlhJl?=
 =?us-ascii?Q?nTjM5AB7v7A6I3az72pbPqvUCXTrXFjzu4Qw+1kt2oj04ljHUNTQtRiYeOWe?=
 =?us-ascii?Q?pS679QwEcWf/QnlVrSWsxTjpXGmwgYsnZMgRzUZhLoCt1yKCYwFEE23rcJ3P?=
 =?us-ascii?Q?Q6v4unWPEzYqfyFq/3OmMdVqFCTLpvVaXSOQ3OEELwQfJPl892u97NA5zpeQ?=
 =?us-ascii?Q?7dp+eEf0JGh8daunLeKhBaVU6hS7mYU0D0J7SvHbdQ6sr44wWDPHNO6P+o4p?=
 =?us-ascii?Q?jvmR16vn/OSj+qY7x1C5PUgbZP2kpv5sZTiOjThjCM0NKcWuHVnk4MzTpLCW?=
 =?us-ascii?Q?/Rsza5EV9USRUvOpJSwWvCZnOLBWLKjcfEgITnnf/fkAHmbxQmS6kMQKPJDe?=
 =?us-ascii?Q?C1k4sYTo98qINlm3kc6myel0D+j1Lo7JpUoIRpEwrndlHOoH6QC7KCCX4Pmq?=
 =?us-ascii?Q?MnQohSkfPWnp+xA34vr2Umx0f1/jBatG/qt+1SfmKlxYFyC51/AkXSXbV05d?=
 =?us-ascii?Q?8XJWF/qWqzJhsQ4Q0x/WNnFM73/SYrv9uZe/kJ2F/USYu922Fgy6I2cFEP6b?=
 =?us-ascii?Q?colF5A9kxtIhZRIuijuHdfdzmvCE853SIFQxXmMk4yu0PilBB+P1BcphLdUI?=
 =?us-ascii?Q?j1UCJ4Ma21LCVlG/Jt/NHL/XUj8yv9yARDF0VBfbEt6FWb6GQuFM3KKlQpxs?=
 =?us-ascii?Q?ZWBw8Cqvoh7l5qukplWfCpadCh98b7w4NxwC/8705KcAf4r7Nz0bQwK6WKtw?=
 =?us-ascii?Q?Y+8aeAoXTuzf74nxcTSWAYXBZdIDHXC6ERrUvthXajuZnQJBkrJbPm+SGkSA?=
 =?us-ascii?Q?RdU2mzVxnA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d73785d6-a8b7-4d88-edc3-08df07847f82
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:22:56.7604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMP1y/P8fIlYjnbF7vVyUazopdCYgrwXWdCmHztF/aWIkAD2gnZitvF8pH91A/hmq7vTWWoEHTD0XLf8qxn2bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0C60B25BF

Some MPAM systems count total memory bandwidth on a memory-side MSC that
is scoped to a NUMA node rather than the L3 cache. Add a new
QOS_NODE_MBM_TOTAL_EVENT_ID event for this node-scoped total, backed by
the MBA resource, and register it in the mon_event_all[] table.

Keep the new event id contiguous with the existing L3 MBM events so the
for_each_mbm_event_id() range and the per-domain software MBM state
arrays continue to be sized from the first to the last MBM event. Extend
resctrl_is_mbm_event() to recognise it, and add helpers
resctrl_is_mbm_total_event() and resctrl_mbm_total_event_id() so callers
can select the node-scoped total when it is enabled and fall back to the
L3 total otherwise.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/monitor.c          |  2 ++
 include/linux/resctrl.h       | 27 +++++++++++++++++++++++----
 include/linux/resctrl_types.h | 15 ++++++++++++++-
 3 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 5865a509174c..ea9d92b6b581 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -1040,6 +1040,8 @@ struct mon_evt mon_event_all[QOS_NUM_EVENTS] = {
 	MON_EVENT(QOS_L3_OCCUP_EVENT_ID,		"llc_occupancy",	RDT_RESOURCE_L3,	false),
 	MON_EVENT(QOS_L3_MBM_TOTAL_EVENT_ID,		"mbm_total_bytes",	RDT_RESOURCE_L3,	false),
 	MON_EVENT(QOS_L3_MBM_LOCAL_EVENT_ID,		"mbm_local_bytes",	RDT_RESOURCE_L3,	false),
+	MON_EVENT(QOS_NODE_MBM_TOTAL_EVENT_ID,		"mbm_total_bytes",
+		  RDT_RESOURCE_MBA,			false),
 	MON_EVENT(PMT_EVENT_ENERGY,			"core_energy",		RDT_RESOURCE_PERF_PKG,	true),
 	MON_EVENT(PMT_EVENT_ACTIVITY,			"activity",		RDT_RESOURCE_PERF_PKG,	true),
 	MON_EVENT(PMT_EVENT_STALLS_LLC_HIT,		"stalls_llc_hit",	RDT_RESOURCE_PERF_PKG,	false),
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index f2c3621b006e..195c0948b26d 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -633,16 +633,35 @@ bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt);
 
 static inline bool resctrl_is_mbm_event(enum resctrl_event_id eventid)
 {
-	return (eventid >= QOS_L3_MBM_TOTAL_EVENT_ID &&
-		eventid <= QOS_L3_MBM_LOCAL_EVENT_ID);
+	return ((eventid >= QOS_L3_MBM_TOTAL_EVENT_ID &&
+		 eventid <= QOS_L3_MBM_LOCAL_EVENT_ID) ||
+		eventid == QOS_NODE_MBM_TOTAL_EVENT_ID);
+}
+
+static inline bool resctrl_is_mbm_total_event(enum resctrl_event_id eventid)
+{
+	return eventid == QOS_L3_MBM_TOTAL_EVENT_ID ||
+	       eventid == QOS_NODE_MBM_TOTAL_EVENT_ID;
+}
+
+static inline enum resctrl_event_id resctrl_mbm_total_event_id(void)
+{
+	if (resctrl_is_mon_event_enabled(QOS_NODE_MBM_TOTAL_EVENT_ID))
+		return QOS_NODE_MBM_TOTAL_EVENT_ID;
+
+	return QOS_L3_MBM_TOTAL_EVENT_ID;
 }
 
 u32 resctrl_get_mon_evt_cfg(enum resctrl_event_id eventid);
 
-/* Iterate over all memory bandwidth events */
+/*
+ * Iterate over all memory bandwidth events. The node-scope total event is
+ * contiguous with the L3 events, so it is covered by the same range. Loop
+ * bodies must skip events that are not enabled.
+ */
 #define for_each_mbm_event_id(eventid)				\
 	for (eventid = QOS_L3_MBM_TOTAL_EVENT_ID;		\
-	     eventid <= QOS_L3_MBM_LOCAL_EVENT_ID; eventid++)
+	     eventid <= QOS_NODE_MBM_TOTAL_EVENT_ID; eventid++)
 
 /* Iterate over memory bandwidth arrays in domain structures */
 #define for_each_mbm_idx(idx)					\
diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index a5f56faa18d2..996ae8763b0a 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -50,6 +50,13 @@ enum resctrl_event_id {
 	QOS_L3_MBM_TOTAL_EVENT_ID	= 0x02,
 	QOS_L3_MBM_LOCAL_EVENT_ID	= 0x03,
 
+	/*
+	 * Total memory bandwidth counted on a NUMA node scope MSC (e.g. a
+	 * memory-side MSC above the L3). Kept contiguous with the other MPAM
+	 * events so arch code can size per-event arrays by the last MPAM event.
+	 */
+	QOS_NODE_MBM_TOTAL_EVENT_ID	= 0x04,
+
 	/* Intel Telemetry Events */
 	PMT_EVENT_ENERGY,
 	PMT_EVENT_ACTIVITY,
@@ -65,7 +72,13 @@ enum resctrl_event_id {
 	QOS_NUM_EVENTS,
 };
 
-#define QOS_NUM_L3_MBM_EVENTS	(QOS_L3_MBM_LOCAL_EVENT_ID - QOS_L3_MBM_TOTAL_EVENT_ID + 1)
+/*
+ * Number of software MBM state slots per monitoring domain. The MBM events
+ * (L3 total, L3 local and the node-scope total) are contiguous, so the last
+ * one bounds the array. The node-scope total event is only ever enabled on
+ * Arm/MPAM; on x86 its slot is simply left unused.
+ */
+#define QOS_NUM_L3_MBM_EVENTS	(QOS_NODE_MBM_TOTAL_EVENT_ID - QOS_L3_MBM_TOTAL_EVENT_ID + 1)
 #define MBM_STATE_IDX(evt)	((evt) - QOS_L3_MBM_TOTAL_EVENT_ID)
 
 #endif /* __LINUX_RESCTRL_TYPES_H */
-- 
2.53.0

