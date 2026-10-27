Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.108
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793129963;
	b=V/8uG6OuQbEyIRJ00y0PP4PYhdsR9F8lXFb9JHrDK2pY4cCapiDf7OMUIUwJtch7pssF
	 EUF1an2VPYVjQCQQvB+hzM7mKYQrbdnvBjAbofZYhAUZYoXC9Bc7M4luhcASK5bLNwE0R
	 ERFo2WxmBEHjl1JR22bRWdpeuciJDdldTbpVYalxhQFgwDkG75uDEfzL5r0YD12rim4Na
	 WkJwVrB7T6FtpN3DTpET1pwsCL8reZkqZW/S0ZDR9M+KorLIqPnM/7UOg0JtjbSVLr1Tw
	 5BqRJkbipYT7xNg2c2y9mPE81oqX5/DC7MzA4ErdRrHaxzbJvpQx/pZSFOxFnCMmqug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793129963;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=83yhGSCAnUM4FMQUE05O4wIaIhluxLP/LEePPIzw/08=;
	b=MX8n4REF71cjWPGVDJGKwWQBMPYSUqpxLKEWrWYKQzC9lVXw+Ksy8Ud8qlMiPwEV3AkU
	 was8wa6klyYjWp66JZwNw5yi/m2IJ7nH0XACdUT99QPbTH6qPpku87blM1tywmF8CmlX5
	 YfICHHMSaOiBf2LjJlg/mSxPDMj2b2Oy/eZHEN5R0iCMmk2Y0LlVZ8tEWCjdFbgALQBWz
	 /HjFLdYeIODAKJnxnMwReHlSq1dQdHJGewCs3SEbcCL3Q3LfDXwJq/jnaaI/PNBVwX0dc
	 HAyj05SoqzH5Lm7xb+Wy/kKSYDz52JdFozSdwF6sbT8fVjtbuUoOXPcCKyqbUwl4p+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.com;
	spf=pass smtp.mailfrom=phytec.com;
	dkim=pass header.d=phytec.com header.i=@phytec.com header.a=rsa-sha256 header.s=selector1 header.b=goiulHET;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.108
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023108.outbound.protection.outlook.com [52.101.83.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40306606A31A;
	Tue, 27 Oct 2026 19:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40306606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.com header.i=@phytec.com header.a=rsa-sha256 header.s=selector1 header.b=goiulHET
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4jN8mOHlMQ+F+OO/hHi1PtA52pm4RE4Gq+bRj8kciM2kRNeVFmgWuOr+o0/Nuht1pOA+wwJs//nst9bQsLGNmlHm/TPcs02vAtR4WfG4vdy6AIEVsdJ+ltMtgjs+anRPkPusV237YZ2MNzq0++IhdznE3aYdmREbMoYENZNEVDNfhp71s5SaQbOHtmVm2C/qoJnDFg227jw9c6r+fudQpMPJGOp5OL5evfXVtzoWTKe0Nk2MSotE49WnK3WXn0WI3qFgfJz1XrPx5XEtp+5HKymcikXzAWvG0UhAVqdtLgTbh0kHTzgCSGvc8JHItA+yhNAlO0zbdszFOiFfW6qHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83yhGSCAnUM4FMQUE05O4wIaIhluxLP/LEePPIzw/08=;
 b=w7W9bAibz8zHuF6FqF8c9j65CsDEioSmzGcasb3mcZH1NmYh2G/zo5vWP3bQCw+CvSdOXF5nbpMXgPAxXJuVeVcg4YlhHZV/siIbc7924GtAK3EfSh2aR/zrDlZ52ClxPlHktvriWlQnIalo6fHKwPZJMMEcK9A1taZtUdM3WMfzkzBOmCcl3ZDgvnLPZD0sfXo20yvZtmR6QAAEZOCapVHSb7wI9I/Uo/tcR7y5ccoWru6qY4Uu70v20YliVgarYdrxOShQ/hZWoezIiL1dM3+gWXY+8qKh/rmLv2fRb3EUosdVR5ZzGOwGYapOIjlec++jajapw4nVSmgjwd3qsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83yhGSCAnUM4FMQUE05O4wIaIhluxLP/LEePPIzw/08=;
 b=goiulHETCvNU0bDxHbmv2o4ts4W82nOEiT/1jCX11GXVN7XHNaQsJvAPTeaHPkuUgzcfTQJQ2cKL9TwJ2jtPGh/cS/K0HJFKebk/FbABTHiDKCDB6N9fKsktIqpJJb29+ookZK4qvPhmyieRF0vNc1u/LFEjGLwdJfOdZZPK2Ra8i/G13/c5XWyXx5NlDpVABL0H8WczVF4QIwrwFPKuEdYqTIdrUqVU2yUeUs3Hbcxy9HV+UbiTvAJfvODY00KHWIuAlqRBqO4vQeM6sKJ/47ay09jGugvQnf0KHmzCT8AYnuE2al3w7zuoarH6hJaVFeZnSoR8yDlPR9O+8twh7Q==
Received: from AS8P251CA0011.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::31)
 by PAWP195MB2630.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:46e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 19:39:18 +0000
Received: from AM7PEPF00000056.EURPRD83.prod.outlook.com
 (2603:10a6:20b:2f2:cafe::43) by AS8P251CA0011.outlook.office365.com
 (2603:10a6:20b:2f2::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 19:39:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 91.26.50.189) smtp.mailfrom=phytec.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.com discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM7PEPF00000056.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.0 via Frontend Transport; Tue, 27 Oct 2026 19:39:17 +0000
Received: from wl-jma.com (172.25.39.17) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 27 Oct
 2026 20:39:13 +0100
From: John Ma <jma@phytec.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <w.egorov@phytec.de>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>, John Ma
	<jma@phytec.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: ti: Add bindings for PHYTEC AM62Px based hardware
Date: Tue, 27 Oct 2026 12:39:00 -0700
Message-ID: <20261027193901.3538135-1-jma@phytec.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PEPF00000056:EE_|PAWP195MB2630:EE_
X-MS-Office365-Filtering-Correlation-Id: fccbc05d-5df5-4b8d-4c7e-08df3461fd01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|7416014|261026121527099003|11063799006|56012099006|261021121427099003|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZeuVh6PN8Xjz18HchdfBBqVb+JrSwdgioSF1wfxjW9oPYnpbThU10wT4Y1voxx+aZJ9gyIY/dl645iRDYiS62V/EMsEH/w2P7o4rfO6n+TGIJVwn8iYBuzc7W7ANuwaquw7e2Lnk+kuDTRnCxE/XGd2MNoKsiPuhXF8kLcPjAaSOnzxGoofo4AAvebPHYq7004HAH7FxGZseoV+ae0V/njGjdb6Da96/iogwpIm1KBXcswSIQwrIZawHKi86rE6rkxfDcZFX11BzqjyoYiY80Oj7a5nT5rUMyzOKzE04844UMzZf05YyE3z2M1f4zQpgJLokCkwRTBZKx7viFRjG7CDvMny5Ab6uDbtudhhp8SZQPt2CRC8LykmFub2OzTfAs8bik5SLJ2kSOAcsLD7TbHYYCku/7CGmurwQOtp9lR7M+HTrhDS/U+xQTSfSvUTjzdOZEGRC+fYcSR1d/bo/jDPruoMv1TUCCAXqH7UMqJkqbH9Nac4V+u4Pt/A0I0ej/aTD7ajdj1isNkq8PgRv6gPjwe6W/Padm24jAG6MhUE6CmpBZtxSDEM6/05vCZjxKsz7K4iUA0Wyl49I9kqDjb4JStsiDo8112DGNJHKjDMX92tcxw6uyVfra3nsC1QiimXX+wZwVLOiGsPixJzY2HPhhNyQciy9YG7a6feYAlg4bmSQAMggSnr6VNaGz0Xf9ajA0su5RaTsdH+KGVBaGg==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(7416014)(261026121527099003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B3aNG6o8qL5QLwWSMgLBGcDGertxlbWNpz33na+bAotDb67Y96uf7E4WA4UKxCazmIPwXfkEBfSzzug1vL2DPtqTA3XATkSxgz343fYYSozCkrqTbiVUmI+niBhUnJy3t+bFkm2JoMAgyYTQ4zTgA1hmrJnuKAqVI4iaDNAdPkRkkik79L4jBM33XhMjn3uCinJYk4TzkbhzC7J+cnSOS7S77bTtQruOH0ugLi3nRuHRz2CNbxfsG4lUDsjUEG/aW+mT8kX1ugrhjWmFc4PNOQObhRyPR6CCc24dYv+UuNg/YvIXnp57sZwmXTFklURwDtNeuD1doPkDBupTMktN24xI99IGv7MYhUWPbrlL6yfpMUGxIP8w0nuQar/JnzdbjlWnHgKtqARfEmlsJLfgk1nKno+8D8UXsGlmk6zcb8HzLKUwj7cN/jghr6gVrF9w
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 19:39:17.0634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fccbc05d-5df5-4b8d-4c7e-08df3461fd01
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7PEPF00000056.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP195MB2630

Add device tree bindings for the AM62Px based phyCORE-AM62Px SoM and
phyBOARD-Lynx.

Signed-off-by: John Ma <jma@phytec.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v4:
  - No change
v3:
  - No change
v2:
  - Add Acked-by tag

 Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 9a0d62234058..7c1241053ad4 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -50,6 +50,13 @@ properties:
               - ti,am62p5-sk
           - const: ti,am62p5
 
+      - description: K3 AM62P5 SoC PHYTEC phyBOARD-Lynx
+        items:
+          - enum:
+              - phytec,am62p5-phyboard-lynx
+          - const: phytec,am62p-phycore-som
+          - const: ti,am62p5
+
       - description: K3 AM625 SoC PHYTEC phyBOARD-Lyra
         items:
           - const: phytec,am625-phyboard-lyra-rdk
-- 
2.43.0

