Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259489;
	b=YPqms4e6T/3G5ac9b9RZD+GrOYExBkYmOlz6BUcBtTpaA9GecDZaGC0Otzn1bjs+M4Im
	 iH8+VR8fd0+3DB3FuLL5syOyNLu72FQO9DdyUx3YK3sNA+9usTFCm0rdEbAQE4Nnks/vO
	 WHak42flUistfEkedQdC3pLJpGNpcZf+NSuhlz/2/TsxBsB3N9sy1dWNqES8srFoLetvt
	 9mwUsOxKDIIO0krj7m9LVSRhEJ8VEl2hZcwdlm24zVw0FWou4GaBfGzLWzGeMR6bbRT1H
	 S0s5XXDS7jfyeqos6PNAiziDvN0oTu1EWuOb4vZ05FbErt7YFRFv4hZ8kNZRndwGv7A==
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
	bh=1F8EhvxRsHNCE/li/Bbp9x+lqTT08lvh1eTHgoUQufc=;
	b=0k2q/SVF5YcQGBPtBUhQW+gvele6UOZuIcdokyPonkttwHV9uQqKmcJd2vcv3e07Bpc0
	 kDEpsarViskh3crwhB3AmhYWsemXoEkjlpy0p1CAqjo9v7nEZ2BSrG2/qNWiKrG/Kzd2r
	 rvQJNB3+r1anmGYXPo61wNfo9jtUV5wnpHAI86DrUV1YLEVN4TAyBFIpesACuJkUFcMh4
	 lT0hF2zYdCU2vLkRj7xthsbbRzs93Pv3NoyOcGUkV3WtLd7NtVQTyzgfmSzJoYxP0YwUl
	 7P+J4CrWXC055vWfUuOhsATuBngAe5rG8u3urDDh+KTb8xaLBTyJ1GG1r63BmCSydyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hdIEPlIe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.8
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012008.outbound.protection.outlook.com [40.107.200.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EC0606A332
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13EC0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hdIEPlIe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VEtmyWlmNz2UV0F+7KeKlTw0NFbrhaWMuDdYfZ9/uVTb44YtvtHkumNj/yNBtyN0PFF+RXX+vg6BMb+Q7mwf+KEJGdDXpQHqXI6V8GcRqJqHYj54roenlR36tEY56zo2qcwd4WbsMA7GCnnZ2HyiIVjIhyFN9BvvkHLRPhPasHN2vHLQ0QOTUrfmyQcUKUZAEH0NioLPpZexkJEJVCWjRGrBOzHCiUbQYsraOyIXK4wpHgEHuSlUNC+nQ+fUOzNMA43DhsqK/5CGvmsRJw77OdcNAi9YRgmT9QmlNii+cmTHYyY2b3bDNI2QBjMUy9u/tcp33bsRQW6wEV10+vpGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1F8EhvxRsHNCE/li/Bbp9x+lqTT08lvh1eTHgoUQufc=;
 b=K1zrUbCvU2WZZPEg7TCk5NmDQ7pxBlGe4m6x0yYvOCbQ00q262wcJ/flmxhEfmo5Rx+tzgBAYpcSWappjrHfBx6JHgtZmJipjp2VxVglGXeCd5TmL4AfqLihtVfuiA8A3qbIuiEPFiCnaGGkyc8zhxkLf6cNdnre4IAUJK1mh5yhHCwOuSH1RGmVcPSSa6Byr4XVBTQUNZzIp+/2fWcUclFzwXfq/U5+YM+ipTtfVq6fR3GJIXMrdvzGGIR/fxr4pCkUyS/r39LCxdcpOIZFf3sLVsP9xVSy6/NadCmyi9Mw7xrUlFkjZmmEqc9zGJZAFO+irXnXS/tqAOGvQmO7yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1F8EhvxRsHNCE/li/Bbp9x+lqTT08lvh1eTHgoUQufc=;
 b=hdIEPlIeyfJp+C1LPVN3ET9we/RGVVPypyVY38z5g5wDUlTpw7fz5kKDyPPbp1DMynrXqhpMsnaE/Uh9VDXyBaw9OMagJWAMboYWlDoxZN9MMvyMx/hYCQ6dbiLPBaZ9qyU//GMXlJwA+VVRBjv2P7Z+zVKV3Ce8ouA5IebW3lS3JoGJ0+PyQRIHr3xhFBoQ2/uu0IAm/8ZUm1hKbyajy7NGN3w3+QLrEAOUK78AxdUb5wkSsFvjvziCc74AoXNHLrpO6Cxpg6f37qEDkr1j/hUIMEfSYlqrG44WUNwsz0EnVpSeZ+qIr5GhUrLTtK2QwJ3NgtBRGLyaFauuf02+Hg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by CY0PR12MB226969.namprd12.prod.outlook.com (2603:10b6:930:130::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 21:24:45 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:24:45 +0000
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
Subject: [PATCH RFC v3 10/15] arm_mpam: Handle CPU-less numa nodes
Date: Mon,  9 Nov 2026 13:24:22 -0800
Message-ID: <20261109212427.1409204-11-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212427.1409204-1-fenghuay@nvidia.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::29) To DM4PR12MB5230.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 812b2c3d-7eca-4903-8935-08df3ea7e03c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|921020|11063799006|5023799004|261021121427099003|261022105027099003|261026140227099003|56012099006|261021123027099003|261026121527099003|261028144727099003|261009223027099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	w/u1nd94hlnNbZAJ8g09iE6n8Y6ZRXuaZv7v5CLVd7goNjkhrdrM5Hs3wP9iNkO70X3Ofway5+hKXDUQx0bVQTht5TW+9xpS5rVIw41Rqpwj0R/FExSFTA9O6oZvCxPrlpyfPUsz2jWUIgLbLJvVYBR+IyRZE0Ekx3tdvHWCF0OxA7rLFXHRoCXOyTxivU3F6e+QgUTfcNLZOoj1rC8PrJrurvPEGS73LTM+RzWuJaqZB8Lp7v+0EvzuXZkGOMDWhUwsoLmYMQloXhWVLS74coTUWgX3ic5N6hjfSypvvfUueZ8EZOOLcQxe5k0hv2DmtudBPSc0N+Y8HfEFZYLA2jfj5j5ppYRUianpFl6yqnc5q/KbLBWgNRv+7QrcP+W9QFJm+xDXwvlgvuu0P/GLVs0XTeetkAl2Ialgjk7MtUtM5bc53IGcfgy4V1IbNPrzfvInx1D4Rrf3VxVtn5d9GzBQvL3FYvJxDIrVeQNYDA054J+aDAIcIH1pQF4Q5cP0OtUriu9ZO+JsFJWID3hxpQY9+IahWfDnEDXsJttbvk1Q6wAld1ppnGd8NBhP/rA04NHckBbj7r0BEr6B2RvtIhSPXMxiS9zLfF65DZoHob+vo91LE5h8bfJrXOfZ4+WO8/kXmEJvoa9o/9WoJK+q55EpRhpDcMEYE1qjSc1EeTvSoJQI1fWttXW5rFpeE1izNj+IWG5T7645u3Y+FyCXsA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(921020)(11063799006)(5023799004)(261021121427099003)(261022105027099003)(261026140227099003)(56012099006)(261021123027099003)(261026121527099003)(261028144727099003)(261009223027099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YM5ToQngQNT/ZCNyrGzU1ZToHzVOKG1wrVUIaz8PTQi1S5lRbE2MQVLAXZd4?=
 =?us-ascii?Q?ZxSzg0iENY/8Hhbg2RiFXrRkgExGn4EQN5EVjJYoA97TJUETfH9kbtoBSlZ7?=
 =?us-ascii?Q?ZqrYhUERDZ0/At0QFWiAwStC23bbPdb/wn8aEaNM/xSLaVyxtQeVXnnulO+P?=
 =?us-ascii?Q?Xovevlfb0QGhUDRrslRKgTBax9pmPfJxVg6eEnAAR5Clq7H098wxYW3sbdTe?=
 =?us-ascii?Q?RO7pxFpdhJqJ61CMOSQWXxBTUHIpa35kgIEVvDO3iP1u1aYJHxOisxakOmD0?=
 =?us-ascii?Q?yaR4bUQ3ARXW55RWHF2caOG6MTs7XtVr5sC91F6diqLbJKd8LsaWrnCvJyJN?=
 =?us-ascii?Q?ej2WVhdriv37MQncADO+q7x0KB8yv+GF3ILV9hjpPFovA/9pZFut2CG23Mk7?=
 =?us-ascii?Q?ulsXafEhlEvWu08Ag6Niu9ZvfAbW0Lx5Ba4iNBYZiYRGKdfl5C3RDnMIX7Vw?=
 =?us-ascii?Q?ZBK52X9T96roWhbQQ7Di1E9tXlfr38ZJw+Z5kgdS8YB74hh5suZZLdrpNRS0?=
 =?us-ascii?Q?SyksN1o3/G8Hnr5OPW4vlfU8ZGtOJxTpbpuOn8LqMVfkr56F1tbErZiApLWb?=
 =?us-ascii?Q?X21Lv3LskvkFVNA6MOn27HAXkWVeC6K7dVKGuxAdC9xG7+R5TQlMeQmqsoeK?=
 =?us-ascii?Q?xt92es0ARFBO+9jSBPEVC/VF0/T+jlj6n+zgpvBPoTjVBTaXonTo4VM8r2A+?=
 =?us-ascii?Q?c5KW+qI/xdx5ni2FsNXuiZAH63Cr6h2Ce4u0/JTXhbGSyYupzBWdtLPafUtc?=
 =?us-ascii?Q?0qKGgW6S7JarVBWYF+F3xs9FxaKHxyWvi2PLqzFv5kptS9zcghLzXGdFwiTA?=
 =?us-ascii?Q?wqNpSXKowLVD1ig1TH+3mKwr75QNN+hW8opD6IoM0RluW6bALku4bpure316?=
 =?us-ascii?Q?WAZFwBmVx3WEw2UZxBtUiEI4m3KyAdE2e43Nj9XUegYCjb8v3f3Ob9WuNwt8?=
 =?us-ascii?Q?Vjvz5sursTzn0mg+Bcymp+FzsTEA7QSBnvdKimle1lpXgbeSdLX/Ta4ktsyl?=
 =?us-ascii?Q?PS79+erghYCjp03USEWwdbtmbuc83vBaPcDxV6UkkjlfOaMH+MaVMp6pCXwl?=
 =?us-ascii?Q?vvJOalCoCACXmp66hApSw4alqnfU787uPnVvJg0bKUgNeW6mGiiB0F4knaMX?=
 =?us-ascii?Q?zeY998rRpD+h9/S879bMNWg0ioL0R8kLvy7w2MBA5Qjq8k4jX0YevA3iTvXH?=
 =?us-ascii?Q?8HzUODSWDVmrH72SbzQ/aW7yc6bro4N1sAuLBvmAX/Db7zDCiJJWgjucgGao?=
 =?us-ascii?Q?LQ0L41SpifTlEErngfAS6qC4Fai+SaZuMY8X4bqYxnT07UMDkzJXJz+9Xhv7?=
 =?us-ascii?Q?a8wighlapQmKgcH+RCEFT4HtnqZmU+VdMkhBdpGJrzi57seFPwWKKdLPU49l?=
 =?us-ascii?Q?ZGtkVBSipyCowur+9aUU+gIZw9FnGhiBu0TsJOuplTA4DRVJp/I+nMtJ3C5N?=
 =?us-ascii?Q?cerG2qevC+59Z6FcpoH/hjvhjztg1a6Oqveyg+/xksn5uQmABqV/zGlXlSMH?=
 =?us-ascii?Q?4TArK7cPos+gdM/YeInJYmNvegnBjq04v9Y3W/u/kfP9qnHAXQ+zdMW32hfh?=
 =?us-ascii?Q?GPs4GyXcndxjN0jzacXVJuJoXB/q/JCLijt9c1sLev14MbmDy6lAzGwKTxXp?=
 =?us-ascii?Q?egBR7jHDiRI8HBjXfFgXN3zT4aWlUOKIgsGfucYnbfZrY8w81IBVOAefOKsJ?=
 =?us-ascii?Q?wDbjDD2I7kFxhqrWCS0/A8PYu65QTHjVY9kZ+SHxHUZIc/A+Uj8AHtTDnEJp?=
 =?us-ascii?Q?zkO0rp0GiA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 812b2c3d-7eca-4903-8935-08df3ea7e03c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:24:45.4357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldGhVf3zCN6Zgf1J6hHEdWTmkAWnUSdq9P5loZx6zNC+Y99sEk2fp7UaszRLzTwv4mXiUR483ZyJmt3di3KMWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY0PR12MB226969

On some ARM servers a NUMA node can expose a memory MPAM MSC without
any local CPUs (for example, a memory-only node that still participates
in bandwidth control). mpam_ris_get_affinity() derives affinity from
the component's NUMA node ID, so these MSCs end up with an empty CPU
mask and are never registered. Without a fallback, resctrl cannot see
or control bandwidth on those nodes.

When the derived cpumask is empty, fall back to cpu_possible_mask so
the MSC can be managed and traffic from remote CPUs is still accounted
for. Track the borrowed case with ris->cpu_less and keep that mask out
of class->affinity on create and destroy: those CPUs already contribute
through CPU-ful nodes in the class, and subtracting the borrowed mask
later would remove CPUs other live nodes still depend on. Emit an
informational message reporting each CPU-less node when this happens.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_devices.c  | 59 ++++++++++++++++++++++++++++-----
 drivers/resctrl/mpam_internal.h |  8 +++++
 2 files changed, 59 insertions(+), 8 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index b69f99488111..cb6096e9d2cf 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -508,10 +508,13 @@ static void get_cpumask_from_node_id(u32 node_id, cpumask_t *affinity)
 static int mpam_ris_get_affinity(struct mpam_msc *msc, cpumask_t *affinity,
 				 enum mpam_class_types type,
 				 struct mpam_class *class,
-				 struct mpam_component *comp)
+				 struct mpam_component *comp,
+				 bool *cpu_less)
 {
 	int err;
 
+	*cpu_less = false;
+
 	switch (type) {
 	case MPAM_CLASS_CACHE:
 		err = mpam_get_cpumask_from_cache_id(comp->comp_id, class->level,
@@ -528,7 +531,17 @@ static int mpam_ris_get_affinity(struct mpam_msc *msc, cpumask_t *affinity,
 		break;
 	case MPAM_CLASS_MEMORY:
 		get_cpumask_from_node_id(comp->comp_id, affinity);
-		/* affinity may be empty for CPU-less memory nodes */
+		/*
+		 * A CPU-less memory node has no local CPUs. Borrow the CPUs that
+		 * can reach the MSC so the node still gets a resctrl domain, and
+		 * flag it so the borrowed mask is kept out of class->affinity.
+		 */
+		if (cpumask_empty(affinity)) {
+			dev_info(&msc->pdev->dev,
+				 "CPU-less numa node %u\n", comp->comp_id);
+			cpumask_copy(affinity, cpu_possible_mask);
+			*cpu_less = true;
+		}
 		break;
 	case MPAM_CLASS_UNKNOWN:
 		return 0;
@@ -582,7 +595,8 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 		return PTR_ERR(vmsc);
 	}
 
-	err = mpam_ris_get_affinity(msc, &ris->affinity, type, class, comp);
+	err = mpam_ris_get_affinity(msc, &ris->affinity, type, class, comp,
+				    &ris->cpu_less);
 	if (err) {
 		if (list_empty(&vmsc->ris))
 			mpam_vmsc_destroy(vmsc);
@@ -594,8 +608,24 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 	INIT_LIST_HEAD_RCU(&ris->vmsc_list);
 	ris->vmsc = vmsc;
 
+	/*
+	 * comp->affinity must include the borrowed mask for CPU-less nodes:
+	 * mpam_resctrl_online_cpu() matches CPUs against comp->affinity to
+	 * create per-component domains. Overlap between CPU-less and CPU-ful
+	 * components is expected; each match gets its own domain keyed by
+	 * comp->comp_id, not by first-match lookup.
+	 *
+	 * class->affinity is different: it tracks CPUs with a local MSC in
+	 * this class. A CPU-less node borrows the CPUs that can reach its MSC
+	 * (see mpam_ris_get_affinity()) only so that it gets a per-component
+	 * resctrl domain. Those CPUs already contribute to class->affinity
+	 * through their own CPU-ful node, so folding the borrowed mask in here
+	 * would let mpam_ris_destroy() later subtract CPUs that other live
+	 * nodes in the class still depend on.
+	 */
 	cpumask_or(&comp->affinity, &comp->affinity, &ris->affinity);
-	cpumask_or(&class->affinity, &class->affinity, &ris->affinity);
+	if (!ris->cpu_less)
+		cpumask_or(&class->affinity, &class->affinity, &ris->affinity);
 	list_add_rcu(&ris->vmsc_list, &vmsc->ris);
 	list_add_rcu(&ris->msc_list, &msc->ris);
 
@@ -612,11 +642,24 @@ static void mpam_ris_destroy(struct mpam_msc_ris *ris)
 	lockdep_assert_held(&mpam_list_lock);
 
 	/*
-	 * It is assumed affinities don't overlap. If they do the class becomes
-	 * unusable immediately.
+	 * A CPU-less node's borrowed affinity was deliberately never folded into
+	 * class->affinity (see mpam_ris_create_locked()), so it must not be
+	 * subtracted here: doing so would remove CPUs that other live nodes in
+	 * the class still rely on.
+	 *
+	 * Every RIS of a CPU-less component borrowed cpu_possible_mask masked by
+	 * its own msc->accessibility (see mpam_ris_get_affinity()), so these
+	 * borrowed masks overlap across sibling RIS. Such a mask must not be
+	 * subtracted from comp->affinity either: a component backed by more than
+	 * one MSC keeps a live sibling RIS after this one is destroyed, and
+	 * subtracting the overlapping mask would wrongly empty comp->affinity
+	 * while that sibling still needs it. The borrowed affinity is released
+	 * when the component itself is torn down.
 	 */
-	cpumask_andnot(&class->affinity, &class->affinity, &ris->affinity);
-	cpumask_andnot(&comp->affinity, &comp->affinity, &ris->affinity);
+	if (!ris->cpu_less) {
+		cpumask_andnot(&class->affinity, &class->affinity, &ris->affinity);
+		cpumask_andnot(&comp->affinity, &comp->affinity, &ris->affinity);
+	}
 	clear_bit(ris->ris_idx, &msc->ris_idxs);
 	list_del_rcu(&ris->msc_list);
 	list_del_rcu(&ris->vmsc_list);
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index dfa3ceb734d4..1c9e0e8b78a9 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -369,6 +369,14 @@ struct mpam_msc_ris {
 	struct mpam_props	props;
 	bool			in_reset_state;
 
+	/*
+	 * A CPU-less memory node has no CPUs of its own, so this RIS borrows the
+	 * CPUs that can reach its MSC (see mpam_ris_get_affinity()) purely so
+	 * the node still gets a resctrl domain. When set, the borrowed mask in
+	 * @affinity must not be folded into the owning class's affinity.
+	 */
+	bool			cpu_less;
+
 	cpumask_t		affinity;
 
 	/* member of mpam_vmsc:ris */
-- 
2.53.0

