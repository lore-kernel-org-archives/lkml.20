Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011021.outbound.protection.outlook.com [52.101.52.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185D93B3BEF;
	Tue, 15 Sep 2026 19:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789502385; cv=fail; b=S4Vs8UKsNEEPlL/56B2+mjXTBm7KzZSAVDKzYnz93RZAK2fUlnki2UPyVqwzzar2euIaOi2ME1zSyvuClQQmWOWppbAxkvuU+NaPaJyb/xLhREv9RtY9yPRIWbwGdXDM5b4OPEePpIwQzBdpALWzsnA2dlsOC3+Qjqw2xOoIOnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789502385; c=relaxed/simple;
	bh=R69xrXhIwRC5w+AL39PpZ/ncuKNQwFQ/s7tFgBER5MU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=menmsFT8QajBxVPpUq5OYWVieGIX3NBj16VRi81zC842UwI627aPtO5g27XYkhxeSjV8uGKtw1ES6q8/IAPV6AdPaAYdwGqI/0UCsbj7S66aw4fg7TdaYB0nlAe9n5eQgn+79HVbNHLTV2VoiWcMYO8ltrvVZaDbbINoU2087Lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WqHz9Jdj; arc=fail smtp.client-ip=52.101.52.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WqHz9Jdj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4c+g0L2JzAvTla8pXfxInTjikJZrrbQy9vI0tvOkU26wd4EpUEffaX2bykymwT6LtvA0oYLXqM0kR+XTuB4hpxBSoJgptKXL/D+5j/7E4XG0GqTg9AfsnFMcikJlbVeb+UAbwmyr1c7KtJsmHzLiHzREVtbcKkGHwhlCwca8htm2cYHxDHT2DZQGlk1tTxnysE4ThqoOEJZmauEsAgUL/nqnA3zF0Tv5sM0UTuBKAlEDcggLwmtfmNtWT/fPLVTgpFU3pag9LqtYiRSHZuuDuZb1fFC0GJ2CkTms03syMHJnaRMnWfnZ1rBau1HkyIfzKIB9Gkw4ieg2bk9Z3SD9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdZ8CSGHRLDBm7S+9ZCBRY+fql4y+8NMqreI30LpxVk=;
 b=Jh2ucCwWODkMu09ZcGVC5D/03qzgDbFeoeUd5lGyl+Cd22xyQ385r7AAJUjdBPckR4NovjFOFKWIvs8oeiUcmbmjeCKgkNO8LFlaEh1PRg7E1m52EiCbuZK6JIp5RzZuULpfjDQteFBE219Bz2+nrdJii8yl+qtj6GQdpilnNL0IDezFQdTJ63MS46lc92wNBu0EEY8AYyUPSO19h+VgptC/KHdTnRYswqzzPkBLNjCwwWjLNIWe9YgTzEnz+VeK5HijrVvWaWoklHqUIhDI8+AOh3FPMr3o7VwQnLAiqMF19XDUskBkut77sMqG+4xtOynA7t2UvAeAmoI8W3NsVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdZ8CSGHRLDBm7S+9ZCBRY+fql4y+8NMqreI30LpxVk=;
 b=WqHz9JdjqZ+zaE+eHlvFdr32ohlZeEbwwSDlWGJmV8Xkndj/9177wAgG/KrxCBo6YDwC2r1PcPNxY0x8rboNXbjKa1B5CZetAcEgu8MXXs+5J4wtk1DBljqesXHzkjwJvqzA3AtXPA+PUlLP1vuwD5WlHuo8dfPEcKeWjMQv4d0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by PH0PR12MB8774.namprd12.prod.outlook.com (2603:10b6:510:28e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:59:34 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 19:59:34 +0000
Message-ID: <2b2c5fed-0a4e-4549-977a-4eb9b6f27b70@amd.com>
Date: Tue, 15 Sep 2026 14:59:32 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 3/3] x86/resctrl: Keep mbm_assign_mode in default mode
 at boot
To: "Moger, Babu" <bmoger@amd.com>,
 Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 bp@alien8.de
Cc: x86@kernel.org, Dave.Martin@arm.com, james.morse@arm.com, corbet@lwn.net,
 skhan@linuxfoundation.org, tglx@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, eranian@google.com, peternewman@google.com
References: <cover.1788545152.git.babu.moger@amd.com>
 <176d53626058ae97c4003f77ff47371628da9f1f.1788545152.git.babu.moger@amd.com>
 <69044bcb-e606-4f7c-be83-2188169ddb51@intel.com>
 <e5d60b04-6bd4-49db-aee9-49983be17c71@amd.com>
 <5e8c02f6-4352-42e5-83a8-f6d589278568@intel.com>
 <02254e94-35de-406e-a40f-f2a566d1c4ec@amd.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <02254e94-35de-406e-a40f-f2a566d1c4ec@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0348.namprd03.prod.outlook.com
 (2603:10b6:610:11a::23) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|PH0PR12MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: 54fdb884-f241-4a49-ed4a-08df1363dd2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|10067099003|4143699003|6133799003|3023799007|22082099003|18002099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info:
	eTkkaLHJPGS5C6Pfyb0ENWzSrLWPjQgP1O3KlhRHtfyIJVgA9ogH7Bbp5zlLrpibPjKc01ga5E2tBnUAiWQ1ephq17ZdgrjuFzQl3X3GldZiKmrL43j3ezVTzjEPnUW0s+Y0HBfjFjWq+4NbChS3moJmEEDUha+lLfdGGuvIc/ThFC9YGtEHgaUxB1WI8LNYynvUadPVqzex8uPxVPmQWSk26wUYCFrZIIP/zXk7YxFc+VTcU7EvEopCynrfa9+Ggb6TBCg9ZJ+swK8p9Kf1CI919Z79s4Huwrq3AGvHeDkE0xbQtmaqkWw1vEAdzvTsthtobKf/Qpiln9/VXBxvpMVsnjT1yUhpUJV1DIMJeaLqjivE3Zs7CdbTZx9ujHSiVZsvrJ3rVHXyw4b6zvHEFf4Lmu28jZP2gN3jDH9EMqzQQbRcAtSRCiLpf49pwrT+LxgDUHRwrBOcW06YS7tqzLVN/D7bEzQsSpm0+D9iIiQSDtAfUrE8jqD7A0umRfW8QU5uNEPg6mO9PgOm1yMdkGnQva+w0hUBYT79yGSsZp0qCvAJ7m8itDqwdBIedG6pNDCnrb00iTOPjC2yxXouUYPBR4l/noKYL2MjvGpBfVAWBZ9pYZZebFF+SGwgB4Z6zCi/WWWXFno2oyPWOtHmhh3wNgKJu6xEfLSPDySJkUk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(10067099003)(4143699003)(6133799003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUdSdDRhNzFISy9IK3ZNOVhLMXlqejdFSm9JTzlXYk5kS2l3YVI5bkQ4eHJW?=
 =?utf-8?B?RXczNFI3Y1ZuK296aFhvRDRKS1dLaCtNN2Y1SDZNWm0zRWZjTisyZkVYcUhS?=
 =?utf-8?B?VHcxUWcyNmxLalFwKzJCV0xVdCtKeG5ldGhnV0RWbmMvMWpJTnNUaVpmVnM0?=
 =?utf-8?B?QWcrcGhsaGxjRUJ5SnIwckVEMzlzNTh5WU9BczdLYkFFeFY5V1luQnhJRm9Q?=
 =?utf-8?B?WXRNRkhMM0QrWVZOU3doYTZLalVzTDVFN2pUem9ML3NNUmJCRk9IYm9paVZ3?=
 =?utf-8?B?blVBT2FsT1NLWGZXbG42LzcycTBVMERSaVFFb1NWUE5zbk9YL01qcXZqV1lE?=
 =?utf-8?B?ZnJKeGhvSkVJaDVlRVJDTDBMcjNhSC9VMDhiQlYycUlkUUxFM3NMMW16Q0xQ?=
 =?utf-8?B?TENWck5rT2ZUbEM2VENRTWx3bk02bCtQVno4OWZqajB4Tkd0cmhrTnZSOGxh?=
 =?utf-8?B?ZFAwQ2dmUHZ3S3VWL0VHdkt3cFk2aU5OTkhCd0pCUjRKVDE4d3ZrRmRIbnRD?=
 =?utf-8?B?Yk9FYitxdkpIMlJtU1JScVBtR01SYlRFcDNjNTZKMkJ2Q05aTEdFcEJuYjlN?=
 =?utf-8?B?S2M5YVpjSTFoZG4rZzhJRDZuSll6R1dqVnZGZ2ROUnRaMHowQjBvbkpxSlpN?=
 =?utf-8?B?VjByYzkxM0U0aUxVSW9sbVFBZnFmak53SmoxSDNleVVuQzFqL3o5d1YrWWpk?=
 =?utf-8?B?ckVoNFRxYU5UbjFNQ2d1UE5CdzUwZ1pMU2xmUWlONFNEUTNndHl1d0puUmYy?=
 =?utf-8?B?TUtWU0NCWXNjUWU2ZGd3YndEYytrZmJpVVJmOENWeUcwS3QvQ3FaWmZ4TUJl?=
 =?utf-8?B?d3c4ZUxNZGtERGZkTUJHeFFMOVE5YjJkL2RLQ2VERzZ5R3RmSU9mVzBhTHdl?=
 =?utf-8?B?OGlIVXdhNFFIQmloTElHWnFBYlVUbVpGbWljc3ljVllpYTdQYU14djdVcGE2?=
 =?utf-8?B?NC90emxQT1YxQ3Y0TGJUZVBvSFZCVEhaSHhkWEFqUkw5OTc3U1VNOEVEeldp?=
 =?utf-8?B?VDIxb0QvNDA4ZDZqY0t4TDVRN2RSMXgvRU9ZdDFCQTZZQlNtOU1vNzFsY2JD?=
 =?utf-8?B?M1JKcXV0dU8xS3FXNXo4cmN0cDUrN0RXZSsyNjdBOUtraXh6Ujg3RkFwQjh3?=
 =?utf-8?B?aGs0SHB2cll6ZjRNV3doaGlCRW5HT1plUkdpQ1FyNTY5QWgxZS9kZ1lTclFk?=
 =?utf-8?B?VzNsYVo2QUZRY2JIa1pXUDdYRkF1Vmc2UWNDZ3JoOFJPVE9GekdSaXE5RHZy?=
 =?utf-8?B?ZUVtUlJKbHJ1eGJVU09ydllhUkU3aGxWWHpNbEtGZU92NHVKaVhONUhMcm1J?=
 =?utf-8?B?cDVmYUwxSW1GUi93ZzFUSGVpam1XcWtRVUtrb0FuVUloYkduVU9Md3ZpVllT?=
 =?utf-8?B?Z0lrdE1VSlNDNWZTNnZDTFoxU1dabFkyNEIzVE1QMkJiaWF6QnNzWmFvOE45?=
 =?utf-8?B?TVIrZFpEWXI5VEgrWXd5WkZoS2dMWVYxbzZZK3lYS1QzQTRxODk1SnBNZmFQ?=
 =?utf-8?B?Mm1uV2ducHd2OUlkVU9pTElwQjFxQk5SRm80a3pXSGVpcm5CR3B2dUxkNzUz?=
 =?utf-8?B?L1c5TGpiSUQyNjkwUms3b1ZQRGxEKzRiRFMrcFVMNGcyL09PTUJZRGkvZGQw?=
 =?utf-8?B?UHNYbmwvVXdPbTR5ZXMvSmthTFl2Sy9mbDlXSUM0TjdLaXEwcXpzVmJ3VjQx?=
 =?utf-8?B?N0ZwZU9xOG5wN2E3dXhOTktvWldFUGlzRmZMNnhpNHIveHNkRS9IQUlDUEt2?=
 =?utf-8?B?Qnh2RExrYkloNkJTNUVQckkyaCtrUllkQlI0azNMN0haQUl2ZFlCZkt4Vm5i?=
 =?utf-8?B?MnVYY2FBZjRWemFGYm9NSmdTODRiazBjdmFGQ1lDeEY2OFZDSk9URGFLcU12?=
 =?utf-8?B?dG95aGVtZ1ZSam5tanFyTjF4UTRvaEhYNUtxcFdCNExmd3Y5cjF4WTArb0VG?=
 =?utf-8?B?KzJvVHBBUVBlTmJKakdoMFB4bnNIeWpJR0xtYkVOcVRkVnM4ZDdWdUgwdW9F?=
 =?utf-8?B?YTg3OXdYbGxYSEpUWjNLbFNhYzBvRDg2cVNzMU9XbGUzK25za1dkOHZFa3Ez?=
 =?utf-8?B?S0RlNXVZelREcDg1bTQyaGhZMTFXNGF4cXlCODk2RnY1N0tSQ2dBTEhRMXR3?=
 =?utf-8?B?UDFkeVRSTHFkY2RWbFQ3a3N5SEMzbmRCZldJU3BJVVg3YUFKWmxGdVBtZnll?=
 =?utf-8?B?R21Lb205MlRSWWdzMWpKQk85SGxqMnNEZW44N3ZEemlXR0NieDh3VHdMYUVS?=
 =?utf-8?B?OUZST3RWV2w3QTZaY1d3cDJvQm5PNTMraXRNaFY5Q0xKaVkvdG50QU5LaTAz?=
 =?utf-8?Q?EH9YXHcZF9K2lfRyvC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54fdb884-f241-4a49-ed4a-08df1363dd2a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:59:34.5840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ClqJ0tKFuh1+yubKHaLbaceP7UDc77Ic69AOxP6ETGtIZUgnon5XMM6tI2d/NMTL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8774

Hi Reinette,

On 9/14/26 20:11, Moger, Babu wrote:
> Hi Reinette,
> 
> On 9/14/2026 4:31 PM, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 9/14/26 1:45 PM, Babu Moger wrote:
>>> On 9/11/26 17:25, Reinette Chatre wrote:
>>>> On 9/4/26 11:06 AM, Babu Moger wrote:
>>
>> ...>>> systems with limited MBM counters and breaks existing userspace 
>> that
>>>>> assumes the historical default mode, including the pqos tool from
>>>>> intel-cmt-cat [1].
>>>>
>>>> There is no record of this breaking pqos. *you* created [1] *after* you
>>>> submitted v1. What a strategy! I mentioned a couple of times that 
>>>> this is
>>>
>>> Agreed.
>>>
>>>> misleading. Since you insist on proclaiming "we cannot break pqos!" as
>>>> motivation for this change you have to also disclose the consequence of
>>>> this change on pqos followed by motivation why that is acceptable. 
>>>> Specifically:
>>>>
>>>>      https://lore.kernel.org/lkml/77f77d02-fae7-401d-9bb5- 
>>>> c62b244d23cd@intel.com/
>>>
>>> I can provide output that demonstrates the issue, where the event 
>>> counters report zeros. However, we won't observe the large counter 
>>> values because the hardware resets the counters after reallocation.
>>>
>>> Will that be ok?
>>
>> No. This is not about hardware resetting the counters. This is about 
>> pqos not handling
>> text return values, for example "Unavailable" and "Unassigned". This 
>> patch only
>> focuses on pqos treating "Unassigned" as 0, but in "default" mode 
>> "Unavailable" will
>> be encountered and pqos treating it as 0 is more severe.
>>
>> Consider a scenario where a counter is re-assigned. When user space 
>> reads the event
>> value then it may see:
>>
>> <return A>, <return "Unavailable">, <return B (larger than A)>, 
>> <return "Unavailable">, ...
>>
>> "B" is computed by adding the new hardware counter value to A. As you 
>> indicate, hardware
>> did reset the counter after re-allocation but that only means that "B" 
>> is no longer
>> accurate. "B" is still returned and it is still larger than "A".
>>
>> Based on above, pqos sees:
>> A, 0, B, 0, ...
>>
>> These jumps between bandwidth counts and zero is what pqos perceives 
>> as wraparound that is
>> presented in the example:
>>
>>     https://lore.kernel.org/lkml/77f77d02-fae7-401d-9bb5- 
>> c62b244d23cd@intel.com/
> 
> Got it. I can add the output of the issue. Something like this.
> 
> TIME 2026-09-15 00:53:46
> CORE     IPC      MISSES     LLC[KB]   MBL[MB/s]   MBR[MB/s]
> 0        0.76         60k        32.0         0.0         0.0
> 1        0.45          1k        32.0         0.0         0.0
> 2        1.57        107k        64.0         0.0 17592186044184.9
> 3        1.62        276k      4928.0         3.2         0.5
> 4        0.53          1k       160.0         0.0         0.0
> 5        0.63         39k      1664.0         0.2         0.0
> 6        0.44          6k       128.0         0.0         0.0
> 7        0.50          1k       320.0         0.0         0.0
> 
> 
>>
>>>>> For example, pqos mounts resctrl and creates 16 or more monitoring 
>>>>> groups,
>>>>> using two counters per group (mbm_local_bytes and mbm_total_bytes). On
>>>>> platforms that provide 32 MBM counters per domain, this consumes 
>>>>> the entire
>>>>> counter pool. Additional groups cannot be assigned counters and pqos
>>>>> reports zero bandwidth for them.
>>>>>
>>>>> Leave mbm_assign_mode in "default" mode during initialization. 
>>>>> Default mode
>>>>> can support more monitoring groups (up to 64) than mbm_event mode, 
>>>>> which is
>>>>
>>>> "up to 64" - so it may be fewer than 64? What is guidance to users 
>>>> about
>>>> how many monitoring groups in "default" mode are "safe"?
>>>
>>> It is 64. It be more on newer h/w (don't know exact count).
>>
>> Should it then read "64 or more" instead of "up to 64"?
> 
> Sure.
> 
>>
>> ...
>>
>>>>
>>>> Although, the earlier text is "up to 64" so above attempt at 
>>>> guidance may not
>>>> be correct and there is no knowing how many monitoring groups are 
>>>> guaranteed
>>>> to receive accurate counts?
>>>
>>> That is correct. We can get this count by assigning counters
>>> iteratively until an "unavailable" response is returned. However,
>>> the specification does not mention this behavior.
>>
>> This is about determining the "magic" number of RMIDs, not about 
>> counter assignment.
>> User space does not do any counter assignment here. In this case user 
>> space can create
>> monitoring groups up to the maximum number of RMIDs supported.
> 
> Little bit confused here. How about we revisit this text again in v3?
> 
>>
>> ...
>>
>>>
>>>>
>>>>> +    remain accurate. Creating more groups than that pool (for 
>>>>> example 64 or
>>>>
>>>> "64" -> "65"?
>>>
>>> Sure.
>>
>> This would only be useful if all hardware support the same number of 
>> magic RMID though.
> 
> It

Sorry. Response cut short.

How about we revisit in v3?

Thanks
Babu

