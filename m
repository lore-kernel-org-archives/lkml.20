Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022099.outbound.protection.outlook.com [40.107.75.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8706533345A;
	Wed,  2 Sep 2026 03:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319307; cv=fail; b=OyyiDPX8LJy8b/AjtU7EyUg7OVM9gynK3pZjHsj9UOhprgZ7n6qCA/6oUzCijEIJ9VCZTv0zaB3J5lu9pjMsoILBnMgCe6+S5Ao5Ax6/vRU9dPaUERGE1INqTsV3VCmdJIMdVaB2lYRb1vXruqkW4tYrA/nCHcX1uxK1N4ItvdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319307; c=relaxed/simple;
	bh=sDHicowtaZ4EZhUHfZ77o0gB/0c3tHifT8WqQxkU/YU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IwoMYxA86ceh4yR/h5IdK75/p/ceHS80ECHqamT8oUMbMcktCK91Fvh7ScPs770SEHrz2A4CcHqYNNlJXC6tRJMvf/Nx/Yz4RsHZhbJ0WWQEQIXvlziUwVvc9OfmBTbiHxJCefStkLvGWlHGloZ28m46wEtZLs/GRaqHFbeRCO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYBfg11FfZue+bwM3HqaA3yKc92K4uJ8aey6wgMxpMVf2wyk288fQO2gY3yyTn7h1kF/9hwMrQ9IB7ZpPgJe8+elU+81QgBVMkEHSbaR3yL+ptsic8NWhVC+bhjoGKxT9U50OvARW3erpjWmXlxmPTDN2Xr1JR3Ta47DUIFG3a1pLM0xyuCZxaTlN7h4EOe1Ok2+mlo99GJ7lxVk+FAxqIY8sIY0O5jZEdiz5udB38NAa7KccHh9aIR5MbJgE2TyQkSNwHt3hXn67Fe9p4042pYj6xA85TY295tucBHs3NBxx5JOWTcop+p3Ez3TVrAt2xBzhW6hDRuDmrZ6ExQYTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3knZx1yJjnpE4OgY/GU1NEEfEZb8tIiouEXJASJeJc=;
 b=JVHNZDuC/RsG7TRnp/SpT8dQKoJKYMPiLBsqsjCSCdhRgxNB6Ey0R8SWIuJQ/Wxo3qocah9UPX8WarDW6DtO1iBCAFODDzcwfZwUKdv4V0veIskXl24Kw3ffcgBMYUQaFVpEbb4/fl4MKXmOzrDBErUgiruJy4Z8corgUAH+PLxSG5Vs8NWixQT3koV/LL1s668HFIIj1fatmYXY8/W0eNSw+FiMDzgTyY8yu3+qNqKfKKykdPFH808gvULha3lejQj52ASgVlF0PPX3mB30BnotBbl0tJWTbkrYdXAM/Lw1fYg7xt7A+A3vw/UA0OpCEfxGIGa6oFPY1NY60WZYpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from KL1P15301CA0063.APCP153.PROD.OUTLOOK.COM (2603:1096:820:3d::21)
 by TYSPR06MB7343.apcprd06.prod.outlook.com (2603:1096:405:9a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 03:21:37 +0000
Received: from SG2PEPF000B66CA.apcprd03.prod.outlook.com
 (2603:1096:820:3d:cafe::a9) by KL1P15301CA0063.outlook.office365.com
 (2603:1096:820:3d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.3 via Frontend Transport; Wed, 2
 Sep 2026 03:21:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CA.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 03:21:36 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id EE63940920E1;
	Wed,  2 Sep 2026 11:21:34 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: peter.chen@kernel.org,
	pawell@cadence.com,
	vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: gregkh@linuxfoundation.org,
	rogerq@kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	fugang.duan@cixtech.com,
	cix-kernel-upstream@cixtech.com,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hongliang Yang <hongliang.yang@cixtech.com>
Subject: [PATCH v2 0/5] Add CIX Sky1 USB3/USBSSP support
Date: Wed,  2 Sep 2026 11:21:29 +0800
Message-ID: <20260902032134.1182634-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
References: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CA:EE_|TYSPR06MB7343:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 90769942-55e5-4207-7bf0-08df08a14bb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|82310400026|36860700016|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	m88skxFrsRobGtojX0Cz6GWNET8Gg52qAm/7vWVAkaK5zpsvad7bCxRGbQCPU0sbfr2tjNxT+rwwJGmYPwhdPU7hxTgQEMnAPZZhColnV6BXoxwR1STVs8tjgRlh9BU/4EqeMl2m3YBsvVu94aOBm3pRf7qaKFHqzTE5qRF+f4/y0ASAH2GFHxCcPr+nBi6ibN2302OFfQ+FCJKv0/5aHBYjE25FoMMwCxYlb+OUZTFAQnYLGsAEpBfovbeDHJk2/Ih1aGoAvo6yKyP833nM7LWNKCYnEhI9X1/0K6GunmgsHkr4Y3X5ReX+Bbhhd/sGOBAFKJwa/uCjZMpxnPak6ljZ88TTNRgpu0+PSclBH3taWJPQx07LP8uibFjvUmZLlzePCdGlJAL6mwUe5bQhqAyBW6VO9YyWlXI2pgiu7Hhe5/aOnqTuF7z0m/29aqLl0lS8tabb5T8gZLba/CGybORFAPm2c8zoXjOVBkgDLd9UCpJN8L0obMXyiR2HjPI7miSmNncCpqk76/vP8jrjl1Dhu9ARqG/9XpNDit8dkW2V5d48Lo2t9NsOLOOXOvo1lHNS2oijTjgQSCis/zmITkcCC7gToNrOzeRStv45ig51JrS4zx0s9CPCu40gP1nAcK9Z2PP5fA+a16p2sir2y/Ky4uKG+uzC/58DQ3JRAqjjNmlkfwfPKebig5/oPGv6ys8LMsYZ/TzD0I2Bzz25Bw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(82310400026)(36860700016)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pEBf0ccd83lBxLdF6mAo4H0ouodrrlXn5GUVgg3ZeQGuM32b9/6l3WG9HtD2DM5vhYuOfQAnfCswZrbW4dbaJ0fBCzUSX0f7tH1SLW0/MFrCKBJZUFGKa+/JNc8nNSqCzWu/FV/guP/sbmVBJf8dqePI3T0aAOR0yN+FFcHUmkjFIOYkAMWWEKKguopTjzw+bGM4pVepTqjayLBC3VnEQ789aFmEfA/XSKzGGMJ3ZJyRfBJEBNOyCGDPmUiFAfl1kMsoSYm4QkHu3WaerNPNTeTfcRjuccO+8tKfnI89u4eLoiPw8Tzhg9MY8fp5RpHkMC3qvZ9D+Lf9ItGfPHv9WvcOqv5xGUpGVv/ruapU0jPagT/GXvroKBNBT7cABdMkiYmpkYsC7dkaB5eK7fepoST3bVWaCM/IiCg/N3D5DFwWmQGc/yhrLqIJUrD2/7+J
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 03:21:36.0911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90769942-55e5-4207-7bf0-08df08a14bb4
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CA.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7343

Add USB3 PHY binding and driver, Cadence USBSSP glue binding and
driver, and USB4/USB5 device tree nodes for the CIX Sky1 SoC.

This series adds support for the USB4 and USB5 controllers (based on
Cadence USBSSP DRD) found on the CIX Sky1 SoC, along with their
associated multi-port USB3 PHY.

Changes in v2:
- Split the dt-bindings patch into separate PHY and USBSSP binding
  patches with proper subsystem subject prefixes.
- Follow the DTS coding style in the bindings and DTS (property
  ordering, no redundant unit-address suffixes in examples); examples
  pass dt-check-style in strict mode.
- Drop the redundant "_clk" suffix and "reset"/"usb" prefixes from
  clock-names and reset-names ("apb_clk" -> "apb", "ref_clk" ->
  "ref", "reset"/"preset" -> "core"/"apb", "usb_preset"/"usb_reset"
  -> "apb"/"core", "sof_clk"/"usb_aclk"/"lpm_clk"/"usb_pclk" ->
  "sof"/"axi"/"lpm"/"apb").
- Rename reg-names "axi_property"/"controller_status" to
  "axi"/"controller".
- Rename the Cadence core child nodes from usb-controller@ to the
  conventional usb@ node name.
- Drop the cix,axi-bmax-value, sof_clk_freq and lpm_clk_freq
  properties. These are fixed per SoC and are now hardcoded in the
  glue driver.
- Rename cix,usb_syscon -> cix,usb-syscon to follow devicetree
  property naming conventions.
- Use additionalProperties: false instead of
  unevaluatedProperties: false in the PHY binding (no other schema
  is referenced).
- Fix unit addresses in the binding example and DTS nodes to match
  the first reg address (usb@91c0314, usb@91c0324).
- Enable the usb4/usb5 wrapper nodes, usb3_phy4 PHY and its ports in
  the Orion O6 board file so the controllers can probe.
- Add reg properties to the usb-port@0/usb-port@1 child nodes.
- Fix the reg-names order of the cdns,usb3 child nodes to
  "otg", "xhci", "dev" as required by the binding schema.
- Use devm_reset_control_get_exclusive() instead of the deprecated
  devm_reset_control_get() in the USB3 PHY and glue drivers.
- Propagate error codes from the PHY driver probe paths instead of
  returning 0 unconditionally.
- Use device_for_each_child_node_scoped() to drop the manual
  of_node_put() and fix the double-put/uninitialized access on the
  probe error path.
- Remove the phy_create_lookup() entries which leaked on unbind and
  were unused (consumers reference the PHY via the DT "phys"
  phandle).
- Assert (not deassert) the hardware resets on the sky1_u3phy_init()
  error path.
- Add MODULE_DEVICE_TABLE(of, ...) for automatic module loading.

Hongliang Yang (5):
  dt-bindings: phy: Add CIX Sky1 USB3 PHY
  dt-bindings: usb: Add CIX Sky1 USBSSP controller
  phy: cix: Add CIX Sky1 USB3 PHY driver
  usb: cdns3: Add CIX Sky1 glue driver
  arm64: dts: cix: Add USB4/USB5 nodes for Sky1

 .../bindings/phy/cix,sky1-usb3-phy.yaml       | 107 +++
 .../bindings/usb/cix,sky1-usbssp.yaml         | 137 ++++
 MAINTAINERS                                   |   3 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  50 ++
 arch/arm64/boot/dts/cix/sky1.dtsi             | 125 ++++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/cix/Kconfig                       |  20 +
 drivers/phy/cix/Makefile                      |   6 +
 drivers/phy/cix/phy-cix-usb3.c                | 407 +++++++++++
 drivers/phy/cix/phy-cix-usbdp.h               | 310 ++++++++
 drivers/usb/cdns3/Kconfig                     |  13 +
 drivers/usb/cdns3/Makefile                    |   1 +
 drivers/usb/cdns3/cdnsp-sky1.c                | 673 ++++++++++++++++++
 drivers/usb/cdns3/cdnsp-sky1.h                | 127 ++++
 15 files changed, 1981 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
 create mode 100644 drivers/phy/cix/Kconfig
 create mode 100644 drivers/phy/cix/Makefile
 create mode 100644 drivers/phy/cix/phy-cix-usb3.c
 create mode 100644 drivers/phy/cix/phy-cix-usbdp.h
 create mode 100644 drivers/usb/cdns3/cdnsp-sky1.c
 create mode 100644 drivers/usb/cdns3/cdnsp-sky1.h

-- 
2.54.0

