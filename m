Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010056.outbound.protection.outlook.com [52.101.201.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF614E0B71;
	Mon, 28 Sep 2026 16:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611708; cv=fail; b=YzA6eAwVNeiYnger4QQWJbWRqwCiNlTJO5fCrVyO3LdyMWAYkU9d7mzQUX1+sHnaNuOCmmPTcKjIoM8ya+Zsu7+6Z18OaF7l7zMwugedJ9F/dveJwLD9sJFGHHt6JxF7EYkb8+Ljz8WwI489A4NSRif3UhhqPX/pvYp7H1yqyU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611708; c=relaxed/simple;
	bh=SEfH39O1yb4y2WoA8RJzpi0HSWNA2BgMk+TvRFFPB/c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NlXiotF6m5wnl2iJr95B4peaAzMY++Tjrsp0B3koKYQQpgxOaIWlR1jte6Ayk8IWFvr/pV0lLzEqXZaHmrLbCjZEyTP5JmBaNPvwevlicND4tm7M2IeiPHPc5lVW2wWTmFxiqSIrqLwfU8TEFR6rNLH1wyoUOMvNV+0eBldzdB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OyQ2b8D6; arc=fail smtp.client-ip=52.101.201.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OyQ2b8D6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9LKdggWvT8Y4ABetcIONuoz83GT3FEZEI8VS93pluETQ5ns5odzcgmkTi8K2Q8vocrBYPR9mKqWSqKnhCOWkf5I7mpOsVyT8m1eRFM4CN03GFfNmqdbJvr5GQER4H4bhZHk7U2seaX4cxf8H5Lu3n3h77s7JdjqT/KBqKeU1OLRom85ifmhVsj/5L6maBkTUqxMMyRpeH8A4OJr2u2qFvacCBWfN9/20zLB6uQt4hkCZNaOJ0jZUMX6y038zkP+SNno05S+fENEb7lMLx47NlSJf+kPAKNCm6WPBPd+J8P1k/0tdp2f84fedKcDnXbZIXu73PwvNCNsK7rIH7aa+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adM8C6HcSEd0ccn534I0H6BsGbEeIESeEFMgfuCdfzg=;
 b=qKH4MYPgieRjW61EQJoD8fYRtzhzreV1AisJgapU3A5BocrRflhmhroCwd8EA6MAddgVGh5cFJ785glu5d0rAiDNgqcTit+R328lOsOd2DRLnsE9H46O436vclbRUQYT7vXHoLiCVp3cXblYm5AjM5pjjEbtAN5XZNHTvSjj5eG1mrvXepTMV9jILfm7teNRxfOTxSqDqLMojP0qPtmntzA+8GNUGdHTpYedWWcSsGhkn7TjRjKbtsmfrB4LdV2KtAgHcYFKRrUHOOi9eZ5Lj0lPKKvXa/sVJ7o1db5aV44RQsJUCTKDbz+nbcjxLvZ+iLIIduwDaB5yh2X0NNimSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adM8C6HcSEd0ccn534I0H6BsGbEeIESeEFMgfuCdfzg=;
 b=OyQ2b8D6KU5ZMzsvpMaYOq7cNbjtZI3nMhWkQkPSemH2uW82buTYmgPM+/yJGVMRzO1pQcYNFgJ8MU+9t31sR6TbZCn0jAEJZwzKieVx6xa+nRNZObrMxl7gO36GY1I+licAD3qibEVz7+VkXqtYGyff3t8DXMEKeicwtGmWdrE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV0PR12MB999069.namprd12.prod.outlook.com
 (2603:10b6:408:32a::19) by MN0PR12MB6247.namprd12.prod.outlook.com
 (2603:10b6:208:3c1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 16:08:21 +0000
Received: from LV0PR12MB999069.namprd12.prod.outlook.com
 ([fe80::6d95:9938:bff0:cd99]) by LV0PR12MB999069.namprd12.prod.outlook.com
 ([fe80::6d95:9938:bff0:cd99%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:08:21 +0000
Message-ID: <5bc23748-c6b5-4c8a-8680-a8b85ac56881@amd.com>
Date: Mon, 28 Sep 2026 21:38:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] EDAC/amd64: Set zn_regs_v2 for all Family 1Ah models
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260925172639.97063-1-Vishal.Badole@amd.com>
 <20260925172639.97063-2-Vishal.Badole@amd.com>
 <20260928142159.GA2289128@yaz-khff2.amd.com>
Content-Language: en-US
From: "Badole, Vishal" <vishal.badole@amd.com>
In-Reply-To: <20260928142159.GA2289128@yaz-khff2.amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0338.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::16) To LV0PR12MB999069.namprd12.prod.outlook.com
 (2603:10b6:408:32a::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR12MB999069:EE_|MN0PR12MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: 44a9f7ff-a5e4-42c1-b2e1-08df1d7ab751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	epOdpbVCoQMXhfSXyKTDaH7wOecMEEPzzF+P6SrnBvLI6p758S3Jjqe35c6DkQPn0wy5JG0OJvOqMrfWyeLpef994DEVDBauEGbEHNeZ/cX4CZ6UMvkeuSOjmJGwWJCI+qCP38F7BsRDgDMFXGakknPnPTiGA+XNx47QE8vstDLLJHzJFP3y+LGmTwfxXEES8cuQijdCC1OB4fZHdBqV11qv5kjLbVoonk/Y9Qjbn9Px491jcbm7UEL0mYmfSuniflUjCHau7/NBueTXPbvlxceeTwW3XbEUX2JTEe4sw31laWcBoNz4akKr/IvqgymlaZWPWcd0wvUfdTBZAu9zqIV7XjwBGXGzaPTv/VlS6PMEehQW3eIb9eq8itaibz4NT/0/iDT2hOI5pS1SGaXmtk2eOB1F7eSVN8l01ONjls1CdGTmQzyTdacZCsrHg3dIvLtUvKT85HdBIx1ss7fwU8DMgu6awsuNIVzg4Qq08BNmHq05JYA9beiUfz2pNiqX9DxgrjEcfho/SqLUAZ6+PvoBQ3p97VuICExf05RaG7/uW3WDy30UCsgH0g/36AHdwTJezTEYnR/O/59FoEjEdToIpzaJE32e0Ur4iEWJu+R3GCBJCFKwZap6bXhaFHxpHf6irwA8LoYFBko2N9BhUMqaTSplRI8Qazle+IeVTkE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV0PR12MB999069.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K20zL1UrdWROQVBTRnpqeENWL3VzSnZ6Tzc2OTlReURVeDdnUWVFeW1OZTBT?=
 =?utf-8?B?RFlFY1RVelRwc3hNU2dzN2RnZEtqU2J2OVpNOHo4bndpKzR6SmV5dE1NbkFh?=
 =?utf-8?B?Z3Ntamc0TWxrdy8yR2hXUjFnMFU0RnJHRHB4WmdKbUg3ZEsvSStqSmIzSkk3?=
 =?utf-8?B?R3QvS3JHNHAvbVBlKzY0Rmlwa0VtbDBPekFSdmIwVFRLN1VtTUhkYXhxRFJl?=
 =?utf-8?B?S25vcFJvcFNwWEZzamdxaHZKK1gxVWx3blhkTnQrK2tmcExGZ0k4QTJwNW1T?=
 =?utf-8?B?OExXVTg5V3VvKzNseUZZQ0hWQ2piZEVQSWZ6OEF3MjMwbmxpNnE4ZGE3UzFD?=
 =?utf-8?B?aWRYMThtUzkrUXBOQXhzNE9OczR3b3Z5dHA2cDFzWkhiZDdwM2J3U1FuY29i?=
 =?utf-8?B?WmNlaERSTTF3eWZTRitUYndoVms0VzBoRzB1bWlPR3ZqMXl0TjRDME9jMUdr?=
 =?utf-8?B?SjQvV2xVRHRneERvNzByMU9LdURCZkQzMTMra0ltc0tEOUhvaXh4ZkxiTmlI?=
 =?utf-8?B?a3BXVG53bHFteFM3MWZybEIvd1hrS0hWQnhtbXhRWkorWDRNZFZnVE1RcTN1?=
 =?utf-8?B?LyttekpqL3UvclQyU1VSNHhsT0d0aUR3TmtMNUkvRGViTFpvaU5sYW0zVlFF?=
 =?utf-8?B?M2FYSUVmcGR6a0o3cnlWNVNRYWpmNEJKM1BlbTJkSGxuYUN3dk4wMmtja3RS?=
 =?utf-8?B?S0RaNVRYMGFlWjdSam1aNFV1WnRlTFR2Y2ZOM3hJTUo0R2EvbVczTnVTWE1z?=
 =?utf-8?B?MHZXNmNDZU5tbnBtZTIrRmZoTS96aHFlWE56YWJ6UFVmcEtJUUJ0OWFubm1B?=
 =?utf-8?B?Ry94TjEzTm9sNTNMc2NOdW01ek51S29VazJQMksxTzI4TmtoQkJLS1c3c2ph?=
 =?utf-8?B?NFJJNW5lSWpXUjE3S3VBMTlSSE1hbkdYbUppREdIRlh0NFdBUWxQZS9QYlM1?=
 =?utf-8?B?eTRiWFNjQTNobHpqSHdKVU9hazVoZTVXT3NRYXkyQWsvT1dWMlBLR25pMWV6?=
 =?utf-8?B?bHFMb3JrYm9pb0x4L0NWaFNuaXNVZFB6UENHNzRXVGRRZUtmdE1Kbm5HVGEy?=
 =?utf-8?B?M3p0SmQrcFJHRTB3UzNQMVlzcndKZkxKYXNESTI4ZGtKUHhPaHBXT3dJSC9X?=
 =?utf-8?B?amthS1l6RmlySDFZSmlmWDBwMHpvdVpzRi9DY09VZjRjWC9JT1pDOGNFOU1o?=
 =?utf-8?B?Yk9NcjFVWllDRUwvbERpcjBydDVaQzd5V2crOVdic2FCOEEwc0dlTTBkTzdU?=
 =?utf-8?B?THA0NXhuMWQ1MlEzU1ZuYWJza0txbS84VVZnQVlDSnl2QlNNdEF2Y3pIL1Vi?=
 =?utf-8?B?Ty9VQmEzZkpVRWw5QXp6VnBzYkQrbEFSdTRoTTIrdFlYaHpWL1YzUUlrTU5E?=
 =?utf-8?B?ZmFOdXNkQUtlUWZDY0wzeUtmR25iSm1XTXdrd0ZBelc3ajF0QjFGeTJjOHN4?=
 =?utf-8?B?RVd1OG56cm9JMHpiM0V0YkpITWpXV0FaVm41VlA0dzVGbTBXdTMwYUM1ZHRZ?=
 =?utf-8?B?VFhNYlB3YUx0N1IrSmFIR1FwMUlFc05Oc2RoVXJDcDNzNU12Q2drZ0NGQmg0?=
 =?utf-8?B?MkM4OUUyYXNUeFRGOW1CNGVQSTJxOFU2d0Rwa0RrY21kYmhqV0xoN3ZiMWJS?=
 =?utf-8?B?MmhxYjhaZ082aGtqVnpqdE9pT2F0MStaeGo3WFNLSzlCNUY5UUR5Y2p2QklU?=
 =?utf-8?B?TUo2TmtLZUdtSUdWdURqa3VUaCtuQjlSc0dSd0Y1QmVxQnJzY2x6VjVjT01p?=
 =?utf-8?B?L3FVaXhUbS9hdlBkRjF2SDJvdGFmSDRXRkQxZEZPVTNPcVZhQWhCOXA2YjlL?=
 =?utf-8?B?WlRVZ0RZeER4b3V2bWFtaXMvZjlmMzhycFV3VTM2SkpiNzAwNUYzYnFwSGp5?=
 =?utf-8?B?dkZ3VjJQMjhILzNwSTg5a2pMMGhQTklQUEhLTElrL2N3bnZiWmFCZHJ4UGNt?=
 =?utf-8?B?UE5GQUJ6SENWdnpvdkRNQmp6VWV4NHAvRWczTU1hVXhQR2VYUDg3VHhOd3NW?=
 =?utf-8?B?aHNaeCtaaDdYUnJ3ZnpLSTJSS21rUURzUDc5K25xekh5YjBhcW5wcy9mV0cz?=
 =?utf-8?B?Z0VSQlhiYStQSjNlZU5JLzN5VGpySFNzOFJRMXVzOFRzekl3cWtJMWFxcGhm?=
 =?utf-8?B?ZFh3Z2FWREMrUktWNHN5OS8vakVTcGdWU3N0Rlh1L0tkUHVGYit6eWF2cWh1?=
 =?utf-8?B?b2syNDg5UzkzTi9DNFhPNm9Jb2xwdHFla2pEc0FsM2xFYU42b25JeDZJS25R?=
 =?utf-8?B?cVd3VC91YWVYYlhlRlpxVkZORmtxNndzR2JoTUhRWUFBRVNQMnFzbnhXaklZ?=
 =?utf-8?B?aXlMbjNxa2pFK1pOTU11TVBFUVROOUc1Nnkrc1ZFZWZJVzdjS3VkQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a9f7ff-a5e4-42c1-b2e1-08df1d7ab751
X-MS-Exchange-CrossTenant-AuthSource: LV0PR12MB999069.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:08:21.2043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2K9cKfL5KS5vq7ozzKOww//4NHUVMM6Hn5wu/l9pqPku/kMiL35VDEyYtqfOOV9XaZ19TnNKhP2/HQdQfRETSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6247



On 9/28/2026 7:51 PM, Yazen Ghannam wrote:
> On Fri, Sep 25, 2026 at 10:56:38PM +0530, Vishal Badole wrote:
>> The v2 register layout applies to every Family 1Ah model, but
>> zn_regs_v2 is set individually in each model case of the switch. All
>> currently supported models set it, so this is not a live bug; however a
>> model added later without its own case, or in a case that omits the
>> assignment, would read the UMC registers at the wrong offsets.
> 
> This parapragh should be simpler. Also, please avoid using long, run-on,
> compound sentences.
> 
Sure, I will update it in next patch revision.>>
>> Set zn_regs_v2 once at the Family 1Ah level so it applies to all models
>> uniformly, and drop the per-model assignments.
>>
>> No functional change intended.
>>
>> Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
>> Signed-off-by: Vishal Badole <Vishal.Badole@amd.com>
>> ---
>>   drivers/edac/amd64_edac.c | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
>> index 475235c402e8..cab696be4f07 100644
>> --- a/drivers/edac/amd64_edac.c
>> +++ b/drivers/edac/amd64_edac.c
>> @@ -3887,23 +3887,19 @@ static int per_family_init(struct amd64_pvt *pvt)
>>   		break;
>>   
>>   	case 0x1A:
>> +		pvt->flags.zn_regs_v2   = 1;
>> +
>>   		switch (pvt->model) {
>>   		case 0x00 ... 0x1f:
>>   			pvt->max_mcs            = 12;
>> -			pvt->flags.zn_regs_v2   = 1;
>> -			break;
>> -		case 0x40 ... 0x4f:
>> -			pvt->flags.zn_regs_v2   = 1;
>>   			break;
>>   		case 0x50 ... 0x57:
>>   		case 0xc0 ... 0xc7:
>>   			pvt->max_mcs            = 16;
>> -			pvt->flags.zn_regs_v2   = 1;
>>   			break;
>>   		case 0x90 ... 0x9f:
>>   		case 0xa0 ... 0xaf:
>>   			pvt->max_mcs            = 8;
>> -			pvt->flags.zn_regs_v2   = 1;
>>   			break;
>>   		}
>>   		break;
>> -- 
> 
> Otherwise, looks good to me.
> 
> Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> 
> Thanks,
> Yazen

