Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022078.outbound.protection.outlook.com [40.107.75.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D3B2D8364;
	Thu,  3 Sep 2026 02:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788402934; cv=fail; b=IuMjHIKsq7W0Yd2ZAkhVgPezsTm1M2U4NVCdQ8kbnq7pb0b45X/ajinRGPWq7iq0MIeX1sckZEuY2brfWCZXkPZdmPgzHT/j3s7ukjDbW5n5IMqsxwBJT9bHida0x2ioH28Pe+6Lc2nDqJb6/nkGq4S7LWR0Q02h29t0+JDVdGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788402934; c=relaxed/simple;
	bh=/hvtTS+QxGlSr5VPN0WDLPlVw3K0CIuSWLe4E2F0pYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FdvTmDQAUCqFXFEWbNbMNMPsrTi7VPPEzdm2Z7WmCX+HBkc6eqwjvilPLRrahY1lCTfBZz/4POMpPfMh5ZIZ1UCZ3AOOURbwjF98c4oZFS20u9IOUQ0Ck+Xp2OeNNzXBnVVVqMez4+fFX9u4lnHvVNABGzum8brRdniiE1dS2IQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBnzxpmhLJKUgQWoq6+3sfaCbzQDqLd7PtQ0dd0jflCmOuxk034g+A5ldeX+REdpd2GsVja51NRW2KNA8YPFJPezTXS486bzz3itCyHFLTEqW/hHlE/qcCUAExBzUcBoT/LsVUyX1BYXph3QcsVy4lQenOXGafJgW/AeZMmPL0TyWyd1C7Ge1flrphRKYQZ2cpgI+vw+QH7/404XwcPQzk3wwJ5EeLmM9ma9sFy3WsI7qyAtZdHatIMTeX7e2ndL5EBW1GBscXpibXHfel1YJ/jNpH7NEGc9WdgDkpvh2FQHajvQ1odvoh55uYMcLRumZyvXSM9hl5yCiHaxqHWzqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N91JwVNEQV4gdLCyEaKofpyelvUaY0smONssn1gvwfw=;
 b=pFqRIBRcS71hQuYMtWkhClCvbupupO7sZ7PHMDNwo8TtqKRGh2Da17dVteJNe4NDqvEncSOM8d0AKd+uf5SBU7mU7kzItO1ZYsvnzNXdaOn4tFJqMF643VKh5/CbUFwrkZwRnaKEN80Gs0SwbGpkr+Nayl2AmvzdZ8rJaT5qexda8LWW37mODCDM+xzhjohYsNkh6rCYqTMTwlCRHDYi/6KGn7U2seceCytTRIAyDM1yHhK/uTNaB+xyBn5g8YoGXKmpVmcmdzoyJTQqg7px7TLqHf9HM2h4Tg1fjvO2QFQjlM92qaSndRQRxtu2NmPNxTZ0Nd+5akZ5ijR83JwlwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS7PR01CA0033.jpnprd01.prod.outlook.com (2603:1096:604:257::18)
 by TYZPR06MB6214.apcprd06.prod.outlook.com (2603:1096:400:333::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 02:35:23 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:604:257:cafe::66) by OS7PR01CA0033.outlook.office365.com
 (2603:1096:604:257::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 02:35:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 02:35:22 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B3BF14092108;
	Thu,  3 Sep 2026 10:35:21 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: krzk@kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	fugang.duan@cixtech.com,
	gregkh@linuxfoundation.org,
	hongliang.yang@cixtech.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	pawell@cadence.com,
	peter.chen@kernel.org,
	robh@kernel.org,
	rogerq@kernel.org,
	vkoul@kernel.org
Subject: [PATCH v3 0/5] Add CIX Sky1 USB3/USBSSP support
Date: Thu,  3 Sep 2026 10:35:16 +0800
Message-ID: <20260903023521.2064986-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <503e87d9-3311-413a-98c0-e02a02c4a354@kernel.org>
References: <503e87d9-3311-413a-98c0-e02a02c4a354@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|TYZPR06MB6214:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: edab8750-f036-4883-059e-08df0964013e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|7416014|1800799024|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	THlmZFIectaFPenHSlzbqZrloJPUeJl2W++qjuVzcf4o+pkEih2PMejnJrh/YeVUbmFTV2QW5MeR80+Pe2CK0Y9tO8Fl8Kc7bIWTgzqQe/3sXbXaIHFy+CkvWUaaaachj0HFvDx14XpiyjUPxIFzKwUuOsZIAf5sg1+TDXreGqrHrRSBQiLTLvp+nzo5nB3p/bu+gOJRPD+zlTk225cJlRIzpgx2lYkA71oNpSbW4kbz2mEZicVpEMsqW6No0kVfsvBpImCj2SY5mnXyzO2lg2u878maTPRl6/nyOszIMDSc9O2a2pwb7wj+0hD3IT2eUSqFbKIWoGsqYwfXCA87fAMcA8VEh1UIYowMwUHJYN4p/d5mFEP+4/Jk0oyTXv/nv08sBYIW/kIKF33Ndx9UkHaQErKYAP/cF+OsrSrR9LuV5F7uYhjzaF+BNL601DC/nU94thD7jGTgJpsyrKNPGnmluffpBZSaAnKWbIsVd03zO7EtQQvag2PExsLUcDns/nN4lG9YfKqTt/4MTyjC83sXwgL3skUvZn/1F/81KWB3JGpDczJbRobFo3/BmBMnV9UUivA78vJtTeZM2/+oG8vX6FYg5+121FwIYkFRBhwXtSCaETGsXtd1dxx0Pjx49MRcvJpVr9jd3nxER2EcJazVPIWpZaunaoYC9iPvDHQv7JgjzcdbANWut5jXWhW0zcs05K5haiDmjeddGtPcYw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(7416014)(1800799024)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RtWe+GAno4Q8owC1hqWpuMhO2L3IHjYurePv7hP5B1MTQrHplN0Sn3ksjwM2sG+tC+RpTItxrtvb6fdZr2H3oGkNaYsjK5GRRBl/2N9rB410ef+TI8pPJ67kKYrRQoWMt3dY/TWZNqZURUandz9cswmXVhvnWJY0g9KMGOPf7HNR4pJA7UYqFamOmiagec9LDP1i00Juop6R8FCgxa7AMe613c5ZMkDXGJjBOmJYQAEUCiaPONwhLyD38Mr9bua/9jkIJnA6Hsudj6T5S1u8iJn6jlKRzHI1ppJCGXBc72dnbMs0SjuMR3Gqyoz5E09VvbWVFnjBYmEn90EA6RRlsaJ9qPpsnnsNXbKIYXuuErBkTmxyRQtGN8kEyNqOVzjkFU6BXrkYyJqSnwmNE+Ep9OrWlUOeLIidyJccCS1uesEd0ctZPp+8SmX8PCLyXFYm
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 02:35:22.9841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edab8750-f036-4883-059e-08df0964013e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6214

Add USB3 PHY binding and driver, Cadence USBSSP glue binding and
driver, and USB4/USB5 device tree nodes for the CIX Sky1 SoC.

This series adds support for the USB4 and USB5 controllers (based on
Cadence USBSSP DRD) found on the CIX Sky1 SoC, along with their
associated multi-port USB3 PHY.

The two wrapper nodes each carry two 4-byte register windows: these
are per-controller RCSU control/status registers (AXI cache attribute
and clock-status) that live inside the shared RCSU aperture, so they
cannot be expressed as a syscon; the OTG mode straps live in the S5
system control block and are referenced through the cix,usb-syscon
phandle.  This was discussed during review of v1 [1].

Changes in v3:

Device tree:
- Fix the interrupt specifiers of the usb4/usb5 child nodes: the Sky1
  GICv3 interrupt controller uses 4 cells, so add the missing fourth
  (empty) cell to every entry.  Without it the controller IRQs cannot
  be resolved (platform_get_irq_byname() returns -ENXIO).

USB3 PHY driver:
- Assert the hardware resets before registering the PHY provider, so a
  consumer cannot race with the probe-time assertion.
- Disable the clocks in LIFO order (ref before apb) in phy_exit().
- Reorder the error unroll path of phy_init() to assert the resets
  before disabling the clocks, matching the teardown sequence, and fix
  the goto targets so clocks that were never enabled are not disabled.
- Check fwnode_get_name() for NULL and only match "usb-port@" child
  nodes exactly, instead of any name with a "usb-port" or "USB" prefix.

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

[1] https://lore.kernel.org/linux-phy/20260902032306.1182941-1-hongliang.yang@cixtech.com/

Hongliang Yang (5):
  dt-bindings: phy: Add CIX Sky1 USB3 PHY
  dt-bindings: usb: Add CIX Sky1 USBSSP controller
  phy: cix: Add CIX Sky1 USB3 PHY driver
  usb: cdns3: Add CIX Sky1 glue driver
  arm64: dts: cix: Add USB4/USB5 nodes for Sky1

 .../bindings/phy/cix,sky1-usb3-phy.yaml       | 107 +++
 .../bindings/usb/cix,sky1-usbssp.yaml         | 137 ++++
 MAINTAINERS                                   |   3 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  54 ++
 arch/arm64/boot/dts/cix/sky1.dtsi             | 118 +++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/cix/Kconfig                       |  20 +
 drivers/phy/cix/Makefile                      |   6 +
 drivers/phy/cix/phy-cix-usb3.c                | 410 +++++++++++
 drivers/phy/cix/phy-cix-usbdp.h               | 310 ++++++++
 drivers/usb/cdns3/Kconfig                     |  13 +
 drivers/usb/cdns3/Makefile                    |   1 +
 drivers/usb/cdns3/cdnsp-sky1.c                | 696 ++++++++++++++++++
 drivers/usb/cdns3/cdnsp-sky1.h                | 127 ++++
 15 files changed, 2004 insertions(+)
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

