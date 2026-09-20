Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866E83D0BE5
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880220; cv=none; b=oAN8P7niqRpAYqv8FGtnQyvnaealAt2nYr6qhHe/1ePMTicxNEx2FQv5foTQ2Xbd4OtqlVHkB1g/QQ2CPX3LwBCeBqFQu06sBuXZ+eY7nN9MQoWFESo2nfpO+2SOlUv4VqEVIyYIGFIvLYN1dWRQZjJXWPHT6pIrjeI9dQ2A76E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880220; c=relaxed/simple;
	bh=dKaT5/AJvuu/ovhkji/q4clDn7hNGscBb7o5Poe/oV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g6f2YYBdZfeYIeLfbVUqItwM/c6xu8s+YGn2xw1CzgoX0gBKdjHGfuR1Kue1Wsi2fAq9hB7zDcyo2tIMjaicbHFqeVLC8qwyKgnIF9UL27/snOpZRbw8FCuj8plaeCQj7Y3seikgtdMMw5c9xDWbQcJBNoJSOKq+wYjvfR48Gk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JbzkajnO; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbzkajnO"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddaa08c890so18056835ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880219; x=1790485019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YuKu80M7pHMVvwxhK5F4M5xUsUReDWNtyKOTcL7spBk=;
        b=JbzkajnOeytAcqGOEJ7BM/U44QtJidYiPmgt4sfzbuF5E0J1O2l7GUeaUaT7VgQRol
         kvN3IFOtHXizagSySZQVgpCCThfqn0xELpSXzRj8RhX+bvX0ABqDl97N33LMM/ZpPfLr
         nIrLDot5ba1BNLZuh3KogUhhDuhypp6Dt/afemk+bG7/bRMDJJM8+cS9uTnYH4vCGkbv
         qDND6lXcGPWsEeQ69DuaNtHV6+fFfwlUCrEqwG1Mn1ZYRDC+A9+RDjUxrTRSkVtBsQjX
         zsl13EpnXNawX1u9qUzdYNcfb8PNGM/VAFeAeHxGzGu0kX1fKT34z++1zmhh5VqmA5qe
         sWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880219; x=1790485019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YuKu80M7pHMVvwxhK5F4M5xUsUReDWNtyKOTcL7spBk=;
        b=E6+cgZxQesLy2YM1qZ1CtmXhHKK2aTjfNpyGyGAXkK5dQADSp5p+JU1pt2bpoowSDs
         r2v+uIWeaOWxk8ZSBSizL4L7bvSiVMaSr4SduPCDHdaSW5pIT4a4IH77nwfwOhgiMqfe
         GJQe3hzzWv1Mtt5wiaEMnx9jeYnJJVilpB1Izp/s3CoyWEGxPAiyZZMzseMjvSxVxYE+
         LJQtcvoJPEYVCXBXvvZM/FlAR6z8nHiCbjpMaXCe67kzzWkTWfhnnKRmo2y8ZDQAktlP
         Mfvzq+/gZNGuDSUvP2pE4EB1xZ8aeMWE5tESSjttthIMcxGXE0DDFVgSW5jPbhECDoJl
         Pj7w==
X-Forwarded-Encrypted: i=1; AKwUvBz/zrswiA1IK1SAtQhPIVxB+BYKOye6s24xyteRvL4kZg0yY39A1MxAFhANCXo327Oz8RrG8xvqepQbLMU=@vger.kernel.org
X-Gm-Message-State: AFuF++myEz+w81UuzmH02LM25hZyPD/vwgQnhupUSYZMlnJ5B2ORpUk5
	6NpIO7BWf5QS+TJpe2SBoOqtnDr7GnDIl78SeTAjDhuYUivmr/48mOmd
X-Gm-Gg: AYBFou1x2DvRjTDrj9TF3k7JcEsLE1AkLSb44WjQQmcErzKixxXDm+I55LGBVIf3JhM
	ATa4QH0xdHeDWyfVqiXMe6YM/+8CyN72Ow0poOxtg8K5Fro6SNN3Vc4z30p+3Iam4WElLjD1ghl
	bTerIMx0f6H2WHbD61LZarUrBHWeuSRwLJBsQESHug2sZiYxCd8WWs2gKHhv7mbcnMl4GfEin9I
	XjWTYqUu3RsgdritYTvsIwDrLRdbg9L6qlqqDXB+t6nexThG3hE2SjcN4MOao/F/7lPRsly6J4f
	4QKUurOY8LYviK5vFfv5/NfbMYckSkYoX3H0KJYhHwxy0iAvx+h3hetFAles5oK+hEbX318jZ9M
	+bFC8p7AdU9c2Qdr6GBWCt4pHDnDnuHbvaAeIVCuzb7RqFMsh946RRL8N8geYYkW+7YGEI5zPFb
	omBddLSyAG37Jgavs96mB+5Ofd2N+Cwx11J+b1Kw/4TjtKoO+zo1hzMcQxo8EouN0+SfCHIouL8
	ehW6J8sIakVTLCreuMrkBKd4+PEsyFqvu+1bWOsJF5GVX3++w1B948rR0V0LqYquCklcXzeEHvc
	44HqiEDhpwyJg+LIi4PK3zBRBO/wG0qu7hN854SDhIz9bMU=
X-Received: by 2002:a17:903:32d2:b0:2dd:7ab0:7313 with SMTP id d9443c01a7336-2ddb1c17059mr113999215ad.18.1789880218740;
        Sat, 19 Sep 2026 21:56:58 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:58 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:51 +1000
Subject: [PATCH 12/28] ASoC: ops: Introduce 'soc_set_enum_kctl'
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-12-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3075;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ALw7GM6BAIc0MHLkA2EcsPFMi9t4wRSGpPulB3kFXSk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xWYKk3fyLwPOWP4bnLrx6JZ3MlXbuismZzzpHTX6
 3LxGCfTjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFTf7GBk2PQ34GexV8erhzy3oqqqFix1cXzjEnblC8NqE4dtJQfP9TH891WtZX0
 Tk7ag3Txt7df9e//ssZq+ujZri9HMeyxeITUFvAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

The new function is to be used to set enumerated controls to desired
values -- either a single control or many controls in bulk by pattern.
It is something a machine driver may call in fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 +
 sound/soc/soc-ops.c | 70 +++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 973ffaf6f060..f356b553227d 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -580,6 +580,8 @@ int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
 int snd_soc_deactivate_kctl(struct snd_soc_card *card,
 	const char *name, int active);
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *strval);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index d35e24df891b..dc27d1c409ab 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -550,6 +550,76 @@ int snd_soc_deactivate_kctl(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
 
+static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *strval)
+{
+	struct snd_ctl_elem_value value;
+	struct snd_ctl_elem_info info;
+	int sel, i, ret;
+
+	ret = kctl->info(kctl, &info);
+	if (ret < 0)
+		return ret;
+
+	if (info.type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
+		return -EINVAL;
+
+	for (sel = 0; sel < info.value.enumerated.items; sel++) {
+		info.value.enumerated.item = sel;
+		ret = kctl->info(kctl, &info);
+		if (ret < 0)
+			return ret;
+
+		if (!strcmp(strval, info.value.enumerated.name))
+			break;
+	}
+
+	if (sel == info.value.enumerated.items)
+		return -EINVAL;
+
+	for (i = 0; i < info.count; i++)
+		value.value.enumerated.item[i] = sel;
+
+	return kctl->put(kctl, &value);
+}
+
+/**
+ * snd_soc_set_enum_kctl - Set enumerated controls matching a pattern
+ *
+ * @card: where to look for the controls
+ * @name: name pattern
+ * @value: string value to set the controls to
+ *
+ * Return number of matching and set controls on success, else error.
+ * No controls need to match.
+ */
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *value)
+{
+	struct snd_kcontrol *kctl;
+	int hits = 0;
+	int ret;
+
+	/* Sanity check for name */
+	if (unlikely(!name))
+		return -EINVAL;
+
+	list_for_each_entry(kctl, &card->snd_card->controls, list) {
+		if (!soc_control_matches(kctl, name))
+			continue;
+
+		ret = soc_set_enum_kctl(kctl, value);
+		if (ret < 0)
+			return ret;
+		hits++;
+	}
+
+	if (!hits)
+		return -EINVAL;
+
+	return hits;
+}
+EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.55.0

