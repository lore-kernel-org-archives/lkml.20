Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5453932C3
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 20:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791404332; cv=none; b=jSf3K7B41DbOgrNIsgmsemv+VkooqxrPNwsUOHp36N6J6epoHUe3VlTFl9b3zKbogOsMi8jWDSWeRc1klypZHYfEllvdEZYl8pZvtcZ19Zgc28exxsHT0hAa6dtTfbs8znZ7Ou8grst1MbT+RxFQdatuCIIn3CWCukwbNB2w+u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791404332; c=relaxed/simple;
	bh=R7LYNEWakBuYD5wgZUiBJuZP0Tju3H1BcHH7vlvK3Zo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BwpXpfkitFelgiMshkYWX+VKeUcmdabqZfDY1Z1P85JmFqGIHdnS57AxyrsfJvm4OCL6ufV9kFvUoMm8Vy/lAJggibwSo7bWhxtUCR9bCATZ1v6X0NQYntqa0Dn/dpFGkAQweDfpqpPAKocg9O5/3FqAR+gowogM7xCFr2t5suM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlUJFUP0; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlUJFUP0"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a4d455ace3so2400521a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 13:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791404325; x=1792009125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v1j5x1ZwCbjcbEfxmMIIEOZgUrzU1j76Q60BSCDaTJs=;
        b=RlUJFUP0iTuCE8rHUuVNL8SX+UwL0EOwOcmHF9Y20ayJKnTJ4C3n6OaVzNJmdOTtEg
         5Xt6BKkR76s6NnR7fFf59hAkYxOeyzaMmAB9Qx2siDURq9vKyTHAzOFGFIFRlffnZICG
         qBm6C5/XG03MT5OGS+RxQ+zSnzvmiskMgX3xTEq8ZPKdDpV6rQrfacVuiy4DtoY5+sEv
         FM/TZR6/dc+TQUITkZGVHJ+p6UjCt+i2mAMDfshwVoI947xKh+42Mwyi5ZTrR6Uzr9On
         kLqXPtHyNZy0D8j2eQmHVqgmf6h6jKOKcb0t0HYrPjgRLJ0XTRdhqrjVN5uB1cPj8y7g
         YHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791404325; x=1792009125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v1j5x1ZwCbjcbEfxmMIIEOZgUrzU1j76Q60BSCDaTJs=;
        b=2A7mrW2h21349KPhwQEcdifyIRusF3u3DPE3IYYhDqcpisxWvpkax0GREicMfmsEF3
         /jTmFvU/9DxwghXe408s8jTWBNK2w8U+dnVbBARoTzCBtaGGGcIEfoC/eECadEyHUj2X
         HPEGTKqWlGncryaLGnUW+2EPSWtvslalXXuPwjxYgQXK/AwtG8LNIFLxRdRPyUZue0OL
         ik2Wbt8bBYvDa9twawB+glvvXotQdN3u7CNn5jzqtbPZe9XPzMpwCCM+k/WIcMpSsFQH
         CezNgiVH+Y5bFgHD/9m1MC7rTI6OtujEBu42Lc3rpqir3sQiU5R0U607b8muEpGSLfr4
         qXqA==
X-Forwarded-Encrypted: i=1; AKwUvBy4Obruw3vZcpmSuSIK8vX8tKXP6PSjHGDfnduWmMk/L4LDvdFVs7Znc9kcKiKezmjdGzoZrkxCzl0Y9uY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8o9bqOHs0u+gEnrNQihwU75lQXi2DqH/Z2xVMyZDZ1GonVd/y
	Hq1w5IFgj8ZR31u/GLwcj6kc+CDYjvvCDD/E7fMMi6555yAeKq98K+xc
X-Gm-Gg: AYBFou2jj3sj7OgFUTOA7lqtgPLeGMPozwKjF1tSSys3R2v9rN5AC4GUhag78+mv+bG
	o6L4EO2tp2pTU/PCPd39MhxIA8hHsrnE6TRtKh/V98CWp/k6M7vtD9waxToLFuPtnhT988fEclq
	1QwAwUcBjz50vi3Uc01DbX7vQ5xsGDb+JcNWDXC1S+DMfKVfs37dqmwqVGtwhhfCzr5Xt0BY9xp
	LGOan7B0qy96aBjJXsz9/QVXl9ZYRkYCaAtF5Mua9wnEbawmdKblJ3JbQ/2uYFdC26FS9fmB1F+
	FsRC2FDxQsqZEd5B5erJhk9xhLZRPRcuyvW9inqderdy9q3ZWbVhIlrNasOjl/Ya5ioaAeE0Wed
	0+HIjzZkrht1XwUDXXdw7U6k0Vf1LK6sV5aneNSDLmkJNS3QGBoMbYNHnRMqL1kKVtKK8MHaWql
	3sxeUTykGklWZI29JyYBooI7n1w3FOO/Yon3A7SuCL6DPrTTXSnQbl5YY6WvjzCRNnfZsfuvQY5
	8me2C6zwzUOO8aeJUDERfiyvD4giRYQCB3Tzn4iIfOjAj0FZzbsthj2eFG6Rbjzwh+GAPLeMJf3
	lN4yKPUdPaatgw==
X-Received: by 2002:a17:90a:156:b0:3a8:a1e3:32a1 with SMTP id 98e67ed59e1d1-3a8a1e332e4mr1822461a91.45.1791404324897;
        Wed, 07 Oct 2026 13:18:44 -0700 (PDT)
Received: from 4470NRD-ASU.ssi.samsung.com (c-24-19-224-150.hsd1.wa.comcast.net. [24.19.224.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ab034sm967623a91.4.2026.10.07.13.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 13:18:44 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
To: linux-cxl@vger.kernel.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ira Weiny <iweiny@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Fan Ni <nifan.cxl@gmail.com>,
	Li Ming <ming.li@zohomail.com>,
	Benjamin Cheatham <benjamin.cheatham@amd.com>,
	Gregory Price <gourry@gourry.net>,
	Richard Cheng <icheng@nvidia.com>,
	Anisa Su <anisa.su@samsung.com>
Subject: [PATCH v15 6/8] cxl/mem: Configure dynamic capacity interrupts
Date: Wed,  7 Oct 2026 13:16:39 -0700
Message-ID: <20261007201828.952-7-anisa.su@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007201828.952-1-anisa.su@samsung.com>
References: <20261007201828.952-1-anisa.su@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ira Weiny <iweiny@kernel.org>

Dynamic Capacity Devices (DCD) support extent change notifications
through the event log mechanism. The interrupt mailbox commands were
extended in CXL 3.1 to support these notifications. Firmware can't
configure DCD events to be FW controlled but can retain control of
memory events.

Configure DCD event log interrupts on devices supporting dynamic
capacity. Disable DCD if interrupts are not supported.

The DCD event log is not drained here. cxl_event_drain_mask() reports
only the logs the driver can service, and the DCD bit is added by
the patch introducing DCD event handling. Until then a DCD interrupt
wakes the event thread, which finds no log it owns and returns.

Care is taken to preserve the interrupt policy set by the FW if FW first
has been selected by the BIOS.

Based on an original patch by Navneet Singh.

Signed-off-by: Ira Weiny <iweiny@kernel.org>
Co-developed-by: Anisa Su <anisa.su@samsung.com>
Signed-off-by: Anisa Su <anisa.su@samsung.com>

---
Changes:
1. cxl.h: add CXLDEV_EVENT_STATUS_STANDARD_LOGS for the four logs whose
   ownership follows native_cxl_error, and use it in
   cxl_event_drain_mask() and the cxl_test mock instead of spelling the
   mask out in both places.
   [Dave, Richard, Jonathan]
2. On platforms where BIOS owns the event logs, a failed Get/Set Event
   Interrupt Policy disables DCD instead of failing probe. Before DCD
   this path never reached the mailbox there; now DCD is the only
   reason it does, so its failure costs DCD, not the memdev.
   [Sashiko]
---
 drivers/cxl/cxl.h            |  14 ++--
 drivers/cxl/cxlmem.h         |   2 +
 drivers/cxl/pci.c            | 143 +++++++++++++++++++++++++++++------
 tools/testing/cxl/test/mem.c |   2 +-
 4 files changed, 133 insertions(+), 28 deletions(-)

diff --git a/drivers/cxl/cxl.h b/drivers/cxl/cxl.h
index cab8ce39f465..15356d25369d 100644
--- a/drivers/cxl/cxl.h
+++ b/drivers/cxl/cxl.h
@@ -192,11 +192,15 @@ static inline int ways_to_eiw(unsigned int ways, u8 *eiw)
 #define CXLDEV_EVENT_STATUS_WARN		BIT(1)
 #define CXLDEV_EVENT_STATUS_FAIL		BIT(2)
 #define CXLDEV_EVENT_STATUS_FATAL		BIT(3)
-
-#define CXLDEV_EVENT_STATUS_ALL (CXLDEV_EVENT_STATUS_INFO |	\
-				 CXLDEV_EVENT_STATUS_WARN |	\
-				 CXLDEV_EVENT_STATUS_FAIL |	\
-				 CXLDEV_EVENT_STATUS_FATAL)
+#define CXLDEV_EVENT_STATUS_DCD			BIT(4)
+/*
+ * Logs whose ownership follows native_cxl_error; the DCD log is always
+ * OS owned.
+ */
+#define CXLDEV_EVENT_STATUS_STANDARD_LOGS	(CXLDEV_EVENT_STATUS_INFO | \
+						 CXLDEV_EVENT_STATUS_WARN | \
+						 CXLDEV_EVENT_STATUS_FAIL | \
+						 CXLDEV_EVENT_STATUS_FATAL)
 
 /* CXL rev 3.0 section 8.2.9.2.4; Table 8-52 */
 #define CXLDEV_EVENT_INT_MODE_MASK	GENMASK(1, 0)
diff --git a/drivers/cxl/cxlmem.h b/drivers/cxl/cxlmem.h
index 9fd5af2e41d4..9106affd7c81 100644
--- a/drivers/cxl/cxlmem.h
+++ b/drivers/cxl/cxlmem.h
@@ -240,7 +240,9 @@ struct cxl_event_interrupt_policy {
 	u8 warn_settings;
 	u8 failure_settings;
 	u8 fatal_settings;
+	u8 dcd_settings;
 } __packed;
+#define CXL_EVENT_INT_POLICY_BASE_SIZE 4 /* info, warn, failure, fatal */
 
 /**
  * struct cxl_event_state - Event log driver state
diff --git a/drivers/cxl/pci.c b/drivers/cxl/pci.c
index 7b754af2168d..d2bed92be30d 100644
--- a/drivers/cxl/pci.c
+++ b/drivers/cxl/pci.c
@@ -510,11 +510,22 @@ static bool cxl_alloc_irq_vectors(struct pci_dev *pdev)
 	return true;
 }
 
+/* Event logs the driver drains: standard logs when native_cxl */
+static u32 cxl_event_drain_mask(struct pci_host_bridge *host_bridge)
+{
+	if (host_bridge->native_cxl_error)
+		return CXLDEV_EVENT_STATUS_STANDARD_LOGS;
+	return 0;
+}
+
 static irqreturn_t cxl_event_thread(int irq, void *id)
 {
 	struct cxl_dev_id *dev_id = id;
 	struct cxl_dev_state *cxlds = dev_id->cxlds;
 	struct cxl_memdev_state *mds = to_cxl_memdev_state(cxlds);
+	struct pci_host_bridge *host_bridge =
+		pci_find_host_bridge(to_pci_dev(cxlds->dev)->bus);
+	u32 mask = cxl_event_drain_mask(host_bridge);
 	u32 status;
 
 	do {
@@ -523,8 +534,8 @@ static irqreturn_t cxl_event_thread(int irq, void *id)
 		 * ignore the reserved upper 32 bits
 		 */
 		status = readl(cxlds->regs.status + CXLDEV_DEV_EVENT_STATUS_OFFSET);
-		/* Ignore logs unknown to the driver */
-		status &= CXLDEV_EVENT_STATUS_ALL;
+		/* Ignore logs unknown to the driver or owned by BIOS */
+		status &= mask;
 		if (!status)
 			break;
 		cxl_mem_get_event_records(mds, status);
@@ -551,42 +562,62 @@ static int cxl_event_req_irq(struct cxl_dev_state *cxlds, u8 setting)
 }
 
 static int cxl_event_get_int_policy(struct cxl_memdev_state *mds,
-				    struct cxl_event_interrupt_policy *policy)
+				    struct cxl_event_interrupt_policy *policy,
+				    size_t *policy_size)
 {
 	struct cxl_mailbox *cxl_mbox = &mds->cxlds.cxl_mbox;
 	struct cxl_mbox_cmd mbox_cmd = {
 		.opcode = CXL_MBOX_OP_GET_EVT_INT_POLICY,
 		.payload_out = policy,
 		.size_out = sizeof(*policy),
+		/* CXL 2.0 firmware omits dcd_settings; accept the shorter reply */
+		.min_out = CXL_EVENT_INT_POLICY_BASE_SIZE,
 	};
 	int rc;
 
 	rc = cxl_internal_send_cmd(cxl_mbox, &mbox_cmd);
-	if (rc < 0)
+	if (rc < 0) {
 		dev_err(mds->cxlds.dev,
 			"Failed to get event interrupt policy : %d", rc);
+		return rc;
+	}
 
+	if (policy_size)
+		*policy_size = mbox_cmd.size_out;
 	return rc;
 }
 
 static int cxl_event_config_msgnums(struct cxl_memdev_state *mds,
-				    struct cxl_event_interrupt_policy *policy)
+				    struct cxl_event_interrupt_policy *policy,
+				    bool native_cxl, size_t policy_size)
 {
 	struct cxl_mailbox *cxl_mbox = &mds->cxlds.cxl_mbox;
 	struct cxl_mbox_cmd mbox_cmd;
 	int rc;
 
-	*policy = (struct cxl_event_interrupt_policy) {
-		.info_settings = CXL_INT_MSI_MSIX,
-		.warn_settings = CXL_INT_MSI_MSIX,
-		.failure_settings = CXL_INT_MSI_MSIX,
-		.fatal_settings = CXL_INT_MSI_MSIX,
-	};
+	/* memory event policy is left if FW has control */
+	if (native_cxl) {
+		*policy = (struct cxl_event_interrupt_policy) {
+			.info_settings = CXL_INT_MSI_MSIX,
+			.warn_settings = CXL_INT_MSI_MSIX,
+			.failure_settings = CXL_INT_MSI_MSIX,
+			.fatal_settings = CXL_INT_MSI_MSIX,
+			.dcd_settings = 0,
+		};
+	}
+
+	/*
+	 * A CXL 3.0+ device can carry dcd_settings field without DCD command
+	 * support, so size the request by the device's policy_size and only
+	 * enable the DCD interrupt when DCD commands are supported.
+	 */
+	if (cxl_dcd_supported(mds))
+		policy->dcd_settings = CXL_INT_MSI_MSIX;
 
 	mbox_cmd = (struct cxl_mbox_cmd) {
 		.opcode = CXL_MBOX_OP_SET_EVT_INT_POLICY,
 		.payload_in = policy,
-		.size_in = sizeof(*policy),
+		.size_in = policy_size,
 	};
 
 	rc = cxl_internal_send_cmd(cxl_mbox, &mbox_cmd);
@@ -597,7 +628,7 @@ static int cxl_event_config_msgnums(struct cxl_memdev_state *mds,
 	}
 
 	/* Retrieve final interrupt settings */
-	return cxl_event_get_int_policy(mds, policy);
+	return cxl_event_get_int_policy(mds, policy, NULL);
 }
 
 static int cxl_event_irqsetup(struct cxl_memdev_state *mds,
@@ -633,6 +664,30 @@ static int cxl_event_irqsetup(struct cxl_memdev_state *mds,
 	return 0;
 }
 
+static int cxl_irqsetup(struct cxl_memdev_state *mds,
+			struct cxl_event_interrupt_policy *policy,
+			bool native_cxl)
+{
+	struct cxl_dev_state *cxlds = &mds->cxlds;
+	int rc;
+
+	if (native_cxl) {
+		rc = cxl_event_irqsetup(mds, policy);
+		if (rc)
+			return rc;
+	}
+
+	if (cxl_dcd_supported(mds)) {
+		rc = cxl_event_req_irq(cxlds, policy->dcd_settings);
+		if (rc) {
+			dev_err(cxlds->dev, "Failed to get interrupt for DCD event log\n");
+			cxl_disable_dcd(mds);
+		}
+	}
+
+	return 0;
+}
+
 static bool cxl_event_int_is_fw(u8 setting)
 {
 	u8 mode = FIELD_GET(CXLDEV_EVENT_INT_MODE_MASK, setting);
@@ -651,46 +706,90 @@ static bool cxl_event_fw_owns_mem_logs(struct cxl_event_interrupt_policy *policy
 static int cxl_event_config(struct pci_host_bridge *host_bridge,
 			    struct cxl_memdev_state *mds, bool irq_avail)
 {
-	struct cxl_event_interrupt_policy policy;
+	struct cxl_event_interrupt_policy policy = { 0 };
+	bool native_cxl = host_bridge->native_cxl_error;
+	size_t policy_size;
+	u32 mask;
 	int rc;
 
 	/*
 	 * When BIOS maintains CXL error reporting control, it will process
 	 * event records.  Only one agent can do so.
+	 *
+	 * If BIOS has control of events and DCD is not supported skip event
+	 * configuration.
 	 */
-	if (!host_bridge->native_cxl_error)
+	if (!native_cxl && !cxl_dcd_supported(mds))
 		return 0;
 
 	if (!irq_avail) {
 		dev_info(mds->cxlds.dev, "No interrupt support, disable event processing.\n");
+		if (cxl_dcd_supported(mds)) {
+			dev_info(mds->cxlds.dev, "DCD requires interrupts, disable DCD\n");
+			cxl_disable_dcd(mds);
+		}
 		return 0;
 	}
 
-	rc = cxl_event_get_int_policy(mds, &policy);
+	rc = cxl_event_get_int_policy(mds, &policy, &policy_size);
 	if (rc)
-		return rc;
+		goto err;
+
+	/*
+	 * dcd_settings cannot be sent to a device whose policy is too short
+	 * to hold it, so the device would never accept the setting
+	 * cxl_irqsetup() arms the DCD interrupt with.
+	 */
+	if (cxl_dcd_supported(mds) && policy_size < sizeof(policy)) {
+		dev_warn(mds->cxlds.dev,
+			 "DCD supported but interrupt policy is only %zu bytes\n",
+			 policy_size);
+		cxl_disable_dcd(mds);
+		/* DCD was the only reason to be here */
+		if (!native_cxl)
+			return 0;
+	}
 
-	if (cxl_event_fw_owns_mem_logs(&policy)) {
+	if (native_cxl && cxl_event_fw_owns_mem_logs(&policy)) {
 		dev_err(mds->cxlds.dev,
 			"FW still in control of Event Logs despite _OSC settings\n");
 		return -EBUSY;
 	}
 
-	rc = cxl_event_config_msgnums(mds, &policy);
+	rc = cxl_event_config_msgnums(mds, &policy, native_cxl, policy_size);
 	if (rc)
-		return rc;
+		goto err;
 
 	rc = cxl_mem_alloc_event_buf(mds);
 	if (rc)
 		return rc;
 
-	rc = cxl_event_irqsetup(mds, &policy);
+	rc = cxl_irqsetup(mds, &policy, native_cxl);
 	if (rc)
 		return rc;
 
-	cxl_mem_get_event_records(mds, CXLDEV_EVENT_STATUS_ALL);
+	mask = cxl_event_drain_mask(host_bridge);
+	if (mask)
+		cxl_mem_get_event_records(mds, mask);
+
+	dev_dbg(mds->cxlds.dev, "Event config : %s DCD %s\n",
+		native_cxl ? "OS" : "BIOS",
+		cxl_dcd_supported(mds) ? "supported" : "not supported");
 
 	return 0;
+
+err:
+	/*
+	 * Failed to Get/Set interrupt policy for DCD while BIOS owns the
+	 * other logs. Disable DCD and continue.
+	 */
+	if (!native_cxl) {
+		dev_warn(mds->cxlds.dev,
+			 "Event interrupt policy failed (%d), disabling DCD\n", rc);
+		cxl_disable_dcd(mds);
+		return 0;
+	}
+	return rc;
 }
 
 static int cxl_pci_type3_init_mailbox(struct cxl_dev_state *cxlds)
diff --git a/tools/testing/cxl/test/mem.c b/tools/testing/cxl/test/mem.c
index 7b756000a1a6..c740372bdaaa 100644
--- a/tools/testing/cxl/test/mem.c
+++ b/tools/testing/cxl/test/mem.c
@@ -1818,7 +1818,7 @@ static int cxl_mock_mem_probe(struct platform_device *pdev)
 	if (rc)
 		dev_dbg(dev, "No CXL FWCTL setup\n");
 
-	cxl_mem_get_event_records(mds, CXLDEV_EVENT_STATUS_ALL);
+	cxl_mem_get_event_records(mds, CXLDEV_EVENT_STATUS_STANDARD_LOGS);
 	cxl_mock_test_feat_init(mdata);
 
 	return 0;
-- 
2.43.0

