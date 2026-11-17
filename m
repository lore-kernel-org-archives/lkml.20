Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794902680;
	b=OsU453g+g2i8DycGQf6+vLFsMoW3q/zofm15mgSZjb5CVu/vIEm1FojA4oHtMBRKWC6q
	 iN81rTAykVam3hxBRCVqoawENS/8obs4di9eK6aU7YyHOwW1FVYCSuL7kwG/K+8R/MHym
	 VJRkEquB46yIkddZ066laC/9j7EZklpkVuP0KawpEO7rNSavLiugURztNjNVMAmASGb9G
	 Al0Ur8dSyUXAyKSNVpEf8Z1dSlUuUmCVe31ffcTPH/oMAC7a8z7MT1VyDGtkbTplrlrWJ
	 GRFOTXDk/FzmjyzUELynYu9xkQ65f0J8EoLvPSF1LzUnJeL9EyATUUBGT8bKIPB9UUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902680;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
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
	bh=9RDQLtC1wfCN0pGgwIv523udHULjujSvU/utEtRr+WU=;
	b=kZ6vY/wmeS+kVLPdvYRQ+AEWrNakUbN8uvbqDpY6f5TgJEyMn+uNJmPmm1oOAovF2I9F
	 q54eGe84XKE56OKP2y+GOL3dfZYmnlyY7P+vu8j781wPNs7hmMZbgQR6lg94KtMzuvGCp
	 Bd2Cc4dWbUSDE/zJsk+8skOXx4Ib82Wz5NzCe/yzHMOGHqOufG5VtW/d8MORFoHdImBh4
	 zVlN8cvmYFqc7OgBAb6ZOk5myJsVPqVrfC40yMMuGmJ8/vRGEo4Q3/tqK1AsPNv5TDsdq
	 i/Vd63wGAM+NuIoHLogwB6eD/X/fIGjGSzOfT7PvN8fiiWgyJzDxd5L1i8DdFuzcHrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="hW/Oieii";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.4
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011004.outbound.protection.outlook.com [40.107.208.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5595C606A89D;
	Tue, 17 Nov 2026 08:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5595C606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hW/Oieii
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGdFIPRlJ0DFkrJPj2OdM4030Z1KMpxeljhMI8mSiLysAHl8zq1N7hP+o8iAb4uQrOt4qQxzBn3ZiZr0LAiPLLT0oXXT4U/6jRWxXVSwXd3dTHTPFBfwtZdpDVnzKPWN0z6S48fwZSEIyoXdYkFAGcT08treDdvOL6mIYVSPtN7AuGd25j51NfkN0x4iMNHWpevBXQLIXmER4k1KG2j9Kiay4wHR2sgotESeWHqqOpLZW/KekXAcngC/Sa1oBcuxw2B3aop8gN8Ys6/uj3YRLMG1Fe5YL1G5Jx0NQm84jCR+1a8xviMOBObTzz3bobvUN1PLaLjweazuM1emvoZddQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RDQLtC1wfCN0pGgwIv523udHULjujSvU/utEtRr+WU=;
 b=BK25ifTtWryTUqYC3y/bFg0809WfLEj3GY91SEZPMGF2Af7JyV3qMTFrAX3/Ja/UDbBYXt1z0negYmJ3fEP6/eKK8piDuHCTcP2OcrF0YRKDiPaJXcSe7hmResWsi36/Y60vcbo/2hBLjsJmVdz62+hYmZGojMaYf8MfMqAiKigqIo56fypBX6Je81OmlfUGPwt3uP8bQ8w337nWIPeNADm6HFTpcP5X5TJqcFViZYBNPoK7kyal9bBRKGlM0eNJDvbGtTuBkxTuCuBOBogpbXVJrN0T7mlK/f0CHmYppopAZXdOfJz8xbo6Kg8vWAudPC6w9fWZYfZqI6EuJoX+XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RDQLtC1wfCN0pGgwIv523udHULjujSvU/utEtRr+WU=;
 b=hW/Oieii/eJ1yTgM595Ct37Qhm8zNzrjs/CiS6Mgwrz/+g2r/57LEwR+VN70SLXcpRK7m7NWZiyNFgchWTFcMyrQN+jVihIavZcjo5ACQLFIW3S6vxEtfhkSpBWo20Cj46mu3jaRlgzNrEFswUNDp81OG8duVpWpYZtl5U7rbAs=
Received: from MN2PR16CA0045.namprd16.prod.outlook.com (2603:10b6:208:234::14)
 by IA4PR12MB932075.namprd12.prod.outlook.com (2603:10b6:207:12d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:04:36 +0000
Received: from BN2PEPF0000A991.namprd04.prod.outlook.com
 (2603:10b6:208:234:cafe::67) by MN2PR16CA0045.outlook.office365.com
 (2603:10b6:208:234::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 08:04:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A991.mail.protection.outlook.com (10.167.248.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 08:04:36 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 02:04:35 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 02:04:31 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v2 09/11] soundwire: generic_bandwidth_allocation: export bandwidth helper functions
Date: Tue, 17 Nov 2026 13:31:48 +0530
Message-ID: <20261117080239.918428-10-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117080239.918428-1-Vijendar.Mukunda@amd.com>
References: <20261117080239.918428-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A991:EE_|IA4PR12MB932075:EE_
X-MS-Office365-Filtering-Correlation-Id: a38c5266-0db3-44de-4820-08df44816c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261021123027099003|261022113327099003|261021121427099003|261022105027099003|261102130727099003|261102123227099003|261009220027099003|261009221727099003|261009223327099003|261009223027099003|261009221227099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ROIji5vfRpmKt4FLrllm72EN8PcbrFYHXh+hkmEYgiNhErjcaaij9msRWJbOfBMq3cmSNjeAGnerYIg4DcE8bHd15CK2AT5hU1hc33hX+ku5x5UIraeL8Oi+H5qS9dy7MLQM7sM9XLYzsoBXIMn8+RJQX0QIUlOrk8g+XLv6Q/wc6FW2llMR068o4wk2QSOeAiHaCg246w4yPz/CMzH8rn5fXoSGmrFjj+hAS4MJQK890h2In85JMDFFfJXXKH1dM4OiyFlkILHzP8um2DyS8Bluptba2zTdBedwPFZdxaCagoQoDfu6NIU1VIi59+dr6VfVfnbVVbt8MwWntGy2mXJzcoRBGppsCjPflETkc3fKtKOsXXYew7hqNsLE3S/sK4RGLMiMZeUDCUwqYwZIoS/bWexCe/CfKFX47L+/mJ3BqydFF56Z2YL8iSTt4KCVx17Pxl+eRwiXDKvPkFOeoPuKAusmDCvdizhfRcseiWeC2V9WOqLs64x+ZxRjOYMHj/0NykwrKsyHjjoXUj9OcExLk8ouE1v1Ibzpc+iBEesQs80IdYfNpGPhLkehvd7Qh8Jj0ZhBIo5lExyyJ0g16jioCPrbHtMjmAb7lMbVCF6xzUf7zpRH95+H5luNkjFCTjZrSjwK28DJC6vINRG3bq7nOC1Z0UYO3h0nk9Gkjkp/r5hpXtm1VnsCRrFXbrbtknR3vNbdrXCC/gKdZUtoPw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261021123027099003)(261022113327099003)(261021121427099003)(261022105027099003)(261102130727099003)(261102123227099003)(261009220027099003)(261009221727099003)(261009223327099003)(261009223027099003)(261009221227099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZpuLnutLF32oymkocnOOIiNffSk5d3kwSBvohfvf2pGYTupG59nRmaOWKSH6MAFbSg10LrMFKZZzH8DEZSFSE5kSWDXOAuduMYlNfbBjswPZzCPCXAc2H3afzRkicZ3WYYgZqKaHmohCaIIBoLsNhUgMZUb6t2ls1peW7XVap3j1ng3k1kw8e/yLWtJ1XXV+fu3X4jZcyYrAcsfsXtzviS1wAlNvdI7HMhKGX5+7O/Ltq/mVK6AGcRAbtfOQL6pLKSBB9PU52FJ+SYw+MjNY+46RO41zbE8NQ1YSBepXxXqyBbY96ktAal8xxhT4+4a1+SOK3FSIAQqKHS1YfAmNZzozgqUex5vnYvx5rIdIvvitHU2YcMTO6Gtl0bW5zlp08JS56o+Nlg1nXbiAMIqVedhyJxhbd2445EK4lcKXdABcEugjrCvWtiG/ZqJlwlQn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:04:36.4571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a38c5266-0db3-44de-4820-08df44816c19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A991.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB932075

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

