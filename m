Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2620451C067
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165354; cv=none; b=UBST/WIiN/YAuWEys3R+KH/+r9VVXvpB7DIpz9cwIEPm8+Ya6JQ64vl5PL2DecNREAC5XC6X0a93tOlAgqWSdc0mL22+2fR3c11DSUCbojQ2oNfiF9/qNLk8lf2C7/164OFOM9jsDG0EVcWY5X85iiS2m1KSAqBHUXkl4kT3qko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165354; c=relaxed/simple;
	bh=zk3J/AL6+Z3Ly59Klf2ISnugpy+IF3qjEzcB3g2kr28=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sdZXrYv25o7WGHrGajc0dCRbVmvlFgKKZUyhWkmB4LmFXfoc1EkIe+NVGEHbrkugh/u24xhWuSp/6/NMhuDFNhbZu7zhOTqyIdnRlCqYiVtoSPXDKE/6AAKcfhRNQZru222xGY3qOan4JT0Iq9RqUPLYDWeKGXOkrBJNIPk+bnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClrYcPFk; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClrYcPFk"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3514b90bb89so6385851eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792165351; x=1792770151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2folU0O4bOJirQCG1bT84vwZiHZNPZr+tDe4ocPaDM=;
        b=ClrYcPFkgXXAK4R2h4FZHHDO4rmBKH9B+KM9AqDymgVbbZwd4UERMaU7tXfpQzvwZW
         JZf4KOgant3D9oQhkEAys8FDQYbeTEWqbEbVWM/5B/kLo8Qt/QnJUae9xe2C5zLlyvfO
         VaDmI0S8Z5EpREk4SNHuPqoIHvvEZeKPGBcfqt92oN6yADwntStgOh+g3RD2Hgcv4s60
         G8OLNLwrTLUpxmBNxKu5v4WtgpuRIn6ZkeY4X8BYO/rz2zCjS4adwWUdYgMzYOqaPbqh
         uMINDUYO1OoVS3id8iG0XlzbrkCWR761e2tLJ+tTM8GWzCxYXkUgccgZ94iKHaxr+HmM
         45kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792165351; x=1792770151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2folU0O4bOJirQCG1bT84vwZiHZNPZr+tDe4ocPaDM=;
        b=jyJG0B58KEciyCUfhGOF/Txdpp5wozFgAmd1CncZQlgR7YsM4ePetvmezGXOeSPqwm
         YZv22vl82/rZWjMkQ8FEXje03PJOB6KEaY0CNej3wTI6iYATX/6HfhYbBeSLGtq2JaFH
         DB/BdkoW5r03RVTsPjvBnCf+Wc6I41s2YAFG/a6zxLS6ZJsFeXJGWR/K2JVvSqjvAbBz
         cq3iXn63TAFyPvXGOz31jysiOJnw0z4C51mSxDIvhbAq+805KbOJs8g5XGVb6lQoJVkk
         hu/Yk9HRMvEEOsKurmC+YkhniAee+3MyYeT4fPknu0k+fM/VQy+Q5siMgkvUT0wpIUlc
         7F4g==
X-Forwarded-Encrypted: i=1; AKwUvBzQuu8gbjWO/atuQ8E9AhkA4IaVRhm2AROce9Q0QfG/yjlDXmCAB4gDPTwx/W0IWKs0pAfEb/yrrHkH13E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiZBSwxsCf3D7WO665FZ9mp3c5vL7hiXRzHoRW7qxshAYNspQT
	BNPPWBlVGnuXHVECUoad5g5U0k4TmJ0v3GEoJ6Aj2mV7oaO9kreCKYzq
X-Gm-Gg: AYBFou1Hs5nXzLUzusVbzjV439umgNkXX/WQu+1E4Ob+1iGpw8447qoPcn/fyPpZfLR
	VIVIK9HGUKuqK2hVxp3bexvuuvcSNc64k0vkLXnEe0NxcnGwkloG/d8tY9UHbyZTe+8P5FxjgiD
	D8/rzl2tTd4fkuivALUXXgXCzjdHtV7J5pnCl+alWnWDifF/Xx409/jZ+3BiMJfovPZyagInzd7
	+nj36U/CNoaoNnVMEzXrjme9scm1jfAt5r6biXGn6BicM+DZsgZZTIflDzpWuUtvTHYkxtgmRZ0
	zW+wp5x4rork0dxoWb9ljRSxvEvz6uEbOjkLx0EXSvmCw/7Hra1A1A9p4SPuLqmIHjKrSDj1w9L
	iGG8gNh8eKHDQAKPCopsKtyKFiGdPuQB6TpZwNtsKTuhiooyGytqZmd4kkmDlgymQfNnoXTWqY4
	cNl4u/suqHMUGZA1HN7PTDPoIYugN49sAghcJKrrv/35xyA1ff6ghBsUASWRB70K8DmPM2j/Pm5
	uVWp9RYrDnpvP/R8O1ilkzAMatltdM=
X-Received: by 2002:a05:693c:20cc:10b0:328:3944:ee53 with SMTP id 5a478bee46e88-3619ed11502mr264970eec.2.1792165350843;
        Fri, 16 Oct 2026 08:42:30 -0700 (PDT)
Received: from hp-OMEN-Laptop-15-en0xxx.. ([122.172.84.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082e81a06sm7273806eec.26.2026.10.16.08.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:42:30 -0700 (PDT)
From: Jayaraj Devaraj <jayarajdmit@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jayaraj Devaraj <jayarajdmit@gmail.com>
Subject: [PATCH v2] gpio: lpc32xx: check devm_gpiochip_add_data() return value
Date: Fri, 16 Oct 2026 21:12:09 +0530
Message-Id: <20261016154209.23193-1-jayarajdmit@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lpc32xx_gpio_probe() registers each gpio chip with
devm_gpiochip_add_data() but ignores the return value. If registering
a chip fails, probe still returns 0, so the driver binds with a chip
missing and no error is reported.

Check the return value, print an error naming the failing chip and
return the error code. Chips registered earlier in the loop are devm
managed and are removed automatically on failure.

Signed-off-by: Jayaraj Devaraj <jayarajdmit@gmail.com>
Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
---
v2: use dev_err_probe() as suggested by Bartosz

 drivers/gpio/gpio-lpc32xx.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
index 37fc54fc7385..7fb46262e18c 100644
--- a/drivers/gpio/gpio-lpc32xx.c
+++ b/drivers/gpio/gpio-lpc32xx.c
@@ -510,7 +510,7 @@ static int lpc32xx_of_xlate(struct gpio_chip *gc,
 
 static int lpc32xx_gpio_probe(struct platform_device *pdev)
 {
-	int i;
+	int i, ret;
 	void __iomem *reg_base;
 
 	reg_base = devm_platform_ioremap_resource(pdev, 0);
@@ -524,8 +524,11 @@ static int lpc32xx_gpio_probe(struct platform_device *pdev)
 			lpc32xx_gpiochip[i].chip.of_gpio_n_cells = 3;
 			lpc32xx_gpiochip[i].reg_base = reg_base;
 		}
-		devm_gpiochip_add_data(&pdev->dev, &lpc32xx_gpiochip[i].chip,
-				  &lpc32xx_gpiochip[i]);
+		ret = devm_gpiochip_add_data(&pdev->dev, &lpc32xx_gpiochip[i].chip,
+					     &lpc32xx_gpiochip[i]);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					"failed to register gpio chip %d\n", i);
 	}
 
 	return 0;
-- 
2.34.1

