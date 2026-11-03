Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691655;
	b=Vy/BH4+boNmQV7eEvypbq06UKejIZXwjhagbTwCsOUlIYAKF99tqD+1kWzayMtWMb/Lk
	 oe8eT+e5Oj0t3NIpuVrIG/jIiI1kwvIYMDUUNTbZVSAbOCujy9jE10dcjftTayvMoFYeN
	 542inoipjGOrQKl7HFWuSiLVBqrSE9dkhJqyW7Fhg3JLKVvf5cbw9C1jtLOa6uSgmGvDP
	 t2KF+Px5RF44U9goIrPCI1tzU6gaTfOs2jwkEQVgLCtCxGizRgn6z+ZpI1Z7nAkkOR+Qn
	 2qyKbUtd/HywIA0bN6G997FZa7omgQ0pAi+Zn6MLEl0vBlw4WS4iXNXsz6Kd5XLJnTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OisQAWFcfOsetcPoB+5k+VxAvdJWHk9io3oDzNMx+0U=;
	b=vyy69SBvO2BRwOCoXFfYVK2CBKZK0Jnz1VaFyh7P6MVryEj0YcVeKoKWahx/WG31Aqw9
	 SumaRAoCTnZuM4urCm4cMCa/xic0BA8hBgXrvMfY+z2d/dOthV6ctU7ptIHs4lJgDExdo
	 S8I9orCe4bNp8OuPEBzWDNWf53Q4WNrVQNPkClcDxjm56HfktzzBWp/A+8loV+QVnhVOI
	 R7cDqNPApnOuB98Tl/371FrUZh4AQFPb3h5QuzUm7at7njaJcUgCi54zK8ciqAtWe1oi7
	 6OlLlZhf4lOBe2FeFiQHurqbb51TB/3r/EoJlbLISaUCRxuMPo1j3LV9ttqv6RB7hVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JYsZINop;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644D5606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 644D5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JYsZINop
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so2779895a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691654; x=1794296454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OisQAWFcfOsetcPoB+5k+VxAvdJWHk9io3oDzNMx+0U=;
        b=JYsZINopGAhJD2XdEHbK/2MLYlw2VflxRBMN9jc/T5vq4t3tl+DTLqNY/4pMuEkaJw
         1n2vhIVksD8VbMn1YoZR3tZn9ZGM8ZkJHje1vvsj+dz5o9hf+WBic4Dgd4iMvEjgOtom
         lO8+Bvgzfhsj4SYLVsAjRsPtJL/MmoYpaJNhCs+e7J+rIAcuVysHMsc3Y3Lr6w8M7W6Y
         8EQ+C0JVnEmJ4K2zoBwjZVSaN1oK6mTv2rvqQskFD/XTTlmE5hQlKVEwikveEeRah6UB
         /+c0oeAvBO3dpiy0ZmY/cb1pKVrx6zkVyeQYrtqLRQGBI2UlR5PLaAHdvAjcjdwiIoHV
         /apA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691654; x=1794296454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OisQAWFcfOsetcPoB+5k+VxAvdJWHk9io3oDzNMx+0U=;
        b=DIHRbOaYx+pUC3wVSFnfIyfpALwJlqjANBFicIhKstiJI/Nbe/hBELJp219mzsUXjT
         fXMp86Kc3dNtYbWW1Hzj5k2uio9avhntG2V49MomniRvFzn71dDKskGwv0WzXUvdYB63
         0H8sQVZ+8XVaWTDA6GUlNpNq/tcYz+lSKX9yQ7DqiBv8g6kffPEu7ZEqcBVG5pJ1een0
         4oCFU10Hq3DtqpwNBZfb744doay5ZPTx/RWwFYS3kx0KH2Bo3MIHhF3Xo08fEr8d35nS
         6V8mqHdg5z48Og0qwODnXiqvkolH4mOv0sWKNTs35E/TEi+791ueJMjeBYfvlhT3tJuL
         6QAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwS1zjanPEEuNftuctNqYkyg67n8xPuQOuazUfeDbjX6Hu+IWMl9H0ZKZ9M0XHjZ5fhlmGynegCxzXGYko=@vger.kernel.org
X-Gm-Message-State: APuU4Z+H9r+1o06PHNTG91M0U7AEzdDx2zhlrC4DBdlTEhJbWTWTep7z
	arWA/GaRit5WZiobTstvbN8wvgGWAglwJ//vBtBgc7XQIE6keMY8svC2
X-Gm-Gg: AYBFou0NBrwBjhZHfRuXPRWTS4+b0E7fO7B3DJtggs97YP17B7zV/YptSiy7XGYDp1o
	JRJx0VcGrf0ktVfXvJF2pJ/Rvkz8VK6evC3h8tsTqS9tyxhEIrASK7y51e4JgSvcTBWdjIOuERU
	atw3S1ak+mEHpqONNYBBqes+4qgScBAHLAyxnzmV0vJqGcUWsjUkHk4kDuWMRskU4Muqb/4Zny2
	pB2BbvzaY0UbJWxK7w3+dSEU8xxhGd1wrkphCjgicjjoiJqgQ4h3SrvMLSoW4Brp5Dr8q8tnzjA
	kcvjZBIJZADd0tqpnDbbVYSMZmQ+zrqJ6JIPIgw2mvQkyYhsNKCP2VWpkD1RTVCMEiAXzWMdNiU
	gMukvQ5bwJIjVUqVBDyScKtruwTzGVvwZOer9oRAiC5xQxOwFz+h4weJqilvnRKR6jxKEaiv1C7
	5Fcw7FzlCj9Y9aVWUhHdM0EBcg1ao9L5t8b2BCVKQRHwmYrnc88OmvnDLxzhf1ZlHsWk/phnjG1
	wXEki1MECECDQH5M83AQkClh/9sWn4FD06Cz4Qzdyf6KKyV14GbWgtlkDsnjMYZbq6qiWeBgnE8
	qiO9mIwtdkd1QWQndEWHaq34tDn2IKwKtzNzA8l/EEX8zooV9wYQZvyTEUyOUCu21dG168cff+D
	MOE/MydFgpYz2eOPAFBXsF5Zmu2Hf8BNnUu5dlBhFGgP40ZWvoTyGKcdtIieodsBo/PrnGuMgjo
	qPuWMVVf3fnEHwv3sp49m6JrZQ
X-Received: by 2002:a17:90a:ec88:b0:3ac:7556:8eec with SMTP id 98e67ed59e1d1-3ae89817e67mr10390517a91.39.1793691653576;
        Mon, 02 Nov 2026 23:40:53 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:53 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:53 +1000
Subject: [PATCH v4 05/22] ASoC: ops: Introduce 'snd_soc_ctl_activate'
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-5-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2221;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5hdczG9NEn27ni3LRkyWf48VrrSCYHeqmgsUnxw+t7c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/m/vxd8mT2w9wzJq9zHr7fds5GpJlvk/hZ7rBVm
 d+O7vvj3TGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZhqp05GhrWvelleP2jLfaEW47KL67PTlYtSmlO89EQ8JZyOOl2/pcfI0MSmciz
 Bue742WSjd8f01zrYWO2W/i56zGoSMydD2E0OPgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

This function mirrors wraps the sound/core 'snd_ctl_activate_id'
for ASoC. Machine drivers may call it to lock down kcontrols
during fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 ++
 sound/soc/soc-ops.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f6b98324f346..fbef941157ee 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -565,6 +565,8 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
+int snd_soc_ctl_activate(struct snd_soc_card *card,
+	const char *name, int active);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 497ea82c1778..1d60e290e40e 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -473,6 +473,38 @@ int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 }
 EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
 
+/**
+ * snd_soc_ctl_activate - Activate/deactivate a control matching a name
+ *
+ * @card: where to look for the control
+ * @name: name
+ * @active: zero to deactivate, nonzero to activate
+ *
+ * Return: 0 if unchanged, 1 if changed, or a negative error code on failure.
+ */
+int snd_soc_ctl_activate(struct snd_soc_card *card,
+			 const char *name, int active)
+{
+	struct snd_kcontrol *kctl;
+	int ret = -EINVAL;
+
+	if (!name)
+		return ret;
+
+	kctl = snd_soc_card_get_kcontrol(card, name);
+
+	if (kctl) {
+		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, active);
+		if (ret < 0)
+			return ret;
+	} else {
+		dev_dbg(card->dev, "Tried to de/activate unknown control '%s'\n", name);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_ctl_activate);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.56.0

