Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010038.outbound.protection.outlook.com [52.101.85.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19610434981;
	Mon,  5 Oct 2026 09:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191809; cv=fail; b=p8SA1EBBVbmyFdcG2nrzbZGRGuKCzcNV3M0IAqg1cPizklJGPnuESPrpDb7kw0kuAWfsFdCZL5Y21H1wCMF5jGlBE4ASRAVDgpcnD5TD1f/32dBxnrMYvsgl+y2VFlTSPgwUn9GIzOqJE/OLI1aJGPMV0wcLeDahxmOF0WsuAvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191809; c=relaxed/simple;
	bh=Feu6GO3aUVa/ljso/jSUF5gCVvOnHNJpaC1jgFuRh5s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p4ILhaPoSIi4SB78i1888DqPDbnAt+FLhvX3Hwfy+Dekr2UzlIN3q7JROirDFDtrDjt6LsTsHViCD/Dw33ByrtJpcGIB635XQ+V523IxJPzHbKl2kBcqY0iwAsn19uxeeLPQdFL/PlFHQqW7EW7QLrsWmrDmlgjopFVpVh+15OY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Y2JTEwu7; arc=fail smtp.client-ip=52.101.85.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Y2JTEwu7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLWJiP8bI8uWP4oVhsEBc1PxgESdq0op7bJkyXaMGAVmA9f/lyDG6YU2b7K+03MLjMZCvdMH71sqLBsE7RVjtAWeKjM8Imu3wkg7hi44tuHpwmD8u60I36bJ2jGd57POE/TCIwXkRO3QPkyADWnXHnlQ34Cj4XbTkPnXe3eQch3MPSUDyDGA/Chu45PQxYY17zmPauYP6n81kojGHnyFpUm9ytOP9vsdVwMDBHhbh5b3R48phojR4vpaSNtOJuAxtzg9RK3OBhd1lx5cazI9lBvYPmrYTW2mWR+yUhR3ERyaZK4i1UOfkNTE4zZcTe8KAfMo8yorutLSJR5TJD/+xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJbl8VPQG6YgsDdEs0TKYBnliPQIz5AbzwwnPCwRrG4=;
 b=Er06M/mxGD/HieOJPeJ3Vt5hiM1Y0NMQYuek4CcqAPP3ILlK0vlk9JTtZxZZRWoF8/M5u87fEzhw6LrO1s797SE71KOd3YFA1JyE7IDUh8NoIYuqFIBl186sGnfa0SyiZGZBA3ALbrd4ZTHBAq7cIChI9xULypDVZb7QgAbwbJwZDRD0zoaLba6yFSquQtK0hPE0sy5lc+1eZ0BiS9k9m8sBPeDUzM0sQwnSa/eYxjX7zO6GxSggqzMRu8MRZs2UCUWl6ArwTS1C/Qqr1VbPKtbWdOWJZjqGCHBiV05YMyIuPTVJWmOP2E0bZZ5Q7KExk0TXaJXlfDbdZ7F3e/Fw0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJbl8VPQG6YgsDdEs0TKYBnliPQIz5AbzwwnPCwRrG4=;
 b=Y2JTEwu7RwfuD3ZKDHvEXQ35RcPZ3h/L3CVdqq/PQ6NEu9e+U4qKqH/3qljzqNgNspVePrbJgyce5I0z7HKpfREXuyUGltyqsDuaW3kJdzkPuvgg8rCwgkymPNLQkCP6ystqrzgjtvXVzAkAcO1Za1c0jBqlKE3BRBbFIn+OcnI=
Received: from SJ0PR03CA0189.namprd03.prod.outlook.com (2603:10b6:a03:2ef::14)
 by PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 09:16:43 +0000
Received: from MW1PEPF00018891.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::89) by SJ0PR03CA0189.outlook.office365.com
 (2603:10b6:a03:2ef::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 09:16:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF00018891.mail.protection.outlook.com (10.167.249.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 09:16:43 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 04:16:41 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 04:16:41 -0500
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 5 Oct 2026 04:16:33 -0500
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <Sunil-kumar.Dommati@amd.com>,
	<vijendar.mukunda@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <anson.tsao@amd.com>, Syed Saba Kareem
	<Syed.SabaKareem@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, "open
 list:SOUNDWIRE SUBSYSTEM" <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/5] soundwire: intel_ace2x: order bpt_stream publish/clear against refcount
Date: Mon, 5 Oct 2026 14:45:45 +0530
Message-ID: <20261005091620.1390916-3-syed.sabakareem@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005091620.1390916-1-syed.sabakareem@amd.com>
References: <20261005091620.1390916-1-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: MW1PEPF00018891:EE_|PH8PR12MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 9063f4f9-e54e-446e-4f9c-08df22c15f4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	ZCQJvm/EHarf8IbIcvx8JsPbxZvegwg9TJJNbnXiFe1a2wsZmhazrWnu0OYGvsAxTQ3kF0Vy0YdWpvmzIjfIH2IvCS3FVKpRyq3yz0Z1wO0T6qtbhpsMNUDMpF4G3Q4jsAUHOIW9lf0T0IVgGG0zE93C2TFOdAPD+KwJ84N31E3pzipk2A62VkQ00A8RKv0KqwDNED2vjd2dreat9HKw7RbqvnBrTatRj1W941Y5gfXVJMSG+owEZjLuSA3FztdZpag9mNjkoHLe1WyoPKJtx/mz8VdXng+kwitVEgRWMeheyAxHQbF3ulOlx0TZKrF0VIVzQgajUfEKEIkFGR/fwhG+oeKnWSsIiycvI6BJ5jzZ/c4/23+qbFhRd9IpXCHO7Aco/WyX1rhqSqLRPSnw75t/w1r4NaRnc8v8bg76Z2sdAB/ci8z1r0CIttw9JJUdLLxk8OjX60TImDDvdYy58E50L6l3QZnp8X0seu5xJLvXn3DfIwbv5XXeB0CSh5tQzaZNlYnCykSFcBdHpHeag6hU4poUrhqH8kHS2ctwL/GTHWcOoC22DS3flcLQr/0C12INIYZLLJnhE7EKgkJCAhzpDLldOemYi4WxIPPjAB9Y8aLIN02D1oCXYWihHjDg+00L6R9S8wh0owkHYlOy2JzXY3bcXk1th/e6xENoiFssSIBi79H7zsLBjxxqzW8/UHH2Wy4lR16xX8S/rBsU5w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uPqRZUXZfMAh2AD1lxex//WNQB3Ej3pi/d7mQvfE8mIQkF3P2YX0EcAUVgLtucKh/wSX5XCKA7JYY/EXywP4NmuX8q4uphWk6uMifyH8Y7Ss5VD7HJJeXU5ZzEo006ElXNEP1Y7MJ0PyFIHdZ5ILzQNBFdqJuOFJxWSL8sBCx1UBywqg5/cTSr5J6NwsUhAnM5vA70gEcKmDi4TxjZ8/q1xHOLmF1n4m5z1rquX1EYit87HQ7P8peYseY5MVl3XMG4gWScxrnOR7mFd5irs/sK1dDGTJpXBliTtHdVmAiuN90plxZ/iqiQIrsLktKSmUub0oG+J6UEQwrY5N/Pqg5fGN14bhTLWvmjxZXBeg4NrHNEP1V7xT60InsJwnEtrH7FovLmcuzB46UO8KZQQUHV/XeBFxLFKpt0ZmXJEYrbE/vMXqZSkWZkPqW9sE/kgp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 09:16:43.1462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9063f4f9-e54e-446e-4f9c-08df22c15f4d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00018891.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375

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

