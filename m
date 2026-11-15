Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794725129;
	b=yuesk1vJ+BfU9NkTMdQpT584LHX6h+SeSe6jMNBR5Ctikng7kb3vizTFmBvyEkyQjeVg
	 4M1Qm91uEt9p4EZjJ5OMF0FLcNIFqtOrDuT2xNwpmOyve+3LswvAG64LVrQdIvoH8TzqR
	 LVk3f98FcuX50GOJoZvq0kpMQXq8MvnfKILio6b1oYDLfb371DjINOArUe4+K6ApFFLbU
	 p1KhpGndQBHDiZJPPuu1eyY0tWKw0pxGr1GtnfeZwnhoHKQwUHr2ivGq4JDjE84DSlaPf
	 QgPi1jZnCXm1FHtfdKkIrtyTsDo4S1A9JJ2zqeBvCeaG9zp+5BMXWNI3T79f1OyJaPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=0/3xq8hIlkDZKn/4BFbonv8yuwP3/TV4s/w1lmYLKlE=;
	b=l6K1/oG4rxcamrz/lwkLd+lpJCx6YQQL7d2ZxjgRPYAuweJS5AsP3CyreMR/bqbFoF9s
	 JQX8XXLsKKJWIh4jvJEQbLYAPjnJH7w1p27sHHrln9cCfbZh91iMMfs07SiaTAjyjAVAD
	 gtE/ib1N8WiTBnrwFzj3rkeMU+iNaMXkeA9q9qYruMCbq/v9qupuiS6G17us9AdbVSMv0
	 CP+xjjBeMiJauQ0SaXj8Z63whlvegLR2hiPayQYvWnOHFodGeez8Sj5oZLpW0PGKJ/lhg
	 fnVzB+DuJSdSK40h6GWd+0YMeJel7E1jxU/dD8fT0/p9ML1u6vR4TVex8HED2DVD7oQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpwQH41B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9210606A32E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9210606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpwQH41B
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso43041886d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:45:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794725128; cv=none;
        d=google.com; s=arc-20260327;
        b=KzV0UXIdk1vkU0MXv8XX9RLjUeOWgUYe5ucLD9DCnAlWn/acyM8sBroMPC561AEOsw
         JVjav2ypiXe2eOuAWfk3PZni+ql3IE91Yl3RPmU0wU6uqjIcknQ/PbUSrU7i5RP3qFf8
         Uezh6KkvPhVMCsldot5eyoFlyI5OVxi9aCtgmmSfH/RlIcHZqEO30WzYc9osor2d1P2h
         0emrR+Nw+l9pVGbIRIWBTc1qvk5Ez+3T+9NeY1qdhLVG3FWszZsNZg74v60L0A8Gme+g
         LkdlpNiH0SJIBU2oOkN808TdIAHbNd1XwmM4UMURru+MXgs+lVXXVdVPTp3v8zT9V40W
         LhLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0/3xq8hIlkDZKn/4BFbonv8yuwP3/TV4s/w1lmYLKlE=;
        fh=IsoI6IiSlcskFk+JWND8kl0Xu2KF2omyIR++uLYHhaE=;
        b=AhCRQkbziP06q6iTBsy+l5EJzuUnkyp5ThrikIxHtgLXQb3Hlv9ciYtmWwmJ+jfgB/
         ljhDdLG4GkPdLX2Adu5hXGSeWwhakRcVfWj43Gj3o2KdO5nv76jZbIsOFL/09yD4cuEB
         ec3OEtV7e59c6irnVbpRV5ToJit6cNekJZ0pAYnXchzu/czTpU1wIRJgqatjqW/a7Gu1
         nYwZ0a3MFDcwWh1jhVBTkILJ+4HAcObMhuoKfIE9lHuppavHBVZqUhESf3jFja7gRb8Z
         HkAn/tgfjA1aLykd/AcbzHaeqGmEDE/1DKLv2a0wqeXTNGuipKdQ9K5MlD7xTS7BaYMo
         LVdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794725128; x=1795329928; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/3xq8hIlkDZKn/4BFbonv8yuwP3/TV4s/w1lmYLKlE=;
        b=BpwQH41BDH+rLTxQ4tc49OHpD9jtyrWfvS1Q/B4sGyBzKtnNjWjgaN9us2ROVra5Yi
         3EK+UWi+hCkYqvV59U8ZMjXVJU77NRjYrN5mBg5CPoFNLeOHpStMDVXSZtLa2SXDXxwz
         UzKj4ZdIj9ewAK+bUoV4XSUe4Xm5WWSgiM07gyozlFoQWbmWa6GUdLTuXoTLwSLceoLP
         plaBRT/1pWDidl7yagvZRRYEuaV5hj1HdNZ+y8NFgQMYcXXvE+ca1bnkWG5d5pP/3Oco
         R6LFCVHxuiflf2SfMsWiBMgrFsoRA2afIahCe7VAxCUJGynp1DmCksec5Tc/YE4BmBP/
         8aJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725128; x=1795329928;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0/3xq8hIlkDZKn/4BFbonv8yuwP3/TV4s/w1lmYLKlE=;
        b=p5i+W1wOuYuit5tdAZgluD2FkFf7OgFJDxVkAwzEFwkZzZLKotjbiUecmlJkeo8j/9
         wv6w/OTr9KWzSeHVHFcP4zXmOOOFjSpr8raW1HYHsdij/XIbkeSEeU/Ws5f83GRKStN7
         rZl+4F8e8fhEr7f60qgJ6a0PLay7IZiccK2LpdkXMg69y8QkO2h7YcGERJcWMa22ykHr
         jLKN7QF2zYbr1q1crExp+bmsmBlYeXRsyp8auXIYh+76Jj6Ke9E9YpEAQx7M5DgIHJzS
         9T7vcx9yVvRPnRT6sHTtjabWpGev1R5bFDsyu1XYsE1nH2PhVVGeAj6d0K2M4+wRCS6W
         30Gg==
X-Forwarded-Encrypted: i=1; AL+hErH79/mLgU2v8wOtYBSGa1Vj+LD2Kz5mSOXsuPEijUu86CFWdmxuAF2pvJkjx0RDgBGiBPjID5CEkaVH49Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9btBG+LYtmpouL8VWRNCDL3amXejH4Igxu9mPPI8QWLlvtssGD
	vcO1O/O1ePDrYar9cxQmQY7MnP8PPRjNR5//MQmczTGCAck+bBqo34oHc76rWgK8uYOw8anlnqK
	JkzZU40m5j8tqgPMKIdHs27AXretcMpY=
X-Gm-Gg: AYBFou3q5cafX2kzVZBYan0NCLhya5MBZd8k5SW5Ed1tceeqYv+8/PBGeiKH44AN6kb
	QnWr1YcDxO9vQ+n5ElDXle27Oe4C00w1/XzVf2uuVwjZ7l8yY7LbXhWy3Z1YSnFNh33HLlschDq
	1qMiFp9YRWAPWIbU57oOTACKmYDOhVy82LTOY6dK4S2oxi4QL7FgRQOtFYIemNS0QxxoWE31Qga
	A2iuZeHwPrXCKUaBhktpr9xWrLc0/E5wq3JAWHkIjxTPwZn+bogRYeayMiOrLe+fim4oGYNyq7z
	u4Biw1r64vA8azwWGny+zTDd6C+25fS1lJEfBsbvdVJA6ryan0xduNVgNtXe6iltrdeJEXBhHP/
	oOgQA6z+Ue6uChzZ5rdjclwKFc8gRErfh8++frwxp1Gky+Bqwje1r3QmxL26ay0b38iEM
X-Received: by 2002:ac8:5ac2:0:b0:536:2fd8:a4d8 with SMTP id
 d75a77b69052e-55ac667dfbamr119243201cf.15.1794725127927; Sat, 14 Nov 2026
 22:45:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Alex Guo <alexguo1023@gmail.com>
Date: Sun, 15 Nov 2026 14:45:16 +0800
X-Gm-Features: AclHuK_kcIbKAU4I18MjmNReJSn41ne32WepJS2MRE7kyM3HewwZkuZHAF6Bz20
Message-ID: <CAAi4Z-e6cZ6wxFTO1rk7JmN-zdTo6=boWUwPeAOKSjuVQ6NbHQ@mail.gmail.com>
Subject: [PATCH] bus: omap_l3_smx: Check IRQ lookup results
To: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

omap3_l3_probe() passes both platform_get_irq() results to request_irq()
without checking them. A failed lookup can be reported as -EINVAL,
losing the original error and preventing a retry if the lookup returned
-EPROBE_DEFER.

Check each result before requesting the interrupt. Use the existing
cleanup paths so a failed application IRQ lookup also releases the debug
IRQ.

A similar issue was fixed in commit 47c3e06ed95a
("spi: tegra210-quad: Fix missing IRQ check in tegra_qspi_probe").

Fixes: e2fa61d40919 ("OMAP3: l3: Introduce l3-interconnect error
handling driver")
Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
Build-tested the affected driver object with Clang 18 for arm.
No hardware test was performed.

 drivers/bus/omap_l3_smx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/bus/omap_l3_smx.c b/drivers/bus/omap_l3_smx.c
index ee260c1fc087..7245be425f13 100644
--- a/drivers/bus/omap_l3_smx.c
+++ b/drivers/bus/omap_l3_smx.c
@@ -235,6 +235,11 @@ static int omap3_l3_probe(struct platform_device *pdev)
        }

        l3->debug_irq = platform_get_irq(pdev, 0);
+       if (l3->debug_irq < 0) {
+               ret = l3->debug_irq;
+               goto err1;
+       }
+
        ret = request_irq(l3->debug_irq, omap3_l3_app_irq, IRQF_TRIGGER_RISING,
                          "l3-debug-irq", l3);
        if (ret) {
@@ -243,6 +248,11 @@ static int omap3_l3_probe(struct platform_device *pdev)
        }

        l3->app_irq = platform_get_irq(pdev, 1);
+       if (l3->app_irq < 0) {
+               ret = l3->app_irq;
+               goto err2;
+       }
+
        ret = request_irq(l3->app_irq, omap3_l3_app_irq, IRQF_TRIGGER_RISING,
                          "l3-app-irq", l3);
        if (ret) {
--
2.43.0
