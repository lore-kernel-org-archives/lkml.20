Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011049.outbound.protection.outlook.com [52.101.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6A63B7753;
	Tue, 13 Oct 2026 05:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870845; cv=fail; b=BivfJMv421tYDRGM9p+I4bKHXZDvcwcvNnxrsB21MKZCnbRhE9lhuCbi5+yb1RvGieWgezt/lMd2TEe063uNEh/+T1DVuODLQz6w1nc9dqfrx45IWAHGBMa+g7m6YyweU8N3wN3TSWNU+P4M8pCRU78XEI+NHebT4dqcvtIoik8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870845; c=relaxed/simple;
	bh=nJyx1dMv3tzvaQ+wS0Yreuo/ywasz7YyxBwbM8GfBMQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kKw8EQN4ByUGpCTFhLStY2uKkX5y0jQXLwCQFfaHjhMjAylD8k/NAAxMBl6hI8YNwDhH+jWYCD68lg1bp7+I+aXGq2ZtTec2NaE5bHqJG5UmzEtJsi6tVpqWv8Wm5Ok9aNjFuSo3H29H2wCXkmlGkhw1iCKu293hmkZD4zB/c2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=qGYDenjR; arc=fail smtp.client-ip=52.101.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="qGYDenjR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yYC5IanJIInUq1V387pvdXVlKsDciJC/h9gLD3/wCDJzPFhxufBBCb+dR8qcp1sQifo2Bsh7+3HsVr3Q8WwRT7AtJKqyT+DGGQRqV9A95/Ck2UFRUXlFdKQfLMypURPiWHYHGEb8lpF2MjQg4/BBbRy3cZM39mqS55g6N8wydnAMBmLOHi5Vyju1OVzm1uxBp0QFoxEeUmHqtYhcoDNGI1SirwBvfVOEl1Z4knIhFAgM2L8TTUlZBSMLFY/uLIVFYW0J2EJUDrXMnJNFt25TfpFxMXKGKTFucESx4qSMPx3GQZgoLlX8RrhlfoyBMrPpSThwbh71XOA4PkQrSEYxWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJyx1dMv3tzvaQ+wS0Yreuo/ywasz7YyxBwbM8GfBMQ=;
 b=goxdl73WdFaOtYwRtUGl4AdSfoe/ILGxEbzVL4EWRoZudCeMBXCIRTTLWcIyexBJsctiovvpS20OfqDZ8tMu2joxhNpdtsHPf4WVxKqRnlaoM+qIuLN/oyACzPYzOHjowD6cQKRjiziq3QusAvAuF164Dyl6BV7+vV5bazkIq0/WJV+/KoetaQNM9EoU/Dchy9uNPqe2BxJZUGwQslRnEjBGFnq8yzWvU1VC2nc8tnaauy3gPyO/rSvIDnIAHQ/VWc+gxssyVEckMuN10S3KTD67YHeolYv7HQBwO9LDx77ElkvD42lDUBC1G30mAiTj/t083Tt77Y4Pm1KLLAMhcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJyx1dMv3tzvaQ+wS0Yreuo/ywasz7YyxBwbM8GfBMQ=;
 b=qGYDenjRZyYSyPKkyYM/vGww98sUEFPKup/K3HHndSX0kjidKmB+zfY/O8GHM4PcjuOE45ceRLdAjWwfBA6M2xQaBDQLQs/u3KFormPlPpRT2njTmCSvLqKOQTZzXUbKTiJr2cxGScrx5E6/4CfWVVwf6wMJZBVmB9/35YLXPvyau7Hc48utiDgNO1br2L6wNcFqANnAAhVqxyXPMB2ayDCzA9zxWPWeUoekjYBIjm9eeZN2InJVsTn63o5HNjFe1oYS0mhph41V9Q5T5xSck2yV5UBA9Q0gN0EmdD/8KyrhxII1T6VncH9QbUY7feMu6qGMBnRPe7dN7/zIGLDeJw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by DS2PR03MB440844.namprd03.prod.outlook.com (2603:10b6:8:3c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 05:54:01 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 05:54:01 +0000
Message-ID: <97d2287d-17ea-42f0-aa62-69473431fea7@altera.com>
Date: Tue, 13 Oct 2026 13:53:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] usb: dwc3: add Altera Agilex5 DWC3 support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
 <cover.1789114385.git.adrian.ho.yin.ng@altera.com>
 <6d259ee3-a737-4074-9066-3b01e3673e1c@altera.com> <aq2x-bwWluxr8oMh@vbox>
Content-Language: en-US
From: "NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>
In-Reply-To: <aq2x-bwWluxr8oMh@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:4:186::7) To SJ0PR03MB6581.namprd03.prod.outlook.com
 (2603:10b6:a03:393::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6581:EE_|DS2PR03MB440844:EE_
X-MS-Office365-Filtering-Correlation-Id: e1ce19f4-0c4a-408f-940a-08df28ee6140
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|55112099003|22082099003|18002099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Eb+TQMcS0Csl40D/4mULHAjGH204CoFtIVPzBoZ8lR8PLkmN980aNHLU5VuvdOKAWopkFmV8cdF1uPHwo1ORP4Gp8JvACk/03C3OAtGh2bMDnIPi2zuEvesFG2jb3Vs1MmYCdj+txsP/G0Yv2FJnHDoZRcsD2/49SbG4NAJjEeg/o53oUK1KM70vhxyYG9xj+2ouSKzgO9GGNzN4GZcVSoFEkPgj2gjT+3/ilGdRFLdBssGAwCkuaXCdsAqRqifdi7oxUos8PLFoWVhy68jWYYfbQRTOsbjbE/IW5/lSx+uJFcSd0mWkAjxTqxkDw8Kfh3LOyiKmSNWkk15lSk0rZN/0S19PQGAyGXNuaYqvIqpHSkQrR0da994AjY1dbMT+CSPjLJg5AI4uF8snBU3r3E9EWULZSsxxFqpt59/c7TBJYQgaTUvQsVRIilZC+2m157+bX6zBB0eZ41pMm0F2tPjmP5d4tyTarUbBvGL+FNJbQNp6q0RubQp+U4dfsZzrO491bRTsiicy732AjgnRjooHKhLDjfqFhbGZ767MTe0sJhipNJFmeLJRsZWlFZhTvT1U7jvm//YYA0JDmtWixyTJ+95Gm7B0KNzNH/qk7TiU6nBK22SNXAC5kwu4bfLY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(55112099003)(22082099003)(18002099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEhVcCsrcnNKT3F3MWdMSldMOExFTGdxVnk4ZzZBMzdCSUhhYjluNWdSMkZS?=
 =?utf-8?B?RWZtK1UxZWxGWXAxaGZJeHcxVzFPUmwxc25la1djaHMra1lSQ3lWL3dXVk16?=
 =?utf-8?B?amR2Z01nckFyaEFaNzRsMVI5NFRBTDlEamxQcFFLTnN5TXdvcHdXSytCWWcw?=
 =?utf-8?B?TzVFWnVrMmlRZ3FremZBalcwVmdRSlF1MDA0VkhzSzl4dXBiTFR1NURtMUQr?=
 =?utf-8?B?cTBtQ3RjYTZEaC9nNHB1NkpIZW00cWQxK2xWMW9RTFBRaTViNXI2UU9jQmdO?=
 =?utf-8?B?L3FRSXQ5NDlyMVFOakJPaVdicSs3V0JYM0FhTGVCdXJGY1ZHOVJpYzdML0lB?=
 =?utf-8?B?MW9KdnFRSjZVeEg2NVFJQTlja0phdkppOUlZRkE1SEZ4NG1pNUZJdXJ6eEtB?=
 =?utf-8?B?d1FVc3VRcnVvL0tnWDlGLzdMWWk4aTNBSUFsSlVKRVR3SDIwdTh1QUhhY1Q4?=
 =?utf-8?B?NG9xTU5pZkhLdy9teVFkOE1RNUFlTFFhRGgyVUR6b0hmRFlvMTlTWTRUTHpV?=
 =?utf-8?B?VUFuckZpTm9scUdYczN0UFRhY2dYT2hibnAxN1Rsemh4dkVESzBhMU1XQW9q?=
 =?utf-8?B?c3ovbERQb1FQbFZ5OXNITGtzOGR4RTZzMEZNQjhyNXhuWlJ3bS8rdnYwWHlR?=
 =?utf-8?B?Rm5OUmVMN0xPZTN6cnFYUnZ1RWp6MDZxbEtld1VMd2N2T3BTT1dlSkN1dSs3?=
 =?utf-8?B?NUtaYUJnYmhCdDNlbUJSbVpUUFJiRWFnRTNYM2VoMHhCeTExeVB1M1plVXhS?=
 =?utf-8?B?ZkoydC9XTDZrb1NYVmh0TmxVaGk5UHJjb3NqVTVnWjFOOVJMQmYvQk9JYWNw?=
 =?utf-8?B?alNqdkNzL3AreUlLTEhtOE9YeWdJdllrc0ErVFpTT1ZhcmFKbUtqS21lbWtl?=
 =?utf-8?B?N3FqcmIvYkZkSkpQYnp6Y1BQWGdoelBDcUwyNmhWZjcwWURGQ3MwU2UvaTJK?=
 =?utf-8?B?QStUUGFxK1JhSHV5ejdpVy93MCtyOW5xVE8yRDhDU2tBSThsVXNiRmR5RmFT?=
 =?utf-8?B?blJmays3VUNyZklxYVFRTU43cEJSTnJsbWFlQXRhdmswUmg1QTA3MEpRVEFW?=
 =?utf-8?B?K3FOWWFXMW1uZ3R3N0xIcmtWVDFFVC9aWENnTG5zZm9wSlR4bnk0aW5ZRmlL?=
 =?utf-8?B?STU4TXRaOHpPbm51Snc2YVgveDVDaEJ2Y09NV2tYU2FBdmgzaHE4Y0hZUURt?=
 =?utf-8?B?V2RSbVlRd3BLWXMzMFBuUDVVNjVrdEM4aW1sZ3FHdGVTTFZmV1pKMjBoNkxp?=
 =?utf-8?B?UzRBMnNjVGRGOU9HVytnVUNZUFFjMUFwMlZBTUdtUVdTbEhKNkh1MnlrN1kx?=
 =?utf-8?B?OHhjSWllRk5nQVVySEtOU29IaE5VbUhiWDRGNXZJcTIrVGVpRzhxL1prMzVD?=
 =?utf-8?B?c0gyaC9zdWlySDh3SlBzb3V3VHg4K2x2WnEwdUpuSy9oY3pURi9BcnBoTkhO?=
 =?utf-8?B?aVRwNkpaM2hVbGdKZ3grVXowYlBDQXNiTjg4QlVZdmNJRDNkUHY2Z05KUXZU?=
 =?utf-8?B?ZWdFQlR3aXBqcU5qTmhEdEVIYXV6blZXWmJuZUFqejJUUDluNVZvSnJGU2F4?=
 =?utf-8?B?ZjlnM3E0ZXk4a0cxQXIvQlZlQ2RnSTRHRHhBWnVIQVdPMWl5YVR4NVlXQlpn?=
 =?utf-8?B?T1h6dmpTMXNrMWFYNXlTczBDaEExRmdPczZoNmlqQk5jc1NVWnBPbUJuNmNV?=
 =?utf-8?B?ZGxvYVNSeE80dy8zMVp0MWt1bXhVOFY5bktCY09mYSs4OHo4Sk9pamZSYUpo?=
 =?utf-8?B?aXROaEMrclh3aytmRUtTbkRvVkdVMC9yV1A2dVJuUlA2Skp2MnpYcjRQV3VJ?=
 =?utf-8?B?MCsxVXhHMG9Uc3RTSFhza2k0V0ZYaExXbEd1M0dSWFdZQjZQOHFGZTZFdmVz?=
 =?utf-8?B?T1Jla3pJblc2aXpvTklqSWxHZWdFdEczdHRnaTBmMFJ1dmUzUnR6amJvVm4r?=
 =?utf-8?B?bDRRSGgrblJENGVnQmlsNCs0dWhRMVZXYUNGTHZYTUUxSXFjUmtzR3dhWEhz?=
 =?utf-8?B?OE1uMWtId3dQeXR6cUJYcHZGSjZ3b0JBRGwrbW5uVHBtMDZNNWk2aHFqRGJy?=
 =?utf-8?B?TzhtYUptek41SS9JTnRCaEJ0TzN6RDNRbDB3aEhFaVV0dGNiOFVjQmh0dkFp?=
 =?utf-8?B?ZkJuMmk3Rk9UYTd1eGR5RW9iQWgvWktLcGVMNjB3SitrUkRjV00wZGFsRE51?=
 =?utf-8?B?TnNRMWZjM28rVU9kQzlkQkFpR29SWlNQVE5zdVhsYXQyNFpNWFhTNmZYenFY?=
 =?utf-8?B?WE5TamR5eGk3clI4UEdTUWkrZ1p1RUFDVlV2RStqVmFEOG4rYjBGUGRKWGJT?=
 =?utf-8?B?c21HQlM5cjliSDExekxTTXRjdUZ1dW5OQWh3YkJnWGNEZkdyOGJLM1h4bmhh?=
 =?utf-8?Q?xBfO1EVG7kmAoMYg=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ce19f4-0c4a-408f-940a-08df28ee6140
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 05:54:01.2649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6QEiILyQYA9Dldu8tSDBsUXREgWs0WDyZDP331kkkSxih/dEyLUUe0qxTbB9/OaK6Q8JwTs1vpWPP9pn2Opxla4Zhqt+sjdmblK1uNYSSrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB440844


On 9/19/2026 6:03 AM, Thinh Nguyen wrote:
> On Sat, Sep 19, 2026, Ng, Adrian Ho Yin wrote:
>> On 9/11/2026 5:04 PM, adrian.ho.yin.ng@altera.com wrote:
>>> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>>>
>>> Agilex5 integrates a Synopsys DesignWare USB3 controller that is probed
>>> through dwc3-generic-plat. This series adds:
>>>
>>> 1. dt-bindings for compatible "altr,agilex5-dwc3"
>>> 2. matching entry in dwc3-generic-plat
>>>
>>> arm64 DTS enablement is posted separately.
>>>
>> Hi All,
>>
>> Gentle reminder for this patchset.
>> The device tree patch has been applied by the DT maintainer.
>> https://urldefense.com/v3/__https://lore.kernel.org/all/02d94760-6e5e-40cf-9354-63b9bca5d682@kernel.org/__;!!A4F2R9G_pg!fOoRba7F0n_QcIeLW1hJWdqm-cZ-1LeU5F9IMVQONnR-eK5J5_SUcboibLdpMDbyKiobonza5DWeJd63mx8kk5_kzayZsEM$
>>
> This series has already been reviewed and approved, and the
> corresponding Acked-by and Reviewed-by tags are included.
>
> It's just waiting for Greg to pick it up.

Hi Greg,

Gentle ping for this patchset.

Thank You
Adrian

>
> BR,
> Thinh
