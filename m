Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259488;
	b=EvFWMkJ9d9BztgWRtyyvHHZEg/n/kmKufpEuQZbGZ4Q/8306lReK94B7Jn6LDpqIsOf6
	 /cLjmvmN5MMLB2RYpbsxv1PpAGlyAS1r6H/PfYavu/GBWUjS3qJeHGuXSLipjECnBWKkg
	 gLlO+K0ypKlrZ+uBuNI/AiU/60QOQLDjS2T11QqOaNgJ2q4/WGEI5w7GootKRMh18fpCh
	 G70dIWLJvT6onDnax6eWRnSVn2ZMHhQNYr8bEdkY0ZJIxldhDx953Nit/H10MYSgpqyEk
	 4UWpTzMEkJoFSa3EIjlb7ttWyIhMMv1GTzfvnuJwIX5FqlkwI2ENno0h+Rowep0Cyzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259488;
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
	bh=HLQUQrvkB5NlDBFN5FcVzx8KLfF0LKh/icPsqn2UKI4=;
	b=oLmZGvkQP1gIVaO35SgOqcy27ESJVvD5JmNe1bZcyVxFY+OE2R0snsOOmpzQk/X1yNIw
	 4x6sqvMC3hdf8zmDMfPM6CMzpPN+apOF3i9BVJsbh309n1Z7CDtXQDfx2FBxesbABDcIZ
	 MfYdFr2m64R6E49o/XBv6e02egUBkgi9X5qjUC6+O/iiGwhFVLaUj93nqilsbL+q61zC5
	 GYRAxxn6d1NFnJ+xlc4MAxHpWDsAPjwntanE9FONJ5LdYfwz09xuK/rxJrz5+4d8bJX1Q
	 NP9wuj8PfRGqinUbsTZATdxDexmn80q5kFv9tm67I3KOMI1RSO1fVFlxVcTWsm/58LQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=C7iZl5Wx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.65
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010065.outbound.protection.outlook.com [52.101.46.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEE9606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DEE9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=C7iZl5Wx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmEe7qBPji2twVT4BYMHfd8VWC26M5LmyVtP4mYijHfHFD2TcwN0OCdlz5R+Y+ea7QUnDlG3kFdpVkLCcvsWikGyb12WYNvLd8hc10KfDyp4pz5l7fIWfdkmq4equf/qOBDIEpyM7UasJWFT8hyHrW1HvQxrT7lRaainxSOqtRCBH6ByiNsiNYohbn49YZoJBp7gpHXtzv0eMDbVbXYbvLpOmXOMsIN1hTGzgg5t1iQ/xxX9sEuka/WP4rDync/BYE2FHTVEPNu+xB/zGVLmPD8NVLheXNQGdSPlT2UTmz+JUvRfubPFKIOeuxnwHioehMdIdwamr4Ke90vdzjKNxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLQUQrvkB5NlDBFN5FcVzx8KLfF0LKh/icPsqn2UKI4=;
 b=zSurgVQmDtZ5B7ZplfDAwuJuwlQkLPY7pP6pvwY/Y8DyFPW4mcwxTARflKkDkp2Au4jdMI5LGZsgSb4o49I//N2A/4qRkdnAvqQV4bmwbbfKgqyUWJZU7iWhgG+JIbcU5gGr6rhIkhYGN/SNunlms//ZbSmSIIu1h+VoEDjtByMD3wu7GcZSWoQ2S8GAVKZjhwtD3RpF3WT8PMb7heKF5bKv+IXwlGtIOTmCtFtLzWR81D9sBKHD620rsi2+ckNYia7xlT0p2Qz0G5Y7e5DJTrSp/ZkFJbezK/XXbvZw8hmCB1mqp1BUNqfSzVHM/TaV5KmifnwktKBtYC/OotrdYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLQUQrvkB5NlDBFN5FcVzx8KLfF0LKh/icPsqn2UKI4=;
 b=C7iZl5WxZXFN9pNOI+HFsapreKvpi2ejO4GTzk7wTPft27oCzSJU6kulTkNIZd/aAocAKno9Tcvvzy0thUWlf1mr8jJ9X7R3vCzpx+w83+X5hQCMK0gA+n7dmryTTrE6ozsWfOEalhM5P7SBdwky1j5KxqpRGU1J1E6TV160FuynJAj5dG/8+Jq+1uQmdHz6jWObGQp8+Khs2qo1e7kJ2RsM15uSAlikiu25yAfI7H3NEOD6my8AYkA3nJrnwVpakSFhoaY9EVEnOvbUCKAF720A7CB2ypSVLUYIStuSfmVDleANKipw1/uUxBG5UrMrdnBNSubFABLxw3hI4yN6xA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SA1PR12MB6869.namprd12.prod.outlook.com (2603:10b6:806:25d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 21:24:42 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:24:41 +0000
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
Subject: [PATCH RFC v3 07/15] arm_mpam: Refine L3 topology and class selection
Date: Mon,  9 Nov 2026 13:24:19 -0800
Message-ID: <20261109212427.1409204-8-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212427.1409204-1-fenghuay@nvidia.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0084.namprd05.prod.outlook.com
 (2603:10b6:a03:332::29) To DM4PR12MB5230.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SA1PR12MB6869:EE_
X-MS-Office365-Filtering-Correlation-Id: aca9b814-7392-44f6-9466-08df3ea7de15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|921020|261009223027099003|261026140227099003|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261026121527099003|261028144727099003|261102123227099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	uYTAesGPpVDKAz/lb0irS+QoJQZ4vVEpXuM8s22R2MInm5zJCPubn2mmwNzGcUc/FWLKunjMQUacAWrXVAccx0CxTgehqwXiNVGZ1T8AOAibjbqVhcZxzFIxeoinT9VeheSZKaL5JmgEuDXTIvvgQQtjKig0E4H+CFilm+tOsfVAvOwFYsFUHtmUjKPvBiCV0KS/oaJNcuXKcjUs6WBmOKThgHP2VmYX8dQ5VawUL5f/p9xr3X/8458Usaga1x4iEpPS2ruuxXcGssr3wGXoSnOqH0N+wFdDNKQurpeSV6NpEso3BQlvJsad0k93pXuoVQKkRD3m+sJ8ZqyLwxTblYcoHxCSmEjDtyQRSjZNQlaZCTL3QoKYnmjShMirRDmRx2RuLJvDWqYBtFJ7l/eNnujd10fvygOQ+NfR/vyPFiI0/ijusuQy1+vYVryrRZi9n5ZLzTrt5JK/NvJ4G8nsLiO5NBWtuKjKs+v+ww+jAw3n/ZKU6X6vadwjQh9ObveW6aWfKRSxxcFztPYnFUwNYpG8TPA6MuaOnjWpneGaZYRk3s3g/xMQHm0IzJeUD4XW6WDz75aieijkX9qszEErksiyXrXJ9NUBZAIG/AEgR/+AxTEA8VyepBt38pzbEJZ9eJtY7jtudfbMHwZyLgGomXUPeLE9HjXFaIufISnkFpylOQTJwOTHZvG56XDYV/C8UzoD0k5UZE0E/gglaFzibQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(921020)(261009223027099003)(261026140227099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261026121527099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vQFY5qhS0UBz2QSStTdRzh1EJmbAimdiop0232Iq4ZyMQTBX/ohpUAlce0Yf?=
 =?us-ascii?Q?ZcJcQKIuCBAJBJWpshX8dqrHXIS3Hfl7rQjbj2J1zQ3AQAZ3HlREic6ywaRV?=
 =?us-ascii?Q?7hKCqJx5vqHj7OFbC7JIckTSVGf0uv7nmOMsLssg/Ns8hbvHbZhLZKp3pWG1?=
 =?us-ascii?Q?p9b6O/cDJe+y4hJh49+ygciQ3kSzTQgySm3QAQumINdbp33xHmZPVFB2TTTD?=
 =?us-ascii?Q?jfJRbKB5eC8frt95xrC/hBApjrQLBffNyoTkGd3yDxvFYTNhO9HI50IRHcxt?=
 =?us-ascii?Q?LcagKi4naxH1sz0MHEKPhN4u/mdDo/usQR5c3ZYXlu+M5ZV1nLyY3kASPg4C?=
 =?us-ascii?Q?9adeZD2XExnpalYgYCrRwWusjm4MKXBPrjbr8qE4E2s92unOxN5dSICZh21y?=
 =?us-ascii?Q?9x4Bb+ovbda3I2Wm3InswFkebcCvJgdemKM/QklCQlpltea2/M65FaaeE3PM?=
 =?us-ascii?Q?9/4fL1/fFJ/X7kp3tDugNcXol5DxFRdX2Ysme+LUQXh4cl5SSiD/4WeWqPpM?=
 =?us-ascii?Q?cmaozUz4abQmGKkXnM3XHSRZXenYN+tCcX6IixVemL0fppZvNQBn5/lQP978?=
 =?us-ascii?Q?d5Ia0lrlzFO0fMb6+TkbjAscO4ktx4g/lFBmReNVNBOaExcn7vi6OTArFNVG?=
 =?us-ascii?Q?W/ExMtoiez6iTLqXSJ9DHH14GEMAAKKMw6lhEg5kTHQSgjioj0/Ujh8TSc/F?=
 =?us-ascii?Q?fAedG4eTFGokbmFRbUZd70RXPAvuOj6H43Au/AF69trWNV+MFh+edu5hj8v/?=
 =?us-ascii?Q?gmIsgE4p1MRrWYywp/5YyZqM9+awXIaaqCDoVp1Ql+IDqg3lY+4jF2i+TpoH?=
 =?us-ascii?Q?5EPjLwYglALyMXnqMj/Mg1qpdZe6o1NSdt3fMZx/s0zPSX0TluRjSUlWbSf0?=
 =?us-ascii?Q?igoTjgxAQcYtGBlUQaUbj1MYZWFhyk6VID/cXUfDkUyvkDp3cYsrZdofJVRh?=
 =?us-ascii?Q?4nBoeqGjjB0M5Ee0RuMae44zUuN2Q4VGHQuBR6lQzMdVmC4Ne/suQAvOzU60?=
 =?us-ascii?Q?nmHWih3yJ6U4OZWdc/4hlUI/WKkPv4vWrk9YhZ0yyLFdcX+d2eZQ7mBA3lVe?=
 =?us-ascii?Q?D/1nvvoswq6vzdOK1+kguamOCG0jeDMf3R0MhCa5TnH0q8tF/F97bG3W3dj/?=
 =?us-ascii?Q?YaI9k7DRHus6faAB28ZPEQqyGmpBhRwGEL1c9Dio+W5LCmMIKxoHdEVUpt/D?=
 =?us-ascii?Q?wh9TG0creph8yERmKWYqL0P2uaR9oZMy+EVZCElxzwOwQUx7Knqsv6HCXPOe?=
 =?us-ascii?Q?r1mL+/wDg2Fhkc0rDfbIeQZjwiq+xOApJFgGWQq8ltihckbuWEhFnx8GJFG2?=
 =?us-ascii?Q?zXUTErDa6Wq52KpP3iWSOmw8Z3lET5Zxe6ElhxjN1uBgGQ4esOkRmQAntezc?=
 =?us-ascii?Q?E3LazMHw15Q8BAG2SCtBrtjpw7teqCyiBEa48LBGyAfvC0pwSLlyMAs8hACc?=
 =?us-ascii?Q?/X/YsYk8vS8xOcbtxowl1cS/lkGqeLd+PZPjk1Zt4TeT92KHpFxgbephy/f5?=
 =?us-ascii?Q?fNQTZGSUhaC/5qlbVz7qWT2CH4wm//61byrGzVEEw2red/a3B0q5jRZlWc6h?=
 =?us-ascii?Q?jE42ELRV4o9qIc27mlyDyAf5lqC805hjiWCheVhnz0IVvv8vM+NfXF/VbO6q?=
 =?us-ascii?Q?qYEljS2sLXZWMRPVI+FCbpBnDQmlVCnYwNJMKC9IQrAl2HhjyOlokhrcGb24?=
 =?us-ascii?Q?cG+uekBXfLLw0KrNgYm0ZhhFk2Bc/K05xCHIVZyMu23Aq8QRdyx/gXXkJVck?=
 =?us-ascii?Q?OKOeEAxi5g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aca9b814-7392-44f6-9466-08df3ea7de15
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:24:41.7705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r72SIFG+z1WboIP3GDnMIpPdp0MXZV+TMtY4hAMhz+s/EPVt4dbmzxp7lbqOIzCHhtv6Mom0ZyXxb7ackXPQ8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6869

After enabling memory-level MSCs, the existing class-picking heuristics
still treat every candidate like an L3 cache MSC. That rejects valid
memory classes for MBWU counters and applies L3 egress checks to MBA
classes on CPU-less or system-wide affinities, leaving no monitor or
control class selected on affected platforms.

Adjust the heuristics so memory classes can back MBWU directly, L3
topology matching is only required for level-3 MBA candidates, and
traffic matching is skipped when the class already spans all CPUs.
Also tolerate components with no online CPUs once at least one
component has matched.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_resctrl.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 47a7b18d841d..72302f6021d7 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -865,10 +865,12 @@ static bool topology_matches_l3(struct mpam_class *victim)
 {
 	int cpu, err;
 	struct mpam_component *victim_iter;
+	bool matched_once = false;
 
 	lockdep_assert_cpus_held();
 
 	cpumask_var_t __free(free_cpumask_var) tmp_cpumask = CPUMASK_VAR_NULL;
+
 	if (!alloc_cpumask_var(&tmp_cpumask, GFP_KERNEL))
 		return false;
 
@@ -882,8 +884,11 @@ static bool topology_matches_l3(struct mpam_class *victim)
 		}
 
 		cpu = cpumask_any_and(&victim_iter->affinity, cpu_online_mask);
-		if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
+		if (WARN_ON_ONCE(cpu >= nr_cpu_ids)) {
+			if (matched_once)
+				continue;
 			return false;
+		}
 
 		cpumask_clear(tmp_cpumask);
 		err = find_l3_equivalent_bitmask(cpu, tmp_cpumask);
@@ -903,6 +908,7 @@ static bool topology_matches_l3(struct mpam_class *victim)
 
 			return false;
 		}
+		matched_once = true;
 	}
 
 	return true;
@@ -1041,13 +1047,15 @@ static void mpam_resctrl_pick_mba(void)
 			continue;
 		}
 
-		if (!topology_matches_l3(class)) {
+		if (class->level == 3 && !topology_matches_l3(class)) {
 			pr_debug("class %u topology doesn't match L3\n",
 				 class->level);
 			continue;
 		}
 
-		if (!traffic_matches_l3(class)) {
+		/* Check memory at egress from L3 for MSC with L3 */
+		if (!cpumask_equal(&class->affinity, cpu_possible_mask) &&
+		    !traffic_matches_l3(class)) {
 			pr_debug("class %u traffic doesn't match L3 egress\n",
 				 class->level);
 			continue;
@@ -1175,8 +1183,9 @@ static void mpam_resctrl_pick_counters(void)
 		}
 
 		if (class_has_usable_mbwu(class) &&
-		    topology_matches_l3(class) &&
-		    traffic_matches_l3(class)) {
+		    ((class->type == MPAM_CLASS_MEMORY) ||
+		    (topology_matches_l3(class) &&
+		    traffic_matches_l3(class)))) {
 			pr_debug("class %u has usable MBWU, and matches L3 topology and traffic\n",
 				 class->level);
 
@@ -1314,6 +1323,9 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
 	if (class->type == MPAM_CLASS_CACHE)
 		return comp->comp_id;
 
+	if (mpam_class_memory(class))
+		return comp->comp_id;
+
 	if (topology_matches_l3(class)) {
 		/* Use the corresponding L3 component ID as the domain ID */
 		int id = get_cpu_cacheinfo_id(cpu, 3);
-- 
2.53.0

