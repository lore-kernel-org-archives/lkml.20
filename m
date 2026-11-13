Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596875;
	b=FCqlGDS0tJ0iBdukZSuDiXYcNDmpUMj7PDHNFgT2V+ZeRrjP4UygJJthRLlYg2GlC5s7
	 41mkk3yj6GphaQh/+D2DFfNbFNK8tJAGPch3ktJWg7TlhhkE7fDgcXmfMUFRUnTYm5cux
	 bO6qZrBh1tl9QFPYKRY4HoLhzNh9WmV52CXSg/nm9iUJODTsnqS2XnfXKyTkgA6pqDrdA
	 /j6HSK+9tW7Duh0qXK6lqRRCVhi+WA0pWFn5Tt+v/1lSh5elE63Eh9Fn1TX6/S+twLY4V
	 PwF4PNPDRREIln6NinFVmY53DigFC3IzlhSQEmbqTQA2V9nu1HhL/k04+Oo58GnHmig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vksi6xdBiN572U8/PprSF6T1ZcI65MaLXrT+W5UPb/M=;
	b=DYfwBrq6whKCqN2fLWKjWTmRJ9/ce4AxM5Drpo73RB15Bna+5RJYDTfaUmtm1qsvEuu7
	 3HV7bxFM9urutxyJnbl7jybajb88vNSs8mNvXQ4jfx3Tqm4U5KABGCHG4FboINXCDNxBY
	 VfYGcbZBtWlheLWJDvORkGWhZjeE4HYNII0/9INwz748xa5z6B3vDvRS9OWhKvE3pVnuU
	 n6ZRQy/GbFkCYwTnBKfpu0Xb+/dTSTygx4VbKENqy8LwNoEZ4lcW7RKOPf0pkdjw7btAH
	 Iqeu3iLwqi4Z5gRwnjKWc62qY75frZZyHMx3RHc/HHoBhzPLGo0SvSsJ4SEvNc60Uag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bFjkGDON;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B299C60A262B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B299C60A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bFjkGDON
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c506a231b88so233053166b.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596873; x=1795201673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vksi6xdBiN572U8/PprSF6T1ZcI65MaLXrT+W5UPb/M=;
        b=bFjkGDONSYnmUt0iBBDN+sBDopI7ikDsKpWVytszNlJgTae66dMDCiRZOAt5mLIY+s
         q1LywO7q27xilrn7scZ4dSAsbplZ1ghm5uDWf5LME2ful/5VEle53jfHvSJBkhpAjd3p
         O+9nm8RHUCbu6LNeCr8PQpqG9uY8s9AZpF+U4RMTeZsdd8Aov0vSFzmueef7+1xwzMpN
         6Q1jCE+2tveXveOZTjlik8Y4wllQipC/oRz/uHHKlYJH44dACS1fR3Hp1oUj628Pt94t
         uRP/PJpDgm9b6n4MM6qAaeWG3cE/6uJDdbnyGzFix+pPxfnA7fCUeAz+2RvCNZu8cGtk
         Yexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596873; x=1795201673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vksi6xdBiN572U8/PprSF6T1ZcI65MaLXrT+W5UPb/M=;
        b=1XYQXBR9YOxqA6jQd95nUHoW4AsxTNPhyUoIUqHCC+kejMy71LNz1M5lb9eRwrlFb6
         IkHJKgt3xa12s9wMzfQeEoiEYZh72Um+IPlPcKaQsEIdWJXYiNYFR+Y8w2k28qu5A1Uh
         urce5SBeJJpZzQ9pXUBJHp0wR88HBXIZtm6D3k1UzDzpOcsP/5CxWQii7fznb2LHPXbV
         jB8BQMXtTtRfWesjl8hzJz9hVOGUL7Jo5UKfyDs9o7Yr9gAh0IeZqLJVgU2lCi1G5VUt
         pYhD7UcTJvz1H0xTxK5fRtCqFHyTaQFw1VZ1yCagTRZbcujNzzo1Pvsb0EwY8oX7FTzb
         J+yg==
X-Forwarded-Encrypted: i=1; AL+hErESasBOERGGB4G2T9UaL+2jRkDugJk4JEqi35+WO/DNXb1xwM6g7W7i8oumSX0BPkqO1c4ccA3+RyvGYdY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/orlfw8Eg+udBt1TuEI+N1GfBkSeKjsKEqj7c4sdt8qCsHpxfw
	7vB0d6jYEGhdxLfZbnxjgogRl286EteTdtDmtNzDtGlfAwoTYkkB+Nmm
X-Gm-Gg: AYBFou3Q4alzoWOvXXLyt5mkCcuvaAmxJcIcQ5PJX5AlU6Tp8ZiW80F574a4WePrT0b
	PmL3YtDxtorTaw+cgKLU7iHMHZAN74AxQAzInqLjV5ckIQr5lYzDDOwR3W5kyVS7bUXS+H3TyDe
	GflqgN1TOHfcYcBWzu25v6zlHRLviWlLHDvqXmJEaWY9jF0kByokTGsxN8ZfM3axQ8agWq51tMd
	ICBJY6w1RZry7Tn8xRSiL14ESpvX3T6tP3nUGwGcQlmRDqL9jsiWGfM3GHJ3JokLFoJ8HyGAbEI
	5yGP9RynQlK3hELQMdxC+H9n9jh/pExHh7Y5gxrpN2lLVHVHOs5V145dzViwn2RdedBbzADGqwM
	HdFEGdtFvzWa2o0kfVCPxO+CgV+6+DNi9b/sHEqcMgfFelZsB/EgchTKj3SCCtPXRCP9rNdaWZN
	W9BicLBKLUgiNNJgKBdLSGzJzz/RxuI98fGqIa/gP7H42DLDExsQuT56Tb5oAbBId8I+XTi6UZs
	ymALRmw/vwJrKp2MwgMU8vw1nSuvi/gp1sn1Jbm81O8Vl8Te/wTFEvWkOqM/z3JvPPcC9GRMC06
	w3pdL+UEu4caXj1dJ5qw+NNvcZul8717BCM6H75N8tARpZrnIfWhD/fpMvV0M7tcrA==
X-Received: by 2002:a17:906:9fcd:b0:c50:9149:48e4 with SMTP id a640c23a62f3a-c50963db437mr297220766b.11.1794596872956;
        Fri, 13 Nov 2026 11:07:52 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:52 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:05:00 +0300
Subject: [PATCH v2 4/9] watchdog: mediatek: Add support for MT6895
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
Message-Id: <20261113-initial-mt6895-v2-4-4ab0aa9fa391@gmail.com>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
In-Reply-To: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add the compatible for the watchdog of the MediaTek MT6895 (Dimensity
8000/8100) SoC. Its watchdog registers are the same as on the other
supported SoCs.

The TOPRGU reset layout of MT6895 is not known yet, so the entry has no
match data and no reset controller is registered.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index a210fe1569e4..d8755979021b 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -607,6 +607,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
+	{ .compatible = "mediatek,mt6895-wdt" },
 	{ .compatible = "mediatek,mt7629-wdt", .data = &mt7629_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },

-- 
2.56.0

