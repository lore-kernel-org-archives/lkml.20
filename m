Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012047.outbound.protection.outlook.com [52.101.53.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0792E1E5B63;
	Tue, 15 Sep 2026 00:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789431493; cv=fail; b=OinuROm+SbUogLpUjjsiUxSVRXx0OOln+ms1DQ14XyC7qYN7XxLrFQs42GbrdFkY0cUiipvaV1Oa5/E+fNJPrvD8bKd5eAJDUPuYot2niuprfu0FVT1zuBLR3gKeCk53zrjaggoHPnWFwLLJlzq16HUefJOEB4LTZe/dn6MHAkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789431493; c=relaxed/simple;
	bh=1zmb26eJF0kW3sGu6WFmseno02gJ7BlnLMDZg/mREA8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u0Dq5xta4lR3cs0oZftFIFJNQMsYF98UYpIuqbCgRdmlpVn5ICcrWBgbAx3s0uEi78RRjYlVRUqI3ET1yviAmM8BQKXysTgQ4e4ChdBmDEVvePVlLXrPV83r7eRjBBkuznDPE9rnDNknuka+sELm8AbLT3i3bAnO+H8xjy7p20g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MVcPXbO6; arc=fail smtp.client-ip=52.101.53.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MVcPXbO6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7SSVatqwoIx1J8KyoMnCQozCxJfQwxIon/GAn9l3pjccmkxV+UFMMxrTMScSw7JnsRJ0Co/GLdW3BhnnsaIS5xpY6fojiHvlzc6KtSsQhsQZWVHiJKDUcD5+jePqVGHsompwJs7/hvC58gmRpW499CmY4BeI3lApR1ZicGEbnkQ+Tk48mYs57gTieGGB6WVFeHsZQb1vKn/FhJOLaV3r7dtjx64sbimKc1eOXaY15Z9pkzd7iyrKbH94DOcXSAE9vVEqfLfFsPnEceudPM6lHjLHZB+LxYSdr0VDSwpkU6NgheD5jFy2WLXpnD/aPjlcaU9DolmxiLsh7NH1AOFHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvPTJO+tbA0SNqHyCCm0odiJwWKFK1zCrI9AzANXuAY=;
 b=nHEqz08lbghgqkBn6ehLLZpFcEmT+Vst9pPAy0Tih12viBoJEV7uYuqWViy4iHl93h0/nKYRHo6dLyTM9cPgXcrXRZ5uyKraBN2xM653Xhki8TVmnDoxCZu+v0ujvuDMaT/RoOz/H+87JEIRwIM9OGWbgK9yB3WDvk9RhZePaZdClyfA+BotlLZ+j8ekSAM07y0u9Pj3+hlHA6y8oq6wtJshE+lvzrJW/Zh2rLssjJ/4qntzs0Q0Efm/dzrBOz55DcXDwUWqt9cdtOSrjmE/eVfHSd/SnBWIdRC5n/xR5+ENBZExStDdkjjHf1G82cWPqV5oN4ELQuTXGq7iuXFZVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvPTJO+tbA0SNqHyCCm0odiJwWKFK1zCrI9AzANXuAY=;
 b=MVcPXbO6efFdY5VT0FW0K9W1jFKqclinYfL6kVzHnx0Nu0wL3XojWW5FW+4k/CQmNos1Q903bzSFo6TwMHAc0J+ejoPi60Qpwsa9eCA+qUOsBf1NWlm2DiAC6+sGSlk61AaZXJ2HUmOwCpz7h7h7LwOkqg6rpSfxeMnPXVS57GE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by IA1PR12MB7637.namprd12.prod.outlook.com (2603:10b6:208:427::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 00:18:05 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 00:18:05 +0000
Message-ID: <5af3cdd2-9436-498c-bfe0-03765eecaf39@amd.com>
Date: Mon, 14 Sep 2026 19:18:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/resctrl: Fix ABMC counter programming for
 extended counter ranges
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, tony.luck@intel.com, bp@alien8.de
Cc: x86@kernel.org, Dave.Martin@arm.com, james.morse@arm.com, corbet@lwn.net,
 skhan@linuxfoundation.org, tglx@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, eranian@google.com, peternewman@google.com
References: <cover.1788545152.git.babu.moger@amd.com>
 <9e85f67add9ac84f55e4b0fced92ed8994f8419a.1788545152.git.babu.moger@amd.com>
 <afd86b47-d508-4739-ba6f-fd1c341e09a8@intel.com>
 <10240e0e-6879-4378-8763-cb1a9baf1f2d@amd.com>
 <30dc55d0-511d-4f5f-92df-5dd0add354a2@intel.com>
 <dbaf3440-9d10-42a4-80fa-677451085198@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <dbaf3440-9d10-42a4-80fa-677451085198@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:806:a7::33) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|IA1PR12MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: e78dfdbe-08b3-4d63-af30-08df12bed00e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|6133799003|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BbqHw0YesXLhs8LWc3pIQxvMb9geiRXqfyKWqXjlf4Jl+KRT0ej0BLxJa0vKliItgMnwTXlg/iAULVE8xmT71TBd9k+WrFHIuWJCXi+7/apQf5aFEmzFaxPEsK0KSlH76l5ZlV3+ydxGgi+ajNVIhoCKaMoywT7m4nSLOGCcN9PpCGJ+mJprwxKSn2otsQOPw6wlm9L9q9y3AaiGoe5Hx3wzKkRefMc4Hr9tIcVkivEYlZ3suFZA8HnD4D3tq+AcYPVJBM2PDUC7JUOKzii2MLsNTxU0V5fXCyfeXMDBh5gWrtjmxcS1xHCZ71xBBu6A0eVeNC0t02JGaoyXYSUCt3C3YRo39mNkg5LsyQI8Wz6FlN8+Ez3D6N4GP2cms0gXpE/hBMJuwOY0ZDep6wVZciwcUnlOHMAAOAbXJskUVaFXQL0E62KylWAnz/sb8AriKIidyerD2MbIlxFT35yEYBy682JcMMUopSVXXtWYdG7vAGECpfayjHOHAuR85Cu2xkQ3k6WX8IT6e6y+Sz79bxmPG7H8CjkIvO+4iRluKChPtBgr2MkwH6fQkmjVGEd/Kck+ZMqo1JUUBNq5Sxn2ex6kdKfenZrdzA/KY7s9aX6tDqxmm2nL+y4ewGZxwyeVAsWP96VI9W8DPCNtsiaSfL5adW+MkrrwKo43dQ7ur8c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(6133799003)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0xxbFMrNXZKU3NNUG81WVhVbzNLVlVKdERNTUJPQ0prWklBY3RCSjc5VXh0?=
 =?utf-8?B?UHJ4dHhnTXJyL1l4bzlKNFJzSVZzZ2F4RTJkbkhzdzZoQUFqMVZZMStjUDBK?=
 =?utf-8?B?QkF0bG1TWGRacHdTNEg5cWJxWDRLR1ZnYlc1K3dFYm9xQXpHYjkyTXhtV0hs?=
 =?utf-8?B?RG41UEg5Ui8rUHFiOStUdms3VHRxZmhlb09QejJRaEpXNkE1NzBlRGRqSmdB?=
 =?utf-8?B?ckdmV3NycGE1bnluWGVPZFFTaDZtRXhVSVZ6MzdsNkVXTXl5a3YyK05kck01?=
 =?utf-8?B?YkNVT2JsY3hvYWU2d3ZIMExYTnhaT3ArSDZTRVF2TWl5MFp2eUdnazFNcTh3?=
 =?utf-8?B?YjV5cFpWL0hCNlhPUTZFVXArNjBYc0dacS9RUFY1UktjWGJUNTdQVkpRYjdH?=
 =?utf-8?B?QUJTUVpoL3N6dkhueVVsK3kyRkMveUxSdmdCdlJacU5UYituNElPOUhrQkdu?=
 =?utf-8?B?UDhwRlhnTHI3YW1HbkpLRFRseEdPenN4NUt2YVlJNE1iaEpmeFZ3MUdIU0lM?=
 =?utf-8?B?b3hUWHQwSmVFQTVFVmoya1dtQ09nL0hOTHJadzl5UE90cEdsT3J4MVpJSzZo?=
 =?utf-8?B?dE9XQWV2bkY0NXRFVDZHcVhPUFRKVC84N205ZXVPSEpSc2RTSm1aTEZTK0xa?=
 =?utf-8?B?MFI4dzNieUtvTVkrU0lnNE9mOW4zYkE1N3pVMGJGZ0FNSU9uSmZ0bjg3cHp5?=
 =?utf-8?B?NGRlOWlLUzh4MTN1VjFpa1hob2J5QkpaWW1mcVp0bEFDUnR1TUJ6TEVlK0pt?=
 =?utf-8?B?T0VlbWg1N0hrQTRWVUlZSDJxME44ODgzeUtGS2tkV0NBV05KZEJ1RkhOejZF?=
 =?utf-8?B?a01keDhpVU80OEFvOGUwU09EQnJ1bEQ1S0Y5WHpaM3pnOUNxQ3pBdFBZU3Zs?=
 =?utf-8?B?M01ZeVNWWjJnaUtpZlcrOGw0Y0dYeDUySmNheSt5L3JWNDZYQVJrY05hSHV3?=
 =?utf-8?B?UVdaWG1tM2xYT2ZqMHFMckZJN2FOaXNxUU9DdEJpeFhCNnh0VWhRb0RXeGNz?=
 =?utf-8?B?ODJyaitEYjRFUC9tMXBTY3VBK0N6eTJBbnduZkdIMllncEJ2cjUvdEJSSmdL?=
 =?utf-8?B?YnJ2R1BPT25pbUg1RmliWXpITG9PR2VSb1NVaTcwY0xZc2dhc2JLN042bWlq?=
 =?utf-8?B?OVlGbG1xT2JWYW9rc01GUWxCd3NzYU1SV1JMRmdkWEE1NHdpbHRTZk9FeCtv?=
 =?utf-8?B?Q3ROMTlMWEFYT0hCSlFmWURULzM4NW1CZzh2OVpYbEcrb3A3ZWFoeWlRTTdj?=
 =?utf-8?B?QlBmZ0lhWGR2bkFMbDE0SjFrbVNwY1VIRitwVHQ4aTd4MFNKczJ2dnIreU4y?=
 =?utf-8?B?Q09Mc3FxYmkyQ1BaaXRtMEd5bDdCZjNLZjdSb21qWmtSNGZ0YzBrUUMxSHM4?=
 =?utf-8?B?amxId2FuVEw3akhzN2RjVFRaWjdNaS9EZ3ZqcEJ1VGpRdVNraW5NN2E5eDBJ?=
 =?utf-8?B?RVJwQmtDZm1reHFmdnN5V1pRTm41RlVwcVFFRWJhNWY0djRxU25YaDM1L3RG?=
 =?utf-8?B?QVpmSUZNU3psbUVnNWhLMUh6dWdRVGFENCtLTkxjajdYMXd1YTNLd2JRcWpD?=
 =?utf-8?B?c2ludDliQ25WL3RHcEFid1N5T1JheUx0R2FKbzJoK2pLZTBxTjdnSW5oODZ4?=
 =?utf-8?B?K2RSSUw4WWNudGxBeEhjR016Zm5FNGloUUZFOGh5VERPNXRBYzhKbUJhcWxD?=
 =?utf-8?B?bDc0ck82RkVkamh5aXhqTE90STRQbTczUXR5M25CZ2EzZE9yUTlqNGxLL2lS?=
 =?utf-8?B?SURIaC9hWjRla29RYWNXeFlxdW0rbTNUUWZiOGFzbHZ3ZjVkYld2Nm5tMFZt?=
 =?utf-8?B?dVRMUU9Lbm0xTXhCSDRYK2FrVE1tT0ErM2E1SkhrdjA4T0pCRzE3VW9ndTd6?=
 =?utf-8?B?bGU5VFY1NjhPNWh1bnBBdE9ObEFhb1dERzBFMWNuSUY4c0NGak54eTV4NnVQ?=
 =?utf-8?B?Z25iSHpoK0Ntd2hubDNQeW9abkNQTWZwZmFyV1U2MldVR2lQaWlFMjY0VUZl?=
 =?utf-8?B?eFdRdVBPZ2NjbnFCeVlIcXZkQTFBSnAyNUl5RXg5WCs0WnJuWlZmMlBna3V5?=
 =?utf-8?B?TzNhaUJ1OFgxM1lZZXpNOWdRYnJueUNYU1NCNnVUWU1BMW9nVSs0a0FoUTVl?=
 =?utf-8?B?amgvRFlreERDT0UreXJEYVkrcmRhRDJHZ2dkV1N0OWFqaWNjTTlRZytQK2ZI?=
 =?utf-8?B?TDlGK1BNd1JvVytKcnkvS1NMaGxHeVFycHU4bjdsMm10WVVkMGpnNFErMGl3?=
 =?utf-8?B?QklBMFNYKzR0SG5yU0FrR05iaWlWc3R1a0Nrbm5EeUdQNCtYMUdBK3JoR3ZU?=
 =?utf-8?Q?oeimRTJfADSld85jxX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e78dfdbe-08b3-4d63-af30-08df12bed00e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 00:18:05.5185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4uRUvCEe4l2EkR7zBPXBatBUE8840hXsBKh7edFWPlHBazug7ALkBs1iytHkiN7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7637

Hi Reinette,

On 9/14/2026 4:50 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 9/14/26 2:30 PM, Reinette Chatre wrote:
>> On 9/14/26 10:17 AM, Babu Moger wrote:
>>> On 9/11/26 17:03, Reinette Chatre wrote:
>>>> On 9/4/26 11:06 AM, Babu Moger wrote:
>>
>> ...
>>
>>>>>
>>>>> Fix the issues with the following changes:
>>>>>
>>>>> 1. Update the cntr_id field handling to support the full hardware ABMC
>>>>> counter range and ensure that counter programming does not interfere with
>>>>> unrelated counters.
>>>>
>>>> Sashiko's assessment that this statement is not accurate looks correct to me.
>>>>
>>>> Looks like the enumeration needs a check to limit the number of supported
>>>> counters if the hardware supports more than what can be configured? It seems
>>>> awkward that such hardware could exist and unclear why the spec has a mismatch in
>>>
>>>
>>> You're right. The spec overlooked this scenario. I've notified the concerned team.
>>>
>>>
>>> Do you want me add this check?
>>>
>>> -               r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
>>> +               r->mon.num_mbm_cntrs = (ebx & GENMASK(12, 0)) + 1;
>>>
>>
>> Yes please.

Sure.

>>
>>>
>>>> the number of bits here. Even if cntr_id expands further to use the remaining
>>>> reserved bits it would still not be sufficient to configure all the numbers
>>>> that hardware may claim to support. Are there perhaps more field width changes
>>>> in this upcoming spec update?
>>>
>>> Two fields(ctrl_id and bw_src) in here are changing for this register. I dont know about other changes yet.
>>>
>>>>
>>>>>
>>>>> 2. Expand the bw_src field to 15 bits.
>>>>
>>>> Do the comments describing the RMID field width when reading the monitoring
>>>> data (__cntr_id_read() and __rmid_read_phys()) need an update also?
>>>
>>> The RMID field width is expected to change. We can revisit this when that happens.
>>
>>
>> This patch is that change, no? bw_src is expanded to 15 bits, and bw_src contains
>> the RMID.
>>
>> This is the new RMID field width for monitoring configuration, after configuration
>> the counter needs to be read for the monitoring data via MSR_IA32_QM_EVTSEL and per
>> __cntr_id_read() the RMID field is still restricted (although not enforce by resctrl)
>> to 12 bits:
>>
>> 	* 43:32   RMID            RMID or counter ID in ABMC mode

That is correct.

>>
>> resctrl also supports switching between "default" and "mbm_event" mode and there
>> is no support for the number of RMIDs changing between the modes ... this reading
>> an event in "default" mode should support the same number of RMIDs as
>> "mbm_event" mode and we see in __rmid_read_phys() (although, again not enforced)
>> that it supports even fewer bits for RMID
>> 	
>> 	IA32_QM_EVTSEL.RMID (bits 41:32) are configured with valid RMID

Yes.

>>
>> Looks like after this patch there are quite a few different field widths for RMID
>> between what is documented, used directly, and actually enforced.
>>
> To add to this it looks like PLZA currently supports 12 bit RMIDs per
> 
> 	https://lore.kernel.org/lkml/702b88901bc62f07829144a96cc887471b427da8.1787772750.git.babu.moger@amd.com/
> 
> I assume this field will also be updated to 15 bits?

Yes, I have already raised this with the appropriate team, and it is 
expected to be addressed.

The original issue arose when programming a Counter ID wider than 5 
bits. To address that issue, the Counter ID width needs to be increased 
to 12 bits.

Currently, the RMID width is 12 bits, and there is no hardware that 
supports a width greater than 12 bits.

How about we address the Counter ID issue for now and revisit the RMID 
width when the specification changes?

Would that work?

Thanks
Babu
