Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012016.outbound.protection.outlook.com [40.107.200.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D465331F99A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270644; cv=fail; b=lQV0e8tV/pSTPKcQ/KNuNgGJhBccdb/xjdHp2mcV7abuTU1e9cWq1xWSyJIGrwlengxW3UEO1r/Kd1PjErggwy01QJWqCSp2f4YqwzYhIoMERhSHZAoaRwkniymEGNSQtKMrudSUZcb9maLsqNIRDv9G7bD08wP3dl9HjkRCyI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270644; c=relaxed/simple;
	bh=C+J6hU/jXBSH2J4xM38ms7LKUuyOFxIX8508MkdlqAk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b7jRzcw+t2u4pjg/fXoW8Qi8tNtkTIIHbGnwcF8PzZiXIVarh+Z9ZosayAhnEeTAfQKklh724vcd9OqdE2M5ONjeC3T2LZhCzxxzJ5s0UbRAagqNIheKrhZ2nsYua3piWh4Jpf5Ure3347MVsZxzZQfrZWO+s+1OBm5ElE4rlaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=t1Ud9+2+; arc=fail smtp.client-ip=40.107.200.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="t1Ud9+2+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTQo2oIWsQA4djaqVLyzfYm3YhFy5RkIaNqBQcYk3iwrJxiiDVmSzQVIsOb4p9KsPsBpgVcy2cWTshT3f3MyZJelFHPos5tJlGKHWvFvqJ2rtI+e8nLjxNHMAp9T8Lve6B1ToEX5KiqHTmQmdaul+HGAG0VkpDw3i8kRPJZnTV7DjPM2CcKa9JNoUX/RQpouZz2eZa/Cnwhno9gsT8Jl8BBV8eqRamCSL24RNRlOZm9ViNcwNyMc7QKJYrBOziLSyX5JgkQDGiuMSLPsS2gau++lVmpDvzLbnwzoy+KvWKi9Ltuprq0KiSeYR1NujzKyQneLxUjPyx0QaNjuS6sV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJLiVS+P7w98vGu8IPj90LPu+NCNAZTxmj6CHuCoDAE=;
 b=o80QOBO/DBSh49c5+rUjF2UIWXWAB+IEBabBJOHvHyaYvppaUZo2n/QQL/F9gqd0IH2ciE15WD6+4kqP5EzlmP1HxmXmR+aoaXD+0tXSuV//7DG7D2/ClXCiJnKqZqWBCy4lVQqJz5L/1pgODOEbLqrkheRVnkruWGQRABCdKKd91RAF9knVbi3e6tZDszpvyQoAmfg4ztgqtI0/dtQnD9ke2OxJ8grb80/DR7ED7Vik/y3l+s4lzjyMEcjm2wzBX20LaMzPK1mhJM5W043s6t8b1KErBoNY9jXFib4NeldFFdcFRfcpRWludS3EtG1wSxTvt2EJEIK7PHPg9+OdbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJLiVS+P7w98vGu8IPj90LPu+NCNAZTxmj6CHuCoDAE=;
 b=t1Ud9+2+X9FqDzDEaYuCdLicetKIj4jv/zni5NsBYvCI1Hd2+wNJUGT12CknZdk05N+xEP0ZsXgw8d0z0X3o+2P5/BNOqCY7apc66gBMA8lcYbUaUfoSRRdkQ55e4ZmyJuGHl5qo1JQF3HdAroNea5r/Ywn0OTmEzZ9OHqGHlK4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by MW3PR12MB4393.namprd12.prod.outlook.com (2603:10b6:303:2c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 13:50:39 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 13:50:39 +0000
Message-ID: <b856b54a-b9ca-45d8-a4c0-dde33d0ffdff@amd.com>
Date: Tue, 1 Sep 2026 15:50:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] microblaze: allocate stack space for register
 params
To: Neal Frager <neal.frager@amd.com>, linux-kernel@vger.kernel.org
Cc: gopi@sankhya.com
References: <20260421122154.2659404-1-neal.frager@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260421122154.2659404-1-neal.frager@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::10) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|MW3PR12MB4393:EE_
X-MS-Office365-Filtering-Correlation-Id: ef561b7f-ffdc-4e28-f704-08df083001ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|6133799003|3023799007|18002099003|56012099006|5023799004|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	lUn2G4EUi+1lDWcMiwH++f/9bvLVmC8ykMn8dEiiWAMjgFPWoMNyYjHf5f1JsT374Bmv3LYwtMWZ6ZPggc7TAC/vVdCCWRC74vY9ntCiVNzmEw4e3KqqYrIWjDx8Rs40IK1JKo+mdlX2mUNWUKyC3R3kbxO+wJbgUXPP41u8pkMKef0KFMRhqGH5GgyiP9AlOZHQg8+N2a+/Wg26LM5yVwZsT4glHJJmn0vSNk8WPPL54f4wT2+8C/qg7DP8hCa/RcVeSQIIj0njdgrAqSMLk+4alR5i65k9KCNbtbdDQRJ1PbZdbo9zFNyNEFi5SxzwPmtnAJ/o9KLUD9X9YtskqkTLnEuMlGySbLxCd9RsC5v/KFRm71pw7BQLwc8uu9L/nXCX5dPhfRvFNhIa92FAsTYFU3Lv0w+HmumUB7xwwEyYKMztJ1TuCJC8pM6Aqc4U2d+ooS/VYGxKZmaAe3aQmRv1z0HBQlaIHhk6O67lboOeBdHZ8u1TnP3pT+G3TYYtA12PjfrKif6LjaOHMwILb1Wjz4yJeK4TQNHH2uWP4RqODDtGW9hLdcAP27Yb2uzaTbztOhbE25G+JSH7RsSZaQHLfXVqxGOfXvcD94AiTQIMkzXO9aJ+xgNiThqEDn+ex4uU1ut6bnx2VUN17FRV02ARZaBNeHs9oTR4V3VSOEQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(6133799003)(3023799007)(18002099003)(56012099006)(5023799004)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TG5VK3ZhZDJYT3dSZnZDek1vazBpb0pBVU9QWjNiazhLV0ZRYjR5QlNJNWtD?=
 =?utf-8?B?dzdqK0NkV2k1RHQwOHpFQ1M2cm5nVkU1aTc2SVhSM1Rtd0h1VEYyZzZkL0Z1?=
 =?utf-8?B?N3NobGpPaENScHdCcWhjZE9FeENsVG56cndDNW4zWHlrbngyY0l5YmlQbHlJ?=
 =?utf-8?B?Vzh6bWVKamdFYnZqQXNHbjlScnhIYWM4SngrY3IyK00zUHdkRitVTnNHMTZ2?=
 =?utf-8?B?KytUWEJXYXdnU2NvaXN1Yno4amNnRlZ4blUzL1JDeFdiLzBxYVdrWU5TajRp?=
 =?utf-8?B?cFJoTmxycUk3aVpwK2xrTGkranNHRGVOaFIxSEZtMkJpOFZaZlIxTGZnaCtQ?=
 =?utf-8?B?ZmlMWDRGN3UxSnlXOG0vWTNXcms5M2orM0NabjVzWWEvdlNUZWFDYnlxejBB?=
 =?utf-8?B?WnFNR0Vjbzl1NTIxaHROaG9wQ2NZR09OUVhYUXdMai9MYUxpODN0MWpQY3Ji?=
 =?utf-8?B?VmJ3WFJpRjN5dzE0WUZOSGFwNDYydkZDVUc0S0hQOG9DZjIyZGRYem9FMXM4?=
 =?utf-8?B?ZVo4VXN0dWtPc0VnN3lPTmRQR3lsUzNJcDVFKytKVzdLR09uWGJyODFER2dX?=
 =?utf-8?B?a05Oc1hRaDdncHBRZ2hWVWFsc1lpUUpKSFliNUppUEpLM0Q0elV4M1hHb0dC?=
 =?utf-8?B?d2h3cGlXWHdsSDhRcVlGUFNFWW1WN1Rrd0R0YnJ3RW5BTDBVa2NKVUUwM1Y2?=
 =?utf-8?B?em9tYzNlakwvM1MxWmo4WXNESXFFOUU0d2FQMmhaTTJ1RGJBbU9oTHhMd2hO?=
 =?utf-8?B?UEpsdTNvRTFHUFo5ajM2bkZFMUh3Ukl1VWJJakQrdDhBRko5UDZBMHZQdEw2?=
 =?utf-8?B?SWxCS1k3azljVG1KMkZhcHh2R0tMb082WVZKM2VzWXdkcmxoYitvQU1GYWtE?=
 =?utf-8?B?K24xMkZweGtjRVpNalYyekdOeThwVlFzWEQrYUI4ckpCNm5GcWJPY3BsNnFM?=
 =?utf-8?B?TVlHSUpZZUt1Q3kxUVdzem5zVENwSE9NdVFLSUVFbzZ3ODhZdUZzakpRaFVU?=
 =?utf-8?B?RDRTK0FlT1FST0xJZE1OMnJOUGhhNjBoWjQ0SmxjUlFHYUk4T2wvejFXL1hP?=
 =?utf-8?B?anhoNmFEbjFLSi9hWjBNWm9LTmYrR2ZaUlZnSitsaEJ3bmMzMHR4SEJXR2ZC?=
 =?utf-8?B?dlNBdkZhMk1JQmluL2E2TGYwMlBQbXE3WDBJaVNURUVXV1B6N05KdHdwN3Qz?=
 =?utf-8?B?VFQrTmxQQ1dpb2JUTEQyajROVWJXMTNGYmk3Q25OTTVWeUQ5cE9nVUMwclBm?=
 =?utf-8?B?azlZMks5LzlLU2F2QThGYkx2TFhHRVVHMFNvUC9PTWpXR0I1ZDlSdVBvNTA0?=
 =?utf-8?B?ZWc5cUNtTVZ5MDhUME9DZG9Dd0tYUjFlWmlKSTA0NGtUajBSNk1QLzUvZERT?=
 =?utf-8?B?aFQ4dHoxZmxNblFGcDNQUnZ6OGE5MTNkaTI0SVV4OU5MQWd0aFhUdVRScXNI?=
 =?utf-8?B?bTlIYVdMbDRTcThVUzY4QmYxb2xCWm15a2cxM3I2bzIyRC8ydzdmWjd0U0x4?=
 =?utf-8?B?dzF4eGVQV0V0dHpuU3BwMjc1c29DRWh3d3lpaTFwNjBKYjVYZC9YblNENXZZ?=
 =?utf-8?B?UllPOEsyd3NEMHJZVTRhMFh5SlErNjBmL0t1czNlSUozWkZaY2QrcFh4WDRn?=
 =?utf-8?B?SE5FeFRacm1HcWtTRlg4OXdOMzdIVzZFZDZ5RVEvUEVtaG5VVHVlR1lKUll2?=
 =?utf-8?B?NU4yVVZ1OG1SVGxSaThIcHFXQnQyM0ZQQ3dvY2hOelJtcHBhMTlmNkVBUi9P?=
 =?utf-8?B?d1U2eDFYSDVFZ0ZSYjNkU3E2SUxTdUk2c3o2RUo0WWova2gvQm1HbnQxeisr?=
 =?utf-8?B?U1gySmJUaVlqazlibU5CZFhBTzBMYmZGWXZDcHZuOHdZNUhRT2J1Y3BBQ0pv?=
 =?utf-8?B?aFlqcVRicTBDd3FrSzhLVU1mYnJpRUpGWHErTlBCaXlIQVJDKzNXdVFsNzN1?=
 =?utf-8?B?M3owY1RWdkhPay9KYjFEUTRZVXlsS2pLU29zVWNXWXIvd1hLLzRjNHdnL1Vu?=
 =?utf-8?B?RHBKNit3c3F5NHRkdFRYdVVucDM4blJ2L1dhb1ljeWxlVENGV2NkMFpqYVNH?=
 =?utf-8?B?WlFSTXZ3RXlla0gralJxMldJSVRQcnRUblhxZlVXM1gzd0pRUVFRWDU3ZW84?=
 =?utf-8?B?Y0s5TXd4SkxITi9HTURtWjlFcU8xcEQ4U0xnUTdoVzgwVkw3S3V4T1pDbC94?=
 =?utf-8?B?NS8xaXpSYVNKN2xveHpiVS91cWZGSUUrY0J3bEFVRWpTYXU5ck9LV2ZtcG1J?=
 =?utf-8?B?L0FLNEZTTWsrc3dzRWFQSEgyczEyVzJHbld2akgzbXZsN0lYRGljYUpWWFZG?=
 =?utf-8?B?UW9iR0lZMDJsdXpWRXZIWFFaeDAvY1FUSzJrUDZGOTludk9WWkViUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef561b7f-ffdc-4e28-f704-08df083001ca
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 13:50:39.2194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQjttyKUh6Wfx4jLOunVx4DPCWtKEvIl6bsFOA1OTjH7HSW2p/+xwM9susSJWBrt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4393



On 4/21/26 14:21, Neal Frager wrote:
> C functions are invoked with arguments without allocating stack space for
> register params (for potential register spills). As a result kernel built
> with gcc v15 boot hangs at the point of starting init.
> 
> Add necessary stack space for few C function calls from entry.S
> (not all). With this change, the kernel boots all the way to login prompt
> and root login works. Simple commands like ps work and show normal
> output.
> 
> Fixes: ca54502bd52a ("microblaze_mmu_v2: entry.S, entry.h")
> 
> From: Gopi Kumar Bulusu <gopi@sankhya.com>
> Co-developed-by: Neal Frager <neal.frager@amd.com>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - removed whitespaces
> - changed ret_from_trap2 to ret_from_trap_noadj
> - added comment for SYSCALL_ARGS_SIZE
> - cleaned up language in commit message
> ---
>   arch/microblaze/kernel/entry.S | 21 +++++++++++++++------
>   1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/microblaze/kernel/entry.S b/arch/microblaze/kernel/entry.S
> index 582d7256d815..30d42b84f156 100644
> --- a/arch/microblaze/kernel/entry.S
> +++ b/arch/microblaze/kernel/entry.S
> @@ -339,6 +339,10 @@ C_ENTRY(mb_invalidate_icache):
>    * Trap entered via brki instruction, so BIP bit is set, and interrupts
>    * are masked. This is nice, means we don't have to CLI before state save
>    */
> +
> +/* Syscall args in r5-r10 and the link register or 28 bytes */
> +#define SYSCALL_ARGS_SIZE 28
> +
>   C_ENTRY(_user_exception):
>   	swi	r1, r0, TOPHYS(PER_CPU(ENTRY_SP)) /* save stack */
>   	addi	r14, r14, 4	/* return address is 4 byte after call */
> @@ -422,16 +426,19 @@ C_ENTRY(_user_exception):
>   	lwi	r12, r12, sys_call_table
>   	/* where the trap should return need -8 to adjust for rtsd r15, 8 */
>   	addi	r15, r0, ret_from_trap-8
> +	addik	r1, r1, -SYSCALL_ARGS_SIZE
>   	bra	r12
>   
>   	/* The syscall number is invalid, return an error.  */
>   5:
> -	braid	ret_from_trap
> +	braid	ret_from_trap_noadj
>   	addi	r3, r0, -ENOSYS;
>   
>   /* Entry point used to return from a syscall/trap */
>   /* We re-enable BIP bit before state restore */
>   C_ENTRY(ret_from_trap):
> +	addik	r1, r1, SYSCALL_ARGS_SIZE
> +C_ENTRY(ret_from_trap_noadj):
>   	swi	r3, r1, PT_R3
>   	swi	r4, r1, PT_R4
>   
> @@ -504,7 +511,7 @@ C_ENTRY(ret_from_fork):
>   	bralid	r15, schedule_tail; /* ...which is schedule_tail's arg */
>   	add	r5, r3, r0;	/* switch_thread returns the prev task */
>   				/* ( in the delay slot ) */
> -	brid	ret_from_trap;	/* Do normal trap return */
> +	brid	ret_from_trap_noadj; /* Do normal trap return */
>   	add	r3, r0, r0;	/* Child's fork call should return 0. */
>   
>   C_ENTRY(ret_from_kernel_thread):
> @@ -513,13 +520,13 @@ C_ENTRY(ret_from_kernel_thread):
>   				/* ( in the delay slot ) */
>   	brald	r15, r20	/* fn was left in r20 */
>   	addk	r5, r0, r19	/* ... and argument - in r19 */
> -	brid	ret_from_trap
> +	brid	ret_from_trap_noadj
>   	add	r3, r0, r0
>   
>   C_ENTRY(sys_rt_sigreturn_wrapper):
>   	addik	r30, r0, 0		/* no restarts */
>   	brid	sys_rt_sigreturn	/* Do real work */
> -	addik	r5, r1, 0;		/* add user context as 1st arg */
> +	addik	r5, r1, SYSCALL_ARGS_SIZE;	/* add user context as 1st arg */
>   
>   /*
>    * HW EXCEPTION rutine start
> @@ -729,11 +736,13 @@ C_ENTRY(_interrupt):
>   	lwi	CURRENT_TASK, r0, TOPHYS(PER_CPU(CURRENT_SAVE));
>   	tovirt(r1,r1)
>   	addik	r15, r0, irq_call;
> +	addik	r1, r1, -SYSCALL_ARGS_SIZE
>   irq_call:rtbd	r0, do_IRQ;
> -	addik	r5, r1, 0;
> +	addik	r5, r1, SYSCALL_ARGS_SIZE;
>   
>   /* MS: we are in virtual mode */
>   ret_from_irq:
> +	addik	r1, r1, SYSCALL_ARGS_SIZE
>   	lwi	r11, r1, PT_MODE;
>   	bnei	r11, 2f;
>   
> @@ -1302,7 +1311,7 @@ type_SYSCALL_PREEMPT:
>   .global microblaze_trap_handlers
>   microblaze_trap_handlers:
>   	/* Exact matches come first */
> -	.word ret_from_trap; .word ret_from_trap   ; .word type_SYSCALL
> +	.word ret_from_trap; .word ret_from_trap_noadj  ; .word type_SYSCALL
>   	.word ret_from_irq ; .word ret_from_irq    ; .word type_IRQ
>   	/* Fuzzy matches go here */
>   	.word ret_from_irq ; .word no_intr_resched ; .word type_IRQ_PREEMPT

For a record this patch has be replaced by
https://lore.kernel.org/all/20260821151809.1233057-1-ramin.moussavi@yacoub.de/

Thanks,
Michal
