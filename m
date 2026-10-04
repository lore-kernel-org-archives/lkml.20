Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E473F44EC
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093941; cv=none; b=cg6O99DCMvZ86c2TdPOj7tuH25Lq4pyBkkSJdT/a2utWy2bVtBygrDQl/quFAIXiTM5JyWNRdocG7CO8sdvGYIFP/DupUcsEG1xLpJtP6ykfqfAMgeMpO7n8udoHLvlKHeARM/iN76IaZXmkHUBbDbAewfzBH8iIDHwWezGjMdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093941; c=relaxed/simple;
	bh=zDu5vJd6sfeXYn8zauBK//VBQImq8vA1wPLHgVDUDsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AL+CweBkPPojEJDyHaVCzcnPsYFkEv9Geztzevyyycu40X+e6xe64mo8jzqW78k6V2dnor++ey6rsWCJYRk+S8ZIO0/vu49EKmIFZ8IBWDm7zLDwubKVD/XOvKS2gvKNjDc6tKl9hvuvh7WhKYqqYKsxh1HjQIvG5jhOqXqfs/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6MwoD4I; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6MwoD4I"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e4a4e92234so7551315ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093938; x=1791698738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Em5RHq8kurLglT2Y/3vN8YPxgrqKKepZuisLHT8U5Q=;
        b=f6MwoD4I9Nd8ft6kcMxheKZ+iN4mz9kB1Q66F7E6/qfEjc/Q2969wGwdrxNKDobkgC
         vpgQ4eF4SuhhPW5lYbjEvSrQhx5TGkUNNobU973ax57x28hJ9QymX/p8kQWCvO+Ube2d
         ukiLLhC8PNnf9v+LjHm1t7IQDOH2WKUvaqqyWCYmtyQwiw4RaooKrcsTaz9OzCflV5np
         RdnLgi8bh/eRyE9WsCGVsPuB2FEmh5m5SA9WXOa9zbS9mid4kOAUMods/LUCyGAlCSfh
         E6PpKqGkeZTE/wwyZD6BwJBaz9rsRb+nKD1jZCGUN1kdyBxSXJWMw14gOD7p6NnuU3tF
         eN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093938; x=1791698738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Em5RHq8kurLglT2Y/3vN8YPxgrqKKepZuisLHT8U5Q=;
        b=scp0cT9RSH9BY8BQDloZ6ZjLyY/AbjFOML/zlgqhuQU9/a3yijkhuNtkV2GbR/Tcbz
         RLeQAB2DONpCuTuz4z0sFeMnYEtlI1ABsuJX2AZZj2JWqpIsdR0eX6YELyjVYMkfCOUQ
         zDGaJyKS5I6VF8llE2LQJHS2IyZa+sPAbz6eJJQNNMN9MlIPHRcXAXCoe8W4927Bcyc2
         E/Sh3S1ft5saRITEZE+/qyvRKi0fpoY5MFX/+2BSFJFodPH9PNrOzFiPO+W0MIWTve7P
         7fyQhCSFM6FUHulESJgBE68H4OpOmVasilVmdUtix/Bi7hwnOUHuhb5HfRvVTQTY7RKV
         Q7Zg==
X-Forwarded-Encrypted: i=1; AKwUvBz01WjJKJXwEIvppUFFRw+DyvPTEOPy5Sk2cmIj7bIfxZh3TCCtpcI9MWl4PlHLLSYYXAVSlcDyI7JJRbk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlykwoDrokLBro7HO6dlwxPnFWg2TeaoTWmUhpVmJT41yAPssr
	uoIezQco+fo2qKqH+EW/ZNHqpNu05wk8d/SN3sLMa9qhSYOShHWkBIO0Yd0phpgW
X-Gm-Gg: AYBFou0fcZtlbWHuJ0XIFKayX0Rzy4aCgqBhw02fXjokApAE5jDcQkmIMRgF/WCixxL
	7jnE3jc8x4/1j3tNpt8oqlTYDeLkFHYAIO/n0CGq0P9VGb3F/8F+O1ThTrxaxiz1jgRU+s2l0TO
	uS4SxKXYW8ldfAzv19HlRi8yRqHPGNlFY0vVXQ2b2W61zRmXK2nAT0EU+rJ0axMVDC7frK2uDcG
	d59ZVx1ZUpiIKJqKTxIGYnaQgC7cKm8zArVfM8ssAKN/37Ubur0/IMx597h64BLu8Qlre7cMZrO
	lsKI1rtd+I7D0H2V3sTSHViY8gkdXC+kUAAboqDfrauQlAqLirH4J1UfdV6Czn2GKPZUV9Xb5cP
	KLs/1h9Oqu6wUB1tJgqJtxkxvA0iNyJJ9p8bfZoIS4qypQiGaCpjykUKwijsRnEcs2Mjy08XP5z
	gCnCawoE3panR+ii7pgufm3GTAv2GRcH4LC/vsVLHipGPA4AvkkqvLKXb0nCJOSHMA7EJ9rvpwC
	N1wSPV8x7DqgIX0EdpJDRfSMV9E0o+H8XlqUkKWVAeo/clw9dstxSDlpbkxkovCA4wS3CiZWlwE
	rFXvZLDCAs1xSo+w5NE5HsmdNk/PsN4eBxEbNPSoOi910vw=
X-Received: by 2002:a17:90b:1807:b0:39e:574d:3d2f with SMTP id 98e67ed59e1d1-3a786736764mr3389299a91.7.1791093937568;
        Sat, 03 Oct 2026 23:05:37 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:37 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:35 +1000
Subject: [PATCH v2 08/21] ASoC: card: Let 'fixup_controls' return errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261004-macaudio-v2-8-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3700;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=2WG4d/8EDKjA/Ac+P1A9R66HR3H99W3M7nFvRZ5lYJI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+S6/V6Rf+CQkZB8/d8Fh39Hzv1fkX9mK4PJDtM1F
 ls4/js2dkxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKa6yZOR4U5dScnqLI/y+oajswwsflst1AkQninyhIsheYujw62rKxj+u63d4uq
 j8bA70sPo5VtB9qCwq6lvD/V8MKvXC368M6WDHQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Let the 'fixup_controls' card method return error values which will roll
back the half-done binding of the card.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-card.h                 |  2 +-
 include/sound/soc.h                      |  2 +-
 .../soc/mediatek/mt8188/mt8188-mt6359.c  |  4 +++-
 sound/soc/soc-card.c                     | 12 +++++++++---
 sound/soc/soc-core.c                     |  5 ++++-
 5 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index 1f1e7d45f553..c392e6c4844b 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -44,7 +44,7 @@ int snd_soc_card_resume_post(struct snd_soc_card *card);
 
 int snd_soc_card_probe(struct snd_soc_card *card);
 int snd_soc_card_late_probe(struct snd_soc_card *card);
-void snd_soc_card_fixup_controls(struct snd_soc_card *card);
+int snd_soc_card_fixup_controls(struct snd_soc_card *card);
 int snd_soc_card_remove(struct snd_soc_card *card);
 
 void snd_soc_card_set_topology_name(struct snd_soc_card *card, const char *preifx);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index f356b553227d..d638fc69925c 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1005,7 +1005,7 @@ struct snd_soc_card {
 
 	int (*probe)(struct snd_soc_card *card);
 	int (*late_probe)(struct snd_soc_card *card);
-	void (*fixup_controls)(struct snd_soc_card *card);
+	int (*fixup_controls)(struct snd_soc_card *card);
 	int (*remove)(struct snd_soc_card *card);
 
 	/* the pre and post PM functions are used to do any PM work before and
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 75c90d1d165f..14890af97706 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1280,7 +1280,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 	},
 };
 
-static void mt8188_fixup_controls(struct snd_soc_card *card)
+static int mt8188_fixup_controls(struct snd_soc_card *card)
 {
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
 	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
@@ -1302,6 +1302,8 @@ static void mt8188_fixup_controls(struct snd_soc_card *card)
 		else
 			dev_warn(card->dev, "Cannot find ctl : Headphone Switch\n");
 	}
+
+	return 0;
 }
 
 static struct snd_soc_card mt8188_mt6359_soc_card = {
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 282d666dae9e..e4d81329cde3 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -184,10 +184,16 @@ int snd_soc_card_late_probe(struct snd_soc_card *card)
 	return 0;
 }
 
-void snd_soc_card_fixup_controls(struct snd_soc_card *card)
+int snd_soc_card_fixup_controls(struct snd_soc_card *card)
 {
-	if (card->fixup_controls)
-		card->fixup_controls(card);
+	if (card->fixup_controls) {
+		int ret = card->fixup_controls(card);
+
+		if (ret < 0)
+			return soc_card_ret(card, ret);
+	}
+
+	return 0;
 }
 
 int snd_soc_card_remove(struct snd_soc_card *card)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 06167a198591..2092373698db 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2109,7 +2109,10 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		if (ret < 0)
 			goto probe_end;
 	}
-	snd_soc_card_fixup_controls(card);
+
+	ret = snd_soc_card_fixup_controls(card);
+	if (ret < 0)
+		goto probe_end;
 
 	ret = snd_card_register(card->snd_card);
 	if (ret < 0) {

-- 
2.55.0

