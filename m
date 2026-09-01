Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677E93CC7DF;
	Tue,  1 Sep 2026 03:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788231806; cv=none; b=ne69Pnlq00SjEFPX2Ao/LUWucrSPGFcIf3T8+j8LsSf/sXZyfDyu0dNt+wDXdDwFphGvWFohuqj/CSEoaxc8w8/jtpw4mWmwUpaUyzGtOn0qIpyqQgsSNmF1RK5ooENGhULHeLoGenWhxAjEuOvuBSLpr2/wQlqh+LLzGUdi560=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788231806; c=relaxed/simple;
	bh=lcA4azdtDkBiYtp5q68WE6f8RBGHe7sSNIzdR9ZARRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W8CyKXPZYdg/F6NQ5t+i7vS8HoQ8yrMl5gjgqY1PZRjT9rQRLCSbULw1kv3kJ6JcB6gVrM1vB/uuBL49p9sFEpn9eoo44NZteOliKxFcfwlm9f0SqtrjspVGKn7jIX+NrmjGu5AVK8HWz0GBhUjezf9gVtUOscHrjp3TKkBYNVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHIhIHeJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHIhIHeJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788231805; x=1819767805;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lcA4azdtDkBiYtp5q68WE6f8RBGHe7sSNIzdR9ZARRA=;
  b=aHIhIHeJxd0j0K1mfgqxW2qxEXXN4HJK1/kNssyeZTmHBWpOlfe+X4mB
   1QdJWICP4lL2plbGPcDLN57oja3Q7TyKVWUK/fDy8Y5ZMd5e5R9x9WjQP
   IOeB45cLghHsty9EwmCUyrXiRkiHoC1ekWzFaE0YEXTLkB8sHsNZra/xk
   DveZcS7DG20UgxcgmLI6MHi6Wb/ndetL7TExfhXGJtKYijALeiBZlrXEX
   ppeR2EHXhbhC9XnmhOQtSW6vMXqh5HM9D7kpZsvoaesWzLNYBlFVx8HXM
   LG3aWx0KTO3gIV0fLxa7Pr0t7y3DoaMSxD0+WPT0viNx116EFaqcJGmjs
   Q==;
X-CSE-ConnectionGUID: vs0WdDazQvyOULeEkNk/wg==
X-CSE-MsgGUID: qehQvTAPSx2ICx1rEIhqcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="87785637"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="87785637"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 20:03:24 -0700
X-CSE-ConnectionGUID: pQR2SnNaSiun+bk0kGpVdA==
X-CSE-MsgGUID: IRYuRQtjSyeKT4R8RBxe4A==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 20:03:21 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 1/3] soundwire: bus: add CLOCK_STOP_MODE1 support back
Date: Tue,  1 Sep 2026 11:03:09 +0800
Message-ID: <20260901030311.232823-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901030311.232823-1-yung-chuan.liao@linux.intel.com>
References: <20260901030311.232823-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

CLOCK_STOP_MODE1 is used when the Peripheral might have entered a deeper
power-saving mode that does not retain state while the Clock is stopped.
It is useful when the device is more power consumption sensitive. Add it
back to allow the Peripheral use CLOCK_STOP_MODE1.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/bus.c       | 54 ++++++++++++++++++++++-------------
 include/linux/soundwire/sdw.h |  4 +++
 2 files changed, 38 insertions(+), 20 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 0c1cdd603926..4df7899988ad 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -959,8 +959,31 @@ static void sdw_modify_slave_status(struct sdw_slave *slave,
 	mutex_unlock(&bus->bus_lock);
 }
 
+static enum sdw_clk_stop_mode sdw_get_clk_stop_mode(struct sdw_slave *slave)
+{
+	enum sdw_clk_stop_mode mode;
+
+	mode = slave->prop.clk_stop_mode1 ? SDW_CLK_STOP_MODE1 : SDW_CLK_STOP_MODE0;
+
+	mutex_lock(&slave->sdw_dev_lock);
+
+	/*
+	 * Query for clock stop mode if Slave implements
+	 * ops->get_clk_stop_mode, else read from property.
+	 */
+	if (slave->probed) {
+		struct sdw_driver *drv = drv_to_sdw_driver(slave->dev.driver);
+
+		if (drv->ops && drv->ops->get_clk_stop_mode)
+			mode = drv->ops->get_clk_stop_mode(slave);
+	}
+
+	mutex_unlock(&slave->sdw_dev_lock);
+
+	return mode;
+}
+
 static int sdw_slave_clk_stop_callback(struct sdw_slave *slave,
-				       enum sdw_clk_stop_mode mode,
 				       enum sdw_clk_stop_type type)
 {
 	int ret = 0;
@@ -972,7 +995,7 @@ static int sdw_slave_clk_stop_callback(struct sdw_slave *slave,
 		struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
 
 		if (drv->ops && drv->ops->clk_stop)
-			ret = drv->ops->clk_stop(slave, mode, type);
+			ret = drv->ops->clk_stop(slave, slave->clk_stop_mode, type);
 	}
 
 	mutex_unlock(&slave->sdw_dev_lock);
@@ -981,7 +1004,6 @@ static int sdw_slave_clk_stop_callback(struct sdw_slave *slave,
 }
 
 static int sdw_slave_clk_stop_prepare(struct sdw_slave *slave,
-				      enum sdw_clk_stop_mode mode,
 				      bool prepare)
 {
 	bool wake_en;
@@ -993,7 +1015,7 @@ static int sdw_slave_clk_stop_prepare(struct sdw_slave *slave,
 	if (prepare) {
 		val = SDW_SCP_SYSTEMCTRL_CLK_STP_PREP;
 
-		if (mode == SDW_CLK_STOP_MODE1)
+		if (slave->clk_stop_mode == SDW_CLK_STOP_MODE1)
 			val |= SDW_SCP_SYSTEMCTRL_CLK_STP_MODE1;
 
 		if (wake_en)
@@ -1081,9 +1103,9 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus)
 		/* Identify if Slave(s) are available on Bus */
 		is_slave = true;
 
-		ret = sdw_slave_clk_stop_callback(slave,
-						  SDW_CLK_STOP_MODE0,
-						  SDW_CLK_PRE_PREPARE);
+		slave->clk_stop_mode = sdw_get_clk_stop_mode(slave);
+
+		ret = sdw_slave_clk_stop_callback(slave, SDW_CLK_PRE_PREPARE);
 		if (ret < 0 && ret != -ENODATA) {
 			dev_err(&slave->dev, "clock stop pre-prepare cb failed:%d\n", ret);
 			return ret;
@@ -1093,9 +1115,7 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus)
 		if (!slave->prop.simple_clk_stop_capable) {
 			simple_clk_stop = false;
 
-			ret = sdw_slave_clk_stop_prepare(slave,
-							 SDW_CLK_STOP_MODE0,
-							 true);
+			ret = sdw_slave_clk_stop_prepare(slave, true);
 			if (ret < 0 && ret != -ENODATA) {
 				dev_err(&slave->dev, "clock stop prepare failed:%d\n", ret);
 				return ret;
@@ -1133,9 +1153,7 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus)
 		    slave->status != SDW_SLAVE_ALERT)
 			continue;
 
-		ret = sdw_slave_clk_stop_callback(slave,
-						  SDW_CLK_STOP_MODE0,
-						  SDW_CLK_POST_PREPARE);
+		ret = sdw_slave_clk_stop_callback(slave, SDW_CLK_POST_PREPARE);
 
 		if (ret < 0 && ret != -ENODATA) {
 			dev_err(&slave->dev, "clock stop post-prepare cb failed:%d\n", ret);
@@ -1207,8 +1225,7 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus)
 		/* Identify if Slave(s) are available on Bus */
 		is_slave = true;
 
-		ret = sdw_slave_clk_stop_callback(slave, SDW_CLK_STOP_MODE0,
-						  SDW_CLK_PRE_DEPREPARE);
+		ret = sdw_slave_clk_stop_callback(slave, SDW_CLK_PRE_DEPREPARE);
 		if (ret < 0)
 			dev_warn(&slave->dev, "clock stop pre-deprepare cb failed:%d\n", ret);
 
@@ -1216,9 +1233,7 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus)
 		if (!slave->prop.simple_clk_stop_capable) {
 			simple_clk_stop = false;
 
-			ret = sdw_slave_clk_stop_prepare(slave, SDW_CLK_STOP_MODE0,
-							 false);
-
+			ret = sdw_slave_clk_stop_prepare(slave, false);
 			if (ret < 0)
 				dev_warn(&slave->dev, "clock stop deprepare failed:%d\n", ret);
 		}
@@ -1246,8 +1261,7 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus)
 		    slave->status != SDW_SLAVE_ALERT)
 			continue;
 
-		ret = sdw_slave_clk_stop_callback(slave, SDW_CLK_STOP_MODE0,
-						  SDW_CLK_POST_DEPREPARE);
+		ret = sdw_slave_clk_stop_callback(slave, SDW_CLK_POST_DEPREPARE);
 		if (ret < 0)
 			dev_warn(&slave->dev, "clock stop post-deprepare cb failed:%d\n", ret);
 	}
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 769a8ba5b5c6..2a497ef8d33c 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -618,6 +618,7 @@ struct sdw_bus_params {
  * @update_status: Update Slave status
  * @bus_config: Update the bus config for Slave
  * @port_prep: Prepare the port with parameters
+ * @get_clk_stop_mode: Get the clock stop mode of the Slave
  * @clk_stop: handle imp-def sequences before and after prepare and de-prepare
  */
 struct sdw_slave_ops {
@@ -631,6 +632,7 @@ struct sdw_slave_ops {
 	int (*port_prep)(struct sdw_slave *slave,
 			 struct sdw_prepare_ch *prepare_ch,
 			 enum sdw_port_prep_ops pre_ops);
+	enum sdw_clk_stop_mode (*get_clk_stop_mode)(struct sdw_slave *slave);
 	int (*clk_stop)(struct sdw_slave *slave,
 			enum sdw_clk_stop_mode mode,
 			enum sdw_clk_stop_type type);
@@ -649,6 +651,7 @@ struct sdw_slave_ops {
  * @node: node for bus list
  * @port_ready: Port ready completion flag for each Slave port
  * @m_port_map: static Master port map for each Slave port
+ * @clk_stop_mode: The clock stop mode of the Slave
  * @dev_num: Current Device Number, values can be 0 or dev_num_sticky
  * @dev_num_sticky: one-time static Device Number assigned by Bus
  * @probed: boolean tracking driver state
@@ -683,6 +686,7 @@ struct sdw_slave {
 	struct list_head node;
 	struct completion port_ready[SDW_MAX_PORTS];
 	unsigned int m_port_map[SDW_MAX_PORTS];
+	enum sdw_clk_stop_mode clk_stop_mode;
 	u16 dev_num;
 	u16 dev_num_sticky;
 	bool probed;
-- 
2.43.0

