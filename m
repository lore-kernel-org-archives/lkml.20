Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259497;
	b=mfkyqWOgFYJ2QEKI+u2yB9lj9fxGrGL4pCIBW1mMWAJh+YSuB95nKuE5hZue3VtDsHfY
	 3HpWfAMuFFuEP9h6gzNGF1+sYqeyEOwDjyiSlNU+iBdkne1LAPT8/Svxd23sr90yEjQxK
	 0XIEfbuHD2jo9dOr8YzeQwfUXAFFJxicslpcYrjSnKQEzLA9eE8CgQGju7z1Y/nLDmbE1
	 bnxV0B1foIDfWzftFZ9Cb+Ot0yRDCxI3Zk/VJ6nOSlXkDgyZ7PAm2r00AiL+7Pd6g8R6Y
	 XT1Tx8TYxPH49I/4stGBadLV9MvBl/0nbQXPKXti7434RKq+UCFeaNLBw6jzv3T+dMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259497;
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
	bh=J9ztcQ1vROxjDuzaccw6YtctvOaO5WlXGflXRvMOyAA=;
	b=YcJUZJ2SxPBCrgEwd99ZuOIBTI1ZoE1Jg6NIrmeFkZbRhKQivY7bDcj+ygJHLoUyvRWF
	 AROHoCVie/n8iPVPtqKNCVj9PBAQKbRnEOeZ1EV/vAXDzHqZLiOxYr3A5ghjMttlLmpN/
	 Uurm5kXinNmo0GXZH5PRdpjesVSuGS1//72qa8O5eOJCHuO2vtG6CEim5lmVpGWmBOViG
	 sMEOpfpnWoAnbLHddqC2XTeISNZJtXoYlVjexQ5XuUKZIhUXBJfs+UptT5Qdu329nSfJ4
	 5s6tXcKHB3ZcO+dfrZmnCthawqHUZFYEVtptRZN2rbfD967ENlsMfw1oND76QeQCcSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZX9DZzME;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.29
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012029.outbound.protection.outlook.com [52.101.53.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D56606A336
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09D56606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZX9DZzME
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWp1G+DbzIu9bTWwoYXYHO/19mOay81KYz3Ukv5q4/ro5f509OHp2T5PYtCzAI4ZVTWSUnB70PrzbwP2vbWyz8VskTSHbXRWNMtergdPyV3wWqJ8dBvQGzXgDVOha8E5RhxAHMfCddI/btFTT1HFRKWBppaLGfF3dn4XaDmbJeKRw4xLmwtEauT5xZcmZy11gKKODdlWe4xUidqbB7Y2sgxT72Dk6iAN4s23ejhKBVz7YuZL05I72dFK9MalEPh+QJE3kx81a98FMJM4E7V4ucyILfCqlYlKJDOIQT7gRF+zs5SMQqqkJE4j1h3mbH+7nORWwSI+u9Cg0nRH3Q/DLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9ztcQ1vROxjDuzaccw6YtctvOaO5WlXGflXRvMOyAA=;
 b=ukovOc0/71h/iW8eN3jGlgrZHL3240qHr4HWzWN88VozM1klQOYXwhTzBsptlmIRBQOZ8647sKbXzG87bycTFJuwnG/y+QamGqw7iU3Un1+a7eYMfvSEkRgIZ6mzjpn6qUYgEYIfurx7jUkEMXrkXaULeHqYsZBu5GjL22aK91zBL+0pnhb0eACjayMJedIRVTaUriP2DoiocgFNJAJURw1AfhUJDAGvFcRfvTV4PmJEQ+kyRb0+bjXZJLSg1oRICokFle95yqeRyTvqPDPikeMKjWgLTPfKV0xinlQKLxr4STyRxjIYBwLwQaNO6ID5tk9fr5MBYnaHAO6A31B/hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9ztcQ1vROxjDuzaccw6YtctvOaO5WlXGflXRvMOyAA=;
 b=ZX9DZzMEsBodBe20xbhdGQc4Q0R+xAFK2tF6WFPxbR82Cbuo3yneZ05kQxwuHcEMnBj6ou8L9L6+FN3reaym5wRiuDzLeiCcS4zbAGXFtXtVV7Kh/iwdF1uCfHUaGbxAUrjTAq5CkDiZqbRbfBYHupFZgnKyQRGq8obbOYOQTuA78FLLuhzfpXEIGQAlhps5LSupu05NZb///Kxg/0xHUyixhWnyxM9voMMmQb/o395dcqxiL64BfMYXRMcHYEZR9hlWWsOyO0hktdcIX5pqu5rifZlHypwhbgRl/fQyBwSOte4jhtEjN2ugojjWFNrZXrDOI/iAcaRrSBi5R58/ng==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH7PR12MB5975.namprd12.prod.outlook.com (2603:10b6:510:1da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 21:24:51 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:24:50 +0000
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
Subject: [PATCH RFC v3 14/15] Documentation: resctrl: document NUMA-node MBA domains and mon_NODE monitoring
Date: Mon,  9 Nov 2026 13:24:26 -0800
Message-ID: <20261109212427.1409204-15-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212427.1409204-1-fenghuay@nvidia.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::23) To DM4PR12MB5230.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|PH7PR12MB5975:EE_
X-MS-Office365-Filtering-Correlation-Id: cd389426-d0a1-4efe-e215-08df3ea7e315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|18002099003|22082099003|3023799007|921020|11063799006|56012099006|261026121527099003|261102123227099003|261028144727099003|261021121427099003|261022105027099003|261021123027099003|261026140227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ywgpsYSl9UdHrqFQ+E978hxKfXxZo0HDNk5wkLjRvrm3+7t9B3lTYxGOGygNDkF/csB1KwgSVWkQClQD5fSQcPOyt7lJplxcio0YqIg08GUL8N+NUtgTBnUdbrEo3ZbL29ly4p8FOg57LrQylJcMLyCOTfL+nZNdg/FMzx5JooIcV4SMy3mNYhqj/MuOFTJspthIxRT7kBqyWyEydSWV1Q6BGPCK0/oidKm5RsDLLhHZd7PrJFL1KHyLNzK4ScwQq9fBgAR7CeBiK7YSE0iQoaZ+UvklzXrKKEpuzBGv9Z/KIyCl1QPb0C4NQMFxTtB/j5scoCRSCc9VzX6mu6t8+T8ObeOEe83EGtFMsM34/Ltj1yKSPCT1V9zKCPSxQLU6z9N4aR7d17ulxQHRrFfPMjSInxfB6D+8sNQK129My1QpHqSzvBHTXIE7myGE55porjlpZgFtAkygJhtC++ZnpUtgxBM5Z6pw8wY2GM98nnNpItSEuFZqRbFzG0QkNIwPc/ri1po2KmVBnHKApI0YP0FnXlo8STIMvbwIbC0SRIAJqXQV1GGqsVIL2nwntAyXllx+perWrl6+30MnodSLPvxab7Dt/bcVKvn+YomSCPpiiGfxlnEDnkvgmi95DQCEmhZsMyDhdkw+5k72p+bQsEdJnLqCd2VNeQSoBtvDwTHr1xUfdnsm8WsGYlZuEFgu24Yye2zkIh5COODIsdjUYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(18002099003)(22082099003)(3023799007)(921020)(11063799006)(56012099006)(261026121527099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261021123027099003)(261026140227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/VLDZbbjKt+mdl1Did1nM1Ol2cxJ4LSs0ENdRMTE66dIzOJsaUT74gDQOheu?=
 =?us-ascii?Q?i/6ywL4TDnk4MS1W02/jEckTQ2E8S9S6JOakFDTgPr+UfW/aS4KBAAoeTinq?=
 =?us-ascii?Q?vZ13r5SRS8i6w36w6lZUBqqjTOPBHBYTxFuAHT9NAd8Na8z6vI+eizVnBxRp?=
 =?us-ascii?Q?nO15aE+DWPT1Sox0P6iUoQWD5Yqs/+QKtwWYNvyVCQI2IlxGTgUIJBA8HXjl?=
 =?us-ascii?Q?NNMTEHtzmgg+53O8GeZlQiSwMYhTqLsZhy5/6aKDusb87A2eaHGomuyRr7TF?=
 =?us-ascii?Q?LTYDJgaYl+VAXzxSTKGiDVFn67u9exGqXjpE9gnt2XPrPjU8jI0NINDf5LKb?=
 =?us-ascii?Q?7cEEghNEiL1IML8vdkAkLPXiQoMU3/84RmOFAX3+W8lNysR1spHjD8heYxaY?=
 =?us-ascii?Q?iZOYbu2dVOEsHeVZKHDKrcLBc9LYVdHux3L6J1b2g8+EKezWhownwUQPRX5c?=
 =?us-ascii?Q?fjLWxCaM//2FUxnBrO2Loigfce2BpRllcc7Fp+0lbtGPpGZfuAH2JyEDjfKP?=
 =?us-ascii?Q?X81EoqXYOtkhoCGi8BX+KZx2QklIIfwT1AS3gBbvZCwBe7QmUex6KgtacexP?=
 =?us-ascii?Q?VXTHIrOuFlOtD9UF4290pXL/qNjPz1f43YAytCuiRmD35iPyQ45NmxLCYnKv?=
 =?us-ascii?Q?IiMz8P0xWd1qf6LhrzWYvz+6LcxyT0twtHdpRCdtmfBx4CJ6SKrc5/XvzNP5?=
 =?us-ascii?Q?goGG8qdS0bCE7UyPi/eVTdJJFVj0qo1QUa+At8Yruy0esfPgG/Ul2mLcRGi3?=
 =?us-ascii?Q?KebBJWJsYlaSvrpZn2xmzKgw2Irm0xxPlbQvS7mMMjv/eQwJ98ORX3Txc7Lg?=
 =?us-ascii?Q?opWizVMhzg74aL0dIBl2HimHoZ+WaleQWL0PrzeQ6Dy0yRrjojRD1Pvh0yFl?=
 =?us-ascii?Q?LXZbAazosivOAqWugksI3k45NF7fDNKW27LjA4yZ8BrpYzCwo8vHuT9PU5EQ?=
 =?us-ascii?Q?0l9FLtfCPJ0WNrq7pNPKshJQgcJhNp5fEd5ta4wY5yWlDyQ0WkJdqYmz0yK7?=
 =?us-ascii?Q?mnfdVuI5AHCyW7wm7PKkCW9NrS8+WjWGyyrdd7/yZLzeZPc4DP0qAzictKtr?=
 =?us-ascii?Q?CowNKNDWbdWLRjSwiQYQN0WXAcRQmQ0EiXwWJlOndZCS/40DKRtXEzISvAUV?=
 =?us-ascii?Q?Lwte4Mjxrb8JuaasbYHsBjws4FlQ0uIXQJ8xj4WpfujO+vBj4hpf3m3Njoa4?=
 =?us-ascii?Q?g5AfAcgvX7uA5LTft+oEArfkoex7sZOatLkEWIQS801neWfQzO+ZTAuc3H6K?=
 =?us-ascii?Q?cjnNztet8IvYpbQUCsTBTVIQeu4TOpD9zvOXaREkorX4j2UXHr5SY4F3eOo7?=
 =?us-ascii?Q?Rh4HhyLij8lss2+zeaSFp5bQrsiBrzYTL4hNSjVJtMfl76oiqJRH7LkOcLpd?=
 =?us-ascii?Q?s/g6oNzOkcmmTg1Vsb7K4mUue5KBc2UpqCPyx1fuFnCXGvD/lPSUOLXGZMu8?=
 =?us-ascii?Q?1UfT5HnnLLaQDa1VnoM9M2fvPJoiImIgB3IrrTQYSo/2IKbJJccSZlbzRkLH?=
 =?us-ascii?Q?01qLw0z711M5YePfQdSMB4lNMs0Aj5lOcN7eBAh0pcgVql6oUYM/GfyluWWQ?=
 =?us-ascii?Q?1+ZhZ999EumV56ul6VJeFkB5pIyJRaKOB/VKtTCJyfCJe1IpUSVl0X9YULHn?=
 =?us-ascii?Q?lpIgmZ5izK0WpZ5exAnIWROU1Dc8NzciTfZ5s6haiH2aI9Mw4ayb0wOMk4bA?=
 =?us-ascii?Q?+mwfKX7Zy98h7tkBySev1svjKOt8X7aiJeFxkIPbnsznKOP1L0wkGPlh+YQe?=
 =?us-ascii?Q?39tiW7S5lw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd389426-d0a1-4efe-e215-08df3ea7e315
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:24:50.1172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AD4wLeXYnyX+Amy+WNkYX8/d8CWukNHmnQnJVL/K93N4yIJu182QwhQ5W21nsWHESJHB+3zGHDNeiQHsgC0nyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5975

On ARM MPAM platforms backed by a memory-level MSC, the schemata line is
MB_NODE and its identifiers are NUMA node ids rather than L3 cache ids.
Document mon_NODE_XX monitor directories and how to interpret MB and
MB_NODE lines.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 Documentation/filesystems/resctrl.rst | 41 ++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 6ead819a7a2a..b7ffedc02b41 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -285,6 +285,10 @@ properties. The name of the control is used in the "schemata" where user space
 can view and modify control settings or portions allocated to the control group
 as the control's properties allow.
 
+Numeric identifiers in a control's schemata line are that control's
+domain ids. The same ids are used by the matching monitor directories
+under ``mon_data`` (``mon_L3_XX`` or ``mon_NODE_XX``).
+
 For example, below shows MB, MB_MIN, and MB_MAX as controls for the "MB" resource.
 
 	 info/
@@ -816,6 +820,14 @@ When monitoring is enabled all MON groups will also contain:
 	each instance of an L3 cache. Each directory contains files for the enabled
 	L3 events (e.g. "llc_occupancy", "mbm_total_bytes", and "mbm_local_bytes").
 
+	On platforms where memory bandwidth monitoring is associated with the
+	MB resource (for example ARM MPAM systems with a memory-level MSC),
+	there will be a "mon_NODE_XX" directory for each MB monitor domain.
+	"XX" is the NUMA node id that also appears in the "MB_NODE:" line of
+	"schemata". Each "mon_NODE_XX"
+	directory contains the MBM events enabled for that resource (for
+	example "mbm_total_bytes").
+
 	If telemetry monitoring is enabled, there will be a "mon_PERF_PKG_YY"
 	directory for each physical processor package. Each directory contains
 	files for the enabled telemetry events (e.g. "core_energy". "activity",
@@ -1152,19 +1164,40 @@ or
 Memory bandwidth Allocation (default mode)
 ------------------------------------------
 
-Memory b/w domain is L3 cache.
-::
+On most platforms the memory bandwidth (MBA) domain is the L3 cache and
+the numeric identifiers in the "MB:" line are L3 cache ids::
 
 	MB:<cache_id0>=bandwidth0;<cache_id1>=bandwidth1;...
 
+On ARM MPAM platforms backed by a memory-level MSC, the schemata line is
+"MB_NODE:" in both legacy and native control_mode. info/MB/control_mode
+is legacy by default. The identifiers are NUMA node ids::
+
+	MB_NODE:<node_id0>=bandwidth0;<node_id1>=bandwidth1;...
+
+Platforms whose MB control is a cache MSC, and which have no CPU-less
+memory MSC, keep the "MB:" line in both modes.
+
+Example on a system where MB domains are NUMA nodes::
+
+	# cat schemata
+	MB_NODE:0=100;1=100;2=100;10=100
+	L3:1=ffff;2=ffff
+
+The same NUMA node ids appear as "mon_NODE_XX" directories under
+"mon_data".
+
 Memory bandwidth Allocation specified in MiBps
 ----------------------------------------------
 
-Memory bandwidth domain is L3 cache.
-::
+When MBA domains are L3 caches::
 
 	MB:<cache_id0>=bw_MiBps0;<cache_id1>=bw_MiBps1;...
 
+When MB domains are NUMA nodes::
+
+	MB_NODE:<node_id0>=bw_MiBps0;<node_id1>=bw_MiBps1;...
+
 Slow Memory Bandwidth Allocation (SMBA)
 ---------------------------------------
 AMD hardware supports Slow Memory Bandwidth Allocation (SMBA).
-- 
2.53.0

