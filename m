Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3707036F914
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 17:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791652911; cv=none; b=D106DDsvDeuEEeDcPGblCY59NXfi9zfYzVO9n00W6YlS9tRHQQ/Tuq5M4IIXp/ghH/2kKK4lSLj/LTOBh5NuUCgTck+ckgEREsqR7LjRPekwUjkwi55REhvHrVYFgnTk0T7KgfsJ0jqFGONSIeC57DTk3uNryWvEaXlk4gzc7ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791652911; c=relaxed/simple;
	bh=oJsYl1DS5M76Zz/kovmTDYXs0UpltIPB0aKVEPmLvhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KP0fJvw55fDzcKkYGLJsLdRJ9HLYA9v7LjXcLEAYjWIngwL8J4xjXdB6jkNlPioU7EpPvNVpaA1mYsFv/iLQ5GN9NgmUnJs1wWPQU90qlKjjpmBcPepw+avc7KRvCPBuixeOdshKmQMsmJ/23TykXJ3NE4RTZHqd+Gq9pTPGUNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aop+tANs; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aop+tANs"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4956869750eso5306965e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791652908; x=1792257708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TFjLqjpz1OV1iGjbq0FG1a5x3VLRDXIY9kkC816eew=;
        b=aop+tANs+X08VecrR7am2jcVAFozFCafFGzpVsY+aaMAqEwpzXsb0GFijeNPtRza6f
         V3E/6hfGu/Cn6AMXnKhxyGjXeZrXIgWxFfVgtHh1mcESDkR6WzRC0CuxO/fFgwwwDb/D
         ZZFBucNj1GYSkjqyfE9POsup9oZFQ8mDymdzFQh12HhtoXgn3u/66DvtbsoSPS7Kde8A
         m6ue7aRv4yLT3ONM0/wLyvv0BBjh5fy+eSGKOWavR+wHE6PWa6JH5OXNa+QGMUl+ZZqD
         0TDbB0UHfZ4cLXUDoXJ65BA9W5GSnqLNDCgHLR/OQefONaG6MbI2Jtbczt8hG931uUWB
         15+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791652908; x=1792257708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9TFjLqjpz1OV1iGjbq0FG1a5x3VLRDXIY9kkC816eew=;
        b=2tyXdULXMKQJMOZqqsr5EBKr5YzjLRi3ArPJVz0CR80EqHqpU1B/NiVEQB2XlDFHu2
         jiler7cPRZP8r4GXkMv77S7apNAMZTPnF0qsLBp3Cn493giDvGXqiK2Tcq/9HQOabSv9
         Kj0FJ5Ib7IdgkKKZC1cthzunGO8s3CacB2575uLqenu2K1q6Jrf08cHIEOJ4muvwjv1H
         DGg6WjQ0rSqEcN8e8qTicg/0dFaJECogFhUvcF2OidembHIc6TRU+LTQ0sfXzF2z4BNn
         jBiJIW/yhR/soOZ9k15o6QntvOESXEXDSaoVCn78FEEq38Dg1R8jKQLYBzZjLvgCPvHU
         5IrQ==
X-Forwarded-Encrypted: i=1; AKwUvBywMk/3wytU9WNeYmj2vZ7P6PWv8OEbuuyU/oeAphj+iO7uWw9jfQ7B48mLDdo0HPR3IzbS/DZTeDJwoIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTGtwriSwSZ4EsRadqJw2ajJplc18r/1k0wLVAXryfdQQR5K7T
	hyvmFS3vdhwGUGQOioaBlrGqxDE2VgKkRW/NJeyD6fQ2SUVo6s+okgQxf9ydVY22w2U=
X-Gm-Gg: AYBFou3230d4jv4dVce6yr83/+nLpM2FCfHEKOJwpO9oqPOhBpbYzdo6lOQ0TvpA/hz
	ObAajDoI59Gg38WxPbvJEgPMVGQoJodHOHIDXYa3LyvFmUm2V83fEdQqr9SfLQU5rZHUrgTgyPs
	AGBw7kN7W9YHuWcr6f/43Nyq8EG/GRLXKk6POSdB16QGkQkIq7bPivzOrnAW0xzuLZwZpZAS+LR
	VNi38AoMXlizYJ99+HT0Dv9cRvWxLIZaghiL4Y8IuHEwukV5JbP3I4OR/LDFz8KGKk3nBWZGET0
	S8jeLTMqADiCMVbFifS+dw+NlQZrGRf3qAnrdxJvIsgZpGpKYkpOzrtKjd96g+/w8XgnFOeb9fp
	jue5FXodz89LQ87XBo3pWMLjuQLo21vdgSeD8+gIs71nqSwbSTufkBQKZJmTwOj2i9n6CdiVrCH
	Iiwa4welIziWzSmXp4jmoGPQ3uYPhS/AgrzevkxslDA1+0SBikIEeqShcWDjlv5ElcVL+qvK9Ki
	9uyAlhsmVT0xCwDzKtMIzp3qrQIIkkbU8xstpfB3R7e4Mf1IQ4vOjOEyKTjEqCL1XsQjbD7GJMg
	ogor5uRRfdJF5oKS
X-Received: by 2002:a05:600c:6207:b0:49f:ff73:9971 with SMTP id 5b1f17b1804b1-4a18e4aff66mr96959555e9.18.1791652908208;
        Sat, 10 Oct 2026 10:21:48 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c85009csm114159655e9.2.2026.10.10.10.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 10:21:47 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@openwrt.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 3/3] MIPS: Octeon: flash: use the simple map accessors without a shared eMMC
Date: Sat, 10 Oct 2026 17:21:42 +0000
Message-ID: <20261010172142.2138956-4-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010172142.2138956-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CAVIUM_OCTEON_SOC selects MTD_COMPLEX_MAPPINGS, and since
commit 8c1e6b14e27d ("MIPS: OCTEON: Protect accesses to bootbus flash
with octeon_bootbus_sem.") the flash map accessors take the semaphore
around every access. Its only other user is the eMMC host of the older
parts ("cavium,octeon-6130-mmc" in drivers/mmc/host/cavium-octeon.c),
which shares the boot bus; the CIU3 parts serialize their eMMC with a
lock of their own.

On boards without that host the semaphore guards nothing, but the
custom accessors make the map non-simple, so MTD will not let jffs2
point at it and its mount copies every used eraseblock. Use
simple_map_init() there. The test is for the node, not the driver, so
a disabled mmc node keeps the semaphore.

simple_map_init() BUG()s on an unsupported bank width; the old code
warned and then hit the BUG() in the inline map accessors on the first
probe command. Check the width first and fail the probe instead, and
unmap the window when the probe fails.

On an Octeon CN6635 board (no eMMC) with a 100 MB jffs2 partition on
an 8-bit NOR the mount drops from 15-30 s to under 1 s together with
point() support in cfi_cmdset_0002.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
 arch/mips/cavium-octeon/flash_setup.c | 37 +++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
index 9242521..a616e7a 100644
--- a/arch/mips/cavium-octeon/flash_setup.c
+++ b/arch/mips/cavium-octeon/flash_setup.c
@@ -63,6 +63,17 @@ static void octeon_flash_map_copy_to(struct map_info *map, unsigned long to,
 	up(&octeon_bootbus_sem);
 }
 
+static bool octeon_flash_bus_shared(void)
+{
+	struct device_node *np;
+	bool shared;
+
+	np = of_find_compatible_node(NULL, NULL, "cavium,octeon-6130-mmc");
+	shared = !!np;
+	of_node_put(np);
+	return shared;
+}
+
 /*
  * Module/ driver initialization.
  *
@@ -102,11 +113,26 @@ static int octeon_flash_probe(struct platform_device *pdev)
 		flash_map.virt = ioremap(flash_map.phys, flash_map.size);
 		pr_notice("Bootbus flash: Setting flash for %luMB flash at "
 			  "0x%08llx\n", flash_map.size >> 20, flash_map.phys);
-		WARN_ON(!map_bankwidth_supported(flash_map.bankwidth));
-		flash_map.read = octeon_flash_map_read;
-		flash_map.write = octeon_flash_map_write;
-		flash_map.copy_from = octeon_flash_map_copy_from;
-		flash_map.copy_to = octeon_flash_map_copy_to;
+		if (!map_bankwidth_supported(flash_map.bankwidth)) {
+			pr_err("Unsupported flash bank width %d\n",
+			       flash_map.bankwidth);
+			iounmap(flash_map.virt);
+			return -EINVAL;
+		}
+		/*
+		 * The boot bus semaphore only serializes the flash against
+		 * an eMMC host that shares the bus (the CIU3 parts have
+		 * their own). Without one, use the simple accessors: they
+		 * let MTD point at the flash, so jffs2 scans it in place.
+		 */
+		if (octeon_flash_bus_shared()) {
+			flash_map.read = octeon_flash_map_read;
+			flash_map.write = octeon_flash_map_write;
+			flash_map.copy_from = octeon_flash_map_copy_from;
+			flash_map.copy_to = octeon_flash_map_copy_to;
+		} else {
+			simple_map_init(&flash_map);
+		}
 		mymtd = do_map_probe("cfi_probe", &flash_map);
 		if (mymtd) {
 			mymtd->owner = THIS_MODULE;
@@ -114,6 +140,7 @@ static int octeon_flash_probe(struct platform_device *pdev)
 						  NULL, NULL, 0);
 		} else {
 			pr_err("Failed to register MTD device for flash\n");
+			iounmap(flash_map.virt);
 		}
 	}
 	return 0;
-- 
2.53.0

