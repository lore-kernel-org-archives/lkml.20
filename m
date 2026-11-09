Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794227113;
	b=REuKwZIOS9PsG9B4goa+DQEQyY6T6KyDXhaAUhIRw+glXjJHYNEDh33eB3GWLRakXy1S
	 f22Qa7tmq6jLTFBGH+xeFLSYGy06iYOmVmXHBJVS3EN9vfNxuatQIlAwCwwD9BCuUhmY4
	 BYjrWApeQKVprTKj/SxG+HJPwnAe6OBnnoXinjHM46WZ6350xaOf1SP0L3b4DmxihzjaM
	 KXgIeevlwQVLh4n4g+H6k2s3RxpXikvuj7fHoQdSzCM17vBWTBFe6cBIeVvYVunQgKgra
	 5CZJOHpMooIpCOO/FgiKDj2eDxstu0/vTCy47nzwBgeUQp19uKLAMk7Cz59C/HWlyeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227113;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-exchange-imapappendstamp:
	 x-originating-ip:Content-Type:Content-ID:Content-Transfer-Encoding:
	 MIME-Version:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=f7sLol8467DSqdG8DHlUWZ4d7Lzw/hCy+yQVXM8XF6E=;
	b=U4QrhiRFDFsjCZHVqFGOl8Uu9tBkCWWG8d2npoEQV6nXviBQ6NtRI2VIYd0cPLFdabD0
	 qacHw4LOcEdgV+/UwC7yJhE17XRKrCAeXxZTl1sgeSW6bWzuT5qClBJtAhrNRUIyVeBLh
	 vIMPYLX1Nn7k+8RMVDvY3DYKEBOVmW3IWO2XBMJyW/hLt1PWi3TzyqPWG4LqTqB1JLz3Z
	 qXJqdvlRC13kbMbH5grwwnrOVF7D8V842DAdN3oPP8kePi0+cg/UNGVcFRExpNTx9E7MO
	 a2eq173/GOxxAG0KKejLKGEVUikT0huejiBsRKWDt+99R/jxxcjPf7Q+8K0B0RyexlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Lvf6sZ2O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.68
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011068.outbound.protection.outlook.com [52.101.70.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46351606A31C;
	Mon,  9 Nov 2026 12:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46351606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Lvf6sZ2O
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=koBcAq3qLj0UipR2EY+DRpZr2dQDx70scYMdF+ztrQhlj2jYc0OevqI6Whry/RydOAFM3BUHcuLW7IWC9ioRNOJITgqHlcXH/MnpzsJ+MQykDsxKXOdVpaeusVnUEhc4o8SytTIrYQCDyDdFzF/NWFwng8hF4YBlEFrNpABNI3f4IEyTrQWUlAd8ufDeUiXkBVW3+CexogZUZnc2g+a0h0R7OwCuNXCZ8MvU9fXSQGLyDc21rIT6Ep4OZKKlqoRTPPEqe6dIFQmiJQF0VPYT1loH840q0pb2kfX9rOrWlrzFMoBNd4/dbCIfsprwVF2D6NZWG/8NAQcDBiOBDpIYLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7sLol8467DSqdG8DHlUWZ4d7Lzw/hCy+yQVXM8XF6E=;
 b=FL0HDDGQCCXjWxIuTtsjOpcoMmU1l0VHj0WQ/i7eBahBETDm320022VL8AeuL6Sqm3/qCPhCh8NnOGnRo/4nhrM1y5Ll5eZlgG+TfjHqujwv0nbna8bjGzs9ziFWFEDdms+5obFUxOCw7R9djoHJZ+W6fMP2gc9V0vz5q+cW9EnJ9+hOs/FKpa3bTczDP2KBl18UWihUo87As4sfrizbpMIJjMq35K3vm3SITMlw9yTadwVuPCHQP40F9z69LYUWj+U5Ozt7Cp1mFzIIuL4ffv9sp25yrjXMVWbG0v7ltJ7VuAnJGNmJ3oiizaeIn40jf8zGQCLEl9yiWXXtHgmQKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7sLol8467DSqdG8DHlUWZ4d7Lzw/hCy+yQVXM8XF6E=;
 b=Lvf6sZ2OMT5vtP7nLeoCqi6j0A2NvcN3yx9zvlUiAnK0uDHP7V/KqloEYGsPbPcLe5MAxofFm3rMxWhUEYQcQha7fz9ZHIS24ZH0HglqLu3rDE1po/ZTP8ABo7NMf9vl9IV4ddO7+c4BElAsRgqnIOC0H7SDuSA13TZ9ufLQ3OP0wYwZhn3jsv1OhNdN6syBQxLnkrVIrvHk8DsmkMCAzl9O8L/BqGq7wILM83rVODVCm1a1ZrsAYOqIAsJBjCm9cFMvSY0YAQWxypiyCY7QlOqyVCm9Gl5ik4P27CSNWoWWwBW9bew6NzGJEdQL9C4bQG3mNbFDL05eR2ndkTxbKg==
Received: from AS9PR05CA0161.eurprd05.prod.outlook.com (2603:10a6:20b:496::9)
 by AS2PR10MB7105.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Mon, 9 Nov 2026
 12:25:06 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:20b:496:cafe::73) by AS9PR05CA0161.outlook.office365.com
 (2603:10a6:20b:496::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 12:25:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 12:25:05 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 9 Nov
 2026 13:25:45 +0100
Received: from STKDAG1NODE1.st.com (10.75.128.132) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 9 Nov
 2026 13:25:04 +0100
Received: from STKDAG1NODE1.st.com ([fe80::c1fc:16d5:3d71:a411]) by
 STKDAG1NODE1.st.com ([fe80::c1fc:16d5:3d71:a411%17]) with mapi id
 15.02.2562.056; Mon, 9 Nov 2026 13:25:04 +0100
From: Yannick FERTRE - foss <yannick.fertre@foss.st.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, "Alexandre TORGUE -
 foss" <alexandre.torgue@foss.st.com>, Stephen Boyd <sboyd@kernel.org>
CC: Marek Vasut <marex@nabladev.com>, Gabriel FERNANDEZ - foss
	<gabriel.fernandez@foss.st.com>, "michael@amarulasolutions.com"
	<michael@amarulasolutions.com>, "linux-amarula@amarulasolutions.com"
	<linux-amarula@amarulasolutions.com>, Raphael GALLAIS-POU - foss
	<raphael.gallais-pou@foss.st.com>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [RFC PATCH 4/4] arm64: dts: st: select the Engicam RMM display
 pixel clock source
Thread-Topic: [RFC PATCH 4/4] arm64: dts: st: select the Engicam RMM display
 pixel clock source
Thread-Index: AQHdZuSRJUR6livE9EOmCi/YZjZNOLchQTgA
Date: Mon, 9 Nov 2026 12:25:04 +0000
Message-ID: <01bd9e22-b357-4093-82f7-485698be30a4@foss.st.com>
References: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
 <20261028135915.2665857-5-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20261028135915.2665857-5-dario.binacchi@amarulasolutions.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: STKDAG1NODE1.st.com (15.02.2562.046)
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A64B2D8FF230734698C8817841159428@st.com>
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008859:EE_|AS2PR10MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 98439c1a-1fc8-4a25-7b5e-08df3e5c7c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|36860700016|82310400026|23010399003|376014|3023799007|22082099003|18002099003|10067099003|4143699003|56012099006|261028144727099003|11063799006|261026121527099003|261026140227099003|261021121427099003|261102123227099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	sojlnHfeCmgWUDmkYAse/33tEuIavScCTOF73CjGBW+oJa2RUAgRcFKTeLF/ITk4AEry0mS0lg83QQyJhvWko0I0mRIKZOXu/aaI/tS/K9TuN0B6NZOnHfZ/At8XbXhm5E7SHchZq4648VJ9VcrOyIPkLbjy/PmPJvfxNbq6UUoUI8mSjTotPGkdr+aKPpxBaijpvTgHX/dALBwO0M+NR4Kquy1wAWQNo19PFzrM88cOpIlQN+QLgkQoDfVTCurN1wDw5mWWTa4WtT/NGolftuJ+bUio4TcQONKpfDuZnYWATSNBbN1N3hgY+lUGCZ63BvKjftf0cdu5T2ETN6IEiys7tapSQxVq/SzyfbBoyIp5T8GarwvBktXu0398AtWVhet0V2ziUDJdLEnknTGlmnH491nxy09fCbT+FYY/bTQSD6yhzmI3r0bBDALujRaCr5/dtlzDocUGjHBq3k2kUZv38xPqZf19xvO1Xy111Zid89m2D2odh3daxnW/ZO4yAJ2/noLUgpTBqJqJiaVflkAPicPW3QRbDnwwz0XVWr0Iz2LJg776Zbdw3+wMcSB1Pf2ou5LGk6bFBzR/H7k0rsfVclNf1v1eLvbluVkXV8L3pfhWfxBI7nT+++LP2opKLvfQEqnya1CuKJFt/3hwkK9qWqJJsVZE+HoDyykHMjOa4MAo5KVaX95jasRndFoNOAWLagwzabYkr87edEenpw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(3023799007)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006)(261028144727099003)(11063799006)(261026121527099003)(261026140227099003)(261021121427099003)(261102123227099003)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DrE7N8bYd2vHAoY0SrVk7X7porbkrsNHrMWQod6TsPnRIMFaMYHg58m04LWAB6e5tzTxVp/CuaEyNc8DfvHwFn9C/h0IjF9VK0Roh2EqGJRxJVCuV6679xOUDXI9zGf/W066CAIU+bq2RtByivOLg93Qw3nNT6uO1EDUwzH4sD2HUrxojcEyKHXIXFnEXm4ZY4bEQbHcejc3odeG7ONAU9GkfH8qhnt5jkJqCj310c0S2QaMygUzQoSAk02dn3JaGiZ2WI36IlBWJmWz14mNAujb3/MIMOSbnNOquN/YamLHg4EkhO+siABhMJpAaLB8mHVl6EoXlTxNlvlkpmqh1xCCk6CbNYV0G7ELz3EH3IswKHOY7suJI1w3rlmdov4Iv8bsp8B0ZPpA358m4ttu1bOs7QADrNBI35S7zR1v0A8W5NnQhmYtGmDGNfZQ80ze
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 12:25:05.7022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98439c1a-1fc8-4a25-7b5e-08df3e5c7c97
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7105

Hi Dario,

The parent clock of ltdc must not be assigned in the DTS file.
The ltdc driver must check the display path at probe=A0 and assign the=20
parent clock based on the type of connected panel (LVDS/DSI or DPI).

Best regards


On 10/28/26 14:59, Dario Binacchi wrote:
> On STM32MP255/257 the LTDC pixel clock is selected by the SYSCFG
> pixel clock mux, whose reset value is the LVDS PHY pixel clock. With
> the RGB panel the LTDC is then clocked by the unused LVDS PHY, and every
> commit times out:
>
>    [CRTC:42:crtc-0] vblank wait timed out
>    [drm] *ERROR* flip_done timed out
>
> Select the LTDC kernel clock as pixel clock source in the RGB panel
> overlay and, for consistency, without relying on the reset value, the
> LVDS PHY pixel clock in the LVDS panel overlay.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
>   ...57d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso | 3 +++
>   ...2mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso | 2 ++
>   2 files changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-over=
lay-am-1280800w8tzqw-t00h.dtso b/arch/arm64/boot/dts/st/stm32mp257d-engicam=
-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
> index 7655c1bf56b1..b44e1d3ddb1b 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-=
1280800w8tzqw-t00h.dtso
> +++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-=
1280800w8tzqw-t00h.dtso
> @@ -32,6 +32,9 @@ &framebuffer {
>   };
>  =20
>   &ltdc {
> +	/* LVDS output: the pixel clock is the LVDS PHY one */
> +	assigned-clocks =3D <&syscfg>;
> +	assigned-clock-parents =3D <&lvds>;
>   	status =3D "okay";
>  =20
>   	port {
> diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-over=
lay-rk050hr345-ct106a.dtso b/arch/arm64/boot/dts/st/stm32mp257d-engicam-mic=
rogea-rmm-overlay-rk050hr345-ct106a.dtso
> index 7be955be58ed..7855086c33c7 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk0=
50hr345-ct106a.dtso
> +++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk0=
50hr345-ct106a.dtso
> @@ -38,6 +38,8 @@ touchscreen@38 {
>   &ltdc {
>   	/* RGB output: the pixel clock is the LTDC kernel clock */
>   	clocks =3D <&rcc CK_KER_LTDC>, <&rcc CK_BUS_LTDC>, <&syscfg>, <&lvds>;
> +	assigned-clocks =3D <&syscfg>;
> +	assigned-clock-parents =3D <&rcc CK_KER_LTDC>;
>   	pinctrl-names =3D "default", "sleep";
>   	pinctrl-0 =3D <&ltdc_pins_a>;
>   	pinctrl-1 =3D <&ltdc_sleep_pins_a>;
