Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259483;
	b=f2fqaxSnQsbw0j1bAZXRjiK5CxFouyLrUdpmCptpIsuiTlyq0jYBPOAWRp5XC6b+a3vd
	 eLEmfgYhOuiijWZtyNlHHrEDusmrVAm8AqVmbJH/SCRlFdN90MJlIECRZFh5Kq/7qf0V2
	 8lvOndEhiuXMC8JadD7yfLsp1nhy6P08mtaOEyXEVcsPvTY3/QYYaOCKycsAITUfs1Vof
	 MZY9nnU3NrTf0CSNLls7tC6saTB9IldbF7MwGfn9sIO9umC7FiksmA+bPLjekHwiURDvP
	 ViqQwg7La/BVoptWpq/piv2JnO1cytuYFvJPKgr+p9qH2/o624LZb513dOv8moe2Lrw==
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
	bh=LTFJdHxgRAfhIWAUhD/DRScVBoaxUizH7aHqY/JI46k=;
	b=XGdjsUxa4xkU/7EsqI4Yuc+QOoSWz0RXO+3CVcs0q0mQriUsizzG1uAwOjGmscwBjjkm
	 Ec7tm2vWe2+LT2z1i7ilypg4kzFlXEZxKSqTaTcAyBenP/aIWdxWQ/lpVklSuB7D3VDom
	 nJWd6eYlxBsIQX+29QQO3iLwclFJbsVlublSS0DYJmLcXw401n+LGGByt9HRg9nYG0mSB
	 bMOVrBMjAert9+Amosp73TOvMUg+IKXEqHHCJPYPMu8j0fLB0fLuAlVW70CxLxee4kbvY
	 8iOY4EEAAiRaagOSFaG6dFE0v4A9IpffrvhT0uu+BitOpTNBG4e9Oww3WEHX+XzPpbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Jyn3xvQZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.19
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012019.outbound.protection.outlook.com [40.93.195.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EC1606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0EC1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Jyn3xvQZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZhFiTi9PT4mLHyf7UzDu2Xm8LGRo/IppQq546OMWhtGQ6Xx8AfqF0tNdql/GBxbFkIpLl2C6qb+pYOeLodZYdM++YHcuXrUMufnl5TCTN/ctza/QCN42830kVDlDQC7DMLyKHfPSj6ichbegRhVp86XmpWfWsjWLVGdd7PmMBqcncI6MMWxLETsDj7bLTKQo6BwzIRwV4TNzT3EvJhgVHnvFSRi2QJLpcesLSjkzbcoYg7Cu965XZGRdVwHCbtsOgNToN4PLZAKPT2qfOmEZBliO1Gkks5JJX79Xw3UQOs4v6TR2md2/9dzB14ar2F3XGYTeCdEseURmsTTwG78Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTFJdHxgRAfhIWAUhD/DRScVBoaxUizH7aHqY/JI46k=;
 b=GXIPlaHMVYOCgpaMTbzxcJHOZNEhdT+vBLpPcSuaTVVoXB2lsQrrb7J4nJyv9w+wUZ7WJp2lGz9H76X1K+PJaZDQ1OYlNwzvghH9uIimq9nOWYTG8YURSU/ri4GLrWuKmNuGkiebOO8iK0sZt+MACL7Rt4+KLmQscowIRIRiJcSYpGPdhRI+PzTvs8w96RX4KLq4RJ8IPr3ZEVhnquWhuY7XJI9Lzowj7Vqrzb9e80NpwNsSzb5o1LJabfAJJ/b8md2L3F2KHENVedjY2BQPz5M2C+u9ORyLdL7NNESWwB2p1F8pWFpyfJNJYiGBVp620+6Ng52wTkFvM/7Xk8cwEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTFJdHxgRAfhIWAUhD/DRScVBoaxUizH7aHqY/JI46k=;
 b=Jyn3xvQZtd6XpFrfoof5S6enJAsMzHEqZH2jX2j4ZVRQ/cMaO1ZPizTT3EjcFNF9fTtbCasbWw3IGBY+dkL7PEHSt/x9q2qB/xxLMTMWI99vXE8ypP72TAIbdTrb9kPhkhvjIJvzikslmpYf7JocgxTQmGwafmjb0iboBbA40NlQGE7ErO2Xh7lHx7jfJTWlzjv1MgxyQC0DYpGw6e2oWz6r+5wDPsCRZ9yQpfWnxbX6wYHo/JoigzItffDqdkp2qn/DNxdIUW7OQRePdVA/Z8+C37HrHbBlG2HGMg86dqTEDoQgpnslf73jeHNNLRSOmNiQhL4Ylc5oEwXGfD1YZQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SA1PR12MB7245.namprd12.prod.outlook.com (2603:10b6:806:2bf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 21:24:38 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:24:38 +0000
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
Subject: [PATCH RFC v3 04/15] resctrl: Add node-scope MBM total event
Date: Mon,  9 Nov 2026 13:24:16 -0800
Message-ID: <20261109212427.1409204-5-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212427.1409204-1-fenghuay@nvidia.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0043.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::18) To DM4PR12MB5230.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SA1PR12MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: ca66213a-4bc9-4aaf-da8b-08df3ea7dbe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|921020|11063799006|261021121427099003|261022105027099003|261026140227099003|56012099006|261021123027099003|261026121527099003|261028144727099003|261009223027099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6F+SXwTcAyCyFJPfTbVQu+jgxwHIdSRj0TRcjnI85i2oOtzHvJtSK1FzvpumGLt130gXAtpW3yqZLro/1hu15CgTHeivfnlU8M5PwI20G7Jcjd7t6yM7KuOu1h3fmnEsaYc/4KrJmfCCKAi08O7ocrz1Yfp1U5CnPIzzMUHn+pWD3ceG/Jp9lRPVEF6KMB58VNdz6xPL7jk9Zfih9F8KmWadHzuiuK25+q3gxdU1eOU5MNLaA4ZxY5wLtzU2VvT+qqqnBTw6Lx1nko4AWKH//4IAC/qpzOLWoTSPWF1WeG+A88M5TKQyGK8XEsFJ/tONEbcj4+0JwBQJcntZhiKrgsR9vqTBURRSDIuneTWDxPl1zYWfTHumsaOrqxC9wVpmntpBe7cGTCnh6K6xx1DbXwrhyK7bo2mHvhObZWwcXrYBJnUohIb5MNw7pZAhC/9DrIHQ86ypWWSfqIPMgDhSyAUdgPu8YfTx1immY/XCwuIfQUPkVtlcSQxCHO5wrMwz0BQVsWJAe9YpC8FNzFfj/vbbfVBPX6GK1F+EBZUz+x5GeTGGGGWg4flWkdpLDsNExv+ToGkBLUI/frC9yUe0D7IbEsOLIoRkgCFAtpDiy9Ac2E1iD4MLmdAXX1DVS/xMOgCSMNZFe9J6E9IaFriG3mqt+7A7v3IhCXaieFAOQzhNcJLUBmz9vGhaES+zfu9SLHkY9K3WMYJV/Bg6fGP3dw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(921020)(11063799006)(261021121427099003)(261022105027099003)(261026140227099003)(56012099006)(261021123027099003)(261026121527099003)(261028144727099003)(261009223027099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6cNKP46FAZMZYPUKy1dN8zDnBXnLhqlLAte/eDnEhPNV9yNaWRj3q8iip20g?=
 =?us-ascii?Q?jFEFQgG86bGrlL0BILgmZrfJNtMOov3HZmFmPGYuX9EP36xcUO1GwhXStmck?=
 =?us-ascii?Q?M7Glq0y6n/TQccl4V4UD8MJtWUpFcWW8FeTK6lf9YHSzu7U9apS3fCf1BW/6?=
 =?us-ascii?Q?SbS1kwqoc8jINcGXTE05ZPd4gVUUJsaSynM4jr14MFhPwvbDA4erDvZDJ+L4?=
 =?us-ascii?Q?7qzB0omFnlVq8pDPMvRbZkdrdJIqZiAOK+1LjcChj7H1jp7BmhMfTP+/5KgC?=
 =?us-ascii?Q?NxpIlMmJJ+BVIM4vUMaeNhcy/+BcMNTYU6GouGB7dHqu+UdLV7iAAg/B3aGd?=
 =?us-ascii?Q?OPM6jMPlA61x5WgFg0XJG4iHP8iKbonhFEWiWTG95vjqwpVywsXUEIb8ZOy0?=
 =?us-ascii?Q?NijYTYc6bv1wztLkCaojPGAhtGrO5v0dLIf6YG/XZQ05aSYer0vwsA4t9lCB?=
 =?us-ascii?Q?km2+2gZto0Jz8/jHC2/ilc5bPJUYLhsC6qDi/X26XvGwsnMFjyNT4J+U4tFH?=
 =?us-ascii?Q?3IhLTSwFYwBd0l5iqjSyrIxlOXjSInvQzLm/7GX48DWP/jbVt4PWohHTIOsc?=
 =?us-ascii?Q?5AEkgfo87VSyKjtua2lVSXYjEg4cBA9KyNAS/rhMapccCDugFTe9ASwQ39sP?=
 =?us-ascii?Q?5SV7VcZWQOPMsGb8hjBYqky9twn/G7a6doMoQMgEwkuqz3NKhMAA6E7CWamI?=
 =?us-ascii?Q?QurRF4xDvGLyq5WRaSSPEYkKYNKcaJ5DjeCfcmiJz0ICs3/hekmbplXNehXF?=
 =?us-ascii?Q?v4iqtt3Wjqg4l3yb7oYLSN/doZvlW8TwSwRiYRG2R+97NY1TXeGOkmfDvXAd?=
 =?us-ascii?Q?EWyxDHdOpd4If/YqRiOa2twU9WMr8k3hEOHPTWCrcC55XYU9IicMY1ECzpwb?=
 =?us-ascii?Q?PjVifHRv9RBB9qTHFo7CShjmzTWwPsnPRPjJQBjZtzUyi8A06NC0g7jC2dYc?=
 =?us-ascii?Q?h3oM9OWi9k+x4nzeWlUJ7UZo5ZmgHYd9/D5OQub5oDiQu5nPJJE8q0SM7XGo?=
 =?us-ascii?Q?bkBqkC4yKu+rMT5CtIRiWna49hsQGXxK7fhsfSQ5PlZfakDM+p4wp3KdeMbf?=
 =?us-ascii?Q?9pfT+E5s1kAE5q2rbb1/AaGBnrZsfxzARf6PmcgK6LLVganmpatPcOmJ0Tqh?=
 =?us-ascii?Q?g+pj0WbjDFbMhwG3fX66gfN0uWHoiKK8sLArxwzsvD+6LvRGx62FFl7okure?=
 =?us-ascii?Q?cz6QlD1mYzm1BzDW2lf61uXbVbbw6Mg/xbX5jySfVPrWh2h5LZinEp4mJkfO?=
 =?us-ascii?Q?qRdJbPGJzS/jN9h1zGcVacfdtpL4LD8sswQOdknH0o8kwVtUUcQ+ADeBSWgL?=
 =?us-ascii?Q?1OqvsrD0w2ma8JchZse41b4Hoc2y0ud1sQDY5UmjfjL6BqkIvyefVN+VUibF?=
 =?us-ascii?Q?M6BBMVi1RdhW8SN3BwAcPHY/z33TaI2hvsSR1cRq7PWpMJ0a7GmCILxpW/D4?=
 =?us-ascii?Q?iha0JQlyT/pUHXOMdUJY3V9c4bamYmQLcC45KE+8TiEY9HJECQZjoAzgNml1?=
 =?us-ascii?Q?6tu2n/5vcEPTel3UGCcvbYHrzskxk9JAWBJcc1YfKskNF0Fxmc157+nkcxrr?=
 =?us-ascii?Q?hCD4yKzjVPZQmoJ1DsJ6GbjxM+DxFT/FSPyFxFSyfbUcJDiobFAt88qAghI9?=
 =?us-ascii?Q?iNrva1AlLOCJzBT4M11OyH+DK+EZfyUEV974ReNWX6aWIcp13RQzStRwvErj?=
 =?us-ascii?Q?rlRes7K8fr5enqDNKaadOr8A410R1hus2z2eYZEsjJayl2vSGtMZ7TNISb0E?=
 =?us-ascii?Q?AWjXSH3DsQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca66213a-4bc9-4aaf-da8b-08df3ea7dbe8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:24:38.1146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C09N1YLKNFIA+YjbMi4z5lEEVjtC4/tfDHD2+BjyTFdYmc229uFG0um+R2forid0OTVSK5C58J3zZsf01nnPzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7245

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

