Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493164;
	b=vZ6tH/CAa7VFhN12sDhN1BjmyyCHFHEZSm+iCju2JePiQb6CXkt1/aVqPZ55NR7uiyy0
	 4OBZBtfcRWX8KCcaFkdXByPbGFMn4ardLEu6Dqvh2TyfjqFuzgu3+Xr8iAsFmRe5xQS8E
	 LFMeWXdmn2FJ9JoCgYqUVJX514d6o3fpwN49iIHIlqETSeZbUvxbFK2UuW4JHpIR0P4rF
	 VhW15c4nAmly8kOKzTJJwpthO71nb5aYSNm7Z4ZpWa0z3Y5C/Asft+aYFE4/aBN4kTZEs
	 YLEmUgK9BLBTTiMtvgsl0a6Te510blWxX9Adab6FK+kzK2KfxyfWH8FD19xtjAGb0ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493164;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Hxyjf3R9eYe/UrICLd/mSiUxyh8StFMlb8xBN+Dp3Ac=;
	b=hRPSA13wbFTWR4PQIv83VOw/Im6xOFTNxo5reIxGnJRymHZYQdOe4lcf1ZEL+I4PhUvt
	 bt8kbZyK0IjzFpNGFNEGjHLORFx+6W8iDg5udVHY20OHwwZPEDLXYpJMPm+h7MR6vnKQN
	 zRRiFC04auiXXfe0D+1OiJe5y9Q9kSl+Q5RBchDkAiaqyWz49WdQQmmZjZ6U2H85MRKDR
	 +kU2D8ncM+GsbLVuItCNKOmKLL7rGHX5Ch9kkzxzVW1tOQsdN4VMO2bVBC+4T+37gmlwv
	 g/ZPOyXJmse8Ta/9Hn8TluDkHUUaIkSbQb3RF1hDt4RT7leQ7+YVqxONdxSYRdyefgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k4NVW+zG;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0575606F934;
	Thu, 12 Nov 2026 14:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0575606F934
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k4NVW+zG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794493164; x=1826029164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CKwO+FM3DAy+u5PUqoDdhV304AOTpkUzDjk5mT5YWZs=;
  b=k4NVW+zGSV9BK8mif2QPV/XUn1V0qIWkSEAf8CLEuB7QIV5CuXQvItVd
   EJFKm2JK/xdqc4zzQwp1nFZjfvuKBMRdFT15EKSEzWqq3m3o42Mcze4wT
   +zqqKnZWnS6GkmijoFtPZjoLvJxXaYaqKFZBrk6lcZ2T64TGtF7IpIAVA
   D19r0Eps6tDa+jMjyT78Dwh13A672jJTIKioasFAWOdVDXWP6RXJIdXa+
   U7SFZSclc+g0qyGMOp1cK//ttVyOb2ldfOMxqJBdhPNxIFmCFOE1GD+7B
   n1FrgvLUemVW8GWF8+xKGtlLAS5sVZEJ97gdAo5B1lhRi5uazsWUqqk+e
   g==;
X-CSE-ConnectionGUID: e0YmcgI/QeSExmdgYGcqOQ==
X-CSE-MsgGUID: bNCM08OCSn+pEYfBLMc44Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3377813"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3377813"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:19:23 -0800
X-CSE-ConnectionGUID: U//8JgCYQfG0+5dnjiq0CQ==
X-CSE-MsgGUID: qpscT7IrTnaJqtwSGqV8MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8668755"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:19:23 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v3 1/5] soundwire: move lane bandwidth into bus params
Date: Thu, 12 Nov 2026 22:19:01 +0800
Message-ID: <20261112141905.1372770-2-yung-chuan.liao@linux.intel.com>
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

