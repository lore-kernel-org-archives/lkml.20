Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417561;
	b=E4NwPohbbw4MoR5vrrC5TjuGOXGTAuS7VWkJSUjZ5IT876tKZdL+qv89jIH7kG95imeb
	 LciwMXQq08lYhgB9WD002UKVRSWxFjX7fxBUilZ1ZGyjzeGTdqIlsh/RrYiFRxTR0YxbQ
	 0MXhMAQa3yOwcs+UtNGjCydGSqjOvfQ0rC9krE2NS7OPmUaRwjcmzYeBuh6zD6Rxznhty
	 o193OSadHYbrghtW3yeIg5mDcZ4d6UQEeQFd6hkNuu/44nZxfq4Rj2DLoQHJOuXHNTnFb
	 Gh14dxL6Z5f7HiP8u31fYhQflZwbmG78be+P0acDe1/1VUhzYTF0LVg3VzE1u/VYl8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mnYw2aLxaOMLunU5/NMlexxvi/OdOgAm+kgTsrY2DdI=;
	b=zD/GosqYSc4eW0TToCyr3XfzA+Opmue6XMdLUh9THov3Jshwll45tc7H+x3bYV4YlaDL
	 0b7m3Yuft4JEYc4N8s4R/Xpg7S/itHHaACC9yXkuwmiS+OZEF0cdVyLgMobNZVFEBFb0w
	 1/gpCSWNyXgew4INtXX6SuC0BN4qNMvQX2iTjcEZbnV4xOBh+G/7MkTjxN6nrP861WcFs
	 beSykz4gDfR9ccLs3XGi36Khvot4FYeMqaoTVkSX8MARsCRx2AbqoZoPEY7Yx2MH7CArQ
	 QHnhax6zxjCPB/Z36O9sacxDVkZH3Cvug/BeXfRyFVzzAVVXFobyIF6uqby+CidNILg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OrlS9rp1;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3F3606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A3F3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OrlS9rp1
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-369f33df08eso2753840eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793417560; x=1794022360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mnYw2aLxaOMLunU5/NMlexxvi/OdOgAm+kgTsrY2DdI=;
        b=OrlS9rp1bbj0NWuz4a4wVNlomMJVhVs19LaX2EJYbQ0S9tZhodKl4FQWuIiJNuNxBj
         G/CwzXulMvG1NVMtMQ6IUjbRb7GMCUt4norsKv/2xRl1NWjNaL8BO63XwuZxlme/7LtT
         GZamJWPslc6/Kw0N9tNMMA6e7UY5FKgs0KEJ2ap9sVdnCLcl0MQAknWt+vUZLzFESDfZ
         WOs1o1mDcS0VEkVMs4sgsscnpafYAq9cnC1rwwu81FsSFThubV5uIdy/Pk68mlqkqMXv
         K+BYw/6SbwDaBheZ598lAGu7BNtVDx8Pq8mY9hFtTi/b/JRdVOnJkJlPKcAqtC2n59qE
         d37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417560; x=1794022360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mnYw2aLxaOMLunU5/NMlexxvi/OdOgAm+kgTsrY2DdI=;
        b=R/EIHbxdYxV69ZyMY+eoJ3LVOA5ln3pWpnKLPaJT0XOFXm4uOmOrWENXkhRTotcWkc
         hkhMUE5YrGAsNFbJ2sQ/VbAjS3ZLw5S8f8FjrPjFvAPBUfrkoMt0IF3MFmJ3cWgeNIK3
         CqnATUMcqYX4AmZcEZy/THF/ympf2/TRhfRLDuRbcp4R4MqpIa0ZL4T4jxTuyz2C1wED
         EnM4y5ZnDmk/WGwWrtH4fbuAsqBvoKPQzFkYK3MWFMJ2Ie/37s9aVxQhNNDYnpgReYCs
         H/A3ElHT4YqRzagMoHuq6214llp1mTIS0bifcP8115Pquo7zNwFhLdUdZhUSLERFnxIi
         spGA==
X-Forwarded-Encrypted: i=1; AKwUvBwXDPel+MRQG3M6DKiz3Z3wdDwMXAvUtU/BhIpQrWV7kY8owjie6yDXiDm1vgUXj5CgF7PIjZ7TfUJKkT4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+GHbUERvG8XJ4iGiXlSbp01lV0OLEvywMwbDihjcUudJKonu8
	fe1twXFih85P1KPykoPA5XzW8fghQyFFgb8pcahrMlHxxbOIk+2vZi7g
X-Gm-Gg: AYBFou3TeyF52WkrnOSmXfG7SzPmGfzURYwJk6tVnvpNx6tCpye7yMjIcP3bKxfSQSp
	jl4Qq1h0u7cZOT0vW3fhxfOckZY2ZupJJToauXBKXLP5+G1IuO0Bq4xldSnvklfTyhZAfP8WRx+
	Pr0ugEHtuRynF88kgrcHUPt0E19wlLgQeSozEGRZIHCvWPFYeFHVkyxmhrnyut0vbZxecCzjwSg
	GugswYf75QGUaSyE94aFiSVjdDwx0Wdhb23Lk8P5qETyjQJmT6JKBDkonjHjwtOHTGi/bfLhJh8
	+llRb9M0TGuK6TOC7WGFLEMJDF548hCH7LSXga5H0QeojBExZ6WL7MnUZuIvp3ExtUVr53NjxUv
	KhxqUcgFkH9hFvrsp5jU4xo8Fo7LAun39nAFk5pCHYzK5DhLzqXADX/bMsDrBSNoTHoQZH6pcqm
	N2bQb1DVUFMzAe4fY62gPaQOycoVnN0tExtdfpxFcQ0Eapp/xf43TfOadF8TTlkzOqGIA1I+WaB
	8nmmkCVwn+Hpdowu44LMVIW/Q5OyDc+T5y0weRmkbCXZ0Ezqip5DHUNXgzZ0cuzi71zvvoJd5ew
	un1/zTs2Bo9/CVgA383x7pzUpBPL/rP82y2QbUPhWNkaVadYLHGnQ0B1OpxarGcGzeqqNs7w9p8
	iK/d1WaidiqnZL8jZo7mv47ecg07pZWbfY8ZnLLdhV7zk+HS1D4KJkA2umLGMdUrYx4zqFmADzr
	waXPV+yda9O25BWw==
X-Received: by 2002:a05:7301:fa4:b0:36a:713:a76b with SMTP id 5a478bee46e88-36a4236a5c5mr6199404eec.6.1793417560169;
        Fri, 30 Oct 2026 20:32:40 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429000f8sm11634639eec.13.2026.10.30.20.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:32:39 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: pxafb: preserve IRQ probe errors
Date: Sat, 31 Oct 2026 11:32:36 +0800
Message-ID: <20261031033236.2490968-1-matthias.goergens@gmail.com>
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

Preserve platform_get_irq() and devm_request_irq() errors, including
-EPROBE_DEFER, instead of replacing them with -ENODEV and -EBUSY.

Found by Sashiko AI review.

Link: https://lore.kernel.org/dri-devel/20260722075803.570532-1-panchuang@vivo.com
---
 drivers/video/fbdev/pxafb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index 1682345fb9b0..1912cfce28d6 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -2306,15 +2306,13 @@ static int pxafb_probe(struct platform_device *dev)
 
 	irq = platform_get_irq(dev, 0);
 	if (irq < 0) {
-		ret = -ENODEV;
+		ret = irq;
 		goto failed_free_mem;
 	}
 
 	ret = devm_request_irq(&dev->dev, irq, pxafb_handle_irq, 0, "LCD", fbi);
-	if (ret) {
-		ret = -EBUSY;
+	if (ret)
 		goto failed_free_mem;
-	}
 
 	ret = pxafb_smart_init(fbi);
 	if (ret) {

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
prerequisite-patch-id: 44b1c2680cb029871e123eb11eab7764a807ef24
-- 
2.56.0

