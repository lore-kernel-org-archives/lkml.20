Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012028.outbound.protection.outlook.com [40.107.209.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53506434987;
	Mon,  5 Oct 2026 09:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191819; cv=fail; b=LTyAHjdRFlnJB5iWmDGVMBwI2KKpOcPvbpJN7LA2U/ly5Ns2QFcFNWwIHnvP8UwcJtj75ALkZgqVeaolyCmxZbiYaIkj3q0t9/b4dT5PBNmRPvvFzkUMS5WIctZ///QwL04aOwue13xs2u4bTsSP2l1WmkwE9M0vGmz2WrCz7b4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191819; c=relaxed/simple;
	bh=w5O/H19STnzcGBXx8jVQXUnT82ZrqIZWkZcxbsX2VGs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IbhcbqECwpb+vgtcZjAPDaAp3Rx6ljVIR0j3Sc72vkt4JspGvlyFadKKAafVa9yhRnA/xRk9VkPiJsQzft3rOBy6UOBJaWlB9f94VcrLrsGWc9h6bPJzhREQpIX8hVdIVbqn8y/o9JCT4n1aBSJdYb5n77M66i4PZ2JjDQv+ios=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YO1AnlKy; arc=fail smtp.client-ip=40.107.209.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YO1AnlKy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSP3bggFFnPYkhWZ7f0jTmLbVFhcjmfZs9Tjnbn1N+JGl9tzOQNCLuUS5K+CrSXeu7RPzreSFMjXj245MsUKbChc18q3oPWFmdX38q/5VMoMPEMA5HJuSwyfYXyP7Gfl51KNpuXytd6z7L8xuj0C5TD8ZBrXhwJGdQ4Fy/YtL27Pyo35ZylHWZFjqWGrgFEaS/KRjZ69b0YWFBWjdizIlQgktWYkRoLMGAG5VmsraDOYAoufknSvlX1OY3fIg9/ZOIKovRBwWfixzcA0JzqvBvJNeZw2CGesQpLvNXdJ0xyo3+cD/k/uMLfiZlhPG67wlLloCG3v2BbJlZlMMviSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1zARlC7Nn8ZE6QMQRZ/r6Tqg2N5Imn7X+XpzmNW01Q=;
 b=l6dFRG8hDKFbedcw4M7ZrrZWFc/4BQE+h7ZveOoAfxnkkmFS8eHQPRrg5I9uazpC9tYJpP2rYSeQOLQG/47ZBr3js2qYEKJJ3RXUjIhq9+rUORTgNp1zahafI8E62OLAv/SMiPkTPvCrZ8G2ODZw1ksaMspMu42PFnh/D5P07vsOmEAS8XXGAbHcS/o9km6XJ0r6wc9CVjbYvxZsS3kYogK455bivYbTHaOmFtHOUPuFUMXEd+ya1EhAcC5qhCfh+AmXDBa/V2w/X73WiIoQ7GP92RyX8zJFn3C779Rngcn2G/I8Ckwj8pAtv6O7QK/M5qs91wdlgn2/jeXW5K9WdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1zARlC7Nn8ZE6QMQRZ/r6Tqg2N5Imn7X+XpzmNW01Q=;
 b=YO1AnlKy21TlVIlHfX9yNluj/WJVSQzm07f9ECKBBq5maIp4+l10BOGq4Z16DNGNsgjOyolp9HnSRGnXujd0BCzBmravzX7Xkkvr+H6vHL01YtynyRnmD2nmofQqI9ywbsUum7Ea55tAklAy63jtUBSiZcyhLf9ozhn/0Tb7FRo=
Received: from MW4PR02CA0001.namprd02.prod.outlook.com (2603:10b6:303:16d::21)
 by DS8PR12MB315725.namprd12.prod.outlook.com (2603:10b6:8:447::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 09:16:52 +0000
Received: from MW1PEPF00018892.namprd03.prod.outlook.com
 (2603:10b6:303:16d:cafe::24) by MW4PR02CA0001.outlook.office365.com
 (2603:10b6:303:16d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 09:16:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF00018892.mail.protection.outlook.com (10.167.249.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 09:16:52 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 04:16:50 -0500
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 5 Oct 2026 04:16:42 -0500
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <Sunil-kumar.Dommati@amd.com>,
	<vijendar.mukunda@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <anson.tsao@amd.com>, Syed Saba Kareem
	<Syed.SabaKareem@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, "open
 list:SOUNDWIRE SUBSYSTEM" <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/5] soundwire: stream: allow flagged BPT firmware download while streams are idle
Date: Mon, 5 Oct 2026 14:45:46 +0530
Message-ID: <20261005091620.1390916-4-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: MW1PEPF00018892:EE_|DS8PR12MB315725:EE_
X-MS-Office365-Filtering-Correlation-Id: ce86a6d9-fdd4-495e-e7c9-08df22c16494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|11063799006|5023799004|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Q8Sd2P6RbVxyLHAMgjpatzDMyWQGZt30JswW5m9t8DtL39RGI5KlbXxl0VkTd8gTuF2tIqOCo0NnRdZd2+Pa6+4Iry2i5Jf7WaoCOdTfbLUSeZLbg7ayuuMMv88e5ADijqkCb4unXJW8Y06VWkQZ/WJV30T6J5hFIQa9geT2JhIBiNdjLgj2scVEhd8WxZ63cxBY4SglFz/j1cYdSMYRZ47rOVgB3bTunwNx4+yDt8zFDArtliu+iPWDokVgGpVcJEzOGFIp/EHxeq46HmwLYlLBqTB817V6Yq+uRTDKC8pOpJhR+uJHFb8VW/7vI6lXkvyllMZEvmdx2Js7bszWrvz+2AH8dTGHecWGmPeyARaiZi50/GvQ8HlpkUun4X1cECYQmDMJbReIF/8wrGnDFiBiU5jsv/X956T9PQnIFnsV9kLbBlmJwpTjt4Zf0me5jBqCbRNjIKja31sPlg92IfVW8HIbGD66aDECTsqUk0bpz2Hys3/iYVr+xQU/lBM82DN+LFX6MOjwXY17Kg1BsMDQ0dxC/DX0hNSyufyYBzRvt8Bkt/A//s4jiITfOaJSDSTGpnCUc6DDOCIALBIVQeyERLmBcl7mwOkXuzfXG6pHOP4JsgzCvqxnT5abuyflUoawkskaIWqsOQkYYHqRr8CLFheyLfELBryyZ8drsk/mudOdmaPeDwQ7UgI3EIQe/xwCEkIUFbWzItwDt7L/rw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(11063799006)(5023799004)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ra4mvNsha9GS506/cl9Ce7l7h/IoLH7/r9paYsHWIO7zVy/yeb2bRY8wgetj6LL8ocpXFDYdvlrdPGi8iT49ae50Fr+Wvd3l5bMTZNSUOdc5rOQiMG4Y65ajMxWFXJX0CP5J9Q7eoVwtnmEw+TCp6mJfKV+FzLKfqpOypgDT/tOibzs3LSZvyeUp2trtpBe9kflRTF6bY3X6NR/JP7tLoLdjajx/Y64IeqXTI3cMlb4j3w6u+EAMHnt8dNgQbuo5Cu2cDwKlX8FnTjrFuCGm4aMcxihQPv0p5u0hhkYOTZH+l5TbUsh+Rsd+4KbAV9OQjRFBeCb3MtmJHc/lh4m3ewUk4sOnSS1tiXq1uZBLWNQW5m7EB9WP8iyDyC+7A3YMT2JZbbBhZIvJuZGJz4VQ3F3C0e6ZS326moBMcVUUxOKKYjjov1x29hVChBnRw7cK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 09:16:52.0069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce86a6d9-fdd4-495e-e7c9-08df22c16494
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00018892.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS8PR12MB315725

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

