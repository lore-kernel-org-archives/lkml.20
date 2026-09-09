Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011018.outbound.protection.outlook.com [40.93.194.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A50C3DAAB6;
	Wed,  9 Sep 2026 07:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938036; cv=fail; b=fCJWKB5BgwQHH6jpAfkrQAbOOCyfACFdzXxYKaXqGzdpnnkhJkoKX9pHMwGSQSOjV1lzhFkMAK+I/cajE0M21wbOXC3xnv1HsBw/RRwDKDFwIEHt+j3pw9+2WElWk5stIjAeMNViyVo4hjXyZiIfwYuBBntZFIv80F8YHRNfVzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938036; c=relaxed/simple;
	bh=lS1i++NmOU76Fvo+PjvAqvnvIf3SFxAFJ6HFzkx+i5o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f16Ymzl0EHRZghpuv+4+Yr9jxPCV22rXWSp3jvOYuYHmSjiUV6yVqcdUulsVPrFWxYwkdJFDRHYCIPcVEi7WM2z6/gRiMocrbcWr/K2tyjnlmB/da+G/omvy0FywnfwKzbn78aso9zZhXzRiFIOBkLhxV40WZjFaf/vEXDPEWTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2uv1xgTQ; arc=fail smtp.client-ip=40.93.194.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2uv1xgTQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQBdxQkIH2b1I6yM1ULL/9sKIf0G1eW39SSW9VfcOkTfsWz3MSCN4qkYTY3E8JYzSEbfOGqRmC8g6YC2JwusYK5+8VjSCpV3awwvDIQ24fC/ITEU0mHQ1k6sFOuq9VxR6IzaFzaNRQV0FmftMnlHfOjVNPjvP9u1WFH6+6Y/IIzvy3N1DpK5CWTSKk7NLZ9BbfYbNLJJ87kTAd6Q4pgIzJtODi7PeMfI+77dYnYu8lurpwtigYE1Bivu2+02wdW78Rq596b5zSj0qY9ol5PnSI+IZczZynxe/V77P1SzSx55EcW3DK+3L7TCH4b8cJASiySA6bg2J9wnW/pu5mRSQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VQu9mJKVTeqdHyw3WQWZLhrmsZnhsfL+ZASoh/JPag=;
 b=j8BBbjnI9jBn5kgR8/MmnXcvH0YeqjQDsbr3xjqGwBQo/qVigVJjhy8BQB2upWqMnRS1nmutdiGNc9f1HpYNenuE7XolMGJ2IoEcIWmsknDnTpDHUeAmGvTBgYY+sjs3nSvZAT+TTxeTUONcFzcVyeHeMrNq+LUx0Q16aRDnJPcG1/o48Z8Zbxt6w4aFCCjTldtSIZwhUx7LmXJcpCEQVqMllHHxfS8vGozTOTeMN5K2N2QdKcmSXfeXmVXoSJshRn9Q6ovmrSltLRFWzBS1qhLKT3p+QPkPLD8x+EhH79N6RUL/Sv3cZWQ8l4WgALfJUx3jnpHEu9blOU8fpv1Knw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VQu9mJKVTeqdHyw3WQWZLhrmsZnhsfL+ZASoh/JPag=;
 b=2uv1xgTQLRP8OSd9kvsPcfDAroNT01e8tD1aG5OycPSJsCug0HkvjpcLhSEdksfJj28IYUZ8Kke0ME039EkB91tvoSBYR47JcTeNmRnQsUMbCB/EBZNsvR7B+KnFrqPrBXnP1M2anzSlVJn5bp024zztb251GhnjsWQ4SwSdx74=
Received: from SJ0PR03CA0184.namprd03.prod.outlook.com (2603:10b6:a03:2ef::9)
 by DS2PR12MB9590.namprd12.prod.outlook.com (2603:10b6:8:279::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 07:13:47 +0000
Received: from CO1PEPF00012E81.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::74) by SJ0PR03CA0184.outlook.office365.com
 (2603:10b6:a03:2ef::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Wed, 9
 Sep 2026 07:13:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E81.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 07:13:46 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 02:13:45 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 02:13:45 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 9 Sep 2026 02:13:42 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Shubham Patil
	<shubhamsanjay.patil@amd.com>
Subject: [PATCH v4 0/3] i3c: master: amd: Add IBI and hot-join support
Date: Wed, 9 Sep 2026 12:43:37 +0530
Message-ID: <20260909071340.3649271-1-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E81:EE_|DS2PR12MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: 193a483d-28b8-4e41-b11c-08df0e41e3ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|10067099003|6133799003|3023799007|18002099003|5023799004|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	hRMRrn3xelo+dOEfSiMhEbV+GwsuNL8A+Xb5RzkapFm8T+uvpvmB+RRVhxx4Cd3GzQdQJObAVOiqEfcIELJBdJCfN3azgT58OLV2L1SbVppSP5oGyGenZvFlohQy1z8gA4aJC791bE84tiZaDf9+sWoFAyyLOOxYo8qY9UkXJ+7UWMzQfLVQwipPd17eAtYRbSJDxPIl+Xe4HNQ2rOLwJwOdw8yoSsBK5yVbVNBpsCkdEeo08caFVGS1YX4lLYbSpjRX8Whav4z2j+K6f+wTtmtBcI+uefaQUymNtTjjMIRCVlLdT/Hob5dnu+7IIlYQp/6WV+FWkKaO6njPWYcheLtgKMqbU2LnSKTUlcMOf5wKXUIWSmKC0eXuNFf4Uv8duG4AY01F+TsAQzpWn7DcgJU0ROaMVDn9RFHTzNc69p+rLC/TsU5o92mvHHZNyU946Oqw0tx1ma+BAngfnxD0AdY26neNPOhupvnxUdUKcIqRW02u/Wl//jtkBMfDOJ671jUt9c8H8poVLZJYYXd/FJo02lSMxvy9lLMsfY7L3nEGEKN1m8ZSe5lVPESFfzWldyl2n0Tp2xTn0ulLNbG0sosGILDfRdOSQpYknbqshfCEQUh7qEddXjWwI1JPuAXJIfSKC539YvxtH2iESHnIRVU6FPoZbun8crxgO/Yr2l54apa7GKmzl8CbUKSZy5wJrWI2N2bkn5rjNCPFdS94sA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(10067099003)(6133799003)(3023799007)(18002099003)(5023799004)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	a8MGNyJAakGTISsgx8kDXyKRk66cpSfHACr2XQHNg6KsKPOuDsFK8Ee2q+X2vf6TfBU0rsXBZZViGyI8wsFWUIpxTqs9uI5hN/jggHQIsMZbmrg6DufE8PU9BoYS95cJ+rIjcycaMNL5WlW7/n750Cw9xcgVEppx3R/sDMvo6+1g+WmAYrZDY0dgWS9f1ErmRuhcEP7aSFz4r1n3yxCuBTD3ZDSF5BR2YYp+ZfndR/8MQadTZAWc7E28A8gnkXkwazLEHMLyH6DZ6XIDke4nLPY6fpUwZzhOHXvJZ8ttfzlcVU+0GrLjIIOmAcEOZIDHZeaG293xkZaFfIbVzJgShMen8E9/W/Zqvpsm+1KabUzUCYdMFPYuvmH7kSFOGUSHQMF+8OgEMldXLSD0+sNj9ZfuVNGhsUc8EvsN5yM1LvRLVIRX81rZ+SS/e5Bd4lzX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 07:13:46.5939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 193a483d-28b8-4e41-b11c-08df0e41e3ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9590

This series adds In-Band Interrupt (IBI) and Hot-Join support to the AMD
AXI I3C master controller driver.

An In-Band Interrupt (IBI) replaces the dedicated interrupt pin an I2C
slave would otherwise need. When the bus is idle, a target wanting
attention pulls SDA low to generate a START, then drives its own dynamic
address with RnW=1 during the arbitrated address header. The controller
either ACKs the request, accepting the interrupt and optionally reading a
Mandatory Data Byte and payload, or NACKs it. The interrupt therefore
travels in band on SDA/SCL, saving a wire per device.

Hot-Join (HJ) lets a target that was not present at boot join a running
bus, after being powered up later or physically attached. Having no
dynamic address yet, it arbitrates using the reserved Hot-Join address;
the controller ACKs that and runs dynamic address assignment to enumerate
it. The same hardware arbitrates and ACKs it as an IBI.

This series adds optional In-Band Interrupt (IBI) and Hot-Join support
to the Xilinx AXI I3C master driver. The controller is soft IP
synthesized into FPGA fabric, not fixed SoC hardware. IBI and Hot-Join
are Vivado synthesis-time options, so two bitstreams — or two instances
in the same design — can share the same IP version and compatible
string yet differ in which features are enabled. A single device may
contain multiple instances in mixed configurations. The compatible
string identifies the IP and its version, but not the capabilities of a
particular instance.

Patch 1 adds two boolean device tree properties,
xlnx,in-band-interrupt-capable and xlnx,hot-join-capable, to describe
what each instance implements. Hot-Join requests are ACKed by the IBI
machinery, so xlnx,hot-join-capable depends on
xlnx,in-band-interrupt-capable and the binding enforces that
dependency. The controller interrupt carries only IBI and Hot-Join
events, so it is required only for in-band-interrupt-capable designs.
The driver assembles its ops at probe time from these capability flags.

Patch 2 adds IBI support. The IBI ACK enable and its interrupt mask are
controller-wide rather than per-target, so they are armed on the first
target to enable IBIs and disarmed on the last to disable them, with
per-target control left on the bus via ENEC/DISEC. IBIs also share the
response and read FIFOs with normal transfers and are distinguished only
by the reserved TID 0x0F, so the controller stops ACKing IBIs for the
duration of a transfer and a target retries instead. One ACKed just
before that takes effect is found by TID while the transfer waits for its
own response, and is delivered through the normal IBI path.

Patch 3 adds Hot-Join. ENTDAA needs bus traffic and can sleep, so it
cannot run in the hard IRQ handler; the Hot-Join event is handed to the
i3c core with i3c_master_queue_hotjoin(), which runs the re-enumeration
from the core workqueue.

Changes in v4:
 - Patch 1: Restore v2 DT. Keep xlnx,in-band-interrupt-capable and
   xlnx,hot-join-capable in the AMD binding; do not move them into
   i3c.yaml.
   Added Acked-by: Conor Dooley tag.
 - Patch 2: Probe "xlnx,in-band-interrupt-capable" again.
 - Patch 3: Probe "xlnx,hot-join-capable" again.

Changes in v3:
 - Patch 1: Move in-band-interrupt-capable and hot-join-capable into
   i3c.yaml and drop the xlnx, prefix. Keep the HJ-depends-on-IBI and
   IBI-requires-interrupts constraints in the AMD binding.
 - Patch 2: In xi3c_xfer_resp_available(), read IBI_TARGET_ADDR before
   popping RESP_STATUS_FIFO so a raced IBI is not paired with the next
   address. Call i3c_dev_set_master_data() before publishing the IBI.
 - Patch 3: Probe the generic hot-join-capable property.

Changes in v2:
 - Patch 1: Renamed the properties to "xlnx,in-band-interrupt-capable"
   and "xlnx,hot-join-capable" and expanded their descriptions; expressed
   the interrupt requirement with dependencies: instead of an
   allOf/if-then clause.
 - Patch 2: Do not lose an IBI raced with a transfer - the IBI ACK is now
   held off for the duration of a transfer so the target retries, and one
   accepted just before that is delivered through the normal IBI path
   instead of being drained, which could also consume the transfer's read
   data. disable_ibi() returns early on DISEC failure instead of
   disarming and desyncing ibi.enabled_count from the core. Added
   synchronize_irq() before disable_ibi() returns and before free_ibi()
   frees the pool. Reworded commit message accordingly.
 - Patch 3: Use the core's i3c_master_queue_hotjoin() instead of a
   private work item, and only queue when the design is hot-join capable;
   the core owns the work and cancels it on unregister. Reworded commit
   message accordingly.

v1:
  https://lore.kernel.org/all/20260814115155.3974988-1-
  shubhamsanjay.patil@amd.com/
v2:
  https://lore.kernel.org/all/20260824044835.2924141-1-
  shubhamsanjay.patil@amd.com/
v3:
  https://lore.kernel.org/all/20260908094257.3196120-4-
  shubhamsanjay.patil@amd.com/

Shubham Patil (3):
  dt-bindings: i3c: xlnx: Add IBI and hot-join capability properties
  i3c: master: amd: Add support for in-band interrupts
  i3c: master: amd: Add hot-join support

 .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        |  24 +
 drivers/i3c/master/amd-i3c-master.c           | 656 +++++++++++++++++-
 2 files changed, 660 insertions(+), 20 deletions(-)

-- 
2.34.1

