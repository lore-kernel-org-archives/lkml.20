Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794220105;
	b=ji7VJ2sQS4J43LWLvSXYWqbdpUmwhW/q3OpsTh+19d/SlDCKiS4hNuK+EXKz89Jrzftp
	 1H/Tnsae0BG+pD+aNOCZH+aw4ZqttlFGotlB0z3Mnn7uReZ2ecSK5yWqdPj0zSW5tzsFT
	 uZOUvTzPF6n0t9fLUjQjLu9OH+vd7bR7vez0AJAxlj2nmuphjA5o+qLmqGz9krcBq+b06
	 aq1sKae3/iKuzNxL+pURJwQ2Vb5CvMSiSaMcUDE36hxzTC0Fq8OHiMh7/dkndm2kcV5Pr
	 dAB7wtlcGQNCpFhdykGB9fJvR1oOcH3iEqmNgpSsZSl2b6od97I90lFnnEytonsTfMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220105;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=HGBnRE6xBSI4aHlS0/UGZ1r2gRyiwpyBOUQczmKQ8sw=;
	b=yMqRs1VpMCAtHRFy30g/SkBd2Sua5fODzecUf3Dm+dJeeisyn9PB8OSnBComOxzCLb0/
	 QQym7kHAMx95v69NibdRX/8SW2/vk3Tz2slS6RiGehgtfYk9nN4VPjGns1yY3UeVYmet4
	 6gophJoC/OMBdXV6zaV+SITFJbi5z0KdphqDjZZ5Ox6XeSjheygCCJYoa3Mi79wfx/gn2
	 etB7bonCyB14Yd67A7Dy6ahAL9BmjWUfrhZgFw5vRAnCz5LuDJnWnlt6MwGSHcaBELrbZ
	 2ajc2dxVYKig7i+kUz56lkc1AMVXZXNWXm3uTM2W4C/46U9IonHCP71rCs3APMCJBBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=BO+kyBYi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.59
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010059.outbound.protection.outlook.com [52.101.69.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D229606A31C;
	Mon,  9 Nov 2026 10:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D229606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=BO+kyBYi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgfO4tNSfVjq7np1oLNvA0n9ecbVicjmTNqLD9jvuygzDG1rz7Zgb1cISIvH/sV26gxhCPJPy9YVe6n6BTnub6/MjwqZCP0vKBwPjz5gI3nKwjsLKw4Ibeh07xML9OdbVR4hvd0StKHuwGqLirw0y6FK1WKs/XEVntKJ7N+HazHTqNuZooH3Nxn4ofALskK0QaYEH2omlgA57FfFq2oxbPjg6cFgw2GN5fCr02ld/lI1GcLRpvaLRbaeLr42jLbaUBaOXtVEzPlslsvPT6ArpYaGYD8qdfYg5ZlSsepMpAjlSzkBDsiGzjhN3zwoKccMHc97ttdwGTwa06J9XPLF9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGBnRE6xBSI4aHlS0/UGZ1r2gRyiwpyBOUQczmKQ8sw=;
 b=B3+uzVC/fKDuYxhW9Z+Q2Q4NwPrtrrEM5Ct7ZJUiVuwwvz0no+t+jw+xeBG2sTdhDZ4iZ+uJ91NzYVQOadOfB3W/lJ2ZKLXMQeif1mlbzdGuoEaikYeALwXtfhJAQPVA6P1nWX3kj3zFgAYTPOivT7aqAUk1Kzi0pDBbDTJvQmeMZLmDwwXIXoJXnNk4eAQ35XcY0hwPzldARJUUHUZ3URc/vjMMLJFeVhbBB9KTiSmKaoz9VQWPCR33QrOa98jBy/K4CtQIRsilQ2fZWHfsDTCJtqye3eSyLyTnptBuntEgib7w9oqtAh6l7pSS2mVsPZOy9A3syltg1BKb8mnfQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=pm.me smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGBnRE6xBSI4aHlS0/UGZ1r2gRyiwpyBOUQczmKQ8sw=;
 b=BO+kyBYichGMmluXiHpa2TRYhy/EqvUxC2+BTXYteB0qjDVT4Wc6XoNn+7MULIIhrzavgLGIP66IqdfrTdxTZ0Laed+/SXbbbjoee0wou6w3ojm5NxPChOUVPwTgV+jGvSsXQ158P0byi6k7cY0ghX9M3wuND7CbwBkLUG7lXt4n1Oo2PHFuUrbDxO//L8ORKJ6BdCubsx26lsY6csrlfaW38AKG4/8VQxqoO3nv0A1EoOYTIyXAS13d/RDSGePyiC1Ol8L1GdbzFVDnxXblSFhQsoLSjNHINfzE8drfhwo5to8uvJwptqNpy4mcas/tOeDdGCfy7T+EBTI6pyNSVg==
Received: from AS8PR04CA0165.eurprd04.prod.outlook.com (2603:10a6:20b:331::20)
 by BR2PR10MB992188.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:2c8:1d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.7; Mon, 9 Nov 2026
 10:28:18 +0000
Received: from ZR1PEPF0000E45E.eurprd04.prod.outlook.com
 (2603:10a6:20b:331:cafe::9b) by AS8PR04CA0165.outlook.office365.com
 (2603:10a6:20b:331::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 10:28:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E45E.mail.protection.outlook.com (10.167.241.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 10:28:17 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 9 Nov
 2026 11:29:13 +0100
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 9 Nov
 2026 11:28:16 +0100
Message-ID: <66c9105b-4da7-4b57-a0a1-e33c093f1529@foss.st.com>
Date: Mon, 9 Nov 2026 11:28:35 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: media: i2c: st,vd55g1: Add ST VD55G0
To: Sergey Lebedev <lsa.uz@pm.me>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede
	<hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall
	<pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao
	<hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D.
 Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261109093353.3757-1-lsa.uz@pm.me>
 <20261109093353.3757-2-lsa.uz@pm.me>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20261109093353.3757-2-lsa.uz@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E45E:EE_|BR2PR10MB992188:EE_
X-MS-Office365-Filtering-Correlation-Id: 5808161c-3801-4da8-4f29-08df3e4c2b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|36860700016|82310400026|261009223027099003|10067099003|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261022115727099003|261022075727099003|261022105027099003|261026140227099003|261028144727099003|261026121527099003|261102123227099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	S5a1IyUbC6TXmUt7VrDFFuG/dqE6EV84EM8wb0a7F4iRI1/0K4dxe6TMvl9QVUezVdUCEFOL3xAHvTNcHwzKAAPks59JDUGkr6dseMJFntAR+gv4zldaPacOULwLTa0AUWLEh/Gu8XcIjZiaf4yyx6fTI8ryhV85oyptg+uNCwjGnEJR+CZUmSnLRoa5Pa8ChrjNi0cLKieCgbxob1XSJHFENeudvRsbVF95xFKyBo4L+CNXSTGiFeiRp0ply/8E5M8aVzuF6lwaGBz4Kbs4s2oAb8W1V08eQT3H9SjmumKVZxewnLDfwQOw+81n0bZKccj3jwy4PqgJI5Me5VbW+tdoTOwT/qsa20zHtDWJeLe2A0s7lI6ziXBvCiqzrkLxLBf1ox7RZ/igfJC5DSG5ebNPMmxbieCOxQsu28hXqk3oyE9CVpiWPVuucArfi+KZkKC9VKZDgEBQPT5rWdRB8KUpLeQFVSzOP+ARqZmJRNmCWRMqtQYmWcCx3PREsn4z4CUjW83FfPfaQ8JSkNxR4LzthkXosUQXEW/OLuYzal7HncCVZAx2ANvqxb6HJq0F7xJiwFxaXiSIZbRmgL/Ufrhy/WJM+BEeWovOcUSdHu+de55XOm5tVFnmj3NXbSjbY0VHiwJbu4Hsj175wAkJB3KTl5vb2Kqo9QTd63d72Ok=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(36860700016)(82310400026)(261009223027099003)(10067099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261022115727099003)(261022075727099003)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261102123227099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e2eKtyTa6rhTwCj0zEXvKt3bPo03QvkHN0qZI3mr3pvZCz8EJZLbK/Ln1H9U/upf6f3snycRlOBVnmZgDHjJkDvkS+7krKgUyW26pi67y2JIKjGQ0s6hi+dpUU2yU6ElHsibyoYLVroNwI3+J5ZDuUSSi/1aAPq9iht0uatEvu/DA5eUC1tKkt4SJG+L594Q6uIXEMioa1MzYlGuWYtUqyHSPHWCAjz8z0gnTujVsXw8D5YZ9TdRS4dLz0pKsJpc83eAQSdI1ZeEGZCeRUCE7IDb41OwgvZfme95PStJMV5d8hczrpF23ZaoofOf0X2Cnu6tnMYfYd9I4QwB9cTeGBSHz9bo40ee0gNTmvEWsP/M/YjTSxeAZ/O8IKZPJmJeB01EJ8wW3jLKKXuCDpGLMr9utXD+L6woL29yMXtc7KuJG0fNKF4XD4E+++o5mYJa
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 10:28:17.9291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5808161c-3801-4da8-4f29-08df3e4c2b95
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E45E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR10MB992188

Hi Sergey,

Le 09/11/2026 à 10:34, Sergey Lebedev a écrit :
> The VD55G0 is a monochrome global shutter sensor with a 644x604 active
> array, sending over a single MIPI CSI-2 lane, with the same supplies,
> reset and strobe GPIOs as the VD55G1. Its MIPI rate runs from 750 to
> 1200 Mbps (UM2829, 13.1), so its link frequency starts at 375 MHz, and
> its I2C address is set in its NVM rather than fixed.
> 
> allOf moves below required to carry the if/then for that minimum.
> 
> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> ---
> v3: no change.
> 
> v2: the VD55G0 joins this file instead of a st,vd55g0.yaml of its own,
> with allOf below required for the if/then, as Krzysztof pointed to. It
> is Peter Marshall's 01/11 and 02/11 of his vd55g1 v2 squashed, as
> Krzysztof asked there, with the VD55G0's description added:
> https://lore.kernel.org/all/20260918221705.323510-3-pm@petermarshall.ca/

As vd55g1 and vd55g0 are two different drivers I think they should be
kept separated. Not sure what Krzysztof meant, maybe he just wanted to
point to a similar patchset. Krzysztof coud you clarify ?

Could this patch be reverted to v1 ? I see that similarly the
MAINTAINERS file as also been altered in the second patch.

> 
>  .../bindings/media/i2c/st,vd55g1.yaml         | 27 ++++++++++++++++---
>  1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> index dfd87beba06..0245673d105 100644
> --- a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> @@ -16,21 +16,23 @@ description: |-
>   array size of 804H x 704V. It is programmable through I2C interface. The I2C
>   address is fixed to 0x10.
>  
> + The VD55G0 is a monochrome global shutter image sensor with an active array
> + size of 644H x 604V, programmable through I2C at an address set in its NVM.
> +
>   Image data is sent through MIPI CSI-2, which is configured as only 1 data
>   lane. The sensor provides 4 GPIOS that can be used for external LED signal
>   (synchronized with sensor integration periods).
>  
> -allOf:
> -  - $ref: /schemas/media/video-interface-devices.yaml#
> -
>  properties:
>    compatible:
>      enum:
> +      - st,vd55g0
>        - st,vd55g1
>        - st,vd55g4
>        - st,vd65g4
>      description:
> -      VD55G1 and VD55G4 are monochrome variants, while VD65G4 is a color one.
> +      VD55G0, VD55G1 and VD55G4 are monochrome variants, while VD65G4 is a
> +      color one.
>  
>    reg:
>      maxItems: 1
> @@ -101,6 +103,23 @@ required:
>    - reset-gpios
>    - port
>  
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,vd55g0
> +    then:
> +      properties:
> +        port:
> +          properties:
> +            endpoint:
> +              properties:
> +                link-frequencies:
> +                  items:
> +                    minimum: 375000000
> +
>  unevaluatedProperties: false
>  
>  examples:

-- 
Regards,
Benjamin

