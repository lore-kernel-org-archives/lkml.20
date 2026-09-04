Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A924E472F6A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521932; cv=none; b=qtS/ItEuIrYoASBprTJA9oITa6Q0AcR+C86PYdM4EXiXSED+d/vXGuRQvHNlgLtuKFGTGGPVgLSHKnDPWZSJlzNS70J+wFsv9FmSrTSIrWp9Tgv7DboTJIXHLv0akiGiOCXniFGBmSBEijNeq7BgZKgBuZpiijBa8ZN5BEOHn6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521932; c=relaxed/simple;
	bh=2i2Xb8uVLvqRW1pz7h4o9josiq0uLULk+sapGI+s3A0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I5Uh4uRLX9cKZn7CbTuje7HyDVqR1fooDyEpLoqZtNJOCVlYow7KQGXm17/puwtOVr5tBDxoVJ3X4bHTO9StORoIFsIQpf1sfDMkCe/BNckUWp2HHsa0QFQ8OY154een4IoEEr2DmR716EE0MckQjOMFuvxsl51tyMa7xz77hM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3CWuJiK; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3CWuJiK"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-855d2bfae95so2449147b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521930; x=1789126730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NbJnvaFrEWBOaiHZ7Qvxbvf9YF4N/gpby3k4LTlunUQ=;
        b=o3CWuJiKpa8mEDJTGyIRHlaaSq5xrYaObV0Qu9/Df79wHlWhLR1Tz7rNBC6xqVQ0X9
         DzUurYuFZ1FV8GuGY/4HT8IVDE5CZbnGmCgm36H7klDRCx7OA0HwgMDMxWhYnZ4eTubh
         sQyr2+fk5/pO1tM5JY5CUhQ0DBV3TCrd5lWItY7mQJSpsoB59ShRRokAQB4CtO5XZYgW
         05KUnJBOqCrDU/FTdCsDu9T4rfdd8qb3DrWItC5a8EhBh/e0T7Y1vfT12ZuvQ5jiPBjp
         J2NaBilROvES3naFgKDmqtfR/M+pRSFIw9oxSCUGwDLVIzWNk8xCsYEtRSVMRuGK42Cr
         VdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521930; x=1789126730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbJnvaFrEWBOaiHZ7Qvxbvf9YF4N/gpby3k4LTlunUQ=;
        b=QA8MO4X5799xZfwlkN56oerGStMmmX7Pq34pjwn62uFqarTj/UN8NthnWCXpGQ8ehF
         bK2nY2h1ezuMqkFy3yBNQIDQpCe63Y/E7yG1zbDXUtcCL6WA2ZDKwo+jqoiS0qYl7Sbp
         trwVVT0bHadj9qycROKXMSwDGtlO+KncrVxZoQwWP/GY332JUUZYMr6l88GT58VNBEd5
         rPUgviCpLKlune3U4x2VPfGT3lN9t5V3NVFEjrCZNO94OAV3nrx9tgXlOwDbyhFTZnFc
         sZHNSIno606t8PMpo8QLGpqRCr+vhiHXpWIAnp09OnOKymzb5qo2Wn6/tJgifBY5fGwT
         CNjA==
X-Gm-Message-State: AFuF++nMo7uquUEpad+dEoNoN4Gz2b3zgHV3nzBBdptKX0T6Vsc6JX/n
	5AOtY3OiACZ+eOEfQB+5sRsJJndL07G7c1i8V3erq+iZEtJLE+dTGzlv
X-Gm-Gg: AYBFou0lmcPhFWtFL4xDm4m+chJ2lqdbyYVUpWVG5i8mq4Nyr2b+VjzeWAa5IPk28ip
	hRPX9WjzReGZIfE/0DE1he+80f4OivOnPAz1fYJOBhSSjNM3J0jxr5geHtkgnzGqApuuP+1JvWh
	+Cdrye/jgrws7F3WNb1yemEjUDBu+F9Yvc3h7AdhcjaBsARnhv+pmlA0/i8nOeiTbqNcJckBNPQ
	ARw75AEob3uOr1TsFFnf/TcIz7faoQEBBRTWzmHjo9jGqouVn5xef+aXlUEhuVoXpQRkBHpNUmH
	5u50IGxhb4Cwku1bqJbu/7UwiImGiywSHyQ8la1u1EEPaFMZ8J8f2WvPJR/iRy7glfqQpQJJRLt
	ZBetP1pVN3xi8tD1Qxhpl1LIxXxW151QEGev3J+27yVJkEXaWbAProSTQ1rUsYCTQYs9p+LENSZ
	g0c4FaEOxHBbNeA+GVK85Scl7/3vpxI9+Jfo+4xGJFjN1nX2T+I3IQZTYu35sChMK9Ina7bjfSC
	ScLhkPCds0G1e8=
X-Received: by 2002:a17:90b:280a:b0:398:cb8f:c308 with SMTP id 98e67ed59e1d1-39b076add5fmr14777101a91.0.1788521929594;
        Fri, 04 Sep 2026 04:38:49 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm6379588eec.19.2026.09.04.04.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:38:49 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Haverkamp <haver@linux.ibm.com>,
	Bryan Tan <bryan-bt.tan@broadcom.com>,
	Vishnu Dasa <vishnu.dasa@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] misc: fix typos in comments
Date: Fri,  4 Sep 2026 17:08:40 +0530
Message-ID: <20260904113843.21367-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/char/lp.c                       | 2 +-
 drivers/misc/gehc-achc.c                | 2 +-
 drivers/misc/genwqe/card_base.c         | 6 +++---
 drivers/misc/genwqe/card_ddcb.c         | 4 ++--
 drivers/misc/genwqe/card_utils.c        | 2 +-
 drivers/misc/vmw_vmci/vmci_datagram.c   | 2 +-
 drivers/misc/vmw_vmci/vmci_queue_pair.c | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/char/lp.c b/drivers/char/lp.c
index 24417a00dfe9..6e99e7c7a9b7 100644
--- a/drivers/char/lp.c
+++ b/drivers/char/lp.c
@@ -30,7 +30,7 @@
  * CAREFUL will block a bit after in lp_check_status().
  *				Andrea Arcangeli, 15 Oct 1998
  * Obsoleted and removed all the lowlevel stuff implemented in the last
- * month to use the IEEE1284 functions (that handle the _new_ compatibilty
+ * month to use the IEEE1284 functions (that handle the _new_ compatibility
  * mode fine).
  */
 
diff --git a/drivers/misc/gehc-achc.c b/drivers/misc/gehc-achc.c
index 9792189c0923..2c1222edb5dc 100644
--- a/drivers/misc/gehc-achc.c
+++ b/drivers/misc/gehc-achc.c
@@ -369,7 +369,7 @@ static int ezport_firmware_flash_data(struct spi_device *spi,
 	dev_dbg(&spi->dev, "EzPort verify flashed data...\n");
 	ret = ezport_firmware_compare_data(spi, data, size);
 
-	/* allow missing FW verfication in secure mode */
+	/* allow missing FW verification in secure mode */
 	if (ret == -EACCES)
 		ret = 0;
 
diff --git a/drivers/misc/genwqe/card_base.c b/drivers/misc/genwqe/card_base.c
index e602eb3c51fa..aed6d57b955d 100644
--- a/drivers/misc/genwqe/card_base.c
+++ b/drivers/misc/genwqe/card_base.c
@@ -286,7 +286,7 @@ int genwqe_flash_readback_fails(struct genwqe_dev *cd)
  * @cd: GenWQE device information
  *
  * Note: From a design perspective it turned out to be a bad idea to
- * use codes here to specifiy the frequency/speed values. An old
+ * use codes here to specify the frequency/speed values. An old
  * driver cannot understand new codes and is therefore always a
  * problem. Better is to measure out the value or put the
  * speed/frequency directly into a register which is always a valid
@@ -904,7 +904,7 @@ static int genwqe_reload_bistream(struct genwqe_dev *cd)
  *
  * Condition for the health-thread to trigger:
  *   a) when a kthread_stop() request comes in or
- *   b) a critical GFIR occured
+ *   b) a critical GFIR occurred
  *
  * Informational GFIRs are checked and potentially printed in
  * GENWQE_HEALTH_CHECK_INTERVAL seconds.
@@ -1210,7 +1210,7 @@ static int genwqe_probe(struct pci_dev *pci_dev,
 }
 
 /**
- * genwqe_remove() - Called when device is removed (hot-plugable)
+ * genwqe_remove() - Called when device is removed (hot-pluggable)
  * @pci_dev:	PCI device information struct
  *
  * Or when driver is unloaded respecitively when unbind is done.
diff --git a/drivers/misc/genwqe/card_ddcb.c b/drivers/misc/genwqe/card_ddcb.c
index 969178573940..07e2c1be22d9 100644
--- a/drivers/misc/genwqe/card_ddcb.c
+++ b/drivers/misc/genwqe/card_ddcb.c
@@ -460,7 +460,7 @@ static int genwqe_check_ddcb_queue(struct genwqe_dev *cd,
 /**
  * __genwqe_wait_ddcb(): Waits until DDCB is completed
  * @cd:         pointer to genwqe device descriptor
- * @req:        pointer to requsted DDCB parameters
+ * @req:        pointer to requested DDCB parameters
  *
  * The Service Layer will update the RETC in DDCB when processing is
  * pending or done.
@@ -543,7 +543,7 @@ int __genwqe_wait_ddcb(struct genwqe_dev *cd, struct ddcb_requ *req)
 		return -EINVAL;
 	}
 
-	/* Severe error occured. Driver is forced to stop operation */
+	/* Severe error occurred. Driver is forced to stop operation */
 	if (cd->card_state != GENWQE_CARD_USED) {
 		dev_err(&pci_dev->dev,
 			"[%s] err: DDCB#%d forced to stop (rc=%d)\n",
diff --git a/drivers/misc/genwqe/card_utils.c b/drivers/misc/genwqe/card_utils.c
index e3b5fb337182..7c57cb881d7f 100644
--- a/drivers/misc/genwqe/card_utils.c
+++ b/drivers/misc/genwqe/card_utils.c
@@ -1003,7 +1003,7 @@ u64 genwqe_read_vreg(struct genwqe_dev *cd, u32 reg, int func)
  * @cd:	        genwqe device descriptor
  *
  * Note: From a design perspective it turned out to be a bad idea to
- * use codes here to specifiy the frequency/speed values. An old
+ * use codes here to specify the frequency/speed values. An old
  * driver cannot understand new codes and is therefore always a
  * problem. Better is to measure out the value or put the
  * speed/frequency directly into a register which is always a valid
diff --git a/drivers/misc/vmw_vmci/vmci_datagram.c b/drivers/misc/vmw_vmci/vmci_datagram.c
index 6193a22c3ab5..73b43b097f92 100644
--- a/drivers/misc/vmw_vmci/vmci_datagram.c
+++ b/drivers/misc/vmw_vmci/vmci_datagram.c
@@ -434,7 +434,7 @@ EXPORT_SYMBOL_GPL(vmci_datagram_create_handle_priv);
  * @out_handle: vmci_handle that is populated as a result of this function.
  *
  * Creates a host context datagram endpoint and returns a handle to
- * it.  Same as vmci_datagram_create_handle_priv without the priviledge
+ * it.  Same as vmci_datagram_create_handle_priv without the privilege
  * flags argument.
  */
 int vmci_datagram_create_handle(u32 resource_id,
diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_vmci/vmci_queue_pair.c
index 46bba9bef553..e1a11820be01 100644
--- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
+++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
@@ -2668,7 +2668,7 @@ static ssize_t qp_dequeue_locked(struct vmci_queue *produce_q,
  * @consume_qsize:      Desired size of the consumer queue.
  * @peer:       ContextID of the peer.
  * @flags:      VMCI flags.
- * @priv_flags: VMCI priviledge flags.
+ * @priv_flags: VMCI privilege flags.
  *
  * This is the client interface for allocating the memory for a
  * vmci_qp structure and then attaching to the underlying
-- 
2.48.1

