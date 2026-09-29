Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012027.outbound.protection.outlook.com [52.101.48.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33B251357C;
	Tue, 29 Sep 2026 11:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790682692; cv=fail; b=g1DILbbLl6vjvD6p6gMSRfU19H4o20MCdwuB5TOrvz1uBY8xndifPozBd1tW/SlNqbcmfoYMR0rqcgibU+ZDLFpE5Ia3rVafZ6J5ldscRaCUcdfkIaUCFLcRZfLm4fzdU5rhtrjIW5uny6kf70JzceDW5zhQYQt2zJRqtXf0f2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790682692; c=relaxed/simple;
	bh=w5O/H19STnzcGBXx8jVQXUnT82ZrqIZWkZcxbsX2VGs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mliXdN8D8viduMxNOTy1fBMG84CdGC/9qkASXzn/0aEOEpHm7ZxN6FXSf+eb0eEjFzHyz/KwYsir/Tyk+jdQ7fCIkwiFwcgo4fdWkK49v9r50ZlEEZi3nsHiYxoMuHkxy5YJr+94g0Uj+WrhzWY9l6bVvfqrNQXwVv01UuZPK14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Dr1o1WI9; arc=fail smtp.client-ip=52.101.48.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Dr1o1WI9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGN/9+DmkDu2Q3+7jFWGnqhjnAzdwthIdsShrt+FBssyiqlshLCPC/wTlVVKGnFlMkkYlGuA2Sm71jsrLw5CRMGQgxOEQ+HsDCZCJbcZ4SXcfnf0fSvcBNQK8RlQkgrDmixNCa45bVxejVumP3GIg1OT5b2Dkbk5uEqiZ9iLiVQUr0U0WjUz/g82tl5YPp/XTOeA/UvqkvUHCWAb30IYQ7pPm/IZ/O3BD3FvrzTE/BlBTBy1KtVldHgLAQQzhuIZnIcO0CWTJzv3bRK56hkNTVHdfOOEywE/M31sP7nbalhH/sC4iIkmHEW3jSNkZL7/OsDQNP+sIY1C3N5D7Dz0Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1zARlC7Nn8ZE6QMQRZ/r6Tqg2N5Imn7X+XpzmNW01Q=;
 b=UL2vJJ1AdJO3HPPv4IBHHLcAb1yEBjInulp0qxsYk8FNfXnltlfCHuHhBRzGwYmK9sK7l5/qU7ykgBmiq1UZ3zR8HP60DFeFxcfpRxswWDIA/uXxQdGSVSibkF0E3Gqu1pgBnYIXEbqxuMc/zHf2usJqsybErdXJx55KkSO5Pn3y8p45XSAykB5GNUagWieQJvQqDloh+dLeIeKvd8P0JOiF1HV6/VVJRBv4qZ/s5QoAsQyx0FKk0ek4fnr0CGGon/+lzAxrM6NGC9K2tgmFRZ9ukW+eNRWPxZ/rt837tiKY72MiMnc/pH836+3oKedIMLSGP0ypg8goNqgj0wqNDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1zARlC7Nn8ZE6QMQRZ/r6Tqg2N5Imn7X+XpzmNW01Q=;
 b=Dr1o1WI9ETPiTt9N1hsqAHhS/SKEfw/kk0bxHu8J/YIoYZz9dfbmeexSNMA1egZL8tFFU7ILWyaekq4fOxupRVb3WPzSoWr5V+7Hsl6WOb2PiZ/hz+PbH+MVrydJ1j870OQeUe19I/yjZcnvJgt0bD2nrRYIu6aeHgxqL8vNz/s=
Received: from PH7PR17CA0050.namprd17.prod.outlook.com (2603:10b6:510:325::22)
 by CH1PPFA0A5C3BCA.namprd12.prod.outlook.com (2603:10b6:61f:fc00::61f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 11:51:26 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:510:325:cafe::3a) by PH7PR17CA0050.outlook.office365.com
 (2603:10b6:510:325::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 11:51:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 11:51:24 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 06:51:24 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 06:51:23 -0500
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 29 Sep 2026 06:51:15 -0500
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <Sunil-kumar.Dommati@amd.com>,
	<vijendar.mukunda@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <anson.tsao@amd.com>, Syed Saba Kareem
	<Syed.SabaKareem@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, "open
 list:SOUNDWIRE SUBSYSTEM" <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/5] soundwire: stream: allow flagged BPT firmware download while streams are idle
Date: Tue, 29 Sep 2026 17:20:36 +0530
Message-ID: <20260929115052.247086-4-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|CH1PPFA0A5C3BCA:EE_
X-MS-Office365-Filtering-Correlation-Id: a4a4c9b3-d712-48fb-84b5-08df1e1ffd14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|56012099006|11063799006|10067099003|5023799004|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1JdwkqiKiwrgI5ks6vrJ69ExafNRTlA7kjZBEv/xJrvtaQt6l9RzrZ6b/4KnCe+X2Pvf8Z0WTfXRC7pYsfbFd2mrYpcanBHdddFpw0py5+UIJI04G5+vfA2QPymppVWlnLL713rVJ0qe7cv6QlZtvzrvQzL1Nw9ZokxcCiktVP4JRG//0Jp+HwwN3j0FMdwrfTNzuQNVexo93b9aYgIf/gQF9WVX4Oh8lcTnnUVmKsrzw8VUwn0Jlu/or/67gMmQQY1g33QCoRRoRagzHh8KGX/uXNViYze7pg/wIdYhLogdhNIEDH94CkMmqJnG4qyqshIymxKo5mw7/tlnwLFSbbM6r0jSJA9CIfmI/UdmGh1HThPt10y6hDr5rcRJet5m6fRHRzJmRlALjpMN6GLEIaM2uKREHW9ifKUwF7gSS+NEoOsiAJVjJG7hqaifAdaoVXmUIyeg0l3idDetLvZ3YtfwLbyEBJmwTAiJ/+ukboQMt1xYogLM91Lxg7m4pcE1xC3Qyusp9EzsDDQEvahYjANd79t/trZA1ZlFRxehcmOP2VZZON5tGYDy72Xf0Q7l3pYJE+2XGBnGb0cuCZhyWR3+d1leJMOy4iGqz3pD5EOA+gNoplqx/0UDP6E9012ojHE6HUqaqMvH9V+4bG6tgi9NVaCjJUvRY1mjHSxZKFwbl0U2scGldz9/g0D09QqXKeR9d7fQDo2uK73ptYqo0Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(56012099006)(11063799006)(10067099003)(5023799004)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q9LiX5wI9roSbjelY+6uPNLFqoT1YGToJVJN7UV4a6GR9V/T66aGoCBOxDhsYW/k/ulcurfKUGOkWU/aQJCUTBylBm9p9p+AXPprGHvYDM4yX7GTEEya7E73pm840X3hZqkbEIxA+XvGXE7bmJmgxMYvwWlJzsABxVhJhbHg0e1cT5S6oJJJqpaWpjGrfg/DKxXRZz//Bh32ZpKzTyGGyHyFBGrfqrtXItndNEUUBPcsu+wnfBJEjK8i9HtNr+7cD0RSSW0tkbSAbqxikZHVh8rf3VLSV4CCXOcJG0sv+eDEtfCqnjsw7PPmmvVQMJiKRPMOrWQXTZLpMTuhlD3knriiKXJLGta8q49lDrB0dFfbAObbL5ir+aJ8uu0Ez8r5rOn/7gt1v5Fals0owEu0gTVkGC0plTCfZVRrC6yKsNP4wERyQi2iuYRWN0KrLLV6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 11:51:24.8082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a4c9b3-d712-48fb-84b5-08df1e1ffd14
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFA0A5C3BCA

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

