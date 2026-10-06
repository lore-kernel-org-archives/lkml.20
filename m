Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191B6213E89
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791266487; cv=none; b=ZOplTVcXYekOcRtTEIKazSP6kLMZ/Mjs+93bf3bAelXY+PhWQe2+oNkZXTDjBr8FgtA8j3oWdAwhJONglnb3eWdhgOwFBlO/OziM1gZFOAO8gAPNWY97+cYSsdhUTvtFkj09I+H0YSwQVt1/zcl4FTf0hi136eHe7pcE/vNGXSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791266487; c=relaxed/simple;
	bh=RvHpGdLXh3l3gDFS9Bh12ZRnoEPqK9dE74n3Z0pgyIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=syGrFgFVq4oIZAe7m+zsRS7W+W8TxCdKz+CIUfe+yetZr8Op87dShgbwtgBQ4fnE01I+Tiu6Ceq0RKZC8Gc/F4gaATai5W3KQz9fOYmH+wNfN86mQY8E9i3IBb9LaL/M1PjGksR4H4nRfHfC3H0tUcdexZpNVdB4s/4H5jYGrCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=re0CzOBl; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="re0CzOBl"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1161229eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791266485; x=1791871285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a1aNGhjc8NMEuGX9rG4OhM44sYsYRp+iEnz6OxBInUM=;
        b=re0CzOBl7NflejHdWMy4fmz3mf5Otd7M01o7ex5SS5eCW12fQHwsc0+m0Od2qYooLt
         hF69blCF2BBKHm8kpPrn7uNFkRwVf++a7QHIiCN3+Tw/HXg626Ok+lft+mMU/MRT8r24
         7AxCJuWmVp2JIrhAz2FNGlvJa/nJINFeeYsWaSEBGEmCbOR6VlVFOoIUr28fiVKU72nh
         P7FEFzdYS00ZAbmZNto+1u3UHKI8FIZdj/hQ3gM6RIJ2smnvzv63AItSiBzibuA9bHLP
         StIFwUigVlBo9N7vuopu89WweBwlLv9l1uu4MVKxs0xRZj9IdkGX2IhPRhjw2ti1dr3w
         A9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266485; x=1791871285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1aNGhjc8NMEuGX9rG4OhM44sYsYRp+iEnz6OxBInUM=;
        b=pNTMDSXhIZaWwFpCAcDAhhRk6dbdCsFeRz2YQ092F5aBVH8LEmHgFXAQtV1BJ3Wvls
         FVuEa1IR1MhVbXBbf5PuakbK+uzik6wG2gr5pfcFLkaGBZESv/mrLvyVu/EgFMCKaJXH
         LM+fPcyUXCtKyGp1VQWs3/sE8fDr9+JakYRcGwQuWXWFxHGWwrKTws9388IhvI1forCs
         Loy67Yw8SP6KE/Wvognb09q0AKZKh9Aw1xsunWz/J8ujMOJgyD7YeJHWzGmkGbxO8Nti
         PVzO78xGUhTrqYxhxE09s6xroYhgjaz8K2ZHQHd/Qzyfzhr/aDZ12y/Ll2f38tCnsUPq
         hWnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMLveM6dTH9A0NtdbCtvZX8mFG/7wX3Gl5/n4RCFHameJ/+jHEPWowWFZOucn+dE0yXUSJv9OXGG1t5RA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXJUnqzsl8fEVoKrJBk3710K9o2gCazLpCIZ10jpSvVNI+dJKU
	1J0VJnHdZxr0U9Ielg0L9UcDYm3Ael8qYllfyD336C9reVYHhZSbxfah
X-Gm-Gg: AYBFou2zRqnAYRfGv5FingimfPkCmo1uCJGlb1d/g+bxxgSRVx7hYRPmCCtJUWwI0g1
	7Mq1Ekdkd9qDLJ4T7I/rFsII3wflEk2rLCh6mAt6ksQRs/41PRcH1i2H1qsadhyaGGK5MklBjML
	+duzaQFE8Ct6WHZjdGZPwFUyn3AtVNAMgyuUhPgtwEwBYAaARcBs8HMBOHGXOfDGOwDfcoQ4+ew
	AE3NvaTaUkanduRO1I9Pgnhzn45FOEDbz/httDbc/Bz91iPrSh13yAaKnRp4dpWEZ4wl+C8lkEs
	DH7d9KFkYpG/x3Ic+pT2A56IOu81nKuUWhvzysQpPBk6l8agkT4/eLj882tcfWgo7Mvlf0T35In
	gzaeu7pTJ3Q3OPLkLSGab5pvPQ+WxVAf7RUNQBCwECK3UIo3fyqttTAiHIuqNzBxLwvgMyY/iXe
	OAaHbdhm0tTUdX/6cJTwFNsUncskn+d6tR6BPqFt+31S0lqi6jHer+9D8Scw6NoCm+OCSzrKToX
	s13NjGDG/GKLCJ6+qZGRQkkrJVoZZoW1A==
X-Received: by 2002:a05:7301:618a:b0:34b:101f:cda2 with SMTP id 5a478bee46e88-3514e392ee7mr305659eec.27.1791266484674;
        Mon, 05 Oct 2026 23:01:24 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146b5ee6bsm6145840eec.30.2026.10.05.23.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:01:24 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Haverkamp <haver@linux.ibm.com>,
	Bryan Tan <bryan-bt.tan@broadcom.com>,
	Vishnu Dasa <vishnu.dasa@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] misc: fix typos in comments
Date: Tue,  6 Oct 2026 11:31:15 +0530
Message-ID: <20261006060118.41933-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  One further misspelling of
"respectively" in genwqe/card_base.c is fixed as well: it is not in
scripts/spelling.txt, but it sits a few lines from one that checkpatch
does report.  Only comments are touched, there are no code changes.

Assisted-by: LLM
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes (v2):
    v2:
     - Drop the drivers/char/lp.c hunk.  It is not under drivers/misc, which
       is what the "misc:" prefix claimed.  It is now sent separately, as
       "char: lp: fix typo in comment".
     - Also fix a second misspelling in genwqe/card_base.c, a few lines from
       one already being corrected.  checkpatch does not report it because
       it is not listed in scripts/spelling.txt.
    
    v1: https://lore.kernel.org/all/20260904113843.21367-1-hemanth.selam@gmail.com/

 drivers/misc/gehc-achc.c                | 2 +-
 drivers/misc/genwqe/card_base.c         | 8 ++++----
 drivers/misc/genwqe/card_ddcb.c         | 4 ++--
 drivers/misc/genwqe/card_utils.c        | 2 +-
 drivers/misc/vmw_vmci/vmci_datagram.c   | 2 +-
 drivers/misc/vmw_vmci/vmci_queue_pair.c | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

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
index e602eb3c51fa..3eb843af31a5 100644
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
@@ -1210,10 +1210,10 @@ static int genwqe_probe(struct pci_dev *pci_dev,
 }
 
 /**
- * genwqe_remove() - Called when device is removed (hot-plugable)
+ * genwqe_remove() - Called when device is removed (hot-pluggable)
  * @pci_dev:	PCI device information struct
  *
- * Or when driver is unloaded respecitively when unbind is done.
+ * Or when driver is unloaded respectively when unbind is done.
  */
 static void genwqe_remove(struct pci_dev *pci_dev)
 {
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
2.47.3

