Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F308C3B058F;
	Tue, 15 Sep 2026 13:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478024; cv=none; b=qKQE4eNmcUc+NEkeeOfgCxcw53WOEdCe127m/Lu0YXm+qZ2LlxBPv8LDvLycqS+PC9/L5aEpXXUmnf1R8aZ8r1f574XywvVHAnjHZucBaDGBpIrhMrEJ3mak8C7SWUBzWJhoIZptDptZJVzR75Wj6xJdwIAR+2hf70T7reL9w7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478024; c=relaxed/simple;
	bh=cHNyYf0whMNio1HC5Qu2rPk8sI1KNF4JK9Q47XIFc1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jEj23vJwQJO0wuT7moPuqIwcYwjRLv3JVfI/wN0zO4FukdH8qa1u07GMy3gW/1oqldj8syrIgBu1uKhHzK0j4zeeRyi5IAKsi9aZqD9tp1LalkAb726YBVmKUGA1m2bN5SGceGfsrgWwOQMZkGH25q8zC5OjaOiM5ObdPmA0oAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L8uuOfBT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L8uuOfBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789478023; x=1821014023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cHNyYf0whMNio1HC5Qu2rPk8sI1KNF4JK9Q47XIFc1o=;
  b=L8uuOfBTgNHjRcHPb5jAfT9UA7F+yI7q5y9qVG+JE3kbIVNn7VkFRtNA
   6SGFpkDxipC4u72qsl/Z/TcvubWC2sLURucPa1UPfqiwIkwYLIlYOBK2p
   eUnGNMNdCqkNMbsUW4u9MqbACJRT/0A3QY1kXDPzw0oY7Kw/LE9UtImS+
   pzM9ZGLel5Aj+z6t8HKpwvsyddDg2CtW3qRcZe75fLILHIxXo2w7IR3Ql
   VbOZ6Oqi3v0EZ7IzBUD1tv0PmDaVDHSAtjZ0C/LHeoTJh2WV8NmGkxtIA
   dJvTftGoX5i8Up6PcePdeUS7yqsYPRNQEgJ58v9YMRR5FwxEUGC23V+VA
   w==;
X-CSE-ConnectionGUID: a1DCBQaSTz2LmjEemcw5FQ==
X-CSE-MsgGUID: mF1EVBKVSWW2Fr5x1VNzNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112608436"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="112608436"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:13:43 -0700
X-CSE-ConnectionGUID: vScParh7T1yg2zGWIJl0Ww==
X-CSE-MsgGUID: o0QBtJYNSU+sC2iFmF+Oqg==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:13:40 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 1/3] soundwire: allow drivers to check whether the peripheral is present
Date: Tue, 15 Sep 2026 21:13:25 +0800
Message-ID: <20260915131327.1783551-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915131327.1783551-1-yung-chuan.liao@linux.intel.com>
References: <20260915131327.1783551-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A ghost peripheral may be listed in the ACPI table and we want to skip
it. Add enumeration_complete and is_present in struct sdw_bus{} allow
the driver to wait and check whether a peripheral is present.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/bus.c       | 7 +++++++
 include/linux/soundwire/sdw.h | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index aeaae5a57c89..b49864ca683a 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -161,7 +161,13 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 	bus->params.curr_dr_freq = bus->params.max_dr_freq;
 	bus->params.curr_bank = SDW_BANK0;
 	bus->params.next_bank = SDW_BANK1;
+	/*
+	 * Set is_present = true by default. It will be set to false when no peripherals
+	 * are attached on the bus.
+	 */
+	bus->is_present = true;
 
+	init_completion(&bus->enumeration_complete);
 	return 0;
 }
 EXPORT_SYMBOL(sdw_bus_master_add);
@@ -847,6 +853,7 @@ static int sdw_program_device_num(struct sdw_bus *bus, bool *programmed)
 		if (ret == -ENODATA) { /* end of device id reads */
 			dev_dbg(bus->dev, "No more devices to enumerate\n");
 			ret = 0;
+			complete_all(&bus->enumeration_complete);
 			break;
 		}
 		if (ret < 0) {
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index f710e5932b4b..0cb7e4fef00e 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1001,6 +1001,8 @@ struct sdw_stream_runtime {
  * transport and port parameters
  * @defer_msg: Defer message
  * @params: Current bus parameters
+ * @enumeration_complete: completion utility to control potential races between
+ * enumeration completion and peripheral presence checks.
  * @stream_refcount: number of streams currently using this bus
  * @bpt_stream_refcount: number of BTP streams currently using this bus (should
  * be zero or one, multiple streams per link is not supported).
@@ -1029,6 +1031,7 @@ struct sdw_stream_runtime {
  * are supported. This flag is populated by drivers after reading
  * appropriate firmware (ACPI/DT).
  * @lane_used_bandwidth: how much bandwidth in bits per second is used by each lane
+ * @is_present: indicates whether any peripheral is present on the bus.
  */
 struct sdw_bus {
 	struct device *dev;
@@ -1042,6 +1045,7 @@ struct sdw_bus {
 	struct list_head m_rt_list;
 	struct sdw_defer defer_msg;
 	struct sdw_bus_params params;
+	struct completion enumeration_complete;
 	int stream_refcount;
 	int bpt_stream_refcount;
 	struct sdw_stream_runtime *bpt_stream;
@@ -1064,6 +1068,7 @@ struct sdw_bus {
 #endif
 	bool multi_link;
 	unsigned int lane_used_bandwidth[SDW_MAX_LANES];
+	bool is_present;
 };
 
 struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name, enum sdw_stream_type type);
-- 
2.43.0

