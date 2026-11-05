Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908482;
	b=Y0gFFMaahPaKGVjhR+PvEVwwgUmAsXLIafi0xzyvB0buKYm2RSJdihAxsndLYJn4PeOL
	 JqgcIU2G5slvoP8ZaWCFwAlX7WhlkdCV4iLs2xbe97YEZ/rD1yv7Bu7U+Zs39HnnVucWT
	 xwvcLKZ3lSlT1JJQ/Kl2xIY+syS3ACK4As8E6Qsp40UhnPrE+N84u1SiCPCWBPn2nBAUt
	 E3oD9neMoetaLKn6e35aJgWvftoLVxqk5K2fVw9lj4AiK8nq3O1dTl2BzGy3/wfrxnvmi
	 Y38BzO8EKKdju7o5qDskc6vW6ZsGROmuri58T49PDoJhl3e0lQVlQis1DJk3tGNpXdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
	b=CbIjMOF+zz+cV9GGH10rDXrHyVrKTO4B1bpq8YFsdL8gSHDrOLsb8Xe0cGix8wOpMrVE
	 iJakmXR5zlIw8e+88cXjK13zLxjE3LROIj9SwlSOAI7OQax82zDQT2crhpZPFADypB5Xa
	 nur5eWdRikkgtMZNTcukPxL+ZPNoiUp+OySdwWXR2QcLRoNscexIDnRYv1ZWs/MgLd2rA
	 Gctq8e9bBYbfYijG6aXGm8rHJOIQBT6EtqeBMPoBrCyzvLFYBoCll0h5npGxV+8YRO5bM
	 Q83JwAPjTwrHSv68wm5St4Ztdrbp9xD8Kf+fFQ1InEyuGffdy4TfIdKnsHdunHpUyXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mk74D3vu;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C5C606D52E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8C5C606D52E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mk74D3vu
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so21198715e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908480; x=1794513280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=mk74D3vugzXXG3Z0UBbXjsO5vv9fwUFrHaLSmpnapaKLj59lrS9CIODh6FYPMUYZcS
         iuVOY6npIpTyECG3UKm/6DjRfv7Y/TDgKQ1AzFdDHjRsU0ZIkgyFcwOLF876FS1ICGvI
         ShCDrobFbRdiXrsDDMd+E8Ndr5ox5zt37iaWXNXgSrfPn9bC4VDrIuVqkGFJEzW644KS
         vQr0Yw2iDSyZoWugNjf/CoDAh2E9n+A8sCBFV/R38uNwSJQeE55efL7mlobvAzNnGm26
         s6XraeIyXitNtpKyEtON1RnF8IxIudfAmDMsnVB0ypomWp6eUkRr7KPemXgud+VYvlP5
         M/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908480; x=1794513280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=BcrNRVApNwrczic2fzfXX70UHQGoMCFbGp07Ps6oQqL5PudOW40qAMK5He4kay6klv
         +YgWpgJf/PqKYVglRkdaei6sRBYWZ4a2vkH/Wlh1G9q8yc1wAwJED1Jv3b5ZnRj7IOpy
         xV2j+lSvKTqxofcZWFrxYl9L3LYz8rTJIWjWbQ3G6Bfr5Gi3r4ZE8ljxtCKP4EVj9UXn
         ku1GLnv0TCz33FRfk+BZ9SEQmluds+mH6Wfj0dQkXhmdHDyfKkcHKOYh2YQVglI/REXt
         thHOgHbOs8oJSN1lSneBebEUcd4adSjj402O2XBZM1qwiBEDGFVjTHhuph5NsNGD6YUI
         NhWg==
X-Forwarded-Encrypted: i=1; AKwUvBz3MtM2XTz9RdZo4QwI60WlLZSLjyC4i2fcpGCmA5aCudYVp/xNDuV50aaEeGtXhVvP22L4ZBi5dzHEpog=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lno27wTK5GRJnywVRZZ42IJE4FvXqBHZ7mt1blGJmtQyeuFjH
	uLNLHjt+D3/tRi16wQfHBd7q2DK0oma+71uczH+1qVLXIO7HX7Hl2ITc
X-Gm-Gg: AYBFou0IVxb1zD4b+XASAxC5qN/uDMWZLgDx7hCopabkxkeUAu6PVnYAFh3iFbed/3F
	azvQzQ2YRnKt2NJFiWikxGbY7q5n4CS8LveZXDnodJRxCFWEt8Ts8BNHSYeZiYBFjWQJ/+GitMQ
	fZTMgsCS42XoNS+vpjUbg6mRtVAqgSKsx96lpurOpa+JpRcbFn7tU44Gdkh/QhPzIDUV40twjI0
	nRXjKGW28JEWAUyrdjbC8e0trJLdUxfp7HfVaSWt1Ww7JjHyOXDLK/DTUO3YQZgZzwFZtloc6ZS
	fVBP1iRwmTbKTOL+4FuxfOXiLuVO48qzMvs9I/F0OlniyzcnYjiSta1CdX16AfLtD1YW4GoqWHM
	/vGANAORBmuXK/7TNVqdK3f+iu8QiXMaYrowcr56feMymgQ6iQGGQWmyx6tpLYhNtWOwlL3aBZM
	4LfJja5JRlFSWaXqwAje1Pp33oBKIvzNQv5l6qbdHW92UKDMsq88piRg9NCbcRs+slRkLKd1sJt
	Bb9jhImmoAq6iksTiU+Lu91nXSFzbK5YX1YYADGh2eUp6v/QeoBIMZ7SUfGXc5h+vQeWw/PFoO+
	U7ExaeUuq5mE6rKfiDxJtNF9
X-Received: by 2002:a05:600c:1f95:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4b6e063f1e5mr3032495e9.29.1793908480210;
        Thu, 05 Nov 2026 11:54:40 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm83862895e9.8.2026.11.05.11.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:54:39 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 5/8] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Thu,  5 Nov 2026 20:50:25 +0100
Message-ID: <20261105195206.3440-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105195206.3440-1-l.scorcia@gmail.com>
References: <20261105195206.3440-1-l.scorcia@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Val Packett <val@packett.cool>

Add support for the MT6392 PMIC to the keys driver.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..d758c7743f6a 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6359/registers.h>
+#include <linux/mfd/mt6392/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -69,6 +70,20 @@ static const struct mtk_pmic_regs mt6397_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6392_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x2,
+				   MT6392_INT_MISC_CON, 0x10,
+				   MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x4,
+				   MT6392_INT_MISC_CON, 0x8,
+				   MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6392_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+	.key_release_irq = true,
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +316,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	{
 		.compatible = "mediatek,mt6397-keys",
 		.data = &mt6397_regs,
+	}, {
+		.compatible = "mediatek,mt6392-keys",
+		.data = &mt6392_regs,
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
-- 
2.43.0

