Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9803CE4B9
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880211; cv=none; b=nDe0qJAx0b01mfpaII0tH/GjQMSIMRAP/FTk52tylv+27cd4PkEmO9/9qf8fOU/96WRvoaYf0vHbAj87F/hr5mdXU6UU294NBSpyN/Nf/gtMLBcDx48ipVSOlBYKclePRXxWy5q7DeCiIF32oTy6c6SpKMQ3rfFR9QRv5W1mkg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880211; c=relaxed/simple;
	bh=T6mbgeWv9jzF1B9kGkNBo77HMeI/WqXPSrUa9mCj9Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c1hlWfMydIoE39yEHwjoY0X17T44AhOaPX9e0wVyuqB1b6zb3y4wLRuKCgpJV7zvF5Ga3zyRgzDngHogBWzhfCXByM58RrCFCJRBlKCor9h45JehszW81ia96a9Oe1WqkNTDbkTFjtRlWkIgpp2co+ZVP5lf+8QtbbrTeuAJUWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsOlAGs7; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsOlAGs7"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca069c8so20272345ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880210; x=1790485010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3dXNK/OowzWM58hnD1jde+T7w0Zoo6WExVjNMgQVHK8=;
        b=BsOlAGs7v5xLNbovIUT9SWMZ/4MIIbWOoxViRs4ace2dj9NNe1K+TSWTgjJQ+3H0Mj
         TLe4gL5gA0K+GJAawNgQhObYoC06qSgQX1BIK/xwHzDVFI7E4osq9s5xzI+nFUduRg2C
         hSH7RUI1qHFyFKn/E9pgQtsvdlziS1hs9jdppPMlGOI/QlaZAVAnHsuyShLsvMCjYoQg
         BCboTv3TQKtIBv37Dja6BgSDhyh1VTT7bo6arOQHtZezOgEnh0GnaCa4w84PuSWWfBGD
         GdVkhI+NmJuEZmufzmPZHYNe6VnN+htRw5G7J7n34mF/7Q+pw11fgHrwIoikiW96Xatl
         IMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880210; x=1790485010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3dXNK/OowzWM58hnD1jde+T7w0Zoo6WExVjNMgQVHK8=;
        b=mKe/dG+7DoQSNHDAz2SzHgPDanLDkE7Jdu8j60188aa/GoloatpRGYkAi+r4BQwbIG
         fY0eZ7g+lwgzeDL7IXayihelLs9uTrUUnYY5JuLm/0Yx9y/o8KSxNhT08kT947n7xwEJ
         4dX/ohzptJ+dFZGOxChi9Q/GmST9KCloQeLL6nu/GggUhIz2AjrqPjpXcHnFqB5FgZUk
         KPwev2LLVREV0cuPB4RvGbSd0B2FliX+ISYMLfzfTtkCfUTtUsKzLKtuwjQ7R+cOAjhO
         DZiD8MbwrWD1UJ9Kjnn4vZi7qSkCLhlQoYZk014Ibsl2v7NlSDym/VjuAcP5kylTspjJ
         y8AA==
X-Forwarded-Encrypted: i=1; AKwUvByIIq0erXAshn5iStmN++2DHQaQlNU4a095kCqgVoSYXMUScUjAzE4D6iSZD13mWePizJhhJFTBhEVN2AQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nx1gQLEMLST/Kvz9HIjA6CCw7ldukpTQA/fuYH6bFN08bQu37a
	nHUX0k6CbNavNCgohWOywJQz3JxdHxhT+VU9NQaH3zgT4jlV6DRDcEaf
X-Gm-Gg: AYBFou2ZaV58VKvgQZ/77zvllvSf4UM5bs3MskVkTpHHeq4C8cNoYn5AWZ64DqGNoFt
	EufxTm/Fy7eP1l9oBGcWp4QdNjFyePgOFw8BOp7DnEkPQTKbtlpMMGkf7gOcVqGf/jmzmL2QeXk
	9wGXz1fEGj7xoG1BW37Os+eyV5D7tjelEMqdGJS3MSmx0nT5CLqRt8AGXGLk2UHXKOnRV/Hj4M7
	rLfVBcls1xmSn3SYBtFosSppL/P1tdkzJP+10hg70oD4uubWr3J3eNNO4j9puKITzaFCDlwv6kI
	4alWKT+EAJvJ/L+RPWckteVgc/qAcZGbuc15+y5ogA2lvKZtyldXwXnf9G8SLGqgTOITYUhKdAw
	cRc1pLfV9678OAenVMqKXt0B9uXIKg1xklQjbi+cIzPGtbdCiUPjS62+yamsMuV5TCpgpO1gRa4
	I9cKGtANylT2ft83q1dhZ6DOYh9LXo8ftfIOPk9ZWTmuFJgHgshut/2XkQ4HUZlNqlngNmXwj0H
	iiFwFZS+1kgvsol+5UQho9t1SDIji96LnjJf+xmcmORh6mssq//U9qVxmNhEcK1v39sFjia6HHe
	IZubCM8CR7/sju5qPSmFHwAbxCBatsdQn/vynbVeNyRvYcM=
X-Received: by 2002:a17:902:f645:b0:2d8:d4d0:792b with SMTP id d9443c01a7336-2ddb1b79d84mr118058735ad.15.1789880209811;
        Sat, 19 Sep 2026 21:56:49 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:49 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:50 +1000
Subject: [PATCH 11/28] ASoC: ops: Introduce 'snd_soc_deactivate_kctl'
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-11-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=4cm5zIm3FR1CXBqv5TeTAc7DTM6jYX/PUwYOK0HZ2oU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xVeP9V2u/i9uIX1ytYqxZ/snN8836Rv+51+YvqOp
 vWx0vd8OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFMtt5rhf3hUQtvsyg7bl9YHX3CIpm9Wea/cHlYhG3Jxoc2m8Led0owMv//eL7J
 x5Duk6RhwIVNQ43zMTevZAQlyynuN2G49FnzPDQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

The new function can be used to deactivate controls -- either a single
one or in bulk by pattern. It is something a machine driver may call in
fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 ++
 sound/soc/soc-ops.c | 38 +++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 553bb7e2be98..973ffaf6f060 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -578,6 +578,8 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
+int snd_soc_deactivate_kctl(struct snd_soc_card *card,
+	const char *name, int active);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 2f91ee7946bb..d35e24df891b 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -512,6 +512,44 @@ int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 }
 EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
 
+/**
+ * snd_soc_deactivate_kctl - Activate/deactivate controls matching a pattern
+ *
+ * @card: where to look for the controls
+ * @name: name pattern
+ * @active: non-zero to activate, zero to deactivate
+ *
+ * Return number of matching controls on success, else error.
+ * No controls need to match.
+ */
+int snd_soc_deactivate_kctl(struct snd_soc_card *card,
+	const char *name, int active)
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
+		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, active);
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
+EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.55.0

