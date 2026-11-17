Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794927794;
	b=rwucfGWFQ6BX0NP03DpF8enbLPX6KtI8U90atHMdzZNSfh0e5j2W5F2ql3eNKOvZ05Rg
	 +T1WxoaDR84Dgkmb0kK5eTYK5aq3YuSjpZ1Q6o1wPlKd/i0XdtPsmaVAIilv8mJqYd0a2
	 ahxo9nUFOD9ny6MuTI7ae1ljCWUXuFynRETOmkNn/HJA7IfL5FwVCm8ihRoyDVTJUnGsR
	 eGx9lzqNyQ3cOzA9h7aJ3XezN/sBIG39+UoBgMtZ9D9q5sL5uRMehcbNZCYOPlyawa4bs
	 WoplXbVXNBJPvaxIVbMxKiRmwqu8X6ZEf2fp2ypj8IQI/Ir+KLoCVq1aOgpkagVWYow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927794;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ilj55N09HotdAvDhi3wOvxrQql7gAyBL3SRdxVWGIwc=;
	b=zEnHO9GWlRl1Y+hjbJGFlG+gRHh0de7XSnF+nMeTb4qle4kFIznhBpeCx4afZ6nS8YE5
	 Ws99MgEOOaIcf3AYpDvSMJCYk6huRynqwi3nGBKwc6OsWRkh0gMepRfOBY7aejuBA2aH9
	 7v5ym5q7lHOi/GZqK4zTvhxZ/e3Vq/i0V1IIlRpF3TfVVbQQL3qhZ6/49mgR2cwClxUnB
	 P0dDFiVXi7PTJvjzIfdN4dbLbqfRIyI5FUbQDQ2c1G30tqe9nDijo0ZSzNlOLd02shF9E
	 vB11mklFPLUsMJ0ZJqErMAI7KzbINiN4KpB41u4uUkQJ3/CtJO7GOFfsKJvSiaL3JFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=galcaGNV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.58
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011058.outbound.protection.outlook.com [52.101.57.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F00C606A31C;
	Tue, 17 Nov 2026 15:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F00C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=galcaGNV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDNjr8CGKe1hXWLzfbdZDuZS/Ea807hjxJcVR/ZR03XKbtC1tkLJQD5QKfQVL8zW9lo49navnsQ88EG1cHKg1Dqbytv39Bb7MtqYiqwNgnxjhJvUybaiVixem0CmeEd9HiKtBi3NFUpVTWTFKxjijLKfdpIjaJDacGeAAXV6r6tbZvNOm3KZ6lROq5H0/1NuKtQsHHnOMNMAKV0yzxvO7Hhc+k0Fcb3NDDh+HT9cpE7veWJCc2Ds7kOzxMChcgt6yI80LDZg2fVIJhx6LOOUE6MI7xJNeUPJG0sDen8o8vD5QAySxWRyQ12AMP7QGs78SOKeJ55FBOjvyzYzwoQ7vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilj55N09HotdAvDhi3wOvxrQql7gAyBL3SRdxVWGIwc=;
 b=Sy/nJmhLN5mw/SlkcuchKK8jdf52Q7am6yyam1+oS7uSuYxgmBrJI5/3uhR9FifZ+Etszrq9Cb8bMjKFGLu0ZxxUv8XbFeEuBiIN1dleOVHHY6euCOd0C18N4Zvs3jKPaR55n3nWKS5NoanWTbXFG9m/GjHVjUaRkb1O7bXrh4jluWJWubUCxW4FJcdu+6S5kDB1cGvdISOHeKGQBqN+w6vdHmeRYpY1bHytezpAgyKoqoOT1ogOfs1V1UJrOHJ4UFITXvw67ZDL8ACO0sWv6cb/C1jydwHFyEQ3xpRFaJfNaFYWbLhyvXJAsgSg6pNP/x9vB3o25Ht6s5rp0SvSgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilj55N09HotdAvDhi3wOvxrQql7gAyBL3SRdxVWGIwc=;
 b=galcaGNVmQWqzvwLTx64efJTwcAFWpnNhQIyhFOqyxSRarZz8RJSyzNOVh25n96A9AWhLFY68576SISVIBFOT5+0QpxbGf7/6BlaWd671KmOqnkmQ51J8otKAqFfwKLFNLPpe6wF05kUNDhHxqak2/gp4putxV9X/9VW/e7YitU=
Received: from DS7P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::16) by
 MW6PR12MB8898.namprd12.prod.outlook.com (2603:10b6:303:246::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.14; Tue, 17 Nov 2026 15:03:05 +0000
Received: from CH01EPF000BE940.namprd02.prod.outlook.com
 (2603:10b6:8:223:cafe::61) by DS7P220CA0018.outlook.office365.com
 (2603:10b6:8:223::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 15:03:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH01EPF000BE940.mail.protection.outlook.com (10.167.244.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 15:03:05 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 09:02:33 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 09:02:28 -0600
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 09:02:24 -0600
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>, <michal.simek@amd.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v5 0/4] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2 controller support
Date: Tue, 17 Nov 2026 20:32:14 +0530
Message-ID: <20261117150219.1326693-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
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
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE940:EE_|MW6PR12MB8898:EE_
X-MS-Office365-Filtering-Correlation-Id: ec0254a6-cde0-4224-d0de-08df44bbe227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|23010399003|18002099003|6133799003|261009223027099003|11063799006|56012099006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|10067099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	iyw8kB5i6oPgkBWyfGYfzas7fPmSadLSW3ZQPyGT8WuSdPRWxniy2U4znrPOSRAcqZ/kDpj5qDXjxIq6ypA12/VU9HEWZUAOtZ53VjMX6UyQcdqTzlNDB9CZtSKHJX+kQpZVWjaDxjzAugeTEDomyYPKsYQ4mQwPduXpXqbUI0SVWGhRo6o1WmH8nCBvMEk9udt65MZVagm3cICEXRPqkrKqCO32Sorw9OiD0uYU2Vn5IpRTVTVxrbmRMMCm98Z5850QZaKkWg0rXfZKqJ64iYhwVT8LpiaJaFv7L0TbptnMaL4MQ5RhQp5kQiHcxip8BvwIenXDfnMD13czwe1pWr295Vo2n84Hgvq0StTz2tcdVptK0DyESaiZtBdCJ84dXD9umkAvzjQO68uJHFe+H3RqdlsKJtZiXUFfKhtBdj4ilVEJdCp+a22l55M8TCPNc+2Vz0sUHWEhBQ349pCPJWFdUKonG2kBsqwDIVirCqSJIoAKqYWSFU5wUSIyDi/2u481rQDDU4qbDfdytr3LuuCG2JU1LHNwzCzwx5BoN8mnpD+1XL3OR1U+BVhIofSBibdfu6CBPGHBdNgYa7h4pOLTYAoaRTzbndFVHp0+OFTXQwvibzakzpQoHxMwHHmsdQX4yPo+YpH+Ht4JCDtd4tq79CEadd83y6SNsrhLkGs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(23010399003)(18002099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(10067099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xwThb83H8B8AOo2T1H3e78VV/O95Hzhwz9jSAA0pRkjnsImnUGom92kj1Pq/7FoBDNwNtSQMdyQfF7r2GymWboaWOtbZFpft5upXQLG/gDsAT8eiVYB5RqzkE+BsxfJ0u6nGScsev6LTZqmPyOeCxg5Lj4zdrMwGNxRhcxyOG8/mbK1YMRXpVJRPU3sM7PBtmb9wN1Gf4dnmz7HDboNwfCNQe2kxxLP5ccUX3plgVZv3JwNVhsgrO0dsk5lu7rD8Tp+2jweFUfg8ycyIxbczDemfG37PbmzlhiG7rSNvKq73lzdEnItjw3NNvnglNha+De9BZhi4SB5gp+n32K9liX/YKKi9AJ44swiJUE+WDoxJ5aCz1BGkEt8/GgPA2vUZYpp+r2nNq4yHPzadsD2DVIdwDQYA0G8ccxriSW3Haa2YpOcAVf/ZfnP2Ik9QTAtL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 15:03:05.3153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0254a6-cde0-4224-d0de-08df44bbe227
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE940.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8898

This series introduces support for the Multimedia Integrated (MMI) USB
3.2 Dual-Role Device (DRD) controller on Xilinx Versal2 platforms.

The controller supports SSP(10-Gbps), SuperSpeed, high-speed, full-speed
and low-speed operation modes.

The driver is required for the clock, reset and platform specific
initialization (coherency/TX_DEEMPH etc). In this initial version typec
reversibility is not implemented and it is assumed that USB3 PHY TCA mux
programming is done by MMI configuration data object (CDOs) and TI PD
controller is configured using external tiva programmer on VEK385
evaluation board.

Changes for v5:
- Rebase on latest usb-next branch.
- Add Rob's reviewed-by tag on binding patch.
- Merge device_get_match_data() patch in this series.
- Rephrase commit description of 3/4 patch.

Changes for v4:
- Switch Versal Gen2 MMI to the flat probe model: embed struct dwc3 in the
  glue private data and call dwc3_core_probe() directly, rather than
  instantiating a child snps,dwc3 node.
- Binding: drop the wrapper parent address space and make reg required, as
  the MMI integration has no glue register space of its own.
- Replace dwc3_xlnx_config with dwc3_xlnx_platdata {init, teardown, flat}
  and split probe into common, flat and legacy paths. ZynqMP and Versal
  behaviour is unchanged.
- Pass GSBUSCFG0.REQINFO and the Gen2 TX de-emphasis value through
  struct dwc3_properties instead of software node properties.
- Acquire the USB3 PHY and reset in dwc3_xlnx_init_versal2(), undone by
  devm_add_action_or_reset(); drop the explicit assert delay now that
  phy_init() sits between assert and deassert.

Changes for v3:
- Return -ENODEV from probe if device_get_match_data() is NULL.
- Replace map_resource with no_mem_map (Versal2 MMI only; others default
  MMIO map).
- Add PHY warm-reset assert delay.
- Loop all num_usb3_ports with one de-emphasis value.
- Set default as DWC3_LCSR_TX_DEEMPH_UNSPECIFIED default and only set
  snps,lcsr-tx-deemph when not unspecified.

Changes for v2:
- DT binding: fix MHz spacing (SI convention), reorder description
  before $ref in xlnx,usb-syscon, restore zynqmp-dwc3 example and add
  versal2-mmi-dwc3 example, fix node name for no-reg case, use 1/1
  address/size configuration and lowercase hex in syscon offsets.
- Split config struct refactoring (device_get_match_data,dwc3_xlnx_config)
  into a separate preparatory patch.
- Fix error message capitalization to lowercase per kernel convention.
- Rename property snps,lcsr_tx_deemph to snps,lcsr-tx-deemph (hyphens).
- Fix double space in comment and missing blank line in core.h.
- Use platform data instead of of_device_is_compatible() check for
  deemphasis support.

Link: https://lore.kernel.org/all/20261020112636.2661087-1-radhey.shyam.pandey@amd.com [v4]
Link: https://lore.kernel.org/all/20260429173050.1772377-1-radhey.shyam.pandey@amd.com [v3]
Link: https://lore.kernel.org/all/20260330190304.1841593-1-radhey.shyam.pandey@amd.com [v2]
Link: https://lore.kernel.org/all/20251119193036.2666877-1-radhey.shyam.pandey@amd.com [v1]

Radhey Shyam Pandey (4):
  usb: dwc3: xilinx: use device_get_match_data() in probe
  dt-bindings: usb: amd,versal2-mmi-dwc3: Add MMI USB support on Versal
    Gen2 platform
  usb: dwc3: xilinx: Add Versal2 MMI USB 3.2 controller support with
    flat probe model
  usb: dwc3: xilinx: Add support to program MMI USB TX deemphasis

 .../bindings/usb/amd,versal2-mmi-dwc3.yaml    |  92 +++++
 drivers/usb/dwc3/core.c                       |  12 +
 drivers/usb/dwc3/core.h                       |   8 +
 drivers/usb/dwc3/dwc3-generic-plat.c          |  11 +-
 drivers/usb/dwc3/dwc3-xilinx.c                | 333 ++++++++++++++++--
 drivers/usb/dwc3/glue.h                       |   4 +
 6 files changed, 425 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/amd,versal2-mmi-dwc3.yaml


base-commit: f11fe7603df07fbb9fa02b0d385c1696c87a6dab
-- 
2.44.4

