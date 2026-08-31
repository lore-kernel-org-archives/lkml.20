Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4F64AA1D9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196989; cv=fail; b=CDyEsjsPlCyJUGP8zU/LzB7ypgWguCE6HTqecL2fBKs2lW7De/BKGkNl+TCM4K0wzqBGPNsG6Li596HR2SOj49gsLc/RmxvyxWE3lW5P9ZpQei/jRQkld82+oz9Qr2R95VNLfffobyEFy5jUbHQDeVjPanmBdM2YJs5fX1ELbEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196989; c=relaxed/simple;
	bh=JgrKS495dlYajjwb1XId1zzZlLG8vQ3TGPORHdZ53E4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PNkX2Fkq1/HvajsZO7MYjHHwxdAw8p26HPJuX+wORjmIEZN/CfX4stOM+cs79D73wQq8AUReQSJiiwmndmje1ktpSU+IBvBAgkavH7oCMyw0rrQLyO/l90uBgQfuVxsJZUyREX0sRad0WhR8Uf2ss/m3vW2dMOoFgYqDkE+iqak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lp2RWUfp; arc=fail smtp.client-ip=52.101.48.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lp2RWUfp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HoifSIXByM3aWlbAy8CPB3F9l1XS9gc8amEOxWR1iWCfjsspIBlZ/3seVwJ1Yd0MhVfTMCzXLgofrgiLn10p+mAQ6OPN5PLX2OxTCZ6KuOT3UNkYXWjKbUZltA4XuNHSLntdmll5kXnaCpmTOkSvvMdlEbwaQ5rjBIV0bH0HBi09wUUSgpg2qznVS62PSmcwUTJKlmDpoCJj01FgSMGnk4V82dlY29upaJRYcjzURZoPLa2oz6UwWEHsVaPu40lwMa06MoMOm9gpBdWSbueDm2AboRAPJUYuReHHmM5JIcWntIlO9fQbRAAWMFvHnO/DuuaUxR3yj0JUGRZLG+4t1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgX4u+d3puUBlvhJSRKZII6yCdJh8gUQDH6RJSdXmq4=;
 b=zWoRpcwl3XRxlOfuoz2xlbRYmFV1ugN8bbuhaea3t35Q3yv2O58/NRKbLTFjVc+9EY70IitLFrrpe+vke5Wdta4oSygFgzU51Ppnzhy0UmdLsqAqzDwjazwe67j5mVkQPxGg9sR4z7CQv//xHrp/vG6XYUTlOhA161pqqDmzRWixQTnwwi5nzTMCf91me1dJylpq+tAh6Nisa+gSH37pn5w2MAuyRlri6fBZrrWCExv03dKIRY2aZeKvNeryhIDD3AAxwUQ1JaBAA0vM90RCd7QKiRubJ2gQhtVB67ikzdCsRyfTjExDDUnZSYT/MbE39BoojGWUgNDhdVfRgTqXFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgX4u+d3puUBlvhJSRKZII6yCdJh8gUQDH6RJSdXmq4=;
 b=lp2RWUfp2eMDJVVyfB2MbE+ChZvVBNxNti8CI+ep27x3xbKLxEZaLk2EV+wa2o/2gksSyZk5hrBTEGKQJdP6EvqBJMN2KYEFH+ex9LUztTkRN60cJBJkM9tE9uiie5P+rgxUfDleUIuqPv1BT5YxMuamPj4q1bD/5A4J7dxB9OPLtEUWGfdFqvSZ2r8LxAq2/7IZ0z1qANddqbxY+9dCM1I0YgqEhvvfPByww5U7ohlJqKjyk8Cyzj+1Cio0nlFQTu0efWpninZA1nCkgpL5oQRaqnc4Ba0EeLgttiXpKcAagsCfASK7zDIfoIxps+YvaD4wpN7KLJRNrota3kOHjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SJ5PPF0C60B25BF.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:22:57 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:22:57 +0000
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
Subject: [PATCH RFC v2 05/19] resctrl: Make MBM paths resource-aware
Date: Mon, 31 Aug 2026 10:22:31 -0700
Message-ID: <20260831172245.42253-6-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:254::10) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SJ5PPF0C60B25BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 67fe9a73-977f-4b96-95c3-08df0784802b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|6133799003|18002099003|22082099003|56012099006|11063799006|5023799004|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	b/kxH8p2QHU/sh07qv5KqSwyiJgQET2Vw4R1Wr0jpcyncmJJIqHFT54pBVnjgHCLgMyKWqpnF1YqvgWgC3Sha2fNGEmFl7w3ZMfsDiY225LIiN28DuLqpIJUoangTNI++AgrqVwzu6EQYntavz34qoB0M1IlXQKwIk/NdFcDhFVvW61g6clMwC3a+9jSkli5CQOq1RNBZ5MinFtGQXJ9q9o6lbtr38d/sCqWQw0Lo+DWCJOqAngYnM+OipiZC2ozAfkO2tQIaIBafQQLb+4mDfMEoOAlV5yGhlEXXEB2Km4QICUV8THLwwnyp6K+BinhkbsZ7d95d3lk3isNdnjNccDEDayeAiNbmuv0uWSKSKCyo1QvAv5F/Byh7GHVsTMv74Bg3Ms7WKKyU+ScmIcJfXFFqwLc3PfiN8JFGQt9Sk0d7IjQSn0bA9vZ/G5Ify2ytrob3X/3F7D+hhU7/HXwrRa6AmBMMGjA9EFwTogdEzdbI1c8SdtgPhH9BF0yTWvA8Ls0sRDGpPtmKgOCQw+fslPJbHDmcV8+bN+ZWAM3hT4koU7n1SYAdc+N/YnAyoHB69qCS/Xi2ResNS3d4DG5l5cc9dlPP/NG8vZ2qxeQCHQDm+rcLccI4CAfXUarjd+zPSKrSiKUE1Ez2qqjprnPxDM3YdF54a0lqT/0aYB1wSuhVjvU1lEM0evuwFjM3krxK7UzzWbmkGl98X0JtODZ7Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6mc+KbVNu044wXO9pMeR6U5Iq5e6dp4TsNMYo7paapwheFXwkOoiDmsrxgT+?=
 =?us-ascii?Q?LqO/pxRmMjhLg8vNQtYcofB5FXFYRLDW4bxviCGYsHuIKZirhQIRbp6+UJ7t?=
 =?us-ascii?Q?BDcT5RLXGM30/1Gh1PMb8rTpVopKDGxV6L31k9rdnVK2W2vEaCzJH2XWJo0c?=
 =?us-ascii?Q?lJST8wXs4oNXApVl6Lbp5CvdKUDfbw5bIAyJAJPB3ak/X6QsPvZgK/jj2xJK?=
 =?us-ascii?Q?wUuMefJGlA5PTpCv2agZ/VazVYXWPqq04IxxJGha9EtPd4/s1R2TYNusgWk0?=
 =?us-ascii?Q?Aa8XEaM4X9qj6S/FnOIQXxgsD6OsUAcFXaAmJ3y0QpWMRsBgzC6iAmg4rbRW?=
 =?us-ascii?Q?GWhVX1yFYb6mbvu8tpixoUdP7bg5h2RbW+j7cGfiv/4NiatH/rONSb6uoYDa?=
 =?us-ascii?Q?5hlTkQI88jwwvkvzCMEaeIZGVW9uXwHQl1RWww0VESBIYf+nJltJzJhJq99J?=
 =?us-ascii?Q?F74umPLW88Vj3Y3DQ283Xgb3v92rHbtWPdB7oFw3805pFOh6iTtbCnncGV94?=
 =?us-ascii?Q?wCLpf7jKtHpZnlh8Cq1tpzoYTEsACtRZLxd02/ZB9I0VbJsH68hBiyxxMAQM?=
 =?us-ascii?Q?hARnOn8z/TsCdGiAGXRltQzpmZv3Rn/xnwInLUpnbf3fw2zc5XR/CIcKoVwY?=
 =?us-ascii?Q?FCLkRG8hitSlD8PsqFbzbfRXzI9WZY9cIsQLd+xlR8WCW2u+/zrVVH1b8Okk?=
 =?us-ascii?Q?H/2hOWFzKHADRJWipfG54/h2IUZ1psxsgtSYA7PLWpYNj8d5jPhFUq4HRZIk?=
 =?us-ascii?Q?q+hVW+MfZhm3mRf87yJuY0HxGzUJqRjYs/INtXzmppRAA9iBxCfXiXgXf6i3?=
 =?us-ascii?Q?3GlDguIVS+qHGP++KCyYpoAp+ah1VsyE8ZvipM0Z4v85XNXDh2HKo4zhxIO6?=
 =?us-ascii?Q?sloGXX2cJ7+4YMFEbQhm/TyuVAuz1TSFBlL2veh+UFGRsTLfdYo/hF1QevQ5?=
 =?us-ascii?Q?MCxFT0rbQZnfQJwKXmGFxJeCOARV233nsUN5RrSvRNstrBg75n7t30ouX4MK?=
 =?us-ascii?Q?qm/QoBNQU5frdC8kDP9s9CoX+hsNObIyU10ddteS/waj7Vp+w5C5StO/w04K?=
 =?us-ascii?Q?OKj7FCg43zCuyGkn4NRzd0HdIba3rt04w5SxGoo0mWkP48kSbLpd6dAALb2+?=
 =?us-ascii?Q?KgSLurSjD4LzVDnAAxe+5DqXz37kAq/RiC6/gv/sg8S1rHGsbZSOYt11yFV1?=
 =?us-ascii?Q?dy9m+sKkHLMciHpqiBor65ZjG3ZFYTEbWb+1VH9plvBL/gOe4BGrU3p84bwx?=
 =?us-ascii?Q?o8SnSvmt6Q0wXCxKS7yHM804rCQTvzxJRfA6LGstwgPJvyYELkqNgDlupj2m?=
 =?us-ascii?Q?Hc1WQHzRLlN6XpRPk/CQay3tRyS4Y/e0/f58p5uzMLE6qMN6cJMVCWxFDZgx?=
 =?us-ascii?Q?knKj8/CQQ57g3fmrpGaf8O22swG/ZLiZ0IDA9aIN/SEo59m9bABkuu6k/wFd?=
 =?us-ascii?Q?K0x5EELg0DRM6tKr3Cp1coK1JP8jgCAQ6fHRYtwk3TKq6SIfFG0qnhx9F0BO?=
 =?us-ascii?Q?LZG9CeaQwsP85pniJ7RLjEiu1rzUkCMsGelGOJSpaSG0NYLolYhWXSF9PO3/?=
 =?us-ascii?Q?Q1zINqengzqE6xRcQSJudk0yrY0Tgacteilkm6GAZbo/I0IC4ilCc0tpX+DS?=
 =?us-ascii?Q?/f47Btu+4JxCyS8EBVHjoEpImEbmpIz1d59hq3HdnwdcxsjDqNicr82lwZ1I?=
 =?us-ascii?Q?3iVbPWLZX6nV2mfFZf9MXPO4AKJXMFjD5WC3AC0OlJ8fGx8DQxR6Ml0jmWZd?=
 =?us-ascii?Q?rsyIMXlMQQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fe9a73-977f-4b96-95c3-08df0784802b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:22:57.8595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZSDmsuuGCQiHeIU6oruB3vYrS6jGxrkjc1SotDOEDgLJQ9yjBzvq9cIfV5EYaxbCOqmVyZdLgSqushD8xatlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0C60B25BF

The MBM overflow, counter-assignment and event-configuration paths
hard-coded RDT_RESOURCE_L3 and the individual L3 MBM event ids. That
cannot express the node-scoped MBM total event, which is backed by the
MBA resource.

Iterate mon_event_all[] and act on every enabled MBM event whose owning
resource matches, instead of naming the L3 events explicitly. Derive the
resource of an overflow work item from the domain's rid, only run mba_sc
bandwidth feedback for the L3 resource, and initialise event
configuration for whichever MBM events a resource actually exposes. No
functional change on L3-only systems.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/ctrlmondata.c |   5 +-
 fs/resctrl/monitor.c     | 105 ++++++++++++++++++++++++---------------
 fs/resctrl/rdtgroup.c    |  64 ++++++++++++++----------
 3 files changed, 109 insertions(+), 65 deletions(-)

diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 675531009136..4bc7090ad0c7 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -700,7 +700,9 @@ ssize_t rdtgroup_mba_mbps_event_write(struct kernfs_open_file *of,
 		else
 			ret = -EINVAL;
 	} else if (!strcmp(buf, "mbm_total_bytes")) {
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
+		if (resctrl_is_mon_event_enabled(QOS_NODE_MBM_TOTAL_EVENT_ID))
+			rdtgrp->mba_mbps_event = QOS_NODE_MBM_TOTAL_EVENT_ID;
+		else if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
 			rdtgrp->mba_mbps_event = QOS_L3_MBM_TOTAL_EVENT_ID;
 		else
 			ret = -EINVAL;
@@ -731,6 +733,7 @@ int rdtgroup_mba_mbps_event_show(struct kernfs_open_file *of,
 			seq_puts(s, "mbm_local_bytes\n");
 			break;
 		case QOS_L3_MBM_TOTAL_EVENT_ID:
+		case QOS_NODE_MBM_TOTAL_EVENT_ID:
 			seq_puts(s, "mbm_total_bytes\n");
 			break;
 		default:
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index ea9d92b6b581..d555f2d19164 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -809,11 +809,15 @@ static void mbm_update(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 	 * This is protected from concurrent reads from user as both
 	 * the user and overflow handler hold the global mutex.
 	 */
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-		mbm_update_one_event(r, d, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID);
+	struct mon_evt *mevt;
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-		mbm_update_one_event(r, d, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID);
+	for_each_mon_event(mevt) {
+		if (mevt->rid != r->rid || !mevt->enabled ||
+		    !resctrl_is_mbm_event(mevt->evtid))
+			continue;
+
+		mbm_update_one_event(r, d, rdtgrp, mevt->evtid);
+	}
 }
 
 /*
@@ -910,8 +914,8 @@ void mbm_handle_overflow(struct work_struct *work)
 	if (!is_percpu_thread())
 		goto out_unlock;
 
-	r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	d = container_of(work, struct rdt_l3_mon_domain, mbm_over.work);
+	r = resctrl_arch_get_resource(d->hdr.rid);
 
 	/* Domain is going offline */
 	if (cpumask_empty(&d->hdr.cpu_mask))
@@ -924,7 +928,7 @@ void mbm_handle_overflow(struct work_struct *work)
 		list_for_each_entry(crgrp, head, mon.crdtgrp_list)
 			mbm_update(r, d, crgrp);
 
-		if (is_mba_sc(NULL, NULL))
+		if (is_mba_sc(NULL, NULL) && r->rid == RDT_RESOURCE_L3)
 			update_mba_bw(prgrp, d);
 	}
 
@@ -1321,19 +1325,20 @@ static int rdtgroup_assign_cntr_event(struct rdt_l3_mon_domain *d, struct rdtgro
  */
 void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdt_resource *r;
+	struct mon_evt *mevt;
 
-	if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r) ||
-	    !r->mon.mbm_assign_on_mkdir)
-		return;
+	for_each_mon_event(mevt) {
+		if (!mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
+			continue;
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-		rdtgroup_assign_cntr_event(NULL, rdtgrp,
-					   &mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID]);
+		r = resctrl_arch_get_resource(mevt->rid);
+		if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r) ||
+		    !r->mon.mbm_assign_on_mkdir)
+			continue;
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-		rdtgroup_assign_cntr_event(NULL, rdtgrp,
-					   &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
+		rdtgroup_assign_cntr_event(NULL, rdtgrp, mevt);
+	}
 }
 
 /*
@@ -1380,18 +1385,19 @@ static void rdtgroup_unassign_cntr_event(struct rdt_l3_mon_domain *d, struct rdt
  */
 void rdtgroup_unassign_cntrs(struct rdtgroup *rdtgrp)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdt_resource *r;
+	struct mon_evt *mevt;
 
-	if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r))
-		return;
+	for_each_mon_event(mevt) {
+		if (!mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
+			continue;
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-		rdtgroup_unassign_cntr_event(NULL, rdtgrp,
-					     &mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID]);
+		r = resctrl_arch_get_resource(mevt->rid);
+		if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r))
+			continue;
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-		rdtgroup_unassign_cntr_event(NULL, rdtgrp,
-					     &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
+		rdtgroup_unassign_cntr_event(NULL, rdtgrp, mevt);
+	}
 }
 
 static int resctrl_parse_mem_transactions(char *tok, u32 *val)
@@ -1551,6 +1557,7 @@ ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of, char *buf,
 {
 	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
 	struct rdt_l3_mon_domain *d;
+	struct mon_evt *mevt;
 	int ret = 0;
 	bool enable;
 
@@ -1602,13 +1609,19 @@ ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of, char *buf,
 		 * Initialize the default memory transaction values for
 		 * total and local events.
 		 */
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-			mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask;
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-			mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask &
-									   (READS_TO_LOCAL_MEM |
-									    READS_TO_LOCAL_S_MEM |
-									    NON_TEMP_WRITE_TO_LOCAL_MEM);
+		for_each_mon_event(mevt) {
+			if (mevt->rid != r->rid || !mevt->enabled ||
+			    !resctrl_is_mbm_event(mevt->evtid))
+				continue;
+
+			if (mevt->evtid == QOS_L3_MBM_LOCAL_EVENT_ID)
+				mevt->evt_cfg = r->mon.mbm_cfg_mask &
+						(READS_TO_LOCAL_MEM |
+						 READS_TO_LOCAL_S_MEM |
+						 NON_TEMP_WRITE_TO_LOCAL_MEM);
+			else
+				mevt->evt_cfg = r->mon.mbm_cfg_mask;
+		}
 		/* Enable auto assignment when switching to "mbm_event" mode */
 		if (enable)
 			r->mon.mbm_assign_on_mkdir = true;
@@ -1947,6 +1960,7 @@ static void closid_num_dirty_rmid_free(void)
 
 static void resctrl_mon_resource_init(struct rdt_resource *r)
 {
+	struct mon_evt *mevt;
 	unsigned long fflags;
 
 	fflags = (r->rid == RDT_RESOURCE_MBA) ? RFTYPE_RES_MB : RFTYPE_RES_CACHE;
@@ -1956,6 +1970,11 @@ static void resctrl_mon_resource_init(struct rdt_resource *r)
 		resctrl_file_fflags_init("mbm_total_bytes_config",
 					 RFTYPE_MON_INFO | fflags);
 	}
+	if (resctrl_arch_is_evt_configurable(QOS_NODE_MBM_TOTAL_EVENT_ID)) {
+		mon_event_all[QOS_NODE_MBM_TOTAL_EVENT_ID].configurable = true;
+		resctrl_file_fflags_init("mbm_total_bytes_config",
+					 RFTYPE_MON_INFO | fflags);
+	}
 	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_LOCAL_EVENT_ID)) {
 		mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID].configurable = true;
 		resctrl_file_fflags_init("mbm_local_bytes_config",
@@ -1964,17 +1983,25 @@ static void resctrl_mon_resource_init(struct rdt_resource *r)
 
 	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
 		mba_mbps_default_event = QOS_L3_MBM_LOCAL_EVENT_ID;
+	else if (resctrl_is_mon_event_enabled(QOS_NODE_MBM_TOTAL_EVENT_ID))
+		mba_mbps_default_event = QOS_NODE_MBM_TOTAL_EVENT_ID;
 	else if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
 		mba_mbps_default_event = QOS_L3_MBM_TOTAL_EVENT_ID;
 
 	if (r->mon.mbm_cntr_assignable) {
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-			mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask;
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-			mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask &
-									   (READS_TO_LOCAL_MEM |
-									    READS_TO_LOCAL_S_MEM |
-									    NON_TEMP_WRITE_TO_LOCAL_MEM);
+		for_each_mon_event(mevt) {
+			if (mevt->rid != r->rid || !mevt->enabled ||
+			    !resctrl_is_mbm_event(mevt->evtid))
+				continue;
+
+			if (mevt->evtid == QOS_L3_MBM_LOCAL_EVENT_ID)
+				mevt->evt_cfg = r->mon.mbm_cfg_mask &
+						(READS_TO_LOCAL_MEM |
+						 READS_TO_LOCAL_S_MEM |
+						 NON_TEMP_WRITE_TO_LOCAL_MEM);
+			else
+				mevt->evt_cfg = r->mon.mbm_cfg_mask;
+		}
 		r->mon.mbm_assign_on_mkdir = true;
 		resctrl_file_fflags_init("num_mbm_cntrs",
 					 RFTYPE_MON_INFO | fflags);
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 264666e54852..d60868f7d5e7 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -134,7 +134,8 @@ void rdt_staged_configs_clear(void)
 static bool resctrl_is_mbm_enabled(void)
 {
 	return (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID) ||
-		resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID));
+		resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID) ||
+		resctrl_is_mon_event_enabled(QOS_NODE_MBM_TOTAL_EVENT_ID));
 }
 
 /*
@@ -1929,7 +1930,7 @@ static int mbm_total_bytes_config_show(struct kernfs_open_file *of,
 	if (!info_kn_lock(of->kn))
 		return -ENOENT;
 
-	mbm_config_show(seq, r, QOS_L3_MBM_TOTAL_EVENT_ID);
+	mbm_config_show(seq, r, resctrl_mbm_total_event_id());
 
 	info_kn_unlock(of->kn);
 	return 0;
@@ -2053,7 +2054,7 @@ static ssize_t mbm_total_bytes_config_write(struct kernfs_open_file *of,
 
 	buf[nbytes - 1] = '\0';
 
-	ret = mon_config_write(r, buf, QOS_L3_MBM_TOTAL_EVENT_ID);
+	ret = mon_config_write(r, buf, resctrl_mbm_total_event_id());
 
 out_unlock:
 	info_kn_unlock(of->kn);
@@ -5317,10 +5318,39 @@ static struct rdt_l3_mon_domain *get_mon_domain_from_cpu(int cpu,
 	return NULL;
 }
 
-void resctrl_offline_cpu(unsigned int cpu)
+/* rdtgroup_mutex must be held when this helper is called. */
+static void resctrl_migrate_mon_domain_workers(unsigned int cpu,
+					       struct rdt_resource *r)
 {
-	struct rdt_resource *l3 = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	struct rdt_l3_mon_domain *d;
+
+	lockdep_assert_held(&rdtgroup_mutex);
+
+	if (!r->mon_capable)
+		return;
+
+	d = get_mon_domain_from_cpu(cpu, r);
+	if (!d)
+		return;
+
+	if (resctrl_is_mbm_enabled() && cpu == d->mbm_work_cpu) {
+		mutex_unlock(&rdtgroup_mutex);
+		cancel_delayed_work_sync(&d->mbm_over);
+		mutex_lock(&rdtgroup_mutex);
+		mbm_setup_overflow_handler(d, 0, cpu);
+	}
+	if (r->rid == RDT_RESOURCE_L3 &&
+	    resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID) &&
+	    cpu == d->cqm_work_cpu && has_busy_rmid(d)) {
+		mutex_unlock(&rdtgroup_mutex);
+		cancel_delayed_work_sync(&d->cqm_limbo);
+		mutex_lock(&rdtgroup_mutex);
+		cqm_setup_limbo_handler(d, 0, cpu);
+	}
+}
+
+void resctrl_offline_cpu(unsigned int cpu)
+{
 	struct rdtgroup *rdtgrp;
 
 	mutex_lock(&rdtgroup_mutex);
@@ -5331,27 +5361,11 @@ void resctrl_offline_cpu(unsigned int cpu)
 		}
 	}
 
-	if (!l3->mon_capable)
-		goto out_unlock;
+	resctrl_migrate_mon_domain_workers(cpu,
+					   resctrl_arch_get_resource(RDT_RESOURCE_L3));
+	resctrl_migrate_mon_domain_workers(cpu,
+					   resctrl_arch_get_resource(RDT_RESOURCE_MBA));
 
-	d = get_mon_domain_from_cpu(cpu, l3);
-	if (d) {
-		if (resctrl_is_mbm_enabled() && cpu == d->mbm_work_cpu) {
-			mutex_unlock(&rdtgroup_mutex);
-			cancel_delayed_work_sync(&d->mbm_over);
-			mutex_lock(&rdtgroup_mutex);
-			mbm_setup_overflow_handler(d, 0, cpu);
-		}
-		if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID) &&
-		    cpu == d->cqm_work_cpu && has_busy_rmid(d)) {
-			mutex_unlock(&rdtgroup_mutex);
-			cancel_delayed_work_sync(&d->cqm_limbo);
-			mutex_lock(&rdtgroup_mutex);
-			cqm_setup_limbo_handler(d, 0, cpu);
-		}
-	}
-
-out_unlock:
 	mutex_unlock(&rdtgroup_mutex);
 }
 
-- 
2.53.0

