Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81343B7752
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672478; cv=none; b=b5ja8Qd9myuiyIUN7oHwIdPfwtjvXiqq8JswXnzvZDsfYMroiJn0VoERQVuZlqkkoxt7KX5B1/QAMS1sBJWIIAfWyZ03MCcVfzgXBfZfbIwEj1n6ZvPLnfvCu99Dcl0cK3bsD11zHxvCh6bHpXWEvIIucKd3kMXg2ZJwjMAG+FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672478; c=relaxed/simple;
	bh=GBasbmZHDFkQoStxD/ozhnH/wuRkAeBfKzfFHlEaBWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GwWDkWL+bXSl9NWZYoAQrVO68Cwnmkuwt5RQvrbWbvdcfqYqvNhv48IUrkbtokNHVyhoEMtdjYU7wBCmbbHGyfEzfTDhSWrJTPjBZP/QBl7dVeGI4uaAeKJRNBMEgJ4upI1uKt0m950+3ZYKezq2w1NC9VWmsHyX4jVuWuYHZKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXV90X8u; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXV90X8u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672476; x=1821208476;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GBasbmZHDFkQoStxD/ozhnH/wuRkAeBfKzfFHlEaBWY=;
  b=nXV90X8uSNQS2MtTElCqWpAUAmRYoD1SS/xDVAS7MEc+yyX9s+C5Eq1Z
   EcGcu50fsN1oLruH8KS3l5aKj4jf6Aj7OfE3L9lsUZQNufxtNZP71ig4U
   1X1jNYDnQ25Yj8vmO5mZwvqn+6V45Gnn5oS4AI4nhTT3euJg+fh1CQuWm
   UkwF/FzC9gwWuYqFQrrY7QO1CtVhOf2Jp++8jLo8cWISoH2kzxNB4GFyU
   32hN0oFEJHbnOfbi+/gkwuQNSCg7JziA8XqUjY28vQFAYhgJHFG4lgzsl
   e78XAkvj9FuxUaH/HKSAV0plggGGRQ5y7/Ywq0b35VCaM+csFoda5xHln
   Q==;
X-CSE-ConnectionGUID: 073i7VFfSC2BVOPp4sHUCQ==
X-CSE-MsgGUID: fGxHIMy+TjO3x0yrGB+9Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639979"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639979"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:36 -0700
X-CSE-ConnectionGUID: Z+Fym9lXScinUTh7u8qFLg==
X-CSE-MsgGUID: F5yZL9BmQtufpW6wXg5jZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270272020"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:34 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 15/17] i3c: mipi-i3c-hci: Support configurable device NACK retries
Date: Thu, 17 Sep 2026 22:13:54 +0300
Message-ID: <20260917191356.133242-16-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917191356.133242-1-adrian.hunter@intel.com>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
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
entries when the setting changes and initialize newly allocated entries
with the current value so that a consistent retry policy is applied
across all devices.

Add DAT helper operations to update individual entries and all allocated
entries.  Return -ERANGE if the requested retry count exceeds the
hardware field width and -EOPNOTSUPP when the active command descriptor
model does not use DAT entries.

In addition, default the retry count to 1.  The I3C specification
mandates a retry when a Target NACKs its Dynamic Address.  HCI v1.1
explicitly preserves that behaviour for Direct CCCs even when
DEV_NACK_RETRY_CNT is programmed to 0, but HCI v1.0 defines the field
only as a device-specific retry count and does not provide the same
exception.  As a result, a v1.0 controller left at the reset value of 0
may perform no retry whereas a v1.1 controller will retry once.
Promoting 0 to 1 at probe time makes the behaviour consistent across
controller versions.  Userspace can still select 0 retries explicitly
via dev_nack_retry_count.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	None


 drivers/i3c/master/mipi-i3c-hci/core.c   | 25 ++++++++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/dat.h    |  2 ++
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 25 ++++++++++++++++++++++++
 3 files changed, 52 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 7a39be64c4e1..57d84d7682d7 100644
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
@@ -733,6 +740,16 @@ static void i3c_hci_recycle_ibi_slot(struct i3c_dev_desc *dev,
 	hci->io->recycle_ibi_slot(hci, dev, slot);
 }
 
+static int i3c_hci_set_dev_nack_retry(struct i3c_master_controller *m, unsigned int cnt)
+{
+	struct i3c_hci *hci = to_i3c_hci(m);
+
+	if (hci->cmd != &mipi_i3c_hci_cmd_v1)
+		return -EOPNOTSUPP;
+
+	return mipi_i3c_hci_dat_v1.set_all_nack_retry(hci, cnt);
+}
+
 static const struct i3c_master_controller_ops i3c_hci_ops = {
 	.bus_init		= i3c_hci_bus_init,
 	.bus_cleanup		= i3c_hci_bus_cleanup,
@@ -752,6 +769,7 @@ static const struct i3c_master_controller_ops i3c_hci_ops = {
 	.recycle_ibi_slot	= i3c_hci_recycle_ibi_slot,
 	.enable_hotjoin		= i3c_hci_enable_hotjoin,
 	.disable_hotjoin	= i3c_hci_disable_hotjoin,
+	.set_dev_nack_retry	= i3c_hci_set_dev_nack_retry,
 };
 
 static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
@@ -1186,6 +1204,13 @@ static int i3c_hci_probe(struct platform_device *pdev)
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
index 6881f19da77f..a07086bf717a 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat.h
+++ b/drivers/i3c/master/mipi-i3c-hci/dat.h
@@ -25,6 +25,8 @@ struct hci_dat_ops {
 	void (*clear_flags)(struct i3c_hci *hci, unsigned int dat_idx, u32 w0, u32 w1);
 	int (*get_index)(struct i3c_hci *hci, u8 address);
 	void (*restore)(struct i3c_hci *hci);
+	void (*set_nack_retry)(struct i3c_hci *hci, unsigned int dat_idx, unsigned int cnt);
+	int (*set_all_nack_retry)(struct i3c_hci *hci, unsigned int cnt);
 };
 
 extern const struct hci_dat_ops mipi_i3c_hci_dat_v1;
diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
index 852966aa20d9..cb9aa43e69fb 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
@@ -189,6 +189,29 @@ static void hci_dat_v1_restore(struct i3c_hci *hci)
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
+static int hci_dat_v1_set_all_nack_retry(struct i3c_hci *hci, unsigned int cnt)
+{
+	unsigned int dat_idx;
+
+	if (cnt > FIELD_MAX(DAT_0_DEV_NACK_RETRY_CNT))
+		return -ERANGE;
+
+	for_each_set_bit(dat_idx, hci->DAT_data, hci->DAT_entries)
+		hci_dat_v1_set_nack_retry(hci, dat_idx, cnt);
+
+	return 0;
+}
+
 const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
 	.init			= hci_dat_v1_init,
 	.alloc_entry		= hci_dat_v1_alloc_entry,
@@ -199,4 +222,6 @@ const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
 	.clear_flags		= hci_dat_v1_clear_flags,
 	.get_index		= hci_dat_v1_get_index,
 	.restore		= hci_dat_v1_restore,
+	.set_nack_retry		= hci_dat_v1_set_nack_retry,
+	.set_all_nack_retry	= hci_dat_v1_set_all_nack_retry,
 };
-- 
2.53.0

