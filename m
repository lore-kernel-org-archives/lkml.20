Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468085;
	b=DnNdU9AANJ63BI2+gxVhRqojDQToVC95mybbDZeuavsSsiMGOUz7rINVMbOItHdfe15z
	 iZT0kdFS758OVXUrU5foCYR4A+VVaQllFxjSNxl9gkmdfe+f6I94keF9vARwTk2ozTovz
	 sD5+OQO695T870jRoqlSYXLOSF0VQVNZbqVcLt08IZ3OmqscLWtltvbRMugmLXfOBbk89
	 M+jXj/UvItgDo0DIA4knKwbvOaP1yFWp+cGJoQlxZFNBs6MPRL3MrVm2dWerJju6jbB86
	 z8tr4HNUkfb27WjE8iKzhhSMDAujRVzTPn2JRbLvqve+hEGGQiSP7PyPuWCnQvRPREw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468085;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=h7E74qnFR66u1e+ixB5lnQ+Fn3f3hYKLD+FCUj7mqYM=;
	b=qWZsZqpNSZpC8VCrV2PYWhLZgawhYIGYBso6u+Hg7SfALruRhkXSXv2nKUYtQ/A6wfkZ
	 wV/cSIu9YwezL/8ejHgclkEcunPoDafkfcHvObpj/G9WOfbzmNuAtOvHLBRtUCfqjWj3r
	 3p78YvBeYtjMNvyaJXBggCWfO5zyecSpqongXNcgkEdWv+u6mqvDl5UZmQsM1tXyq4oed
	 iuqQGbtTv/SNeNAyUbzIGkOuXX9KrtTj/Wxxd1tUeZ8ic+1HzLdpFdS6JBBfBWVZUT8Bb
	 EZuYi9WIf4CWuT0vJVH5B/3ei2+k90itl3Cinxffnl7/2svLYKqKx2XXRNiDBNp1v9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a17tNtbK;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567CC606A8BA;
	Thu, 12 Nov 2026 07:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 567CC606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a17tNtbK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794468085; x=1826004085;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YYy5AfuT4YbvdI6IAVYTfWRj3kfSQroERpUxz7QVieM=;
  b=a17tNtbKuXQm8wCnReCbpQcikQztJe+2YFU82ZIHPlzhihw5lZTdFPRg
   oxxza9uZKfa3uE1H1rDNkDiQAHotkPUjK/c7dlkb2P3vPpSRUmJ78v2o6
   k7sADtIU198UTgIhiQ/rYZIRZBV/Ur4U4eYStQhzB9s5ZWtg2Gsvs9xxI
   IhUP2Hk6D/HR8007JgHaS/X4AxaLv4qtgu2cO6xE3DwZg5VHQ2YWypsW7
   +RiYYqK/bwHkEw7ZkKvudWWVf5gn4gSqFKtaPn4Lza9la9p98CZ5ju1+2
   k/wiv876Qla9chtLsHwzAKB0heGbKkM9sz71MtaD16yGZoowD4iMFqoe+
   g==;
X-CSE-ConnectionGUID: dbpOw2qqRNiCaIYBzTIxNg==
X-CSE-MsgGUID: k4zPqfYlSfKWa6FGB1X0mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3142258"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3142258"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 23:21:25 -0800
X-CSE-ConnectionGUID: EwN6ylz1RpKhMV34wmIBhQ==
X-CSE-MsgGUID: a7MTK2b1SfSO9XZFC2J6vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="10318072"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 23:21:23 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 3/5] soundwire: Select the correct runtime for lane allocation
Date: Thu, 12 Nov 2026 15:21:03 +0800
Message-ID: <20261112072105.1296515-4-yung-chuan.liao@linux.intel.com>
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

When multiple master runtimes exist on the same bus,
sdw_compute_bus_params() selects the first runtime for which an
additional lane is available. This can select an already running stream
instead of the stream being prepared.

Changing that runtime's port lanes accounts for its bandwidth again.
If preparing the new stream fails, restoring the bus parameters leaves
the active stream's lanes inconsistent with its bandwidth reservation.
Depreparing the active stream can then underflow the lane bandwidth and
leave lane 0 bandwidth reserved.

Pass the current stream and prepare context to sdw_compute_bus_params()
and restrict lane allocation to that stream's runtime during prepare.
Skip lane allocation during deprepare, when its bandwidth reservation
has already been released. Keep clock recomputation and the existing
group and port filtering unchanged.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 .../soundwire/generic_bandwidth_allocation.c  | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 1250fe21a3ff..e8e68dbe180b 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -536,8 +536,11 @@ static int get_manager_lane(struct sdw_bus *bus, struct sdw_master_runtime *m_rt
  * sdw_compute_bus_params: Compute bus parameters
  *
  * @bus: SDW Bus instance
+ * @stream: SoundWire stream being prepared or deprepared
+ * @prepare: True when preparing, false when depreparing
  */
-static int sdw_compute_bus_params(struct sdw_bus *bus)
+static int sdw_compute_bus_params(struct sdw_bus *bus,
+				  struct sdw_stream_runtime *stream, bool prepare)
 {
 	struct sdw_master_prop *mstr_prop = &bus->prop;
 	struct sdw_slave_prop *slave_prop;
@@ -580,6 +583,14 @@ static int sdw_compute_bus_params(struct sdw_bus *bus)
 			break;
 
 		list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+			/*
+			 * Select only the current stream's runtime. Check prepare
+			 * to avoid computing m_lane during deprepare, when the
+			 * stream's bandwidth reservation has already been released.
+			 */
+			if (m_rt->stream != stream || !prepare)
+				continue;
+
 			/*
 			 * Get the first s_rt that will be used to find the available lane that
 			 * can be used. No need to check all Peripherals because we can't use
@@ -627,8 +638,8 @@ static int sdw_compute_bus_params(struct sdw_bus *bus)
 			}
 		}
 		/*
-		 * Set Manager lanes. Configure the last m_rt in bus->m_rt_list only since
-		 * we don't want to touch other m_rts that are already working.
+		 * Set Manager lanes for the stream being prepared without changing
+		 * other runtimes that are already working.
 		 */
 		list_for_each_entry(m_p_rt, &m_rt->port_list, port_node) {
 			m_p_rt->lane = m_lane;
@@ -665,7 +676,7 @@ int sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream,
 	int ret;
 
 	/* Computes clock frequency, frame shape and frame frequency */
-	ret = sdw_compute_bus_params(bus);
+	ret = sdw_compute_bus_params(bus, stream, prepare);
 	if (ret < 0)
 		return ret;
 
-- 
2.43.0

