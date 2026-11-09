Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259489;
	b=eulmd0NE18yQJBQpiPz/+nN6hQdkmq7xm4JgZvIz+7ekaVXS36scLGIHrYhWBDbfo6xU
	 kTYqEqghxPS069R3FsYab6jSUSkkcWYMW7srh9+7jD3TlAQVv1S5KsTwR9SDrK5WH2Ow8
	 +RcurTdQbLsNwH7tkYApqVsT85OZ0LcrtthR7TLlTdv3vakrsIUCxGtzdPf9+sOFfGPff
	 B2WiwSpJ3OGKLxl/DVz3cNJF+uF7HwqlmzwZV9tM7XnsFeFIwvfcUEJCCs2GPto/zXrNR
	 7bIpQbxns1pkmSvTWR/I0VrNmf/3Zi1EUDrodrdWecAJ+s87aMPuV6MWG2MltlUzffw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259489;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=i+1oHpiwftU4wshZL8AYhsKoLIxzRvy3/9fx93m2aXc=;
	b=somNZO4GcChKjUgeCm2R6jHvd/ew6iJZkG/8wFTXeXDyypN/F9nuzsK5Ol68lvWaD0MZ
	 lvUEpxnkbooOoQclRNChdu5xHbGvLkPy9ZFI7lC41FYHVOnauFAmo8ME+n7MYZ5jKTESC
	 Rqr3QRAQmYW5U2kUu4j8buSgEAe32rEbcdSd5vqQlE+Ew6w2g7GZwtnbcIy6ljpR263k+
	 32eX+FLKDNbPQNC6K0XlGRQz9B9nwlr9T4MJKAvSxYL5x3molzvWGCH3wJLpxOAl1+jCh
	 kWYMub3wNglrY0+dSMfJoKeBD7j+pqun9Dy5yIIUuwaeyTqeZOmKfJ8nkeLoc8GHRTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=B++YgsMj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.43
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012043.outbound.protection.outlook.com [52.101.43.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB66606A33D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDB66606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=B++YgsMj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SepNh6j2jkygX8Sp2cPNKiiWGRSgmdy9UOvj15puhxZ5ECojHC9ipoxYWBNcbySxw2b9FqAFIjx87xwNCFtdtQftbyNrksy4Yv0UfBHZdlcq3a1MVutwNVq1WlN2GHjnFoHtrBxjDWw7P2KUF9oGrCMGGicf4pyGIaRU+8UiEs3iX7Xbwn9ElQWdNwS9kETM/vhl3fvkB+SZBrpAouWHwR/+ZhCrM0yYQRtWr/FWERgBChki/zfM5GP/zRQPFBgwMKVFlVxJZ5sK7TvJUUQD69D7kmZ0xSF20aVij7RPm/TnGU4vFTrcA81ZOmioCrJ6J60uxGMKMuTOjcDW2qb3+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+1oHpiwftU4wshZL8AYhsKoLIxzRvy3/9fx93m2aXc=;
 b=G/9Qf5ardwEqKi/4ItR0o4UPl9t1/z65e8Vzjc+Fe7kbOspFdeqzBCf/I/+i0Ac5U7SaFVN/Raz/ugI2tSCIw/lWVNKp8kpH2KSpT4wqBz86ULX4UDwCla2hKmEtdILDdH5AaXU1d4KQq9110GWJZK7IyjVdfTrMjXxYuny0KzLFX8kOd4DfN6LmUxm+lD/cCPVaZvG7Hvuqgc8XtL4Gb0MTRQY0snwXs/821uz6dV4qU7gt1DVpPcxvOupFpbvpGz+BPoIKByn2FUShcbSkioz+SJFL7CvwGEfjYBxVdo8gb4Hi8rjOyKmdIIXhvMW/H47TLnlzacWPBKT7B/SIlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+1oHpiwftU4wshZL8AYhsKoLIxzRvy3/9fx93m2aXc=;
 b=B++YgsMjwNgKSc4ZnFGuXBZSdWaD6UkRvkxyWCpEvEdffDJItfN8PUeUdHKIMe/wszw15qhdz9RGVLcLXTpJI+AExX1OQOGJ/iIO7DAALFisGbFYGP1nXDWwiLwaczfkEZ+iEvrPjXcXKu011UiWrnR5WFA+Mi8YMa26un+mHjrhJxngOJixC2iu8gwIlSqYAnRAif+SUFPGDx8LHWbEpIDmPzxH68tms7x4/Z4xYO4hqKv1U3K5IrSken5ooVD4IIN/gbFHkIF1qynw03P7X2II9PCaz7I8+MkmJUvEg0lqpilAfZbsRZE3UXswnaJvYNvFZQQO6DsTKPNZV8B04A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by MN0PR12MB5883.namprd12.prod.outlook.com (2603:10b6:208:37b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Mon, 9 Nov
 2026 21:24:44 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:24:44 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Will Deacon <will@kernel.org>,
	Dave Martin <Dave.Martin@arm.com>,
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
Subject: [PATCH RFC v3 09/15] fs/resctrl: Take memory hotplug lock whenever taking CPU hotplug lock
Date: Mon,  9 Nov 2026 13:24:21 -0800
Message-ID: <20261109212427.1409204-10-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212427.1409204-1-fenghuay@nvidia.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::33) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|MN0PR12MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: 6249e82f-d98c-4dcc-8ab3-08df3ea7df99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|261009221227099003|261102123227099003|261026140227099003|261009223027099003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261026121527099003|11063799006|56012099006|10067099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	wWqgQRyW7f0PsL/lm2aw88JGpivBibU5uw+6gTYppW0F/BvTSsGHiv5CIHLtM/nmMihJS9FhFEb4UtJR7eN6RCfV2UtpMFHFyB2Urhj7tkp2vH0Sll47Fzk8bPYmm5pzUtAvsI3o6bvSA/GX5xFk9oDib6sG+xaUYU8YJlQ1/UyuipamuRjEJmB5GbfmGCouJcubzGEeMzl77tTOYt0+Skz1Qo0LUkQV+PyvdGC8sZujsDYO8CplWy9Er2QmGwAx4zPX4SZCOsHX6rp2aSjoeVXUES14I9d2FuxquhwNyZ92GQeifN12J+JDLqwkCuSeu+6w60bKXU95Nm/6EMPUb7VcF25SnDQXNK6qOOFhOpUV1osb4wvWNWB2kvtN25lbrtfdTu2C/88dW5zuNc4CiqDYJWsh9hUR3bEMEQCC2Ul60TBpsBIZXaL36zniazspVO1dikr6fIDkzAUoHX8iyg5EYjJyRYU0wO5uxZ+9tcvLDofVN3xYUvwrJcgF+GCsO9zsmXlwvOaeMcaUHxUSrpl6oPjGtlmZDD1sLtcZk4m4hu08mAWQzKGajbPA44P29rVfvtisiJk7bOoTfKcmCNr27BnScjzM+/dr0uGY6De/YzewRoLH+x6WXJuCowrTUqHpps1yszlzapeqQkbxwt9GqWa8xXJoD+ZMdtCYKE4cXHP7/KVjAHIkPTelADJAfITbgSIv+w8BLaBvPGdrFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(261009221227099003)(261102123227099003)(261026140227099003)(261009223027099003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026121527099003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gLbNJD7r+0uaBRjdY2PF99Ot9EUNd4O9kvwmSYq8fSKnJ8L6bsIE5E9xptVY?=
 =?us-ascii?Q?L/2LbySviI05QGSTSkvD+Vn5rwyb2UoBF4cOHceN8AnB+HnkWuArhSMd7F8t?=
 =?us-ascii?Q?K2f8VS1+T0UORlgzndUV/xEyiUb9ghsgkHWrJR1YKEJQLLFoIipXdxrxlOPs?=
 =?us-ascii?Q?l+b8pKR9tyil/dNIie3Ees9MdVtuBK2K5/RKMAu5jmIAGcCyLTWsUged27yn?=
 =?us-ascii?Q?J8L4O/5lfkbvtIwjvIokTD4pNuXDNE32dL9SnWEqmQGi9Q1+Hd7seLRx0hKO?=
 =?us-ascii?Q?UpMvibADftubKuwabuadIXyfvYP6YELe1TX0ND8S6zpzhI7gfiiaeTO+r0n2?=
 =?us-ascii?Q?RgiQIJfaOx20IV0OeOaDdhdUHXE0NoeBRYOE3x+toaHlXdo3Gu/Hvf1uIx6d?=
 =?us-ascii?Q?5WXkQmvL05C8Wz/KKPKcl9xZVF85UwRC6fJ+SNybaYnLtrARkQd2+x9sGhyB?=
 =?us-ascii?Q?cd5+JKGVxpEP4RxkpUUSp5A59g+r9VqrrvTDCqSjw9FUDNiX4WOGpb/xx89j?=
 =?us-ascii?Q?//WIT1vXIDpOyLGWhthEGyk6dJj0xXWVPXzsZ/u8oD+bKythTWbjEcOr1i0r?=
 =?us-ascii?Q?ASe2WNpcwK36ci9R9mjaKcELmCB+UpAkerdX92MrJKBeqXgnxDpgz1X0JgfG?=
 =?us-ascii?Q?6aTA2CY9GAKY82hE+FbZSI40MNBwOFWDG+Ir7ZMLKQ2MCwsEyvXMOnXx5QEp?=
 =?us-ascii?Q?s4sPl2bKnN32rgWs0yw3r2DrugJ6ZDI5dcQd0+E+Ul9+ufWIQqt8fEyV3t6q?=
 =?us-ascii?Q?DA7EiOB+OsCdrv1DK1P/zfcE9FkpQ/mrLSh1W78ezLuUk1CBq3zfEnzcw/WO?=
 =?us-ascii?Q?/EAdHzpd5Od7Cu73UCiCzCWJgsmmrTYc+ieLPsN7twA/ONsMzL+tyxWnSbpW?=
 =?us-ascii?Q?KD0RTcAmF5o+61ZwVEQYdZboVlm2sCX+L4T9najSWG9AyVTY3Bbhrp/uku8w?=
 =?us-ascii?Q?wsSdd7hgx3lf2ifaIZrqy0tV7dXB3VYcmy0pBTodnG9QxIpUSBjyqL6JmMXu?=
 =?us-ascii?Q?QFAGgurRlikX5Po7tz0KWazejORbU3k6wH/BKaq+gv2DS15LDcX7nXIBf/Dr?=
 =?us-ascii?Q?CvKLzoKY3mh6S2i3N0hpA5Dk2SL5GX/RbkijbVueSlV4NecCZQvCrpXuy9rG?=
 =?us-ascii?Q?Pqg+0FsV18dBxVt/On/6wVxVIywx+ZDVkemSPCvDaN1mLFjvTXo01NQeEW8C?=
 =?us-ascii?Q?OkLsOGohZ27tSsqhVSr9B+SVcg/NRmviFufkkl4i4x1kKLV4wvIuSsvA+k/2?=
 =?us-ascii?Q?nV1pAn2nYRd+1VWdt3GnHqavAw/wXaGz/v+0DGUlW7J9/cLh39+Q31WLJ68c?=
 =?us-ascii?Q?7hQEAkF2W8wGHb5JPzUZd6aemB5m16+o3mB6d0VN68xUkuDG+yFuxNk7QSmc?=
 =?us-ascii?Q?FjTFQhxk3h+bmExm+CjoOhWP2twpbLupa5BTHDPNloR5mdrLhq9s2SvwqYN1?=
 =?us-ascii?Q?M2w9qYgNf16LF7ASY1mHstVRG84phgzdVen0J5DoOjVpoqRd/JybFsac6/Jt?=
 =?us-ascii?Q?xgmAdSRtMyXOL/50xTenIm4/JcewjN2B6ym3rEAXHLHiCKtYJYT57hAQj6oQ?=
 =?us-ascii?Q?RiTrO/VG7TesI0l1P56SehJ/WUtHWVNlFuEwWALG4i7Eo03NFzsA14chTID/?=
 =?us-ascii?Q?LsT4lPReAX30MjBByZpE+Djxvlg/YxTCblmg72NHF8JDGks+vVsZvaP7llCe?=
 =?us-ascii?Q?NLxj78XtqN/ERG86N5/VLON0nNVPdOH9GqbUuo1RcAcIDnUgeAyfNNF+o1aE?=
 =?us-ascii?Q?MYdyF8DWdg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6249e82f-d98c-4dcc-8ab3-08df3ea7df99
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:24:44.3553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lp4r0t/jKu1g4IlAxblg4iG46q/FkkdkbMuzlv+JGsMGdiSbWOUhybQzHNHO9nY/+Fe8xkBWocl9VOEcQvROXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5883

From: James Morse <james.morse@arm.com>

resctrl takes the read side CPU hotplug lock whenever it is working
with the list of domains. This prevents a CPU being brought online
and the list being modified while resctrl is walking the list, or
picking CPUs from the CPU masks.

If resctrl domains for CPU-less NUMA nodes are to be supported, this
would not be enough to prevent the domain list form being modified as
a NUMA node can come online with only memory.

Take the memory hotplug lock whenever the CPU hotplug lock is taken.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/pseudo_lock.c |  3 +++
 fs/resctrl/rdtgroup.c    | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/fs/resctrl/pseudo_lock.c b/fs/resctrl/pseudo_lock.c
index 17b99a075eaf..c865913cb534 100644
--- a/fs/resctrl/pseudo_lock.c
+++ b/fs/resctrl/pseudo_lock.c
@@ -16,6 +16,7 @@
 #include <linux/cpumask.h>
 #include <linux/debugfs.h>
 #include <linux/kthread.h>
+#include <linux/memory_hotplug.h>
 #include <linux/mman.h>
 #include <linux/pm_qos.h>
 #include <linux/resctrl.h>
@@ -718,6 +719,7 @@ static int pseudo_lock_measure_cycles(struct rdtgroup *rdtgrp, int sel)
 	int ret = -1;
 
 	cpus_read_lock();
+	get_online_mems();
 	mutex_lock(&rdtgroup_mutex);
 
 	if (rdtgrp->flags & RDT_DELETED) {
@@ -765,6 +767,7 @@ static int pseudo_lock_measure_cycles(struct rdtgroup *rdtgrp, int sel)
 
 out:
 	mutex_unlock(&rdtgroup_mutex);
+	put_online_mems();
 	cpus_read_unlock();
 	return ret;
 }
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index d60868f7d5e7..a16e35b587c4 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -18,6 +18,7 @@
 #include <linux/fs_parser.h>
 #include <linux/sysfs.h>
 #include <linux/kernfs.h>
+#include <linux/memory_hotplug.h>
 #include <linux/once.h>
 #include <linux/resctrl.h>
 #include <linux/seq_buf.h>
@@ -3238,6 +3239,7 @@ struct rdtgroup *rdtgroup_kn_lock_live(struct kernfs_node *kn)
 	rdtgroup_kn_get(rdtgrp, kn);
 
 	cpus_read_lock();
+	get_online_mems();
 	mutex_lock(&rdtgroup_mutex);
 	rdt_last_cmd_clear();
 
@@ -3265,6 +3267,7 @@ void rdtgroup_kn_unlock(struct kernfs_node *kn)
 		return;
 
 	mutex_unlock(&rdtgroup_mutex);
+	put_online_mems();
 	cpus_read_unlock();
 
 	rdtgroup_kn_put(rdtgrp, kn);
@@ -3299,6 +3302,7 @@ bool info_kn_lock(struct kernfs_node *kn)
 {
 	kernfs_break_active_protection(kn);
 	cpus_read_lock();
+	get_online_mems();
 	mutex_lock(&rdtgroup_mutex);
 
 	/*
@@ -3307,6 +3311,7 @@ bool info_kn_lock(struct kernfs_node *kn)
 	 */
 	if (!rdtgroup_default.kn || !is_active_resctrl_node(kn)) {
 		mutex_unlock(&rdtgroup_mutex);
+		put_online_mems();
 		cpus_read_unlock();
 		kernfs_unbreak_active_protection(kn);
 		return false;
@@ -3318,6 +3323,7 @@ bool info_kn_lock(struct kernfs_node *kn)
 void info_kn_unlock(struct kernfs_node *kn)
 {
 	mutex_unlock(&rdtgroup_mutex);
+	put_online_mems();
 	cpus_read_unlock();
 	kernfs_unbreak_active_protection(kn);
 }
@@ -3671,6 +3677,7 @@ static void resctrl_unmount(void)
 	struct rdt_resource *r;
 
 	cpus_read_lock();
+	get_online_mems();
 	mutex_lock(&rdtgroup_mutex);
 
 	rdt_disable_ctx();
@@ -3686,6 +3693,7 @@ static void resctrl_unmount(void)
 		resctrl_arch_disable_mon();
 	resctrl_mounted = false;
 	mutex_unlock(&rdtgroup_mutex);
+	put_online_mems();
 	cpus_read_unlock();
 }
 
@@ -3701,6 +3709,7 @@ static int rdt_get_tree(struct fs_context *fc)
 	DO_ONCE_SLEEPABLE(resctrl_arch_pre_mount);
 
 	cpus_read_lock();
+	get_online_mems();
 	mutex_lock(&rdtgroup_mutex);
 	/*
 	 * resctrl file system can only be mounted once.
@@ -3804,6 +3813,7 @@ static int rdt_get_tree(struct fs_context *fc)
 
 	rdt_last_cmd_clear();
 	mutex_unlock(&rdtgroup_mutex);
+	put_online_mems();
 	cpus_read_unlock();
 
 	ret = kernfs_get_tree(fc);
@@ -3836,6 +3846,7 @@ static int rdt_get_tree(struct fs_context *fc)
 	rdtgroup_destroy_root();
 out:
 	mutex_unlock(&rdtgroup_mutex);
+	put_online_mems();
 	cpus_read_unlock();
 	return ret;
 }
@@ -5502,12 +5513,14 @@ static bool resctrl_online_domains_exist(void)
 void resctrl_exit(void)
 {
 	cpus_read_lock();
+	get_online_mems();
 	WARN_ON_ONCE(resctrl_online_domains_exist());
 
 	mutex_lock(&rdtgroup_mutex);
 	resctrl_fs_teardown();
 	mutex_unlock(&rdtgroup_mutex);
 
+	put_online_mems();
 	cpus_read_unlock();
 
 	debugfs_remove_recursive(debugfs_resctrl);
-- 
2.53.0

