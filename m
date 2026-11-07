Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794089469;
	b=qrSIZVGu6kl20mVsWfV1LlFdC9/9cM1U8ZzAzPwKSKs8Py69eXx+OH2ybL1D9/x+g7zp
	 sj20u2gAMHSBuYUlHIMhJWJnQFrJQwPl0tK8H6UXn4brZF0+FCG/rZmvWyyDg5xyiMpZa
	 NLZNQ/NVmxoHXt8N/51CkSOtWBowdWkyxzdpVVwvMhib3zPvflK/1qNUj8l+xNkr/SGne
	 28NIuXEV3EmRgvGW6fWQnqubF8vvO2Z5IrDY5dIPYegH2VEYwNpcX2KNL1op76E6pVfTb
	 eDN9pY+cDCk4mhZj89INyaPo6Cf1Pz2aqMFWRePXOPwtx0U+Xw6ds1RyWD7oqT3rGAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089469;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=9RDQLtC1wfCN0pGgwIv523udHULjujSvU/utEtRr+WU=;
	b=yA2ovR7VbEUTebi9YCd2nzh+o2QcI9SbAuF5wY2cspGjTmIOkVAV7tZycF0fyPacYY4X
	 /mEkbKIVIJET53k1HpiDr/pKw6WL06QskvGphw1VOPyiE+YWF9wfJ+ahEyQmCJU4Jkgvj
	 ssteqO9kjwXplBIk18+A2mVc1EeZA5P4kuALJFY0aggE+YgvDWY28iAJXgJ2sxxKTfyRU
	 E5CKHiXoK7+P+vFuKbqrOGibgBwhxtqRhYGspgwtlP4EQu68+tUlNbr8NsElVXm+RLA7f
	 zAR5KgjNXTOD4C+QUnXCaJD7hEbwhDAlejiPtVlvwK/aCAYz8FLS8VyH/1rMEv1nDaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Vsf5WSkX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.15
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013015.outbound.protection.outlook.com [40.107.201.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A16D606A326;
	Sat,  7 Nov 2026 22:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A16D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Vsf5WSkX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRhzaef355lAdFfo9+dkZlqcRf5RzHewG1W+htCfSbAA6yCiSqpe5wb686hx2/igghtICEsDXmCMSbw3/rTk91aZQ4DNehSuiVR652MGReyqgzM/bYTvUMp37p8STxjBxpUkj8uPwpRTpHtK4rxrUX/+TTNjDxGpMFa4r8oFUKaBUrUIKOFiPnY6m8hzVudSfEuLb5S9QQ9lIcvcuUw5Oh9uWrVOPZbwSjT69nGHNSGeY9RMeMkK1aQ0yeaTK/KJ+9kBEGY9RhPy5FoFRKaxqN2ZBPVCE9A4qp0LOa5/vIkUkNFe88R9Y0aB15EVlsoG0ugoxwoIzCJbczC2pbw3Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RDQLtC1wfCN0pGgwIv523udHULjujSvU/utEtRr+WU=;
 b=rWI9g7psZeHm8A7lqwmQ96c3BvDImVl02Kvg9A4BO6zVliEgGoSlhjswqnGZ3hFN1ZdBjBVDKLJ3xlJ4fICV6Da6LOBStaDJnryR37xhEp+u0T6dT+kgjs+8PbgnYCABBlKL9i6ukxQxqRxKp3IaCPHike6bNc+1j14fHkYZb5AXb26TEgpdDuA0nhQz4q0/OY2z44AgwKxtDG4+ZiYi1dq2u8NEXCbbThf5TxYMxIiRzOsrxePFUeRqMN+BkDT1Bxwlrp+AZhTXhNrGsoG7qO1hPVtLJRp7K1dA7oZ/NBVg65ppan0DnHrgE8DcM6/BjUEEAwjh6+iLdAAcLwz9ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RDQLtC1wfCN0pGgwIv523udHULjujSvU/utEtRr+WU=;
 b=Vsf5WSkX5/U82fSYPEzVMhclgiWb2na/P/t1zG874Y6zq7r1RQJGP6oOTRvn1XNR5sXi9jsKattbrqF96r9QCu5l15COZYHoWKJfI8l3dAjT5GC2j0+kdHOErrCCDwfc9bU9Li7S0i34+dkv/W/1QlA3jfOQmi/WtvakV8bpn9A=
Received: from BN9PR03CA0970.namprd03.prod.outlook.com (2603:10b6:408:109::15)
 by PH0PR12MB7816.namprd12.prod.outlook.com (2603:10b6:510:28c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 22:11:04 +0000
Received: from BN3PEPF00022BD0.namprd03.prod.outlook.com
 (2603:10b6:408:109:cafe::63) by BN9PR03CA0970.outlook.office365.com
 (2603:10b6:408:109::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Sat, 7
 Nov 2026 22:11:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BD0.mail.protection.outlook.com (10.167.248.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 22:11:03 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 16:11:03 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 16:11:02 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 16:10:59 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>, <Poojitha.N@amd.com>,
	<sravisar@amd.com>, <Richard.Gong@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 09/11] soundwire: generic_bandwidth_allocation: export bandwidth helper functions
Date: Sun, 8 Nov 2026 03:38:04 +0530
Message-ID: <20261107220913.4058072-10-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107220913.4058072-1-Vijendar.Mukunda@amd.com>
References: <20261107220913.4058072-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD0:EE_|PH0PR12MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: b5d282e1-c469-47e2-d8de-08df3d1c038e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|11063799006|56012099006|261021123027099003|261009223027099003|261022075727099003|261009220027099003|261022105027099003|261021121427099003|261009221227099003|261009221727099003|261009223327099003|261102123227099003|261102130727099003|261026121527099003|261026140227099003|261028144727099003|261022113327099003|22082099003|18002099003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	jyQKbMY6nwMb5uKxHJYZxaLjtmw8IGN2Uk22CeDDwV+InBQKCq2SfBDXijqz3DrpzBD4FQ0vMRO5CWCNagQPKo3ey+z1pKUq7mt537VUri5SovxWj6gXMLt1kG8ZzXabRc8XNp2e9YFWW1Uz2pad+lAMLjvq10FL5F7fYivFkqqF3WnUBMypZKQo1HUjlOnjJTOgAWeG2pf0RSrShyqWLfvR+IbqMBhNTilNd3y4gRISrcvGb/U4bPGoSyFfZ60e+7LzqUdhyja8yv10U/hmpWuXCRZjjInuXxITEs5TanmNqsHZQd7cIp8jTXwKZvJMOhal7/QD3n+Ao2IIMNz50/I8TMcIACdWvUsviEta4atnmUZbFvA2iv7T+x1sDyE+sY9HYIiN73HGf8w0QN4ZulkJB1VUmSAMzanrK73SoPl7s6WAt5hKU2YFl4gbUvwQO84rgQmRWwe/2TjH1B/9KIvSuSlPGI/8BJZe5t71v1rUAP+C2KcAbaMREQnz/qYozPZq4sse43uiUg7es9sICkaEfL8ijO0e23BL9jSSlboSRhNEkAN6KV/ldydvetBbF05KxXK6vQmaOKoGtBGcb0rOkwGyvY5TZDVlJFQrza43z5v2yJHi7jwuJ8JKYOFhkW2x4iAlD3t6+p+ePYSU30Yob/XVF2KMoOSJH5jGXwhQ6M7wiNN62DhbgNQpEvqpn9eq5Tu60jY0d/xJUHKjbQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261022075727099003)(261009220027099003)(261022105027099003)(261021121427099003)(261009221227099003)(261009221727099003)(261009223327099003)(261102123227099003)(261102130727099003)(261026121527099003)(261026140227099003)(261028144727099003)(261022113327099003)(22082099003)(18002099003)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Fj5Ddjg94wnBPhHv3BlkJNlhTSNbTcnKe7IVROTWUqgQ+pedNEZtTOra1uiNh1h05W2ViKHeVAOw3nwmS1WGom9Tk7t21Cl7Qk2wmjaSQQdELWVJf4hv9nSc+zHxh8nQb9LDenoh8vMLPI+zGri5KqzNgLVebyyzFPm8/7fheycLZOqU51zMpF8/dYknmV1RJ9ac78EPp0ACwnAPCQMgAmpRtf2dSTG5/Wz8A7qtu/uV+2vAcjNsjyKLtcWk+0rX1ASX94qn66lIj1rzi8DmfoeleRfwm5/s2Xccuzdwo3mQkpFWiHBjY/kJOFvh9AAgoC48H8EOB8tCv0YLLUx44dKIX2dHWCCTCNPxn+4ZD3E6ZcDjRaNMisiYql4pSc6Aaf30F+qbLyov+SnWcD1q4av5Rd3nBIe2/EQ6TWVgfZrNuKtWPzDKD+Izg0XDCXtX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 22:11:03.7553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d282e1-c469-47e2-d8de-08df3d1c038e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7816

Export sdw_compute_dp0_port_params(), sdw_compute_port_params(),
sdw_select_row_col(), is_clock_scaling_supported() and
get_manager_lane() so that out-of-tree or modular SoundWire manager
drivers can call them directly. Remove the static qualifier from each
function and add the corresponding EXPORT_SYMBOL() and prototype in
bus.h.

Signed-off-by: Poojitha N <Poojitha.N@amd.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/bus.h                         |  6 ++++++
 .../soundwire/generic_bandwidth_allocation.c    | 17 +++++++++++------
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 44e4f5193917..0c5c343b2c1c 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -241,5 +241,11 @@ void sdw_clear_slave_status(struct sdw_bus *bus, u32 request);
 int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
 void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
 			     struct sdw_transport_data *t_data);
+void sdw_compute_dp0_port_params(struct sdw_bus *bus);
+int sdw_compute_port_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream);
+int sdw_select_row_col(struct sdw_bus *bus, int clk_freq);
+bool is_clock_scaling_supported(struct sdw_bus *bus);
+int get_manager_lane(struct sdw_bus *bus, struct sdw_master_runtime *m_rt,
+		     struct sdw_slave_runtime *s_rt, unsigned int curr_dr_freq);
 
 #endif /* __SDW_BUS_H */
diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 1dd3b2e5420c..cf2d2275b6aa 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -124,7 +124,7 @@ static void sdw_compute_dp0_master_ports(struct sdw_master_runtime *m_rt)
 	}
 }
 
-static void sdw_compute_dp0_port_params(struct sdw_bus *bus)
+void sdw_compute_dp0_port_params(struct sdw_bus *bus)
 {
 	struct sdw_master_runtime *m_rt;
 
@@ -136,6 +136,7 @@ static void sdw_compute_dp0_port_params(struct sdw_bus *bus)
 		sdw_compute_dp0_slave_ports(m_rt);
 	}
 }
+EXPORT_SYMBOL(sdw_compute_dp0_port_params);
 
 static void sdw_compute_master_ports(struct sdw_master_runtime *m_rt,
 				     struct sdw_group_params *params,
@@ -397,7 +398,7 @@ static int sdw_get_group_count(struct sdw_bus *bus,
  * @bus: SDW Bus instance
  * @stream: Soundwire stream
  */
-static int sdw_compute_port_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
+int sdw_compute_port_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
 {
 	struct sdw_group_params *params = NULL;
 	struct sdw_group group;
@@ -431,8 +432,9 @@ static int sdw_compute_port_params(struct sdw_bus *bus, struct sdw_stream_runtim
 
 	return ret;
 }
+EXPORT_SYMBOL(sdw_compute_port_params);
 
-static int sdw_select_row_col(struct sdw_bus *bus, int clk_freq)
+int sdw_select_row_col(struct sdw_bus *bus, int clk_freq)
 {
 	struct sdw_master_prop *prop = &bus->prop;
 	int r, c;
@@ -455,8 +457,9 @@ static int sdw_select_row_col(struct sdw_bus *bus, int clk_freq)
 
 	return -EINVAL;
 }
+EXPORT_SYMBOL(sdw_select_row_col);
 
-static bool is_clock_scaling_supported(struct sdw_bus *bus)
+bool is_clock_scaling_supported(struct sdw_bus *bus)
 {
 	struct sdw_master_runtime *m_rt;
 	struct sdw_slave_runtime *s_rt;
@@ -468,6 +471,7 @@ static bool is_clock_scaling_supported(struct sdw_bus *bus)
 
 	return true;
 }
+EXPORT_SYMBOL(is_clock_scaling_supported);
 
 /**
  * is_lane_connected_to_all_peripherals: Check if the given manager lane connects to all peripherals
@@ -500,8 +504,8 @@ static bool is_lane_connected_to_all_peripherals(struct sdw_master_runtime *m_rt
 	return true;
 }
 
-static int get_manager_lane(struct sdw_bus *bus, struct sdw_master_runtime *m_rt,
-			    struct sdw_slave_runtime *s_rt, unsigned int curr_dr_freq)
+int get_manager_lane(struct sdw_bus *bus, struct sdw_master_runtime *m_rt,
+		     struct sdw_slave_runtime *s_rt, unsigned int curr_dr_freq)
 {
 	struct sdw_slave_prop *slave_prop = &s_rt->slave->prop;
 	struct sdw_port_runtime *m_p_rt;
@@ -544,6 +548,7 @@ static int get_manager_lane(struct sdw_bus *bus, struct sdw_master_runtime *m_rt
 	/* No available multi lane found, only lane 0 can be used */
 	return 0;
 }
+EXPORT_SYMBOL(get_manager_lane);
 
 /**
  * sdw_compute_bus_params: Compute bus parameters
-- 
2.53.0

