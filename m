Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011043.outbound.protection.outlook.com [40.107.130.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B913BB115;
	Wed,  7 Oct 2026 09:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366040; cv=fail; b=qrZLnSUHuFPATv9Mdcr8oZkYdMib2UwpN6ApFtvtssS1MWDPqNstLUzdtj9/kkZCAzqvJxWGd1H7zRR8Mr8K7i5aEnlc5RUHVqP80gryxZtsvKfqcPfm4B5ohWZmh5mXSeuyHI1j4rvHIgmSkb88jV/Z4ji8ahDc6rclaV+6Z14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366040; c=relaxed/simple;
	bh=chyQYMUytghA8jQ0QIUBP8LfzRYLbIQ6iWaCkVHQo8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LpiPrWys4D8+AEGJiYfKC3IfDRB6lEEwN8u0ujVGJCnlmMk44hl7+Rd4fMSMsL8mAqoxrgqkB2pkDh8ESPqpNVGnPGvoJpejdwyCeraYb/udmffrS51L27MrgncKtWN2vGpe+WHakhkJ+wj89bkrqDfnUxZSvRJItwQRXnVIoyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=hZhqCoGc; arc=fail smtp.client-ip=40.107.130.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="hZhqCoGc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yi0oTO1PGLjEOWJD+dQqVLpoW/2Xqp4nkVZ/tijuODFv+G+H13PFdJYNFDxuPXTAXJeWFza6DB8ISNhk+MKgWIqJKej2pw8cggG13zJi7Ek5ocWZiV4u+bObsMyYK/kJVfyKw4HXdf+OdAXXxUn6z83PiZt85PVk9bN44intiOiotYJZGyBr0DYfUrIq10tWl/Czkk5GUJlVIYAzx8gH83eA7Qy8++mwxmiq7LpM2VTmzTE/tGxa51VtN0dZO4wc59qTt//xPgUXM0foPmPXMt9b57rgR11hFXgElHOLbwFcpqtQn4WquwgEHDRFh0zZ3ufzVD3SsaEkCA9bKk8bfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0pFsCkW98Zls6x1AcAxgdsc2L0I0D33GjaZAGaXdSc=;
 b=DxIl2ZqyTdvAw1los6DV0rq/bo/TnQD+NH8x6EkN6UvVsZAewgOqypEUGYTwtBrlPb2bQ27B6yTKIB3mv6OWhWMISIbEpfGASYqcC3+3OeV9qLVr08sdCZ8+pgE2go7/JXohBRPrtVwgy6LTWVaBudi/A054KBSkaKdbOW5VtZYZcVogZI9Lm+ET6Z7gzQzbrZ/WUu7rjZgmdsI9mPvmXAbmXnhQJR/aBobRY1haMBEsCUQ9GAkp6Lh6AQWqsiuGD3Q3Hw9W35KHV8LzGNHZ46PUxbx0ORSPyXTzQKzy4M6rnhPRLOLL2dyE6094zg8sFhuk2ssIjN1fnQzzyVQakw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=posteo.net smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0pFsCkW98Zls6x1AcAxgdsc2L0I0D33GjaZAGaXdSc=;
 b=hZhqCoGcXa6vcCGtqaCvyQeC/sUV7ZbGOJmP1d6jclz27yqqtclkIcEEaera2isWs7Zi5W38Xf5AJcolboF7Faucf5WHvtKDXV7dg3Uiq5eit7HbxVucwmGvYYL9LGSpYDlsRovvsdO36YEbugsxVRUQ+0S77uoUnlZrMoo3O2B/FVa4snKt2VTJAeeVksOLRZv1PwX2kvvykGfGxc36yI6Ib+mmiDg9GQ5bomBHIKbVp8JlUTrOqqdaQYEA5CRLfARZgXZ08v4vYg+gG9wM8FHJwoLoJmFvm3wsWVUBMxN4PBksD8rcM1gQRn1W+NdeB44dIMmFGJVhY37xSjEoYg==
Received: from DUZPR01CA0311.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::12) by AM0PR10MB744340.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:7fa::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 09:40:24 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::15) by DUZPR01CA0311.outlook.office365.com
 (2603:10a6:10:4ba::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 09:40:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 7 Oct 2026 09:40:24 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 7 Oct
 2026 11:47:09 +0200
Received: from [10.48.87.100] (10.48.87.100) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 7 Oct
 2026 11:40:22 +0200
Message-ID: <1a7f04c4-45c6-452b-a56b-0b2f32fc2dd8@foss.st.com>
Date: Wed, 7 Oct 2026 11:40:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: add thermal zones on stm32mp251
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Valentin Caron <valentin.caron@foss.st.com>
References: <20261004121200.64034-1-mateusz.nowicki@posteo.net>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20261004121200.64034-1-mateusz.nowicki@posteo.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D00:EE_|AM0PR10MB744340:EE_
X-MS-Office365-Filtering-Correlation-Id: 22e80dad-75a5-4613-fd81-08df24570303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	EtFYOxPNf59J7m9tW9jeilQCoToEVmPrtHYX3sKZ7YZENhFJK0hd5gQUgC+uEfXeIYp5aWDljlrIx68o01xmguyhPokT0WO3eM2LM4HeOkUE4PlFwFY8Nmlz0H1QWcJjoPOwZXbcJ2XRXNlsSfCI50oipIbTpYIvrRkZITZsJ21T2AeUiod2PKKW6RPO9ZIL7CAc1t6T6eyUmytaGtdNXEySrPOWJnX/TzIoKwYq5F9jYZi/ZXiwWRQ3wUO/2JHtWLikVRGgkkDrI4q/uMi9nMamlr6LQf3GoosnI68igcP/SG4LsAsSznlCpqlaf3Zsrs9d23EkKxsnuwNVRfBMFjmf2B91gdMzJHjL7uDfVmP25ORyXBWtxqJLUMPR6VI0nuekqmK3ZLZM654GkAImYVs+fe/ErJ0BJwcx+Wt3FCJ94ygQyPRRkjFl6EUcEo9+Dr+PJa4fqNdVC0odn3Nj0UpftUUXUXUmojmpnYT3y/UYwj77JTGhXI7svIoNcdmSjDS6jx1hwZ0KQ96jgvpQjnkwZdCnx2WAbJOlOwKPT981VKPwIiX9yTMMixDaGZBT/t/ngszTIir/f4nWuVqQV/BeHD16kYD4lnXhvq4HvJkPWPlQJV3SAbIX0lKIGbhiFjoJFMMYRUsdVRs9pBQu/00UALsge8jOcSC7HWcuDqnDs0LeSgb+/pwHssoAefLe/7K134uURy/DZfoszj6lBA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E6/EDNTtll7ntMb8qb3x76nPwom5THtLobe9Pj6xk3mKA4qk8uhC+lmeQsrwOL35JQpf71E1FUAZ+9/5YI6Z3ZZbaD6y2CF5kUWeA1H0pCredFafZXVUDMcz/Ih/mReigJVHU2zTXs9AuTEER2EdnrYmabrTT4Vo3fe656Wxez/VJNVY6zKz1nYE1JNmnHW0U7SCIzNKbXkgIIk5gJtoyqgTlUDpY+2Yc3F5MztV4O3D/L0Gga8+5WXVugyBmjHq6NY0vzrWsbS23fCz/MYUXLu6tKiK4GAQw8uYOXTSyUEQOFf1Wa2kIbnJkb0Bfwx77TdXjKmZKLNOVUpUOII4u7uEckYmPDAtGNXztK5QKCODidd1vs7ecFVHiqPVFqT2oC106Pkaippr0+gzA2i74h5kePGvwr3SJbacKCL81/eK52VXD39Aj2z9cihyiHn2
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 09:40:24.0107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e80dad-75a5-4613-fd81-08df24570303
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB744340

Hi,

in rules established by STMicroelectronics:
     -Tcritical = Tj - (sensor tolerance). With Tj the function temperature.
     -Tlimitation = 90% of Tcritical.

On STM32MP25, Tj=125C even if the overdrive is used. So we have:
     - STM32MP2xxA/C/D/F, Tcritical = 125-3 = 122C
     - STM32MP2xxA/C/D/F, Tlimitation = 110C

So critical value need to be adjusted to
                     temperature = <122000>;
                     hysteresis = <1000>;

On 10/4/26 14:12, Mateusz Nowicki wrote:
> Add a CPU and a SoC thermal zone for the two DTS sensors, each with a
> critical trip point at 120 degrees Celsius, below the 125 degrees
> Celsius max junction temperature of the STM32MP25.
>
> Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
> ---
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 28 ++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index b624f998b87c..fd174c88b26d 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -158,6 +158,34 @@ RET_PD: power-domain-retention {
>   		};
>   	};
>   
> +	thermal-zones {
> +		cpu-thermal {
             polling-delay-passive = <250>;

because the DTS  sensors have no interrupts support

> +			polling-delay = <1000>;
> +			thermal-sensors = <&dts 1>;
> +
> +			trips {
> +				cpu-crit {
> +					temperature = <120000>;
> +					hysteresis = <2000>;


                     temperature = <122000>;
                     hysteresis = <1000>;

> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		soc-thermal {
             polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +			thermal-sensors = <&dts 0>;
> +
> +			trips {
> +				soc-crit {
> +					temperature = <120000>;
> +					hysteresis = <2000>;

                     temperature = <122000>;
                     hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +	};
> +
>   	timer {
>   		compatible = "arm,armv8-timer";
>   		interrupt-parent = <&intc>;
>
> base-commit: f831584128ac2a36fb4fa62fe106793d08c2dbf1


Regards

Patrick

