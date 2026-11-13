Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588450;
	b=3vRlrquPxo5yOoi2DYqzPriTz0KtaeH0rbeo8kFI5sop0kBp+Shf+ZmGiy/BrK5AxBtw
	 z9xcQS1cR8Bo1iN2BgfXa9r5BT3S2e+p70kpYIKiGR1o7fpvlN30J0fyuvJx9zuZgoka2
	 pXY1FYwjWmfW/ASX91F4iryzNPAfa8w0BwsJt2TP1GKO/casufJjfcHqErZqN4mmCrUa/
	 uYb/CIBV3q06iuKTZ/aQ2TkYW/dU+V5Eu/Pjjp0IYnxD5Y9pBBiwjIuOjznkWXwFATmMR
	 rPCyx+01sRIhR/EYJPfkJ+imAU3zKXpW2GWQo+L43oyrvtW/LMT9VlOXj7Co4GQheYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5A95SHcauoTnuHojbhqI9VffDrdxRgwLa4QkgyckIoA=;
	b=OI4UPKbVb3S06mMst2CeSQ9qNgMPmROjIn0SimDDec0PRXQrmO7MlZbFFHMrMaR3KAGY
	 MM5VfOxilWUlDaL5ct4oL4KiZeVuOyDUqw7lvFYqwcnSdsx/EahgON5kJhoYc/ys72pfk
	 9PF0IBAkcQBMDdKqJxn9eLVwvq0YMUdPADwsOl24beyT8t8LTV8N49Pbksw3D8PPWGTBf
	 mBHdKfJFOZrtc+lWq23+c2bsPQgJGO1zrSlDAbpuyLSdHXy/0KLbLrTgkO9JqVwgnYzU7
	 Tga5hr7VEdwKM4ZhG8YAyKEf0lCVHCX+HlFCRFBkDGAFQQPswXnMr1kRBijlTWeWSPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jlfjqfLf;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A64606A883
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A64606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jlfjqfLf
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb9d5c1c8eso1172811a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794588449; x=1795193249; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5A95SHcauoTnuHojbhqI9VffDrdxRgwLa4QkgyckIoA=;
        b=jlfjqfLfYOy1yFLSilCSpkrKAGpO52d/W8N5CvfIvgF9xg8ctmCnObko507JQk7OtD
         2MAUHkf83N1p0ojbIKNYQLSHweUidf6UP+DYAOskK7J0gyLR80KqcIM+4ERXRttlCpT4
         kHC8EYq8VErFwOm1iYGiuz/UmXLuwlRjLxTCI4pGdt2WSmLFYRi4FwYKas/lHaJVw/a4
         V7cEQ0mbn8Bu+DDvRElYNoczoOP+KP5fjQL5AobmL/8IfYDvL38IgZHVcWJj/a8e4UUV
         dqMSQQYLptGT+TBS3VzDx+pntiw5AExtkDo1F/Dv2y4E+hatnI3ObDBDMs07WG6aJ6k3
         9oZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588449; x=1795193249;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5A95SHcauoTnuHojbhqI9VffDrdxRgwLa4QkgyckIoA=;
        b=R56/22WoWRgLpPWHAjH3SgQUKrRs3ZuEqPmjXZDRMk/H9+Mkmyw3aqoeqWoZsxLK8p
         XeOuY0Qnyn9D+fuMFFvZELUReuBzpNJBvur5eB5NEcQddLklrJjKszyUKdxCk8KjMp88
         1VYaAPHvy+H1GfH5Kr8rsB4Moe/Bqe1VeeIfQlES8pcuibCpuye8iNvQ1rewqFdeyP/o
         AyO3jmnfa225jJltTFCCkXpuVRNnZ036kRQIROPqW4ZFF2BNqUiItTjvInujhwdqbYWa
         PScqJBilUCRaz+mtN9WkMUGDzGD3dTOQzfWXxNFeA2LjA6IRkLWBTJuwpfcBMLpfDjbx
         AVrA==
X-Forwarded-Encrypted: i=1; AL+hErFIxANELZRXfQYFSgxYoEA0GVL/kC6pIz4C5cUcF5rzxPxiIM9nYAXghtKGxrgakoIa/f8mZno3wGJlpbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8v5O9gK0Z1tIhtmPynh8ly9MHiG8WbGaT2qxUf7LqEmR2U4RQt
	nrYhId5Ypv/cWd1nKYCl9NNS2m9fcqBvFoJZrmi+2aelfJcaYvmPH94X
X-Gm-Gg: AYBFou2ct7X+IR6Og6mf8sbIoKMVdV7r4vwDktNFz6srYQidSdZs0eA5nMrLlbtCu4x
	SB6xL6lk0FlxvkWZ/AiESYZ8mYB3RUETIVGWTKft9VDJsicgCcui2ILE/nKfTf2FeIxMyI9ha8x
	YpU4VS6Fqj71oHdz4pKlV3CXUtzy3JSKh2iw4vkvAmdak8LPrq6r/PXE+sBDBzLPon5CMFmV1af
	7M0HS6dxXJhKLetVI42gx8QmFLbUFdnwQABnJDyGc81Sc5eVz4niYmgfLDoEkJJwRjKOvRraU+J
	rMX9KnMyU2ilUojgSgyOMDyBnBHNEmdkCYYJYZn/ebvgFwmcpcSXz6S29breGrstYUxX+t/Wihc
	BhmkQT7FAxgVVQJW5Rr9tQuM8qNEczkJ6qdckIRUEDHcAsw01f7ZvwDHVcffF0CiFsps23Sy9Zj
	4fqFMyDusYZwQeaOtXqSU6GwlsvefJXsZ0qzjKrBYc06VS8/3o1n8KM9SLBosgswYcAQ6S7dDQg
	hfRJ2+LIMiy8yclWLbiNDGsM/ujsEmQg0VZ5hosQzG9cooKV2N5Gqlf91sc8+Ryy1Yk2cWPKeo2
	znos//3h+IqWhw7rxeWAWUKloXUe7AfwIH7AuH00+/GWwiNxVd+a8rJ9LgiFcjbSmNymX+WYRvo
	6g1UooGmgU7KshLbduRELeNV3Og==
X-Received: by 2002:a17:90b:4b88:b0:3ac:80de:44e8 with SMTP id 98e67ed59e1d1-3b1b0ccc955mr2999783a91.43.1794588449260;
        Fri, 13 Nov 2026 08:47:29 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:b6e2:c438:aa16:9bcb:8e43])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb179fasm5208924a91.4.2026.11.13.08.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:47:28 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 14 Nov 2026 00:47:18 +0800
Subject: [PATCH] spi: sunplus-sp7021: use
 devm_reset_control_get_exclusive_deasserted()
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
Message-Id: <20261114-sunplus-reset-cleanup-v1-1-115e32fe8c1a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTtJhyAQr2JcQP2RIaQ2HWpMC
 He36vJbvLeTISmMLtVOCS81fYYCOVXk5yE8wHovptrVrYg0bDnENRsnGDb2K4aQI7eTOzedG53
 0oNLGhEnfv+/19rflcYHfvjM6jg8hFew4eQAAAA==
X-Change-ID: 20261114-sunplus-reset-cleanup-6f05470b018e
To: Li-hao Kuo <lhjeff911@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794588443; l=2080;
 i=ustc.gu@gmail.com; s=20261030; h=from:subject:message-id;
 bh=JcZjEJ1TO/syuDGRI66mvFtAh2Bdb9V+mCpS/CvpiNg=;
 b=0ZOADtSIFnLqUjn6nFxYBbpXzP7GerWKdiSC4u2ccRs/jro+2b1l2OrKvkF8aH6tzL9ttaNjT
 YDdXrg0g4ahAefejX6yx9y/+UBqmabD6ku+cXGhPs8QRJd6zBx7Kvre
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjDJtbnSeysEBjmOfNYqYUUDS6g7Tfov9W5oGngTBfo=

Use devm_reset_control_get_exclusive_deasserted() to replace the
explicit reset acquisition, deassertion, and cleanup action registered
with devm_add_action_or_reset().

This simplifies reset handling and removes the custom reset assertion
callback while preserving reset assertion during cleanup.

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-sunplus-sp7021.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-sunplus-sp7021.c b/drivers/spi/spi-sunplus-sp7021.c
index 54431c363bbc..abb272dd7250 100644
--- a/drivers/spi/spi-sunplus-sp7021.c
+++ b/drivers/spi/spi-sunplus-sp7021.c
@@ -393,11 +393,6 @@ static int sp7021_spi_target_transfer_one(struct spi_controller *ctlr, struct sp
 	return ret;
 }
 
-static void sp7021_spi_reset_control_assert(void *data)
-{
-	reset_control_assert(data);
-}
-
 static int sp7021_spi_controller_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -463,17 +458,10 @@ static int sp7021_spi_controller_probe(struct platform_device *pdev)
 	if (IS_ERR(pspim->spi_clk))
 		return dev_err_probe(dev, PTR_ERR(pspim->spi_clk), "clk get fail\n");
 
-	pspim->rstc = devm_reset_control_get_exclusive(dev, NULL);
+	pspim->rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(pspim->rstc))
-		return dev_err_probe(dev, PTR_ERR(pspim->rstc), "rst get fail\n");
-
-	ret = reset_control_deassert(pspim->rstc);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to deassert reset\n");
-
-	ret = devm_add_action_or_reset(dev, sp7021_spi_reset_control_assert, pspim->rstc);
-	if (ret)
-		return ret;
+		return dev_err_probe(dev, PTR_ERR(pspim->rstc),
+				     "failed to get and deassert reset\n");
 
 	ret = devm_request_irq(dev, pspim->m_irq, sp7021_spi_host_irq,
 			       IRQF_TRIGGER_RISING, pdev->name, pspim);

---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261114-sunplus-reset-cleanup-6f05470b018e

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

