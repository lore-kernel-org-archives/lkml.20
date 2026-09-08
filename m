Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013012.outbound.protection.outlook.com [40.93.196.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCBA519929;
	Tue,  8 Sep 2026 09:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860597; cv=fail; b=dbfgV0EiuyG02NCy7mPe+qgwNaAlAdF7bs80iT462up0UQjWMu02Xe50cWGn55sWfUEnkkAWbQu5GzFm8bSX7rb0CdTRYF/vt8hKt20U7Ygn2NkiiDBqMxbLmV+oLzcD7ZUCL6MrLbzkKq0jIi7fNpTle/g+TRheuIrT0gYvoak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860597; c=relaxed/simple;
	bh=p/ySl0zYx34HgytsqQGVd/A3ygdBAqZbIO0l2m/K4mU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Sc72WbiNp1sgmJLWidIO0Y2e1fhqt/5M8Ej679aMFnhE1BAiMz6IARM+K6izlFAvIELB5NTTPtNi4cIF1zYIodQoDbjsrdzed2kUV7SpPz6kb5mbVDM3i+8WqiooTnc53q06up/3H47OdpAQv5gcNYCxOSB/CT3xZXAbjmDDyjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ftYSizYJ; arc=fail smtp.client-ip=40.93.196.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ftYSizYJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h00ck9J4RCNDKOHiF8RFFt3r+swYDUYErh8wBnFcXzLWYbte1G6KIAUlNbz+rzt4KFzTOTu5iTu70NW+hKqPscqHFlf8/FLP0LK4lGjstwSJ1pt3Jv0CW4d+2lXaGZOJXldvKLNaSkgiPF7EIcEjMNkDMxcEPtOP5WoqHYA6mcimkO50woXYsmOelIyOqvcpin94BUjTFdM4/ZG6H7/9SlslPPNZXtrlVJEf5tNz5aQBbY0cn9V5fNvroneNxLcBOj2yvvgiFrtFQkpg8n1gjxIvSrpQXQKJZOtzU2P9FKb/S1l5JpR94GHvLICuD7h1+zqZXK6OBjkoDAWpXTr4eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlz9KcK1c0it4qe9WKLr69Lb7FPzxnI35UAkdDq59YI=;
 b=gI2m8kgSBeY8Sn7RHSJ7Svx4VwRo8t2z9b2N/sbQf5fSviYsJq71181NDN5PMq67hpPtlgvR4bcSnGebedAdq7Ok1RLOOWQSAirGrB207aWbJ0srOMZoPuQH1CfXQgAOrfxPWeFcQF/uS64DNBjULfz4zUrWqj8mK/AERX3Ah+UECrrQyVFdVmT8muOwCIkbO/h+PLNYCrtmyMsX2GArehyOt+7LLqjUDmUpiclN29RfdmnRV9ZmLFHinlYff2OVgzkaca4SqxVQBHYhCkPpM4creA6pR4LmYwmW6PwlLCONxHyHfMIqm+FuNMXsLcSZcLCZEBz5pfXyFnKtTcbWxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlz9KcK1c0it4qe9WKLr69Lb7FPzxnI35UAkdDq59YI=;
 b=ftYSizYJxbIUHdzcVym8616vm8iteShVrsOPKxZDEAYYYry4oT2IMvXtNCC/nSDkOPFyE0SyrswlCmvE7o/PP/bua0iEgiV60p+OfscTz5YmnXY/wSPglpicr3JsBAKg1g6t6b0EZz40WiIHsGOJHVTP1mpxivYHony2GFMj96w=
Received: from BYAPR21CA0030.namprd21.prod.outlook.com (2603:10b6:a03:114::40)
 by DSWPR12MB999151.namprd12.prod.outlook.com (2603:10b6:8:36b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 09:43:09 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:114:cafe::ac) by BYAPR21CA0030.outlook.office365.com
 (2603:10b6:a03:114::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.4 via Frontend Transport; Tue, 8
 Sep 2026 09:43:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 09:43:08 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 04:43:04 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 8 Sep 2026 04:43:01 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Shubham Patil
	<shubhamsanjay.patil@amd.com>
Subject: [PATCH v3 0/3] i3c: master: amd: Add IBI and hot-join support
Date: Tue, 8 Sep 2026 15:12:54 +0530
Message-ID: <20260908094257.3196120-1-shubhamsanjay.patil@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|DSWPR12MB999151:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e8605f7-33bf-4f51-727f-08df0d8d96ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|13003099007|6133799003|3023799007|10067099003|56012099006|11063799006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info:
	OR1Y3eFFbSJlSEMOCFNrOdijQIwyq6VzbAaCGYBmZEMYAg2ak6eRBF1WW1nZu6qEzW2OTMXic6pDwztoZxj8WmNg7KuhDbiJ5NiTg0md+noa99DJ0j15sC13Z6f5BufAGTyHL+ca7K3eNjOCUWCwbI60U3SX9gmejg1N3d5igTFfJhBkpjqIhKpZCPck57eoGHWCOolPqsPjJWVRUy1YysRP7wZuBuvuPHrg22gZgAmsXPTjWihrOCHh1xxU+DHgjImhEgRSFdQVXTQsiJxn/dHeARWuJiV75v1fyYJLCJTuSX7bRYqBEyiGgbspAIdjusGe8yrqD6kfd0fcX943WIl6kWFMvBlBj/TX6tuaH4Zhyjv9JXAFfLv/FA3g7SG6XGYRipiuxLjhP8krFR/xHb/5cPT8emyr+AWeMGfrtUrZs+n5ZuW6actMWRT80SXBwk4VxTvN73NHQl5DLCNJVqiWojyF5rSyBG62C8MB7na8L7ry7kw7d5hNM7hzOwlEaWsxLXLmB2cR5udQUdQtDxfZ8CSTxvY5qBOd8PY4ZBTuVrEtSSFtu5276p5wr8GGpAbdEHVzYQXg3RS0zPaODWeYJcQYg7+HVaXFmQDjJtODRt2bSobyt98Y0LZm1camuc5BEzhA6Aj5UPkVWXqlyKi5uamGrlm0pNi9Tkl2djDL0+TusyI4c+KRTkzxBF+rzJM2pUHOqbTZZDWwTSjv6Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(13003099007)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S3fzBiP1FMPK0Er+g2W6GeEiiqfwEF6WhkL1bTEK1t4Dyl0XxTTCqMthKywfwDM2OzkrKlbt+hK/LeFZfaYPrJpLT27jGthPd9TpBH2g4QXKc2FdEQ3oSQVPVFmTRznrSC7rjn9yB3ZOifJlIiff4COV1EGtKRGVs22wr7OBuSZ2Qv78yxxm+eOgYYKCiZDeGAdSNOHybgx7fGWPxSkRxQYhODWHNW/OZH+eY6IwKEhBC7Maqb/7hS5uJ68I+X5U3Bd2DbJOrziufwQF39yf3lEcWG3huo704cBc0BE1SiN9z6uH09M0qZ2B83+SyjJGcBnqqZwE+lrC61pNiPuWXq4uK5Slj/QevD1KYCSRvXat3LEM4uSApqdFKYA+xyIsuOgcbLRrUUcLX8RTv1JFW2TrkiznKSk+PMKYiNO8Oh6EBMy4ADpflWi8JKO7dGXj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 09:43:08.2711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8605f7-33bf-4f51-727f-08df0d8d96ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999151

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

Patch 1 adds two boolean properties, in-band-interrupt-capable and
hot-join-capable, in the common i3c.yaml schema. Hot-Join requests are
ACKed by the IBI machinery, so hot-join-capable depends on
in-band-interrupt-capable. The AMD binding still requires interrupts when
IBI is present. The driver assembles its ops at probe from these flags.

Patch 2 adds IBI support. The IBI ACK enable and its interrupt mask are
controller-wide rather than per-target, so they are armed on the first
target to enable IBIs and disarmed on the last to disable them, with
per-target control left on the bus via ENEC/DISEC. IBIs also share the
response and read FIFOs with normal transfers and are distinguished only
by the reserved TID 0x0F, so the controller stops ACKing IBIs for the
duration of a transfer and a target retries instead. One ACKed just
before that takes effect is found by TID while the transfer waits for
its own response, and is delivered through the normal IBI path.

Patch 3 adds Hot-Join. ENTDAA needs bus traffic and can sleep, so it
cannot run in the hard IRQ handler; the Hot-Join event is handed to the
i3c core with i3c_master_queue_hotjoin(), which runs the re-enumeration
from the core workqueue.

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

Shubham Patil (3):
  dt-bindings: i3c: xlnx: Add IBI and hot-join capability properties
  i3c: master: amd: Add support for in-band interrupts
  i3c: master: amd: Add hot-join support

 .../devicetree/bindings/i3c/i3c.yaml          |  15 +
 .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        |   6 +
 drivers/i3c/master/amd-i3c-master.c           | 656 +++++++++++++++++-
 3 files changed, 657 insertions(+), 20 deletions(-)

-- 
2.34.1

