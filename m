Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601035;
	b=EDHpF0wmZtrCKR3PGqiXc2YeQZCT+m3ahIKnJ/l8cxDiuZ6tf5bbaTuHV5bgcyxhXv4G
	 8pGDFjH+t0nXcKWsu0p2MU3Y3TCwc8EHuU/WBqUr7z09tRJX2BcG9gVvmEbEcIUAwpRv1
	 lkiSUfDCaPO4Z5p5nsibAnQ0bUYPFGRfpLJ5Xb1te7+O5e8nqzSFaxuOB0YADu/hmhcrt
	 FauMIZS6BuO/LYUSY1MeER1qnAAeJOEV/P7UwmiyOJzWHccuCznRxDUGSiqzITHLkczkZ
	 2gMiF2IXjOeqKzcAZW2cnuQrxrjgP/yyxwJEtlKfSYKpUkQnDIpEwNCM+Vg4114QUCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601035;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:X-Mailer:Message-ID:In-Reply-To:References:Content-Type:
	 X-MS-Reactions:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=G6AjPPaW1Uh1b+/RaVrkgkTQoJfdkf9vgkA2hrqyGCk=;
	b=Zd4TSqfskJ/BD7vaLNk7cUXPMt0TUW3ZjFoJ7iJoAxsRsxW52TDdMGM1aPwA1RE7Xjr8
	 UhsCNfcW2n3XCOK2BxmaxwrQY0pX6bUgH3U7q3wLpzuOGqnn5Z5pzvqyz+KguQKllQRm6
	 kOVVwoMBcDQUIUMxnkcOQFSuduU50eq1y7mI9ioLp1pq3VNARPhXgKavATvJy1rE53u16
	 QqIkUZ1GnekATDz4tUDqW4pFqm7XRsMkk6QdVoHtF9ob9X2AOwsbM59suzQj4gXmsVb8g
	 CZjU62AcsYBNgDCUSsvMFVmm25MESspexpIWYJZGIDzI+Iyd8nzjxaHgjXmlBmBkxhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AowXNYq4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.52
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012052.outbound.protection.outlook.com [40.107.209.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34796606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34796606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AowXNYq4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRmMWkfGk0PeKI6/z/wHTwaWXMmw4pCwn6Fe3TC+M9KqGc87Vp6+GdEIEkcAIvV7EyHv66FLKDnn1jZJhg07ErYL0ARqrcrIQz2/M+Zh1aM88wtpNqkTRfTRNFeTSleo/1QooJ60NFmjHvNdVC7yYaD92x5yTKHbGjFsAwXPBeK1eskPclZMFFdMzNjZsF07Tqfc2FwyUy6bqXJk2tjZcwtXaa+jRbR7QRTq9xySWcgjgDDJZuiYWbEdNhE8eIX99KUjEpI1d5j6A19tPtJG8L+usMoWP9izePiO5UkWHkyXUrR5Tqig8Z2hEPNggpRh+5J/ttsazv3zGRPEpwlL6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6AjPPaW1Uh1b+/RaVrkgkTQoJfdkf9vgkA2hrqyGCk=;
 b=R4a4fSlMx9m2vq09z/+CtQMso6p8b0x2OG/wJMaZrCMcKQOrOXvvlEuLoILqOoMpTk60KEAKneQ5JJvxIFvjAn0MYQtk+D53VPNAaqtb9U3qUh9USOuSfKVmW91uxar04sVoZYJuaMJNlFFv3jSmL2U9lwM1VQaxLmpZBJaXz1Q1QOHWLaouTkpxAmJIdBKVGxUOwBdcWTqDcp1iWJkMRhYhEZkY7l2stjWF8LeAiE+Dst751W2EFcPuW76jombrc9wMxi/m5CeMaghAHPX6aQaKMrh9MEnfzm4X+hJuTKFJQBddGied+JsY4/HukAMzf4SflTLJwZFbB2lj1EgchA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6AjPPaW1Uh1b+/RaVrkgkTQoJfdkf9vgkA2hrqyGCk=;
 b=AowXNYq4dd2pSujVFrGRVlPLbREZMdW5eYrShZc4+BdQerfGe8lrnKOyQ6cBS3gPHxFPmtLKE8zpLSE+P4zBTC7GUUTToVJlFOIIBbWeefCIhGhFy5UqarOdcSjyzL6cODErgiM9h1wecBzWwvS6fWao34paJA3S1zXsonORCOnn6qV8/mesyS4hl78JNemOfugLXMTezexKiwidTt90AyyIb56A1uxSry9Sc7Z7GCbP8zyS+CFrb9KhBXC8ulDs5/DReJBvvu4FuvVMDCvPQ8tCaCRgmBMfWuFWla2AHn1N/pB81QPaMPMZqPTVBGKPmLHcpUwPYPaKIlyvs5C7kg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SA1PR12MB7410.namprd12.prod.outlook.com (2603:10b6:806:2b4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Fri, 13 Nov
 2026 20:16:36 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0615.007; Fri, 13 Nov 2026
 20:16:36 +0000
From: Zi Yan <ziy@nvidia.com>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, joshua.hahnjy@gmail.com,
 rakie.kim@sk.com, ying.huang@linux.alibaba.com
Subject: Re: [PATCH] mm/mempolicy: ignore a bind policy whose nodes have no
 memory
Date: Fri, 13 Nov 2026 15:16:34 -0500
X-Mailer: MailMate (3.0r7038)
Message-ID: <3A1D94AE-CAAA-4DB9-86BD-CF11012B276A@nvidia.com>
In-Reply-To: <179460086396.482102.9206100238305098014.b4-reply@b4>
References: <20261113192642.2618878-1-gourry@gourry.net>
 <D1684A69-FC68-45E4-8349-9D5E5A327053@nvidia.com>
 <179460086396.482102.9206100238305098014.b4-reply@b4>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: BN9PR03CA0772.namprd03.prod.outlook.com
 (2603:10b6:408:13a::27) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SA1PR12MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: e567ee50-32da-49d6-bb6e-08df41c30472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|10067099003|261022105027099003|261022115727099003|261026140227099003|261021121427099003|261028144727099003|261022075727099003|261026121527099003|261102123227099003|56012099006|11063799006|5023799004|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Z3rzyiXhc2l9BsjS4Udv1E32OLgW9dhdqJqZKgoAl66RMDmn0GSk62v+y9xkpvTAJYtaNQt2rxBqem6LMNQMWuOBD0h7pBDMLZWo37GviM1nL3LAmVrYOkvkXW+Iq4q3EOJ9g6Lm1+5rfe3gNdWy59in9CfMmHQ6m9UDSqVX7Ed2Fis7y2SINFhzPJkxqNF8YbgzKVkw1cp0XPGfI2EF2rnjlwo+unX3rhBw+b/fmLRuq9d5MGFc14k57hLp7dM58EgcuvsYqtTXKVTOJkvSIjHeEjsZhSKGavZm84arBT7QFHHFaJpSYngEkiWKniaPUb5qcuajWAEKKWgbUNtjtBVEYQnzpYW2WmYEIBXSXV9X4rk9Bj9gj9Hv+1Tow/3leMeBxWSbLmtTqcg0umAQyWMe+0hUrEh30tGFYAwzeFCxML7A7uF8ja07jKLwPLQNcA2HZspA5LA0bCMIjKL0/ypYK0fZKunmbqHxiVHlTA+6FOh2NbWELyF8iNWFSfoU0QZwMZGhoJv7g679lVUNkv9qveDj5dfWWqIMTGxGoZ/ZTz3yuzBYSL4t1XKaxU3TDIVxxTs+M4oaktG9pZhbyzYSPjDR6DOXCjoklDJdXpGmHts3wnJSI8izIW6mRLtAERU+qMsvJHCFVLl91GaVfFlZaj6x2Rxw/yiGo3dwVPQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(10067099003)(261022105027099003)(261022115727099003)(261026140227099003)(261021121427099003)(261028144727099003)(261022075727099003)(261026121527099003)(261102123227099003)(56012099006)(11063799006)(5023799004)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?di+miQg/toAlOwaoeQZjKwZrHHQnNsNmozMN8IBliX2m9a4ituI97D65gt4N?=
 =?us-ascii?Q?eODrzg/tD/8UIcwiM67lsTpeWxtFC2tB/z5eQDv5ZrwTPtgx9n103BMYqIHT?=
 =?us-ascii?Q?b9mrplwQSUe/Iu2K+W/Ut5C3p4dwK1aDoLM4DeZS0qjY4oGgrNbh0pJbCM3x?=
 =?us-ascii?Q?/1ya76sZCHNS/AoghDBvhmSijFH044B20ujkWhb8kFKqNMpX07+CS+mwwdly?=
 =?us-ascii?Q?9e7efuJ9/ZRTShAuZ1CkxgShe3PawZppvnEFpSBWiRRfMVn//3Nt+jxb0tQJ?=
 =?us-ascii?Q?A33yA/Fpcv6DwhcVH0XZKBn+CwjDkqTDbuknpy5aY3L7957zFUhwylOWhhbT?=
 =?us-ascii?Q?oXpHseHnVG1Vi/Owf23ZOXtwueruFMqvS6dfMvkaJbVb/Vd1EekNNqPKupLX?=
 =?us-ascii?Q?hEifAOCiOp+pSmD9gd7gkijI/iTmZEj/OGSzRgrahUTBeFRUhZzumbeSjm8F?=
 =?us-ascii?Q?W6D/uaZOSxBvReEA+SmZz4Y4Y/0wupLQn2M3cTyEVDfQk0rJSzypL0tMISUV?=
 =?us-ascii?Q?P4F6q1pwAC//K06d8AjxVuO9/sEZLTrYKzCssN4hdYAkr/23MGBJaiVGLxGN?=
 =?us-ascii?Q?wBaYT15QplzUU7Fq0W3oAPnEUVxW9as4MxWT3UVGormWqlkYDADqrPyEtPsh?=
 =?us-ascii?Q?YuhBVH0ayKJonJBm1rdXvPR5QdwHoqfX9Mv7aQjpCu/2Dst0utwoeH8rXktL?=
 =?us-ascii?Q?6NhYv8817xoe9YQVPo3MZoVNVrfjKwBRBWE9bigo9UOdKHNd7yNeLro+iejv?=
 =?us-ascii?Q?FegZPo7hBwTvUC2ucDDGnOJA6yipMCTvxERdcOV6wH9zfmsmmOojuqlc7Kl6?=
 =?us-ascii?Q?4HwBzBPojbkjroFwjv6oxedH+mqKaVBaFa1e3nZxjG2SY6Zu//1R55rY0iPZ?=
 =?us-ascii?Q?uCbSlJIiefO9i3q0YtFbJJNgYD0gaR2en+fRBh9UvEso3dWyQFzw4iJ8wBDE?=
 =?us-ascii?Q?7a5AWLN982m1XnYEzCgQWDMzYZPMvSjPottMm9pZ9Bgij9+g7dzTZqlCn9aZ?=
 =?us-ascii?Q?ajlYH/vBy/H6ojjNeHkVZEoNrl1M5Qhd5ssalSZijC1olxKq+U0etSlsmM8l?=
 =?us-ascii?Q?jadxBzqPeKYANnX+i5U8eoOmbR5hIbHnyuvv0JCR27u2VXMWsI7Y+hhhx43R?=
 =?us-ascii?Q?QTluhMflD1z28g4llxYsFHHS5ZxEMe2PepFyTtV8k5WFH2vXm9K+n1J1DJ4k?=
 =?us-ascii?Q?zJI7iuvKNy9r2LZeXLA9YgCKkcRTRcyHMPveuPAblZC2qbSZxeeDyL0GXg8/?=
 =?us-ascii?Q?v4L1dQGsWWQRp9bvRXBUeXzQgRKrc6VIUL1boRWSa43C96W0sKz1zq2C3OTl?=
 =?us-ascii?Q?gcX3AE2ppErxy6BvCO9u9Y0KQq8tPXNEFlhwIUbYOUGMxkGK7hUNkPE0e2LC?=
 =?us-ascii?Q?6QyRkQC+8xz1CV7gZKz4kZgUarrerOd4MnTYNxWuP8yjeVVtlUoPoQhW8ipF?=
 =?us-ascii?Q?06GhTXnLAKWQ3/ofZMl4UH50dD1buHjDLm+JgZx2ESFzY2aueGTQIfdLRJuV?=
 =?us-ascii?Q?TcvRna1bJp8l6WgWtWIN9klLNZhs9StAhhsWNK9jZLWqvDHPB1a3jPJNgotz?=
 =?us-ascii?Q?+XNzJGHJlrSTQovBHuZUzi6gQ6uGfuljsBWojFVKyxsA+kCsMGu1Re4Nt/B9?=
 =?us-ascii?Q?CTywm5V7h7YMVm7F8wKmg7u3a3t3A2BviLOt306B4NKg9tpe92HP0G3obSKY?=
 =?us-ascii?Q?fgTyIrdJ31IjkaKH7CEqYro2NgdXmO0THjKlFQ+2ZyIvO+Fm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e567ee50-32da-49d6-bb6e-08df41c30472
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 20:16:36.1016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlLy+TNbAdoNNQc05ZAJErlhAInXI5QUqZDMxqVyCPah2VAB+OU4P6xQjXm+9+VY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7410

On 13 Nov 2026, at 15:14, Gregory Price (Meta) wrote:

> On 2026-11-13 14:47 -0500, Zi Yan wrote:
>> On 13 Nov 2026, at 14:26, Gregory Price (Meta) wrote:
>>
>>> apply_policy_zone() assumes that policy->nodes intersects N_MEMORY, so
>>> it reads a bind policy with no N_HIGH_MEMORY node as movable-only.
>>>
>>> On systems with CONFIG_CPUSETS=n, nothing rebinds policies when memory
>>> is removed, so offlining all memory on the nodes a bind policy names
>>> leaves it with none. The policy is then treated as movable-only, and
>>> movable allocations are restricted to nodes without memory.
>>>
>>> This results in allocations failures, a VM_FAULT_OOM leak, and then
>>> an infinitely retrying fault that hangs the process.
>>>
>>>   page allocation failure: order:0, mode:0x140dca ... nodemask=2
>>>   Huh VM_FAULT_OOM leaked out to the #PF handler. Retrying PF
>>>
>>> Ignore a bind policy whose nodes have no memory. policy_nodemask()
>>> already ignores a bind policy that does not intersect the cpuset.
>>> This covers hugetlb's policy_mbind_nodemask() as well.
>>>
>>> If the nodes regain memory, the policy applies again.
>>>
>>> CPUSETS=n with HOTREMOVE=y is unlikely a common configuration, so this
>>> isn't marked for stable.
>>
>> Also no Fixes?
>>
>
> It wasn't quite obvious what to tag exactly.  Since I don't think it's
> worth backporting, wasn't sure I should bother spending time on the
> Fixes tag.

I can imagine that. We probably can blame mbind or hotremove, but the
commit might be too old to be meaningful. It is all good now.

Best Regards,
Yan, Zi
