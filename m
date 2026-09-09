Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012052.outbound.protection.outlook.com [40.93.195.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4FC55295D;
	Wed,  9 Sep 2026 12:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958592; cv=fail; b=ZZx9rbbQubj+EHdBYmHut6KIwhpG5C5cCXRn4RFQxMA9ri8nkQ5R3i2gIZrSNeybXEMKrIpdApg8yIji7SowAMxCjhO+jZM8t6CAqaHRS4ufhnmgsaPSZjg4fhDjL+n9FBcPTuJcFLHl0MKHwkuSrv8wNLWDlxGwmx5i8LW1VVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958592; c=relaxed/simple;
	bh=Feu6GO3aUVa/ljso/jSUF5gCVvOnHNJpaC1jgFuRh5s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XE2bN+nuXYFwnk+0+qk5oKuoAxmVU5Habn9yflCoqIi+1UQPvtTkgfCE0J+3QBNfclvY3I+cKXxvxpbf/fJUejihZs4Xr90USVTKyrJ9oJlsKJn8CWnZz5c13QZ3LuHsr9+x+GUCFM4K86fmhXVErF7va1khp7pbKB/jS5bbmw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LC/4dZ7b; arc=fail smtp.client-ip=40.93.195.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LC/4dZ7b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dULNlkq76ZLSK7Wf4B2Pz0sh57i5DIlbqpqpoiTO2zLA8VRWdY+ivfZySI3y3iwD69cDcd1RPkJBrf3/yhYzxdCOsDrU/T8sBEXjE71nj2tP+XHeWBOF82BkKQLa3T702VM8bjlvzHw9DsI3aqMaD+JqasPkOEFnfpuhU5LM+GVq7cdydnaYLPtOCr4/ABleF4vuSwzxzmcsVLcn6MDHSOQM4KJbeAfMk0RiPH0GAdpjwczRnThYlEQWCicrEjRICufjupdsT0UprHRaOyxyNF1ZeW05VJ6JoJF3+Fys8gIeQwwY/xBCrXcoaEDCwyzLR4gnHbZ/8Cmgr9bAeKsMzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJbl8VPQG6YgsDdEs0TKYBnliPQIz5AbzwwnPCwRrG4=;
 b=WM/Ak0FlDQ01YPsDayzlUYB7nsfdjuthpNUPaRe322+c5VzShT39xe33kiyy6dGW/a+GmpFrQZbWuKU0raw1e1FNXStxhGSDMZf1FC1MSS7K0f7Huxlkqe08k5KSnR/OL9X6Hotk5Z+6EOVUC52L59q/dFq6Kx/GKr2Lw5u/KOB50PKhIBSMwxNObE0nxq1cDPCZkmP+E0fPoUrDAUFHN1rsRgUqshGe/DbVHa/eReDp764CQXzKez6qx/F4fE7WhZRZpMwCsQtaVzP2Xiwl+SWwGvbkYs0r1Zfzu4QhvlyvwwaDbmPpW7ggK4LFYraS0K4UJNxtt17LqHO9uNZSnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJbl8VPQG6YgsDdEs0TKYBnliPQIz5AbzwwnPCwRrG4=;
 b=LC/4dZ7bLowCf+NwxzKdZbkh6uGEoR7BjhhBC96LaW9buSjbdiS7fTxbs8Ykx+SGmW/C11+z8wfqwgLHRAw1G731p/JIPaPcAOrwgkXobe192hennrsR9eoJcE7gW0zIVA9H4qZQZQZZqWBrxulD1r4XMl6uMEnhXLwheSay74k=
Received: from PH1PEPF00013305.namprd07.prod.outlook.com (2603:10b6:518:1::17)
 by MN0PR12MB6317.namprd12.prod.outlook.com (2603:10b6:208:3c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 12:56:24 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2a01:111:f403:f912::1) by PH1PEPF00013305.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Wed, 9
 Sep 2026 12:56:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 12:56:22 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 07:56:21 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 07:56:21 -0500
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 9 Sep 2026 07:56:18 -0500
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <Sunil-kumar.Dommati@amd.com>,
	<Mario.Limonciello@amd.com>, <venkataprasad.potturu@amd.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>, "Syed
 Saba Kareem" <Syed.SabaKareem@amd.com>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>, "open list:SOUNDWIRE SUBSYSTEM"
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/4] soundwire: intel_ace2x: order bpt_stream publish/clear against refcount
Date: Wed, 9 Sep 2026 18:25:54 +0530
Message-ID: <20260909125605.280973-3-syed.sabakareem@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909125605.280973-1-syed.sabakareem@amd.com>
References: <20260909125605.280973-1-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|MN0PR12MB6317:EE_
X-MS-Office365-Filtering-Correlation-Id: 07de89b0-9387-4b92-3d4c-08df0e71c00f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qMjKKdt2qdwv0nvnpJVC3VtCXQSL2yCdqXfyM1MwwGh1ITwnVkFdRnA4N2oY61fRDo++B8f+nIKLvjKpwiSJwJy1Xl2M8Mo4bq05Hbk5jWal6sQKyea5NDSUcr1mbPdAwP8+ojPKQ+6a6z/bDtvzLWXxOZ3TTmw4WKWt/v65cbopr55vFJIETDRSyE1psl7dkvPGs4rZZ8Rm2xv3u1qcKYS4HoQxxARK80NOf7/IYC8gLql/EoUmVKFfPPjqXj5LqCCKoSQsOvukT33v2aric/TU2b+8/CLGOmteaYaJ9ajyYhFuQ8xIq81Ioh218fy2MtD7ECr2lwRsbVy5yZyyLWql30a2ZovasJJ2xTu2oHM3+wr1USZ6znnCwnzxhFM3ZtGJveJoqUzvoadqTuHMj0wp2LNYP1jcUQ2FIcwNuINGJgtqngMEvyZPNf7okS4VMnYGgjlmx7nKgNsOjzl6ChZ4EsNjppIwETAWRnGuCeXbG/r4kOQdOkfrtg1Hfw+WsxCjQ/63cj/kOJWMt9xoJEpgntzN8F91Kr/TG+TN4n4KTM4ZEJiY4P4HEQxkFotZV7hQR/l0FE2yYzo9KRwC2XvCFEVuX4rXf7rAFMythpOuCyq9csJnIxLSufPjApO0cAvzLMVIrTgbbqKIXuTiMuyG3M2fXb1NNGJQ1u9gnN/OLJDSeDETwDNKEvksQNpXL4XbF7J59I6XfFUdRzS1Vw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fziep1iZLRYU5BjPiXXtnAQ8nriXRM+y/qOKsUegU2Ad1wDP6FeCCw9JJzfWRi0awQZ8naGYPyrxQ1fUhDCnTCi11SQ2YIGhXXeWYZB6kmmHS5CbEMhpftTUuMwvwkDUUY3dPbX1R8iS0QKEMbHh+znGZTPRYoKpH8tnAHduJaYFDn2LvSSu9GIGCDJXfCP6mU0qX8KUO6eKsPBs7ythQxPc/V/q+1Bw91NhP65LVBpud2NDlZfXsu7Y48W6FV6LnPtK23uZvIPO570w54p/rPyY3pn+OZFL37ZtpeqBwRarAik2PiSutxk4K7/xoU0EIlLDg4hmsBb/Yuh/Kl2u+xTcLmfnh5OtM/zklloS4u1XSqEXTyIZwSagmo0RyupaaLswWH3vpXXFHwgEtguzzefKMBW9c4dGCow0rQqfsyAYMBr4Jb9MHy8EAtm8JrTz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 12:56:22.5315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07de89b0-9387-4b92-3d4c-08df0e71c00f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6317

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

