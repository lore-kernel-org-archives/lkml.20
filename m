Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794902686;
	b=WWBCISyLXeTCeM7DnAxiSN/cC4PUY6Iy6qBqIBS+dVriG8P2HcQRCix4LKDJSMguIirx
	 3syvq2eUq5MWzRGCerdVCQ8kRA5TtF1daOZ7/zbeG7zY3k97F3kXIKRyOIt9ApyF4l6tq
	 GaKSr5TId4/BiPIRR4OCYgl1hAftG+vncxhKdz6D/WqC+Q684cfdpsqHoC/uOlewi7XIQ
	 pwElsBmaGcspxwcWvGSj0zUUN+RToT/zUThV7/4hDk8EvgUCQ13X8Qj278lYwUtcX6uY8
	 IHnIPrWjjP1iavs97NdwESjgCK5CL2X8ynLXqmwNXs8S55szRoZlX4bI7Klogmj8cEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902686;
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
	bh=Dmk0pF9qFftLzEifISST0nrD9ArYBUo/OBTIcGC3HOU=;
	b=x33GAi3TyfPxArGEi3tZNty6FU9k66qcxSozettHYa2bLUDowthMU3ctgY/h/Kit754y
	 u9B0sEvnyd7BXks46SkeFkfg9qYmOti1xnZjFGkD+9+ElNjm//hFKJw4BnSqbASY6DKUN
	 W81SxtLLuAFLvJ123vHybnhkGHdZ9d2hMAb+Vy+Jw4H7VZ0v7dyRQdGFPZhLVx1cWkTMz
	 +d9Yby4iEnuinSIbKAF34Yxg+zpv0BJzAR+QZyz3AFL6eQDmSAC5CjmVpnb9Sh3gk3pmN
	 HW+WNmeyPARQc7eE0kbzj92ahmT498KV/N/7fu1XsRkP4ANn33xSp3q5O39fq6KZe7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mQbcln5i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.54
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010054.outbound.protection.outlook.com [52.101.46.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33109606A32A;
	Tue, 17 Nov 2026 08:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33109606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mQbcln5i
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNzu/kEb8M8R5GPLuLrxHjUasqrdVZqZGpgzWLfcG/PuBwdokijVjsYzX1KFqKmac8E3892bLt816OFBeObvvsp/iWjTgU8SjmVLlriW6rb0yuK41Qq7XUwu91vYx+JPCNe/j9tixLimL6un4IoOqg+t3IBd7vymEyPi29HYRL90sYiwqmWeWVQ6iXTHyhUo/er/ZT35V5wLrrdm8XeDJziwDtMCjvHsT4neXwbEvNwnqmRbFpqPrusUsKGNrzj8+6U4QaAHacPKNrOgOorynUA+nQGXRWl779dEBFrYU7J+AY1Z1hx/HzHE9igCdwH0HbKPqqbU4DUGQydODtfPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dmk0pF9qFftLzEifISST0nrD9ArYBUo/OBTIcGC3HOU=;
 b=o7IHRoUB5JV8mWOLhLwvAzeyx4AnXXkEWSfa62p//AfRLrn6q8Rtv+A2G565wF+TnL2xvH8RuZYAk4uV1NPxbLg++zHtoIyuSFgbueH+46F7CbAQDPt3e+hkLcDtHUfPU2/5rDyIn2i8irQj53xQtwQU6otnZ4nMcUFgWCooWVnImlY6niPLvMU0c1qEZG4eQFBozN7Fy2c2hDJCYUqleZJnBUldTbAtyKP3RDgmHIUpA+UyCcIJiFZVd3r9XM21gnTWwn3vJTyqnRf5VdByyl8vbs96JfFcx3DzGHR8KldGd7C1rz2qU0so2emSWyylIo8VD/sKMfVrat/O9fiRUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dmk0pF9qFftLzEifISST0nrD9ArYBUo/OBTIcGC3HOU=;
 b=mQbcln5iqpbN2drzceNzzESRaF/kHe1DCpfzaI6MdUhaixCXvwPTaxGpbkX4irsp2OtZ6mICA0i+5mBjoEXklmiLRRhnl4ZTY0xOL6KltO7G5C7DEyFf5wS0WFBfp7ezCYx4PVv4RQKYNDB9uHyjyOQchk7ohWp+9dlkE+OMII8=
Received: from BN9PR03CA0907.namprd03.prod.outlook.com (2603:10b6:408:107::12)
 by CH3PR12MB7523.namprd12.prod.outlook.com (2603:10b6:610:148::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:04:40 +0000
Received: from BN2PEPF0000A993.namprd04.prod.outlook.com
 (2603:10b6:408:107:cafe::48) by BN9PR03CA0907.outlook.office365.com
 (2603:10b6:408:107::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 08:04:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A993.mail.protection.outlook.com (10.167.248.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 08:04:40 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 02:04:38 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 02:04:35 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v2 10/11] soundwire: amd: add ACP7x generic bandwidth allocation support
Date: Tue, 17 Nov 2026 13:31:49 +0530
Message-ID: <20261117080239.918428-11-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A993:EE_|CH3PR12MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 839f5b52-cdb2-4a9a-6370-08df44816e80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|261022105027099003|261102130727099003|261102123227099003|261028144727099003|261021121427099003|261026121527099003|261026140227099003|261022075727099003|11063799006|56012099006|10067099003|18002099003|22082099003|6133799003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	o4qGqApeM6jLf4X7dEqB6Np7kv2XrfGEURozvThz1hK1mrJK4EVapSyhBun0ZNk5LHa10h8kNRkf4MBGqzzM/893PhpcUeDBsBNwyRdz6BNIsQzba9I7wa4ZxFDGui5fzkSyv69Le7ChQr0W6duZY/Xr2Mcw5ADByFxoV4PiYYTIEKxqPsAow4DMFcWoUgGTLPilZafngGTRF66us2BI560zCmKDTIdlDcU97DDXGtZ5rQgfZgBwQ4HUVquTD80COIJnXHm7oURDxf3mmpf8TNCrI60IDNXCyq0yod5YamLwP+cMOhMmqlQAAB0LqeEWKWCwwuhTVGLAuKToSizSIYcM+5Xkg9XWxa3dLXACQrjOdv2w4JaelLICTRljU/X+hYGH2sqNdNf9IulqcwapKTiquQRheLnZD8+vBTF4vDxY16CmfY6cCgwhZr/5CPuMUld9j4Qs27QR3op+qtmsKJNjGmXlU/k8shR+PfF/TQ+VlGazjzQklQESw1PVQgnuxJEeKab0QSU69etSWoL10pY2evalzqT39qqU9GdRlJaJTbpDTzBhNg2Ws99S2PxsPYwhHMUJ4jFHK3b5wek5HHOE6AOn3QLyo/HWxkfxVkExing+c2VnsOBdGkHlGPcThuxeXgNT6R83xTaYUtHRFPSL+EjwPxi7lXqLbHUhdamfTRVkCto3F3g55HHxZafFXlnltlUeq1MrVAXNX2/B7Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(261022105027099003)(261102130727099003)(261102123227099003)(261028144727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022075727099003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(261009223027099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xaOU5W3ke5EPe/Zp8MUZIWAs+/DZQ4yq1I6fMOYtWLSOnv8jvVHKEzOJh3/DyLu+3nN+N0qFtJn/9C7FAgEP5EMKLn4QbqZ8dJZCuIIF6lyfMnbvRGs/fXzmYeODkIzyT+StAHFtKy+9TVQxNn+tG1JsvrzgJxcCciaf4Bbo73G07dVTuVHs83db0Wbxhp2qUETNq6dHQNlorH3zv/SWGXTL6nbC4AkLXurocqUdSkVpKuc450tKX6KXIXk0YWLYmaG3gUJczHnmbslS4gOxTaMFAiPv+UF6I1TTbxwhvI5gmnLBPutcpeoMGbeb3ix/2uNE0KRZiXMqzzNJMj3mxGSiiuGrnzrgyPH6upoCzUxM7I+Wk8X+kV6cML9/SbdAeU1wLNOmMF5oCUqfDV+gtaLDmVDgL9FQi+C0br0NWVTSQ7DgVj0RMxO2W+KvUc9J
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:04:40.4883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 839f5b52-cdb2-4a9a-6370-08df44816e80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A993.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7523

Add amd_acp7x_sdw_compute_bus_params() and
amd_acp7x_sdw_compute_params() for ACP7B/7E/7F managers.

The bus parameter computation performs dynamic frame-shape selection
across candidate clock frequencies, using sdw_check_column_allocation()
as a pre-check before accepting a clock rate to avoid configurations
that cannot satisfy all active stream bandwidth constraints.
ACP7x managers register amd_acp7x_sdw_compute_params as their
bus.compute_params callback.

Add and export sdw_check_column_allocation() in
generic_bandwidth_allocation.c, and declare it in bus.h, so this
ACP7x-specific code can call it across the module boundary.

Signed-off-by: Poojitha N <Poojitha.N@amd.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_acp7x_manager.c         | 191 ++++++++++++++++++
 drivers/soundwire/amd_manager.h               |   1 +
 drivers/soundwire/amd_manager_common.c        |   1 +
 drivers/soundwire/bus.h                       |   4 +
 .../soundwire/generic_bandwidth_allocation.c  |  95 +++++++++
 5 files changed, 292 insertions(+)

diff --git a/drivers/soundwire/amd_acp7x_manager.c b/drivers/soundwire/amd_acp7x_manager.c
index 262e7973f1eb..34d159dcc991 100644
--- a/drivers/soundwire/amd_acp7x_manager.c
+++ b/drivers/soundwire/amd_acp7x_manager.c
@@ -918,6 +918,197 @@ static int amd_acp7x_sdw_post_bank_switch(struct sdw_bus *bus)
 	return 0;
 }
 
+/*
+ * Reuses grouping, lane-selection, and transport helpers exported by
+ * the generic bandwidth allocator (see bus.h) for ACP7x bus params.
+ */
+
+/**
+ * amd_acp7x_sdw_compute_bus_params() - Compute bus parameters for AMD ACP7x
+ *
+ * @bus: SDW Bus instance
+ */
+static int amd_acp7x_sdw_compute_bus_params(struct sdw_bus *bus,
+					    struct sdw_stream_runtime *stream)
+{
+	struct sdw_master_prop *mstr_prop = &bus->prop;
+	struct sdw_slave_prop *slave_prop;
+	struct sdw_port_runtime *m_p_rt;
+	struct sdw_port_runtime *s_p_rt;
+	struct sdw_master_runtime *m_rt;
+	struct sdw_slave_runtime *s_rt;
+	unsigned int curr_dr_freq = 0;
+	unsigned int old_default_row, old_default_col;
+	unsigned int default_row = 0, default_col = 0;
+	int i, l, clk_values, ret;
+	bool is_gear = false;
+	int m_lane = 0;
+	u32 *clk_buf;
+
+	if (mstr_prop->num_clk_gears) {
+		clk_values = mstr_prop->num_clk_gears;
+		clk_buf = mstr_prop->clk_gears;
+		is_gear = true;
+	} else if (mstr_prop->num_clk_freq) {
+		clk_values = mstr_prop->num_clk_freq;
+		clk_buf = mstr_prop->clk_freq;
+	} else {
+		clk_values = 1;
+		clk_buf = NULL;
+	}
+	if (!is_clock_scaling_supported(bus))
+		clk_values = 1;
+
+	if (!mstr_prop->default_frame_rate ||
+	    (!mstr_prop->dynamic_frame &&
+	     (!mstr_prop->default_row || !mstr_prop->default_col)))
+		return -EINVAL;
+	old_default_row = mstr_prop->default_row;
+	old_default_col = mstr_prop->default_col;
+
+	for (i = 0; i < clk_values; i++) {
+		if (!clk_buf) {
+			curr_dr_freq = bus->params.max_dr_freq;
+		} else {
+			curr_dr_freq = is_gear ?
+				(bus->params.max_dr_freq / clk_buf[i]) :
+				clk_buf[i] * SDW_DOUBLE_RATE_FACTOR;
+		}
+
+		if (mstr_prop->dynamic_frame) {
+			switch (curr_dr_freq) {
+			case 24000000:
+				default_row = 50;
+				default_col = 10;
+				break;
+			case 12000000:
+				default_row = 125;
+				default_col = 2;
+				break;
+			case 24576000:
+				default_row = 64;
+				default_col = 8;
+				break;
+			case 12288000:
+				default_row = 64;
+				default_col = 4;
+				break;
+			case 6144000:
+				default_row = 64;
+				default_col = 2;
+				break;
+			default:
+				dev_dbg(bus->dev, "unsupported clock frequency %u, skipping\n",
+					curr_dr_freq);
+				continue;
+			}
+		} else {
+			/* Static frame row and column are provided as a pair by ACPI. */
+			default_row = mstr_prop->default_row;
+			default_col = mstr_prop->default_col;
+		}
+		/*
+		 * The row and column pair is complete here: dynamic values are
+		 * selected by frequency above, while static values come from ACPI.
+		 */
+
+		dev_dbg(bus->dev, "Trying clock frequency %d bandwidth:%d default_col:%d\n",
+			curr_dr_freq, bus->params.bandwidth, default_col);
+
+		if (curr_dr_freq * (default_col - 1) >=
+		    bus->params.bandwidth * default_col) {
+			ret = sdw_check_column_allocation(bus, stream, curr_dr_freq,
+							  default_col);
+			if (ret < 0)
+				return ret;
+			if (ret)
+				break;
+			dev_dbg(bus->dev, "freq %d: column allocation failed\n",
+				curr_dr_freq);
+		}
+		/* Try multi-lane when single-lane at this frequency is insufficient. */
+
+		list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+			/*
+			 * Get the first s_rt that will be used to find the available lane that
+			 * can be used. No need to check all Peripherals because we can't use
+			 * multi-lane if we can't find any available lane for the first Peripheral.
+			 */
+			if (list_empty(&m_rt->slave_rt_list))
+				continue;
+
+			s_rt = list_first_entry(&m_rt->slave_rt_list,
+						struct sdw_slave_runtime, m_rt_node);
+			m_lane = get_manager_lane(bus, m_rt, s_rt, curr_dr_freq);
+			if (m_lane > 0)
+				goto out;
+		}
+	}
+	if (i == clk_values) {
+		dev_err(bus->dev, "%s: could not find clock value for bandwidth %d\n",
+			__func__, bus->params.bandwidth);
+		return -EINVAL;
+	}
+out:
+	if (m_lane > 0) {
+		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
+			slave_prop = &s_rt->slave->prop;
+			for (l = 1; l < SDW_MAX_LANES; l++) {
+				if (slave_prop->lane_maps[l] == m_lane) {
+					list_for_each_entry(s_p_rt, &s_rt->port_list, port_node) {
+						s_p_rt->lane = l;
+					}
+					break;
+				}
+			}
+		}
+		list_for_each_entry(m_p_rt, &m_rt->port_list, port_node)
+			m_p_rt->lane = m_lane;
+	}
+
+	mstr_prop->default_row = default_row;
+	mstr_prop->default_col = default_col;
+	ret = sdw_select_row_col(bus, curr_dr_freq);
+	if (ret < 0) {
+		dev_err(bus->dev, "%s: could not find frame configuration for bus dr_freq %d\n",
+			__func__, curr_dr_freq);
+		mstr_prop->default_row = old_default_row;
+		mstr_prop->default_col = old_default_col;
+		return -EINVAL;
+	}
+	bus->params.curr_dr_freq = curr_dr_freq;
+	return 0;
+}
+
+/**
+ * amd_acp7x_sdw_compute_params() - Compute bus, transport and port parameters
+ * for AMD ACP7x
+ *
+ * @bus: SDW Bus instance
+ * @stream: Soundwire stream
+ */
+int amd_acp7x_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
+{
+	int ret;
+
+	ret = amd_acp7x_sdw_compute_bus_params(bus, stream);
+	if (ret < 0)
+		return ret;
+
+	if (stream->type == SDW_STREAM_BPT) {
+		sdw_compute_dp0_port_params(bus);
+		return 0;
+	}
+
+	ret = sdw_compute_port_params(bus, stream);
+	if (ret < 0) {
+		dev_err(bus->dev, "Compute transport params failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 const struct sdw_master_port_ops amd_acp7x_sdw_port_ops = {
 	.dpn_set_port_params = amd_acp7x_sdw_port_params,
 	.dpn_set_port_transport_params = amd_acp7x_sdw_transport_params,
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 8b80cce768a4..5f9be5ca3fcf 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -511,6 +511,7 @@ void amd_acp7x_sdw_update_slave_status_work(struct amd_sdw_manager *amd_manager)
 int amd_sdw_hw_init_ops_acp7x(struct amd_sdw_manager *amd_manager);
 extern const struct sdw_master_ops amd_acp7x_sdw_ops;
 extern const struct sdw_master_port_ops amd_acp7x_sdw_port_ops;
+int amd_acp7x_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream);
 
 #define AMD_SDW_HW_OPS(amd_manager, cb)	((amd_manager)->hw_ops->cb)
 
diff --git a/drivers/soundwire/amd_manager_common.c b/drivers/soundwire/amd_manager_common.c
index b075b6910959..a592c9bdcb09 100644
--- a/drivers/soundwire/amd_manager_common.c
+++ b/drivers/soundwire/amd_manager_common.c
@@ -861,6 +861,7 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 		/* mmio already set in the port-count switch above */
 		amd_manager->bus.ops = &amd_acp7x_sdw_ops;
 		amd_manager->bus.port_ops = &amd_acp7x_sdw_port_ops;
+		amd_manager->bus.compute_params = &amd_acp7x_sdw_compute_params;
 		break;
 	default:
 		dev_err(dev, "unsupported ACP revision: 0x%x\n", amd_manager->acp_rev);
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 0c5c343b2c1c..bcc7aa7e3a0e 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -245,6 +245,10 @@ void sdw_compute_dp0_port_params(struct sdw_bus *bus);
 int sdw_compute_port_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream);
 int sdw_select_row_col(struct sdw_bus *bus, int clk_freq);
 bool is_clock_scaling_supported(struct sdw_bus *bus);
+int sdw_check_column_allocation(struct sdw_bus *bus,
+				struct sdw_stream_runtime *stream,
+				unsigned int curr_dr_freq,
+				int sel_col);
 int get_manager_lane(struct sdw_bus *bus, struct sdw_master_runtime *m_rt,
 		     struct sdw_slave_runtime *s_rt, unsigned int curr_dr_freq);
 
diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index cf2d2275b6aa..44e4c0f78d9c 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -473,6 +473,101 @@ bool is_clock_scaling_supported(struct sdw_bus *bus)
 }
 EXPORT_SYMBOL(is_clock_scaling_supported);
 
+/**
+ * sdw_check_column_allocation - Pre-check if column allocation will succeed
+ * @bus: SDW Bus instance
+ * @stream: SoundWire stream being prepared
+ * @curr_dr_freq: Current double-rate frequency to check
+ * @sel_col: Number of columns
+ *
+ * Return: 1 if allocation succeeds, 0 if it does not fit, or a negative error.
+ */
+int sdw_check_column_allocation(struct sdw_bus *bus,
+				struct sdw_stream_runtime *stream,
+				unsigned int curr_dr_freq,
+				int sel_col)
+{
+	struct sdw_master_runtime *m_rt;
+	struct sdw_port_runtime *p_rt;
+	struct sdw_group group = {};
+	unsigned int rate, bps, ch;
+	int *payload_bw = NULL;
+	int *full_bw = NULL;
+	int i, l, ret;
+	int result = 1;
+
+	ret = sdw_get_group_count(bus, &group);
+	if (ret < 0)
+		return ret;
+	if (!group.count)
+		goto out;
+
+	payload_bw = kcalloc(group.count, sizeof(int), GFP_KERNEL);
+	full_bw = kcalloc(group.count, sizeof(int), GFP_KERNEL);
+	if (!payload_bw || !full_bw) {
+		result = -ENOMEM;
+		goto out;
+	}
+
+	for (i = 0; i < group.count; i++)
+		full_bw[i] = curr_dr_freq / group.rates[i];
+
+	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+		if (m_rt->stream == stream) {
+			if (stream->state != SDW_STREAM_CONFIGURED)
+				continue;
+		} else {
+			if (m_rt->stream->state != SDW_STREAM_ENABLED &&
+			    m_rt->stream->state != SDW_STREAM_PREPARED &&
+			    m_rt->stream->state != SDW_STREAM_DISABLED)
+				continue;
+		}
+
+		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
+			rate = m_rt->stream->params.rate;
+			bps = m_rt->stream->params.bps;
+			ch = hweight32(p_rt->ch_mask);
+
+			for (i = 0; i < group.count; i++) {
+				if (rate == group.rates[i] && p_rt->lane == group.lanes[i])
+					payload_bw[i] += bps * ch;
+			}
+		}
+	}
+
+	for (l = 0; l < SDW_MAX_LANES; l++) {
+		int available_columns = l ? sel_col : sel_col - 1;
+		int column_needed = 0;
+
+		for (i = 0; i < group.count; i++) {
+			int hwidth;
+
+			if (group.lanes[i] != l || !payload_bw[i])
+				continue;
+
+			/* Include the column consumed by the skipped block offset. */
+			hwidth = sdw_compute_hwidth(sel_col, payload_bw[i],
+						    full_bw[i]);
+			column_needed += hwidth;
+		}
+
+		if (column_needed > available_columns) {
+			dev_dbg(bus->dev, "Lane %d column check failed: required=%d available=%d\n",
+				l, column_needed, available_columns);
+			result = 0;
+			break;
+		}
+	}
+
+out:
+	kfree(payload_bw);
+	kfree(full_bw);
+	kfree(group.rates);
+	kfree(group.lanes);
+	return result;
+}
+EXPORT_SYMBOL(sdw_check_column_allocation);
+
 /**
  * is_lane_connected_to_all_peripherals: Check if the given manager lane connects to all peripherals
  * So that all peripherals can use the manager lane.
-- 
2.53.0

