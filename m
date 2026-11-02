Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.79
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793607342;
	b=jaKhSwiTYXrl07WgN+3VakpE+bUKv1GgC7jurq6Z9ZTt8EXsqGzEyfEdnfHR3YQYyQZu
	 9j5rwiEXx2jchhi16jVkqd/b8M7i+s1lTx9JBhV5cTNI3siM/V+aSbyQygFwW1tt/tc7F
	 p5U2vSJG9lFjOAcH/IiHof6zk7m1j+Ee2JxiIWkIy2bfYAjXUN2RAQzB+jJdLf1B2PTO6
	 b1Xuji/HhH2AJ/r3vVG8XK79H4vDX0QuFIaJj2Mmb8RLwpumelUjjzx/iP4Hp8OONedY0
	 unbMGkZWosJGUFMpAyxnPVOgQVGt7zzsvExJ36JxHD/+HW8zYZtgyJPpclyBljeNs5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607342;
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
	b=ZoKD6qFFNKUUJJKvPQBPv2S31OqzAOZMVQCGg43Kq5SOdwf3+s+5O27O78mG3F3s2dG8
	 YvJQG3AgKl7hYwqNfnnmgpPsH7wwo4LLQEjH/Hx3lzR3DfQ1Jsw2zEfwgxaRtHWiMItsK
	 zn4GUXn6w9nHsholscsa4yXXhaQjrgvHZtlipzlVbjrEZpneB5RTs+QI76eO3gyVyM7rL
	 uDEkKXnYymINcZgmmCqugEUpkRFxUhpWjsVK2SdAeoGLazK/SihkSg4OQDiDBFIfc8V5X
	 TDXgYP4+Nas0lC37B+2e379ko0kkEqPP8zuASstGb1s9D7NkT8q4qSoL8Acx03af3Hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.79
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022079.outbound.protection.outlook.com [40.107.75.79])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D912E606A327;
	Mon,  2 Nov 2026 08:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D912E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEvilhrdFIRhhye0ayV5l/AumIsynlKA7BmVqLuKsfUrMuxWwDlIwiMFt7UfihA12cHHBwdLomM6K8xoYqrrERPb0qJfS7h4i8lv9BQraqeDwG6aRcA7Q745+0ai8iBHBFeAV7+h4/tj287d8RbubdVhVLrroufiq24Cd7768pTlqA9PhoF8den/HKhCFblkfx4kosXc5OSrsSGRJc6pJJXjCDHx26awZVdoKEu1q1ADi48zHRcdxuX57VlIKCSSx7IgpNDqJHLI3w+ocpVavgMBPMj8kPFsi1okkZxG3ewteo9FpF9A6Kg9RNkdGw2bUydWhRCDZM7VoU9gVY1A8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gl8z4GzzRnJVNB+iu5QzAHm7NL38k1NY0HbxTBUijyQ=;
 b=bvX87NiwiHBZfua6qSYFntTzUr3Duzc5eOVGVYpaBdLmxBkwcpmG8kXStio8720aFcaTEdJwVV9/EQM1fXU5P5M1+xRogPaIkBRL1EmxkJdrcydGOMBaC7obWQwXcKxPaWmrKq8ReDMLIjm5kN3QnyRr1jzofduwWJJVUzseYhDYhxJ9nMVsnPrJ4UmT1yffpIy0bYOFxrYvyx8SzwUR9HwthLQfc0u7u9NUiQvWrd1m1YsVSu1OaZNSp8UVdHn71YFHnXAZGD7o2kr5ekOYWj8V52aUJij/95EzeYLvD8TtvvyycAAulvONmLGUe7srS14js4kMgZl5RcfjMnEeEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUVP216CA0001.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16f::6)
 by JH0PR06MB7054.apcprd06.prod.outlook.com (2603:1096:990:68::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Mon, 2 Nov 2026
 08:15:35 +0000
Received: from TY2PEPF0000AB8A.apcprd03.prod.outlook.com
 (2603:1096:301:16f:cafe::90) by PUVP216CA0001.outlook.office365.com
 (2603:1096:301:16f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 08:15:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB8A.mail.protection.outlook.com (10.167.253.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 08:15:34 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AB19D4102B46;
	Mon,  2 Nov 2026 16:15:33 +0800 (CST)
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
Date: Mon,  2 Nov 2026 16:15:29 +0800
Message-ID: <20261102081532.2305142-1-gary.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB8A:EE_|JH0PR06MB7054:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6c9c6f6f-c532-4833-fdae-08df38b97864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|23010399003|6133799003|10067099003|18002099003|56012099006|261021121427099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	V7hP3z+idD5xR2ZmExLH8WX2q+iBUwMsorvRpoI2WNNYOsthE/JBhNVVSep23V/2usJR28oUkrRUYHsZ8oyevFNECWlQLj8s/bzkKNoEprfE1k7imamVxPXgl79kHACr3CAadsGBuOYfyEATIRw7zrRThjOKzZF+Sm908s1f4NqkMYXUY/gAot645g3skR0hujPe4m2Bb/IMFE51fuGgY6PuX75L6x9xZXYwKZrUNlaYvWnbFwqlyD0Qa8opcXwJ9AfiDJKQPIkW6jT0rliPMw7LhFyKdh4k5Ur1dxhsPA4+yM/9EhpwVICLjoDT6rNzV4ujQDd23krzA726EZnnFFoSg04Ocv9VwBwlSYcvCybYjdd0Pnqgz4za+0BYQVcmN0y+SvDPrG2if8NCWM4/DLiIiUh0oVtmygoo+6udnn9FrEbMqHyecnC4z0u8R0x9zSVyWP8Z38vzc7zhW4zg15IcdOuKxzpSo9i/BvPM3gdJkQDuK+9hHvuars40kqjp16C3EQdWVVtJ12L2mkB3GEHVvgdD9gW9E97whw4FbInuTWqTyP3w00Pm4t/HPzdRbXffaYf1MGwBdGLkyHxQ+9GN8MlNeGDq7xi7zhvz8yAaCShF1TKQo9O3xkxXJC6i2prbuQEDXZFt/4iUscQ9FRC7NRQnNYzSysp1mcI8oRe0ALUASO/UrgOcKbW/Zd1u+mJKm3f7KvvmLAy40kzNxw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(23010399003)(6133799003)(10067099003)(18002099003)(56012099006)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OC9xe6r1a7Sp6EXfWcQfFib6iCP5h2DniW3+x6iGlVq+9MC9Q45vFpL2nVHbD7k0HgtrhqSkRFD+j6nR5PnXWCThMUNegIesQ16jOdeW0AzaEJgnf4c3VxHt+WPRl/Xu3KrScin4b+sUGLQW/NypX4U3IhpWmy88sgrTDnp9sKEpgzKVPNLocsQKJzsgptYbc2wvejSdDbyR4nWGjOXyghQi92P3pWLnEY1g+mDmqzVorp4NXV2cqPi28R6MAiM3gI3cT6Kdun6xzKf+PJZIX66gjl1jXE/0L8jQVH4uvICd9Z5M5PrpfaA5VkTnQmSLNolmTeny9xHl1jUxiTjBoPwmiVCcp04YIa23IAszDeP3jTbF0lF02GR30B7B6GXJOXuKygsQQUTVgDX5EymPfSj3hv/8H1jxYLSNjnYvEQyJZWLTrK/YyR5bgOIWBGWs
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 08:15:34.5801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9c6f6f-c532-4833-fdae-08df38b97864
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB8A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7054

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

