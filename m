Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D22E3264DD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404863; cv=none; b=IkgObmwA2g7AfCxLGQoTgdklIJOkfmdFHczPC4+/huEI4yVm8l5J24/O751fcd9jpKgVJkFJkeDVGK3LF4oW10qY9RrL2RRctCn+8EMuxGHsMAXYM6JlZhuhq0TWkIugX+1TbR3ggEyeNcezpWcgRU+M2hcKmsN6ivUBZ3JhFSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404863; c=relaxed/simple;
	bh=OwY4526r8NGD41XWfHtfgvXiOTOjUHxMAUau6BxnM24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bdi7C0NJYWyqjJ3G8GxZoQwL29CKCncSgDKbO+jllkAJUNAztcSYIDAXuO4tn+aBH/EaD4NyvE/rKcBUrom7gAzP1ZNrnsVbZUFDwaiN7HpDN1vEzbgt/WJe6M2YzVJrajuwjITjvnfdgb5UHNfKsVy5O6y46rjeTyd2yuK/H/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llycUH1B; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llycUH1B"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d71ae3455aso26964905ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788404862; x=1789009662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eY3y8kerfRWmrbbQj01Vx2Al4+dxXYV6MW1wD432koI=;
        b=llycUH1BJ0+H9IcgpXEdPyRAmtKgQfysEGSK4fXklnszKPMZkOLFACclMhQzl8NXAC
         UsK8Hb5AyKute08DYc2E2N4wp9i1TtAUMP4ZTRbYiqtYpr0yi3BP2fX2kBoP8bfzFW0S
         3KN9xIv062tfq7MnIo5gq2GMhlPqQugK85bX5+6L1s34MyQ9JfxMZ6rlMtpvT2I1eKXi
         8uh7Nvnqb15fsQ9BIBzAfwFW1OJJsEkPnd+lFmf6LogOdcJDPYAPcbewsE4CV9BRUzTR
         9SL/7dCOWhZZUtYUgx89xODgtd1quz5KgkguPuy8KTwXBGYE+H0BjepwUdtZTpGJLc4v
         StJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404862; x=1789009662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eY3y8kerfRWmrbbQj01Vx2Al4+dxXYV6MW1wD432koI=;
        b=qF39wrbs6l4aDVMb1q0U6Vgdl6SUWutCnGhBrCcGbKc99IzuqeAgN9A36vMTr4OfzU
         5e5NmM2t9h0C1mUAQHLy1zgkD6pz/AeWNIzyTkUUy+dvmCKncn/tmVSEAtG5t1IBhlMZ
         J1VkSMWUtSSXBpntFV0uEu9R8ekdhPgG+jL38jNJdAB1DeCRjYCaiIdLxIlApJzugIK0
         c7bbsgSdeNmFVW6Nj1VwzO6g6kmoGd03fIoSnj8iXCh0isEh+sXDF9+VF2nr6xgRZexM
         iPdgWu3F5zZnPvwfivJf8JyOCTTwveAaZtzp/NVNykHr7MCDd01i6RBYGiDYS6WFo5ZV
         lPTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSIh2ME0C2MMnHUuxssrXTaM4v8RZTlSHPRRYy4nDxUxqh6JGzcvZ8aGlwZzMLiow1nFkut+3z1fQJrgM=@vger.kernel.org
X-Gm-Message-State: AFuF++k9M1kRpDj2qVQjj5bM9r/5Dd8w2iPwdbkppJfz6drsldBulPdp
	DFcY8CrLWQWRsViF6EikuDe1QTdh12wRAavVWAgJACaV/lDctF+gn6092tofnA==
X-Gm-Gg: AYBFou2B1cXxvZIUin3wKIaVVlDNP22zCFcqWmm/IYPGBqwRWijcltcibKvP9AbQkJt
	gdd74X8JPjZ/NHphaPiEYezgRJnFKE1H6E0t4NUfG/ZkhG8A2KbDAyE4YVJnExxgDMNVOfXRZZD
	VOA8n5qZgqQokTUCKSl81JRBUIKRCD1D8ILA1UHCFoFgGXV1TIr+Z+u16BZkCD6yfHCZrwkhlBE
	NX5hZDqSc1nHw17QJZ7Tt1OoZ6fO1cLGsgvEB6IiOij3gHuhjXyewfC5HJRiuRG/r2CwS9+Jxeu
	5qt9LBcY8BxtJe+AybTa6PAVZkYcR73+slTzVa5BXFzaocHIx2Bp/s2zCp0Xs9MQP/gtImjxsvg
	WMx73xX+fPfl5o5ny29F65i4jnFqwxR6sTEbDK24axOI7rWtK5GGn8OR36wwXBB0IMBfN1CMqd7
	kz3qWf/QJFuVnS115FcBsnjp5M4j6ahgBE6yv+fQb3UTgt4Vt6hE5IjSqG681/oqh+aDvZ6QwKK
	8JkNa42gDNdn0PJmggTZmE/5Gd2FTc3obD92pXzrQgg7n9IKPeQVo5hURToG6All3FRQ0bDuebo
	TyQe
X-Received: by 2002:a17:903:32d1:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2daec5df7f9mr112667475ad.3.1788404861588;
        Wed, 02 Sep 2026 20:07:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe928217sm2872135ad.37.2026.09.02.20.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:07:41 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Adrian Ng <adrianhoyin.ng@altera.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bui duc phuc <phucduc.bui@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] gpio: altera: Fix build failure caused by undeclared 'irq'
Date: Thu,  3 Sep 2026 10:07:00 +0700
Message-ID: <20260903030700.132068-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use 'mapped_irq' instead of the undefined 'irq' variable in
altera_gpio_probe().

The incorrect variable name causes the driver to fail to build with
an 'irq' undeclared error.

Fixes: 6e6e585b603e4 ("gpio: altera: Handle errors from optional IRQ lookup")
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/all/apgNYDiSiPmNZspF@sirena.org.uk/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/gpio/gpio-altera.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index d22f5be00745..a6ac9356229c 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -221,8 +221,8 @@ static int altera_gpio_probe(struct platform_device *pdev)
 
 	mapped_irq = platform_get_irq_optional(pdev, 0);
 	if (mapped_irq < 0) {
-		if (irq != -ENXIO)
-			return irq;
+		if (mapped_irq != -ENXIO)
+			return mapped_irq;
 		goto skip_irq;
 	}
 
-- 
2.43.0

