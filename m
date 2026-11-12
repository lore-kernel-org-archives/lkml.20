Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468081;
	b=QbuuMcREAponCIcS3N6qugqMCKzR4gUsnmk+wn7y+bCQ9/ebOMJbCVsdVFPNIvUIRWWg
	 rtY/JKHYG8vVlxgHInfaBfoMBj7E+jxdl6DI5iO/rmpm5LBeznmQBfw9IVCuBeSmNpelL
	 kP4L24FW/dz6gQdCO6Q+iaU4ocQ9sdB0PXLlt1Jx4bOF+i82UUz6B3D8+VovCvDrZLnWc
	 JBzKVr91p4XI/38xRRbVl4IAisFh6WP/x+OdF5w2ETkhstbjV3Xy42BUMaq1EJ3E03j/F
	 Ei+x5KOFD35xhQ6V9sr6g2dCXM7C2IKrCz2cphLWa0y5I6lpEH4YyjlPVvjW9cDfUow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468081;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Hxyjf3R9eYe/UrICLd/mSiUxyh8StFMlb8xBN+Dp3Ac=;
	b=4WE5ELFpmR0u1LRpUD+T7qcBiR62pKw2dFB8Jhnpx0xU/7H/ubjlUm86/Nk2TGCboGRA
	 Gv5yniuZFpI57Gb08CWhG2zfEr5358m0OnbVZX02Dg50rRDyvzQ7rzBMVTXxhqUaPRqFr
	 FuztE0tXDtqZoJAvoZR+2s160oCxK//RgeMRae6nKHsJsk7umRzVuqlTs9+DpP34L+31E
	 QweCVEKiTYKJiwO5iEmE2drfuqhXdk5hE4LsMJdBRcPm/UYLul4yS9DfqdZSWvgMRissl
	 J9Zr5tvGby/D0RBrkipcZupSyEtQMkMoFCiuQmetvcA0V4a9wABsC9HKrwaIlTHcIcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a057+iq3;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8089E606A33E;
	Thu, 12 Nov 2026 07:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8089E606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a057+iq3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794468081; x=1826004081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CKwO+FM3DAy+u5PUqoDdhV304AOTpkUzDjk5mT5YWZs=;
  b=a057+iq3O4kPV/HMtsDMFy/JhECFZYq0ygpqMlj4nQGfG6D2E6cN0yC1
   JWlGCFhyIDj5AqoaZCLWSQRySbMXodvRue1iGJEeI2Ibw4dpfObJd5HhD
   HACetD9jXbLhWtizCTg8dP860edKfiitpNAD6qpIcT/fkZTW/imh73nYg
   hqG1CZGUnsb1RU7KRrAWcH0RBfjC8Db+j7Qm47TP5GmN+hl1JB+QVq26f
   mqsiQM9wKKDIQpexKA9Po0pRgOqPYzFINJIs5CsuXEDtLixaxetr8uLVd
   BmAxSl32AtSl3/M16A2RYXYUh0Km/pJW+hvm9aOMMhKqvcjS+uECbtCNo
   g==;
X-CSE-ConnectionGUID: BYLUj2/LQXi+1F+m2GLrxA==
X-CSE-MsgGUID: SnIPwLUnS4qZM6vgo50paw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3142248"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3142248"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 23:21:21 -0800
X-CSE-ConnectionGUID: g4ppvrxWRc+v/063QcvSIQ==
X-CSE-MsgGUID: czoNdhG9SV+AEar+fbaSUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="10318062"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 23:21:19 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 1/5] soundwire: move lane bandwidth into bus params
Date: Thu, 12 Nov 2026 15:21:01 +0800
Message-ID: <20261112072105.1296515-2-yung-chuan.liao@linux.intel.com>
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

lane_used_bandwidth is used to store the used bandwidth for each lane.
When we restore the bus->params, the lane_used_bandwidth value will not
be restored in current code. Move it to sdw_bus_params to fix the issue.

Fixes: 366fd59fb894 ("soundwire: generic_bandwidth_allocation: add lane in sdw_group_params")
Cc: stable@vger.kernel.org
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
index 31db368ba24b..1d74aa982a4c 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1794,8 +1794,8 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
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

