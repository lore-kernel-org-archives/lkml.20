Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259483;
	b=PFy4lorFDixG3HJBRIXwLj31cy/vwPQlll8eBY95DnYbohD4+gvgt6GKFHQpN4OzNSpW
	 rkbXOpGJLqrB/ZXZ/xONnZ6/ZU4uHZoOULlwbd51JjAshXT2LDB9IpcBZqTDZmeRfqcDn
	 OG1v5jmvBGgG422g03eqjEKsvYsdFcYgJ38FaOIfZENPCSS0D1l/IM3nrsOEHDewmfvWt
	 G2QOjkYkj7W2x1pl8MqBM8Zb7qfSrHUDT11zbLbAwjYzSuonu7vQja3PptxF/m4bnpcMn
	 davKIQz0hjjQ2v6GZN/zMOFgLKraFqAsUeIHNMvD8Tve5LbVX3X7gMTrVqD9yPERL3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259483;
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
	bh=+KgaJKaL0fS1dIVFu0rr1uU7UK5Z7gfzjoKXoKR5+o4=;
	b=Ad+HW8fVFuAvzH9DcYasqeZkcakkdR/FHkIn0+cCRxZBMGH5ZDE5WwVh9RVvN9FGS2L6
	 yD6Hj+shNu3Z9leiKLai1/cFMptbLj3k5HYoNnlry/ZkBmDl0qRUbya6rT2owfv1xlSIO
	 NZDXVHqAfNQAmO/uC1eanQUPFWEiAKjUXJ3THsu+nHXG4yw1kDG/6ZyHvAsCdjkMijBun
	 6U4CfcCjN00M9luquCbrC9LJDaVSShnAxN974xQSpQWcUYO5iTuDbXBMknser+81Xjd/q
	 sjO0w3CH0c0Ac6crj8/fRfk0rWoEpqGCLjHpooyYMNIDDvMoRGk08inAXjP4WG9sqWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oK370N7P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.24
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012024.outbound.protection.outlook.com [40.107.200.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9C7606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC9C7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oK370N7P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2IINL3BQ+ewHAKj78uCkIyl0ZUDM6ggKTEV6GZnjvcnf+u/WKWlhwEBCgbTSdultEAnvj+GfOCytADdd/mDeuQdBW1hF7RRp5eBHQK8quv4uqhe2Xo0pCXltXKJzVGapX3HsA5QHL/Flu2FalTaqT4qX1CNsgnorTCcaSmwHWyNOAcnDcALbtT4+U6plGf9RmBF5NdyGLu9mCGtm58IZdpKRR1lBulthvXK1SaooiDagn8HNMDOk0JQCnrSjS/QudXP+F+W8lBp8fuwUtyto3lDvnUqiWLPfZXqf7yllzxlhfKPNlRIXAHSgQ6BA12Z0Y9djLYggBmYr9rsRSoxsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KgaJKaL0fS1dIVFu0rr1uU7UK5Z7gfzjoKXoKR5+o4=;
 b=cEeitpYFNX+lnHzAXuAV4hln67PeqXQafouRVG6TSAz4YB3Wzhqjtbj1HWHlf55oyVfrw6Z3GjIRldaulMj/dBiRIt0FVJVGnVfJ+sVn3x7SJDDPJsIei47vQNRpG+kETz6tLf1xwLQxSR6k89EyCcoRbKFtW9uxPuIK4riwl9+fhev6RSQ+k7ari7NgiT5+2TuBoBdTIGNs4EuUehnZP+kqreFV56Uic7BVhK3oA24NvI/tjO8R8EmrzpzDillKvbZTxn7vaajA3jtLqcK3bPLt4Jh7nzApa7PNkJ+NHYpU272GWbY6HqXiJ7xSdOTIUq4gx3T+RwCmfqkGhHDXUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KgaJKaL0fS1dIVFu0rr1uU7UK5Z7gfzjoKXoKR5+o4=;
 b=oK370N7PRN/ygv7NqMO3JrvhUMQbzPeD+jvURj4wijg53OVLUpDzcn4jtraowhjgpv3yoU/muwOs56uC5p0Uq3HCdLDGomQb88HkJe8zSzk1Llu6eirIy51JYDZRG3KV7w80TjopVGAa+SpgThI5o5t5IqMSNCuE1aXrTpC/KJVzwLJsVOuktjjcC0ILci2G7jdD4AHLyzsHHwtDdOfn8j7Cxjs4YvA1IjRObHSl7G8Rpn4GLrpev1clSeG4WUml1B173rsz7BpIs4KLbtZGlOmhuVBrTjhKPld0gGR9nOO44xp9eQ5RpQ4d80KO/rQ4XtvReNRlIW0EtAXz9jObGw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH7PR12MB6811.namprd12.prod.outlook.com (2603:10b6:510:1b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Mon, 9 Nov
 2026 21:24:36 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:24:35 +0000
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
Subject: [PATCH RFC v3 02/15] resctrl: Expose MBA MBM counter assignment sysfs
Date: Mon,  9 Nov 2026 13:24:14 -0800
Message-ID: <20261109212427.1409204-3-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212427.1409204-1-fenghuay@nvidia.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0361.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::6) To DM4PR12MB5230.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|PH7PR12MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: b295ca4e-e405-4f16-87a1-08df3ea7da67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10067099003|261009223027099003|5023799004|11063799006|56012099006|261021123027099003|261021121427099003|6133799003|261022105027099003|261026140227099003|261026121527099003|261028144727099003|261022075727099003|261102123227099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	b37AKZBdCV9Viqg+00x6Gh/tpJtDL6ID8/Q0lRdXAwGeRJVTJv+RztiD93WQbeeHyxjuQ8qRiqVhyIGbh/+rlo2ylIx/IJYA/U3NuIY1Dtj9cpktCJ3YwKmv5CYfoU7NTD8SB2uUo+2FklpAHzxg0TAQLCwixJiimH2kER2OyenkVJXYHcT21coF97MqeJfVcTah9hLCCaXvvL/MyrD7RY5EEk0+RrtR0aTDNgp7Ia9T1KOQXikOvWpb3D2rfxWqXw7of717dcg3FzxPGgPjZG5vhM9ROPO2eMIZa3JA2ONREbxhB7Jb9oZcdidibQPyf/o6epxpr+++4UX6G5YmrTyXXIXHKmLyIQkWVC5IWECkHohJGH/sNuSSUt3w6Xvfrx1PFkQZKz58kIRAOWAEufowAqrPTkJ6LFTH4VboEyVdCqnEZZL4cdpXQRIcCZSJ3USdzINEzh7NBIk2y3RpkYzZQPXFah9AZRwEVGwMK4B5rFzUSpIupk2nRmDsu7oXEU8N7NskHhURvibkFw8+t6XFmCIwn2MQAJltxaBuGqkzXxLKDSoctgLLTH8ZCS07OtfvTNsDFZ8kMUJVp4XtMCorFsTzxSkwc0i6VO73A7ecZrpaje2Kw35IHj9sf9dYUPdy+6Bp21Lzt/hsq+hYWod/GuG3aiwkuQCHhxO+zosqCbNlm7RikKdl5/MJEeBLjRdMstbggy4DH63NzMY5pQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10067099003)(261009223027099003)(5023799004)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(6133799003)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022075727099003)(261102123227099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XD1oW2zRviGoadjNqegW/tH5sF4y5BXKdxL/GIqPTpHUIQdpl8cSyjI8L2oW?=
 =?us-ascii?Q?4dxVax6NAtbfZYCG1GK4DzYpFs3pZjoDugo8V2LteHW17KPPqW3m+QoYFhhu?=
 =?us-ascii?Q?9iAEk64Zqwk9gcBuXMqSlGoD8HB0UKvurIpOSZfh4pfmvLz0LYh9TKj/afhD?=
 =?us-ascii?Q?LUiS+tvW/V3EWTH2YrGkd15Qsfe+xFPZnvotQEDuw9xCgcB8FhbMNBbInBxP?=
 =?us-ascii?Q?ZTDh2rwUaIiadHBN9sauO65BcG8/jnLwacdaBb8nXOhlM6R/gWC+MupXe/v/?=
 =?us-ascii?Q?le42Tm/RuFyaha5ca0AutnBLE3ag8Gusyy1eGZ4EHPGiqeSk5xuKMBGDIVjg?=
 =?us-ascii?Q?IbSlfqKxO+2E1gBO7djqOd1Xr6dc7Zm58Znv+llx/wsUiz6eBGWVWVcwfemf?=
 =?us-ascii?Q?YR2LUGkgE4Kn+b9bysLvIBCbB1FAP3KVGs+AuFBigaItAvd7EEHmSW42gPME?=
 =?us-ascii?Q?rTMs95C2cw0Mcs6XqoGodHIMcoZHRQkTrTPuFGNwZt2jMzw4hI4gBtgzjrw2?=
 =?us-ascii?Q?yIaHFlrMciA81spKduRSBAOz4OYjNdbdR6rNviZ5yHa07IsLjSpx0HO5oi5q?=
 =?us-ascii?Q?gisIAI5vFmTT05enN8/e9fjjnGCIaqB/BxxEr3TOZ+de/dga0/uOUmmST7BU?=
 =?us-ascii?Q?E4zdlVSx9KlqSCHT2mqBuWJyihuOSeqNd5lpQvV6S3GWP6PrZLOYSULL2oe5?=
 =?us-ascii?Q?C+ySTQ8rHCinSGynf9vkZ2T4nl/H5nn1KJsCHS/oftVtSq+r2bjRX4qsqs5F?=
 =?us-ascii?Q?C8apZbxP61Eely5WbvBRJO3MtKOLO9tFjV/lTr+afTsR+r8t07Nd/Po3APPk?=
 =?us-ascii?Q?DqjN03C+nOBkLNWv4vrZiqphGx5zOobRi/idr/zSjeN35+nd1K/LwrRBy+cc?=
 =?us-ascii?Q?TsLCjcmRDeFCi7Y3iWjRHkePqAhoDkIfrtSSVblwjNc++WZSWBC5QQW0MrTE?=
 =?us-ascii?Q?7ls4eTtdKefFwxwVIR2PlQLJ2kKuDrLMSzBxKlbNiGGeoegkEADaHQJfGajw?=
 =?us-ascii?Q?+ILT4hn+HJoSSoCMzPQPcQzUJ9MvPiTKUEWRiYlIyobDQc4I5g83ovG915mp?=
 =?us-ascii?Q?6ahvpo9yEb72MafI1vSa2Rhzkz3qrLGGPCiuRM4IOh3fI6MRgqiX5QOcLEeO?=
 =?us-ascii?Q?Tc9sxwqQBrLUZuc/xR3kkD5x8uT5zX4mnl0zkO7qZ62b2novUErR2tWst0hs?=
 =?us-ascii?Q?8mF1865gEKHancwmhqg1htaLDvq3X8OS8BgLyieh2cslsiTx4dnunXpHLYeN?=
 =?us-ascii?Q?+OTvU87lNDOHG0a4VhOl652xhgXYYyAzm4ASXd9A6SKfpvxL62MFTJ5PihtN?=
 =?us-ascii?Q?j/LzxIif3vqrr0jubtYtONP6qmPqBkhl+r0SOaCMSHpktwIsrRU5dPsOvSpT?=
 =?us-ascii?Q?mKvpjzo1HjLc90cIbCD1UYq3/8subQusS0wZr/k3PDXn5pSbxqx32k9qUOV8?=
 =?us-ascii?Q?W0REwgTjiM6ANjgmiBS1jIgTC/CCwfRBxUSsKBg+xCBPkXcEzuS4ZY0bNz2i?=
 =?us-ascii?Q?pGI15c7rFyRbLxoeUznBoe+fWYhUMwDufKgFQMY8dtVtFqhlhEXE3bcgsg3c?=
 =?us-ascii?Q?9WPmllNhCR2Nkwgiqmx2D0LwvZL6sltFlM1tMwkTphs4HKszA0AOaXaD7Jo8?=
 =?us-ascii?Q?o4p762JMxZ5tgEu8rW7J1GXZwNMkyaOFjtpStnMxlqjAQPapjL4YkQ6GqJWh?=
 =?us-ascii?Q?JgjrZdW2wbiNY9LBu/zz5SqKIF2jOZXhNYEnGMeP7WPewjCMPN+bJpwYWBaC?=
 =?us-ascii?Q?977+Vsg8zw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b295ca4e-e405-4f16-87a1-08df3ea7da67
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:24:35.6205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YN/AMOvDB4Y/SWcF5pCoCQW4fZ7tAwnAsp1ZQRadUPiuJ0DwPTYERouSSzVu0r/FrpSpC3G2nJndBp4k6yAHbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6811

When MBWU monitoring is backed by an MBA resource, userspace still
needs the same counter-assignment interface as on L3, but keyed to MBA
domains and exposed as mbm_NODE_assignments rather than
mbm_L3_assignments.

Add the MBA-side sysfs hooks and initialise MBA monitor metadata during
resctrl_mon_init() so mbm_* file visibility follows the resource being
configured.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/internal.h |  5 +++++
 fs/resctrl/monitor.c  | 27 +++++++++++++++++++++++++--
 fs/resctrl/rdtgroup.c | 11 ++++++++---
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index af2e6e0b2af8..32c7d53790ec 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -480,6 +480,11 @@ struct resctrl_ctrl *resctrl_resource_ctrl_get_default(struct rdt_resource *r);
 const char *resctrl_ctrl_name_str(enum resctrl_ctrl_name name);
 bool resctrl_ctrl_is_default(struct resctrl_ctrl *ctrl);
 
+int mbm_NODE_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v);
+
+ssize_t mbm_NODE_assignments_write(struct kernfs_open_file *of, char *buf,
+				   size_t nbytes, loff_t off);
+
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 2b5654f05480..5865a509174c 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -538,6 +538,7 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
 	switch (rr->r->rid) {
 	case RDT_RESOURCE_L3:
+	case RDT_RESOURCE_MBA:
 		WARN_ON_ONCE(rr->evt->any_cpu);
 		if (rr->hdr)
 			return __l3_mon_event_count(rdtgrp, rr);
@@ -1741,6 +1742,12 @@ int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, voi
 				    resctrl_arch_get_resource(RDT_RESOURCE_L3));
 }
 
+int mbm_NODE_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v)
+{
+	return mbm_assignments_show(of, s, v,
+				    resctrl_arch_get_resource(RDT_RESOURCE_MBA));
+}
+
 /*
  * mbm_get_mon_event_by_name() - Return the mon_evt entry for the matching
  * event name.
@@ -1890,6 +1897,13 @@ ssize_t mbm_L3_assignments_write(struct kernfs_open_file *of, char *buf,
 			resctrl_arch_get_resource(RDT_RESOURCE_L3));
 }
 
+ssize_t mbm_NODE_assignments_write(struct kernfs_open_file *of, char *buf,
+				   size_t nbytes, loff_t off)
+{
+	return mbm_assignments_write(of, buf, nbytes, off,
+			resctrl_arch_get_resource(RDT_RESOURCE_MBA));
+}
+
 static int closid_num_dirty_rmid_alloc(struct rdt_resource *r)
 {
 	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID)) {
@@ -1933,7 +1947,7 @@ static void resctrl_mon_resource_init(struct rdt_resource *r)
 {
 	unsigned long fflags;
 
-	fflags = RFTYPE_RES_CACHE;
+	fflags = (r->rid == RDT_RESOURCE_MBA) ? RFTYPE_RES_MB : RFTYPE_RES_CACHE;
 
 	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_TOTAL_EVENT_ID)) {
 		mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID].configurable = true;
@@ -1969,7 +1983,10 @@ static void resctrl_mon_resource_init(struct rdt_resource *r)
 			resctrl_file_mode_init("event_filter", 0644);
 		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO |
 					 fflags);
-		resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
+		if (r->rid == RDT_RESOURCE_MBA)
+			resctrl_file_fflags_init("mbm_NODE_assignments", RFTYPE_MON_BASE);
+		else
+			resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
 		resctrl_file_fflags_init("mbm_assign_mode", RFTYPE_MON_INFO |
 					 fflags);
 	}
@@ -2002,6 +2019,12 @@ int resctrl_mon_init(void)
 
 	resctrl_mon_resource_init(r);
 
+	r = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
+	if (!r->mon_capable)
+		return 0;
+
+	resctrl_mon_resource_init(r);
+
 	return 0;
 }
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index a658e4958562..a0635888a0a0 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2307,6 +2307,13 @@ static struct rftype res_common_files[] = {
 		.seq_show	= mbm_L3_assignments_show,
 		.write		= mbm_L3_assignments_write,
 	},
+	{
+		.name		= "mbm_NODE_assignments",
+		.mode		= 0644,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= mbm_NODE_assignments_show,
+		.write		= mbm_NODE_assignments_write,
+	},
 	{
 		.name		= "mbm_assign_mode",
 		.mode		= 0644,
@@ -5199,10 +5206,8 @@ int resctrl_online_ctrl_domain(struct rdt_resource *r, struct resctrl_ctrl *ctrl
 
 	mutex_lock(&rdtgroup_mutex);
 
-	if (supports_mba_mbps(ctrl) && r->rid == RDT_RESOURCE_MBA) {
-		/* RDT_RESOURCE_MBA is never mon_capable */
+	if (supports_mba_mbps(ctrl) && r->rid == RDT_RESOURCE_MBA)
 		err = mba_sc_domain_allocate(r, d);
-	}
 
 	mutex_unlock(&rdtgroup_mutex);
 
-- 
2.53.0

