Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.108
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794881834;
	b=FuyVnybG1u2SrONsXDfXW86zdp1KeEw7mGL8DHoied0z2Yp7Wort6nMp1DhJa7sxVi5y
	 K673WqrpOPlCsomGQU4Fu+B2pmqI1edogLPhG3NzF4VTM2NNcQcj5DHFHc4ltRBWupvtx
	 6o6VpGMGP8tWeOCZBxZSwEgKKOMWC+/VpZRrxdLu7QP8coRzQYEK/fhtYshKK+Xyk22Oq
	 kUNRNNC/qBhFSnIOyPInXL6HWMJoncYYI+fvND7O0r7FM+TDm2P/7dr0JqYv5GBIFOcv4
	 oOUbXhQQeJ9agVmVn33M9MkDhuBDFBt+r0z7K1OK2YR/FCcIc8Q5aVALXfxW9uUWoog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881834;
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
	bh=vDfoRSB2rf9QLgKIf5ljI1OKL2s7vpM3+Ls4sgK6GSo=;
	b=biDAFIwzVTY4vD+0MeOyu3jrSUTkcLy5okeUUV2s3sHyOjFYzsmIMM8T74wNmckaOh/v
	 WIyabh2Niy5i+FvOurGEsxsQNxNEbX7Rl8p46wIC21gLsqp7qv+R65g1xMNwDWoNWPujc
	 XpFOBFKTZYv+ALvioVE2SkRuM5pY/EyTpd2Ut4y0nQYjJ2RSvFaDxnOZez5EinjP5dPVG
	 kRC2jEHI8KM7eU6A9+9gXlvPfX7d1JFrN3NdMBgZeRPlhKLjNgqYP+sgCyWvd9zqT/AQU
	 sXuQ3FQwmUB0v7F4VJhZT/hqY/EzvFk3u+yFQeN04pQk6IkvuAfYm5r355iykA0j37A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.108
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022108.outbound.protection.outlook.com [52.101.126.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E19606A31C;
	Tue, 17 Nov 2026 02:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34E19606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=usUYbC7FMcPvr7OaJfHp1ll6py/w8e/FBiQ6Ksm/UltfamEQtktn/U+6WQku6bVZLH7iDMUKm0lgWsN9BrS9XrmCNZvZ6ZQYBGWOTu1pnTFFIw2zxjqhPGlN81iVnHYwzUWE+XS/cm0Uh7U6NFdhhilqu8DM/5eiVUBuRQgkBZi2rO9EvzUtHr5mGg7n3dU4kyFYrzdPZy8HFaZG+oemWbqFIgyQklcP8Im/NjLQJJ7PobcnqkUN+iILGVs2sD1vsdke6y2nm83+4iF/l7BYfn9t4hLahFoXwPD+Q/cRGV6yUfPa7VC3JAsH3AdpA4U/IVOrlo/7hPBPVSNemOvO1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDfoRSB2rf9QLgKIf5ljI1OKL2s7vpM3+Ls4sgK6GSo=;
 b=ouZujjkS/Hp4hsq0eyZiwJVDyhImzsrsXf2z/udpY91RK7/IUbPDobZu2b+bzSd62YTgKBwxMrhMRzVMnUnzD78Hqf+oGbOZZenX0vvREtleqtv24WufMLDkZ5Ebdx9VFfNiVknBC50rChoXNCEh0QQ7B7ipLTgLC04Rng2qyOOhtBpooRNEj45ybxObXztFqKGVrBO5+VUqEBuRZWYMTnfCI6Aoc9ER7zNYx6OaPVyHvUu+3la6XR6CDEWwXPyKHYAEO9K4kKh10YXv4LNg931cU6EtcS6QJq/aTMd50AMOI8cPUlOeLNZFZNfyKUEh94aCEMKYMD/5APYHWAwvXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4P286CA0070.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:371::12)
 by TYNPR06MB8378.apcprd06.prod.outlook.com (2603:1096:405:3b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 02:17:08 +0000
Received: from TY2PEPF0000AB8A.apcprd03.prod.outlook.com
 (2603:1096:405:371:cafe::37) by TY4P286CA0070.outlook.office365.com
 (2603:1096:405:371::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 02:17:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB8A.mail.protection.outlook.com (10.167.253.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 02:17:07 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 252AC427EFCF;
	Tue, 17 Nov 2026 10:17:06 +0800 (CST)
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
	Hongliang Yang <hongliang.yang@cixtech.com>
Subject: [PATCH v9 0/2] Add CIX Sky1 USBSSP controller support
Date: Tue, 17 Nov 2026 10:17:03 +0800
Message-ID: <20261117021705.2202892-1-hongliang.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB8A:EE_|TYNPR06MB8378:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 22fed1ac-5377-417f-a32e-08df4450e129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|7416014|1800799024|18002099003|6133799003|261009223027099003|921020|56012099006|10067099003|261026121527099003|261028144727099003|261026140227099003|261021121427099003|261022075727099003|261022105027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	ZpVrPdkGmBhQv2C+DEZmiJ5Eg5Cjr5Tt6iCsj+01T4kM1X0lrtciBQMliRM+I99Y/62I/Rn2srocfLEyHZvz0nt9ZG+bwcA+jpcAF6R12rD4ZadskhziKGw9wz2//rmdHDCnOwpt88LJ09G+9fzPC9JjaNubZ7caDla9quh0vQO9wvuefPrP4aW2iDH5dDSkoHRdZfMMtW2hoVBKutgYbWU+YaJUWRG9U7Me/3m1TFTafYUZiGhYxgWTYjm7OVcbfUnrmhke8J8Su2ilKBwtZr4RjDXepTqUapFA6D3AhsmYHMaLoLXbhDwMmVqF97/zgef3Hz+b9KSzk/4RUfZ99ta3cnSPrdwmCBHyKPUASsBjFM7+YTK9uC2uTSQcoEIW3KTRqwMQfxLlJZWZg3Af5iCL+yvuAURblX+fYXEI5+voKXMZxJTK5pTHC3Zd0zsm8+DYSrWjMUWLsST9L9R+ZA3w5KAq7Hv8Kis53Xulek7NG6A/rJjbkHYkZNfu0kD78xVTdafmytOAOJv0Lwhy+zkkjdwyKJr9F7KPKwLBh0B/0ZOy9y8aJxOFwSlTo+XQa8N5vFFhNuP2UjZID5PpV2OP9rzeDepriF1TUyHO0VpmqJF0xZr1T1WVRI2n4noeR5TZrRbv40ZMRh+MPwJX7ADQcPJTTwa/Rp9Jv438A13aFhAG0DyRPYd6v9AzL94GbXCLJlVnqrBYbFWIqLKSC66F/8UV5n/sNiTg1ZVyZAR5Lt+wqM2F/yFi33KJ11Qj
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(7416014)(1800799024)(18002099003)(6133799003)(261009223027099003)(921020)(56012099006)(10067099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022075727099003)(261022105027099003)(261102123227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aajDQUk0sMcKVLCayttVWjq4YRiipxXdKnh0JEVIpVY85SxsTCMJCSZFd/WQohSHzrH5RnDZISN0JJN8badIdl07eTLgXICXVy2oqzMmAPkkgIwB3IQtDCtEJgJwKod9C0eu+K0SGE488sAP83qCJH3BneZvlZDxh60A4NnQnDxgVfhUM7i9sPEyR0SnvpwsCp8ICoQbRZmtS0oovdF/76038orTaSJRiSfovs3MjgqGN10B8BRciSe36mVAztA51VUe6j29FElEOsWapNkaHpz8OiaX3ud3dcBQHYZDj58VrFk3SdL2nouAs2osFLnMlZ+RTCKDEbJjunsHsE+xorjNLnEU76StRjxn1/8CgZXjSLtWRfBoh8yJim8yjbDqSJopdo5HXAew1RGhFGpXTkN73EkDsErkisu8kwQzvkFXdhUWPzUTpPWXu1rIjobh
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 02:17:07.3548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22fed1ac-5377-417f-a32e-08df4450e129
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB8A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8378

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

Changes in v9:
- Binding: patternProperties is placed before the required block, the
  usb-phy node is gone from the example, which now references only the
  USB3 PHY because the USB2 PHY needs no configuration, and the example
  window is 0xf0 bytes so that it ends after STRAP_STATUS0 instead of
  reaching STRAP_STATUS4 of the other controller. cix,u3-port-disable
  is documented as valid on host-only ports only.
- Driver: clock enabling is tracked per clock, so disabling cannot
  underflow the prepare and enable counts; PS_PME_En is cleared when
  wakeup is not requested and the controller is put back into D0 when
  D3 entry fails; system suspend gates the AXI and SOF clocks only when
  the child is not armed for wakeup and the controller reached D3; the
  device tree has to describe exactly one enabled core node and the
  glue driver no longer frees the child platform data itself;
  USB_CDNSP_SKY1 selects MFD_SYSCON.
- The binding patch carries Krzysztof's Reviewed-by.

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

 .../bindings/usb/cix,sky1-usbssp.yaml         | 163 ++++
 MAINTAINERS                                   |   2 +
 drivers/usb/cdns3/Kconfig                     |  14 +
 drivers/usb/cdns3/Makefile                    |   1 +
 drivers/usb/cdns3/cdnsp-sky1.c                | 748 ++++++++++++++++++
 drivers/usb/cdns3/cdnsp-sky1.h                | 102 +++
 6 files changed, 1030 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
 create mode 100644 drivers/usb/cdns3/cdnsp-sky1.c
 create mode 100644 drivers/usb/cdns3/cdnsp-sky1.h

-- 
2.54.0

