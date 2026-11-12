Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468089;
	b=UbzwGjtx4TmcNk3GyCbubnLmRoDRSNIhsn61XZcso+5ymP0RiPezVPELAePpuqg/AYS2
	 qmjpFZiZaijnZd1kcRtjtt9W9EJGzjeWO64VLWKxtughS4J7R9dV6Q9N5WvImu9Z0iGoe
	 kq51OcOSHiOyqQ8NGAd5zlAzTEb1Ih/JnmB2NsTT8ctFQnNx7x3I8a0ZXXomEqUE41nLJ
	 Wy9ee9+tPnFGo+Lw2wUuopjsCVy6yPkcTMMmhEJaE5rT3rAufLv7+/goM6c66JEsLQl0x
	 4pzS4bglGvzoAGzsRwci6WRaLC7HpRd/VtO2wIODpaapMDipzZObl979day5q6+5eFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468089;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=b9hMPbpYy1Bo+raN1VtZjNXSpTP2CppG2/pJDYdMMT8=;
	b=cRinXIcQZUdGlnW6uIXvBNRaiDyi/4H/vidgC5qfLII1OuUbw76OaheGLujIDrpO/0zX
	 HcdbOHqrgdjHZ3UCupkw6aL428bbZpfTpsPlzQzNpQ7yOyRNIkV/tnf7z8N8LlMOvfc50
	 ruVox1kvOhhzOzy0g01g4o27mC+O6TjA4F6ObIqSEXYZJQ6yr0E6I63AJZ2B2CI4aTFb4
	 i9z0xhs7dfSC+eJLrN8NAhpicw233CCcHwTC05rocIF6i/0PMouJ0tCGqYezXM4a8Sngl
	 vSM7GwEgZYBlo3K59qvrfCJlVupYl0V1vZJz5PUbAoySj2Pr3LRXKlVohz4UvydBYPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="L/dq1hqb";
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A95D60A3819;
	Thu, 12 Nov 2026 07:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A95D60A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L/dq1hqb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794468089; x=1826004089;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9pIw0EkGyIybt0AIDft2y1To9nOqBwl1nlcVq+8X8Hg=;
  b=L/dq1hqbcp/pzquiYlSrjJBHopCrLo18v8+kRarNmcBbrYwc2fx501Bn
   laln0+DcVRkgyqX+LYo+mKxsIcHBGeyDDaDp0VnYA5Bi6vAiE0jZZYFnw
   OpN/twnp8sjRftClHuOmeG0DzSzEg8n2oxWB72DyxEZP0Ijduv1mFiUbb
   bQdcsPwrAIvlXmAc1R+KLkgOl6VFOJSJEEJAjtN4O4ur7Zr9HaBQXlMAS
   jFtc6A+Vua6O81xkYG/FVl+aSAJufNLcXNPD4+r7I99403e4VRJYIhgJV
   fFlEU3rWwuXEOZvKkgpBOURKUPK3s8G2Y7+AaFBw5+4UZCOCoeVOs6OFz
   Q==;
X-CSE-ConnectionGUID: NMvPvHXHTPKA8B3mpiHxiw==
X-CSE-MsgGUID: p2N0P83oQnqmVIwsMNvWWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3142267"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3142267"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 23:21:29 -0800
X-CSE-ConnectionGUID: DftPxhlhTReRFEOeCm3b/Q==
X-CSE-MsgGUID: wtthGgguR4urkhZzLfVE2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="10318080"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 23:21:27 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 5/5] soundwire: stream: Fix bandwidth leak in multi-link aggregation failure
Date: Thu, 12 Nov 2026 15:21:05 +0800
Message-ID: <20261112072105.1296515-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112072105.1296515-1-yung-chuan.liao@linux.intel.com>
References: <20261112072105.1296515-1-yung-chuan.liao@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Lin <david.lin@intel.com>

When preparing a multi-link aggregation stream, a failure on a subsequent
link during _sdw_prepare_stream() causes the stream preparation to fail.
However, the bandwidth allocated on the preceding successful links is never
released, causing a cumulative bandwidth leak.

Fix this by saving a snapshot of each bus's parameters before making any
modifications. In case of failure, we iterate through the stream's master
list and restore each bus to its original parameter state, ensuring an
atomic rollback and preventing any bandwidth leaks.

The rollback only restores bus->params, while the lane assignments of the
port runtimes are left untouched. Since _sdw_deprepare_stream() resets
p_rt->lane only when the lane's used bandwidth drops to zero, a stream can
also carry a stale lane from a previous prepare or from a failed prepare
that was rolled back. Reset the lane of the stream being prepared to 0 in
sdw_compute_bus_params() when no multi-lane is selected, so that the lane
assignment matches the restored lane_used_bandwidth.

Fixes: 7a30292ffa2a ("soundwire: generic_bandwidth_allocation: select data lane")
Cc: stable@vger.kernel.org
Signed-off-by: David Lin <david.lin@intel.com>
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/bus.h                         |  3 +++
 .../soundwire/generic_bandwidth_allocation.c    | 14 ++++++++++++++
 drivers/soundwire/stream.c                      | 17 +++++++++++++----
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 44e4f5193917..476387b70472 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -155,6 +155,8 @@ struct sdw_slave_runtime {
  *
  * @bus: Bus handle
  * @stream: Stream runtime handle
+ * @params_backup: Snapshot of original bus parameters saved before stream
+ * preparation, used for rollback recovery on failure.
  * @direction: Data direction for Master
  * @ch_count: Number of channels handled by the Master for
  * this stream, can be zero.
@@ -166,6 +168,7 @@ struct sdw_slave_runtime {
 struct sdw_master_runtime {
 	struct sdw_bus *bus;
 	struct sdw_stream_runtime *stream;
+	struct sdw_bus_params params_backup;
 	enum sdw_data_direction direction;
 	unsigned int ch_count;
 	struct list_head slave_rt_list;
diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 9bacde2c67a1..214a1be6c33e 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -656,6 +656,20 @@ static int sdw_compute_bus_params(struct sdw_bus *bus,
 		list_for_each_entry(m_p_rt, &m_rt->port_list, port_node) {
 			m_p_rt->lane = m_lane;
 		}
+	} else if (prepare) {
+		/* Clear stale lane assignments when preparing on lane 0. */
+		list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+			if (m_rt->stream != stream)
+				continue;
+
+			list_for_each_entry(m_p_rt, &m_rt->port_list, port_node)
+				m_p_rt->lane = 0;
+
+			list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node)
+				list_for_each_entry(s_p_rt, &s_rt->port_list, port_node)
+					s_p_rt->lane = 0;
+			break;
+		}
 	}
 
 	if (!mstr_prop->default_frame_rate || !mstr_prop->default_row)
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 06f051f03a21..7c748ba84767 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1479,19 +1479,22 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
 	struct sdw_master_runtime *m_rt;
 	struct sdw_bus *bus;
 	struct sdw_master_prop *prop;
-	struct sdw_bus_params params;
 	int ret;
 
+	/* Pre-pass: snapshot original bus parameters for all masters */
+	list_for_each_entry(m_rt, &stream->master_list, stream_node)
+		m_rt->params_backup = m_rt->bus->params;
+
 	/* Prepare  Master(s) and Slave(s) port(s) associated with stream */
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
 		bus = m_rt->bus;
 		prop = &bus->prop;
-		memcpy(&params, &bus->params, sizeof(params));
 
 		/* TODO: Support Asynchronous mode */
 		if ((prop->max_clk_freq % stream->params.rate) != 0) {
 			dev_err(bus->dev, "Async mode not supported\n");
-			return -EINVAL;
+			ret = -EINVAL;
+			goto restore_params;
 		}
 
 		if (update_params) {
@@ -1542,7 +1545,13 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
 	return ret;
 
 restore_params:
-	memcpy(&bus->params, &params, sizeof(params));
+	/*
+	 * Revert all masters to their snapshotted original parameters.
+	 * Any master that was not modified will safely revert to its own original state.
+	 */
+	list_for_each_entry(m_rt, &stream->master_list, stream_node)
+		m_rt->bus->params = m_rt->params_backup;
+
 	return ret;
 }
 
-- 
2.43.0

