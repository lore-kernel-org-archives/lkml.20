Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550CE36F908
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792188989; cv=none; b=B+2rA9/ryD5fMVtNB+ksuJPDM4TdJ8Ewh4XL3tb0TbChHBPKHi9sxGBsV1g9d/vHhjX1xWlmYvzl4FECOGAjgEiMhWFMcB2j1glSolikycuUW8/6KdFhQBcUqhxt3+Ehs4GxrLkK7zsJCGrZ6btwGkSNYpI/YCFzWzHh7e2QGck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792188989; c=relaxed/simple;
	bh=OIaEkynfAr9WKeooJY/3g2U/O1bCDEbfzmAGfhXmYIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LxCLnGSw0YkrCi7k6FCIUUW8fbxGC4u8X5tHI4N1CXBLG8ydNZZ6Q695RWJEfGmkIqkgXNHhZQ62A6hKTGtoXoQpJ/FizVxrdsVoTDJ9oQ69hh1nUwr3CY3uH+kf2hkKSm8966BTI6ECxfSJ9Erw9z+iyJlR7fAlxj/TJpkjYAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwT7Sv3w; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwT7Sv3w"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-170135e43c7so251850c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792188987; x=1792793787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IKMLDd4ELr4QXkQblGO+w5ZqVhuimx/sg35XuBzMtks=;
        b=rwT7Sv3wcsEj39GLLbHQvHAmM97L4+hg1aflLTjVOwSgdgJiojI6V9c6hIBckuh/lq
         4hy89RquscP0WVEWDHzcT9V4VgLFXoXQ/p62sjLevdajXmjtaKPlf89f34TgVVb/++cU
         3qGIhey5fJJYZ2/X7mUBHnen6RFp4qH+fvPqH4ZOKlaRGN4iu0bkkdJGotv2MGMh634+
         kVJw3E8qnMGhyZcMPHybMTH4nWfG1sAEvEbxwS87+oy3ytllx5AP8gcCvjPucul9EPAp
         nS/TT9a8IYJ2tifBQ1oke34GH1b/BtWNxqjUdTPsO9lNdUGMOq9PoVDRzHNmjPjMcYKd
         72Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792188987; x=1792793787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IKMLDd4ELr4QXkQblGO+w5ZqVhuimx/sg35XuBzMtks=;
        b=AHrr90DrzpdjzAG82IM6BZ7ZaLY+6+nhaGRRaZ0xCtNhsksTfWwVi+cCeLHSHpZ/EL
         ear2PxLGu7nbCuOSHdHdgfZReEtDKI+Wj4ZsX90fvHL2NPNpg9GJr8LhGK11msJw8Tvw
         4CgW0dhLRcIEVkF7paDHduyj1sgbZPZpNc64s+M+KjtO3sNl6TqBfcmJnQ08+RLA4ves
         DkVomiBzdZxoJRLrndlHIFpUS/NU6i/V2j8jzZv100TdqY28f9pHZ3Xcz/8hNe+2CZ4a
         ZQifUQ0S6cy0GRPAlnUMgwZiuV1WPIBqAHto7Rzp7vDq84LVxoHLN8ttzg1cqNEJX6+H
         9GDw==
X-Forwarded-Encrypted: i=1; AKwUvByVzKxiyNxkbq4e+Fpei2tXCy/WMWmLhIoGLdLjO45ej4BM6Uc2XQUafRHVTtRnZojxQVQou08ciGQAo7c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKM175RAto+Gvb1kyV9Ds+rjE2wM09ikMaxWiOKOeWMoPwA0BfG
	Kowv9S210G7BeNXFMidzlZqyQFoKGAPkVigoslAAYHLWS/bn9hwFKE6S
X-Gm-Gg: AYBFou1PKu/86drwfYNm545EVlZQv2gxnYaf9G/A07cceqAxWhmvCTTffYeg1qRjg8R
	NXhMW4Oa7KqpYo+M0kU8K+TZtnepNl5p0PMXofrAzw1th9XnuE4bzerd+qV/cOXSV6o44MKWW9z
	xQ0oTz8u1PI+mZrKuc9YFbco3mCd9PVnLfHm0SddHCMbb5b20SayHXkywvOQ5sqM3V3AggG1Tja
	yGrdU6tfliwszsRr87EshjFl5uL+It/u//D0vmggqy2ek92ppizeDESDkIujG6J3mxPb5Lhahzz
	PVsGwto+juyHYKnDhan3DzdOHGNarMSHAMFMDkmO4TVKvsT3tZ/uliX9at5pqJ3VFanfTdJPN+B
	2tFbVvCClsW1FklRykLKcyetbZlc/j95wwW+29hCHzyuuvDX0d29nFC7VzWHqtTvXr7Z03H1FOx
	P/9kgSDWKEJtWxYh5FdbkXeu0am4BQesJw2ihrxLDoaRBAFnE1lzQo3/3Kjks5ZENz8Et6P+shR
	cLze3wT
X-Received: by 2002:a05:701b:4284:20b0:163:a197:722d with SMTP id a92af1059eb24-1850cda6b4cmr1715523c88.4.1792188987400;
        Fri, 16 Oct 2026 15:16:27 -0700 (PDT)
Received: from eldorado ([2600:8802:b00:1f84:d294:66ff:fe95:a98e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fc14sm10480863c88.6.2026.10.16.15.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:16:26 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	manuel.lauss@gmail.com
Subject: [PATCH 3/5] watchdog: gpio: Support watchdogs with a minimum heartbeat interval
Date: Fri, 16 Oct 2026 15:16:15 -0700
Message-ID: <20261016221617.2223004-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016221617.2223004-1-f.fainelli@gmail.com>
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Read the optional hw-min-interval-ms property into min_hw_heartbeat_ms so
the watchdog core defers keepalives that would toggle the GPIO too soon.
Reject zero intervals and intervals at or above the hardware margin.
Devices without the property retain their existing behavior.

Remove the arbitrary 65535 ms upper bound on hw_margin_ms as well. There
is no register width to constrain this software interval, and the MTX-1
watchdog needs a larger margin with a 1600 ms minimum ping interval.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/watchdog/gpio_wdt.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
index ff323d6e692e..a431c77fa179 100644
--- a/drivers/watchdog/gpio_wdt.c
+++ b/drivers/watchdog/gpio_wdt.c
@@ -138,10 +138,20 @@ static int gpio_wdt_probe(struct platform_device *pdev)
 	ret = device_property_read_u32(dev, "hw_margin_ms", &hw_margin);
 	if (ret)
 		return ret;
-	/* Disallow values lower than 2 and higher than 65535 ms */
-	if (hw_margin < 2 || hw_margin > 65535)
+	/* The core feeds the watchdog at half the hardware margin. */
+	if (hw_margin < 2)
 		return -EINVAL;
 
+	if (device_property_present(dev, "hw-min-interval-ms")) {
+		ret = device_property_read_u32(dev, "hw-min-interval-ms",
+					      &priv->wdd.min_hw_heartbeat_ms);
+		if (ret)
+			return ret;
+		if (!priv->wdd.min_hw_heartbeat_ms ||
+		    priv->wdd.min_hw_heartbeat_ms >= hw_margin)
+			return -EINVAL;
+	}
+
 	priv->always_running = device_property_read_bool(dev, "always-running");
 
 	watchdog_set_drvdata(&priv->wdd, priv);
-- 
2.53.0

