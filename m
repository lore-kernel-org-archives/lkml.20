Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.125
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793607679;
	b=cepstMLoc10fQdNK7pzFtC6b1OI0lfR/oJOEwr5QmeIVLB2zRfkPg1DhNVQCSYkINsNx
	 Gk4Uxkw3M1BPnlYTZYsbyxAVUr62rFDxrozzEiIZB5cmNS9CqwkUsbnRkb/loKhBy8baB
	 m4z+1WR6Kvslb46x5s5142YckcFPnSfj7eHmEUyVzkqmo+kgOf4u2pzbVVx7cffoeBNzQ
	 Iab2EUbOj8VJ2XQCnFsigAVMjlPm3OUso8m21rbPe8PdZ1Wmu8dzntjVYL0AqHtFpzZcm
	 XDR1R4/aE5o0yzCQJEc5oxN/qUeaJTHineurHxfAe4skZn7ieATKzqonSGFzbRLDEig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607679;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Gl8z4GzzRnJVNB+iu5QzAHm7NL38k1NY0HbxTBUijyQ=;
	b=nweqxqYMJznjZ7onSJZ4YsyN+DxLLUuoBLocODoymLkqr2T5Z5DmSKb0G+hw13h6DvG1
	 tpNPXVjNyZvMTVVgZx5mBvIPpW43EUBy6uzsuvbhiZsFuMN063/1N1VkhYdIUMSSdDRmX
	 apPJvVLLkfCHIrW9C4K2aU/+yJ6gqTpuOLLGcZ6pHbtzxNsrsEu5pBydFDuwFofmaHCDH
	 M4tmglg7lt0pn0WxoV0mzqmSh7X3genkTJbBqdegY7nK7PcyEAAtyhNntip4wallpxzvq
	 eYx882bICpVWuMWO+DJCGEpl28Wbvs/KpyDYek3OzWuqlecFYwoUii2C28ggEqEf3tA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.125
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023125.outbound.protection.outlook.com [40.107.44.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC56D606A33F;
	Mon,  2 Nov 2026 08:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC56D606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AozlZFA4zgusamXuw2QjNcjHCa5f4/ACL79TGniNEfHwXQfsVIK3pl5RK/023JXj/UosysUYIltwgqXdX9iZg1fwXRjj2QJvy99S7+ND0yRdPS48qcdkXnS91REiBYCDOZm7sOBw7Y5u8RjN76ATkFmerMV3Aw3aGf1DYX2n9btqduWbong/pNnzpYMD/dKN1x6Coo1BdkclIne7eMW/A1D9YZzCiifjN0XIhwe5mEDpkLcX3FRGAkr2w6Whz+gV5fVU3tuS9tTDKzw6EdEWZMkOtjwBLx1Ih6YVmPlpt6LJ4iVGqToyXesk7duMpvPqqmOcO8x5o8xsDWSOB/FAsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gl8z4GzzRnJVNB+iu5QzAHm7NL38k1NY0HbxTBUijyQ=;
 b=nndjWX0I3QnBEdyvy1zKzKjavSUfsK28gEv2i5zf3gq5eDChYUHvMfH+OD2aQ3yWLdqoTtRGJqOQVIXeqm/LkY69JoIjrLudXxz/r63bUYCyqIdYnntg2wLTBSglDqn2A1iWsv3GFnabzeQ1IGEL757pMOOlz4MzdmyZiGWua+x3pQOgES/PjofJDEbdEs8d8vA33+xMOeN+6rtBQrdGHr/bn51KBF7wu9IsmzbhN1/GlupDxgRx03pR0UUVzrpmj/dPIuqliW9pzKJbAcsEdlvadHP9+h4WI5PwZAozi61JkiARTZjdEslXnb2ko98TltXw4TY1im2CH6Jb8hnwxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR03CA0030.apcprd03.prod.outlook.com (2603:1096:990:74::11)
 by SE1PPFF9F12DF7E.apcprd06.prod.outlook.com (2603:1096:108:1::432) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Mon, 2 Nov 2026
 08:21:15 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:990:74:cafe::76) by JH0PR03CA0030.outlook.office365.com
 (2603:1096:990:74::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Mon, 2
 Nov 2026 08:21:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 08:21:13 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7B73A4102B47;
	Mon,  2 Nov 2026 16:21:12 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH 0/3] phy: cix: add Sky1 USB/DP combo PHY
Date: Mon,  2 Nov 2026 16:21:09 +0800
Message-ID: <20261102082112.2306326-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|SE1PPFF9F12DF7E:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bd584ff3-0810-4d2f-dd56-08df38ba423a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|23010399003|6133799003|18002099003|10067099003|56012099006|261009223027099003|261022105027099003|261021121427099003|261022075727099003|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	u2jYacx2lPpoBa83KwYvflxccMkyf2vTcx16Pr2nYjLiSdcQKUiqNwXzJND7MAhBe7EQVdf74Pd7fF10JtgTb5S6UgXpO0LW0L+Jf9ozUNEiCg3haPDg1AiJnFeV9B2CtW4tHLeKWHwWZu0gMsw+mpqHwoolH1BujCt56paSStVt7jd9ui03Gle2vWIBX8upye7agyZ5CyiCkU+3Y9d8tIid4DwGVTa7Ca+fgKFfL9saIGI4Zvk8k0IvDMIOqpguzi2+PcuBkv9DkR9DWhU4b1vJkXo3MCqGWw9InFyesL1RHeUEXE3eJ3PGTuqk6cQ17tIrpcb3rzDGykfJ8/JFzqcvrUQfT6yKX1jlye4hXKt/DrWIMwjo1BH+5MSBsl/7cUeqX/5KP9Y3CJerYBNh2TvN64uFFLXMs4IA8i7UE1fjdSVckbjLyS9GfqQWx9AD/44rEqgFXSCdjBvPodNnGJtP/Eq0t6eRQljsV2PVDp6HV4Ye9E1O1HBdnSfr5yF6+OyVZQc2pTxf/6/BAt2BrNMpzKIfJVhwx9LyMBowiOxkwz34uPtpDsD+jY5aJERGbx0wn6mgjt57znYV6ZxaTGSceyqofoQI837/Yu2COtLlesKGtFs2xmM8EsJHREhCpF+do69PzHdw/+CEExMR8i5E9mguX/yVySWZ/EESe7ko7b3VwREr9eSp/VPbYRHlbOTqFo5HhlPo01KTQNV5Jg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(23010399003)(6133799003)(18002099003)(10067099003)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V3sgUcPR3lExce0c2kwZndBtI08ZoLL5ffDafKCO0g1pJ4nx4LEUu86/iZQ3xJckINLqZ5U6gVU+VOam6dfutAwSs+6Pwj+qMWKdC3M7BSwF/FAE0K+JKAsNJ55+YJ8eO4AESTBkJh/4xpsM7l6n4gMUwp7wzPhdvKV6y9YTfzMq2Qy6Nq7sMIbO4ZIGYGYno6nQDG6A/bx1SbP3Tw1aS531ebqlfWxygGF/KUYXzKcw0GQFf1VT6BWmjNbSqxtOkx+EyRlVmzbPUJz9iHhvQfr7wwIiPvPKUYh8uaUzMGPYmVosIQbmY/O1UC+w6/+lInCQx/UpiV3ery1CokXZxLTzNWdBxZkfOnGtks+BwMyFlh4Obbz2mHj1IMUB0BNEdiSTKhCHirPzImphzbFlbEPBgfWqaBzdShxWjS6j9WCKE3y9zfNSXsJSweqysfAh
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 08:21:13.4292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd584ff3-0810-4d2f-dd56-08df38ba423a
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFF9F12DF7E

This series adds support for the USB/DP combo PHY found on the CIX Sky1
SoC. Each PHY instance provides one SuperSpeedPlus USB lane and one
DisplayPort lane of a USB Type-C port, with plug orientation and USB/DP
lane muxing handled through the S5 system controller.

The PHY registers a Type-C switch and mux so that the connector driver
owns orientation and mode decisions, and exposes the USB and DP lanes as
separate child PHYs so that the USB and DP controllers can bind to them
independently.

Patch 1 documents the binding, patch 2 adds the driver, and patch 3 adds
the SoC nodes and enables them on the Radxa Orion O6.

The driver has been built for arm64 with the PHY enabled both built-in
and as a module. dt_binding_check, dtbs_check and checkpatch --strict
pass.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>

Gary Yang (3):
  dt-bindings: phy: add CIX Sky1 USB/DP combo PHY
  phy: cix: add Sky1 USB/DP combo PHY driver
  arm64: dts: cix: add Sky1 USB/DP combo PHY

 .../bindings/phy/cix,sky1-usbdp-phy.yaml      |  150 ++
 MAINTAINERS                                   |    2 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |   28 +
 arch/arm64/boot/dts/cix/sky1.dtsi             |   96 ++
 drivers/phy/Kconfig                           |    1 +
 drivers/phy/Makefile                          |    1 +
 drivers/phy/cix/Kconfig                       |   22 +
 drivers/phy/cix/Makefile                      |    2 +
 drivers/phy/cix/phy-cix-usbdp.c               | 1477 +++++++++++++++++
 drivers/phy/cix/phy-cix-usbdp.h               |  265 +++
 10 files changed, 2044 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
 create mode 100644 drivers/phy/cix/Kconfig
 create mode 100644 drivers/phy/cix/Makefile
 create mode 100644 drivers/phy/cix/phy-cix-usbdp.c
 create mode 100644 drivers/phy/cix/phy-cix-usbdp.h

-- 
2.50.1

