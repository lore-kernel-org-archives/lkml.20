Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1724AA1EF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196992; cv=fail; b=cR/eMjkdGdv9eMSXoE7pJRo/VWFpTAgDtVlv/Atl6Ia3TIZH1ZdLMT+z82pZrOXpOjOYH2oyVz2Q8M4AeZHNjh/NA+jNw1JFMrwSBdPihbGMRhEedUytEhHKv/SIIBkFGt8UZLeZm2cp+swPTEKCw3cX6pkT0JABr24fgQxRmHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196992; c=relaxed/simple;
	bh=jq7gbxMhzMNtRTZkNUH6CEBIEGAxhiJl9Cjn2qwMjDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P8Jws4xAXy5vg+us1deZICXFAUsxY8fkEs8WIh8ewbKqJMXu66udSJbbBSyCrwKXQiehMCEror7PoIKfXQ5BSfRv118F2aJT8D8r4/ZnlzACLDQ9nr7a+K4A44ick3PQiflI+Pq/0o8jh0hIs7E6RP6wbYAWtRayTDaDJ9Tjj8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SBN7bK2e; arc=fail smtp.client-ip=52.101.48.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SBN7bK2e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ri8WEQhp3XA2AwQ2sV4BmHB+ZEwfdLY+vyxWlbYLM5JWAf4dRneg1QOsTWs80b+CpvMrdMwSfJTEKZQ+SZxlDhZun0ahxexeABr1CMCy81ydBCXUNRqCER9G7oj3aGv93VLIKibxlA2eZHjoKsdhNsCqFgpWqZeOSLHNzXJ0lk8wmMH7Izup752qfj8s3JFZj7SfQbaG5sltzo5nUxaMx7qzo/vFPXSY+LuVsN8S0a53tWtDTXf+kpnqUjiBnv/M7EfhyXLwlXBDLf/YhlKCiXubeyodRuojWmG5HKMgzoLqi4kKkGkuiYhLbsXUWuvLzBHIPIVZ8cdMp+v/wHlmMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLQUQrvkB5NlDBFN5FcVzx8KLfF0LKh/icPsqn2UKI4=;
 b=tX8juNKHsajQCGizdvnNdB2HXrekyxMbmGiJrNyvolrmH8zqIk9AebiN70Dmn8yTvXsGh3o8dNOTlhuruyyASchcTO5Fk3bj80OC9ZciP1dsFJWj0v7WhKNWmizLtQ3eWT+jJJX8qb8ckn+e6Nhi/t/ilgzHgy0OiRk6xmEXJml41QaJnAL8bdkwefeGy5ETNRI7ygiCOyZXlUNrHauCoIViiW8DXfcBqOmMUCT+VGmc03/nOSH88XtIQF+7vZYSf5Zj2nQW9MxY8naG70V5OGJpAxlb9HdjtSo/5UJWf2Rp+y9/UKSm66YCb8rxzaAkfnqAyNgYt6cuyknimOys0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLQUQrvkB5NlDBFN5FcVzx8KLfF0LKh/icPsqn2UKI4=;
 b=SBN7bK2exaARc/1WgqJpD8nVk5E9VxX859IyNjWXCPZL2vfan3urOI81wE2brcblzX3B+pO0haci30etrnslvbCA3NdOzTQdxgI5/FXtGonZyJjLJISZRg4aD0mzsL/yAERuQTZ/aTUs2Rd/JO7hdMBXwXjg+gb6Wl8c9gkG3OZ6H4voNgoxxfJOh0SliiGoLW8v6WQOqnKWgVDSS2GskprjvmPXryCWgZBaDwVj4E/cPdM2G1luupR/NpAHar6MS+hLR0GtoDcAvW1aKcb9pxokomTj7VgIUo8ResHduVx7p49WM26ch1rtTXPH1v7DC8tMbigUXbpsDHMkBmfOUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SJ5PPF0C60B25BF.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:23:00 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:23:00 +0000
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
Subject: [PATCH RFC v2 07/19] arm_mpam: Refine L3 topology and class selection
Date: Mon, 31 Aug 2026 10:22:33 -0700
Message-ID: <20260831172245.42253-8-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::15) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SJ5PPF0C60B25BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a2adde-437c-4941-f45d-08df07848182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|18002099003|22082099003|56012099006|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	jK+Vi2L96kEOL37rbkDx3rBUNN092b/yO8aLnX2JH/FKEWINAMqurw8v8LP4VZJBn3tCV8bongpLlUeI261Dei6rv7NCZn46T7pwT9OH17eOQXr+kdmHz7XXxDCkWICduqSUIIhr81ohFH8MnnGmC9kgFPwyLUZ/zaFZs5rTx1budZKL6L/iSQPvZNEk/RKtDlisvaNJhXCgZ4UYLbBW8j9leI+65zckoQ96/bz0Q/VA/GsZNZHPfaXm9z1iWJ4IaHFr3MQUiZ2zdb+qf8M1JDWIEHUjy7TA/XSzihVRDE+LcL9ZOi2uBeshHm+TX5bkvOZDgAwbcr1H1y//r+up1VtWMsHL4P2krbG1vrQ4k1M3RKQuHipu0B8bqr7nyLYePYawuV1sKN7z2ShymlVCHkCqMgmvsopoI5lF7Y8AziqSw3z/M5+RmoFnDaO1Zjq6VQvj3vwZsTgjslv6JsprLDaDnF3Ypt9BfhdLHnvr0kG7w37dW0sVzomZ7SdU8bq8H73jRFlb2QyWtLL1i+tZK+3OR2eqPUpSju7U9+rG6yEBgSI/jdK7AxBSYmxaYSzLLYzOZasO7UcjiCBiAeJTfD59POUaTnqDpBepRCH7JTMdryS7GMl2dKBC2DzzYtWbBHZM6zcyUBy4oi5Xxd1AqcMMBWft9G/oYagF5fkwwuAYgtjxtJ5TIHgofB70fx+A33LIOhfPc3JvjN/JqIl0cw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zjazgEV8erwXLgRDAE+yMRlUXSGeTgW/i7HAM897mItjOma4vN0cuEiR6wDI?=
 =?us-ascii?Q?qixRJ/JSfzzJ7iY16BrCsKfchBjozJqmlnqXwwY/l77iXJ64xNyjNZtu1Q/c?=
 =?us-ascii?Q?b6rvGg0K0WIsvnuthAzQIMC4QsPQhJtvnHdH5ivWRx3zAEqTxBWnYDKPI9AD?=
 =?us-ascii?Q?dHBH4MFyihO7MD3+jb1TaXBHYMxJop6VzDWbzcnnrP/iOzinBh39i6h4V+IQ?=
 =?us-ascii?Q?bg3MSPE5KjjhRcBCPgKTDri87dfd/F2/GaAvN7qo47NNBxmhmspeNGUrj8Gz?=
 =?us-ascii?Q?2JkX0H9mC6f9HgY+UdkqsZpMSswJyhKSfzPfQdZtDZuXoeH0/0uV5l7fMScb?=
 =?us-ascii?Q?b6/mSAyt0YGrDJsK2AGsHbpdkLebrAH+cr3lUoHv82UUiDk7eoACzO/x+7E3?=
 =?us-ascii?Q?8EIDRFqE4Turs/1DHOzu1Wd8LiImmmu+CP6GfqXNdFZZ60+WzwTfniMPrltL?=
 =?us-ascii?Q?8ZVji/yNjXbZszREMKk0EtNV8Zbo6McWlaSdbuz77gAGeMzzaKAzzY4jsrts?=
 =?us-ascii?Q?beDPBS6v3kqcomcd1zhiXSMgzkOpJoREXnFvlfbHnWyLZcj2RO7gQ1eROfft?=
 =?us-ascii?Q?SPkEpz3GSREW6rkEU2WUdubD8uehtPLqnqUGrJdauIWaBinTH8dtSMMMMB4f?=
 =?us-ascii?Q?HUY3M114lcpIBRPOi/jt0IurVA1Nn+xZOC2e2hD0BhUAPRHIVd54mUE/RMAP?=
 =?us-ascii?Q?sp1FvXvGe0uSm/a1lJF+xg2K6ghTzbSDMuZ+Nydy4O3RAudsSfd/yZbYNRy0?=
 =?us-ascii?Q?L0o/8+DdPjth1HcCIqe1SgkL1oaYwgahrj6XqZy73KwhSMBYZKT95e8OzdNe?=
 =?us-ascii?Q?p0skc561paEaNCiUEduF/A7hqpxEf2XKi7vKMolmLrkeqOOwRwdz/Jf+oDw6?=
 =?us-ascii?Q?NUIahMXLkWrh9ZA+UGNqbj6k4QLDVhqWkbMKPnU7yp7OoaODcX6Eu/tkrEnO?=
 =?us-ascii?Q?wnYS0SAZrAEX3K0iJlnOR/8EgSi8iKPfwF7lplyZ/9+TK/hRJ2B0K7nsGRSk?=
 =?us-ascii?Q?rKwZPZRYcLX1qsNzy5/MFSHmpNylfJqx9H0PiQ3t9ZpaoczATDpf0NFt0NO0?=
 =?us-ascii?Q?5RYousKBLNKeNl0XxmEtvugGyPTkVy2dfI6Z3lPRghz18/aYceug0j6xbVkN?=
 =?us-ascii?Q?lzVu6lL1gD764xiLw5nxGIm5ilu3a7O17crm/FYclJPhEq6cBOC49TEmOnhH?=
 =?us-ascii?Q?9IIHg1Vp9BNXl5xIUNJE0a5h6SFMLBC8/55QghqVcOfbrgmcxknuiL5AqRVt?=
 =?us-ascii?Q?947l+NdN64A8SybyWu3dYEJmH87R66ThHFJxsxR4+oTnKsfEGkBWLyRexlyv?=
 =?us-ascii?Q?6KwQPkP8uYhf5lemw5KN6Aj9JCikbtU0EDMeZ0hmUKszJqrTZ9p8KxmCgSSr?=
 =?us-ascii?Q?e7yeIA5247KJhpyGgtWpFRdfOujhzSGYHrPNoaatG50V8OKkNo+Y3ujIxcXw?=
 =?us-ascii?Q?21Y5m4G6F7J87Unz9DOzjzD5JuRlnebBAO6LypKz30qGJM5BNKFrTjn6YZH5?=
 =?us-ascii?Q?NH2R+cAFs0gIcCr5+SAIru91xGI4Ru+QEOpZlPiiFjS5nyuPvI2X3eoGPN1Y?=
 =?us-ascii?Q?PeuVv3+eb935lBLCFY+I9Dwx1souo+YTa6EbCBlQRA7QJ0dOVsjuOupmOKAe?=
 =?us-ascii?Q?lRrXZMOz660kFA1HUIkW9xQgGEKNSQAL/dYrx9kOVx0eRodVdE9oErK2VcX6?=
 =?us-ascii?Q?IhUCZMnD5LAb3ayZN/kUniE88+SSa7AKHIFc4LGLowOSKva1nHPtKTAEKDNy?=
 =?us-ascii?Q?i6YDHLmCrQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a2adde-437c-4941-f45d-08df07848182
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:23:00.1335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TITnZ2evMjdzbbfq/Lr8oa+9g/zjJK/rZYhHiW/fJUJxLKcIjJBJ0MiJmQtLOzNsLBl3j/Nk+EU1/3vz/oWgDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0C60B25BF

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

