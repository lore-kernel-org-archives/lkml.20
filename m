Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010068.outbound.protection.outlook.com [52.101.84.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47E8409114;
	Fri, 11 Sep 2026 16:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143483; cv=fail; b=u/HrwW1S9+/nKmd3KbdE1GK0aLIojoqNGf/oC9hT4JISGQud5DyTgCo6W5Syl+wUY29kpqEtTeMh3EwgibhRKQL5eMi/eP5FtF3fuk0y/KA1ZoSYHNGF0kTLGF6zWTitDBA/VaGjYIVyjMBwvMiUB3j9lfRaciC3FxBXQIBR9J4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143483; c=relaxed/simple;
	bh=A/sAAL5ewH6LYbpx51hl2xhLGBWRJA3BbhZs1k9MSLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Hthpil+Wcu5Qt85pFGkCcqfSvoundssyfXMgTAp1yGdFXmfh3tRbjBe5c/AKhaz0lAohbJda7yO280ImCCxZy14zV5sT+n1tFjGzPBd8US06n4+zpsgmD656pRepziDQAnabZIySPREctp9Mx/AERqh0QucMYL18Oic6M7Yz4R8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=jlMBTKd2; arc=fail smtp.client-ip=52.101.84.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="jlMBTKd2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1z6svZ4Nr4SB66gDrXOgdAuExksRVkShkC3WSaMnjvr4T6wJPjgni8v5v9W+fPOXdh7jGdAeRBS0qAdb3NDWuofuihyQSZc7KI2/Qng0/75GuNFJz+JI3fGsMhTJsy2XQdgWuxHblVu7dkkgRRDsY2ZHIh/2mHmbG/jZkNgXjiUaC6K5cNM4DmhENoKDCLTr3+CALEPgTnIWFYCxIIBz/2Yi8AZT37E94cVVM7NWb2HlZVMOMZ8O2vfjfNU5SdSKSEWiRiT02dcntwVSV5XeIkj9uEvXspaEAKxr2QCDt7yvcSLHAskj1vGFV91rqVBJJul/Mx4Tjvpw6ObDgjI1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2tGUwBfylyAzEwJ5j09KTT8MbSCTHM3caW7HDAZibM=;
 b=CCuoTRL/Z4YxoLd8bHR4MrZlwS9ekLXGyT5jKyaPXqUXaXII0GDF1t6Kw65Uk83d5hb7nMiGCJkBOWpvRYjNPeqGB5OITRKZs2zCHWqAkGAMcpCyuVx9VgpYkEyVA2o1DdrpTp2mxgjjnDIWkq5OOp4Awzzo4+tu3ORGoYT5Kj7CW5tGl5x7V7r1xptJtcOWyJCmNPqqC9RwVKEwZvJYQgQGpz9Ng5cw/OtIKTT4iwDtgyETsAyJcRkBLhzQ3fGsqsF88TMuwCyBHhIRI7GlaFPxyOEPDZQASvRjbQ02xozKjg86bGZ5Y92fBShlThtKFSWooeGMMVd6OGGmzLObHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2tGUwBfylyAzEwJ5j09KTT8MbSCTHM3caW7HDAZibM=;
 b=jlMBTKd2AZSrlbXqOds2NPDmQk4/3KVEDY6dGGfD7tDoOrH9855nxCld0ZQZBPETL9rgnIeZPZPRpghbKyNMFZAclcBcFnMfZd079Ejj/tvaRbOA608q5oyDLjZCvib1/VbJK+vKnbCu0YmJ0C9CD6SvO/AohXrTMwDGWjNXCokcHFJL0zNiY8Xfkb2ZnBpYgh9LIrIh4vTH2Qd3QXoVrRgWzquOCXJqsFBMJQIyXNuvhahqBQ1lKUSPEGhaf3cvzU57WG7OMQz5rQmk8YqHzTOCO3Nnmfjy6MOFu4jo8+o2VAHHfL85Y96P2sazVGWUE2UDwz1jeNL32r2uk2Hk3g==
Received: from DUZPR01CA0084.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::11) by AS2PR10MB6615.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:55e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 16:17:56 +0000
Received: from MAD0EPF000008AF.eurprd04.prod.outlook.com
 (2603:10a6:10:46a:cafe::62) by DUZPR01CA0084.outlook.office365.com
 (2603:10a6:10:46a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 16:17:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008AF.mail.protection.outlook.com (10.167.241.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 16:17:56 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 11 Sep
 2026 18:23:24 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 11 Sep
 2026 18:17:54 +0200
Message-ID: <04cf5b87-dcf9-49b4-a3a2-33be039be199@foss.st.com>
Date: Fri, 11 Sep 2026 18:17:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/16] arm64: support Engicam MicroGEA-STM32MP257D-RMM
 board
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-kernel@vger.kernel.org>
CC: <francesco.utel@engicam.com>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <domenico.acri@engicam.com>,
	<michael@amarulasolutions.com>, <linux-amarula@amarulasolutions.com>, "Arnd
 Bergmann" <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
	"Christophe Parant" <c.parant@phytec.fr>, Conor Dooley <conor+dt@kernel.org>,
	"Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, Eric Biggers
	<ebiggers@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>, Luca Weiss
	<luca.weiss@fairphone.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, "Sven
 Peter" <sven@kernel.org>, <devicetree@vger.kernel.org>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AF:EE_|AS2PR10MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: d953637d-473c-4900-b832-08df10203d4e
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|36860700016|82310400026|1800799024|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 cXh3vYvz0TDLFPNrTCjkKO2I9ZMFpYZxvjowjAtltEw1Hf9T/OTet4Xp3g1mVqYwTaqMWcm19wWp3GdINYv79/yeuVZ/DhFkJ9dn6KTcLC2uo0HKZ5j1xYxLveJ1ntSJv+AyjHFlJZMe0rlwAvKKph6XDSLNXDalxBEM++fImp8vx+MzkvyTJ7rJEyIY6U1wDxUdKMspMFyr2WPdZAmwKSka3394nF0nSD10Yu1ettNjFFGY7R518Qv46jW1GqrXcFtFbuhdAfZ2U/zeNg8ZM/Q6Ap2/dakUoOcCDW5FWgyEuGkqS1x44QcK/nx7KDrV09m0ASy3lgcS2kkUgjBYmCWyAesdOrl0SBYk/J7IwQ01VGmimIBSmQTCgnuoqEsEwUvq6JL2mUgrWyw+cz1fvFAKog6k6r+b4eLtzNYyWuil/GghVymNfszuuYr5pa8OHnr7F0PRxC8I9KkIPhJvzAYJZKiNK4kekqZdU4G9Z6Zoqgnlia8GumJL263Yka3if3kOWZ9OhldIpWQhiE+DykupcDCWf14jtAMMxZtTK13ymugnseBSYkMgbhr5BvdWW6BcGuvDyjP17TNYueNlQAIN/lTtIwaCuORoW5zKB5R17fRT71617HBv7Xkgq5yOt9X/cSMZjSzhG6AzZB2kLyQ5h6bRAfE87Uo4YCRMXwgSbkea4EIijKdiEdsQLaARGMVaUx2BQaoDlsu7NU9NsQ==
X-Forefront-Antispam-Report:
 CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 wqhMoPzcGuv+tHsbhalAusE9qpP1tdf6d0WwI5X791MJBx2pG+GN56KLnl0zJmO1Gcvb8fOEf7QYqJUK7lIJSA+rJ0BQdscunTkiJGY8OPDBVWCNnqAW7fIN0gKK2jSUJ4z2U5r6bOGkKHyHnnkt4RCWhayvn6FuvgJAbqqrZaAr7fo7XuWVBzAwPbO/SdDgjwFT+aRfVRyf0VmLfqkYuP8090gqtB8R+GpYiVMKKalTW0zAdDobAa5hJAgpU6/zmqvvNNyxe6i8k3DV9v/zuc8z4HCsoNyyp8dhAZ/8ardgfmCNPktbe3YxZZHmYm0yVVKmnECAERbLFpdaqNZiUcuvKaOBpBxuBRkdEt6ltrD23DdB+1AQUYBUFuFL0m3LLtBpql4Ua5Fv79dAgDINYFclnMZG7FWLPnfBUKXupmgb1MRjRl+yeTW2MKXwDWub
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 16:17:56.2211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d953637d-473c-4900-b832-08df10203d4e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008AF.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6615

Hi Dario

On 8/20/26 11:12, Dario Binacchi wrote:
> This series adds initial support for the Engicam MicroGEA-STM32MP257D-RMM
> board based on the MicroGEA-STM32MP257 SoM.
> 
> The support includes device tree descriptions for both the SoM and the
> carrier board, together with the required pinctrl definitions for the
> peripherals used.
> 
> The series also updates the arm64 defconfig accordingly.
> 
> Changes in v8:
> - Add the "d" letter to the board name (DT file name, model and
>    compatible) as done for the other STM32 boards.
> 
> Changes in v7:
> - Add Reviewed-by tag of Olivier Moysan to patch 10/16 "arm64: dts: st: add
>    sai1 pins for stm32mp25"
> - Switch CONFIG_I2C_STM32F7 and CONFIG_SPI_STM32 to modules in
>    arch/arm64/configs/defconfig.
> 
> Changes in v6:
> - Update arch/arm64/configs/defconfig to match the current upstream defconfig
>    after merge window changes (no functional changes).
> 
> Changes in v5:
> - Add patch 2/16 arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
> - Add patch 3/16 arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
> - Increase slew-rate to <1> of ltdc pins to support the 27 MHz pixel clock
>    and prevent timing violations.
> - Change SDMMC2_CK pin bias from pull-up to bias-disable to avoid signal
>    integrity issues on the clock line
> - Fix touchscreen resolution to 480x854
> - Fix SPI1 CS0 polarity to GPIO_ACTIVE_LOW
> 
> Changes in v4:
> - Drop inclusion of stm32mp25xf.dtsi from stm32mp257-engicam-microgea.dtsi
> 
> Changes in v3:
> - Add power-domains property in the SDMMC2 node.
> - Drop patch "arm64: defconfig: cleanup the defconfig"
> 
> Changes in v2:
> - Add Acked-by of Conor Dooley for patch 0/1 "dt-bindings: arm: stm32:
>    support Engicam MicroGEA-STM32MP257-RMM board"
> - Add resets property to dts CAN node. Suggested by Sashiko.
> - Drop the clocks property from the sai1 node in stm32mp257-engicam-microgea-rmm.dts
>    to avoid overriding the peripheral bus clock reference defined in the base
>    SoC device tree. Suggested by Sashiko.
> - Reference the existing labeled nodes directly at the root level using
>    &sai1a and &sai1b in stm32mp257-engicam-microgea-rmm.dts instead of
>    redefining the entire node structure and redeclaring the labels. Suggested by Sashiko.
> - Drop the #clock-cells property from sai1a and remove the reference to sai1a from
>    the clocks array in sai1b, relying strictly on the st,sync property to handle
>    internal synchronization.
> 

Series applied on stm32-next.

Thanks
Alex

