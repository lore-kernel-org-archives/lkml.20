Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023130.outbound.protection.outlook.com [40.107.44.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F5D33509B;
	Tue, 13 Oct 2026 09:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885549; cv=fail; b=Mavh/MIxspS7MhUMFERIN0HogtkE+Tp4D/kKAZIOeznRmgUwvxUxtMr61RsFHT3SQ/8mQhvY4fkr+Ji7dqJzPSejwr3xuEx4nPVTa7HH0GhfrkzRvVXoUiDG8dv5+U7zi1B/xW3E7K217KdWpluiPEkoaSA2QEcnp1jSWudBzEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885549; c=relaxed/simple;
	bh=De11/Nf9xL6vi81WVVE+QlKtjsFBoxuQObLYP7tDDlY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=fhJs/VRwjpt5EecQpQdDtCnQYUvNpE+6Dj3Teht6RHxNog3/jd06D7M4kG9yfrF+pn5lAIt5S+CFCnZ5v1UvPmYsx/ArNOZPR3DiL5Qspf1JMtPYfTs0xaygu7TGNVMx1RvJH2kAk6WbBwDzjlRj2FxTN0SMGxwMfhIhFMD0sqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQ7MCVbnl+UNdxiTMD5KX9HA2wf+i2HQ6VI6BbLG1jgDHPLnQoYdEjAb6AiOVtnrIZ9y+MiZWurF0Ncsuqo8msGLC/bbJlWOQr8F6948qWvmbrYz7g+NPqigUbbpEm/Uwe2Uv1uubo4JsaJxxh/QJL5cviJAW8MFAVEVGaEGW2a/H82icLMKGKxaJ28yVw7ugrJjI3sIhv5UmWWnbpxXFQ8kXH6VCWmNwdhtS83pqbIA5NCAm7LYzLwnnxnl+HkCFyo04y8qpZcnsOoGKTBAUrmi1BDkxnWwCdFGK4Pdu8U5hQJOwge4obuWuiMtcBnAU9mYuXmMm2SAULMTyYy4Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCoTrva/1Q+fu+ehvfArlfDIAEVYTAcpiC5aotbR82M=;
 b=Z2BlrBqNPLG9lalIjR1SKZY7vMaCCcLqm9jyi7mhcf3/rXm8Hqt3FMVpVdutdPCrlgjzF644VoTI/WITyA9i1wka4nI7xC+2AP846/OZGDVa4cp0SugGpPlgvSK2rD5A6tnMqv3CtYh8oJqLFvrsxnlki3YIgKzJFrxB875RXIFvmgcKG8WpbaqkBA28+p7xTyxD+hq3TfPm7O10/h7OygrFrg1terTqoIFdN9ATOB1HBVyaCmQf1yW7sf413iao+bVH7SEqCWISEUoswyxz5MOMjV7aiGdy/Qt9JCu7JpcmcewD7FbqVyfS14O4fqYxZh4mBXdaV3Y8TkC84iR63g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0046.apcprd02.prod.outlook.com (2603:1096:4:1f5::14)
 by OSNPR06MB9147.apcprd06.prod.outlook.com (2603:1096:604:483::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Tue, 13 Oct
 2026 09:59:04 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:4:1f5:cafe::50) by SI1PR02CA0046.outlook.office365.com
 (2603:1096:4:1f5::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 09:59:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 09:59:02 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E32DC40920F6;
	Tue, 13 Oct 2026 17:59:00 +0800 (CST)
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
Subject: [PATCH v3 0/3] phy: cix: Add Sky1 DisplayPort PHY support
Date: Tue, 13 Oct 2026 17:58:57 +0800
Message-Id: <20261013095900.758464-1-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|OSNPR06MB9147:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e0ea677c-a3f7-4ce5-76e1-08df29109c8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|42112799006|82310400026|36860700016|376014|7416014|1800799024|6133799003|18002099003|10067099003|921020|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	gyhDhW1l3k8Iw3dlpgSlAjgjZIWX4rtzprXFJqT3DwnNQu7AEGtMsRfOnLixCgqdpQuAsBdPG4vl7zNAgzmAOLuep5qxfV3fp9a/WHKjnSYd8OUUpXPMvZUMQ3dcXRUmPDMswt6gXOdLfdnWWO2nYm7SuktEAzGK1bNtYXN7YMc756+ME6fe4lBPAbX7ZNO4Q6SeJTtiyqvHIvgHQT2et44VPvOmv70KvtlDW+WuU5L5NOyPADWC8b9wFizuEUKsuXmXQV3ozfpfAvAB+94U85kAiA/F7mHwbqSrMaLl6P1D6rkjFRHIbSH4q6Q8slp7WhoxbT/gGN2omMaL9yC+gdPiJ1A6T/Autpgm1FoBItpgTJxDOAzwd+AHEgwziuGkjg9FFsuBy8xQA3N8HPjSMYWT6cmlUSIJKcQwlgpHCx/vUmVmkviwNsp+lxVyTBJYc3yN+biZYyPMfMd7eKAEzROYVbrt3ZQRxNOlDPOka31RmVVWinU816j//f5LTLN378fR9DhyxOXBT8jDAg4yLucK1/Z0N9KU5Wmst9ZhPLrQehPu6KdvbLCzUNDogjTOp5tmIIs0xwAvso2LoXA32+x9V1sM35hNWcD0jns8vZIbB0fB0dtl2w43HDYvHcwoNwLD7CVHrynjNcE2SDhYgYW98qvZ/9yzWlzX4i4RkG31+bfozBrnbqdywZzFYvW4dZLebP+s56vfODrpS/DZSRcQD9vb/AGdcnS/H51S/YcD4Q8w61sJSWZ2YB3B9CoQ
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(42112799006)(82310400026)(36860700016)(376014)(7416014)(1800799024)(6133799003)(18002099003)(10067099003)(921020)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I5Fp/J2Rz8B2ohsXCAn9E1R2/qphNTlu5Hh4jIeYV8mW5X+FP8sVrJUBcqsCEsbxr+1CHhKxLVJaqOHV2sNWuyIID8VoNKOdgXeZ/lf2UvnPWA0fe4CLs12mnCX2u+rudyEnb21Ai4vggd3gjsyeI9Rk59NRKUQ5FymBEU6Wu38LVrGDweEKhQCQjZSDgNuxZ0biTjiUFqxtRIa6TCNop2xQlkBwP9OZ3WuGAbF17pgu8lDy/5WkpdNtW200N7SvGrRL4ZJy5LhdIPwrLH6rVTKkKzTJ/yRBMvNdNTBYa3N88Tddp3Kex554oxu9QJc5O/WIflpHTIioNvxKpzPFM1ySTQvY+0qlrB47Q3EMuRcTH8hiVpz5UXNZByjR4oHAHhWrncvUZTLzcm15VXuSAE1gYCo2HV+74qLyrLOAUz/vC867ILq7o/hDJ1Vue04v
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 09:59:02.9993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ea677c-a3f7-4ce5-76e1-08df29109c8c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB9147

Add dt-bindings, driver and DTS support for the dedicated DisplayPort
PHY on the CIX Sky1 SoC.

The PHY exposes a PMA/CDB register interface and is controlled through
the generic PHY DP configure ops (link rate, lane count, SSC and
voltage swing).

Patch 1 adds the binding and MAINTAINERS entry.
Patch 2 adds the PHY driver.
Patch 3 describes the SoC node and enables it on Radxa Orion O6.

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

 .../bindings/phy/cix,sky1-dp-phy.yaml         |  56 +
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |   4 +
 arch/arm64/boot/dts/cix/sky1.dtsi             |   8 +
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/cix/Kconfig                       |  18 +
 drivers/phy/cix/Makefile                      |   2 +
 drivers/phy/cix/phy-cix-dp.c                  | 987 ++++++++++++++++++
 9 files changed, 1085 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
 create mode 100644 drivers/phy/cix/Kconfig
 create mode 100644 drivers/phy/cix/Makefile
 create mode 100644 drivers/phy/cix/phy-cix-dp.c


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.25.1

