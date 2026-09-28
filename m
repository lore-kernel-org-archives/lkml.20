Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010029.outbound.protection.outlook.com [52.101.85.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549934DDB24;
	Mon, 28 Sep 2026 16:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611762; cv=fail; b=jKRMRxwTfdJQY0WUWFCHm7CQSQhTL3B5yrH/ZJSpkvHXgcQdZrROwl2UbSQ3wa8dEcQacFLpasxvAxhSH6uMftcgmy7yEsQW8q1sxFIOp4VywCSn6e47LJMpBXi8XvTmZwWfcYJZq18cXP4G1+cuHDPOh7kIHmpGKpJU6YxF598=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611762; c=relaxed/simple;
	bh=aJOnnjQ8fXjrLvhtzMGWbvNEESh6/5dMHFJ5NCjDtcA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tidybDiQkbIie3B4/xTGlmEEi0VIHLRJOIio2ROpwrG2/v43v5TvoM5lRGW08ik1RzIiF/f9UdRlkJanhtMydTn5ipnZ/HylTqDJfUR5NF0OK/OG2shX1mtG94+WuCESyaVaOKcrcETLVQHJ+6E4cjJLQERpHa8yDc8YbIBPd3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zabA71hp; arc=fail smtp.client-ip=52.101.85.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zabA71hp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbGLVS1mZHvLlQBY+FWCWPW2AU4Aj5kcXBAL5F0KhyBURIuXZYV4G8b9D1BDD/xgv9Bk7zf5T+QDENyA45kk5f4/C2ngI1kgnvCSWPfqvm3Ua/PMa4BwT6JeU2sUxPk/MiDS3lsSmL8SHJvK8nAk5Sg9RZI+ebiaSrN4EC+kxa0Qvw3SwgeH549QJiX4ZuXvXY5HB65B/doRqQTN9VyFMel31biqPoklCXBgGNU2MfMc9n5LPSdRYk9CHpMh4/Bt1iAH78ohs41rcoOd2FA4aEhT0Tq3ETn3tvU6sZRNMV3Vdf53gTlEJj94TK2gUiZ5sSNSPXFfwm4fSChUtlCBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJiewDse37wCEzgg3nCgWA2gcUSgNuPwstONsJPPqWI=;
 b=P1rVFtlwXXATydlhgZf2+UOPNHG/VLpaU0NQ1qoiWDzUkwgY2XquwG9g1KfTDd9+q4jimTNFLty3ydQv3hYsXXLcrpHtL4N+hJQUxNC6fOFQMYGyaY6ea3jhNV9rXgVRh9dMdBsa6/GF4NlHE+T/J5hAldaX4wG2ujv1B5rC5BrKyPsIGbwKzaQtIFxd9/WNn3wKJ9hSWRCuukf7HH1332XvMe+M8gYgHu3DBGhGkbsnryCkgx6fzgJjT5GR1Xyg+gjQTFDUK9X21K4t1Hrjpr2VXwlU0/iZhPcVr3Z0MNkxaqOSXj/14vUAMgLRqN+T0Y32rG+3m8OYLTsdmfLIlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJiewDse37wCEzgg3nCgWA2gcUSgNuPwstONsJPPqWI=;
 b=zabA71hpdf9HHOze8vK6N6GqfyI1+s6+rK/M/SXGBaEaGyyroKu2NM2C9L+F/sGBWFHRWzdx1EDVeIqlWfjfKRw2JJHzeCRgGq8s5/kXjSmLDxDWorPN5Psih8j6KWSeHw31/fvXe65G949nvR2TkFGQC3qzIv/Jwu6L9qf7SLM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV0PR12MB999069.namprd12.prod.outlook.com
 (2603:10b6:408:32a::19) by DS7PR12MB6311.namprd12.prod.outlook.com
 (2603:10b6:8:94::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 16:09:13 +0000
Received: from LV0PR12MB999069.namprd12.prod.outlook.com
 ([fe80::6d95:9938:bff0:cd99]) by LV0PR12MB999069.namprd12.prod.outlook.com
 ([fe80::6d95:9938:bff0:cd99%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:09:13 +0000
Message-ID: <d2cec438-f215-4468-8276-a89eba60e95b@amd.com>
Date: Mon, 28 Sep 2026 21:39:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] EDAC/amd64: Mask UMC chip select to the four
 implemented selects
To: Yazen Ghannam <yazen.ghannam@amd.com>, Borislav Petkov <bp@alien8.de>
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260925172639.97063-1-Vishal.Badole@amd.com>
 <20260925172639.97063-3-Vishal.Badole@amd.com>
 <20260925181429.GBara6BXp_J2rnvoOp@fat_crate.local>
 <20260928143821.GB2289128@yaz-khff2.amd.com>
Content-Language: en-US
From: "Badole, Vishal" <vishal.badole@amd.com>
In-Reply-To: <20260928143821.GB2289128@yaz-khff2.amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0344.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::10) To LV0PR12MB999069.namprd12.prod.outlook.com
 (2603:10b6:408:32a::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR12MB999069:EE_|DS7PR12MB6311:EE_
X-MS-Office365-Filtering-Correlation-Id: 46073058-7cd5-4ecb-7388-08df1d7ad66a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Y6NZbDE2VNNeiyf9WUgSnTD2IjpJaKC87yl0i6BHg4jM2cY91ivSQdyTnzgtZfcf6UzgO0wVttWvxF0O3uxz+0gpHtLK1mzdEJ/lqAYHgI6PBJN9BBI5UZAr88/A74wxxum9cUz8HQnmNMlFS1vhZ9QAzFDm/xhCsMwP+ZnS94zmocw5IjG5x1DP94cR/Pm1WLm8+ZrOVFn99vftaiBhJJ5EsgeoukNJ1X66eoyBeHq/BPfExHwje9/qpk4g/V3Ca31ZdFpO2oqzmZPSXS+g+xu1tRUGON/fj+5Lr8Ym2wXruFOI5drDjaWQQeRmM1fIc4zvaV+WSQYP0q84MQ0BJA4w1cKA8U1mlccvoBemlqwEA6H6ENo4BiOfXjIiPDeEPCHfsvvJL1Zek2Hckyz2MBjtEzZtnU4WUBLcXsHQ2u51TmZ19TdPqGxRbXfjVv3csuLunxQzO0HKeBDpb4ApwIL+xYfq8d+j+BPR9vRjL159hFnYlbo3ptvXErXSaZI7spnnt+WlXxQYh9zkis0j62wgNjN1xE2H5qKz6EFJYpZcw8FodhFuZFwEUlo5R3ysaH9u2YWX8vl4N4QOmvgBuLfyYpHKDHUsXIc8UZPv1ooES2fKgjQQQaLID2r0J1ctGbeYPmZHWhxYqsU9OXPuOEGnsE9Naf/CmbuegI85tJg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV0PR12MB999069.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkhSTlZ4ZnlkaWltNDA3YjBEWmFNdHF3cTEvWVY1SWZnbmtaSEptS3N0WnBT?=
 =?utf-8?B?Rnd0bE9ZTG1ZcG04QUxzUG9BcXlPSmhPdE13NlVtbEZSMExjQ3BOajBzTk1E?=
 =?utf-8?B?aVVYL0dKY1NNVlNRbU1yeXhxeEdhaDBSU2NoWHBHVkZ6V2dxWGdDMFd6M296?=
 =?utf-8?B?OU53QktiSW0wTjhSbjQ0Sk9sZ1lVVjVlYWJrZEtGTHZnUExiOUpWVGI5dG9H?=
 =?utf-8?B?b2NMRi9aeUt5eHgvVGZKYmF4enpEbmxROWw5dFJqNlRDYmNod0ovc0JidEdm?=
 =?utf-8?B?S1NMZnh6TFJIVG5kQU9FNzV1RkRmZlFQdkdrbzlWOFN6WDI5UXV6RHV6am5R?=
 =?utf-8?B?RmhRaW9vWHBBVmp0V0FtcHd3K2YxMSswdkQ1QlRlZzNaSEVtWTJIMFBXZ1ZS?=
 =?utf-8?B?dTNUeUliWE84c1pSTUVNWkxXZlZ5d1U5cEVkOG1LYVNwOUM1Mk51N1Z3UmZq?=
 =?utf-8?B?dlFxNVlBVlNTTCt0Q3dXcVJVaXVueXNsNmxLdGl5eVA2ZjZvWG94Zm9LUXJB?=
 =?utf-8?B?V2Eyb1JRZEdidTNlQ284Szhkb3R3MkM4ZCtUL0dwOStIbWxZK1A4ZU9qUDFC?=
 =?utf-8?B?ZHJwdVo3bmJJckJZLzdlSWdwS29Pc0Vuc2RIRzR3dkRDbTdkMEtzNkhxU0dk?=
 =?utf-8?B?SjBGVUlNd1Y3SHlkUUQ3M3d6SlZYRXdKeGxGWFlnYlBPMWRHaXpNWUp2eUFj?=
 =?utf-8?B?a2tuS1ZveTBaZG5lLzRwZW9Ya25RK0F0enhMcUVWWEJpV01NcnE1dVdSaEZP?=
 =?utf-8?B?dzMxTWJYc2xRNVlNMkhYOGVxL0hOc1VEUzJwTHZLQ2VYWGdMTmYxVDJJZ0Ru?=
 =?utf-8?B?Sm5Sc0xSMXZ3VnA5a0xxNUg4cnJuK3p5cHlBcHJPSi9HWXQxR0VWZ0haUnRr?=
 =?utf-8?B?cHBUa0o1ME8yOWttVjBNTXJjTmd4VjNUK3hhYisxM2V0WDIwbWNEOUsrV1hH?=
 =?utf-8?B?OWFaMklXeHRxb04zaStZQXd5L29YcWhhK3JJN0ErK1hWTzFJOXlzejI3QzFu?=
 =?utf-8?B?eXFKV2RDL0JkR1hLUE5SMTZ5T0wxVEVvdUJlNTdMMHM2d3pBM01pMld3U1RC?=
 =?utf-8?B?YU42QUdUSGI1Y3dIZUp4NFZrcDVydXVkS1U5TDA5U1JNZlFKN3dFY0dIbVdk?=
 =?utf-8?B?aiszTG9La0x0clhwQVFBT0NZYmRuaDA2c3l3YUl3RDFKeDI4TW5zUlR2ek1J?=
 =?utf-8?B?ZVFHc2pvbDdOR1FZYjEyMHYySXVIUjZmZGd3dHA5UHord2ZpNUVOSS9TU21S?=
 =?utf-8?B?V0U0U1RtQmk2SGZkeDc0QzJONVcrZ0RsaTdldG03dzlJaDREeDdKbGNWb1hx?=
 =?utf-8?B?YUdFRkRhS3VUMk9PeC9pd0xuUzB5QjVtNVdtUVM5VG56Zis0ckZIVWZHbFFC?=
 =?utf-8?B?NUwrZGltaWVUTTFmREl5K2crUWNBdE9qa3JGSEVUUTVKek40WXpNTkR4M0I2?=
 =?utf-8?B?RzJOY2d3aGpxMHdFd0lBYnJtaEJWNlJhbHQveW9aeWRubHdVVFlXaEZ5NWJ4?=
 =?utf-8?B?bm5rbFlYSS9DWG82QVFQeXdDVEI2RXFQQlloRGw3L1Z0RUhMb2ZxQnIyWGRE?=
 =?utf-8?B?Rk9zUWdScGdNaDIwWUdVbkhkeWRHYlpyR1dzRktua0NMUzZFZmtwQmcxODZC?=
 =?utf-8?B?dHlKZXFrODJnTzJPSENBNlNnRHFKeFlINzVWOWo5cVVFQWI2RzhKNkVXOGto?=
 =?utf-8?B?NHJrNHhDakpoZ2svNUpMME84UnRnTm5OcTBGZCtoNzJBQjF5MmdiRlJRazhT?=
 =?utf-8?B?Y1pZQzNFZVJNOXRWQXo5dURzVDRyZGhzZVBlcmRrekFXL2JpaUFZQ0ZhVi9N?=
 =?utf-8?B?aDNwd3hnblNGYWlmcEMwOUg0aHpLdys2Y21xWjRud2tHaXhUOWRZek9Rd0FX?=
 =?utf-8?B?MWtWSk9QRnRZYm5nYlkwanJTOVI1NExHVmxuK2dBVy94Ym9Rb0w2bzN3TUF2?=
 =?utf-8?B?VE5hMlY3NWw1REQyckNUbXZ2bzRlQWk1NWd5YmRmaXBkalJPSUFxQVdTaGJK?=
 =?utf-8?B?TGRXTkFST1prQU93cDdlTkZXcFN0UGNPZ3g5T21HczN2QnFKWlNjVVlPbnJV?=
 =?utf-8?B?K0RGY3RSTzZ2Q0JDdU01bzJHM2NsbVZXZkxwb1MyRDBhRkJjblRTb3F2L3ZN?=
 =?utf-8?B?SXB2WXlhN2w2d0FBK1pZK2FSQzc5OUlnYWo4M2NPZHFtZnk4cUdTL0tNaGRr?=
 =?utf-8?B?OWY4QkJTdGZNS1BmNzBpMWJuQ21OQjZhb2M4NjZkRSt3SHZEcWtHNU8xM21r?=
 =?utf-8?B?RXVKWEdzcFRoaThrWlVwRmxKdnZ2R2xMeXN3LzlsQnZ2dUtsSHZYMkllYUZq?=
 =?utf-8?B?eEJkMkUzZDBhRSt1bC9WOGZ6SkxJUmI2T2ZIc2hoUmNOaXM2eHBXUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46073058-7cd5-4ecb-7388-08df1d7ad66a
X-MS-Exchange-CrossTenant-AuthSource: LV0PR12MB999069.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:09:13.1201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WNuMBn6LdpO81Beal0ScYViMdPGD2Aen6fGBfSljHmCDPfwqVgJWCoY6mIlDfYytH6cN1HpA9lXkVCPlzr8xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6311



On 9/28/2026 8:08 PM, Yazen Ghannam wrote:
> On Fri, Sep 25, 2026 at 11:14:29AM -0700, Borislav Petkov wrote:
>> On Fri, Sep 25, 2026 at 10:56:39PM +0530, Vishal Badole wrote:
>>> umc_get_err_info() masks the Chip Select from MCA_SYND with 0x7, a
>>> leftover from Zen 1 where the architecture reserved space for up to
>>> eight chip selects. Only four have ever been implemented, and newer
>>> products document this as MCA_SYND_UMC[1:0] = Chip Select.
>>>
>>> Since only four csrows are allocated, a syndrome with bit 2 set decodes
>>> to an out-of-range csrow and trips:
>>>
>>>    EDAC MC0: INTERNAL ERROR: csrow value is out of range (5 >= 4)
>>>
>>> Mask with 0x3 to match the four implemented chip selects.
>>>
>>> Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
>>> Signed-off-by: Vishal Badole <Vishal.Badole@amd.com>
>>> ---
>>>   drivers/edac/amd64_edac.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
>>> index cab696be4f07..b69c3f51dd37 100644
>>> --- a/drivers/edac/amd64_edac.c
>>> +++ b/drivers/edac/amd64_edac.c
>>> @@ -2802,7 +2802,7 @@ static inline void decode_bus_error(int node_id, struct mce *m)
>>>   static void umc_get_err_info(struct mce *m, struct err_info *err)
>>>   {
>>>   	err->channel = (m->ipid & GENMASK(31, 0)) >> 20;
>>> -	err->csrow = m->synd & 0x7;
>>> +	err->csrow = m->synd & 0x3;
>>>   }
>>>   
>>>   static void decode_umc_error(int node_id, struct mce *m)
>>> -- 
>>
>> Is this ever going to change?
>>
>> Do we need to track this in the per-model struct, i.e., what your patch 1 is
>> touching?
> 
> This works for everything up through Family 1Ah.
> 
> It *could* change in the future, but I don't want to speculate.
> 
> Also, I'm working on a fresh EDAC module without all the model-specific
> stuff. This is the sort of thing it would avoid.
> 
>>
>> Is this a fix that needs to go to stable? If so, Fixes: tag and CC:stable.
>>
>> If so, patches going to stable go first and need to be minimal for ease of
>> backporting.
>>
> 
> I didn't consider this a necessary fix. But it'd be good to have it to
> avoid noise from reports.
> 
> Vishal, please do add the 'Fixes:' tag, Cc stable, and reorder the
> patches.
> 
Sure, I will update it in next patch revision.

> Otherwise, looks good.
> 
> Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> 
> Thanks,
> Yazen

