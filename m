Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FC82F0673
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113617; cv=none; b=Dx9kONXQ6L7oc5rdUtvnK9P1CPCPPhryrmZPIf4Pd/8RBS5sVKsR8uwgNUk1j3X7IkmxNdFTJp/KA4XXOG7PVG1Hn5uJIW/wg9UfsIfd7oc+zTZgK5bubX0X8aWy5T9LSTVYh2aX1bk12QbcaakndTKxP7ijVS/MdKE+59dqwEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113617; c=relaxed/simple;
	bh=3UPK7oroY0tp6jshkowSLIGG7g/R9K6DjNhK9fHde/s=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qyN6ahCnoBfyTh34WsrhZR88h/9afS7cAPws6p9wMoO9wGYGRC8Yr2WgOKPGrmVr+NO/y0XTO5VoK9V951BWOW0/le3apnY8z28wY0QcII+xLPfLnL4j5iIiA/SrNWt/aNF4z7E5vqJ3EihlvS5pQIVtX9VILOcIJGtSqhhSpuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=liDCn9/F; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="liDCn9/F"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f079a63b8so193091385a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792113615; x=1792718415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PtpsWlwRVaneZFjF+7ofxpGp4s57Txr3eN6Q7YNC+/E=;
        b=liDCn9/Ffhl7wbRvOQVcE8EttQv0kB4tEVi2lQbrDNKkH3ZPEVmA426Br9hEnmhoB5
         zzUXPqWNQOSGRfBnn75q2BDY1jt3k/8m4EFh7LTxkLx9433PFb0e3PWrPQWFKUOrfdVR
         ADaaxH6TwBNIh/Nfzk5G+BTH0U8qk62JDnjQASQgs/rjdQot5gGdtS0P/4pl4wnzBLJX
         iGue4zyrw+syL0Odd2zHzW8tmkfzOXctRMCmW6o7x7wJTayU/hbj4HHxGCG2610TKo4X
         0WCygFoTPL9usUiDkkiYrtcGS/deqEwNwyy7TQme+JWyh85MWOsiijnzuvQGWS0DIn39
         HRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792113615; x=1792718415;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PtpsWlwRVaneZFjF+7ofxpGp4s57Txr3eN6Q7YNC+/E=;
        b=f+SoXbtdlCtqzsqtVrbjHFnUJG9EcJYsQOj3hYTgS92/dinBGwVIby1A+NaSN2ya35
         lcK+c00eGOhSRcOGaQYO/wz1ol6CVkBTBQd4B7QWneIb+XJ9luv6+Xhvwdj2Y+2IOvlA
         JVVidy+8PJ7luEjeHFSQeFK84B01s7jSMBL9zFFxvuXDg6ig9maj9rGQsN5KR3cifdVt
         AyIwxfofqIJEqlu0ROT/gdeV8u+VTMAun2ZDO3eq3NbO5l+nCAouvxKrwu6J6NQTINcj
         gReqZiCwHZUiD1v5DvVPmAHEUiDhQI/sQh4cv7Ixr3iQewgDM3eDJwVrGt/WCyIBnb4i
         07rA==
X-Forwarded-Encrypted: i=1; AKwUvBwUtidK8cMEYjSl1OT1eMvomdD7XPZbGtNbZK2quqa+RW2h+9AZg9FaxR/u03toUKLI3SoqotD9QifQfDY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeyqhpqFqV9njkZ72c+lzbpXJZciiobav7AebP1P80yYDSFgp1
	V3Pr+J2JLabRi6spM28aUlmWI/SAi00Du3LwCLxpBE09W4kMwRzUUEQ=
X-Gm-Gg: AYBFou2UQCvtVnO968F+2ouTE+pbBSz2CROO70RxmLC/26o7drK26hA4x20BSKO5S2i
	PpRYbB7T457x8sUfDQOafwFAPxoON6V96hrIiSUVw7muDtMOaAJgED0rwZsrxTk+FXHXs9xtTKP
	f3WuqWVwZlQTKEpQCnLGwI9azkRJLN2fTnuqHUDqEFBfSyRfA4q1z3mU8M2Vta8c28IdlgNVUTd
	Ib/9Bx0tzxpaQlroOMaVlA1VUSYmMLVSUO++MbYXtL3BbR5QbfoOGaMemXrVTcMOea8/uuue3py
	u03TsDDbAKpmmA6Z82DxpeYqTIkEmcfCi2/k8QIn6uZLM3EO8t6aXJ2QmYHCseGg+tnisMgUOyc
	9f3bAs+a5dUSkVIOpLI3V4SdJosJkaOUSul8bbuTAeA0mw6/Vc/+Q3DGBcfAm6K1n030jQIa0o3
	z7xCiFreOsuJQX31+3a9+AvlSc0PNliAfexIq/r+bzjEwu85caUEXCubemdc1oFL3ryVfgCJ/IN
	6VDaXPXFWpfDNJQy1crEi3qKn+u2j7Glkrx2xqyQEtbrMJzsNcJoAq82heJ0/CuJotmdrLsU0oP
	Gg0y2/nnwW6OP2V1/5kQ/AtD7HY4
X-Received: by 2002:a05:620a:6c01:b0:93c:23e4:359e with SMTP id af79cd13be357-93f1891428amr288853885a.50.1792113614608;
        Thu, 15 Oct 2026 18:20:14 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1a990fsm76619985a.35.2026.10.15.18.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 18:20:12 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: eajames@linux.ibm.com,
	mchehab@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: aspeed: acquire IRQ after reset and clock resources
Date: Thu, 15 Oct 2026 21:20:08 -0400
Message-ID: <gm-top10-20261015191529-g65-295aa0ac5211@mhun512.gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The threaded IRQ uses the reset and clock resources, but it is
registered before those managed handles are acquired. Reverse devres
cleanup can release the handles before the IRQ action has been removed
and joined.

On a resolution-change interrupt, aspeed_video_irq() calls
aspeed_video_irq_res_change(), which invokes aspeed_video_reset() and
accesses video->reset through reset_control_assert() and
reset_control_deassert().

Request the IRQ after reset, clock and JPEG-table initialization so
managed IRQ release precedes release of those handles. Add rollback for
the JPEG allocation, reserved-memory association and prepared clocks if
the later IRQ request fails.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
This fixes managed handle lifetime only.

Compile-tested with Clang 22.1.2, W=1. No runtime or hardware testing.

Base: 0fcb05b72344f40806cbe810de8872f1698bf053

 drivers/media/platform/aspeed/aspeed-video.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index a292275f6b7b..234001a93ad4 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2232,14 +2232,6 @@ static int aspeed_video_init(struct aspeed_video *video)
 		return -ENODEV;
 	}
 
-	rc = devm_request_threaded_irq(dev, irq, NULL, aspeed_video_irq,
-				       IRQF_ONESHOT, DEVICE_NAME, video);
-	if (rc < 0) {
-		dev_err(dev, "Unable to request IRQ %d\n", irq);
-		return rc;
-	}
-	dev_info(video->dev, "irq %d\n", irq);
-
 	video->reset = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(video->reset)) {
 		dev_err(dev, "Unable to get reset\n");
@@ -2286,8 +2278,19 @@ static int aspeed_video_init(struct aspeed_video *video)
 
 	aspeed_video_init_jpeg_table(video->jpeg.virt, video->yuv420);
 
+	/* Release the IRQ before the reset and clock handles on devres unwind. */
+	rc = devm_request_threaded_irq(dev, irq, NULL, aspeed_video_irq,
+				       IRQF_ONESHOT, DEVICE_NAME, video);
+	if (rc < 0) {
+		dev_err(dev, "Unable to request IRQ %d\n", irq);
+		goto err_free_jpeg;
+	}
+	dev_info(video->dev, "irq %d\n", irq);
+
 	return 0;
 
+err_free_jpeg:
+	aspeed_video_free_buf(video, &video->jpeg);
 err_release_reserved_mem:
 	of_reserved_mem_device_release(dev);
 	clk_unprepare(video->vclk);
