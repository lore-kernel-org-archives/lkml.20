Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCA1418365
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376432; cv=none; b=QlTCgvWUU5AGgUygB6SEmcLNki9KD4sLE0Bavj5Y1JHSd++265t7pHJtVAoPSixtDBQblrpVrfKQ4q7gCL9aUYxCuGsNktSQ4XZWsM+5JSgAkWAJwb2ybfcQLL+WnP1tl03Gk/xVjd8J6a4+294OgEJy9kimvWKaxH6V6sxkhFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376432; c=relaxed/simple;
	bh=DHUqtTYkrYqLybqCJbNT+5Z0TBOUvJuXNKgM8+nOZTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqyfKQERvHbMloBRkMGnIVDcoxKyZW06iabI0oO3qb1N4a6T3XkMB2uJLWLvSrDTAfAxQs1WxGM1Nv3ktOSKPyz8WaVxAdNZ3HhxCRK6smPQjkAYKgFincaDBY9zFAZ981NzbH5nM1ktoLva6meCjHfm9i3DPg0crEsmBkVdcDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFovcJpN; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFovcJpN"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so740346f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376424; x=1789981224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JgEITP5zYNHD7Hd4jE+xDuU4E1MB+W23iELVzvgQk0c=;
        b=gFovcJpN+hkqd7uP774xLXZj8ptFzEq47bqOzVUqy0FvBK8bmjupe9YIJAXms51olg
         x68QzK37tkWjhxAoDV3uEppZu3SiNsY2ulYygqhAuRZ4i2yW9f5qlj/rUawKgv7McPuS
         Y9Tk/YSY/LlLZd6oBqPMjFmP8JIZlD/LUza1vJhTGpbPXT0a8E0OObgnZOYinG/NjVFt
         Iio3cB/n0CEuVrpQTV7tbV5g7DWz8xNHpXOa6sQyFDZDCsaq7E5g+caADuqF188Sszy+
         U+1zaOxLUe1VIPDMoNAppmAR4OO3R5YgnU9brXNgYG32U/mpgHL2NIZ3JUA87ile3bTJ
         5txA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376424; x=1789981224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JgEITP5zYNHD7Hd4jE+xDuU4E1MB+W23iELVzvgQk0c=;
        b=VIhTEtko4CwClNHLFKIsNvrkau2lHwZ99Sjhd9/nL5MtwmFkpzyBS3wNSDBSp8D20a
         12/Jl1PzDdqY5V2KiM2Ib+TaXWrxhArcNlx/Y6M1XHk7GwfAGQbuon4Pkj2gWi3vL1vo
         vkvszhKerO9cZ5tWybh8qq5q1g/xYVpoEx/4FTMfP/Ojcn3N2bLcR5bgaHhP0KW0QRui
         BsJAEahFmO1EjqNibUDCWxKZmfg3DD8UubopMd7D9ZsghklWpMj/RZ6VMmywK4eUov2S
         evsyicMuU5yrnviFb5j93iTNY4KpV98H1JSDMuKUFITXn8jQVeuEyZ5Hhp6fguNEzA9W
         QA3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxA5hM3QRsy+QcaKAhL/ToAMVDjg3Ql8fsenIzvolzq/VDwwdtfGhUAs9DEdfRoJuC+hFykN7tZpu9Cjeo=@vger.kernel.org
X-Gm-Message-State: AFuF++mtYqNg89bnURxBokFOVNnCbE1AayqGX/JTqL2JLSNmnUDsM59o
	Xp/KHXV6BHeNrq9kGhMlfJD4/j84gdZxEGEYmku16WwWQFTPeTFxXiH0
X-Gm-Gg: AYBFou3n+Jwdxcq/coMWH7aGR3GJrTl2u0xp8b0dcZ6+NTofMg9DbKDGUzc3B+iOHdc
	WwCXLzruJVn4VENkejAsPa5HgIs8X04q0+sCtudQBYImWeX8YtbYFwqYOY3GQOCH/a8zz4H62Gq
	nE7zHZVzf48nvVID+82XqdRR9yRoq/kXEsv7fQA4AOIMNx7QNPwm0ECrPH9BK7+mibZXAmX1XSd
	2kkkBKOepagXlrs3DDXk/5O3YDiZonwy4rBwPXIly5ympbCskpgj7TM5EH7qwDbYTPRmBTa73ma
	O6RrEHuohYicAJoD0rzb2rSnilbWZszy8cpfvrOM/UDg3BorPM/aBQHMejynkAeYNgoREBpp31M
	tHzjoUq2EKmd6yF4YrwCb/U1FYD3YdIc7V2844/jbrZOCK0Ys419X8A9itSfDKC9GZOVDlM7QHC
	HdxwtmJ2km4vBgHqm6aWEQtKlcMmBsSc2b1z9rf/A6amZ5qYSEobhrHXNzzCS3pwYo0OlNI3Aio
	Hz0KzRMapqi
X-Received: by 2002:a05:6000:41da:b0:485:ac0e:6fa6 with SMTP id ffacd0b85a97d-48702ab93bdmr1778531f8f.14.1789376424193;
        Mon, 14 Sep 2026 02:00:24 -0700 (PDT)
Received: from anthony.local ([2a06:c701:9cc4:c200:33d8:8ea2:e077:ebe1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm25245851f8f.9.2026.09.14.02.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:00:23 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andriy.shevchenko@intel.com,
	holofermes@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	amit.barzilai22@gmail.com
Subject: [PATCH v6 4/6] drm/ssd130x: Replace positional ssd130x_spi_id[] initialization with C99
Date: Mon, 14 Sep 2026 11:59:29 +0300
Message-ID: <20260914085931.66857-5-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914085931.66857-1-amit.barzilai22@gmail.com>
References: <20260914085931.66857-1-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ssd130x_spi_id[] is initialized with positional initializers, which
easily create easy-to-miss bugs when changing the members of the target
struct (struct spi_device_id in this example).

Change this to C99 initializers to guarantee each member is initialized
with the correct value.

Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/solomon/ssd130x-spi.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x-spi.c b/drivers/gpu/drm/solomon/ssd130x-spi.c
index b52f5fd592a1..be50e5aa2c87 100644
--- a/drivers/gpu/drm/solomon/ssd130x-spi.c
+++ b/drivers/gpu/drm/solomon/ssd130x-spi.c
@@ -160,17 +160,17 @@ MODULE_DEVICE_TABLE(of, ssd130x_of_match);
  */
 static const struct spi_device_id ssd130x_spi_id[] = {
 	/* ssd130x family */
-	{ "sh1106",  SH1106_ID },
-	{ "ssd1305", SSD1305_ID },
-	{ "ssd1306", SSD1306_ID },
-	{ "ssd1307", SSD1307_ID },
-	{ "ssd1309", SSD1309_ID },
+	{ .name = "sh1106", .driver_data = SH1106_ID },
+	{ .name = "ssd1305", .driver_data = SSD1305_ID },
+	{ .name = "ssd1306", .driver_data = SSD1306_ID },
+	{ .name = "ssd1307", .driver_data = SSD1307_ID },
+	{ .name = "ssd1309", .driver_data = SSD1309_ID },
 	/* ssd132x family */
-	{ "ssd1322", SSD1322_ID },
-	{ "ssd1325", SSD1325_ID },
-	{ "ssd1327", SSD1327_ID },
+	{ .name = "ssd1322", .driver_data = SSD1322_ID },
+	{ .name = "ssd1325", .driver_data = SSD1325_ID },
+	{ .name = "ssd1327", .driver_data = SSD1327_ID },
 	/* ssd133x family */
-	{ "ssd1331", SSD1331_ID },
+	{ .name = "ssd1331", .driver_data = SSD1331_ID },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, ssd130x_spi_id);
-- 
2.55.0

