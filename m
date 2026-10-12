Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022103.outbound.protection.outlook.com [52.101.126.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDFD449EB7;
	Mon, 12 Oct 2026 08:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792334; cv=fail; b=qivtI7CN04/PNOpWtw9cchxBCjK3gWiipR6qviKGj3JbGCtRu0CGN3y0xGiV6Pc9NBC7Jpz8BW2Xb01p0diGk9ovtbyDIVmgUBl1WhBKiAyh6slcbhXVRSoW/vuMLuz/928NGwo0AfrHx6MtJO+Hyxy5Ea1+h4rBGKwONaeLzaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792334; c=relaxed/simple;
	bh=JzdSHWEyBNd5CIkEUBmcbvyyN58ttV4u7lcIAA+wAFE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=qoNXl2MPc6rQanL8lWljG+GQTUyX9PI2RoK13NEeIZ6wZMPD+1SKJ6uL2FiTow8I1VEjWaVGpkUkxPSIuNJxS03VyvSbEhXl9Vx+QeC/rIuXYc6kDyY0DZPNP7ZQTZ3purcJzjtxZePTk+vqfn1vFZTlqOh73gTwyXHhsbe9Mdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeQCzJMTNqumn98i2675edsL3/DBEn2XpqVTP82y4KD8TQHlQPDQ5KyT1SlwLUpFSH9MC9azWuqG77jr8mTv0qW2ZEuA3dYPjSQIkR5xtd0FEz44Yja6bpwef/quNCsjlG4stcGEs9h7C2EeUVGnChibKJGupMaGazPhRzo9FUSPsseFJJCW6DqQwI0qVdErFpe6e98U/A7NrOdUvM1+SfNpdKJ3lwbAWE7Fi4YiWye90i7TpHTcnHjxK3VRQn0Ydi8cMypBNY4HyB5PaQaB5HxSxYdyfJk6A9NuQr3+4SY0ge5wxB+CqpUDlkJ6twXkJ7ZaYXyXWQA6TJP+f0Vgxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNv/zv/gnmpZZYitFI2dcXIM1uk7+3L0tgFc7nNLcAU=;
 b=xGh7caBb+KRlesXKLRo7F0PzA2VZhMcKPQ3/ITzHqF/ORLCmAa/fcTYoCCPrrJekZ9K2Pe2LCPerQuUMOX8ncLkfEyExzhijMCgZgXocVrl/etHGCbckMwPg5BMA/R1f8pIrPfX/hoYxkLMFzrsrbm91wCOpuh4KvLA2P+4bXog8tGJ7zQRFeFvZyufTGZ7Cs5HV/ddScfxEf2Nv1qOmfOdITD9palx1maLcEAWJw0j03l0RU9Elu1j8M8x/PQZ3R7xLDE0Iw7i3CRzE/6MD31uhQNmUZsu+DPVM8UbGmMQBp+RaJ6W97xRgtqX400z9NQf0QGxlgv6Qn6MW1gViqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0015.apcprd02.prod.outlook.com (2603:1096:4:194::16)
 by OSNPR06MB8418.apcprd06.prod.outlook.com (2603:1096:604:487::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.19; Mon, 12 Oct
 2026 08:05:28 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:194:cafe::a5) by SI2PR02CA0015.outlook.office365.com
 (2603:1096:4:194::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 08:05:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 08:05:26 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 12EBC427E3A2;
	Mon, 12 Oct 2026 16:05:18 +0800 (CST)
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
Subject: [PATCH 0/3] phy: cix: Add Sky1 DisplayPort PHY support
Date: Mon, 12 Oct 2026 16:05:14 +0800
Message-Id: <20261012080517.566920-1-Luo.Liu@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|OSNPR06MB8418:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 20b06dde-deee-4a86-4c04-08df283792fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|42112799006|23010399003|7416014|36860700016|1800799024|376014|6133799003|10067099003|18002099003|921020|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	XaKHlwWiYCmgjFxxa2GaP9z51LMVUYJKNOWCTYg7H2Wv9dUA5uzfNyt1Y5ORC+ogtNKbiLtm+lGKyfhv3Xn2TBh54YwD9YhD64FJ9zY9gjxoeWRC3NnZQPzr9nHx0IBQpj3tFD1fF3/+lqaJcdvW8BwkJRYEMuqX55SOaMEa21SxTjXjJFv96v4bYntvgvt3eKNlA+7+n1qIupZCh95kZFrtKjlKmGfYRf6oZjrq5aDm2BC87yLzk23jPrJaRrwO2SlqRioGQ7PqTZzjp1zod7hK8IjuqSLKaQjzM6eExhSplkVIqCPfPfxkA0RGHrlQlwJasrrk2N7BJIJeLlLZQG9uLgXYN+hnmfpfTb+dYvrWxdEJO0WlBFUM1SpDCsA+8MpQSonZYiaRE6fpacW9IAtWMRR/w7f7pDHOYkd5rkSq64M4WqlRR8T+MtQjDnT4aIAyhjwMfsMdGHiAodAHW4FeiKF/9rtOCeORwPLhadO1qhuB8hoSCw4H1C/FvgMLlRE2+lsJ9pgg8egE8zDwV+VeLa1T7yanq6iUKdf5QOdjtrx0DA7izEx3ql45/DkCCcD1AqFj1LaQ8fTt8dWx4tq+J+FYJUFDA4UH5b8LPU9XhJbSVplfzaVXU2NWsHWZYDzEAJzNMiiHsJmlC6P86JKWO6TW0XRTYmt7T2RrDmKFvMkqnXG/2z4VqPvmTswDRtUIUM7sVUob0VhmddNPw0BvpdMUwGld+0HPQxQriBTzWr2LVh1WAip6tJCWMosK
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(42112799006)(23010399003)(7416014)(36860700016)(1800799024)(376014)(6133799003)(10067099003)(18002099003)(921020)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IffG4yKGdd5VGNUSYfRCNBouiYWqPfOY8zVPXlehuz5De/fxA/eY1BP7PCOyo0ZptbJntxTqoDjLDeptoQHIeyMoX48hDdPNN9OeyvZ/DGAs2l31HOHCtDP8Lx7yD1iRU+GG1SGC8k1koLfgTuZ631IU4waRuYMCb99He/oqcPCdH/jW76F6kPthGVHKXvQIhrAhjKoVJ7eI81bnqW6n8AnmACeEN6K5zN6XRiTKUrbHH9R1m9d2Yzk2jfMCAqMq7rL60YxtVEcUMQFX0hYcGsnMw37wv5bxaBnZtOE5Lf+qpeJDjTerKb8dTUBb5CiWfdqY6ZXb7fKCYEKmYHZOLjB9Ihp4225c3Cz2r7ZW9QEP0Mus78Wvrps4rwnfBA91GbpI1yhTHzr9RcRySg2+CFBu0ntp+5TTDYtPDE6OgzJQOLGotS/Vd+5nv7t6uXdG
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 08:05:26.2390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b06dde-deee-4a86-4c04-08df283792fe
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8418

Add dt-bindings, driver and DTS support for the dedicated DisplayPort
PHY on the CIX Sky1 SoC.

The PHY exposes a PMA/CDB register interface and is controlled through
the generic PHY DP configure ops (link rate, lane count, SSC and
voltage swing).

Patch 1 adds the binding and MAINTAINERS entry.
Patch 2 adds the PHY driver.
Patch 3 describes the SoC node and enables it on Radxa Orion O6.

Luo Liu (3):
  dt-bindings: phy: Add CIX Sky1 DP PHY
  phy: cix: Add Sky1 DP PHY driver
  arm64: dts: cix: Add Sky1 DP PHY node

 .../bindings/phy/cix,sky1-dp-phy.yaml         |  53 +
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |   4 +
 arch/arm64/boot/dts/cix/sky1.dtsi             |   8 +
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/cix/Kconfig                       |  18 +
 drivers/phy/cix/Makefile                      |   2 +
 drivers/phy/cix/phy-cix-dp.c                  | 969 ++++++++++++++++++
 9 files changed, 1064 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
 create mode 100644 drivers/phy/cix/Kconfig
 create mode 100644 drivers/phy/cix/Makefile
 create mode 100644 drivers/phy/cix/phy-cix-dp.c


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.25.1

