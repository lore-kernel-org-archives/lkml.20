Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1200443CE4E
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789917211; cv=none; b=fBLxmbVc5X0wdfOKnJi3kgPtpLXhmYInrAqwzOyosLgEYPvvhKEWF6sH7qdOCjqdAW57DnBe+y4nmp8smDuWJ+byjIkFTusBTm96G6hxl9ds42ccy9kKRPXDDlpajo7J9oGq11RQOABSAOD8MVA5LdbrQJXUXvZkYVDhFPjoXAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789917211; c=relaxed/simple;
	bh=FPfKcTzrIsQ9Dl50TxSunUivLTJvk7Si5CDYIRBmPMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sfIRLt1t/5gnO/1ZRjW9LMvlfp/8QD7j6TMwWwz8gx/baXHXbfurM+b3mc8fBwbmml3/lHrqG5oUReFdhCYeKPVXHAXc/WZwlrer6EC7gSFg1n7cc8rYt85I3pDOopZoUmLajM4zqsUuZ/YeKlivEJi3iMls2uBxdtp7s06WVvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWk3ew1V; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWk3ew1V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917210; x=1821453210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FPfKcTzrIsQ9Dl50TxSunUivLTJvk7Si5CDYIRBmPMA=;
  b=jWk3ew1VgmswhLZ3Iaa78NK3vxiue6XcLvpkhAnF0RF0c1gtpUMklUoY
   aOvEKOoz0fOkQIMqnQNDeKXcDnEr4dhuiZsEJcOHRKMtBxiciocTfKwx+
   X8YA0XaeciuseqtHLrgmrz76t3RDUKLnpaATPBfU2mZ1XFofS2XyMvCUg
   VqLdOZGdq7k8QBZhvr+2HnfFAmRD5TZqybLLlMpgeEGiFb7j8VfYyyAHT
   /b4VSSqGwP3jM5h5Q35kp/GRd3R/TlVBq3VV4fdiZd8AxguvwGwKKzvgC
   Ypj2h33ZuGmp4NAZ0VLh+3u8Xx4Zulq5SiuH/QumC6Qeht32WHeb4gekG
   w==;
X-CSE-ConnectionGUID: T780xjY8R9yCbe8W+azeew==
X-CSE-MsgGUID: 7yjEu2lbQTqSrGkrCFwrsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548487"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548487"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:30 -0700
X-CSE-ConnectionGUID: gjAl/iJzTImpu0pJF6h7ZA==
X-CSE-MsgGUID: sI6xj+/3SbCrti99ic9E9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352460"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:29 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 15/17] i3c: mipi-i3c-hci: Support configurable device NACK retries
Date: Sun, 20 Sep 2026 18:12:45 +0300
Message-ID: <20260920151248.46936-16-adrian.hunter@intel.com>
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

Implement the .set_dev_nack_retry() master operation using the
DAT_0_DEV_NACK_RETRY_CNT field in Device Address Table entries.

Since the retry count is programmed per DAT entry, update all allocated
entries when the setting changes. Also initialize newly allocated
entries with the current retry count so that a consistent retry policy
is applied across all devices.

Add a DAT helper to update the retry count of an individual entry.
Return -ERANGE if the requested retry count exceeds the hardware field
width and -EOPNOTSUPP when the active command descriptor model does not
use DAT entries.

In addition, default the retry count to 1. The I3C specification
mandates a retry when a Target NACKs its Dynamic Address. HCI v1.1
explicitly preserves that behaviour for Direct CCCs even when
DEV_NACK_RETRY_CNT is programmed to 0, but HCI v1.0 defines the field
only as a device-specific retry count and does not provide the same
exception. As a result, a v1.0 controller left at the reset value of 0
may perform no retry whereas a v1.1 controller will retry once.
Promoting 0 to 1 at probe time makes the behaviour consistent across
controller versions. Userspace can still select 0 retries explicitly
via dev_nack_retry_count.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V3:

	Moved the retry count range check and the loop over allocated
	DAT entries from the DAT layer into i3c_hci_set_dev_nack_retry(),
	and removed the set_all_nack_retry() DAT operation.
	Moved the DAT_0_DEV_NACK_RETRY_CNT definition to dat.h so that it
	is visible to the caller.
	Amended the commit message accordingly.

Changes in V2:

	None


 drivers/i3c/master/mipi-i3c-hci/core.c   | 32 ++++++++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/dat.h    |  2 ++
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 13 +++++++++-
 3 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 7a39be64c4e1..d6a8a7612d46 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -555,6 +555,11 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
 	return ret;
 }
 
+static void i3c_hci_dat_v1_set_curr_nack_retry(struct i3c_hci *hci, unsigned int dat_idx)
+{
+	mipi_i3c_hci_dat_v1.set_nack_retry(hci, dat_idx, hci->master.dev_nack_retry_count);
+}
+
 static int i3c_hci_attach_i3c_dev(struct i3c_dev_desc *dev)
 {
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
@@ -573,6 +578,7 @@ static int i3c_hci_attach_i3c_dev(struct i3c_dev_desc *dev)
 		}
 		mipi_i3c_hci_dat_v1.set_dynamic_addr(hci, ret,
 						     dev->info.dyn_addr ?: dev->info.static_addr);
+		i3c_hci_dat_v1_set_curr_nack_retry(hci, ret);
 		dev_data->dat_idx = ret;
 	}
 	i3c_dev_set_master_data(dev, dev_data);
@@ -622,6 +628,7 @@ static int i3c_hci_attach_i2c_dev(struct i2c_dev_desc *dev)
 	}
 	mipi_i3c_hci_dat_v1.set_static_addr(hci, ret, dev->addr);
 	mipi_i3c_hci_dat_v1.set_flags(hci, ret, DAT_0_I2C_DEVICE, 0);
+	i3c_hci_dat_v1_set_curr_nack_retry(hci, ret);
 	dev_data->dat_idx = ret;
 	i2c_dev_set_master_data(dev, dev_data);
 	return 0;
@@ -733,6 +740,23 @@ static void i3c_hci_recycle_ibi_slot(struct i3c_dev_desc *dev,
 	hci->io->recycle_ibi_slot(hci, dev, slot);
 }
 
+static int i3c_hci_set_dev_nack_retry(struct i3c_master_controller *m, unsigned int cnt)
+{
+	struct i3c_hci *hci = to_i3c_hci(m);
+	unsigned int dat_idx;
+
+	if (hci->cmd != &mipi_i3c_hci_cmd_v1)
+		return -EOPNOTSUPP;
+
+	if (cnt > FIELD_MAX(DAT_0_DEV_NACK_RETRY_CNT))
+		return -ERANGE;
+
+	for_each_set_bit(dat_idx, hci->DAT_data, hci->DAT_entries)
+		mipi_i3c_hci_dat_v1.set_nack_retry(hci, dat_idx, cnt);
+
+	return 0;
+}
+
 static const struct i3c_master_controller_ops i3c_hci_ops = {
 	.bus_init		= i3c_hci_bus_init,
 	.bus_cleanup		= i3c_hci_bus_cleanup,
@@ -752,6 +776,7 @@ static const struct i3c_master_controller_ops i3c_hci_ops = {
 	.recycle_ibi_slot	= i3c_hci_recycle_ibi_slot,
 	.enable_hotjoin		= i3c_hci_enable_hotjoin,
 	.disable_hotjoin	= i3c_hci_disable_hotjoin,
+	.set_dev_nack_retry	= i3c_hci_set_dev_nack_retry,
 };
 
 static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
@@ -1186,6 +1211,13 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	if (device_can_wakeup(i3c_hci_sysdev(&pdev->dev)))
 		hci->master.ibi_wakeup = true;
 
+	/*
+	 * HCI v1.1 onward does 1 retry for Direct CCCs anyway, so for v1.0 to
+	 * be consistent, promote 0 to 1.
+	 */
+	if (!hci->master.dev_nack_retry_count)
+		hci->master.dev_nack_retry_count = 1;
+
 	return i3c_master_register(&hci->master, &pdev->dev, &i3c_hci_ops, false);
 }
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/dat.h b/drivers/i3c/master/mipi-i3c-hci/dat.h
index 6881f19da77f..31becc6f9aec 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat.h
+++ b/drivers/i3c/master/mipi-i3c-hci/dat.h
@@ -12,6 +12,7 @@
 
 /* Global DAT flags */
 #define DAT_0_I2C_DEVICE		W0_BIT_(31)
+#define DAT_0_DEV_NACK_RETRY_CNT	W0_MASK(30, 29)
 #define DAT_0_SIR_REJECT		W0_BIT_(13)
 #define DAT_0_IBI_PAYLOAD		W0_BIT_(12)
 
@@ -25,6 +26,7 @@ struct hci_dat_ops {
 	void (*clear_flags)(struct i3c_hci *hci, unsigned int dat_idx, u32 w0, u32 w1);
 	int (*get_index)(struct i3c_hci *hci, u8 address);
 	void (*restore)(struct i3c_hci *hci);
+	void (*set_nack_retry)(struct i3c_hci *hci, unsigned int dat_idx, unsigned int cnt);
 };
 
 extern const struct hci_dat_ops mipi_i3c_hci_dat_v1;
diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
index 852966aa20d9..ec0764a27c62 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
@@ -24,7 +24,7 @@
 #define DAT_1_AUTOCMD_VALUE		W1_MASK(47, 40)
 #define DAT_1_AUTOCMD_MASK		W1_MASK(39, 32)
 /*	DAT_0_I2C_DEVICE		W0_BIT_(31) */
-#define DAT_0_DEV_NACK_RETRY_CNT	W0_MASK(30, 29)
+/*	DAT_0_DEV_NACK_RETRY_CNT	W0_MASK(30, 29) */
 #define DAT_0_RING_ID			W0_MASK(28, 26)
 #define DAT_0_DYNADDR_PARITY		W0_BIT_(23)
 #define DAT_0_DYNAMIC_ADDRESS		W0_MASK(22, 16)
@@ -189,6 +189,16 @@ static void hci_dat_v1_restore(struct i3c_hci *hci)
 	}
 }
 
+static void hci_dat_v1_set_nack_retry(struct i3c_hci *hci, unsigned int dat_idx, unsigned int cnt)
+{
+	u32 dat_w0;
+
+	dat_w0 = dat_w0_read(dat_idx);
+	dat_w0 &= ~DAT_0_DEV_NACK_RETRY_CNT;
+	dat_w0 |= FIELD_PREP(DAT_0_DEV_NACK_RETRY_CNT, cnt);
+	dat_w0_write(dat_idx, dat_w0);
+}
+
 const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
 	.init			= hci_dat_v1_init,
 	.alloc_entry		= hci_dat_v1_alloc_entry,
@@ -199,4 +209,5 @@ const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
 	.clear_flags		= hci_dat_v1_clear_flags,
 	.get_index		= hci_dat_v1_get_index,
 	.restore		= hci_dat_v1_restore,
+	.set_nack_retry		= hci_dat_v1_set_nack_retry,
 };
-- 
2.53.0

