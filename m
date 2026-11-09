Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259492;
	b=ae7Z0wUVV43PL3BezpApIYD9xFdBOFU/34pi+OTnNHf4fcwXsgwprrPYNGMgaWQ4SApq
	 /pHwdFw8OStJTAET8G8QZkr8yiM1gWZqTcHa6CvgLx+WA6WRR8ji9YQkP7mv8ZdI9TBfm
	 XUtT8u0oboZzrV7acM9R8tIPBJmtpwtmTn5ctn3uP+pwtGtHOQNUQgwdBCS2ohpzIEtrh
	 APjOhJP0RfMjhV9qQuu6p6q8brwkbOgpWhfofUZHoZBXWEjBSSRkAN2RgVnFaYNSsea90
	 cCJSt2UnXVmAn5V5TAIPwfKava/9yNi67FGwk92ZrHHWdbqm5tCZ2G6C6Vhu+ygDeGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259492;
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
	bh=sZwV6iVTlSXkdj2aNYQhiRvmOfWzOF5p4vgCPHkcSUE=;
	b=AgWZubkVKL2uL51Q3mC36vJSiPUXv30pmzKDKHkYuF+nCer20CIscLwIWl4dSiF7+BZb
	 vkVi9EoVZBwSdBWpTUMrE+GdkXpSgRfcYBSbmeSm+Hhz8RVXt4wFtg4qgTrmNI+jQsyqR
	 gxPYLlY3fPZxLEXqipj9neuUCWHMSU4pK2zsmGmK7zNE43kh8KOuROPZtfo1G7cioo4kO
	 4ERIjJXpONzef0zZF958NpY70hll70QHp+/nUMwDn7FutQ8C5tNLUP3udkufSn1fZcYEi
	 tUy2Ydb/+LDmVC0o8XrMySq1GdWKaR6aD/Uoj3tTZTiqKqE/a9TaVQtiWuOgMh24+lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Y9xfi6F+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.37
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010037.outbound.protection.outlook.com [52.101.46.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBE360A2608
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:24:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCBE360A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Y9xfi6F+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpMDiQGCcWv8ZBpr993TBbW2bBuT+buQMTQ83nqLCoBOTHlLPEUpP+aDHRmvQUDBs1kT+S2l16lkbtow8U1ZFv8kOCGrBKWgCvU6JjONtsfn7Zw3dGnAdi2zOguJQZSi8Fs97YuXMTJFPwGB5ai1rEFx7Chd2a1ZEU2W40fXFDVc1o22PxyaSSJUU2zR5w1FMaBhm7ytY7iwA22718X1SWR2XHlEpLekW2IhJGCx53RNdulobReaAQKaS3MkH5ZUOa1xVzs0XwW6kmBTAlNeLPcRYR0aqzmNGjv2eN79gRiMkPeZoUqjugZdZO4XY8ihyV8BRsa76ceSontMC60chA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZwV6iVTlSXkdj2aNYQhiRvmOfWzOF5p4vgCPHkcSUE=;
 b=rhKv4tDE2jewte6aSK1pNpEevBzgbsAsh0VgpTuJZaUcqYJe7mJiMdbMo4TSgKz9uPDlUngHQtu+ajcoiypO7pKT+4080stcV4dX+in4BR/5+wKzO3JaUUBMS3tvGrhIuJWnBI3omqAhK7QcnFFO9rHfUu6XJZeLb2Y1YLZUIQ1yCsq+eZbrbCYBN3dWiH2P+FwchCK6sfEHMBuP9CUOc4dm0mcnS3jHHMT+d/99VGcdoYAg3Qge3zubyXsfERsxJPrBIV4YNdyMHiOYPWTpqI+VBoZMCqV+ClpjtzQgRxoOZG5CWOF+fz58hauz5f2Ph8ZgvwS23emf0KgAkjUotg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZwV6iVTlSXkdj2aNYQhiRvmOfWzOF5p4vgCPHkcSUE=;
 b=Y9xfi6F+xyjMyVZcA2jYRHTxQPnHAMhAKxCl7vp3uXCQwox7GpVqya4eifMg7ugPrf5nsDDOpCFpqJDIX3X2Z0+cc9I6Dwqzla4mz6I6EvzLr4IxYdFwN9kSdDw5XExTZoXEuD74WAx9k0VdHUxTm/QbVsbNrleyKJ7U0kiNerI/YusLLF5jQlPFLdoK7bC6ZhvNPm4ZB4SQjdHOwD+e1hXWfYdbseFYGBG1c1M8SIlGF8aMtEQI56gARfUVPiVqf3l0O/PvBwckLIq8xyZh/KWs2W1R8XVCzbKN9BuK/OMycjApZKYNwaaRYMOuiAxPmO0+9LGdvZvQH4eeYE7OAQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by CY0PR12MB226969.namprd12.prod.outlook.com (2603:10b6:930:130::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 21:24:49 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:24:49 +0000
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
Subject: [PATCH RFC v3 13/15] Documentation: arm64: mpam: document memory-level MB control and NUMA nodes
Date: Mon,  9 Nov 2026 13:24:25 -0800
Message-ID: <20261109212427.1409204-14-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212427.1409204-1-fenghuay@nvidia.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To DM4PR12MB5230.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|CY0PR12MB226969:EE_
X-MS-Office365-Filtering-Correlation-Id: bad5318c-f7c4-448d-c6e0-08df3ea7e253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|921020|261102130727099003|11063799006|261021121427099003|261022105027099003|261026140227099003|56012099006|261021123027099003|261026121527099003|261028144727099003|261009223027099003|261022075727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	36Dhl0WqVh0cosaKd8/lanoUxXPfQdopvtgk21R/UVT9TLwHDa+eWRQ3TAIlR345kg7vDAZecv5vj6wIdV3Hm25jNCdIX4Tswcf2bQTZT4vuQHaR1SJeQl9wvxvOzkSanYnMuCDEo89/66BjCMGMY1ChkgppKXwzXafsudsBf8EWnLta0gHjjYl+ZhihbjJGIdFBzhq6NQxishcj2GofwdrA8ugkMIhrmhIa1pDxvWN/iE8MUETO1zYz5IN+maunnYdGWEFmwEo/DKyn46qGKhvFFJqjTvWgwPkVtCVMIrJMbOQAgcm/WsDGZEtzphuPAr4Qn19WuBiiHjHYsPYArUsYIrRzV827ftBJwWIPZ7f6vwkEASLxYCzP9m9ixDwAXMN+ISNOuWQ4FWNWPdp6tYSRvc7uQZtWm3RwpZ467Q0u4icU6c8JPNlM1jNqId/rTVFVHcydFCJORJk6ay6vwQFjL8v4lH9m5olLpthwS6BUBlf4898LtImboVSHI34o/ZYdNeK25FIxmBLKKopF4l4Vbrlg6p2pvF6s2T1+dCX9/khE9aPxxz+5HhvfIDqpaGmmSQxWGrhtwTldwJIZiw6hA7B1mLfFux67OIVvuu1g02dViIAgFqv7TQCpWLYziQepO66SNsEPj9C3iPaaeIjablVJ/zDte+IenKcFFGzWZmI71AFVvRzGq+b3N5IijDHFseUMI6ysOOqKwaSnxA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(921020)(261102130727099003)(11063799006)(261021121427099003)(261022105027099003)(261026140227099003)(56012099006)(261021123027099003)(261026121527099003)(261028144727099003)(261009223027099003)(261022075727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2Lbxs+AZouD2MTa2LXGgCBm5qa2VQ6qrtyC5LU8CaS9tsndz3yP1L5BNW0LB?=
 =?us-ascii?Q?KC173L0Cn74JSp5hTo+ScketWgzhIJ1b9ETAJtlwYPUuTGIflLAh001STdOo?=
 =?us-ascii?Q?26n0lKslX4QhJuXBIW+FJvO7Ht/fKhn1wfo74be4aV5kF0i6QBErJ41NBcem?=
 =?us-ascii?Q?nVA+MwS5QR3+qFy79PwX4xXzgz40I9H9WgKgQQZQxtlpWbEtEjrl6DN646eG?=
 =?us-ascii?Q?hQw6es7swpZKwIJ1uQRWl9CBHKrnbJCkLAkjwE5HNIsBy6MwgzzYJIsG/2xC?=
 =?us-ascii?Q?C0zfH3LzPVX/wjWoTmpz0Rrph4ltpAzyl23/XY0ZVjGhyopJt5fB7JBwKMSl?=
 =?us-ascii?Q?lw4zohqJdpl/4zm82Bbsa50HKtXkAk67mjP6xleVi594qe+ZpGqoO5Ba+m/W?=
 =?us-ascii?Q?8Rl49Y8y7wAHQfONmFNh+1WG3MHPYOB5GFdN8sl/zhEmkJ/ld4p5CU4i6Hmu?=
 =?us-ascii?Q?hjFdFPZejx8WQ83vHEYBcffGA4ppUDKEGzmDNoW7orWvpvU+ORFOhK3dmmY5?=
 =?us-ascii?Q?oOxa5TY6Y3smliTXdo7ewbwosrqEwUQ/PCbayDnFG8o5qH4eLszQVdo3JqcQ?=
 =?us-ascii?Q?aJCJsem20uncBqp/9yjCSss/gvxp5YktGxx5220aWncT5xYoA+IDVcridQ12?=
 =?us-ascii?Q?77Y/8hvMwAtZXLMzQckPLt9+ynX/JH6EUcusw4r0WlB+/1n6GJ2LtHpusjJj?=
 =?us-ascii?Q?1KNJBRHufwYzmFYaQ3Ua9OjgZOVpb8vsACVJi5p1sppjILoi++pTIJHiT2z/?=
 =?us-ascii?Q?zSyMLLFUlYPOMr8cXoeLmpqNoa33pcmzMIr+lwT4auyh9Y6eJj9GgqosPdc4?=
 =?us-ascii?Q?WRAXM2H2LuSpAcjdae357As/8tiWLZMCXMR8bfZh6AxDTS5PTJkFhbhyU7h9?=
 =?us-ascii?Q?ri+avvVrXKOqo7gmlti0dCfHE4WfYHiGihl2B6crdtMaHGMfXzknLOKHzkn/?=
 =?us-ascii?Q?W0J9yuOYw/kXp/NAk48gi6h6gf1h5xr8jgSLrljuDW2s+1rRynwuqSMfSGAB?=
 =?us-ascii?Q?0UTCGi+hWDRy4KqMlS/wsZrYTUD6W6BViyTRJxhlNnGlz7QiLp2GIQrP2CUh?=
 =?us-ascii?Q?oii7rFA5vicwH9H6yMVVQzWPESEFduLP02sEm3CXq0FdOsPvu2Jt24OSVtDh?=
 =?us-ascii?Q?3ENAjgTC5xU/L+cUbmcPVlTNNKFlZ2mt0hvGWtWA2N7at1kFZ7HEVtFQU2kd?=
 =?us-ascii?Q?ug9J+SrKst3nBSBpueiX98I49yCHRxb6X/zDrhSadLQNX2y8h0cFqMd4woJJ?=
 =?us-ascii?Q?/DFvI9Zb0g7YdHgr2Nv1lCl0cOrT2u/dQOJKgLKDvx0ZcHf2qlJC+ipIjwgv?=
 =?us-ascii?Q?IXIfqtZpCyDymdDUqY6lxWNBj1QZjfBwMsY+gHX98HCcyj8TMwe+L5lfIoss?=
 =?us-ascii?Q?tQCwt7R+t+JBYmwrzJ6onUpD4djwhSBotHlPlXf/v3CSZcn/FcJ+wQPC2r1s?=
 =?us-ascii?Q?hCpI3MEcO+x1t8RAc7LsoUpZ9hg2Jw5pUm9Y6VFWKRTDQsuuxxIdHjQF7CUl?=
 =?us-ascii?Q?tBQnaX1o2OrgpVrrTzOxEOyPA9N8ZgbfQ+fHd5eGUjsoeDQHsphZmZhMl+xV?=
 =?us-ascii?Q?b+ri+VIdZp5LKjFPWg78V3GHAPcuHHOIk83wW3sAF0rIPpFfvOW+pHGRRShx?=
 =?us-ascii?Q?DBXulu8sWsAqjJCJLODZrMdZQUOAFoAtSlWOLBjsSNO8oFcvBREP5oVXn0wk?=
 =?us-ascii?Q?XUVBHZzXEhhs3B82VbT6lLWuoseTqP8Rq+L0xZ9NlyccBKF2M9lgysEEuCZU?=
 =?us-ascii?Q?NIeK1v8UOQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bad5318c-f7c4-448d-c6e0-08df3ea7e253
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:24:48.9172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWPW8MDeRn+QQGISzlfdKvA4QFcnqB46RWPauEJOL72mL7fpgUlbMMRZo0ocbhUSBoAeXcWpxyuzNee61UV2dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY0PR12MB226969

The MB control can be backed by a memory-level MSC above L3 rather than
the L3 cache MSC. In that case resctrl identifies domains by NUMA node id
instead of L3 cache id, and can manage CPU-less memory nodes by falling
back to cpu_possible_mask.

The schemata line is MB for an L3-cache MSC and MB_NODE for a memory MSC,
in both legacy and native control_mode. info/MB/control_mode is legacy by
default.

Update the arm64 MPAM documentation to describe the L3-cache and memory
MSC paths for both the MB control and MBWU monitoring, how NUMA node ids
map to /sys/devices/system/node/node*/, and CPU-less NUMA node handling.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 Documentation/arch/arm64/mpam.rst | 95 +++++++++++++++++++------------
 1 file changed, 58 insertions(+), 37 deletions(-)

diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
index 67fe515ed501..cbc4dd828027 100644
--- a/Documentation/arch/arm64/mpam.rst
+++ b/Documentation/arch/arm64/mpam.rst
@@ -44,48 +44,69 @@ The supported features are:
   placement.
 
 * Memory bandwidth maximum controls (MBW_MAX) on or after the L3 cache.
-  resctrl uses the L3 cache-id to identify where the memory bandwidth
-  control is applied. For this reason the platform must have an L3 cache
-  with cache-id's supplied by firmware. (It doesn't need to support MPAM.)
-
-  To be exported as the 'MB' schema, the topology of the group of MSC chosen
-  must match the topology of the L3 cache so that the cache-id's can be
-  repainted. For example: Platforms with Memory bandwidth maximum controls
-  on CPU-less NUMA nodes cannot expose the 'MB' schema to resctrl as these
-  nodes do not have a corresponding L3 cache. If the memory bandwidth
-  control is on the memory rather than the L3 then there must be a single
-  global L3 as otherwise it is unknown which L3 the traffic came from. There
-  must be no caches between the L3 and the memory so that the two ends of
-  the path have equivalent traffic.
-
-  When the MPAM driver finds multiple groups of MSC it can use for the 'MB'
-  schema, it prefers the group closest to the L3 cache.
+  resctrl exposes these as the ``MB`` resource.  ``info/MB/control_mode``
+  is ``legacy`` by default.  Legacy and native mode show the same schemata
+  line; which line that is depends on which MSC group backs the resource:
+
+  **L3-cache MSC (cache-level MB control).**
+  When the MB control hardware sits on the L3 cache MSC, resctrl uses L3
+  cache-ids to identify where bandwidth is applied.  The schemata line is
+  ``MB:`` in both legacy and native ``control_mode``.  The topology of the
+  MSC group must match the L3 cache topology so that cache-ids can be
+  repainted.  If the memory bandwidth control is on the memory rather
+  than the L3 then there must be a single global L3 as otherwise it is
+  unknown which L3 the traffic came from.  There must be no caches
+  between the L3 and the memory so that the two ends of the path have
+  equivalent traffic.
+
+  **Memory MSC (memory-level MB control).**
+  When the MB control hardware sits on a memory MSC above L3, resctrl uses
+  NUMA node identifiers instead of L3 cache-ids.  The schemata line is
+  ``MB_NODE:`` in both legacy and native ``control_mode``.  Each numeric
+  ID ``XX`` in that line is a NUMA node id and corresponds to the standard
+  NUMA node directory ``/sys/devices/system/node/nodeXX/``.  That directory
+  describes the node: ``cpulist``/``cpumap`` (the CPUs local to it, empty
+  for a CPU-less node), ``distance`` (NUMA distances to other nodes),
+  ``meminfo`` (its memory), and its ``memoryX`` symlinks.  Use these
+  files to map an ``MB_NODE:`` entry to a physical NUMA node and its CPUs
+  and memory.
+
+  **CPU-less NUMA nodes.**
+  A memory MSC may be associated with a NUMA node that has no local CPUs
+  (for example a memory-only node that still participates in bandwidth
+  control).  The driver falls back to ``cpu_possible_mask`` for the MSC
+  affinity so that traffic from remote CPUs is still accounted for and
+  the node can appear as an ``MB_NODE`` domain.
+
+  When the MPAM driver finds multiple groups of MSC it can use for the
+  ``MB`` resource, it prefers the group closest to the L3 cache.
 
 * Cache Storage Usage (CSU) counters can expose the 'llc_occupancy' provided
   there is at least one CSU monitor on each MSC that makes up the L3 group.
   Exposing CSU counters from other caches or devices is not supported.
 
-* Memory Bandwidth Usage (MBWU) on or after the L3 cache.  resctrl uses the
-  L3 cache-id to identify where the memory bandwidth is measured. For this
-  reason the platform must have an L3 cache with cache-id's supplied by
-  firmware. (The platform doesn't need to support MPAM.)
-
-  Memory bandwidth monitoring makes use of MBWU monitors in each MSC that
-  makes up the L3 group. If the memory bandwidth monitoring is on the memory
-  rather than the L3 then there must be a single global L3 as otherwise it
-  is unknown which L3 the traffic came from.
-
-  To expose 'mbm_total_bytes', the topology of the group of MSC chosen must
-  match the topology of the L3 cache so that the cache-id's can be
-  repainted. For example: Platforms with Memory bandwidth monitors on
-  CPU-less NUMA nodes cannot expose 'mbm_total_bytes' as these nodes do not
-  have a corresponding L3 cache. 'mbm_local_bytes' is not exposed as MPAM
-  cannot distinguish local traffic from global traffic.
-
-  All these restrictions based on L3 cache are due to resctrl, currently, only
-  supporting monitoring at the L3 scope. It is expected that going forward more
-  MBWU monitors can be exposed to the user after support for more monitoring
-  scopes is added to resctrl.
+* Memory Bandwidth Usage (MBWU) on or after the L3 cache.  resctrl can
+  expose ``mbm_total_bytes`` from either an L3-cache MSC or a memory MSC:
+
+  **L3-cache MSC.**
+  When MBWU monitors sit on the L3 cache MSC, counters are exposed on the
+  ``L3_MON`` resource and use L3 cache-ids.  The MSC group topology must
+  match the L3 cache topology so that cache-ids can be repainted.
+
+  **Memory MSC.**
+  When MBWU monitors sit on a memory MSC above L3, counters are exposed on
+  the ``MB`` resource with node scope.  Monitor directories are named
+  ``mon_NODE_XX`` where ``XX`` is the same NUMA node identifier that appears
+  in the ``MB_NODE:`` schemata line.  CPU-less memory nodes are supported the
+  same way as for MB controls above.
+
+  ``mbm_local_bytes`` is not exposed as MPAM cannot distinguish local
+  traffic from global traffic on these paths.
+
+  When only L3-scoped monitoring was supported, platforms with memory
+  bandwidth monitors on CPU-less NUMA nodes could not expose
+  ``mbm_total_bytes``.  Node-scoped monitoring on the ``MB`` resource
+  removes that restriction for memory-class MSCs.
 
 Reporting Bugs
 ==============
-- 
2.53.0

