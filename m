Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D842C3CF69F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880203; cv=none; b=GWUHa5fpm3r+g0Xof6U9X4gF/WbojhDkXEFvqdf1oUfEl8OJF2vFXyCM4JDL73X0UisHhtzh5AGFfuBVKMtd8Ya0mIE05I14hEhVZz1D8WS9MxlR0Z+XaOCq71VPr204xBn8NEtg6oiudtlLUfn8o9S+ZMqBhW8rLiESqC4zKzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880203; c=relaxed/simple;
	bh=orkI4Wz6NvKsu2dnhAfmTqfm8jAF2sqyShpaRHJbfnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WmgN8PBoqA1eUNJPzC4FgeibJHxzmUAMEEflJUtRLSmJgSauXQqjzK7iJaSlS4TPM+nXNXF1L1Uqe5ymsQTT/FUvtRn6AXWg5AUihulG5AQUrYOJkqgmm3JfyHLOzl3RU4CPLK/bYpb7TxVTCysjQBn1v/afFxjJnQERNxJaK40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1O+5BtJ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1O+5BtJ"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ec6185so12088375ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880201; x=1790485001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usgTFYno7+hAzGXo/yfuRjYlJhKU8fYfhaps2/4rD8k=;
        b=I1O+5BtJGUet+kpfZoO9fYMHVZ9EujvfTncIWpWdLuQL77w5slP+J/UZMNrtPjr0pM
         LtWPCg91+BwGyPPCQ/KqIUCZtDMK8JeKGPqtlvTBgHxKyR25ZHzu01ah/P+PcbuWInH5
         qhxGAHDlRFe0IzAHiRAApKxv2tycfzqnI3gWcUGbTRztidLVeoMPAVx6n1ngYhhakiX7
         4+PPkRM8z9DiA/oE6ynGKlL/2pnijbZOEGDh8ygvatMh1AirXclsol5jJ5U/y8/MQzVN
         RqfYb0pr86OZWux5nUTTpAhdnKfnVZU6dB7DpVYamJwIAlAv+fr4z4KRew0JSmwbP8Y+
         koOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880201; x=1790485001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=usgTFYno7+hAzGXo/yfuRjYlJhKU8fYfhaps2/4rD8k=;
        b=eBiDYzLWvLChu5OG3wQYd1KYr1bJw0xBmygvV4HbmMDdxFFO+fqFcye4NPhnYWW4c5
         ymxiriE1nI9j8z8zqF50xk0GO85Jj1oBsDUtgCA8sU8BA7XXc5MzeXuAPWxiE1iVBv+J
         tO509OExvN/1EbeGnlibavgsSkX2bgHBI9J5Cyau6njy+WmGE0Bav+5uqy4P4xDyWOiq
         ciEcTKURQOmoIZaYMLXX/OrWmlsf6SjF2BzABbPfWzAfQsn1IiTUnrbv5vPjvnyViAUP
         HSCPfVK5Zo5A56mb0Fdpm7LxhZHpTMGpl1uHo6wpLAJzLJU0wS+WZy3OqwVZaNbPF78k
         vzGw==
X-Forwarded-Encrypted: i=1; AKwUvBxTHMd1U4nxuGv8QJH5u2HHnPtLc8aucUAR/ZiQPQKTg5ih6r15dpyyg/b8xp/CPuurXyIxw31Y1WTFhiQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lm5+MXSZwRaGn/4Atx6zWs3z66X+8okXy4FUi6HQaHDCFwYztX
	AuMmf4s1Qpv/QNHCApemFf5L6+JPEDI57C5JHknakuMEPUxq1bMaF2G2
X-Gm-Gg: AYBFou3mzNVnNR120AQl6AalovON2H2m94oMVK0MrBJXbZRAf4JhWY71MCoBXKY8kzZ
	8deUu+4PSOqsgG0cwvGKmJsuMAQ5Bqpyt4Ur3ZnKhV0tszdgAaljt01M0kuesjExy92OAk+p/sl
	mzEMOaiWT3+mlz7EhlCXUnQgPs5ADLdTy/RvMGrrFmNf3edkejO/TheIHmGdiDVqR5oOc22AHL7
	E/SDWi0Z3W9tgonUzRgHvx3uQDULM8mGLljNGrAV0f//p7gpNbhbRNFh6M/bhl1O00czYN0P16T
	59v7hXeEqBScihFwBKmu8JesWEa6vmoV2Oc3+B/f8cnLsSD2GXMMA/Ks+XosxOa0s6pqA1GszPx
	4gRej6f5oH5J59CDllICfHjFE86yREr5SrPqTnqEcH7U6zkKLCt/bgzX/PbAEoMi4pIB5l6mSva
	6OkRzLY6/lSMCkCNG1ktxFPPJjCcSNOL+GCo5bd/idHh6SG6hS6rpo03CHU25X85pR4TIVvb1+4
	UyaJfpXpe1zBe8uSipQvGSyvuNaMvrPxIzs2B/OT4QaM2HCj5ePhVpq7pLP+fJCZ1MBHCramjd0
	sg/A5VCmHp8nK8wpdsDrxrBdF08lfgmtNT8u8RhtXcBtme0=
X-Received: by 2002:a17:902:e543:b0:2df:39bd:ace2 with SMTP id d9443c01a7336-2df39bdb0a4mr24798825ad.43.1789880201029;
        Sat, 19 Sep 2026 21:56:41 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:40 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:49 +1000
Subject: [PATCH 10/28] ASoC: ops: Accept patterns in snd_soc_limit_volume
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-10-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2816;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=giyxcaB7oPKDW7kHY6FxQFJhi2IQzFYLV+w/nh4sO8E=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xV+HF2p1seUK7lhz+75Sy6XKnK6zLlreVYmbF3Bm
 QOajkLxHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKleG8TI8CqdbbN2+S/VoCAT3nVMDvGZ86ZkRsz6OD1eZoq/ovrURYwMV95umc5
 m67PbWbG0nuv1Qp6aIJtzX5z1bYVeT724eGMZPwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

In snd_soc_limit_volume, instead of looking up a single control by name,
also understand wildcard-starting patterns like '* Amp Gain Volume' to
touch many controls at one.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/soc-ops.c | 51 ++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index e572b05840b4..2f91ee7946bb 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -403,6 +403,29 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(snd_soc_put_volsw_sx);
 
+static bool soc_control_matches(struct snd_kcontrol *kctl,
+	const char *pattern)
+{
+	const char *name = kctl->id.name;
+
+	if (pattern[0] == '*') {
+		int namelen;
+		int patternlen;
+
+		pattern++;
+		if (pattern[0] == ' ')
+			pattern++;
+
+		namelen = strlen(name);
+		patternlen = strlen(pattern);
+
+		if (namelen > patternlen)
+			name += namelen - patternlen;
+	}
+
+	return !strcmp(name, pattern);
+}
+
 static int snd_soc_clip_to_platform_max(struct snd_kcontrol *kctl)
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
@@ -445,31 +468,47 @@ static int soc_limit_volume(struct snd_kcontrol *kctl, int max)
 }
 
 /**
- * snd_soc_limit_volume - Set new limit to an existing volume control.
+ * snd_soc_limit_volume - Set new limit to existing volume controls.
  *
  * @card: where to look for the control
- * @name: Name of the control
+ * @name: name pattern
  * @max: new maximum limit
  *
- * Return 0 for success, else error.
+ * Finds controls matching the given name (which can be either a name
+ * verbatim, or a pattern starting with the wildcard '*') and sets
+ * a platform volume limit on them.
+ *
+ * Return number of matching controls on success, else error. At least
+ * one control needs to match the pattern.
  */
 int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 {
 	struct snd_kcontrol *kctl;
+	int hits = 0;
+	int ret;
 
 	/* Sanity check for name */
 	if (unlikely(!name))
 		return -EINVAL;
 
-	kctl = snd_soc_card_get_kcontrol(card, name);
-	if (!kctl) {
+	list_for_each_entry(kctl, &card->snd_card->controls, list) {
+		if (!soc_control_matches(kctl, name))
+			continue;
+
+		ret = soc_limit_volume(kctl, max);
+		if (ret < 0)
+			return ret;
+		hits++;
+	}
+
+	if (!hits) {
 		/* Some cards blindly add limits for multiple variants. */
 		dev_dbg(card->dev, "Volume limit for unknown control '%s'\n",
 			name);
 		return -EINVAL;
 	}
 
-	return soc_limit_volume(kctl, max);
+	return hits;
 }
 EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
 

-- 
2.55.0

