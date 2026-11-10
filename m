Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298711;
	b=JvE/sETBjL1DNMEgbiOhghHdN21pM3oeO5tX5blUucPp8nR1YJy2H90Ko+kKiI7EOqFu
	 APmZJzKXg4VkJW1miwg57dYzI4XgG1XX9me68hNc8qgGj7c5VCzqYgOex18DJPWrzq0HE
	 BhD6gGcJGzMjliwEn2H5tlM1zWKYVe9+iIfmtqiolg9JlnMNpcpOvaQqYXNwCCLnMpVQ8
	 snGrlvR1GglLWgnA290RpbUbSGHhx2X3e6W8f9uw74MhMxlMVXs0rvdH7bHfV1Dv7Qwsx
	 Pfj3C0dz9irsRTEHHRijRqfd3RBYYR3zMAdGZuQtwp+C74cZ4Bob6CT4asoRY+jT2dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/CKr1kEi8VZLmxn0omdbiYtt+CDZQCwiRpNUGKV8mro=;
	b=1aCSZJSFap8qGtTRd1Qj8rCKne2eLlWHfnwT4JROcjuuuLIcA7ojlu/K23tkhL1abDL8
	 1stFazFyozDSVUdZ9k8K+jYlURo0rDsBmIOmmALxc7Ku+5suAOdlvsBT1oxxz2+6D5YCX
	 QOOQfmdJ+8qWa8Bs61VTehOOGGOdndknjNgVMo5fcREtCZhdbGw3tXELrmYcqzMPlujWR
	 qGPwzdA+AVL63EGBV4w6Y0CIbhN0bM7b9ISZLN+rV7FB2bLdPw6Xot4SeMMiN6P6cJdgV
	 HWDw0xQZdiE7Gk2GfKFei9Fs7gjJP5KoZIiN1Bw2objjULyPcaIOlDTBhzD6+5DeTBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RKnu0IJK;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB51B606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB51B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RKnu0IJK
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35159e0092aso171590eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298710; x=1794903510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/CKr1kEi8VZLmxn0omdbiYtt+CDZQCwiRpNUGKV8mro=;
        b=RKnu0IJK9pQbEAU8MKWmIbVH1elZgbMUzwijF/c5zRFI3iX50jy8UWaUyU6Jtz2WF5
         ShJeag8lNzkGfWvJPeIyETVvm6GutH6AvqiDzoogEYJJBzTPLpV/Ij/RsV3LUEpLIS11
         f1yxhRNUHaEfe5PcULuLEMTEeEXPiGdzKkR51TuH9+YnIsf9wzJIntSoITI/7yN/rLJd
         SfTLGareRJ6PCWODs0QA3Nsem2YgP3ZUkwyPZ5xcMFHSdp8kI5AhEtt4aLziXZu+UBlE
         fc2ctbL+Wzq+1puCvYu8uWjGJnmZ0Mv+8hP9XnRGc1PYW3p53OwP1mwJ1l/hY2c73Bu1
         rP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298710; x=1794903510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CKr1kEi8VZLmxn0omdbiYtt+CDZQCwiRpNUGKV8mro=;
        b=T/XQOVYvAAa/zCde7MWPQjN2OvKxDYPwLdX3x++A9M6K1K8ewb0bfbiC0WuZgmUeAA
         yGMNTB14L0U7z90YubHFkMUQPLKaClU99Y6XPXG71uZEawimIkdg85JBH+6Ns0bw2CbQ
         tNdJfZe31qgmXgw8AOvyDh+Wd3ro/wl/bVgzCiNlo3/N2H+/wIb6FCH4Qz/2Wtn2xUPk
         6hecqVWZ41gu79JJk2ltkz56yqtSCv+fMgvOoSUIGlR/cUx+PoyLJtuGFA3HH4pmCuxu
         XRNSY5YxAz20VYOYCVsUdiicLiKDZYAEmtybP0lJkOPABxq2QQsn3Pt2fwo9oAPu8arx
         8Eew==
X-Forwarded-Encrypted: i=1; AL+hErEM79upay9lzUcbojBtpxe0YjD57LWkEc0bsjwHcg+a3UE2NPyHhiQnhCw5Vuy6RkWKHtaKiyDY0UrbfZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yOjJ6hupzQquz+fw9hSWF+0TM3m/CkCfEorS2sOVyLOlKoubg
	+erospDaj2JH78zi3WPOoqGg+uWPjr8s4gkuq7pjAJbi6Su4DoPbWoPA
X-Gm-Gg: AYBFou3c6SdqgsANMl+a/LTxol2+IhrEjDxX+yKD/gm1SX6gOMOdXkz+BA3FFygvYjH
	l/rdZnTlVv7ATw+d/05eM/7DZYHpBFofa7NKp28ZMmThD1nMUSsAK6pPxlZppxowk31V3jdWOS8
	gtI+Z8QugjsJFnagJufWDaPxVFEe4ozaVk5w496ZAUcWR4mVS2jY2ePelVN1+57dwkmcNYI+284
	KWCa7K2KrwL42rI60T/baVxRFz3Lbxir8RvgIq1NzYDXZVOtrAwiG1tVHbPqoKJRcniPA/kOgMT
	9TfFy18yj+FffMARxJzqn7oZvm8FuCGyF1e7CnPXb+1xsjaorsuQaVt1WQH12kup8jtIKc+uNq/
	8q3wHX9iu5kzJOsLnFLacH3KuWEmQQbgSr9FrTFmIQDCYiZsWpTq5ueN7sKb9wYvcJqSuyafTal
	naO5EpBrDM1U+4OEVMECzC0AKD1NI73biDEXdwdV/IAPYFLCj9ZIbhnJu6LoJIxi8lfmeaznSFC
	R5XPb/QvwB8Q3MpmhHRRWB+P1GRVD8VIv233CekVEhbgiycfZ7gpUnjBer70J4JVzCMFO19HfY6
	cKQwz/Kx5x8V1Tv7Hd7ajZ15ZVgTgq1500aNBhiEkw4cJjsaW/GKch3qZ2hhEQ==
X-Received: by 2002:a05:7022:f502:b0:17f:641e:7f6b with SMTP id a92af1059eb24-1b3b5fbb37bmr3713432c88.1.1794298709534;
        Tue, 10 Nov 2026 00:18:29 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm5236759c88.12.2026.11.10.00.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:18:28 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Tue, 10 Nov 2026 16:18:06 +0800
Subject: [PATCH v6 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on PLL
 lock failure
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
Message-Id: <20261110-dcphy-rx-v1-v6-3-d681ba20b36a@gmail.com>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298691; l=1478;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=NxS9d/s7pydolKNqGjxDl7brlQxmJp2mA7Qr0lzmsSc=;
 b=hK5LSp5p1KXM3oD1W4e88Z83BYsDKcZyvMoCmAJHxlugKKCpNWqKdoE8suj99bc1BLXvTOoUG
 0d0VgAU4krZB9H71TVakaDDs4idjmzjDPoUED7Z6C9RnSeNLvWX8nph
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

samsung_mipi_dphy_power_on() returns on a PLL lock timeout with PLL_EN
set and m_phy_rst still asserted, and the PHY core does not call
power_off after a failed power_on.

Today the APB reset at the start of the next power_on cleans this up.

A later change moves that reset to runtime resume, so the leftover
PLL_EN would stay set, and regmap_update_bits() would not even write
it again.

Unwind the power-on before returning the error.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/sashiko-outbox-174059@kernel.org/
Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 7382043e1f31..ce1bc62497c5 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1343,8 +1343,11 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
 	samsung_mipi_dphy_clk_lane_timing_init(samsung);
 	samsung_mipi_dphy_data_lane_timing_init(samsung);
 	ret = samsung_mipi_dcphy_pll_enable(samsung);
-	if (ret < 0)
+	if (ret < 0) {
+		samsung_mipi_dcphy_pll_disable(samsung);
+		reset_control_deassert(samsung->m_phy_rst);
 		return ret;
+	}
 
 	samsung_mipi_dphy_lane_enable(samsung);
 

-- 
2.43.0

