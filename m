Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794450109;
	b=hS8RHrDJmeUy348kJH3rCCv5++C73SBkSPKGzCYOkqwwMvuhXyKdwtAo6O1d+ajWhqTN
	 0wx7R07CNdzKu4XtXrJPUhcatHSzSa69MwZwIISU6+V9rX7L7oPxSwKX4lqF5Uu5QpC25
	 Us5RQD0SiOGGpmB/0p3vMjynGgeRSlrosogww5I2BT7v+ttwHXr7UaYxHGFwQ1HhlYNgB
	 GMcbHBgplJq7GN7/DVzyAVjkHFGsf3V4AQjU0mpkk0vE9NVVvdZBkDClR8nP3O8Jl7g24
	 qFQbtJJ2tSPmhkZK6D25NYWTYxwbLfSRIYwuL8uwpRbkhW9UQRNgiYTCM+mWEIZP95A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450109;
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
	bh=Bw239Pgdn3QC0cdzWj3Bt2TXtO4xGoScoP4AqGL7gJk=;
	b=nbHMndaw8tyXHPfzsGRXQ4oY0hBzY5Z78bAX2jsVfneXeMmEE/87n/36L1TmqNJr9qv3
	 BN2a+yje+IWY3J4KVdciBXmeZs8jbtkcrifEVi5fpLDdqCTq/VToD4auxOv9U1QMFmGEj
	 Fp83quCQNRKsZQDry5HKvlBQKQjUSjBtUghAw95JeJ2/YliLnzWrSTbShv3pPVTp09g1p
	 Brh2sxQZqnbQHfzInWeAQvpUhOhBkK17G5tVZJ/y0V+dZGNn3+lG786rByIGCnZ6aScCP
	 esYPTHMU27NnNnNMFonSs6qoBzGGMRtH507FypUJoHe2mXUiuYlyJydRFfts9wGEm8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.131
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022131.outbound.protection.outlook.com [40.107.75.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7039E606A321;
	Thu, 12 Nov 2026 02:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7039E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yST1DK3RHjX9VL59Yd9PKaDfaZG6ps6AZYMI3MlXIZDJHWq+AvlykZopm/jQbdC2ezUUyuNf2DusIgR7/u/PGdgpl4FzekXJEFbMabo9IHA1qNep/fJIi7mcp25xm3vQCw9yLWRpDI464FhXJwP714tmp1LG4L7j41V3OhGDXb3eYdtvLrQwlEN+tRU73MEgcSlhENUCjpAKsuTFtrPCI/cusualentc8iPvLx6dE0vr6BYyglX9CGmXwYDhxDg+DDbQxh872RFv25BNSdpk8lknOPmM67pD1lNE3MTIbkGplHnEKr1UDRveRXtS7H9PbpeRBroKZ5pWHMGJbLqCIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bw239Pgdn3QC0cdzWj3Bt2TXtO4xGoScoP4AqGL7gJk=;
 b=iiCTLls5hhV6QKmIBfKkroCnIclL5ReRhNFC4Og1uKSIOoeKCaBXVhiDbqX737wMDp7SqOHtpPVeBibzFtRRpF15rB9IBxLhhXwOoOU1P6BC2cPVBhHBSu9PhRopuU5wJTMjqvT2sX8o8+yrQwaSF89lyT73FYTlGJcl02p7WnG5B9q/Cfoo9+RPx5114sRl8AyI5QVZgj0MtqHvBVjlguDBYYCTcLWjSSyL5CBafzbSUFJX6pdizMVfvHoa7nT3eXiBFhnn0Pe4+MuBib2SSpHut7WuMTGBrAqjupfR3HIqO0S1kKs0wqzyy4UyiGq1On4vo4+VFs7+AewAGlplCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SE2P216CA0115.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2c9::16)
 by PS1PPFC5EBD37C3.apcprd06.prod.outlook.com (2603:1096:308::265) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.0; Thu, 12 Nov
 2026 02:21:44 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:101:2c9:cafe::2b) by SE2P216CA0115.outlook.office365.com
 (2603:1096:101:2c9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 02:21:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 02:21:43 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 5564D4102E62;
	Thu, 12 Nov 2026 10:21:42 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Gary Yang <Gary.Yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	hongliang.yang@cixtech.com
Subject: [PATCH v8 0/2] Add CIX Sky1 USBSSP controller support
Date: Thu, 12 Nov 2026 10:21:39 +0800
Message-ID: <20261112022141.4136099-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|PS1PPFC5EBD37C3:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 924fb4a3-6962-4d4d-0840-08df4063b1c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|23010399003|1800799024|18002099003|6133799003|261009223027099003|921020|56012099006|261026121527099003|261021121427099003|261102123227099003|261022105027099003|261022075727099003|261026140227099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	C9+70ulsYmDNrAcXhuTfvNtV1NeUFBsqYMpADr6tfie4Qf+cDLgQxL4Idk/lXU+HmBPwz2cwYqWtcMKUKMYn01EAq5c/AZb4U1lWJ7rjSx5CEqo8J5p+JykkdXwbPhfVaVoiMn/P2HX08zWAVXbMY9HWjAb8fGq5qJ3jQ31Q2WeyWyC9X42VPFI80kVx6gyv5k2W5Nb9Kg53DKlO5CZvHpetQd6cpLpTXvj2cAIco7JkTsZhZPo8NMCtUsemSTl8DQpd4AMHfqiRM1lgoCnTS05R1AiPVAmsbfxioxO0wJRhcN8+TKOIWvwqglXMclDioB4UmKazG2zKtMWRkJi5KqaoG25nf2e5B7xl8lBtKFUjZ3Xv51yXnm1+RS5EXcF7nCXDaNTrqg2UEHA9qwIzlRurOIDS+wus8DC4hfS5pO+rlTz8Apf0y4xqeJXhANnfTuumXKX30ecvn14NYTlSJByiU1ydyRZ0uBOS7OGtMHsRIEabPaKHVP22TPhF9HvRTLvPw9MBGDOnSYl6Ytx5/nRqhFP1nbYPdCr92Wo+qug8hvh8QOiCyudBzag88sgdh3KTybvW+s85LETwGbYg4z7eFD/6B01uuSlDODbm/G0AXy3+ILSh0TvpwyeNPbivurp51Z8zIyEP32MIJilxD92oB/gqwuskuq5XgbnX+pEcxy82vSUMAXBixT1uSkuhggD9m/yd5/juSgXS+f3tU6ua6INbNS5e/H05sNWHTNs5fjR8yURFrDTCk747QlTN
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(23010399003)(1800799024)(18002099003)(6133799003)(261009223027099003)(921020)(56012099006)(261026121527099003)(261021121427099003)(261102123227099003)(261022105027099003)(261022075727099003)(261026140227099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	safCjRFSERugEJGuj9pmZ5wt7h+JULb1Uv6AO4YNmgDxDBTbs5/+SEzmj3lNo6Oe2Yg0GemdpaKHyZkq+FZBcfBvcgJyyQuJ1obu4oeX70upv7QoC2K9c47fy/sGB5IEGMujBH2Jg4tCC17SnGzVMY4BIlU+T2A62mXJNJLatiCLUjeCNdZM9owxS9Vu40/AToL6jEOi/8op3PpzrVcOpzndOc0cf1zus0DevkGjRXfVA7Er/I1KYObQGXuegiS5K7giLkwL9sUeKqrZnFMm3LSXP6dM0nQ39dYBXlTaZ2ylCIEywOl4TIwmIvC+7PBozlEeSem6nzk0sbgtcR16NHzUnRQiD3PK3Y5p5qQIhuitBh6hE4lKixXwXn0aDInlbJDYMdZsz8+wGqysf9jItr88r5uxHF6yL1vw4hem029sx3nAvUQPKQdAw2qRaeFe
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 02:21:43.5101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 924fb4a3-6962-4d4d-0840-08df4063b1c0
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPFC5EBD37C3

This series adds support for the Cadence USBSSP DRD controller
integrated in the CIX Sky1 SoC: the device tree binding and the glue
driver. It is a USB series only. The arm64 device tree nodes belong to
the SoC subsystem, so they are not part of this series and will be sent
separately once the binding is accepted.

Tested on Radxa Orion O6 (Sky1) in host mode, together with the CIX
USB3 PHY series posted separately. The series applies on top of
v7.4-rc1.

Each controller is described as one address range in the USB30 Type-A
DRD RCSU block at 0x091c0000, starting at its AXI cache attribute strap
register and ending after its AXI clock status register. The two Type-A
controllers interleave their strap and status registers in that block:

  0x300  STRAP_PIN0     stream ID           USB4
  0x304  STRAP_PIN1     stream ID           USB5
  0x30c  STRAP_PIN3     clock enables       USB4, USB5
  0x314  STRAP_PIN5     awcache/arcache     USB4
  0x324  STRAP_PIN9     awcache/arcache     USB5
  0x328  STRAP_PIN10    USB2 PLL            USB4
  0x400  STRAP_STATUS0  AXI clock state     USB4
  0x410  STRAP_STATUS4  AXI clock state     USB5

Only STRAP_PIN3 is common to both controllers; every other register is
read or written by one of them. There is no contiguous window that
covers the registers of one controller only, so the two ranges overlap.
The range is mapped with devm_ioremap() instead of
devm_platform_ioremap_resource(): requesting the region would make the
second controller fail with -EBUSY.

Thanks to Krzysztof Kozlowski for the review of the earlier versions.

Changes in v8:
- Fix the example: the USB3 PHY is a single provider shared by both
  controllers, so the core node references one phandle. The example
  still carried the per-lane two-PHY form that v5 of the PHY series
  used. Keep the USB2 PHY reference and describe it as usb-nop-xceiv,
  since it needs no configuration.
- Add the vendor prefix to the two board properties: cix,ssp-disable
  and cix,u3-port-disable.
- Driver: do not assert the resets in system suspend/resume, and do not
  cache the wakeup state; the child device that owns the wakeup
  interrupt is asked instead.
- Driver: rewrite shutdown() to use the same teardown as remove(), and
  allocate the child platform data with kzalloc() so that
  platform_device_release() can free it.
- Driver: only set PS_PME_En when wakeup is requested, and return
  -ETIMEDOUT when the controller does not reach D3 or does not leave
  it.

Changes in v7:
- Describe the RCSU registers of each controller as one address range
  starting at its AXI cache attribute register, instead of two 16-byte
  register slots, and drop the reg-names property.
- Map that range with devm_ioremap(); request_mem_region() cannot be
  used because the two Type-A controllers share the block and their
  ranges overlap.
- Take the offset of the AXI clock status register from per-compatible
  driver data (0xec on Type-A, 0xf0 on Type-C), instead of two
  reg-names.
- Dropped #syscon-cells from the S5 system controller binding: the
  property does not exist in the kernel, and the series no longer
  touches bindings/soc/cix.
- Removed the arm64 dts from the series: it is a separate SoC patchset.

Changes in v6:
- Dropped the simple-bus RCSU container; each node is placed at the
  address of its glue registers and the core is a child at its own
  address.
- Replaced the usbN aliases and the undocumented id property with the
  register offset and bit position arguments of cix,usb-syscon.
- Converted probe error paths to dev_err_probe().
- Removed the unused over-current GPIO handling and the unused dr_base
  and cdnsp_pdev fields.
- Fixed the 125us prescaler value: time * frequency - 1.
- Made the AXI halt writes read-modify-write so the preserved and RW1C
  bits of XEC_AXI_CAP keep their state.

Changes in v5:
- Dropped the cix,sky1-usbss-rcsu syscon binding and the cix,usb-rcsu
  phandle; the glue registers are described in the controller node.
- Added the MAINTAINERS entry for the glue driver.

Changes in v4:
- Split the combined PHY/USBSSP series into two independent series.
- Restructured the RCSU registers as a shared syscon region with offsets
  (reverted in v5).
- Fixed the indentation reported by checkpatch.

Changes in v3:
- Fixed the interrupt specifiers of the core nodes: the Sky1 GICv3 uses
  four cells, so every entry needs the fourth (empty) cell.
- PHY driver: assert the resets before registering the PHY provider,
  disable clocks in LIFO order, and fix the error unroll path so clocks
  that were never enabled are not disabled.

Changes in v2:
- Split the single binding into a PHY binding and a USBSSP binding.
- clock-names: apb/ref for the PHY, sof/axi/lpm/apb for the controller.
- reset-names: core/apb instead of reset/preset.
- Dropped axi_bmax_value from DT; it is a driver constant.
- Added the MAINTAINERS entries.

Changes in v1: initial version.

Hongliang Yang (2):
  dt-bindings: usb: Add CIX Sky1 USBSSP controller
  usb: cdns3: Add CIX Sky1 glue driver

 .../bindings/usb/cix,sky1-usbssp.yaml         | 163 +++++
 MAINTAINERS                                   |   2 +
 drivers/usb/cdns3/Kconfig                     |  13 +
 drivers/usb/cdns3/Makefile                    |   1 +
 drivers/usb/cdns3/cdnsp-sky1.c                | 663 ++++++++++++++++++
 drivers/usb/cdns3/cdnsp-sky1.h                |  99 +++
 6 files changed, 941 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
 create mode 100644 drivers/usb/cdns3/cdnsp-sky1.c
 create mode 100644 drivers/usb/cdns3/cdnsp-sky1.h

--
2.54.0

