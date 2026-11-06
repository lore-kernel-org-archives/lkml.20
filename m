Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.103
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793959939;
	b=AbrL6iT6qv+ozwfXCtzQ7MVrE7soEFlhcwQsc87s129F4q6dcf2o4mhLJcu1ENiwK11E
	 lK1ZxPaGcTzMHz3cf8YK0X0GUaUJdrzhmTVyU9upHO9vft39C3T1TcpEqu6xlKafjlu7j
	 Gny0brbNJJhb1OiMJEx35wICE9e+/QkPXAWT1oXaZOErCI5ECFKjSfW4uoynHJL2TU4NB
	 iFoEf2TEN+8E8PuNKaGiGk4vN2LiSqeAwT3DIrzL23KnDWT5XqeTQjkMbTFwda0M/EAql
	 5zK42odpjACPZNNJ0oreUHhV9/bxI5ImGVWydHAOGrIw+rmvA3Jkt4el2mlv+hfFrJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959939;
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
	bh=7Rxw4suj1Eq8PN1XDPBOCoGaQBhBDMPM3fATHrC7zJQ=;
	b=MH40lwszA5b8MNhAcprTHfr2YNN5Riiagixxnvmyv/zWelKmBTX1q7HvRd5F0aTzSdZd
	 UhwDLLn9ACoCF9oqbuyiUZbAgNprmAQqPd/hdJp+aKzUVlUCcFcGpx20DW/b/EDQ9UBbH
	 BWy2xstO5jvRhifxenL0rp4D7wb5wqwrH8WmJUOwoViHZYVIcwddQa4HAPlnA4dsh9UVo
	 DGUsZvvZ/bc/GPJxEeUGXNZUXEerskP3LVHBiL++xKB5WAo0oNxRULExB02fLOyTTxpl+
	 DvdSR1Yen4VDLeCHfzY74acMS9xrvyJd7EQmF5yL12rG10+rcgPSC+iNMR2bYJ5P+bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.103
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023103.outbound.protection.outlook.com [52.101.127.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A39C606A326;
	Fri,  6 Nov 2026 10:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A39C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oX5UXZe2WDHlTqqbktrfTrEQhVOrhS/RJpkPro1QTH9y2FdtqJxogmRGq5ik6wTSUuaxu/b/WO5Q5g58tZgAZTw8Ysz4S65rOpZePVA50oF1ghahW2nD8BrENhSq5PqtWR8mD985krIpUE+elz+65lGYlXvi+sZsurLSELyLRU4lOzoD6FFFFvQC9UC4I1WmKVQE5oNXzdrjf79NYlh9X04OksAYTSnvftCzFNSxYHas2BGCN9I95bmEA+/eBN7hK5rDL2RtzfVXEG94/imldbnotryxxS1mqP/bnclsTAzPNSIyMy5CwmJMzHk26FUnlm7i+sI+KlViI8oGYjUJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Rxw4suj1Eq8PN1XDPBOCoGaQBhBDMPM3fATHrC7zJQ=;
 b=CmRrWO9HMvfG2+Nl+jPopIiaTSrzhHjBjp3pxs8I8a6YG19UhoAK12u4nE6kimJni3SV44yd5yCTSyeHrRAF2NrHctQj8zRwiaSA4NsXHM7we6wYda6+Yj7TmiY1z7vp5YTFs+CHGtQLT05XQ/mtkD0h7/vHv3wp4eEl1tSR7XgtvfARlF0759oAbmHaIJGcDs4h5+FPd648BeTr7zlnsDXhHaHA9M2Y5Pk/P3rgqqHUVeX3yZx3kXyz5GRX8I4Tc5u8cnLScEvu37Eq+NX0cWNmsOLrY3LAonfTsEoPU9VX3V5MOSOzprrYReXNe2Rv2PmcfKOJASxsf3H7Uk8fbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0053.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::22) by
 SEYPR06MB6062.apcprd06.prod.outlook.com (2603:1096:101:d4::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.10; Fri, 6 Nov 2026 10:12:14 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:c6:cafe::8f) by SG2P153CA0053.outlook.office365.com
 (2603:1096:4:c6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.5 via Frontend Transport; Fri, 6
 Nov 2026 10:12:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 10:12:12 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 600B54102E61;
	Fri,  6 Nov 2026 18:12:11 +0800 (CST)
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
Subject: [PATCH v7 0/2] Add CIX Sky1 USBSSP controller support
Date: Fri,  6 Nov 2026 18:12:08 +0800
Message-ID: <20261106101210.1059256-1-hongliang.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|SEYPR06MB6062:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b6017d97-59bd-4b68-3541-08df3bee6d02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|7416014|18002099003|10067099003|921020|261026140227099003|261028144727099003|261026121527099003|261102123227099003|261022105027099003|261009223027099003|56012099006|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	b6NP9wKy4hlqhj+UDzqYfCTpr1hY3I9XGUHzNZrrzMUfWx7+iXi3nsHo4MJkGfLqBYW3QpaGGM1YdbVxcgLyQ0j1y7bDEqiwowHnoxL6MDn9qWNPpVECCeBMYl37vNVsDoANSdLZrDr4vP1NGG7mw/KTA9cAPHX7uzICEIZ8Pf+Pb6hMkaFGUSbKkYxZHkhfF0JUO+RSqs1oPkTEhDa9gK06jRO1Dnyw52LTa3rWSnMNDN9kJlrViMHvLjEUYpeMQAx4c3Bd3aiKbEhT78NH2tHUF3FUOObV1ADLj+zmTaAkr09kmtjTKDjhmGvbEPXy9xQ44xGQ6vmRTgkVZh9aixwtjjCU9riNYCOhJPKS4Gq7UxkIQySC1mjkBqbQjiwQUqPkqeldzbAAEXkzgop89Qxdo2R0R43Z4DZWW8phH6CV41Rztro6bEWvshZ/EPyYg/B1jmZk5/QOumJoIHI71lQ/vVysiJ+o+Tw2NVQDdPmEshz/e00k0yaepEN15dMqwjehYT/ddHDMsR3Ez766aUIMhX4vTMoSQt13TfBTfneB+t0hlCSORHAJD0a0twfN94GNlX3eybHQ5umYgZVKObIjM9DzkHp+Ky5BDwJhCW4wy7MsG1ixm5coRXywoZ0BiDS9mohNIYErhfl0h2mgpRuuQbWGbdGRO310KVhoLESH5FTU0XrDoMAlcTbrRHNbVtUFjfNUDtTJP0a281b/kcgOfpSE2KdGN+WDAVXn80NU5zasDHOhBLDJRXAHmvj/
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(7416014)(18002099003)(10067099003)(921020)(261026140227099003)(261028144727099003)(261026121527099003)(261102123227099003)(261022105027099003)(261009223027099003)(56012099006)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	onwKKmKEEhFzeaxpZVi4ys5tX1T6dIyTSijSjyYScCak/YHuz7qFTU3ociNAVz2Nvabrn4a8zaT+hvzZ6TXNXIg0Nz7Mv5lnSPT1I1d6rq5CtXEkCt8cHFwFcxX9ljAkvZQAIWj5A1BUzuJ0Q+EBVPzns5538mEZhBvCBAuQUdZhnRNwSZQwhjEvF/uyF1IfNXGgPNHQMYOX5vp7Kps5L+yQ6vCXf7KMlIEF4P0o5e7nh5r6+y+uurDPgOW6DX/UCqiPScnIVBVKHdTonwjOVm8ey73AxPC4xECcgYx81F+tU+X//4f/6psIYhCXJXrwPvaPu/QQa2XmQCHX0pw0349SQPiX5Rx6tkWH4n0xJBmTFmBBhhZhUuFK5ppmDKRGRBcS8ikGKNG4q86gauCDVGo9wcF/sgUfy6pMGN+3Lh0T5M1dIOv8ooCzHVKOQcbE
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:12:12.5264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6017d97-59bd-4b68-3541-08df3bee6d02
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6062

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
controllers interleave their strap and status registers in that block,
so the two ranges overlap, and the range is mapped with devm_ioremap()
instead of devm_platform_ioremap_resource(): requesting the region would
make the second controller fail with -EBUSY. The register map of the
block is in the binding commit message.

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

 .../bindings/usb/cix,sky1-usbssp.yaml         | 154 ++++
 MAINTAINERS                                   |   2 +
 drivers/usb/cdns3/Kconfig                     |  13 +
 drivers/usb/cdns3/Makefile                    |   1 +
 drivers/usb/cdns3/cdnsp-sky1.c                | 710 ++++++++++++++++++
 drivers/usb/cdns3/cdnsp-sky1.h                | 100 +++
 6 files changed, 980 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
 create mode 100644 drivers/usb/cdns3/cdnsp-sky1.c
 create mode 100644 drivers/usb/cdns3/cdnsp-sky1.h

--
2.54.0

