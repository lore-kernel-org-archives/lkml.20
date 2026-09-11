Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4CD44F579
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125499; cv=none; b=RyrQoi6r8TZTpsvn89XKwwEgxw0xOkTplXzpYt07PET+Vjq9PN03B7ZPcgzaRI7yZOgxCvCq4HYVtFPUabcFiazKJBHcLpKyjJMuzGvA81X+xOeHzGi08FBM4l2duEu87a1xzYJXha+bHvPkZJUX2beeBDnkduhRwKT41w4Fwo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125499; c=relaxed/simple;
	bh=poHAk1iRSPkkWec7SAiFOpPgNT8Qb8coRxeZh15oi9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGs0N2slozew82zEAi/TqSMtUPVrbLYpmP7zTiXdb67iS9C9CHHMiWP9PtWTMYNBuw9H/aQODykF11G/XDEPMZSIJCLU35f2fhtBPnfLpKfmOpSeG5AC7SaI3ozPR96RO4a+UUuWofsgLlnPOufntpojqnMP4kD1aWUSknYJ1H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6HveQpq; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6HveQpq"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-486e70f2457so363872f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125468; x=1789730268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfnV8b6AfEbN3w+t4mx2Du5Ole8Wgoa6AgZfitPXjMg=;
        b=Q6HveQpqJH0GGeri5qaeS1Zegh/Rg8a5oqcldnM7NHkB/YE6sK/c8zO3kBdc7/HD5l
         nglevh2+glLXKTQkg7FoGg7h5dy19g/ReTCjjUlB/T65yDe/IMuctxwa3K5G2MRzEEkU
         QRVvdmZQw25ZNqpXQJkpnGTnKGAL65iwEaOe8xyrvr9p9EkNVCHaaMTVFiKhd2xNypTf
         VQRQMNkFWOgFFSTURpeRwZaO1LOb/wwaTiul5lC619PEyqkw/HDqG55ld+dRQT2J5O/o
         8sIOBQe4+G0FTdetirra9kBdeSX+fPGHrOm4ew3MY38b3XZs5hkLLfII5jqYPpjYnFUE
         Vp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125468; x=1789730268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfnV8b6AfEbN3w+t4mx2Du5Ole8Wgoa6AgZfitPXjMg=;
        b=Bcl6JFTkcxp3t0MD+FjHUzNUTOtk7/NGSOzAY0m/IV15p12GPuh7SZKkWg0a//mCI0
         iJBbTF+vFEsxqvCzrWrYS+Wi7eAbancQpkcDHjCMv36M70bg0XjrzeEIBwqV5zcm2fAP
         x9B+U2fB6eU9bqmxhrmc5DbJrKB9C11RB2VVuTyQ+W+5Iad4lYJ+FPl38lfHEpcgrefz
         q7EUU0KzVH4mpEKn3PIM6mbbIs/NhvTufqG1HOssyNF8n29W2z2TJbm46hmMGb7gctk0
         z3D62ofJR6Te4d4UqQgMUkC+WAd3aUItG4rOewa4bg++jxzUZ5qUe9hqssz+BUelfncF
         jadg==
X-Forwarded-Encrypted: i=1; AKwUvByrNRdPjtdn9/7jlMndlze4waYNzlbe2PgKyJV1fTUVjaP5I6gw2Mnv91t/tLPL5sr8ou7rucocvJF2IvE=@vger.kernel.org
X-Gm-Message-State: AFuF++m6QnAT00/JZL1k2uscNij/BH3Z5CIF0r0/ir4e5bYLoIvpK3c4
	7HPHNW6XqvsLumJtn7QM8+GllTpMtH29klsM0N0QRkwAhc1Bt6WbK41K
X-Gm-Gg: AYBFou2jk1low70l/ynwo8+zCKEoE+8pStau76InYEwOzuPvBIUlVUoEx8D589Tm+aW
	du0DyAo0iUJaGQRziZZD/b6br3yxPnFNQjT7+th+1LUrYfurq7lCZknzjQIxvjkmbPsj3jQjWpF
	SyUS4PE0IeCPlyBDSX6MJyp+FAWeFb655ZsDs6CyBiSMj3JFZ3Hb8NEbvQ9o2J7bBSLvUEsM+jw
	yOIiF7mZKhwV/5vUk9nAcKNqKOzk1LUC5ztsZYVAdyZ5rvR4EhhVpqLdGfqQGptbFtJ0Y4vWlCj
	LlKMm51zZJjLUoKqyYlNjN43xUsd9SV7l4xFRGG1zMSu8fl39YqDek5HDq3I15pjdcN9G9YLHy7
	dqIC25OvA5c0FkFcAjdOovMQ9uxRBLWI+7ob4+QuVi/y/TIDmUh8x+SRwfR4+mkkz32CMFmHYef
	aGpDv60hSpfu6vbegA34kf4vzmmx1rSei5hL47X1lKu79H7oyOfT//f8AHv1rpkqUBzBvJlBPkX
	9vVlettM8gwJKt9m0ljiMacL2BDDwthnrImeMORxMtnBqdiVLuprFkFwir6LP7QAbjoE0yZEftB
	ukpCggsasGdoJ2OVn+c=
X-Received: by 2002:a05:6000:2c10:b0:486:e37d:c57d with SMTP id ffacd0b85a97d-486eb345e9dmr4546787f8f.43.1789125467738;
        Fri, 11 Sep 2026 04:17:47 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3de1:9f21:e874:3931])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5438182f8f.5.2026.09.11.04.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:17:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 4/8] watchdog: rzv2h: Use pm_runtime_put_sync()
Date: Fri, 11 Sep 2026 12:17:27 +0100
Message-ID: <20260911111731.3404308-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

pm_runtime_put() may trigger the idle check after pm_runtime_disable()
is run as part of devm_pm_runtime_enable()'s cleanup action, leaving
runtime PM active.

Use pm_runtime_put_sync() to ensure the idle check runs synchronously.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/watchdog/rzv2h_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index cbf414e0c9a3..4a5a856060e9 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -270,7 +270,7 @@ static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 
 	ret = rzt2h_wdt_wdtdcr_count_stop(priv);
 
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
 
 	return ret;
 }
-- 
2.55.0

