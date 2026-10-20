Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517871;
	b=tCH045stRl+8RFaT7S6NC0sY3EjNNWXVquxlcI++8+xxHdmagEjUpMGALvQIK+UdF53u
	 zpeaGook+YbkscUaoceZgcFVJhB49nB14BQisKnkotJcH5kARRk7r562syU0rM8ER1t81
	 xSK2gun7jlX0mAGZXI1nkPSY05OfLjleJEBvohbIxAmEBVQb5nG71Al4B4IF8iJA5B2c+
	 koxyrWnxiV4Cbv/1XucRdzG0e09mYpkyLFMqd2XG0ie8m6WNdB3IayEuANInxutrbxPmU
	 rvVJQpPpZvNm6c3L6eGU0V/p1ytTPmMshiLEN40GR7utaSdYxSfzUvCFZJy1OA66fhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
	b=QZHUKqn3UbNGcVUOk3oJe4IF3FQ1nMUsZ9OxCaM+nTzqw/LC3hr8zXb+q92MXQXGUG5w
	 kn2i+9JEhC5s24KPKrmxK5z2f9iM8sXxeWQrRLEV874ZG6Buuj3XwbAq+1hbLdrEd9q6J
	 XCOIYr/1utbTz2K07MyOQVlcbafd8WpESHRTNWn4alv4kJ5wwwKWVvw9AofzYXX0sNyuc
	 rDxcLSsknL1fLi2qmfJDCWTuHiaztpB7rM/okSQJ+MNxNF/NCkQ+MjJqjWbHZHxB2UdV+
	 0c8+JNnbI0v3xHdu6SxMACH4bikNB0SuVW3Yz+eVF7wipz3dK/ORgRgYayldegL/TIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L48N4DES;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFFE60A3836
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BFFE60A3836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L48N4DES
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so18807135e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517870; x=1793122670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=L48N4DESJPMuvTIdKy+bXJAL0dZnouK6wG/XF2R1DWSaZzsOTOsvBy/sGuBN3pyhEQ
         QAxIwReDLqmluK3WkWr/pb/iKA/CgH9xAf7bJUntUWGgIwRFGBOxJgAffbyEapj5s5Ax
         Q0WNz5FmO3zq1gD0DL+xeT8pKuIgd4ffIHSk06vnA1B9R6Nf3BwiTdapE5X7ZjQTSIbW
         IF57BlZ10S87JVLWyj5n2lu6oSZlmDckSMXEd3+A3l8+OyjNrLGxUK55CwPTE+OqhEik
         cKpe3KC2ALiE2wEBsknqgggnq0gITQtCLCSXTFp9yoYlHP7WAlPYS1LC9DOmKC+1cAHm
         BjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517870; x=1793122670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=LNR1iZRSUVGckBDpqCADIeThAqBO0HmhpHLNr8RvR5dvlfUa/Brb7RCFO4NAT2xxKN
         jO5e7i5v2jiiYIN9A5X5IoID5Ma7N5Ak1WqCytHPSu19lKBI1yRrReLhD9CSS6e4c4w0
         yVL4wjPZgilhDNYmR1nI9MG5nv6Pw8oLpf6RbY/1Is6Jcev9Rr9TqwNpOq3V3Q3nZuKO
         M0a59ZJORhFDC1ALyhaJ94pzgt6v7D1/AzeLnYxAaXR9Nwez1PpNOG+q45TsYvUx9BOs
         Txya0mLhnoYbYoOEYAdttoI1DJOsOaiyW0pNeKLTctRkvO7YE1tN+KKKFn+JKH/Z9Yh2
         RR4g==
X-Forwarded-Encrypted: i=1; AKwUvBwy5TWKY09z05Md8mFNPmTINYYvoiJZ8xcgpc4LzXeZFd9i50CQGy50ARJnhECkRIeIre0N380hzHNtlaA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5s/nS0jI/Ltf3gnqpNvVJAgLFLJJvulEmPL3Jq04cCaVpOVVz
	vNvIkbFPaQkYa17wZbSIq2i8TXyciUc2E+H1yjXvyBpJkm4qeCHg4vZi
X-Gm-Gg: AYBFou1dSOWLqvmY9dk2yjGZqZaAuJXqByEk++Ctx8wDZn80cSB5QCYqPZTwEimy+Al
	yzLpP7Xige482p4kqRRTxS1XcBO4Vw8Ctjz0wXLnV0kjuRM4aCI6VFYSBnZKZR4xNvUw2l7DMv/
	bRnwTZizh/tO8RoIXxwsiUXg4gk1VDI5o9rcNabTObZnvXJUAcj6ZfsPMMGmrXhUFpGUwzjCleG
	p9jH3fq4ECRp5WaV+YcjEQebQKs4UWJgR+PmBvS20ukPomkSMYKw6liqxfxftbXoKMZPHTLXoRn
	7xmFB0emSDpWM4H7MhsVuXSKyuUXO5/DWZU1LbxQBqXd1aHQHr24cZ5c0JuBJzZp4Wq5WudMb7b
	A2NE71GmMAine9/bhhqF/cURtEBYaIEqN3PRGJrUQzK/akYzXbF4Vw47GbWXq6a9A7pbrTw+Z8l
	Vk7bqnRL9WkiDqUu39fxcg1ljd1hMKYYSbrRAeg47w5nT2jxWmdHcyw8L9nzyBk1+zW7Mqdl0nw
	Yyw
X-Received: by 2002:a05:600c:8706:b0:4a1:946c:953f with SMTP id 5b1f17b1804b1-4a1d7601873mr254696305e9.20.1792517869433;
        Tue, 20 Oct 2026 10:37:49 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:37:48 -0700 (PDT)
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
Subject: [PATCH RESEND v10 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Tue, 20 Oct 2026 19:33:27 +0200
Message-ID: <20261020173556.632798-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
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

