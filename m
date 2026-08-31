Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06712425880
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196978; cv=fail; b=oJsp7IFXHQjeoG2/TkpR3vriQbs2FvCftXfIi/ffhTgHSKFwXXJ9n7RQJc84DAl2Adze17tkH+wgbMQYQ16B8py/WtTDQHKO8mTf+8PufgE2BGY87Tgs5D/zakIC3tAJ1NxgS2hqgeW9r0nFUnFDdbn6BuGQeCA2nx+mykOP2O0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196978; c=relaxed/simple;
	bh=PPqOdj1gzrwkVokGRoj6DBZ/glIxWhd/psdjnxmjkN0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oJI5mgYeMADNXpmcaCOefXe9Hnr+niKzpM4MdZPRL+Jbe+oQ3n635L3DUiMFMyBSQ+y4jVL8JNHGdbIYL9v46UHFgrB1nVkZ5QyHbTUoLc5+scAjFoMnSdzuxgKvt0BJRHBIqMFj62beh+OhzBbMe3TdvX2EGCkIwxNm+h03AjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n/agrL3V; arc=fail smtp.client-ip=52.101.48.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n/agrL3V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5cmcEzQGFv+/49fsry03kyxqqdK7Aou3gfLFSlFMbpXOEJGqznlOl3A7mj3lZhahTbZ4ZBJosj+olvLpw2qodo66NHiFi5jkb/dV4oKOnBBcK66Tbd47Su5XwSuNNLGXYorwffEGvJD9wI/hGUZaoLAnHVgQU+aUEpYh1sWApJuHwK3EZ7ojbsYSza5UdGmhvLeN2RrTpvXVu0UFpkNk8sh3bpE3/Xctg/5MrpP9AffOMOAP+H0LxZ5cTrhMdxcUYKNIHFLyIE2vFrEoZhBKd+YAsFjwRlqghFA+5FWmbIZ6Ew53tQ7ICAMwcEu+A00AIw6CKWskjwM29XkEKDi0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkNq91r5/SXDONDxtk+GSc4Z+HXOn3ecllfMABPJ7/M=;
 b=PZR58Q9JiVV902S5TRvounv8vmc9pe+3bBvv66KZExSOer3w/EaSMk59/x4dWOAEzWu7bG/jA1mITxemfC+MkGPBMxMojE2haiBmmjeDRN81lOCuJz8JenjDest0XP7QuDZRNOglKcHH0sm5/G53AejBHw5UzSei5JWAefbhlAq8NZvKe9OXZIXqFLmGUXpuK6gWzWMTHHho2mlwUr8St1cXSAlC04MKQs9mKDveSXnxMkV/x9xj91s+kWAjpTIj2XWBmJWha7wOLPoLZShhnIVR5Uvy4Wcm7Zj0EvlLM5srhzwKHYwpZKz9fNuNnOAHFexjbM2Vv2jWA9TpWxRGag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkNq91r5/SXDONDxtk+GSc4Z+HXOn3ecllfMABPJ7/M=;
 b=n/agrL3Ve96TZmAhE0z2mHfISKcuBYpVcyiUbsuqsJyaTgl1+sFsyaGeV6BnYgOXxIqh70ZtCAntR+/C+itoOKBBWK+0oYFYGa5a40iCirWmA0QBo2JLUAF6N6BgISomxm5TPj3oFSCCdBEJ1jsxj4Oi38N7Z3Evqm+GZO9W+7W9Y1Rf7Q6g1cursZcBcg7Guu4o8uXNmGJtmibJjrvR/HWrfVrdqvGNf2+rg+/y/cJEiEj9OBY6dXyy/wotsCTgrrtzMWZFfN7AGjx8kJ7gNbnscsoSg2fXj1H57ro1HgZF2zoQSeOJXRKit/N1X9B1CdsXAEd7g+xBDamBzFPJ4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SJ5PPF0C60B25BF.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:22:52 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:22:52 +0000
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
Subject: [PATCH RFC v2 00/19] arm,fs/resctrl: ARM MPAM MB_NODE support
Date: Mon, 31 Aug 2026 10:22:26 -0700
Message-ID: <20260831172245.42253-1-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0101.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::16) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SJ5PPF0C60B25BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cccef01-a844-43c5-dd4f-08df07847cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|6133799003|18002099003|56012099006|11063799006|3023799007|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	pG4tEjfiTCHG7+OnUYzjbykwiYHZqfwPnKZodQyHwWW1RTkyoOKsmaW9oZZ1aJ13yCuMxo3CthdONkq0AY752VCcYel+ZdCybW/AQuNk7A+0H945cYkSGeJ3g2TDDs7Izl0+1qQFyOMJ0ygnV0V/2qfeRw87iEFESEx7ZZifKBZIIazUcWPpxvLcj3l8L5hMACIInurvY6tI/2iGXW1FCgO/Qia0Xfm6Jvd4a+pbl19x9r1eb6uJevrVq/o59PqBOdfXLcM6c27dx6numHdN0KCyYIFbBwtYEHy5rgqWwBhI8MF6pEr6Dz7jr+A8wvFP1yNNPjEO8cchtnie+YXBED6uQOpQzhevpilmT8IpROBEYJcHs27MYVvPnn1DWufws7TUyTL4KTHPPEnMHzA05wG8hpXAWTm9z0HezsG5sRvSxYcc7Jmu8eF21LCCJK5wXtxu/maNR0bJK1A08FjdXwLSQwEtX8oRMRdLBFhXJAEr85Gphco7YeOhKkNPXuxILLyl96Phe9rD3ZCrLxpcLbZY4sFhmgY7zXths34ZLCXrw0bp0Kdg7I7Ed8STmFq8TV7hkRolRn+x9+T4qXpJCcxXMC2yDBm4x+wRdRESbzecdzG6HhiyAXGhbzsEwnY4v+MFzsnwmgBSwQ+BLsUP36RTDQO9jQrQGgFdRIn4i4Dz8GPoDxeIUcVpw1hGKYU4r+jSCQgByseVJHMyny6wWw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(6133799003)(18002099003)(56012099006)(11063799006)(3023799007)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWpUZ2RZRVcrTUtKYXhUU0VybHVXUC92b25hM0dEZ3RoSkJ1T3VwaHVuTGU1?=
 =?utf-8?B?VDVqSDIrakZDM1JPdFd0NTd0QlEyUUMzczBhVURJWGJOeWV0NDNuREZOalJ0?=
 =?utf-8?B?b1VJZTVQcXJ1dDNvOUp2R2MvL1R2OEVYVGpoZEZObkdxY3ZFWnlSMWhMdTdI?=
 =?utf-8?B?cHpNNEVhSDg1UUxteU8xbnF4TXBuM3JNd3pWSUdpWDI1QTNnbVdjcHJmMm9p?=
 =?utf-8?B?SG9ITkI3SllCMVpoRFc3V2E2VGVIVUZrZWo5aVpBWFV2WlBOQ1RscmtzSmZQ?=
 =?utf-8?B?MndGSVYvZWxWWlExTVhFclh2QkRDd1ZSUXZvY3FGaXpBNzdOU0hXeS9yRmI3?=
 =?utf-8?B?b3p1eVZBNmpGWmF2VnBQek8rVWZsOEFYZkxNQUpYanZMbDVSbUFBREpGQlhM?=
 =?utf-8?B?ZDNHZlFLRjlVNE9iRG42WXhRcnQydUdRY1MxNEc5b0s3cHVZQXZpaTcwcUhl?=
 =?utf-8?B?TFVQU1ZrNGNRVTRXUGp6bEdpOHBvYVZjVVhmQ0xiL0JJaWFFOVljeDZ6OVVy?=
 =?utf-8?B?bFRhQWY4bjlzZmVBRkV1UHg3K3V6eW5ZY0x3aGljcjRzbXg3MVVRdTRTL3hz?=
 =?utf-8?B?WllVWWU0UFhPbVVicWErSmJYNUhtNVRiTU9zdWwrUnNuTWRZZXdhaHlUN2tt?=
 =?utf-8?B?SCtQcWV2cW1TRkdRejI5NGl3QVk5RzNESVVzL0Zwb0lUNkx4a2xlMURIL3BI?=
 =?utf-8?B?bWYwbjJxUWh3aEpESSt5MnFxaDA0am9IaVY4VkUzYUJTcGRXVUpOTHYrbk81?=
 =?utf-8?B?dERTU3hzbWtXN1hOWlRwK3dlQWYwR1NmV0tWRGdhOWVkUUlXNjJyYnhnMlIz?=
 =?utf-8?B?aWFiS2xLQjhoMUg1bmRnMERSR3c3YjFzeWEvQ0ErTDlhcG5KMys4RzhnT01v?=
 =?utf-8?B?RmVKc1FkUWpNazMwUzcrMHRwTDlxcGRndlJtOENiMUp6WEpkbnZKYUkyZWtn?=
 =?utf-8?B?b0pJeTBIaUl0aWNhNVBWc0xRdEw5MU1pZzhnYWFkMFB2eW10OE1oNnFMQzlk?=
 =?utf-8?B?a2M3QjYwZWRiUE5Nb0J6VUwxdmx6ZjRVampSaUhnQ3RvTS9wdE40VyttMXpP?=
 =?utf-8?B?YVJqZC90QU5kbkovTSswOERVM3pSQkdmNERsbzIwMGdacjFiRkZWdWlwY0tv?=
 =?utf-8?B?MEd4UmUxZWNEOFJ6dXVDU0srVVFXbU1VZTkzRnJlRXoyelBaMXp0blR0RUtM?=
 =?utf-8?B?Nk1Pdi9wdUpjQ0V5eG1pdDE2aU1ha1Z2NWdkR1B4Vkw1VnJMdVRoWEl3ZDJ3?=
 =?utf-8?B?ZVY4blNkNXN2UGtKaFk3cFpuNmpITmdwK1ZNb0NqMHFCd0k5alJLcTlOSm9q?=
 =?utf-8?B?ZmdCVGpQYU82dnRxRGF3MWgyVSsvRUVnYjJUQXRXazFnSE9xL25NWDFqUWpN?=
 =?utf-8?B?YWxWKzYxMTM3RVYwNzdhTmp5dmg5OGNPYmVjQzV0ZjdWblNnS3NrK281YlBP?=
 =?utf-8?B?RDdSYzNIK2t1V2R1VVFXTnpRNUhSVUhzOStHc0UwclhPc2xza2h1RDJ0MWVC?=
 =?utf-8?B?QmpWTUlWU2dXRTFEU3N2NHQ3YllEOW01RlpRZWc3RmhPOHIrWHhsWE5iUmho?=
 =?utf-8?B?dFZWT0pQNG90RUlZSHY5SUV5MytGZlJ5ZWdRREhaZlRGZHlNNU5xOW1kamRY?=
 =?utf-8?B?Yk5obEY2ZTBvS3JkNk85UmtjdEJMcnBnWEg0bWIyN1Z6RU80TUFTNCtJZGxi?=
 =?utf-8?B?VzZjZFlDdXZpRUwrdjhTZUpwZFJONVdYY01FVWd2OVJCVlhmRWE4Vit6eDY1?=
 =?utf-8?B?cC83eEJESHVXei8vRTB5dTFLbDJXcUM1VkE3NzFKMFVPT0dTekVMT3c2a0dF?=
 =?utf-8?B?RzNSempOZGo0RzFtZnQzMGNDQVFmRloyTmhxVXM4SngxKzNtYWtmclBoMVpp?=
 =?utf-8?B?NG5kSXRUSzBTL1A5dUFnZkRKUC81Q0ZWZXNQcHpXbWVQcHRxeTN2cVZKeWZZ?=
 =?utf-8?B?eWxOT3JsSG5WTXBTSzBwN0pXODcyZjBKVEJWU3U4RWdaeGlmT1M0emd1R1Y2?=
 =?utf-8?B?NTcyMW1zdDBOUVQ5Nm1PaXQ1Y1pIYzdlNUdHQ2NNeHhNSUJLVzBiUXpUNHMy?=
 =?utf-8?B?Yk5ZVUhtWDBqU2U2TjFacTVaanlTbDdlaUVxQlNpT0k1Z1F6M3EveGY0UTBG?=
 =?utf-8?B?ZkJTbVNhTDNkTTI5VXdDOUZqMS9MMEMvM3ZHcUNFVDE5TVZ2RGU2cTBNaGdw?=
 =?utf-8?B?R3BYeU56TDhuc2ZvSU5wOUZqTXN1eUt4SjhqQStrZ2NLYW43UTg1KzlCcUM5?=
 =?utf-8?B?b0E4TnVBenZSemd6aG9WeUtyTE82UFFVaGVtRTA3dVB1N0tyS2EzeHlHeVZE?=
 =?utf-8?B?b2hvMlBRektZUnN0ZytHY2RUTEx5SGZBY0ZHQXBBSDlaTnVERHJPZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cccef01-a844-43c5-dd4f-08df07847cc1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:22:52.1501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qy/AZottX4n7JhqFNBJNOAanBux9ex2qe38JniyeK5UeZVyoF9KBHrOLAiy2ZDgZ/CGCRNOQnAIPoi3BA/BM7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0C60B25BF

This series enables MBA bandwidth control emulation on ARM MPAM when the
default MB control is disabled, using a node-scoped MB_NODE control as
the native backend.  It extends memory-bandwidth monitoring and
control to memory-level MSCs or CPU-less NUMA nodes, and adds
documentation and tests.

Background

On x86, MBA bandwidth control is typically associated with the L3 cache:
schemata lines use L3 cache ids and monitor domains appear as mon_L3_XX.
On some ARM MPAM systems the MBA control is backed by a memory-level MSC
rather than the L3 cache MSC.  A memory-level MSC is represented as a
NUMA node, and that node commonly has no CPUs of its own (a memory-only
node that still participates in bandwidth control).  For such a resource
the control scope is NODE, schemata identifiers are NUMA node ids,
monitor domains are named mon_NODE_XX, and a node-scoped MB_NODE control
may be the only control with usable bandwidth hardware.

Because the memory-level MSC lives on a CPU-less NUMA node, the driver
must handle nodes with no local CPUs.  mpam_ris_get_affinity() derives
affinity from the component's NUMA node id, so a memory-only node would
otherwise end up with an empty CPU mask and never be registered.  When
the derived mask is empty, the driver falls back to cpu_possible_mask
(masked by MSC accessibility) so the node still gets a resctrl domain.
The borrowed affinity is kept out of class->affinity: those CPUs already
contribute through CPU-ful nodes in the class, and subtracting the
borrowed mask on teardown would remove CPUs that other live nodes still
depend on.  Domain setup iterates all MSC components per CPU (keyed by
component), so each component — including these CPU-less memory nodes —
gets its own control and monitor domain.

Examples of NODE and emulation interfaces on MPAM.

** On platform with CPU-less nodes, by default, control_mode is legacy.
1. By default, MB is emulated by MB_NODE in schemata.
info/
├── MB
│   ├── bandwidth_gran
│   ├── control_mode        # [legacy] native
│   └── schemata
│       └── MB
│           ├── MB_NODE     # emulated by "MB_NODE"

schemata: Only show MB, which is emulated by MB_NODE. domain id is numa
id
MB:0=100;1=100;2=100;10=100;18=100;26=100;34=100;35=100
L3:1=ffff;2=ffff

2. root can switch to native by writing "native" to "control_mode":
info/
├── MB
│   ├── bandwidth_gran
│   ├── control_mode        # legacy [native]
│   └── schemata
│       └── MB
│           ├── MB_NODE     # no emulation, native mode

schemata: Only show MB_NODE. No "MB:" is emulated.
MB_NODE:0=100;1=100;2=100;10=100;18=100;26=100;34=100;35=100
     L3:1=ffff;2=ffff

3. llc_occupancy in mon_L3_x where x is cache id
   mbm_total_bytes in mon_NODE_y where y is numa id
mon_data/
mon_L3_01  mon_NODE_00  mon_NODE_02  mon_NODE_18  mon_NODE_34
mon_L3_02  mon_NODE_01  mon_NODE_10  mon_NODE_26  mon_NODE_35

mon_data/mon_L3_01/llc_occupancy
mon_data/mon_NODE_01/mbm_total_bytes

** On legacy machine which only has L3 MSCs. No NODE scope in schemata
   or mon_data
schemata: MB's domain id is cache id, not numa node id
MB:1=100;2=100
L3:1=ffff;2=ffff

mon_data/
mon_L3_01 mon_L3_02

mon_data/mon_L3_01/llc_occupancy
mon_data/mon_L3_01/mbm_total_bytes
mon_data/mon_L3_02/llc_occupancy
mon_data/mon_L3_02/mbm_total_bytes

The patches can be compiled but not tested on x86 yet.

The 19 patches are grouped as follows:

1. Memory bandwidth monitoring and control on memory-level MSCs
   (patches 1–10, 12)

   Generalise the monitor infrastructure beyond hard-wired L3 paths:
   de-hardcode L3 monitor plumbing, expose MBA MBM counter assignment,
   name node-scoped monitor domains mon_NODE_<id>, add a node-scope MBM
   total event, and make MBM handling resource-aware.

   On the ARM MPAM side, add memory-level MSC and ABMC support, refine
   L3 topology and class selection, refactor domain setup to iterate all
   MSC components per CPU (keyed by component), and handle CPU-less NUMA
   memory nodes that have no local CPUs but still participate in MPAM
   bandwidth control. Memory hotplug locking and notifier are added.

4. MB_NODE emulates MB (patch 11) [1]

   Wire MB_NODE as the native backend that emulates a MB control
   in the ARM MPAM driver.

   If emulation is unnecessary, this patch can be removed.

5. Documentation (patches 14–17)

   Document memory-level MB control and NUMA nodes in the arm64 MPAM
   guide (patch 19), NODE-scoped MBA domains and mon_NODE_* monitoring
   in the resctrl documentation (patch 20), and an MB_NODE emulation
   example on ARM MPAM (patch 21).

6. Tests (patches 18–19)

   Add a KUnit test for CPU-less NUMA node affinity handling and a
   kselftest that exercises MB emulation mode switching,
   resource_schemata hierarchy, and schemata mirroring on ARM MPAM.

Apply the patches on top of [2].

Testing

  # KUnit (CPU-less affinity)
  sudo cat /sys/kernel/debug/kunit/mpam_devices_test_suite/results


  # kselftest (MB emulation; requires ARM MPAM with disabled MB control)
  cd tools/testing/selftests/resctrl
  sudo ./resctrl_tests -t mb_emulation

This series is in https://github.com/fyu1/linux/  cpu_less.rfc.v2/
which is on top of [2].

Change Log:
RFC v2:
- Remove fix patches 1-2 which are implemented in [2]
- Remove the emulation patches 3-8 which are implemented in [2]
- Update emulated_by to *emulated_by in patch 11. Ben seems
  doesn't like to emulate MB by MB_NODE. If that's case, I can
  remove this patch. But for now, I keep this patch for further
  discussion.
- Add patch 13 to implemente legacy and native modes to emulate
  "mbm_L3_assignments" by "mbm_NODE_assignments" in patch 13.
- Add patch 9 for memory hotplug locking (Ben)
- Add patch 12 for memory hotplug notifier (Ben)

RFC v1:
https://lore.kernel.org/lkml/cover.1784217438.git.fenghuay@nvidia.com/

[1] [RFC v2] mpam,x86,fs/resctrl: Generic schema description Proof of Concept https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com/
[2] Reinette's resctrl control branch RFC v2: git://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git branch resctrl/controls_rfc_v2.4

Fenghua Yu (17):
  resctrl: De-hardcode L3 monitor infrastructure
  resctrl: Expose MBA MBM counter assignment sysfs
  resctrl: name node-scoped monitor domains mon_NODE_<id>
  resctrl: Add node-scope MBM total event
  resctrl: Make MBM paths resource-aware
  arm_mpam: Support memory-level MSCs and ABMC per class
  arm_mpam: Refine L3 topology and class selection
  arm_mpam: Include all MSC components during domain setup
  arm_mpam: Handle CPU-less numa nodes
  arm_mpam: Emulate MB control with node-scoped MB_NODE control
  resctrl: Add mbm_assign_scope_mode for native assignment file names
  Documentation: resctrl: document mbm_assign_scope_mode
  Documentation: arm64: mpam: document memory-level MB control and NUMA
    nodes
  Documentation: resctrl: document NODE-scoped MBA domains and mon_NODE
    monitoring
  Documentation: resctrl: document MB_NODE emulation example on ARM MPAM
  arm_mpam: Add KUnit test for CPU-less NUMA node affinity
  selftests/resctrl: Add MB emulation test for ARM MPAM

James Morse (2):
  fs/resctrl: Take memory hotplug lock whenever taking CPU hotplug lock
  arm_mpam: resctrl: Add NUMA node notifier for domain online/offline

 Documentation/arch/arm64/mpam.rst             | 105 ++-
 Documentation/filesystems/resctrl.rst         | 135 ++-
 drivers/resctrl/mpam_devices.c                |  59 +-
 drivers/resctrl/mpam_internal.h               |   8 +
 drivers/resctrl/mpam_resctrl.c                | 879 +++++++++++++++---
 drivers/resctrl/test_mpam_devices.c           |  67 ++
 fs/resctrl/ctrlmondata.c                      |   6 +-
 fs/resctrl/internal.h                         |  18 +-
 fs/resctrl/monitor.c                          | 355 +++++--
 fs/resctrl/pseudo_lock.c                      |   3 +
 fs/resctrl/rdtgroup.c                         | 157 +++-
 include/linux/memory.h                        |   1 +
 include/linux/resctrl.h                       |  36 +-
 include/linux/resctrl_types.h                 |  15 +-
 .../selftests/resctrl/mb_emulation_test.c     | 314 +++++++
 tools/testing/selftests/resctrl/resctrl.h     |   1 +
 .../testing/selftests/resctrl/resctrl_tests.c |   1 +
 17 files changed, 1827 insertions(+), 333 deletions(-)
 create mode 100644 tools/testing/selftests/resctrl/mb_emulation_test.c

-- 
2.53.0

