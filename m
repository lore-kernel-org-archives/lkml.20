Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259492;
	b=cNFxbB7GBrxBH2vSbbICvhgpDI40xr+/u6teKAPoxe68cmHZnNSfVRF2R713kex1q+kM
	 I0yJL8bH/TCVAOH3Ij6sATic9YHJM9HF6WTMKlFf4WY4bzW9b+PZZ7TqwwAKFbZ61NYqr
	 Qz2ii75wSZZ5xsZGss1XyFYlEXJCSMBcK3dVJxyeEiT9L8y9eZaSjnNumw1qIcYHlANtx
	 0XVCn66ZC8On0pOag0ERn0m+kBe1LqLKSX6XfZC2PXDAlkSxENW756M/jkhYQQmk2g6xN
	 yX7WNq1yrKsAyqHxgFyQnBp3TqfYa0hJK6IfMHyFv+7VINFdMLqaADC/ZDtck6/DAUg==
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
	bh=4cUxoRRUwoPZyrHiC1zocTx8jt2Y6chiyRuzeVy6EB8=;
	b=akKB21IBsJB0Q713O/mf/ueOtsxGRXiZ2kH67AWNMN5IhR+lvcHswbAO5fvQi6Bmb0/M
	 7c5ohdlEuOehwgzqR3X14vzpFi/V75/TFu1fyR/Fma51duWaXNqbjHoZzlpujtw/PjtWI
	 GcwNWY6dQ64heUi5AXBdZsyVpb7R6Os35GyH4LJHyJh4oozr7Hfq1UBZsbGMpNZVGY8TC
	 PyQNpNJNmXTzTeutCNL0O/huLogVXULXKInSSbF6odLjKid4+X+ZQLGgH2SnhgxDSo4Tg
	 u6ZGKwt4Tdpo4glBIvn08o03AfhiXlvt5XghFirnJX6ysn94YfY47wDCakApOSIE5VA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=o5csb2+x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.48
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011048.outbound.protection.outlook.com [52.101.52.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0526460A260B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:24:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0526460A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=o5csb2+x
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATYyFHiMOKcGlvTFVFV2mLRStb2UDbGQXKLnPH6Z9aSh+26f+IeRxYSbXyCx4Jp8+99d/RUj4fl3OsH1rjB/KntwpQMCc+OfFkE3VA6QA4oujjpDy98DtPvoBinWqpBeGwlZthPjTiPtrpAAAvPIj2ImoOUZzO8+9HnonkJlHIJWyatVOZKlyoiuicdnLJUhnjgx0ofFgAeHx8tAbzpG+yMWmrt0q7CD0WGryPi7fRIlNpYSafLJd2FKFtGtfXVXPXxXxt27FlODyT7CWDrzwvlLM8lYs3LNj5ys6Lmfe2fvpfatyH++mugygF85cxqRae/vyvRmuobXworSfAOqIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cUxoRRUwoPZyrHiC1zocTx8jt2Y6chiyRuzeVy6EB8=;
 b=kIJnWXHDk+cfZDToXahgR2fqq6mL8Gd1lCKKWq8jy8mTwLKY3zHpYvWKnzf3SvBZsnjkxDmzxiNP1mNoCIObiVbOm41znKtY+kMYhmlT3wMnLpkVMF4ujVjomOd+BcQwP0LDVrTuPoUVeFgvME6e9WKxpJdjg7OgJeJp0nkDi8X9RoKaLB+RkbTkkda4012eTq4dIax0EuuOvjHgTKXQTXdujuP2MmtdPpereiyfv22PLkuo3QYLpZqoZPIZkzNmEI44FjPCEJCdjwnNl8MSJImYfUuHU9NrlFEo+nwC1Pl4lN2biIWn8xEOTdmAtaV9HxK4IWAURG5guDLB4CN+pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cUxoRRUwoPZyrHiC1zocTx8jt2Y6chiyRuzeVy6EB8=;
 b=o5csb2+xEddCSnpQMV9lCIZO03vqNHEpyRFBuo2nRVcc8iXnjP2upQ7WxQ3ekfKWCwXJ49UNFJOQu82cOchwrKpRbXZ1iZsGhGSNp6F8/obXgJbrAWY4Z2Uh29A9IPUmxu+LZk89xa2XWXjvvIArAydmCloNrYIggUeIOxErYybyUddawYUv4hFR/ISaSrhKKQqIHKOJ5lltD8VHKK/FgvYGp5yf+qoABbb59s1iXqkU+jpWa1XYDXoi811dFWC3R2cUytmePtSh892dl17T8EHE3qACgY7HyURt2ncQCsVmdXEKgG8jwudnYNEDdA7fmh2XCzNE/AXX19qUADLXzA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by CH3PR12MB8970.namprd12.prod.outlook.com (2603:10b6:610:176::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 21:24:47 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:24:46 +0000
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
Subject: [PATCH RFC v3 11/15] arm_mpam: resctrl: Add NUMA node notifier for domain online/offline
Date: Mon,  9 Nov 2026 13:24:23 -0800
Message-ID: <20261109212427.1409204-12-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212427.1409204-1-fenghuay@nvidia.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::22) To DM4PR12MB5230.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|CH3PR12MB8970:EE_
X-MS-Office365-Filtering-Correlation-Id: e80c8fc9-aa7b-4730-802c-08df3ea7e10b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|921020|261009223027099003|261026140227099003|11063799006|5023799004|56012099006|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261026121527099003|261028144727099003|261102123227099003|18002099003|22082099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	PeMyOhjB5gb4+C+QR+LuDHowYnLWEWxs7oF4Q5eUx0obDLBUDFkL00XyGcBBCUkWbi7xsqawNXT1JLRBgB69oSN+PdPYZUwGlOi9+2PnkItNpyeqKjpDr+u7WXl9460fc8NzyZZuKhLUgnenMkQ0D+zMhn8NB/UNM7nRcsBOF8skzN9zxbbpeaSUbRcPaAaxCW2mLoFsTSmnf0EtrYiC/+Ez5g4HiSTqu4HgTWGQeE7Vjnip/6DavjnyYEpu+xGIJChpE2QYDO8Y79LtvjdV88kZgUnZNzFDcaNxsLeCEctZ0XBy6XeXK6+AQh7GhCY3v3EKwEh/9EtbOoUx3jBBjs4OinEqS2qXczJ5JQCdI5/PcKYaFDQVcgMwqLHFlaM+AUtUB2YAEMvDSS/zuQ21ST2bEAPh10wnT3GE0LSfel79R+awi3Pl3vV8PrPFJa21uwMj9+LPYLpyx8IjA5L2e1DcoTlTm1Q+Ky0h/HM2UsmXnfIVozryA1/DEzfzK29uVAzhyTojznTNF9tGcGazE71oeZX3OZpwEGe2eXjkfQVdm3IFnwiLCwATKhvfOki9QrngT8JyoxMpxfSGwEmR278d4CzFeZj2rTfCN3epvhyxRtwo91WcJRNePZoC8AA/RPDgKIYifuLeL3jNtpBRjKkwL+bSlq6wat/95oB0PiKKy+hlf7OUWpkARsoD25P+85OjZxWddvFdZMKRizo0YQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(921020)(261009223027099003)(261026140227099003)(11063799006)(5023799004)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261026121527099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IZsZUX8PxF9V91Ooq+ZByL08FC/BuiFBL/t1KVhSAaUOKEYKKqrxmQL1FzhS?=
 =?us-ascii?Q?oCZWR6lD9Gdqo1hhX4vETgOEFpK6k9VZtSa/dQYOBSkvVIEQyNQMPNrQisiH?=
 =?us-ascii?Q?aAHXycvLW/+g6VeTPOC7Wh2z+breghbjDcpGD3/ns8HZbKP2/p5g4jUk4xlG?=
 =?us-ascii?Q?NAd5kgoweqFh8LmpxSkG1FrVCdbnzciRKbYykcLZH+AKfTN8xXmauUhVJ7ya?=
 =?us-ascii?Q?qoI4w06vTGGnXWHfLY8Y9uZuVehJ3UPtE5G/m3eqD2cFVa0HbOgpFFCdf3b9?=
 =?us-ascii?Q?MHQsrTBfWX7dfOtTgQU9MVQjFE7jKVWxUf69yUAuWmSX8Ze+m4czI4vlDhRl?=
 =?us-ascii?Q?fCod5hN6TBkub+I0OQ8jA67OAa4JJOc7PPP6XIairX9nS+mLT4dHkwHn41P8?=
 =?us-ascii?Q?TLGcG61YijjdI/b1EcKcNUmQ0F6RTsYlRcFdh/uUhJBzF1xpLTr11YPyzAVt?=
 =?us-ascii?Q?5248VNUQqrJfLp/DAwQUndQjsW4aQuWkTJ6dcx+xhrAuOfZpgCDyQPzj4pQ5?=
 =?us-ascii?Q?rSkWAY0bcxLJbX/E8lI4c6QPxc4LM+Wc8H2VRDlLM6UXxZQ3FGjQWrSFizhT?=
 =?us-ascii?Q?gOANO3plRqpGzH7Zel+d6e45UoUujyNOokvIRYiBNbvtpBss0/K97oShDl5R?=
 =?us-ascii?Q?0OXde5rIPg84yK6t6Hbp9rd3dUyFMgyNzHMrWBf/R1O9fN8Ec1u/9e1S4XS+?=
 =?us-ascii?Q?rET+0m0Kxk5IvtvLRDLJcua6ryAMX/dO45tZA/1dtIVn7n0XuHtRBT+Lwu01?=
 =?us-ascii?Q?sxRk5u3s6xknrAzdDPVKXQuogDmUvZEE2Xm9TRemzll6VHf5ZanmzNs+f9qx?=
 =?us-ascii?Q?ZZLSBP6KxaUDSB7fFNy6ieA6aiQfkQi+DEiUxE+8CGn1PGovhF6c4QOQWUtE?=
 =?us-ascii?Q?mmH/Poiv4d9vHB4X8kWh46PSO5A08BT2woPs0k4iSVrWkyNycs89pEj7hWMG?=
 =?us-ascii?Q?QiLW/FSIHvf138YM/0L+ZZoat8ecb6KrS39krbdSk6KZ42u2xhlOoYxGE37F?=
 =?us-ascii?Q?JBlwfRZhQe1hZmt5gXgqbJs5Wo/3W6eMDj6Z+zL4zAv1br3sTa4iI2kxzUz+?=
 =?us-ascii?Q?+ByzSp8jM8AOz6aIjrE/dsR5ETKnL6v7El6hiaEyHrIiWV18TNnxedm5y+Jl?=
 =?us-ascii?Q?/VChxIfkT7hM15V6VgUVjFxytugMxcYDmR3d6yeAyh8C7y4YuzFkenEaQmLR?=
 =?us-ascii?Q?SQXbLSrR11KtaO4tGmdR2BrAi1jzrefBxHtYm5TNvx8HJF7fWTcR6sFgN+p5?=
 =?us-ascii?Q?Fq/kR3Xgpg2RWCtym24iI/RuTykf/tRL1lkDPPx9dBAUTQ7pSa0rF6CDdZPT?=
 =?us-ascii?Q?Nyf+mlN4lQcuXylRjtjBgu+R9Bo9YJswpUL/2nzuCcW7XhoJRpS43sSnxIf+?=
 =?us-ascii?Q?+Fnzw5Otp6t12r6qYb8+V1a7mRrnPlm8y+065JvF9hHRAuI7UsjGCDSdkJ8w?=
 =?us-ascii?Q?RjK5ohSyblQQ1F7JI5dqhdPM77S71/HHjDD/dypiWVLNcvgJ8Yv0yftGlmef?=
 =?us-ascii?Q?OWir6Q1WLGw41WHSkxt+TGMNjqqft6f0ype0XM4PRn8PQUCKYI97P5jLziZD?=
 =?us-ascii?Q?sF0/z7OR1RFQurN75PHjeNOYNRiHSN7gg9CslQe6ikJg5mtLjc5AGdYHPWbo?=
 =?us-ascii?Q?5jCDRpv6OWtd2QaAevLVyMPOqM93dZ9HQZIQYrShVJPVDZym/YWXZSsUyF6m?=
 =?us-ascii?Q?FCfB+pz+UJNl7VBpJd4vj5Unm/P8VgC4KESJJE5wS9iTXsTfBEdJB5tl/Le2?=
 =?us-ascii?Q?fIDaRSk9/A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e80c8fc9-aa7b-4730-802c-08df3ea7e10b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:24:46.7346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3Yl6C7PUxWbYKkZBL2RvUFeXOQoiF8fMi8yu1chJZ2T/RdvrDyD9QFzeWeuAI0p7Y1AjBq5kQjSwYg49UAspg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8970

From: James Morse <james.morse@arm.com>

To expose resctrl resources that contain CPU-less NUMA domains, resctrl
needs to be told when a CPU-less NUMA domain comes online. This can't
be done with the cpuhp callbacks.

Add a memory hotplug notifier, and use this to create and destroy
resctrl domains.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_resctrl.c | 321 ++++++++++++++++++++++++++++++++-
 include/linux/memory.h         |   1 +
 2 files changed, 315 insertions(+), 7 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index ac0c488abe12..8a169676c4ac 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -11,6 +11,8 @@
 #include <linux/limits.h>
 #include <linux/list.h>
 #include <linux/math.h>
+#include <linux/memory.h>
+#include <linux/node.h>
 #include <linux/printk.h>
 #include <linux/rculist.h>
 #include <linux/resctrl.h>
@@ -1681,16 +1683,25 @@ void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
 	mpam_reset_class_locked(res->class);
 }
 
+static void mpam_resctrl_domain_hdr_init_mask(const struct cpumask *cpus,
+					      int id_cpu,
+					      struct mpam_component *comp,
+					      enum resctrl_res_level rid,
+					      struct rdt_domain_hdr *hdr)
+{
+	INIT_LIST_HEAD(&hdr->list);
+	hdr->id = mpam_resctrl_pick_domain_id(id_cpu, comp);
+	hdr->rid = rid;
+	cpumask_copy(&hdr->cpu_mask, cpus);
+}
+
 static void mpam_resctrl_domain_hdr_init(int cpu, struct mpam_component *comp,
 					 enum resctrl_res_level rid,
 					 struct rdt_domain_hdr *hdr)
 {
 	lockdep_assert_cpus_held();
 
-	INIT_LIST_HEAD(&hdr->list);
-	hdr->id = mpam_resctrl_pick_domain_id(cpu, comp);
-	hdr->rid = rid;
-	cpumask_set_cpu(cpu, &hdr->cpu_mask);
+	mpam_resctrl_domain_hdr_init_mask(cpumask_of(cpu), cpu, comp, rid, hdr);
 }
 
 static void mpam_resctrl_online_domain_hdr(unsigned int cpu,
@@ -1711,12 +1722,12 @@ static void mpam_resctrl_online_domain_hdr(unsigned int cpu,
  * indicating the parent structure can be freed.
  * If there are other CPUs in the domain, returns false.
  */
-static bool mpam_resctrl_offline_domain_hdr(unsigned int cpu,
-					    struct rdt_domain_hdr *hdr)
+static bool mpam_resctrl_offline_domain_hdr_mask(const struct cpumask *cpus,
+						 struct rdt_domain_hdr *hdr)
 {
 	lockdep_assert_held(&domain_list_lock);
 
-	cpumask_clear_cpu(cpu, &hdr->cpu_mask);
+	cpumask_andnot(&hdr->cpu_mask, &hdr->cpu_mask, cpus);
 	if (cpumask_empty(&hdr->cpu_mask)) {
 		list_del_rcu(&hdr->list);
 		synchronize_rcu();
@@ -1726,6 +1737,12 @@ static bool mpam_resctrl_offline_domain_hdr(unsigned int cpu,
 	return false;
 }
 
+static bool mpam_resctrl_offline_domain_hdr(unsigned int cpu,
+					    struct rdt_domain_hdr *hdr)
+{
+	return mpam_resctrl_offline_domain_hdr_mask(cpumask_of(cpu), hdr);
+}
+
 static void mpam_resctrl_domain_insert(struct list_head *list,
 				       struct rdt_domain_hdr *new)
 {
@@ -1741,6 +1758,23 @@ static void mpam_resctrl_domain_insert(struct list_head *list,
 	list_add_tail_rcu(&new->list, pos);
 }
 
+static struct mpam_component *find_component_nid(struct mpam_class *class, int nid)
+{
+	struct mpam_component *comp;
+
+	if (!class || class->type != MPAM_CLASS_MEMORY)
+		return NULL;
+
+	guard(srcu)(&mpam_srcu);
+	list_for_each_entry_srcu(comp, &class->components, class_list,
+				 srcu_read_lock_held(&mpam_srcu)) {
+		if (comp->comp_id == nid)
+			return comp;
+	}
+
+	return NULL;
+}
+
 static struct mpam_component *find_component(struct mpam_class *class, int cpu)
 {
 	struct mpam_component *comp;
@@ -1925,6 +1959,275 @@ mpam_resctrl_get_ctrl_domain_from_cpu(int cpu, struct mpam_resctrl_res *res,
 	return NULL;
 }
 
+static bool mpam_mba_uses_memory_nid(void)
+{
+	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
+
+	return res->class && res->class->type == MPAM_CLASS_MEMORY;
+}
+
+static struct mpam_resctrl_dom *
+mpam_get_ctrl_domain_from_nid(int nid, struct mpam_resctrl_res *res,
+			      struct resctrl_ctrl *ctrl)
+{
+	struct mpam_resctrl_dom *dom;
+
+	list_for_each_entry(dom, &ctrl->domains, resctrl_ctrl_dom.hdr.list) {
+		if (!dom->ctrl_comp || !dom->ctrl_comp->class)
+			continue;
+		if (dom->ctrl_comp->class->type != MPAM_CLASS_MEMORY)
+			continue;
+		if (dom->ctrl_comp->comp_id == nid)
+			return dom;
+	}
+
+	return NULL;
+}
+
+static struct mpam_resctrl_dom *
+mpam_get_mon_domain_from_nid(int nid, struct mpam_resctrl_res *res)
+{
+	struct mpam_resctrl_dom *dom;
+	struct rdt_resource *r = &res->resctrl_res;
+
+	if (!r->mon_capable)
+		return NULL;
+
+	list_for_each_entry(dom, &r->mon_domains, resctrl_mon_dom.hdr.list) {
+		if (!dom->ctrl_comp || !dom->ctrl_comp->class)
+			continue;
+		if (dom->ctrl_comp->class->type != MPAM_CLASS_MEMORY)
+			continue;
+		if (dom->ctrl_comp->comp_id == nid)
+			return dom;
+	}
+
+	return NULL;
+}
+
+static struct mpam_resctrl_dom *
+mpam_resctrl_alloc_ctrl_domain_nid(int nid, struct mpam_resctrl_res *res,
+				   struct resctrl_ctrl *ctrl,
+				   struct mpam_component *comp)
+{
+	int err;
+	struct mpam_resctrl_dom *dom;
+	struct rdt_ctrl_domain *ctrl_d;
+	struct rdt_resource *r = &res->resctrl_res;
+	int id_cpu = cpumask_first(cpu_possible_mask);
+
+	if (id_cpu >= nr_cpu_ids)
+		id_cpu = 0;
+
+	lockdep_assert_held(&domain_list_lock);
+
+	if (!r->alloc_capable)
+		return ERR_PTR(-EINVAL);
+
+	if (WARN_ON_ONCE(!comp))
+		return ERR_PTR(-EINVAL);
+
+	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, nid);
+	if (!dom)
+		return ERR_PTR(-ENOMEM);
+
+	dom->ctrl_comp = comp;
+
+	ctrl_d = &dom->resctrl_ctrl_dom;
+	mpam_resctrl_domain_hdr_init_mask(cpu_possible_mask, id_cpu, comp,
+					  r->rid, &ctrl_d->hdr);
+	ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
+	err = resctrl_online_ctrl_domain(r, ctrl, ctrl_d);
+	if (err)
+		goto free_domain;
+
+	mpam_resctrl_domain_insert(&ctrl->domains, &ctrl_d->hdr);
+
+	return dom;
+
+free_domain:
+	kfree(dom);
+	return ERR_PTR(err);
+}
+
+static struct mpam_resctrl_dom *
+mpam_resctrl_alloc_mon_domain_nid(int nid, struct mpam_resctrl_res *res,
+				  struct mpam_component *comp)
+{
+	int err;
+	struct mpam_resctrl_dom *dom;
+	struct rdt_l3_mon_domain *mon_d;
+	struct rdt_resource *r = &res->resctrl_res;
+	struct mpam_component *any_mon_comp = NULL;
+	struct mpam_resctrl_mon *mon;
+	enum resctrl_event_id eventid;
+	int id_cpu = cpumask_first(cpu_possible_mask);
+
+	if (id_cpu >= nr_cpu_ids)
+		id_cpu = 0;
+
+	lockdep_assert_held(&domain_list_lock);
+
+	if (!r->mon_capable)
+		return ERR_PTR(-EINVAL);
+
+	if (WARN_ON_ONCE(!comp))
+		return ERR_PTR(-EINVAL);
+
+	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, nid);
+	if (!dom)
+		return ERR_PTR(-ENOMEM);
+
+	dom->ctrl_comp = comp;
+
+	for_each_mpam_resctrl_mon(mon, eventid) {
+		struct mpam_component *mon_comp;
+
+		if (!mon->class)
+			continue;
+
+		mon_comp = find_component_nid(mon->class, nid);
+		dom->mon_comp[eventid] = mon_comp;
+		if (mon_comp)
+			any_mon_comp = mon_comp;
+	}
+	if (!any_mon_comp) {
+		err = -EFAULT;
+		goto free_domain;
+	}
+
+	mon_d = &dom->resctrl_mon_dom;
+	mpam_resctrl_domain_hdr_init_mask(cpu_possible_mask, id_cpu, any_mon_comp,
+					  r->rid, &mon_d->hdr);
+	mon_d->hdr.type = RESCTRL_MON_DOMAIN;
+	err = resctrl_online_mon_domain(r, &mon_d->hdr);
+	if (err)
+		goto free_domain;
+
+	mpam_resctrl_domain_insert(&r->mon_domains, &mon_d->hdr);
+
+	return dom;
+
+free_domain:
+	kfree(dom);
+	return ERR_PTR(err);
+}
+
+static int mpam_resctrl_online_node(unsigned int nid)
+{
+	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
+	struct rdt_resource *r = &res->resctrl_res;
+	struct mpam_component *comp;
+	struct resctrl_ctrl *ctrl;
+	struct mpam_resctrl_dom *dom;
+
+	if (!res->class)
+		return 0;
+
+	comp = find_component_nid(res->class, nid);
+	if (!comp)
+		return 0;
+
+	guard(mutex)(&domain_list_lock);
+
+	if (r->alloc_capable) {
+		for_each_resource_ctrl(ctrl, r) {
+			dom = mpam_get_ctrl_domain_from_nid(nid, res, ctrl);
+			if (!dom) {
+				dom = mpam_resctrl_alloc_ctrl_domain_nid(nid, res,
+									 ctrl, comp);
+				if (IS_ERR(dom))
+					return PTR_ERR(dom);
+			}
+		}
+	}
+
+	if (r->mon_capable) {
+		dom = mpam_get_mon_domain_from_nid(nid, res);
+		if (!dom) {
+			dom = mpam_resctrl_alloc_mon_domain_nid(nid, res, comp);
+			if (IS_ERR(dom))
+				return PTR_ERR(dom);
+		}
+	}
+
+	return 0;
+}
+
+static int mpam_resctrl_offline_node(unsigned int nid)
+{
+	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
+	struct rdt_resource *r = &res->resctrl_res;
+	struct resctrl_ctrl *ctrl;
+	struct mpam_resctrl_dom *dom;
+	struct rdt_ctrl_domain *ctrl_d;
+	struct rdt_l3_mon_domain *mon_d;
+
+	if (!res->class)
+		return 0;
+
+	if (!find_component_nid(res->class, nid))
+		return 0;
+
+	guard(mutex)(&domain_list_lock);
+
+	if (r->alloc_capable) {
+		for_each_resource_ctrl(ctrl, r) {
+			dom = mpam_get_ctrl_domain_from_nid(nid, res, ctrl);
+			if (WARN_ON_ONCE(!dom))
+				continue;
+			ctrl_d = &dom->resctrl_ctrl_dom;
+			if (mpam_resctrl_offline_domain_hdr_mask(cpu_possible_mask,
+								 &ctrl_d->hdr)) {
+				resctrl_offline_ctrl_domain(r, ctrl, ctrl_d);
+				kfree(dom);
+			}
+		}
+	}
+
+	if (r->mon_capable) {
+		dom = mpam_get_mon_domain_from_nid(nid, res);
+		if (WARN_ON_ONCE(!dom))
+			return 0;
+		mon_d = &dom->resctrl_mon_dom;
+		if (mpam_resctrl_offline_domain_hdr_mask(cpu_possible_mask, &mon_d->hdr)) {
+			resctrl_offline_mon_domain(r, &mon_d->hdr);
+			kfree(dom);
+		}
+	}
+
+	return 0;
+}
+
+static int mpam_resctrl_node_notifier(struct notifier_block *self,
+				      unsigned long action, void *arg)
+{
+	struct node_notify *nn = arg;
+
+	if (nn->nid < 0 || !mpam_mba_uses_memory_nid())
+		return NOTIFY_OK;
+
+	/*
+	 * Ignore nids that have CPUs. Resctrl needs to see the cpu offline
+	 * call for each CPU to update the CPUs in control groups.
+	 */
+	if (!cpumask_empty(cpumask_of_node(nn->nid)))
+		return NOTIFY_OK;
+
+	switch (action) {
+	case NODE_ADDED_FIRST_MEMORY:
+		mpam_resctrl_online_node(nn->nid);
+		break;
+	case NODE_REMOVED_LAST_MEMORY:
+		mpam_resctrl_offline_node(nn->nid);
+		break;
+	default:
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
 int mpam_resctrl_online_cpu(unsigned int cpu)
 {
 	struct mpam_resctrl_res *res;
@@ -2088,6 +2391,10 @@ int mpam_resctrl_setup(void)
 		}
 	}
 
+	if (mpam_mba_uses_memory_nid())
+		hotplug_node_notifier(mpam_resctrl_node_notifier,
+				      RESCTRL_CALLBACK_PRI);
+
 	cpus_read_unlock();
 
 	if (!resctrl_arch_alloc_capable() && !resctrl_arch_mon_capable()) {
diff --git a/include/linux/memory.h b/include/linux/memory.h
index 463dc02f6cff..1497d4be38ee 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -120,6 +120,7 @@ struct mem_section;
 #define CPUSET_CALLBACK_PRI	10
 #define MEMTIER_HOTPLUG_PRI	100
 #define KSM_CALLBACK_PRI	100
+#define RESCTRL_CALLBACK_PRI	100
 
 #ifndef CONFIG_MEMORY_HOTPLUG
 static inline void memory_dev_init(void)
-- 
2.53.0

