Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010035.outbound.protection.outlook.com [52.101.61.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4384EC650;
	Tue, 29 Sep 2026 11:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790682701; cv=fail; b=eSlwkh7FvTB5T/xcXoCiKI89eZ7bgTgb4g0k5SgJJPJIkzMBLFY69Jo1djLse4ucDKHTUP0pB/x4fMZC6saSsPJGMp54oxM0d7Fr9Kt4QRpfPoeIQvZ+x+68zYtgqRCADR5BTIb/VRKt/0ZNYWX0m4WBhjuQzLKzgPZ2Uxg/jcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790682701; c=relaxed/simple;
	bh=Feu6GO3aUVa/ljso/jSUF5gCVvOnHNJpaC1jgFuRh5s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SRJPhpp780HvlPnQQJs4PIVH++H1VvYeWsi0X3hgxzIfADTzArv0TT59EA6+wQQpJOFdW6A+vxBJeBOPntDE3qmeH0MwXNMktBm1xIw5Iaupu/2YD0+Phd0npR1e5t9iStpOdQRuuEXB8H9OervjjqyIWaG9PAUdInV9C2F8F7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yObn8ZAK; arc=fail smtp.client-ip=52.101.61.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yObn8ZAK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAhAMemRJRu+yYEs84S4QIlM8fx4JG+PCvvLq0vMiWL/+jAer3d+rTEv6bP2BV8JJ0UfIufem2WW2E9iqrkpRPeU+DEkXJjVkBf16qfB0iM6rgHFFSjnJuDr4do35g80posnzN929tfsbNBld7pZDbErJtzYOlYEPXBDE9WE94f7PcSWq/UlunRlKutr6DVXt2NSedztBd9Gq10bSIr9ZdZEWSJUWWONUBSVT9j9Vpy86IK6fYb7b7kONzbpis0oMxrbIZrSH/aVyC6674O8DguKfwfKZOjAsEaOz+RomYod0+jYh4kLB//jY2KzCyeGwrbNFfiJeAfO94ZQPBxiaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJbl8VPQG6YgsDdEs0TKYBnliPQIz5AbzwwnPCwRrG4=;
 b=Nph/xZ8bsYLUJ+ceB1HxRaZ+hFiIzU48jTphDSyjEl3fw0eZSgtXZZFuMac763NB8xTYAqyvJmVshz9nSDWKzsL/sS0sW8AleiBavNaSi0rb1VMwuBr1j4Opu4MiUtRiY9eoREFH9/ugMi+3Kit7hnD1/9TsXyzzHUeZTwfVmQyPZ/XqUVss0SeJkTo4DrUb2M6Vz5+bb4w1F8AUXRVbJorW3WbRyEUzGYpRtUGQPcrDK3DoRjLm9JrVghn94mr8keYqmpTm40cVIQxoK/2PweQxSpd2zh0NFPdHf2tP5UsFtTWfgv/AIdpNnfJC3NUSGMdhiNdFWy5JjiNZ1hUeGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJbl8VPQG6YgsDdEs0TKYBnliPQIz5AbzwwnPCwRrG4=;
 b=yObn8ZAKT//DChJ6+2THl0v9JVmCmokI1hvaRp2jpyvwQT7MWcXKRsRG7o5/g6aD2HWqYUJGjuXV//K9zV5yzmYiKtKxb6dAJTQioUzGqAnw8lwJGdEctlRbnz2kTaDT/yTI95D4snQ/B8zCn8eOA//biv4PnfHhZTeZVWM4mVI=
Received: from BN9PR03CA0610.namprd03.prod.outlook.com (2603:10b6:408:106::15)
 by PH7PR12MB6787.namprd12.prod.outlook.com (2603:10b6:510:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Tue, 29 Sep
 2026 11:51:16 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:408:106:cafe::79) by BN9PR03CA0610.outlook.office365.com
 (2603:10b6:408:106::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 11:51:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 11:51:15 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 06:51:14 -0500
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 29 Sep 2026 06:51:06 -0500
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <Sunil-kumar.Dommati@amd.com>,
	<vijendar.mukunda@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <anson.tsao@amd.com>, Syed Saba Kareem
	<Syed.SabaKareem@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, "open
 list:SOUNDWIRE SUBSYSTEM" <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/5] soundwire: intel_ace2x: order bpt_stream publish/clear against refcount
Date: Tue, 29 Sep 2026 17:20:35 +0530
Message-ID: <20260929115052.247086-3-syed.sabakareem@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929115052.247086-1-syed.sabakareem@amd.com>
References: <20260929115052.247086-1-syed.sabakareem@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|PH7PR12MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc167cb-3822-44a0-4af2-08df1e1ff76f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BViQs5iMIB6bupHSJKzrq+PbYxqM7reBKWdNZJNpvjbZZfTygdJRsRh5NrOHTBiQIF2uu9QPovhChnLH9RQt7UQnnlnmHrjlSInwflH3OeCq8H3S8NLyOOhCALj+MTJz5Q5Q7N5dipXzzeoGTwSds8y9wuLh2C3z/NIhvtiFCvBzUZ+kPI5REnjg6pyHrN0N6U3ArGV1KGmLL78mNA7hjHt7mt7+LoxBevRjEMweF+MHaCrSNP089XA02X41fTOTawUW8RTvk1ZbWEiktk9ovF4wqQH9n3jrZRYbVg2Y3Z21h6BuLgkpUj3eiGCJhYSZQSUJswU49fGArvIemeoVNNvQyCYlVeix0/2mGjsXcQK+hPQaVNTV0NtFkq7ahMSjYa6u78rYW9HFfKVlbF50F1NOX00HFLimWYfDBg+QAhp/nJnHXo0x8g9jIZEeyj6UeJXwFFjbtD04k+JXUs1fyjQ9e2YyqvFx1emd+VDQnW0LqwbVX3wRZy2lom4Nm98tdxalsogbRMBVdJX+yeZLvLFGgyUAUyIHuzfPOfITdD2o6Z3OLM9l1lXJMtDux3PunnEVZNI++R4dct2aSS1GgtE+wXh8HpKgBqdrNq68b8E8rcO4PM0+cf7zEAQ6ntKPFPh8fXDJHLjZKiN6o4zAGeinIv/ek689ttZDAtidzt1sz2InW+CKpv+qhiSil8SKqMu7TgGv4kBGQfWpHF/8Mg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hAT46dTczCEHCNd3hZMMlkB+sgxIHbJ3it4ZukpyqCtvNM/mHhSnQJJDSLlFxaPSSt3h3QAB8QLSsLF5mUsCjz9gcXPBKQAvgL9kr/LYOhQN17evU31mvc9XgJUe/PmS4dlY65Fz0Tu1DuACwgnp766zDm392P118S0/yXXwUTwErR5Bkc+qL5K4xJRf28607HfR7Pq/+rHDjlLuVAKergw6uvmUvRTMPcVDuc2rcQRjgqI49V3s0mg4iNS+ZgGJ919MtbENBTBhc+U6PZw8tzK8NXIka81D2hO++D07g9LNqmJOAAwbHaQ0mPF862YUSCk9nHt2UE4eKEgCri7MDOBddvPB9Zp2sjGbatl+7fZq6GhdAQMNNHErkyQPSDmn0aiLW7AxmYMJkd/OucLIrism/WkWIeaZzbZe2p3Up6OoU0/uvCvb8ryUnSb5gQE0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 11:51:15.3556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc167cb-3822-44a0-4af2-08df1e1ff76f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6787

From: Syed Saba Kareem <Syed.SabaKareem@amd.com>

The BPT (Bulk Payload Transport) stream pointer bus->bpt_stream is read
locklessly by the SoundWire core to tell whether a BPT transfer owns the
bus. For those readers to be safe the pointer and bus->bpt_stream_refcount
must stay consistent: an observer that sees refcount == 0 under bus_lock
must also see bpt_stream == NULL.

Make intel_ace2x maintain that ordering:

 - Publish bus->bpt_stream with WRITE_ONCE() only after the master
   runtime has been added and bpt_stream_refcount raised, and (on the
   open path) before the in-open sdw_prepare_stream().

 - Clear it with WRITE_ONCE() before sdw_stream_remove_master() drops the
   refcount on the close and error paths. Add a clear_bpt_stream label so
   paths that already published the pointer clear it, while the
   pre-publish failure paths skip the clear.

 - Snapshot the pointer into a local once (READ_ONCE()) so the
   open/close/error paths act on a single stable value instead of
   repeatedly re-reading the shared field.

This is a no-op under the current policy, where BPT and audio streams are
mutually exclusive, but establishes the ordering the core relies on once
BPT is allowed to run alongside idle audio streams.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 drivers/soundwire/intel_ace2x.c | 63 ++++++++++++++++++++++++---------
 1 file changed, 46 insertions(+), 17 deletions(-)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 96940779fdec..65d3630c2822 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -83,7 +83,7 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 	int len;
 	int i;
 
-	if (cdns->bus.bpt_stream) {
+	if (READ_ONCE(cdns->bus.bpt_stream)) {
 		dev_err(cdns->dev, "%s: BPT stream already exists\n", __func__);
 		return -EAGAIN;
 	}
@@ -92,8 +92,6 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 	if (!stream)
 		return -ENOMEM;
 
-	cdns->bus.bpt_stream = stream;
-
 	ret = sdw_slave_bpt_stream_add(slave, stream);
 	if (ret < 0)
 		goto release_stream;
@@ -152,9 +150,25 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 		goto remove_master;
 	}
 
-	ret = sdw_prepare_stream(cdns->bus.bpt_stream);
+	/*
+	 * Publish bus->bpt_stream now that the BPT master runtime is fully
+	 * built and bpt_stream_refcount has been raised. The increment happens
+	 * in sdw_slave_bpt_stream_add() above, via sdw_stream_add_slave() ->
+	 * sdw_master_rt_alloc(); sdw_stream_add_master() then reuses that same
+	 * runtime through sdw_master_rt_find() without incrementing it again.
+	 * Publish before sdw_prepare_stream() below: the prepare runs
+	 * sdw_program_params(), whose filter skips idle audio runtimes only
+	 * while bus->bpt_stream is set, so publishing here (rather than after
+	 * the DMA setup) keeps that filter active for the BPT prepare. Ordering
+	 * the publish after the refcount is raised keeps the pointer and
+	 * refcount consistent for lockless observers, mirroring amd_manager.c
+	 * and pairing with the READ_ONCE() in sdw_program_params().
+	 */
+	WRITE_ONCE(cdns->bus.bpt_stream, stream);
+
+	ret = sdw_prepare_stream(stream);
 	if (ret < 0)
-		goto remove_master;
+		goto clear_bpt_stream;
 
 	command = (msg->flags & SDW_MSG_FLAG_WRITE) ? 0 : 1;
 
@@ -285,22 +299,30 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 			__func__, ret1);
 
 deprepare_stream:
-	sdw_deprepare_stream(cdns->bus.bpt_stream);
+	sdw_deprepare_stream(stream);
+
+clear_bpt_stream:
+	/*
+	 * Paths that jump here published bus->bpt_stream above; clear it before
+	 * sdw_stream_remove_master() drops bpt_stream_refcount so the pointer and
+	 * refcount stay consistent for lockless observers. The pre-publish failure
+	 * paths jump to remove_master and skip this clear.
+	 */
+	WRITE_ONCE(cdns->bus.bpt_stream, NULL);
 
 remove_master:
-	ret1 = sdw_stream_remove_master(&cdns->bus, cdns->bus.bpt_stream);
+	ret1 = sdw_stream_remove_master(&cdns->bus, stream);
 	if (ret1 < 0)
 		dev_err(cdns->dev, "%s: remove master failed: %d\n",
 			__func__, ret1);
 
-	ret1 = sdw_stream_remove_slave(slave, cdns->bus.bpt_stream);
+	ret1 = sdw_stream_remove_slave(slave, stream);
 	if (ret1 < 0)
 		dev_err(cdns->dev, "%s: remove slave failed: %d\n",
 			__func__, ret1);
 
 release_stream:
-	sdw_release_stream(cdns->bus.bpt_stream);
-	cdns->bus.bpt_stream = NULL;
+	sdw_release_stream(stream);
 
 	return ret;
 }
@@ -309,6 +331,7 @@ static void intel_ace2x_bpt_close_stream(struct sdw_intel *sdw, struct sdw_slave
 					 struct sdw_bpt_msg *msg)
 {
 	struct sdw_cdns *cdns = &sdw->cdns;
+	struct sdw_stream_runtime *stream = READ_ONCE(cdns->bus.bpt_stream);
 	int ret;
 
 	ret = hda_sdw_bpt_close(cdns->dev->parent /* PCI device */, sdw->instance,
@@ -319,23 +342,29 @@ static void intel_ace2x_bpt_close_stream(struct sdw_intel *sdw, struct sdw_slave
 		dev_err(cdns->dev, "%s:  hda_sdw_bpt_close failed: ret %d\n",
 			__func__, ret);
 
-	ret = sdw_deprepare_stream(cdns->bus.bpt_stream);
+	ret = sdw_deprepare_stream(stream);
 	if (ret < 0)
 		dev_err(cdns->dev, "%s: sdw_deprepare_stream failed: ret %d\n",
 			__func__, ret);
 
-	ret = sdw_stream_remove_master(&cdns->bus, cdns->bus.bpt_stream);
+	/*
+	 * Clear bus->bpt_stream before sdw_stream_remove_master() drops
+	 * bpt_stream_refcount, so the pointer is never visible while the
+	 * refcount reads zero (mirrors the open path and amd_manager.c).
+	 */
+	WRITE_ONCE(cdns->bus.bpt_stream, NULL);
+
+	ret = sdw_stream_remove_master(&cdns->bus, stream);
 	if (ret < 0)
 		dev_err(cdns->dev, "%s: remove master failed: %d\n",
 			__func__, ret);
 
-	ret = sdw_stream_remove_slave(slave, cdns->bus.bpt_stream);
+	ret = sdw_stream_remove_slave(slave, stream);
 	if (ret < 0)
 		dev_err(cdns->dev, "%s: remove slave failed: %d\n",
 			__func__, ret);
 
-	sdw_release_stream(cdns->bus.bpt_stream);
-	cdns->bus.bpt_stream = NULL;
+	sdw_release_stream(stream);
 }
 
 #define INTEL_BPT_MSG_BYTE_MIN 16
@@ -374,7 +403,7 @@ static int intel_ace2x_bpt_send_async(struct sdw_intel *sdw, struct sdw_slave *s
 		return ret;
 	}
 
-	ret = sdw_enable_stream(cdns->bus.bpt_stream);
+	ret = sdw_enable_stream(READ_ONCE(cdns->bus.bpt_stream));
 	if (ret < 0) {
 		dev_err(cdns->dev, "%s: sdw_stream_enable failed: %d\n",
 			__func__, ret);
@@ -397,7 +426,7 @@ static int intel_ace2x_bpt_wait(struct sdw_intel *sdw, struct sdw_slave *slave,
 	if (ret < 0)
 		dev_err(cdns->dev, "%s: hda_sdw_bpt_wait failed: %d\n", __func__, ret);
 
-	ret = sdw_disable_stream(cdns->bus.bpt_stream);
+	ret = sdw_disable_stream(READ_ONCE(cdns->bus.bpt_stream));
 	if (ret < 0) {
 		dev_err(cdns->dev, "%s: sdw_stream_enable failed: %d\n",
 			__func__, ret);
-- 
2.43.0

