Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013044.outbound.protection.outlook.com [52.101.72.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3951B652E;
	Fri,  2 Oct 2026 14:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950877; cv=fail; b=r24mtUx9gDpKsRBMTiCvruPxhWRBtG2+XilzC7X/9BCey5VyQzwE68H2qCDWlMj8n92hnraEemdiqzzVgCjPxtTiV9oOAWq4Rm691Ak4rpjNwrOhOutXzsjKgp67K8iicM1iZJxG1rf1vzUvJP0k69TZQ4OiIfojMWo2CdxIQYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950877; c=relaxed/simple;
	bh=qPc/6m2IEFqXZFgLxQgJPLaauVQf1yEt++GgSld7zRw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=S4xL3uAK6ljpLC7l6cpT5bq+FFCuJEhngQEb9oflyqNu5M+n0+opJqA4VboUTF4xWhjWvsaK9RykT9NcItZ/NRSjclmXGCrMvBbBKEesnlbY0bAvEd7CEm8u14W54z4dwPcYJvcUCRPc8liWcdj8hubTW58q5nND5Lng8PA2tBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=JRJICKO/; arc=fail smtp.client-ip=52.101.72.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="JRJICKO/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYmMsT52iGDdOUa904dLF7zN/UnCFJEllaKXjpaBX8u3tHXqF4LEtxd9IfCcbn+WNtfEEXhRVq8vHRN9Qg2O22KiTHUvw+RFp7OpH3otVDP1llKaWH4bOM89nm7xiCG9ETKCFEp1Mp2Lb/90VhGCggi+exgkSsKt3b+j97Ag1/ReVKTcxC6Z7uX32zspMl2lFlRIt+BnhUT8iB8dmHCL3qnrYVy3+FwWz09eerrzjOhk5FrGuE7tAga4Cv/ajNLn5/U15KXA4dY3OVA5vxdNrlKda4F1in92kQswarfjZtJMw3hEtsl3QiJL8FE7/9x9NuXDoe8jye+UvWXFcLYGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1O0KxXTf/rqNht9xOAqfN9Hq5Agmj4ql4Df9OUYh6k=;
 b=uZwtw0aMYGZiA6G2/6wgxEICKK293+E11hrWBGce7Q5be5r7VgoOczss4+/dnLnR4VXCM2vCQXkTURe6PmY78GvrVh5m2JFd6BKvMe1EwtYxIUn3yi/uJmGspWuOeY5a2So73b/MxXk4RbV64x2lty3DLv0FKQEjYFXHGqVYDaKqCEzOtshutEu8ai3sXTusbtKLn/TMEiMjjTpO4WVVTkmxhGA2z+3g5lr5KBm3mTgR3JIpAoPDMMSBI24BkAJxDgAj1IXMuhxBHV2nQjVE3xa8sMpIk7LCT8XtyUX24DETf4zqySZDiMjoqCLg+lWdMuRORAQ7ihDntKy7/u54oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1O0KxXTf/rqNht9xOAqfN9Hq5Agmj4ql4Df9OUYh6k=;
 b=JRJICKO/yjDVNAUO3K9ohwe8G/TwlFtIgTjBojZWHbzWswD7coCucqyE3M7rPt+fCzJXkdRaHOI9L+Z4C/2J/GnsacAjDLwH64cxYrHVL29MiJydFhGBWaWcXbc19O1TXlUi17qDmTHHTMZmDC4JdLWSR64/D1n+d8PqncteMTU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by BR2PR04MB705229.eurprd04.prod.outlook.com (2603:10a6:2c8:1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 14:21:12 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 14:21:12 +0000
Message-ID: <32c2dfe4-4301-45b7-8b68-6bf6cfbaa5cd@cherry.de>
Date: Fri, 2 Oct 2026 16:21:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: rockchip: add RK3588 DP carrier from
 Theobroma Systems
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 damon.ding@rock-chips.com, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20261002140330.2904616-1-heiko@sntech.de>
 <20261002140330.2904616-3-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261002140330.2904616-3-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0016.eurprd08.prod.outlook.com
 (2603:10a6:803:104::29) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|BR2PR04MB705229:EE_
X-MS-Office365-Filtering-Correlation-Id: d80b19f7-5300-4c79-36af-08df209068f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|4143699003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Akzmnnr+tnZOrJh+Wj29YIboNi1RW9WoSYSU+eUXojQrQa8znMxBQpFEG9a/ZRA1LhefFC+5ej7VxFB3tWZdZew9+5UjwxDoZhaXtULri/6GocdQp7TGB2GDD+KkOGw4Pv3gTVNQd6Lna9FGWBrfkHOzLk1o4SBKEEUSYQqXwzCXiWgt56GWtngLINYu2Ud70S7H8Zvdh3hQmYsS7My9jSbMqqIy/b1Ot/SQV9/puJ8dn47JGYH1IKRLHUmS3pp6ZrXEq2XdIfMQ8Rbb4ntodC6gog+RXeWtIWrX27vgjLHCGBOavmytPUyDiTbxf4p5Orz0o/G9X0sfpoxQxUcY9Z9lP45KUtbjuqTv6SMsc+hFpKBdtplo2GMJiSxDekdkZJ0LkSUdQGZzUgpFjcRTtCGySGWtRxn0Y/iVTZyxjdds21i1I+DI6paAXdvoC9yl2HAXRpIZxW+cmfKksxDnN3brCH4c6vsiSIqBs/D97eg5FJXlWjNwg3cqFR0b+MV1MncS6ekle0HUhRxaXh5+MXOOXLmkxcLSmOHAK14YoNAhiu8le5LaSJNxgyqoFZcl+6SVLwnA7WtnyZZZFfL2cwsptS0vN8YhcAlDA8nCJwJriirfcnIcH+uitV8LIgbQH8gdr+viP83zXHesiYuZcg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(4143699003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWRRc1htSnlFY2VzYnVWeE12U1czUnBPZlVOMGJ6Ti94UGFwbkNaVXM5eEtI?=
 =?utf-8?B?ZGtLb0hTdUJ3UEFQS2JmSkU5RzZHMmRiOHBuQkJ4TUVmb3BsQVlTTURhRnpp?=
 =?utf-8?B?UGJablRXRVl0Q2RCNS9lZmhoTEc4RWN2YTNtSDR2azB2NExEdnd6SmpHNG42?=
 =?utf-8?B?ZGJqNHZENWs3Z0J0WUZBdUN1dytzRERETnZzYThnSVJ0QjlxV2Z4YjNlMXJh?=
 =?utf-8?B?aVVvM25VeHRlVDlHYW5jWkFMV0l5YXRZZkoveCtrVDY4cUpvbzJ3TlIyeXNW?=
 =?utf-8?B?UHRCUHVXWG1GR29NMndKTU9ycjVWWHhibWJxRENFcXMvWkh2TTBLdGVVWHFY?=
 =?utf-8?B?Z3pCTnJOMHU0Z0xBeXlsK2ZXWWZvc2ZkQlJxb0JuN1BZNzdQWGk4RjdwcU1H?=
 =?utf-8?B?M29yRmtWLzc3REJ6cEtqVy95U2h3RDJtUTNLc202K1ZCajVjemVVbkFMaDAw?=
 =?utf-8?B?bXA0YytPR25FOVh0WDE0K2I2dWZnaUVhbnNia0tiTWJvT0gzQjRzbWxWMWZQ?=
 =?utf-8?B?RFRFVHB3eEtMT2k1UkdHcUd0SjNtdFhuZmkvSXVSaTRncmJDWXZzYkNGK1Jp?=
 =?utf-8?B?dDBCdUlFUkp4QTBwdmlzQTY3Qmd1eTBXK3l0S0YvcVNURWphbG9pZmprOWZV?=
 =?utf-8?B?eFdmSWNHUmJhVWM1MFlDaG8rc2x6UkRvOTl0cnFwMUV4YlppdjFCdGZBS0lq?=
 =?utf-8?B?bGNHcXJ0YmE1YWg3aFEzREI4NmZvR1NiMWdITTMvVzBKUGxjNElncmJNWjY4?=
 =?utf-8?B?NXAxV3FGcU9oWUw4WkE4bjIxVWNYQVV2VlNjYnBwQ0c5WjQ2OGZkUHZ0QXVw?=
 =?utf-8?B?ZllwcnpmNWNIbE1SaUk2N210bDhRNWtJU21aTFpTYm5HUlRVYmFNYXhKeXp1?=
 =?utf-8?B?TXJPV1dDU1cxSkFDWnRnd08xQ3Jlekd2NDUvT2xoZzFkREhSMzl6dng1U0U0?=
 =?utf-8?B?dTJhOG03NTltcGdSZ216Uno5Mk5mcWtxNnRMaXBCVjllc1Q5WXFZdUpvUWYv?=
 =?utf-8?B?cUFsUDRFNk5oQmluc3JqaVpIbEp0RXRXMktFWVIza09Jcy9TYk9ZelZ4YW0v?=
 =?utf-8?B?QlZ5M3IwNlpnM1F5L1czR1dJSlhNYTlSZSsxK0dneC9VcDFRaWpjVTFZaGR2?=
 =?utf-8?B?UEszYkdoNm9IVHhTSVdFZWQxV1NRRUZwM1FrRmNqZm1LL0J0M3lueGdQT1No?=
 =?utf-8?B?R1BmRUhzeUtkbUMrOERYZE1YeW9vU0pwREZSTGhnTHNUc29YSXAwWlVXclpa?=
 =?utf-8?B?bVJkU1dWNTBSeVRlZy9BUWxUcnh1WXZOQ0FRVkhHMUlqMmM5WDdKdDZVT0Nj?=
 =?utf-8?B?QTJiaUxVNXNyc1FZTXQ4T096ZmdOU0RXTS9sWDZtRFZ3MmVTcHd4VWVqaEN6?=
 =?utf-8?B?OUxVYnUvNm0rWjZzMHhPRkd6a25ycEJobkFaZFV3QUpTMGRTcjlGakFEMVJI?=
 =?utf-8?B?TU1kcWorb1M3WVNuS3k5M2QvV1hCbzNUaWNjMWJ6Rmx5YnBEOGVHVXNzQVl5?=
 =?utf-8?B?Z0JIQzlsYmVJWFZQQW9ZUXgxNHB4bXRYL0VOL1VwMHJNaU40VGJvTUM2bEFQ?=
 =?utf-8?B?eW5jeE1TcTEweXdrV3VSYVZLQktOYnIrREEzTzN0ckI4ak43S082dzdDaHNG?=
 =?utf-8?B?Tlc1VmpwU00zdFp5akNqYnBhdCs4WXJPcmRxV1pBK2xBaktFSmRGVTE5cEND?=
 =?utf-8?B?RlBGbG0yR3lHUld5ejhZVEovS1B3QTFaMUxuNkZNUWJWRWFocDgwYWhPeXVD?=
 =?utf-8?B?dXBjdDd1U000aEdDeGxhM1NJTlgyWElSQWoxV2JzK3RVbSt3RFk2akdQaUlX?=
 =?utf-8?B?ZCsrRmhRdkFDNHlOVnpIcU1Rbk5WUnpsVHNEODgvNE9NclFYbTQ5OGFsRjdU?=
 =?utf-8?B?dFJYTE43bUlOUnhoeFg1SzNaR1RGQTZIU25mVklxNllEUERaaFBtVUVOWGtS?=
 =?utf-8?B?SmJ1aEJTQ2lTTWtSMUQ2YkJLbnM3akxyYm56cTZ5TzNuVDFkZlU3QjJFeFcy?=
 =?utf-8?B?RkVXR2l4QUJoVnNKUDI3QnFpZGluS3NyMGNpR1k2RGVtVzZFcGtTamoxaW5i?=
 =?utf-8?B?UWMzR05GU0V2M2p2VTBET2tacjQ0V29aZzN1LzJ0WnpTU3lkdU9NT3NtQ0dy?=
 =?utf-8?B?djB3QzlFcU1xeDFUY3FiMC9pNkw5UGU0MkhhazFrRGltRy8rSmhEZGExbHhw?=
 =?utf-8?B?WG1lSFlmT09PN2tjRjRFeWU1T3U0RmNSYStqbXBkTVJQV0J5Mzhia2FranNw?=
 =?utf-8?B?VjJPTEtHRTJXb1FuRkZ5UlBwZVZ6UUk1YTI3K2RLWUFLOW52U3N5Z2NBMGNZ?=
 =?utf-8?B?MTVycEFJcThjbysvUXkrV0hNZ0lya2VLdUFyeWE3UkZkZ053Tk4zdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d80b19f7-5300-4c79-36af-08df209068f3
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 14:21:11.9390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WiY1/mUAPHb/vkacW15bSGFKfYNpUeHvaLpazWrR8hZsZo2foxTJ1cVjyUw9NkbTm3ZyJcK1rTXp6RqEX81W19rlRZnMllaX9aIGRq3uqFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR04MB705229

Hi Heiko,

On 10/2/26 4:03 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The DisplayPort carrier is a very simple baseboard only providing serial,
> ethernet and a displayport output.
> 
> But its main functionality is that it routes the Analogix eDP controller
> to this DisplayPort output, which allows to test that controller simply
> by hooking it up to a suitable monitor.
> 
> The Analogix-DP controller supports eDP 1.3 and DP 1.2, so can drive
> both eDP displays as well as full DP monitors. It does not support DP+
> so passive DP-to-HDMI adapters won't work.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
