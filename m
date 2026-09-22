Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012015.outbound.protection.outlook.com [40.107.200.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF1A7E792
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042885; cv=fail; b=fMDYi+KLNZpNzxP2pTtv1tbdbhOK2s9cqwwjlNY2AFV8wOFdI+PrvsSmtyWmUS6PXeyJY4h4T0W576+wXlDmWigy3yjApzcaqrSndIezvaTTcA9+h8RuGO2m0inMrwIwDTifcl+L17pGsI3HJ8yWrYD2yHGE9D+tx9aH3HgQkLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042885; c=relaxed/simple;
	bh=KDU0JL1Sw181naaUcBZi1c7Y62Ovx0aRezlQfxWU5oo=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=Ripbi0CQqqovqvBfG3U26BGiq4gpBXuKtbLE+wXrA5tyMQlE8UQNeS38CfGxmLiXckHccojRLK+fbWJD7+yKZBC+NGGP1bAbnCL1xesq/TXoSxWb49BrninVhUTnnE8JVQr7qsIPDkx5BQ3F06TGTxPOJ+InrvhPyWh6b6JwPQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b16N3E8W; arc=fail smtp.client-ip=40.107.200.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b16N3E8W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYDI0PKP14fImTrtBDpB+GVakvdgXkYGxn8fP33zr3Hr8EThXGT0sUG4r0TvSjmd9bHAQlNLTxCFEhwHzao0F28aC8rMdqctIJYB8d8F7a6RC5gIJnpcJpQOIDq42E923LHurnb9z+skP3wXw3lM31dTXlX9lf7BUNCfDPriw4CAPj/NajpWjL83iunIAqlWJvh5J8ir3avO/sGiMNMeVz14EoQ4DihXzpVrUt4wNgKlghWH6hkHgivdfg5f6dR+1DxIbVOb4ii/8OswGs7olw/vSZbC+E7jdauXf7Wv3UVZ5BzthFeteO8bnSM8ayb1d5NMr45+m210q6X4pS4xDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFN39LQCEX3Ac5Si5PZ2vXx6j6554BWx1Y31QFhZbP4=;
 b=xAxYWNrhPj8QgSpnaYJ/sCPZfO78itii5RhOxDdnItCCnw9bjt0tMe7snJtNLqY4Yzgy0Ayiu9uE1IRdFdYGMcIGmgguxLtbB76xgqyfvkTuobc00dX0n81xxisT1tpcFnJryig56cuoMqfE+UtnX7Kd2j6U+5lnepmn0bi+PSgyUnffqcU9dkRu9HLJmXPWJTrFqklHzVjclA+HZ9OTGrD6KzkXI8vGD5EP1qcF9aAkKcZ+kUmTlvtdQTEiPnmqb7UjHdL1Nqq2H7YAG/yArti8kkFGZlh2N9hhEczrSQw11xcNvMdyXG7pbZZQklJJ4RA8t31lkj5O8tIjZaOMtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFN39LQCEX3Ac5Si5PZ2vXx6j6554BWx1Y31QFhZbP4=;
 b=b16N3E8WTXjXUAE0S0olxPKUFEDNDypG9Q0YAK6e669m6+eYADazl+P3kwdbOykrGKgeNDTTP4f/VRkoTuz14JG56jNu/vOuXCFlaOEuk27FITkYTl9m9zSsAsmBHGLh8R4/284ZFLytMWI/eZgtUiMeza2FdvenFjvYwwr54ko9FbgHtfSJ6NZxZ5s5Z/pgrcpMg0bTvG7QUOch0BEGE+qsF40l3jtHAodqefnK0SlYQYs/f9D6bPpqI2Ie0UVPFAV3GpZA64n87Pv+D74axd45x2JGnPplXF/hU4xFb0eaR1Wpscq1Xkv1eU5w3xiTU9xgJfDcgcYHwKLHPPAOJQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DS4PR12MB9588.namprd12.prod.outlook.com (2603:10b6:8:282::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 02:07:57 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 02:07:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 22:07:54 -0400
Message-Id: <DLLH8O7B34X1.N9ST1FNGK0ZH@nvidia.com>
Subject: Re: [PATCH v8 03/14] mm: introduce pgtable_has_pmd_leaves()
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
 <f0b6d8a8036ee6c2aef2a63e9a03d94292a2c599.1789695931.git.luizcap@redhat.com>
In-Reply-To: <f0b6d8a8036ee6c2aef2a63e9a03d94292a2c599.1789695931.git.luizcap@redhat.com>
X-ClientProxiedBy: YQBPR0101CA0278.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::12) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DS4PR12MB9588:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d25505-6c52-4a31-4843-08df184e51c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wwWknH21qgVpSKzYW3RgyfCx77RR7GMu9Ovd+/lGkQQ4LHhHmuJdTOU3KdtbuQ0DsHoiJKPWf+x+lLoU2oG52axMGcGPl9TC1/9tvYEM70wSUSzqtkO/O1+j1wgg9wIjZwr9eB/RWS1eLgVFDrGXXX7FrgDqs4dDOSJxdIb//mBkrY3LXcGUJu/yA/tHcGMclAEfyfvx5PCO2IQxD+DD0dy3CoFC7Z07DF0bx5aiqn2sr1RYnaPEmy3mVVQWx3dM7VzBHZMF83MhQL65qhzLuMOuF81xh7v7lqIpSlL3muZcQNA/2aBAjX1d/nvv7RJPgT3V21LLyCu093kS6cXRe2GTich2uyHTPVxtPAJHzTCUgr8P8oWSXUy/JSe0jZqMoJcl1x4+35oNOGBIlVB05ArpCMC8TBdW+PUIpX4zrIXy67fYVqBMo9LbNR5p5vAXQ53EeIXcjEZ8jJeCnnQ7kV8qcw9f1rxewfKBBTqHlhpE1YuPR9Ob+7M4QT3Ulaa6flPtKc4LpaUWqGcE5ImIwbuF9dpcJWYv8VIr/cvUhvS++NAXid35RNJ4tJh9D4dPyVSofjYg7dGmi61DTdvQbAODi0n0ahmEY52weaVj/glICMXTXmVUEO9HOumgtkkmY24pp0B5Xm/WlSmd4jbpUMPH6bq65zSOnGFqpvCetGQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UisxRjBjekJ0N05xVFdlSnhLdG1SMVIwQmVzTU44SFRhd3owSTd6Y0RhdXVR?=
 =?utf-8?B?ckdueVYrVG0rMzlRVFU2aEdieGh0b1B1enVaVzJ2L2JWeUlGUzB5UktDSEJi?=
 =?utf-8?B?ZFlKNTFXOE8reG5wRDM1VDhyOVEvL2x1aTJ2V2t6T3J0Zjd2Ky82UFh5OG9u?=
 =?utf-8?B?Y0M0OWNPeGNpRC9wZG5VTGJmdnF2RXhmQTVLeFpMcmZyZjZlRS80N3ZBVWtD?=
 =?utf-8?B?ZGdxdjZiKzJxYW91a2lPOHliZjhCZUU1UW5rNm9wLzNNQ3BZLzkvR2c3NnZG?=
 =?utf-8?B?S3U3Yk15cTFTZEtqNVBLbUlzV2lxamVxOStPVDQ0RXdJRGdIRnBvSTN6cUUw?=
 =?utf-8?B?RFFtRUJtbGVnaDdHdWFSY0hPRGlLRGRwaFJIVGZBWTVDTHhTMXF1L1kyd0VZ?=
 =?utf-8?B?c3lraEQ2Tll4TEpXRFZYV1FNWlBaYzNZTGlwVjBYUDNhOWpiVWxTK3FBNWhE?=
 =?utf-8?B?Nnd6MHo2cmVSUTM0TTZZRFRwY0tpV2lXV3N5a2M4L0hwSVNPQWtnTWFENjM5?=
 =?utf-8?B?eEptWHVvSGNUejIxbmtWR25RakVlcnNXY1NickNadWJMQzN6RkhDRDRVNmJS?=
 =?utf-8?B?aWdWNXgvV3k3UElremo2VytVZmZGUVR0QWJWNjFTVHFjNGhnYlY5S2VsNHVs?=
 =?utf-8?B?bFFkTEdGTWp1VWlnUnZ3RkNjRWsxUG1wZ0d0SGQzZW1CMCtYcC9MN1VINEtk?=
 =?utf-8?B?WXBLZFAzNTZSUkF1NU1CdC9hN3FMRVQwOTM5YVhEc2pxZThtSDU4QXEyK0Yw?=
 =?utf-8?B?L0lJSVpneGJUSDh2MnZibHF6NmVhUXdYZDVDOEN3SmwxdzdRdVJYdktadVo3?=
 =?utf-8?B?eTM0US9INWQ2Z0lhUTFuV1ptRnRJUHhKQ1N4YkVYYUwyNXVjcWw2M3dHVlQ2?=
 =?utf-8?B?K09jcEg1aGZXSW01NWlFMVptTVFyZm56THk5U29rTVladGsySzk5TElmakFU?=
 =?utf-8?B?VFlrcEJNMlBGdVhnaXRaaUp2RkNMS2J5RzdxVUVsQ2ZXQ2xia1dIWW81clQ4?=
 =?utf-8?B?OVJMbHJHV3pJWkc3QmR6alRCRU5qeG4reElMOHVVc1VFcmgrR29EdE40K202?=
 =?utf-8?B?OEN6enVLTEszSFJGbXY0enVtZDhadUdQMXhmSnBRdnVSc21zSzQzUTdQVGFG?=
 =?utf-8?B?cThPRC9pWThRejJxZVhRMmVMZUxOQVFzbERTZzFQdmJKbWJhaUF4QmtMbUcx?=
 =?utf-8?B?aVkxbGFvTUNBNm5TdlNLWE16SE1sZnUvNVRMa21iYXlWM1liUFg4c3lJSjNB?=
 =?utf-8?B?cWVuaFIyUmludHhHQ2FFVnNtQ21nako2RVpiUFhWckpEQ1FFOXA5MjIyQW9Y?=
 =?utf-8?B?dVNBOTNpazB6SUlMMHVHWlB0WWZzQmV1QzJ0WUhRUzI3UHRSa0tPVEs0TlQ0?=
 =?utf-8?B?SGpxbGY0MGx4SGV6VElvK2pXb2F4ZXNMQXNqaXNETzV1SUlsZFVyR0FkZ0tO?=
 =?utf-8?B?ZjZqQWUvWE1Bc2NwMXN4VytNSmh5VzE2dDYwemVMSERtU1JDK05IbTRIUjFu?=
 =?utf-8?B?cVE0RENJT1M2TVZ4eGIyNWtJNnJQNVJZWFdldWZQOGRjd2xnNXJ1Yk1wQWlp?=
 =?utf-8?B?YmRqeUxEb2oxUy8zS1JKUGJTWjZhNktwYkhVUVN5dHJ0ZCs2U1hXc2lMcW1u?=
 =?utf-8?B?TkNKVC9MeitwZTRFKzR1TFFWRkZzUUpVL2VoUityODBEWDFIMmd3UlJVczFJ?=
 =?utf-8?B?Z1VjTE1VSTlIUUk1SWtPTzIzT0Myd2xGMW1xWHhudXVpQmNhbVRrN2UvbVcv?=
 =?utf-8?B?QkNtMG5RM01BN2ZtK3lJU1pvR09ENklWVE40MjFicm0rTlgvNE9INzBtdG0z?=
 =?utf-8?B?cXRwZW9MR0Z2d2dnRDB2eFFPaE5ncXZld1NHV0Z2QnlvNW5ST0dRZ0hGRXRP?=
 =?utf-8?B?ZDU1dk5ubU5kN0VwVlp6VWJmV0w3WFJqdzg3UVhISlNJR1ZUTVJnczZYSFJB?=
 =?utf-8?B?Q05ycjQxcTQ4Qm9zYlhvaE9tUGdRYlkrQ0RYdVc3Q2RBcm9WRENFQzBDTytT?=
 =?utf-8?B?OEc3TFV6OFE1Z2I1a3lzb2ZZL1FtOTNtVzEwS0g5dzNrNGtJbFpUT1pHOElD?=
 =?utf-8?B?dHZpWVRGUlpBb2hRMEdGRHd3NExBZ1IxdmozYTRCQU82SW5WM2dFSWc0QW42?=
 =?utf-8?B?dUtjZTFKTlVTS25jMm9YeDNiaUJFYXdpYldBSUtJMWhVRHhZdGZscjl4Zi9a?=
 =?utf-8?B?SXdxcnhTeklRZmxVbU9YY3JoVHZnUEg2WVlESjF5SU1YQjhDc3lwYk8weXpt?=
 =?utf-8?B?L3pOMkpMNCsxa3RiQ2oyd3VSQ3BiV0Z2d2MvenFXczdTUjZYL2F3NnBuTmlk?=
 =?utf-8?Q?t1UPPfU7XsopMKYFAs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d25505-6c52-4a31-4843-08df184e51c4
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 02:07:56.9485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BmdPkzGfhqYUjQALWUd2UhG9FfRBeznT4+Ux0JL3XaJMlMc3fLo+oBpkhJ1JANcH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9588

On Thu Sep 17, 2026 at 9:45 PM EDT, Luiz Capitulino wrote:
> Currently, we have two helpers that check for PMD-sized pages but have
> different names and slightly different semantics:
>
> - has_transparent_hugepage(): the name suggests it checks if THP is
>   enabled, but when CONFIG_TRANSPARENT_HUGEPAGE=3Dy and the architecture
>   implements this helper, it actually checks if the CPU supports
>   PMD-sized pages
>
> - thp_disabled_by_hw(): the name suggests it checks if THP is disabled
>   by the hardware, but it just returns a cached value acquired with
>   has_transparent_hugepage() during boot. This helper is used in fast
>   paths
>
> A better design would be to separate CONFIG_TRANSPARENT_HUGEPAGE
> checking, which can be done with the IS_ENABLED() macro, from checking
> if a CPU supports PMD-sized pages.
>
> To this end, this commit introduces a new helper called
> pgtable_has_pmd_leaves() which offers the following advantages:
>
>  1. Well defined and clear semantics: it returns true if the CPU
>     supports PMD-sized pages and false otherwise
>  2. It always returns a cached value, so it can be used in fast paths
>  3. It's implemented with a static key: it's a no-op for archs not
>     implemeting it and for archs implementing it the static key is
>     changed only during boot
>
> The new helper requires an initialization step which is performed by
> pgtable_leaf_support_init(). We call pgtable_leaf_support_init() early
> during boot from mm_core_init().
>
> The next commits will convert users of both has_transparent_hugepage()
> and thp_disabled_by_hw() to pgtable_has_pmd_leaves() and/or
> IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE).
>
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
> ---
>  include/linux/pgtable.h | 17 +++++++++++++++++
>  mm/memory.c             |  9 +++++++++
>  mm/mm_init.c            |  1 +
>  3 files changed, 27 insertions(+)
>
LGTM.

Acked-by: Zi Yan <ziy@nvidia.com>


--=20
Best Regards,
Yan, Zi

