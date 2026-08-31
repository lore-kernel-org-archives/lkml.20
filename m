Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461A6485CD5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196983; cv=fail; b=TYAJWyxF595pGJ4St3OUIqiC4nVdUKSgLgYbzcGsFClqW7gViNpaaNvlbnFDQixcBCeMAd/p/pXlEH6uUbzGLQX34C1t+npWyRSC0JWgY8rbIr8xXSFPsdeJSH42582cfBL8uv71nGHRAjJ/moEX5DFR7Br/wwZtefIuUyhT8Rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196983; c=relaxed/simple;
	bh=SJgXDDGQBoVmZq+sLn3+fhFv92YYTixI3BK4aSpWGuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HpkN6VzuMUuEppySCXlJiWdg8/2910x+NwVrM8wRhGCkKXgf4ne1VmJAzihLOptB3O22jUeEsdw46WNEk15ztpu7Jn1zgI/HZvDC038aaWLgbdkdCqVg3AmiiYza2yz4LrsIXwL28ebgc98cxT7Ven0ZYliF8PudoMrPb7Oqe3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YI77Z9PB; arc=fail smtp.client-ip=52.101.48.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YI77Z9PB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGe5nFVV8mIigl8GXaQesHSV6pAj3Hb7AEqT7FC7FTfA/aBbo3JNN8/MPD3Bv8ZK0rsNoCuvrwxwSIQjohAnXTmow1xIkD/Qik2phPhm6rjuPHFp+MoYoir7o46/ZZSPAZcG4cJifOf7966K7AumBuj0AYz5NGpxigWMaAqi+BqVHB+ecgNlegGrrx6lKXywVouwgp4s8k3Yb8yAETQi3UQ9Z8TQ+Ixc1XY7lMWqP737mz1gvNkf7kUC5/0g0qq2Y6HnZc8Mf9IQoDWFI//QcU8U61sBrPVYeJROq5pxb1Dra4kPvhUpeVz6H06Eej+8ZkhsCQwdaRcovQS5XKPwOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWCZi14bd6MqV2i+IPx+LFFB4DzXvBH16bu3FKsS5zY=;
 b=oZLqsjDggn9YZkrTGLlI6IJCEb8obTMqUOuzWvm3XlMWTFhD8lUn42Ye3qzh9PFDHR1DQ3IOt8fhz+yPQcOHs2Sl8rRYTwhzKf+OEikn4BdxuUWDfilDogI5gi+Ca0TG9JFKSwtMPTHJ0zrhxAGVip3jGzhW+c7FtRQDe9cJmKzF4nT34lf2/pVJSMsTzvzZ/zVkuucC7coEAXdxAdat3ZWPe522700F05C6wsbZEOHnHRmyiWHiSrlmgs3M4UUSrSc+H+e+XNUxrsKxOfTOOu4bJj+1U+E2ZY+yvOHxgN+xBPkHfyX277tTnXGvkuHVgbP/SidlWR6OhVhn22ZiZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWCZi14bd6MqV2i+IPx+LFFB4DzXvBH16bu3FKsS5zY=;
 b=YI77Z9PBELl4WWdSHp1ANv1lveUDh7RsrViV04MLlKaxA3i9Hpgr3zEtWX6PXC9EJs1v5Nc4vgBm+JGNlFT8ZAqT3w2kkPQCSZmz3loDyL0E3UWHo6B0fTLeQuBT/fsZJEzjJgpix6pibCYxA5MEEQtjabLJzwIJsYsFjklZyJpx2RIhGf9nU5uQemaGwWO2eB+fCmtDbjY3ELINxiXeZjuvh0rnCsNz5dNSkrEl5p6HAl5f1rm40npI+CSkjYkhdh4UfllcuSFqRaFvtM5Sqpa9xKm2Zfi6t/vvjFDRXgm78JOVYcb7warErayxeEvXssH0wh190AvzDBCq4lR+4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SJ5PPF0C60B25BF.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:22:55 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:22:55 +0000
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
Subject: [PATCH RFC v2 03/19] resctrl: name node-scoped monitor domains mon_NODE_<id>
Date: Mon, 31 Aug 2026 10:22:29 -0700
Message-ID: <20260831172245.42253-4-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:a03:331::11) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SJ5PPF0C60B25BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 96525de5-9a20-4fad-3944-08df07847ee6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|18002099003|22082099003|56012099006|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	ZFvBUojM57A8nP3gzy0J6NO5Vb+H9j51CBzV7atyfcFAZDOsUqYS1Tn/RE9U5QO7cRVYl70dHDXjzE4o4WZp0GzRNYVXUnny0FkvFjAvDS1YdwLQ5OpKT5Oj41/VCv1ZW8hv4dOBFNdOV181uSjJOWl6PXhWK3j8dtLLWAC9izpC3JnzljkMMNgun6+xoRhHq5GH7Xf71U5pau/N5AmodsB3oFZSQh9RK5RSsRYfGF6nuCc2J4iyYOJ3dFIlOv7QRPDaXcY0Ks12Tgohf9DcagAVt3NaVSXLsSkCTZO3+uv78Q0IFF/zYOH/Y+LuHdyD2q3IBowUZV9EQK0qiJWy6YiW1j9ALhhHk6miweQivrs1tZv+XTsdOlhqW72hFpRCfBblqraq3Z3OoKYKrVGLMqCZmGm2fQxIy5iJFH0AjHc7yW2CBBh79gGKHR32TxqkCfvrQCJxciFR5eljluoYOkLVK+P3EXgv1CCleBxvnuIoT5+91DE0EJdvyU5wwqPRXhcTLAR6Eoz9IPTx+jLqa3ql0IB4bbPNAqbCugZ2p/wYJfUsgjG/1WpKB60KzJzaeA4hyhA29Tl9rDigZblHigavVxMZClPdv9uTXN97PZlOPKIIg3GUV4exiseI6idP5TQJrAn50Lu/EBv7iSCNnofSzTWEdZPu/iU3HLEaPIPwdBMr9n++oyuy6nN4XsbceYPEPWyCm8GjcyW1Q7n2Ww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dpII3fI2rdf6884ZpAevhBmbjAxx/5w0ARr7UfkqkwUu5npDOoex1ACqTE45?=
 =?us-ascii?Q?h3KPVnkXsWj7iBc0O5SQi1g4pp3pGr0pCaHyimdq5nMJQAqKCjCc3eApoC34?=
 =?us-ascii?Q?mTs7boxtRrSwdevDG7Y2GDPeV0NhvhQGswirDSD/+gedCYQ5eoq0fONNXFOc?=
 =?us-ascii?Q?lsbthj78vn0z3pgDfSQHlXsq9YvmSFp9/vJ1ZzKvIXu2CxZCvMnkQ4Il8RQe?=
 =?us-ascii?Q?JLVGzEVHbzRYt5z3UKWqROt+yOtxpK3Z43nCDkoYfi1W1QUqQkVB+mV+hcOj?=
 =?us-ascii?Q?6CINeS4bOfWJ7hBlboHhhe4jQUroYT5IWs3345/sM7iHBUNH//TB/pqlRuTE?=
 =?us-ascii?Q?kydeIxC2S332eL1iQPU/kBEo64U4A4ZqVEGJ2ZbfTzD4drppNFiYrxtjW88N?=
 =?us-ascii?Q?ZRGhiDMDkJcZZuEsY+IgW6MAqNB/LlPE2Zw9TmHhYwShw/B+ji9i0s+gloag?=
 =?us-ascii?Q?Rb4Zy+MIHNVi8ZdO/mKF8dFzQ+GSDmGnCGjRWnDG89pT4uIp7QFCE0BVE5Az?=
 =?us-ascii?Q?uJ8uqyGy06Ay7qHSmM5EqNtEJbfb0G9BTXnel5FKeRmVo9qQ0STPCoXxtCm6?=
 =?us-ascii?Q?JNnohMyqWvV2m+8UdSAq69OQ2CQVioHV8FT0ayZYIdSozrOhkJo2ZpgJgABQ?=
 =?us-ascii?Q?ItmMxzHYcHhUDymqSfvM6gyCGFZ/fjpoztAzhXMRnQUiZ8wiMQOMc5pE82+h?=
 =?us-ascii?Q?GIDOi9aHrAn1XadcKcy77MKibdpZG0htMWQAoYeC9aVdglhBm/DDDL/B0Z6d?=
 =?us-ascii?Q?t1vKu5hybzvMqw1e1hguFqJpFuEsW3sKpexrKsvfzGr68Gl/jLE8zHO1XLey?=
 =?us-ascii?Q?/9Dy8wKPm5NuPrd/rc5uCsLKEZVcP/X5zX/CnNgtaRZCG7GWTMU1n+4vZG+V?=
 =?us-ascii?Q?NNgn8c5I9fLrxtRcch1VlpJYv49Tz2RqpjZJOPn86XOba0EQsIXWX4AbK7vT?=
 =?us-ascii?Q?WQqZQjSC886wpiZpq/0cKfXtOWWUgZc6Z/fQyIy1Gra7AOTQ4rUyhPxgYE+E?=
 =?us-ascii?Q?8wcg65ihNjauIwFoJZpho9bVcc1MzYTf1WXvrRhu0SL48janrBOmuJaofqNN?=
 =?us-ascii?Q?FPz7biiCUTBboHtCrhrRqC9fu3LItqxp9HA7Hu9lDU8z6UPYZFLCtNoC0ro2?=
 =?us-ascii?Q?cTqNdy5FAHI/n3tDQF+0D2eztcM4VD/1IRffG1HGMImx2bBlMsqU0F90S7lZ?=
 =?us-ascii?Q?wRIXwBKd5ZXpUczMrSr3aPDyGinduA3sNQW95zURfRog1iOsKv3Z08vpbZ8l?=
 =?us-ascii?Q?MazTXj4G6Po+UMk58Bf5e0MLOCNnou+Y+l7eslPedK0IN8Pc+uptCSmHAktx?=
 =?us-ascii?Q?u/5kNhHMN5HaLxEWfTgSj5fBFj/NJgluuzRdaj15kAztFHA3Ok9mO9EHDKKl?=
 =?us-ascii?Q?+/TERvC4Utgv4evlekGF6/rcWjM84k2DziEpEpnNcJUXnXQRpz8725m2PHzA?=
 =?us-ascii?Q?O1qdLoD2H6e+u83WTt42gmSDWaVhTLcAK+lwCl1ldXgqO1gWYm1BInpVJ5BC?=
 =?us-ascii?Q?VoEannqEPHxP+G6XAgX5QTXuddnDIvtIfRmRsEpKVtFmNJywe35TFmDa3g2/?=
 =?us-ascii?Q?Qm2rpIFHC3xFkUnZF2dMG5d4inw9KXapzcH+oSQGVoRZOEb0evLQtM2aqp0O?=
 =?us-ascii?Q?zrmPKu+rwQL4MP+ZzCr5jUoWjoylgTXfUxxKbK9QKz71G7SFSXFUVn7MjdKe?=
 =?us-ascii?Q?NnJu5+jjOm86OoYyEZVyB8NkMeGHTSz9DEc+/jx+ObTlrnwdf1gjFCNSSsHy?=
 =?us-ascii?Q?3AUBELaIYA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96525de5-9a20-4fad-3944-08df07847ee6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:22:55.7283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Ek9vc6a+R2warcewppf2bt1oMlUF0/4WJPY9TR/8tkqy4HPiGKlTHSzAhPW17FSg5RnEUtZVrXq+CGTs/TWNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0C60B25BF

Monitor domain directories under mon_data are named mon_<name>_<id>,
using the resource name as the label. For memory bandwidth monitoring on
a memory-side MSC the domain id is a NUMA node id, so labelling those
directories with the resource name ("MB") is misleading about what the
id means.

Add the RESCTRL_NODE monitor scope and a mon_domain_name() helper that
returns "NODE" for node-scoped resources (and the resource name for all
other scopes), then use it when building and removing monitor domain
directories. Node-scoped monitor domains are now named mon_NODE_<id>,
making it clear the id is a NUMA node id. L3 and telemetry naming
(mon_L3_<id>, mon_PERF_PKG_<id>) is unchanged.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/rdtgroup.c   | 25 +++++++++++++++++++++----
 include/linux/resctrl.h |  1 +
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index a0635888a0a0..264666e54852 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3967,6 +3967,20 @@ static void mon_rmdir_one_subdir(struct kernfs_node *pkn, char *name, char *subn
 		kernfs_remove_by_name(kn, subname);
 }
 
+/*
+ * Label used in the mon_<label>_<id> monitor domain directory names. Node
+ * scoped monitoring (for example MB on a memory MSC) uses "NODE" so the id
+ * is understood as a NUMA node id; other scopes keep the resource name
+ * (L3 -> "L3", telemetry -> "PERF_PKG").
+ */
+static const char *mon_domain_name(struct rdt_resource *r)
+{
+	if (r->mon_scope == RESCTRL_NODE)
+		return "NODE";
+
+	return r->name;
+}
+
 /*
  * Remove files and directories for one SNC node. If it is the last node
  * sharing an L3 cache, then remove the upper level directory containing
@@ -4010,7 +4024,7 @@ static void rmdir_mondata_subdir_allrdtgrp(struct rdt_resource *r,
 		return;
 	}
 
-	sprintf(name, "mon_%s_%02d", r->name, hdr->id);
+	sprintf(name, "mon_%s_%02d", mon_domain_name(r), hdr->id);
 	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
 		kernfs_remove_by_name(prgrp->mon.mon_data_kn, name);
 
@@ -4114,7 +4128,7 @@ static int mkdir_mondata_subdir(struct kernfs_node *parent_kn,
 	if (r->rid == RDT_RESOURCE_L3 && r->mon_scope == RESCTRL_L3_NODE)
 		return mkdir_mondata_subdir_snc(parent_kn, hdr, r, prgrp);
 
-	sprintf(name, "mon_%s_%02d", r->name, hdr->id);
+	sprintf(name, "mon_%s_%02d", mon_domain_name(r), hdr->id);
 	kn = _mkdir_mondata_subdir(parent_kn, name, hdr, r, prgrp, hdr->id);
 	if (IS_ERR(kn))
 		return PTR_ERR(kn);
@@ -4169,8 +4183,11 @@ static int mkdir_mondata_subdir_alldom(struct kernfs_node *parent_kn,
  * This creates a directory mon_data which contains the monitored data.
  *
  * mon_data has one directory for each domain which are named
- * in the format mon_<domain_name>_<domain_id>. For ex: A mon_data
- * with L3 domain looks as below:
+ * in the format mon_<domain_name>_<domain_id>. The domain name is the
+ * resource name for cache and telemetry scopes (for example "L3") and
+ * "NODE" for node scoped monitoring (for example MB on a memory MSC,
+ * where <domain_id> is a NUMA node id). For ex: A mon_data with L3 domain
+ * looks as below:
  * ./mon_data:
  * mon_L3_00
  * mon_L3_01
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 54fec07bd173..f2c3621b006e 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -349,6 +349,7 @@ enum resctrl_scope {
 	RESCTRL_L3_CACHE = 3,
 	RESCTRL_L3_NODE,
 	RESCTRL_PACKAGE,
+	RESCTRL_NODE,
 };
 
 /**
-- 
2.53.0

