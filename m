Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830541;
	b=UWnr5CH+rY10YU5OaB4HewAkOROQiNyeZvcWjYXxBQO/A7kVMhD4gyjig8k3011KRM/R
	 AJDO7jcHDZh8zrC4UdmMyHyhPEdd72PxB9vtjaCJ3DpxJ5oBsQd7RXNShM3n/Dl4l2tRS
	 jw5sPO5EBiG2S8GKgjy4cAS5EqIBvt9RMIRECXlqfHzmyOHJogDDJw8gUBYW90pbGwK0C
	 HRySXkT7U9Olmc8tB05NPgRlKjgJrjQc6FRCvjx6UQJopQscgy9xyAFeyWTLCr2k4w11u
	 UU/4gbNFKD3+5AWSIaJCqck1FMmLstXg/DG6wojBg2JZqknw4UmUOMNfi2410VBX5tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=iplfStI9M5hF0Z2lIf8H96dhVPrsQ0CfwqBgjs+zJ34=;
	b=bgALUFK3jNmGUeKkOeFTITWYhGagC1XDY+KT+k8Cga8xVhbEwhBkeTLvGftXHwdukX8D
	 ac1iM2xlC429uxf1Cf5aXHdU3g2feyes1XhksxNW47f97+0LpD7clfTVy9Oo6MLz38Ewf
	 PYBRhaNE5de/9W1IYCrh3SY5wQmBrqFYS7dapDi30Goqlew4z+zzV/KmfXXl5jlp60wTt
	 mOJgXGzaM0TdP0rVN+L35mfu601bU+BOV0LkyQsmoMKz4UY5b3ideALZUfZQ2tkolZzeq
	 bzx/RT8ygEDkeH7XUq6XlG29dwRLTPp58tYZMb3td4NO+GIuxRLS5rZX37xEk46E3dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C65HUyoC;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B37D606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B37D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C65HUyoC
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so7886705e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830539; x=1795435339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iplfStI9M5hF0Z2lIf8H96dhVPrsQ0CfwqBgjs+zJ34=;
        b=C65HUyoClYYRjsr2ls9c0gCrbCyRx6ggu1XAh5bB8rAdj6XbGTN6AwTxIlJX344Orf
         dVi7GUWmv6PzybtVHweokeV6aA055QK4ROTpgx3zYteIoYkCd+Zr5TzfR1pOsHbgaIdb
         p19w3qrlM7ikJqoCCIyhfIWDiZ/mm8K2ma6n6zBYZ/Nz6/jUJnKdK4Y8qGQWYjciSGBL
         u8KBMmpoJGoRvx65Nfi+of3O8E46J5FwCCYi/P8LLrZ716hZXO4GIJbuHdUGI5s3eg9Y
         QAxpsedyVERSbX0Y9z68uuQYvfx8f9Xx57CMUv1b4mKDDlNINHLKaE3C6Cxgq3PuSzOw
         2ZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830539; x=1795435339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iplfStI9M5hF0Z2lIf8H96dhVPrsQ0CfwqBgjs+zJ34=;
        b=fPKSQwuSCqIhQRe872aQ66604FkFlv5FHnRh1uwJs6BtJ6IwoS4zAkVxqZuvkHNlto
         a05sGdQiQCo9DLHZZWhXjWsueVKBoWTsaJ63fnr9wTMR5AXoLNm17etaynRmCIkbsZyX
         LyhFeQ4kUp/H2ROaTOg8gXVzC0l8UVPYOFav0Uz/SusT9Wro+r8B/O5MnMwcD4m2qJc0
         tXGjR7YLP5SDAxyKbLXHdpLoetZFyXx7wcOFRFr/i+vXBaKllfeaPYN6h6aEPzwyjSZ3
         GqY1AXv5e51xVivNsQf3X5PAAbowcRZ1HnXAyLVVhLdwCW46dNPghWPvXembSj3wHk38
         1DaQ==
X-Forwarded-Encrypted: i=1; AL+hErEWxjraiPd4XB0+IkU5wU8YlU1nFDZqWfAF56PDyyPmEkPfz17MPiyPydzONUxX8K4kJpY1Ys11W7PxUYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EjtPmai9NPd9M29zb98b0egaIBOo/sQ0uyTqcVHo7nTkBGrbr
	2cZi8fGPfhQXrKRuwCpgf0Z6SHTbFm7cdmXXdRQZEjOvGUPiC9VDOCoq6+OaKQ==
X-Gm-Gg: AYBFou0D6zhXSwu6XwVUaUoyGNj+OG33so+U++LUjUS/DknkQyIpUtzMLNk6m38aJlZ
	fZt2j+/dfCTZ+FBQ7JOzM+ckk4Yzg/vLJZ/JmoRtqgr9rahBelDTXEn3MZWQx38VQXPGyYy0C0+
	LIrjA1vnNQmzvVPoJzy8nVXkAZHW3n7Mm2/IDf2By6KJ0Epl8TebGBYNatNBO4ZcvNNZWcUw57n
	jO6OTdecZa4a92XD7tzfNyrHXL92TszYsYuGWEuTNNUKCgbj7PQWRiwCe8y6GFZeRzoB4Zotvs6
	KQ4tMcPBslsxvobeWJYXkRtxYhzQiAjGBKF3gYjqf8Z4+Y67HH2LytsQFyXO5iW2PsCMcgmFafG
	ce9MIGwahm7EGcXNRM8Ti6uQ2b8l9o6QUmmkOm2n6FUAY7Aa2LVdccgwhuHDyfoGQtEsxwrMz8N
	EUC2oMKN3Q5syoQEmf75M7AqigOZcdMujcun+zP/Wjkou1NBJRwGBZzLGbiciYnX0j7l4dN7Fw1
	40n51AzbtRRV3V+dHBJ67NK25KDDU9juA/hvmSN/auhphmr1aLujuC5fIfjFtHNFpaNUVO46+As
	NflbH6IcyJ7uZZ7L3t7H6YEPlJLt2I2zKumeOjBqj7fj/Jxz9kYYW6rSJEikQdFmKA==
X-Received: by 2002:a05:600c:3f18:b0:4bb:6ac0:6dc0 with SMTP id 5b1f17b1804b1-4bb6ac06e5dmr81251525e9.29.1794830538667;
        Mon, 16 Nov 2026 04:02:18 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6889:eb24:5e57:83b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm395562805e9.15.2026.11.16.04.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:02:18 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 12:02:15 +0000
Subject: [PATCH 1/3] mmc: renesas_sdhi: Save and restore IOVS across
 suspend/resume
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
Message-Id: <20261116-sdhi_hs400-v1-1-c5bedd312408@bp.renesas.com>
References: <20261116-sdhi_hs400-v1-0-c5bedd312408@bp.renesas.com>
In-Reply-To: <20261116-sdhi_hs400-v1-0-c5bedd312408@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830537; l=2407;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=mRDcKvSH1XEDXyYZNqD0XhICaJN/EeIrHw2EbI+23QA=;
 b=1pnZgYF5a9J+YICA4EW50lPEmtMtBlFnfXR3TurcmjrbuFv6oRMdjukuWxK+4X4xa18Gq9G0w
 ppF2UCBXkfdDuUZJ7S8/rQvg8MTaLrbeJGjh7ri8aLKrpoHdJF1fpRf
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

The SD_STATUS register, specifically the IOVS (I/O Voltage Switch) bit, is
not automatically restored after a suspend/resume cycle, causing the
regulator to report an incorrect voltage on resume.

Fix this by caching the CTL_SD_STATUS register value in the renesas_sdhi
private struct at suspend time and writing it back during resume. The
whole register is saved and restored, as IOVS shares it with other bits.
The save/restore is only performed when a regulator device (rdev) is
present, as the IOVS bit is only relevant in that context.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 26 +++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 4f8ed1d8efee..a93e613e9821 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -106,6 +106,8 @@ struct renesas_sdhi {
 	struct reset_control *rstc_axim;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
+
+	u32 cache_sd_status;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 5e649ef20990..56286431fd2c 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1465,6 +1465,15 @@ int renesas_sdhi_suspend(struct device *dev)
 	};
 	int ret;
 
+	if (priv->rdev) {
+		PM_RUNTIME_ACQUIRE_IF_ENABLED(dev, pm);
+		ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+		if (ret < 0)
+			return ret;
+
+		priv->cache_sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
+	}
+
 	ret = pm_runtime_force_suspend(dev);
 	if (ret)
 		return ret;
@@ -1494,8 +1503,23 @@ int renesas_sdhi_resume(struct device *dev)
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
-		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
+		goto err_assert;
+
+	if (priv->rdev) {
+		PM_RUNTIME_ACQUIRE_IF_ENABLED(dev, pm);
+		ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+		if (ret < 0)
+			goto err_pm;
+
+		sd_ctrl_write32(host, CTL_SD_STATUS, priv->cache_sd_status);
+	}
+
+	return 0;
 
+err_pm:
+	pm_runtime_force_suspend(dev);
+err_assert:
+	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(renesas_sdhi_resume);

-- 
2.43.0

