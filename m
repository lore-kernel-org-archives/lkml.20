Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793406868;
	b=lqoN2Njq9y3PmPe0Tq/GJvZ3emVsth9nCCZIH063MfrI/VXv+1Wa9bMgjtDGcRQQx2TM
	 PROAGaLB9zWxJbbpv7zT7zWHtrJofs1caWUm83TX9stUrJxlJGH4XRagNVNX4UReLdhTi
	 3X+FN0wpNpsU0Sc8PA1twzqbKlkmb6eSLWyLFCuFFlUMQFlRSLaimy5FYvlghVi3b6Ert
	 pRyAZYwZeKcuVLg3UaU0oPu3s1fr7+qdzC7bH67iDXAJuXnkFE2th4ql7oSx9yo59ARU9
	 oIF9p8K9rDQ5hUEIuuDoTMwyKmcsk2skAQDznSX3sfMTKRs/HPK1XXi4Hmv2NwOLQoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793406868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lAQsub6pmHls3bP0tt9PGyqlBwOUYsP9EC/vfE7Hwr8=;
	b=sTi75bwl4I63fr+NljwlT2OLu/sRCEPi7op/3jmpF2BxJRZyuo5QQHrEqodOm4Nf70vP
	 GAhvhNo3+Hgwi6mRj/nffVNYgyRbMfm7cx+fwleVRHu2rIkJGCsPM5m/cjPINyo3QiH0Y
	 J9LmEwwIwxW0wp4ivr3oMfy9XXH0b1dznYPqac/4c6Y73nbMBRRk7yaCG+dPSNgaC6Fxl
	 5DT04PG5qntjgu6mi+0JpGAGMEC/FBLQwgYd0/2Vyw6eBFm+DTSZFbAxNpLlRe5i4BUAB
	 ivZaAt/U96DAkwbm3x7RJ1RVJqMP6GEi+JyYION903lFndVqFY0ad7gRSnTuRKz0eSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="YycHXE/k";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88569606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88569606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YycHXE/k
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1931ff67a29so521902c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793406868; x=1794011668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lAQsub6pmHls3bP0tt9PGyqlBwOUYsP9EC/vfE7Hwr8=;
        b=YycHXE/kQCeONe5u5VShHK5xy0VoYQSfDziX/pTbHa5PCDO71PBexSxxok9WdIuWbC
         Z1SUTlz5OxMIGRP5QzMkCspCLshQfsx5Otk46wluTefz5AXSi1J7GaAKfOdswBERl7I8
         Nb6dUc6cuiwTJfF2Xgz+sKZEUFqDgfus/xGvgWrp95gRe9JLVpRFkDxkup9GUyW7HBBN
         IoohchD3pXqteRT9FIty4btbFJ3nrqFRK31vfBDOKVrvTUjHy5+Jp9DcQ46J9ADYTTJv
         2Eyq17sbd3jlneJRjyrE9UY8hT99UP/LS7yle1E6wbV4zBVqLySU3utj/T5lD7qssP12
         QzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793406868; x=1794011668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lAQsub6pmHls3bP0tt9PGyqlBwOUYsP9EC/vfE7Hwr8=;
        b=ElDcebaceL5og+gAMcQM4ujiSMtpJ3phFe6lEp0zaEZdowQm1D2eCNU/1r7NOvYMq1
         98dHPhgDfE0YF0wqfkcgcsk/UE1dy55a1K2eTMujBAXunafL8eixqpsnNQ8+cz09f36Q
         y4EAZxxjwaZxRYS/ehYd7kRKYYRbhyUU69414B8CmQqTmwDNwLarIH22tgXTPV9gIiwZ
         w+NBfzFIhiURkqJ6rXExAwYgiFr3xsofY55kzSdbEBEFzotF6HszJSJzziEn6D+EzSi4
         8WnE71RXemMRr6SaSqLgBEIfnZCHo4f2xGrbj4CXgJa703V7UP0oxw2NnW7lHzjTB1kk
         8uBg==
X-Forwarded-Encrypted: i=1; AKwUvBz2eH4N7s+8CTmMM5PQwq5bkeHz3DGoqyoBM+H9lrdqJOyWVO8Euwb3hIPhfUPSk/5/Kz48NdPD5RCNid0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPJxrMKfj7mkil/05chQhURJlCiZxCMNuvvdqx/x4wNh6Gj1oG
	MXUfa7b6ClrlqIeaPadE+cKvFXnC1TM2EmHGj6PhNIHpY5Mude9MxzpI
X-Gm-Gg: AYBFou3J+Rua1SlM8YgyXz2NURpg7DuqTZSgDh+2dhiRhudfeAXBU31I0k1ZM5ng8Sx
	IHjW2BXybwkOcuDRVRCHLxXfYdeaXDHK0JFiPGllJ0Q8aJhCgGAF9LkR/NNIfVEeDVOBY9oseeX
	kjDZ7DXpErjZkiRv74Oa/KRp5ASi0bbpTXAppXNEC56M+OkoZcVSCi1c3O7RlKHAEvTL69p5bbZ
	uaZmV9fdjjXFQ7bR945c/+gwvUzLYeS7o9mLsMPOoqeNr84EvfmZ4vWjaoqKyvZ2JQ4Dkq6ZUuo
	nNgWBJsYdjtXNkq+r5mzFZd3spzm7Vgu/DyUtPyFE4VbYtJMsmUL9cLD0Tla1rdvpqsvFGumgfl
	B1RThzcBvG2gHFn1Pv2m//MeQZvxN6tR1wllkrb6ZkdG1SZPYbZ+XXWW6Ed7dGKlMfFxjDaue4A
	Ud5S1DiYSVNsfK2FImT5EBHb4ylyMvGqldwaoRVx9Hr/6TG5grSMZ5y8mnQFjRh8/HUU9YMsEko
	cS3sOGEvJdUhCZHgDhmxHaDuJBezM93OVExzlmH07/+pqnAWcdAI2tiuCv07kJVKTRYYdultU67
	/WQTF1e3iCx8oUU75VxRzYtIx2QSn34Z58rlBFgBDgGhUfaYi1Y61aZxxRcnF8Swzqr3xgIfU2w
	5b5PbYW3jSoHB8j8esP3DPUf+GfNScbnZhiadGv0BoM/x1DaUIbLUgz4E9Tq2ejE1BAs1fnFzsb
	4omT9s2K4vc3G5EA==
X-Received: by 2002:a05:693c:639b:20b0:369:f2f4:b227 with SMTP id 5a478bee46e88-36a4238e9e4mr5713485eec.18.1793406867364;
        Fri, 30 Oct 2026 17:34:27 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm11707816eec.3.2026.10.30.17.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:34:26 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: pxafb: initialize IRQ completions before requesting IRQ
Date: Sat, 31 Oct 2026 08:34:24 +0800
Message-ID: <20261031003424.1796478-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pxafb_handle_irq() may run before smart-panel and overlay setup.
Completion objects are uninitialized, and completing them can panic.

Move completion setup into a helper called from pxafb_init_fbinfo()
before devm_request_irq(). Drop the later initialization now that every
completion is initialized before the handler can run.

An early interrupt can also leave a completion count without a waiter.
Reset command_done and branch_done immediately before starting their
hardware transactions, so stale counts cannot make later waits succeed
early.

Tested an early interrupt through the real handler on ARM QEMU: the
unpatched path panics in complete(), while the patched path completes
normally with early=0. A stale-credit replay incorrectly returned
flush_ret=0 before this change and now returns -ETIMEDOUT twice.
Normal smart-panel init/flush/timeout/work controls also pass. Main,
no-smart and genuine-overlay ARM builds pass; strict checkpatch passes.
---
 drivers/video/fbdev/pxafb.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index 1b2a16590999..84ef5baaf087 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -642,6 +642,7 @@ static void overlay1fb_disable(struct pxafb_layer *ofb)
 
 	lcd_writel(ofb->fbi, LCSR1, LCSR1_BS(1));
 	lcd_writel(ofb->fbi, LCCR5, lccr5 & ~LCSR1_BS(1));
+	reinit_completion(&ofb->branch_done);
 	lcd_writel(ofb->fbi, FBR1, ofb->fbi->fdadr[DMA_OV1] | 0x3);
 
 	if (wait_for_completion_timeout(&ofb->branch_done, 1 * HZ) == 0)
@@ -705,6 +706,7 @@ static void overlay2fb_disable(struct pxafb_layer *ofb)
 
 	lcd_writel(ofb->fbi, LCSR1, LCSR1_BS(2));
 	lcd_writel(ofb->fbi, LCCR5, lccr5 & ~LCSR1_BS(2));
+	reinit_completion(&ofb->branch_done);
 	lcd_writel(ofb->fbi, FBR2, ofb->fbi->fdadr[DMA_OV2_Y]  | 0x3);
 	lcd_writel(ofb->fbi, FBR3, ofb->fbi->fdadr[DMA_OV2_Cb] | 0x3);
 	lcd_writel(ofb->fbi, FBR4, ofb->fbi->fdadr[DMA_OV2_Cr] | 0x3);
@@ -894,7 +896,6 @@ static void init_pxafb_overlay(struct pxafb_info *fbi, struct pxafb_layer *ofb,
 	ofb->ops = &ofb_ops[id];
 	ofb->usage = 0;
 	ofb->fbi = fbi;
-	init_completion(&ofb->branch_done);
 }
 
 static inline int pxafb_overlay_supported(void)
@@ -1170,6 +1171,7 @@ int pxafb_smart_flush(struct fb_info *info)
 	lcd_writel(fbi, FDADR6, fbi->fdadr[6]);
 
 	/* begin sending */
+	reinit_completion(&fbi->command_done);
 	lcd_writel(fbi, LCCR0, fbi->reg_lccr0 | LCCR0_ENB);
 
 	if (wait_for_completion_timeout(&fbi->command_done, HZ/2) == 0) {
@@ -1277,9 +1279,6 @@ static int pxafb_smart_init(struct pxafb_info *fbi)
 	fbi->smart_cmds = (uint16_t *) fbi->dma_buff->cmd_buff;
 	fbi->n_smart_cmds = 0;
 
-	init_completion(&fbi->command_done);
-	init_completion(&fbi->refresh_done);
-
 	if (!fbi->inf->smart_update)
 		return -EINVAL;
 
@@ -1775,6 +1774,23 @@ static void pxafb_decode_mach_info(struct pxafb_info *fbi,
 		fbi->video_mem_size = video_mem_size;
 }
 
+static void pxafb_init_completions(struct pxafb_info *fbi)
+{
+#ifdef CONFIG_FB_PXA_OVERLAY
+	int i;
+#endif
+
+	init_completion(&fbi->disable_done);
+#ifdef CONFIG_FB_PXA_SMARTPANEL
+	init_completion(&fbi->command_done);
+	init_completion(&fbi->refresh_done);
+#endif
+#ifdef CONFIG_FB_PXA_OVERLAY
+	for (i = 0; i < 2; i++)
+		init_completion(&fbi->overlay[i].branch_done);
+#endif
+}
+
 static struct pxafb_info *pxafb_init_fbinfo(struct device *dev,
 					    struct pxafb_mach_info *inf)
 {
@@ -1831,7 +1847,7 @@ static struct pxafb_info *pxafb_init_fbinfo(struct device *dev,
 	init_waitqueue_head(&fbi->ctrlr_wait);
 	INIT_WORK(&fbi->task, pxafb_task);
 	mutex_init(&fbi->ctrlr_lock);
-	init_completion(&fbi->disable_done);
+	pxafb_init_completions(fbi);
 
 	return fbi;
 }
-- 
2.56.0

