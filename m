Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.140
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814688;
	b=gXWNRGJ0CNLJwBU1oYjuVamPbTCD6viCtYSdoHfUrJar79XbIxjEtogWmfHxdRxcr4y7
	 hltmxFFho+p+2KPt7a+Q+20MwtRFk0bsvw4p1Gee1wUtCrjPXaOVRJYkKvXfbOZTath39
	 akFsSe78PU0Ez+4ddPZY4FrhEuyf3hNQxDnyC9vkEsk+qEE7eKz9Z3cxqtCR738ywjmmg
	 QOers6q7AMEQ1aQ6oJ9gtASWxrMWtdh+8l2zCG5egQl6lySUfB296xEkCObjVN7UklmA1
	 CvPmMNBsrKUZOyhKMMuLFn8TL++eR29h/8Oyy+AVuuFghwRX1C25OyV/IX53+PT3BFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814688;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-Id:
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
	bh=q7GKM+81oOiS2oEdiBwBs/7i4fTIWrVL5NLvn2f98ec=;
	b=RampzJ+uYbahQdN6QpMGq0a0rPhOcQMzPuSuSpR02qPS4qNWDVVDXMvTHa780d65/gZO
	 9+//itgop7d9JoF0rgPijybkrd66SwBme52/OjNCAu12sHHnRptELHGNHOvEQRoCj5Cks
	 61B2SRzMaDr5iSo9fxqF+oyeLrsxFmIqavd4j4CY2x47oPU0KqQJDROPYUvuGIcACoU28
	 GIDTnV1Vvxb3a63Vcf/AiCoHK01Z3nnY2cmjX/bVUTnfBTRLdaEg7MXZoMGpQWqqJF/2T
	 PLaePK1QrYjGqG/Lqde4t+JuE57mbHCGUwx8gu0z5FOY/be+266i5x2iwMZVXCvhG5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.140
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023140.outbound.protection.outlook.com [52.101.127.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1FD606A32A;
	Mon, 16 Nov 2026 07:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F1FD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlfDbz2klUycRd27/qmPn33YsrJIDi8PuzvlhqvPgmr3zMNAFpMDDle6HzU/lbRc/6Ee8CcsRY0NxvT1wEVbO26meEG7HwRD9WA60Q9LQGFLDumIoygYvkOP66A7LNXzbSZBGsfAxBlAjEsuY/BfHaLEL6667vNBikg/8pZcuflEpOZIfjDdl6+FU8zGaygbkB0exoLSGMVXLZ9Pr6L4Jq4fjPqDNEBrRD9GmC6YRiTtZuN73viZDiUwNLXqods2qGibuqmFiXe6NsDyvnoAXET0l2JF3FC11+wyUbfWM3EGTKDnQy3n1PKVXrG2Q6i3tVizHhzSrNrJUbYonhB/wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7GKM+81oOiS2oEdiBwBs/7i4fTIWrVL5NLvn2f98ec=;
 b=Bbw1JlqHDxnQNSsAz22faluqMl8BXhlMEI9T6wunf363Vq121ofp9BfNV6Zx1r41+t6YrfvUbyb3ZsT9alZyBKdD/ItpeNv/gea9/b4gnFhh7gSaB9OlKLywwog9pV74eg432awxGOWlnHXLByiPNnUFYideaHmxJsT9xXBpv3x13hIG0MmGeD9uR40w1uCK77v0+yLu8hdvr6w82gCmHw/tVPcmPASkJjNAYwtRkvGcB06w8OlqWBkhOF9Ns7R+A2Sz4GLBWkSoRlKi/W9RpUuzyTXHOvVK3uyzUWWUrDRofP7e3NHJjYPAGAB/XqPPpTm9kc4948uClNaQbCFNGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0127.apcprd02.prod.outlook.com (2603:1096:4:188::7) by
 KUXPR06MB8081.apcprd06.prod.outlook.com (2603:1096:d10:4f::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.7; Mon, 16 Nov 2026 07:38:04 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:4:188:cafe::3e) by SG2PR02CA0127.outlook.office365.com
 (2603:1096:4:188::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 07:38:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 07:38:02 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 0D431427EFCE;
	Mon, 16 Nov 2026 15:38:01 +0800 (CST)
From: Luo Liu <Luo.Liu@cixtech.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: cix-kernel-upstream@cixtech.com,
	p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	Luo.Liu@cixtech.com,
	Wuyi.Shen@cixtech.com,
	EastLake.Yang@cixtech.com
Subject: [PATCH v5 0/3] phy: cix: Add Sky1 DisplayPort PHY
Date: Mon, 16 Nov 2026 15:37:57 +0800
Message-Id: <20261116073800.2396894-1-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|KUXPR06MB8081:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7ef98053-0c28-4709-f6f5-08df43b48bb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|82310400026|36860700016|42112799006|921020|10067099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/OT/ycR7iheps9POQ1A2v7Gy+NpL/sY4EP8vD7Th5k6i+m4nBSttmy/i0SJlfXQAu2zYVKAEsracsNBER+D+Pel+MgtjTLz4ZJURKeUP6sdBMfKFLyBk2px9UcMYGfR/w+IHQ8zaO7u1rZj5uYsXNGf6Rx+hqI1gRgSzfnMksFjIL5hVAv+57Yq0d5H9UvZYBFXG4FWunWQX2n7cnBQUjQ/EblySPNFVRbW9OGa5oGfkEvFlxD+QXeHblCQug+f2nYYueSE0VvyVoykOvji3klgWLM44yZTKQq4R/2U4cbUi3Arfts5/ILANaf3oebsI+jJ3N9+Sg5H/uNnXiraDLIqccOY37eu/oQNyFROXz5DF0YO7eFAFBaWLqjdf30vuYGwblhSWaLWaLUCSl7Cx4GX1XpVDIYJKRARTwlGjDl4F536RgjaFtrqtfyE7ItFwwrrraTCUMVZA8JhaLIrj3eaJkm24Z4JIqnVNeIQkdjUbcMAs1Skf9qWpW44dACytNd02ZGY2dbPwZcW+Yc+biCDzSQFvHhLzmglWGNspsuOox8YmtvhQQxtiLVIVEUoQpCGfEqVBk4rYgzx/WFybeDyW+Dna7W2caWqC2G75DcBs/uVEWMqGEQAblUZ0eJJZ3m9k7niFu+E0t9g3m6oJNYuApecsQOBGjCQnWGsV7mA1MblNf2fz9/JtY9G5TWHeWgV2U+7gmk/b3ssEQxtyGeQXIKoNtBY6r9kshDJEq5locKJh9kSBvZkJmm4QYLqa
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(82310400026)(36860700016)(42112799006)(921020)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Uznd5ReYZMraTSmc/ATsvFLHWQt4e29FSWPzOWEmzcsu2IzsWamIK7tdOTb4ge9+NjFQYrKTHE/PzsZBTBWcE9sFHZW9Jz8jUIAmmKuiOqsCbiag+Ayc8XSXbLHaF/pTYcHjawcqMOor9wqa/nOnMDfYkSpxjoblM9D6WDa6kEPdHn0sTVdIZZ6gkDDhrPG9VEt4Psmj/SXUHAyxDm9grdTieMobPGNmpeG9BqvykYq2WgH6i2xUTIGUr4Ic/pB7kDMklaChrnIpFTCMQ2nK9i8Uv5OpjQFHeKEa1odBCothgnr29g2IUOmuDKK2b2zq85Qp5Gl7Z7I4cPJnWfyYeurEaOk2WR35uAqIl9Sh4QY9nYT8tAUvfxvm/qU2c8ROtKzebnS5qxrwq59lfvQijguc7+1ft12ZUGSmabwp56yRH7yxKOCgVQh2/l3JJeTv
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 07:38:02.1459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef98053-0c28-4709-f6f5-08df43b48bb7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8081

Add the CIX Sky1 dedicated DisplayPort PHY: the binding, the driver,
and the Sky1 devicetree node.

Changes in v5:

The binding and the devicetree node are unchanged. The driver changes
address review comments:

- Drop .reset. phy_reset() pulses the block reset and does not rerun
  phy_init(), so the CDB and PMA programming stay cleared and a later
  configure or power-on can time out. phy_init() already pulses the
  reset before loading those registers. The DP controller pairs
  phy_init() and phy_exit().

- Rename is_edp to external_dp. The flag selects the higher swing
  table for an external connector. It is not Embedded DisplayPort.

- Call writel() directly. cix_dp_phy_write() only forwarded the write.

- Roll back a PLL enable that fails after the PLL reset is released.
  The original error is returned if the rollback itself fails.

- Drop the powered flag. A failed rate update left the PLL disabled
  while the flag stayed set. Every rate change now disables the PLL,
  programs the new dividers, and enables the PLL again.

Luo Liu (3):
  dt-bindings: phy: Add CIX Sky1 DP PHY
  phy: cix: Add Sky1 DP PHY driver
  arm64: dts: cix: Add Sky1 DP PHY node

 .../bindings/phy/cix,sky1-dp-phy.yaml         |  67 ++
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |   4 +
 arch/arm64/boot/dts/cix/sky1.dtsi             |  10 +
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/cix/Kconfig                       |  18 +
 drivers/phy/cix/Makefile                      |   2 +
 drivers/phy/cix/phy-cix-dp.c                  | 993 ++++++++++++++++++
 9 files changed, 1104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
 create mode 100644 drivers/phy/cix/Kconfig
 create mode 100644 drivers/phy/cix/Makefile
 create mode 100644 drivers/phy/cix/phy-cix-dp.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.25.1

