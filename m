Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599495;
	b=zgKe2o/NpL5lzi4iO5mObLCBgbLsykb6P9jbA7RlONT0I9wQR0p5rgD9+LxLHngb+N7O
	 77sxYJftoKHnAjDscFcTRQXEIJesvcayiGG9JzsAb9CBsOtBIMeheNU+9wzEmcPsOaTTB
	 RGR7NtgHakuv5ptGeqZKc9xUyu5jPu2YVsUjwOpsBPoi5drN5BXYCYZ/etASCY9VcUxyj
	 XRVa7mtC5WcyS+K7hjBouExr0hsnKxkNZX4qt0WwyfM5QUl65YY2nULxoENQvFFGcrsYH
	 lpA1Tyfw2TURe4PQ27roQHD9sOdIz3hXsNVf8k2HAg3SFvHJh1gBm7WYGwslohHvFeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599495;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=0QCOrQ1f7t3LIcDVA2BjdXlL0Dv7hciwzYGl7wfdS24=;
	b=AB2BSa+Ve8rUU8wA6ZJMf3YwmO9QGRz+VxklZY5Qn8BHkv7H+tAQxDk8v7GR71F5DBKW
	 aBjN9BsNOR2Z57qDw2bdV1lSqJj0t/ou9SHfwtMzmZ6IbePi7hAFfbeL+YmeGKpvWbMhA
	 T8bYGk/19JrxENI4AxN6bEFKmNZdscIR+bGlk/1Zq0Yt1BxXdBRtGRyp+SqwefO66jwsa
	 GaSR6LFVWAn64hrLKOY/434o7p+1zQwawzIUlbzP+XbmthbUPNnRpnuEdJBfO4gFD0r22
	 noFI6cE/Udn7P97aUqH/8rhVag0Owzp8lveK7s/nC/87ra2mqQeWKcUtuKz/b5j/BmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MkbpZU2X;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5887C606A333;
	Mon,  2 Nov 2026 06:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5887C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MkbpZU2X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793599495; x=1825135495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TjMEyB4Jg3T7r2RtmHpcMPFkX/LvsMNHDkuSVzIuSyg=;
  b=MkbpZU2X/9gtHK0XNUfYwBTAMRmp75IyS3Fc3nAGMGf1QOLG03Uau5MD
   4jV0F3DwCeIJUrd0ItwtVDeumLHWYtb0o42nBSw1xXG9mKE2dvb9udCn4
   6t0YJ8cbK0kEg2PlQeTT03AmQecsrdDyGrGNf7HoJpQBd4Z/GSc+WgvUv
   bsOoYhtgmr7NsR/TMFCO9eFHyFI82QdoplNd8yxyXwY0v4bO2c5g8AIeo
   hW6aHbL8Chk/R323HnW5sUkf+ve8x82L6mn7dtUR820V9WAoYJCNxexdx
   6xD0b/ahpIUx/82pvjL+O9+lngpOyRg7hWd1/N41HZYkWXnzLCHRXWg10
   w==;
X-CSE-ConnectionGUID: vtxG67qaSuqLcMDob8w2mA==
X-CSE-MsgGUID: UEZINpC6TmCYorvJlunW6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2293058"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2293058"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 22:04:55 -0800
X-CSE-ConnectionGUID: iqM3HaoIQI+c48ioDF5+sQ==
X-CSE-MsgGUID: w290i7m6Qy2hluojPaqasA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6339496"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 22:04:51 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com,
	david.lin@intel.com
Subject: [PATCH 1/2] soundwire: move lane bandwidth into bus params
Date: Mon,  2 Nov 2026 14:04:36 +0800
Message-ID: <20261102060437.824814-2-yung-chuan.liao@linux.intel.com>
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

lane_used_bandwidth is used to store the used bandwidth for each lane.
When we restore the bus->params, the lane_used_bandwidth value will not
be restored in current code. Move it to sdw_bus_params to fix the issue.

Fixes: 366fd59fb894 ("soundwire: generic_bandwidth_allocation: add lane in sdw_group_params")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: David Lin <david.lin@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/generic_bandwidth_allocation.c | 8 ++++----
 drivers/soundwire/stream.c                       | 4 ++--
 include/linux/soundwire/sdw.h                    | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 30a495abe19e..3d6b9c895e46 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -196,7 +196,7 @@ static void _sdw_compute_port_params(struct sdw_bus *bus,
 
 	/* Run loop for all groups to compute transport parameters */
 	for (l = 0; l < SDW_MAX_LANES; l++) {
-		if (l > 0 && !bus->lane_used_bandwidth[l])
+		if (l > 0 && !bus->params.lane_used_bandwidth[l])
 			continue;
 		/* reset hstop for each lane */
 		hstop = bus->params.col - 1;
@@ -267,7 +267,7 @@ static int sdw_compute_group_params(struct sdw_bus *bus,
 	}
 
 	for (l = 0; l < SDW_MAX_LANES; l++) {
-		if (l > 0 && !bus->lane_used_bandwidth[l])
+		if (l > 0 && !bus->params.lane_used_bandwidth[l])
 			continue;
 		/* reset column_needed for each lane */
 		column_needed = 0;
@@ -507,7 +507,7 @@ static int get_manager_lane(struct sdw_bus *bus, struct sdw_master_runtime *m_rt
 					      m_rt->stream->params.bps;
 		}
 		if (required_bandwidth <=
-		    curr_dr_freq - bus->lane_used_bandwidth[l]) {
+		    curr_dr_freq - bus->params.lane_used_bandwidth[l]) {
 			/* Check if m_lane is connected to all Peripherals */
 			if (!is_lane_connected_to_all_peripherals(m_rt,
 				slave_prop->lane_maps[l])) {
@@ -518,7 +518,7 @@ static int get_manager_lane(struct sdw_bus *bus, struct sdw_master_runtime *m_rt
 			}
 			m_lane = slave_prop->lane_maps[l];
 			dev_dbg(&s_rt->slave->dev, "M lane %d is used\n", m_lane);
-			bus->lane_used_bandwidth[l] += required_bandwidth;
+			bus->params.lane_used_bandwidth[l] += required_bandwidth;
 			/*
 			 * Use non-zero manager lane, subtract the lane 0
 			 * bandwidth that is already calculated
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 0b00fcdcab2d..96613dd0677c 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1792,8 +1792,8 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 			bandwidth = m_rt->stream->params.rate * hweight32(p_rt->ch_mask) *
 				    m_rt->stream->params.bps;
 			multi_lane_bandwidth += bandwidth;
-			bus->lane_used_bandwidth[p_rt->lane] -= bandwidth;
-			if (!bus->lane_used_bandwidth[p_rt->lane])
+			bus->params.lane_used_bandwidth[p_rt->lane] -= bandwidth;
+			if (!bus->params.lane_used_bandwidth[p_rt->lane])
 				p_rt->lane = 0;
 		}
 		/* TODO: Update this during Device-Device support */
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index f710e5932b4b..fff30bb2d9ed 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -592,6 +592,7 @@ enum sdw_port_prep_ops {
  * @bandwidth: Current bandwidth
  * @col: Active columns
  * @row: Active rows
+ * @lane_used_bandwidth: how much bandwidth in bits per second is used by each lane
  * @s_data_mode: NORMAL, STATIC or PRBS mode for all Slave ports
  * @m_data_mode: NORMAL, STATIC or PRBS mode for all Master ports. The value
  * should be the same to detect transmission issues, but can be different to
@@ -605,6 +606,7 @@ struct sdw_bus_params {
 	unsigned int bandwidth;
 	unsigned int col;
 	unsigned int row;
+	unsigned int lane_used_bandwidth[SDW_MAX_LANES];
 	int s_data_mode;
 	int m_data_mode;
 };
@@ -1028,7 +1030,6 @@ struct sdw_stream_runtime {
  * @multi_link: Store bus property that indicates if multi links
  * are supported. This flag is populated by drivers after reading
  * appropriate firmware (ACPI/DT).
- * @lane_used_bandwidth: how much bandwidth in bits per second is used by each lane
  */
 struct sdw_bus {
 	struct device *dev;
@@ -1063,7 +1064,6 @@ struct sdw_bus {
 	struct dentry *debugfs;
 #endif
 	bool multi_link;
-	unsigned int lane_used_bandwidth[SDW_MAX_LANES];
 };
 
 struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name, enum sdw_stream_type type);
-- 
2.43.0

