Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356B14AF9DF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377756; cv=none; b=mmfXs/xrpiJthfWAEQyTYoIZBELFUuwn0Yf7u8mByW3BlN0M/TQh43V80h0AMiKdt1dvbxRWNqsXKU0kwx3ZrPAsCnHX2S5lLeRRQkcSDSwKPTHWK786FzXLP7A7Qkvo/7GOZPBvLD8D3lcOFDMVajiz4DwbBM+xcK0dA6jmXew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377756; c=relaxed/simple;
	bh=ooP6TPJaU7E3qtlNtmtW111JJoBfcaG4ECdsHkhEnPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=unURW5BmXtMR3B98AZc6YcyULexKPFhTCz+pMQPO2WuyuYEeCJw2vbv/WxF++V6KgfZyu1c2EBdf0L8bATEw2L2W9xxdEHUcsJxgu8Z+Eg0KXYYgTRG4lBkYXJmoAza/hPt5J6Hb1bJRfcKbj9y2oKz9+KMREM+Nb/oDFTRn//s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/NvM10z; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/NvM10z"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so1039843f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377735; x=1788982535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=n/NvM10zwi1pwbckGMiFNNtWFaWPvIPorKJuQKrHNhWnfQfz1ECxOwI4pzR3OEK8LT
         EZEmdJRltT7aWp+9gDl4mRl8RURw6pWOkSWTaZ/+4QfmKQYQdJjyCuj9qwie7jXKJsjB
         IQL9cNE9RR3jemk3NgTZBNxIu/+wb0t3I7ph5Df8Y/cojguvJx9SW8DHYhIlgA38ESK6
         MO3wxoqYNt8EbGuYEDQRxFt8543JTuvn0vibGJnnxuLHBjPx0qEMCY28S8wD7fFcheK8
         iEvD70TAkA0fr/KESMYnk4PBgr7vh+N2JgeW9PHXH+6nrXgFtLJbynGG/STRBTRdy9rV
         NeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377735; x=1788982535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=Ps5r38NPjunAkxIGkzUzhWgcT2a9BD5dWbkQypuZRA8ubn7tSWkXn5D8Ql0oxkpAfU
         fdU6KL2Xiaa7HM8n65shKdhIka88J0z31q9zVcdsb2ALH1YXMyPlG9809PJyV4irYSJP
         a2W5yGxKQ8vq7ALVTixxNcXsDiSnfvL0X9LSb/XfO7NOCsymEQ7fVtNCwmSdVDWa2iS9
         69D7D7iqAT/Jpa+ODlQ052Bg88Y2AmJcI6Ps1uzYpctvrM38gWik74iwSyPaeZreykZh
         W6bNWjYbVZ8mFUOHUEGWU2Y99OPFiJOwITaSbrOrgRCXagf/JSrXYo7vGJYesj0z+jFd
         UpDA==
X-Forwarded-Encrypted: i=1; AKwUvBxrxchxue1MaYgdTEX30k23r8rBrqtbSgR3i38cnnmuNpIxLUYrJppjAJGxdQNDbrPDmzXKZ1OdxLSlVJw=@vger.kernel.org
X-Gm-Message-State: AFuF++lmqEmKp0HSiXt0LV+iGK1LCgHLjuel0kf1Md6qxOk+sZVMUBHS
	2x3jSIwwqiQhB9Xhe1KQBd7wnSIKrtHiM48WVmx/IPCuQbcAbX2x4t0C
X-Gm-Gg: AYBFou2ZXzY7SZQwmAf34USrAmFg+2cjjHsXsMmMDSYIizPKWX3RMNuniycyZ0cIu/K
	vKSDI8BcBnJdl8mkjWk+oiGaMdVDKxN6UQkbR3KeeJKQCJBcZgiFZnQgPGf3aZVAWMjxTg69AWp
	VS+1uvXKNye0y047fuvzxgf/aNza5ruGknv/pA5WoeLfEJ9spZPvvpack6SYn1qux/8gI7vn5T6
	n8upa2AR3AigFhR0nlLASITa4fzCLv149BFKUX10cUryNjJIFsgk6Lj5cMYiKqF5pT7kpRhogXC
	XKprR16QvePvCXbjGbN9X3Ko+ZTZkT9vLTAsngL97Z6UZ2b3Wa3ylqRyAU8JMsRTLc9vykSfS24
	j+jTJZgEHaJ1/t+v2IysnX2dQpqxREStvUiJhMtx9JSwkxj6HQsYlGTB5dTo02cKWlZdCCpf1Kx
	BX9ckJXebZDZ+mSql6SAjSAG16Rd8OtnQ/JjcpsoU0b4SlpOhimshQOTPW
X-Received: by 2002:adf:e19e:0:b0:47f:f20d:8d4f with SMTP id ffacd0b85a97d-484913b9852mr14461136f8f.18.1788377734976;
        Wed, 02 Sep 2026 12:35:34 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdc37sm8889191f8f.34.2026.09.02.12.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:35:34 -0700 (PDT)
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
	Julien Massot <julien.massot@collabora.com>,
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
Subject: [PATCH v10 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Wed,  2 Sep 2026 21:25:42 +0200
Message-ID: <20260902193351.185771-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902193351.185771-1-l.scorcia@gmail.com>
References: <20260902193351.185771-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

