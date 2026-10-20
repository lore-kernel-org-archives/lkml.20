Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792495652;
	b=j6hchl29GABKKTq4nXZ6S6v3gKJ46xiDcx/ULrFfaxD5yHM7Sf7gxAWkqsDe6o+snuCb
	 4VspvhS2oZ6tEQSF+stZ/X/gQMNoFmq2JpCQ3wfXSJdntKbfeX7oAtxRF0UTFKzZGaIQl
	 vPPYan314/zqNxAUbPms9ZW83jhu/MEtMgEPSYB+Xx02PLyYocs7DsVWmsgjzAiCLm7Uw
	 IzMTBXZHbLp2u8TYx6ksXvZDb+y7ZHP+1Feh/V6Ycu8XmfBnCJZPuZua+TovHc7qfMTMQ
	 wGYj5DDGa/fIACo0mob/HevehEt4t2+fvm/0/ol/KbNR6D8yEj34w3K/lMgDxwJNdpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495652;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=ntdX7X3gyFjJ7buTIXQJABImgvvHtEmyWgPooUs11fg=;
	b=LR4BTUvdA2Tju4EXrESXlogGIXkFc+lFsh2mtGDRruRUZnXPmMQmpw3cXKtH7LZpjmx2
	 V1CDBshnAQJ2n9vUScM9X9ektoz6zlm7AZTVgYfTzgnvxOjWxeAwh42fiTxmRgZw4oeX8
	 7WRG5ii78dGxjRTW82858b1bkEfigY9Z0rjriOsaPUO0DQ6NGauPGMgGHg4lHbjauJbZb
	 vS6WQ0BRknWZd29KQ9mSaRGSQHjM8aTdQ0xHSxyZDLLJPHMEZgrUqmg3PB/oqtXtEF+uX
	 y88ns3cnS9hVRmYMUwWb+rsAvYONXIN+bUoeZbhq3aa37Hxz7kLD7rpoQpkGDxyZzeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="JKD+/5KW";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.39
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013039.outbound.protection.outlook.com [40.107.201.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A130D606A31C;
	Tue, 20 Oct 2026 11:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A130D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=JKD+/5KW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLeiKZDV6GqBIwN0bCwg9ZXYTF0EUy1wJ3LrtukSBNCP72MbnvcfkQ9U6xf+skLfGVgFCPEBf7uZRgXrXqNeXbnCMQ0v+9hcu2OpOnR336XvfE4UCU0XS3WPiMy8M9LSAsYGrQlvn0xgHhYdJn5imT83LUR8VnQ7nntHn4kc+k9wpKL8MfxlXaQUvJSpBIj+PQkz12ZAzJFULOafz08xd+4aldNnFT8b+RuiHoAQImeUNwo5gIQIBHSfKZ7LqA0HPxrRyiF9ulCowNkB7Z1QEcSmzke7uTkN2fKkc/P+mBfpBkyN4Uw73B7rR1kd4nw+IxtjSew2hrHRCF/VR39yxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntdX7X3gyFjJ7buTIXQJABImgvvHtEmyWgPooUs11fg=;
 b=g5ECyAYiigE2iRcuS0ppbzoEZD5ltxlxqYxSun/ldq/RXtY4HDcKiTyVKp7Vy1zzIRbUE5JwycopFtToLVxGSDROwViWwG1nQLlqodQ8NM91ghhZ+wj7XydYuN2E5qgjqPCmuJybE1/OIWMa+Hetf1uxzGOQQf6ZlMy/PodsQU1yay0uePLmzBqW3d683x4Ml2OrdXrXC0r1d9u8YWV7A60rStqJYEu5UtvponX34r4BRyckmKOlsL075VhIo2mKbbtBwMetUDddJpOd7AESn+H6Zs0C+GzBeOWpeS4/Mj/wKnnf/1xVLs5xkvc5hgR6J7y6z7z3pB1BDRjYv6oFQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntdX7X3gyFjJ7buTIXQJABImgvvHtEmyWgPooUs11fg=;
 b=JKD+/5KW1OYNC9huZ/XeSM3s4Y3HeBWS9RhSNBicBHoaXqfMZEl5O7TJBhF51ORa4HJykfOwEELVvtpoGQBW68anmLDfL5w5HoyN+dMeMIlsIdlWSf7k5YKFx513Dfrob1MSucMcOeTCj0bWP6hEu4spd9Chz7M2QJpVC3gC2+k=
Received: from BY5PR04CA0014.namprd04.prod.outlook.com (2603:10b6:a03:1d0::24)
 by IA0PPF64A94D5DF.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Tue, 20 Oct
 2026 11:27:27 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::92) by BY5PR04CA0014.outlook.office365.com
 (2603:10b6:a03:1d0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue,
 20 Oct 2026 11:27:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 20 Oct 2026 11:27:26 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 20 Oct
 2026 06:27:25 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 20 Oct 2026 06:27:22 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>, <michal.simek@amd.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v4 0/3] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2 controller support
Date: Tue, 20 Oct 2026 16:56:32 +0530
Message-ID: <20261020112636.2661087-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|IA0PPF64A94D5DF:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bf308c9-fa84-4558-9950-08df2e9d1e3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|1800799024|376014|7416014|23010399003|36860700016|82310400026|56012099006|11063799006|261009223027099003|10067099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	CBqw4hukuuOOYADKQhvS8Q5gH24bC6kZNUX7llFuax5bu2ePyeuD+MmcS7iQlt4E+szWncBl9SejWatBlpEWhDRnamd8A+FUaEAP2I2i7WMQAxBQDAqNmJKIthfU+2m+19aeIQFnNl6EBbMURDbyOblY7DR2hZxrdBv+YpUyNCs+KSM+58gHwQOrpjNMkXNfTI645SBYnqALsWS3xM3RHcMDYTNV/RbisUcrle47EAbI+/MVdVAuBPOVbYKOrkZDd9ETT2RrpObvXP0vlsbYNYJG18qyUnSLyGUXWI7QN/UdobX8yoFIs9K3oM9JnkJpne55ldSwGZ2Ga++Pt45DyVk9nMTEczTZ5WYq3UWbwvKuTQP8Jnikf52LlZhtxLsFyets7CwKME/sQDqKEtgPbC6VsoNB0IdsSZ8PzBKkefteTXaIjToQangiqbrRklL0JD0o0C1Shp4a7A7nIH/C1q2timpDFDo3jjgMnYdxQlRbRaoiB0RscJK5kXpRPIPMDrKxaKAQSPHCcjS8I8quNpc1LMp8L5sXs7Hf21kHv0qWMB6StHPZ8Zx/rCRyeGbXc60gZO1fmj4IQbJVutwqtflsz+s4vQoFdbDweJ8nNhNdETf5tTLsOFHelq16PYYr6N0ZahGtfaAmxLgPhoBEcyfPoOxBXaY+WmKFe4zUszU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(1800799024)(376014)(7416014)(23010399003)(36860700016)(82310400026)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gfjp/fzcnHgtY1ZbyBHOrOMsKTdG/nruf+kar5zhF+0yQof5Z7URUJupFDQJUG/v0RF9o6FPvwj/UOuX73JmRa2kCAv3jGiWXGiWHCzRlCobrMdd6WwEXcCgdE3kZdPlF8oGCpAdUv56rJCgbsP9nrsvQTHNNIGbUmOLtEd7zH0CjGbz+2WMJQ4Vvm8UKAQxwzHJ+z87ryQNtHdrJk0n+q4zBFnaLuAzCJzFNXzkw8oGMQ9F6MGpfvG13vB4qawq2TqV3WPdK54mjGU/ErkArR1gvjegHAVbMuR5vUwA0yoBk6PCmie85qbQLUnhPGq6LX62eziT9m1aPmvSk785AR4Xg0rldISJ1sZL0SBI18BenapvKbtmhFGzXOTCUadIBtITLq1THjgQ0rUGjiL4sMpWtD74XrA6wrfRwTaZWvjf5PjxqbxPaaxJlkm7XHHS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 11:27:26.0671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf308c9-fa84-4558-9950-08df2e9d1e3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF64A94D5DF

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

This series depends on:
https://lore.kernel.org/all/20260928120015.3152461-1-radhey.shyam.pandey@amd.com [1]
https://lore.kernel.org/all/20260928134215.3194328-1-radhey.shyam.pandey@amd.com [2]

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

Link: https://lore.kernel.org/all/20260429173050.1772377-1-radhey.shyam.pandey@amd.com [v3]
Link: https://lore.kernel.org/all/20260330190304.1841593-1-radhey.shyam.pandey@amd.com [v2]
Link: https://lore.kernel.org/all/20251119193036.2666877-1-radhey.shyam.pandey@amd.com [v1]


Radhey Shyam Pandey (3):
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
 6 files changed, 424 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/amd,versal2-mmi-dwc3.yaml

-- 
2.43.0

