Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A952847CC82
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198235; cv=none; b=sj7jfgnHUiPitXB7bEMEcyeHjqjzPC2zrmK8FCDtuVcs8TwVHQVNoU/BPfTTSg+ar4zr1YaYmx7zmPLYnYBSWJiR7g+pBe7AettHygHvU9o6aJY6K64XV3xq+miaOEQERm3SmbC98SMqcg7o/nrgjieb9GkyDGAw/tvw9lrA/iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198235; c=relaxed/simple;
	bh=7XC4HGVLx2zUzTK03WD2Iz4aUk+0D2AfO1mgwhTssbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=luZKeNMCOEDVDCZoT/mrMVTrnq+4aR2SBA5Eh77YbIbB/MvMCZHjko2qTqkHgsL+Rb/22TgXD/prwL0SfkMd5EXnezNE5/fZ7YKGDI7ahEouFavHGTg17QAzWD5iGdEW845TLAaYT3Plb3L91+WarLaAnTF8V0UHMa9S4FIOz0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihK7ZgXp; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihK7ZgXp"
Received: by mail-pz2-f36.google.com with SMTP id d2e1a72fcca58-88a0f29ce98so693043b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198233; x=1791803033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IaeSmAbEdNNCv4ePy9V8UJGOy8eNT4mDncD0icKlLB4=;
        b=ihK7ZgXpGngv/8koHz+M9Z/OkYcs98kFBCZq2EMIfaY81WI5QCWVu0KXCC9My+R8Fg
         MZ86isdDscj+zb0QPOkJrvXxwxecj3qKt9IqmmkyqEDnZuBvP1A8RxHuK0/WbXfbahg5
         9dQmcWBHXuUpjS5HANknaDRNcbykUBtgzc/3hT/ZNdtb+nV8jgGXvtrvoZTYxYDRe3KO
         exS/S3PpcGlG+qy/VR4mzgwdGIIZfFcSwbd4BgqNIi9U56Vk02N6tlN754f0MUE8wVUY
         XtEZD0gCuoyvmk1u2syPIt3v/tpQxUzawDpra4CNiFIIcAMkpQWwbJteUJOn0wM9VCA9
         H+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198233; x=1791803033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IaeSmAbEdNNCv4ePy9V8UJGOy8eNT4mDncD0icKlLB4=;
        b=hC4BjQsHNX4b4rQyEXVbbDpp0lqS6OjqG6feiy3N86Obw/7PYeqZv3+HO04cweOs5T
         OU5lbZaC7YXgnjOuAaOE+pp/F7lONTA9Dks/4GpjwQSQDF6VLrdVfYwo1dipfbhEmbrf
         7gVkJPfvvaXED3kJ3rFHgAux7jCdH0RvZXM56XH9qaMOdPHYgJuhX/yxCqTuHcEZ9vdx
         5dpJ5NnCLXrJSsZNaYeZ/4kWgYZM3SiTJ96/mN2IjuGNsLrsOYSuRmA2dVV9UTAGAPRN
         MYk/dCwTnrSP4mrPm5OpJ27ghUM5oZi+xk4i/YBFNI3q16nxsJZ6w39Trf3QopLb0goa
         iweg==
X-Forwarded-Encrypted: i=1; AKwUvBxFHdRyuWq9f/Ulg54i+miUgMevwFWlzuRxci6U2d5w5ZqGdUScusO4dgJUhsUQdcA4jH0lByPHt+1TZtA=@vger.kernel.org
X-Gm-Message-State: AFuF++miMO5wUi8l49PM8fCenyGcEicn3mLekJfD/9UGFFw0MoX5f1Zb
	urdcQOJA7jLB/NI9pFmJXxkIawulbbPzVuViaJkh2pcpH1FB+n97gemX
X-Gm-Gg: AYBFou2tPu/ukT9VbLyCQCWt7YImg1bUOK0bJn4tBXcErReILWKomXxpcAUBXONZDaM
	vHZ1CPq2I3H84b+mVAkzABKZfZ+G3kGRYuJHLbsjaFdSPD2LqiLePrMUwu7z3o6CoP1R26YuyDy
	Zi19PxYfVASK/PflKqYcr4VTOtyx7hNtn4Nm/5J1hdcSKe8ZlB5Kidavi6HC3cT2C/YvGJMkTZE
	d1CwgnLOzUjPP4ry9B5hIXT5r9HMjgTFhWOA4T2ENN5dyYiK1ia6ytSd/l5JPHJaOFuuYXasymX
	Au4hfLCoR0fZHp6KjaCimFvbeUzWccKGWa3hUuN4eDEz58Y2X+gFUFudLQJh/wJltg3MqR/4ugT
	aOt9T5IM6YbIpzCDCycNLQnJjw0KdZF5ojkTIJZsY3cvTa1sRZzS+w7sj2UrJoG+/evVVGTS7rT
	UAWCbhy+tfaucy8gHA+2M2pFb5X5wCelUEuQG0AAZ2hIbbUIgvHPVerPt7TkVX2h37eHoVBwwql
	7UACqvPxqivO1lmpVi2N4Xsgc+4DWmrqOhyGqGNBn/wxqyaWsJJzx0RZDFfNN71OgpUjR0mD5pv
	Y079kK2ZV6ENPw==
X-Received: by 2002:a05:6a21:b82:b0:3d1:39e9:b261 with SMTP id adf61e73a8af0-3e0bc6b7503mr9745642637.0.1791198232809;
        Mon, 05 Oct 2026 04:03:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 08/14] ASoC: mediatek: mt8195: Remove redundant error message
Date: Mon,  5 Oct 2026 18:02:51 +0700
Message-ID: <20261005110257.50145-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
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
dev_warn() and dev_err_probe() call is redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index bb357cc674cb..1bca2f62e76e 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3083,7 +3083,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* initial audio related clock */
 	ret = mt8195_afe_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "init clock error\n");
+		return ret;
 
 	/* reset controller to reset audio regs before regmap cache */
 	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
@@ -3130,7 +3130,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for asys-isr\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -3188,10 +3188,9 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
-	if (ret) {
-		dev_warn(dev, "err_platform\n");
+	if (ret)
 		goto err_pm_put;
-	}
+
 
 	ret = regmap_multi_reg_write(afe->regmap, mt8195_afe_reg_defaults,
 				     ARRAY_SIZE(mt8195_afe_reg_defaults));
-- 
2.43.0

