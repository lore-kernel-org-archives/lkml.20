Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011041.outbound.protection.outlook.com [40.93.194.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0B3330B01
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044003; cv=fail; b=PTAegcxEC98/ekJW4nXqfMLrr/26XlVKBOjNX90562WeJ1/hFKIpbczXIQqsI02QZVLG2Y9sNzwXpWBAy4YilSAiGcxE/QBasRhpv1kqljA4Ef79N2U2zUsKhdQ3LK9S3WToOK8CBF2vmvthbbNFz0Qp3b0YThbq/6cR7ClE+TU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044003; c=relaxed/simple;
	bh=c+kwy5SeTnyMg/5fNPncZxRWEb/+lpyCb5KqosW0X/Q=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=Y/zBSru5YCdNk+AXPmrLh8xr9IXjGOfTjFiXiUeSZZdTsTYMjibLTEoe8D0KKvgw5j63Ppo/AJsO2A4yt/eCrFVvyG6RbUPglKGWyFNknSXxIA+V8N5L/BoZjZvMZt8R4VmSEGb2lIsxrMkvGgR5MMtptcP5/Dk/Cj8FbC6CV6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ge6tW47h; arc=fail smtp.client-ip=40.93.194.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ge6tW47h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTLtRm17MmkyAaS7h1mnx6yHNOIZT1ZQ9aPQvsat2nWNY/HTbX4nvG8/VRXUZtn1OGMxqlXrU9JGyUIZjAgYRNUf0TlBYfCYtVQfMamp+RP9HQa5dc9NTruYD1IaTwe6qt30fkK8ZKk5TAzZ7dNRHM2tUXCohQ1BJbhr5lKaFJyNK5pOSEBJU7s7uxDm53YMh5axXEwyJ+pNwGmzDOgqNBOFvGAYUA26Ss5Dh4OLTT8rhLs5tW7VTS7BiaLcn1bUPLs82Kf7L8/mm6l8lsRo8RSsmFoos9+Qq7u69W/IQg1tqii20pY4W9ISd6B7UQ29hhOgNdXFxyl38ZYS98vYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJ/vdy9uGmQLcel9fYnGf8Ws3cx6xUjgkhPvSdYb01Q=;
 b=nprUf1Nrl08tVE7ay40fitvov6aB4AXpeRWLqIOndDZ0HzffTHuAEcAmsp9Q16xGhR0B01BuBMBS4PbkAiZ/L/ZC5Ds0jrIWsE6YSEsXfuN/RSGZqqQwYfvUyRwG97+DMzB/bOQYeCjP/azW5LZIwZgPa6kociMpvy2mC0eA2DJYayhUuUvc/CyMyb/lghrcmwn5zFRlTei0Qs1E+jrj7DmLc+ctmQ+GTlqchK26cGm5QvWBjNCOPze94aqzK9sSRqjvJXKkPR607BGRIabB8aBWd4cMAq4evEyzdtrJK2wc55AWggvs19B3NpmtHKopk1QD0hntwuBxYSwmh/VRPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJ/vdy9uGmQLcel9fYnGf8Ws3cx6xUjgkhPvSdYb01Q=;
 b=Ge6tW47hJhx6uODA8aasku963FE99MCfIOpkA+op2iO517fKucHi8PDm96jWZYaE9havl++EaxL+QtDH1WCPnORwP9cin2Hh1EBJIUDjjkKW+95PA8L220LLm7cN8vJQ5wCD/Tu5RrazB0+CqUl9w+gO24YVbF5qGl7n+6g/QTzZK/8KeMOTL7a+Kx3RpxIAhHr5/3mS7HRMVDkaNpDwisb07l7ErR2WdfUtLP8k09ksD7tAoVEbEoyurxcJqYRi1h1YnKdZvnpwKzwrXAXUjgI4EtuWHfXk4DLPUVP/zJwXMj5yklywNNyHC80OlYBNDK4LcgPIKOfxYFtKf2TVjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CY8PR12MB7413.namprd12.prod.outlook.com (2603:10b6:930:5f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 02:26:37 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 02:26:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 22:26:34 -0400
Message-Id: <DLLHMYHNE9HU.ED6S3JI0KPF@nvidia.com>
Subject: Re: [PATCH v8 12/14] treewide: introduce arch_has_pmd_leaves()
Cc: <corbet@lwn.net>, <tsbogend@alpha.franken.de>, <maddy@linux.ibm.com>,
 <mpe@ellerman.id.au>, <agordeev@linux.ibm.com>,
 <gerald.schaefer@linux.ibm.com>, <hca@linux.ibm.com>, <gor@linux.ibm.com>,
 <x86@kernel.org>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
 <hughd@google.com>, <dave.hansen@linux.intel.com>, <djbw@kernel.org>,
 <vishal.l.verma@intel.com>, <dave.jiang@intel.com>,
 <akpm@linux-foundation.org>, <yintirui@huawei.com>, <dev.jain@arm.com>,
 <usama.arif@linux.dev>
To: "Luiz Capitulino" <luizcap@redhat.com>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <david@kernel.org>, <baolin.wang@linux.alibaba.com>,
 <lance.yang@linux.dev>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <cover.1789695931.git.luizcap@redhat.com>
 <50af0b07cbb36e911ecd1f90698bfebcdaa8a390.1789695931.git.luizcap@redhat.com>
In-Reply-To: <50af0b07cbb36e911ecd1f90698bfebcdaa8a390.1789695931.git.luizcap@redhat.com>
X-ClientProxiedBy: YQZPR01CA0104.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::7) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CY8PR12MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f296df-a928-4645-8c1c-08df1850ed2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|22082099003|18002099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	cm5lgEO64RrFVTx6R/Z8nm6LJuRnYb8b2/JNqveoDRucOmZdqDdF4AxQ55EfHitUUBYOKENLvIAF/bJuifvI48h3V0Jz8cmzuO/9kWVlPKLbtTANaBye5vDLYOVxq+IlUp6iHIC29Oq+MKNM12XBBjuYAVowE5lPJhS2W0UIxTCIaMoLg73edt21GWqZEDj79DJn0v6dLMfMaJb+pnEYyhqDtk4EUINTvM7fHzIK+fRbrVUbGpXngMWh9TF5oL/yEBHeezTIU254WK3Q9jDqnb6yX07CL+7hACWyrAf8LNPrRhOHdKtJTcynIaAIiiZ08BfqZeKt9SaftTpvXcUOJ+tVQon7Wa2W1cPc7PyvkGr376gwZnp2QWBDHl52KXDupx1180ux670Wgi+DZjY65lkzttoMJcooiICtkrEEmYYFNpxGMe2mKipntsbPHTupBnaxqq8OiVGsdIh3Vy8Ld4sBNmF9fl8qQG0hXD6uw20fLln51oeRZHjsaNkba1Tl1xaW2eU5RbBoRJ6SLwrYJJSmu8Tpqi200/lUzlTOW99Mxv89/b9u96/m6TONCKfY/52IpDv0huecmQVnGPKzSIK5fmAUBhEt/LwGceG19/A1HDk62k/buxMsSGSpwzM1RrIjOAf4ghgE23gJ0BMiUd5YXbAF8ClVbzDzANLBlEs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEtHNk9LRkYwRGFYR3BmZzlISjZCWWVORiswWGFuQmo4UXllYkJyQXhQcjlS?=
 =?utf-8?B?RllyTHJQZmpvTnJBTk5wZjBWTjAzK0F6aVhyeGNEeTlqc1JUcVFpTU1aL3pY?=
 =?utf-8?B?Yk1MaFFCcEFHdDhUWUNZKzN5Q3JZcG9KdkM0d2J4MURYK2pydUJScm9ySGwy?=
 =?utf-8?B?cGt3UThUNTZXTnVNRmorMzdRaDUwd2tQUE9RMXZybG15d2Ira0NQZEN6dDB1?=
 =?utf-8?B?Z1NIbUdibEczRGdncTdlQ0VlU1lSaUFYbC9qREVpVFFxK25nbm1HMHpDYURw?=
 =?utf-8?B?NGUxa0xkYXl1RlIyRVZOK0tYZit6QUFRbk0ydHNPUHp5MGJaRWJmekRRandi?=
 =?utf-8?B?MmpjS2dqL3pZT1hBaUp6UVU5MjcvbkIybkUvVE8xMktoWWVsZWVMMEtyZnZV?=
 =?utf-8?B?NFBiaGtKTGxHSUtxL0ljbm9MaGdkMmt5OVNaRkZvS2pZcXFXbXRCTmpmM2JT?=
 =?utf-8?B?Njc2VDlhVTZZS0lIeTVGMnRCVklZdGRPU0pqbXZZQ1Y5NkRDTi9FVm51OWFP?=
 =?utf-8?B?TlQyOHVsb1MzNFJwcGkyVTJpeVE0ZFhXbjhrbU1KVFMyZGo4dXVKenNocUp3?=
 =?utf-8?B?ZTY2a050azdjQTJocHZRMDFGQ3k2TG8zZGx5RnRoaFJLbE9JT1BobnZ2SXN4?=
 =?utf-8?B?Znc0Q1kyazMzQ0pDbnpYMThBdjdaQWw0OEJvNWpvUlBGdWVHb3FJVXp3Rkd6?=
 =?utf-8?B?SUZxMGx3Q1lvZnlOTjFNSnRJa0ozMmZLRkFSSnF0TG1uRzdPcVBxRXBzTnZH?=
 =?utf-8?B?c1dvZTVieHV6dHgyMVJYdE5zZ2VvQytzak04alprcGZwbzhmMjdkVDVBL1Fa?=
 =?utf-8?B?SnFNVkw2RUlGMlo1MHpoeWNUeXhSSmZJNVRjNHlLUVM0T0JCajlMQ2YvR1VX?=
 =?utf-8?B?THhvQklHZ0srNUd3SGpSSmZKb3pVM3FHT3V5bU9hUnUvcXdjaytOTXpTRVFL?=
 =?utf-8?B?bzU0OXgvOWNML0pWZkJsS3o5S3VKRTVjMS81NHRQOHljcHpZdW0vTDAyV0Fw?=
 =?utf-8?B?NjhEVzRIK1g5Wk1IeDZGT3R2SWR5dWhXOVdXSzAvdlc4TkNwM3RlRnZEU21p?=
 =?utf-8?B?aXl3RlpMZVBxMThHNzhnUGV6YlZEZW9Od0NUWVFkRFRGUmhPMnNnWGFDYjZj?=
 =?utf-8?B?RTQ2aENialdQTlg0dWh0Z1Y2cDJhV2Rid0RTR1JheS9zSFcwbWhQWlFiV2NQ?=
 =?utf-8?B?dS9tV2pCdHhVTXAyNVhQTWloVTQvR2FxVk1NQVk1Z3JlVERzK29CQUFKWE5Z?=
 =?utf-8?B?UnJ0TWFxWjhFZkNQdnRkRys5b3RVOVBsTHdZZVdwaUg5WjllRC91aFRpWmVi?=
 =?utf-8?B?VDlPN2RLeStPemF0UHVsc1drR0FtcU9LS2pKRjRHNG1CWEE0Z09hd2ZodWFK?=
 =?utf-8?B?WTNHbS9LQzVTc3NWWWhoVXRjVTUrY05NNUc2Tm9KcHVBR3AxUjl6d0VQSEdO?=
 =?utf-8?B?ZzdQeFJFd2FIdXdYZUdFYXJPTGs4ajNYWFFNTE9FUWpZbzdNcVpwbk12RVZ3?=
 =?utf-8?B?dGlJTzY4RGxvdHdLRFovUHZYSFRRL2lCM1g1azlBMHRZTW1rR1NNWktzUWw0?=
 =?utf-8?B?MjUwb2xSOGFOM1kyZm1MVGVmbVlYQlpqN0w4UFV0U3BGaytDODBxL1ZEaUxV?=
 =?utf-8?B?b3R5TkhPK1dMcDhUZlNMQ0txbnVVc3Z6ckdNMVBtTStyWUhlUENJZnllc2dv?=
 =?utf-8?B?c3VpR1FVemUraS9KSW1QUlJSL2FvcmNjNjV0VW84VVJySjRMWkRZZlBRMlFk?=
 =?utf-8?B?ZDVsWE9pSTJlcVN5eVBkUFpVcGRFYVQ2ZzNaSmlUbndhTkpjOXlGTzNBRDJz?=
 =?utf-8?B?OEFJVWdLZGZpMFIrcWJQam5RN1VjUERJT3ZpUyt3Y08vQ2ZOT0FIUVN0WU9K?=
 =?utf-8?B?ZzNCNVgwMUVKdWJHUkpuWU05VVdJOGdZbnhrSnh4bE4wUHd5QVpuY3JwRzNu?=
 =?utf-8?B?cHJaRGdIN1diWGNtQzBIbjZWbUJiaWREOUl4SEFXVUJWNFZZbHVWSTh5RHhz?=
 =?utf-8?B?dkdWVUNHQU1KeUN0ekZOVU8wY0xXc3Bsd0ZKNkUrL2Y3alRyS0w4MDVBbytL?=
 =?utf-8?B?RzROczJXVis0TFlySFpucm90Ykd5bHNWT20zWFgxS2EvYlUrSFR4K21YLzNY?=
 =?utf-8?B?RWtSSGdEa0pmekpqVGZWcjZvL2pWcjdhWWt3UGdiSjdYbHhMb1VBdTRxNnM1?=
 =?utf-8?B?dFNBZnRMRjlwaDVoMFNEb1FlWE9Sd2h4S2NsS2Uvd2haR0NYdUJsUnc2Smpm?=
 =?utf-8?B?dmxKR0N4Rk4zNGRHWXB3T2FMckR2RlNSNXBlR2RoRlpLQWNIUWdCUTVKVzF5?=
 =?utf-8?Q?AljuuEiZCDRdM+nY1t?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f296df-a928-4645-8c1c-08df1850ed2e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 02:26:36.6782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WohOSJYWG3C8ipn+khlnfk4FK+ZyYTRQgsi6xKQEevOx3EQJKxZNVcqDZhia/9CN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7413

On Thu Sep 17, 2026 at 9:45 PM EDT, Luiz Capitulino wrote:
> Now that all the has_transparent_hugepage() callers have been converted
> to pgtable_has_pmd_leaves(), this commit does two things:
>
> 1. Rename has_transparent_hugepage() arch implementations to
>    arch_has_pmd_leaves(), since that's what the helper checks for
>
> 2. Introduce the default implementation of arch_has_pmd_leaves() as
>    IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE). This means that if
>    the arch doesn't implement arch_has_pmd_leaves() we default to checkin=
g
>    CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE as a way to determine if
>    PMD-sized pages are supported
>
> Note that arch_has_pmd_leaves() is supposed to be called only by
> pgtable_leaf_support_init(). The remaining exception is hugepage_init()
> which will be converted in a future commit.
>
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
> ---
>  arch/mips/include/asm/pgtable.h               |  4 ++--
>  arch/mips/mm/pgtable.c                        |  6 +++---
>  arch/powerpc/include/asm/book3s/64/hash-4k.h  |  2 +-
>  arch/powerpc/include/asm/book3s/64/hash-64k.h |  2 +-
>  arch/powerpc/include/asm/book3s/64/pgtable.h  | 10 +++++-----
>  arch/powerpc/include/asm/book3s/64/radix.h    |  2 +-
>  arch/powerpc/mm/book3s64/hash_pgtable.c       |  4 ++--
>  arch/s390/include/asm/pgtable.h               |  4 ++--
>  arch/x86/include/asm/pgtable.h                |  4 ++--
>  include/linux/pgtable.h                       |  4 ++--
>  mm/huge_memory.c                              |  2 +-
>  mm/memory.c                                   |  2 +-
>  12 files changed, 23 insertions(+), 23 deletions(-)
>

Acked-by: Zi Yan <ziy@nvidia.com>


--=20
Best Regards,
Yan, Zi

