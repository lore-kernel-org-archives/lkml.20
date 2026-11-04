Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793804706;
	b=GlLaR/tmmQC5pqBoBtg5I8Oea+1A0Kk9IbSdhjKFRKzvw37n8BB+zvLT7bfCtrczg+aA
	 NwkLNX5JFEGn4FAWbw+Q3ynkbPSXEPEhX21Sy0LSSH51gaoUCexCDT/Jgc04lJjglcWoP
	 rsqIIaKkS4VubAQkBtZgl9njJH9oCvuURg2NkUp7G52bnXqUqhr2j9XS03H/4RvABZKl1
	 3lY9cjrWOEwzNk0S6Bbx4pO6BmQLgdPcWLLgNVml7XyF6qHIilYQ27lY4NDZy6HL0kbWX
	 6EYgnLGBRaZmeDHp+I5SBWe61Rgrb4aSP/99NrZwUTV9R75RkKGW4zcbpUoCnOD7VRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804706;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=aDhZKMhBA0f6knv1nLQOStZCAghWBwd/p4ZbGVOuyMU=;
	b=oaaxp146ad3qqXis0QF9f645xnfoTBPsdmXG6Zr/jFjpiJX6bWrFzuPHMyWzXfqX+Bhe
	 j1V+NNk/0jLRTYmx/3t7AfFnge2Kb7Qc2cjFgYTI2SO0IJl87KuaASiQv5mkkIwx4ldZo
	 JoXMqfcnJvcA5wqTayTTXHzANA+8/z9hj5GPlFdVpXqklecysJDD049CpiwU2vPM3wo2p
	 jzVoZekEBabv5lL8KPawnVEy8wrUZ5VI4+sHv49LTEQ8yhn5eFhbOCCt/56lCMM/kH/Jm
	 deANVlwoFQmxEDadnYp0C5j9vjPbSrUpcApHG7Heh7pUIQt+fZkG8a/RNVJnJXzJhHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cherry.de;
	spf=pass smtp.mailfrom=cherry.de;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.45
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013045.outbound.protection.outlook.com [40.107.162.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44AD606A32E;
	Wed,  4 Nov 2026 15:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C44AD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nn1XlEf7dse3KfMyl7Kbbww2pZdm9wK6JZy9tEFY+6Q8ZuZwubpHYcKy6T90CRc8W3SPdGCMOg2h1gc82xmARUaIb93Rgg7lDmUf/Z1tub/xx5e0FOvemZXq3//8aPov2+Osyu1fI2IeNeNPQX3gGU+pJ5RE3uqEK5K9C5JmwZ/ON5rBee3xoYPgiBVAauBIYY643w/kPpbHDfQE0CjU5c+WQAdIQne3cZ7POEqjjnWCPtsAAt7juGscpMXykm/qoM4hCz1mTJy+WdG6ARcFLr7VYrV4n8nhq3eYY2S5TU9V123XxEeDELN52+jxV6iUJNTP1AR7hoW14+6XgYZcMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDhZKMhBA0f6knv1nLQOStZCAghWBwd/p4ZbGVOuyMU=;
 b=lot7aG9Lv/LzoYBsKTfxOsWyux58Dkl6lWI0M9nw7IKjmz0P5LU8VTXZlxs/pCs6Yt/zjR4xKknJQmF1dm9eFd9demKi/pfSz6qNfBziYXDPvgZ6C3BX1JP846boBRm7L9vobMNAK9gywKM/7gedSlhVfoyMgbaoL74fva13MJFx1XoMUzpYIqhgNOfUcLww1/giz9BRFevwdxbdyC2xNWjZ7hQp7QO5uP+UpnbWcoSiNj1ZKwqrFjO8jU2ap5Cp6omkooPxudGyUL7J4dvTazxGcwu/gF8hnh/Or7h8nrD7cDIIZSkTpt5EDv4fSLvpVHRtcsX9gwAbfZHL9CQEaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDhZKMhBA0f6knv1nLQOStZCAghWBwd/p4ZbGVOuyMU=;
 b=H9SFXeUAyT7uEEPq3iEeGzDEAhuG8zlUn131o+mMbNntpHBb0lb7jqd8ObrNspgbphtFg6Xpj8WnnzGYt2KkeDxwnOU/6vcJROoC3ryj6LgO6BrDsgMA48YA7ED0pC5tamZG2QMbRYcq/yPPGYWsI2THhDKnJuByMTxa6rxOD4A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by BR2PR04MB325065.eurprd04.prod.outlook.com (2603:10a6:2c8:7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 15:05:01 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 15:05:01 +0000
Message-ID: <55a65ca0-fc02-4086-9b2d-6bf7b4a208f6@cherry.de>
Date: Wed, 4 Nov 2026 16:04:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: enable OV9281 CAM0 P14 on
 RK3588 Jaguar
To: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261102-jaguar-cam0-cam1-v1-0-c3aafcdab5dd@cherry.de>
 <20261102-jaguar-cam0-cam1-v1-1-c3aafcdab5dd@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261102-jaguar-cam0-cam1-v1-1-c3aafcdab5dd@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0091.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::20) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|BR2PR04MB325065:EE_
X-MS-Office365-Filtering-Correlation-Id: 091e431c-9233-4309-1aab-08df3a84ff0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|4143699003|11063799006|56012099006|261028144727099003|261022105027099003|261022075727099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	0TO+hSksUEnpjy/QvYlSl+Y6wQYCRZDCKxxIyedNzO081B5WeIomXyzXUH4ydauo20EN5lsm6yTuDa8BNhrtbVXdlH8pE7rq4H+S/iEh6IqhPC0UJrnM0RaNwyVgqKfW5xzHwcW22QIHp3Ke6ruCgjWWBn/wUo6PfEO+rld0ddtx03+bDQdFaO2JsV58GPnkopkRfum4PbDdn3rrbfLrDAgTi1GmIfQ6Tr7CYTV62SZpwPEePGqZBaJj09W2l/+oCLKMNaj/qD7wScy/Sn6+Ni+Ne9z7vufz0hYKCIchHP4LvwTUaaeJXPbaFvyjCY4edqYpVz7yhomvOCXiwp8Kp6VrvCiGJCEyHMyEykumSeC/qse8B7xEpGr12kc6RkmuaT86gcPbrPHoK7I3zzSXXQ/o4mqAs92/hJvc2fQOoYhHURhiU+GK9uG+yoeVA6gW7HGPFUNTiCbU+Wu/g8BnDL2x4U1zaMjV+rjc7KkS8IkpNGD3FgrHFJQv7SMzPilgEqBtn5G3Cj6u/pm7nPm6Yp51eoktkzNS5qtfjwVZXxvsZM9QJmv7j8CbS1IsT3Ti9/X+ASHlTsDfpU1JjxVNfPjQH2mhbd+skDOgt7PKxbAcqKcSPucEExhCXQI1nMhrCYSaQQEbvyrvHWPMJ8qWOvyTvEM4dJTTWmynTGnnDyY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(4143699003)(11063799006)(56012099006)(261028144727099003)(261022105027099003)(261022075727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUlXZ1VXQWFaSVQwNXc4QlFwT1pxbWMwb0M1OGlGdDI3LzB4NTBSYUZBVmVP?=
 =?utf-8?B?b080ZzRCSUFGa2MvZXM2eklWaVpxdkRBaGIxSTJKNGxqY0xHUnM2WjA3eEdQ?=
 =?utf-8?B?K1ZtQ2dubE91dUYzalA1R1lwaWg0ZnRuT0NRZzJOVGlwVGd3eHk5cGpPdExt?=
 =?utf-8?B?RFdQeWkrc2d6Y21aUkpFYXRJVXk3ek0wRkFnOXd4UWp5T3hvcU5scFVTTzZm?=
 =?utf-8?B?MlhGUklQTHpmNHJKTzMzVWl2cHpSajd5TlpFbjJJYVY2aGRTWjd4SmtJYXJT?=
 =?utf-8?B?RUdNVkZGVUlTT2lSbjlIWGZmZnRFKzRBNnVZcUt3dlJ0bHo1ZGlvTWVMTUJt?=
 =?utf-8?B?ZTUyUjdqdDgyOG5qRUJhNU1kK0o2TU5KUWdhT21Od0hEd3Y3NUJUN3hxVEZz?=
 =?utf-8?B?MXRNTEMzZmVVUGFlWVBNSWZyazh5ZzRLbFRMYWwxNzcxZGZ6c1hUSkFHM3BI?=
 =?utf-8?B?RWYvRFo4TExId3J1Mm8rNzdqWmJMcWlhaHFINjNOWEcwTFNZU0VOZml3NzVm?=
 =?utf-8?B?Qk9aUXZwbG5ibzRlQlhiY3JiU002U1NPL3FnYmVpZGx0c2hENHk4Ym1WT2xS?=
 =?utf-8?B?QkpNMlZZY2FpVUJOT2kvbTB5akx5OHZUZTEvR0Y5U2lKb2RNQlFmN2k1Sm8z?=
 =?utf-8?B?Sjg5R294KzUyOWp6M3g0U3grc2Z3VjFyWmljY20yaGFHOVdKZWY0VDZyRVlw?=
 =?utf-8?B?Z3JFT3QvVE14ampEcnY2bDliV0ZZdVNialUzazAvY2dHOXBEQlpUZ09BOUpq?=
 =?utf-8?B?blNXdE0rNVNlaFdoTDUzZ1NCZDk0djNiR0JGb3NDd3orVHFFY2lIdUpqVlp5?=
 =?utf-8?B?YUhMdkxGL3dNTmwzVjhWdTEzVzBMb2x1aWE5aHU3VDlFTU9qVDgweDI2aHVp?=
 =?utf-8?B?Y0w4dkEwWHVOc1EzQnRBeWhiVzNMRnFGTjRZNkE3OXlyd0sxQXlZSERPMm5F?=
 =?utf-8?B?Y3BkN2RWSGZvWFFnZEEwUm1EaFhOVTF4dkZlbDArUEpkVzJlTU94L1RuVlVZ?=
 =?utf-8?B?ZURFeEdKWVl6VWRXQytPdG40Qmd0UGZvV2JmLzAxdTRMV0dHejk2bE4zaXk2?=
 =?utf-8?B?TklZYTBENUhITDF0SEEyMmZyRzBwZlA3TWxBUHF4Y0ZFRVhndC92ZU9uSU1x?=
 =?utf-8?B?eElRc1dKSEs3enBPZ0VvL08vbm81Vm9WRTIxdWZJd3IxSm9mWEp2VVZhZnVW?=
 =?utf-8?B?VEJBVUwyVytEenZuQkNIYVdMc2R1TmJYejJkTFZKWGQwVzk4TjNRbXJDOUIy?=
 =?utf-8?B?WURLbjg3amJ3UHpNTG1BeENJbWx6YVBLNytNY0QwbVFZNnFXVUpaK3c4MXF3?=
 =?utf-8?B?dkk4bUZybUh2YW9WT0xhZmtGekVXY2xHOXhuRHdMMnYxS3NXZk5HVWl3TTht?=
 =?utf-8?B?MWRCWkl2WHlUM05GWStMNFgzdWJDOHFvRUw3WHJkZFdKTDNsWm10Qnc4SUdk?=
 =?utf-8?B?M3U3akE4Z1M0LytocE1ZbmZhZTYwZnZKUUNXUFRtY0FYay9SOTR2S0RlclBj?=
 =?utf-8?B?bVN0d09FQy9JdVFpaHowS2pkUFh2NDNTcVY2ekxaSy9ndU9qVkpSTTRXd245?=
 =?utf-8?B?VFBpdERqTDJLQ3NTbks5WTJCY1FveWJ3Mnk0NmxOZGNLUEZYS3h5WU9FNzRJ?=
 =?utf-8?B?dVNsVlloUThQcFJvWjliVE9FbS9COUl0TFVoL0hGdnpHZW04OW15amc1Tmlx?=
 =?utf-8?B?QVhJODEydDhGZ2xveEx2aXhONTBrdmNYUWJKbjdTOS9VVWJLcFVTRTRGYnN3?=
 =?utf-8?B?VEVhbmpBaDBSeFRCamhWLy9MV3BVVW4ySVVkRGRLMnZzOUJlZ2RjUzI5TTRh?=
 =?utf-8?B?bjg2OVlLOEpjbFI3SExTNUtGZFZ1cWVUQlBFWFZGajJMYmp6V2NaY1RKSUNq?=
 =?utf-8?B?Qy9ZUkdFdXBiUytzQmRDbGJtNDNMMlc5SlQ0ZVVZcklQL05VVDdDSlRrU2xY?=
 =?utf-8?B?T1Zzejhva3dXd3B2Qm0ybFJwSjJLYXNkNnd5T0tGTmlWTG0zUWQvelUzWFJF?=
 =?utf-8?B?d3AwM2JzTklmcmZicWswMVVESGJzS0tEeXc0WEtRTjk3b1lkNTBuSHNpU0hS?=
 =?utf-8?B?bVhrQWhsNWlzempKSHE3N0F4T1ZCRythdWs0NWZwcU9MbXhyeTI3Qys5Uzkr?=
 =?utf-8?B?WTUveUVzWjdzSm1HZ2FsU21neGhYSlRPS0k3eW9GV2VHTmtZTEwyNzZMcFNB?=
 =?utf-8?B?RlBWYk1JWVhMUC9HclFRNm8xSVZtR20ybXlMdEVmTmdUcjluNGY1ZlhCRXYz?=
 =?utf-8?B?Umo3NzZKNlRNemVuM0FtMzNYRE5Jeis3RlVVaTR4bzFqTVdma2V6L2k1V3Ez?=
 =?utf-8?B?a3YvMy9EQmVCZkR2bDhyWHd2cDRrbGpJQnFuS3BKTUdFTEpaT0pXQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 091e431c-9233-4309-1aab-08df3a84ff0e
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 15:05:00.9322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEgIeZWNPV9STuOhSRb8vOQCSCVVZnzaCZ8dVqMN2ZCA/36VXi1fgIXQ+8/CiYXstxWnr8Ks8HuMaA0qZQ8KM9djJwZ/af7r6KKg2BNJOxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR04MB325065

On 11/2/26 9:30 PM, Quentin Schulz wrote:
[...]
> +	eeprom@50 {
> +		compatible = "st,24c64", "atmel,24c64";

Turns out I was looking at the wrong schematics and this here is a 
TD24C64-C-A EEPROM which seems to be from "Shenzhen Tudi Semiconductor 
Co., Ltd.". There's no vendor for that in the bindings, and not sure 
it's worth adding one for? I'll keep the ST one unless told otherwise.

[...]

> +	imu@6a {
> +		compatible = "st,lsm6dsr";
> +		reg = <0x6a>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <RK_PC0 IRQ_TYPE_EDGE_RISING>;
> +		pinctrl-0 = <&csi0_imu_int1>;

After double checking everything, we need an additional two pins driven 
via pinctrl to 1) guarantee the state of a bootstrapping pin to select 
SPI/I2C mode, 2) guarantee the state of a bootstrapping pin to select 
the I2C address.

> +		pinctrl-names = "default";
> +		vdd-supply = <&vcc_2v8_imu>;
> +		vddio-supply = <&vcc_1v8_s3>;
> +	};
> +};
> +
> +&pinctrl {
> +	cam0_p14 {

The review LLM highlighted this, where I should use a dash instead of 
underscore in node names, will fix for v2.

I'll wait a few more days for additional feedback before sending a v2.

Cheers,
Quentin
