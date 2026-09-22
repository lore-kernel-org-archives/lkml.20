Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011052.outbound.protection.outlook.com [52.101.65.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F79372EC0;
	Tue, 22 Sep 2026 02:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042503; cv=fail; b=ZyUvgxRA64sWPH1fkOYn/HeEOSyJL6FZQJ1IUXlKVR073JeBUhOYqeNBgT24lIisea8HDtf80rQV0w7IbHlIfgjM5CuOKmtnYzfqovWRAd1zTxG/tavnjIm5Y2UWvKN+x0I5Ur+pj1zoaF8J0wCGSah7uQjqACPNaovzkNAokYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042503; c=relaxed/simple;
	bh=tcSliTw+XM0SAl7EPFcdMyL4Kjk86leHzsTZeI8hYNM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=naZL4d++Wg46K2lHb0cY+5bc6tLSmbGb0rEpPVqv2pjO7ewblGIPa/00SK4kBEiL7t0M3FIPb/miIzeVRszqaf0bsjoFv01WO+quHaXikuHjSMZwqTTPbnQ0hD7aDliIjyg06XbAJPrBQ2fnkuNN7ZSiY11PkmNUYQ44OYZ/Kvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TaBVI7hr; arc=fail smtp.client-ip=52.101.65.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TaBVI7hr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNM3ZPUiL/uDpnHWy3qvtWzEsMpcS12R1v7B8E2Zb8U/fTNWP19+/Tn+35ehD7uaF1TKc2dOtXZY50wXTz77o0YjQKwg3Ksr1NO+cnDhQMAgeEOnf9wj7+uGdClI1X9O9xS2WYWyS//QIUpVAJdEfD00HvdadS23NBFjbY+4JTBn8qIGFmcWTZYcTSsExdUPLnXFD3zlZYppDElD5x8f68SZNZQy0DZn88uQBX3/ZNN6Uu3llyXfuYxKLvdz2dUbCoP/oj41um2/N9Ll5sHtxTK1X5kA3Sanka1WSh3ey+fcOZWjmu5UOv78nIDoxSdz9V2Cx02iZy7DDkFGWH5O4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jN5PYVF8MPwYaqFtg/6xwR7dPiJsGXG3yDgTNiFVMI=;
 b=FP/OynCJr78xX7AOFlh+jzPxKGwxpbFGp6X5Adz1PRJprdmppmPh8aPq9GRUIKNpLCrtBhiR5Igfr3t5moBOQnRCWyR49u5HLIM0C24kMsr5RaLeJQVZKqQHiokAne9x80G8xj38agfmYVxkwWqDNnxIhsKHwMS06xewZlIm2Ue9tmO4mjxWHCzExn0gHXx+9YJ9KPB86/y8loqB/JEBggwrnZLV5AzuoupV9oiPT4Za995bkQC0nJQ5fOyW0rGhhpH59Ap8P7/an3WOeRu2BmuLzJ3jVul7goVIgJZyjodjaWi7fL4/CMhc5G9CEEU74SrxcwgzbuNRQu2kS0UVDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jN5PYVF8MPwYaqFtg/6xwR7dPiJsGXG3yDgTNiFVMI=;
 b=TaBVI7hrPW/hi3vm1HAq4HQMv3zVBWSMd35yIeHEm1HM+WkwAhlyy6TRnIlG4Ts6ucFZrXtHirYVFZquH10py5CEc83qqUzoAfY+fk9IsmvjLHsvOSwUVMepKyzlgJARj7Wr79Sg8CVMoTHIIOEE9ETvMK9N+c0x4Z5+r99C0KxLNpKdLNzR3Mn7Mw2yIxUEhl99ahhyqPEona2WW2d7oDt5Lk8qf80Wnpb1hw14P1HSkpHXMRdn8CW3Lb8lKXjMwLoGXymnp7ZPF5XuD3uGIekTvJpdTBMebjGktFV4gFJXLjiF9Ek7sxtaY+Hg7FgZL+3QDJ+uevjtMyjq97FBuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by VI0PR04MB12235.eurprd04.prod.outlook.com (2603:10a6:800:333::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 02:01:36 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%3]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 02:01:36 +0000
Message-ID: <ad8b7cb4-f6f1-4977-b67b-9644204721e1@oss.nxp.com>
Date: Tue, 22 Sep 2026 10:01:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/21] ASoC: wm8985: Move regulator acquisition to the bus
 probe
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Oder Chiou <oder_chiou@realtek.com>,
 Support Opensource <support.opensource@diasemi.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
 <20260921104640.1941554-16-chancel.liu@oss.nxp.com>
 <arEalD61KwxqRt1g@opensource.cirrus.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@oss.nxp.com>
In-Reply-To: <arEalD61KwxqRt1g@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0054.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::23)
 To AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|VI0PR04MB12235:EE_
X-MS-Office365-Filtering-Correlation-Id: e1794230-c6f5-48c2-a55b-08df184d6ec7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|19092799006|1800799024|10067099003|11063799006|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	4UkfJorWzo7Itkc+kEaEfo/Lz0obeNN1Vpn5+MlFYW3UzmSiy0VAsu3Nph83W6GMgRpf1hH5JqYyOffnGMDaCUWus5WB9yKqQm4i3Ha20qZr0nvgwFLkyEumep116jOqRrFre9R8zeIcTdl94sfp2mLTKVBVQPv8G4ch6opJ8jQNyDmo0Qn69eHYnZ9ZWCnEBxqTpTqN5k60l66blAGk+vgW14tLxu2p1lGFvCOHPPbyfk4V+R4ys/Ifyp5I3Co2p88ZT1uszmeOVsSWqnrgL014itFOkWPbVTpMlUeg/u/S1jZiVrTY0vei8b1wQjkuP4sM4D0RApHLklpqgGjwR671lklzgJ5psrDSY1dZDK4jUu1EMhEp1eSrmmfenVymg1vCXF7UqCJGC8Uwk671PvbbiJ5jvdAJJhBoC4zZgNkN7dTUS9FSPA+0EKxBlGFw1SLBLtGCbl3BDgXSyVNQ42SnAypbgq678wgcU5Po47DVRjHuegr0dwi4iRWPavdYz+juwZ+lRR9GOU7lNqsuJyQFIvxeO8Vqm1lLlVu1MIwA0XTgBuLBJ1l2YlnmmJRj3gcHS+tLLtW5XXwHYjyz+AGBUhaImCC/hf+G6LZpfnl3pgC8gMIi+LETYmyO56smxtz0Plog7F36Z9qXMgyFl9+utcY53l5om/cV2kDHokk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(19092799006)(1800799024)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWpaelY2UDl3b0cxWDI1dmNweVlibnpmYXNRTkVhVnN5ZCt0b3VhWVNJcU1L?=
 =?utf-8?B?dFA2MW5BTnB3S0hQTU04TENnOTF6N21ZZmhMeE10bzY0Mk9QY3RXR0x2dmUy?=
 =?utf-8?B?cTdrU0N4MmNJVG02SE5xSmliSnN4L2p2Z3hPMXdxR29abWtWVWttaXdJK1Av?=
 =?utf-8?B?L1k4N2l6bzkxVUUvNU1USWVYcEtna3F5SkJ1eHJxa3F2RVc2QzAwL0xyN2tu?=
 =?utf-8?B?MWdkMFFDSXJUVmZuV0IzcUhlckVWUzBEaXRxdWgyY2NNeUZOWEVmQnFTUGdn?=
 =?utf-8?B?andrNVVCQnVpNXZZNFNnZTNIQ2V5SDN1d29SdkpvV29Icm5na295WFRuZUhm?=
 =?utf-8?B?N0pmUTEyeTk0bW1iMis5V3h6VGtTd242Kzd4dEFYT3l0VzBucEZRNy9kM054?=
 =?utf-8?B?ekZqa0FFRXVxK2c5MHNiQU1jK3dEYXRDZlh1NnVqZkhOclNnVEVBVXY5WnIv?=
 =?utf-8?B?cXQyWEFMVmxlSlIyNHFwWGlCaFlVTGtEanJiYW5yclpxY2Z6dWs2NitFYVRF?=
 =?utf-8?B?UnR2Z1NIaEZtUWxKQU9GNkVRT1RvUG8zdTYzZ2d0VUFRZjhCbktwWWs5T1Ey?=
 =?utf-8?B?dTF5U2NveWFhZy9jVkhWQlRHV2V6Y1RoeEpEWHJXMmx5dThvL1pCQ2ZqYmVv?=
 =?utf-8?B?QjNlTS85TUoxVEV4SGhMZ1d5YVdleFJ5MzVKbkROMFF2K1VRZXhaM2lUYUFM?=
 =?utf-8?B?TmZpNFJFcHVic01nMUswbmFXUE5GVk5yZ0piSFpKMXJuRUNIbDFhNnBwU3VK?=
 =?utf-8?B?YnpCalM0V3Q3Vkd0djJ6Y1hud3JrZUxvbVA4Mk5jTXZ2ZUg5T2lWK0RGVW4y?=
 =?utf-8?B?bjlaOEZUWk13dVAzaVhDbGwrS2h5ZzdFQ3ZrOU55MzJ1a3R6UXN4b0JiMDlC?=
 =?utf-8?B?NklNajZ4VkRvZWVudDdZWkpXeitTc2Q5SmlKZWIvVkg4QUFnK3piVmJ0a1BS?=
 =?utf-8?B?bEZZNFBXNVlyc1pCRm9rRThYLzNvdWhUT0xldisxYUZtRUM1enkreXc4VnBS?=
 =?utf-8?B?cDlnblNxRmF0QUN3Y3RER2MxNUlJbFhMc3BKVnArOUd0S1B5ZnpKUktUMllZ?=
 =?utf-8?B?VU02MHlFZmx3M0JucDJJZlk2dy9PMlNQUjduNnBCbHQ3ZGVidFUyeWNXKzRI?=
 =?utf-8?B?TE9ad0xKMHRjNWpvNXVhOWQwZnBlRmJTMC9oL2hERTUzWUF1dTRiRlI0Vy9E?=
 =?utf-8?B?YUVITXhXbWFRUXdlNXhNdGJidGdycWc3ZzRERGJjelBwbWFXcFlMckhlNDAy?=
 =?utf-8?B?b3pLQXplTXNtWGlveXFvQ01GaThPYnluM240TC9zZ1Vock1raHJkeEhVR0dX?=
 =?utf-8?B?NzM1VlNMbUppR2VjQXowb1lUSDRKRCtnZlVoUFZZbjNPM3NuMk1oVk9FZU5p?=
 =?utf-8?B?RkMvM1RZZXF6VVU5d2VEZ2tQVXhRS1ZOS0pCMzlvQVVWdE5ROFBOTE5wTVMr?=
 =?utf-8?B?NW1VdFd3WEZxMEI3WThhUk4remUzeFJTdWR5eHQ3eXhrNHB6V2lHUjIrQS9a?=
 =?utf-8?B?ZG8rMlNLRDZza1p1d0Q2YjBYOWNEdm81b012ZDNWZTZ5OW9wQlIzVUI1eE51?=
 =?utf-8?B?U2tKbVNZL3JHOWRjRm5TRERvNmNkejNHZzk2TTZOck5qdXUrT3kwTDhISWk0?=
 =?utf-8?B?TkhWWWtmeDEyMjRYSk11bW5SOUsvZEoyZUlrZk1nTW9xeW8yTVdZcDBIdWhK?=
 =?utf-8?B?dWtucU9Vc2F3ci9IVzV4WHhwTnlTSVJnWDBQbENUUmxKNDBxK25xNEx3UmZ6?=
 =?utf-8?B?bDJaZDBiUFFMYXdYbVd1Q0cvc3dhdlBlVlNjZnJ5WGtxMy9WKzkzYk91WHhX?=
 =?utf-8?B?VFFCNVRFTGxlaisxelBXVEgyOEdzZXFRUHM1Z3VEMEhsMGl0TmVzWWpLUHVj?=
 =?utf-8?B?b2RmajNZV3c2ejBpNmVkeGFYMXA5NkI4WE12TmtaQ1hBVmZHSjJacGZWRTd6?=
 =?utf-8?B?SnZJM21tVkJxblZBVWNuY0YwTFNCd0ZZSUpXem5XMDRLNnFaTHFOTEtZL3Na?=
 =?utf-8?B?Um9FZm0ramNGRUx2ZEc2bTcvQWo1WStoVDBvZHg1N29Tall6d2pIUVcwV1JV?=
 =?utf-8?B?OGhsb0VhZ2xEcXlwMTdnbzhtUi9oRjNYYkJpc01pMkpmWTdYZzIyVlIreTRk?=
 =?utf-8?B?eGRJVVVkUDBVd1hYaS9naG5IRXhpS0xTYTE3cEdRbkFTa0tZM1ZGM1lhbmJN?=
 =?utf-8?B?OC8remhuMHU3Q0FZeWZRWWNVVXE3OFBOZDRGRzBXd0JlcVhiUlJhb2Z2L01o?=
 =?utf-8?B?Y1lRSGg1TzFkclREWFpVRTdNZ2VWTWRwZi9PdzYwUjFEV1RiM05FSzJCdW5B?=
 =?utf-8?B?cjdieDhSM04rZXJPMlVPUUplM1RNbVNRNTBqa2M1Vlg1T2crWEY5Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1794230-c6f5-48c2-a55b-08df184d6ec7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 02:01:36.4557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Veq5itpsTcL2bfFCkdn+CbJMNGYKTEh7dmxP7ukTgkucrTVVcesC6NCjxMtuhXwDwrVKHaEK1fA1TD4TWF8RPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12235

Hi Charles,

Many thanks for your review.

On 9/21/2026 7:52 PM, Charles Keepax wrote:
> On Mon, Sep 21, 2026 at 07:46:34PM +0900, Chancel Liu wrote:
>> From: Chancel Liu <chancel.liu@nxp.com>
>>
>> component->dev is the underlying i2c/spi device whose devres is only
>> released on physical device removal, not on ASoC card unbind.  Getting
>> the regulator supplies with devm_regulator_bulk_get(component->dev, ...)
>> in the component probe therefore leaks the regulator references on every
>> card bind/unbind cycle.
>>
>> Move the devm_regulator_bulk_get() into a helper called from the i2c and
>> spi probes so the supplies are tied to the physical device lifetime.
>>
>> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>> ---
>> @@ -1176,6 +1178,12 @@ static int wm8985_spi_probe(struct spi_device *spi)
>> +	ret = wm8985_get_regulators(&spi->dev, wm8985);
>> +	if (ret) {
>> +		dev_err(&spi->dev, "Failed to request supplies: %d\n", ret);
>> +		return ret;
>> +	}
>> @@ -1212,6 +1220,12 @@ static int wm8985_i2c_probe(struct i2c_client *i2c)
>> +	ret = wm8985_get_regulators(&i2c->dev, wm8985);
>> +	if (ret) {
>> +		dev_err(&i2c->dev, "Failed to request supplies: %d\n", ret);
>> +		return ret;
>> +	}
> 
> Probably slightly nicer to include the error message in the
> helper rather than duplicating it in each probe.
> 
> Thanks,
> Charles

Agreed, It looks better this way. I'll improve it in the next revision.

Regards,
Chancel Liu

