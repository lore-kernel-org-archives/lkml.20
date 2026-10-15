Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF562D1931
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792024928; cv=none; b=bsOqjDJDDDMsaK5rytvy9La85Px6lqskwM5u8dELDcKPHH9NZrpKJuu2ONTvV3LR9B1EYoFRgF72TdqQWknYwtGHHYUY6knGHVcxLdwf3KTPEcilY1Jhi3zpDoq7I9C3ZoHwpmi5B76RDUmSrl3akRZ3MlZtyxPFisGCwnUKpaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792024928; c=relaxed/simple;
	bh=+a/OKUtIrEnquOjSF4TKvW8Wf2d4YlbORphsb2iVCy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=roN+JlQdcxhJIs+FnYShL/njC9Po78JtJl9I1hTm42R8gyWAWN+Jy+i6/S2A9FquK8dhSjmvCHywwSD8RaZ9PyS8mrJL0anHMIRc0TTn0F/bSwl2+PSkJeCkQQJi9pvzlaryorXICaNqe4yNVCRUF2DehGe+IcDniC2Bl2JKra0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7SlaTyF; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7SlaTyF"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91b89c6caffso8362806d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792024926; x=1792629726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BEZUBFo8nRaoj8VHLSEwqMGAs0iozVKtPiCZ6gjjOMs=;
        b=g7SlaTyFWvzROrs/KuY05gjrqhTihvFZQVxa9FcgupWB49vqrdNDyyg7slqMeG/BZj
         OSVwcll3S2IIX64S0lIcPzVqORDUvlgVm5MOqfpGqZ4iCnT/sAStOcUYnsDXqnWcoC8o
         JRVrIunbuh7zrAJqNxC43MGxp26R1I/5P/kJQXKKPjtSIAs5bYh7rvoAOVgoWz9HuK22
         JahVxeQd6GqN39ncT3pWBeBsZbD05ysAe3DR4lZf+SSQuaqK0sMozixQ7zBuncBYkjAw
         pQcppXrL8rLRVBq0J0DmY07oQS9JLlmfi829W9bh1Pni3Fc5uH3H0QQ5GbNICXVg41tF
         eMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792024926; x=1792629726;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BEZUBFo8nRaoj8VHLSEwqMGAs0iozVKtPiCZ6gjjOMs=;
        b=dflxtGjhVNwxlq6scGCrY7F6vtVV36G5yZfVK6nuAkfzKKhTGR2y3IPo6HHFAEicf7
         ZPaq+MF9khbLpxkyth5HZvSIyFVjn9bcTPiOHrEI3mbfSpHU0hIKMhhlaVhXSonXzJSo
         oIzucxY/X4hQooAXT8zXb33IdSphyp2vSsLThv1dzixYb/xiAlql/dZmNOPHdYeszBrr
         fxorO4dcTf0lLFoLPCI2mDJ5NLmQBwjG0hLEDoYWaG653BWtzz7qjkML2hsAX23GtcKA
         7lqsCBRS+zYL0LOahcZnek07YV+W3TViW7VM/YY+SMO2xQ97NuYXcpjcK7wVWoHwupHU
         egbw==
X-Forwarded-Encrypted: i=1; AKwUvBww2dbvO/QHjdvF2hM37NQTK3sPsZsHVdVZzHUvJoUC7iGxTtNaqc1evwMhpBNJnrU42SBYJBn+3guImLs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHMPkPKEzrU9BAw4kbx0ESqQXkSZxc5Gba639nMRSdM+I6GWbN
	XtbcnwE5XkVX+Zn7Vc74zqGYO90+1ryqw7Mdxz30c3Mai2LpnuQgiVo=
X-Gm-Gg: AYBFou3DUtTgaE+BgQHVVwQew5LOuup4Sls+tKylQXaJBlq29pdvHDiAHe7HPpBtfdJ
	eKzD1hlpL72s2HhQolinINwAfsLHDed7W/2071JmW8cwqhMFWapHJTFxzqXjRkYSE7wUrKqQqn2
	TuIFSRewJ6K0RhNrcfMXI5aoyv7aXiKq39yjCKuwaw2FD7YFBsje4SFVOfCJykZok2kG+rWM+qW
	vaAGJXavX0LGs1c6UVspEzgFbZsqJqu7v629uVL2r1yG1H/Iwv6UorYRtqEipb4zFNTfoacRVjO
	w+DLWUwc1XkJ0gDzrLNmm21lDQYb001M9zaNlFT/vRNxsz7FcI9OlF6RM3g5P4RMdL7CEvs4iF/
	PcH/5D2dhde9zl5DzFRivkEvUG5v8xhgTkQN+QHIyJ9DE7XfC7XUs+t8+GIK33MQyoBUFt7ER2M
	kQfQazvLoWoIZRZr7EVMhxOkyboOcbiFFeNiImqSXZxUagkqeCsEnVUgU8ZKdEc/SvDyUO2GguM
	5vbq9vo+6RHq6mteZ2mwntKKE4rqVvBBGa51pY7IAHsfrWJyllOh71RQQjfG6enyNaFn7PFny9g
	Nz4PGJVpf7/JRGp4
X-Received: by 2002:a05:6214:458b:b0:91b:8b44:d4be with SMTP id 6a1803df08f44-91b8b44da3bmr147327936d6.28.1792024925532;
        Wed, 14 Oct 2026 17:42:05 -0700 (PDT)
Received: from gmail.com ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b7b31esm66811476d6.26.2026.10.14.17.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:42:04 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ae878000@gmail.com,
	jacopo.mondi+renesas@ideasonboard.com,
	sakari.ailus@linux.intel.com
Subject: [PATCH v2 2/2] media: rcar-isp: release the core interrupt before destroying RPPX1
Date: Wed, 14 Oct 2026 20:41:59 -0400
Message-ID: <20261015004159.2202899-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015004159.2202899-1-mhun512@gmail.com>
References: <20261015004159.2202899-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

core->rpp is a separately allocated struct rppx1: rppx1_create()
allocates it with kzalloc_obj(), and rppx1_destroy() frees it with
kfree(). It is not part of the device-managed core allocation.

risp_core_irq() calls rppx1_interrupt(core->rpp, ...) before taking
core->lock. rppx1_interrupt() accesses rpp->base through rppx1_read()
and rppx1_write(), and can also use rpp->dev. An interrupt handler that
has passed the ISPCORE status check can still be using this object when
risp_core_remove() frees it. Stopping the video queues and taking
core->lock do not join that earlier part of the handler. The managed IRQ
is otherwise released only after remove returns.

Request the IRQ after the RPPX1 object, subdevice, locks and job list have
been initialized, so probe error paths cannot leave a handler using an
uninitialized or freed RPPX1 object. Release and synchronize the IRQ after
stopping the I/O nodes but before unregistering the V4L2 device and
destroying RPPX1.

This issue was identified during our ongoing research while reviewing
kernel code.

Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Identify the separately allocated RPPX1 object and the rpp->base/rpp->dev
  accesses in the interrupt handler, rather than the core lock lifetime.
- Move -ENODEV handling into a separate prerequisite patch.
- No code changes relative to the IRQ portion of v1.

Compile-tested with Clang 22.1.2, W=1 (arm64). No runtime testing.

 drivers/media/platform/renesas/rcar-isp/core.c      | 13 +++++++++----
 drivers/media/platform/renesas/rcar-isp/risp-core.h |  2 ++
 2 files changed, 11 insertions(+), 4 deletions(-)
diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
index 586a5adbedfa87025d4258fd75a312a9a7b05ae2..6bf1dd6504862a50299893270e68f06b0d6ed25d 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -802,10 +802,7 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
 	if (ret < 0)
 		return -ENODEV;
 
-	ret = devm_request_irq(&pdev->dev, ret, risp_core_irq, IRQF_SHARED,
-			       KBUILD_MODNAME, core);
-	if (ret)
-		return ret;
+	core->irq = ret;
 
 	core->clk = devm_clk_get(&pdev->dev, "core");
 	if (IS_ERR(core->clk))
@@ -887,8 +884,15 @@ int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
 	spin_lock_init(&core->lock);
 	INIT_LIST_HEAD(&core->risp_jobs);
 
+	ret = devm_request_irq(core->dev, core->irq, risp_core_irq, IRQF_SHARED,
+			       KBUILD_MODNAME, core);
+	if (ret)
+		goto err_destroy_mutex;
+
 	return 0;
 
+err_destroy_mutex:
+	mutex_destroy(&core->io_lock);
 err_unregister_v4l2:
 	v4l2_device_unregister(&core->v4l2_dev);
 err_destroy_rpp:
@@ -908,6 +912,7 @@ void risp_core_remove(struct rcar_isp_core *core)
 	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++)
 		risp_core_io_destroy(&core->io[i]);
 
+	devm_free_irq(core->dev, core->irq, core);
 	v4l2_device_unregister(&core->v4l2_dev);
 
 	mutex_destroy(&core->io_lock);
diff --git a/drivers/media/platform/renesas/rcar-isp/risp-core.h b/drivers/media/platform/renesas/rcar-isp/risp-core.h
index 627a762d6b192c6cac454ba30cde708406f550ce..70432cf4a88ca97fa1c93cf4a42bf7454b7739e8 100644
--- a/drivers/media/platform/renesas/rcar-isp/risp-core.h
+++ b/drivers/media/platform/renesas/rcar-isp/risp-core.h
@@ -112,6 +112,7 @@ struct rcar_isp_vspx {
  * @dev:	(OF) device
  * @rppaddr:	Hardware address of the RPP ISP (from OF)
  * @clk:	The clock for the ISP CORE
+ * @irq:	Interrupt for the ISP CORE
  * @rstc:	The reset for the ISP Core
  * @csrstc:	The reset for the ISP Channel Selector
  *
@@ -138,6 +139,7 @@ struct rcar_isp_core {
 
 	u32 rppaddr;
 	struct clk *clk;
+	int irq;
 
 	struct reset_control *rstc;
 	struct reset_control *csrstc;
