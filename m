Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259798;
	b=ciXHgcBq+MjDbhOylIPaepeLvbVRt1Cr+HYW8v/u9aZZ/ljEnDhPJZ4piN+PDPqjYADQ
	 xbClea59bDvUfV2qPQHaXhjHBGyKoU7DjoVoQyZ5AvgqJbhEd7gyNdAs+nrs+niqLKONt
	 If2dv0nDIAO0mvavVoYx1VwBEIoU83httPxlGOOFLa64elnBFhY5PX6fbLH5YCoa8AEyq
	 QGlvGdbKuLppZoBWVGco+SEDL01f92std6ysBmoPvXrp+2Dlp5nT7IS+bZ3d3vgSgSKT0
	 yNa6mn88CoR/+4841/kdTb+i8FZ0TI5foq9JzdCYfUUjjUQ7IpTCGqirXxgBdgHfR0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259798;
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
	bh=d2bdU7CoN82K+N9Dqx/xs2qV4FVkhwuD1u6KIhRpEZc=;
	b=B1Vkx6hwGkrM0Sn2CJpEGA68mopvF9ymvtZ4OXgDQ9IDkYcHEVvWITmQ9Z0RF/0D4Qij
	 8s+w/VLh9Ah78Rdf0XkIw4jX2tWCQGWpJ9zUjjt9K59O/vo8FtSljc+9I4nWb3775gAzM
	 DTkgYV65GYe8U+neByK6CC76lAJCfCamZPA4nUwIPQI2aGIf0tpnOHYA/exOZunCPdddP
	 efszoX8LiH8fHFMzTqYfVY6/NxxCA0etZgg7TNFd7jK4qAsgKlqMrg6A2Y0EXMWjTSHm/
	 kL+zChwf5EXKyckGsSzDdgTnECFY2gLhHr+edUtqtsFI4pOVlAIR7fwySVIIQSKQKug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Nf1lMqgV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.9
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010009.outbound.protection.outlook.com [52.101.46.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2209606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2209606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Nf1lMqgV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9VBYHZU3LFFsQAjvdIgyB+BtM+V+7ghXddzxvu5qp8kcqTqGgGw6eqVNh9/wzn9DUDsSYAdp8sXi9YkHW997lPsXFgYElASwDvmtQvuC3BLH/g5pLDDTvqfL6llkK/8sqkg+3V19Z5MUVGLpxsYdA9mRm9QsDBjD7vaOjBeqgcblBt+lvYvDRHWsFcDd76m8UVAQJY66q65HioIfSOxxfUt08Q27DhFLftI0SDjeXotDShxGpWZBIWye24cd98NZBrZQeeveSqQ5cgqohPdQ1vrztf1L5Hi374U0ggpq4X6DwuG8cL9iyQnMSEoh7iRdjWMN960+X1ziOvVqEFNOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2bdU7CoN82K+N9Dqx/xs2qV4FVkhwuD1u6KIhRpEZc=;
 b=KlNkLmk3rxxZ0ibiuexD/oo2s0hQNlw8dXpcahtcFv6SwY2rJt/B8JSl7NEYcJ0enduOOiaEqH5zZt0vsu8KjWnx39U/BqzwvyN9J42O3M705z5Kcz0lssW1Glc7COicP+/nXr7Ngevc+fSjV2nsMqEM4oYnzvE2VOaiMI0tr+kGUya/gzSoWLK44OEAU42KUJnSsFKyXokUBIOWxkkUpIX77jFYOGaIFXlGqCG5KM49qpC7LrE82bItd0hkmAt6UzeF+kq9woCisYKSY+Py2OQZjCXI+wcp8Im5XAe4Y2EqaKFwXnj3SOzAhKq3ypocszOMyjXtRZ4YftSqtvtkzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2bdU7CoN82K+N9Dqx/xs2qV4FVkhwuD1u6KIhRpEZc=;
 b=Nf1lMqgVsBesFsgprBEIvfItwBr6EGHmdKEeTmSwpSbrdEPDI9hA1WliB4uhqROGJLlGGYpFcCLz/9K3EOTFGSjSfOjrYwtb2RqkdVpYBW7QDRdnw6wKRT7HxLgrBFV45MQC/tiaQugTV1f9mORllh4BNSZ6R73nlXcRN5DAJ/pvextXIS1MCnWtBsqphqWSvKtzwSmxJFfFa5Ac7rwGMppD4X3Pbvp4Xq1JksufAyKTEqWvcPFqJytewoRoJR4YrLsbSbJByhqw/jAs7tw/raXHy7hwQIGwyhfXp8lkfSfDrRvgnAnlVp4jSGJY5ZGuFH0pZkYlE7lrA+2+ePQmPQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 21:29:50 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:29:50 +0000
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
Subject: [PATCH RFC v1 6/6] Documentation: resctrl: document MB_MAXHLM for MPAM MBA
Date: Mon,  9 Nov 2026 13:29:37 -0800
Message-ID: <20261109212937.1409570-7-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212937.1409570-1-fenghuay@nvidia.com>
References: <20261109212937.1409570-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:a03:338::13) To DM4PR12MB5230.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: ab7ed68a-7ad8-45f4-dc55-08df3ea8960b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|921020|11063799006|261021121427099003|261009223027099003|261022105027099003|56012099006|261026140227099003|261026121527099003|261102123227099003|261028144727099003|18002099003|22082099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	yNnARW17gOjGCfC6/dY5pQJ9h8PL3Td0dyVlHcLNqfz6lwH0NY/iK52ihHjQuJE6hcRBfuF9WjSUa520bwdb1/KBtnhD4zaIWgzcL9+9HLBiO/SecKhvJl+3VkKn9ZYVDxiPUmD/RwSYoko3D0PNpHZ4dc7saX309XtIoC5+RqCzclyFvHm0Yb4j9rJDqkGgB55uuYT6ZAhaHe1c+txebpdoPdmecwzsD21oOeiBPam1/7mTQ1sEDB2ZpLe4hl3iCBSw44hrqEr+em4t/nG5jt1LVIK87qQ+IzuKaOhbU4L1H7ozamBrG90Dpz/pyhJxbNfrAhFxoiNMQUt1IMQSWe9BC1/tEY+IRIarVUV0lC4ursSOHAZuImVe3AhmnAyLBKbzQQm9hrhQERUF1Q5dApRzbjB4N011uKdSeX4ohDmxN+UNR6oEEsfrQXL23PWveQhE3dG+7hTFRiZ0RYy+j7EyoVvhv8Ej6Qs9v+fIQYLmYIejLFbFNkPvzbxhcKDqNit+NhItWKOIWCmpVDhakZEJXnne8k5oJr+n4OooshzvC/NPqdREE4US+3AITyqM2lO4S91TC4SPuZc6N8KDzc1wrpcH50Gn98ZmwSHx3JJZzSqbldV4wDw5cZ01yODlzpvZb3ljDqTpSuNwl4Uy3nI8E24ffJ0TGWuglzeap6CjwqeC73hGTYZHoEoKVA4vlmj6Mnug1t+Qb0gnbcMsIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(921020)(11063799006)(261021121427099003)(261009223027099003)(261022105027099003)(56012099006)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BDZdth8LoXObznw3acKMn6PaJM4JFCQSg+3QOCpFa5rWWJDEHcf+jCyaI4yd?=
 =?us-ascii?Q?UBVe/+wWOM/vb04xChCMrxKsI5P5oFqeT/H84QktdVZhl/eKUSOStfkLpk7m?=
 =?us-ascii?Q?UiFiv5JmBoTCzVr9f7wq5lKOqcF2lllepNAZu/5RfAqpocr180YWDqcRjl1f?=
 =?us-ascii?Q?CboxWbmBAtRpojFggMeCDV01Ci2RFjFygs4Ojz79Wpu8MAMHtj3HCKjhvPqv?=
 =?us-ascii?Q?qtKQ9LdHKFgBQtann6ecTKRrPPlXsXSAuoRe3V2JHXL6du+rI5IYYbz126vC?=
 =?us-ascii?Q?N89qQEIxfVvx7XfkSwz+AQ63Y6tD38/IZ+6P2Unk4utLWhDVulVAw0GWKU/c?=
 =?us-ascii?Q?rH4ZZRibXnDow5F5jMc921CFZQzU+Lw5nlUU7fGL4Xm0GSNfVYzDjlbGQKtY?=
 =?us-ascii?Q?kJa44RIOkeyU4vHm06TzmpwrW4s6oibz8a7AMa/Z1JSf3sC0vYEsFVs3Jz4n?=
 =?us-ascii?Q?4+ZaMZDDO54Yk9xiaRtF4OGo3qZYmj1eoANxRqWuSvhlAU9Vwx7YzdiWvlcJ?=
 =?us-ascii?Q?/n/rSV2sHB/Q3ZjnjOBcvqjkdMgwIw+86CVOi/9KP6kvSplIKQRRqzH4ZsSJ?=
 =?us-ascii?Q?VQYRLoL+zUQYndbIiUvEQ31xZ8yNvdG2CLyXm7ORehxGd6Xs04cQtxfucMSI?=
 =?us-ascii?Q?4vV6snBnpDHynAOUeouDdXFXYtInutAHxv+CZszrpvClboK0ebwnnQySSV0z?=
 =?us-ascii?Q?2iFwIOjQL+033xOOtsV1eQPl4zW3Q0b2mZBPGcTcJWktFLfYO7Bah6Vat+La?=
 =?us-ascii?Q?x53Ma1jC6uiR9w0kVXApj0Ih4pjvWKfxbyepdFiXnC22mK0gruvX23377ae1?=
 =?us-ascii?Q?SfpLAgPFPUwuT+Gwsug3rmzAExsFp1CQ0XiP/bi/kqIAl1SBwv+XawesiWWe?=
 =?us-ascii?Q?Xx6pqH3nsHHRmXe4z5AtkRlsf9paJ3SNrbHw4dMYRzBiZA/LNEaArKAuCJgE?=
 =?us-ascii?Q?97xWq5XDA9AZTlHAbY01OPVB998XA+x6vELqTLkOUHnRcJm4FMGZi0WCkaFU?=
 =?us-ascii?Q?YST+u6sY6WY0wlxEDO0wX9RY9JlbK6DQtUrxPSlLwKaVaaVoJmm1nm9KN8Nr?=
 =?us-ascii?Q?8SeJqyJrWlaYDZ/7LIWcvtZXd0JRcehNMAUKlY2Avbz1Qu/Ktjxtmmehc3Ps?=
 =?us-ascii?Q?PB+0NPg8K6ssHVLCkPWPg1yFprxKYxAz1IwK4TCF0U8NEV6yS/3b20JfoZ3C?=
 =?us-ascii?Q?7AvDOukb0vqPu9bYTs1/3G9qj5m/j4M5v5iBISQ5oz4OLarYyYfypxpd3t27?=
 =?us-ascii?Q?ghz/qDeNoJZJ9DVUaTnsOnk65dF9U1+2t/cVKgCeRb7DSv7odTJA9NPbXqeH?=
 =?us-ascii?Q?WzfzUIlix3QuN4xhHRa3BopJ4CyuumNKuhNFkLqoPXWeCLsMHKxMldmQ4T+v?=
 =?us-ascii?Q?Ss4JdU+wGI1WxYdusJ+rlt1Xt6T4pGYfGr9GoPD4ngFGAxXXygk1J35WLrXq?=
 =?us-ascii?Q?nDcJn180jA99aHfbPatVWWaegseiwZIgTVxmqa513GKDykqB3SLTGhz2B3Q4?=
 =?us-ascii?Q?Zlh7veOa1lk42DMrMFpUEcZRvs5bXCeEqQXx186Vp7jdqKAw+xyvQX4NN7H5?=
 =?us-ascii?Q?Oo/EYlik+DRAcTBuCHhHXQumwo5Nk/jCjYzM2Es3irhXlTZLpLDMte9CrIQ1?=
 =?us-ascii?Q?QTfO5UdYJisBedlBN9Ng981qNheiUrjhdLXBVT3qBK4TGWLq8kCDL2/25vHN?=
 =?us-ascii?Q?YP6Y6n/ehmNzREGOZjYw+s9Qe7gyS5n109DN/i2Sd99jBPMyDJJqxyU2+/2/?=
 =?us-ascii?Q?/9rrk7Fxog=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7ed68a-7ad8-45f4-dc55-08df3ea8960b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:29:50.4367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQPC+qw2dV2Q5sSsap9hQN1aaFCSbwcbRhLxLLe6HJlNowVpe0J0qvnpjRDbeOpzSTCWWZ9hKGyO2wi8DalJMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031

The hard-limit interface is the MB_MAXHLM or MB_MAXHLM_NODE schemata
line. HARDLIM is read/write only when MPAMF_MBW_IDR.MAX_LIM is zero.
Existing resctrl documentation covers percentage MBA only.

Document both schemata lines (0/1 per domain) and how they relate to
MPAM MBW_MAX, HARDLIM, and MPAMF_MBW_IDR.MAX_LIM.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 Documentation/filesystems/resctrl.rst | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index b7ffedc02b41..2335fb91e5c6 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -1198,6 +1198,34 @@ When MB domains are NUMA nodes::
 
 	MB_NODE:<node_id0>=bw_MiBps0;<node_id1>=bw_MiBps1;...
 
+MBW maximum hard limit (ARM MPAM)
+---------------------------------
+On some ARM systems, resctrl memory bandwidth allocation uses MPAM
+maximum bandwidth (MBW_MAX). When ``MPAMF_MBW_IDR.MAX_LIM`` is 0, an
+additional schemata line selects the ``HARDLIM`` bit for
+``MPAMCFG_MBW_MAX`` independently of the numeric limit on the bandwidth
+line (``MB`` or ``MB_NODE``).
+
+The line uses the same domain indices as the bandwidth line. On a
+cache MSC those indices are cache ids and the lines are ``MB`` and
+``MB_MAXHLM``. On a memory-level MSC those indices are NUMA node ids
+and the lines are ``MB_NODE`` and ``MB_MAXHLM_NODE``. Each hard-limit
+value must be ``0`` or ``1``: ``0`` clears HARDLIM (soft-limit behaviour
+for the max), ``1`` sets HARDLIM (hard limit). When ``MAX_LIM`` is
+nonzero or the platform does not support the hard-limit control, the
+line is omitted from ``schemata``.
+
+The control is listed under ``info/MB/schemata/`` as ``MB_MAXHLM`` or
+``MB_MAXHLM_NODE``.
+
+Format when MB domains are caches::
+
+	MB_MAXHLM:<cache_id0>=0|1;<cache_id1>=0|1;...
+
+Format when MB domains are NUMA nodes::
+
+	MB_MAXHLM_NODE:<node_id0>=0|1;<node_id1>=0|1;...
+
 Slow Memory Bandwidth Allocation (SMBA)
 ---------------------------------------
 AMD hardware supports Slow Memory Bandwidth Allocation (SMBA).
-- 
2.53.0

