Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947734ACC99
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197010; cv=fail; b=CX50mpMCRVX4wMekHoZcigjF7FtGkRW+2o+zWWR8BF2E8aro+/vneu3NklEggH1wRhTz+tJ7FYDno4vqtPNggvHGhcKVUxJGFxJWwUlDPFXHQDACZuFaia6RmsmhUaNISlFQu/MhzDa1lzAfWJ7AGR9I8f5WuFhhPbkNFLdOKmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197010; c=relaxed/simple;
	bh=zgZ7GR+cWbiNfcu1xcsnASm44FFqtjBVfAWXWPGJ/Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XDEtnEH9iPDNFQs7nAjyGQ0pCXC3lrDXtom//YxAn6E7T8deHvyj0uel32+oqHzBPzLzVz8DTQ/hWtjILq3iTESsWCzlVB4wVpmPd08+OWOQ2NCfGBLZS1Tp6jKz0BjLChfHJVysqUxd+1P3dLwSQvqnhJLIi39aLTLIRrxmXq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eZ9EpstU; arc=fail smtp.client-ip=52.101.48.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eZ9EpstU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxOZugoK0GNS2dD+R7B6r8lM1Rz2dI9/hUD7TjKME21uXw8RIQZbj51zvdkF2sbqhCodUgiftU3ukGE9S05IPT2kNhHxd08KsO231RJZquh+bxse7tx4WNNlnk7iXwAjaOtzmT8935786dgIBODG4QPUxtW/ldmdtWkxCYdJTey45yj3ERFcD4/OX7o0D4o7cDaMEu0nr4uQCE132Hz/F1I35aiFky8K2Swj5yVehrNORInv02gXdZEYH0ndlPXwBbm04R+35d750xgPP9hgo4RWcoYpZ9YQxBxQnQ51/R9Oj6YP7hC6njubzNjp7gzudjwhBP8mPYqmmU8tHP9a8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwyJ3iw7ZumnBEMQ/VhKh+qWU9899H1NfwnXdmID5CM=;
 b=VU5DgKB7PTZegcgq+ZsuwbJ6kpZjHQFfLhURdl0Thqp2/6rSoTPGOxPyW48xgFGcLNRqy39RUAaLDLYbDmsy3b+9YNivJ6QcnhYYlUakfOAKrZZd1ezc0HRbR3QDWigIlNJ2xN2NxmVlX1LZl2TXcOmdf1j98AC0vNHpr229ZfMXVBBvrB87kBGeBHgI5kgN8D4daCvwxgU7QMyZ6qqA58tR2ULuKcojTZCF6QmC1sBdfFcZpMjKgGitZuhIJntFYtijl9J00zQ3MsHsVQFmcolCeYIKRgGfCOLjr3iDaVw43ZlxOr2GjBXx8jzreBCGFVi3OXZLSW/WEZlrBKwxgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwyJ3iw7ZumnBEMQ/VhKh+qWU9899H1NfwnXdmID5CM=;
 b=eZ9EpstUqa4Or+VeLu7YJZpVUNhld63zSIfLz0YLqeqx0Q+z4Q1waHFCFf4uKZ+42eiGyVIXSOhhzYy6wXw8dSxfykr9h8dVibt2I/jOHCoE95FhG20gFQk1c7Wfs4uXe1vMPq4rl/ArnGpgPoYFznquQbgfKFGEtFrJH7qkqFteFSQbaayDF5dk4WTIUE80mF2ZtTUY/64hcG4Kvcb1Ega2mn8wnyjP+ET2oyuL/hDk7/k1dpGNMWi1QI3x4E37j3DgLN+FfzQOkYEXEZU/rrRzIOYLhCYF86N6vebKTBsacLYLy4BV9cXMN2kEKxUKizyzP2yhuZj19+vv3Mv+Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SJ5PPF0C60B25BF.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:23:08 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:23:08 +0000
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
Subject: [PATCH RFC v2 12/19] arm_mpam: resctrl: Add NUMA node notifier for domain online/offline
Date: Mon, 31 Aug 2026 10:22:38 -0700
Message-ID: <20260831172245.42253-13-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0125.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::10) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SJ5PPF0C60B25BF:EE_
X-MS-Office365-Filtering-Correlation-Id: e2468446-eb46-4817-b8a5-08df0784850e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|6133799003|18002099003|22082099003|56012099006|11063799006|5023799004|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	ba1cx9DqijSpNKWlZyHZ2qZZUSXpW1tbOA+Fw0iDybNOnG6qIeQ7p+KULEoQbUaFlyXzQMzaUTde+/txiJn4nVK6jgOFThdh6EK0SN49aoGJA7dZdYSMomDnqL+HWBIb1dGelNR1eoM6TrJGVvPNHmqqw/2ZspYbhBIBj6XEw/pKse7yyhh+8Pm4rd3gmMJVgIA92OgLmHF2RHLNSZCGJPFIIHN4rXhS5kzI+3oh7STj9DhRk4vMSrAyPGimg+jMJLSFCkm4ADleTH++vA4+LcTB+H198I6JE+CtliWJq0YA6G/owceKnNdHsK11VHPz8fjxefBkrAJncqJ0qLCELeYnBf7o7JII4YKCYl5XUVRF7F07orPvBpRizwZbDMpZBzeh+PO+ueSP7N/dPfAJTKUKLOX4K+rqjidj1uAlDiAtaSBEuaOR/3dRN3l5cvh4SGp/bIzlbhdp5NghldbmMkfXba0MVhYWY5HaLjSVKZIp2ujeNkXenp7erfvwqGnRW4nWA1EufB4p58hKcld7gJto+JBTvyARBmU8W5rYVPGLd0oT3GWS3cVZvAdB0v0LkYgbDMBXKZmGJug0QOMxcYqeIl2RDSJcPOEf10CiLe3LrTaZtuQMlHpcJP0lLhUzJ6B98tmzjRHsn6EsuK7utZ1DgRwbXCfKim4M6KuebVgIs/Fsu5tqyKNZE6Ib5mk421VsKU6lxSidcKXr1cl2ZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/5bTe51MSvaDmGGSDMFcyxGD9uA+EFWimID2IZQm9IRmAqgHJUV3ykXNvYUA?=
 =?us-ascii?Q?JrkXeuEYAtnaFjiNmtVe7EcO6LiI42Rnu4ym1jImqzF7Zyd/WyXRVtVGSX7r?=
 =?us-ascii?Q?Yi6jtTsGKv960R/aUQxwyb/uxVqNFrW6sI5KAvnEE9oyK+pCocFgaCLR6okE?=
 =?us-ascii?Q?LuORHd5nRDPQwhsvEQ8bdDHBtnt3FqocyL0dSzFx6TNsYaa1ptWlRaoLlQoL?=
 =?us-ascii?Q?NZXENy2XIiVYjjA9sqJzIFV0WpMwckSb/swNkwJlSa3euXdnqgXBnmR3fzNR?=
 =?us-ascii?Q?QEfH6vHrq05v3mSva+C3r7WhgYV/wH6puZUv9yAaRKmPmrHd9mcx6W92suwS?=
 =?us-ascii?Q?PFJFMCmpCLaXodfdL6nMy92B/nQsXAnWrhqeLICVtPVDpGwVnM/UepaZC/P4?=
 =?us-ascii?Q?5gzqu+cbTe20Gef3QzZ0SBjnegOXrXuerNc4blYyMkN7NKd3PhZQU+jg1CSn?=
 =?us-ascii?Q?8ajIUpYgC4Om/LaWb2S3xKBDBeDzwRQsbbuYXdZcRebXwVGxFa3ZOD06bjcr?=
 =?us-ascii?Q?hrDqNYSjKnUx0DMDIHfkk+2/D9CiqGgi1b38RWTdnercRA3LD9Q//xnieQHD?=
 =?us-ascii?Q?3ylbpsVeGHTSMqwEavC6n7Wve1EPhzHnCVNO36ZtxgNXhyMIhX91isvZOCPA?=
 =?us-ascii?Q?BwqUf+jDR08Xpl8rURjRU7d7Tym/O4HaCObj0w1mKFZfV13aHq8fPyqixM9M?=
 =?us-ascii?Q?Rjh7Nznj/8HRV3IVOCSMiw07y79q38ENx8Ty2QmahyMN6EzzO3Ar2m3ZvneI?=
 =?us-ascii?Q?Wengbex0ID9UKnijBRs1URFajDU47caIBjS2WFR7REWQcszKhpAZJc/3ZLhq?=
 =?us-ascii?Q?ct7OS+GCH6GF2XPvqwz+GjWWlhWYxcgh+uA3ZjQC5D6M95ed42obfeXCnQMb?=
 =?us-ascii?Q?a2cIK+l4G6CuKzTbLv6UtDbT3mGFwbtUfcrdVfWAbA1lCc0z5/f0JBdrth3Z?=
 =?us-ascii?Q?5WULcpT8W1VoUT2x1/UHWTcFBLD8sEzrkXNnMpzulf8nLhc3YrA4iil8W0LM?=
 =?us-ascii?Q?vDYoq82YEYJEGgZarlDY3T7w0/bHzV0Hs6FnpybYIiJ0x4GZ97AHBdXPGyhW?=
 =?us-ascii?Q?g95Ipu6tqFFT51T8cgKt51nuvP91NyDZpKi+IKuBmSREUEiv7cXFFyTVQuKh?=
 =?us-ascii?Q?R7mENAuDRx9/i3t61rgEWz2Az2oQM6+zNp+70Dp2ARovMh8SMBN7E/3u0hHd?=
 =?us-ascii?Q?2+rZ67MZjdpksSRwpxG1FCfdaH3eSAxZKVFZuqMxv/tqC4T649ccXlGeyrMH?=
 =?us-ascii?Q?sGCrdLU0ySaT3EbWZlGsQg5JDAkQiagkYPEdBHKumRd4IB0xsqP+Jcsq2DTW?=
 =?us-ascii?Q?Ypy2bSwVrFgMW5ryMWPkSYqx6cR1RG1Jufsi4zcmQGkAhg/p7186ve49/Bal?=
 =?us-ascii?Q?FRBgvcp33lahGZLTnXqg9L9SrE8/OE9xVJZYKMvXOG8Bj0idJFmZPKU/0mwg?=
 =?us-ascii?Q?ceYnKrzcBSMw8u9DYyvV+brY3vza+Exr5i3xBenHvdOSlixA2ukdjI0c8P+E?=
 =?us-ascii?Q?kme9gqvG0gEfS8iq2DKUwYWN6Sy0BvjEAWP24tAmY1Fj7YpNOqGwYDKI2gyN?=
 =?us-ascii?Q?Q98PyHpERtHas2X57PYvGrbBCPqCMjJxiloVgK93Eg2AHWgJnh3fo1iNS7Q0?=
 =?us-ascii?Q?qapXOt+8PdvbjaCNQgajbV7TedkHmSP6dhnU0YpXfZtZchAnxXVplIEL1FQC?=
 =?us-ascii?Q?Y8biTNYDqzwxQ730FvrirOXLL/qBWOsfVsam+gZq51j+L1QM0UnOAzkiix4O?=
 =?us-ascii?Q?OmkeSgPGEQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2468446-eb46-4817-b8a5-08df0784850e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:23:06.0733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jXHCZsxtPFFjjJQCoD4NJftd5hXzB566ECmp94cr07juBRMFEC08SqHA4ztaM67vzgDH+QCqhDNqqXSWbF1vYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0C60B25BF

From: James Morse <james.morse@arm.com>

To expose resctrl resources that contain CPU-less NUMA domains, resctrl
needs to be told when a CPU-less NUMA domain comes online. This can't
be done with the cpuhp callbacks.

Add a memory hotplug notifier, and use this to create and destroy
resctrl domains.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_resctrl.c | 343 ++++++++++++++++++++++++++++++++-
 include/linux/memory.h         |   1 +
 2 files changed, 337 insertions(+), 7 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index cd9bebf5f0c2..8bb313efc716 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -11,6 +11,8 @@
 #include <linux/limits.h>
 #include <linux/list.h>
 #include <linux/math.h>
+#include <linux/memory.h>
+#include <linux/node.h>
 #include <linux/printk.h>
 #include <linux/rculist.h>
 #include <linux/resctrl.h>
@@ -1775,16 +1777,25 @@ void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
 	mpam_reset_class_locked(res->class);
 }
 
+static void mpam_resctrl_domain_hdr_init_mask(const struct cpumask *cpus,
+					      int id_cpu,
+					      struct mpam_component *comp,
+					      enum resctrl_res_level rid,
+					      struct rdt_domain_hdr *hdr)
+{
+	INIT_LIST_HEAD(&hdr->list);
+	hdr->id = mpam_resctrl_pick_domain_id(id_cpu, comp);
+	hdr->rid = rid;
+	cpumask_copy(&hdr->cpu_mask, cpus);
+}
+
 static void mpam_resctrl_domain_hdr_init(int cpu, struct mpam_component *comp,
 					 enum resctrl_res_level rid,
 					 struct rdt_domain_hdr *hdr)
 {
 	lockdep_assert_cpus_held();
 
-	INIT_LIST_HEAD(&hdr->list);
-	hdr->id = mpam_resctrl_pick_domain_id(cpu, comp);
-	hdr->rid = rid;
-	cpumask_set_cpu(cpu, &hdr->cpu_mask);
+	mpam_resctrl_domain_hdr_init_mask(cpumask_of(cpu), cpu, comp, rid, hdr);
 }
 
 static void mpam_resctrl_online_domain_hdr(unsigned int cpu,
@@ -1805,12 +1816,12 @@ static void mpam_resctrl_online_domain_hdr(unsigned int cpu,
  * indicating the parent structure can be freed.
  * If there are other CPUs in the domain, returns false.
  */
-static bool mpam_resctrl_offline_domain_hdr(unsigned int cpu,
-					    struct rdt_domain_hdr *hdr)
+static bool mpam_resctrl_offline_domain_hdr_mask(const struct cpumask *cpus,
+						 struct rdt_domain_hdr *hdr)
 {
 	lockdep_assert_held(&domain_list_lock);
 
-	cpumask_clear_cpu(cpu, &hdr->cpu_mask);
+	cpumask_andnot(&hdr->cpu_mask, &hdr->cpu_mask, cpus);
 	if (cpumask_empty(&hdr->cpu_mask)) {
 		list_del_rcu(&hdr->list);
 		synchronize_rcu();
@@ -1820,6 +1831,12 @@ static bool mpam_resctrl_offline_domain_hdr(unsigned int cpu,
 	return false;
 }
 
+static bool mpam_resctrl_offline_domain_hdr(unsigned int cpu,
+					    struct rdt_domain_hdr *hdr)
+{
+	return mpam_resctrl_offline_domain_hdr_mask(cpumask_of(cpu), hdr);
+}
+
 static void mpam_resctrl_domain_insert(struct list_head *list,
 				       struct rdt_domain_hdr *new)
 {
@@ -1835,6 +1852,23 @@ static void mpam_resctrl_domain_insert(struct list_head *list,
 	list_add_tail_rcu(&new->list, pos);
 }
 
+static struct mpam_component *find_component_nid(struct mpam_class *class, int nid)
+{
+	struct mpam_component *comp;
+
+	if (!class || class->type != MPAM_CLASS_MEMORY)
+		return NULL;
+
+	guard(srcu)(&mpam_srcu);
+	list_for_each_entry_srcu(comp, &class->components, class_list,
+				 srcu_read_lock_held(&mpam_srcu)) {
+		if (comp->comp_id == nid)
+			return comp;
+	}
+
+	return NULL;
+}
+
 static struct mpam_component *find_component(struct mpam_class *class, int cpu)
 {
 	struct mpam_component *comp;
@@ -2094,6 +2128,297 @@ static void mpam_resctrl_offline_ctrls(unsigned int cpu, struct mpam_resctrl_res
 	}
 }
 
+static bool mpam_mba_uses_memory_nid(void)
+{
+	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
+
+	return res->class && res->class->type == MPAM_CLASS_MEMORY;
+}
+
+static struct mpam_resctrl_dom *
+mpam_get_ctrl_domain_from_nid(int nid, struct mpam_resctrl_res *res,
+			      struct resctrl_ctrl *ctrl)
+{
+	struct mpam_resctrl_dom *dom;
+
+	list_for_each_entry(dom, &ctrl->domains, resctrl_ctrl_dom.hdr.list) {
+		if (!dom->ctrl_comp || !dom->ctrl_comp->class)
+			continue;
+		if (dom->ctrl_comp->class->type != MPAM_CLASS_MEMORY)
+			continue;
+		if (dom->ctrl_comp->comp_id == nid)
+			return dom;
+	}
+
+	return NULL;
+}
+
+static struct mpam_resctrl_dom *
+mpam_get_mon_domain_from_nid(int nid, struct mpam_resctrl_res *res)
+{
+	struct mpam_resctrl_dom *dom;
+	struct rdt_resource *r = &res->resctrl_res;
+
+	if (!r->mon_capable)
+		return NULL;
+
+	list_for_each_entry(dom, &r->mon_domains, resctrl_mon_dom.hdr.list) {
+		if (!dom->ctrl_comp || !dom->ctrl_comp->class)
+			continue;
+		if (dom->ctrl_comp->class->type != MPAM_CLASS_MEMORY)
+			continue;
+		if (dom->ctrl_comp->comp_id == nid)
+			return dom;
+	}
+
+	return NULL;
+}
+
+static struct mpam_resctrl_dom *
+mpam_resctrl_alloc_ctrl_domain_nid(int nid, struct mpam_resctrl_res *res,
+				   struct resctrl_ctrl *ctrl,
+				   struct mpam_component *comp)
+{
+	int err;
+	struct mpam_resctrl_dom *dom;
+	struct rdt_ctrl_domain *ctrl_d;
+	struct rdt_resource *r = &res->resctrl_res;
+	int id_cpu = cpumask_first(cpu_possible_mask);
+
+	if (id_cpu >= nr_cpu_ids)
+		id_cpu = 0;
+
+	lockdep_assert_held(&domain_list_lock);
+
+	if (!r->alloc_capable)
+		return ERR_PTR(-EINVAL);
+
+	if (WARN_ON_ONCE(!comp))
+		return ERR_PTR(-EINVAL);
+
+	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, nid);
+	if (!dom)
+		return ERR_PTR(-ENOMEM);
+
+	dom->ctrl_comp = comp;
+
+	ctrl_d = &dom->resctrl_ctrl_dom;
+	mpam_resctrl_domain_hdr_init_mask(cpu_possible_mask, id_cpu, comp,
+					  r->rid, &ctrl_d->hdr);
+	ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
+	err = resctrl_online_ctrl_domain(r, ctrl, ctrl_d);
+	if (err)
+		goto free_domain;
+
+	mpam_resctrl_domain_insert(&ctrl->domains, &ctrl_d->hdr);
+
+	return dom;
+
+free_domain:
+	kfree(dom);
+	return ERR_PTR(err);
+}
+
+static struct mpam_resctrl_dom *
+mpam_resctrl_alloc_mon_domain_nid(int nid, struct mpam_resctrl_res *res,
+				  struct mpam_component *comp)
+{
+	int err;
+	struct mpam_resctrl_dom *dom;
+	struct rdt_l3_mon_domain *mon_d;
+	struct rdt_resource *r = &res->resctrl_res;
+	struct mpam_component *any_mon_comp = NULL;
+	struct mpam_resctrl_mon *mon;
+	enum resctrl_event_id eventid;
+	int id_cpu = cpumask_first(cpu_possible_mask);
+
+	if (id_cpu >= nr_cpu_ids)
+		id_cpu = 0;
+
+	lockdep_assert_held(&domain_list_lock);
+
+	if (!r->mon_capable)
+		return ERR_PTR(-EINVAL);
+
+	if (WARN_ON_ONCE(!comp))
+		return ERR_PTR(-EINVAL);
+
+	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, nid);
+	if (!dom)
+		return ERR_PTR(-ENOMEM);
+
+	dom->ctrl_comp = comp;
+
+	for_each_mpam_resctrl_mon(mon, eventid) {
+		struct mpam_component *mon_comp;
+
+		if (!mon->class)
+			continue;
+
+		mon_comp = find_component_nid(mon->class, nid);
+		dom->mon_comp[eventid] = mon_comp;
+		if (mon_comp)
+			any_mon_comp = mon_comp;
+	}
+	if (!any_mon_comp) {
+		err = -EFAULT;
+		goto free_domain;
+	}
+
+	mon_d = &dom->resctrl_mon_dom;
+	mpam_resctrl_domain_hdr_init_mask(cpu_possible_mask, id_cpu, any_mon_comp,
+					  r->rid, &mon_d->hdr);
+	mon_d->hdr.type = RESCTRL_MON_DOMAIN;
+	err = resctrl_online_mon_domain(r, &mon_d->hdr);
+	if (err)
+		goto free_domain;
+
+	mpam_resctrl_domain_insert(&r->mon_domains, &mon_d->hdr);
+
+	return dom;
+
+free_domain:
+	kfree(dom);
+	return ERR_PTR(err);
+}
+
+static int mpam_resctrl_online_node(unsigned int nid)
+{
+	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
+	struct rdt_resource *r = &res->resctrl_res;
+	struct mpam_component *comp;
+	struct resctrl_ctrl *ctrl, *em_ctrl;
+	struct mpam_resctrl_dom *dom;
+
+	if (!res->class)
+		return 0;
+
+	comp = find_component_nid(res->class, nid);
+	if (!comp)
+		return 0;
+
+	guard(mutex)(&domain_list_lock);
+
+	if (r->alloc_capable) {
+		for_each_resource_ctrl(ctrl, r) {
+			dom = mpam_get_ctrl_domain_from_nid(nid, res, ctrl);
+			if (!dom) {
+				dom = mpam_resctrl_alloc_ctrl_domain_nid(nid, res,
+									 ctrl, comp);
+				if (IS_ERR(dom))
+					return PTR_ERR(dom);
+			}
+
+			list_for_each_entry(em_ctrl, &ctrl->emulated_by, entry) {
+				dom = mpam_get_ctrl_domain_from_nid(nid, res, em_ctrl);
+				if (!dom) {
+					dom = mpam_resctrl_alloc_ctrl_domain_nid(nid, res,
+										 em_ctrl, comp);
+					if (IS_ERR(dom))
+						return PTR_ERR(dom);
+				}
+			}
+		}
+	}
+
+	if (r->mon_capable) {
+		dom = mpam_get_mon_domain_from_nid(nid, res);
+		if (!dom) {
+			dom = mpam_resctrl_alloc_mon_domain_nid(nid, res, comp);
+			if (IS_ERR(dom))
+				return PTR_ERR(dom);
+		}
+	}
+
+	return 0;
+}
+
+static int mpam_resctrl_offline_node(unsigned int nid)
+{
+	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
+	struct rdt_resource *r = &res->resctrl_res;
+	struct resctrl_ctrl *ctrl, *em_ctrl;
+	struct mpam_resctrl_dom *dom;
+	struct rdt_ctrl_domain *ctrl_d;
+	struct rdt_l3_mon_domain *mon_d;
+
+	if (!res->class)
+		return 0;
+
+	if (!find_component_nid(res->class, nid))
+		return 0;
+
+	guard(mutex)(&domain_list_lock);
+
+	if (r->alloc_capable) {
+		for_each_resource_ctrl(ctrl, r) {
+			list_for_each_entry(em_ctrl, &ctrl->emulated_by, entry) {
+				dom = mpam_get_ctrl_domain_from_nid(nid, res, em_ctrl);
+				if (WARN_ON_ONCE(!dom))
+					continue;
+				ctrl_d = &dom->resctrl_ctrl_dom;
+				if (mpam_resctrl_offline_domain_hdr_mask(cpu_possible_mask,
+									 &ctrl_d->hdr)) {
+					resctrl_offline_ctrl_domain(r, em_ctrl, ctrl_d);
+					kfree(dom);
+				}
+			}
+
+			dom = mpam_get_ctrl_domain_from_nid(nid, res, ctrl);
+			if (WARN_ON_ONCE(!dom))
+				continue;
+			ctrl_d = &dom->resctrl_ctrl_dom;
+			if (mpam_resctrl_offline_domain_hdr_mask(cpu_possible_mask,
+								 &ctrl_d->hdr)) {
+				resctrl_offline_ctrl_domain(r, ctrl, ctrl_d);
+				kfree(dom);
+			}
+		}
+	}
+
+	if (r->mon_capable) {
+		dom = mpam_get_mon_domain_from_nid(nid, res);
+		if (WARN_ON_ONCE(!dom))
+			return 0;
+		mon_d = &dom->resctrl_mon_dom;
+		if (mpam_resctrl_offline_domain_hdr_mask(cpu_possible_mask, &mon_d->hdr)) {
+			resctrl_offline_mon_domain(r, &mon_d->hdr);
+			kfree(dom);
+		}
+	}
+
+	return 0;
+}
+
+static int mpam_resctrl_node_notifier(struct notifier_block *self,
+				      unsigned long action, void *arg)
+{
+	struct node_notify *nn = arg;
+
+	if (nn->nid < 0 || !mpam_mba_uses_memory_nid())
+		return NOTIFY_OK;
+
+	/*
+	 * Ignore nids that have CPUs. Resctrl needs to see the cpu offline
+	 * call for each CPU to update the CPUs in control groups.
+	 */
+	if (!cpumask_empty(cpumask_of_node(nn->nid)))
+		return NOTIFY_OK;
+
+	switch (action) {
+	case NODE_ADDED_FIRST_MEMORY:
+		mpam_resctrl_online_node(nn->nid);
+		break;
+	case NODE_REMOVED_LAST_MEMORY:
+		mpam_resctrl_offline_node(nn->nid);
+		break;
+	default:
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
 int mpam_resctrl_online_cpu(unsigned int cpu)
 {
 	struct mpam_resctrl_res *res;
@@ -2229,6 +2554,10 @@ int mpam_resctrl_setup(void)
 		}
 	}
 
+	if (mpam_mba_uses_memory_nid())
+		hotplug_node_notifier(mpam_resctrl_node_notifier,
+				      RESCTRL_CALLBACK_PRI);
+
 	cpus_read_unlock();
 
 	if (!resctrl_arch_alloc_capable() && !resctrl_arch_mon_capable()) {
diff --git a/include/linux/memory.h b/include/linux/memory.h
index 463dc02f6cff..1497d4be38ee 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -120,6 +120,7 @@ struct mem_section;
 #define CPUSET_CALLBACK_PRI	10
 #define MEMTIER_HOTPLUG_PRI	100
 #define KSM_CALLBACK_PRI	100
+#define RESCTRL_CALLBACK_PRI	100
 
 #ifndef CONFIG_MEMORY_HOTPLUG
 static inline void memory_dev_init(void)
-- 
2.53.0

