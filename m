Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6483E346774;
	Wed,  2 Sep 2026 08:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337096; cv=none; b=HMH+gUz+UtWM1b5RW3blQyP7++RFHrW1OBQxiBWINjTUFeWA7TM/rKiCvI1Rb8eqxmOpmDW41LV3HUPndCXnj3zmbFQEHXLJAexwB2ux09SyA4mVmnouL0mmGXb/2rk6h6jRtjoQ+a7F0VYvqRPXEIWQCc3ZeLkNH94VCusC63g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337096; c=relaxed/simple;
	bh=6c/ipga8ckW+hbvuMMLgZvHT92UoZGMpJM6ZSWJzZCc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jykXiKySEMaF+030nT+AyTyhvH3qohwWhf79/aCmi3lxMqM663OVNEddwRWl551HOwpMFn6QCJWokJxu6cmlpcMZB9vZHGr3ZfJdoUOEurfjji1KvH90gH8r+eZBWfErtz4NT+4EfpTpNomxDPDv41d9Ab7+/aKxJpSxdoakH0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=REGdx+gG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="REGdx+gG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788337093; x=1819873093;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6c/ipga8ckW+hbvuMMLgZvHT92UoZGMpJM6ZSWJzZCc=;
  b=REGdx+gGkSVVUZDN+YH7T1VIhFzgYFWChN7gx6JyXhInjVTpdevhQQwV
   IWeSdWB6ZpJtyCyBCl2x7TgR6Fmsxy/sSZmMO6kml8IJN2Rg8WybKfaJi
   g12dW1wD1nHLawNe8n4nbQjBMqsSkDd1Ywib/cE5xr8R0RDlEpqDtjl54
   jLW/F06WJouTsyUB6d13jg0Ar23iNPy7jKtVQ7SMgU3+Oj7V1/n6fZqlM
   +/Gtwi+SXXXhKOX6ho6ISEr5WRQRzH7v1NQ+9yeT0dDYlHeoGNJu6CYnY
   8RqmL048ML8GhVZUIH2L6+QI+EQoFS0khESkHFVD+fMwfvF98shyXp5Ox
   g==;
X-CSE-ConnectionGUID: r3+anVrDSne5JFD3KgUupA==
X-CSE-MsgGUID: KlbIFjH1RJKn0uDDLM2rxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100299837"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="100299837"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 01:18:12 -0700
X-CSE-ConnectionGUID: aBO2eZydR5+39LQ3HmFBog==
X-CSE-MsgGUID: NduShXNvT96Q/aYJhZ+FSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="271313845"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 01:18:10 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH] soundwire: debugfs: add root-level peripherals table
Date: Wed,  2 Sep 2026 16:18:02 +0800
Message-ID: <20260902081802.420946-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The table will let user know what peripherals are listed and get the
detected status by the dev_num.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/debugfs.c | 72 +++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index 2905ec19b838..3cc3428df6a4 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -9,12 +9,82 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/string_choices.h>
 #include "bus.h"
 
 static struct dentry *sdw_debugfs_root;
 
+#define SDW_PERIPH_HEADER_FMT "%-28s %-7s %-16s %-6s %-7s %-8s %-9s %-11s\n"
+#define SDW_PERIPH_ENTRY_FMT  "%-28s %-7u %#016llx %-6.4x %-7.4x %-8.2x %-9.2x %-11.1x\n"
+
+static u64 sdw_slave_addr_from_id(struct sdw_bus *bus,
+				 const struct sdw_slave_id *id)
+{
+	u64 addr = 0;
+	u8 unique_id = id->unique_id;
+
+	if (unique_id == SDW_IGNORED_UNIQUE_ID)
+		unique_id = 0;
+
+	addr |= FIELD_PREP(SDW_DISCO_LINK_ID_MASK, bus->link_id);
+	addr |= FIELD_PREP(SDW_VERSION_MASK, id->sdw_version);
+	addr |= FIELD_PREP(SDW_UNIQUE_ID_MASK, unique_id);
+	addr |= FIELD_PREP(SDW_MFG_ID_MASK, id->mfg_id);
+	addr |= FIELD_PREP(SDW_PART_ID_MASK, id->part_id);
+	addr |= FIELD_PREP(SDW_CLASS_ID_MASK, id->class_id);
+
+	return addr;
+}
+
+static void sdw_dump_bus_peripherals(struct seq_file *s_file, struct sdw_bus *bus)
+{
+	struct sdw_slave *slave;
+	u64 addr;
+
+	seq_printf(s_file, "master-%d-%d\n",
+		   bus->controller_id, bus->link_id);
+	seq_printf(s_file, SDW_PERIPH_HEADER_FMT,
+		   "name", "dev_num", "addr", "mfg_id", "part_id",
+		   "class_id", "unique_id", "sdw_version");
+
+	mutex_lock(&bus->bus_lock);
+	list_for_each_entry(slave, &bus->slaves, node) {
+		addr = sdw_slave_addr_from_id(bus, &slave->id);
+		seq_printf(s_file, SDW_PERIPH_ENTRY_FMT,
+			   dev_name(&slave->dev), slave->dev_num,
+			   addr,
+			   slave->id.mfg_id, slave->id.part_id,
+			   slave->id.class_id, slave->id.unique_id,
+			   slave->id.sdw_version);
+	}
+	mutex_unlock(&bus->bus_lock);
+
+	seq_putc(s_file, '\n');
+}
+
+static int sdw_root_peripherals_dump(struct device *dev, void *data)
+{
+	struct sdw_master_device *md;
+	struct seq_file *s_file = data;
+
+	if (dev->type != &sdw_master_type)
+		return 0;
+
+	md = dev_to_sdw_master_device(dev);
+	sdw_dump_bus_peripherals(s_file, md->bus);
+
+	return 0;
+}
+
+static int sdw_root_peripherals_show(struct seq_file *s_file, void *data)
+{
+	return bus_for_each_dev(&sdw_bus_type, NULL, s_file,
+				sdw_root_peripherals_dump);
+}
+DEFINE_SHOW_ATTRIBUTE(sdw_root_peripherals);
+
 void sdw_bus_debugfs_init(struct sdw_bus *bus)
 {
 	char name[16];
@@ -375,6 +445,8 @@ void sdw_debugfs_init(void)
 		firmware_file = kstrdup("", GFP_KERNEL);
 
 	sdw_debugfs_root = debugfs_create_dir("soundwire", NULL);
+	debugfs_create_file("peripherals", 0400, sdw_debugfs_root, NULL,
+			    &sdw_root_peripherals_fops);
 }
 
 void sdw_debugfs_exit(void)
-- 
2.43.0

