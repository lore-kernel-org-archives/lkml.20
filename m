Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794276353;
	b=sY1s0vtldvuiP/S6VV9ebtqxPmdGWu3mil69lfXviw840jbF30mY2jvniKmayFyvFwi0
	 9lG1ZqT9blWIN/7xhZyCoykpkmm0UAj7OQOHEEC2aKbl8ge6AVbEZN+vrssD0Sgz403pZ
	 CNF9fCgjplC1po5VKCgBJZl4jJHO0+KQSTsSTKJIcW1b2DEAbC10E4cPYi9SpDIcAsZiV
	 0PqUXbjeS2ET66tjgoTZpYmdZkmNdSgqjGRAaflhzpj7rrrd3s0pX2h9ME5LTuIDogpui
	 jTQEf4OZ4TfVaOztfZDv81imNV9t9AwomUSVUR+WvBzzgj5Wnb4b4tio07DPI45PKhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Eeq5wOXfk2/ATFa6gkhyCWFMX/JX34himi45U6XUrLI=;
	b=hdROB5BKwKyD3FGL/8i5IFYSCFwZyGAT2TGlq/mpubMdkFE7fdgGQMdbosXwxtrsbVzU
	 rs2LsTUWA45pUpu9JO2UFKGkZyfZUGKuiXmNL18+v2KSNtcxHEjdyPaNga4JAajhyNc+U
	 90eRIFRSgn8f5VisdoPcv+Cr7PIqoIwa5xo/pN+0xO7wdQioRaldcEh+dPgJOaP645Fbs
	 SSWA0ZU2DxFK/roLty8ih7LkHRslDG6oAa1E+veY4dAw0PWcOVo0hKTN5t8s7g5UrUlUQ
	 QRB17BdPpCbuacXMg034/k+4YN23Om2UHFcOlUIuklEhhLDUBUJOpIZdWuhNrS7LYfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=miY8TFcZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B122B60A2601
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B122B60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=miY8TFcZ
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d427836e9so200382066b.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:05:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794276351; cv=none;
        d=google.com; s=arc-20260327;
        b=GxLWvttGzdL2fQgdSKU2l3eC6RYw2S63T/oZOaN1dSomAZtAE3m7ABs45uTETp/cI/
         9Q7/2GQgTAlpWbSkR1E1wX3c2rgWMzVwyr4a24ChxDJItmXA2DxyI6Fw1wSP1VlyaHAU
         5LiMn3+y7gLU3tR/dUnBnR8Ym+n6eChnzveLTYqU3Bg7KzCTTYyQI8bKjWZIxgvOwz9v
         eXBIWHqJClwjwmhNDmM+QJ3jQeuY4uTAZh4MK9SS0kyD0o2EYgeY93YvBYcgdfKf4zyq
         t4VkFrB4GiNjAYUyXSzgOhQatP5AJ6zcsTIzRAMsW139d91KqC0RZYeOswRTeUSn7GY/
         jx9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=Eeq5wOXfk2/ATFa6gkhyCWFMX/JX34himi45U6XUrLI=;
        fh=wjJIeFHmqoUYD/+hjE6dt4/m2kYBwI0iCwcJgtdInlQ=;
        b=KYP/kDF4Wvyaa55gvi3yNm00kUU4xasabJ3Knig+ZSTPITwujn5B8k9zFTatlJPTdx
         rQnwslkA6ksA2RxWwOmgpsQMJZawvO3rXojyN0b0jRlMH9cjYDeGTSjdKU19PTwqOdD8
         BpWaPhcIw+dlf3+VhCNUph5dFQiBJbPcjKcmaphLQvGAunuMeVdELnKbZfN+DQYzXOyc
         tm+/axFkJa6oiobKZ7fWKqEdyCs7qMBXsf1dNuiAxX5JcAX0CjTMdNcKbnVnAkdn+QDj
         nMcrove9QmdOMTqQ/9Vfit0V61G4dDQvUQIXeVG24rUx2xt0CseVTf/ZLSJAxcNfFjKP
         Ym4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276351; x=1794881151; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eeq5wOXfk2/ATFa6gkhyCWFMX/JX34himi45U6XUrLI=;
        b=miY8TFcZ2rbwMLQkWSsDD7zmZ6ooCAoUOcq86QZk8i41fGcql9y618JRlOnqnT6ee4
         O6BmRN4/erPMZ3vJ2i/O6d62S1w2jX3dbdzsxEiZZyYB8fi/+1t1s3UcBW5d3Ksdh0K6
         95qghzTlJWFatSeMWJLvfN19lDgMS/BVwtC34gHX+ShHcvFloNUOqf3GxU4uUyEC8w+p
         OxMqCx9Lhbz4p8taLazb5es9R5363LgPZYAEubiybrtVCXDd4SDeu7oSHqph39dFRBzV
         EPcOlyobqmHCKTnD1RgVIc3AMtlnKbC7I5FQSEIezQUlJWhx5SIQo2uJgYvueq7FdsI/
         wEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276351; x=1794881151;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eeq5wOXfk2/ATFa6gkhyCWFMX/JX34himi45U6XUrLI=;
        b=kQCCjUZOBEfpOoDAPkap4KbQP9RjcpH0oXLBDR8EXfDImURgt0ecX2J32drPxpS31f
         SNvWquF2GaWtJooUd55nx/hyJYTaHFijFfEA3XM011I3HrhhPyYD7P3UEEEeuLzOcRKj
         OS7by80LdFrTmuICnu1zUwJSLVGGbSScZg0K0ir8rPbelGVsE2mrgMjrUD9bYt3LSqSt
         S4iZgymJiQMp0OD1r3iMd4KXAr4M4OM0tpuhabxMrC7rhUyGSNj7z3C+2VatSPHdEBuB
         AnbFgwJb1igfeTyNoEKE8IASaGLy+hnExZnlnzd9ngEr+hi8ufpEV0QpYulfhmhlUji+
         W5lg==
X-Forwarded-Encrypted: i=1; AL+hErFP66+tpsUF6+9qvKQniESFwwKIW7djzLtm8k2HnsUa7dJU0Ev4vvg1FH+IL602PDLcRsHcJfBjWmvcWaI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/IXmROiXQ/PqDwKCLlRx8cbBj9Arx1W3FGVZuBDHbb0GxxQGJ
	epnTp/eJeNZ4mlzn2a5eo1aAy4QzvxP3SSasgFa5RIcv3xOztY5QMtxUUEP/yRsKHDMZ7FasZyo
	JFo7Ax9KYU1AtUPgfAh9WTicx0mk+Dw==
X-Gm-Gg: AYBFou18yBS/dhJTMFwWnQsM/mnOXCFB/UDLkeEpxkjQhLDf6DQSbx1889b2eCgucz5
	wRYekzMjZipXgzxGk7JuqW8oEUaFdSfTNcmJ6j4bcuSrUw1ivOMHxP7sFK58A96tTY7vvmdDTnQ
	ameAe8GSDRhsyONmEwvBSGWBqzQqOf9IcVvQPy4KZDTD4fLLmKU66qHRW2at6SsCyYwuMfGo4Vf
	W7x1rAhcijb/N/t61aXpMt+u6jxkSJWAJR0DDiys7An7eotF3Ad/mC2ACRLa5/ic3XeGSnx8QuC
	0PnGB4iy0gMyRVj9XfzNXdh/PUKbijyS9XU2M9LXioM7Xz/Ab9qrdlQpyZ4XNLkhUlpAy5J2Vbs
	5Xj7Z8hs4zBV8gFAwXk+878+euKYi9Yy9v5K9MJEY+gBx9RKiYBg6x+6n/8Mf4fk4BuOazNZi/r
	LEtlJqLnOTciPY8gZIXGIYOmKD0EFGKCb4zuyciPH2GFwv
X-Received: by 2002:a17:907:3c94:b0:c40:f89f:d91d with SMTP id
 a640c23a62f3a-c50495b3696mr78780966b.28.1794276351043; Mon, 09 Nov 2026
 18:05:51 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 9 Nov 2026 20:05:49 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
In-Reply-To: <CAGEsz8Hvy-jde6K7vL4B4M=hpZpTYz2a1D_qza81uyhD=Fr8Sw@mail.gmail.com>
References: <CAGEsz8Hvy-jde6K7vL4B4M=hpZpTYz2a1D_qza81uyhD=Fr8Sw@mail.gmail.com>
Date: Mon, 9 Nov 2026 20:05:49 -0600
X-Gm-Features: AclHuK9rTjy88XXbmF3NgOYWoI2XaAbuNurVjlZRMzsYFXvkTmaFvaUM0hy8Db8
Message-ID: <CAGEsz8Hf1rpg-6spE_S98i0CKrOHrpGHeTZft=UQyA-0FChq9Q@mail.gmail.com>
Subject: [PATCH v4 1/2] media: rcar-isp: release the core IRQ before
 destroying RPPX1
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

risp_core_irq() accesses the separately allocated RPPX1 object before
taking core->lock. The managed IRQ can remain registered after probe
failure or removal frees that object.

Request the IRQ after initializing RPPX1 and the handler's state.
Free and synchronize it after draining I/O queues but before destroying
RPPX1, keeping completion IRQs available during drain. Unwind the
subdevice and mutex on IRQ failure, and convert -ENODEV to -ENXIO so
the parent does not mistake the failure for an absent core.

Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v4:
- Move IRQ lookup/request after initialization and fix its error unwind.
- Apply before resource-error changes to avoid DEBUG_SHIRQ cleanup
  with core->base cleared.

No hardware runtime testing.

 drivers/media/platform/renesas/rcar-isp/core.c     |   27 +++++++++++++-------
 .../media/platform/renesas/rcar-isp/risp-core.h    |    2 +
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core.c
b/drivers/media/platform/renesas/rcar-isp/core.c
index 586a5ad..14f3c8f 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -798,15 +798,6 @@ static int risp_core_probe_resources(struct
rcar_isp_core *core,
 	if (IS_ERR(core->base))
 		return PTR_ERR(core->base);

-	ret = platform_get_irq_byname(pdev, "core");
-	if (ret < 0)
-		return -ENODEV;
-
-	ret = devm_request_irq(&pdev->dev, ret, risp_core_irq, IRQF_SHARED,
-			       KBUILD_MODNAME, core);
-	if (ret)
-		return ret;
-
 	core->clk = devm_clk_get(&pdev->dev, "core");
 	if (IS_ERR(core->clk))
 		return -ENODEV;
@@ -887,14 +878,27 @@ int risp_core_probe(struct rcar_isp_core *core,
struct platform_device *pdev,
 	spin_lock_init(&core->lock);
 	INIT_LIST_HEAD(&core->risp_jobs);

+	ret = platform_get_irq_byname(pdev, "core");
+	if (ret < 0)
+		goto err_cleanup_subdev;
+	core->irq = ret;
+
+	ret = devm_request_irq(core->dev, core->irq, risp_core_irq, IRQF_SHARED,
+			       KBUILD_MODNAME, core);
+	if (ret)
+		goto err_cleanup_subdev;
+
 	return 0;

+err_cleanup_subdev:
+	mutex_destroy(&core->io_lock);
+	media_entity_cleanup(&core->subdev.entity);
 err_unregister_v4l2:
 	v4l2_device_unregister(&core->v4l2_dev);
 err_destroy_rpp:
 	rppx1_destroy(core->rpp);
 	put_device(core->vspx.dev);
-	return ret;
+	return ret == -ENODEV ? -ENXIO : ret;
 }

 void risp_core_remove(struct rcar_isp_core *core)
@@ -905,9 +909,12 @@ void risp_core_remove(struct rcar_isp_core *core)

 	dev_info(core->dev, "Remove ISP Core\n");

+	/* Keep completion IRQs available while streaming queues are drained. */
 	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++)
 		risp_core_io_destroy(&core->io[i]);

+	devm_free_irq(core->dev, core->irq, core);
+
 	v4l2_device_unregister(&core->v4l2_dev);

 	mutex_destroy(&core->io_lock);
diff --git a/drivers/media/platform/renesas/rcar-isp/risp-core.h
b/drivers/media/platform/renesas/rcar-isp/risp-core.h
index 627a762..9e057bf 100644
--- a/drivers/media/platform/renesas/rcar-isp/risp-core.h
+++ b/drivers/media/platform/renesas/rcar-isp/risp-core.h
@@ -112,6 +112,7 @@ struct rcar_isp_vspx {
  * @dev:	(OF) device
  * @rppaddr:	Hardware address of the RPP ISP (from OF)
  * @clk:	The clock for the ISP CORE
+ * @irq:	The interrupt for the ISP CORE
  * @rstc:	The reset for the ISP Core
  * @csrstc:	The reset for the ISP Channel Selector
  *
@@ -138,6 +139,7 @@ struct rcar_isp_core {

 	u32 rppaddr;
 	struct clk *clk;
+	int irq;

 	struct reset_control *rstc;
 	struct reset_control *csrstc;


On Mon, 09 Nov 2026 18:05:28 -0800, Myeonghun Pak <mhun512@gmail.com> wrote:
> Fix the core IRQ lifetime before changing resource-error handling.
> Patch 1 delays IRQ registration and releases it after I/O drain but
> before RPPX1 destruction. Patch 2 distinguishes an absent optional core
> from initialization failures and preserves deferred probing.
>
> Apply in this order so resource-error cleanup cannot invoke the shared
> IRQ handler after core->base is cleared.
>
> Both stages: Clang 23.1.4, ARM64 W=1 object builds. No hardware testing.
> AI assistance: Codex prepared the split and descriptions; independent
> Codex agents reviewed the code.
>
> Myeonghun Pak (2):
>   media: rcar-isp: release the core IRQ before destroying RPPX1
>   media: rcar-isp: distinguish absent cores from probe failures
>
>  drivers/media/platform/renesas/rcar-isp/core.c     |   44 +++++++++++++-------
>  .../media/platform/renesas/rcar-isp/risp-core.h    |    2 +
>  2 files changed, 30 insertions(+), 16 deletions(-)
>
> base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
