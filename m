Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2D149E5F4;
	Fri, 11 Sep 2026 16:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144416; cv=fail; b=bKljo2TXha31iE9ES4PgjJ1EBi0tj01ygnz8l7zxA5PXl98JaazGRXNDzO/6gj7Q6vjT/qlJLLksvDakfp+wnxEHzW3xvHFduwkyGXd7qqv19HZAWolmEpEQ2Sy4PHuEWTwMZWuv/C+YfMDMvtkb3cvAV9YxIfRxqIhi6ZPaeyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144416; c=relaxed/simple;
	bh=Y83GDWHo9BnGc2+oIfUZ4V1Ystecf6neqh4haUyPlSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gmsvLFQ/ZCm/RtwOd95eBaLtErhg3Tp528sx/mka5vlhWiN03Y1Ke86u+9p+wIVKCT7fDNH7wnDx0yEanVlgvU6IqVu6xzjM7y0/ldMniWCfC9QTg/noVRkO1WPuJYRDWvA4XdbCWj3iZuVBwtv4h/REPCRabCgs0YkMhBT47Sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=QF8o1Cr1; arc=fail smtp.client-ip=52.101.69.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="QF8o1Cr1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f8+mCjIgKrfPCv+QFWvoiytjjKy4Xi8Lh4fqdadthIcPvrCrSrHQlXPmLQWnAi+pGImrIg3C+bE+47dq5DBeix2scI/hzmro7BzaYzoAdjFqQPhAYI8/QlWnkV9HGzGHqrpzHwLP8W3zpGMpRdj8DlOTaRdfB0njobJtFQIveo1zvDs+h+7qdYeHB4SEDd/gZaYiCKMOGmf2GkhQXJq6SxVEK/tZiE2wlTDLrP3w3I+r1HMLd9LUJwbVedZ8AxSxOlZ9aPJ+TPSffuZ9/NA7VE7+pc18xdJFkF+FXoCVlXH6jYazWORtm8a1/2v3uSEUTcBIoElA7UuPwoFxvG73PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzA9RC7rtoktIeJoLqZT7Pjqky6L2dMUyWk+Va5arKU=;
 b=rL/lX8MxFDxAFHl0Wxt+yg3iLsb2dpB9xLTSMsjghE+29ZoxDuoZ8JGuqO7xIXIeQoo2jy2q/7z5yANel3Bbu6PjI4upcP06ki1su97yxTMq7zaVwB2W2/x8VNCpp8Xwkw3j/pjDyfbfCuTNiLTEECFcAZLIz04rVVGCW748LKoxXhmO8ElGaezUYen3U6PYgsnCo0AIglBpePGGONusMzgFU5o7/IvhBkWYzeSiL1ipGUYxDCbZXUw/PLl07tDkMJv6TaWC6Z2xhjZaeA5AN6jQlhXYZ2MUfF8hTMpsMSDj5WCV2OsdIIFa2/yhEui9ogxL4s946pnuNWXAWPWSSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzA9RC7rtoktIeJoLqZT7Pjqky6L2dMUyWk+Va5arKU=;
 b=QF8o1Cr1Sxt6rgouJEBMUE75cLtTbKBh1apeUJvKUKXB7uZ+Geb7SWwLen+nhxtHaFNBtZDseJt8g1W0wyebdFHswWmKINBT617nqO1vgELI9bVrMM+xIHxbu6ivkaaltvGXXLcddIC6ReCasG9ROZ1IXocQYPuCwYFjqUWn/jCLF0AfpMRHYHfqpXvifw1MiBknz0sl1WvWiFURaOGAFwqR79YBkq1Qf9CAu7B1hmbKilSCv5MgUR9MSyPYTzFKM8oqi4zZtl27/0Yt2D6UxA93QVw+9HAgupVWWhirSkOchukatydM5ZMQ8F4Gn7rEPmo9ANaE0pCyBQEZCLTSqw==
Received: from DU2PR04CA0343.eurprd04.prod.outlook.com (2603:10a6:10:2b4::29)
 by VE1PR10MB3789.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:16a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 16:33:28 +0000
Received: from MAD0EPF000008BE.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4:cafe::4d) by DU2PR04CA0343.outlook.office365.com
 (2603:10a6:10:2b4::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 16:33:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008BE.mail.protection.outlook.com (10.167.241.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 16:33:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 11 Sep
 2026 18:38:55 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 11 Sep
 2026 18:33:26 +0200
Message-ID: <e3e67a3c-30c6-47ea-9beb-b29c51873260@foss.st.com>
Date: Fri, 11 Sep 2026 18:33:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] ARM: dts: stm32: Fix STM32MP1 ev and dk USB
 onboard HUB supplies
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Catalin Popescu
	<catalin.popescu@leica-geosystems.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
References: <20260821-usb_fixes_vdda-v1-v2-0-23cc919b59fb@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260821-usb_fixes_vdda-v1-v2-0-23cc919b59fb@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008BE:EE_|VE1PR10MB3789:EE_
X-MS-Office365-Filtering-Correlation-Id: a4997227-ac9b-4e1f-34fe-08df1022686e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|23010399003|18002099003|22082099003|13003099007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	SjhCGBXmxmkuMGHo83b0yTrZ8Uc/yQhq5wsy43/pibqSuz29F2AVWQdmbMOMR9atjxc8BTTg/HBpyFRFBsTfW9CHOlHAUj5oYpRh0cHHuLcxe3kgehEXrVGqtHAWdwwbHGiIm9Fc8EACKgXbB798po31B4JmvIGK+Cp0SkeaftcprbTM3v3Bvlq5Kmz2i834DibF5OMmijgS01IY2V5JOYXf+ANXDdsFM8U2+5+dBDik/15tKMUUFXfODNphlrlEAyDjFpXtOt20fGPfwlEJKPFvZlpPeTPEJvmQYVz2MzdiL1NcHdmb4eT4KmrjfLcOhTvkzPYKD597De7t5Inlkxs3vu5PaHrLfrN/L1tXawKxRRYGQxk0EZNcrquvIhlsTt1grcvDmgecP/myt0EGIY2CmBcsTdCg4iulwb6jLJWpb1cog3pWFrmXB9hqaoLbsRr6+XBgFBeCWr47Ar/QLMBintiiZt/vcDY469WmlnSglC7UHuZeEesKwIxsUOfJr4Pm6//cg5VAgsNWbOaTSMyikZFj8sYKfBJsznbjibRkZCWYCseGFd3N04hO+2HxP2S79w2IDpS4+nU2zUo44PAnsQZAZ+ZVLT17ToOUDQos3yE7eV+7xknup3QeMW2svRizdLWsa1qplXrOW1q4hMdw6kpn5WS/uLjfkGKHc+o=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(23010399003)(18002099003)(22082099003)(13003099007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gsaMxDukR+qWrYPWBMUkuZS0o4sUKrae5LHAKCJEol2wbaM+Xy2xil/pHobDbM8DCwEhbU6EdHNlG2EE+S60A0JQxcgkwu+utYk6jatp3Qd4BJV54nWZfjCaICzoPHhNSqq/55Ry05WerAhNe6FNo+g7Rhi1m7faF6SsCGavVNJtMz2QJQCPrAQGQoiGx/BrtGWBLLrhIjAuD6PrxLub1DA/3QydHdspeAIQYXPDtdYxJeiDe1SwX9fBBEL7zSEAyaNlRpsVSgsFSscKpW7sl4L+pLArISQxfGZCvnw3abvhylaVWfAyRUQOmSTMPyQt+JzjR25EeC54HYawpHvq/WAX4syUNKep1U+Du+Zsqb3T3X1Lgj6iklgY1AYq2bu2PY+8GHsplU3SmODQfZVAkrFAWp6mQas4N8pSxd8Vqr0Yf5apCkWf8k3iEcm7wnb8
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 16:33:27.5610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4997227-ac9b-4e1f-34fe-08df1022686e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008BE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3789

Salut Fabrice

On 8/21/26 16:57, Fabrice Gasnier wrote:
> Some STM32 boards use Microchip USB2514 HUB. Since vdda supply has been
> added, the regulator framework wrongly associates the 'vdda' supply
> dedicated to ADC, so the wrong regulator is referenced.
> Only the 3v3 regulator is used to supply both the digital and the analog
> part of the HUB.
> 
> Before this series:
> cat /sys/kernel/debug/regulator/regulator_summary
> ...
>      v3v3                         10    9      0  normal  3300mV     0mA  3300mV  3300mV
> ...
>         5800d000.usb:hub@1-vdd     1                                 0mA     0mV     0mV
> ...
>      vdda                          1    1      0 unknown  2900mV     0mA  2900mV  2900mV
>         5800d000.usb:hub@1-vdda    1                                 0mA     0mV     0mV
> 
> After:
>      v3v3                         11   10      0  normal  3300mV     0mA  3300mV  3300mV
> ...
>         5800d000.usb:hub@1-vdda    1                                 0mA     0mV     0mV
>         5800d000.usb:hub@1-vdd     1                                 0mA     0mV     0mV
> ...
>      vdda                          0    0      0 unknown  2900mV     0mA  2900mV  2900mV
> 
> ---
> Changes in v2:
> - Overwrite vdda-supply in stm32mp157f-dk2-scmi as pointed by Sashiko
> - Link to v1: https://patch.msgid.link/20260821-usb_fixes_vdda-v1-v1-0-0c213062165f@foss.st.com
> 
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> To: Alexandre Torgue <alexandre.torgue@foss.st.com>
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> To: Catalin Popescu <catalin.popescu@leica-geosystems.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> 
> ---
> Fabrice Gasnier (3):
>        ARM: dts: stm32: fix vdda supply for onboard hub on stm32mp15 DK boards
>        ARM: dts: stm32: fix vdda supply for onboard hub on stm32mp157c-ev1
>        ARM: dts: stm32: fix vdda supply for onboard hub on stm32mp135f-dk
> 
>   arch/arm/boot/dts/st/stm32mp135f-dk.dts        | 1 +
>   arch/arm/boot/dts/st/stm32mp157c-ev1.dts       | 1 +
>   arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi | 1 +
>   arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi      | 1 +
>   4 files changed, 4 insertions(+)
> ---
> base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
> change-id: 20260821-usb_fixes_vdda-v1-0e5eea790b2a
> 
> Best regards,
> --
> Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> 

Series applied on stm32-next.

Regards
Alex
