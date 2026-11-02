Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.126.83
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793588672;
	b=hPixMqikACjVULdzexx3mdopHGYLw/Mzc+cayM/3IoZel9xXWJYBXxfPGF/X1nvUur9F
	 a4SKZPatYugA6jx2qSqAOE7ILw27OQQ5gthVCZ9gjM4fbDuJNemCDP/pfvRpz9+w0YA9g
	 tcQh1vzKqx7QIzu0HRQM9U1Im+SG5IoQjUhC162C+iY49nhn1OFApGgRbKu7RZ+HhB3VP
	 WJ24XkuVP7Gpw0UY4T+fYqXtNgR1KV3gH6dfBesbylKuvThRNazGOt47ZaLU6LGdkWoyV
	 uln4WfD98ltpwLpSp+KBekpsYN13Mpwot8VZqZJ4NdgWpLEW9RNSf2tjzaPlIoGHVxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793588672;
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
	bh=Kybe0YYJOE5rF/u6tYyCnCVmCpSZR1B7KWBQX5J8Q9s=;
	b=Gxme5UwgDLOv7nbRrGVEysPLiTU7oqfY0BpxZrEc0JbeS0CkJnPa9AedH9mckr5KNhi4
	 KU+R6p/y8uYvQefO/L6SDOAplzUxeHwr4iRHOoCAUfeRbjno8Kn8D3GUC2Gr0Q/pAtdjS
	 z2IpsA9CPY/Amnv9m9Mf0P/b3kdrXD9P2ay+B5HpNVWMx/rcI6T/3R7ToqLoK6RoKPsMK
	 vEAN1sS0U2I8SoTnf7njuLuZfxHBfhCkykUrWugotFGIetQhMQT5UZq7YKuEhoneGYJk7
	 KOU7j1dxi0cMGIWpiOomY4kIKTQFKwAlw+IccrD0yIvcxpkAoV1WUHK0WegQR2NCtcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=fail smtp.remote-ip=52.101.126.83
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022083.outbound.protection.outlook.com [52.101.126.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B231B606A326;
	Mon,  2 Nov 2026 03:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B231B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h24bck+Z35p2Tww6qmsVzPQ/LiWSNVP4qwfc0y2jO3Ll1sRicHocfga2v3M00I1kDleRvOJRyUG4uKyToZKiKjZmf06cbt3U2iGQpFQWR1pUfdfTJO9smnU1S71buY327fnbRbesL1IbMx+bFRqG4efP8LfgPYTVjcHLhIOYJZ81flavA0hYCv2AUTysEpHKqdqbbFsMNH0qbMQPeuDz52oXTJYiaOc5BDDPkZEhwoSdtYugpsD6jE2Cr/NZYiCML0hXkU/jUitBc94C3n6Qo3rjZWKWp2AKeQYqaUs+AhCYEz9bWdhB/Fxxs+lq3LGela16BKNbdwQ0man+mmBntA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kybe0YYJOE5rF/u6tYyCnCVmCpSZR1B7KWBQX5J8Q9s=;
 b=hlfDij0G3nlbw3aVEMWabJYWjYKG6zBW6mTPzl02ZNkSi2PeSzZUu96clUVupA1ay0xq2YvdNefxJYw0s1Ctc9n//zwrkF6iBU5dCuk7IVeolYwLkJ2KphD/ZCl4C3JCjcLiG3N3TrONUsZzCsnDejOAXp/JaUTkz/5N9aMce14H2n7zy8sIZwbY3S6ETYs1pPScGv5DMJQyXANZWc2ERtvld1tVDwrFlYxueEvNKSTr/pwS0ez395LzhRchLXOuAUphvAUyw0G9lC/6iPV3zh90juWRYEsU9e/gEtLF8metEX/1S0nLBt2avuWrvEoAMvicnICYOhJj41+ctVuC0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0064.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:31a::11)
 by TY0PR06MB6802.apcprd06.prod.outlook.com (2603:1096:405:11::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Mon, 2 Nov 2026
 03:04:27 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:400:31a:cafe::69) by TYCP286CA0064.outlook.office365.com
 (2603:1096:400:31a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 03:04:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 03:04:26 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A3AA34102B47;
	Mon,  2 Nov 2026 11:04:25 +0800 (CST)
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
Subject: [PATCH v4 0/3] phy: cix: Add Sky1 DisplayPort PHY support
Date: Mon,  2 Nov 2026 11:04:22 +0800
Message-Id: <20261102030425.1957585-1-Luo.Liu@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|TY0PR06MB6802:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bc421a90-c38e-4c2c-c391-08df388e014f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|36860700016|82310400026|42112799006|921020|56012099006|261009223027099003|261028144727099003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	283JV1R1/2PzXAzInHyT5j65YoJSd3eFpgHXnolMyOlx/iih0PHPADehXpT8PnzZRX4gw7OR9HD6//Otr7t2uL8zFq5+uHrPmQLYrQOgu55JHBk54ffap4+/q73ZqUDL9VonqpdKxdXUusMXjpuRILCyW8LV1cpoZiIwCX37ZCHn07Pim6yXFxJJq5XzoZZJmjruPbBgdQXGxtJ0wF/LBdmm+IHO/cVG4BFhSvpATvG7HLkwB/LG6lNZfDY4YLpjqMh4rt7GhA9Ju1mT3rqm+tNs9B3hfKifSGYohf/kU/qndtMoBGCGbe9bk3KdRfcgH0Bne30SL02HKkXOSbuxgRT4+XzSqoV3ovp4+AAZ/sQncMkZp4/uAZNdLEcgIBpADZ6mTd+Z7Eg52lWNuZfMyT/4La1HAbTFyMMXFXIFM4TopoVHGsUkIHkL9elC7IJtqTgHMuGOaWKKg7qgpdMHvPTJEFNMBvcufitrGrdnE8Ej708SMmgENeKGDM4k50/2gZlW1C0jxY7dSzCE67t8w/BSG+pSzc032sEzUIQOIL0JoMmqej2IZujfoOWvrJlPoHtoDMjCO3TOJ68wMRO0UQLvyaY2wSyWRis5f6JyQi7jQJXyn2AL2PB4Z9gXfWK27YAQaRyJQDeD2hETkitp6DCM/3VYYM+MaCzpnuk7NXa/sWuAxkuikZ0zbZgVO8O2QkMQfJDv+CNDp09xk/gLnVOFR2HN1ms+Dx5MlUj+lAZuRY/7l38/lNjwuWsFkC7P
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(36860700016)(82310400026)(42112799006)(921020)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	99I50TzMExAhPJhebru0eq94cWbAxzfaSnRJZZ37RSSir0shpEReRYBPhj9/jJuljPXAtOHx1Dv8F2re7xozYI1eYDCIIMR8Mj0x2yY4Nm1N5cCCNELlHg2fP6tGU+THvHN9h0RLWpOzBVJs6k8HE9CVw1GIlQBbMFQ1PZ4pohLuVR/LZFfzjZ89i/jdmW55gFYrjdbwuXEi8K/6TBDQfJxCQ6Rvg5woqxAHf5Wl5UorBFAnP+x4+W5JZFNCjgcLjuJ6nxyRb1O6/1ONN3hvMazGGTiBny9fruhdOLz8rhQiZ333uEKvvcHkbypQnBSUgFP9fwXORPdIpc06AQa5w40VhEciNKKeNJnLDPznSKsaWSfEeC3XCiOi2oyHb/4DFr8Gqovd50Ms8Rz4xQh1QGHbPwQt+xeveB9KOZxL+u6v/RTNNA06J8U/phdflckr
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 03:04:26.5990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc421a90-c38e-4c2c-c391-08df388e014f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB6802

Add dt-bindings, driver and DTS support for the dedicated DisplayPort
PHY on the CIX Sky1 SoC.

The PHY exposes a PMA/CDB register interface and is controlled through
the generic PHY DP configure ops (link rate, lane count, SSC and
voltage swing). The APB clock is shared with the DPTx controller; the
PHY driver enables it around init/exit together with the hardware
reset.

Patch 1 adds the binding and MAINTAINERS entry.
Patch 2 adds the PHY driver.
Patch 3 describes the SoC node and enables it on Radxa Orion O6.

Changes in v4:
- Keep cix,external-dp for the external connector swing table
- Require clocks/clock-names ("apb"); wire CLK_TREE_DPC2_APBCLK
- Enable and disable the shared APB clock in phy_init/phy_exit
- Update copyright years to 2026
- Move bool members to the end of struct cix_dp
- Move the lane-count and timeout macros out of the register block
- Add CIX_DP_CDB_ENABLE_BIT instead of writing 1
- Drop the power_on/power_off dp->powered check; the PHY core already
  refcounts those calls. The flag remains so link-rate updates know
  whether the PLL is running
- Pick up Reviewed-by from Rob Herring

Changes in v3:
- Rename cix,external-dp to cix,edp (select eDP vs DP swing table)
- Restore TX_DIAG_ACYA on cix_dp_phy_set_lane_voltage() error paths
- Note that the PHY APB clock is managed by the DPTx driver

Changes in v2:
- Move MAINTAINERS into the binding patch; keep tabs; add R: entry
- Require resets; use exclusive reset in the driver
- Include linux/property.h; document Sky1 1/2-lane physical routing
- Rename DT label to dp_phy; enable it on sky1-orion-o6
- After CDB_ENABLE, wait for busy then idle to avoid a stale READY race

Luo Liu (3):
  dt-bindings: phy: Add CIX Sky1 DP PHY
  phy: cix: Add Sky1 DP PHY driver
  arm64: dts: cix: Add Sky1 DP PHY node

 .../bindings/phy/cix,sky1-dp-phy.yaml         |   67 ++
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |    4 +
 arch/arm64/boot/dts/cix/sky1.dtsi             |   10 +
 drivers/phy/Kconfig                           |    1 +
 drivers/phy/Makefile                          |    1 +
 drivers/phy/cix/Kconfig                       |   18 +
 drivers/phy/cix/Makefile                      |    2 +
 drivers/phy/cix/phy-cix-dp.c                  | 1004 +++++++++++++++++
 9 files changed, 1115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
 create mode 100644 drivers/phy/cix/Kconfig
 create mode 100644 drivers/phy/cix/Makefile
 create mode 100644 drivers/phy/cix/phy-cix-dp.c


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.25.1
