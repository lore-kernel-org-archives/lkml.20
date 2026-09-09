Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010067.outbound.protection.outlook.com [40.93.198.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8C055295D;
	Wed,  9 Sep 2026 12:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958614; cv=fail; b=ZcoY2na02vek3p1yCXFydfPJcq/XAOl+KUtVQ6BvZ9FcZ/mAYQ33v4aC6vEoeYAuHux2HlJUrBse6izl7nC68YUb9G2uhdenfaYR+Orz8H2pg3TAiO4ls0ZO9v2G4ssCSlCg7ZwtY5Ms9Z0ak3J+TOy10sUAEotWCaX9rrflcTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958614; c=relaxed/simple;
	bh=w5O/H19STnzcGBXx8jVQXUnT82ZrqIZWkZcxbsX2VGs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AfZ0W5jW7C3YtwqHHgrlkjfwtrReCd9eDDR/xL/yfo2T2BLayeiCIYhTiYQm83oMdd0qVGn8WX6N5Q03Nlj3Iv8ZxQs8JthFNlMX4IzAEjBEasQ/q13ALc11rrXK+BloObSNs/wHe4TThabZ0or/WStgEHNIARHGa4+fd//C6JY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ctTGYsDx; arc=fail smtp.client-ip=40.93.198.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ctTGYsDx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAYQTTahfyItQkttb1zXvrsM99j3uTTDtnF9nOMwABGXUfMmHna6I1xCC1GoGxcUHFxXdUPUPfajAHBNVlDmFpeuhzejuRNQeog0AjEVXMvSjmzUm70xJCdItzN41Go7ORF2xncv6p7UqfoRlCpHtY7TWWNAcals9N4XpRLdMreOtLc2k3XqxUNi775+zBds3wv3lHdWZxz1ld9GvKTOQa4/x6COe9XRkf+QL6DKw0+PYcctXhzIMogmrG3xEhhdGwGWkw1sxeZy1k8ypyPX/GS7qeTRtMPMu07CIFLF+avkat7X82HVONNPU1g/E513FeyfcSdacMbxE9FgIZQQZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1zARlC7Nn8ZE6QMQRZ/r6Tqg2N5Imn7X+XpzmNW01Q=;
 b=Sqt2pJ97eXbyagHvvQ2OqNmRoyhoc+9efzNpfTNWZmzWb7+1xrmSOXXTLoOgdjAlSBxZ4nz9RYpWdTWnPR2Jka6Mpg143gc8DX08O0L88AzvNs/E+iBNW+y+rjum15PhWCeMk3q0785GhK8qsrpFClr2tTUYsqxIyijdBuyIAx181oopcLKwi2wU3PwIf3Ifbev6Mqc5iZxhh1hjiB6XBJizNcUbro+AI98cu6M0HBcT4p3Upp50NaK4+suC5gleUY8U0JtwStW0/pcH2j9/S+XMInfa0FO5976vyNjodz0y6n4zAT+usMBP7ha6C7FvkVvZrczneMKn0xevIAOk+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1zARlC7Nn8ZE6QMQRZ/r6Tqg2N5Imn7X+XpzmNW01Q=;
 b=ctTGYsDxAVuScPhCRs0fWkvj43H1dot3pz8n5ZQrflpAqvDlZUpeOV+SWsuzWmNHabbDTXR8LVB3lzo/lEeaN1v9pCgyRgPEWuNMBHLrRjnilXZuiNnyG69MeYazdNsyrlCZ/eX5/FZdocexVOXMwGnwmapPhy/BowXLaQBJWWI=
Received: from BL1PR13CA0007.namprd13.prod.outlook.com (2603:10b6:208:256::12)
 by DS7PR12MB6239.namprd12.prod.outlook.com (2603:10b6:8:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Wed, 9 Sep
 2026 12:56:26 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:256:cafe::65) by BL1PR13CA0007.outlook.office365.com
 (2603:10b6:208:256::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.4 via Frontend Transport; Wed, 9
 Sep 2026 12:56:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 12:56:26 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 07:56:25 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 07:56:25 -0500
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 9 Sep 2026 07:56:22 -0500
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <Sunil-kumar.Dommati@amd.com>,
	<Mario.Limonciello@amd.com>, <venkataprasad.potturu@amd.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>, "Syed
 Saba Kareem" <Syed.SabaKareem@amd.com>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>, "open list:SOUNDWIRE SUBSYSTEM"
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/4] soundwire: stream: allow flagged BPT firmware download while streams are idle
Date: Wed, 9 Sep 2026 18:25:55 +0530
Message-ID: <20260909125605.280973-4-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|DS7PR12MB6239:EE_
X-MS-Office365-Filtering-Correlation-Id: afbaf1ab-c683-4e74-fd55-08df0e71c21a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	9T5F+V/IWNaElDsGPvns4Nr+5dKvIDeocB4hDiPCGFwAtQlfvT5c0haD5owM7bx5ykx0CUYZP0j2Jm3a1AQYCv2HL/+LhIkFLf5YYZpACYxQdCU0MeLmQ8dVh4wiiZ24pUGqMsNqSoiie6vYXu1jjHFSAvdUrHJSSKpxERtvZSaqLxRKr9BWcSWtSKG1McGMo9cZkwxQaqaCTIhlzhVLI+MhyX/VCYbiJHXZ9+asi2SzXIHpQleVaeS6O/bgGSsWqGOH/L3qVZ6pEpQ3OuVBJP1CiKIu3EsLvmtPWi9TEIkQu9C2yEXJbpVYTPOdi9sXhrLOy5yNbuu7MaL7wht1HfCt+/fRx3Zz3O86D0csjfNO7Tn1+HgRpbcmn8pz4GA7eYB7Hz2Pcv22/iNNpCDcDY1eCYCc53E8RrVH9niP3WeIM9ngaKvTQeLbXGrBFt36un7Yx43Qqk/uKAuHKZwKEZqYApDth5J4Hcq3dNy4gT2DPf4GCH2A+JHKmxYBDkbcAtE0raGKVuGN+1jl+6nJ+5PwWKQZrvXMwupFhnwbLzBOmwPxTTmWY29eH8em1qmiO1JlV8Xt5Yt5xLYOv1DNPw484B6TZqP6ZRxX6gbkKJURAHOF75o8V03eu5ENqVkYPPw37wfj5Uk5ZYSAbHBcweIGeGY928516GWztQKALGcYl5lrIN1UlECjJpY+zafD4vneOXl7N9BZHf464HdoYQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2dTIgkTZ0YClKDHK5aJMmpBJFW2CG0TOkKApMGJlls5LJnZqz/gM0uc2LrX8xum6NLRAjCzshxAlRSFzTXv2UT7NwBAGKchwXxPyqvkc4E7B85NzQyAjyO4/VqFJKY6qT20CbCpEyCB0W5uy9Oa02YoPKEdXj2F73wl0eO0WrggIQVzIhxl/sCov9NEhY+kRByDRju7/L4sbyzMtx97ZKXgLAMY8+R419Ab4NdYB4KfY/1KCgr3h8TC7YV8bglo3CLmNJr3/ajQ4M44Oj8eVblbuwh+AoVZmyMwuBSLsMqSWAfybnwPu0/6pqZXMrUgbioqvpFeLSed6ZC7Mcz+HrNmTzepFjrK3Q1YmL76/5Bdoj+dy28LM0GDBJ6oKtks/JNhEv76vAytg/6ynCffvOEcp0ySZnOgRsxcWppM9lNfyif41ONYd04tLcK4EWlsB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 12:56:26.0115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afbaf1ab-c683-4e74-fd55-08df0e71c21a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6239

From: Syed Saba Kareem <Syed.SabaKareem@amd.com>

sdw_master_rt_alloc() rejected a BPT (Bulk Payload Transport) stream
allocation whenever any audio stream was allocated on the bus
(bus->stream_refcount > 0). On a power-off-mode platform, an amplifier
that was left DISABLED across system suspend still holds an allocated
but idle stream runtime, yet it must re-download its firmware over BPT
on resume before that stream can be re-enabled. The blanket refcount
check made the resume-time BPT transfer fail with -EBUSY.

Rather than key this off the audio stream state - which would relax the
policy for every caller and every scenario, not just a controlled
firmware download - let the manager explicitly flag the transfer. Add
bus->bpt_fw_download, which a BPT-capable manager sets around a firmware
download that it knows may coexist with allocated-but-idle audio streams
and for which it guarantees no audio stream is made active on the bus for
the duration.

sdw_master_rt_alloc() now rejects a BPT allocation when:

 - another BPT transfer is already allocated, or
 - an audio stream is actively using the bus (PREPARED/ENABLED), or
 - an audio stream is merely allocated but idle and the manager has not
   set bus->bpt_fw_download.

Add sdw_bus_has_active_stream() for the active-stream test; it returns
true only for streams in the PREPARED or ENABLED state. When
bpt_fw_download is clear (the default, and the only possibility for
managers that do not opt in) the three checks together reproduce the
original strict policy exactly: any allocated stream, active or idle,
still blocks BPT. Only a manager that sets the flag can allocate BPT
alongside idle audio streams, and even then an actively streaming stream
still blocks it.

The audio path is still protected while a flagged download runs:
sdw_program_params() skips master runtimes other than the active BPT
stream while bus->bpt_stream is set, so BPT preparation does not rewrite
the transport/port parameters of idle audio runtimes or deliver BPT bus
parameters to their peripherals via sdw_notify_config(). The bus-wide
SDW_SCP_BUSCLOCK_SCALE programming is intentionally left unfiltered, as
every attached peripheral must track the actual bus clock. The filter
keys off bus->bpt_stream, which managers publish with WRITE_ONCE() only
after raising bpt_stream_refcount and clear before dropping it;
sdw_program_params() reads it with READ_ONCE(). So an audio path that
sees refcount == 0 under bus_lock also sees bpt_stream == NULL and
programs its own parameters instead of being skipped.

BPT and active audio are mutually exclusive on the bus: a flagged
download is only started while all audio streams are idle, and the
manager that sets bpt_fw_download guarantees that no audio stream is
made active (PREPARED/ENABLED) on the bus for the transfer's duration.
Serialising the two is the manager's/codec's responsibility (for
example, the codec completes its firmware download before starting its
own stream). In practice the flagged download runs in the codec's
power-off-mode resume path, before its stream - left DISABLED across
suspend - is re-enabled, and while userspace tasks are still frozen for
system resume, so no userspace PCM operation (prepare, enable or hw_free)
can race the download window. Because of that guarantee, the only
sdw_program_params() passes while bus->bpt_stream is set are the BPT
stream's own prepare/enable/disable/deprepare passes; the filter above
keeps those passes from reprogramming or re-notifying the idle audio
runtimes that remain allocated on the bus. It is not a mechanism for
running audio traffic concurrently with a download.

While at it, make the allocation-time rejection messages state the
actual reason instead of printing the now-misleading stream_refcount.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 drivers/soundwire/stream.c    | 97 +++++++++++++++++++++++++++++++++--
 include/linux/soundwire/sdw.h | 14 +++++
 2 files changed, 108 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index fb5fdafe1999..5162c9cd327f 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -674,9 +674,11 @@ static int sdw_notify_config(struct sdw_master_runtime *m_rt)
 static int sdw_program_params(struct sdw_bus *bus, bool prepare)
 {
 	struct sdw_master_runtime *m_rt;
+	struct sdw_stream_runtime *bpt;
 	struct sdw_slave *slave;
 	int ret = 0;
 	u32 addr1;
+	bool bpt_seen = false;
 
 	/* Check if all Peripherals comply with SDCA */
 	list_for_each_entry(slave, &bus->slaves, node) {
@@ -719,7 +721,21 @@ static int sdw_program_params(struct sdw_bus *bus, bool prepare)
 	}
 
 manager_runtime:
+	/*
+	 * Read bus->bpt_stream once so the whole programming pass uses a
+	 * consistent snapshot. While a BPT transfer owns the bus, only its own
+	 * runtime may be (re)programmed. Any audio runtimes still allocated
+	 * during a flagged resume-time download are idle by contract; skip them
+	 * so BPT preparation does not rewrite their transport/port parameters or
+	 * deliver BPT bus parameters to their Slaves via sdw_notify_config().
+	 */
+	bpt = READ_ONCE(bus->bpt_stream);
 	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+		if (bpt) {
+			if (m_rt->stream != bpt)
+				continue;
+			bpt_seen = true;
+		}
 
 		/*
 		 * this loop walks through all master runtimes for a
@@ -756,6 +772,24 @@ static int sdw_program_params(struct sdw_bus *bus, bool prepare)
 		}
 	}
 
+	/*
+	 * bpt_stream is published only while its runtime is on m_rt_list: the
+	 * manager adds the runtime before prepare and clears bpt_stream before
+	 * removing it at teardown, so a non-NULL bpt must always be matched in
+	 * the loop above. If it was not, a BPT teardown left a dangling pointer
+	 * on an error path (or a manager violated the exclusivity contract):
+	 * every audio runtime was filtered out and nothing was programmed.
+	 * Fail loudly rather than return success for Slave registers that were
+	 * never written, which would let the stream state machine advance to
+	 * the bank switch on stale hardware.
+	 */
+	if (bpt && !bpt_seen) {
+		dev_err(bus->dev,
+			"BPT stream set but its runtime is absent; skipped programming\n");
+		WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
+
 	return ret;
 }
 
@@ -1234,6 +1268,33 @@ static struct sdw_master_runtime
 	return NULL;
 }
 
+/*
+ * sdw_bus_has_active_stream() - check for an audio stream actively using the bus
+ *
+ * Returns true if any master runtime on @bus has a stream in the PREPARED or
+ * ENABLED state, i.e. one that is reserving or moving data over the bus. BPT
+ * and active audio are mutually exclusive, so a BPT transfer must not be
+ * started while this returns true. Allocated-but-idle streams
+ * (ALLOCATED/CONFIGURED/DISABLED/DEPREPARED) are not reported here; whether
+ * they permit BPT is decided by the caller and gated on the
+ * bus->bpt_fw_download resume flag.
+ *
+ * Must be called with bus_lock held.
+ */
+static bool sdw_bus_has_active_stream(struct sdw_bus *bus)
+{
+	struct sdw_master_runtime *m_rt;
+
+	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+		if (m_rt->stream &&
+		    (m_rt->stream->state == SDW_STREAM_PREPARED ||
+		     m_rt->stream->state == SDW_STREAM_ENABLED))
+			return true;
+	}
+
+	return false;
+}
+
 /**
  * sdw_master_rt_alloc() - Allocates a Master runtime handle
  *
@@ -1250,9 +1311,39 @@ static struct sdw_master_runtime
 	struct list_head *insert_after;
 
 	if (stream->type == SDW_STREAM_BPT) {
-		if (bus->stream_refcount > 0 || bus->bpt_stream_refcount > 0) {
-			dev_err(bus->dev, "%s: %d/%d audio/BPT stream already allocated\n",
-				__func__, bus->stream_refcount, bus->bpt_stream_refcount);
+		/*
+		 * BPT and audio are mutually exclusive on the bus: BPT needs
+		 * exclusive bandwidth, so it must never run while another BPT
+		 * transfer is allocated or while an audio stream is actively using
+		 * the bus (PREPARED/ENABLED).
+		 *
+		 * The one exception is resume-time firmware download, flagged by the
+		 * manager via bus->bpt_fw_download: on a power-off-mode platform the
+		 * codec loses power across system suspend and must re-download its
+		 * firmware over BPT before its stream (left DISABLED across suspend)
+		 * can be re-enabled. In that window the manager guarantees no audio
+		 * stream is made active, so there is no concurrent audio and no
+		 * bandwidth to share; only then may BPT proceed while an idle
+		 * allocated stream exists. Without the flag such a stream blocks BPT.
+		 * This is not a mechanism for running audio concurrently with a
+		 * download.
+		 */
+		if (bus->bpt_stream_refcount > 0) {
+			dev_err(bus->dev,
+				"%s: BPT rejected: another BPT transfer active\n",
+				__func__);
+			return ERR_PTR(-EBUSY);
+		}
+		if (sdw_bus_has_active_stream(bus)) {
+			dev_err(bus->dev,
+				"%s: BPT rejected: audio stream active\n",
+				__func__);
+			return ERR_PTR(-EBUSY);
+		}
+		if (bus->stream_refcount > 0 && !READ_ONCE(bus->bpt_fw_download)) {
+			dev_err(bus->dev,
+				"%s: BPT rejected: audio stream allocated\n",
+				__func__);
 			return ERR_PTR(-EBUSY);
 		}
 	} else {
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index f710e5932b4b..9a3904f42078 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1005,6 +1005,19 @@ struct sdw_stream_runtime {
  * @bpt_stream_refcount: number of BTP streams currently using this bus (should
  * be zero or one, multiple streams per link is not supported).
  * @bpt_stream: pointer stored to handle BTP streams.
+ * @bpt_fw_download: set by a BPT-capable manager to flag a resume-time firmware
+ * download (BPT/BRA). BPT and active audio are mutually exclusive on the bus;
+ * this flag marks the one narrow exception -- a power-off-mode resume where the
+ * codec must re-download firmware over BPT before its stream (left DISABLED
+ * across suspend) is re-enabled. The manager guarantees no audio stream is made
+ * active on the bus for the duration, so sdw_master_rt_alloc() permits the BPT
+ * allocation even when idle audio streams are still allocated; an actively
+ * streaming audio stream (PREPARED/ENABLED) still blocks BPT. It is not a
+ * mechanism for running audio concurrently with a download. Written with
+ * WRITE_ONCE() by the manager before it enters the stream allocation path and
+ * cleared (also WRITE_ONCE()) after the transfer; read with READ_ONCE() in
+ * sdw_master_rt_alloc() under bus_lock. Single-BPT exclusivity
+ * (bpt_stream_refcount) means no concurrent writer races the lock-protected read.
  * @ops: Master callback ops
  * @port_ops: Master port callback ops
  * @prop: Master properties
@@ -1045,6 +1058,7 @@ struct sdw_bus {
 	int stream_refcount;
 	int bpt_stream_refcount;
 	struct sdw_stream_runtime *bpt_stream;
+	bool bpt_fw_download;
 	const struct sdw_master_ops *ops;
 	const struct sdw_master_port_ops *port_ops;
 	struct sdw_master_prop prop;
-- 
2.43.0

