Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010020.outbound.protection.outlook.com [40.93.198.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B18550DB8;
	Tue,  8 Sep 2026 17:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887534; cv=fail; b=Nqt4huxf+LvSZhyI9cA4/dIz40qJog+EM+QUrwRBTesbzFIZWDIfV3s127tu0tfkfBmPiknEP8piT5v9lJwxY2lCqvUGYezy+MrWy6nNujqG58ghQMespcwOqG1O2/1zZxQ5z8aPQkBj/QKf0tFdj32EJ2iF+3aroGTyOv4XGdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887534; c=relaxed/simple;
	bh=En58L+sFchxkbbaln9ua9ZAPdeJEtZmBjwn7rSTBATY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=S4RVJlo0WIogrsbcmxbMLrWPZaFBHaCxRQi50XPP8jT8MosHTe9e6fw/Po4abe7sp97S86lzHl7sWBfGCUSvENzDHEZWI2urYcBkpKxFV+p/TFkpgHy4FTRW/RdkQSaOqpiJw6yJjjZgt9FTEDwH5YR/KZz7yECQZIrGU6KVkOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=W4H9j0Zr; arc=fail smtp.client-ip=40.93.198.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="W4H9j0Zr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5DPE06o7OE8Rv1AlKSL3lcHZFUnby8pNDX4QFcEK6zGyrQ0bEhxNXaI3MpsHe3rsf8Haa+2bXTUfq8y5yqSD1IagzOmhN/IdPX5FPhySu6zo14gpIg2SrLpH/ft84akL2i8j3G6mCIPG7PNfcupFcREN9maiJjOCz+PHAWN8qjx/vqDbzHtxv6xa2FjGQ9OUu+ymSu2237ST1gFF7CQC5T7EUgaDU6St1tAqiV/xYORpIxKU3/Gtz/7UDJHU+jehgdrZRnWDmJPvABwPSslv5vzsX8xL5pMDI/d/9wsZcCCzCH80KwCnZXw5Fpgch3FP4Ni8swgcdNZcDyFK0cR2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lt9nlLmJOi252GVaEj5ROTgNEYAZu2l58euHP8ulZGk=;
 b=SuvkyFsrXM3YMflfaV08dFkylv4kz9mYs69TD6nm4DOK5TaY6wC25qf5I69+GK6OLyq66qmRDVe+vcsXAIT2huZJ2uKD/Q+PqdFGniqONn8gEsOXZmRBEPyQsqIRg11toYJkQ7Qhh7OUQT0Am47p/rDyPP184g9JC2IfrUqWCY+wpBIEc1mqY6YFtSL6VbojMqYOkUodHRerLcOq1aKd7S0A2QI9FizW5NPVxZGb0GzwkmLPAuXcTHnTDZZlRL4XuRobOcMnRZ8viDLwisPLfzGisFfsYae6Aimgd14+DeOg31sN80HUr5JGHB43uWA8UpcDsnufr/bDWeyGAwfi5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt9nlLmJOi252GVaEj5ROTgNEYAZu2l58euHP8ulZGk=;
 b=W4H9j0ZrhracoJrHwYzsLq21TmjL+VVtmF9ssKIo1G4H4EcWdnuhXOa3Q6TsWAhkFj3nN7TIRsDgbso3g4lDV7SIw/7ByUnFNNwLMHvgLfvg42hffPYGvT0bORa85FVBCUcH8XxIF+wlOk5TB8z/o7W/6qEYvzgT+S6T7gvC9RiZzxeP+C1BLVpOW5SyrVaJtFMerZbTbIjW2OtQu3jfVn6gqmfJDzoOH3ezyyG80TFBw+DM7ZTH7wlJaMnOKlZJUCQqddGs/Pp0S+ujHyCEI0S2GbUvbLi1b3oLsXmCAYPLVlZzroNUtKXdftl4UgYwlAo21Ddk4Ml5nkNAv+127A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 PH0PR03MB6560.namprd03.prod.outlook.com (2603:10b6:510:b2::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.7; Tue, 8 Sep 2026 17:12:07 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 17:12:07 +0000
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
Subject: [PATCH v6 0/4] Add USB3.1 support for Agilex5
Date: Wed,  9 Sep 2026 01:04:36 +0800
Message-ID: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:295::11) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|PH0PR03MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e82a80-fc85-4270-cf31-08df0dcc4fbb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|6133799003|3023799007|56012099006|11063799006|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	iTFlCN85LTKcL+Uz27SqC9mc2pbNsj3RhoTn38JC8FeIV/vfA6LOFxn/W4fbbsITUzVcQ95hf42q2oGRFPgvzjiHqj0fFyasrYZsOhlMqhBnimEJPintx+QDFOsNK51ygY+I4KQh+m8lsh7XLMC1v8mNQfkaqgQ879rlRQBbpOGzTaof3a0RwjfXFOKHSQzj7urK3dulRaetN/RoFNogfZcPrSubUjAsmIpvMli573A4kSg104iVN9ABXWyWoVuUNeoOhMLkh4UU6+FvX/S/iEXEkUtzrCle+43b1gPfAzdpyPEMx3RjY5Ylz4GVPYuAiYXcwT+2iQlStVtCrnhjy125Z4OaS4jR3C1xvciQEMa8weiKIzvVAu5oAQhtNXrPRL+A8tLQ9SqqfVZoj/bj5T0rl3/RzU7LFagju6uwj7lyDvjWt//vTWP1N0IBUEDmo/7aayFk+jNCpfdBPcxV9Djyo7GX91iK3LJTroiLfPPHTXpNrUG5aM64Uua6Fbyi/qYUscYLUPZX2+ZwfWiMiyxSwNvZP6RBBWT/kDDMxoYPHoUiPVsCF8rNTDofo8uTutI/xPjxLgt/Q1gKe4Pj3Ohu9FxemDdQR8AYUYU2/m/k2LXaRV4SpOJbqrXrYfFKE+XtZj/e0lOK8vMLG57Br3tE5kSqLTXxnomK6sgrPPE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(3023799007)(56012099006)(11063799006)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rtO5nz5ymNAXgCPxvUO6UrX6gJdo9Mp8hx+kpHNtp+dlAFM9mwNYx2uWAl3g?=
 =?us-ascii?Q?q7K41vwbm3LwxkaSu8V/HsQ5x2O1daEkBTj92tz+uU+Zy2U3/KEMHW0Qnaub?=
 =?us-ascii?Q?4P4CGhtnvjqWsYZKuKN1xPtsbI76kZjH77yY1NOB6Ees7ywNjNZn4oySVAHV?=
 =?us-ascii?Q?frfbsCnUeC1l4QmvrT5hWs1heJWh2N9DWhIIn8McgqJAueAFdB+iNBJPQbIN?=
 =?us-ascii?Q?t0IvkhEoz4Is8Ev/ZOFflSUm5M1MaSVKjoQtFluhrb+H4JgzKKvZ++o4Hhmi?=
 =?us-ascii?Q?hOKgp5Q5yR7yFUXP2on8OqynlZ52YZsv4w6pEkqpMFRzlkOcUaRXuzwkWCp+?=
 =?us-ascii?Q?5PWqao2+P8/U21WiQukA00oGtEMBOgHquk9LoeJoDEPQCsOs8cfNuu4QS5f2?=
 =?us-ascii?Q?XPDVpdLFc+Vi2qq8gUS5S/Q3Qfv9rv4k6Y26YEVJS9cZDHv2rRWvY7DnRU/j?=
 =?us-ascii?Q?rdwdwJQqCGhj4oPpvZ83HgXlnjpgHVvPEry0Mvsy2s7oO2dXO+CpFdVuV7B/?=
 =?us-ascii?Q?IDopSPpi1GacsxlZ/T840Tfmd5YPuItG/f5Z7ahGHR7yrepKxMDHI2/DFwuZ?=
 =?us-ascii?Q?QSM+XLInEKk5pnlcENtQIHGtzvbkbTabJ1PTR7Xk/eQ9zu7pKR1hF41vJ5A8?=
 =?us-ascii?Q?t9IBw9t1dfyTXke2t2VielvwPR/RhAy5wLgr8hZcvfcu37R1XHmTv7WkO67J?=
 =?us-ascii?Q?RSsQCrr8Nl3ipdjrrJtP2sRRb8ion41SgetYLuFDVv+iRsysl5Sws+LVR1SO?=
 =?us-ascii?Q?PbajbYaNKZ1iIXsIgOlp42KxLYa1dKRa3Z5JHW1QgZUM8qby7skqVt6lW8ig?=
 =?us-ascii?Q?ILpjVycOl096k4+ma9IuvXzcLJytgS2eyRjqD08rtNBt6nsdaozjjiALyTMI?=
 =?us-ascii?Q?NONYB/WXiRY4EQf8LSzNyol8fSJZo9ZqGJS5WLO6oage2j6x6UnxTod6yhi9?=
 =?us-ascii?Q?acGt/TOvgeqkiR5HfNKJMMqEjMfOERofH2FYI/zpveK8PHnqmGB/iFIEJBdU?=
 =?us-ascii?Q?DTnI6DY/7hszO53e2Pb8hDWQyKBmmkschgBZ2uldvHqZ6vbjqxI9ejr9rt54?=
 =?us-ascii?Q?ZJ1HSe94ODIbTafJAI1pLNsjPe0c17glp7L3V/LsRGteaUpPraGefWyy/cbo?=
 =?us-ascii?Q?eOyRcObMIDc79sdTsHQGlHzXVVVITVLr6leHSgqbc5MDaltwMXPcARz2Q5S+?=
 =?us-ascii?Q?kda4gC2W7i0FxVRVQSfG+dMctgdyO4zv37kNUDa13lEMry1uPV3ZvWmSYCaB?=
 =?us-ascii?Q?0/Kd4qz3k+T/bMy/PuOrjWqNsCPDj3uVNCpYDh79TRvsMSH1Q1mF/9hwiEhL?=
 =?us-ascii?Q?0BW/ITobKizw19nCmLXA14mz+zIlZTbF57PV4thsaVIWP/5K1cBjQJ8IutYm?=
 =?us-ascii?Q?CHoJd06/KU+AtHI3b/j4QX+Yh05aFcKCeTUhhVA3ATOthJvsLN2uCqfZbZd2?=
 =?us-ascii?Q?mZ73iY4I1OFo7b3m+9a214flHQE4ue6rk+jmtMILLEGnGsdjKFY8mSHWJjpe?=
 =?us-ascii?Q?CmB0OfAcTaDHnGs1wnl7QVqFu8YvdNCWS0yR80le1AcxaKxzjUpK7wXK4TR7?=
 =?us-ascii?Q?xaKYjjfkuQmBxaQl0uDRHQA/Y2FqaMKPQQhhZs47hTSHVtMieC9ll14/nKZO?=
 =?us-ascii?Q?iKSqtY6eRCoh49RrQayapYINsX4Pi196EMSKHumsSk+mEdidD+ovsCcYzWdT?=
 =?us-ascii?Q?SLy/O6qzfTt1dNisSvRhTF3mom9jz9AMQ27sAbCwkST/3aZSVI5cziAXhrQM?=
 =?us-ascii?Q?x4hZcF7Dk7QTjL00GNwamjSgiMw1mJo=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e82a80-fc85-4270-cf31-08df0dcc4fbb
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 17:12:07.3639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kp0q4yqs6M2cFZxvOaeInhaRK5++68UekTXZGO0DXN8lvSCG2FfML6fy9BN9VGCOjHmMtL1bW0PQqzuCvBlmJOfiUk5Sutx5w0r+A+sKJAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6560

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
v5->v6:
* Make snps,dis_u2_susphy_quirk and snps,dis_u3_susphy_quirk required.
  There is only one DWC3 instance on Agilex5 and both quirks are used
  on that node.

v5 patch link:
https://lore.kernel.org/all/cover.1788757821.git.adrian.ho.yin.ng@altera.com/

v4->v5:
* Binding: replace unevaluatedProperties: false with additionalProperties:
  false, and allow only the extra DWC3 properties used on this SoC via
  "foo: true" (dr_mode, maximum-speed, snps,dis_u2_susphy_quirk,
  snps,dis_u3_susphy_quirk).

v4 patch link:
https://lore.kernel.org/all/cover.1788503540.git.adrian.ho.yin.ng@altera.com/

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

 .../bindings/usb/altr,agilex5-dwc3.yaml       | 112 ++++++++++++++++++
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi |  35 ++++++
 .../boot/dts/intel/socfpga_agilex5_socdk.dts  |   4 +-
 drivers/usb/dwc3/dwc3-generic-plat.c          |   1 +
 4 files changed, 150 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml

-- 
2.49.GIT
