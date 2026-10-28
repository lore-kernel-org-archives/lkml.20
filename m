Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191887;
	b=O3j6ZonpqnM+e7eyF1phbDPuKx2/20fDGW+7zLDnX13vusYhiOYOlXFowhKT3rxDtH2u
	 BE2FkqDZt3OK/K83OdCurZymvZ83eYiOgHQ/EOm+U7LzxDy0fl9w7tkDfJNKPW51zRhBo
	 9TH0ECaanMbXNLKJqIqqUHu4xxy31a99Kf0XPGsq1Jj18vBUisuvBhbRvS/WLmdHaZuVG
	 QjYTYkVD9vM3foyn0kckWef/fmlZCGE+G6PeGBjIoSlTrQkwra4cqkvduLSqplVCCVsUl
	 LeFFtu7QIKjWVlrjBaV2dtyolNBEfmZxXPOCCBUjSL0MDu5UbFbw1CdPt4jp5c+MGrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=A0WhCVlHTBDHeoZFEclyBLhFVHM0pG4iCtYLCGqW934=;
	b=Xjf4FbgpRjF5tQ9WxDLybuLHodZ3t94D0gGSAjoaLFXBec5RBmbmRhrQgRVhKNded5UK
	 M6TBEJ5x78x8V/vOo87iO0Dap1yQjKbFFfu6m78HphQGCYf6FbmI2YTPOCK8VXEXeh7hK
	 ome5bmzVRdxZj0nxMB1yxcstZVntJVQqDuKgi+onKbpruC+fsrNe5oPPQBCMXu0W1vP0h
	 cQo44vd4O/PI47+DHdA7ZcRAQsXF38/OY+VrOumUfBQMij/HWWTkaPmVYnzVvcXfya0SS
	 o5vGdYg5iJWKW/7mJQdjzAE5LTjKIGajgoiFEDcel4THn4P/YuBWGPxBBtUM2q+9G8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qddV/XTd";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA3160A2635
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BA3160A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qddV/XTd
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so7155675e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191886; x=1793796686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0WhCVlHTBDHeoZFEclyBLhFVHM0pG4iCtYLCGqW934=;
        b=qddV/XTdK2qf4I+nsRzvr3wxU4ipN3wSfOaPvLvujN0VGY6TuhUeop7kAQFRpwzkl9
         Yf5aKY2keNoA6WCgbAbm4FI/1bBHyXMjoaItN/pa/eKHvojIMsSOyLDw2g+kmWxvPIxH
         AUQtAHQP9GwKwi9dkQIFakQC2aXhlheQMlCVql/A7XTM0oOzmEnBuBOvofYiH+5LAgYf
         SWYsURU2tUsgKXBX5ZMyd2hjdPuMQ0caJ0JVjjLC9W/qlybIZJzv+v7PwxXmzmwrC3OR
         yj3z/HeAMNoygZG7Pb7Wo/eWefnNvUFhLtiHhdzE2DcnqyVDG89lsWMyC0OHoXSw6+Hj
         BTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191886; x=1793796686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0WhCVlHTBDHeoZFEclyBLhFVHM0pG4iCtYLCGqW934=;
        b=gkZV0pxJMwS2pKSkp+MIV3skik8F/nrgGfu4wJi1pL8B2TfqDoFFq8bKiXLzRQ8kcV
         ZrKzbxro57g7AIGpgDNwxgUYM3bgH3FYcj2oHCm/RqXsS8T7No41hJU3etQEl+eUYGYL
         Nk6zG6Vmw0Q4vMjk1/8TrFuRc6mvz5mU3tSogWG+bh3V02ZYiZf8eFbmLrkqkFtSw5A8
         TfhfgEM54LU9oq8UUDT2KuPiKvUpelsttX6AcbvxBdYXkBFZi6jjth2ccBj2jEFHm+a3
         MgZqcYOxRzyBuMl2FMfgbN/OmGU+UZCVBdniboSulVazhDCDPEJ1V9Z29vs4YlqC9Bbi
         vI5A==
X-Forwarded-Encrypted: i=1; AKwUvBwIhHRc21Kx854YGm4TcWTBLf39EGxelXz3T2xcON5AckrrONfFvZ5ry9H+jX87ufP8z+InHQg7KreLak8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQsxj7plBCtQIDFNs0lJ7yA+9Z0Srgzmz3dlerCqIgLglCg02x
	40shhFX0pzSHKd2Uyq4zOg/OI/paJaiojx7oha2U9vcTqgSRVQXQLTK7
X-Gm-Gg: AYBFou2612X7XipAnVdaRqKcwg+VIMsF0053/TW+5ccZO69EtqTE8myGqeyOuA/hhgj
	eWNskckqvDLmb0FLhb/7mdTPw7RFgv4fF431Ab6GL2j26JLqejhvH4OEBqfMHAVWtNzCvD4+jJC
	8HopcY8q2Fcc0srAynLgLKIn1NM+7chE8Mza4f5zC8Qn0QDcJZ1sgxvLEP+VVywZpI2CstjCRng
	MQdlBSbnPViSyG7rLW0MTMQoLmDi+fxyCe4lNEd1rFxorOwrb/0bMFH9LmNkMdNW6YYwMjRTNeh
	ExwdxjauveiB0Znn71xvk/FplXxJdBbgVEv6cvUYsDUNRRMJzk68BZragu2aJCK1qxQZE6uXaVd
	CiLlsw/I9WsRPBJoYflgoh0sKgaZjhVTrN1pr4BLpnrRmd1YhE9oac/5O6EXonhVps28FpEN9mE
	ShsGB0gtmF9M7j5O4m9EXB2Nd/i7qOKdurIQkSAasVRb3tMofj8qEdQbOY/OuPPBWjTxjGDZOWE
	odvEkk76AkqWKK8uUzVphZvCy2eIeaE/Zcjk6/u3r8oTiYWo/wMpUjQP1LPKmiI+b9D1ho91rw/
	6RZDNZGkGcifqZgszh/BAa4fegr5P1BKxYWXn25vSTsjQBsaVx6Qw1onGYOXyU/Ww20=
X-Received: by 2002:a05:600c:4754:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4a966c41e6cmr44785315e9.22.1793191885760;
        Wed, 28 Oct 2026 05:51:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6bf5:6c0a:cf99:c9f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm29275016f8f.10.2026.10.28.05.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:51:25 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 28 Oct 2026 12:51:22 +0000
Subject: [PATCH v25 05/11] mmc: renesas_sdhi: Add SDHI_SD_CLK_CTL_DIV1
 macro for 1/1 option
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
Message-Id: <20261028-rzg3l_sdhi-v25-5-57f16691c2ed@bp.renesas.com>
References: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
In-Reply-To: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191879; l=1939;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=9RhLI0TxhP/BG9bZ8qAvVR+kroaEpg4uYm47POogTgc=;
 b=bAXkYzWXua8bUQGEteyij3DZYjtKacYh1Q67iPuZtWKoG75gYgMUt/1qBjXCnhK09UvBtY2Ru
 YRn+W+rsQbBB3dANNs6hNkWY56Xkbm3+Y8xpH8Xnmvw83OSSUbHDyQJ
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace the magic number 0xff, used for selecting the SD clock 1/1
divider option, with a new SDHI_SD_CLK_CTL_DIV1 macro. This improves
readability and self-documents the purpose of the value at each use
site (setting/clearing the divider bits and comparing against
CLK_CTL_DIV_MASK).

No functional change.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v24->v25:
 * No change
v24:
 * New patch
---
 drivers/mmc/host/renesas_sdhi.h      | 1 +
 drivers/mmc/host/renesas_sdhi_core.c | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index b54802c0807c..b759376103d7 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -24,6 +24,7 @@ struct renesas_sdhi_scc {
 #define SDHI_FLAG_NEED_CLKH_FALLBACK	BIT(0)
 #define SDHI_CLK_MASK_DEFAULT		0x80000080ULL
 #define SDHI_MAX_DIVIDER_DEFAULT	512
+#define SDHI_SD_CLK_CTL_DIV1		0xff
 
 struct renesas_sdhi_of_data {
 	unsigned long tmio_flags;
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 74834e72f038..500ecc357095 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -227,13 +227,13 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	/* 1/1 clock is option */
 	if ((host->pdata->flags & TMIO_MMC_CLK_ACTUAL) && ((clk >> 22) & 0x1)) {
 		if (!(host->mmc->ios.timing == MMC_TIMING_MMC_HS400))
-			clk |= 0xff;
+			clk |= SDHI_SD_CLK_CTL_DIV1;
 		else
-			clk &= ~0xff;
+			clk &= ~SDHI_SD_CLK_CTL_DIV1;
 	}
 
 	clock = clk & CLK_CTL_DIV_MASK;
-	if (clock != CLK_CTL_DIV_MASK)
+	if (clock != SDHI_SD_CLK_CTL_DIV1)
 		host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clock);

-- 
2.43.0

