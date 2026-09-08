Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C941854CF5E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889673; cv=none; b=R4lqegljimhGAyzYM+/r1lJKSpaos9jPkw/aDlpagY4AjS4jeBT7zG9VpuLMdZtN7qtEnnJVvAM9NVuSPGVC9SZnP+lVuX1mdiA52kjrw3ZdkZ4ANi32sZ+MHBrxYrL++rlqVel2Pf93NVRPK6iDWffelB8TeBCf7nxh3wjvf14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889673; c=relaxed/simple;
	bh=dUQc7PWrbX8uAQtdC+UYHtMhjF0PHNUBZJYOmbunHLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RdRvBjzf8+tN8dwm9AJZD+SAIv67ZzWpnIBkGc1gc/aeDfpvty0tqBh8kkiH1nCEGvy7NC/ON3/RTVGUzo2m+XYBY9C7EOuDgZ9LGkD5dcgrtjO8XXcu5CnmqRjZ8Tb3jH+UzN92RLeS/w7VyhmHUsib6HNTJquFkmhdQm1H5Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hXx6L928; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pNmM6S+l; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hXx6L928";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pNmM6S+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788889670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=luyNT9P1mkrzQIhc+xUVIxx4p4MwhVi8AIPUHPOm+So=;
	b=hXx6L928wMvRxnvyQFXaKA8FLUcC6mk/ikak3pAYTShW/P+9U2dU/UjZxr2oSlXgk2vtlU
	p1vmXSxhxJ6boVPhn6cBLN/TsTCJ494tSOoOoHfTq1GBUUF7RZLE9rcTG0JIusKrQRs2MC
	mNR2IPvP+v+eZXKjlOaJH1bhvBhCenI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-GIQBOAKqOheQ3K89dxJS_Q-1; Tue, 08 Sep 2026 13:47:49 -0400
X-MC-Unique: GIQBOAKqOheQ3K89dxJS_Q-1
X-Mimecast-MFC-AGG-ID: GIQBOAKqOheQ3K89dxJS_Q_1788889669
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93903982af1so1023642885a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788889669; x=1789494469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=luyNT9P1mkrzQIhc+xUVIxx4p4MwhVi8AIPUHPOm+So=;
        b=pNmM6S+lWnzLOabIrfOUDsGtHlLfzHedNz672OW8oiBuGCXzqVaXDCSNLjZ353pKZU
         HT3Pg+zrDq+dvJ73Z+139DuHt8Hkctv59Z8tCIaTtEps/kvG/fDrt3xEosHok2gylxM4
         aQBhuWlYkgGuYKIx1eyRZKfhobbJrE3TVWBGVTbHpC7Ka+ATN6+GsepPLG+PbiOTMKT9
         XtsaoFXy3OM5CaBcrNGw252Pmn5Fj/ITc4X4qxVFrOL6zsHxthSEeZK/bjeZVf4MBv/2
         7JA96V6McoL7ysc5bmQ7uJqZ30Ze/xUGYPsdu3+s08GEKDY8m45VWh3btVqlqQQKjWlN
         sEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889669; x=1789494469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=luyNT9P1mkrzQIhc+xUVIxx4p4MwhVi8AIPUHPOm+So=;
        b=Jif/0BEai1nWvAfUPzHqu9be+1j0YLv2g/abeiTCIH/g+BePDpcvDTC2DZgf9M7VIt
         RhQYPYZ6EGgJTfgzDA5nQUmxeZqfNo1L4D/dBroBKbnIX4cQenzCggvhzumHhMIhC4M8
         HdqQRD0yqvBpDIkPmxtAZLyJNws8pxTprcGzszryzgVCHjXLEKNbozjNSZVCxfz2cC/o
         IYsMq8z7FFaDudUp8Nz0ZKofM82x6rdJwIXUZGw6NQUM/0iI4iHvlLaW5v3F/TnrhaKx
         vKQkuoDXaar0OrtbrtdJPdxNmotXzLWnXDNFZho0FNUnxoDNuOgYuD4kyY4X6zbZJ+Na
         hjog==
X-Forwarded-Encrypted: i=1; AKwUvBy6EJ8E8pPDFg0FToTXLJYu+rRLOjTyQeHe8boRXgFUouJesIOhLhzX76nBL84uPnN+otbJV9PhhnJyYYM=@vger.kernel.org
X-Gm-Message-State: AFuF++mxc/og221/vKN2vtVsQTSYhHQtCjzRpjEO4LEppIDtV2ATtoI1
	sbL9Ft9tAVZ0uzerun9ck+ZyupL2WSJthnTJdlr3kKIZ5DTo90ipRHYPFqFaK5kudWgO5GTICAN
	tDbisTFMGPFdhEHPBC3LOIrzcfyiVcrpzUweYrjSq6KAenWi0mMcNzIRFJzXR/aUjLQ==
X-Gm-Gg: AYBFou3/oZoJkdTZ39TzzjzrA1csKhSGWD0H+W3UhS/BBb+8nTwMmjZNU1BfyYT/EO5
	7DgDpvOc0yt9JfiLTzbKH9D6LGPlcVTe9Gm4mCqKDxT87MoTA9KodW/a+0j1JUa4DxYQRxNKoUS
	EJYAAIg2HTNKIdKoTNo74g/cWknCNUw6HL69bsAA9S+T1haAx91c1pPS9t1yuFQLwaHeehsq7DX
	ZbUDHkqvjJe5zZkTKNzh+Zj6HsgR9PieMuqrpUzGEA5cuqzmvEVy4ScD6G1diOcpj4sk/pwCj8Z
	CCH83jqGeJ8+N9uDULoT1LHExsCGIT59roz3TBDEuSEvFkBd+EpS135LECPXs7vU8PfLl6+9fSY
	kAmqMhSspNZucaf5MOWiPXEuif3mcV8ZcWAKcv9g=
X-Received: by 2002:a05:620a:25d4:b0:939:6df9:1996 with SMTP id af79cd13be357-9398077453bmr3211076385a.50.1788889668986;
        Tue, 08 Sep 2026 10:47:48 -0700 (PDT)
X-Received: by 2002:a05:620a:25d4:b0:939:6df9:1996 with SMTP id af79cd13be357-9398077453bmr3211071485a.50.1788889668513;
        Tue, 08 Sep 2026 10:47:48 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb9bac1sm1194093685a.35.2026.09.08.10.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:47:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 08 Sep 2026 13:47:19 -0400
Subject: [PATCH 2/4] driver: core: platform: add subsys_platform_driver()
 macro
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2845; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=dUQc7PWrbX8uAQtdC+UYHtMhjF0PHNUBZJYOmbunHLw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIWeNlGl8x1q7io6bY7/Mr1m+sOs8htXTHDgn3Xkynhp
 n13mGK3dJSwMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjARrxWMDNOmXTSv84h+H5Nc
 x6l2bu1a9Z2zF+xt8P8V/vrSApf3xw8xfPd1q/34Y86hFX6zHQTmaxTZqMWemJR+mlll0c+Ol8e
 FWAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add a new macro subsys_platform_driver() to eliminate some boilerplate
code in drivers that need to register earlier in the boot at the
subsys_initcall level.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-8
---
 include/linux/platform_device.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 3d5bbcbae730..3bd0f1f0d870 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -344,6 +344,19 @@ static inline void platform_set_drvdata(struct platform_device *pdev,
 #define builtin_platform_driver(__platform_driver) \
 	builtin_driver(__platform_driver, platform_driver_register)
 
+/*
+ * subsys_platform_driver() - Helper macro for drivers that don't do anything
+ * special in module init/exit but need to register earlier, at
+ * subsys_initcall level, when built in.  This eliminates a lot of
+ * boilerplate.  Each driver may only use this macro once, and calling it
+ * replaces module_init() and module_exit().  This is meant to be a parallel
+ * of module_platform_driver() above, but with the init call promoted to
+ * subsys_initcall() so built-in providers are available earlier during boot.
+ */
+#define subsys_platform_driver(__platform_driver) \
+	subsys_driver(__platform_driver, platform_driver_register, \
+			platform_driver_unregister)
+
 /* module_platform_driver_probe() - Helper macro for drivers that don't do
  * anything special in module init/exit.  This eliminates a lot of
  * boilerplate.  Each module may only use this macro once, and
@@ -376,6 +389,23 @@ static int __init __platform_driver##_init(void) \
 } \
 device_initcall(__platform_driver##_init); \
 
+/*
+ * subsys_platform_driver_probe() - Helper macro for drivers that don't do
+ * anything special in device init and have no exit, but need to register
+ * earlier, at subsys_initcall level.  This eliminates some boilerplate.  Each
+ * driver may only use this macro once, and using it replaces subsys_initcall.
+ * This is meant to be a parallel of builtin_platform_driver_probe above, but
+ * with the init call promoted to subsys_initcall so the provider is available
+ * earlier during boot.
+ */
+#define subsys_platform_driver_probe(__platform_driver, __platform_probe) \
+static int __init __platform_driver##_init(void) \
+{ \
+	return platform_driver_probe(&(__platform_driver), \
+				     __platform_probe);    \
+} \
+subsys_initcall(__platform_driver##_init) \
+
 #define platform_create_bundle(driver, probe, res, n_res, data, size) \
 	__platform_create_bundle(driver, probe, res, n_res, data, size, THIS_MODULE, KBUILD_MODNAME)
 extern struct platform_device *__platform_create_bundle(

-- 
2.55.0

