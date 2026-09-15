Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778D13BF662;
	Tue, 15 Sep 2026 13:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478026; cv=none; b=S1pD+0vozhMfRVFlU7oG0mi27OkNpe7zhBqqEZ6wAW9I9FuuHLKgyouPt6kBZVGNAGHkoHMFFP/LImD33vyWRL+0kCX+hdu8n7zs3FzXGrghPq63t2lUNdcfDLjmDtY5fwc+3rvb7/mqJ5oPrJ3X3ZaA2d+ln3tMLXyMnLCQTzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478026; c=relaxed/simple;
	bh=PRL54LCiUIIEeMNsl/VPIKHNCvOrIYrCSHO1Io9SjtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qm7sqGLnNknNtHcysVH6gjM/9l9fcwxWTP18d97S1ixZOZKH4BGLKJeHGOFlNyDd6hEg6ZTiV74NH3ckF05c0nNrPjKzdhrUaXZA1RYh5cSEfQKUBDQ8Ov//7Aw9APlt/aYezrAGhJJf5BBasNmLrgdyu6cw6NvcOjuYcI50LFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XxqxOo+l; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XxqxOo+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789478025; x=1821014025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PRL54LCiUIIEeMNsl/VPIKHNCvOrIYrCSHO1Io9SjtA=;
  b=XxqxOo+lV+xkxBMYbYFtf/m379aL9T20pN2LXub/kFMTgQwS/DJFscka
   YcJuunGBibuOrPX7dszOUpGDzQc7x2NHMaX/y8OISezhi6Ot7o+gEjqH1
   UPADf1Q5VA+Sf1KFf1Htj08j96NVA6IywWy08LRNP8Ehs4Zd96ueRwdi4
   0FIfMUEFR5wmdFCfGc54YoJdZ9HkAineh+t25iaB765O3LTFqKXe7pUXF
   9ljakpsgYAIUwPdMHPpKwgKfrx/hN8LGkda2Hy/bi1I2XcYaGaQBxAgME
   P+XRm/6kh8x385ijaFNNQyijv02J0AqzoD0j7J/DllSzH6u3yXinP2EZm
   Q==;
X-CSE-ConnectionGUID: 5sk+nHtvQLmwX7j2MoSKIg==
X-CSE-MsgGUID: NZhlIZ7MQ62nzRvLuy0Zqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112608442"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="112608442"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:13:45 -0700
X-CSE-ConnectionGUID: W3igsj5HQ/WD94Av0kjtJA==
X-CSE-MsgGUID: R4+iSvYfRWClYtj/1qlihA==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:13:42 -0700
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
Subject: [PATCH 2/3] soundwire: change sdw_show_ping_status type to int
Date: Tue, 15 Sep 2026 21:13:26 +0800
Message-ID: <20260915131327.1783551-3-yung-chuan.liao@linux.intel.com>
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

So that the caller can get the ping results.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/bus.c       | 16 +++++++++++-----
 include/linux/soundwire/sdw.h |  2 +-
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index b49864ca683a..ee90f7d3233e 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -314,13 +314,16 @@ int sdw_transfer(struct sdw_bus *bus, struct sdw_msg *msg)
  * sdw_show_ping_status() - Direct report of PING status, to be used by Peripheral drivers
  * @bus: SDW bus
  * @sync_delay: Delay before reading status
+ *
+ * returns 0 if there is no peripherals attached, 1 if there are peripherals attached
+ * or a negative error code.
  */
-void sdw_show_ping_status(struct sdw_bus *bus, bool sync_delay)
+int sdw_show_ping_status(struct sdw_bus *bus, bool sync_delay)
 {
 	u32 status;
 
 	if (!bus->ops->read_ping_status)
-		return;
+		return -ENOTSUPP;
 
 	/*
 	 * wait for peripheral to sync if desired. 10-15ms should be more than
@@ -335,10 +338,13 @@ void sdw_show_ping_status(struct sdw_bus *bus, bool sync_delay)
 
 	mutex_unlock(&bus->msg_lock);
 
-	if (!status)
+	if (!status) {
 		dev_warn(bus->dev, "%s: no peripherals attached\n", __func__);
-	else
-		dev_dbg(bus->dev, "PING status: %#x\n", status);
+		return 0;
+	}
+
+	dev_dbg(bus->dev, "PING status: %#x\n", status);
+	return 1;
 }
 EXPORT_SYMBOL(sdw_show_ping_status);
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 0cb7e4fef00e..1b03bfad2e6b 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -901,7 +901,7 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 		       struct fwnode_handle *fwnode);
 void sdw_bus_master_delete(struct sdw_bus *bus);
 
-void sdw_show_ping_status(struct sdw_bus *bus, bool sync_delay);
+int sdw_show_ping_status(struct sdw_bus *bus, bool sync_delay);
 
 /**
  * struct sdw_port_config: Master or Slave Port configuration
-- 
2.43.0

