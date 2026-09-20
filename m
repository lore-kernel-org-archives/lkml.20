Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F05D3D0934
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880239; cv=none; b=TN8C9RixjwTkftZNcnvBl0mySmN9Z/0UIA5AqlGz9QHkO1v58EzXI2ljstY9U8fvMeko2U2Er0S+wJoYDObLLvYFE1VOAVIBmMMprUpc2qCLlPlc2rA4qDHKpk+z/RINh6Y6hcV3g6Iv4qDhE3kpK2nq76Mq6DMJDy6wilmihVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880239; c=relaxed/simple;
	bh=qRwfoN5qNNqVQr8Wt/TWmwL741AZzzHX5UMTWlL06v0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tJoVk1hWFCZHTyo5U1eE2phjyeL32J3VxtLGrduYwsgsDq08MecJ4nWV5Oy95GHYPx2Z/gJNzo4IDOO3cEQxOPkkGtaIL5brkyeK+SQhw2tNnK+yqzH3aqdaC2iJtUsBQI4FYa8YcVg30rGs2rLbfwy7KpogyEAWnurw/E1JlkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIp0EVLu; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIp0EVLu"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed1368so24899875ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880237; x=1790485037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWumTWBsv9GByVmif5mlGmCyRKrpCmaiWOQWTcHmLkY=;
        b=hIp0EVLuJ97tGVt5wly2XwmCN6Ot4IHrTn7hqm+HuuW280vwhLo6w22bS4J/1Opky4
         sgkxofP1aInvEbkqvjyIOaIkzdUnxx6b0efovHfD306H+73HYfRl26ZkLjw0jE2k7ZVD
         wfmlAzeGQaN4NBVU5r4dP2ICbYHynZMa1mSYFLB6UG+S4oUWTYPuoQMuf0kaK3bjfIeP
         NwYu4TvazeDrzdyQU+SnpmUJfkWl9tbsTc4pvXo1qKqTcCsSSNGWA+k/9vXge9AUd9jv
         /gAGnxO7atNOv/jFOaE3Mj/ejGNaBbnW7Xgq9FV70dnbz/+LSbzhnvQWtBYpXLFM0KoD
         6kdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880237; x=1790485037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWumTWBsv9GByVmif5mlGmCyRKrpCmaiWOQWTcHmLkY=;
        b=c4NWz4k3kwL3WSZs8RG055RW+4QE7lXBAD59WZZzdrD4+od0o6q7TTfdkzuMB43joT
         nPlTtPTGXoFxVclFMoJOFNyoHAHDCLh0/s9GlBgC2cRUbEtfaJ2CrKKzcu1MUlzhqkLA
         c6UId/Rj3r8jbHuihxI9zWe5Mso9aLsuLwDXfns3zUmcik9iTrzvnGnwiV9vvlLB8UFb
         3gg/sDrQrrRz8jdwJ7Sge6F1GCAOEg5Ciafl1iz3va24c+roq3MbDe+oB8xov0CQFOqc
         zTrlZcLi6uMn+IOsDnrwDDyX9iiDK2qz+yR76/LOajU4zTBAA/U0Fri6PdD/JzTFjzXX
         aFcA==
X-Forwarded-Encrypted: i=1; AKwUvBzfN8+irq3ob6u5TaDU8VR9s9IjBooPAvZFP9ETcx5cBJ9p9RnUVrR8zXtWMKfEM25i2CqyvFg59fJB1KU=@vger.kernel.org
X-Gm-Message-State: AFuF++nfaV1CggJnOHJTmjpIQnA0NckSukqzxR7a93dFhhQnPonpysLQ
	5DWCB/LFZyQYsPiGir+pmygNDxpSRwOAD9Czl8j5uBnL8uYOoF22+iVl
X-Gm-Gg: AYBFou1iZZUNW7tHjg2lzasTYJTmU8OVFQp9H4APAUr3E40D+EOCLzm4DQj33NaXrQy
	8pjF65i1zyEm6JMRL4WAI+hABxpBr4aVsHccqSanK9R01ZuOKG0lD2Rehp2TmWVpuB+Sjvw/qxE
	kUI5ER95cByFOC6Han4/HVb+bYha/rrrAzXYL3ySCncN07OKvIXHIPWu6cShway0zWfD3jEyck6
	9V2yqVIWxTEmx1PFE1g1Jtf6AC5TDhQy/2228B8YqtG0AXHZ0brK/qbSrPsn5NKKA5ZP82kzOuu
	BeYSvm+VhfB6z50ohWCXShw5BP3742IY+LRntq7OerTkFr15BYM9e33zuhWkuJ6R5Kehyy7v3I7
	UI4QKE9VDK7ymgWjTt15H05KYSTtoRJwdVAebrnnT8N692RjeWjiIGzq27cRAbHYBotzjy8lyQj
	L5TdahcNZXguRJN4dBS6/OLrnRqVpzA5b1+HXy54J62Qy+tgX6416nHQMP9GCF4nLZzDqwdzNX+
	9ALxbFcwIYlWHn83Yepmw5zSENSwnogFXr9peQD/etpDPkdSuL7kr+/tjpKoZSmbAGNevIynIbg
	1sHppSHFlfnKPLAaDuRrvO9LtNkgji6QFjYJuYLdtmTzlnw=
X-Received: by 2002:a17:903:2350:b0:2d8:d4d0:7932 with SMTP id d9443c01a7336-2ddb1b99472mr110221825ad.22.1789880237323;
        Sat, 19 Sep 2026 21:57:17 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:57:17 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:53 +1000
Subject: [PATCH 14/28] ASoC: ops: Export snd_soc_control_matches()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-14-741cc20a74e5@gmail.com>
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
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2678;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=uxLGzSeW/mzW8E6v3Cg7Wd+ZjxhCKdm9ELh/X2EAU88=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xWLO9eyfbBor06vLstcdaLicvofUeZTBl/eBvFfe
 rmvsK22YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNX9PAz/s8qDIsvmh53P8D5Tz/lWc7XhN7NFpw+lskz3vNL/72d9IMP/oKod8dP
 Mjuve2bEroJZ3o1lo9uWXh9+oOpofqjxhlufLDQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

This helper is useful for drivers that want to do their own control
lookups and matching as part of more complex logic than the existing
operations.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h | 2 ++
 sound/soc/soc-ops.c | 9 +++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index d638fc69925c..6c4689ef8973 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -576,6 +576,8 @@ int snd_soc_get_volsw_sx(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
+bool snd_soc_control_matches(struct snd_kcontrol *kcontrol,
+	const char *pattern);
 int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
 int snd_soc_deactivate_kctl(struct snd_soc_card *card,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index dc27d1c409ab..94d0514be66d 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -403,7 +403,7 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(snd_soc_put_volsw_sx);
 
-static bool soc_control_matches(struct snd_kcontrol *kctl,
+bool snd_soc_control_matches(struct snd_kcontrol *kctl,
 	const char *pattern)
 {
 	const char *name = kctl->id.name;
@@ -425,6 +425,7 @@ static bool soc_control_matches(struct snd_kcontrol *kctl,
 
 	return !strcmp(name, pattern);
 }
+EXPORT_SYMBOL_GPL(snd_soc_control_matches);
 
 static int snd_soc_clip_to_platform_max(struct snd_kcontrol *kctl)
 {
@@ -492,7 +493,7 @@ int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 		return -EINVAL;
 
 	list_for_each_entry(kctl, &card->snd_card->controls, list) {
-		if (!soc_control_matches(kctl, name))
+		if (!snd_soc_control_matches(kctl, name))
 			continue;
 
 		ret = soc_limit_volume(kctl, max);
@@ -534,7 +535,7 @@ int snd_soc_deactivate_kctl(struct snd_soc_card *card,
 		return -EINVAL;
 
 	list_for_each_entry(kctl, &card->snd_card->controls, list) {
-		if (!soc_control_matches(kctl, name))
+		if (!snd_soc_control_matches(kctl, name))
 			continue;
 
 		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, active);
@@ -604,7 +605,7 @@ int snd_soc_set_enum_kctl(struct snd_soc_card *card,
 		return -EINVAL;
 
 	list_for_each_entry(kctl, &card->snd_card->controls, list) {
-		if (!soc_control_matches(kctl, name))
+		if (!snd_soc_control_matches(kctl, name))
 			continue;
 
 		ret = soc_set_enum_kctl(kctl, value);

-- 
2.55.0

