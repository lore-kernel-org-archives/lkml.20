Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.83
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794366584;
	b=pmHJapdarGMJTPg8pKWl8E4UyFn/W7p2sQWwluosmerJzHg5KzCshhV1/HVYTLaZvkVA
	 8Ej6w9+E5C8x9a2SUX1WEWZnFa39oaioNM/W74LXh5ngsVE0t49SitDWHySwN4aMa6BPT
	 xT2ObDH2QeketyENV+IMXTMRqHHbFAmLdkS1WdeP3FZVHIrv6oDwuTLXviypFLOYtlm8n
	 kLWPdA45z7Oo5sQCDCrSNwMliRmPfeYBWVyErjFKH4Pev8QvKt4vpAprRlSRzlEFRna7n
	 y/RPweSH5X/BsBjRkeVv60h/UxwoGULN60KmCQTDba0sjJuZsf1KBvcYJn29X95agIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366584;
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
	bh=H0oMVZx9MZWX6ntUtJC0bPYKAaeS+PeC0KGyJrD45TM=;
	b=zIlhBHytecmvbjauYObar8vI78T0Dcn7Ec5OgZhcMeNOBP4V4oPf4GDj84Sg8Tj0fGRH
	 7SziVMQpNoFHunLnztcPisPsgvS/ldhPPrC9QcY4183pQpQFoL7MQtRkh/GaYsj5tyYzc
	 zoj6nUoQRGlLAYe3XIXf6ytwoVWxpXEi7Zias2C01VXNt+V4lnjqWpwI/cICZB21VlVhn
	 bzC4mVTkGgGiCHNvJZcqA+ZvtmndXgBqiWzxF4U9OueBBsmoqq7ZTolORfYtNVLIyiy5B
	 T4IogugGLqdYG6ATBi95r9ixpEiXOe5zqFR2pQuVguKXui/mxHqFM/Yc54dxY/ny68A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.83
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023083.outbound.protection.outlook.com [40.107.44.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E28606A320;
	Wed, 11 Nov 2026 03:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05E28606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdlJEAD2Y2/gfgnszqfRX4dY3HXx3jI0T9RQOAcXfH0vgzILmmbKvEBdVjs3hvynAn9ZAalI8yM9veGboVyyou0161w+g1zt8Pu63m/IgnF9Ku/39BTNqcbA17cgrdSz4LP1ZkA0Gq3ORIzNTJCWuykIJf6Lvv1RmUh+6HjpqHZvvTXEZ2JVaQPv9hHNMl7Fo88wkHjScLwqQnqEA0b/vP90R1F5ut4tG02wtvVoVHAtWDNTiC8/slJdiODJnaYdbCE410SKIqvkYL7JVUs/XLqGQIezZkuSkpr/QRWFxIiOtCF7xgC0tyn1MecoA0UjW18+8bDdDuzokZlfxEjBnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0oMVZx9MZWX6ntUtJC0bPYKAaeS+PeC0KGyJrD45TM=;
 b=HBGohD8iYLP7fRlQO6OJFsbIoDgTtBJZ0Tdi2sRk5ycZ9k9IfJO2MAhDxbwyjKh+b5oBB4d+Iv8E/8G2HjY1raWIuW3ThEJES82mwY5FIjZlJbOfwJjJ0Iu96EL1uvgDxIDzkkzuzTTN+EiOj9tsJoGfF7piGV51HPKP5sth/YmWZQUTX/RA/2Oyej6sBGgTLttFZNSgqhwztauqUlz33nLZHiJBMbN65eQ4EoVtcGJExdTrJBAUYDFAZ0yvwSQsAz6q+1IFuLJ4+1ZHsg87JRoZNU0YZx2yVEF4AGi17sJKkfo7PLndp6RpoXbWiPTxgXk5GRm72x/5SEc8jKMupw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUVP216CA0019.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16e::17)
 by SETPR06MB9048.apcprd06.prod.outlook.com (2603:1096:101:317::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 03:09:40 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:301:16e:cafe::88) by PUVP216CA0019.outlook.office365.com
 (2603:1096:301:16e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 03:09:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 03:09:39 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4CB354102E64;
	Wed, 11 Nov 2026 11:09:38 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Gary Yang <Gary.Yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Hongliang Yang <hongliang.yang@cixtech.com>
Subject: [PATCH v7 0/2] phy: Add CIX Sky1 USB3 PHY support
Date: Wed, 11 Nov 2026 11:09:35 +0800
Message-ID: <20261111030937.2954646-1-hongliang.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|SETPR06MB9048:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6f58bc8e-d2ee-4d79-d596-08df3fa1398b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|1800799024|376014|18002099003|6133799003|10067099003|3023799007|5023799004|261102130727099003|261102123227099003|261026121527099003|261028144727099003|261022105027099003|261021121427099003|56012099006|261022075727099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	EdMTohlEnpLOeMa8gNjMjIZ1esWCCQHgLuQI0wdp0vsKJ/8A8DmqGJ2R+b1RbURqiBabEXswFWMryvXPoS1FoRuOsLAm6Z518K/kkCpEuO9g/V1jdgx9SXGoc1JfCaQiQwNddiZa8dx+5TV9tIG/MVEvFVKZxxp8ExgQhBK+TirFAhhosuWO2qV9SwXjPZx22CmRbaXBxNjV07drkhNqb1Kt4Sp7obLxdUrJbFpHc+vFrfTcUihoZ7HoS9Q7uw9jbmQppD4Rk11CPkXyyq+dIQ6vifXd9hpJ2mN9kul7orDDjCGSViqCLe+eU64LzZUmjDY9Wn1aUwUmWRMHstG86xV/y3IMW2Su3F8GPqjk2ZRt8i/aqV40qdAsSUSZ/vGHff4mqXM+6FNSAlsBBmV5lMi0wsyY1RZGWfXfd0uuHeA39xYl3ZGKs76dBfCs7o/x6m+cmPUoV3HhLAJ2pvVpWh8yfxJfN6B+Np2LFykRql3w+mS3nvnIwgUZrV+Uj+kT6wM42dQY6UX9qjxOOLMppgWsa9Qf+X/y5/gLRh/uoMsHlF9/6I6tSJzo0m3Oh0ynMvk38Vs50lPeTARoZYtq7LdYACnh9TG6ZPI5wA7GJ0rRMt8aUUG4p+wFntRQpDsc7G6JNGuVaRcQfLeb0yy7nWjWQ2OL5HlgTlrqp/INUn1yES5SJsCdm3KWilIvK7L81H1BHQ2LKSPjB167h6uAfg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(1800799024)(376014)(18002099003)(6133799003)(10067099003)(3023799007)(5023799004)(261102130727099003)(261102123227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261021121427099003)(56012099006)(261022075727099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i8vWABVI1eOwyXuvMK4paE7hJdSdqxEjighTvZnnGsMA+cNRhEIRbwkKIOEC+Vlm8SN/xpCglgc2t0hWOCoPzGoadVtdAdJR77x03MD5GLpIcW2g3TbZU0twCmgGYcvueUtpVQ/Dtnt6cG6IsDdHaKO3M+bGz8MtJSi4sEATVtlg9P8nUHHtr7eHTzqXXV8tywIP19mNWLeyIyAm4D3/UO0i5w8yjfvLcRu8I+okWXKyHTcMc6CZKw8JlrJq297NgKxfTbQFwL8HTcHHJR1ludeg7se5RN3rW3XRMksaY7Ym3tDj8sB3Ktp5bS9AcK4DNKqYu4lxfuX0R/OpYwAQI9mRE5VlSPhDJD8ZZ3zhqxLwdzDajjih/KTIWEge+MLnyOLprkcWY0oHFKf8eKM8UCu5G5hC5XQdmI0LXYsY3k2A1LHtdxgD+DGDlZOlok0C
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 03:09:39.5449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f58bc8e-d2ee-4d79-d596-08df3fa1398b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SETPR06MB9048

This series adds support for the USB3 PHY integrated in the CIX Sky1
SoC: the device tree binding and the PHY driver. It is a PHY series
only; the arm64 device tree nodes belong to the SoC subsystem and will
be sent separately once the binding is accepted. The PHY and the
USBSSP controller series were split in v4 and are posted independently.

The PHY provides the SuperSpeed lanes for the two USB3 Type-A (USB4
and USB5) Cadence USBSSP controllers of the SoC. There is one PHY
block with two lanes: they share one register block, the same clocks
and resets, and one initialization sequence, so the binding describes
the block as a single provider with #phy-cells = <0> and both
controllers reference the same phandle. The driver reference counts
phy_init() and phy_exit() accordingly.

v5 described one child node per lane. v6 collapsed them into the parent
node, but nothing in the binding or in the changelog said where the
second lane went. The second lane did not go anywhere: it is the second
lane of the same block and has no registers, clocks or resets of its
own. The binding description and the commit message now say that.

Tested on Radxa Orion O6 (Sky1) together with the USBSSP controller
series: the PHY probes and USB 3.x devices enumerate at SuperSpeed. The
series applies on top of v7.4-rc1.

Changes in v7:
- Removed the arm64 dts from the series; it is a separate SoC patchset.
- Describe the two lanes as one PHY provider and say why, instead of
  dropping the per-lane child nodes without an explanation.
- Renamed the register header to phy-cix-usb3.h: it holds the register
  map of the USB3 PHY, and the usbdp name suggested a USB/DP combo PHY.
- Fixed the module description and the Kconfig help text.

Changes in v6:
- Dropped the per-port child nodes; the PHY node itself is the provider
  with #phy-cells = <0> and the driver exports a single PHY instance
  shared by both controllers.
- Selected REGMAP in the PHY Kconfig.
- Used dev_err_probe() for the reset, clock and regmap acquisition
  failures in the probe path.

Hongliang Yang (2):
  dt-bindings: phy: Add CIX Sky1 USB3 PHY
  phy: cix: Add CIX Sky1 USB3 PHY driver

 .../bindings/phy/cix,sky1-usb3-phy.yaml       |  78 ++++
 MAINTAINERS                                   |   2 +
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/cix/Kconfig                       |  21 +
 drivers/phy/cix/Makefile                      |   6 +
 drivers/phy/cix/phy-cix-usb3.c                | 404 ++++++++++++++++++
 drivers/phy/cix/phy-cix-usb3.h                | 289 +++++++++++++
 8 files changed, 802 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
 create mode 100644 drivers/phy/cix/Kconfig
 create mode 100644 drivers/phy/cix/Makefile
 create mode 100644 drivers/phy/cix/phy-cix-usb3.c
 create mode 100644 drivers/phy/cix/phy-cix-usb3.h

--
2.54.0

