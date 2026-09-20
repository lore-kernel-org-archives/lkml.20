Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D6B43CE4E
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789917217; cv=none; b=Ok5WU6ZNsgURzBRyeMrL6EZAJ4PtNe49ifhtSa9C4wOvVFBiKdj9BwwBAiwWPHB6CnCDcBFsse9iWnRWTwUd3BkYBT113sdGBax8c8Y6mve7KD6KNoHBDUcvdwK1tAnZouQxfXsuqxEId501WZ1BQnseNLvaf+v0QtrzBqx6GGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789917217; c=relaxed/simple;
	bh=7z4xuLdIhJUcLlDk8LtJPPrkLI6H9Y0AtjiiNm2bUdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJKiSzJV83UwZJn1H0u11nWACJQCmhPhrVlEsZLrs3pvUw5w+iVK7TxX7ucK6emoHcRSbEHiwds62kiOxzys8EDKPcMTXmqRZRzdFXUaj5GGmqNZQlrMePDAhuqekSGa9aTPF23A9Kxn4lhT1v6b8qa1LopEkhxR1Q2AMyyg7rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQ86EAob; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQ86EAob"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917216; x=1821453216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7z4xuLdIhJUcLlDk8LtJPPrkLI6H9Y0AtjiiNm2bUdA=;
  b=SQ86EAobiM2INrHXEjrbro/QUtHk9jl5O4fCeFQYilAVE/pMuKMO2YLL
   0uzbBMLS+NT3yQep9ZBvUAsv+3zGdj2rBpCt9djAr35hno6VIXMZqdlPB
   hgrg3woNn+O9ReaafPY++owJZ9sPRqPFd631DbvdX2FHQz3vyrZRNeWc7
   VIe19PnmPHfq/8M9WmZSbrYkHHU1Y/+bgFaw+VUe4CIsBxNJzPvdEz9je
   Lk9hEOABUY9yHgSdlPsw7OsxDZruYZWj343rnqz4j2n9jt0nkhjOk33MG
   q6JlUpz831BbkSErpDYJM1Q2lBTAJ7Q/WDYPR9MIXRDAMuYFmBUAcPfxO
   g==;
X-CSE-ConnectionGUID: pDy+r4tETByxvtiXrUn5gg==
X-CSE-MsgGUID: l3w/v1juT2WoHRhJAyzjuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548501"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548501"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:34 -0700
X-CSE-ConnectionGUID: pRH5KoEtRiu6eKfTLuhvOA==
X-CSE-MsgGUID: /VGF7nhsTHau4TIlM9aBYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352486"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:33 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 17/17] i3c: mipi-i3c-hci: Add HDR-DDR support
Date: Sun, 20 Sep 2026 18:12:47 +0300
Message-ID: <20260920151248.46936-18-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920151248.46936-1-adrian.hunter@intel.com>
References: <20260920151248.46936-1-adrian.hunter@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Content-Transfer-Encoding: 8bit

Add support for HDR-DDR private transfers.  Encode HDR-DDR Command
Descriptors and advertise HDR-DDR capability when supported by the
controller.

Carry the HDR Command Code in the descriptor CP, CMD and RNW fields.
Use the Immediate Data Transfer Command for writes of up to four bytes,
as is already done for SDR, and the Regular Data Transfer Command
otherwise.  The Immediate Data Transfer Command is write-only, which
suits HDR because the eighth bit of the HDR Command Code is field RNW,
so a write Command Code leaves that field zero as required.

Reject transfers shorter than one Data Word or with an odd byte count,
as HDR-DDR transfers are defined in whole Data Words and the I3C
specification requires at least one Data Word to follow the Command
Word.

Only advertise HDR-DDR capability when the driver can generate the
required descriptor format.

Assisted-by: GitHub-Copilot:claude-opus-5
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Added Frank Li's Reviewed-by tag.


 drivers/i3c/master/mipi-i3c-hci/cmd.h    |  2 +-
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c | 26 +++++++++++---
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c |  4 ++-
 drivers/i3c/master/mipi-i3c-hci/core.c   | 45 +++++++++++++++++++++---
 drivers/i3c/master/mipi-i3c-hci/hci.h    |  9 ++---
 include/linux/i3c/device.h               |  4 +++
 6 files changed, 76 insertions(+), 14 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd.h b/drivers/i3c/master/mipi-i3c-hci/cmd.h
index e0d4a6e0e319..fa3107df7c51 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd.h
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd.h
@@ -55,7 +55,7 @@ struct hci_cmd_ops {
 	int (*prep_ccc)(struct i3c_hci *hci, struct hci_xfer *xfer,
 			u8 ccc_addr, u8 ccc_cmd, bool raw);
 	void (*prep_i3c_xfer)(struct i3c_hci *hci, struct i3c_dev_desc *dev,
-			      struct hci_xfer *xfer);
+			      struct hci_xfer *xfer, enum i3c_xfer_mode mode);
 	void (*prep_i2c_xfer)(struct i3c_hci *hci, struct i2c_dev_desc *dev,
 			      struct hci_xfer *xfer);
 	int (*perform_daa)(struct i3c_hci *hci);
diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
index 9910df53c013..78ad2ec2bd93 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
@@ -215,14 +215,30 @@ static int hci_cmd_v1_prep_ccc(struct i3c_hci *hci,
 
 static void hci_cmd_v1_prep_i3c_xfer(struct i3c_hci *hci,
 				     struct i3c_dev_desc *dev,
-				     struct hci_xfer *xfer)
+				     struct hci_xfer *xfer,
+				     enum i3c_xfer_mode xfer_mode)
 {
 	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
 	unsigned int dat_idx = dev_data->dat_idx;
-	enum hci_cmd_mode mode = get_i3c_mode(hci);
+	enum hci_cmd_mode mode;
 	u8 *data = xfer->data;
 	unsigned int data_len = xfer->data_len;
 	bool rnw = xfer->rnw;
+	u32 cp_cmd = 0;
+
+	if (xfer_mode == I3C_SDR) {
+		mode = get_i3c_mode(hci);
+	} else {
+		/*
+		 * HDR-DDR is the only advertised HDR Mode, so a non-SDR
+		 * transfer uses the HDR-DDR Command Code encoding: CP marks CMD
+		 * as valid, CMD carries bits[6:0], and RNW carries bit[7]. CP
+		 * and CMD occupy the same descriptor bits in both command
+		 * formats.
+		 */
+		mode = MODE_I3C_HDR_DDR;
+		cp_cmd = CMD_R0_CP | CMD_R0_CMD(xfer->hdr_cmd & I3C_HDR_CMD_CODE);
+	}
 
 	xfer->cmd_tid = hci_get_tid();
 
@@ -233,7 +249,8 @@ static void hci_cmd_v1_prep_i3c_xfer(struct i3c_hci *hci,
 			CMD_I0_TID(xfer->cmd_tid) |
 			CMD_I0_DEV_INDEX(dat_idx) |
 			CMD_I0_DTT(data_len) |
-			CMD_I0_MODE(mode);
+			CMD_I0_MODE(mode) |
+			cp_cmd;
 		fill_data_bytes(xfer, data, data_len);
 	} else {
 		/* we use a Regular Data Transfer Command */
@@ -242,7 +259,8 @@ static void hci_cmd_v1_prep_i3c_xfer(struct i3c_hci *hci,
 			CMD_R0_TID(xfer->cmd_tid) |
 			CMD_R0_DEV_INDEX(dat_idx) |
 			CMD_R0_MODE(mode) |
-			(rnw ? CMD_R0_RNW : 0);
+			(rnw ? CMD_R0_RNW : 0) |
+			cp_cmd;
 		xfer->cmd_desc[1] =
 			CMD_R1_DATA_LENGTH(data_len);
 	}
diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
index 8d93748e858d..b5e25f05f03e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
@@ -212,9 +212,11 @@ static int hci_cmd_v2_prep_ccc(struct i3c_hci *hci, struct hci_xfer *xfer,
 	return 0;
 }
 
+/* For cmd_v2, only SDR capability is advertised */
 static void hci_cmd_v2_prep_i3c_xfer(struct i3c_hci *hci,
 				     struct i3c_dev_desc *dev,
-				     struct hci_xfer *xfer)
+				     struct hci_xfer *xfer,
+				     enum i3c_xfer_mode xfer_mode)
 {
 	unsigned int mode = XFERMODE_IDX_I3C_SDR;
 	unsigned int rate = get_i3c_rate_idx(hci);
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index d6a8a7612d46..1b75df2fe34c 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -116,6 +116,13 @@ static inline struct i3c_hci *to_i3c_hci(struct i3c_master_controller *m)
 	return container_of(m, struct i3c_hci, master);
 }
 
+/* HDR support has been added for cmd_v1 only */
+static bool i3c_hci_hdr_ddr_capable(struct i3c_hci *hci)
+{
+	return hci->cmd == &mipi_i3c_hci_cmd_v1 &&
+	       hci->caps & HC_CAP_HDR_DDR_EN;
+}
+
 /**
  * i3c_hci_sysdev() - Get the device to use for DMA and system PM
  * @dev: Device the HCI controller is bound to
@@ -158,6 +165,8 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
 	i3c_hci_set_master_dyn_addr(hci);
 	memset(&info, 0, sizeof(info));
 	info.dyn_addr = hci->dyn_addr;
+	if (i3c_hci_hdr_ddr_capable(hci))
+		info.hdr_cap = BIT(I3C_HDR_DDR);
 	ret = i3c_master_set_info(m, &info);
 	if (ret)
 		return ret;
@@ -463,6 +472,27 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
 	return ret;
 }
 
+static bool i3c_hci_rnw(struct i3c_xfer *i3c_xfer, enum i3c_xfer_mode mode)
+{
+	if (mode == I3C_SDR)
+		return i3c_xfer->rnw;
+
+	return i3c_xfer->cmd & I3C_HDR_CMD_RNW;
+}
+
+static int i3c_hci_check_hdr_ddr_xfers(struct i3c_xfer *i3c_xfers, int nxfers)
+{
+	/*
+	 * HDR-DDR frames 16-bit Data Words, and at least one Data Word must
+	 * follow the Command Word.
+	 */
+	for (int i = 0; i < nxfers; i++)
+		if (i3c_xfers[i].len < 2 || i3c_xfers[i].len % 2)
+			return -EINVAL;
+
+	return 0;
+}
+
 static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
 			     struct i3c_xfer *i3c_xfers, int nxfers,
 			     enum i3c_xfer_mode mode)
@@ -475,20 +505,27 @@ static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
 
 	dev_dbg(&hci->master.dev, "nxfers = %d", nxfers);
 
+	if (mode == I3C_HDR_DDR) {
+		ret = i3c_hci_check_hdr_ddr_xfers(i3c_xfers, nxfers);
+		if (ret)
+			return ret;
+	}
+
 	xfer = hci_alloc_xfer(nxfers);
 	if (!xfer)
 		return -ENOMEM;
 
 	for (i = 0; i < nxfers; i++) {
 		xfer[i].data_len = i3c_xfers[i].len;
-		xfer[i].rnw = i3c_xfers[i].rnw;
-		if (i3c_xfers[i].rnw) {
+		xfer[i].rnw = i3c_hci_rnw(i3c_xfers + i, mode);
+		xfer[i].hdr_cmd = i3c_xfers[i].cmd;
+		if (xfer[i].rnw) {
 			xfer[i].data = i3c_xfers[i].data.in;
 		} else {
 			/* silence the const qualifier warning with a cast */
 			xfer[i].data = (void *) i3c_xfers[i].data.out;
 		}
-		hci->cmd->prep_i3c_xfer(hci, dev, &xfer[i]);
+		hci->cmd->prep_i3c_xfer(hci, dev, &xfer[i], mode);
 		xfer[i].cmd_desc[0] |= CMD_0_ROC;
 	}
 	last = i - 1;
@@ -500,7 +537,7 @@ static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
 	if (ret)
 		goto out;
 	for (i = 0; i < nxfers; i++) {
-		if (i3c_xfers[i].rnw)
+		if (xfer[i].rnw)
 			i3c_xfers[i].len = RESP_DATA_LENGTH(xfer[i].response);
 		if (RESP_STATUS(xfer[i].response) != RESP_SUCCESS) {
 			ret = -EIO;
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index ee73f6e6756a..4288a1b5b491 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -85,10 +85,10 @@ struct i3c_hci {
 
 /*
  * Structure to represent a master initiated transfer.
- * The rnw, data and data_len fields must be initialized before calling any
- * hci->cmd->*() method. The cmd method will initialize cmd_desc[] and
- * possibly modify (clear) the data field. Then xfer->cmd_desc[0] can
- * be augmented with CMD_0_ROC and/or CMD_0_TOC.
+ * The rnw, data and data_len (and hdr_cmd for HDR) fields must be initialized
+ * before calling any hci->cmd->*() method. The cmd method will initialize
+ * cmd_desc[] and possibly modify (clear) the data field. Then xfer->cmd_desc[0]
+ * can be augmented with CMD_0_ROC and/or CMD_0_TOC.
  * The completion field needs to be initialized before queueing with
  * hci->io->queue_xfer(), and requires CMD_0_ROC to be set.
  */
@@ -97,6 +97,7 @@ struct hci_xfer {
 	u32 response;
 	bool rnw;
 	bool started;
+	u8 hdr_cmd;
 	void *data;
 	unsigned int data_len;
 	unsigned int cmd_tid;
diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index 0f065b883ee0..e30ea2cb13cb 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -79,6 +79,10 @@ struct i3c_xfer {
 	enum i3c_error_code err;
 };
 
+/* For splitting 'cmd' from struct i3c_xfer */
+#define I3C_HDR_CMD_RNW			BIT(7)
+#define I3C_HDR_CMD_CODE		GENMASK(6, 0)
+
 /**
  * enum i3c_dcr - I3C DCR values
  * @I3C_DCR_GENERIC_DEVICE: generic I3C device
-- 
2.53.0

