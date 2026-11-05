Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793845263;
	b=DmOU2Ng55PatVnWM1Wk3UjB8uXOU6hS7iwFVwiKW2cBWllWVuTXQTCO0s+uqx5uyg04S
	 cssJ9/U3/IUgMXGf3WefrhN5mdVky8t4KKPWU2gXjJzwyArb5ljusZCmphxzZG3Z2qfgL
	 CJvkZof1ASp2VIddwpXbbvu7WhsewPWrlZVOiIyUQY7ynZsZlSjKbppBtnqErDvLY4tOp
	 9GIucSyJYht8kdvP3TD4bZ4+qFqj/rxM+pUK8t3U2iKZLXf0D65A6Q12jht7KWz4O9JJC
	 Eqjhz/hk902T4iqHsq0+/6kkjGvWOGmjYEG49PN5g/2BfPDM+yJSxyiArDDByEm33GA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845263;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
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
	bh=LaEgTyRD97VMFsTE5M+/XYrG0rWff+qolu+9sC/aCLM=;
	b=NOyU4go6bMAI0mpqF4HA1/7wzAIfMiFUhiwAPNkhooed7drvOu0yhmHExH8+IE6e4FlG
	 dHfYVVgqeX1i8Y9enBn6ec8R1/FXTEXAHc59Abq8XsgvAqoOz5SzaqGTMMemtqdCs5AwB
	 48iS8XRCWO1S4TcMp9lWqZu0HJmIwtH2nizqg6FLu9uo6ZbWS26SL27jPWGHH2O3Z74Bt
	 bqBvog7knUUpLHL9h5nxsADHqk0VLjoI+pkK9/+Jfh+imqAYqZ4i8dJAWOICHH0Cp05Wf
	 iNj0hkfJqK8EC7oqr7W7Iq5t7HDprDvQiZn5+2JdLfwi8Ke9jZhPzIMmycxWwzsmp1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=co5T+9he;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.61
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013061.outbound.protection.outlook.com [40.107.162.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C21606A326;
	Thu,  5 Nov 2026 02:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15C21606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=co5T+9he
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSAXD2vDWVMR1f9BC2h31FoOrvxpla/FIVkkNagbGidIGoyrGR7HBV1iGMDowqbpSi+n/gwYHf6XqmrSkWFvJbyiwC+hy4jWamvdmnjJ/64aaIC4Liij2Rmm6InLeyK6Sx8nmCm2sBy4YUXgQbQnHchdWA0ZROKDou/Cmii48UcdxtCGlZfbwe/ieSfUfMiQI4YGbsqrsKoV3aCqq+05AXM0JMVu+tVivCGymEIpRYDw6U7ERhDKKLC+oCy9kjRXF60wzm5j3VJgDJw5bw2yIl5Q5IXWTndj55IqAd9XpKqjtF35kt94n23uGwQcsHI23BG24PrALb492uVN8daH9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaEgTyRD97VMFsTE5M+/XYrG0rWff+qolu+9sC/aCLM=;
 b=MYP8mZPusKB0UsCJDQcagsliZNe2E2RQomDr3K3v/cgWWDAX1YOK3+YkeDtAYA6UtQ57lfeZN4E5D+7jHTarVpTNjS6+Kw4mRCEc4heojjKnp2A3ah+EH441/0SS+Hn/l7dTwNg9LypW1K3V026SjVSthoAltpf6V9hvPIIu0gHgx9ZFjrbLWPj98RuE8ygEz3IxNBajl6mQpdHBS90ls6RtBWiArs9Fk1aRYAxM6bJWs5s/2VRtlgGCGj+xwOpxXYHKdwwMaqTu7ZtDSM1KMphSKqFtNxvJ4u/s63sXfY6mj2nAOpe6ELo2oqvMCK50xbN0RiOgC3BzDStRif9H8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=cn.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=cn.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaEgTyRD97VMFsTE5M+/XYrG0rWff+qolu+9sC/aCLM=;
 b=co5T+9heeCCLr+pj8/qMxUh/7/epISFoQKh9HN3m9S2PlxQuEIfmaaFWe7vJ3bGXgpslTESkFAtnMvh5QlA2oGcSgXP1xZyW9bcchcUERRp69MyfrDDYDnB+Q/Xa3A++Pza0GwLfd/I+6q879ADKj2ZBvck2QouUUIOjSR/XgjYTgn8o9itTZvftvJtkCwqOZaz1PjUHR3CTIhoKmG2QwA0szE9eNHJK5vpEiTHIS1Cn8lAzPZnWS7D4Fa0xkoEKpjWxfpPhzZ3P/clO3Eth1xOtMiFBFrmMcvYdCuRT2E+ULpNzw5wL7Q5RhtOGfHOyjL2VOOIEnsS+nNE0O6A7Uw==
Received: from DB8PR06CA0047.eurprd06.prod.outlook.com (2603:10a6:10:120::21)
 by AM7PR10MB3205.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:de::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 02:20:58 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:120:cafe::57) by DB8PR06CA0047.outlook.office365.com
 (2603:10a6:10:120::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 02:20:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 5 Nov 2026 02:20:58 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 03:20:47 +0100
Received: from WX8-V-0006W.wx.apac.bosch.com (10.183.144.211) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 03:20:43 +0100
From: Kaiwen Zhang <kaiwen.zhang@cn.bosch.com>
Subject: [PATCH 0/2] arm64: dts: imx8mn-bsh-smm-s2/pro: Update thermal and
 backlight settings
Date: Thu, 5 Nov 2026 10:20:25 +0800
Message-ID: <20261105-b4-bsh-s2-dts-v1-0-8586d0ba44dc@cn.bosch.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOnn62oC/yXMMQqDQBBG4avI1A64Y1DiVYKFq//qWBjZURHEu
 2eTlF/x3kWGqDBqsosiDjV9Lwkuz6ifumUE65BMUkjlXCHsH+xtYhMeNmMAUgaROpRPSs0aEfT
 8/V7t37b7Gf32ndB9fwDMLRhqcQAAAA==
X-Change-ID: 20261102-b4-bsh-s2-dts-eee23f227f39
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Kaiwen Zhang <kaiwen.zhang@cn.bosch.com>, HaoNing Cheng
	<Haoning.CHENG@cn.bosch.com>, Jihu Si <Jihu.SI@cn.bosch.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793845230; l=1198;
 i=kaiwen.zhang@cn.bosch.com; s=20261103; h=from:subject:message-id;
 bh=3A5PEHnL34WVufSpryDMu2jigVGSuePPEd9B9GWbctc=;
 b=ifdZm0niKACFAyfrOTOGxEJKHk58CY63w8SavSvD8vFNeI7fasawr5Qs27YQKOLgtU84jYWbW
 rZzLFcixAzFAM973ybiYEdSRQBtJM1GKKm0Sch6i2YlA9fOr6vj/rif
X-Developer-Key: i=kaiwen.zhang@cn.bosch.com; a=ed25519;
 pk=8Ap+lAs6RrhqKlHTUdPD/pH0z8/aAuWeDjMasYu4huU=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E6:EE_|AM7PR10MB3205:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fdec917-20b4-4f32-06a8-08df3ae36dc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|376014|1800799024|18002099003|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261022075727099003|261102123227099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	iXHthrPBoC1yI0Ko0cMx0/tYH1qgLsYJ2ml1vJwe3KAz/WXENQ/K4xMI6+pTnvcFW7bGNuePcqosemqovVYKaSOFxDIRjlDmu2jVSxH7IFZM1Xko0Qp2n8G1hzVYMY7q9aOEgr4mMR7NahBpSJhwQ1IL4AIGty+dkephkgTulHN6nmzBLrznJuRpVuper/7Ses5YQAYWoseubm/SXvgweuAI122Tm9XZfoOV9Bp7Rcfo9txnkMXkOC94wPsMTtnCoaXWMZapb4bOGOmufxGJlPtKV4V1ExO27qa4FMvPC7TKsdk4WwB+LiQv6cZkvWe8kK8f3kJwrEWm7XkqKqYaT319bOUtM8m1MYzDal688NLP6Nh/iuwpMIMah4I08VBc7nPE/sUj3GXu3ez9HFV90kyCTE1olELHVPv3+nw5cCxpEZv/4PaEPJfor9XdM5Q1Y+g0vc1I3Iu9++jB6U9weIeCTbMwwMNOWse3EiuDssfQhDsEm72b3VGPYQgdZmdoEd2OOWb5s/HZGyxl3hONwtUjptnbfBjReecEqYE+wCHZqkQDErLyvLIXilHhA0ys2ksFpe/OPAGcyC8qYquEmY0Eop6SBjZkACNp5GTaOesz5qjW6wW/fp5WyVjldWkNHcG5z7p9nDzeRBOs4lZ/47VfW6ZagOYwkJ6K6CS3tfPWvjvuaCLNzMby0hNmRSMTzT2DWyZkbtWB09mFrGCNWw==
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(376014)(1800799024)(18002099003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022075727099003)(261102123227099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	J7NO1LEjc892/BB2ZbnsSm5DAIKcoY2N+6OycXxogY0MORwj4FSl87uxJpkP4GesP//GBMGDmvtQolUFYfgkQbuoHqKtSzBnBrZgYlr8T5huc+rGF4nMYuMcofS8ayAZTA+0W9FyZdhmOh8rryo8pBjKRqKUfKd4bOYluQzMSS9md81TaigDCXUoju0LrmKW2sn64rrSlfyM6/JWQLq1Cohq87+itcRFWfNTFIE+4UBvkSD78bpWMErs4Lq6e4513/0i8Ls/rvMTTQtkE8qjKbAleHH7iZNA74zsOdZI6tF6Iql4D8ESSaBHZ4Ss+4PGt2PRVOyLTD8xUo4M3pbCdyMUl73xSQB62RCiqQ5GzC9R0pb8N3QtGy2Tu+Ee2mrd+Q21VWrlY23MVpIRM3Yx8bDBarRoC8m+iRhwC4Rq2yKRh6YO/C2xzXEPDHbGnr7n
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:20:58.2267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fdec917-20b4-4f32-06a8-08df3ae36dc2
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3205

This series updates the shared device tree settings for the BSH SMM
S2/pro boards to reflect hardware thermal qualification and reduce the
risk of backlight flicker.

The first patch raises the CPU passive trip temperature from 85 to
101 degrees Celsius, increases its hysteresis from 2 to 9 degrees
Celsius, and raises the critical trip temperature from 95 to 107 degrees
Celsius. These settings match the qualified thermal limits and avoid
premature throttling during peak operation.

The second patch increases the backlight PWM frequency to 2 kHz to
reduce the risk of flicker.

Signed-off-by: Kaiwen Zhang <kaiwen.zhang@cn.bosch.com>
---
Kaiwen Zhang (2):
      arm64: dts: imx8mn-bsh-smm-s2/pro: Adjust CPU thermal trip points
      arm64: dts: imx8mn-bsh-smm-s2/pro: Increase backlight PWM frequency

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi  | 9 +++++++++
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)
---
base-commit: 31f9ec9f38735f42e1f0ba57347c420e56b99824
change-id: 20261102-b4-bsh-s2-dts-eee23f227f39

Best regards,
--  
Kaiwen Zhang <kaiwen.zhang@cn.bosch.com>

