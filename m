Received: from mail-pz2-f30.google.com (mail-pz2-f30.google.com [74.125.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F48B3BD64D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700524; cv=none; b=Amvl6q/hAGrup4fKZOh1eUlvfDeFmYM0kdhHBE3oIZxXs3Kg0l9Y0fd2n13pJMnr84UJcZq8XO14QNwqHG8oHEDOK4Tn0wLdGIIXn+pT5VVlWHLRzl2KpRI6giqc/woEPJfG8BIn/mpAeInOlOGnivempmifNuGWBqVBTLTQIxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700524; c=relaxed/simple;
	bh=2fOXWQ+D606ZEtKoesxi3yPFiMCtrfZbrG+MPby33tU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u49WaQBg0esooieolNbxIeSF9SrPQA5NCfnw57IOaun+EblfUkN6g25+AZwGXFP3X5M+cYPhXUiLYuq5IQGl54F2MuDCGKxM7DikByG0h3Wf0mjoGMLVxaXZ0QO/3U8u4kyb1naecfdeNzt+F/NTgtJs4EuNWsX/2Xisj8Xy4d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JsKRVJnd; arc=none smtp.client-ip=74.125.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JsKRVJnd"
Received: by mail-pz2-f30.google.com with SMTP id 41be03b00d2f7-cc1cea50dc0so68853a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700518; x=1790305318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f70EL2u57AlsQGuy6taCWBcjNOQfxHMXhBaDu9pSD1s=;
        b=JsKRVJndOYWb2b+t2ClORDriyvRVT4cWddvK9hMcag6logGlpJEFu5AKTR37yKinZo
         WWpOa/deBeB/nqKQSM12VL8XHgRlKu8jvA4ugBKwoNKKcEPVz/MfmNGKiBnPDpSQ9R9H
         iO7NaAYUxIJjjxl3ISTL73nENkwZY8AZF58nVBO43lxyhTgxpHeGEBM8ilv0eFZQvGA7
         yfFGGUzFV1HYOUmzwUW4Gqb3FU99SY+r16kNto6awkiv74K29qIaFyLb728rbxaB/HDe
         4nMEd0Zaz20tcJvEYruah+FQWNSyaHKVNtJJNkkGdHmDcdv/VGbovwCy4oXApRdZrbJk
         AXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700518; x=1790305318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f70EL2u57AlsQGuy6taCWBcjNOQfxHMXhBaDu9pSD1s=;
        b=S2iicdQG6gLQKraQ2vMSsUdYvU0vczQBQvM+u8hLM1xxs77PAxqH/mWxszc1gQwozn
         Emu0LsWVH06Mpjs5f5Z3qsDpcMd3Iqpqrgv3Tluf+sWWMFZKuuO9p7p3f8/SLJ0oTyjS
         CaLO87f9RoVUD9ALS2WCiVVomglhg4UUw1bwL+hgVzq7l0zeiSwkdWwqbZuP0Q8abKjv
         U7hyStFgKyoqz9IjXO/HxVXI4Ob8Z7RUac5cLi4Q4+m/coUUadW6dHC0T4TODyHwydZM
         gGqqB8BBGJNRaARDDZS+E/NGpIQTyknW76QVT2Oty1BQOt2LumkaIoEfwCreQpcbsg5G
         7W9g==
X-Forwarded-Encrypted: i=1; AKwUvByayXmAyqLbUgv9pVly3zo3ASL+JcIYjfhaihjmyskMNRlLNNVtUZ3APWXXlNUcd6w0x2JJK0OXIP3QNQA=@vger.kernel.org
X-Gm-Message-State: AFuF++m4v0V7JBKJquCCrqUZ6nideXS4r9NHDd1WtkF26HtcoQClCS9f
	2pBe7gLxmEXZG3ndXRIGk8Jw5EKWWc9neIf9Hc9PCZm9ezGSKbPUt7A4
X-Gm-Gg: AYBFou0Njm7kjMwMTl5inP17on7pGhIer/TrNH0vhJmhr5cWV3T2YXU3MbVmiirVEuv
	a+VRQO7YatMCRgA+z+VIPOd7vxuu5QWZiJOugs2X8036E4j/qvGos6ozPoie97k7JRpvL11wSQ/
	TAo8SRajsafWOZtsXVRsxh9LOEgck0gXAsZK5DR69e21awc22iS2b8fG4exMfkja0nxuFLc4GzA
	0C+SmmIcZtpCjptOL1bHa3gG5zOVDALplzZt5uVcUeTekvymkybyPmqn5i4MDgQWTZcGA3hOqGD
	2KF2+weDCHVCS8nfyHkjB4YL0Qag7Sx2rzBkOKUcQbGSNBQ5j9fEZLXiBuG5m/T5j2xsymYBYH4
	J2/5yGSd98AsP1sxGthFHf2N5IYWALPPmshrR9a/ThotlwfMn+H0GwxytWDkGTloaL09lmGKjAr
	8EBMSb/6UIB3I0XHK1+QGW42F6o+NTlO3pf0fREtIMNHKoW14xGz2Tk27kskEDV0BInrGxNAgTJ
	XfXaes+Jj2uUiicRq7IYSfxSW5j5u0jAJlPr1xNzey7fWWjoI7oGzRnIL+/gRc=
X-Received: by 2002:a17:90b:1644:b0:39e:2ea1:e2a9 with SMTP id 98e67ed59e1d1-39e54d8b0ecmr2306119a91.8.1789700518239;
        Thu, 17 Sep 2026 20:01:58 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362e9402sm7969141a91.15.2026.09.17.20.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:01:57 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v7 7/7] drm/verisilicon: fix DC8200 primary plane disable clearing FB_EN
Date: Fri, 18 Sep 2026 11:01:25 +0800
Message-ID: <20260918030125.315978-8-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918030125.315978-1-a0987203069@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vs_dc8200_primary_plane_disable_ex() calls regmap_set_bits() on
VSDC_FB_CONFIG_EX_FB_EN instead of regmap_clear_bits(), so disabling
the primary plane on DC8200-family hardware actually leaves the
framebuffer enable bit instead of clearing it.

This bug predates this series: it was carried over unchanged from
vs_primary_plane_atomic_disable() when patch "drm/verisilicon:
introduce per-variant hardware ops table" split the DC8200-specific
implementation out into vs_dc8200.c.

Fixes: dbf21777caa8 ("drm: verisilicon: add a driver for Verisilicon display controllers")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/vs_dc8200.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_dc8200.c b/drivers/gpu/drm/verisilicon/vs_dc8200.c
index f72da10295e1b..25b5906a1c5fc 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc8200.c
+++ b/drivers/gpu/drm/verisilicon/vs_dc8200.c
@@ -70,8 +70,8 @@ static void vs_dc8200_primary_plane_enable_ex(struct vs_dc *dc, unsigned int out
 
 static void vs_dc8200_primary_plane_disable_ex(struct vs_dc *dc, unsigned int output)
 {
-	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			VSDC_FB_CONFIG_EX_FB_EN);
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+			  VSDC_FB_CONFIG_EX_FB_EN);
 
 	vs_dc8200_plane_commit(dc, output);
 }
-- 
2.43.0

