Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580017;
	b=IWUSXmbFeMf0cuKDjXTS5jehji3+l1UhxVp5IszG5ED7VNTrl4helY17qsDZY3Sv6U/3
	 L2fXjAlvFRcjik9kZAWJ40gpS7XE8O6OkA0ANahWEl6laFjt3r7bZ40xS4VkpBRAGhgiC
	 TulqnzUdDMtdC40mV5kgM3SdSkwh9gVFRUqEc6DzryNTyqVhcuNdIfinZoxv8A9Udjpun
	 DxnqlALXeJa3REIFF/XRsMbxGtaDUabJFUhEzTZPwLVngCcaQ24WBC0ViZ+GzLenUsjwh
	 Pmjiv4KYGwLZvfqSCskhnsRuSIN+1SfDzBXSqgCIUOUK8qsE1BHwLATuhJ5SLAH6eCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
	b=v2VkZBj9zOWfTYwxeigaKnrfnc+Z7DwmlV/xNXcH8So+YymTP1esW5+yrERc1OTZjXDQ
	 Lph0PLACfLhbL+qw5uGs7JMVyF9jcBAvz0EAqiOZqTScFvAcSv32CQULcne3yVSitoGHh
	 BCtdsQ/rmVCj/DIVQj9kulvteOe1WbmP+a4AULGmS9rzQkk3CLMXX09qyiTTaLGFtEftE
	 cep9NWqakiel0RS0D7K5GYdSnZ84pKskZ4SPT4NsDo1A+WyAGqmhDaL10z6FvhL3XzKeO
	 7L1uUifiljwh84lKAVnvYbw1xGwx3JEFqkg/A7ydDPi3BZ3YDSgHaR+QGpj5zG2MP0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VqhnUmc+;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29228606A326
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29228606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VqhnUmc+
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so3748915e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792580015; x=1793184815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=VqhnUmc+IfS4dyLcwdf6o8jCet/Wr0E/jiJ3m3A47upXon3dtsVNqNWa67BzvlHBUg
         ctS27FXdI9Vsl+CAa7WYOzKIREPPU7di8eIWog/Ufj+GIrL+tg8tanndzUB7bHx+uhxt
         0JA3zlkJQxmu4y90tnFA8IGi9wup7y4n+aGLTxzHQmWNyaih7TvvP4H2cO37qcgB79oT
         KrAikpDILAnJbn6WW6nHFIcyUnyam7eA9xBRQ/ojAqAhpibdE3sCxV2qS6sd0FnAbvxq
         i4u4Fl/3EPgYMy1vfV2739UAO2TsCYI6ggwO9g5cPSpWXjmNe0zrB+BGOXoMiwif03e2
         +ECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580015; x=1793184815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=YQCCXCRgotKS1wCaF9W9sz0kaRULYhbK3FYMM3Rb1nREVS4ln8g1FP4O0MqFC6aXDF
         c8aFkqWHCZ/n6JEv3cjbJVLEjkChHn0ptOOT2XyrI64VMgjC1stNGV6YwnKwsmLP2ETJ
         UiTIfKUZnp2PtV1sZUdOVJhgtZfw2JWZ3Y4ql/rcgh8fgc6v9jHMyqudGpLpD8MQpCBu
         jQOCH6i72SZ31ZguyFAJnFRdyLuUYYfm4aAzEslBAiropMMXyFQlFUsvCiPk1GGuxZ4F
         l6dC5mNByjG2pW4nBleywzQugFh03Ft7LCnPV3wYvcLj4zP0o8b1C+cGi6IBdNgFjd+U
         IESg==
X-Forwarded-Encrypted: i=1; AKwUvByFQLF+8rrENv8wuAJSdhqvdI9Go905l57PzHQGx/e+OuNKRIHjirCpq6ueoW8ES2B64JfzutQWwl9z26o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQWfVvyPOxYCgfCaZ+43eyw5xXdBAcM5I/a0xblpk73fvQKsxX
	1bttZ3iO3EiGZfgiDHBXUI7OxPyi2ES9u9W8Y+wexRhzF2TAhLuBTRuX
X-Gm-Gg: AYBFou3z2i4X9VL8nsDidlARHUbrmsl7sFliN9GteS1K4Oi+ciYhpLQo0WVF0OuHkcB
	BQZDVi7v+PdpHvGVjuIbP8B1Z3QTAOswDlruK//JMyx0hRUoED2Jj+bJ2OE1h9BKJYlQZh6SUOv
	oS94kSMTFTXL1fMGviUWSFMJcA8qBJCwJ1aQ6rM7XjnQzQqfuSQ0fHKLLq6Od9f9EWEoN/L4cJy
	AwtyMhTNmOuCCJeAMDqa+GC2lsvoCcM28/JR38YModKj7KyxtJBUUAvESm5c+xqoLRwQWcO+qCx
	WHjfX+szTZCu5Oj/qKjlTjGcaHUXYXPEit8OGaQMsK8AdGNwNvmqBBzun3p/s0LpCB/pHHAZsn3
	JEd+QWSlBesPcTra8JpfxljS3KK9h1w0bZt4QcJqpTNVAZ9MHQluNmcNOcFGfh71zjsZMKf9PxW
	fmyHLMGr7ghat4YHUZc+zEX2UlBMYrjnOBMw3Q/Otp+CAuXxIiwTWJYggBn7tboPcySnFXFd9Mn
	zZVu4mysDMgbjQip0v0/fk7VTEt9zVGXcQRxLLtIt8GIkZckxrh
X-Received: by 2002:a05:600c:3f0d:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a1fdd29c19mr35588045e9.14.1792580015036;
        Wed, 21 Oct 2026 03:53:35 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:53:34 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v11 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Wed, 21 Oct 2026 12:47:24 +0200
Message-ID: <20261021105109.199886-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
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

