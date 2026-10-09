Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011017.outbound.protection.outlook.com [52.101.52.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCEB3546DF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791512219; cv=fail; b=KGA+b8LyRMIDQVX0OtnWshHq1atw04bI4Im2XJg7+h+kJO+86JUYtfKymkHVicWOpxUmG9/OS/O0ueWzaOP4RQbZsq958/FnjUblPgmzxE9r6WwDMdaciC0pz13rSDxVKcyvIcVq998400nQU7vsf2jWo2we6mjv+fNq8F0BrWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791512219; c=relaxed/simple;
	bh=dOSE8Lu57GI/DVSVPEgEE/Zactoc3nOUAIZQhies+t4=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=tF4tVLaOYjPX1n4OKgCm2maJQDt4lrCZBgQhOQp0GSVnWwLdeRnWGw1Zh+cX0UUyksZ7So4L+uupOoTNHkvAfjmKhPQLBtH0SQmn1Ji12ZP/gZJuhVyd2ktVzwEVJ7j8HVAqtxlZZv9MotIUAgDDM91JJo/vlVqfh3WzQAA1oTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F3qJaqTF; arc=fail smtp.client-ip=52.101.52.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F3qJaqTF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9Wwdia29FTosO4sPZOq1i3+j06XZ8hNRuScadeYPi7JuwrF5r663dket69Gd7eWL8uQEgDJDN+8OOPqUcQ3Ixbp2LCuIKStl1Mcd5E7Ibpp8g2UWTffz0Z9ZXYy2lvigkS4eq36i2/yMZalEk5nPgpip5kYcSliTO1sq7BxT+Jkvi/L2C4JBVl36XgQMiN4iv5iJqaCzdW8zK/27msNmf8+qWDAFKJanhIcfOsVCVrSvkcEet+fWCoBtX5GN/p07ICiK6m8pOr55+LL/xNXA/SJQe1vFwdmjV1MnoCq7nv2nt5lcK4A51aeug83CGCMEBFMEkn5Gr+aV+posg7hdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeGGmBzy9HkVHuAQ2+AvGREp8fRkUXTs+Qzx6ZO7INM=;
 b=DywZqV4DLhmD6nrv6mQxK0ltBRDVQDydux6VGn0DB12NheHuPn4Mo7mPsL5FTopoOhyom4S+giYdNK5xVezWEJc+cQP/aXB5G5GO5pzTrmUiGwnS8nl6+z1AuiuoVudbi30TuruYXNKGpQ3vaWLhv/XMvzg+s2+GufYCOsnhYHrc140zsuwCceLPkBasyaYkY1jPQvXhINaHsEToOGfowewssKWjkzDF/nqKD0DDBiprojEkpN1hrCzpdo8yf23RDDABaY6t46HaRJMmAqH77/3BMduiphVVMDNC5yi1LSNTlv3BncWWrIR16i7fV7o5KOLMrV4DpOY0VfgS4jmoWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeGGmBzy9HkVHuAQ2+AvGREp8fRkUXTs+Qzx6ZO7INM=;
 b=F3qJaqTFr0MZQaXp4vtOok7qY5U9c3UQ9TVGNV3YRkS3x+p6LZatMUDlPl70pmhDqB7EhRSIjCGdJBhUg2MK0mLzevDhvIpy++bg7p6t7+bYeNLxLLPLq1XmO7AHLWrLEGdXObVAWrYr5Y9Fei8Rlz04vuLkYd6ELLldK67jWtUIFiWjvDi2Nfd3m1f3D03+BerqywZdgvp9kw62WenItP6zFQvoTRH5mGjJDuvPSnusJx6LqqIGD4fDc+O0EVQAOP4EfvS8KF6MNXQLoJKVZmDd7e8qYNLF3MqxqZNvhLSIiRoToPgOS2Cxbz0q69UylxZ2xtcSGwBfe1ibP28krg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CH1PPFC8B3B7859.namprd12.prod.outlook.com (2603:10b6:61f:fc00::622) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 02:16:49 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0472.016; Fri, 9 Oct 2026
 02:16:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Oct 2026 22:16:41 -0400
Message-Id: <DLZY2NKCO9QI.UQ6ZBHJHCRF@nvidia.com>
Subject: Re: [PATCH v8 11/30] mm: split PMD swap entries into PTE swap
 entries
Cc: <ying.huang@linux.alibaba.com>, "Baoquan He" <baoquan.he@linux.dev>,
 <willy@infradead.org>, <youngjun.park@lge.com>, <hannes@cmpxchg.org>,
 <riel@surriel.com>, <shakeel.butt@linux.dev>, <alex@ghiti.fr>,
 <kas@kernel.org>, <baohua@kernel.org>, <dev.jain@arm.com>,
 <baolin.wang@linux.alibaba.com>, "Nico Pache" <nico.pache@linux.dev>, "Liam
 R.Howlett" <liam@infradead.org>, <ryan.roberts@arm.com>, "Vlastimil Babka"
 <vbabka@kernel.org>, <lance.yang@linux.dev>,
 <linux-kernel@vger.kernel.org>, <nphamcs@gmail.com>,
 <shikemeng@huaweicloud.com>, <yosry@kernel.org>, <qi.zheng@linux.dev>,
 <luizcap@redhat.com>, <kernel-team@meta.com>
To: "Usama Arif" <usama.arif@linux.dev>, "Andrew Morton"
 <akpm@linux-foundation.org>, <david@kernel.org>, <chrisl@kernel.org>,
 <kasong@tencent.com>, <ljs@kernel.org>, <linux-mm@kvack.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20261002095503.3585565-1-usama.arif@linux.dev>
 <20261002095503.3585565-12-usama.arif@linux.dev>
In-Reply-To: <20261002095503.3585565-12-usama.arif@linux.dev>
X-ClientProxiedBy: YQZPR01CA0134.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::11) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CH1PPFC8B3B7859:EE_
X-MS-Office365-Filtering-Correlation-Id: 68dda012-5df0-473d-cf73-08df25ab5ccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|18002099003|22082099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	dZLxEgHmtl/eSRv2RhAjjDsi+KWoXAwr/W9jpf37HJt0oFjiSB3h1HYETC+ONH5W+OLNdfQMZBQ7bBwuV0mKTu9iT7uisLt2dwwdGlUb8wQrd5pAojDLF0KYk4TOpysmV/FejShNUCF7VPwis8beRCIDV5Og/0SAUJS+FC3ulPQg4c/Y4gDf01Z6IRtZ/c25HQLEVRpTHAdvFeNLNHYeBU8hpWHZdUEZmQJVufXNSN4iefQ+8dp/aTKr491DC8Lrdt3FZ8/T35Wm3/fxazzS3o+3d+AJSzyhRTu9K00PR5FYWNFHihZsCMQanv8DEZbKAN4KXfRpoUJdN7Kg6fSeHfRuTOr49SlpdI57E8J4zVL70FMsz/s5yZKipFPusKp5kZsWos5GFMSNNmYwnxPI0XWvarPKVb3EhJMzdE1aNDEVyvPeJYCuEWufAiTi3HTl5bj2s4V+pat5+02nyZhxB0VOVEdhfdBdYQf2cVcfZrR1NO0rLMjWOxDIjES2B5sA6pz3zFzsgIVfMgELl6xo6PD8I6sWAWbm3fThTe5l40PyIfpfLMOMS7so8Bk96qxD1b1XVnTFFuacHejJipJcL0bXit2sb4MgogrrgvtVCctnwluNkiZVDGoEncfZG6c3AiTej5duDnEfsdglCqKMeCTkoNlqhSlxk+YyO7XOhbQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejRhZm14SHNwNmhFL1ltQ01ZYjBabnRjZ0xNOE0rbHZWMklzanJ6MWk3MDlK?=
 =?utf-8?B?Rmx1bVdlQi9BQVhFREdHejRjeTBwUGRPdCthSWtBUWZNeUlqOThNSjlGS3V4?=
 =?utf-8?B?dis2UW8xOUdyY296TXprZ3lQMzhiR3JKZ0d5aGdad1AxbjdlKzNqSFN4TjE1?=
 =?utf-8?B?c2IveDNRS3kzd09ZN1NUMHBhVnE0c3lHN3U5YjFqdm5yYWpzcWNYL1Q4SDZB?=
 =?utf-8?B?d3hWTWFtcXJBMUxUTDQyREpNUDBLd2h6cDUrb1NHTURUNmpleHFzUjNadmFI?=
 =?utf-8?B?b3c3SmlSSWNKYWFQVXJ6MEtIOXZ4UThOR1NVN2xZV3VhMDFBUHg0T21qOExZ?=
 =?utf-8?B?RCtMR3czdmFkY2FCaGkyNitqR3pOWU1qR2R1QUJUNTEwM0lFOGNqajRMc1VW?=
 =?utf-8?B?UFRTRzJ2RFEzWUsxR0gxNkNBM3JFWXlTV3FtcUJ4SVBTUXd5NEFjTmlpeExY?=
 =?utf-8?B?LythMUpsWG1CUHE2blVrRVE0QlJ1YXUwRWlZU0s4MkZ2NHgwWFV4SVNwNnlw?=
 =?utf-8?B?bVhrdk5yNGl4V28vaUFleDQ2OFpnZ1N1RnFRaytlZGNiMlFXcXVRTjVzTk5S?=
 =?utf-8?B?eHRWczNNbFNjelJ2K2tNUTUxbHN5eUx6UksxaE55eCtETnpKZWlHZUMwdTcy?=
 =?utf-8?B?T01FaGoxaExFTXV5N1lBNTlJc3h0NC9YMFBXL2YzRVpBU1RWekRENGtRTXhm?=
 =?utf-8?B?azh1QTN0SmxqVG94RnhUNFIwYWpHTWJlT2ZTSGZPVklqWVA1VjJMZGxuQWFF?=
 =?utf-8?B?eW5oL1BudGY5Z3gwY2dtVXM0WmFXOHVSTDBkUEJSM1pkUkNyTjVZc3JWYSs5?=
 =?utf-8?B?eXZhdWRDMzJ4YVpTVExxb0ltcDh1K3JqYUkrQi9QL1oyNTNkZEtRanVERTBk?=
 =?utf-8?B?Qy9QTXphbmY4UWZBV0IzL0dTZUt0UnNVdW01dU1iY05yNXVoYmtUV0M0ZC9L?=
 =?utf-8?B?S2RaODdLNFFoRmRDaW9PWTM3NjF6UDc3QWV4Q2ZiMW9MRDRDZ1RqM1kxV3kv?=
 =?utf-8?B?SkdudVErbnR6Q2IwN1V4Ry9nTk5DYk1XYVJDOCtrREtrcmFCd2lXd0lFWGxF?=
 =?utf-8?B?Ym1MZi8yekdid3Bab0JzQUhkMFBYdVkySEV2dVRrc2xXZDQwWEhFVlkrbEJa?=
 =?utf-8?B?Q1lmYjdyMjdoV01CS01RNmNOQUNnMElZREg3NGdIQkUwZTBhWU5CQmc0L0xq?=
 =?utf-8?B?OVB1aVhrd0FrVnIvR1RwSXl2S0hHYzB0YXpQcG1YbFZnSy9PNTVXT3RzQys2?=
 =?utf-8?B?c2hzWVA3QXJkWk5RNFlIWUMwbTZWeFF5ek0yY09SNVB2bWFMVFp5eG82d2lx?=
 =?utf-8?B?MXBrUEgyN3NPZExwWDA3NXNUTmpHVmp4SVluZlVGM2wvRnBLbEFHQ1NOcnA2?=
 =?utf-8?B?VlZsaHhMenFpOFdMcTlzYndPSlViYkd4eEtTZ3V4NU5hQTBrUlpPd3ZwcGtJ?=
 =?utf-8?B?dGRJMGY1SndaOFVTMUg3LzFNNFB2S2x5QmdUbndjbm5tOGVXQmoxZXlCcFU0?=
 =?utf-8?B?RmxmZUZMdVR4NCtudSttRk9jSjBPZE1ScFY3RXdxMjYybjN6YjcrdXZzMjNa?=
 =?utf-8?B?dUVwT0pQRjkva2w5eXlWaDFIeDFCQndkRC9pbUcxanVxTFA0dkM2SE5QWWxM?=
 =?utf-8?B?VW5TVDF0MWI4Z3VmUkF0dUhKenFZVWFGOGtRdWZtK3ltbnJWTmlkdktwaXIy?=
 =?utf-8?B?RllIVkN2UFUzUlRBcFR3Rk0yRHFRQ21wR2tTYVZGSHROb2JoeEpLR1lwYTdo?=
 =?utf-8?B?S3poWDBPN2puYVQ2SlFsa2FvalZQT2RGNGVPNFZER1RrOGNUalRGbXRGL0d2?=
 =?utf-8?B?MTNOT1NFUHRPL21XcEcwU3grSnQ2RjhTaWVpbDJvQytXeUtBK3gwekNxczZM?=
 =?utf-8?B?V2paTVkzdHNNb1Nnc3JQVDhoQllmcXpXNTVZNmZUdWdod2E1UWx5czh4OVBZ?=
 =?utf-8?B?Qi9ZdXBsZDRud3d5WGF1ZnZKWFR0VFd2YlRxbHZoZU5hZ3F0TU1ZRjdEN25T?=
 =?utf-8?B?MkhFcGVHcGp5UTdISGc4V3BHcGdtblZyTzQrTFRvUVNmWGFJRi84WWNmQnVS?=
 =?utf-8?B?eUdWei95RzJ4akQ4ZW9TNzdSWklXNlVOLzhvNDFoY3hTVFRReGt4Rms4THFV?=
 =?utf-8?B?RHFaTkdlaUJ0OHMrTlQxemdDL0FKMTUvUkljNjVPRGhhQWNoREJCVTZBeGRh?=
 =?utf-8?B?NGtZNDU1dlZJMzErd2hZZHVIMGJvbTl6R214S0dEZlRhQ0VzUWQ0QXFxSDdh?=
 =?utf-8?B?N2dPSU8yYTA0WWtnU3BpYWVWNkVINk5qci94VCtnQitpaXVBbS9JQThEQ3dq?=
 =?utf-8?Q?HselSLeZdQ4S1tedaE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68dda012-5df0-473d-cf73-08df25ab5ccb
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 02:16:43.8649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oU9tT1JliDqPfDi8uTZK6+y1q1Xyzocpk8oDOSGUjKjQ83m/utV+iZ5Op0CWD+y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFC8B3B7859

On Fri Oct 2, 2026 at 5:52 AM EDT, Usama Arif wrote:
> Once a PMD can hold a swap entry, everything that splits a PMD - mprotect=
()
> or munmap() over part of the range, MADV_FREE, a pagewalk with no PMD
> handler - has to be able to split that entry too. A swap PMD already pass=
es
> the pmd_is_valid_softleaf() gate, so without this it reaches
> __split_huge_pmd_locked() and falls through to the present-PMD path, whic=
h
> pmdp_invalidate()s it and calls pmd_page() on a non-present entry.
>
> No reference counting is needed: a swap entry pins no folio, and swap_map
> is already one per slot, so the PTEs simply take over what the PMD held.
>
> The migration-only entry point cannot reach the new branch:
> page_vma_mapped_walk() never hands back a swap PMD, and
> __split_huge_pmd_locked() already asserts that to_migration_entries
> implies a present or device-private PMD.
>
> Test the pre-split old_pmd rather than re-reading *pmd in the trailing
> folio_remove_rmap_pmd() gate, so every entry-type test in the function
> interrogates the same snapshot. That part is cosmetic: pmdp_invalidate()
> leaves the PMD present as far as software is concerned.
>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  mm/huge_memory.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>

--=20
Best Regards,
Yan, Zi

