Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012023.outbound.protection.outlook.com [52.101.53.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B11C40F743;
	Tue,  6 Oct 2026 12:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791290146; cv=fail; b=lPHU7XbRjB9fg4lObXgr760yuQzc23CJVTgemYy3yWA8bNn2qFMG3qOCyd4yyT7nsUMdycW3WHAI7CQ9pPJKX2w2KIPHTIDlMXS4GMwKRjtEsvKnmlUwyeJWijJ8AU7LUQuomNX5H1Xo+4nBblm27raJm6+S5PCQ3uZcOMARu6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791290146; c=relaxed/simple;
	bh=HIXKFpec/3yMGAXCuph0bbDy7lTNPUHblQoCRuJcJoY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fz7Sh7LcE/cYvbEaGlMxlQr11AgRnBJ2q8jh5rFWrj43w5bVxaWu4KO46wkcat/ouq4WiT+gdg7EG69flOQ87oBkx2amCWKkqNTGVVKNrowTpuYYesY6RiInpm6ZRsn4MAkYBeI6Bteigbb9r9yaLtr3llkiu5KSSWxvLCAgJQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SOlLjMc0; arc=fail smtp.client-ip=52.101.53.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SOlLjMc0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBYLJ8lU+/+mTRF+FC4yWCgr1CEmSv4PBmM1RSEGtohI5hDBGSeKwmotUcxhWqElTJtiY+jbxB6tNBwyRc5jZ24bULrxm+I8R37DFvKnPnMcnWz86CmeqQil32ADu+VOAYUEB+Thqjigy01E/QczB+YZh30GGgJYg/H9Zk+h/qSJP60gW62cl/RrOJJbeH8/Yib04vLXRuO00kv4yzSySzXxhH7lrcxTTILSA1+Lq5VSVkqHCoE83enJAdMddxTEctsx6v+mB9lAn1LuaFMF9kdIvqEHVGwHp1aY8lPBzZnBwPq4FlUqorznOLSC9++/gfg8FsF6DKlun8rBELRhfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Ei7N7m2Nb7M9ZIxFAIei4ZZAhfW87KxNEiKBRzZMEo=;
 b=FuxIGnk2T5wz9fMGZG7ArYKa5G/bANwb/4IMPj9hNaDNpqA8XdkSCa+GbQdxB7Q60KZHO4bihnoTqd+DERUFBlkU9FqzMgxZkBDTdZ12G2seUpMBC+o1mQN2r3tmCXht/dgqSowjH05GWDqlyHxzPrcne+RbI9aUYj8MYYg2Q5H+amvnZjoE3vBRMDdajtNavFXPLFg72zOfX2vSHDUt4Nl3DRZnaf1Qqjp9rafdhC4Sbrp0XXZHu/uT+YRo2JE8vewezFD+4ikgfDvcVZGIQhG0mGyQgYnWjziNIkMFirY+3chgWYM5Bzv8lJBU36d0j24KX8hpi5R9mbS10WeV5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ei7N7m2Nb7M9ZIxFAIei4ZZAhfW87KxNEiKBRzZMEo=;
 b=SOlLjMc0B+PJHDZudyK79DbWMki7V+ZsLLnwqPz1JMgDCEIrWmXh3sBGDYOeDPjQTTG6WgAcq8qdrecgVYPkKLPhXrpNa4n+84grsaj9snjVnYMX7W/7MXmFCsIROMnv7fdSZQqcVm2YtmlkB7XIrCzap/5JA8hYcWISuH6doAI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13)
 by DM4PR12MB5964.namprd12.prod.outlook.com (2603:10b6:8:6b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.20; Tue, 6 Oct 2026 12:35:24 +0000
Received: from IA1PR12MB8408.namprd12.prod.outlook.com
 ([fe80::10cf:64f0:2de6:e466]) by IA1PR12MB8408.namprd12.prod.outlook.com
 ([fe80::10cf:64f0:2de6:e466%7]) with mapi id 15.21.0451.022; Tue, 6 Oct 2026
 12:35:24 +0000
Message-ID: <44e2c06b-7742-47a7-b2fa-2284867d4f32@amd.com>
Date: Tue, 6 Oct 2026 18:05:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: master: dw: Clamp GETMRL/GETMWL to controller FIFO
 limits
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Shubham Patil <shubhamsanjay.patil@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 meaganlloyd@linux.microsoft.com, git@amd.com
References: <20260908102724.3232660-1-shubhamsanjay.patil@amd.com>
 <aqL4HaQ1gjeaJYUQ@lizhi-Precision-Tower-5810>
 <eff031f6-e212-43a8-98c0-5f52a4b9317b@amd.com>
 <arVBZ0j2noe0g0Wi@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: "Patil, Shubham Sanjay" <shubpati@amd.com>
In-Reply-To: <arVBZ0j2noe0g0Wi@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0139.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::9) To IA1PR12MB8408.namprd12.prod.outlook.com
 (2603:10b6:208:3db::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8408:EE_|DM4PR12MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: caf384de-dac0-4d7a-94c1-08df23a64af9
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|5023799004|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	z9l9IhSwOYUn4EY/8DOE29ep/+DiH0NwGrp5ZRq0aCbzvWxe7nIKXe2DrRStoTGNYr/YegCFhkHA9eSarE5FFe5OWSh/d6Apm2CiSqYHLs9mxVo4fzFyYQ9y9roUTlRJya45msNokEcj9q2AFBJi/cO5WX29msaMnQ/dRYOPibYdx47r2iYa/3Chhv8JaN6Xe8nLU+0+XurxboAMSRY/XfwIo1e1krUPRdOGw4ydgZCZ3kPDbdi1hAsZywvCK47hZvVNP+qrWmnW5FOGQYXTXUj1Fq7183ylGdIXTbi97fO3poLkf/d2tFUstk3JVEbdIeyK5WsWFYz4+W9D/NXdDLI/FCymJnfz8b03vPMwTCOply36fjn+yVWEi5VImfEdGklngUCFcvB2A/Sue70DUz+P5OHGzLeGVbiQrkjoz89EsF643gxlezC3dfgLLldL/pnxzdfKK4q/4wWb6QLio4Sc5fdzdmfwFaOUvoWwxV26WmHYQC6giYWuqrhMKkLcOAHZD5WaIjjTkYK6pU+rqXEQTAISyIoHw6cagdzxjQwPMA5e5+F10+yo/ImHxHQMmuhIf4SPqnJVl/HvBCzCunx5+Kgmt2rZbOZu+DIqB0ysRulLzQ+fbS2xxaZH5zgk/BDInwhJSTTDhet6I7k91v5FdftTZ07qOyESTEB43hs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8408.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(5023799004)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGlFNUVZTHNBUEFMeEQwd2YzZFc3czNnclU4ejd0SElHVFFxOWkweFVHbzJX?=
 =?utf-8?B?RXl4Uzk1YlBTS3FUSzlYQmNXMmNCZFppTGE2bWhaQ1p6TWE4Q3ErNFQxMFZK?=
 =?utf-8?B?dnBURG1SNEZYVjl0VWZqbGJFMnF4VVJhSXFPd3pMOFo0K3RmWnh5eXlEMXNI?=
 =?utf-8?B?MmlHaU82MmhUVFJTemtvM09aZTFHNlJQV25FblBPV3VuZldUai9ycm92T1RG?=
 =?utf-8?B?SGdXMWVVc1N4Um1yQk9mS2lsS1BTNWJ0cCt3V2hIOTBaL1ZnZGlqelFtQldU?=
 =?utf-8?B?N1o1cHpBUjhnQ2hoZVJUQ1VoMG5pVUVkTzcrczN3aXY4bm1Xblp1a0Zjck1z?=
 =?utf-8?B?ZU9wWlRMTFpOYzRidnhwT0YrU0VIdTRaZlo1TTYwZjJCb1J6Q3VSeEM1czFD?=
 =?utf-8?B?VlRvRkFlK1R2Q2ZiTkU2Mm1mYmRRVEpLckdZa1FhbW9xUm9XbDJid2FoVWpN?=
 =?utf-8?B?VHpZN1V2R29GVTFXekovTHdpSUdxWm5acjE1Mmg3QlQwNUQ4ZGRkODBGSUlJ?=
 =?utf-8?B?OW5tcUVPdjJTNFA1bHhabWt4clNUM2NUSU9sV0FPZUFVcTVGdjdwbEx4dVlN?=
 =?utf-8?B?THpJMXlWRUo3UzJ3aDRpeERvSGdwcXd6bnNQOGNEV0dBU01MR3c5RkxMWDMw?=
 =?utf-8?B?SFArTDBDbnBvdXN1aituOEIzVnRRQ256ZEN4aFJxZTRLVHFiTHZQTTdpQjYw?=
 =?utf-8?B?QUdXWU1MRzY5ejdmY1YvRUJlcnhJMFhhYTZaYUpsTHd3QUhtbXJjVG9DNDZN?=
 =?utf-8?B?L3grSHl5UDRvZ0ltTEZzVW91M3duZUlheGJtT3BXL2d3NEdSMTBOQ1MrVG9q?=
 =?utf-8?B?Vk1XeXZIcXk0MWRaeXpwL3FRdUpnSTh6ZGwwQUUzV0UrQXM3TXplUkNJcTQ1?=
 =?utf-8?B?MUZuRTBVdmJDSzlEcTNZMkVTOGdOK3B0WklZaTF6VjlWMUFzdkpGWmNwa0lU?=
 =?utf-8?B?VWZJaGZMS0x2cDRwZjhrVHQ1TjUzTlhHK29TUm5wVDRjb0FJemVUVGtXWjNa?=
 =?utf-8?B?UWpKMXVXcjVEalBXYmNnRmlOVi93L3dubUNUWWlSTWxHcnpqemFFeU5ZclFX?=
 =?utf-8?B?NjlFZzJvZjRXbzIvTWo5aE55RUE4TFpRMTlvQmZpSENwZ0xiMkxoTGVpMVZS?=
 =?utf-8?B?WGQ1aXhJcEdqSCtxcmRIazIvcWF3L1I4cFQwdGY5TFJIa29RNzFoLzJnNEQ1?=
 =?utf-8?B?cjgvQjJSd1lBS0N4MXVyVHRaTkEydCtXaG9zSDRVUVJtYnIzWVZKL2NCS0dS?=
 =?utf-8?B?blRRYkZLOFhGeW5pc2xmQnVQLzNLSXh2aU9wVENGbGg3Y2xFOTZiOVJOQjhF?=
 =?utf-8?B?NUIxLzdQRldMaExhYlAxTmRIWTBmZlo4MTQ2MzJ6UFdMUklwS1NqNHhJbW9t?=
 =?utf-8?B?VzFNRUhwcXlFSUdjcldqWXg4WmEyNTJTNHQ5SWd0M3dYUk1kNCsweTlCYzdp?=
 =?utf-8?B?cmFqd3RmVXNQQjlIVHIzQ29MRTJPdExpL1BQZEh3aGZLN3psR3pzUGc4anlH?=
 =?utf-8?B?U3V6bXVqZ1dLWnJPSDk1S0JHOWpCYU1BL3RBbG9ZenNmWWdBWElEMld2TDFV?=
 =?utf-8?B?SE5sRytCOEVPcFRXMnJILzhQWFJlaTkrU2VJTE00a1BYc0g3ZlgyVlJ1NTZ5?=
 =?utf-8?B?S1FMRFNiQ2J1OEk5eVVQcFZiKys0SkNCNm9keHBoSmY3VWQvTjM5enBjaUNT?=
 =?utf-8?B?dDZTU09sanRWQ3pCbGtBcXYxWW9DK3pDQ0laSTJZVDJwTU9MQmF3azV0NVdi?=
 =?utf-8?B?Zm9yN2NmYVl5czhnRExoK0hlMlUwN3o3bnRGdXhOM28rZitNUmdKWnp1Mmpw?=
 =?utf-8?B?NktEc1BFSy9KckQ0RzFSQzdzRzZEcUd3ZHRSeTNEcThEbFVlT2w0V0Q2Y3k1?=
 =?utf-8?B?M3hBUGVRVzVkRGdPbENLMEJ0cnpoQWZEbWsraGsyZW5XV2l4clRMMWlYQXV1?=
 =?utf-8?B?eWFEc3JBRm5hTTd0ZE1LdkMybUJsVXJHZEJkRFNsSkE2Y2hSVzdzaVNnWEtU?=
 =?utf-8?B?M1Z6VXpDeXhpRUIwdyt1UVhTL3ViYjJTY1pmV1N6LzdVQUkwbGZxK3oyMWZ4?=
 =?utf-8?B?M3hMOWhTMVFsMlF3dHl6aEtDNGkxSk5qUHNzb3FJb2ZOQXpFOGZFM1RjVWZt?=
 =?utf-8?B?L0YxU1cyNUdGMWFUWlFFMSs1NVZoaTdCY1UxdURwVXYwVklVcWV5blJ6Q2No?=
 =?utf-8?B?NnZVZmViMWxNQVg5cnpmelFvdjBRQWJDd0FWL1hzMWUzeGZxNUdZNHAzRHpG?=
 =?utf-8?B?aEd0Z05ZK2NuLzg4K3laVHBxSUZhc1ZUQXMyMktubHJWWEsvVW45dUJIR3pV?=
 =?utf-8?B?WUpUSHVwN1M0bDM2ZGdieTdSRFBHenJkQlN1OW5DSVVWNlA2OE8rZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caf384de-dac0-4d7a-94c1-08df23a64af9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8408.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:35:24.3296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bdb9zZkRZL36GCQEeUSafVKY1ewOYnb8rjVP3ATMiSAchoj598W1OYJ0UHehoem3wInn+3clu3n1wdCPUQ8QtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5964

On 9/24/2026 8:57 PM, Frank Li wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Thu, Sep 24, 2026 at 10:25:44AM +0530, Patil, Shubham Sanjay wrote:
>>
>>
>> On 9/11/2026 12:04 AM, Frank Li wrote:
>>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>>
>>>
>>> On Tue, Sep 08, 2026 at 03:57:24PM +0530, Shubham Patil wrote:
>>>> The DW master rejects private SDR transfers larger than
>>>> caps.datafifodepth with -EOPNOTSUPP. Targets often report MRL/MWL
>>>> values larger than that FIFO, so the core stores limits the controller
>>>> cannot meet.
>>>>
>>>> After a successful GETMRL/GETMWL, issue Direct SETMRL/SETMWL to the
>>>> same target with lengths capped to the data FIFO (in bytes), then
>>>> rewrite the GET payload so the core keeps the same values. Only update
>>>> the GET buffer once SET is acked, so a failed SET does not leave the
>>>> core and the target disagreeing.
>>>
>>> I think i3c device driver should know these information choose
>>> min value dring each xfer. even though you set devcie's MRL/MXL, device
>>> driver still issue a longer transfer.
>>>
>>> Frank
>>
>> Understood - I will drop the SETMRL/SETMWL and stop rewriting the GET
>> payload, and instead expose the controller limit so the min is taken
>> per transfer. Two questions on how you want that done:
>> 1) Where should the min be taken?
>>     a) In the core: the controller driver sets max_read_len /
>>        max_write_len / max_ibi_len in struct i3c_master_controller, and
>>        the core caps i3c_device_info to min(target, controller) after
>>        GETMRL/GETMWL. Device drivers then use i3c_device_get_info()
>>        as-is and cannot forget.
>>     b) In each device driver: the core keeps reporting the raw target
>>        values, and drivers do the min themselves.
> 
> We can provide APIs for device driver to get whole data path required
> max_read/write_len.

Thanks. Next v2 will be:

Patch 1 - core: add max_read_len/max_write_len to struct
i3c_master_controller, set by the controller driver before
i3c_master_register(), plus two helpers for client drivers:
	u16 i3c_device_get_max_read_len(const struct i3c_device *dev);
	u16 i3c_device_get_max_write_len(const struct i3c_device *dev);

Each returns the smallest limit along the whole data path, i.e.
min_not_zero() of the target's GETMRL/GETMWL value and the controller
limit, and U16_MAX when nothing limits it. i3c_device_info keeps the raw
target values untouched.

Patch 2 - dw: advertise the data FIFO depth to the core, by setting
base.max_read_len/base.max_write_len in dw_i3c_common_probe() before
i3c_master_register().

Thanks,
Shubham

> 
>> 2) Either way, a driver that ignores these limits still gets
>>     -EOPNOTSUPP from dw_i3c_master_i3c_xfers() when the transfer does
>>     not fit the data FIFO. Should the driver keep returning that, or
>>     would you consider splitting an oversized private SDR transfer into
>>     FIFO-sized chunks in the controller driver? My understanding is
>>     no - splitting changes what the target sees on the bus - but I
>>     want to be sure before v2.
> 
> the decision about split transfer should be decided by device drivers.
> Not all device treat two continue repeat START as continue write/read.
> 
> Frank
>>
>> Thanks,
>> Shubham>
>>>>
>>>> GETMRL is variable length: the optional third byte is max IBI payload
>>>> and is only present if the target returned it. Clamp that IBI byte to
>>>> the IBI queue depth from QUEUE_SIZE_CAPABILITY.IBI_BUF_SIZE (bits 19:16
>>>> at 0xe8, encoded as 2^(n+1) dwords).
>>>>
>>>> Rename the unused EXTENDED_CAPABILITY macro at 0xe8 to the databook
>>>> name QUEUE_SIZE_CAPABILITY.
>>>>
>>>> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
>>>> ---
>>>>    drivers/i3c/master/dw-i3c-master.c | 149 ++++++++++++++++++++++++++++-
>>>>    drivers/i3c/master/dw-i3c-master.h |   1 +
>>>>    2 files changed, 149 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
>>>> index 4563d8761ba0..51defcb57761 100644
>>>> --- a/drivers/i3c/master/dw-i3c-master.c
>>>> +++ b/drivers/i3c/master/dw-i3c-master.c
>>>> @@ -203,7 +203,13 @@
>>>>    #define BUS_IDLE_TIMING                      0xd8
>>>>    #define I3C_VER_ID                   0xe0
>>>>    #define I3C_VER_TYPE                 0xe4
>>>> -#define EXTENDED_CAPABILITY          0xe8
>>>> +#define QUEUE_SIZE_CAPABILITY                0xe8
>>>> +#define QUEUE_SIZE_CAPABILITY_IBI_BUF(x)     (((x) & GENMASK(19, 16)) >> 16)
>>>> +/*
>>>> + * IBI_BUF_SIZE is encoded as 2^(field + 1) dwords: the smallest buffer is
>>>> + * 2 dwords and each increment of the field doubles the depth.
>>>> + */
>>>> +#define QUEUE_SIZE_IBI_BUF_MIN_DWORDS        2
>>>>    #define SLAVE_CONFIG                 0xec
>>>>
>>>>    #define DYN_ADDR_LO_MASK GENMASK(4, 0)
>>>> @@ -844,6 +850,130 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
>>>>         return ret;
>>>>    }
>>>>
>>>> +/*
>>>> + * Cap the limits a target reported through GETMRL to what this controller can
>>>> + * actually transfer, so the core never asks for a private read the data FIFO
>>>> + * cannot hold. The optional IBI payload byte is capped to the IBI queue depth
>>>> + * instead; since that byte is a u8, the IBI cap only ever applies to
>>>> + * controllers whose IBI queue is smaller than 255 bytes.
>>>> + *
>>>> + * Direct SETMRL is optional, so a target may implement GETMRL and NACK the SET.
>>>> + * Clamp the values handed back to the core either way: a failed SET only means
>>>> + * the target keeps its own larger limit, which is harmless as long as the core
>>>> + * stays within ours.
>>>> + */
>>>> +static int dw_i3c_master_clamp_mrl(struct dw_i3c_master *master,
>>>> +                                struct i3c_ccc_cmd *ccc)
>>>> +{
>>>> +     u16 max_fifo_bytes = master->caps.datafifodepth * sizeof(u32);
>>>> +     u32 max_ibi_bytes = master->caps.ibififodepth * sizeof(u32);
>>>> +     u16 actual_len = ccc->dests[0].payload.actual_len;
>>>> +     struct i3c_ccc_cmd_dest set_dest = { };
>>>> +     struct i3c_ccc_cmd set_cmd = { };
>>>> +     struct i3c_ccc_mrl set_mrl;
>>>> +     struct i3c_ccc_mrl *mrl;
>>>> +     bool clamp_ibi = false;
>>>> +     bool clamp_read;
>>>> +     u8 ibi_len = 0;
>>>> +     u16 read_len;
>>>> +     int ret;
>>>> +
>>>> +     /* Need at least the 2-byte max read length field to act on. */
>>>> +     if (actual_len < 2)
>>>> +             return 0;
>>>> +
>>>> +     mrl = ccc->dests[0].payload.data;
>>>> +     read_len = be16_to_cpu(mrl->read_len);
>>>> +     clamp_read = read_len > max_fifo_bytes;
>>>> +
>>>> +     /* Optional third byte is valid only if the target returned it. */
>>>> +     if (actual_len > 2) {
>>>> +             ibi_len = mrl->ibi_len;
>>>> +             clamp_ibi = max_ibi_bytes && ibi_len > max_ibi_bytes;
>>>> +     }
>>>> +
>>>> +     if (!clamp_read && !clamp_ibi)
>>>> +             return 0;
>>>> +
>>>> +     set_mrl.read_len = cpu_to_be16(clamp_read ? max_fifo_bytes : read_len);
>>>> +     if (actual_len > 2)
>>>> +             set_mrl.ibi_len = clamp_ibi ? max_ibi_bytes : ibi_len;
>>>> +
>>>> +     set_dest.addr = ccc->dests[0].addr;
>>>> +     set_dest.payload.data = &set_mrl;
>>>> +     set_dest.payload.len = actual_len;
>>>> +
>>>> +     set_cmd.rnw = 0;
>>>> +     set_cmd.id = I3C_CCC_SETMRL(false);
>>>> +     set_cmd.ndests = 1;
>>>> +     set_cmd.dests = &set_dest;
>>>> +
>>>> +     ret = dw_i3c_ccc_set(master, &set_cmd);
>>>> +     if (ret)
>>>> +             dev_dbg(&master->base.dev,
>>>> +                     "SETMRL not accepted by target: %d\n", ret);
>>>> +
>>>> +     if (clamp_read) {
>>>> +             mrl->read_len = cpu_to_be16(max_fifo_bytes);
>>>> +             dev_dbg(&master->base.dev,
>>>> +                     "clamped target MRL from %u to %u bytes (FIFO depth limit)\n",
>>>> +                     read_len, max_fifo_bytes);
>>>> +     }
>>>> +     if (clamp_ibi) {
>>>> +             mrl->ibi_len = max_ibi_bytes;
>>>> +             dev_dbg(&master->base.dev,
>>>> +                     "clamped target IBI len from %u to %u bytes (IBI buffer limit)\n",
>>>> +                     ibi_len, max_ibi_bytes);
>>>> +     }
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +/* Same contract as dw_i3c_master_clamp_mrl(), for the write direction. */
>>>> +static int dw_i3c_master_clamp_mwl(struct dw_i3c_master *master,
>>>> +                                struct i3c_ccc_cmd *ccc)
>>>> +{
>>>> +     u16 max_fifo_bytes = master->caps.datafifodepth * sizeof(u32);
>>>> +     struct i3c_ccc_cmd_dest set_dest = { };
>>>> +     struct i3c_ccc_cmd set_cmd = { };
>>>> +     struct i3c_ccc_mwl set_mwl;
>>>> +     struct i3c_ccc_mwl *mwl;
>>>> +     u16 write_len;
>>>> +     int ret;
>>>> +
>>>> +     if (ccc->dests[0].payload.actual_len < 2)
>>>> +             return 0;
>>>> +
>>>> +     mwl = ccc->dests[0].payload.data;
>>>> +     write_len = be16_to_cpu(mwl->len);
>>>> +
>>>> +     if (write_len <= max_fifo_bytes)
>>>> +             return 0;
>>>> +
>>>> +     set_mwl.len = cpu_to_be16(max_fifo_bytes);
>>>> +
>>>> +     set_dest.addr = ccc->dests[0].addr;
>>>> +     set_dest.payload.data = &set_mwl;
>>>> +     set_dest.payload.len = sizeof(set_mwl);
>>>> +
>>>> +     set_cmd.rnw = 0;
>>>> +     set_cmd.id = I3C_CCC_SETMWL(false);
>>>> +     set_cmd.ndests = 1;
>>>> +     set_cmd.dests = &set_dest;
>>>> +
>>>> +     ret = dw_i3c_ccc_set(master, &set_cmd);
>>>> +     if (ret)
>>>> +             dev_dbg(&master->base.dev,
>>>> +                     "SETMWL not accepted by target: %d\n", ret);
>>>> +
>>>> +     mwl->len = cpu_to_be16(max_fifo_bytes);
>>>> +     dev_dbg(&master->base.dev,
>>>> +             "clamped target MWL from %u to %u bytes (FIFO depth limit)\n",
>>>> +             write_len, max_fifo_bytes);
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>>    static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>>>>                                       struct i3c_ccc_cmd *ccc)
>>>>    {
>>>> @@ -866,6 +996,18 @@ static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>>>>         else
>>>>                 ret = dw_i3c_ccc_set(master, ccc);
>>>>
>>>> +     /*
>>>> +      * Clamp GETMRL/GETMWL responses to the data FIFO depth, and the
>>>> +      * optional GETMRL IBI byte to the IBI queue depth. The GET itself has
>>>> +      * already succeeded, so its result is never overridden here.
>>>> +      */
>>>> +     if (!ret && ccc->rnw) {
>>>> +             if (ccc->id == I3C_CCC_GETMRL)
>>>> +                     dw_i3c_master_clamp_mrl(master, ccc);
>>>> +             else if (ccc->id == I3C_CCC_GETMWL)
>>>> +                     dw_i3c_master_clamp_mwl(master, ccc);
>>>> +     }
>>>> +
>>>>         pm_runtime_put_autosuspend(master->dev);
>>>>         return ret;
>>>>    }
>>>> @@ -1728,6 +1870,11 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>>>>         ret = readl(master->regs + DATA_BUFFER_STATUS_LEVEL);
>>>>         master->caps.datafifodepth = DATA_BUFFER_STATUS_LEVEL_TX(ret);
>>>>
>>>> +     /* Read the IBI data buffer size advertised by the controller. */
>>>> +     ret = readl(master->regs + QUEUE_SIZE_CAPABILITY);
>>>> +     master->caps.ibififodepth = QUEUE_SIZE_IBI_BUF_MIN_DWORDS <<
>>>> +                                 QUEUE_SIZE_CAPABILITY_IBI_BUF(ret);
>>>> +
>>>>         ret = readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
>>>>         master->datstartaddr = ret;
>>>>         master->maxdevs = ret >> 16;
>>>> diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
>>>> index 17ad817d1f8e..54c3912374c8 100644
>>>> --- a/drivers/i3c/master/dw-i3c-master.h
>>>> +++ b/drivers/i3c/master/dw-i3c-master.h
>>>> @@ -15,6 +15,7 @@
>>>>    struct dw_i3c_master_caps {
>>>>         u8 cmdfifodepth;
>>>>         u8 datafifodepth;
>>>> +     u32 ibififodepth;
>>>>    };
>>>>
>>>>    struct dw_i3c_dat_entry {
>>>> --
>>>> 2.34.1
>>>>
>>

