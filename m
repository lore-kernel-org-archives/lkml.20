Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599498;
	b=Z+n8f3lX/CGyCAe+UrMsSwc5F+dQVTdGI0PWXLJVuwuGOsJKwpZQrG/7Hr/UdDWryqUa
	 oapiruxIIUNNZnN5KMGXP4LV2bf+oyfBl97xxClczh87uRtRfl0ASIBTsSH/Z1UVGxJiq
	 DBfgWOa4ulT4BQJaHlvBQ5JNwLnud9brTSisO0F0P0hevtex55RgKqfn9ByFwzhXne2u6
	 ywg/8Tg8XL6KHQkZV+uuMyWrxaH16aUOB0cMDGD43eghzfN4nA2uqEt5cerbdaMpf+7JU
	 +1icBDj66OsHFCqC18d7V0o53EwSR5KHFbMEydFRIbXnOY/9wUYlu0OXK3vf0xz67Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599498;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Afxe6L3TrmiUuhxo7i9KDEyPurGtyoaI5DhemAbRegY=;
	b=gMtwu51eWamiNlK3C8TBAMOz6i+sB2ufFeBhlhLIuze5Vc8LiRelKo/tBckoCXmFNm1a
	 shttQABAfrGmCouo+RqbpXFLmSW2dtRRvIwjunSN2cvOhP2138gf2Noi4mBckFQRHuH4P
	 xztWI+LrzXQaJ5tAioHXfuyqhY6YbwCj4aWckEv3P+NXgFjVc5zln7+SWvG5NfDyeTXBb
	 vHCPN/aJVwX7JL4SoxibJdlzweSb0h/LWKqEaWd4MD+z75o+fr+CQSAt3wKA5qxsKAobt
	 L5uZfN9RtR4jfoRmUYZQcP/cWP7sqyEIvb/87vZaGdW1XIAaPR4xxVajFmd2Mw+60iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Spl+7ciu;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC8D606A324;
	Mon,  2 Nov 2026 06:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AC8D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Spl+7ciu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793599498; x=1825135498;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hAYaHq42kOzw6egaomy3v9LeTmOwJnex9IWvxPGQmPc=;
  b=Spl+7ciuZyNRRKjzf6yoWZxXgMhc9HkOcvdXwOILFSAUyPNCrEPnsH3N
   01wNA9uq+wnY3TE+Hh3g8P0cQSVpsJ2nk/txrG1KqYwYs8OwzMOQmaMgz
   GMyXN40VsFZZLMXIKmWBi7PTWAzD3qt1DNEDQRFl4gZS1paD6yvQIzN64
   M+P3HkuWkdc9GYoIAM2PYfP+r41CAn5TLWgWmS9p1Fog6PbZyrxxsiFk1
   QLMs8V3/DFTVWoC1H/WTrjG2r8J14PTwatnh8chctK4t9HrTdi6lqCDvM
   Y80jpye41QwaeBhh+cQ8y6lF3C6KlPJ+qGSaZ+DFjySAntShlC4GNkjY5
   g==;
X-CSE-ConnectionGUID: 2lho1f0AQ7uDkE7eTDE3+g==
X-CSE-MsgGUID: oqOXdxZhRwmnwH1nsjVXVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2293064"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2293064"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 22:04:57 -0800
X-CSE-ConnectionGUID: ZvKRdv6gSXaNmvv3Cwyyjw==
X-CSE-MsgGUID: EiOIcBmQSGyuGw/ZtdIqxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6339499"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 22:04:54 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com,
	david.lin@intel.com
Subject: [PATCH 2/2] soundwire: stream: Fix bandwidth leak in multi-link aggregation failure
Date: Mon,  2 Nov 2026 14:04:37 +0800
Message-ID: <20261102060437.824814-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102060437.824814-1-yung-chuan.liao@linux.intel.com>
References: <20261102060437.824814-1-yung-chuan.liao@linux.intel.com>
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

Signed-off-by: David Lin <david.lin@intel.com>
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/bus.h    |  3 +++
 drivers/soundwire/stream.c | 17 +++++++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

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
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 96613dd0677c..86d951cc92f7 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1477,19 +1477,22 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
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
@@ -1540,7 +1543,13 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
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

