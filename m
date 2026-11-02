Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606623;
	b=VtYJoKK563n3/891QjdrWNcnDd1Kmc8trB8qpIRs8sJKARrJqflmNcELULf2A8SfG51o
	 Jou3+uH0DEs0pMVnlAD1UUeeTq7cXPabVujmkmI3iv+KvCcjlyD7A6ivnLgFDcPq3w+qJ
	 MGPKEQNeHq+gmQb7dV/JENnSUH+M8pojXuLNSMTEd56auSJP+W9Z19unSF7RmxAJT7yqu
	 2rnUjXTMKVL2Il6jSEjotFdaMSUXFKMme+skDCB+SH3NsWhWctuRnJQUp9+NNsyYD/drZ
	 ijHINKHdF2iCnQrBC4b4/2UZmXbOLSJ/MDAbVwcQGJsDyz4ssbnX4lpu+iwVCF0sskQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DJARq++ZNqDTm8Q9TFtOCOzhzKAsHsjDftUFwH6EBSw=;
	b=WOrOYuv53R0UXwVRwp0pT5Wd9EKBy0epqchFW/e9sPnMdTbQqUAlF6fbuKFna2lS5Znc
	 IIdpuMLQEJBwOm87IEyCBVSXJ+7Wxv59uVoQmZlvf4fGwvp9yeU6xZCYa97UEGoExqMjs
	 i0cU2PTu4PrD2Q5TJSqFe3phepA1Lor1HlgznOeiJm80RXzESGqP3+IEHemyIrA12/60g
	 lGyYazZaPuDiXlYOHAHPVDIFUG3NMZ4Cb/izt3NNTQM+yE9BNeenTWZk0dBkiyRAhSZX1
	 V0QWY1AIzA8kNMWtIebtbCcNVGIdNhBtcQc9jmkzo/z0q/2cxpDerZnPbWm1ndOW+aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aXv/Q9bp";
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBBA606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EBBA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXv/Q9bp
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e96502e447so24892865ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793606623; x=1794211423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJARq++ZNqDTm8Q9TFtOCOzhzKAsHsjDftUFwH6EBSw=;
        b=aXv/Q9bpUcq/w2O/zoFJcHzpTc/FOH8vrMSRHhooMnGMDELvKmIYQukvOUgu19v/4T
         +LqNmdMP0KXTWCjM7ORGfb6Nw2QOR9gGbBkhDrTQt8A4RJciHpkwMl4R6waNDlgJ2ZUX
         POsa1AFRE3RqTCbfaqF1x6S+yF8pT2Lsi2S1LIfS8JHAmPTrOmO7vS5wqNxX9wBmw8mW
         p28+DMxaCdniXdHHuxh51SJ8M+IC9ze4YzyEPDlighPJJrqn2o2f5Sv/lXdJEIa+YjHx
         rfiuoTjFm7NkqTeHQ+K1joc98ij80ivEKRacwBFkk24Cg/UsnQxDFhzoWZNOBHAbebGD
         bl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606623; x=1794211423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJARq++ZNqDTm8Q9TFtOCOzhzKAsHsjDftUFwH6EBSw=;
        b=W3wqt6VH2yXsNxVKv0Y6DhIt5qC+rHwTJ7zksEPMCj7ruwinE8vMYiQ40/vLemnjXm
         CgnzjJQYQd6h3tO8iXjUAKbrlTBcIVTUxDWxUYSJapsseZqgsCQeEo4tqLYyOyDy7L+D
         ZwBC/SZUQfRKmzzmDSi37LcLB6hhIR9M34vEub0O4n1yBSXW8snFClDdxhgUMBrTSxEd
         82B8LDOV1XzLwyViZRE9qjnO6PJUVDtX3wzh2Kuh83ePLgqCRMiGBnJLJNeF7GSMwp3N
         ohF1liS2mOWrz7380cBY0yqxW5mQxyefo777UatKV70VFlPxZq0S6v5e4M+MFpxoppJs
         p45w==
X-Forwarded-Encrypted: i=1; AKwUvBysDGV0dHkdDWkE7ZEh2znGTGeWe/DID/HTSQYa1vj+6sCFFm6fzzvtAtFVMlyHPL74BmYf3+ZQ6I5ZzCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ztVDUe1XFo4pvAOA8W9VC1ZVUgrYTtkFMwD5D+1Ih2yj+XlBH
	tYWHDHGVPBWoNsn3YxCxapjrRTSLCM0PVRwxGH33JsFKhte/a8gycE4s
X-Gm-Gg: AYBFou3KxL7ugK+AG8+QpnDGYb7hbg7LfMs+Go09h4bwTW+WsNmOIX/svGqBwn/E+95
	WvfqLwCxp4D+JtxOhzWnJ8dN5Wa8H4IUlCxsZ0nnkg4n+yk4rrbDX3s8FtYk/AG1CfofueKo2Fr
	5eIcPfXC7ufQKa9nHMBFbxOwiUHNFndojAwxa/POMgxpFhIZdQ7dupOTg5Mq8aG2uItd+fjDyrN
	4irEyQor2v5592CuaP2xT3A9dGGJbZk5l+GkaXvgwteKcFEkVAmECye6DFWOrmCfFH5wSq/4D4Y
	7rBlWwOQ95Guvlvqj82ZwFVSlBHjNIMhLtGc0g+sp7GZwmKQTHQYWN22/AVERRbIDUP6dLMeY16
	u6CicMpYrHBeJnqvRzybjvGN0UV+fnjgFqQitLe6eMIv1FB/6rnTHylkCrVoz1Bt4f8YzL4NBTH
	VXz+vefu0+6d34JvGnRBS88Uz5NJh3YntPPj/NZL4gWBn8aM4YOdDQZxGkXIq2iJ49L+Pi3lX6z
	cAKefzmgGxmg2FnNsKdnLouP8VNrtQPpYbukborWfToweayGmw74GJLwTmBhHhxBAcrlSOe6PMF
	iN8n+OVxnWCkGoeUTtYXvwdu5KmDxzoIqLS26VsiXWeo+Yul38pxy64ZXjt/sdxCWFawYnANRgl
	z9+0M7XqjT+dQS1i1jDYwrcbOIeHw65ibuIsMYCZLLhzcj4H1Z00AOtddHNNXW13y7oREwPkRiI
	WTDOqtiNITBKH2Jm5Y2eKmXdjkva2hFbinlaQ=
X-Received: by 2002:a17:903:1b2c:b0:2ea:a2ea:5f62 with SMTP id d9443c01a7336-2eb364b8c96mr87259915ad.24.1793606622268;
        Mon, 02 Nov 2026 00:03:42 -0800 (PST)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392afa5asm23573655ad.72.2026.11.02.00.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:03:41 -0800 (PST)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] fbdev: pxafb: initialize IRQ completions before requesting IRQ
Date: Mon,  2 Nov 2026 16:03:32 +0800
Message-ID: <20261102080332.1466689-4-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102080332.1466689-1-matthias.goergens@gmail.com>
References: <20261102080332.1466689-1-matthias.goergens@gmail.com>
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

pxafb_handle_irq() completes command_done when LCSR has LCSR_CMD_INT
set, and an overlay's branch_done when LCSR1 has its branch status bit
set.  Probe requests the IRQ before it initialises either: command_done
in pxafb_smart_init(), where commit 07df1c4fea14 ("[ARM] pxafb: small
cleanup of the smart panel code") moved it, and branch_done in the
overlay setup, since the overlays were added.  If one of those status
bits is already set when the handler is installed, for example because
the bootloader left a smart panel or an overlay running, complete()
runs on an uninitialised completion.

Initialise all completions in a helper called from pxafb_init_fbinfo(),
before the IRQ is requested, and drop the later initialisation.

With the completions initialised early, such an interrupt instead
leaves a completion count with no waiter, which would let a later wait
return before its transaction has finished.  So reinitialise
command_done and branch_done just before starting the transactions they
wait for.

I have no PXA hardware.  In a test build on ARM QEMU that raises the
LCD interrupt early through the real handler, the unpatched driver
crashes in complete() and the patched one does not.  After an early
command interrupt, a later smart-panel flush returned success at once
without the reinitialisation, and timed out with it, as it should when
no further interrupt arrives.

Sashiko, the AI review bot, pointed out the early interrupt while
reviewing a pxafb cleanup.

Link: https://lore.kernel.org/all/20260722081427.413EF1F000E9@smtp.kernel.org/
Fixes: 07df1c4fea14 ("[ARM] pxafb: small cleanup of the smart panel code")
Fixes: 198fc108ee4c ("[ARM] pxafb: add support for overlay1 and overlay2 as framebuffer devices")
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 drivers/video/fbdev/pxafb.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index b889a17e7304..afdcb14f4b42 100644
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
@@ -1281,9 +1283,6 @@ static int pxafb_smart_init(struct pxafb_info *fbi)
 	fbi->smart_cmds = (uint16_t *) fbi->dma_buff->cmd_buff;
 	fbi->n_smart_cmds = 0;
 
-	init_completion(&fbi->command_done);
-	init_completion(&fbi->refresh_done);
-
 	if (!fbi->inf->smart_update)
 		return -EINVAL;
 
@@ -1779,6 +1778,23 @@ static void pxafb_decode_mach_info(struct pxafb_info *fbi,
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
@@ -1835,7 +1851,7 @@ static struct pxafb_info *pxafb_init_fbinfo(struct device *dev,
 	init_waitqueue_head(&fbi->ctrlr_wait);
 	INIT_WORK(&fbi->task, pxafb_task);
 	mutex_init(&fbi->ctrlr_lock);
-	init_completion(&fbi->disable_done);
+	pxafb_init_completions(fbi);
 
 	return fbi;
 }
-- 
2.56.0

