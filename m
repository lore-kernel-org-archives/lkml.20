Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794089464;
	b=KM50a4HBfUcqsZbsmDXTfW0VeQWfwoAHoz4q34R5Foy6tHu3D95aI95nKygG2QAEvmZU
	 h+N0U2bbKb1Q1PDM35ojdDIrz4ObAIQlSTL9gMqDe/lEPa4UOsH6XyR0Icm52rOoUFYkh
	 f/Ug25+gD+GMW4oRTTYdiZ/RlaF2UhGQXVz/QpT8JL0dnksSZvd4j+wBO3zCzaPj2pGf8
	 Yt2ZLX3CRnFrEed6oiswohdW65vvdKqKQ+1Pq/uhH/7GuD2Ur7p7+acj2z6tX1Yb//fJc
	 accs1hTZl49ShRWgnouSE+Jr6MribWrreYwvaRI8DpiYcfG6qFEF5BcoetAcZTDE4hA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089464;
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
	bh=axO6uJEyfoN/wpFiS1dW4TBc5SCgHMz+SoGyyHXh8g4=;
	b=4TftHlwcWbY5kpVcp7I4t7AVghsUVg7lOEmvGcODQSNb+v+IbKYEK58nVS6vd6V4lhzx
	 Qufv68zy751YHP5h45xSAGruYmeIvLzo0u7KEAorjhJZUBIQUjaPZ3FDugyC2Nmrl1/TS
	 O7s6nPi9+Z4PZjNk1tAWL2DtWuKMnlHODXyiBxDcE9RJAxsDweaOazKjhpfcv6zmQPXr6
	 i+awRLFZClbc0LePMgQ9hph5aeutTRFQcDSEZBoczih46HOU9B9pq697bV+jRMJ2u+SgU
	 5RV9AREQuSioBhluEZaLIaoV41XYOwSQvZ012orkm0SpYZI68kK0CaxqCSyRsFLPT6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VH3Kb14k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.39
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010039.outbound.protection.outlook.com [52.101.46.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5DA606A32E;
	Sat,  7 Nov 2026 22:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C5DA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VH3Kb14k
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rj0KVfrHoTzJ5CSTZQ/4czx33UeFu/OXVKPRLtyDMz6Y7OveAdUM8Bin87HPSSSDQrVMXOyB9neI8lU4CBwFBErsIFthfjvCv6+JYuk/mhksOI4QpC2sppc2YQhpOAHBQlHJZa76rteWqHTcaFYeTCgiO5Rx2SHyi0wG4LWIXF81BZ4BG7Lsw4Sl+mPJ3szvxT5756fVPzK3WWjfUlxbq8u4RTNeDzVqGi+moNCYry7JPzSDaB4AXNN9/te2c21ZmR4i7qFr+7QSXK94YP86kXXgV80nA07po7IvtP4O6TxTMfEvw/HO6EBMHIQOrDPHpeDaPL39vdjuJs3Ndr6ncQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axO6uJEyfoN/wpFiS1dW4TBc5SCgHMz+SoGyyHXh8g4=;
 b=i51nLhzHgTF+rhqhcESVs5IHeQOvlkPLutPw5jeBJSFkqIFto9PNjRXSVipYIfW7lMNr9RbOQMypb97m5lMWwdnVxUFcZ5w91kfcgxlf407jE7lhG6i+IjUt2xm5zr7w+W8tpIJRF8U2RKiQD9NZHh16vj3DhjmX/JOC3wXkcr5xVPHIXHo3u828cY4/30SkQYwwcu7xMVDKIkhS7pb4p8EqrHZOZhZ2rW0TSlounVORR19eU1eciw33EYhZt4nIqqzKFjU63QWFg9JiO02Rk3t6x24l0Yfa4SPQU0pM1ej4ImS5GkM0fAWm+uFqm6Lp1sQkLa5xXaAm/rkcQBb7Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axO6uJEyfoN/wpFiS1dW4TBc5SCgHMz+SoGyyHXh8g4=;
 b=VH3Kb14kYhqf/1pr+PNcR6ZlNXNpoJWrdPXsN4U1Y9603fL0RayIYLvfqrOqfK1sgtpIb5YfuOAsabgUkb3jmhGicqYw4I5b52Vw1nFgjOwdsMAvaayb90fer+Dlf5JpeWynbshZkQ4HUn1P4htkjuBTYTjZzdVyWKQdewVY320=
Received: from CH0PR03CA0210.namprd03.prod.outlook.com (2603:10b6:610:e4::35)
 by DS4PR12MB444842.namprd12.prod.outlook.com (2603:10b6:8:3e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 22:10:59 +0000
Received: from CH2PEPF000166C2.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::3d) by CH0PR03CA0210.outlook.office365.com
 (2603:10b6:610:e4::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 22:10:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF000166C2.mail.protection.outlook.com (10.167.244.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 22:10:59 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 16:10:58 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 16:10:54 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>, <Poojitha.N@amd.com>,
	<sravisar@amd.com>, <Richard.Gong@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 08/11] soundwire: generic_bandwidth_allocation: fix hwidth for skipped block offset
Date: Sun, 8 Nov 2026 03:38:03 +0530
Message-ID: <20261107220913.4058072-9-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C2:EE_|DS4PR12MB444842:EE_
X-MS-Office365-Filtering-Correlation-Id: ec26cf8e-6e27-4976-9403-08df3d1c00c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|6133799003|18002099003|22082099003|10067099003|11063799006|56012099006|261102123227099003|261026121527099003|261021123027099003|261009223027099003|261021121427099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	DxMU3Y/JAwHTpneZoCEta7fbar4sKggFYw2N2yssE1V43tvIu2PENcjpIK86LhsdTdgjiRM1yFdzwtNP+cv7IFfi3HqeZMW+EfAX0G32ANlSOFwPqMA3iMbhvWClKtNlQtv7JlVbBNdK6tW54daFOxYUgTDMN4aA2NPeQN/4f8m3qoK56bi+hqZ1lgzvEHNdHPUxG4aha1wyUevbfPbIBBE3SHK6mli82jwVU53lpxlIatEaManjY3icmnNxIKEauF47o0gyOcpKo3f7g9GwQB4lKFy8zWw/tD6hmERKhENUHyOSbDwBE3eJQzw5bEyJpzQfd52T1tTnNBaxnfGdN9s4RsNEUk9+9ESDRK0GV6JP4OPjj7AZ/sk2m9vJ+N55mJU2UVCLVBwMRdZ9IdCxGiOPVcwTXWEuSKGTg2gTyCuhXnH9aPL7YEuEZL03kWpfpjr9IknUl/5cQ+UBWQIH/BajG4iarWZ59ojfPkeObZIp3fAYOeSZpK3itpL4b16hZrJalquwoyiHyXNy6UnC3I4k4XkaO9BQZmS5LYwgb7o7DaZNDz1U8NoMIauBsaklMvMIWKCXlGgPQXJJiqvPOk0eyLcrs/zfPahjJZP1Y13wcW30JXA154JV/JEw4IRfubEur7FEWsUYL6j8jxlaAU7x5s/l3l/3TDCbD+LaUyPaWxvHiQRoR4JQFAM4yDRJpYtxIhvGRRfQt1dInX+Uvw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(6133799003)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261026121527099003)(261021123027099003)(261009223027099003)(261021121427099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FF3GHt3xJUo8InjBqJVUciW3UIYpIV/IAfGEyjScTt2C2AlueBYbfU52mJvmk4v/cwcPo7xD8MvJH9N3wX5wvDYKoT7COC236erJcci0wm02vXkwY2PU95wiwHq3fbrtNxqfqObMQ0l0S5OJ6dzOoUcGTL8FXHmMKz0dOdOnQniGAzEbRTFkkHqL5g1A8QlO/xpY7+NmUlxt5JxdhLyI1tDXxNNTe2WCJjzqCmMhvtbMgLyysQdPgGEU2XQ9X6hEq4oiYxJaOsfWx49RtxiDmoWUoi4dLUCYw9/MOyPrDH0aVVLFRIKIs68yRF3DbGulMSQBhuLagRcmJRMw+CV8xpHgeNwl5ViEfdNgIZggggucpHlWDK8tWJxd45L+1ApCvLQlOaP6WDiX5NGNywJNSvYxSrOdz+pTtotkhs9WYQMEgvEAI307BVB8YoSwK7B3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 22:10:59.0658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec26cf8e-6e27-4976-9403-08df3d1c00c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166C2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB444842

The hwidth computation in sdw_compute_group_params() used bare
payload_bw when calculating the horizontal columns required for a
stream group. The generic transport programming starts payload block
offsets from block_offset 1, so offset 0 is skipped. Without
accounting for that skipped offset, some frame configurations can
program an hstart/hstop payload window that is too narrow.

Introduce sdw_compute_hwidth() which adds 1 to payload_bw before
the ceiling division to account for the skipped slot. Also skip
groups with zero payload_bw before calling sdw_compute_hwidth(),
and skip groups with a resulting hwidth of 0 to avoid emitting
an invalid hstart/hstop range.

Fixes: 9026118f20e2 ("soundwire: Add generic bandwidth allocation algorithm")
Signed-off-by: Poojitha N <Poojitha.N@amd.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 .../soundwire/generic_bandwidth_allocation.c    | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 30a495abe19e..1dd3b2e5420c 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -15,6 +15,12 @@
 
 #define SDW_STRM_RATE_GROUPING		1
 
+static int sdw_compute_hwidth(int col, int payload_bw, int full_bw)
+{
+	/* Account for the initial skipped payload bit at block offset 0. */
+	return (col * (payload_bw + 1) + full_bw - 1) / full_bw;
+}
+
 struct sdw_group_params {
 	unsigned int rate;
 	unsigned int lane;
@@ -203,6 +209,9 @@ static void _sdw_compute_port_params(struct sdw_bus *bus,
 		for (i = 0; i < count; i++) {
 			if (params[i].lane != l)
 				continue;
+			/* Skip inactive groups to avoid an invalid hstart/hstop range. */
+			if (!params[i].hwidth)
+				continue;
 			port_bo = 1;
 
 			list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
@@ -274,9 +283,13 @@ static int sdw_compute_group_params(struct sdw_bus *bus,
 		for (i = 0; i < group->count; i++) {
 			if (params[i].lane != l)
 				continue;
+			/* Inactive groups must not enter the hwidth calculation. */
+			if (!params[i].payload_bw)
+				continue;
 
-			params[i].hwidth = (sel_col * params[i].payload_bw +
-					    params[i].full_bw - 1) / params[i].full_bw;
+			params[i].hwidth =
+				sdw_compute_hwidth(sel_col, params[i].payload_bw,
+						   params[i].full_bw);
 
 			column_needed += params[i].hwidth;
 			/* There is no control column for lane 1 and above */
-- 
2.53.0

