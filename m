Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011021.outbound.protection.outlook.com [52.101.62.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B6D313547;
	Thu, 24 Sep 2026 04:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790225767; cv=fail; b=NcOQX45BI8HvmZ9LGELnZJzsMscN6ah9ptXsv7SgQnxH4Dj0cFJ5waX1A0SXxC6LYf7dHO6UkL47TWPtOie8ptVDV+XZrjhfPXK2qPUIRlTN/qqmCb3d1hLP5iKT936gQjy4/0tVgu6sWqTVrvplrjobJj2GfmhVexZBhbazpf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790225767; c=relaxed/simple;
	bh=sEPgRjzjLbHk72ckK25A3GbtKxBvr6ndvz4/c/HdBNk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uxS8mnAKNpddSFRFhd8RboGtke+Fgt+U96uFGjxhzaDxyTFH9xTkAt1Nhk6BObjcss3rnsJpbPeXS2lyR5DjCf4cQovXWl5Vqn6C7T5eErFxomH1z2aJqCKX66HGPNIQuNIcLtSfcm4lN8gRz6u23dyi7yxgmWbu8VwrEvSGq3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JXmlgxkX; arc=fail smtp.client-ip=52.101.62.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JXmlgxkX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcpEUF1y5cOjhqHuU6Z0RE499yM7SGena1ZIdXaXOCXjZsbnFFYTWpXm8ENJapOffzkfZ6yUd7yQSmhIBKTB+IPi9AAWH7V0Nn1Gtc99AbJujF1FwPIT/jsjkUByhczwJhibH/sBDQpvjbwQMk/jAIPJDQA+eF7jDO/d2XQ5bzyRBAQrUUvXhTOQ7cRPEEX0374I7/kRjbp50faIBahRDzKVIazzFouWRZrPGTa5JfXMf78SXkWt9Aar4X0FOhtxEJbmzcFvDJnp37LogBitj+zCfvF0Xpvuj8duTX/z5EXmopx3hwVH3H3azQsqpvb/E5yiK5hRHY9HIvk6Fl/dHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rue2HsbyA0mddJGD02t42c4ThRXvYzHIRZjTg9JPo6c=;
 b=GazHqZCuzqeXJE0sYrj8UQGDyH9v/6tSFMWfqWLmo8H16kmaVaFXzleMeXvb6liOmVpshzv3fttceHfV0/qyj9YdFm5kkLevXRnyeFEhKcg1LVqODULhCCBdEycfmmb5+d6ocFNwJVUD5O/Za4aOXSpfvrKeM3H1AUoz0Ez0IByNfg68TGO0Eq1O+FKlehRqAgAaAogbC9jXRDlq7CgRiSXPQHnmd04LHarWVRQPNoBd5heJw9QJ2SaNpiYT/yd5voSjlaEpomsMMwWZqGqDSJmk4rvyKiYvUWrHoq5eow6Cw87NRd9lZiYu1JtBkzFebCTy5t6x018A7xn3AgzfRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rue2HsbyA0mddJGD02t42c4ThRXvYzHIRZjTg9JPo6c=;
 b=JXmlgxkXiftFSLVvmF7t1HpNPybSyi+1O/skH/U8QbcJI/9fGwlVR8ll23i+ltAP22CUt1f6BzDV8vDjWwmqUUIOmSiyyqRhKLWfWbw3TDFu1GyPNbCZQ6zNtgL4DTMVddpsjlkfk/VMWd9tDvLzAmZLk1vvKdZRELPpFM343O8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13)
 by SJ0PR12MB8613.namprd12.prod.outlook.com (2603:10b6:a03:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 04:55:51 +0000
Received: from IA1PR12MB8408.namprd12.prod.outlook.com
 ([fe80::10cf:64f0:2de6:e466]) by IA1PR12MB8408.namprd12.prod.outlook.com
 ([fe80::10cf:64f0:2de6:e466%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 04:55:51 +0000
Message-ID: <eff031f6-e212-43a8-98c0-5f52a4b9317b@amd.com>
Date: Thu, 24 Sep 2026 10:25:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: master: dw: Clamp GETMRL/GETMWL to controller FIFO
 limits
To: Frank Li <Frank.li@oss.nxp.com>,
 Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 meaganlloyd@linux.microsoft.com, git@amd.com
References: <20260908102724.3232660-1-shubhamsanjay.patil@amd.com>
 <aqL4HaQ1gjeaJYUQ@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: "Patil, Shubham Sanjay" <shubpati@amd.com>
In-Reply-To: <aqL4HaQ1gjeaJYUQ@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::14) To IA1PR12MB8408.namprd12.prod.outlook.com
 (2603:10b6:208:3db::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8408:EE_|SJ0PR12MB8613:EE_
X-MS-Office365-Filtering-Correlation-Id: 9786d87e-6d0d-4894-aa37-08df19f81b1b
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|3023799007|11063799006|6133799003|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QtKGfMeRCqe4llMjCypr3DakUFGlzEMgBhfGccA3irvh8KLWqhCcLJNomq7QW4JF5s7MJcbTKYho6+EcplQQadmLZ41CTNpHtae0D3kvYgTl+ZsqTgmrb/0jsIP991lVGKnOS9dF47//WPIwKCTD/EtHWszLV53BfF2zOu5+jG2DQfSYRiAIKc66Ol3G8rwrKGwOznaNza1fDkzyMOjQhhui6J3PtNmNxQWfQS8kuFTaqGpP8LT0CtISjwtfbmg38zCVeNOiKiVs1j4EVR+orQHv9rMcUofBbsvycB0/JlVeR6FTYbW6LpM0NKRFMqAlbvtdfL/HlcwYd7r3SsQSght9jSBKM4/9zR45ZQnLEM33R1Gq+3tyV7MRVHpXzJr1Kh7CRyjWTMGTvtXAJ8uP3bue+hgVR/FO/U/VYyB054nUkWZb//fYC+R9Ej0AJfLf/C4jTVD0/iANhkXUAAJWVX10t/0EKq5i61+fVOOPRy2ReeCXOHX6BhPOsR2XN+mktqBiIAdjSbYiew76WqcIBUJKcMf/XP+ZFAgCZOG9ZCPHmsUbNVEV1/NBmSkutuY3sZBOXHqE2mKWeRcy1AOD88MqacGozPYWeVUhoryj9RRUFUd9M/pgHzxgwwa/JoSo6VieTmPB35/83IAFRdD7pJ/R4OoMVKUR1gG0nCTq3dg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8408.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(3023799007)(11063799006)(6133799003)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTFhaXg2NXhhTUp4OWp1WWxBcTNMdFFPeE8vOExkbGdzVWdoSDJETGJjS3Jn?=
 =?utf-8?B?UW1QOGJxK2xUbXQ3eUorRDVWYUx6S0pwSTFFMnM1T20vOVJ4TmpDc0pyUGJo?=
 =?utf-8?B?UTdENzNJanNibE10RlBoVEFoYWJST2Z5am5ISGkxUkZCeEFOZEZaQ2FvR1ZT?=
 =?utf-8?B?RnFLa1VUU3NTMnBQcm9BWXRnNHhBNWZ6Wm0rQVgramF0VHMwdXVNR0lIaWRq?=
 =?utf-8?B?eUEweGY1dXJEZFU0TWFZenVGcWVKUnB0QisxV3ZrdUV5RTZQZlFISVI4bFhl?=
 =?utf-8?B?T0JWUkEzR3Flcmx1ejVlVE96WXk0cWIzRTZOSWtxbW16dzM1K28zcStLM2lH?=
 =?utf-8?B?cG9nbzV3aHVtdncwOTNITGsyYTgxU1pzNS9Ob2huYVV1NnNpakFLQmx1NVox?=
 =?utf-8?B?VFNma0hMQzFITUphZXAxZldlbC80ZmY0UHpBVzJWMzJDbUFDdEI2SmNRa0hW?=
 =?utf-8?B?cXl4blVGaHVRTGtKWTl6VFQ1Y2FYNzdhTE5MYnEyR1NNemRRbEZXTXJNMlFE?=
 =?utf-8?B?NlhjTmdCRGE5MlJ5K3lOQUxMa2NYUUJhZVNkV2V1U0xlWnJLQ2N1WkQ5emFJ?=
 =?utf-8?B?MVBtd3pJdUkzZzZzL2hiUlBDZjQzL1l1SWtsL1pKN0o2QlBwcFpLZ1Bya2Rr?=
 =?utf-8?B?ZWxjSS9aS2llaC81d1pzWEttZThEN3YvajNjMVpkakkzMTQ5b3JLWXQrblh4?=
 =?utf-8?B?Y2wvbXRNZnlYRC9Kc3JMTFdHYkc5SzJxTDZvRTVhTVZNVzZHZU8veUgrRUJF?=
 =?utf-8?B?SWpONi9lc2UzaEZueHlWQldyS1hDVzIzUTlPQU1LL2xQWkVGc0dXV0VkMHUx?=
 =?utf-8?B?NUVxNmhXZVduMTdmSzErbytlS0hXRTYvNXVZR3pRNHBtT3lnZVNnSDF0QXMy?=
 =?utf-8?B?K21DS3NYRXliRFA0dDlkVzZQTjhwZUVCRVo5QTVTWDI0K1VPcXBOVVB5aFNY?=
 =?utf-8?B?ejgxdmx4QXl2aEZmbHh5YkJ5aE52bG1PREZ2WVcrbTRZc2l3T1ZtUnppREcx?=
 =?utf-8?B?N3RlV0FrNWZVZ01pVkRXbDF6d21vL0VibHVLQ1ZtRlNTZFpNMDlYbDk2bTRX?=
 =?utf-8?B?YVliL2VNUFBGY25uYXJzc2JxbW9ic0xTeVRRcmxXY0tXck1WRTl1VG80OUF3?=
 =?utf-8?B?aFVkakQrSWl1bzBOR2hMdnpXeWZDS2o1MTBadEVSaWY3TmxVemlXeFFkQ2o3?=
 =?utf-8?B?cnRrd2FCbGNXaUpXZmpteVA5Q2s3MFBCbU5HL3BWTW5IVDZvajB6ZXBJdTJ3?=
 =?utf-8?B?bk1EdXc3TFJZcVpjTHhpR2VHdEJZZFp3eklaTDNOcmQzdGpvQXY0WHE4OS9l?=
 =?utf-8?B?bTQyTzFSSndaU1o1OFU1dlFxL29aU3BzT3dLMlYyRE5IM2ZWVm1HRm8yWHZr?=
 =?utf-8?B?Y290bVFyclBXa1NpYWxXTHpCSzdaWjRBNmJiRE9IeE8vcXdhbzNlUFF5Wk5D?=
 =?utf-8?B?MHQwQmZ5WCtCZ2pYWVVISW1nYzVzUGdsMGZ1aDdFRFpHZVhCRlhVTmRjMXFw?=
 =?utf-8?B?RVJSVFF2VjBhMjhXbjVWMDhrU2x6TENwSmpQWDloZXdlNUxwN3UwZFJOeVI2?=
 =?utf-8?B?S0NCMVlPVCtZdUV2aXhXb2RhdllpMndCRWZQb0RVMldXTGdnSFoxeHR1Y1NR?=
 =?utf-8?B?U3kxMnFaSVpKOVVqeGRqazF2cndmV3JYdHVudi9MRnNmdjU5MGZKK3pOaVNM?=
 =?utf-8?B?NUl1SC9KY3pPUVR4NzlWWGdsOVc1NmI2a1NoRFBIZWdHSmhXZ3dyMFBWTzlx?=
 =?utf-8?B?a05PY1Nhdnl5akR3ZGxrclA2M1dKNVQ1YWozWXRkQk1uMk9BMjYvb2lMbi83?=
 =?utf-8?B?cWVRZXYwaXpwRVY5RllNNGRoci82dkVJWlZYSXB4b1o2bWk4R0J1cUNpNHU3?=
 =?utf-8?B?K3JVZGdNQ0pvZGs5cGk4TWFXMStVNUE0YTcwY1kxSjQ5VWhzRXZiMTZ3QlV1?=
 =?utf-8?B?VGJxaXowQzFRMHBlYjZYYVNPU0hJZUduMU04TGZZek5ZZUl4UXlaeWwzSEhE?=
 =?utf-8?B?aGZtMkNaTnFNdXhUSWxtb0txVG9FWGFweTNBeGt1bnFVTi9yZlM3ZENWejFJ?=
 =?utf-8?B?dHp0bVpQd0JMa2dXdWUweGhjeEtjcE4rUmNzcm1vd2pDa0k3cXZ4Z3dEd2Er?=
 =?utf-8?B?YnFoTnp0S3FKMkpqVW5ZY2pKMC9EdHhvMjFSSytCOXFSWVBtVlc5Qi8yS0Qy?=
 =?utf-8?B?dDB6bTZmdlp1aXRXTGplWmt6WE5SbXVmSXAxTFBnSHZjNFg5RWJ6TTVlZ2xZ?=
 =?utf-8?B?SHJCUFFEcnZRZHVtMEdFTTJ0RDkzVlB4UFphRTdNR0NYS3p1S3VCQ1FyZmty?=
 =?utf-8?B?T0kwN2lHUGpqNUZ1NXlqQkV2dmhMQndmZTdHZk9OSlVJb3VQZ2Z3dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9786d87e-6d0d-4894-aa37-08df19f81b1b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8408.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 04:55:51.1658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O5DdIpqswvLmNkqk8HWkdrDcQlPiI4C4QiU1omQ5T5yeTBgymqfZw5P02tS2p9hitpV9CxbfHTYzoNOfM/V/EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8613



On 9/11/2026 12:04 AM, Frank Li wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Tue, Sep 08, 2026 at 03:57:24PM +0530, Shubham Patil wrote:
>> The DW master rejects private SDR transfers larger than
>> caps.datafifodepth with -EOPNOTSUPP. Targets often report MRL/MWL
>> values larger than that FIFO, so the core stores limits the controller
>> cannot meet.
>>
>> After a successful GETMRL/GETMWL, issue Direct SETMRL/SETMWL to the
>> same target with lengths capped to the data FIFO (in bytes), then
>> rewrite the GET payload so the core keeps the same values. Only update
>> the GET buffer once SET is acked, so a failed SET does not leave the
>> core and the target disagreeing.
> 
> I think i3c device driver should know these information choose
> min value dring each xfer. even though you set devcie's MRL/MXL, device
> driver still issue a longer transfer.
> 
> Frank

Understood - I will drop the SETMRL/SETMWL and stop rewriting the GET
payload, and instead expose the controller limit so the min is taken
per transfer. Two questions on how you want that done:
1) Where should the min be taken?
    a) In the core: the controller driver sets max_read_len /
       max_write_len / max_ibi_len in struct i3c_master_controller, and
       the core caps i3c_device_info to min(target, controller) after
       GETMRL/GETMWL. Device drivers then use i3c_device_get_info()
       as-is and cannot forget.
    b) In each device driver: the core keeps reporting the raw target
       values, and drivers do the min themselves.
2) Either way, a driver that ignores these limits still gets
    -EOPNOTSUPP from dw_i3c_master_i3c_xfers() when the transfer does
    not fit the data FIFO. Should the driver keep returning that, or
    would you consider splitting an oversized private SDR transfer into
    FIFO-sized chunks in the controller driver? My understanding is
    no - splitting changes what the target sees on the bus - but I
    want to be sure before v2.

Thanks,
Shubham>
>>
>> GETMRL is variable length: the optional third byte is max IBI payload
>> and is only present if the target returned it. Clamp that IBI byte to
>> the IBI queue depth from QUEUE_SIZE_CAPABILITY.IBI_BUF_SIZE (bits 19:16
>> at 0xe8, encoded as 2^(n+1) dwords).
>>
>> Rename the unused EXTENDED_CAPABILITY macro at 0xe8 to the databook
>> name QUEUE_SIZE_CAPABILITY.
>>
>> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
>> ---
>>   drivers/i3c/master/dw-i3c-master.c | 149 ++++++++++++++++++++++++++++-
>>   drivers/i3c/master/dw-i3c-master.h |   1 +
>>   2 files changed, 149 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
>> index 4563d8761ba0..51defcb57761 100644
>> --- a/drivers/i3c/master/dw-i3c-master.c
>> +++ b/drivers/i3c/master/dw-i3c-master.c
>> @@ -203,7 +203,13 @@
>>   #define BUS_IDLE_TIMING                      0xd8
>>   #define I3C_VER_ID                   0xe0
>>   #define I3C_VER_TYPE                 0xe4
>> -#define EXTENDED_CAPABILITY          0xe8
>> +#define QUEUE_SIZE_CAPABILITY                0xe8
>> +#define QUEUE_SIZE_CAPABILITY_IBI_BUF(x)     (((x) & GENMASK(19, 16)) >> 16)
>> +/*
>> + * IBI_BUF_SIZE is encoded as 2^(field + 1) dwords: the smallest buffer is
>> + * 2 dwords and each increment of the field doubles the depth.
>> + */
>> +#define QUEUE_SIZE_IBI_BUF_MIN_DWORDS        2
>>   #define SLAVE_CONFIG                 0xec
>>
>>   #define DYN_ADDR_LO_MASK GENMASK(4, 0)
>> @@ -844,6 +850,130 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
>>        return ret;
>>   }
>>
>> +/*
>> + * Cap the limits a target reported through GETMRL to what this controller can
>> + * actually transfer, so the core never asks for a private read the data FIFO
>> + * cannot hold. The optional IBI payload byte is capped to the IBI queue depth
>> + * instead; since that byte is a u8, the IBI cap only ever applies to
>> + * controllers whose IBI queue is smaller than 255 bytes.
>> + *
>> + * Direct SETMRL is optional, so a target may implement GETMRL and NACK the SET.
>> + * Clamp the values handed back to the core either way: a failed SET only means
>> + * the target keeps its own larger limit, which is harmless as long as the core
>> + * stays within ours.
>> + */
>> +static int dw_i3c_master_clamp_mrl(struct dw_i3c_master *master,
>> +                                struct i3c_ccc_cmd *ccc)
>> +{
>> +     u16 max_fifo_bytes = master->caps.datafifodepth * sizeof(u32);
>> +     u32 max_ibi_bytes = master->caps.ibififodepth * sizeof(u32);
>> +     u16 actual_len = ccc->dests[0].payload.actual_len;
>> +     struct i3c_ccc_cmd_dest set_dest = { };
>> +     struct i3c_ccc_cmd set_cmd = { };
>> +     struct i3c_ccc_mrl set_mrl;
>> +     struct i3c_ccc_mrl *mrl;
>> +     bool clamp_ibi = false;
>> +     bool clamp_read;
>> +     u8 ibi_len = 0;
>> +     u16 read_len;
>> +     int ret;
>> +
>> +     /* Need at least the 2-byte max read length field to act on. */
>> +     if (actual_len < 2)
>> +             return 0;
>> +
>> +     mrl = ccc->dests[0].payload.data;
>> +     read_len = be16_to_cpu(mrl->read_len);
>> +     clamp_read = read_len > max_fifo_bytes;
>> +
>> +     /* Optional third byte is valid only if the target returned it. */
>> +     if (actual_len > 2) {
>> +             ibi_len = mrl->ibi_len;
>> +             clamp_ibi = max_ibi_bytes && ibi_len > max_ibi_bytes;
>> +     }
>> +
>> +     if (!clamp_read && !clamp_ibi)
>> +             return 0;
>> +
>> +     set_mrl.read_len = cpu_to_be16(clamp_read ? max_fifo_bytes : read_len);
>> +     if (actual_len > 2)
>> +             set_mrl.ibi_len = clamp_ibi ? max_ibi_bytes : ibi_len;
>> +
>> +     set_dest.addr = ccc->dests[0].addr;
>> +     set_dest.payload.data = &set_mrl;
>> +     set_dest.payload.len = actual_len;
>> +
>> +     set_cmd.rnw = 0;
>> +     set_cmd.id = I3C_CCC_SETMRL(false);
>> +     set_cmd.ndests = 1;
>> +     set_cmd.dests = &set_dest;
>> +
>> +     ret = dw_i3c_ccc_set(master, &set_cmd);
>> +     if (ret)
>> +             dev_dbg(&master->base.dev,
>> +                     "SETMRL not accepted by target: %d\n", ret);
>> +
>> +     if (clamp_read) {
>> +             mrl->read_len = cpu_to_be16(max_fifo_bytes);
>> +             dev_dbg(&master->base.dev,
>> +                     "clamped target MRL from %u to %u bytes (FIFO depth limit)\n",
>> +                     read_len, max_fifo_bytes);
>> +     }
>> +     if (clamp_ibi) {
>> +             mrl->ibi_len = max_ibi_bytes;
>> +             dev_dbg(&master->base.dev,
>> +                     "clamped target IBI len from %u to %u bytes (IBI buffer limit)\n",
>> +                     ibi_len, max_ibi_bytes);
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +/* Same contract as dw_i3c_master_clamp_mrl(), for the write direction. */
>> +static int dw_i3c_master_clamp_mwl(struct dw_i3c_master *master,
>> +                                struct i3c_ccc_cmd *ccc)
>> +{
>> +     u16 max_fifo_bytes = master->caps.datafifodepth * sizeof(u32);
>> +     struct i3c_ccc_cmd_dest set_dest = { };
>> +     struct i3c_ccc_cmd set_cmd = { };
>> +     struct i3c_ccc_mwl set_mwl;
>> +     struct i3c_ccc_mwl *mwl;
>> +     u16 write_len;
>> +     int ret;
>> +
>> +     if (ccc->dests[0].payload.actual_len < 2)
>> +             return 0;
>> +
>> +     mwl = ccc->dests[0].payload.data;
>> +     write_len = be16_to_cpu(mwl->len);
>> +
>> +     if (write_len <= max_fifo_bytes)
>> +             return 0;
>> +
>> +     set_mwl.len = cpu_to_be16(max_fifo_bytes);
>> +
>> +     set_dest.addr = ccc->dests[0].addr;
>> +     set_dest.payload.data = &set_mwl;
>> +     set_dest.payload.len = sizeof(set_mwl);
>> +
>> +     set_cmd.rnw = 0;
>> +     set_cmd.id = I3C_CCC_SETMWL(false);
>> +     set_cmd.ndests = 1;
>> +     set_cmd.dests = &set_dest;
>> +
>> +     ret = dw_i3c_ccc_set(master, &set_cmd);
>> +     if (ret)
>> +             dev_dbg(&master->base.dev,
>> +                     "SETMWL not accepted by target: %d\n", ret);
>> +
>> +     mwl->len = cpu_to_be16(max_fifo_bytes);
>> +     dev_dbg(&master->base.dev,
>> +             "clamped target MWL from %u to %u bytes (FIFO depth limit)\n",
>> +             write_len, max_fifo_bytes);
>> +
>> +     return 0;
>> +}
>> +
>>   static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>>                                      struct i3c_ccc_cmd *ccc)
>>   {
>> @@ -866,6 +996,18 @@ static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>>        else
>>                ret = dw_i3c_ccc_set(master, ccc);
>>
>> +     /*
>> +      * Clamp GETMRL/GETMWL responses to the data FIFO depth, and the
>> +      * optional GETMRL IBI byte to the IBI queue depth. The GET itself has
>> +      * already succeeded, so its result is never overridden here.
>> +      */
>> +     if (!ret && ccc->rnw) {
>> +             if (ccc->id == I3C_CCC_GETMRL)
>> +                     dw_i3c_master_clamp_mrl(master, ccc);
>> +             else if (ccc->id == I3C_CCC_GETMWL)
>> +                     dw_i3c_master_clamp_mwl(master, ccc);
>> +     }
>> +
>>        pm_runtime_put_autosuspend(master->dev);
>>        return ret;
>>   }
>> @@ -1728,6 +1870,11 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>>        ret = readl(master->regs + DATA_BUFFER_STATUS_LEVEL);
>>        master->caps.datafifodepth = DATA_BUFFER_STATUS_LEVEL_TX(ret);
>>
>> +     /* Read the IBI data buffer size advertised by the controller. */
>> +     ret = readl(master->regs + QUEUE_SIZE_CAPABILITY);
>> +     master->caps.ibififodepth = QUEUE_SIZE_IBI_BUF_MIN_DWORDS <<
>> +                                 QUEUE_SIZE_CAPABILITY_IBI_BUF(ret);
>> +
>>        ret = readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
>>        master->datstartaddr = ret;
>>        master->maxdevs = ret >> 16;
>> diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
>> index 17ad817d1f8e..54c3912374c8 100644
>> --- a/drivers/i3c/master/dw-i3c-master.h
>> +++ b/drivers/i3c/master/dw-i3c-master.h
>> @@ -15,6 +15,7 @@
>>   struct dw_i3c_master_caps {
>>        u8 cmdfifodepth;
>>        u8 datafifodepth;
>> +     u32 ibififodepth;
>>   };
>>
>>   struct dw_i3c_dat_entry {
>> --
>> 2.34.1
>>

