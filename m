Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022128.outbound.protection.outlook.com [52.101.126.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1987374E55;
	Sun,  6 Sep 2026 03:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788665091; cv=fail; b=rzVvXl6nMqMvqUNcABG+ZB3ru9UVcfX17tgK1bun1LzEDFX9D1zH1Sgpr91KtKi/NLFJwRBvemgzkpYxiuHB8KX6BYnOetpuoMJl6jg2VzcPlIjEn72mT9DHTo7UMByc1z0xzR3w4IUZLDWFBj5BwLNy3z19dhfyb9J8USTGg7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788665091; c=relaxed/simple;
	bh=vt0JXcrXBBCs31ae57Z0WyZRK9jefgVGeSSfYzdIFew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Px00/KZ8xju5Zvn/jnTLyvRWfyUeFz4gyLeDw94rAc50stC3A+ECNxVyxef2f718tm1xFayAhnQnXov/v2T5qlxigmGSarlTCfQJkzCizDcabniQUOUyc0GWDm5lFvXWfgeayzlF3jwETb2Bfo8dCTmIyrWeqml2WGXs8KfRJQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UY2rF1jxc1RfV/K5ipxrskEgF4zrujl+NQUjQWKXn2GmJysqfB14NS+ffcUADzg2gSNZMUBhhxJlxVo791B+w+ZdyMW4qZWhwgbOktTRrl2IV5OuFnJH4tcrJ2P0A529Q8nu/BZTqbCnJBTbnpoJ8bn3msHB6Fwa/9x0jZSL8MQAxUbC4d6xynKAz9V8AAfzIx3ov2nv8k71QQb60NO9muZCbjCD/dmcFrtLrn2bGR77DtdxT8F/ZCugNI8WUvVCA6044XUXWFotExhCm188kF/tYhuifAlJTESxihtjkk2dzemEAdHVVGdvaNQl7WY1l8OgD7BPssaQ98fd+kp8LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zB9ObRcBUhKOwOFExndfmK+5Zr37CSnS8o2vakpATCU=;
 b=AFYyaLVe0NfWc783X1aBgBSzK2zZTy4TOnBQXPnW9X0jJIt8lurL6hqJneKy5KAF8hp/0bsuvRz0pOS0No+mVQyHStLHN79Y7ig7H4g3ChMhMiy2WTRvPDzogGDME8bL1EEmaGbrsLZVRFl+gKJbbzVQu0BmDFSjJ6G4wCi7n0RFfJEiqmdCB3nt4tbGoJS/xjr2g7tgHuQn63FoulUkCAHG4KkDtKiHCol8sQNbE0PT2/QTKwVWalyX2z0I8rqfK+Yz/DEZGLFQqLQEPAjiJpPLhpvDF1yyvJjj2u788OwJmkZ/zMCBonhRzmi8ePjo6MlGtqfTmU6Kp/7hK3aVVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR04CA0011.apcprd04.prod.outlook.com (2603:1096:4:197::10)
 by SI4PR06MB8946.apcprd06.prod.outlook.com (2603:1096:4:2b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.13; Sun, 6 Sep
 2026 03:24:44 +0000
Received: from SG2PEPF000B66CA.apcprd03.prod.outlook.com
 (2603:1096:4:197:cafe::67) by SI2PR04CA0011.outlook.office365.com
 (2603:1096:4:197::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Sun, 6
 Sep 2026 03:24:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CA.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sun, 6 Sep 2026 03:24:42 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 2AC17409210C;
	Sun,  6 Sep 2026 11:24:41 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	pawell@cadence.com,
	rogerq@kernel.org
Subject: [PATCH v4 0/4] Add CIX Sky1 USBSSP controller support
Date: Sun,  6 Sep 2026 11:24:36 +0800
Message-ID: <20260906032440.470788-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CA:EE_|SI4PR06MB8946:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 294930fa-12fa-4a48-c7da-08df0bc66474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|23010399003|1800799024|82310400026|921020|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	9to8t6Xl/YJPDaVPnULBRVToYChUcIR6sOJ5kmUAgs7k0s9URvJXZBITv12VbiapBcK5UK6eeo54KjkWsrOxwkTtSbIVa9Y0dv5scrDZr7Uxnn3+TOJ3qLwAA5ba5iyrEXdysmJ0cq0HXl/eRCGF3l5FSAjcmP3i0CVUXn7tIukAyCJ39bi2YK2fdCSqOWC/MFl0vkG/xc2PECSofQnibmrN/wQ+TAoNkY/1aMYgk9Ssy8D4XwZFbrVI0zL3VOjxlbdJPDB0+cP++IS0KkRcOhpQtz/TPFUFaRmK71iYlLnbNgQZr9rqudg8oMihA0dp63pgJxmh1w0vmfL1D4KsWcba8HSIhWdI1fiXxr0bTyzquLc2+WdPOf1M7VQA243LLmjQ4S1GZTzUXvw/7SKFEfouZEy7+V6gJBnRM9/5rXYo/D04P2EOKE74+M9ixjiTxjD/Bw+vAIVCiLujJ13Qe7RRiCjfTJDETAnhOIJ/5X+oygfwNlMC6Mtk/0FTgU8Z0pIEyeFMAagHfo6nkHIgLfrlYIgXRL4o5rbb8AGIfm0wAPUcIJQxD7dAQHG1xDvXFLiGDqUYM9W2TNREZCg105HaHMBTjKzu5ldfJafYPCmIkIQF/dF5UpO3WBzDzcdbB56LIj3weNVIWRHMIUYghnR4GP4wzn7auelvJicUxDo0Zm2PUjJJTjudLKSPyuvlYISw2sQzMWZZVmbk1YfI3uIJ/r4+al1jS9moBUNjPCM11KgAANBSjqqIbYgSEnER
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(23010399003)(1800799024)(82310400026)(921020)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jnFa3l6sbKJfMpRrTl9fZ3BBh3ATVBSDQZ+44JkDX11IAwkRt6G1Ru1mpLrPcNYK6DiMeXg6S8FU37ebGCRjYIQHtVTK/cWRZ67kBBSEtN9TqbtNtyg/lxXRndgfDusKOOdlJen0VbdVxps402K5D7gSmP0HeApAKFzGwcRfjYBgVedgcPsEhFD8AeXYu+myCxELIk3zq03pAcoddgMiAX9vc2YRo/kJzwSuVVJc2XPfzVnR8yvN/EIQuLzI4QMh4wLlwcA9EMiUpkyu+Aa5LkrV31rEeB6868hmXSa3E4+mRopIMJc3WWoyPgrwmtdQIttks44FchWQhG9UzqsWUKHStoCWAwlkuP8Vgzr/ixpmeXkVvHH9rQ/1lDM9lKJBP0+ZCUXvBxSSiZ99ZZQrV/iBo+3kEhHCnifAKWjxXhazusN/qMS2albYCd8EpDs4
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 03:24:42.4849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 294930fa-12fa-4a48-c7da-08df0bc66474
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CA.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR06MB8946

This series adds support for the USB4 and USB5 controllers (based on
Cadence USBSSP DRD) found on the CIX Sky1 SoC: the RCSU system
controller binding, the devicetree binding, the glue driver, and the
device tree nodes for the two controllers.

The per-controller RCSU glue registers (AXI cache attribute
configuration and controller clock status) live inside a shared RCSU
register region, not inside the controller's own address space.  The
region is therefore described as a separate syscon node and each glue
node references its registers through the cix,usb-rcsu phandle with
the register offsets.  The OTG mode straps live in the S5 system
control block and are referenced through the cix,usb-syscon phandle.

This series depends on the Sky1 USB3 PHY series ("Add CIX Sky1 USB3
PHY support"), which provides the usb3_phy4 node referenced by the
device tree patch, and should be applied on top of it.

Changes in v4:
- Split the combined USB series into two: this controller series and
  the Sky1 USB3 PHY series it depends on.
- Restructure the RCSU glue register description as suggested during
  review [1]: instead of describing two individual 4-byte registers
  in the glue node's reg, describe the address range and hierarchy -
  the shared RCSU region becomes a syscon node (new cix,sky1-usbss-rcsu
  binding) and the glue node references its per-controller registers
  through the cix,usb-rcsu phandle with offsets.  The glue driver
  accesses them through a regmap instead of ioremap.

Changes in v3:

Device tree:
- Fix the interrupt specifiers of the usb4/usb5 child nodes: the Sky1
  GICv3 interrupt controller uses 4 cells, so add the missing fourth
  (empty) cell to every entry.  Without it the controller IRQs cannot
  be resolved (platform_get_irq_byname() returns -ENXIO).

USBSSP glue driver:
- Add error cleanup to the probe paths: unmap the xhci/dev registers,
  assert the resets and disable the clocks.
- Replace the static of_dev_auxdata array with a probe-local one and
  allocate the platform data with devm_kzalloc(), so repeated probes
  cannot corrupt shared state or leak the allocation.
- Quiesce the hardware on remove: assert (not deassert) the resets
  before disabling the clocks, and balance the runtime PM usage count
  with pm_runtime_disable()/pm_runtime_set_suspended()/
  pm_runtime_put_noidle().
- Check cdns->host_dev for NULL before dereferencing it in the
  platform suspend callback.
- Drop the reference of the OF node returned by of_get_next_child().
- Stop clearing the clock pointers in the enable error paths, which
  left NULL pointers in the driver state on later resume attempts.
- Take device references in the shutdown child-iteration callbacks and
  drop them after use to avoid a use-after-free.
- Use BIT(31) instead of a signed 1 << 31 shift.
- Assign the system sleep callbacks with SYSTEM_SLEEP_PM_OPS() and
  pm_sleep_ptr() instead of a plain dev_pm_ops behind #ifdef.

[1] https://lore.kernel.org/linux-phy/503e87d9-3311-413a-98c0-e02a02c4a354@kernel.org/

Hongliang Yang (4):
  dt-bindings: usb: Add CIX Sky1 USBSSP RCSU system controller
  dt-bindings: usb: Add CIX Sky1 USBSSP controller
  usb: cdns3: Add CIX Sky1 glue driver
  arm64: dts: cix: Add USB4/USB5 nodes for Sky1

 .../bindings/usb/cix,sky1-usbss-rcsu.yaml     |  46 ++
 .../bindings/usb/cix,sky1-usbssp.yaml         | 144 ++++
 MAINTAINERS                                   |   4 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  42 +
 arch/arm64/boot/dts/cix/sky1.dtsi             |  88 +++
 drivers/usb/cdns3/Kconfig                     |  13 +
 drivers/usb/cdns3/Makefile                    |   1 +
 drivers/usb/cdns3/cdnsp-sky1.c                | 726 ++++++++++++++++++
 drivers/usb/cdns3/cdnsp-sky1.h                | 129 ++++
 9 files changed, 1193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-usbss-rcsu.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
 create mode 100644 drivers/usb/cdns3/cdnsp-sky1.c
 create mode 100644 drivers/usb/cdns3/cdnsp-sky1.h

-- 
2.54.0

