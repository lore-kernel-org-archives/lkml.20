Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727677;
	b=g51hh4G8oG6n48yRHOpQD8nwYwlEkVqrY81VLVlDFXNRgErhrYjVrNNaYwjqWaSgzgh2
	 ew5ShHIisTzgJoQFRzqEiLIcE7k3uEjVW1o+f4bLTYcOfmy6pTTnRnOaR8GPDBFguSgTO
	 Nh67CCj6uz6YDXwOdmVB2reuU9YeQe31+DChG8Ta71/ZaO0eTPLKjLqyTTjNBl2sGqmY9
	 VMWYZRM3daSPR6M96p4pQEVkcRZ+TBx8Xr0eW0XEAP6VnPFjF+OBQ/fQQgZ83+7OhOL5R
	 ZgNUxqMzLWkDPziyUuPrYmpkJm4lSAxpGPgkPTJ+ADnNfZ+uZSW6EoUZsW9jyNt6CuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oHNHvREYR0wm3LWmCNsyJYmhjyQVEt+abPAwNQDa1C0=;
	b=Y52gDeLKyMTj4KU0rLEQwdf2X1abgZ2We0fK2ttlTbRhSfgMFDdzEBcEJ7W8bsxpkpuc
	 CAvxA0Jsfs/z1jn9NHdFQ7wM599wSz9sCuA/7aujHZZzpXJ8QLQYukvtmcG+a7g97zhv5
	 DMdCXhNUdSERS8IY2dhOXrVSlHWNevX6lUgH5fnyL6NghHdNB0SbktKXHcRQc8J8MGx9O
	 i9DR6q2UK/etLbPTF1oiI9RehypS0ojA9aiRAR1F1kOQsioaaR2hOO2UCezUQZxfNz/DY
	 4a0+L+aiW8fZJWOiiY8HJZknFk1c9houPV8hFJoYTY3Nx4tIhCrRR+G7amMuEPHhEFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycpcYZEg;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E8B606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36E8B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycpcYZEg
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a78ec32fadso10173745e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793727675; x=1794332475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oHNHvREYR0wm3LWmCNsyJYmhjyQVEt+abPAwNQDa1C0=;
        b=ycpcYZEgDDc8l1+keLvcgI9t9iBNb+CdwryR8PY8LUYsRLvqH4O8LWbcJzpjZLP6P9
         gcjK0cPqosWluXgcSEZ0w6NAckG9jI7YD11AUg8xjhqqBjyjAw984+p6Xou3ekGD6XSI
         B1NdNB2fHzlnWGp8DZt6rJCzzkt9WCtfuCVc0Oh4edi99w/YEm+bW6LLIv0wcc7hzdXx
         6Sx2TUbENT5I/EIHd86EsU8f2RAoag3co6YHJM6KGB70bx1XSmNlBUwFgMrpVi3aKjtN
         Vd5c0B5bsAMqVoXLS6yG3sih7MPJ5G/rVUepQCqGgnGzVsvvmN+i91JReBxxH9UfnH/r
         LI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793727675; x=1794332475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHNHvREYR0wm3LWmCNsyJYmhjyQVEt+abPAwNQDa1C0=;
        b=S3xEqr0x0g8sz+dqd17riT7QdDOhWJ6GvDu3XSeeaZjwNI/VNtvnhg6PEf3dpoJYg1
         g6oM/SPspITqGn5r2ULaM1bGEQtXBngLM7lIKxF0UH3dWRve6bDiDc9SjGW4x5IBzhER
         F+kD3Ck6PkOHvwgrPFVmNH1bypgFRk6TP2DDxGO72rLpuRm0LKMThE2FGxwlV6Qhnz3G
         oJyRNzuj/Lro5rAg/f7yqeKXCKhsTLB/NDIrCrBir4iXaL0+TOe6rsQ+90KvyBSZRM4j
         lYtEuzYdClvAW/xcOLKnXdyeHq6QrKLVTYx6z9z6MtO+onb052TD6flOaIBGyVnp++9a
         WOVg==
X-Forwarded-Encrypted: i=1; AKwUvBx3DxHRe1cwjECQYCtvGCnjjtmn9uY5KiJClfsSuXbAmaFK2MSxF0FHuze4aqC3daszxfqU14YgTLoUW+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AGU49HZZaG9ssWVwJOMRT/FXf7WrvtlwHWDSKGlY5pcLMa55d
	Fhh8kwptwg71U2P7WEOHLOCT6nbODpjWCoOiyfizatNpgRyAbkuPKbXk
X-Gm-Gg: AYBFou3mwrMeptoyLxa3qYSSlf2qd4uy+oHzVTwSIFkQ/RgrRlKSi7Cky9JxvTQj9cq
	Ol8+qMEgjDLSCQwnkTlum0R0DCavEQfIFanLn94671MJBVUa0fxg7jdibmZcNZXoESmWR036pv3
	Cdcay2XtMHRG5BuKgACBh/IBD7J2+axjkgk3BJIWPDU11CybIhU2hX6+zzZOIdpthz9xHSHRHea
	IQgA+woDqy0KkE1z2ZOloTi4Izynt145YbxwMLPn2GBnilhfakd6fcOeiHbOOj4F1Hga9JjvXEK
	z5MyYiLyex2ILuoTU11uOT2OlV9rA0CotY5xE9dx3oAtU0Slv9T+Ey2F5mMW5zO9/WpkoTcFip/
	PYDQC7RZN6ESUu7iT72DzAL8LOTPplFCnpIq1wdB5Ci1t1+vYlRlqo3wo1LGHvs+XYRxHHeXH/K
	zfWo2riUF5je0CZLMCcLwkRF8OikdRz5e76yYlr/xTAQW6C7X46f2Y992mCoqg79+IZCz1PaNpr
	IA0uJHkI01rSrKkREtFyAhi5oaX05bhsni+SiVRyZaVbY6IcLuZZyptLQzziO0MhgvnN+TQw6mN
	BLvlQZnI4djJQ9kAW617R4tE4+jlNHFpBKrZayrZzALCcXDpHbXgtdBQa+KlWpQ+4zgjhZV3+SF
	wEjQ5At6oI8r2ObRv7+M=
X-Received: by 2002:a05:600c:1798:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4ac1228a41emr201492065e9.0.1793727675455;
        Tue, 03 Nov 2026 09:41:15 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-006.paris.inria.fr. [128.93.83.6])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b2a879f401sm69989215e9.5.2026.11.03.09.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:41:15 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kamil Debski <k.debski@samsung.com>,
	Archit Taneja <archit@ti.com>,
	linux-media@vger.kernel.org (open list:TI VPE/CAL DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: ti: vpe: fix double free after video device registration failure
Date: Tue,  3 Nov 2026 18:40:34 +0100
Message-ID: <20261103174036.62882-2-fourier.thomas@gmail.com>
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

vpe_fw_cb() is called asynchronously by vpe_probe().
If video_register_device() fails there, all the cleanup functions are
called. The driver stays bound, so vpe_remove() later does all of this
again, freeing dev->m2m_dev a second time.

Leave the cleanup to vpe_remove().

This bug was found statically and is theoretical.

Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
Fixes: b2c9472f0559 ("[media] v4l: ti-vpe: register video device only when firmware is loaded")
---
 drivers/media/platform/ti/vpe/vpe.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/platform/ti/vpe/vpe.c b/drivers/media/platform/ti/vpe/vpe.c
index 81bd1f9cee30..761aa40a066e 100644
--- a/drivers/media/platform/ti/vpe/vpe.c
+++ b/drivers/media/platform/ti/vpe/vpe.c
@@ -2496,12 +2496,6 @@ static void vpe_fw_cb(struct platform_device *pdev)
 	if (ret) {
 		vpe_err(dev, "Failed to register video device\n");
 
-		vpe_set_clock_enable(dev, 0);
-		vpe_runtime_put(pdev);
-		pm_runtime_disable(&pdev->dev);
-		v4l2_m2m_release(dev->m2m_dev);
-		v4l2_device_unregister(&dev->v4l2_dev);
-
 		return;
 	}
 
-- 
2.53.0

