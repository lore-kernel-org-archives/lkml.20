Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794075738;
	b=JesuTdJ/RXGJLvp/sWNbL/tOaGcITPgYKckR1ijm11PnD8rLsOSXcS5iJSCS9okQ0Q0P
	 vJ4Zp7Slbwoh+FGrS/oFYQk9R6eOcrrBKU3bTgPlGD7vlpZeqp0a2Kq5AW0cwYXpBe8bQ
	 5NWACYwrM1y9//1aQaINYwl8LRW69DeeQ4nouiWJzPNuFxJqZDQIjjAWPoQK1cWE9dUC6
	 xuPyW5LZGDa5y0s9VciFgOQZMSlFyuMe8rOcXTuP/RiHqw3sv5tR9u9bCderEKKMtU1fJ
	 rdnyS7cNS9HnmydwerJzmdCr2F04SFmx1Evy0LCmIsgz42BQF3sSFovQX4j1uLi6S2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794075738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=P6HQLmDONZmtH2MpuLzcBkexLz8WC+2AFafcuCT9Xu0=;
	b=ZFnQdNCA0u1P5pYfnWywWaHBZ/IS5q7+c0rsDFaLmpcEomFVptzIqQuOsmxAhrzKT+70
	 wDtzR84kheKyEXG/XP5eHZMsMebkoll3VSxVktMT/i03UKxYMAu4w/xDsUlaxfW/QjaKm
	 lpEc/4TnOr7ik+7VLw8DKs/UUvMh6U7NhzD67R4+Zaq1ZEvTYZvrISiwCCRm1TIbjrREn
	 X8a7cBM45RzsopHwYXdEWqUZgNVXwjQG/ZIb/po9NzVvHUdINR9lvLTMoirhp9E3l3/wC
	 tZHPieR5vgD3qSXyGGNfvVFnHzhx+nUCzUu8C8hxVBYhbT+oSJT0fYce7oKFLr9Xj8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aRLltcFD;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7AA606A33A
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 18:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C7AA606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aRLltcFD
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so22145945e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 10:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794075736; x=1794680536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6HQLmDONZmtH2MpuLzcBkexLz8WC+2AFafcuCT9Xu0=;
        b=aRLltcFD1/YWxwcVqVN/kWA8N8h0t1hOuoQAINrH2IkNPGW+tDK2Qm4auod9rkojsr
         z37nL+R66q/9oem6++8QN4SflR2rQULUmoERxj2TFuc31zhHYzIHTWOBWG2Z0Gk+FI15
         JOVdlm9SWUbq1kTi6XZHKS/mGBz6x19AxKbP97qHLRqO6JwyKT4FjZzebwDBoR+hVu0V
         vGeLKhcKIbZ6zHLjz3ApOPJE9NvECRaP4t9ETTuA/Ce9efEWK0DXDt78rbXBDAJYsU7f
         QUH3cGs4tGwKX2++42qwgUtGDB2QNAZHq3UOgUFThmvf8wXNCf4Xqo/hiDWdJ2o2Qp7W
         +b1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794075736; x=1794680536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6HQLmDONZmtH2MpuLzcBkexLz8WC+2AFafcuCT9Xu0=;
        b=mvyKYsG6VlNZYttLUb4ZacMx26lG1zTHfDuDYdYZXWz7DNNFhrWIiUJovQMu6zzmZ5
         9JfXqj+x6MSbCboSMFmEsXdfsGEykV5C0dZJOQmvEqjvYoywPokFAL0muD/g9eMWsEHm
         Pno0C75H13UgSPNRCkbCbxEMqkSUe3S9b9f6HzaA8qxNpM2q+wgm0wZUz1p3WhelXnSm
         ph3ZtWthvjj6v0vYQhlqZdCwOOqRU5AslYSpgVlxTWJmAbuyj7f/ug7O9auH/FK1uTmP
         IZQ+ZKNVSoPXJO7GhEeVXY0oase4zSwmw1N11A+L4GQVWyFCEoPQVCi9zm1tpyurXdTa
         bo2Q==
X-Forwarded-Encrypted: i=1; AKwUvBw5co3IcsgAKC9PVymhE3Jfg9t1uRoOlj+mA2ojaaX8Ro7/IvN6v1ow9TddK4GnysOnlVtrhXujkRjoVmA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D0RxE0ON49q8Z8mnV4cSDbyRDEBgZWujgom1qJCaSiALED3kN
	52jFhXNWZy1vzxGe34YKtQe5JTOdfVHEYjE8AXcZrTDy4j2yzgLBKNYC
X-Gm-Gg: AYBFou2h29DUyjjvxXCGR2lr/Ti8PtLhv+ZEwmDAMXtDE0a4lPDLRzsKNUWsxd408AZ
	In7MpCxhqp1Mah2fEwz3tLe8tJvN5dTKpJSygFFio4a2YkYvRIOzZdqWCFYOy26kjcQPqljaVIZ
	yb2850nE1MAHquZeFFv5p0Ta2T5LIIbLYYkBj8awGUbftL2P+fgv02fUQ5HWXrzUJZGme66kgzW
	MhXUeQUS64lIHw9EzE7QcNFwk1ye3DdWbQlg+8nUOS1Hs+32btyZnI1ZRhLH9J2xDersO7yrqJ+
	qtz4fQk+v//7I510rGR5mgx5zEcLp3daP8Er1sVwn9ua1w+8ewe/kyOKUs7pBeYF25RLg18FfBM
	nzT2lT959a5OIo0IDo2Qa7/eW71VXvcP+k52O8bQC11N4QkvCiBm8FyRiV/wcfFNcKxUJpzUTrJ
	M/j36HaZcgU0QlSuXzVnoSqDohRLsg1fMb0uoXtfcUMz1VKaM+Og+Eu4ZgF1zpC/tE4/WfsSu3b
	neDi6r+29hfugI4m+cJhZ8nOZdbL//jfzduOFx3NZENyIuBe+bXhj1rygDx59bAitC3uX3lnbcf
	1n02GpXBTcM5aebV2Co403mdDO4gvC7SaIZTQ41wNsVGGfAtmeP1Q2YBUj/U1KbPrYcBtZ9IidA
	yxXIFyttNDG7X2sk=
X-Received: by 2002:a05:600c:1c10:b0:4a2:150f:1601 with SMTP id 5b1f17b1804b1-4b6dea68fdcmr114855105e9.12.1794075736554;
        Sat, 07 Nov 2026 10:22:16 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbd082dsm59551055e9.1.2026.11.07.10.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:22:15 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 19:21:33 +0100
Subject: [PATCH v2 3/6] firmware: raspberrypi: Add blank line after
 declaration in probe error path
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
Message-Id: <20261107-fix-raspberrypi-firmware-v2-3-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=704;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=S629c7Z4Xh+sglZqK1vBTNUvrddrb3hrJoBprGdVlMI=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq72xVD7jrzsTfAvYRAS4hITjM4b7vqYjOnYq9m
 07jEUVnq2yJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9sVQAKCRB4zXhFDAXI
 ZyJ3D/99hYLHx+dhJRd45sfqNDXZV/1/AM2Rsevt1sVyq7CnhGNvtw8gHYG+X3yqIM8TqwMCYFa
 UImCbRPAO/pK9wZUt+nIkOFNZWcVXnRXIlRnivtBXN3qBEREj6I9oEcIA3swmSYawXGhi7suTSC
 fcM2zzrV2uS+3d0gdE6jX9MC+uiIjcaCoGBYyhawXP4p62UkbLhdJqJXuXuDg0yLQSpJzrIeJXr
 3PN1+UjgCTOvlutiAE8W9QXDQUNk/fsV/4nHjynKSu6GFO1/LyBldF0c5RcI2hCX0xJ0BKXErIo
 pu0e1pB55/W95fgz0dVh+7DJp2cvx3M3kHAYxez0nWNJoMe87MOJad64nCU9RaEro4f3NT8wh0T
 yQWc6aExyIahNXGWj4HiOj+JGlDyMj2+71uFI9MlT7ojYcMC6xql8a4MvVA8QS0mIuXWNUg46ce
 ihwm6eYwhBse4MuW6vwmoE9ksebaQAAp3lvRbrSkwXdoYkwnhG9LzzGZlqvVeKqa+s1RYj6BN/O
 4Owd+4ej3fo09Ih/G0yQ9TRoFajAAIW/LoYdEMGv7MclJy5dU2kDiJxSQtMPqV/xM7Sr8Rt99pd
 YrgXz0t0WS4vOlwOhqMLyKvwHFCY01ybj87IhB0qLNARXNZXXb0EEr2ZIkY+BSzSoEltWBHb6zF
 RkdnsmUstkaKABg==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Add the conventional blank line after the local variable declaration.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index e0c91719b4d0..04163c3f385d 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -315,6 +315,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	fw->chan = mbox_request_channel(&fw->cl, 0);
 	if (IS_ERR(fw->chan)) {
 		int ret = PTR_ERR(fw->chan);
+
 		kfree(fw);
 		return dev_err_probe(dev, ret, "Failed to get mbox channel\n");
 	}

-- 
2.56.0

