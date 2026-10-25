Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792895242;
	b=DcoipHvjFhzk7bF3v97iiEcg80pHLrpehv3IeKIMxVeupK2eW3Ri6lpr4o2ePa8P0RAT
	 yG9XsZNaDRE/cDN0doVfrhZk3dKUpQfMWvlxApu6tU0alqRbpklcZw/NrkmIKiB49AuNt
	 E1febwtzfBSZqwmMVGShjSrM4TGl4a2ThYhIdmGusPlN4dSgxP0VgSoEeNt12H2oGOvWv
	 qEkRGkezSKyOqfkta0/BkN+hc7XUpIXn1rAMZ3hivrm6m8pJgzzpEuONo+HJ6EqDrm+Qg
	 Q9TvtZmi64tSp1D3YBRK57l42fNdzvfsaym/t+FUalMPS9gOknHswwkJ3V6lsQ8qFtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792895242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ILnphfN7B6opEr27AV5yqaLcUyXkLPZvSA1w4t2wHN8=;
	b=LLvdmvC5TjMV86HzAaaBc9U7lXnUkfZrlhu5GTTJDllmQlHqPaWYjQC9VF7tEfNPaKfJ
	 oLXDd+X90Hogvx3Wjc0pyox9v+z3U3pn5lqIitIHT5WFf6uj787nOHLKORKnKPtHUYW0n
	 M9GxSFikSOX30j+HlmPQtdnMhzZHJB9mR08UAB8hdr8oMLvqe2BOYkEgzxNQVIB3cnqJx
	 7Fps/jtEnPVTEjffikYRKRF7Xy+Dslf9dyKE2SfPkkZeOxw2vWMmwNGsW9PDQBiMZaVil
	 QYoII3fU/VyOlm+gzccVCvqXWNS0rcTYCh90vw+qOJrTHbeDHu8genZrewA6IALEWGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RaXn1+ak;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB394606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB394606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RaXn1+ak
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc751eddf25so1001671a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792895241; x=1793500041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ILnphfN7B6opEr27AV5yqaLcUyXkLPZvSA1w4t2wHN8=;
        b=RaXn1+akRAg/67j9inzsGfdYM4IjBVcMsg1U1Ef8LmhifXBuKl0E7FMZdagML6aWjE
         5qdq112ofBvQVY8tjaSUL74pF1Wp2c6pok4LvL0e8Bt9B4XI2NBPNkceIAwG+EZoengE
         dDsLsEeQF1yDZkv9uwn+oN2wOCGxuHAjbILMRPgCXYDJvnn2/EXsGJGwvbpCj1cE6fqN
         T+1D7o+V7nHc/QMOn9BvWMdCjkFBeXESL9iaL1lFGRBOxFBhf8LicHyROAEH8bEO4P7e
         LS/r8yHRKAwP50hv4Une7jh7Xq3Ze40M5tGBjQnJUGxRgpfC9WPsr2Z1phNP0AU39U00
         kGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792895241; x=1793500041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ILnphfN7B6opEr27AV5yqaLcUyXkLPZvSA1w4t2wHN8=;
        b=po+aqFRTtQd3LBiZmOgXbXqWUVM8tbDbmdTR0juYi9OOUj+pAnWOcyurqATaMXo5tF
         0gaOTLn67IAEzfL1VI8sRxrMhc4no72OYq6HLhK/eG12I+IUbQiS0yjAtyBJ7YsqPuZH
         Mmu7a+vriinLedBbG9Rt+SXPvXCpplPpdPiDTh0+6NNxTUcX/D+V0900xgii5ccNWiJn
         uyyIhk9hu/SewCcLtjgfs4GosbiS679Uvz8nD1FvwZ8txFhby9wdTwGNpv5woSgSfyMo
         20HZBnIDnTJrBsvFQfKNHTfIwOnoiHRBUajMzsqOBns1LtGPBiMGFnMAaGXog2LJoheA
         cUHw==
X-Forwarded-Encrypted: i=1; AKwUvBzd6gZ+XHq2HfvIZTJ4/6vxOHtPA+vt1/GbDTbInlELMH01QrbC442gGByOHk4QclN4PYEh/U6c38iECzI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJK2clIxdR/UfqP1lBlB7HOrpC8vKdixKNI/BUOf/ruNwEHwA2I
	WK1qTme7CHIzjb0XRm/XNVLMY5UtTsmLX4wsz+PmK4Zn+ldcww1OpeUE
X-Gm-Gg: AYBFou0lW3hXkk2r2FQSQwFoEK0XISXRX5wDEKFkthOYB7Pd+kA3P4f/dHIkBq1EbCt
	S+B5wXchxvWp1B85uVoBET256kuKGJJxRrgaij24+qB81RP+ymHsa62SGTlGGnV9TAAofHLafsP
	p00cHuu2QWBbseEnVSRbC99tswqRpzkfl6GpNZERJQtRmD1QJmjvvbyLWVYM9ANzcgfCuAcSPns
	zvsw9247PFiDXs9KpneeWj7AAsAYIDKaBQ3oB7Haa2/2c5FQ9GG6/w25KyV7i9jcbrYZ2lMk2yl
	4WdveLEJGgG7WaD6yDMRfITrBMIkdEsHc2JncUSOWJ8qilvTvC1v9J2ukIU1kdNebOAoBTIM3aB
	M5/uVKWvWzc0Peb2E8FrKy9Vjw06U4PRYh3VzgKkwcCC+ou0IrC8sNCQp0o93F0VlI3fQPADBNH
	16w0l6pg9c76FPmDOoK7nYJDdMH/XidQ7CNHVKWKuOKxjFyuCFq0d5CaCITGOm9cQFeDcXu/hJ0
	GEcaR3YICNwIK7X9dy/nHf41Gt2D4tTBRDCW37KdDoRXuo5LErraZbZZurxHDI9iJM1lZgPX1qL
	R+SE4t4=
X-Received: by 2002:a17:90b:3143:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3adeafd27aamr2667251a91.52.1792895240980;
        Sat, 24 Oct 2026 19:27:20 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6216:1250::1d3:c4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebad6306sm3064944a91.2.2026.10.24.19.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:27:19 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: linux-media@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	stable@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	Guoxiong Yan <yanguoxiong@huawei.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: rc: ir-hix5hd2: set up device data before requesting the IRQ
Date: Sun, 25 Oct 2026 10:27:02 +0800
Message-ID: <20261025022706.1905466-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The hix5hd2 IR interrupt handler passes priv->rdev to the
ir_raw_event_*() helpers, which dereference it immediately, and
devm_request_irq() unmasks the line as soon as it is called, so the
handler can run before probe() returns.

hix5hd2_ir_probe() has requested the IRQ before assigning priv->rdev
since the driver was introduced, so an interrupt already pending when
the line is requested, e.g. decoded symbols left by the boot firmware,
would pass a NULL rc_dev to ir_raw_event_store().

On Hi3716CV200 the handler ran 8 ms after the device was bound and took
a NULL-pointer fault in ir_raw_event_store() from interrupt context; on
Hi3798MV200H the same fault killed every boot 25 s into startup.

Request the IRQ only after the device data is set up.

The same ordering was fixed for talitos in commit 666d66df2525 ("crypto:
talitos - init tasklets before requesting IRQs") and for bgmac in commit
ac1f6e58cb77 ("net: bgmac: enable interrupts only after NAPI is ready").

Fixes: a84fcdaa9058 ("[media] rc: Introduce hix5hd2 IR transmitter driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/media/rc/ir-hix5hd2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/ir-hix5hd2.c b/drivers/media/rc/ir-hix5hd2.c
index 1b061e4a3dcf..c3b984a0c2e4 100644
--- a/drivers/media/rc/ir-hix5hd2.c
+++ b/drivers/media/rc/ir-hix5hd2.c
@@ -316,6 +316,10 @@ static int hix5hd2_ir_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto clkerr;
 
+	priv->rdev = rdev;
+	priv->dev = dev;
+	platform_set_drvdata(pdev, priv);
+
 	if (devm_request_irq(dev, priv->irq, hix5hd2_ir_rx_interrupt,
 			     0, pdev->name, priv) < 0) {
 		dev_err(dev, "IRQ %d register failed\n", priv->irq);
@@ -323,10 +327,6 @@ static int hix5hd2_ir_probe(struct platform_device *pdev)
 		goto regerr;
 	}
 
-	priv->rdev = rdev;
-	priv->dev = dev;
-	platform_set_drvdata(pdev, priv);
-
 	return ret;
 
 regerr:
-- 
2.53.0

