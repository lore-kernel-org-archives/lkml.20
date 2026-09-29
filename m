Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013060.outbound.protection.outlook.com [40.107.201.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F49E2FB0B2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790646086; cv=fail; b=LVX+NiQYaSN0jI6r7jsMie2pvXy/t6mq1d0x5nrYpXYryYC6RfZtEyfhRNf8v2hpotJ6wp0Az9CNQFsbR3ulLnQqzuXpU1ORvpK99xwbOf2PcIcU3t2vaCooShLbPug2x1mOoGIi4DRsdCn/HuSuefRmhhNN0jOgTqEbZym1sjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790646086; c=relaxed/simple;
	bh=A5sx5LApyohOGup7XdP7i+HwhOj7FXyO5mhPS9X/DYM=;
	h=Content-Type:Date:Message-Id:From:Subject:Cc:To:References:
	 In-Reply-To:MIME-Version; b=P2RTkpoxtXpW4ZuvWbsQiVhlowVa8ldxbAulbtgavthL10ZT+jVz+3LFdon9q6QsiQfT3zaGXWuE2iSpoMkKSbXGENCFe2cxZ8e7WdIufP1Iq/EqvcRJKvhj0xNcpXdtPzEa9blH+QyxkJPSrQIMXWaj+tf4GePQ1rqwmZcxRnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hRTOz3FF; arc=fail smtp.client-ip=40.107.201.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hRTOz3FF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVRubF/IV/DQyXoV2F/mnXhdq3iFHV+kgN9WGI16dT1Yna/zAG9IDbmMtLWIZdKZOIOpLgYN0X+sIW9cb31sqse8e09pykB/BfkKbjAxTs79Dl+kchAVN2CUVNsdhrDIUTj9JnLBe/yVNpHSdp/b+RN6XkRY3CClADthd6SJvgvLXUz7yYz16O4gvLh/Jc1icTP0IMNODOxOqR74MZCJVtFmn2jrNkZs2iVDD8phBCo4yIypIQVSzK/66FRfkzWBdPYdRk51Kd5Wjx/pCdG6+5e3ZxQ/ebsvjIEiNzlB9NXmt6tp8+0jKd0FAoV98aPkoIiJ/fHwqB3NV5+fvdMZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuBMatndbDU95iys7SeuFwHaDdkYK5FhQrMAFuOIAT0=;
 b=XXEkkLqddoPGzaapku2WEphKpbPwCKdNpENwtwahKp/Mnf6dpcoV4lATkbOV6UhPFXKgKPKaLXfKS66z1+/PTWWsyHcgnkkc14eeW+zmfBYoF8NUtiV0tAEPUjEGjWsXx5FJBjRTuqbtxX3lWZ8Z9X4dl4RVpaISoyIfL/6O5A+tH/fu58R4TMyhjYhrJbTURfX7omDX1p+9VxSjtlqETuESB8bq3795zC1sBEUdSMK6RMviMrnSO5hDnm2hb42c221+WKlxHtmAr6pt/vUb9UjL+rIMjZJvAoBjyP1+5/WmH5VerUDhh22/WImE3mQdVR7C3a/KvrqIYJ5GnfGIcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SuBMatndbDU95iys7SeuFwHaDdkYK5FhQrMAFuOIAT0=;
 b=hRTOz3FFs2Xp7LM+YggFcjUSWs2UpREqhMcXasf3/2yxEaRzMKdJBmcEjAcignH7vyBjvKIkecDDZIBPK3Zcua/aXqzc+jo9Qo2Q5/RVV7AQNhw7vwUsdz1vk5s14g2Q4rM3Xo2IoP1VQ9RpEwDddX5moALDqaTSrCiUBtLR4LnCirLEZHiAWM2/jlhh9PVfG+HfG9ALLINh0CvWfUuFbFonESshCk8THSsvBa3OPyzjxf0nLg5p2ZapzzAu+wj+Bx0oyRHMI2nl5tUt6mukbBpXegPReAwGzJuGHr/VIJN214o8n9hTZgKgfUVTU8ZX2ii2ZjcGZ/WA/50IrcfwUA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CH3PR12MB9078.namprd12.prod.outlook.com (2603:10b6:610:196::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 01:41:20 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 01:41:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 21:41:18 -0400
Message-Id: <DLRF245BL299.14P8UWBF8SAJJ@nvidia.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH v4 08/13] mm/collapse: call collapse_file() from
 collapse_single_pmd()
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <kernel-team@meta.com>, "Liam R. Howlett"
 <liam@infradead.org>, "Nico Pache" <nico.pache@linux.dev>, "Ryan Roberts"
 <ryan.roberts@arm.com>, "Dev Jain" <dev.jain@arm.com>, "Barry Song"
 <baohua@kernel.org>, "Lance Yang" <lance.yang@linux.dev>, "Usama Arif"
 <usama.arif@linux.dev>, "Vlastimil Babka" <vbabka@kernel.org>, "Jann Horn"
 <jannh@google.com>
To: "Kiryl Shutsemau" <kirill@shutemov.name>, "Andrew Morton"
 <akpm@linux-foundation.org>, "David Hildenbrand" <david@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>
X-Mailer: aerc 0.22.0
References: <20260928100630.21870-1-kirill@shutemov.name>
 <20260928100630.21870-9-kirill@shutemov.name>
In-Reply-To: <20260928100630.21870-9-kirill@shutemov.name>
X-ClientProxiedBy: YQZPR01CA0153.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::14) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CH3PR12MB9078:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a6e2098-2085-46b0-ebd6-08df1dcac2d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|7416014|10067099003|11063799006|56012099006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	xcG8eLa9emT/mxy5c0Pex5HQhb6nf2Jpteg19Lw/N62nrFCOLT2BFT5Net68Dp2znZnFPdxtlP1hcQnoUtGdOsUT0PnqAk5TPR4uPkl/953xUW2O0qzhdku30udN2PLUus1T6OMIV+NeqXpp4gr4ElpgzsinR5oGSP6oGK0qbXJ85TdHTE/w8CEEF+joQzCSDWrZDGEhGkfpGQpnGJxJarpqewrtXnbJDbWu/Tj7wZ6ohZov3XZaaCqcKsTap/xjC5FYUKTnmTg+xQOQmC/v5c7ha7pbPuJmw8fGDL8z4VZr5ozA7SXn5IOpHX9B08BRKZfuPioS10OUrUnExFGkjnboyPk945FcsILUf03NHcshVTiATrSrNvXUnvKoCkd3xZSyt+SfNClw3b5LJ/9fcXhEEEAudXQZPTxuIqN+mUsb+LPjPcXyveeMg12g2xXsmrwElYtbydxIZRE/FfXEEy0XF83BAQAb5CKm4qrQRADJfx8fcOPOf+h7aDGGe1X79jS0tOuU0NYByLGpEAMUUX+q1taMg8VoGHv3Jp3ysRs87KWI2JnlqEQL4pKZRhCKJemp3dtyPDbEykZrS1qiaoN0wnpWBZmvejre+92zKsxjiv0vbtAJW7I9+fr4EiDX22yAFjy4/p/Az6PvxC5x4caw+kH59NmzbDHncfW/JDk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(7416014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlNlSnI5UHIvR3ZyZUE0eGtMcDUwT1lkazJsUlhxK1N0djNGZnZsaEdmd2dr?=
 =?utf-8?B?dWtnbjU5MWVpODgwTkVWcUF5SE5UWTRCaFhiRS9yNlZOYmdLWVpmOGRHdmtP?=
 =?utf-8?B?bEVjZE9wb1JtMUFTTHpsWDlpRkRVM0JidENuVzdNVzB2NmExM0I1a055S1lq?=
 =?utf-8?B?NS9FU29Pd0hPdzFvblFHVmZNemlRSFBSN3JCYmJPYTlEdEV1SGFNME91Z2RY?=
 =?utf-8?B?TURFVEJCYnFzVEtjVXJ2enduK2d0aUo4SHk1eThGSDY2NjFDdnFORWVLbkI1?=
 =?utf-8?B?TWZGakdIR0tkdUkwa1ZPVHozNWRINE1jSTR5ejhud0Fjb24xQit6Sk43VWJi?=
 =?utf-8?B?eE1ERXhaM0FJMnVDQk85Wm1TU2JNa0JnK1g2c0xHR0lCc2lCZ3lyMEtFVDgv?=
 =?utf-8?B?SkhNUDlDUWJ4djNVcHF1djRSVkxXMTJFYy9TcTZVbVZrMFgwNlRLa1BMWW1U?=
 =?utf-8?B?QUdHUkkvRXBLdkwyWnZYYm1ZMDZNNTA2MzVjRDE1T3FhcXNSNURsNDYyZ1Mr?=
 =?utf-8?B?eVhGUFBCQ3kyd0l1eVcrWTdkcW5mTG1aRU0xQm5EOG4ya0JuRjFacnNRSFcz?=
 =?utf-8?B?SHNoRFphWEx0eVhNUjh6Tnp0ckFzRnQ3WHNqS0k5VUlyM0NWVlBML1JWUlVi?=
 =?utf-8?B?Q2J6WU5aMG1SK3NmcGhvWitwNzU0SWg0ZGR1d254N28yUHhNVXlWcXJ1NlVq?=
 =?utf-8?B?Y3YwZnBQenkzZVpDTUEwbytqSzIwVUcrQkZhVlBlekxDMXZLbG5kNElKSTJX?=
 =?utf-8?B?UldFS0FNRlRROWliU3haclAxNzN5WCtIWkNCMHlaSjZXRkVoRmp1L3h6Mk5I?=
 =?utf-8?B?dFh5YkszcnlvU2c5QktmeU9Rc0dEL2UrOXJ6QkluZE82dHFlV1lrVUwxUmVW?=
 =?utf-8?B?bGZxNmdwMG1aN1czelRsWHo5cmlCRVM2U2w4eElxWWlrQ3BLTE1HUFdMUDU1?=
 =?utf-8?B?aTFxbjZUM3laSCt3NXRCQ1FTbVBmOHlGeE9rMElkaC9vOENlRVBka3FhMlFE?=
 =?utf-8?B?Y3dyTnkxMFNmK2FST3VndFErSVpSa0pNWWkwbkYzaERLeGg5MjN1YzhJd09D?=
 =?utf-8?B?K1EwZzhRcDJxYkRoNzdrUDhsdjR6T1dReHQ1bWpEaDhhbWdzNmE2UUZzaS9a?=
 =?utf-8?B?S2tLaWNweUFyVXViOXZuWXBKa1VxZjRDYVI2dndpbStNSkR0UTF5dURQSzcy?=
 =?utf-8?B?WDJwVmo3TThoNDJvSXNkazlQdy9kY3dpazk4SkNCYnFsaEQrNlBVSTFnak53?=
 =?utf-8?B?d05USnVZMFY4TVVkY1I4MlZEY1dKZkxpTkNaNS9sMmRRT2FsZ0ErWlFZckxm?=
 =?utf-8?B?U2dVSW55Zmk1NTNnVnVrN0ozREM4eHFrbkZaN1Z2Tm01YUovTkEwNFA0N1lR?=
 =?utf-8?B?RlFFRzNhaktmK1lLMGVndGZBdDVDTEZFNFYvbzJXVjNlTG5kbWV0UVMwREJz?=
 =?utf-8?B?VUplQ1ZDQzhYdlhYbGJWS05HazdmWENtS0h6VHhyZXg3VHg4TzNvODhKZ0xJ?=
 =?utf-8?B?eUVzWTRKcTAxeDc4eXBQWE1rNld5QXpXSTg5U3g1L0l0STdEMXRpaTVDWWhM?=
 =?utf-8?B?blVDOTdWU09nK0ZYMW00dEVtcUlPU0dkQzQyaGVmMDdSWWlJL29ldGhHMFF1?=
 =?utf-8?B?Z1pQeW5ZUCtJZDNpZ3EwelNnbmJJMUZUU3lDeGVyck02THRUYTA3NFEyZUk4?=
 =?utf-8?B?K3QwSG9WMEV2YkVQbmI3LzUxR3djd1VSdSs5R2xsVjVreGVrZGRMOThNdXd1?=
 =?utf-8?B?em5COEpWSXZVK1N0d3FaZlduUlBYTlZieDJVd1FCSWtQKzlHUGR2ZjQ5b2ZI?=
 =?utf-8?B?NTNRajZObDNNTTl5YXlPb3hDK2lVWkQ1V2ZmTFNrSzB5YlAwaDl2KzJVdUZF?=
 =?utf-8?B?VVJGQ2VEOExPYUNIQkpoM3FQRXJlUjkrcGFLWmpkTlBCQTFnbUt3RVFMVFhy?=
 =?utf-8?B?UWJQTmV1dEhiYW94cmIvcDJMeVdvalg1Z0s0czkrc1VwL1hFSHAvbnZWLzYx?=
 =?utf-8?B?d3ZGa1doZC8vejg2VDFneUp6c3JvQWxCNkZBaTd1dlBmMmlMNDNIWHNHbE9Q?=
 =?utf-8?B?eWwxdlNCMzNMQXpQMmtVVG5XMlljaGU4dXE1dUlxOWdld29VQUhIM0lNcldV?=
 =?utf-8?B?MENsaGRDb0VMeHlIUUE5TkRubDdpU3BlblRzaGl0NE9SamRSZitQaGtzZGdI?=
 =?utf-8?B?Y2pFcDlMcVdwMDJUVmw1ZXBOb1pFd1VYN2wyT3pvSVE4T1o2NHEydWRsWEtz?=
 =?utf-8?B?aHJWRW5YQmx5azhuVnJLTGRWY3NHNE5xQWNzUk1EQnRVa1V0ZWg2K29YNXMx?=
 =?utf-8?Q?QPhg7OkckX/j4rm7Ko?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6e2098-2085-46b0-ebd6-08df1dcac2d9
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 01:41:20.0394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCHX9Bc2pL7HJ/6pMtX1haRaZnVN5Yles+eu+qErLiEJR6g6PddGgLjrxv3XzdQf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9078

On Mon Sep 28, 2026 at 6:06 AM EDT, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> collapse_scan_file() reads the page cache to decide whether a table is
> worth collapsing and, when it is, calls collapse_file() itself.  The
> caller cannot get between the decision and the collapse.
>
> Move the collapse_file() call up into collapse_single_pmd(), so the scan
> stops at the decision.
>
> Two things change with it.  The writeback retry re-runs collapse_file()
> alone instead of rescanning first; collapse_file() repeats the scan's
> checks under the page cache lock anyway.  And mm_khugepaged_scan_file

So the new version is a little faster by saving a file scan?

> fires before the collapse, so for an accepted table its status reads
> SCAN_SUCCEED; what the collapse made of the table is for
> mm_khugepaged_collapse_file to report.
>
> Preparation for splitting a collapse into a scan under mmap_lock and a
> run without it.  The file scan has to stop where the anonymous one will.
>
> Assisted-by: LLM
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  mm/khugepaged.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>

--=20
Best Regards,
Yan, Zi

