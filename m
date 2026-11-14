Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794681081;
	b=tHuTuMhY2JrTD1NjzWT6mAa3FSKx1frYHPPogxy4fjQsIDyFxRZbsR5NVsLyO07I9rXG
	 58wyK+vMiYN6M8jC2jwCZWyIDNOkE+TZJhTBD01OPSW4Y4FXRkgmNjbxJd5+MZKUzqtpJ
	 2ffYX92unvcSbByjll0i4EJnEZ6fviOAggE1U6fs3K+B+LgwwV6mlJ8yzsZGf5ATSo9z1
	 4i49SN6vLKUG7jsDq+BL97vKmx6iT8CC3PDEh1d1r+8MfxyMHbrdiJEtKPP6GzC7DH9ef
	 K78Un7RtunzzV612czSjGvDk+ZnBQRd9S4phnwGqbDTSSwNRvGURO6yrjDMcld/iANw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681081;
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
	bh=mq6H3Yk0JrFv5l8WLfRXbMeBtR7JEva3mGz5jMiUVns=;
	b=d+x26YnsdcOvfDhzJyDBpgal8zaQ022TyTKmhvvwuL4A7ifP83E3QIWKoZbsypZMCMav
	 guRUkJTj3TO5nS9tixrJ8dg3XrzOU24sRXDvm8x5f/jUe9XJVdK7cRcuENm9b7IHIiyuE
	 7XvOI9dF7ZKrzHfbNjTucD+eRtYRX/oCBzE/dHWbknfaSlmeqfeYRhWa88tgBPeY2pevE
	 YiUh+Rsb7xd3rvzDWoUXSDu1ORMO1aa6srGFZc7CV3xKlYUsOCBEYHF+nzpoKEyhXkYBt
	 gSsXfuf6tcI/2T3v8vlslddki64QrGK2fF822htqx2PAIOmgCX4UuGVpcCR6IgOE6lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Wy7zf2d5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.58
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012058.outbound.protection.outlook.com [40.107.209.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3575606A327;
	Sat, 14 Nov 2026 18:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3575606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Wy7zf2d5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCI2Wt69ciX425apVxdaSJiFuT/2BS4dzLS/Mrp1e852Tx0jlteHpWb6eva2JJ96wCJ3A+EqMTZW9epSgojSw3QBbU8JLl6xAnkWVSwIST8U+N23QQKD6iPh/mfnrkc9MJPed5Dk2zGNyj5R9GXeBWoyi9zPqqZUN4lqhx3nFFbi7lkhRVnQByvahnvRca0hOGkc7MgQyKJMESX1b7pGvOs8id71P9m+9LugyurOGV7qXnMK0PUxFBhFK70K2VvqQFbOR8cD+CvZuYfkCCfPpRmvF8ngf4LgqXQHQYAbGYMnfMD6OBwOfYL4IN2q+aG1ixYbVBsegaZDk2hTIJzmdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mq6H3Yk0JrFv5l8WLfRXbMeBtR7JEva3mGz5jMiUVns=;
 b=YwivSwXwLoAgdy+0E3EfjdCAiNUkDfLoblGviefrubVe/WMd/VlWgJvNgcNhIf9/TD+AA3qOtQ4zOKllQPT0UrbUmhQ2MtAfbBfEumP9IEiEynJlwSLQ2IZ9VFFyokm5kNmdz9qTOeNmYTemiM/sn0u9yK8H7I7N/e+ashxNWcmSXZ7mrnw7X3x/d5gkvA8I3AvDmVfmxStzN0Ovv+97zPJ+9aTl6LdoljW9Hfn2P6DxWEKbGy6wNRbsH1i/9uQQ6cPob5aw3WSHJczofdxIw/vNky/HJzrGDBEcgMpwqaYPLQBLq53Mte/IcCp4+KkxiliXb9MWzfDkaKKG30mXlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mq6H3Yk0JrFv5l8WLfRXbMeBtR7JEva3mGz5jMiUVns=;
 b=Wy7zf2d5TOHL3qskMkUnivgGNNCDj6j8250hrZzXrLJxctzNKyD5hgOjyyIVRVIj+JlVHOkW4RqJts+nSapSbvcX+DgZyzAv7672SNtohR+llaMvwjq1OAXc7/YLJftwA/qLAM0lkw1LKTde0ehVys/OG4YjdKZQ9uYKAFiTUes=
Received: from BN9PR03CA0329.namprd03.prod.outlook.com (2603:10b6:408:112::34)
 by SA3PR12MB196577.namprd12.prod.outlook.com (2603:10b6:806:533::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sat, 14 Nov
 2026 18:29:58 +0000
Received: from BN7PEPF00000097.namprd03.prod.outlook.com
 (2603:10b6:408:112:cafe::19) by BN9PR03CA0329.outlook.office365.com
 (2603:10b6:408:112::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Sat,
 14 Nov 2026 18:29:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF00000097.mail.protection.outlook.com (10.167.245.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 14 Nov 2026 18:29:57 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 14 Nov
 2026 12:29:57 -0600
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sat, 14 Nov 2026 12:29:53 -0600
From: Suraj Gupta <suraj.gupta2@amd.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Michal Simek <michal.simek@amd.com>, Russell King <linux@armlinux.org.uk>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH net-next v5 0/6] net: xilinx: axienet: Add 10G/25G (XXV) ethernet support
Date: Sat, 14 Nov 2026 23:59:41 +0530
Message-ID: <20261114182947.2908628-1-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: BN7PEPF00000097:EE_|SA3PR12MB196577:EE_
X-MS-Office365-Filtering-Correlation-Id: c745b8b4-070d-4ffc-4d65-08df427d4961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|7416014|18002099003|261009223027099003|3023799007|13003099007|11063799006|56012099006|10067099003|261102123227099003|261022075727099003|261026121527099003|261028144727099003|261026140227099003|261022105027099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	SuXdl5vHbM+X85E3wYu0iJPekanMmF4d3sWeesvjUgaKeer9SRKaZLBhXcS8CmH2iV/DipjxuWOLi87sc3lsP+wDjtkIw9WJ8+v0GejDtqA5hhPjj9ctX/I7AtRwQA/ybcpBaIA8l0sv2K3S0Wz+8N0Cbf073/mEdfrU0nNIXGzIW0W8+W+HHT6pNbNpqKK5sgWL6eprBJl6gamAex3IxO4IO6CitzVNwA/uw/Om089RHL9tDyHippIdxaFZyGsheYCLkymOOXMpWP8AXrO58uFZU7Mdd283xv0u94XQZbYN/K3zp46Escz9eBhGddvHp6wZDsd32Mt0GLPFMnzF7GWu7n9X8r9hVy2TeM+FO5HNtfIBkyMnnhlZITxmYm9v7VDfGPmoBcjxkvtS3dnOn2uW2AQbkh1PQIhLVtw7j4LMg2xkVrGnXwDsPvf8upf2v/XVybBiAwyfv34u/XQVimqp7OssH8lh3DfeUkaxhsqoHmB6EDiE1/63Xz6X05PCQ64u+QxYoPcg5Ei8b6bp8cwDnnZSJHbrsL4TgTg/dizP05JRPcEOgmXd64K5K6jmrjsnXu9rqxIEzI52x/tEeldjh49EWsV6IsJtOvlKHaOY8uGWekmCuaQugZFcWGLOx+YShNVK+ST04CIX6MJ0jjWdQanzDY4LTK4WTLSfYTo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(7416014)(18002099003)(261009223027099003)(3023799007)(13003099007)(11063799006)(56012099006)(10067099003)(261102123227099003)(261022075727099003)(261026121527099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vpMYzYGkS3CilCjPGOLqRQLuKnXAwLUQOFbEeXBwfzMbFdNpHUdrc1fvilI9rkEkWbBNJlb/BxopQuiLSbLQKjKqe732l+FNbwkDx+/5+zs9sLeguF8i7kTHRgguuFO/sXck1XGZEONsOIa+ShMLfvKmqxAYIx8bBduwaClhV0VJPHWyFwAIWPkWI8uTvVOX6h6385n7UeH505UQMrVHMpCPhIN2GUPLfUJvFuOoWEMWW/FlAxvHlnPkasa1c+cUvITZdKIe4sVlgZ+V2qjh6Ds8gX//y1V9gVYKVmvEaYzoIMOeAGPKlJ1RZqrorwKEjVjA4BbdiwS8w6DXSF89JQTn8N8L7+cW9Oh1yLS9UXve6pc3zV4WaZXwoGH6hEz3aniBNK3OEDChh51X44P6qENlzyibqIFvPNsxiWbuDRH6zHo9Mu3D1212JaNcaVcc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 18:29:57.8919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c745b8b4-070d-4ffc-4d65-08df427d4961
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000097.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB196577

This patch series extends the AXI Ethernet driver to support the
XXV Ethernet subsystem.

- Refactor through struct axienet_config so per-MAC behaviour is
  expressed as capability flags and callbacks instead of runtime
  MAC-type checks in the shared code.

- Document the XXV IP in Devicetree.

- Propagate a device reset failure out of ndo_open, which XXV bring-up
  needs, and keep a later ndo_stop safe after a failed resume.

- Add support for the XXV Ethernet subsystem.

- Refactor the statistics into struct axienet_config ops, and add
  ethtool / ndo_get_stats64 counter reporting for XXV.
---
Notes:
- This series is developed on top of [1]. Only "net: xilinx: axienet:
  Derive RX frame length from residue in dmaengine path" from that series
  is still outstanding; the rest is already in net-next. This series
  builds and applies without it, but that change is required to get the
  correct RX completion length on the dmaengine path, which is the only
  path XXV supports. It is not included here to avoid duplication.
- The series advertises the core's active 10G or 25G rate only. Runtime
  switching between 10GBASE-R and 25GBASE-R is not supported and can be
  added later.
- Pause/flow control is not advertised for XXV yet; it is not validated
  on this IP and will be enabled in a later change.

[1]: https://lore.kernel.org/all/20260929081316.803997-1-srinivas.neeli@amd.com/

Changes in v5:
- Patch 1/6:
  * Move the comment on why axienet_dma_err_handler() ignores the
    mac_init() return value into the patch that adds the call.
  * Explain the lp->mii_bus NULL guard in the commit message, and fix the
    axienet_config kernel-doc for pcs_ops, stats_update and internal_pcs.
  * Keep a single axienet_setoptions() and put the option table in
    axienet_config instead of adding a setoptions callback, which every
    MAC would have implemented identically.
- Patch 2/6:
  * Constrain "managed" to in-band-status and disallow phy-handle,
    pcs-handle and the deprecated phy and phy-device spellings.
  * Add an optional "ref" GT reference clock, clarify that the second
    clock is the GT helper (dclk), and require the first Tx/Rx DMA
    channel pair. Note that dmas and dma-names pair up by position.
  * Add xlnx,has-statistics-counters: the counters are a PG210 build
    option and no ability register reports whether they were included.
  * Explain in the commit message why xlnx,rxmem is required: probe reads
    it unconditionally and it bounds the largest frame accepted.
  * Drop Rob Herring's Reviewed-by, as the binding has changed since v3.
- Patch 3/6 (new):
  * Split the ndo_open / ndo_stop / resume changes out of the XXV patch,
    as they change 1G behaviour and are a prerequisite for it.
  * Propagate the axienet_device_reset() error, previously overwritten
    by phylink_fwnode_phy_connect() before being checked.
  * Clear reset_in_progress on the __axienet_device_reset() error paths,
    which the propagated error would otherwise leave set, freezing the 1G
    statistics readers.
  * Make axienet_stop() a no-op after a failed open, replacing the
    per-pointer NULL checks posted earlier, which covered neither the
    NAPI and interrupt paths nor a failed dma_request_chan().
- Patch 4/6:
  * Derive the line rate from phy-mode instead of STAT_CORE_SPEED, which
    PG210 provides only on 64-bit AXI4-Stream builds.
  * Program the MAC RX max packet length from max_frm_size so oversized
    frames are truncated rather than spilling across descriptors, and
    finalize max_mtu from the MAC's jumbo capability.
  * Set default_an_inband, request the optional "ref" clock, and skip the
    GT registers in ethtool -d on IP versions that lack them.
  * Stop advertising pause until flow control is validated, and demote
    the RX block-lock timeout to a debug message.
  * Name the XXV status registers after PG210; two of them described the
    wrong register (0x0400 is STAT_TX_STATUS, 0x0408 is STAT_STATUS).
- Drop the "Make axienet_rmon_ranges non-static for reuse" patch. The XXV
  RMON callback reports only aggregate counters and leaves ranges NULL, so
  the table was never reused and can stay static.
- Patch 6/6:
  * Gate XAE_FEATURE_STATS on xlnx,has-statistics-counters, and gate the
    TICK drain, the periodic work and the final snapshot on it, so a
    design without the block is never touched.
  * Move the draining tick after GT reset-done, as the readable STAT_*
    registers hold unknown data until the first TICK.
  * Mask the counter MSB to its low 16 bits, so bits outside the 48-bit
    counter are not accumulated.
  * Report FrameCheckSequenceErrors / rx_crc_errors from
    stat_rx_packet_bad_fcs, and drop "TX Bad FCS" and "TX Frame Error"
    from ethtool -S, as both are already folded into tx_errors.
  * Keep collection on the periodic work; queries copy the software
    accumulator and can therefore lag it.

V4: https://lore.kernel.org/all/20261006110550.1990213-1-suraj.gupta2@amd.com/

Changes in v4:
- Drop the "legacy" nomenclature and use dmaengine / non-dmaengine terminology
 as it might confuse with MAC instead of driver flow (Andrew Lunn).
- Patch 1/6: Gate the "xlnx,txcsum" DT property behind the MAC's tx_csum
  capability, so TX checksum offload is not advertised for a MAC whose
  hardware cannot complete checksums.
- Patch 2/6: Reword the binding description to state that the
  PCS/PMA is integrated into the IP, and that MDIO bus unavailability and
  SFP module (I2C) management are detailed in the IP (Andrew Lunn).
- Patch 3/6: Reword the dma_err_handler comment from "legacy embedded-DMA
  (1G) path" to "non-dmaengine flow (1G MAC)" (Andrew Lunn).
- Advertise only the core's active line rate.

V3: https://lore.kernel.org/all/20260831150816.1020883-1-suraj.gupta2@amd.com/

Changes in v3:
- Dropped patch 1/7 ("clk: Add devm_clk_bulk_get_enable()"); it has been
  applied to mainline as commit b698927accb1.
- Patch 2/6 (dt-bindings):
  * Added Reviewed-by from Rob Herring. Thanks Rob!

V2: https://lore.kernel.org/all/20260806181153.1213996-1-suraj.gupta2@amd.com/

Changes in v2:
- Patch 1/7:
  * Add Reviewed-by: Brian Masney <bmasney@redhat.com>. Thanks Brian!
- Patch 3/7:
  * Split the XXV binding into its own schema file
    (xlnx,xxv-ethernet.yaml) instead of extending xlnx,axi-ethernet.yaml
    with if/then branches, per Rob Herring's review.
  * Add a multichannel (MCDMA) example.
- Patch 4/7:
  * Require both GT reset-done bits in axienet_xxv_poll_link_ready()
    so polling does not exit before both the TX and RX resets complete.
V1: https://lore.kernel.org/all/20260723123838.125145-1-suraj.gupta2@amd.com/

Suraj Gupta (6):
  net: xilinx: axienet: Introduce axienet_config for MAC-specific ops
  dt-bindings: net: xlnx,xxv-ethernet: Add Xilinx XXV 10G/25G Ethernet
  net: xilinx: axienet: Propagate device reset failure from ndo_open
  net: xilinx: axienet: Add 10G/25G (XXV) ethernet support
  net: xilinx: axienet: Dispatch statistics through axienet_config ops
  net: xilinx: axienet: Add statistics support for XXV ethernet

 .../bindings/net/xlnx,xxv-ethernet.yaml       | 146 ++++
 MAINTAINERS                                   |   1 +
 drivers/net/ethernet/xilinx/Makefile          |   3 +-
 drivers/net/ethernet/xilinx/xilinx_axienet.h  |  96 ++-
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 659 +++++++++++++-----
 .../net/ethernet/xilinx/xilinx_axienet_xxv.c  | 633 +++++++++++++++++
 .../net/ethernet/xilinx/xilinx_axienet_xxv.h  | 151 ++++
 7 files changed, 1506 insertions(+), 183 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml
 create mode 100644 drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c
 create mode 100644 drivers/net/ethernet/xilinx/xilinx_axienet_xxv.h

-- 
2.25.1

