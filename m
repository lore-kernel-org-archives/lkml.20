Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742183;
	b=v6I1e48t05Nu/KuAvR5CCi1Euuo+gM5qID697frp68MEC6szmpHqyKR58Le6677BlRXI
	 f67/McBheE5dFB3tQ3WQOsI8H1v3ju/6EHWORekzNiFwJ+6hRW3DUP6GYyC3obWjHF2ox
	 YYq/NnqXfrcktfANMs1Yc7Uy5FqF2s73VXXGLI80i0fecq1puiqRhrPj4Iv7A4+BRbsR4
	 zob30YadJmCGUx7tgYqrFqvhtwCqGmCZOQOQWVHubKiPL0esQ9VE1IHFj5lDcK3Umd5dq
	 B2aVQtG028dqy0UgBj4fJ7rOmIT0L/g4YkDVJSFXC3iQ5MMRcnwWX9CRYtO5+vPGYoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=d5nwKFsZvE5L1iVkiN9qlakuwuo5b+7GgbmdUMjeiGo=;
	b=3uxRRK6T6FFo3Ib8wAktieYLlPnz21qjRSbAGUbpgg9w4mrtfZi1PcFiDECwbJqEBYEv
	 bVb9kW3zzuYoih1AXjtNwu+VEUwxSLzYoJBaDIVuWacvGKUsoBBpogkZL6ni5iQoCBwR+
	 jJX8HV39eGuS48no2O9yXa1adT3ePbchthdxUDJPiyD5y2ZBQiVWuNajdc3iFdjYtPgqC
	 WkGO5SirmrGO2UhEN0AV1kdyG6JgwWOcJjC+alyycTRvhsgB4DpL87JExBKd4+oGdjgkW
	 ZEDOZDKPXLiz//H9C0qySGQbYyUuCYW31/ezR1p/i3sr6N5WxAImfK2ZhWfy0C13zcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UybKkBI3;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B80606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B80606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UybKkBI3
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-89d6bd67045so275480b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792742182; x=1793346982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d5nwKFsZvE5L1iVkiN9qlakuwuo5b+7GgbmdUMjeiGo=;
        b=UybKkBI3GOa5r0eXQ1Yja8255ZrqEiqmnAyTSJsjPqwu5JWSnRwG1HO3wPuH31yTiO
         iMl+UeWXpCUnZ75q5rIUqvO0LGr6mKG/b25tK0Cn1td09FZg381GD0ozMhcTsHDh6/09
         apT6hODBL8Urv6E6KjRyCNoWPYAB2eLL6YynlR8o/oySkIOPu6m6sfFdu7fPt3KLxjlP
         q3iZB/87zztATkrxcGVPW8P0r/aysUFOwmMzIzNil5RzKh8S1qbDdsXBEsu1+MTD/t8f
         RAl4IQ7oVWKTj3L3dCQU12VnPjlsmHAw2koBGahgq2VFyPlNt8mJtbA9H8/sqSO6j4FB
         sE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742182; x=1793346982;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d5nwKFsZvE5L1iVkiN9qlakuwuo5b+7GgbmdUMjeiGo=;
        b=k252p22RSDpVm0oS2HIjaZWnY7OS3oESCQbZYavij7AoXpJUtRI362MT6gDWLydt97
         pNpm6OGqfDLgZJLIjbGLwJke6HFErgsIMOeOrb6ohOcerhVXxqUibemgwY/4bevb+4AI
         2e/j7pSIMJwMf9fPPVHufLOUuBzUyBV04cTCTz96tWhakQcpTRA5gZ+cXwg9TJIYC27d
         eghiAo/Pw15dCK6Q8ag64zxYrL1UOYy/ApFRLoA/gne7Enfok+O/ZSEumjsmWipmKR3A
         Yy0LDsFLVJeLsb8bj7B6xLrC16Wh/EH/XO8INAg2HFz97rNNDnsMhvyheFGLEOOWBFC8
         /j8A==
X-Forwarded-Encrypted: i=1; AKwUvByVp2sj2u5xpy+0ZDWyEsK/dmhzbQHbBtKsQ9rj+/JF3FngV7R9syG21s1h+igMO75jmcU0hvmT8jWTY4A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyS1M+3GKjLi28hMU+ujyRM8Qsj2G00kNb/+FwFxfVDOtLVm8C
	mJ1mAHISrbDUYTObWCxND76btr6fCzf1h0PE4/kY3u6HEqJo71O2k5LD
X-Gm-Gg: AYBFou0MKpSwhACLfaqjXugHTxzWNSlCKen9sgwHj+MHxkfyZkVCtQ7rZMWPn/0LqR7
	M67SnRmxMQu+DsyISyu26UPeALA/zvWzfQVwH4eVejCO8o83lGZpCACw71+3UF671CdkYGUdwHc
	sI+VckLkhh5D6MZlj8GR3PkhUrQWz21YNw9He3eUBM/TY57WchMZxnrvUBntRGrYYMc9vfimOyg
	Mf+rjkVixVX7fYA4KetiOd8P3sUM1SUw3RfPrGbxg+4tXRZA/+fE1i6D+6bZu1ZF2EhkwsYEV67
	ngT4pJ3M05gEorffdYd0nEaxW0GWvYmgQLRqs6GzGQxJfvsYu7mfJ19UBho1O3prDB3kGzh0dv2
	D2wvIK67eZWtgFj5dt3OcgC9i5uPuisXi17PKQYepajUGYxpkgOGg7DdHDi1Hz3MX53lpL4pqiX
	mStQ3pI4RzZx2CDKtbLUU6UaIydL6i5tTH2223kUKjZpXJwOAvp8vs/RrTIj7YRs/u12U2ZU+JC
	N/V46OLxWhfZFRqJXc/NcHV2up66/cj4pkGntBUqs07zTkkkufXAYbWIOxUXyTAwQnU0fgt8NDj
	1LWGjqGv8SfPAp+5rQhI0ZG8Cvs=
X-Received: by 2002:a05:6a00:bd88:b0:89e:7bfa:f87b with SMTP id d2e1a72fcca58-8a2c472e08dmr1075229b3a.3.1792742182084;
        Fri, 23 Oct 2026 00:56:22 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c8ffc99bsm430968b3a.43.2026.10.23.00.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:56:21 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Helge Deller <deller@gmx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] video: fbdev: atmel_lcdfb: fix list_first_entry() on possibly empty modelist in probe
Date: Fri, 23 Oct 2026 15:56:11 +0800
Message-Id: <20261023075611.3559095-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Wang Haoran <haoranwangsec@gmail.com>

list_first_entry() does not return NULL on an empty list; it returns a
bogus pointer computed by container_of() from the list head.
atmel_lcdfb_probe() initializes info->modelist with INIT_LIST_HEAD()
and later takes its first entry with list_first_entry(), assuming
atmel_lcdfb_of_init() populated it. However, atmel_lcdfb_of_init()
drops the return value of fb_add_videomode() — unlike every other
fallible call in the same function — so if fb_add_videomode() fails
(its internal kmalloc can return -ENOMEM under memory pressure or
fault injection), the list stays empty while of_init() reports
success. The probe path then dereferences the bogus pointer in
fb_videomode_to_var(&info->var, &modelist->mode). Because the bogus
pointer lands inside the contiguous fb_info allocation, this may not
fault immediately; instead it silently reads adjacent memory as a
struct fb_videomode and programs garbage timing parameters into the
LCD controller. This was found by code audit; we do not have Atmel
hardware to reproduce it.

Fix this on two levels: check the return value of fb_add_videomode()
in atmel_lcdfb_of_init() so the failure is propagated (root cause),
and use list_first_entry_or_null() in atmel_lcdfb_probe() with a NULL
check that fails probe gracefully with -EINVAL (defense in depth),
consistent with the surrounding error handling which bails out to
stop_clk.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/video/fbdev/atmel_lcdfb.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
index 53f015699..6820a2400 100644
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -1007,7 +1007,9 @@ static int atmel_lcdfb_of_init(struct atmel_lcdfb_info *sinfo)
 	if (ret < 0)
 		goto put_display_node;
 
-	fb_add_videomode(&fb_vm, &info->modelist);
+	ret = fb_add_videomode(&fb_vm, &info->modelist);
+	if (ret < 0)
+		goto put_display_node;
 
 put_display_node:
 	of_node_put(display_np);
@@ -1075,8 +1077,13 @@ static int atmel_lcdfb_probe(struct platform_device *pdev)
 	}
 	atmel_lcdfb_start_clock(sinfo);
 
-	modelist = list_first_entry(&info->modelist,
-			struct fb_modelist, list);
+	modelist = list_first_entry_or_null(&info->modelist,
+					    struct fb_modelist, list);
+	if (!modelist) {
+		dev_err(dev, "no video mode available\n");
+		ret = -EINVAL;
+		goto stop_clk;
+	}
 	fb_videomode_to_var(&info->var, &modelist->mode);
 
 	atmel_lcdfb_check_var(&info->var, info);
-- 
2.30.2

