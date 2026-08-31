Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC01427FA0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196980; cv=fail; b=P/I9luX3Xv2eCHtAHHK8vfC+3OAPrAdqRo8F7TG7uNz0GmU55bkOm/hyq0nXkLXnz7S14jE+kL1t05+ZAXS9zXImg6b3bpD5EXVmmUTlOIQDqWhXSJi6EmF4Hpyp8FSLfg23emlTkBR5CigAYlry25OrYg55vOn2MtM2k0dYU4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196980; c=relaxed/simple;
	bh=ZZsYACep/9AcD4grv8V/ZcPqro4VUvvtARTNPu6bPek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Oow8MTtiK0fBxe/jIcAnYCVjDV4Cvd78Z8g+GtpIlxix4qUKPplEIodni81SDm88dZtZ6g5jd6hMEFFykpyjqcA/o2Z0rG4cH7zzUB249ZzZX7LxHM2I2p11v9rPZzZC3fPuATefXrnNqUSpFLWXBcaDsbQV80GoeaR8Xa8Bphw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Dhgh9TPM; arc=fail smtp.client-ip=52.101.48.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Dhgh9TPM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LXVRqSmzodENUqJcXbenwQHFf1aGgMz4szzqpKI/K+WQ5UxRfx7bVNQf2cMYRRE56xyXczR6v+uKrmDDq2lo88bUy9sidO2TRBUxkEAorQgaLgSrfTKQ6aQa360A1YotUg+v/g9Rmrc2HGCimrWeJ01WVdCSemwuzEmS9i+G4gQrjBV/BOSGiZyI/cI6vc1pgaoHG3YSWYnyaoa626/PCCX/msQ7uPM9drOc6smGfj8+Dm6S1XX3RK3CWwjT7Pq+PcI4J5nqJ3dK9lrb4UtyffTV2nwB/Yjlz262+jjAR0QKbYnt+nZIrERuSqgfMQdzrLSuJ9DXCwGRvhSeN2HF2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E94mD6UqzqWlubVjmImfagf/ISNcFzjBebrECEaQ6oI=;
 b=m8AOIIocIGouwPBday+UhQl8fIK3RZhJ05Suh/xfGsTkZ1p57viAZUkbzDeI57RmoPS9BvFW/aTk1GEIZzfWMMseHzSjCK5YkV+CkCkadHIT/dGpGIDEclckYzxwLkDj6oWcm7HgB3Hr/pcYkf6s+2zTGJnW0aNhxtFLyXAqWsW69FGcwcbXMk7bBX2EwNUIiO3B/k8QFmDV7nd743y+WV7qDStK2oquJqXsvhRA4tuHBt/JfaBI0U4LHhXu+hQuJpbGR+/GIuTP6echoQ79HhpLateQOhGSD4AzbjXPwzydoNl+ApXnMsIm4voYqhkldUbQ2ilZuxAhBi1O6OFlRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E94mD6UqzqWlubVjmImfagf/ISNcFzjBebrECEaQ6oI=;
 b=Dhgh9TPM6HD92SuxSoAzQCFFL9aJwxzH62/CzqR/dhGwcjoJMm5fBZ92vmM7hmTlzI1leWaZQcCox0Fh6VSbqb4WIFgIxc2hKkDx+1d9QIxSDC6N98V/j8vMIEUU5KXlVr3I25MYDvW1fwf+zbYo5Q9oDJWg0M7hWxxoFLv39GGrQ9MOJYIGYq5LLCFvd7s8h7s2gkCRQ0EmFycIgwt202O5SZYCoBsl6vqlqvm3pFbrzx3SliidshpR1OjNYKrq3cYTw/AZsPHuIkfFrZ7qZHALPFpGA1Q/Wa1vudMsEixL+Rrm7peEcDAuiPM1x5KKOo4f8oXmNFRa16KZ/x2k9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SJ5PPF0C60B25BF.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:22:53 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:22:53 +0000
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
Subject: [PATCH RFC v2 01/19] resctrl: De-hardcode L3 monitor infrastructure
Date: Mon, 31 Aug 2026 10:22:27 -0700
Message-ID: <20260831172245.42253-2-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::24) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SJ5PPF0C60B25BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 12f8a8b9-5c26-463b-3f71-08df07847d70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|6133799003|18002099003|22082099003|56012099006|11063799006|5023799004|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	T5msDDaB2Ca/bYI2mAV7yRyxnKIn5JN8PmTvHQ/pYp/JUqeQrP5uaHgzNMkmk3r+aFs0c5U9KCo/orgkiE9c49EDI6p/EvYAh5rXm6iz6VQNXOURBRUG9spdE6NnOUKB+4R2UBqKPbdYXWK0IKlRKzkJqtx4dYsa6DGDfsIQAZORBGHYniHetyyuGKLah/DW/R9DWTY0LsziKxPglhQBxkkF6C+1VZ8Z7Hjd284tqAY6YhWLiz834j2UlVI2NFGNfG4tmBWhUQOTFGQwQ/QltTc0LQrhmI0qYpgG83lIGfeWIfskJfFIMutsC3kp091RpRpst3bgmzBdeyJPUJbA39LEtP0wDE7o3WaKWQU2TRkJWd8FNVGW3oNM7wj3QITjE0B7dYS41K1aK0uWWg7DO4hyBaeJQ49nNkUfTd339NndrPJgzOgIW8mOsipzgl8EzP47tX6CQlotzKpDrJYkiJWQ6fyFhNZp7S1+O5izctpBwiYZb7VEMpzGsBNGNPRCbdR/TQiD/A8XEkdhORpL/XWqf2KfUkbrkRafoviajutyFxYehkcs4qod5n5f+exkpCLf4k0QJ71jWXvzxbRSZhg7G4X8UtoNxjR8QZzmoRnmdzcgoa0YzxdqTKVtIIa1Hkir2MZyd/bxnZA2J1c6n4omJRbzPTRP83+rnpmRBAJp+t7jU3Lly1FwqIZ2vCHsW3/cO6LknHHLw1+EpAeghQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/vgfxP9q//vJsDM0xJ121Hh1fAcXQJ4czIpNcpr/cscIzxp8hFgEP2kUiWyI?=
 =?us-ascii?Q?kHt7//+5uckUJ9HVlcCTKjtOPQyQBp0rA6rHkwI4N1+uH+m/qVVhBERVWYWA?=
 =?us-ascii?Q?9sRKPG+X+KeKakrATGCJx4dgJ0G9FXDrL4KTMXzmCUAVsChSHsj66f8jCIMI?=
 =?us-ascii?Q?/gOfcarYWxjkQUF0VhJ+8+owdfgved1x63xIUQi3HP8pF0L7iwFhChvfRpeT?=
 =?us-ascii?Q?KRh8XsFJVKdKYYh5b3qjI4E00jO3dYPW536A1C++nHoHrmcH0318uivLAsVX?=
 =?us-ascii?Q?LFkgV5uAKhuyhjOc+SI5mRKOWlw3E6c8Xw5bqJmc9ZbHOUwf8JbwtZyDqmJH?=
 =?us-ascii?Q?JctdEORMOtUc4AsNPZ02SoEAHAxw+ylw9AmNN5y6bGn9hNR4qn2HJ41yLqlN?=
 =?us-ascii?Q?50vZWor3/IUCXEkKjV/0zCeYqC4RSsZddDTu5n7d1nbOJ60P/NWElXz7R2vg?=
 =?us-ascii?Q?LWdvPlaj0xpFvYeoW29deN4rPt9mFscjDYgYGkVroXKKm/HDiit7YsuhnhJi?=
 =?us-ascii?Q?5+O1sazMDrPHs90oZNPlOB0gX+mYRqrWZiLq0cJ9DmNISJe0YxQtReynbb+E?=
 =?us-ascii?Q?qwFoHmE5lYjfnnaMkJZdxpYgsf2qWGVcsx9qYeyvQV2+U0tV2YF2yrFCv6qV?=
 =?us-ascii?Q?+vKn8Apz8h1lqODf4bcu6uweMbuC3dehBuXejHE3TLnjACjsVCggS8Lqc4e8?=
 =?us-ascii?Q?GKAMY50/aRzsLowOC18+M4Om4HByMpHFFe6Qr3RIGHCfgyjiJMITsgyE7ghz?=
 =?us-ascii?Q?+A6rKh88DS6CIJXG/57KEHj+tbaPpuNa6mP2wLD4lSKJSUw2UZlFpvYs7+2V?=
 =?us-ascii?Q?Jg0Io4q+Xx3iEpTj4t8CEJTNjtecxBNf0Pi3Y2iFwAoX/XDRevrx+0TRxvh6?=
 =?us-ascii?Q?vtp00PUjiVwLPqCkriewOMCh6yFYoUfIPnoiJe6NMVb2BWlsgYTZMwVXxt0T?=
 =?us-ascii?Q?ZKJ9/1IEMKgyHYCleZo4MQRYjZ1u8mOk6XL6sKCkMNru4GTT/2E8+Nyyq/2N?=
 =?us-ascii?Q?tT/P7c0m41zOaOeFQ05u9Q50I3kXOzjalnl3/LFIk6apNhJslZR5trbowyrl?=
 =?us-ascii?Q?u36il+Q0bs+33zJArcfXq+bV2EJdjnciZTdacwFEAMjG+V4G3y0wYBGCdRKh?=
 =?us-ascii?Q?tld6XRO2dDPYfdUEQaXYvnn0jPFJM7QrObOd5DGt/LiSsLfBVbROI+tst9v7?=
 =?us-ascii?Q?QZfrhbvO+Ek44+YRhYuH7vUr97EzWWsXTuJStWD2YfZN57gkru38z3qEnT3T?=
 =?us-ascii?Q?B85A5dsCXxtUXSxCxBMFb8gKesvuG21M121/gj23tQlIJlwOovOBhmJLqE0d?=
 =?us-ascii?Q?3CzhRkBfo679Bc1qOxgRBzOTsRYNsCN97EdJZMRxLawOCbSgE1yxtb2jiUNq?=
 =?us-ascii?Q?SHJCprt1OVGMgmpduVlYQ7uuNJyyNXPEZoWZLXcaJLObKvPnLgB+gRxhfWEs?=
 =?us-ascii?Q?2qevtkJ1Y5JNEIqenxfkz1/jiadYIYaa8WNW3sPKidIMmdq+T5k8hxhTYvOX?=
 =?us-ascii?Q?BhsACydh/eMuBNY0DBNee6LMZpbEOp3keJ4CMsH7x48RRlA+ckjhS51HyDCm?=
 =?us-ascii?Q?4CqAS7+blCHaoq1VwOvwzkoWrW0Owbwc1vlkqECpcVSeXfxjj3p6tAHrKUp7?=
 =?us-ascii?Q?kNfZixHRCJj4RK99KdPzFycCOvGKebBjti7vFxHytFRnITDYofOQuGKBrVkL?=
 =?us-ascii?Q?mwGFoZNlFbu39pN/gfSPkK57aa/j/yWupaN8NRvHmGAbemIoZ/aCr7ciW1NI?=
 =?us-ascii?Q?eDSPDAezzQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f8a8b9-5c26-463b-3f71-08df07847d70
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:22:53.3720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ktOvAVFi4picZRbl5dDzZp51mdqMR5ShkrZK1Ud8OeOR5w9OL0fEKWzuMFBjyOGwaq7KLUxu3a9dJPAszn2Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0C60B25BF

ARM MPAM can expose MBM counters on an MBA (memory-level MSC) resource
as well as on L3, but the resctrl monitor core hardcodes
RDT_RESOURCE_L3 in domain validation, online/offline, and assignment
paths. That prevents reusing the same monitor infrastructure for MBA
without copying large chunks of code.

Generalise the monitor layer to operate on any resource ID while
keeping existing L3 userspace behaviour unchanged:
- Rename resctrl_l3_mon_resource_init/exit to resctrl_mon_init/exit
- Factor MBM counter assignment show/write helpers for reuse
- Validate monitor domains using r->rid instead of hardcoding L3
- Allow monitor domain online/offline for any resource ID

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/internal.h |  4 +-
 fs/resctrl/monitor.c  | 94 +++++++++++++++++++++++++++----------------
 fs/resctrl/rdtgroup.c | 35 +++++++++++-----
 3 files changed, 86 insertions(+), 47 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 4bd09b1541c7..af2e6e0b2af8 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -381,9 +381,9 @@ int alloc_rmid(u32 closid);
 
 void free_rmid(u32 closid, u32 rmid);
 
-int resctrl_l3_mon_resource_init(void);
+int resctrl_mon_init(void);
 
-void resctrl_l3_mon_resource_exit(void);
+void resctrl_mon_exit(void);
 
 void mon_event_count(void *info);
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 1552ce2b4f7e..2b5654f05480 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -432,7 +432,7 @@ static int __l3_mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 	struct mbm_state *m;
 	u64 tval = 0;
 
-	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3)) {
+	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, rr->r->rid)) {
 		rr->err = -EIO;
 		return -EINVAL;
 	}
@@ -583,7 +583,7 @@ static void mbm_bw_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 	struct rdt_l3_mon_domain *d;
 	struct mbm_state *m;
 
-	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3))
+	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, rr->r->rid))
 		return;
 	d = container_of(rr->hdr, struct rdt_l3_mon_domain, hdr);
 	m = get_mbm_state(d, closid, rmid, rr->evt->evtid);
@@ -1688,9 +1688,9 @@ int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
 	return ret;
 }
 
-int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v)
+static int mbm_assignments_show(struct kernfs_open_file *of, struct seq_file *s,
+				void *v, struct rdt_resource *r)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	struct rdt_l3_mon_domain *d;
 	struct rdtgroup *rdtgrp;
 	struct mon_evt *mevt;
@@ -1735,6 +1735,12 @@ int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, voi
 	return ret;
 }
 
+int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v)
+{
+	return mbm_assignments_show(of, s, v,
+				    resctrl_arch_get_resource(RDT_RESOURCE_L3));
+}
+
 /*
  * mbm_get_mon_event_by_name() - Return the mon_evt entry for the matching
  * event name.
@@ -1829,10 +1835,10 @@ static int resctrl_parse_mbm_assignment(struct rdt_resource *r, struct rdtgroup
 	return -EINVAL;
 }
 
-ssize_t mbm_L3_assignments_write(struct kernfs_open_file *of, char *buf,
-				 size_t nbytes, loff_t off)
+static ssize_t mbm_assignments_write(struct kernfs_open_file *of, char *buf,
+				     size_t nbytes, loff_t off,
+				     struct rdt_resource *r)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	struct rdtgroup *rdtgrp;
 	char *token, *event;
 	int ret = 0;
@@ -1877,6 +1883,13 @@ ssize_t mbm_L3_assignments_write(struct kernfs_open_file *of, char *buf,
 	return ret ?: nbytes;
 }
 
+ssize_t mbm_L3_assignments_write(struct kernfs_open_file *of, char *buf,
+				 size_t nbytes, loff_t off)
+{
+	return mbm_assignments_write(of, buf, nbytes, off,
+			resctrl_arch_get_resource(RDT_RESOURCE_L3));
+}
+
 static int closid_num_dirty_rmid_alloc(struct rdt_resource *r)
 {
 	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID)) {
@@ -1916,40 +1929,21 @@ static void closid_num_dirty_rmid_free(void)
 	}
 }
 
-/**
- * resctrl_l3_mon_resource_init() - Initialise global monitoring structures.
- *
- * Allocate and initialise global monitor resources that do not belong to a
- * specific domain. i.e. the closid_num_dirty_rmid[] used to find the CLOSID
- * with the cleanest set of RMIDs.
- * Called once during boot after the struct rdt_resource's have been configured
- * but before the filesystem is mounted.
- * Resctrl's cpuhp callbacks may be called before this point to bring a domain
- * online.
- *
- * Return: 0 for success, or -ENOMEM.
- */
-int resctrl_l3_mon_resource_init(void)
+static void resctrl_mon_resource_init(struct rdt_resource *r)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
-	int ret;
+	unsigned long fflags;
 
-	if (!r->mon_capable)
-		return 0;
-
-	ret = closid_num_dirty_rmid_alloc(r);
-	if (ret)
-		return ret;
+	fflags = RFTYPE_RES_CACHE;
 
 	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_TOTAL_EVENT_ID)) {
 		mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID].configurable = true;
 		resctrl_file_fflags_init("mbm_total_bytes_config",
-					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
+					 RFTYPE_MON_INFO | fflags);
 	}
 	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_LOCAL_EVENT_ID)) {
 		mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID].configurable = true;
 		resctrl_file_fflags_init("mbm_local_bytes_config",
-					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
+					 RFTYPE_MON_INFO | fflags);
 	}
 
 	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
@@ -1967,21 +1961,51 @@ int resctrl_l3_mon_resource_init(void)
 									    NON_TEMP_WRITE_TO_LOCAL_MEM);
 		r->mon.mbm_assign_on_mkdir = true;
 		resctrl_file_fflags_init("num_mbm_cntrs",
-					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
+					 RFTYPE_MON_INFO | fflags);
 		resctrl_file_fflags_init("available_mbm_cntrs",
-					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
+					 RFTYPE_MON_INFO | fflags);
 		resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CONFIG);
 		if (r->mon.mbm_cntr_configurable)
 			resctrl_file_mode_init("event_filter", 0644);
 		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO |
-					 RFTYPE_RES_CACHE);
+					 fflags);
 		resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
+		resctrl_file_fflags_init("mbm_assign_mode", RFTYPE_MON_INFO |
+					 fflags);
 	}
+}
+
+/**
+ * resctrl_mon_init() - Initialise global monitoring structures.
+ *
+ * Allocate and initialise global monitor resources that do not belong to a
+ * specific domain. i.e. the closid_num_dirty_rmid[] used to find the CLOSID
+ * with the cleanest set of RMIDs.
+ * Called once during boot after the struct rdt_resource's have been configured
+ * but before the filesystem is mounted.
+ * Resctrl's cpuhp callbacks may be called before this point to bring a domain
+ * online.
+ *
+ * Return: 0 for success, or -ENOMEM.
+ */
+int resctrl_mon_init(void)
+{
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	int ret;
+
+	if (!r->mon_capable)
+		return 0;
+
+	ret = closid_num_dirty_rmid_alloc(r);
+	if (ret)
+		return ret;
+
+	resctrl_mon_resource_init(r);
 
 	return 0;
 }
 
-void resctrl_l3_mon_resource_exit(void)
+void resctrl_mon_exit(void)
 {
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 416b73c57016..a658e4958562 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -5102,10 +5102,17 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
 	if (resctrl_mounted && resctrl_arch_mon_capable())
 		rmdir_mondata_subdir_allrdtgrp(r, hdr);
 
-	if (r->rid != RDT_RESOURCE_L3)
+	/*
+	 * The remaining teardown operates on struct rdt_l3_mon_domain, which
+	 * only backs the L3 and memory bandwidth monitor resources. Other
+	 * mon_capable resources (e.g. the package-scoped RDT_RESOURCE_PERF_PKG)
+	 * embed a smaller domain struct, so casting their header here would read
+	 * past the allocation.
+	 */
+	if (r->rid != RDT_RESOURCE_L3 && r->rid != RDT_RESOURCE_MBA)
 		goto out_unlock;
 
-	if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3))
+	if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, r->rid))
 		goto out_unlock;
 
 	d = container_of(hdr, struct rdt_l3_mon_domain, hdr);
@@ -5135,7 +5142,7 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
  * Called when the first CPU of a domain comes online, regardless of whether
  * the filesystem is mounted.
  * During boot this may be called before global allocations have been made by
- * resctrl_l3_mon_resource_init().
+ * resctrl_mon_init().
  *
  * Called during CPU online that may run as soon as CPU online callbacks
  * are set up during resctrl initialization. The number of supported RMIDs
@@ -5209,10 +5216,18 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *hdr
 
 	mutex_lock(&rdtgroup_mutex);
 
-	if (r->rid != RDT_RESOURCE_L3)
+	/*
+	 * domain_setup_l3_mon_state() and the workers below operate on struct
+	 * rdt_l3_mon_domain, which only backs the L3 and memory bandwidth
+	 * monitor resources. Other mon_capable resources (e.g. the
+	 * package-scoped RDT_RESOURCE_PERF_PKG) embed a smaller domain struct,
+	 * so skip the per-RMID setup for them and only create their filesystem
+	 * directories.
+	 */
+	if (r->rid != RDT_RESOURCE_L3 && r->rid != RDT_RESOURCE_MBA)
 		goto mkdir;
 
-	if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3))
+	if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, r->rid))
 		goto out_unlock;
 
 	d = container_of(hdr, struct rdt_l3_mon_domain, hdr);
@@ -5361,13 +5376,13 @@ int resctrl_init(void)
 	if (ret)
 		return ret;
 
-	ret = resctrl_l3_mon_resource_init();
+	ret = resctrl_mon_init();
 	if (ret)
 		return ret;
 
 	ret = sysfs_create_mount_point(fs_kobj, "resctrl");
 	if (ret) {
-		resctrl_l3_mon_resource_exit();
+		resctrl_mon_exit();
 		return ret;
 	}
 
@@ -5402,7 +5417,7 @@ int resctrl_init(void)
 
 cleanup_mountpoint:
 	sysfs_remove_mount_point(fs_kobj, "resctrl");
-	resctrl_l3_mon_resource_exit();
+	resctrl_mon_exit();
 
 	return ret;
 }
@@ -5441,7 +5456,7 @@ static bool resctrl_online_domains_exist(void)
  * When called by the architecture code, all CPUs and resctrl domains must be
  * offline. This ensures the limbo and overflow handlers are not scheduled to
  * run, meaning the data structures they access can be freed by
- * resctrl_l3_mon_resource_exit().
+ * resctrl_mon_exit().
  *
  * After resctrl_exit() returns, the architecture code should return an
  * error from all resctrl_arch_ functions that can do this.
@@ -5468,6 +5483,6 @@ void resctrl_exit(void)
 	 * it can be used to umount resctrl.
 	 */
 
-	resctrl_l3_mon_resource_exit();
+	resctrl_mon_exit();
 	free_rmid_lru_list();
 }
-- 
2.53.0

