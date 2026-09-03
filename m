Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDCC23BD06
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411189; cv=none; b=WywH/ny1sUb7zBfiij19rN3ALg0Xcz8hwVAsPTpCwig32VMmH876okFS28mhjP6QaugarKPkjWmUPXq8wvPVN0I2mOsW5IL0AekvZlZ+XBnH7gp4H0BDnrSHjCzKBSUmO5l/hU+bUamYFztGGQmhVloNvIqLwhBkTDHjUd0GZR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411189; c=relaxed/simple;
	bh=3GhUN1YWxQu4bJXtiFoeLFL4w/RSX1buQvfT36CMNsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNrHMcUuIOir6A76SOFPKBha2ppOn+XI89JrlRlHkfIlShhcjNPNoGsimgC2YoifeJdi8GdMc7njAg2WzkoW1dxbKTxsd/IQY5EfLzOlSiHRqAM0SxuxPHQcFWZWJWOFFWSEJgjVeRn5eo2SYJYC1eFxSH9uAOgwyqNM8N7r7d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=medGUtK+; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="medGUtK+"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so2092277a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 21:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411187; x=1789015987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4ksl9SsTnU1qraDN3sQ8M70vtHGdDPB0HKfqeC0tuc=;
        b=medGUtK+zwgPcPqNiqnsb24JTkDaQqeihSAJbSe5lZ296VUmAt2ttAR8AcW6cvu1XA
         VCOEDaYkBRto834W/C8O2IfbRKy+2xzTZI6JZr2TfxDKJuLGd7/I964VMBiaKlYe3n3N
         yV5vU5c4Y+wCmQlILojZocSXL0DHDq+YEvo/2ezQyjekPOl7iVizrmwaGtcqX+Y2KtW/
         xZ2X+fwIujT+YZVIQExNhMyjO6LaiuJE6b/cbQRqipyNT4YYImIzUerF7359ruTQtPJ9
         Ba7/ejneD+g2RFBPaGKOhp2oL4jQ07u1mMj7JYovztd5pZxjtiSL72KQBwiWSTq3UPWf
         WGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411187; x=1789015987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a4ksl9SsTnU1qraDN3sQ8M70vtHGdDPB0HKfqeC0tuc=;
        b=V8hJFbZX5btx1m4LH8i90AnplrVXnxQW07xqJhIkK0uD47QuZ4O1nGEUspBFqKZbxk
         m1oP7gSvXfztQZrVnhccebYPtMlQGk4SwWSLSxO+YthysVEkDcBcNWsRq9ziglkqMekI
         jwx/oZF2xi6XQXC9QH+FQPTpvjRFBFNd1Ff8rTEZCLztBhVN7En9VVkbeqDfGYl3SvA4
         hPtDrbMOqdAbLWkAEwTn4R/95Zx033X1GRqViGsiPqpb6BB5aDNroRP4JmgM2DiBnV0G
         EMSpR0IU1AfsNi2qHet7AKhWh4k+Qoxj36cQsHQlO8NdfHqpxiFPjgBS5N3PSdASc50z
         qt1A==
X-Forwarded-Encrypted: i=1; AKwUvBzmKZZOogQNy9xpr1dDQrRtk++7vn9AIY/00HcUpERjk7Oqlpv6MBkNsO9jniltWrWffGVMeFKbRRSP+ME=@vger.kernel.org
X-Gm-Message-State: AFuF++nq4+LeTcAnasAba3UgtL4ZRUbS7C9vrZuKpcVMwhGuuuVIVahg
	NaLjJLi0PVU1imUcdkbpe6WquDUNyzIn7m701JkJZ2hT/DyaaR3SogsjIarKXQ==
X-Gm-Gg: AYBFou1I2664s1ARQyKi3EL485jJP7QBKA+MgOJ13SPzNSunBk+d61f6dwjENWb2Tnc
	W3ARIYmFNKExP+7AUyuaBgh1nB81RNhGbJXE8D/rmrkjgm2GH3bzrKHmGfpaoEwfOSYALbohoFv
	PAYPskWObRXxla9udH4mk3qAOV4PQUer0nslVuGO6lyv1B714YMqcIRcj2l/LBACCJi1Mw9XApB
	8B8uVmNSdTkBc7ZfGFV/qQ7CZT6r7wVNnggC0K7LM3DqUx1C5TeDEhe45MhDLBHX955otA3tdgQ
	O8LgVsSi8HBTof58cHw8ETxz9IUBuGV2VZE/uDj6c1zl56NOfZ2Xj4MFA257qGrNA0i+gBrctSz
	duiV2pUK3aJLSX9kZUzAbWSd1bHI5lr2EnwwqEJHNCpVpdrMDMOw8zQPnBChHvwFvul13omLBjT
	VVTiFQMaAS7IfyKuTc8S2mZSt9NQ+YG+iz8wU+z2nfctK6cP2lZL+Q7dSekzfn4jis/xhTbMAn4
	/9th36f6UKh8ZaVujmtEZKy3nJ7THZZyYw6NTjqn2r3dVBelPQiTKlvIqK6ABTqV2OK4IErxgfW
	rYZbvX2UAQnM7j5E
X-Received: by 2002:a17:90b:4407:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39aee219427mr14283857a91.18.1788411187416;
        Wed, 02 Sep 2026 21:53:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:53:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 5/5] ASoC: mediatek: mt8183: Drop redundant probe error messages
Date: Thu,  3 Sep 2026 11:52:03 +0700
Message-ID: <20260903045203.175337-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903045203.175337-1-phucduc.bui@gmail.com>
References: <20260903045203.175337-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add a Reviewed-by tag.

 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 2634699534db..46b7a2bb6aaa 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -809,10 +809,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt8183_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	pm_runtime_enable(dev);
 
@@ -903,10 +901,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt8183_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		goto err_pm_disable;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0

