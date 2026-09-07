Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011025.outbound.protection.outlook.com [40.93.194.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD1C3F1058;
	Mon,  7 Sep 2026 08:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769755; cv=fail; b=MdCQwA2wv43juqjzCywYNCUvqEBNNQ8KmIzXFGEWxIqZxHhysPyNipXQyQcdEW71iUtma/wqExwbdy1cvhBN7Xh9Bssw7Kf8+MSb2VSEHZoWtizPc+l+K/UCwroRR1VzkQRCBtdQX4UjjivYAHP7e8jqgrCL1m7F3tTSPMDW5Ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769755; c=relaxed/simple;
	bh=iNqCSvEkMbj81Nr91H5ty3VqVEUDZjdPPx1wlTSxaQs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BO9QuXV05QW4CXU4nNb/O6T4GGqFE00bKxvfPYOiJumptLJ7Tu1XdTfR2HMVOOUzCQ/Cp5OglWu8NRN4PLS+YRbIg9fDqWY46JBURurP12Uz5iXVI2zoDkDvupr7M2baFb3lz7Rev2WzF5vcEFFXJInjgA6Vcafaxb0R4UV6mMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Ybnwm3RI; arc=fail smtp.client-ip=40.93.194.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Ybnwm3RI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eo+MDgJN//yFBcnWyhDV1UM6fOJAHnbLI+NDf24xekRfh3TAalTOHHuIAHyI/PWEeffvWEgTcapYLhJMNSoKtKYbAWfwFabtEdVhvvuc5OOZwK95x+y88ZgEyH0Pg39l7ohLSVKi1i6iQNyybSSEv9zI/7w6+BMMH3lTU+Z/vppPdB8Jjk+suiJXcgmo2qZUZDbGCQrgw7gZgWZScmQHV4p0klBiHaa81rKbSuODEeQrLFxp1RUh7jVpdeSa64EWOM4/9DbYJPiPe8gHfLC8BbX2dJjHuC1lC+1tFXym+PD3gSF2vTIqqvRYKcs204G1MYyx+5O7XeENdHyGRd6CtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veX5szjRvZOPkixH7RCOpAU43ytdmZ7zDBoUIuJ2PRo=;
 b=FOTGp1my+ftZQPkcquEqKxJjl4lZXFPC81ziLL6KzbMcZDVkkC2h598t02x7YBoJR8g67ZBuTFUyki5X4gHI+bqwPovZA3+uXutK4rZBMO+TCu6yydur6JAN3DKdEJQKHnxSuIro8Q5M3Eboq10Vne41hVoO4FNQ1Z2Y3ip5K8cg/g3HVYIsPs54r99TTb8dokon9Jhjzsx6vzVO8mNP3OXVm51mU37sZ0mO+oAJXOjFeB+nTm7sWL0I6EyX+KR74wbs7tzxjg9ieSgYWtfONKsQ4X+VTypl0kxucqVasTsY0Sw3n6ReKtJxYLFJQRmBAzKiHLAKoV9eyWfTfHxRFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veX5szjRvZOPkixH7RCOpAU43ytdmZ7zDBoUIuJ2PRo=;
 b=Ybnwm3RI2hQbd6Os0D838NlRJ+Bxsgd2UxgE0BqymWddY6e4XXbKOXLqLklAEVk+IRW6U/M7vZ1FDXhKeRAuQrW+cybtOBjHzFTFIK657+3DIQ4cJ5kgFA3vVfwzLX9+EUyhxdyEFDGYg1gjqn4uYqkzEQqPNAJATKU/KnBMrWctZWFGSE3Wcwu8CraWuMfc/Am0DkeyOtAVPIord9EY9RKkSZr6bNx0KT0glrn0kluQ7N2/hQGkInxHUThfmX2s6Jqa9OE8xRd33zSSbTsehvSvC0Wo+BEFS5J0U6P9cYxRmlGHlHcEcmLPKf3EPGhSCBCWTkQapl5YMzS7svuAiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CO1PR03MB5777.namprd03.prod.outlook.com (2603:10b6:303:9c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Mon, 7 Sep 2026 08:29:09 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 08:29:09 +0000
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
Subject: [PATCH v5 0/4] Add USB3.1 support for Agilex5
Date: Mon,  7 Sep 2026 16:21:37 +0800
Message-ID: <cover.1788757821.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0111.namprd05.prod.outlook.com
 (2603:10b6:a03:334::26) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CO1PR03MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: b45af318-f746-4d57-bca9-08df0cba1663
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	d/PpEVbsiqfmoILZaOwGTxpWUOH7vGRYWRUXDCQfD7Jy4jHRYrgiwC2PZYvK78Lj1TX0wNkJFLrQw5eKQSq5y19a5PxhkuiBWtgpomj/fFVAU9X7HHiK0etqr2Y1RdK/UmZ7rEfSm7yOta9ggfDIp4EgZtUX0xgcfUkfX0V+TJHui0f4lKf5OdjR6Ic6J7Za3GjqrdFa7NRNwOCs2g1o/oSZGXUgybeZ+7B5k9uR6GQ8eYGWNW6VkVYVqGpCN2J/5z9/dUy3TzSddvw6WNKF2Bukq+CF0VXFbv1GMPy8FvAqY4qHID5bN6W7FmqFSnk0TITCMUYNgszMSqetp8SQluRnQfyV858I3077zVy5ehUU9Fkr/9dAwLethcAhfKsVs+gi3BPcGtOhFdfQCFRQApMKpMELpb5pyiv7Fk/DNkSxE6fd2rDjql4NeRpbTjEpLo9xy7vAdvZevHz3uKbIaetUZG4yldIS6bde+V/CgMBGDn5OZOcZ8nMbBvU87lD3afDJVTDdPqTrxdEdnhh9bRD7YGuHSoPbDVwALMS8x8tnRWPkCzqRK2CaY6kLilDkyQe3a7kpeIXge9Yb5vNREca9fjSt0BBdDaLCHHvYWFWjKIDhP4wRcbpMoLZJ6yw1hefy2LHEHHyzqGsww2rhItT+/IGml9yStNzrbmjUsB4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UVbYYEUIArkeF+u7zgB2inloISQAnpuwFy0w/erWlOijth8TdsMuJk/y8UNb?=
 =?us-ascii?Q?H1kOLBcWSRyocPhMO5yystUeF/3CJs8qzMx5TchY1dgxtyVnkmiYLAb/4z83?=
 =?us-ascii?Q?TD7+omy1vGP44O/dW1m8wr6R/7sXPm1BvE1W1Z7rfxubrZi2QT8mCTqxtOzX?=
 =?us-ascii?Q?W7IQKv1h7XoidqrtAV7iyz1ANEzPDi4CxIMKSkqaOae/Hv5KAQGtB6MMtDGA?=
 =?us-ascii?Q?EKWtxOYyShOj1lUXM8Kj/QMe6Vwqi6YryJtw6HaG6ue5g6LIzuViT4RIlKEK?=
 =?us-ascii?Q?wiQyMibdoPFbixPrhF9JP6RKw8HfVqWMxvVe1+ITevS3gR/ODOjn44GMKEDO?=
 =?us-ascii?Q?m3UA1TBSPb/PFwFKbVdzfvstuOQ6TH9ZQFPa6q+/0YuDXZNQv2B6VW3qwp9o?=
 =?us-ascii?Q?DnsDrzl67EaZ9G94a15e+YiFRsT48oM/cmI6NaLkxUFnVKkTHZvJbRL2iPol?=
 =?us-ascii?Q?OquNd/g9c1WEJxExVJAbpoGhAuECymrjKkGTNPqAKqpp1umC6jdPSEkuQx8F?=
 =?us-ascii?Q?jFxxQyfbXvC052yDvgUEujgqlOMm+OkhsqHRw9J/sCMavHSdEvB0Jc0Tzxnd?=
 =?us-ascii?Q?2n6HB7yEOz1aViKtczf93px+YanYyi8Wqh5lkcF8/lcL3sI7p8uYGUNeCbK/?=
 =?us-ascii?Q?/wMC+xxm/EYvlh5iPnWdf6XC6Sw5iwpVtt6svm2qI6EQYVUWZwUlQCutmF2y?=
 =?us-ascii?Q?L9WAFOeFsFNRaoRjwBEC8yq8iPOFZDp+AM/8y5W/zE9i8bSzFmi/HIBBCqKE?=
 =?us-ascii?Q?z2o1VKOlzS8hSAwHD32qRjcUo06wiC7CKJAhbvk3TjS/Bnv+ofU3pvvmFE+h?=
 =?us-ascii?Q?va0XCFxkOGnUmrFrkx6jmfO/K6ixntUBD6mUP1LeE4l85YAG5I0yxGdXxk/l?=
 =?us-ascii?Q?0wNappPnsiv/X19TY9hMzWbkBAAAtmIt32AgORlCZUEcfSSfRtkjWa0CLCcJ?=
 =?us-ascii?Q?yFqdX4IuNRxMCPqmFz9gJ9p8iIkmCfZ6bPINMJG0Jcx/BKyOym9PMPfsprXQ?=
 =?us-ascii?Q?wUZwdKNpXwR5/RgL9OOB4zMvOAgveU7QkbtD/Bjrdo8f+P6snge+Wd4N9Cw+?=
 =?us-ascii?Q?H1iWC3bDIylH9ySnkGCvwgeiLmm2f5UR2QDwcu5gwWThSdk7JA6W6WkADdgB?=
 =?us-ascii?Q?f0G5pYlOpKY8EtyNiBISmGdyqDfwZv8fuL3BKQ6rJnDTQAEt0Of2jJxym83U?=
 =?us-ascii?Q?cWdDKhJvrLxi4ejjVdiK/M0MqrFSK4f0hO4QM53fAs44EGIGNIwEyeRq/xMK?=
 =?us-ascii?Q?TUnDCgO0D3STLbKqpkcuNClZqi2Bk8T+Pl36A65o5MCzIudIMhNL+mOlcZmm?=
 =?us-ascii?Q?GvZ/3AgiYZGC7gd1Espe2Iu+SN390xWDambwNitH1vyfmb5OrVFgTpbMv3UP?=
 =?us-ascii?Q?1ikRfwxpjePQ10w/fleJhlcv8SiUfRuBvUpdmNmCKxJvfz4AdCJT7KtDJjnj?=
 =?us-ascii?Q?++ZraYu8m5juTEuCT+43JGmBoL55jyAyS0tgrW1/V67VDfKPg4MZKIDfkaEI?=
 =?us-ascii?Q?xdhPh0DNUnQTBaD1fSUwcozh3Wdw3Ll7QRtpCibM9GJWVfsB1d8lFiC2xeYO?=
 =?us-ascii?Q?EdkOpEEVORnd+2v++L2Su9CeljaJvItRrVY5ODiUCrIGyrsS9v2s7XUePm3E?=
 =?us-ascii?Q?2nXQW0yfiXM7XaW2nqEcfJV/bzZYywJP+v4bmfcOmIU2sLjuQJGu/yvKMiml?=
 =?us-ascii?Q?C/Q+ogACpuqZIHqFRZL/uXXKj7MK3/8xtSVXMVO15kiL+kqgyn7nT5TGSgaW?=
 =?us-ascii?Q?npeIutbakQB/1qW5w93annUk/vP/ML8=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b45af318-f746-4d57-bca9-08df0cba1663
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:29:09.3196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +APbMPp8LSes7L9nyeFMmDsLoVlffBQZUSeOQWdkU0o9yxPu07h7aeYJ9JPxfL9SiJKjtyeGyyR3TDg9UA8zDevGa3THgYscW8p6U2MD+nA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5777

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
v4->v5:
* Binding: replace unevaluatedProperties: false with additionalProperties:
  false, and allow only the extra DWC3 properties used on this SoC via
  "foo: true" (dr_mode, maximum-speed, snps,dis_u2_susphy_quirk,
  snps,dis_u3_susphy_quirk). Requested by Conor Dooley.

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

 .../bindings/usb/altr,agilex5-dwc3.yaml       | 108 ++++++++++++++++++
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi |  35 ++++++
 .../boot/dts/intel/socfpga_agilex5_socdk.dts  |   4 +-
 drivers/usb/dwc3/dwc3-generic-plat.c          |   1 +
 4 files changed, 146 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml

-- 
2.49.GIT
