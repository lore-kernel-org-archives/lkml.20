Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013022.outbound.protection.outlook.com [40.93.196.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220854DA9B6
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231302; cv=fail; b=T6Qy3k+wIMgyyGpKBn/ahhjU2OurSdBroAah8EfbzeIxLVOBsXC+mQh+tAMOdaJPhTspK8zz3nLXc2w6nHBW6Q/9bv2W9iykFtdkBLYIpwxbskSP9Ia7vERgCurPagY3+pPBgR8FkYwwnZkLHAzGPlQKbrPaaqtEN8Ms52zBdsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231302; c=relaxed/simple;
	bh=XeTBn8V/ZaDRf4XR5CtmGw5rSJeqZOB38yosj4RWl+g=;
	h=Content-Type:Date:Message-Id:From:Subject:Cc:To:References:
	 In-Reply-To:MIME-Version; b=KnDe+17dwevq5tSshFBH6w4ZGS6JHWW3p71WBPpvQeQ/YDEEy/FKyivrO0pxlLsWaT/EvxNMLHAk2xQJ1Wi0DDm3XVmhrTgqHVBZCm7+u8rLwHuk7hVh3ltI3q/G/YcqFPkpirIoEToZTTvcd1XR2lNJAyFFFzfVYez90feIS/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ioO6GvY/; arc=fail smtp.client-ip=40.93.196.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ioO6GvY/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdzRqvdT/cR5hHgni+TVVqaMaBnMaWpBHGzQ4bwJMYC001kQjfa101nqsvlM0rOVnPnRJI8Mk5DUtIqbwwmIs0MHoiCqybjTB6ooVQF+GU7tpeanFZ3Y4Uw8kgHfErE9mD6OMSOHclKsdJD7Vr6klmlna3KB+E27C/eXFzxC4SxGKiRATlFihhPKOw+Gwh5VXvSHztziGnmlHyqKuX21YoezOkkKRNO+p8gtBCYG7U3G4sBDhd2o4AJmcl/isl7Ecej5YVe7GsJdr8Kf6eMF7gnxphexEc9NClKl+O6afY2caFbbGWUA1ibbtW7IzCZoXTolKjockrZ68oQjzS6uAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwN9Qfw179/rFDvctJi38VMBUgarvSSNm+oH+o44/M8=;
 b=gu29ojcNsutcANlpjj0oDuE9BoC9jG1nMRXxCdxyYDM+UiatyklUnGfcjJZJGidelfwGhriuopbB7t+hpWZzU8x0uGzxaExT/dpqB0lZChGkCFa5LBCHDGBbibcpoZBF+4I4YJOF3zpQiHqav3dSBb8ODFWCRe4w5yIDfS1L/4kz0PdCaMmcf9FoNeUhUiuhnlPNArS4a1cFoF9lEQ9A3kWIunn3nfZ0JSwe903Lf+hLmcNA0hsqbSs3BuXAZRvzu9BswoHRiqNlEpoblQdDh4MROv/tMdxM4ImSuXGZHCFxWrPDfZ5yUviQArILI7qnlMbT9wGZHR1HC8FKLZkFIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwN9Qfw179/rFDvctJi38VMBUgarvSSNm+oH+o44/M8=;
 b=ioO6GvY/kYPiCG9NkFJ3Rj/LILJP+H4cPMZMgWwbhSHainnFTM1NPbVBg97kIU2nyN8dJ5/Rn45E77CMuZvWsEIhdN4UvC/O3UrYfGak/8TIznxr0PVzSNwsIuQjvhPLU0HNnPZZMhTAD+vQfSogj28mvCzCnacKIxqBA+EVZIPqlIZ6iFqexwKjQ/IUPWTFgGHWOMu2i3ccz+oEaZYAjfYW/bX2etGtd2je0gLSjcwyn6c9aZ2Ydfi58sI8jAvNbG62KZBJxySwX1BHB/ieNq6l+7Jd2BQcxiIgqWiGxBiyncgyubW14oLWUK4XDL6NbY+GC9JDQM3FR1J3EszDJg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CY8PR12MB7313.namprd12.prod.outlook.com (2603:10b6:930:53::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Mon, 5 Oct
 2026 20:14:54 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 20:14:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Oct 2026 16:14:52 -0400
Message-Id: <DLX6HZQ71WVN.1AIA7V63XWARY@nvidia.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH v8 07/30] x86: mm: add PMD swap-exclusive helpers
Cc: <ying.huang@linux.alibaba.com>, "Baoquan He" <baoquan.he@linux.dev>,
 <willy@infradead.org>, <youngjun.park@lge.com>, <hannes@cmpxchg.org>,
 <riel@surriel.com>, <shakeel.butt@linux.dev>, <alex@ghiti.fr>,
 <kas@kernel.org>, <baohua@kernel.org>, <dev.jain@arm.com>,
 <baolin.wang@linux.alibaba.com>, "Nico Pache" <nico.pache@linux.dev>, "Liam
 R.Howlett" <liam@infradead.org>, <ryan.roberts@arm.com>, "Vlastimil Babka"
 <vbabka@kernel.org>, <lance.yang@linux.dev>,
 <linux-kernel@vger.kernel.org>, <nphamcs@gmail.com>,
 <shikemeng@huaweicloud.com>, <yosry@kernel.org>, <qi.zheng@linux.dev>,
 <luizcap@redhat.com>, <kernel-team@meta.com>, "Thomas Gleixner"
 <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov"
 <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>
To: "Usama Arif" <usama.arif@linux.dev>, "Andrew Morton"
 <akpm@linux-foundation.org>, <david@kernel.org>, <chrisl@kernel.org>,
 <kasong@tencent.com>, <ljs@kernel.org>, <linux-mm@kvack.org>
X-Mailer: aerc 0.22.0
References: <20261002095503.3585565-1-usama.arif@linux.dev>
 <20261002095503.3585565-8-usama.arif@linux.dev>
In-Reply-To: <20261002095503.3585565-8-usama.arif@linux.dev>
X-ClientProxiedBy: BN9PR03CA0481.namprd03.prod.outlook.com
 (2603:10b6:408:130::6) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CY8PR12MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e40fa8-7ae1-465a-18cc-08df231d518e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|366016|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EyHFZJKvtvP3mXb7fEqQwihB7sWgVPhwR0ELB3eva6YbC4OrfgimG1XTU7ep3ZAXFOfZIhKP6FukIF0dCvpgTR3nsdjI8y9GZAp73is+zz6kUuuuKW9hHEUc4MewfIC+cFAYhZC/Hujgnsk2SJcuZWrsAjq8OdPQaoOMk4c5qQEEmLhgvSlQjTtAzqaa/pTMbwYD27lzOQUsl6BbXUTLY89NWXuAvlDPkTZ+t0C+9+zTCL9fNqpVejfogMG2suPC7PrYaypbrqyB5dJh65ma/D9g1OGuRik+b9jP7+3Zfg2gzkXDRArycFL2ZphSyx5GD2cfv9iUUyHTF+o9wCqNiT/mdLXf1/+Bc9DgGk9Laz15iPSKDeZcwUiZqI6uPIU6OvsbH9XXbgsFUuNfhbaa+hDMzXt9KEhalmiz+SV10xtsGbok7fMZV3MuEfuRR3H7pQG4+F1aWRYsmYExBZDwZGAvs67gYaBPcTG4XYPxX1Z33jYLh2DXR6Sj7yelDveXdMhYhQ9Pjy+MaJsSQXOHRNwvzkDU8e7hV45ZKd6G3kPHB2r1j3BBV3PhugieiD+6ZTVJP49io7i+GrBNMHrR0NQPvVdXfz2482LU+BpB1f+rFYJvwxvTobvCGWRBr/Ec5JZk8QaaS//JIGm1qMHx7sDm36gETypNfkUyBfYWGqk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(366016)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2dqMnRXMWEwb1JYZ3V2eUcvUWQ5ekhLUlBWZjd6aTZoRElYSmtqbHQzbHZP?=
 =?utf-8?B?ODd2Uzkrd2tqUkNtT3dUTHZ1Wi9ZekgyeEp0V3lrZVZ1YldiL2JxaUZMalNU?=
 =?utf-8?B?R1JIcGxKVHVab0k2WWtqTjV2V2FJL1N4TXJSYlcreWxRYXdPeU5tNVVOZUhi?=
 =?utf-8?B?dGI2QVlkOVRsdzJQTVRNNWdaRjQ0bTlHZnR1SFl4VDIyUXhzV1FQM1JtV3B5?=
 =?utf-8?B?SWJ2bTBtWWViWHVzeTJ1eG5zWEJqc1BoaE9uUG4wd1FFcEVsWGxwM1kvTUxV?=
 =?utf-8?B?cFhzaXpEamRBQ1pRUzFsN2h5emxLR0MzNUVBUzYrQ2MyenpCVHp3U1BRb2Mr?=
 =?utf-8?B?VmlpSE15STFXUHc0RndPVEo5MjJWQUJQM3ErditaZUhEaThRYVNPbkp6b3Bv?=
 =?utf-8?B?Mk5aTFg5VCtNRjI5RktTZ05HMmFkYTBhMStpZ3E0Zi9lN28rakhtRDlzci9n?=
 =?utf-8?B?WVlYTUFYb21QL0F2aTRFbkluQVJOWFRJOHVjSExVVVRvZENEbG85dTBlMGh5?=
 =?utf-8?B?ZXhPS0FxSXZKYWx3SDloOEl4TitiRFowOTh4YW1BM2t3MW50TnRsWlBzVjI5?=
 =?utf-8?B?VXVuQ1lNa1NkMVEwcE9JalhMSk9VNDEvVDFyWW1UVENhd0RuTnhqOHdTRm1w?=
 =?utf-8?B?NU1qTHpUY2pKYUNwR05xaDZEYzZkYnRxQVRTVEtROXlKT3lMa3VOdDRhQjg1?=
 =?utf-8?B?RE5mRDF4T3Nqa0FwOFo1QitxMFBJZzFyOGgvUi9qNG10b1R6aU04TEp6TGJa?=
 =?utf-8?B?SS9McENZZWtVVkRPN0VxYTZtNkhibE8zSTRXWGExSXlJR3l1Y0xBbCtFdHAv?=
 =?utf-8?B?SHhpS1IzaDVYK3ZoSnhLckJyUEVrYWxPKzhmU2REYWp2WndDcVZZOVc3Y0N4?=
 =?utf-8?B?WVRwQUc4UFZRb1huQkVqekdXSlJ0UHJqQlZKdG9ncVpBdFZNT3cySUdMY1Y1?=
 =?utf-8?B?VXluWlB1WFMyODM1THB2dU8zS2E0b3hYQXhjWi8xTDJNVzVrNkFWZlB3RW92?=
 =?utf-8?B?VmNsbDFkVzRZdi9MMGhRcEVoQm5DUkNOYW5hM0VMRWx6Sk0yeElpc3VSVUpJ?=
 =?utf-8?B?elpjakdXZi9hRjFXY1Z0MHNmV1JjVUwwd0I0NkRNSDJpV2E3c1Q5VEhuTzJ1?=
 =?utf-8?B?dXE0TDllRGc1MDB2N1M3ZU1uUVFnVzJPWm81UGtuVjlneVJPSkEwYWFnSEZD?=
 =?utf-8?B?d3RaQmVaTVBrOGxUOGtRK29Yb3QxVk9ubHhRdnM4bE0xaUlCT09LSjlwMGlW?=
 =?utf-8?B?QnlVa0JQdElrTGYzYUdHY3pOb2t1VTVRdVhJTmNjTjdMNjFGZjIzRmpiSjNZ?=
 =?utf-8?B?aW9KVFJGaGlNODVtOWp1eWp5ZXJ3dGFGT3FiemxjT3ZYTzA2YjJuYnVEank3?=
 =?utf-8?B?K3BqNnR1cEQrN2lSbEdEWVNEdVRGWjdUZU0vdVJaanF2N2I5cTFZL1ozSThM?=
 =?utf-8?B?MVVEVmpKVC9pUi92YmZkNy9ybTNMTjI2bzl1eHhQc0szUGYrV0Q1TXN4YXdP?=
 =?utf-8?B?M25vVmNnV3lNL0pnbk1ENkhJdVpUS21WNDVyVE9MV1JhdWdSaW9LM3hCSjBI?=
 =?utf-8?B?eWtzci95cXgraVlIelNoaTJCY0YzWTdURG9qZ1RIOWVXbC95T2oza016TUFO?=
 =?utf-8?B?YStRWWRTVnhWSlVwUVZsRytGU3ljWktlclJzc2trcDlCTVZHeURyQ0FqZVdR?=
 =?utf-8?B?YnFYN0RhVnRxOWo5TDRlelRoMmpqVDlVRWdaZ2VGZmkxdGlwUDJLdE5wSGpm?=
 =?utf-8?B?alNDUkNlS285T0xseEpDZXdKekEyYjhmczlWWXRuUlZSUEd2Vm1Fb3Z3S1l6?=
 =?utf-8?B?R3gwK0FhK2NDTFFqOUw2TitkYVJQSmVhQUhVR2pLVTFuU3BBWUlWNG91U3hh?=
 =?utf-8?B?Y0krMWRWWDFzMVpmTXgzeGdCWDlma3g4dzJiWFRQQVRaSlVYTmZKSEdvRzdh?=
 =?utf-8?B?dnN5Mi94azNkUHJjQmN3KzJKSFVQRm13QlJydHJucmJ5Uk1EdzBmMjRPc1NI?=
 =?utf-8?B?d0lDcm1PSFlPWEJHZUZtOHJOM2s4L2RJS3Evc0YrUExKMWxEb1p6UGE0YnJm?=
 =?utf-8?B?SGo2TzkvbEs5cVJoMjEyQmxEblZnaWY3Y3pJdlZlKytUaWdqYWxnLzgvbUhZ?=
 =?utf-8?B?V1U3NkI5VndkSmV4NFR0TmRjYzh0N1h6MTZjNEs4Q2t5amQ4UHZEVW1RSEhk?=
 =?utf-8?B?UzFIT3R4bUg0dmV1dWtST2RhRmJQa2JFWmNPMmxqeUpNUk83NGRJS3lDUWJQ?=
 =?utf-8?B?QUh3SU5TeWEyZHlNRDRBTTF5dWEzMXYxUysxU1lTb2tHMjMwWFpJZmpHZ3J4?=
 =?utf-8?Q?4BWOKvTuiazIIVFXQD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e40fa8-7ae1-465a-18cc-08df231d518e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 20:14:54.0759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3glxzRebWa6E0S1b7e00+gfuVsJM42go0dWJggQ9c3jyiuGEdkeT2UWAeW6AhaO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7313

On Fri Oct 2, 2026 at 5:52 AM EDT, Usama Arif wrote:
> Prepare for keeping a PMD-mapped anonymous THP mapped by a PMD across the
> swap round-trip, which makes PG_anon_exclusive have to survive in a swap
> PMD and not just in a swap PTE.
>
> x86-64 encodes a swap PMD exactly like a swap PTE, so the new helpers reu=
se
> _PAGE_SWP_EXCLUSIVE, bit 3, which the swap-entry layout already reserves
> for PG_anon_exclusive. 32-bit x86 aliases that bit to _PAGE_PSE and does
> not select ARCH_HAS_PMD_SOFTLEAVES; assert that, because an exclusive swa=
p
> PMD would otherwise be pmd_present().
>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  arch/x86/include/asm/pgtable.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtabl=
e.h
> index d551120a7c889..c35dfa6ceda05 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1525,6 +1525,26 @@ static inline pte_t pte_swp_clear_exclusive(pte_t =
pte)
>  	return pte_clear_flags(pte, _PAGE_SWP_EXCLUSIVE);
>  }
> =20
> +#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
> +/* 32-bit aliases this to _PAGE_PSE, making an exclusive swap PMD presen=
t. */

Is it better to say? Since the above comment sounds like 32-bit
specific, but the actual constraint is about not being _PAGE_PSE.

_PAGE_SWP_EXCLUSIVE cannot be _PAGE_PSE, otherwise making an exclusive
swap PMD present.

> +static_assert(_PAGE_SWP_EXCLUSIVE !=3D _PAGE_PSE);
> +
> +static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
> +{
> +	return pmd_set_flags(pmd, _PAGE_SWP_EXCLUSIVE);
> +}
> +
> +static inline bool pmd_swp_exclusive(pmd_t pmd)
> +{
> +	return pmd_flags(pmd) & _PAGE_SWP_EXCLUSIVE;
> +}
> +
> +static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
> +{
> +	return pmd_clear_flags(pmd, _PAGE_SWP_EXCLUSIVE);
> +}
> +#endif
> +
>  #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
>  static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
>  {

Otherwise, LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>]


--=20
Best Regards,
Yan, Zi

