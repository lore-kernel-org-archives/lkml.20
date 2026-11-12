Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493171;
	b=1FKEs7VwA1+KK+g6OzZ4DvIvdAiar+BFyN/xVQUa2+4OYSTV3lGxzPFhBCoRItt5iV6d
	 auNmT8Y82ZDIsZM6v9GF5s0Dv4iE6syayFnEULj7u3PWZZ75OUQnaf01y9e80kpWW0HZu
	 hugLU5yu/SdXPOMD227lJaZpiIUFlSHyW2JNaTuBGG8Ik+SyQPf7I+sPeUOhFF4V/iw2B
	 9TDnTnM6H56Qg3M8cDlMOpZUla8+HFzp8uKojRLQ3ZUZSOnPqz5INfc7gFJ7deb2GAvc+
	 DKL8tNlGTqfyATeDEuxyo1O/Koi5JL2bQoxXeTVk6Fnie+mAyPl1L//JtphyIluXzdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493171;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=TcEjjUuJIiNJuc7sk4kV9FAQq6x0S4IRWvvkq+L9Mq8=;
	b=03zNRzjNvbkBjvOrZ0nI8Wlx4fXUtnQw9VqS3L6cBOfa/FMg81xuuQRHxqmZjd21SUXq
	 7uNyjc/LLfcl4KGrDlcg5D0auxcxUAlGts9mq0KHmSU9LTipcB0vvEtyEeZYk/58CRnsF
	 1CJS74NZewZUB5HjefMWBDbfQ1In0SSLZbZ/vcE0oj1UBKhrTtAWmh654htpCH4E5aAee
	 55B8H0Kn98gI7NwxUXnJcW8aLGAOMFnQHjaZJDmfRuPYBwWnTrnG9OIPvLc7LSRBgkBxj
	 BsvfO4/0X686Z+jpq9P0LklIu2an9Uq/z6POgwAcYp5wd0AkF6gMLHk/dgOJUj7gPcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LJcyFiN0;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D3F6071162;
	Thu, 12 Nov 2026 14:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1D3F6071162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LJcyFiN0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794493171; x=1826029171;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xUcvKCihTmlSdXDnXczK6IdehGxQgFiGfelnPTO5NZg=;
  b=LJcyFiN08ttYI9b/kTcxHOKosHQFpImkNd2XqnAddq9DkGxcDaTtxSwT
   Wh3phQ0UZM5mzxTlcKraolPxN7x/8rdgiWSirZgqToXbqBpZiKYSHD0Xi
   Bet4OAEprcKQ77pOE/hRlJri5Jr6ZSvBsNzdJBcwAXfuh5uUYEqxjG42F
   xBGr4tY9oa7186F/JtmoGA84AwYckQqFhCx8d/84m1Y7lpEHu2/s7G45n
   qeNvxPh4ba8EXkE3QzBWlo404WMCvJVWsGIMmVMtnn7KKSjw9N+W2r4lN
   NKfkBJZqmY6yWCGeBgG50T42YTQPaC/xGvgOAaS8a8XOacSdnzbb58Ndb
   g==;
X-CSE-ConnectionGUID: sPs7N/qFTCyzQ8oAnKBgiQ==
X-CSE-MsgGUID: 468b2IqxS+atp7EOU40qQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3377859"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3377859"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:19:30 -0800
X-CSE-ConnectionGUID: ZVQCAMdzST2lgoFt9Ge3Xw==
X-CSE-MsgGUID: xnW23FrMTdu/RqPo1wuDmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8668810"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:19:29 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v3 5/5] soundwire: stream: Fix bandwidth leak in multi-link aggregation failure
Date: Thu, 12 Nov 2026 22:19:05 +0800
Message-ID: <20261112141905.1372770-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112141905.1372770-1-yung-chuan.liao@linux.intel.com>
References: <20261112141905.1372770-1-yung-chuan.liao@linux.intel.com>
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

The lane assignments are stored in the port runtimes rather than in
bus->params, so they are not restored with the snapshot. Reset the lanes of
the stream to 0 during the rollback so that they match the restored
lane_used_bandwidth. Otherwise, the stale lanes would be used by the port
computation of other streams on the same bus. Skip this when the parameters
were not updated, as the lanes are still valid in that case.

A previous prepare can also leave a stale lane behind, because
_sdw_deprepare_stream() resets p_rt->lane only when the lane's used
bandwidth drops to zero. Reset the lanes of the stream being prepared in
sdw_compute_bus_params() when no multi-lane is selected.

Keep curr_bank and next_bank when restoring the snapshot. The failure may
happen after the register bank has already been switched, and restoring the
old values would make them differ from the hardware.

Fixes: 7a30292ffa2a ("soundwire: generic_bandwidth_allocation: select data lane")
Cc: stable@vger.kernel.org
Signed-off-by: David Lin <david.lin@intel.com>
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/bus.h                       |  3 ++
 .../soundwire/generic_bandwidth_allocation.c  | 14 +++++++
 drivers/soundwire/stream.c                    | 40 +++++++++++++++++--
 3 files changed, 53 insertions(+), 4 deletions(-)

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
index 06f051f03a21..bc0e2d5eaf0c 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1477,21 +1477,26 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
 			       bool update_params)
 {
 	struct sdw_master_runtime *m_rt;
+	struct sdw_slave_runtime *s_rt;
+	struct sdw_port_runtime *p_rt;
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
@@ -1542,7 +1547,34 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
 	return ret;
 
 restore_params:
-	memcpy(&bus->params, &params, sizeof(params));
+	/*
+	 * Revert all managers to their snapshotted original parameters.
+	 * Any manager that was not modified will safely revert to its own original state.
+	 */
+	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
+		enum sdw_reg_bank curr_bank = m_rt->bus->params.curr_bank;
+		enum sdw_reg_bank next_bank = m_rt->bus->params.next_bank;
+
+		m_rt->bus->params = m_rt->params_backup;
+		/* The hardware bank may already have been switched */
+		m_rt->bus->params.curr_bank = curr_bank;
+		m_rt->bus->params.next_bank = next_bank;
+
+		/*
+		 * The lane_used_bandwidth of this stream was reverted above, so clear its
+		 * lanes too; a stale lane would be used by other streams' port computation.
+		 */
+		if (!update_params)
+			continue;
+
+		list_for_each_entry(p_rt, &m_rt->port_list, port_node)
+			p_rt->lane = 0;
+
+		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node)
+			list_for_each_entry(p_rt, &s_rt->port_list, port_node)
+				p_rt->lane = 0;
+	}
+
 	return ret;
 }
 
-- 
2.43.0

