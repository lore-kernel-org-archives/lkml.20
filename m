Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013049.outbound.protection.outlook.com [52.101.83.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD393081A2;
	Fri,  2 Oct 2026 07:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790924914; cv=fail; b=b+Zb0TTAZtI2dEdRIZxbYOt+/qSQVjAO/ZXPDugfkkUFyUp7OdAwzAa1lCDf4RPZrLkLFDv9gzeHZrUEGjvuCLIJpIXStz1LT4k9rS1ZmZ5qV+tSOFKNmA5Y5yhMTh+wBXMkeLeF77t7lDpDqyE+yccABqHf9Ghii7zgUy1wyxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790924914; c=relaxed/simple;
	bh=ZKyF5Yy2CBsQuKvE4IThPRpgyvyU9C1g2jm5XpFgvns=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=STNt0bXOfgQkL3Wwxvd2cexAGLT+HagTTU6wSiuYMXt9kffztR7V+igExht4zcQjOaxY+N9g+Pe4i+IUyqeM8FtXvhkhDNuFdlygJ2k61E8uS78pWRN93nW+nwzhbuBQzcjAmaosuoHaGHi0BUcoKoVKu4yj/ADmnc2ZvW+rzzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JWkrB+a7; arc=fail smtp.client-ip=52.101.83.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JWkrB+a7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ue7kSdAzrmg+ufCfq4+lLp0IzuwuhMTD+Lb1pP2+9leQxXe6Ec6EQqmUag7Lh1q+8Ul8bzUXTGRcSiBpT6iRWSFBTGRXK/Vw0a7obYPw7MY9Je9+jtKUgwJKdCHn54Cs17C5Z2kN1zBj68IlXDDnZ3jTAmtSpTGziejw++eNMu7/l1ZydC7MWvIQzKOW5c6j4+0Etxl5yz/Ni+9ZMpMRyjeDxg9vPe2SEF3rwVIZ1r7+Z1qjJgQQlAR0AvsojZtQaI7GhmTYfmu1QMLFeDbKcvIitvSFQ6/U0eBI80v+eIs6jzT5bDOyCXJulY7Bb3gJOtgIoACgDbrNYDSHq9X9Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7hmK8vdl9jt4EOpcJ/R8MRw9AboSJ0XGZUWHkjpcEE=;
 b=yskO91IH0ldChETQf1BsDGYx/UWjlH6t4FYQFO25PDcMUeUImOGi4ew1/AHojPt1CEnbYQKoYZU95czLW12AqSRXMotICb/d0wqgE2xcCcYZaIVc91IsXT4zFO4pHAf7YtPohS0DO7mw/o9DPnI0kzx6SYQP/m7yEp6iTyFWdi7buvKd8fw62902baBcKrlD1ZeKem8IAX7p3kTuXnaKaWtV3kQtApDyR3RAvwLlh8jfYnKDfGrurwmJqmnAP4h3cVmKq7DMEERuiZPFVojnkzUxHt7UTL6wX8rPZPbkrvdT4V29vr9XrlPoWqU+QpwmwLiD3GyAkSEb+Tq//EcwYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7hmK8vdl9jt4EOpcJ/R8MRw9AboSJ0XGZUWHkjpcEE=;
 b=JWkrB+a7PAnp8JnISt6XZ0bHb/Kmvy1ig1JxDlzo9VQG1AxsqfzQ7MyI2QESFtt397dYguI/LXuUKTKPsCaaw6mX53CZH1v6Mxa8fENl4QTY3rf2naTWrWZ/pSk9M+Su9/MMu+s3nBqFVdccyVX+IVMrQy1TPRDR1eSrhjMfkC74H2RNyvJC3eUQ14EXv3p5F2Os2+/4O6YoZdzjnL4zWiaq7kYSVLtD4SP2mR9Q0KHXOZU1RCTVtr4/j0+ObJy99t71AD/j2FDo1AYdteLyHAYA4brplwtO1pAjVRZk2AIL6T/ScMBkzLjNb7Pf7ZEbr/1aq83JqGH7JQlpThjIYg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by VE1PR04MB7328.eurprd04.prod.outlook.com (2603:10a6:800:1a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 07:08:28 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 07:08:28 +0000
Message-ID: <d9005abe-8c8c-4c5b-b21c-e08771b09d10@oss.nxp.com>
Date: Fri, 2 Oct 2026 10:11:57 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ARM: dts: imx6ull-colibri-iris: enable SPI
To: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261001155401.2584935-1-francesco@dolcini.it>
 <20261001155401.2584935-3-francesco@dolcini.it>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261001155401.2584935-3-francesco@dolcini.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0044.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::13) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|VE1PR04MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: 158bd629-ec7e-4351-9836-08df2053f56c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|23010399003|376014|7416014|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	+FeZhrM0qsKEliv0vwfyybLbw+oLD9j9/YSQ8dbaRYxwIl2AD59WYRIyLVmgaqJkOsKiHfC7iMoG7xV52m33I6Worx1t5Mp2zB92Ax9znf3BanMxDFaa8FIi59QsXYJA5fn559PSVnab+yAEmKcY144UCHkU6nWEuPNbGZ3Na1RP4tFNCJ0ziWDF1GoT96atbPOZ7qdIDZPYkz7Zl2wS4ipOUv1InrtwERZFKyVoTj9juUubXfQ/L2i6xAT5HR0j/qAfdXVeU7kCYQdqWa93wNaDWtZtx7GREof6Ffy3rS3zuLjcjlAk0tOjTkYKLZq9d1U01nKojWtbBOvWV6Vlk5OYFhSuJNtES8nRMNql17rhm43CNYYqHbKXiJQhUwTZmc0dPezutw5IacLyCd+ir+6vZDow9ZBdR+yUo7Q8g6QA8M2dUM6uYrD6OUgquyWQL+ULvBAoS214pHDZWCIYRmPUH3yCx7pXMgW2S0v2tPwa0lwvSa66zJHzdpBXFXp4cY2XPUqRz7OBi7w84+gRT749ZBuzVxEV0zXyC9mGkOO76QcrFsC8edBHvCgDUiMzgk8XZyhiT0B8HuOMfYVdxSfmpbwd8civRDNs55RlDZvxNyzRtMm3wtkqJSfkL27XdXxVcNZpAGFRci+3fw8WIUlZer2ECLWqoBFKPuySD2U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlkvcVY0dGdvbk9OR3dXM3czQ2JzckU2OFdVdzBRVGNwaHQvNVE2L3FKRWtX?=
 =?utf-8?B?eTFpZUJzUU9sUE54NVNRSFozWjBLZFVmdzcxakdSVkozU3IzdzN2NEFqbFZI?=
 =?utf-8?B?RERBakMyWFVwZWd3VHc0RC9qUFJyVXpucVoxeVZOV1h2TkNSUnFaczh3WDMx?=
 =?utf-8?B?VGZFem41MFRMdGdXUS9OVG51cXY4SVhYV1R6ckNpaXUrYzN3ckozNUhqQ0VN?=
 =?utf-8?B?bDhDRHJPdzU1dGdOUzcvSlFFaEdoY1pSVGduaDN6Z2dLU2RlZXoyYWZjUXJw?=
 =?utf-8?B?QnI4UnJMYVdxOWJMcXphZmRFTTVIbFNncFB4T25Ock8vREZ2N1Y0cnEyYW5T?=
 =?utf-8?B?elRFTmZ6YWp0c0p1RWhSZk1PVURSNTl2cU9UZG84bURPb0NmbGhnYnZFYThN?=
 =?utf-8?B?YUVMeW5NQ0E0b0xaYUp6K0Z1bGI5ZjdSYi9HNzF4TXViV0lSTi9KV0RaZHRM?=
 =?utf-8?B?UTVvVjZxbTd0b1UvaHpyQWNEbEJYZUNISE1HZ21uWUV4SEdLdnJpMFFadzR5?=
 =?utf-8?B?UWJ4MldXa1hLMXc1TUpUd1hTcGxCMXZDNDZsREdmZjkza3YxUFZRZDZBeEF0?=
 =?utf-8?B?R20rcWlIaDdtcTI2VTkreGJXcytmSXRtd0NjOGF0djNuUWtwMnhvd1dXcmUy?=
 =?utf-8?B?N1RNUElsS0pLSFU0TG5wc1pPTkZwbGw4L1BwblhxcWRFc2JiVTBEMEVHZ1dK?=
 =?utf-8?B?VDNCajFqQkwzdE9DdklWcnIvTUZRaGY3OVpUNjV5ZGdmb3RuTUQvMWFYait1?=
 =?utf-8?B?OE1ybWRST1VPRUxKeVNnWXFMVjdxZ1ZKbmQ3aStyN29UTExXa2k1V3ZvU2I4?=
 =?utf-8?B?NWVOa054aGowcU54VlQ1bHlIYjJuVFM5U2x1OGNETU5zRDMrL045bm96QjVW?=
 =?utf-8?B?TnBOM3kyRWxpQ0NPU25uWHVSNWhVTjBMNjhuRS8xYU96ME5JVUliRUF0NFFV?=
 =?utf-8?B?NzZCMkVZNUV4eENVSU1DVVkzcnhKVmc0a0lJcGxTTGhpbXhkeGtEUTFDdUFZ?=
 =?utf-8?B?WVI3NlhUSDhnSGEvU3ZpdWRzR2J4dXZGUWJjRzJERVM0bG1xd2JyQ1QzdWJF?=
 =?utf-8?B?Y3pRL1N0R3BuMHdxUVFRMDN0bW1jNVhyajRBdFRXelkwQ1l4VXQrMUw2d3Ez?=
 =?utf-8?B?TStncEU1NXBDWTBpSGtucHMyZkxqYnJDSS9ET1Z2TjhjUDFYcjYxK2JHbjc2?=
 =?utf-8?B?Sk9oUHI1Mlh3STVmK1FSMHhvWnJNYzBmNVdoVWZrSHFpQ0V1cGZGWEl4KzZY?=
 =?utf-8?B?enAwamdKMHhHZWgyeVVheW0zTjh3NXAyRWdTdksyaWNIVmttVTBZNWhpRFAy?=
 =?utf-8?B?QmkxdFlWeXFzeGFTN29BaWI2NUZiTVlPc2tMOGdnb2tXR1ZROU9GYm1KdzlV?=
 =?utf-8?B?b0loTjVobFFBL3JmMS9uQVdnYktwc3dpNjcxejFhVnI0Vk9pYkFXOHVzd3E0?=
 =?utf-8?B?MlVXUzd3SGZ5ZTByazFFNU1kSzNGclJMaDhLc0Q5ZXB6ZVBrRG0vaVkwUTV3?=
 =?utf-8?B?QzVnZGhER2d6bTdIaGwxUUNxbktDT3hxT3FsWFdUWC9WOGJ3dVN0RFBSUW41?=
 =?utf-8?B?TWdmcjdmRkZmUEQzY21UWUJDUC8ra2dBNnVSZ2ptTUhVUU9RVXhTMUg0WU84?=
 =?utf-8?B?R2JiWlZwdmRZaFFPMWlnOVE0dTIvQVh3amRabXREdWVCTFRHY1FYdUdtMERv?=
 =?utf-8?B?NkMrNHFrMnhuUVNCYjNxMUFuY3JOMEFkNlp2T2RmZW1mckhXY0RrN09KZjVx?=
 =?utf-8?B?VDJhL3RiVzVsTFRSSy8yenZ5TnNFT1doVnhTMGwxM3N0ZVN2R2VXOTVyOTdH?=
 =?utf-8?B?NVFoZk9WYzh1RllCMXlLcHRrSVpHWUhhVHVobXNYVHRHUzlMY1AvaTM1ZFNP?=
 =?utf-8?B?TDV5czJ0RzB5S0pFVmZhK2FPb29lNFZzVjlDWU15N0RPQ1N6VlhoOWp4TG9a?=
 =?utf-8?B?d2J6bU9HZWtoVkJ2SUhySVFWMUM1QzljZVMzcXBDTE9oWnNRZEFEVUZpK2Jm?=
 =?utf-8?B?dUJJZm5seHJuWnZxSFVYa3BaYUhhYVBXTUlXeVFaRU1TOGptZC9YWlNSQkhx?=
 =?utf-8?B?WU5Dd1hkY0toUGt6Q2JONDlRTjYzOSsyZ0dLYkNYU0NHTlFDVUtHY0hLSlVp?=
 =?utf-8?B?djlJZjJvdkdubUNnb0cyOXd0UEZpcG1PZGo0RzVhVmF5WERsSmJhOXBxVTZE?=
 =?utf-8?B?QjZrd0IxZVFnU2VGS001MmVoWjVTbU9vcVBXVEZra3ZBTFdUTDg1Y2R1QWtz?=
 =?utf-8?B?YUd6UU5odUxRTUVuYTdqelNJUE44TDJXa0YybzFKdXZUTS95dDMzU1FPZFdC?=
 =?utf-8?B?VXRsdFhTK0NyYVkwWjhoRjRHUDk3V0craHlXcFF1dm1iQ2s1ckFqQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 158bd629-ec7e-4351-9836-08df2053f56c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 07:08:28.4184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1q6RfpwrlVYJrx513VkD/DV47uWRQPrK94sTI9iiabzCNBUzK0C+1hbbu2ga0f75duACq52SHmVEze9xPXbNWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7328

On 10/1/26 18:53, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> The Colibri SSP is routed to the X16 extension connector on the Iris
> carrier board, and a device can be instantiated from user space through
> the spi_master new_device sysfs interface, so enable the controller here
> too, as the Colibri iMX7 Iris device tree already does.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
>  arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi
> index bce6fbf230b3..5e408e54b335 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi
> @@ -52,6 +52,11 @@ &adc1 {
>  	status = "okay";
>  };
>  
> +/* Colibri SSP */
> +&ecspi1 {
> +	status = "okay";
> +};
> +
>  &gpio1 {
>  	/*
>  	 * uart25_tx_on turns the UART transceiver on. If one wants to turn the

