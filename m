Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013056.outbound.protection.outlook.com [40.107.159.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57E12571A0;
	Fri, 11 Sep 2026 14:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137145; cv=fail; b=pC9ibat4g13ZlwwSAmcLvMh3YDaB/82nyZHW3aHWrtkefD/JO9wrBpB/IjoYqvQuY64nqqGqpEzsOD38LW11upQhjmrqP6WVwiybS0hu0b2dHWi36sd0x0Dlrp+HBKWPB/KbopeFDQuz/flU7maq+yziwZtFT7diZ514mr1hzU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137145; c=relaxed/simple;
	bh=tLj2n2GHzdQrZ/3Vl6JLo/L1GQBOSjRo17fuKKbHd5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kEoFk//RQzGq42QR+7Sn0n7H5KwBhHQQZLAGSRfpfbTC1kM1r5JQFIOz99RG81MmpT2veWhlexVvv9ndGejd23OD90/1qSb6pgwb08iREXp4A3ojeK2KpsXTg5AtSR7GQmv7+RtDIE64iJjM0/aKHp+zbGWpqUZ2xPi0GG+ONB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=GKozD6OG; arc=fail smtp.client-ip=40.107.159.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="GKozD6OG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NegV+/s6n97TKZ24QrbHq0lmHx9wYAXJ5ftJb/3MWu/YQimV24niEKYtiPq/pR1BVNzZrCNPgWPS39amPNvuEHZpSuk6A3mn8XtgpM3vkzHwrteCfGo8BMYYrbvhVzrYwrQSqZZXUjm9KjWmQ6ZxFFDvK+wZl4ny+qx1oRY1M2a2OX4eH0vtSRVdRILDH7OGbfIyppHTOAbb0z/UOKFtLTGj7xem2N1fLAJoWvHETWh3xWsexIvKbD5FTL8CPc/COPModND77zLS4sdiXSxI9y1aN2EnFx9G8NNPEkxMzST9Cn/KAUUygoJmQFhvLYm37b0j6sYPcIGaSZzH+mpkRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwZ2l4hjswq0AK3l0AV1y0acLIE7iuAHVI6ig6MpxP8=;
 b=PiPaUic8Jb6Gq8Rd/IxBYa1k6hAoodDETrTodKKcPmE2NoC9zO1A6AQTVJy1/uUolzaVoZYmLdzP7J+ElKq9dMpMMBFQJvUd1lNd2DE0NjW25B91xEx4pwRHKh0BiffVHg5jN+opraPMLz+ywocolReoywH4hGFYzaCXkMmJsyhNJqVtTJOt4sjJRoK8KGf3uZjN3NcIrbT5ytARR2V39cEVhwFblRmkZ1zOmcFA3Vzk3FEQBBO4kytlVe2XtIIrK2IlCGx5wAqRYW/qp5Jz1aSGREo/PWzyztSZqVGnaUHycQ1Yk5d/2Wq5CGOypZpt3WaD3TXeL+VRSjpkDty3jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwZ2l4hjswq0AK3l0AV1y0acLIE7iuAHVI6ig6MpxP8=;
 b=GKozD6OG3g/trtbrRlLvf6JTlDcQnP2ur8wC2aLwWxVZF0KdfM5ZW+Z5fXnq9rcoltuWcRbgdaTc+5Z4B/0JW6WPFHB1+IcnF6oGDow7tcko/Rcf+rKUWTfJp/jsIwLwDep9D6CBpyqT+8omKIgyj68NxD18TEkWBHk5JJvO3Z/FvdQ/Zm1SNmV9vgFebySnNx36X7CCkZRCjvHJHxwfhJlw/U/zBle425Ne57DFcAreLJvImiHzarW/+RtiYOCV6tOtX8OvbxlErgGek/KjhFFwi3pmlrzR1J7SdCLFbQZ9E0XrSCv3JCKIIYmdYxXXKP4zNIkH84I0zks58EimbQ==
Received: from AM8P191CA0010.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::15)
 by AS8PR10MB6796.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ba::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 14:32:16 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:20b:21a:cafe::a2) by AM8P191CA0010.outlook.office365.com
 (2603:10a6:20b:21a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 14:32:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 14:32:14 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 11 Sep
 2026 16:38:16 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 11 Sep
 2026 16:32:13 +0200
Message-ID: <adc7f285-6269-487e-bbcf-d157da49f379@foss.st.com>
Date: Fri, 11 Sep 2026 16:32:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 1/3] ARM: dts: stm32: add missed
 arm,num-irq-priority-bits for stm32f429
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-kernel@vger.kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Rob
 Herring" <robh@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20260820092143.44829-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260820092143.44829-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|AS8PR10MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: c011128e-2067-4d20-2868-08df10117967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|10067099003|3023799007|18002099003|22082099003|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	NP5mS3DuWol3BKCRgtQl65S2FBdC/IaOax0BvaAvIAkHd/C2PaCmMLexmf38LQGwfAxOYRvbd06lYYP9l6Vw6ImHOJ7M8vGpIjLYEYdBLMcVOop3zE7+AEYSzu0ZlHLQrf+WCvfRFNxjvYQmN6sh3GEx3jA7Os3zPhK5L0qm03AC0byRGDHS49Q7M7hmQ7uEwAgdj+D0nVsLdN3zqEr4m+u5moHfy5ZsP1DSgYaE1tPuT42pJke1QO2u/G0ckN2zP2DBeIwx/kdnggueHXQknKmu8uvTs8gJHNiy9ojWFU3uDMsgKs5078cDkNJEHFxOIucvg7xe6YlxzcF+ru1ij+2Iefzyk1NNd39gBHyJD92yubuha4vcEASwRxIdW9gi1YyFBi77MnjFribqhTp/mefLCvsIg+JWkFZ7OWA3/ZZK9e9c9nSGIUie0X+lGzSCwIhCxOHGwrEW8ZRScaihztIKqoMKaU1pBNcKSkCWpEDU9R3YSXrYnoY1LyiMDOvDyhuThkxjLMJHpWA/Ak4Ec3Fop+1jqgR19SbO9/OTbDJLpREI3tYZ/7mwpTG+ueMXvHXytOXgZsI5WfDfuH/wswB89IIMMk9I8WVL5BzdbL+6stgEZG9HOvPrnU1vUZimG+XPz7eWFkZtx7X/B0Fx1FK2nTcNB1FnvQ+MmX3o/EQ=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(10067099003)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5ZLu+CFE3y0+17TjmuFgVyCSvBV6897eB8cvfeyidhkX/ci8gvR2H2IzJ1Y7X9bXihw12UAupRY33ts8wAyfaXAXpRe8zU4ERmvWIxhwAgNkJNgJecnEF7w3ozcFqQ9O0fpuxg+F58w6kHX5vtzLidPrwgQvd6T17jQ0JszMuGvaNalOas45Mc5luJyJxQD1THe2PT+g9X4fDl0aClfTdw/7ZhgJly/Zyqf0EvytJiWEUIue40FwkD9kT+1nbMKiOQzmrsI1WXAoay2GLZA9zK8ODNLYk8+xamjdRthj4+uR2f9QU/nQxT8stIkz+QoIwoYWufgXkkikaGIj5siISFXBVSbZ1x5qxP7MUaTMRdO25yNn9RokjE/5Vp6UUNhDYEAghooCkYHr/hX6NCntKWiPRRfVECBZa7IIQOwitmk0pZI3PoB2sCjoHznTORaP
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 14:32:14.5937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c011128e-2067-4d20-2868-08df10117967
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6796

Hi Dario,

On 8/20/26 11:21, Dario Binacchi wrote:
> Add missed arm,num-irq-priority-bits to fix below CHECK_DTBS warning:
> 
> arch/arm/boot/dts/st/stm32f429-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
> 	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>   arch/arm/boot/dts/st/stm32f429.dtsi | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32f429.dtsi b/arch/arm/boot/dts/st/stm32f429.dtsi
> index ad91b74ddd0d..f94500cd90cc 100644
> --- a/arch/arm/boot/dts/st/stm32f429.dtsi
> +++ b/arch/arm/boot/dts/st/stm32f429.dtsi
> @@ -794,6 +794,10 @@ rng: rng@50060800 {
>   	};
>   };
>   
> +&nvic {
> +	arm,num-irq-priority-bits = <4>;
> +};
> +
>   &systick {
>   	clocks = <&rcc 1 SYSTICK>;
>   	status = "okay";
> ---
> base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc
> branch: stm32-nvic-irq-priority-bits
> 

Do you really want this patch ? MCU boards are deprecated.

Regards
Alex
