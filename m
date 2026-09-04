Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010008.outbound.protection.outlook.com [52.101.85.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DED3D2FE1;
	Fri,  4 Sep 2026 08:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512018; cv=fail; b=tREj5OILy/oqBUE7GHcS9MRgcJa9FxV1Bb9jd1xpsKNnE1ZqN5utQnjAoXFsAd9f6s9YBJTEn7yX0DLsBaR6f7Nv7y3DQoal/T01eO229dDnTgIdvALOhHFqnSpKJEnD2hZSC3G84tuP2slCZ6jlImlMCQyTfomHokJRY/PsCXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512018; c=relaxed/simple;
	bh=pkLh1zizyYZ96R0QzM68QTfg9uXFKUu1ruAvAz7qvpw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HEjnbkeCzCJyJ9vJ9aD+N0DE64MNPD56I20BxMTePgw14rQSffOaPP2kvN5rLSn3cS5A8TEkooFE7ytSX+tAXxtB+Fo+bpr+olF20s9K6SDcOwrabMRtSolxmgov22EvFid+SHQE7SJdZmU5FAJuUPehdKDk9RGMQBrd27yJ7xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=TXRSNba4; arc=fail smtp.client-ip=52.101.85.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="TXRSNba4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmKozGl47Uxiy+UttYZOLx/HDeOrwi7d39/BcYfPXT4gKeptbUubFtUCqw8l8If4oDcYNoy0yqtFHU4A/EZsMV98NwaUr5pKpg9AC+euBpnMOZ88vDExFoHNLqRDRYbB+w9ZW8msf59xiFy9EcR6NREz2R/mjvlYjLkmRm2WQndmW53Euj6pFxRShAeYJ9/EEEq2uG9J2NHc5hQp40cEABz+kjRnYNKCtIwiDwYrFiu6EHQ8RPpMeWOB130N4Ck4L5dqR9oG7nZNFvp5XBi6HV1NdLFBwrydibrtpCDf9gChcekFnW9ZUvjgLopXCeDAP7ZXbs7/POBgaPckg8JuFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMCiC8fgp+tdyqJCrvZEnmOnT560Wbr/5+zb0XtsfY4=;
 b=W+WMReT1cf3Os1MMpP6o+2hQHOB/mxNZ/Knnf4vaPIOAGX95cjDrew0d3qXr0hIzL7XCCtYIw65XWHo3rc7gFnWhrnxG2iKDVX81q+tYL2LqD/XVq4o+urWRJFK+6fGkDZQlv3JDRClergzuqrG/WJy0lWtMUlUIPY+ekBIy9xJw3b/JEVuxmQDwggM8bBCN764chf18am2FNseUXyAosiuh5KkexjggCL4afSgh4x9/KdSUULMZ8U+tjSKpNWE0Ym2S/O93t2lqS4zp7bVg8WgQ/+Kko7CuBQObye9qGfOwhDD2H910q0jbegsCEMLatckrxxN4jk/3K9QuIkFFGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMCiC8fgp+tdyqJCrvZEnmOnT560Wbr/5+zb0XtsfY4=;
 b=TXRSNba4eq4mG0fDTRKRc9O5VBPwtW0XO4x399dBmwa1zoGlJdYZJNet2Htu8RvnOepPZSExeOVlj+V46IKuCnOcvdAelsdG1CtB6qzUrR8f16QHArSw+Iczsgpv19gYxZR7cKI9iHk/QWPh6z2fifUrOCBL7ivXPtsbf9a1UNCPoTLraXWSiDc7ORSiWEwc6Icuh3DfDhCPDN9ibNnshGqdtrdKglfUpJNbJP4FCyCdKBnYX98oFZVV8YrqlPTLCwYVwAD/uyOt9IgrFQRCO83xjp4JQ6CbX5TSuroR3dW/+Sy6PtiJSpKygLMtdtT5Q4ftPjqaQapNQmkYtjvTmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Fri, 4 Sep 2026 08:53:33 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 08:53:33 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v4 0/4] Add USB3.1 support for Agilex5
Date: Fri,  4 Sep 2026 16:46:09 +0800
Message-ID: <cover.1788503540.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|DM4PR03MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: 742b23f2-0f41-4c61-5cc7-08df0a620022
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|3023799007|10067099003|6133799003|56012099006|11063799006|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2vamXDEYPC40jJ8TIQNRhUxa6IrYzyUIPYoe1dNCl9gHm5R1OrR8RmyENP5Cb93+MuiGdSpvCoyZZKbNeh4PgDpaO7TgHlDaxQFCerzvU7d3U7w4qiFiksWapB2NkcxQnjxdN1N6MqaBd48r4I+8nUgv7t+ZPRQ9vaEhJsJPRQOYAGy50WWEV8xVH+zLRdvmLPq00yqgZqZL4GAyAv8rKtxTz2KKyeDW005ULQN3Z6sWFp5SPw5K6cy844L6JG4TXUcSlOmIrN7TaU4ESzZOyVitjoAuWDphZC9KWunfRHx5MxUbrnkdtaOofXUd9PUHFBixzj/h/xHN2ddLfCbXNDRJfQPrj3C3Q3hBXdv8B1jjh+sF9n9Vrh0gpbgw86D/kRy9YD3calVRc/AwFBKIBzZd14zF0ZnTL1QSl8oMNpxArVQEckk4M/lyPr1yUnRbowNA6XTHrvJHQBmathWtc5Ce+n0I8e7FqQj4OkjEV27HqSH576og2Xg139cUBS6HTRzwCLoNNX6r7QURkBcbNf6Dl3cTTJr1uIfrqhEdEgpYf/v6GFQqu4XlwGgEtyjXhefd7NPj+ng7y6I+ALIUyBQocXXLqSGpyy+724n4LwwlIrqiTpbyqCVjw3HMmsmE+T49I/iy1aRIgVLXvGpIKCI56rK3J2b0zoXEkIrxQME=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(3023799007)(10067099003)(6133799003)(56012099006)(11063799006)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y7HdsH9ntlhgLFksgxDr+dwUMX2YDcGoPs28lxOq5DA7TgS5SAsJoW7IIHJZ?=
 =?us-ascii?Q?Wi+TFEdCMYwLhZZw4EJqXjxTIWuddSW52WizDDSOYBvZUkJPF5Mg1aga74/v?=
 =?us-ascii?Q?j/eH9ZIuVxb9pP7y7b3TZBvCF/qTBKnmTBAH9EkCVh65m0Yb6WtWgOuXyEes?=
 =?us-ascii?Q?EE8aFMSJ+Crnt2qc8E3jjlc50bFayPJrnvj/AGoupSoqvR3KwZ68wPCS5HyV?=
 =?us-ascii?Q?YmeVjSjXORfL/vpYP6VdMGwzY1yBRm9EKJGRPjCL3Qfdbud/InLr8JnC+EHU?=
 =?us-ascii?Q?R6CD7X5hWpE1HFkOnxVVg1mEDutObnn6edD47iXOkXOJ7S9V9EDSe9AExxYI?=
 =?us-ascii?Q?Bn6tANwKHrmBfqMzPsl+3Pq2W09W0orLamIgPyjpI697WlVlSZQAYVh9Knje?=
 =?us-ascii?Q?M/pMIQHbUUe/zlnEt535jMyUxxB+lRcw+3Yy+q6/V1eZxptf2bU+/1XUU2L/?=
 =?us-ascii?Q?Bp4Mhyb3kqW72oUIkGIfSpqQ4l9xHM20eZbOphJ5P7JMtni/G1bqKFTKeVPo?=
 =?us-ascii?Q?a3s/0POK+qO09mHV7et7BgCAu33LVl5fUo/gGsleANkpSDivgyjJLxhlTtQY?=
 =?us-ascii?Q?ZqxKlxJLIy9H43wCFxG4VYvUjeYILOWB0uRK/JDP81Il+2laQn4mFJnNTsvn?=
 =?us-ascii?Q?Za5knuBfFqDLGNgLXVBDwmQz9fhnyh+P5EoYjVVxklY2hdjuB4B/AqCG+2XZ?=
 =?us-ascii?Q?H9K4dR2kV5088IpBWIRTtQlixXcawH13RnLffipRvr2UN4MzRK+pdujOM6xy?=
 =?us-ascii?Q?uYMFXesToc8nRIkzMia3d1B46fCwh1gTvB0w0aJw1PmMAhc0ygjjjTPciTGX?=
 =?us-ascii?Q?QutdG7pEyQQyZaifZAN2QODIgAEf4f+qCxYZwvnmeB8gg1qC83wMNHN7qPMc?=
 =?us-ascii?Q?QCoUArCcwBWilAZLTV5DaLv+qTrk+U/NpM+xH69U69knALHYhaoAK1ptRj7I?=
 =?us-ascii?Q?VxJmt7Y/AsDqmxsYKXb56t+JxG8ugvJM9Pa1s7Vg1QJZfvlBnBCBniI81VaM?=
 =?us-ascii?Q?JG1XVP30pJ3qKRpdJXU4OFt0vdqnf2GnrJWwqpjYds8qvuRu8zODw8Rn3PJo?=
 =?us-ascii?Q?lbJyW2o6jVfFwB+4Dw1RKmhq2ezQV3uFcGK0MbnEfGOQ9HHeK00I0Q/I1r4Q?=
 =?us-ascii?Q?KhMEPgGuSZEA9fm2hmekOkdb22n+Zn8DANo7u+Yv6oK5poC+uQdydftLbcM/?=
 =?us-ascii?Q?I9/lzoYdM+POGIp5ygLb9V68VCepBiDVjfzZPeUEZc5rp9/CsLHEiWvvPQd3?=
 =?us-ascii?Q?oJcQ6KNHyPFBuGRQmv3ViJZS5cd4xCmsWYGth9bhwNysJDrm/xQhQ+8Gv1mX?=
 =?us-ascii?Q?FoaJtWA7TisUOZHc1rBHC0JI/2vIUusaFqqrmcvEJDVB8cjP98OnY67ZbYJa?=
 =?us-ascii?Q?cWqdurIrGUfe4xRZKRTxkgFKHUYDzMzMbMaBPrfMWufFOqFYq7n2OY6oKUwg?=
 =?us-ascii?Q?HcRcww2fetwinZDmWPk+/zNIT6RK04d9JDagcmAy7PxPvwAg6wQX/3xyUMoo?=
 =?us-ascii?Q?3GKncYtVuRqnWuWCsqO4uV0onY3zuRmwmB5zUCsh9oI7kucxXw3rwkwoSKuw?=
 =?us-ascii?Q?c7GlUiBXp2zQJjNxgCXq9aXBoCnnpIWmSDF1pmoYTLVx3hjgoTwzuvuvoj+o?=
 =?us-ascii?Q?eOS0ZVixzhSUQg2UCau7G5D8yc/AIJhYnVYox/QrNt7WhJSYqG5w3pFKf6e9?=
 =?us-ascii?Q?KKcRaKk1LlWb2gVW15UlHjePXmq7FhMvgSGEU0xTGpfum2heAXzL5yJGpjyY?=
 =?us-ascii?Q?48PeiaIHJcwdq94KHn4lZWSaBIerI5k=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 742b23f2-0f41-4c61-5cc7-08df0a620022
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 08:53:33.6768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fs8HYIIJkGZ9G7Njmaz2yBRsD3OPSxP+bE+8Oa1E0MelyYkRR6V3Q1sRqK4JD/nednlcwzU6IO0d2eGPslx9CLLQtCs+Ml+yRB5qRoQGca4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5981

Agilex5 integrates a Synopsys DesignWare USB3 controller via a
SoC-specific wrapper that requires dedicated clock, reset, PHY, and
optional SMMU integration. The USB DMA path on the interconnect is
limited to a 40-bit address width.

This series adds a device tree binding for the Agilex5 DWC3 controller and
introduces the corresponding USB3.1 node in the Agilex5 SoC and SoCDK
device trees. The controller is placed under a simple-bus with a 40-bit
dma-ranges window so the DMA/IOMMU stack respects the interconnect address
width when SMMU is enabled. As the SoCDK only exposes the USB3.1 interface,
the unused USB0 node is removed.

On this SoC the DWC3 "ref" and "suspend" inputs share the same hardware
clock source, so both clock phandles use the already published
AGILEX5_USB31_SUSPEND_CLK ID (no new clock binding ID).

Finally, the Agilex5 compatible string is added to the dwc3 generic
platform driver so the controller can probe through that glue driver.

Merging:
- Patches 1 and 4 (dt-bindings + dwc3-generic-plat): USB tree
- Patches 2 and 3 (arm64 dts): SoC / arm64 dts tree (or taken with the
  USB series if preferred, with an appropriate Ack)
---
changelog:
v3->v4:
* Drop dt-bindings/clock and clk driver patches; do not extend the
  published Agilex5 clock binding. Reuse AGILEX5_USB31_SUSPEND_CLK for
  both "ref" and "suspend" clock inputs.
* Fix usb31_bus dma-ranges cell layout (sashiko comment): use 
  #address-cells = <2> and a Stingray-style 40-bit dma-ranges window
  instead of a 32-bit child address space with a truncated 1 TiB size.
* Update altr,agilex5-dwc3.yaml per review: drop obvious reg/resets
  descriptions, order clock-names as bus_early/ref/suspend (matching
  snps,dwc3.yaml), and rename reset-names to core/ecc.
* Limit the series to USB binding, DTS, and dwc3-generic-plat (no clk
  subsystem patches in the same series).
v3 patch link:
https://lore.kernel.org/all/cover.1786518803.git.adrian.ho.yin.ng@altera.com/

v2->v3:
* Add the missing USB3.1 reference clock ID and register usb31_ref_clk
  as a fixed-factor clock in the Agilex5 clock driver.
* Drop dma_addressable_bits core/glue changes; describe the 40-bit DMA
  limit in DT with dma-ranges instead.
* Wrap the USB3.1 node in a simple-bus with a 40-bit dma-ranges window.
* Keep Agilex5 support in dwc3-generic-plat as a compatible match only
  (no platform-specific DMA mask override).

v2 patch link:
https://lore.kernel.org/all/cover.1765249127.git.adrianhoyin.ng@altera.com/

v1->v2:
* Update new binding name to match compatible.
* Update binding to use single node instead of parent child node structure.
* Update binding according to comments from maintainer.
* Split USB3 and USB2 changes in dts into separate commits.
* Update to use flattened model and use dwc3-generic-plat driver instead of
  dwc3-of-simple driver.
* Add dma_addressable_bits as a dwc3 property which is set by the glue driver
  which is used to configure the dma mask in the core driver.

v1 patch link:
https://lore.kernel.org/all/cover.1762839776.git.adrianhoyin.ng@altera.com/
---

Adrian Ng Ho Yin (4):
  dt-bindings: usb: add Altera Agilex5 DWC3 controller
  arm64: dts: intel: agilex5: add USB3.1 controller node
  arm64: dts: intel: agilex5: remove usb0 in Agilex5 SoCDK
  usb: dwc3: add Altera Agilex5 support to generic platform driver

 .../bindings/usb/altr,agilex5-dwc3.yaml       | 100 ++++++++++++++++++
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi |  35 ++++++
 .../boot/dts/intel/socfpga_agilex5_socdk.dts  |   4 +-
 drivers/usb/dwc3/dwc3-generic-plat.c          |   1 +
 4 files changed, 138 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml

-- 
2.49.GIT

