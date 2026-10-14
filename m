Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023141.outbound.protection.outlook.com [40.107.159.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FDC4457C9
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960192; cv=fail; b=j+VoJON3SzXwVAvnRe0X8f3rjiQ4Pjzmf9j3QI19/Zp0uxVdBPpey3Wy8QR/85xUFAK2vRUE7vFV/HKoRNj1cnfBeKUUa3zHinXWacDkFclbSfP38yEyp0xEviD2PkeeQYGYUjbSP535A1UE7OpXycfksx19XMa4VQBaS6SoMJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960192; c=relaxed/simple;
	bh=8noKhKdWrfbira6Cyg4o/9dKw4RX6bUOX9a00mQT2IY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dfN9SK3hdhx5BdmYpvB1iD9UGWOX5Q0fp5K6zc50B2iJvCujczdHgH4DCELTA8lidu5oV+Nw+X13ay/RRTzK5967LpS1W+p8kc9dkemITmAWC8ndeWNcfyLfgKD3vLDpmxOR4i3xb7T0E8hUB8XYdQRZ6jSaTEOkgrHZ7+iJHcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=gy11qyof; arc=fail smtp.client-ip=40.107.159.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="gy11qyof"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjcIAkYRaqa1ps/iKxJE0nl8oM2BwtLVpSIVUfakhPs8h10lNcNqu4u92TQpJu2Yz1V4WmsNmeqm2arXflCBaVPuyrvNqce2RDaUYrRQjF1ulZQmKNGLokeGC86eIh5u2V0a8cTpV7ZGewvq3GA54Xpya5TmZWRqpDc+3zDE/1eLOf730WZZ/L1sCsKYojXqbdNqlNTtZ5etCn4EkYdZu5feV4ZIFcmj9NxOmAxf6NJW3BSf3tQR0Zc/qqzdutH4yu9sR3vVlj0FfQvzwUC0XrjOw1mH/xKANSKmi3e49rXXPVPfolmNoRBjv/z0zRHobxJtC+33ni0WZ5KqbYziJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sAoByyFN9WMB5Ps8ghvDWHvqy/f7jhAK6Oayc4G8Uk=;
 b=Oer8ZZnTX3L0EFBGxOf26gonB0ZbNXmmyAl/DxXxsjPnoZ83lf0MnwPnKldG64RHhff5vqJdto9hW27hoeGmLXcVmiCrPZKiuz4eq/WFRkY1drwaGFawFYzDOXs2ApMv424HBB4s2ZmwpujkmHsLoVg2k2t3tLjE/YMxr2YWq8bTc8fAjBER1V+M6yAFxdNoWrxWwcy3JdSO1UwTO/YnKJon4wlf3BGb0CYrkTxHP9PN7+cLCE+94ht0nRjej1wFK0DdwlYiXAkUROFDLxSVkD5yFPE5hmRoAiZxvYyXHzr1DePQVVpdi1FXLrPCaIWqLVQ5H7EuIh8K7nExfe87CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sAoByyFN9WMB5Ps8ghvDWHvqy/f7jhAK6Oayc4G8Uk=;
 b=gy11qyofZHRTy44xNweDbVMcqybxTNzJKq8EaNEqSptBadaammZZDZ1fvUGOooVvj8EtjC5j4f/ETn0ZAjVbiFY8B/GPW1DhFRdoCi/CmXNbVVlvI0d8jEBpcyZoCJAYK59eRkSWSJdvkMq4YKuRpAhgslTuH+3Y7rY47bRZSi4uMb3Zykhmy5mCGWkwUoyQ+IOPdW45gqwPHFkK3PRbO/xqMXb9B8WJP4HeZaIjnLTi8FB/j5Ix1EJc0iftPqIrxZrn0tuUYOrboAVPmxW7wHU2JwD5LN4oBgOshFJa5NWkTRy8OVvdqqPKRzql19LfoOr3IUF4sGCRhXLe6ujrFQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by FRWPR10MB9291.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:184::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 06:43:04 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 06:43:04 +0000
Message-ID: <1aa5753c-0c63-48e3-a649-8a87955c2362@kontron.de>
Date: Wed, 14 Oct 2026 08:43:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spinand: Do not re-enable continuous reads vetoed
 during variant selection
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Frieder Schrempf <frieder@fris.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261007-spinand-cont-read-supported-v2-1-4c63a0f8828a@kontron.de>
 <874ieq3lj7.fsf@bootlin.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <874ieq3lj7.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::19) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|FRWPR10MB9291:EE_
X-MS-Office365-Filtering-Correlation-Id: 04516122-847d-4377-d8e7-08df29be65d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|4143699003|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	9eZtVaWxGaZGkNl3OhIFaXHlz+EKVLy1xG4OBP5cRiseocpJMh1hzOAfO5aw8+nuKimfQZvQDhGoLLTKiSw0rmPGQ58Q2+DEWdyLCtZyHNKxeZeuYkidCZXsLx9AOyoH6gZsboTkWkEhegdM8tXOUkQhMkVloI557/K/almAlfOQzCXL/HL2H1j7BCNajZvpnUYmyIbyJZ7tRZq3MHUhfdke1DgvFHer5P92SXnrkz8bFJu5TLAQ/odphxZkm+iLZS2KltCzRXVzBIfLUmUnjeiCYRZ7hWBmtuhrmYk3ZqviToHUA9iFXU69WntAAwty2Kfa1dT/suuAyxwHpjajj/D7s9fxgfE6o9+4+c2Mkk1VyYBBIOP4DuPImvvqZy5AQ3JEee1RmpFwa2NcvVrErypsGYI2rip/LnWxs/Z97gTWjMu8bBKZPX+RKJJl7HlTu5mcSitBnf4TXSAfXUajNJsXpX7PUrfpxfzcQ3SoRgQfyJ5pi6KAHae+q3owm8HM2iLdKse3Z5FRS2Ofdr5y6dvz7OBJBdkrKu5TYxYAoSBG1U3JSJGKtcyDcT0drVhUoRqLoUorNCoZaiOkuMXCr0q3XrcZgXJqHAxrK4L2Bb29H9loFG37/dD/61g9R3qlomAIdKq5svRCYGMXj01MxR07o8x1voS4FcE5h+/KVQg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDBOQS94WUcwc1NrbDhFbkE2cTZJN2lWRUsvaTRUSkVJTys2dUM2RzkxYnE3?=
 =?utf-8?B?MURySFcwa0l1QytLSURPeVpRbTdUdFMxOE9keUttWlh4NlJnS24zUXVOSERH?=
 =?utf-8?B?V2xhcjZhTDlTRlJ6aXRaOXJ2NTkvZmxPb0hWYitFTm44WmxHRkxGYlVCUVBQ?=
 =?utf-8?B?WU16bnluRnJseWR5ekdmazgvdmppNEFNL2tCUjhJTGRBMGRDcFB0OEtaK0Jx?=
 =?utf-8?B?NHltc2QrbVpSRG13L2FCcHEwQjV2c2ltUlN1N3hrSEpoZzZLb0c4RlJTNnNz?=
 =?utf-8?B?WWU3SStIMTl4UUlYenpZd3dYRUVKSDl0YnpLNXlEM0syaXA3d2lvOFJ3MUla?=
 =?utf-8?B?aFVXMEZYVDdweStqczdvV2RyUmZSaXY4a0JMakpEWE9Ca3lZbzF0LzA2MDVL?=
 =?utf-8?B?WjVzZERLSGRyNWZSSlZnTm9LSjdoSmcxRS8vM0FOd0U2MEJJQXZmNHFOSHhv?=
 =?utf-8?B?N0tNV3BtWTdWejJleHpBZ3oxaDFnb0VTaFJVM0p5UDRUZXl0cXlCek1tcWZ2?=
 =?utf-8?B?OHpOV0JXT1VxTWtJUzVxQjEyMmpMZmN1VzlBZFNqSWRuT1dtOXZ6aFN3a1Ry?=
 =?utf-8?B?ZTdyaVdTSStlTVBEL2lCSnhNdXJnYmNmbXMwbVNUZlF6enhmbTNWV3J4eito?=
 =?utf-8?B?d2pFQVQ2TWVodWVPWGxFR0x2Smx0Ky9OSmowbmpqSlZ0ZkVlcFpKSFgrSGVo?=
 =?utf-8?B?WHZrVEVadGFKQjRrVGZtMTFmVnR0SjNlbWRCejhsZ2pJSGZSbTB6eUlNVUlq?=
 =?utf-8?B?eVc0cGZvdnE0OGZUbWE0NjRjNGJkYjFBdzhrd3MrS0N1VURMamRRL0NqYUpY?=
 =?utf-8?B?aGthYUpWYzQvNExIOGIxSWhJMkZNSFJHSjZMaXI1RmlnSktjUWtQQ3VhcG56?=
 =?utf-8?B?WXdDbzVzYy82bUx3U1JMZWc0aXlHNmtndXh1R2wwRlNTZEtaOVplcVFrWVgw?=
 =?utf-8?B?T1piczhZdWFhN3RGZTVDNGtDL2lpbXBhR3ptZ2dqSFBXZWJSZHVDL2YrS3Ur?=
 =?utf-8?B?akN0QzZNcEtnMzBlQlk4Vjl1SWR4QVlBeUM4eVdxT0gyQ1U5YjRGa2pteFlB?=
 =?utf-8?B?MDA2bmlMQXAzMXRRU3dCT3NQM3gvRmJiTVcwelFkdFc2U21adXVHRE1uT0Qw?=
 =?utf-8?B?eEwzeE9ydHhDZHQ4K0wrampOd3JKdlE1ZUZTVU9vTlA1SVpuTU5HaTNmdktR?=
 =?utf-8?B?NlZ3MmFsNTljb3lOR2VFYmcrdE5HKzBzZkNZRHBGNGlJcEZQaSt3YktmRGhx?=
 =?utf-8?B?Z21MNzU1Q05oL0Z4LzhDT1gyS3lJd0tHd0RPTHRaN2lGaWl0b0YrUkNkVERs?=
 =?utf-8?B?VUtqZzdFdHhCbTNDMWR2ZTEyenJjQ0pUbm5YM1FnR0U5aTk1Znc3Sm1Kck9w?=
 =?utf-8?B?c3BkaHRkVldqVmlCd0xqWk9QMG1ETjZuRmJGM2RYWTUybm1uSzRhNEdoRWFE?=
 =?utf-8?B?UVczUUVaWktUVkpwVDJuYmtvTENFTEpYUGZqQVdvMHdFMXBBZ0R3a2k5QmlY?=
 =?utf-8?B?MG1KOVowNFhzY0lqKzlUVTdFZlBKcHZ5Uk93cWtPRXM2YlB1ZXdWazZndkt4?=
 =?utf-8?B?czQxZDhTbFB2ZTdrak5tK3lFTk5xQUdBa2VLek93ZlZVa3duMFBkdTlhdXZu?=
 =?utf-8?B?d3h3aEJvQWdsemhITW8vVmR3b0tya3cwdHBRVnlOUExvaCtKOGcyNis3a2Rw?=
 =?utf-8?B?dk1PR3g5YWJzY3hETmQ0QlRlcURCTUMvbXlIeEMrL1BxNlRVb1VrQWFmVk9V?=
 =?utf-8?B?dHkrUHI2Z0ZIa3pvYnE4eEwrRnpQTERnZDdHdFptSS9Sbk45V3dEZFkxZGlo?=
 =?utf-8?B?SlI1MTc2Qk9Bd0ZhNlIxMEpOU1dteGNVdTJqMDh4UFpSS3dma01HOWJqSFY4?=
 =?utf-8?B?R2JJN3M4TjBKa0xteUd4UWNXRWZBTm5pWElCMksyWVJGSzdxRW5TbkZZN25t?=
 =?utf-8?B?VlBNU2tMVmNmc0kyV25vRHAwT2RCOWVnVGFhekFxWmFMa01PcFlWY1pFekRC?=
 =?utf-8?B?cXlQd3NFdFpFMTlDWVI4S1lnWU1ObWwycktIOHp4NDJodWZIZWNjSER6VXlS?=
 =?utf-8?B?MEh1OE0vZWNvS0JUeFNGdGlhWEUxeXA2ME11TGRxaVN5M0ZzTHVpbG1yNXBz?=
 =?utf-8?B?M2VPeDJ1NGtRa0tNZDA3aEw1ay9CVEtiNmdPQkgzQXU2eENuNGFaRFBmUFha?=
 =?utf-8?B?Y1J6Y2lBR2xwQWhVbEV0TWFvQXljTzRLN0NuUVU4OGxrSnEzTUJpbnVubG9j?=
 =?utf-8?B?K2xmL0tRZEU2WmRDaXJqV0JyT0M2TW8yODgydnExZTVKNjMxSzVueHQ5cU1X?=
 =?utf-8?B?a1JrNURpY1hHSy9WVmpjeDNHbzltdFhMaGFSSTc4S3dMTXEraTREdy91MFhr?=
 =?utf-8?Q?PKnpJpC++aoaV3OQ=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 04516122-847d-4377-d8e7-08df29be65d1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 06:43:04.0321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNdiKKUysSR3FqdiegL7YbuGNttZEjqzAPIdO8kKaFOIT33ABeNAPe6OTi2vC7FXUgw22w6zMIv8Zh/Jy/QumbUAFDsSYi7oJLb3qOd+qp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR10MB9291

Hi Miquèl,

On 12.10.26 18:56, Miquel Raynal wrote:
> Hi Frieder,
> 
>> Fixes: 6eb7c193e751 ("mtd: spinand: Use secondary ops for continuous reads")
>> Assisted-by: LLM
>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> ---
>> I was using an LLM to check sync patches for U-Boot and the LLM reported
>> a bug in the upstream kernel code. To me it looks like this is indeed a
>> bug and the fix also looks correct to me, but I would like to mention, that
>> this is purely LLM-generated and theoretical. I didn't verify the bug and
>> the fix on actual hardware.
>>
>> @Miquel: Do you have a hardware setup that would be affected by this?
> 
> I do not.
> 
>> Do you think there is a better fix?
> 
> I agree with your bug analysis and with the proposal, just a few nits below.
> 
>> --- a/include/linux/mtd/spinand.h
>> +++ b/include/linux/mtd/spinand.h
>> @@ -772,6 +772,9 @@ struct spinand_mem_ops {
>>   *		suitable to use or not in general with this chip/configuration.
>>   *		A per-transfer check must of course be done to ensure it is
>>   *		actually relevant to enable this feature.
>> + * @has_cont_read_variants: The chip needs dedicated continuous read from
>> + *			    cache operations, which must then be available for
>> + *			    the bus interface in use
> 
> "The chip needs dedicated continuous read from cache variants"

As below you are proposing to rename the field to needs_cont_read_op,
which contains "op", I will leave the description as is to match this.

> 
>>   * @set_cont_read: Enable/disable the continuous read feature
>>   * @priv: manufacturer private data
>>   * @fact_otp: SPI NAND factory OTP info.
>> @@ -810,6 +813,7 @@ struct spinand_device {
>>  	int (*configure_chip)(struct spinand_device *spinand,
>>  			      enum spinand_bus_interface iface);
>>  	bool cont_read_possible;
>> +	bool has_cont_read_variants;
> 
> Can we name it needs_cont_read_op?

Sure, will do in v3.

> 
>>  	int (*set_cont_read)(struct spinand_device *spinand,
>>  			     bool enable);
>>  	int (*set_randomizer)(struct spinand_device *spinand,
>>
> 
> The rest is good to me.

Thanks for the review!

Best regards
Frieder
