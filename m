Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259788;
	b=ph4BagcnxkhWeiy5lipm5mySc23vO/CQT30VN1LPicJhEJ+zln9GKid4hwGMTKz+m/5C
	 6ZHs3n5ylak83mNl495NZiB03HOevpjfke/bz38pcXQnJmW5li8dBVWlFbqMjsv88VooG
	 SlgIlvUynNanrQgMlEbXUyiUSmHj4V2hHndQqkZE4x81B0oHlArqwLZ4t16AaEFmFocE/
	 eyKZbdZ+8rdFKkaGntI031jIwwKpsETqQza6lHJmkRo1lIgHw1rFVXIQPDGcXF6aLY2zH
	 l0TAPydbPbpLGGo/ApbwlnherxYzjpnrBA+Q22PB+ZbfjdtGKGevPaVjt3I4KQ2qzlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259788;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=/brOQxQMCzYwb9094OO+jfFYllSpYggM7uc4ISUxBwk=;
	b=iYOlr+wSXlCvJ3aCOJcYsCy/OrhgXWN2/fdGNj191g06LqBsphkY39UxS8u281DhtzGD
	 8hlS6HXu1qbl7NUP/i5h5FEvHl8mxPjxtppgPp3P/pJ8D1jva+OVvh3uaposrOiZ1M+jT
	 S5U0tejseJP9I9HciASVPcajlft7bvz1I5k+VhVNHqh2NXXF+YjC0VAJMGT1G22bB/OXb
	 sYAfkc70v4oPd0+eGl3ANXgKoJkILluFFyqIbDjJnm+GvX4Y+J7fr50J07ArcDFTIiijS
	 qK/siv4eXAijRjTHVlzsdeutJc3I2iiBb8FcjZBg1o8wfmXC52pKap9n9daHFaA7SiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rPavtxQq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.24
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010024.outbound.protection.outlook.com [52.101.193.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01FC606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B01FC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rPavtxQq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MuZ6u1pTa9oOn9GiLt8SmTeOcnzi2uAOnBmhy8dQtw42nLQ7ckty2MLXsetCFZUti+PJ8N05YVcZ/k4OWTEgOzCoKsqZeNH7Im8fzgt+gd2jna4HpetvwCLyDLWmGqMtKEq6r/m+2GdC6Z2Vv8jCQ8vbQNPv9qRA/7Wd5dg+osEUsdiZQ1u3kUXb6ZMQg4tgVb8+aVDmuAVztDdDnSHRHd7RkhaRfYheGGgEqQJDMslPbUIod3CjvJkZGQwQiWo3nDXSTM9l9e1wyJR4v8LRx/1eC4gc8xGNd23R1/bYdv4Wil1T/O8AOlqdjW2USRmU4rGy+LqGtgiQ3faUCko5nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/brOQxQMCzYwb9094OO+jfFYllSpYggM7uc4ISUxBwk=;
 b=OcNPYfp+DC38K+owdWjukhPqtj+q8WmI+rjQ48Vj9EtWmJREOdsWtRbhJ4B5d/Hi/ISJFTszDuXaCU/X6Cjmh3hG7pEGFhc7uFK2jF8pY/goTH+LYzyt0WIXdF17U/kg1UqyrA8LtyFmakbO3FICDQ5fkpWK3LN2JU/X9VLpfo36Mdb16V3oQqAfBzSm/nD0DUiuL0gQxtFUAIO4jAQaN0V5WFXAAwCmwmF8lBQauc15ljcktZYLgWFlBmidUxqH5VO8bTMgEqkal/6fLtG746deGiKE5IZDcq6BwR2sslVrxeVVnahhno+Oxw+Jl8fcR7Zh9Mza/IIY9pvCYZaMHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/brOQxQMCzYwb9094OO+jfFYllSpYggM7uc4ISUxBwk=;
 b=rPavtxQqsSJyHaq638Kdq3HmpLXO315b88QRF8cdDjz13y2pNsZI7G/6rQ7lfJvCoPGxxjeGSMoc5vccLBtgKOHd0Vq2WTXK5mhLIuKPoav8SZyI0l0mKaAxRtipx5mSzYh0iJWnPL3b8vQnomMe1vVrYdE4mZ+41uu1ml9aN+sZ9z8F/ZdHmCL5pe3RX7GW7gnTUyzy2bGSVQqvBzemshqMvQiPTpXc2o7yDsKyGW8G2VxfRytPgUz98xH7R6sF5NLgjto3mxgoCaVmHgQhhU0FGuGl5y3ZDdWineXv6aD3npOOAkttqfx5ondsihU3uMa3GwsgBuAhxOV2WWlhrw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 21:29:43 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:29:43 +0000
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
Subject: [PATCH RFC v1 0/6] arm_mpam,resctrl: expose MPAM MBW_MAX hard limit
Date: Mon,  9 Nov 2026 13:29:31 -0800
Message-ID: <20261109212937.1409570-1-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::14) To DM4PR12MB5230.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|PH0PR12MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e8b879-0160-472d-0d64-08df3ea891c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|921020|11063799006|261021121427099003|261021123027099003|261009223027099003|261022105027099003|56012099006|261026140227099003|261026121527099003|261102123227099003|261028144727099003|18002099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	BsXV0k8TXXK7sGGE2N2RYIbgBCZKq3l7tJpszdO5IuMnhlhyZgw0WIGwAxcMsLHoGbfGlaJxeK2A0rYXkkm/WWPRYkNq4m0GS+iVARSJk+jzJxhVJnXWXYf09TzL7J2yWHatwHIAn38SsytCetKzIXt/mnhBZ1KLdK8/1k2RYXabi9UvMHURBx0xuFrUT6hiwVNvtr8iYtx7mfbgtaI435t+LXNDYOSqg+UM0JDJO5F1ohBTetEulWX+jqg/gKQXba9mvCUef00gloL2ca9giNMqV5KoErDGuEd5r5VYW0K0YJUbKnBtxsScNWJ1box6FHXlF74whMoztF8o3XKICGinbWgY93AyeYbHwEBZ1SWiI31+I3kZtvie1X2AvjNvh8wG88ArW3dPhT+zgjyXdhlUPJw3l7qUq5vc7PsVekkS2M9PRxv4J07JEc3TUsREuYEdUa3C34EGsT+F67wfLmzkMK7eneV7TSEG5M4kMNaUcCW43+t06q5f39dRd/aks+lcwXP4j/eVm6Z1azBcz8TCSw1hUO1Qk/4qkxxcOGrlbV/rz6KALFwrj9I8acXQW579oth8DUgucy1RQnaYW1jtnEVN9SMrCD1Vjfi7J0ovd8WJpl9A01WFKB2ZLJ0xDP87l9+VW0zDoRw/Sa7SFmxAud4Kb/b78ognpQpK63VDMenekWAPjb1n+J1Ita7zMcmJojeq5NIldI4xritzKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(921020)(11063799006)(261021121427099003)(261021123027099003)(261009223027099003)(261022105027099003)(56012099006)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(18002099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xAvUFfLzYzMSoZnpdIsVL5Zh1lF0yyWL24i6ompuXr0J8hJxyUYPRh4kBGOl?=
 =?us-ascii?Q?v0u6dCRzRKSIM+DggOMMae/o9dBZoLL45m7akvqjp94rJtvpUozQ/odBz3Kx?=
 =?us-ascii?Q?haMi4bRDKz+j8XGbMIXO6YwQo+UPTOAg5GpNNyAAALknPZNt623vOWvtWkwa?=
 =?us-ascii?Q?BLwgbZ6hQK6DAc+JZfBKYc5tJgYfYEsRY4QdEL4Ar6BpdlPamD0nN4kMgcb1?=
 =?us-ascii?Q?/dBFts7GUVHCo1TS9RPP3IOBJbRpaAx3OYiGCkpAhtNlRoraFiWsPze6/uFX?=
 =?us-ascii?Q?IMZARh2Ob3yX5qXa1+dUepILD+bfgMOmWwSTI2rkmHza7nFUHAKY4d6yOCun?=
 =?us-ascii?Q?GVhvXjaA2RizTyOi87paVyTkaOuPYeoxDcA6xy1s/tHUmAREg93KHqfkersS?=
 =?us-ascii?Q?zfDA+sB1qTSWmaMIo3RSSMXRX331E4PK8AL1poLCnACGwphK4fIm9fjvpMSm?=
 =?us-ascii?Q?VxiBbsszoqYJ/6YMR38IDRqqkNNoG1RNNoAVr0FpK1sCm9lsKlkhKwX02cCr?=
 =?us-ascii?Q?rX6PCrRR/pSPs5qCuyBtakZsJXrDgYoNnEWlSWsKOQxZKzraRt1d7wae0dju?=
 =?us-ascii?Q?sSqnHrq0LVVa7yn78xgOaz6dUSty3kqVSyq/zjueFBTEU5Lb7rKJd3lMsAQM?=
 =?us-ascii?Q?BHcopMSRHqKAbHMAsQcwIfeN7Khqw1RJ1R8q1u+Epk9tWlGnTe7LymgdLNaD?=
 =?us-ascii?Q?22aZEDVbCxbQk+BhS/YnZ1hw0962PlnL/66UD9SylJ/oZChAdUgpyhmUEcP1?=
 =?us-ascii?Q?oaiuHTOFk3iCNPUXafnc8fsHnUZ/DGbqJxlFn7bu6Bb9g3L0s5kvzibvRckR?=
 =?us-ascii?Q?+i/0dzMJkhHvFrn2mOTOtAU+w9U0artOfwxEibuKdwbIqYcihnnlBkp4RfER?=
 =?us-ascii?Q?/YJWhgaUMpfFOSiwFpoWJW3KwbZAAoOJTpSdIIB+X5b0pTPtCwq/uN7Ruy4w?=
 =?us-ascii?Q?KFSuhY+/I4nGvmvB3+rCKbzz4MvavpA8IDgk+B/PSdXmfHwsHI8AcNJBoDF5?=
 =?us-ascii?Q?gyW7SfW+zqxXKG4fmdd1NngY+y1NrP+VAlD/TZOa9u4zJ1jfSoOP4r9BtUIL?=
 =?us-ascii?Q?JEQAhqvg+VODWvmYRJ9mb4fbY14pO5+7g7+WJE4RfwZ10oUfIEl+WKFl8A+y?=
 =?us-ascii?Q?tQPF2CmAzO/zhGQ7vs7oCDU3HpQ5uM6kSw275T/6s0pefYNOAwbM6zYn0VaJ?=
 =?us-ascii?Q?YUgQhYz00NZxPSATyWFESFWvP2hLXle/ZZ13EYx8Z+M0kjQ6ixGDUqSHbjRy?=
 =?us-ascii?Q?lBw5Ck5ytrWZ6HSlD+4moTMF/zOCm2Lj130rrgUJBWJH9fe8xwbhk/K/H9vZ?=
 =?us-ascii?Q?9febDFSkkbv2/cBqAb8z6+j3dgw/94mG5zaXcAHJde6unL07xKMTY0Omh5pQ?=
 =?us-ascii?Q?pVP3F2GFClk74h3FYeN/5MtmyTkJ9kIeG+ftih6clXy+7PyEKRU4lG4aZuPc?=
 =?us-ascii?Q?MFl254+eNqgNKG4EWqJ9Sr69BtLBJMGS/BLWATX4w80CoziRBb9eYS2yyEnl?=
 =?us-ascii?Q?IQyKdgNO6nx6J2o4DfPJZZEbqrR970FsuaAD0pF2ZmA+x0H5Z+aYTdXfmq7I?=
 =?us-ascii?Q?vJTgJT9tBXL1zFCrsDfSlWEBheDdQhP0hUcQwgM49UZmTGDDwMM8hADiETOb?=
 =?us-ascii?Q?aMcoERh4+vIG8U1ST/WJTFr8und/J/OKaPk8K62NmdIkGqHDrZj5boJ/tXJV?=
 =?us-ascii?Q?fK2kx3gpjFg4D/9DI+BzujcjJG12K7GeFAMaLcCOtlpTuejc3A2TiB30+68W?=
 =?us-ascii?Q?9w1HVhgY1w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e8b879-0160-472d-0d64-08df3ea891c0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:29:43.1742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHWcSIcQjJI4AJiVvI6gZFyZqKfGaMgvlzbT73YckWm+iTud8txe2mDTgW1aROIcd13q9xrMI6MRXe1RiWIPJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031

This series exposes the ARM MPAM MBW_MAX HARDLIM bit through resctrl.
The MBA schemata line sets the maximum bandwidth. HARDLIM selects
whether that maximum is a hard limit. It is a per-domain 0/1 value, not
another percentage, so it is a separate control on the MBA resource
rather than a second bandwidth percentage.

MPAMF_MBW_IDR.MAX_LIM reports how the implementation encodes that limit.
When the probed value is 0, this kernel treats HARDLIM as read/write.
When MAX_LIM is nonzero, or the platform has no hard-limit control, the
schemata line is omitted.

The line follows the MSC, the same way the bandwidth line does. A cache
MSC uses cache ids:

	       MB:1=100;2=100
	MB_MAXHLM:1=0;2=0

A memory-level MSC uses NUMA node ids:

	       MB_NODE:0=100;1=100
	MB_MAXHLM_NODE:0=0;1=0

Please advise if "MB_MAXHLM" on cache ids and "MB_MAXHLM_NODE" on
NUMA ids meet the new naming conventions.

0 clears HARDLIM (soft limit). 1 sets HARDLIM. New groups start with the
hard limit off. info/MB/schemata/MB_MAXHLM/max and
info/MB/schemata/MB_MAXHLM_NODE/max are 1. The bandwidth control's max
stays 100. The control directory under info/MB/schemata/ is MB_MAXHLM or
MB_MAXHLM_NODE.

The 6 patches are grouped as follows:

1. resctrl hard-limit control (patch 1)

   Parse MB_MAXHLM as a 0/1 value on the MBA resource, and initialize
   new groups with HARDLIM clear.

2. MPAM probe and config (patches 2-3)

   Read MAX_LIM from MPAMF_MBW_IDR, derive HARDLIM read/write when that
   encoding is 0, and keep the HARDLIM bit in mpam_config so later
   MBW_MAX programming does not drop it.

3. Wire the control (patch 4)

   Create the MAXHLM control on the MBA resource when HARDLIM is
   read/write, and read and write it through resctrl_arch_get_config()
   and resctrl_arch_update_one().

4. Node scope and documentation (patches 5-6)

   On a memory-level MSC, name the control MB_MAXHLM_NODE, set the
   resource scope to the NUMA node, and give the hard-limit control the
   range 0..1. Document both schemata lines.

The branch is on top CPU-less RFC V3 and resource controls RFC V2:
https://github.com/fyu1/linux/commits/hlim.rfc.v1

Testing

Brought up on an ARM MPAM platform whose MBA resource is a memory-level
MSC. resctrl mounts, and schemata lists MB_NODE and MB_MAXHLM_NODE with
NUMA node ids. Not tested on x86 beyond compilation of the resctrl
changes.

Fenghua Yu (6):
  resctrl: wire MB_MAXHLM schemata parsing and group setup
  arm_mpam: resctrl: probe MPAMF_MBW_IDR MAX_LIM and hardlim_rw
  arm_mpam: resctrl: track MBW max hard-limit in config
  arm_mpam: resctrl: add MAXHLM control on the MBA resource
  arm_mpam: Add MB_MAXHLM_NODE and Node scope
  Documentation: resctrl: document MB_MAXHLM for MPAM MBA

 Documentation/filesystems/resctrl.rst |  28 ++++
 drivers/resctrl/mpam_devices.c        |  67 ++++++++-
 drivers/resctrl/mpam_internal.h       |   8 ++
 drivers/resctrl/mpam_resctrl.c        | 191 +++++++++++++++++++++-----
 fs/resctrl/ctrlmondata.c              |  36 +++++
 fs/resctrl/rdtgroup.c                 |  17 +++
 include/linux/resctrl.h               |  16 ++-
 7 files changed, 325 insertions(+), 38 deletions(-)

-- 
2.53.0

