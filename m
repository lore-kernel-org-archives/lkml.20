Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192413939D7
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792118585; cv=none; b=k7PR0BW08ILLpAITJE49gEsIIRuIpirNMecTiTEN5JzWGaSjSZkeu8Wg+fPdIuF/pYnVPPqc7it2MytlSw5nXD6jJ/caEJO2zQEQwH+jTCqzbf0+fwO+XlesYFYdDCB21s9X88+G7yrMCH2baZMqxYsn7wVDoYQrQuUnDcY/qus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792118585; c=relaxed/simple;
	bh=Gd6gfKmijRtXSOT2y0qiwcbJI9gpQtUeRS/rSnFrBvw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eOUlD1vEGsGQjfyuO3swrRYr7IulQqoBadEz8Nh/z4b6ZTTuEeJMYR2hN7Tv8q/tMPLBgxX1+L4Yi++nQMuk32/+dlWwH1x3MQmoUL/bocxfryh/op8pja8Xlpi+CDw5OBIPniITzevhaOu3TFA3vlTTkGm5r/+nTUrhhzBlMeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+LvrXgx; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+LvrXgx"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93e7ad9f78dso697674785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792118583; x=1792723383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KaS5mNOCf3rwFCjFi2m9yU0LlD62SfYnLt09LGKgLY4=;
        b=P+LvrXgxYQPG2hK43crlacv9YvhY3R2QZ22GCRsxIpVY57JBFLwlL2XqL0g+MTQ6/E
         ZDPCbkgOy1vdpOoIKiw9TiWxY5nIL2h3HM3Ssrn5WX1/kbwkWHDyMRGuNvP+FFyqghkD
         EGzz0S8VnnT3n/3TFmerbrsOdZU+YFA5hAEEb2CFJACeV52Fbq1eLI47RABslVj1/qfm
         Q7BZ6vlJKXopOjqDsTP70QwGMaJCAM/eYzcic/j/XJXRBYJ3YEM514RGDdcJ7e3KR6qb
         qzYU7rMMLNc33iwqGAQtl6oImMm7hnZppy0fadLVqq3G/ro66i0r8OzzAG5x7GXWQJUe
         S3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792118583; x=1792723383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaS5mNOCf3rwFCjFi2m9yU0LlD62SfYnLt09LGKgLY4=;
        b=Y68qUP9MmE2kpHXc4/GWAkRwlp9cR+As6liuOjppTOR/9Zi3iwuYGQONw7oML+X4ZO
         tjiGXb/oBTFtAx7aeLupCEqVmWbOsAozGh+TJv7+JqcjlnT2I34L1jXtWTZLP1KOc8KH
         /7Kvcb2fdHLPkPDfjSsa0wePuH3d9Qww8SK3HkRrXuN/bKDi2c5kDdJW62jeh1Yg9yS3
         SQ9gbR0GVOIfiZGy6A38G/pUHwoqZTsRkxHISau2o1+7v9VAOhJ84JIy97V+gtFKapJR
         wSDACIcH4Vlkykti7fJeDzBEBF18kt8GPyFHWaTrT2iU/ZbybXbzWMw7C77TOXZ0O1C+
         teag==
X-Forwarded-Encrypted: i=1; AKwUvByQ8d1rs2fVBb9C5B+2MpozMuVuWv9Np5eHCS9gMXOJZhUr04K78L8DHBK3/aTlNrIpHxBRYBqP4RvdSgA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5nGA/h/vhEeobrLiekW82b6zp4Av34nYjFnKbKsjoscp8im/G
	6oD91XPe2AOz3QrlmuvZrp6+zuDHcNONh5yV3QCPEIF6SRVieRcyKFk=
X-Gm-Gg: AYBFou36KlKsqkRS590gvcBUEGrDqC13m+fP+2NGAIMsHGMldZrj7pLtW3sgA/+xMNS
	lAx/4EZXbcU2SHcmOgIzBdNmiWxaeL4xirkxlfMPa9Xx4aXkUEZHo1LvkclOLw0LyDKpBpq3CO7
	2/xV86c7LFuE8R9ba9JZX+5dEltjaAUJ0+DoLTES/AxrTGXBRYgM4mzPL0hGqV7Rtv0gBasXAsh
	K0W35L4OhWZUAzWAcdnlB++/o2DcBQ6iyu48g1nI63nfNmXbNif3RyIk2BY0KnvWSHuyyVfA56O
	eYL2FVWhxLiBJYRe0I7bo+c+9/FJXCBhR1Bw4pA8uoQ/3QsXPYQdUz28OHXWJeDI+/wyIKk9s2C
	nkHgm2DNlDJYxkww6m3NchnobUIR5JRqbRHL+iCN51+cqafuSvrDnaaLE3H/3B2Qy24U53+2LGe
	D8A4cIeV1KA1aCrpj6TvBtGiujQl6Bm2rmxepWWtPaX8ox5bH3m3O0epu/OK9Mwt56q8A8PtY03
	1AOXpk/fr9HSW/a5cVztlN4L+xPWc4YVY9TVi4rh6Oda1lWBjOylPCx05bkhFyL3AyxgXs3hg5t
	7kl3seVM3GSkd60f/zZBAqV0ZXKyMwaTY/voOqTZ
X-Received: by 2002:a05:620a:4694:b0:93e:d1d0:67f with SMTP id af79cd13be357-93ed1d01a42mr2897522585a.51.1792118582736;
        Thu, 15 Oct 2026 19:43:02 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1fb55fdcsm6651485a.39.2026.10.15.19.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:43:02 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] Input: wm831x-on - free the mapped IRQ on removal
Date: Thu, 15 Oct 2026 22:43:00 -0400
Message-ID: <20261016024300.3660850-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Probe requests the Linux IRQ returned by wm831x_irq(), but remove
passes the untransformed MFD IRQ resource to free_irq(). The two numbers
are not guaranteed to match. If they differ, the ON handler remains
registered and can queue polling work after the input device and driver
data have been released.

Store the requested IRQ and free it before cancelling polling work on
removal. Also cancel already queued work after free_irq() when input
registration fails; free_irq() waits for the handler but does not cancel
its work.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: cd99758ba3bd ("mfd: Convert wm831x to irq_domain")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (x86_64). No runtime testing.

 drivers/input/misc/wm831x-on.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/wm831x-on.c b/drivers/input/misc/wm831x-on.c
index 18eb319..5696503 100644
--- a/drivers/input/misc/wm831x-on.c
+++ b/drivers/input/misc/wm831x-on.c
@@ -31,6 +31,7 @@ struct wm831x_on {
 	struct input_dev *dev;
 	struct delayed_work work;
 	struct wm831x *wm831x;
+	int irq;
 };
 
 /*
@@ -83,6 +84,7 @@ static int wm831x_on_probe(struct platform_device *pdev)
 	}
 
 	wm831x_on->wm831x = wm831x;
+	wm831x_on->irq = irq;
 	INIT_DELAYED_WORK(&wm831x_on->work, wm831x_poll_on);
 
 	wm831x_on->dev = devm_input_allocate_device(&pdev->dev);
@@ -118,6 +120,7 @@ static int wm831x_on_probe(struct platform_device *pdev)
 
 err_irq:
 	free_irq(irq, wm831x_on);
+	cancel_delayed_work_sync(&wm831x_on->work);
 err_input_dev:
 err:
 	return ret;
@@ -126,9 +129,8 @@ static int wm831x_on_probe(struct platform_device *pdev)
 static void wm831x_on_remove(struct platform_device *pdev)
 {
 	struct wm831x_on *wm831x_on = platform_get_drvdata(pdev);
-	int irq = platform_get_irq(pdev, 0);
 
-	free_irq(irq, wm831x_on);
+	free_irq(wm831x_on->irq, wm831x_on);
 	cancel_delayed_work_sync(&wm831x_on->work);
 }
 
