Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810610;
	b=bggKlOxenHfG/S7yMA5s3rweKkOGM4d+NEnDIXrFIVXmAHgqVZUyjjrgbQgpxenw5JiY
	 sBtpNPSOs3RQXhSY4a4rh8l94kxvBs9WrwSz8G5t6yZfQCt7Maik0VWWfoes9C/D03vg4
	 EIAufV/n6ABG5RUcpU2QfKH0gP1gnaimKTjUIaZy8IPqv5BO41UoSJrsEDSrc/+l8YpYy
	 wJSdQfzh3ucMK30rhWt7rr8Tyg3+CS7cjegyMzOwdqv8XxLfkJ/Lua+xnT50eTLcNuI3n
	 UJ898hrAwW3pyENwElgPi9IdGFRU5JoMLTEDhEq4ewidzhLBOKxudR//0WkPdJQgJtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sNo5qhtsBv7Y9DGF9dmvBQzqD4m+n2CIICREnklMfow=;
	b=FkoZyjR/QKwNLtwVqN/LAUhO1bN57vPY60yDd4INvIzXnepuESAKKiqfcGpj1swom+kH
	 NCHEX8mb825l0Ict02woEkcKIFYYCouvG/gIugX/xZGa6qpZOAumrCtzgJjpCKzoyHFIL
	 OWzPTRG3FprbBg7ypu6QSAW2K29cbGmfKYpV69IxbfBsopY4m1Iw6+aQUn8PedWpyc/Cb
	 MW4H/wXKkQe2RBooHvApgwahkyUu4ri2JrLxbKCrfNpYNZEc3osERqk/UcwJNKpde1fRn
	 VpQQ+m86tWDoqNRFwrjih/7i/O0Al6s8AWt+xBlJAZZJtelYEzKgrzAYPm8MEsbe60Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I/n1oj45";
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60276606A884
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60276606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I/n1oj45
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-717080a2d50so3388436eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810609; x=1795415409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNo5qhtsBv7Y9DGF9dmvBQzqD4m+n2CIICREnklMfow=;
        b=I/n1oj45+Wbu2/CCydy47XRonc/D0mOVpN+GHhq63+Bx6rWT0U3GbpKQKOJgVmpOVc
         EQ82QytuKVgMjJ90d9pdfZxa1tYwrc8UNa9DadEg6QutGSkJGQV1+BpJxIdAyOTvJJKt
         5OtiN4frXNejAMGLmBjgGlmXM1nZeE5sKaxQXPy9n6Q1hp6k3dwd09lZABtYqutAPDlN
         gNpSM41h/L4BYnUQj1jPWm0k0CZpaz9HAVR/BqnsROCOrNmHliU9wMpHafYEfECTl5wu
         o+uGZBEVZ4LTtohzevAl4THKK29nL6YQm2II19PRt7PNwv97/nWUHNS2swaly/BY+/R+
         h1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810609; x=1795415409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNo5qhtsBv7Y9DGF9dmvBQzqD4m+n2CIICREnklMfow=;
        b=E7U5NrvxOyjIswZWUZDLmReOx3ZJXpknSd9fK915bits/MAUGgYyYMwaKbZRDYjULK
         qXvtVhPJnpaS8TeJ6e08wJ9NE5XlzuYc+UW0+hIIitV/9g/aIOyLF66WaTgz1myn2FtX
         Imn09I+yy2Q1UYgH4iEjV8vhY1GM8zMaBMGfpV8z3la2PwmR0AE7tjmUg4FNpwAcvIm6
         10HTDnYKCr/DOC7hxS+Uzb2W5uvhqYCPzGKNWiTdZtSwirCOcaeY8b14a0St2FkPLYUK
         WYe9fY9SkY+T1ueFWMHfqmu5HdFArF5dTu2hRZCDPKbvuksuIdes2EEPImTZUiXVmky/
         SKVg==
X-Forwarded-Encrypted: i=1; AL+hErFW656xXHoL97oVsVtoitGvUGjhVluG4fW2HKCYDUseSaD4AyhltOqBgT/lecgSImILJRKA53wXRKdimag=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EYaFEAHvl6sXDM5G7Yk6EyT4IbPWbfSvhS+KfRx2EoA0gjTqk
	fhLFneAAJ4fxJeJocmO4w/Wzih9ZbVom0iSbn5Y4rzujsgx/W60v2JzO
X-Gm-Gg: AYBFou0MOKxArhEuwUlpUVBUyYe9501O3f6DFJQym6Y/1P9K3fGMrMUy4ZiP1EMogpN
	YCrxQM/9JG7wd/lpEcfSh/KlIDpAso9i5QrHXeYV8uz9rszwgWR/nkyxib6XEcaL0JhR+WQR35g
	EPLJIVyGR6czUFGFqOccj9utti7G0aeZHCHSZyvYVBclAgCmaW2qjc9IxNilh0r9LeulGGK13Gm
	sTAOWJ9hft6tktdWi+jGsnSuI6lNvLQYgjG8XONIEYd8J3B/BT8zC8YG72InexY1EnSFL83voKa
	S0ZqQMfapHIh3ZMP0vuVXM7DW3iFBGztK6QfUszG7l1xftUWM3cNQI0TJN/ZCC1UCZ0fkX89Slt
	1kak8/vRdxPVDd56vnSteAarv841JF8Y7qvYKIwrCM5mbRU2ys6h3CQnH0+VLPu6W14mUbrozyP
	2SL3HETyue9fou81jWjxitaArQFqGY/5S9V+VGS+3h2lMCrEUXXgUK5+ko0W0yR9dXNNvALSmsU
	OgxJkaffCwSd5Be/yUMKYBZaINFzr/25aDS0t3A4XYnZ3a083Yr4isNdFtJo4MD61BUFT15uVWB
	sqZxogxVAEW9PC1psgWTcrv42VdqUv/2CeOSCyOJtScV2hthRjvMVAsjO3E51PSyFrkAfUc4zE1
	fy2YehWUpDIK/ZTaRAX19+wnFs4yHSxH8lChwr1iZHX9Lc6PUI9zHUcYcnw4lKLXh9lNNv9wjAn
	cyWr5aYlLfJ43jiOM7AbPv5A0vBUnlQj4doekvXaZcRbDlDc/6D/4=
X-Received: by 2002:a05:6820:571b:20b0:719:1803:3132 with SMTP id 006d021491bc7-71ab4f5e0a6mr4315836eaf.36.1794810609420;
        Sun, 15 Nov 2026 22:30:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:35 -0700
Subject: [PATCH v5 20/58] mtd: rawnand: socrates: retain open-handle state
 on removal
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-20-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Drain operations before unmapping the FPGA registers.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 1b578193af3b ("[MTD] [NAND] Add support for NAND on the Socrates board")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/socrates_nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/socrates_nand.c b/drivers/mtd/nand/raw/socrates_nand.c
index 91d4394c1137..5b9b99bc1b38 100644
--- a/drivers/mtd/nand/raw/socrates_nand.c
+++ b/drivers/mtd/nand/raw/socrates_nand.c
@@ -142,9 +142,12 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&ofdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	res = devm_nand_controller_init(&ofdev->dev, &host->controller, host);
+	if (res)
+		return res;
 
 	host->io_base = of_iomap(ofdev->dev.of_node, 0);
 	if (host->io_base == NULL) {
@@ -156,7 +159,6 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	mtd = nand_to_mtd(nand_chip);
 	host->dev = &ofdev->dev;
 
-	nand_controller_init(&host->controller);
 	host->controller.ops = &socrates_ops;
 	nand_chip->controller = &host->controller;
 
@@ -188,11 +190,17 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	if (res)
 		goto out;
 
+	res = nand_set_lifetime(nand_chip, NULL);
+	if (res) {
+		nand_cleanup(nand_chip);
+		goto out;
+	}
 	res = mtd_device_register(mtd, NULL, 0);
 	if (!res)
 		return res;
 
-	nand_cleanup(nand_chip);
+	nand_disconnect(nand_chip);
+	mtd_put_master(mtd);
 
 out:
 	iounmap(host->io_base);
@@ -210,9 +218,10 @@ static void socrates_nand_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(host->io_base);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id socrates_nand_match[] =

-- 
2.53.0

