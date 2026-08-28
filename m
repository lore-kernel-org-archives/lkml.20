Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012010.outbound.protection.outlook.com [52.101.43.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569F833D6EA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787926902; cv=fail; b=EIFv1GMAmJW/+9nlG5FzNE2uOawBxdYa4eNj64eDXMF5WCMi2xuWCyj4rW0/74z6dyYYFILTPXnauv3yLwqCuhRAaE4r5PcZa8bdMqoleRmCWvnEX3FaW+nmWTqvdENih1zS/+hehXHcUDfMmLvSZFqHiEp+Uzj0ragoSRzikfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787926902; c=relaxed/simple;
	bh=Y9UxUEH+wMVC+meK1Pm3SF8LZjftLEZgv20OhxSeqSk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mGiyujTRIKy0GKUk+zpmrAYzY8Bdo8gYpvc9rFoDQ5WF/RufVVo7RyR+liCXdhx3SUWoVfPEK5Qc7HPZt9o+RblSeKSWdkvNXjCNXGXgz8ptbVDX+8Q8Wc9cm13SfzODetOqlz9XYJBN6M1OCjpmDztzB7gj4fnRZOSJe0fWUS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=z1ib4k+N; arc=fail smtp.client-ip=52.101.43.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="z1ib4k+N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gznzy4koeEXWKY9EdjpAheuimQAdu2UrrqxC6tKUpegxyJDpUAd4dolfzA++OOtsLjLFmZKaPFwANX4Pq9mgube9uToytrfjRqhDn1WHVUlUcKUm2MA4Du5YYXb7FH4mrHi+xImcg1S5fgDfN+MjnAYMF/gYexZkYoYmQE3/v7x2chrnLYh1vEogdf1RYzoWRpbbGutaWAUASGp/Uh7ljqvIAdUS8a3m9G6JlETI0mC2+9mntPkphsX7JsqNc4C9pdXtlcudVny/GQ/6X6rFrxDWJPQyydPU5dvnDIquI2IyWkB+N2JXp7kJGI0Kos/L69SaDNdJ7MRgCHwmAJiLjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhTRqb5fYUP9+SrnjDX6Bwh6VZIWAfE3zcJH1l9tIYg=;
 b=q9oCyChAsh98tbZyDDU6Xxot2Ar8tn/rJTdltWpAZge2RorNrkpeT1d3RAFNVOXfqww3WK8UjZKkFT4G55AnHCCdJ+ACVHCj1UzWWDYOf1GnRg8nH6JYUI4vmSGIUwfmfR/ACIZamydcSJYEJesHln5X0F5M1pz6J5HAwRiyhA6zcs8LUkCh3CdHDgEaDhIEpWZe4z7gjRdQz4bPiX/QI42TNJvOyrSAKmJOluQdatkfXUOt0qHpS0POKi1NpEUqlq4abSqQ23aEoANb0gCbKbMKUBrkmBkIaWX+B6BofpxmGyKGb1eKit+yuAc01zkBmB6FATkArGhrCfFslYOF5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhTRqb5fYUP9+SrnjDX6Bwh6VZIWAfE3zcJH1l9tIYg=;
 b=z1ib4k+N5n9kXDQGTE91gt+0zHmhiDuqSsRe+EL3iN8SYKT9Hqhiqk32aSWXmUN6nup1kasCH3wENweuNgw1d0JWgUwiSD4ITEvD4OiDWm/1thTeQ/07U+FzcKAj3GK2I6wNepX/3ySSwZBtmhwRw3fpNbRax+Fiwf3R56YMjTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB8131.namprd12.prod.outlook.com (2603:10b6:806:32d::12)
 by MN2PR12MB4391.namprd12.prod.outlook.com (2603:10b6:208:269::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 14:21:38 +0000
Received: from SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46]) by SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 14:21:37 +0000
Message-ID: <309263be-8295-4997-91eb-f7982d8c28fc@amd.com>
Date: Fri, 28 Aug 2026 09:21:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] x86/apic: Add an SVSM APIC driver
To: Melody Wang <huibo.wang@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org
References: <cover.1785375271.git.huibo.wang@amd.com>
 <7c4f962cb0c993f0cb136a9abcbd4f3e4759282c.1785375271.git.huibo.wang@amd.com>
 <0514ffca-89a3-42e9-bc30-50c317aa7bd9@amd.com>
 <1bd358fe-39f8-4a95-bf87-24a4a34d5b64@amd.com>
 <cfa5f6e7-f3ad-493a-b189-52e5bf49660c@amd.com>
 <3829c69d-53f8-438d-a8cb-c49d6958c73f@amd.com>
 <a11dbf6d-e418-4372-a5ba-123f75243978@amd.com>
 <8ada168a-2bff-4e9a-b0b3-6776b060f739@amd.com>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 WiyqywZI5g==
In-Reply-To: <8ada168a-2bff-4e9a-b0b3-6776b060f739@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:610:e7::34) To SN7PR12MB8131.namprd12.prod.outlook.com
 (2603:10b6:806:32d::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8131:EE_|MN2PR12MB4391:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f205d21-84ff-4499-c986-08df050fabbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	X4vJKh6ZZJNP77AO3Ok0/qUF/bNwxNFuLDsDTyUbnvJWzzKaTsvCrBDhaOCOuRymmjmvyDFF9VSCgwydCEQR3PVr2rjECs+p2XfKVA3KhdCV3WYN2+FypylgARHgkKEYkFbhYGT+qYlgPeBqgZOb2KzYsybAnWUB5GMZC0MqOPavRk6dK/Brarow57Dk+6LAmzzikmBTLRFrMjFgYUfJFcqgKptPubin2Um3rBd4KwsskTChSt3Ej2PauhAa8m06k4NvvOQgwcVC8wkQaXS/5YZUUs0BMt22RJUQmdp2D0Kj6bjDt/sBTnpkQh+qLcRc1RDvu7fuEx8jXMcba0oDTMqVxPgoHFynHqTPOG6UwHcT4gQdXxQwqUdW5pGww7RHGqui6NH9ofKHPV/araIbMomUsH7JBDwnd/4dfC7yE/veX22spIBtQscwSqXbrRKP4mrGlCs4hl3AKIpTADs4ek8t6F6FgSuoE9TguKa5cnxkgBzOzMvbawL8YtLu0QSqjpUd4g2YQruG9UGqX3hE+GR84dTD72CmLqO0AEFU/xESDy+X4XM7QGjNDcMoCAQ6hLZ0c9DTQOOrbqGyJpFFRCX8Zf2/hcwIbrf9XICj2E4QiHPiWgAo+KYYJuQtcPd5TvwtnSd1OW/fNU8fLcs8cDRofkKXzrDDQODuYknQA/8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8131.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTJ6M2pKcHNHaHpDV1lnSXJ6WUpUdVRvZ2VzVUZGVFlxUUxqUDJMS05ZMFNs?=
 =?utf-8?B?NEdkNzYxakZJMmp6Sk90U2VpV2hMeEd0aE05UkE4ZkNGQUd6L2xIRlJYaEFG?=
 =?utf-8?B?enlVdkJVRVlLU1dPU1dJeDRHd2RjSGpSVW9kRzczSmtONHEzMkdRSG1tNUhB?=
 =?utf-8?B?ZTJkY3p5VUFnUG03eEMvMCtPWUZzSVZLTVhnU0VjOWVEaTd5REF2OCtoQXZQ?=
 =?utf-8?B?dFkvVzN0aklOOU9CWkFIT1ZUZTRoODdhd1BOOXlSWlA3cE5oT0ZoNy9uU1kw?=
 =?utf-8?B?ZUNrWnpQNzdja0oxeERYUTJIWml6am8wTFRISUsydUw2TUZqQlcvdjQyeWh4?=
 =?utf-8?B?S2IzVVJlMFJ3MW5wNUdHYXZBMFV0a01TU2tPakFzZVhJUXZ4S0pMdmpIOEQy?=
 =?utf-8?B?Y05YUWJMNnBQc3AxSXNuWmxsYjZ2ank0aEJWOUNxVTNFS0Flc2FhMGZVWWxT?=
 =?utf-8?B?M01OMWthSUhsVmJpYkNSREtsSHRoTVJmYUNkOTladlhEbThESmZBN09LbklM?=
 =?utf-8?B?dUpKZGJwNnpGNmE5K3M3ZDBIOEdWbGJJUzQ1ejB4enNaVjZmYnl5RjZVV2FB?=
 =?utf-8?B?WVdrazBQanBMbkNLV1RaSjVFb3ZYamJHdkY0NjZTOEdDbnVzK0dOWVl2T3JY?=
 =?utf-8?B?ajNLTXlCaUhmTFo3c0MxNkVqdW1wd1M3bFVRRHdGMHd1ZGVyamh0ajhtRkl1?=
 =?utf-8?B?UlprN3ZselJyU1psclJDUjZseVVuTGMyUE1RT0F2RTk1akNPSU1GUHhCanY1?=
 =?utf-8?B?RncvbzQzTWFLeks1Wlo1ejkyazh3eGJNYkxHeDNlVTdURExnR1pwVVFFd1RP?=
 =?utf-8?B?R09xeUt0QUd4Z01RWTVvMCthRENxdFk1QXVpS3FrTHZpa0l5SUZlWVJwbS9s?=
 =?utf-8?B?bG12Zmk2TlJqR1RHRVNUWFFvQkhhTVJ1bWkvR3lPUGQyWUp4RDQ4NWJTdzcx?=
 =?utf-8?B?SlFldmh6UG9SMnpvMlFBdWdDVk8zeFRuMU5HY3BYOFF5VUpYU2pvUVNLZGs2?=
 =?utf-8?B?RTBPa3hYb3lLRVh4TjlWeWtMZ0NSZFE5aWhDREl3cVJTa1hkSzA0NjNXRG90?=
 =?utf-8?B?V05vTDFBV1Y3ejE4dVdhRStzbHRmRHZ3UHZzdnpCdjFKNnJycDFaazZtOGtJ?=
 =?utf-8?B?U2x5SGlRY2RQWXRnN3N6Y2FxTk1TWStYWG1mNUljMVhXRWhwa3MvdVI2QkVw?=
 =?utf-8?B?K3JaSGUxWnUyVUhFWDVkbXNlZDBjOGpSajk5NlUvbnFWMjhlK2JCK2p4QVRw?=
 =?utf-8?B?dGRGVVJ3cG1lSkxKYytRcG5rOTVLU0d6RUhPYWRKcDZRWUo4Qlk3MDNVN1ow?=
 =?utf-8?B?ekV5OFNDcDBmM2ovcCtpd3pUK24xc2RCTkp3cWZFWThiK1NzeWVoZmdJbS9F?=
 =?utf-8?B?Y01nZ3psS0h2bUdqdmNWaSs5Ynl1QzZYNkQzaUVzMmh5RTd4VDRwNHZSOG9v?=
 =?utf-8?B?S1dvaFF5cHpoLytpSWlVUEliVjFQcHNSTWYxOXIrTGUrRG9DaCt2ZzlnbEFL?=
 =?utf-8?B?VW1jYzJ2WDNpSFFwdGZHSTFMWk1yd1hTOHozUEorcFdXNWsxdVp2RU0zSDVS?=
 =?utf-8?B?NmdJRXBmRHlmTy9Mb0xhSXdNVmw4L25FVHBZaXNZTWxGMEJYM1p6QTc4ZTBY?=
 =?utf-8?B?OG8zdmdZQU9SbDRWTW9OY0c4c1NyaFZSZmh0Y2JYaFBBUmx1S3NUVkVVQjgr?=
 =?utf-8?B?SE5OQlRtcGEzQjVwRUNsRWlUZU92ZU9haWl1a2VsT0RZc0d1QjlEZHkwc0Nr?=
 =?utf-8?B?QysydVpleDI1L0ZDM2U3aWxSa0EwdW4rK1YrQUNtTHlNNzkyRGsxMXhHT28x?=
 =?utf-8?B?eUM1RFhXV0NSNlZ2RlMyaDVqOWRpTnFINWlmTldhTzY4bWc4TGszSldPRUxW?=
 =?utf-8?B?TFdHMW03WnFYaUIwbkxvRXpUbW1mTjZWQktER3YxNUFxQmoxNEVwbkNDSDlL?=
 =?utf-8?B?MEVyUVJKYjE3cHhmOU9YVnhobXlxUU94eFhMN0tYdW9jNElBSjl5Z0JIQTlB?=
 =?utf-8?B?TVRSVkVlSmdoTXU2UVlMYkM5YThyelBjNjFDZXpiWE52ZDEwdTNYY1FOQkQx?=
 =?utf-8?B?K05lSkpQNU8zU3dOQ05qRncxZXIwSUJaNmF4dDNXcm1uWXdzUHpSaE13MWQ1?=
 =?utf-8?B?WXd6aGMzVTFDb2NXUThlSXpvZjR1UDBVa3JWTTdQd3hickVlc284V0t0NWww?=
 =?utf-8?B?Q2hjcjJDMUxNbWQwNll4MUxoMU5BVmhwaTdFVzJPbkoyOTkxeDRlb1A1b3Zl?=
 =?utf-8?B?YTBEUU9JbVltZUFuOFRiTEI1WitqZGpHV0ZnYmFlWWdlV252WStzMUdYN2tX?=
 =?utf-8?Q?S77hM1EUoWjDQoYJLk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f205d21-84ff-4499-c986-08df050fabbe
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8131.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:21:37.5793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jlK5z5bYYWa5xshDgZg/dYvqtOR1JDatc4aumxxO7X9S8Azq1StpDX9FHTn+U936luMxrzDwBIPm0FxC7bZuwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4391

On 8/24/26 21:06, Melody Wang wrote:
> Hi Tom,
> 
> On 8/21/26 7:40 AM, Tom Lendacky wrote:
> 
>> If that is the case, then the fix would be to move the setting of the CAA
>> into the svsm_perform_call_protocol() function and just make that function
>> external, which will eliminate the need for svsm_do_call().
>>
>> You would be a pre-patch then for fixing all the callers of
>> svsm_perform_call_protocol().
> 
> This is the code, do you think this is what is in your mind?

Yes, just some comments below.

> 
> diff --git a/arch/x86/coco/sev/svsm.c b/arch/x86/coco/sev/svsm.c
> index e2d3bc3c26eb..f036a85a043b 100644
> --- a/arch/x86/coco/sev/svsm.c
> +++ b/arch/x86/coco/sev/svsm.c
> @@ -74,6 +74,9 @@ int svsm_perform_call_protocol(struct svsm_call *call)
> 
>         flags = native_local_irq_save();
> 
> +       if (!call->caa)
> +               call->caa = svsm_get_caa();

I wouldn't make this conditional. Also a comment above it that indicates
the reason for setting it after native_local_irq_save() would be good to have.

> +
>         ghcb = __sev_get_ghcb(&state);
> 
>         do {
> @@ -87,6 +90,7 @@ int svsm_perform_call_protocol(struct svsm_call *call)
> 
>         return ret;
>  }
> +EXPORT_SYMBOL_GPL(svsm_perform_call_protocol);
> 
>  static u64 svsm_build_ca_from_pfn_range(u64 pfn, u64 pfn_end, bool action,
>                                         struct svsm_pvalidate_call *pc)
> @@ -321,7 +325,6 @@ int snp_svsm_vtpm_send_command(u8 *buffer)
>  {
>         struct svsm_call call = {};
> 
> -       call.caa = svsm_get_caa();
>         call.rax = SVSM_VTPM_CALL(SVSM_VTPM_CMD);
>         call.rcx = __pa(buffer);
> 
> @@ -345,7 +348,6 @@ bool snp_svsm_vtpm_probe(void)
>         if (!snp_vmpl)
>                 return false;
> 
> -       call.caa = svsm_get_caa();
>         call.rax = SVSM_VTPM_CALL(SVSM_VTPM_QUERY);
> 
>         if (svsm_perform_call_protocol(&call))
> @@ -354,9 +356,3 @@ bool snp_svsm_vtpm_probe(void)
>         /* Check platform commands contains TPM_SEND_COMMAND - platform
> command 8 */
>         return call.rcx_out & BIT_ULL(8);
>  }
> -
> -int svsm_do_call(struct svsm_call *call)
> -{
> -       call->caa = svsm_get_caa();
> -       return svsm_perform_call_protocol(call);
> -}

As a pre-patch, this wouldn't exist, so just take the same approach but
before any of your patches have been applied.

Thanks,
Tom

> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
> index f958f78e1db8..9013b392ad40 100644
> --- a/arch/x86/include/asm/sev.h
> +++ b/arch/x86/include/asm/sev.h
> @@ -526,7 +526,6 @@ u64 sev_get_status(void);
>  void sev_show_status(void);
>  int prepare_pte_enc(struct pte_enc_desc *d);
>  void set_pte_enc_mask(pte_t *kpte, unsigned long pfn, pgprot_t new_prot);
> -int svsm_do_call(struct svsm_call *call);
>  void snp_kexec_finish(void);
>  void snp_kexec_begin(void);
> 
> @@ -536,7 +535,7 @@ void snp_msg_free(struct snp_msg_desc *mdesc);
>  int snp_send_guest_request(struct snp_msg_desc *mdesc, struct
> snp_guest_req *req);
> 
>  int snp_svsm_vtpm_send_command(u8 *buffer);
> -
> +int svsm_perform_call_protocol(struct svsm_call *call);
>  void __init snp_secure_tsc_prepare(void);
>  void __init snp_secure_tsc_init(void);
>  enum es_result savic_register_gpa(u64 gpa);
> @@ -619,7 +618,6 @@ static inline int rmpadjust(unsigned long vaddr, bool
> rmp_psize, unsigned long a
>  static inline void setup_ghcb(void) { }
>  static inline void __init
>  early_snp_set_memory_private(unsigned long vaddr, unsigned long paddr,
> unsigned long npages) { }
> -static inline int svsm_do_call(struct svsm_call *call) { return 0; }
>  static inline void __init
>  early_snp_set_memory_shared(unsigned long vaddr, unsigned long paddr,
> unsigned long npages) { }
>  static inline void snp_set_memory_shared(unsigned long vaddr, unsigned
> long npages) { }
> @@ -645,6 +643,7 @@ static inline void snp_msg_free(struct snp_msg_desc
> *mdesc) { }
>  static inline int snp_send_guest_request(struct snp_msg_desc *mdesc,
>                                          struct snp_guest_req *req)
> { return -ENODEV; }
>  static inline int snp_svsm_vtpm_send_command(u8 *buffer) { return -ENODEV; }
> +static inline int svsm_perform_call_protocol(struct svsm_call *call)
> { return -ENODEV; }
>  static inline void __init snp_secure_tsc_prepare(void) { }
>  static inline void __init snp_secure_tsc_init(void) { }
>  static inline void sev_evict_cache(void *va, int npages) {}
> 
> Thanks,
> Melody
> 
>>
>> Thanks,
>> Tom
>>
>>>
>>
> 

