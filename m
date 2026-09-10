Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1780F47535F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040640; cv=none; b=U0140fITXAaVofFNjd4Ny4gKIHtyrefRIJefnAxCzA94I2jitah+uDtYtQ++Z5jrGLNXmz8Pd+Z6xBTK+SWt5hEt4tGYmszhcdnflyHqD60VkdvytVmfpYLGBo/pSQh+Cd/n0Oxzwc5suRxKUmfCZmj+7XDqTTTNsdbZklGtxEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040640; c=relaxed/simple;
	bh=KnIT+YZYEArHXwX2vj0T9E192bq+jRimOhkW4xiNX0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o6SUmaou5k0aG+E9CBe7wglmhp0+19tLJ0qJoxygH5xg0As3SSxZCZRVFXnKsogT/QGom/hZXWB3PGN15pe+GgGLoafPvJJXLBSCMRhzM+u2WGYdtBs1XFzoPsXA5Rg9p5iLzQZxjxwVBEgz6VY7pCgS/JET2HNiQ0qLzfAIDnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7LjV214; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7LjV214"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2dd020a2e44so15732015ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789040637; x=1789645437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OAl4R63i7nP2kPOGdri8Gsnk69LVzRCygwjUC9I3Ijw=;
        b=Z7LjV214HmVfnMrNNvK7DZk69PNjSxJ9bt0wCL6YrMfSDNRQFi16MzB4Lbu8Nf4reh
         Ii7CYb4a8Wg5hC9BN2621LTIlwXPeoYqqRS7Ghwi7wSkDcxtixNciSVrIMcKhiCIOIvE
         v/8TwfrmflbGmYMI6CtSfm4mbfnmrWeJ0BE0Zi8doJciOxlRNUzEr6BHKo6RSmySRcOX
         u5l6BkTBC9xnMYKLJSOQKa/VIZ+BCBZ1LGvSjo9V+2YhtvaLYUg/cAM9fXeu6B67poNN
         6HFg8z6Vme2IuqxJwfd4ABm4BFK19RZwYzbgoQyrw5/I8b0BODmFHCgZswWruqICxHc4
         c2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789040637; x=1789645437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAl4R63i7nP2kPOGdri8Gsnk69LVzRCygwjUC9I3Ijw=;
        b=YMGfWzQleJxt5yRXIpqcWVVKX9uDXPy3us98h/JGb8sq2IiRCISYqmQZgH6beMXThZ
         77yfOZGKaFsiMgOIWIb0CSNzh5xOddZ8A7nRTEVgCxH7kXBtL5peqVpR5KOS3P60E5e+
         UKbhDfppv1hFJxozTzw3UQgVcfX+g7h93Voa/VFfhxv19zME06mcZCWiY8D6KW9ttBVv
         n0xHNwgJtxVqBFcDP9VI20WlH6cEFVtNcEDzCmpQM7CqvpFBZ2XaTU7QvXbRhL7ROG7I
         fssjyNEg+vSkvTkYoVfsiAvwJeKC0lK6Zbu6V7+eMH/Avp2l0ug5YTjSRcXToE4oOpdQ
         wkuA==
X-Forwarded-Encrypted: i=1; AKwUvBxU9QauOGL8QShiCPQlUKQ8mGDrQfKz77vO1pcYfx0G+mfZtp+oC4yjgvetn+k1BQ+SLZ22CKj+E+Ks1H8=@vger.kernel.org
X-Gm-Message-State: AFuF++l3WgLlweHzpilCqFVJqJLH4cMClPHICq/+TBZHv+CoLCedN4JU
	/jduppeT3FG5PNzHqBHniv/gCIEzDeNCu3W5G5R1aaxlw8yHeUPOL1hj
X-Gm-Gg: AYBFou1W1Sj+6GW5YHFw2pz/XTiqvENwOzVPJzQyHAbH5Zy+EjQijUQSyETCOOReh/e
	zpe7nSpezdnYwccVVs1qX9CkyraW/5kcd9T+oN8KQHeu+I9dIlZsfy1g+I2eJoTKuMyTc/ca2OX
	3wFGaLkQl4/729267T7UHxVkSN4Ssh5YZLJPdmRYJhL3n/XKuNzcNoiFPwsAb2Zs/QwjqjNajet
	3gxZjmdmjNEgg8tPwhjhGJu2FIJrOjZP1RfJKyvFocNpEGxVvZ3GZziyMJ8EqK5p+58yQM2w3xw
	GyofhL1qO6a+ay62eapMyziIhdTzuo6dVFS5Bw6LqbJwwh+dFzBHVrLOL2haxTR6yRfYdENr5MT
	zvbeLkKkJaNN4nROUZgINAyZDVSkY30tZ3GZiXL6oAKqppJIZRl5Ibjd1t+JM+bfM8/ZDV/NMxf
	dvolf3gdJPKdCjx1gFCfvAW8QQvZ0oMS92KkhjVdG5V9GNWQLr0CYLFrb4yeJ0e9afH+emwaSFQ
	wnEvAjUSi81SIiVICp83HKtW83EmrubH57HyJWikuQjmaUJmCGHmvVBciCKER7YKTOfd09kdU0W
	e053udKu3xWGDng=
X-Received: by 2002:a17:903:22c8:b0:2d7:5ebe:a588 with SMTP id d9443c01a7336-2db126d6e31mr572534875ad.13.1789040637106;
        Thu, 10 Sep 2026 04:43:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14959fd2sm87427155ad.23.2026.09.10.04.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:43:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Darren Ye <darren.ye@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: mediatek: common: Propagate control and DAPM errors
Date: Thu, 10 Sep 2026 18:43:37 +0700
Message-ID: <20260910114338.142682-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_afe_add_sub_dai_control() currently ignores errors from
ASoC control and DAPM setup functions.

Propagate these errors to the caller.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 .../mediatek/common/mtk-afe-platform-driver.c | 38 ++++++++++++-------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 477284e12396..c1869b38c9e7 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -51,29 +51,39 @@ int mtk_afe_add_sub_dai_control(struct snd_soc_component *component)
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 	struct mtk_base_afe_dai *dai;
+	int ret;
 
 	list_for_each_entry(dai, &afe->sub_dais, list) {
-		if (dai->controls)
-			snd_soc_add_component_controls(component,
-						       dai->controls,
-						       dai->num_controls);
+		if (dai->controls) {
+			ret = snd_soc_add_component_controls(component,
+							     dai->controls,
+							     dai->num_controls);
+			if (ret)
+				return ret;
+		}
 
-		if (dai->dapm_widgets)
-			snd_soc_dapm_new_controls(dapm,
-						  dai->dapm_widgets,
-						  dai->num_dapm_widgets);
+		if (dai->dapm_widgets) {
+			ret = snd_soc_dapm_new_controls(dapm,
+							dai->dapm_widgets,
+							dai->num_dapm_widgets);
+			if (ret)
+				return ret;
+		}
 	}
 	/* add routes after all widgets are added */
 	list_for_each_entry(dai, &afe->sub_dais, list) {
-		if (dai->dapm_routes)
-			snd_soc_dapm_add_routes(dapm,
-						dai->dapm_routes,
-						dai->num_dapm_routes);
+		if (dai->dapm_routes) {
+			ret = snd_soc_dapm_add_routes(dapm,
+						      dai->dapm_routes,
+						      dai->num_dapm_routes);
+			if (ret)
+				return ret;
+		}
 	}
 
-	snd_soc_dapm_new_widgets(component->card);
+	ret = snd_soc_dapm_new_widgets(component->card);
 
-	return 0;
+	return ret;
 
 }
 EXPORT_SYMBOL_GPL(mtk_afe_add_sub_dai_control);
-- 
2.43.0

