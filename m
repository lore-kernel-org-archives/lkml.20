Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281CB441021
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363996; cv=none; b=W0dljZIV/dYr4Us1spFCYyuxXXhpPM1eMYpsvCtazmY5oQ/oqzP4kscqi/gVwuBNo9xixGn/xV5i45PiFnl/FT519Wh4B6KP7UGy5Ts+cqIfsTIyQV/aRnMwrd1E7qfujkw+gzW0wrif5yZCaWCy4+LeYVbUD6Khc6C8XRfy59k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363996; c=relaxed/simple;
	bh=IX3hAHmd5J7B50rrTrgTQmwhlSUmM5W4T2F0KVu5jT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B1r+1r/r5WGMkZHglF0d8duSZbpC0MBHO80pvqwW/YN+vi8gNJN+hK06zNwz7CDf/qSHXarCCT0kFlzOrFT4dx79VhgZVjjeaki5X/d4BgJHeX4fu4gdMUtkUSe+GdnMR7Yv/k+SWGYQhwkHQclmc+bdWWckghxfnfnSmBJ0Eg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYsBQbE1; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYsBQbE1"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-53315c1a1d3so11828111cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363992; x=1790968792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qhUSV8TkocBqRZDuy581BPfPgSxgiFPox4fK+CF4Ql4=;
        b=jYsBQbE1dpicI+OSbrrkSFkdVvBA4ydhCq532a97mT6lwVTai4MFjtyFpWtwEb+kpk
         sDCDLpMz0Yr6KP4EN6RkQACY4uK6SHhWtKwNJb5YiD5aeKgsPnJAwyYdjmEFvMcsVnkZ
         dVOu8R/7CVxCJMsl7fZrjYf7sP0GfLwOaF7yK1xW2R9Cz32edAFOToLWVI4X8hea7qfM
         gxuaBUXVlUvFarYtxQjlx4zx2bhmqiiIU9/ExTzSJ87kMbpJRpWrhN1EOfxB0Jy7fsBd
         NpHsAAY1yO8an42TU/Dfaa4CRbP/cSl1rqori3kg+A1zKgMtdN8AoglFwb62UxBlV/C4
         bhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363992; x=1790968792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qhUSV8TkocBqRZDuy581BPfPgSxgiFPox4fK+CF4Ql4=;
        b=gXr5Z6ux2DQFsjsHIYm7lPRkcpjsFMlmUmxwby5Jf2IcUVDufgXQYhiZ4WO9A0tIbz
         3Yk2FSr6EuOsCyqnWuUuenY/y2fiGjmmCLA1fffTHZ+CpwsAuuQ4ojpdawHCrGorQOQ0
         t43DFE4HLq+IJevC2vZlwJFG6KAGJbUFeMG2DNWFQyWGScPtqOQeEb4hVj4CiL4ELvyC
         qiGvTNJjuqd9GelzB2Sk2aCVZuhdiZBQ1fecXPILKWYU7xKiX3vRuxJ1kj9pQbEQq7IH
         dDnf4t2L69IXD1371ZwJy4Z17OwveMqK5iSdkLUksAL5OHic2A6dGJjGaLYXdrEiQYLw
         6khg==
X-Forwarded-Encrypted: i=1; AKwUvBzWsacqmV410wSoMDVUawh8z26VJCcdvtmuuIBsTiLSsLZikm1yWpKODUy2U8Ve8VVmogfyWyMeWfsjrQA=@vger.kernel.org
X-Gm-Message-State: AFuF++lXH/NcmpykOaHGZDbFb5rFtnUJTBRczI/3C/MDDB8Uhz4UWKDq
	zSPE3g06d3tGeiNSPTvNdDbQzRHgc6vr1KQf9PM15xkn+BeiDj8RYrg=
X-Gm-Gg: AYBFou35jcLRK2c3kRDmf/LcoOq9aQ+PLj0CgX95kRqxSrfgnUCBV1KhFk9O/2jvAgk
	muAtMgc0wbzTr8OW6tvUOCHBbtYrSerFeRDx3VI6kvfY6CktYZEgfz8YuuxTb5AOnAWxDrYFk+x
	WeXrFHDevKIaBNBypvQ3FNseyhmSPoJlIvaW+qoA8aqV3tnC3ltdeKcIHOH4EiqozM3qKI/UBPi
	uOJnBewQxQf3p81Tkn1s04f0aUhsjhXf2YkDcDlYuVkSYQsahbPtJpU/n3fNSSGnUWkso9FS44J
	YYXvqCOVsp5vlpQnM3vVd/VTFQRt95h8QNYq3yx67P4cNfUAZrATJQCNHVAGHAi/Pp/YrBbdF2d
	giCnaw3yinEtRIKA5sKfw6qtj4LS6nkHFZZDsfXSe6KFjM9tJOT15oVinz2wr3uE6XZMum73XXG
	1WnPrdj7dGD7riZmRQQkTxBaf/GKnJRhh8S1qSeqsIteYkD5bg/Gw3z09/ARdW7Pq4JMbvgissA
	qqvZuPmV7vPplMmaYVN9jIUZlD4WXqfmvbIIKQ8jdCdHDWfJBtb1H4ho+PnFLv2n7BWMva8+qyN
	n69rBWafhrhE0C/XuXa6cUp6uKbxkg==
X-Received: by 2002:a05:622a:124c:b0:530:fbd1:6078 with SMTP id d75a77b69052e-5330b58affemr62237401cf.7.1790363992326;
        Fri, 25 Sep 2026 12:19:52 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5332225b709sm98811cf.13.2026.09.25.12.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:19:51 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v3] media: ti: cal: drain WDMA IRQ before freeing contexts
Date: Fri, 25 Sep 2026 15:19:49 -0400
Message-ID: <20260925191949.3147558-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cal_remove() unregisters the video devices but does not release their vb2
queues. An active stream can therefore keep WDMA IRQs enabled while the
contexts are freed. The managed IRQ is released only after .remove()
returns, so a handler already in flight can access a freed context through
cal->ctx[i].

Use vb2_video_unregister_device() to release each queue and stop any active
stream while the IRQ is still available for DMA stop completion. Then
release the managed IRQ explicitly before destroying the contexts, which
synchronizes any in-flight handler before the context memory is freed.
Drain the IRQ on the probe error path before destroying partially created
contexts too.

Fixes: 343e89a792a5 ("[media] media: ti-vpe: Add CAL v4l2 camera capture driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v3:
- Resend the unchanged patch with intact diff headers.

Changes in v2:
- Rebuilt the mail-ready message; no code changes.

 drivers/media/platform/ti/cal/cal-video.c |  2 +-
 drivers/media/platform/ti/cal/cal.c       | 11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index d40e24ab1127..0310dba0c810 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -1036,7 +1036,7 @@ void cal_ctx_v4l2_unregister(struct cal_ctx *ctx)
 	ctx_dbg(1, ctx, "unregistering %s\n",
 		video_device_node_name(&ctx->vdev));
 
-	video_unregister_device(&ctx->vdev);
+	vb2_video_unregister_device(&ctx->vdev);
 }
 
 int cal_ctx_v4l2_init(struct cal_ctx *ctx)
diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index b7e77b6b8950..d332a05facce 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -1151,7 +1151,6 @@ static int cal_probe(struct platform_device *pdev)
 	bool connected = false;
 	unsigned int i;
 	int ret;
-	int irq;
 
 	cal = devm_kzalloc(&pdev->dev, sizeof(*cal), GFP_KERNEL);
 	if (!cal)
@@ -1186,9 +1185,9 @@ static int cal_probe(struct platform_device *pdev)
 	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
 		cal->res->name, &cal->res->start, &cal->res->end);
 
-	irq = platform_get_irq(pdev, 0);
-	cal_dbg(1, cal, "got irq# %d\n", irq);
-	ret = devm_request_irq(&pdev->dev, irq, cal_irq, 0, CAL_MODULE_NAME,
+	cal->irq = platform_get_irq(pdev, 0);
+	cal_dbg(1, cal, "got irq# %d\n", cal->irq);
+	ret = devm_request_irq(&pdev->dev, cal->irq, cal_irq, 0, CAL_MODULE_NAME,
 			       cal);
 	if (ret)
 		return ret;
@@ -1268,6 +1267,8 @@ static int cal_probe(struct platform_device *pdev)
 	return 0;
 
 error_context:
+	devm_free_irq(&pdev->dev, cal->irq, cal);
+
 	for (i = 0; i < cal->num_contexts; i++)
 		cal_ctx_destroy(cal->ctx[i]);
 
@@ -1298,6 +1299,8 @@ static void cal_remove(struct platform_device *pdev)
 	for (i = 0; i < cal->data->num_csi2_phy; i++)
 		cal_camerarx_disable(cal->phy[i]);
 
+	devm_free_irq(&pdev->dev, cal->irq, cal);
+
 	for (i = 0; i < cal->num_contexts; i++)
 		cal_ctx_destroy(cal->ctx[i]);
 
-- 
2.53.0
