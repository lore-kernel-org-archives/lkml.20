Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D68E46D2D8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519362; cv=none; b=d0nsUZk8pXMT5bGMZ8aYa1C2xAa9/Y3GQyi8jt4xT2V4gWYM2TG2BT9V011hgW9ZQ3n+DcIEkTyhredrmEaMbvo/e0fR/Rap7H3Q84OioJTRDysjFxKRyNA8BxjXxY7ieRJcrMb7t69AbgzXEBqOaOgjiONn3ztGtrz2InJChCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519362; c=relaxed/simple;
	bh=ZvWjXP9SQ6F7xBOna1ztMKNNzIZ8ubCD+ndNFz1ciyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sV+XDcUChbw02LPGG8s4TVs5bMCnMZ1p1OCGC5X1FtI0HfoP42KrvxG6PAliqufoXDZNUtzr/Xm0mAuIln5DsdQP86vp3qNwT+Bbk6RYQ2Vgt/fgbiMcsirVd3AWrTyQBJfRgo9c1cypR2Bn33KWMNnJgzjdMzUJAIS0FVL+tWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6mnOwDL; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6mnOwDL"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc149372c14so542446a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519361; x=1789124161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f2SDkRiYdFp13zqgvGKD/ii41aRHGwkv/AHP8UEqIJ4=;
        b=l6mnOwDLHEUUoCOtaZE4Hx27bNMfOzshDzUL7MomfThmv24OImsrYttM3pe0iLvKe2
         /vjGMFxDOFZERjMV3yQO4UymXTiknEjc7y/2qGElI8Ih1rcCLGAV4VjbXHfPTz+oRMvM
         mLGxGEoWNHTCUC/zkCpSNUZqdKTlNufoY3HLeMM9Bl+O1Euf4/DgCB0EFoTotmrvWQ3Y
         oNCrgga+jsrPo0DJNVEXCQHcMXWrwEjrQHmSvFOlJpmFkBDRhFfvumUPBe16UGlR6Ol5
         ao734+nuAbU1BIJhw6rxkJfhPzRw0EOba4Ol7IcAAfvk38yonX2runJLI3MaifAKkOug
         K55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519361; x=1789124161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2SDkRiYdFp13zqgvGKD/ii41aRHGwkv/AHP8UEqIJ4=;
        b=HR7LP6sL/6AvuqPNFtLiU3FM8vGyFGNczBTUuqBJOa3QQyk7FlRQzlzURkobe8NPyL
         SZMe8ecbQkXgf4sp5BTvzbMPfeYPVMiWNYhY1CaXO8EGrAitFzJ5HOUGZrTCi+loLitf
         eOrXJvEIqa+mzxTM1n1UKSSs66OTPZZuPuvxtxfRJeesSqCriggQ+9OeLRYjSB5HCWTy
         g8r0bXqntwqJ/FZvY1P2X+twt7RxrEtd7+lAMw2kc8wiXrtslDeTMPBnbmMnRs3C1bTq
         4SCHb+YaAn3UcZaJbvj42HF0tYz25Qe4FdII5EZe/xEV2KwDp2XawAjrXoRtvbKVerzk
         sWNw==
X-Gm-Message-State: AFuF++lj5/AqCE0LPFdEQ1sftI9a8OOZoVq85tWy1xlat8EnIfc8xfrJ
	uS3laVtDT98Wyl37DNwbnIggzk8ZKm/zFpFAdkN95LDsqZMgh9yPWzxJkcuLWg1Jl7Q=
X-Gm-Gg: AYBFou2Yqjo0K5tbNBkucHkt/azDr4+8RPI5zCXvtIi25lzGdXCSAB7/g/RnYbaw6IJ
	LApBZUZp6YiphLQ3I1EyQT3Cn5luuLeOgcQ3Edtnt/qlS5mqk0c4zWDwA3aY69rhXDlpMnIUPWk
	gEvbrvgxvshUHNkTzY8n9nyYFNbbq5uSOH/170IF8M4msSOPgxGGAbSypwLB6RWA4OeNb20i/9E
	+7DkoOzWIZ28C/3BW1bj6pic9dbN6JqxEeFzQnGpo3sdZokFNaKskLdojj171bJ64/itmgbs0g5
	QbSPoS6YUWErP1dDEYRnr4MwgDbThRhvMwMrTr9V2pR7Zw5yDeseOA6aD8/8T6NTeTnHB+o3elZ
	bVOp0Apj8rXB/RMxBEHgtvvlC32S6VPkCKlehV/0Fd5TaWmrYLdwrMNSL/FaYErq3E56l/fPES2
	ieQa+Axld6gUIes6KkII5EP7sA1ZBFuYhzyRKIMmzUb7SwhnzbaDDT1GIVR9Ya5IZilUn+PLhIS
	Hex48iqms+BCk0=
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr8165885a91.16.1788519360466;
        Fri, 04 Sep 2026 03:56:00 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm5155621c88.6.2026.09.04.03.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:00 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc2: fix typos in comments
Date: Fri,  4 Sep 2026 16:25:53 +0530
Message-ID: <20260904105555.37215-1-hemanth.selam@gmail.com>
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
 drivers/usb/dwc2/core.c     | 2 +-
 drivers/usb/dwc2/core.h     | 2 +-
 drivers/usb/dwc2/gadget.c   | 6 +++---
 drivers/usb/dwc2/hcd.c      | 4 ++--
 drivers/usb/dwc2/hcd_ddma.c | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index f375c5185bfe..6a0135e06b00 100644
--- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -173,7 +173,7 @@ static void dwc2_restore_essential_regs(struct dwc2_hsotg *hsotg, int rmode,
 	/* Umnask global Interrupt in GAHBCFG and restore it */
 	dwc2_writel(hsotg, gr->gahbcfg | GAHBCFG_GLBL_INTR_EN, GAHBCFG);
 
-	/* Clear all pending interupts */
+	/* Clear all pending interrupts */
 	dwc2_writel(hsotg, 0xffffffff, GINTSTS);
 
 	/* Unmask restore done interrupt */
diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 767251aa1aa3..015a5fb7842d 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -334,7 +334,7 @@ enum dwc2_ep0_state {
  *                           (default when phy_type is Full Speed)
  * @oc_disable:		Flag to disable overcurrent condition.
  *			0 - Allow overcurrent condition to get detected
- *			1 - Disable overcurrent condtion to get detected
+ *			1 - Disable overcurrent condition to get detected
  * @ts_dline:           Enable Term Select Dline pulsing
  *                       0 - No (default)
  *                       1 - Yes
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 102169b40419..4f493601e728 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -658,7 +658,7 @@ static int dwc2_hsotg_write_fifo(struct dwc2_hsotg *hsotg,
 }
 
 /**
- * get_ep_limit - get the maximum data legnth for this endpoint
+ * get_ep_limit - get the maximum data length for this endpoint
  * @hs_ep: The endpoint
  *
  * Return the maximum data that can be queued in one go on a given endpoint
@@ -5501,7 +5501,7 @@ int dwc2_gadget_exit_hibernation(struct dwc2_hsotg *hsotg,
 	dwc2_hib_restore_common(hsotg, rem_wakeup, 0);
 
 	if (!reset) {
-		/* Clear all pending interupts */
+		/* Clear all pending interrupts */
 		dwc2_writel(hsotg, 0xffffffff, GINTSTS);
 	}
 
@@ -5550,7 +5550,7 @@ int dwc2_gadget_exit_hibernation(struct dwc2_hsotg *hsotg,
 	}
 	/* Wait for interrupts which must be cleared */
 	mdelay(2);
-	/* Clear all pending interupts */
+	/* Clear all pending interrupts */
 	dwc2_writel(hsotg, 0xffffffff, GINTSTS);
 
 	/* Restore global registers */
diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 2414291aa908..32ce38c7096a 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -5656,7 +5656,7 @@ int dwc2_host_exit_hibernation(struct dwc2_hsotg *hsotg, int rem_wakeup,
 	 */
 	mdelay(100);
 
-	/* Clear all pending interupts */
+	/* Clear all pending interrupts */
 	dwc2_writel(hsotg, 0xffffffff, GINTSTS);
 
 	/* De-assert Restore */
@@ -5726,7 +5726,7 @@ int dwc2_host_exit_hibernation(struct dwc2_hsotg *hsotg, int rem_wakeup,
 
 	hprt0 = dwc2_readl(hsotg, HPRT0);
 
-	/* Clear all pending interupts */
+	/* Clear all pending interrupts */
 	dwc2_writel(hsotg, 0xffffffff, GINTSTS);
 
 	/* Restore global registers */
diff --git a/drivers/usb/dwc2/hcd_ddma.c b/drivers/usb/dwc2/hcd_ddma.c
index 994a78ad084b..703cda5a5895 100644
--- a/drivers/usb/dwc2/hcd_ddma.c
+++ b/drivers/usb/dwc2/hcd_ddma.c
@@ -963,7 +963,7 @@ static void dwc2_complete_isoc_xfer_ddma(struct dwc2_hsotg *hsotg,
 		 * whether some of the descriptors (frames) succeeded or not.
 		 * Pass error code to completion routine as well, to update
 		 * urb->status, some of class drivers might use it to stop
-		 * queing transfer requests.
+		 * queuing transfer requests.
 		 */
 		int err = halt_status == DWC2_HC_XFER_AHB_ERR ?
 			  -EIO : -EOVERFLOW;
-- 
2.48.1

