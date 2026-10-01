Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9163803F1
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790878030; cv=none; b=L3wDg/BGFqbdOfM891/+I0zT4nN8m2+9xx38DethtWqAcbDOHr+VlT0JloNfz6v9BQIvdO8W4PaNsaTZrQWJPTVA44nw61Z2WzmSYeU70403DcXnoq4sa5Qrwf0Ev1d2XUQAgcnMdR46Z4KD3si3zjmRP/6ks96W4WWqFWi+GSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790878030; c=relaxed/simple;
	bh=QsCmprxjt2AIVs23Cx9JQTbYtmyYsaQxrbmPDfjmTRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZtLt9Ut5EXvd6q4rX5jxOMpN0uImTAmakN17KRg3IaTzDvnGh1Cw7YX8FnZ0OpsVS3bFAEjeXXziaFG6tDikuii5ujHKg2sXLR6pqChCQUfqbxlVvApkPh5M2lvTVnsP6WOpyI2D7CKkg9KU+b/LrflZ9ba02iCSVJcu0P5PNz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTvBFO5e; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTvBFO5e"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53394bffe0fso3424011cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790878025; x=1791482825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7GPDCUkXzbddkBBz1dYgs3l5YKgPxDZJWy/V/n2BPFU=;
        b=LTvBFO5e4vJnXr0+4FKdBv0Oat3qg3EB/WoQUwBvQCQAebiX0pJvoMZdfxe6HXDPd9
         k52+cEHhSyoE7aht4e6VhyFKo6JyFfrY7fU7a87r0Zd6/2hExFgl/BnHbF5qK7S4kR+O
         ngMiq14OUpvvPHHbXSwf4yUAO7Ys3vrysP3b2hQ88eeL84qLMttCVAicSiMpXPlDc1xQ
         toKjTcDGDtwOGcQKoyJVir4fF5AjjIRL/baKeMzxKvC9izOMAdmNGxsdHEk17fp6zONJ
         w738wU6JdhpJkQo94ne/uKlYX+NxiF8Y2aAawPHu9JhC7m3Xh5ZjHQj6BDRvsQ5YJUfR
         OWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790878025; x=1791482825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7GPDCUkXzbddkBBz1dYgs3l5YKgPxDZJWy/V/n2BPFU=;
        b=m50ngQlc6uZOAbrBtDikpeBtc0Gmm2RzJC0BPMZVCsrHO6TLFV1/+hxzregp/kuLXm
         yYv1j0cn4kAs3BIGiwjpCOBTMl1PTl+R/wrBrhN9g0cvnEqvDbfjgD3AymKpeub7QZCX
         R6Yjqz6gFhzE60GaUizhjZtThyyOHmuacoC2Z9x/dEX6Wh8bmxrkXf3RprUbDdBTjXsq
         3amy4iSfdaP9WXlJ3hr6FkmAp6t61dLAQyvAeKPX1qlpupTyT/Opgbgg90XLMVU7iLVD
         2c4RjzKccmRxdXF8lGAdjzDzmbuXbJgxGnaMzUePclpUS/XDhbDKsWRJyko0K67cKroC
         WdQw==
X-Forwarded-Encrypted: i=1; AKwUvBxALu0bhqOzZ1rFIzQI0ZfX92bphOdhPZI8FZMCTa8E7MPwTs/Fd1Aw6OxCgdIGImJRWYM59oD5K6RCslY=@vger.kernel.org
X-Gm-Message-State: AFuF++lr8e1PfThpdspv1oPzmFFMxXEgN8ilucab153pcIJU9WfkbJGq
	DuleY9gBjSEv6FuWq75z/C1Hsi3GZUgfeq7X2Ws9uF4DH1aBiimTd8k=
X-Gm-Gg: AYBFou1AOrT4o/3JDXKX4VBFlVx4wmHGhrf+1j60ldzHitnvJMtl6fFei0V/cuwhavS
	79ja2tikrkzhfT1OW7FBaXV+qDFJ57WUa2uyWIE6QdW/QnYKk4PKC0mG8eGwrR5XtvFWeMxEdgJ
	I/Rf/FXkCbrUOwTUkgqax/lkvSQdWqsVzyyBPObQqr+D5Yayh6H5cBxxt1x8WrHxaI1i8eRlOoV
	iscUdvp023zkcNqGDAhdodK2dklGsJG3+as7pf3UtSSX8Vu6uBZOv8oeA5b14GTbKfCfsptHtrq
	XsinOat0ZscCkDxmVfCoc0fcGgewEBSwmSBQBgsXrFhbwbTqg4rX7eFcg75oQm3yxj8df7hlWwi
	TVH46UTQT793zj0ivhtm4xR3L7aKsfOoKLy256rcXrlZCewqSGMCKy44z+d4LeCOOptv+gyPjKP
	8uvJz3UbKKrX0AO1U2kWnWz8Ue08L7J3Ioxf3wNJOOU67jrRF634QQo2SktRovl5XksAilFDiBr
	T0jQYzLRREsZ/HtG7ORSW2F0Fgyha3olOqV/GK3aA84tfo0YQ+ZrTtEDHg1wO/QU7b3l0NwKhAK
	fdTrPoixLdvRVtNT7XPWyMYd0a+q
X-Received: by 2002:a05:622a:181b:b0:531:85a:25db with SMTP id d75a77b69052e-533832a853cmr71428341cf.11.1790878025154;
        Thu, 01 Oct 2026 11:07:05 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398a5c3fbsm4310221cf.8.2026.10.01.11.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 11:07:03 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Benoit Parrot <bparrot@ti.com>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH v4] media: ti: cal: drain WDMA IRQ before freeing contexts
Date: Thu,  1 Oct 2026 14:07:02 -0400
Message-ID: <ea39fac2402d401d452fe191ac6f9cc1e9e9dfce.1790877910.git.mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925191949.3147558-1-mhun512@gmail.com>
References: <20260925191949.3147558-1-mhun512@gmail.com>
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
Changes in v4:
- Rebase onto the latest media-committers next branch.
- Rewrap devm_request_irq() to stay within 80 columns; no functional changes.
- Compile-test the CAL driver with x86_64 COMPILE_TEST and W=1.

Changes in v3:
- Resend the unchanged patch with intact diff headers.

Changes in v2:
- Rebuilt the mail-ready message; no code changes.

 drivers/media/platform/ti/cal/cal-video.c |  2 +-
 drivers/media/platform/ti/cal/cal.c       | 13 ++++++++-----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index 1990cab77344..fdf0b2f2a310 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -1051,7 +1051,7 @@ void cal_ctx_v4l2_unregister(struct cal_ctx *ctx)
 	ctx_dbg(1, ctx, "unregistering %s\n",
 		video_device_node_name(&ctx->vdev));
 
-	video_unregister_device(&ctx->vdev);
+	vb2_video_unregister_device(&ctx->vdev);
 }
 
 int cal_ctx_v4l2_init(struct cal_ctx *ctx)
diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index 5c82378d1eee..0340e19fe8cb 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -1145,7 +1145,6 @@ static int cal_probe(struct platform_device *pdev)
 	bool connected = false;
 	unsigned int i;
 	int ret;
-	int irq;
 
 	cal = devm_kzalloc(&pdev->dev, sizeof(*cal), GFP_KERNEL);
 	if (!cal)
@@ -1180,10 +1179,10 @@ static int cal_probe(struct platform_device *pdev)
 	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
 		cal->res->name, &cal->res->start, &cal->res->end);
 
-	irq = platform_get_irq(pdev, 0);
-	cal_dbg(1, cal, "got irq# %d\n", irq);
-	ret = devm_request_irq(&pdev->dev, irq, cal_irq, 0, CAL_MODULE_NAME,
-			       cal);
+	cal->irq = platform_get_irq(pdev, 0);
+	cal_dbg(1, cal, "got irq# %d\n", cal->irq);
+	ret = devm_request_irq(&pdev->dev, cal->irq, cal_irq, 0,
+			       CAL_MODULE_NAME, cal);
 	if (ret)
 		return ret;
 
@@ -1264,6 +1263,8 @@ static int cal_probe(struct platform_device *pdev)
 	return 0;
 
 error_context:
+	devm_free_irq(&pdev->dev, cal->irq, cal);
+
 	for (i = 0; i < cal->num_contexts; i++)
 		cal_ctx_destroy(cal->ctx[i]);
 
@@ -1294,6 +1295,8 @@ static void cal_remove(struct platform_device *pdev)
 	for (i = 0; i < cal->data->num_csi2_phy; i++)
 		cal_camerarx_disable(cal->phy[i]);
 
+	devm_free_irq(&pdev->dev, cal->irq, cal);
+
 	for (i = 0; i < cal->num_contexts; i++)
 		cal_ctx_destroy(cal->ctx[i]);
 

base-commit: 4a069a763e8a86821edac4159f7c59a20015631b
-- 
2.53.0

