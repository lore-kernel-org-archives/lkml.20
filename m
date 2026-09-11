Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013006.outbound.protection.outlook.com [52.101.83.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB2F37417B;
	Fri, 11 Sep 2026 15:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140645; cv=fail; b=jsEywH+pHiKGMA7q1BWFsAZTu9wy9BGdlX3mzmcd3/f1O/A7wjJx/XaW6JOiG6MfyzLxgLWuqejUGoNtCKQ/5p5KCofmTFUM8N+mFk8xckfayui4qJrIB/yuqEnNTOPEhu9dAUtN56lQfLlCYlnNPIxtQCPNsbvXOVT1IAvc9vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140645; c=relaxed/simple;
	bh=olPdW7bafSFzZHBhbsrUkD0ex/hRKjXol38MYugWJ3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Oc7uZ/I7N7U4t1OS12gENL1UFr6iufgvJIaxc0Be+5KojIXrELU8EtSAMytiJ+7NzQahXcn2cxLVBuHV7gEglIq/Pocoq9l3Dx0MZV/aqVeZttrqmWBw+GiaUEhjkxJipyrU9xQdUCkHQLqz+b05aBIih4fTWDRdqHL6WV/0kLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=axGh9V7O; arc=fail smtp.client-ip=52.101.83.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="axGh9V7O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAWneYtTU+fIYoGk50jds4EDPZGojNkhYmu9nSa1cLDxkAs9DCNWO57FemB0+4A/i4l/qctQ0FjzcIrCPwylEitfpTXeRmi5j4aa1lgk/rzMsaY/MmfLxur1nu1DXd2nAVYTTieA8jbjtB/eyGLwZQEAtWkOROZbNNMqKa+O/yG7FzpS0Y4HfhZlRSCZ8T6N8Eb/7CAa/xwLwI5mmc06USU4qJrXRCqTdCphsdGv4CwqY5F4P4h+h+8u1xSzCeRuXWTp7OKtdiWMQs4DXHtI0qG/U3wNjT4YmraOYzeXX+1BctBwoK1IZbrFMPB85u4Jc0rAO9/N4V3ddk068ibgOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEQNnYRRZxJNRSzM+t3PTcflg5rREuyGvW1IrDIB5QM=;
 b=kNW1fw6nZc299iJi0FAkRUnoQxWi+lSjQZYCrgEFqUnm106bFAuS/8P6NW9lwjfvwTkMuqhlfiEUkl8JoYzJhPGzHYK2zA1EpkuyFXnvZvfnXRyEeZHfenuVMdfgc1B73RN1TFmyd/mLa4Heh3ivbcAiNefYRVrvWT30yvoIbOE0bKQNKO4BuXeSihx3tjD0Z46ASPUW5/3TjIqnnZIKjEPNa2MiRmvNzN8BawzHuuCFKfSoB0hhgOg6qmP6ZlIzLLsy9I8CvzPrVSQ0N1RKur06coRWV+P+3ipum0KOxlxQ9CHqzPV+NNxMwXMf0x4dRv95U4L2qQ/g0Y23jvWT+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEQNnYRRZxJNRSzM+t3PTcflg5rREuyGvW1IrDIB5QM=;
 b=axGh9V7Ote0JQTWJj4kKfUluakH0BNb9KsDv5yQsETnIgK301OZtrh05B3gNynOLn/sJPRN/oKVc0gRNNgo7TqlEQ0OpvJz8nXOF/arez9lftvfLp+Qn8lXufqerBC6PItBdVopkuHpb2m/od+idzYkMp4bmWo1Kavtqwq5iGrpYHQjqcJMOZi0O0O01fQiayCLOR+ugAsb0nlv9rYFuh46PWna49PKFpX9mYbS6wa0c4agLUajeXKAsG7c+0odbcLqqr3HQoZrFymW5txOErOtBv/9sf4qGvDhHQldHexxM8aVHJg7F/uW4oVizkc0ltCNDz5tyo4F1IdZ6AZDkcA==
Received: from PAZP264CA0044.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fc::17)
 by BESPR10MB992202.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:b10:146::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 15:30:37 +0000
Received: from MI3PEPF00008482.eurprd02.prod.outlook.com
 (2603:10a6:102:1fc:cafe::5b) by PAZP264CA0044.outlook.office365.com
 (2603:10a6:102:1fc::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 15:30:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008482.mail.protection.outlook.com (10.167.240.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 15:30:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 11 Sep
 2026 17:36:39 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 11 Sep
 2026 17:30:36 +0200
Message-ID: <174d318a-bb55-4648-b6c7-cbb80f36fd2e@foss.st.com>
Date: Fri, 11 Sep 2026 17:30:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: stm32: Remove User-PA13 button on
 stm32mp135f-dk
To: Patrice Chotard <patrice.chotard@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260813-upstream_gpio_keys_removal_from_mp13-dk-v1-1-b333615ac6cf@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260813-upstream_gpio_keys_removal_from_mp13-dk-v1-1-b333615ac6cf@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008482:EE_|BESPR10MB992202:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b980e6-3eb6-40bd-d9b5-08df1019a12c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TvTp6RyxdSvbqnlfOaDmj2O6UQjEcs0Mxcm0wBao0c2xZVn+oI1imKKSa4wL3EL5RIERT8tqyFH6TfD5+Ns/VP7yDDUzCSROUwdERqOQsiDXztONO45/baZqFRmU/Pb3kUwTafB0PPvXXeSJYqIcXIn46tIn2oLHFlMdM7xCGNjbLO5+8+iWJ2GzpsofihVHkmmWFKdE0n9bwbDnIAzllOcZheZLnHmaJtULzfk83YPLH0wJYSfQ/qa0LEXUv2+9CzioF/nOiXBonLTxErNUT2zw7/M7wplb5qP9lF8+WCEPg1kb6ZsTnOtTqv+JTaijLPeu9aRmJ2hAHNL7kowYiQaqe1uriQbYzUlRXnAA3hjV+WdG1sIkR5wbnIrFHQGuDLWjXMIGUjIgWty9l+JIOiy/qrlVTa5CkCp+QrCjjYSiCXxbubUw9Vsodqaq/RKnbXtn301WwzMjCwagGqqi5YIJGayfbIGoqokoXz1xayjGtN6i3lYdBvaKSno/vrm3obOhzGRqCW5KDs80ufdd01dsf41fAkYinBqM9v4lRRjR0zIsR8xW9l+/5DYYYD7oYdFu0P3UEC8zGua1wxBkNrQ8pk1SYE/yl1Zk/eKOAzwhsC6kwUJIQJ6LPbGwq/0v90igj1nt5HVjYL5zXMdfK3pRTKrftOV1HKLtOCXuu0fBwjfGd4HEAvT8tC9uG3KnHKq45M717ZB1kIl+Amy+Kg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sATD2IMjh4lkubCpUtLmQ9cB3mS7pHZOyT1fj+yd80FZGSQJhJIhUIZzZnDXnDBv8VUfB2t804mwa9ZwuP2oMrPWg0+VJq7sUGphXtyYO174DV9lUIA1Lr9xMmXHDqa+m58IdkShibrsFg5jlAzUUSxCaeMGtN4JsMowqcUeGLmOgM2W39yhvc6jj6pTvq/6wiNSV9J03yO6KxuL9ZfNa3c2HwQ8JUPS50VlaNhUoovQDZ/DpxG9Jc0lZ3XKayJVoNAHVvs+zWsXWNlP86rQovwX25zLxpJ33i5iURM7rVJtOZaEqEnICeCNsz8gw/E7kSKEeh/D62mg5PqkaaTqJeFpAydHAUJk5kGiaBVwKvtoRW4WzVB1jvdtxz4B+DUS3is2E58OZ4+34GzacJ0nmyWSpDZotMKm+kqfMpifMPAx6r4KAo/vaeMu+PtC/VHp
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:30:37.3393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b980e6-3eb6-40bd-d9b5-08df1019a12c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR10MB992202

Hi Patrice

On 8/13/26 13:50, Patrice Chotard wrote:
> User-PA13 button and led-red are connected to the same GPIOA13, this
> leads to a conflict when gpio-keys driver try to get gpio.
> 
> As led-red is mandatory in U-Boot to indicate the status during the
> boot phase, remove User-PA13 button from stm32mp135f-dk.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm/boot/dts/st/stm32mp135f-dk.dts | 11 -----------
>   1 file changed, 11 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
> index 6022e73f58af..215bce4738f0 100644
> --- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
> +++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
> @@ -60,17 +60,6 @@ optee@dd000000 {
>   		};
>   	};
>   
> -	gpio-keys {
> -		compatible = "gpio-keys";
> -
> -		button-user {
> -			/* GPIO on PA13 "User button 2 (B2)" */
> -			label = "User-PA13";
> -			linux,code = <BTN_1>;
> -			gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> -		};
> -	};
> -
>   	leds {
>   		compatible = "gpio-leds";
>   
> 
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260813-upstream_gpio_keys_removal_from_mp13-dk-c4e8a1a405f0
> 
> Best regards,
> --
> Patrice Chotard <patrice.chotard@foss.st.com>
> 

Applied on stm32-next.

regards
alex
