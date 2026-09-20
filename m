Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98993CFF6A
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880185; cv=none; b=oDEW/K9e09Fv/T5MFjT2oDY7Y3mK80o8L22dZpi6gEWwSDoTXflsAuVuPLEUhL0QFE+iWSUiY6lp97uRfkNZze8f6hyBFOOOfbL2Lwe+BUTIg08fVuoI/pP++WPD4nO4M6Wmdyu4wFwIOMzHpFommR06zLiCOP0qVUY/BCyugak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880185; c=relaxed/simple;
	bh=k/sMsQBLL72+VD5uNnpfRbirgBYowP2uDqPQcAkhPn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZRiFrLsa98lztqrlp8/WPf8AjsEnFIfwVpVzqFkfYRePeYmD0eSeS0oHiQqKyJV2TKLVVauwSWOXsz2yZHCNdbIMu62SGPHU6jSfB+AYl1YScVA90FQkWAVaFI6VNDl47mcZUNpymLDsYjxbFkpfCcj3eal0LyWVtqRpB+4MvEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cOs92+2A; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cOs92+2A"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd53691be5so18290675ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880183; x=1790484983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqIw7LcK5jQdSK0s4Y8nxBRoBvyvqxkISqwhOeUOv4I=;
        b=cOs92+2A1JwH43V+etV10U9KcwfgLqRN3OOMKruYdxqkkAKo3QoQejdRXhKn/m+SBX
         GPa8PtwFkY20H2y0jzUSmg2S3EBijxtumawJRbqSN2ATjOrjbjKtku3LgEipvG0RJhJo
         Qn2kjeJw9JGh4mP7r+D2blG60WvJRF7ikzCYi55pXZSaao2P0ftzxWmOnk1co5EyV8sN
         B06rEXq2YlO8OB7dpw/TVKmUVO2/E2jSYLMi5ejmGTiYnktTSFXLh4tBUG6lgDPDUndL
         15kvdoUKVgwPhLhAnLcSbGPXAJB07qqvvXNjv70v6XdEL7iL3hWff9CcCSw0SKthf6V8
         ykfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880183; x=1790484983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqIw7LcK5jQdSK0s4Y8nxBRoBvyvqxkISqwhOeUOv4I=;
        b=B1/M9lpaIAlwliRz/KMupLVP78vMBEOsbPFF1hrlmdjTQ/ruNIfFDmR97PukHg6zka
         aJQThvIbl6g4C/bRt2e52wni1XPGm0YISpfS6GHdK7hS/yvKfiA7a0UfpJ+O2NzmC5mn
         waWB9zd3EpeO9GE78iq2hGQZE1PPoVrqbqbsjt1s4pSIZPEe6Bzpmck17i6j5s4u1PSV
         4ihSQz/bnimM31nOoLF2beHK5gsgi9o9qLZ4uDAvyCQEEGp9vuFG9h9w5PVvY6hI8157
         wyabHXGyYT5oUnyDQmn86Q6splfqW+ydhcO9oMzE/jJrn8uD3Rf+8vAR4BRZlJ7endeQ
         nMAw==
X-Forwarded-Encrypted: i=1; AKwUvBwQnjf+7Rh81KEpDUZuvvY7ghMoSXr6lpWgkZZJDv2rmbb8CF8dKixo0DYV8v5stkOg+kwLEAFX2xUyCkI=@vger.kernel.org
X-Gm-Message-State: AFuF++kZf6uGEeVvWnKBi6jPVL9bvwmDOIsvq21WqeBArM57kBCmCqaH
	q3AhZED7NgJIlClL5a+aunV1bTowW0Ku551b0el3DhDukcTePnxNEeyf
X-Gm-Gg: AYBFou0BmY837+v3cnrckpuA1cO3p0VIbVlmVUTTfYbyZxiZXb0d6PbR5oA0fzBlsHt
	+cy0txHJ1xZ/YtTsB1NQAa55CCNxLSvsKBoolxegrakK7AuXZpF5I08Ki1TpIqt6QWDrFfOCcf5
	58skB2rQWBqFihkKWUm+rOlBHLJ3Tt8uhzQe4G+X7JjmzMtGJ5j5+KdGtlzrPxm2JJbS3lshoTl
	pjlQEoFkbNLA4PLpBTO+MtpS63EY3KA/yPnRdj6huKP3gbyiIMiDiJWZEvd9q57TjoKVUGarFA8
	NbAR40LjZQH6sdvZJSvwYB1iA4CEnho6k+Z2/7hzupAvYqYm2Y0AbPnx8JAzI3ghwgJqxN/5MAF
	qplsvyYQXeRjdjGvyDqKW8JFt1QoPgNKAK8hq0GtsgYXEQ171tKh6W40gnuzA+5OwdN/JglRUhk
	40dvkADvuqiim5TmDKbR49p2zpik0QR2c+gWvHlHaWOHZrlVlHRczYZL5NV8osf55K7UDt8FLOv
	BuUOlrK0Yyl34xZv2CbsKjF0F3V2TEiIk1zcVNMo5eYdLFEDm0+hNUanyNz1qsKfalVVzQW6hgq
	7nlU+5csshpP4jWzHOSYPWSAGp4gUD72oNR3Z9fiFWs9g2I=
X-Received: by 2002:a17:903:984:b0:2d9:599e:df95 with SMTP id d9443c01a7336-2ddb1ac7dc7mr124652565ad.3.1789880182788;
        Sat, 19 Sep 2026 21:56:22 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:22 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:47 +1000
Subject: [PATCH 08/28] ALSA: control: Add kcontrol callbacks for
 lock/unlock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-8-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3895;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=hq0jHTZPh6rJ3zZLKaOltAD+GhyW13KMayUHUfC4/Ik=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xWKi03e3C3nqtgRqz/pt8BfFxWmzIUJDzd0z1yyQ
 +xM8rSijoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFXzMjJ8eL7wzf8MQd22z17z9l5xy770g6Hcr9EtrWTa9LDvL//pMzL8E/n2a9W
 Jk6+Nsj5e3Tn3Oldm8T57U3k+3hWvjp+ZGVTHDQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

This allows drivers to implement policy around locking/unlocking
controls, such as enforcing that a group of controls may only be locked
by the same process/file, and taking actions when the controls
lock/unlock (such as granting special access on lock and resetting
values on unlock).

This is, in particular, useful to implement volume safety controls, such
that only a particular process (that locks controls and completes a
handshake) may increase volumes above a given safe limit. It also allows
the volume to be automatically lowered if that process dies (which will
trigger an implicit unlock).

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/control.h |  7 +++++++
 sound/core/control.c    | 16 ++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index 909db0d0485d..6b3ef6be5100 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -15,9 +15,12 @@
 #define snd_kcontrol_chip(kcontrol) ((kcontrol)->private_data)
 
 struct snd_kcontrol;
+struct snd_ctl_file;
 typedef int (snd_kcontrol_info_t) (struct snd_kcontrol * kcontrol, struct snd_ctl_elem_info * uinfo);
 typedef int (snd_kcontrol_get_t) (struct snd_kcontrol * kcontrol, struct snd_ctl_elem_value * ucontrol);
 typedef int (snd_kcontrol_put_t) (struct snd_kcontrol * kcontrol, struct snd_ctl_elem_value * ucontrol);
+typedef int (snd_kcontrol_lock_t) (struct snd_kcontrol * kcontrol, struct snd_ctl_file *owner);
+typedef void (snd_kcontrol_unlock_t) (struct snd_kcontrol * kcontrol);
 typedef int (snd_kcontrol_tlv_rw_t)(struct snd_kcontrol *kcontrol,
 				    int op_flag, /* SNDRV_CTL_TLV_OP_XXX */
 				    unsigned int size,
@@ -56,6 +59,8 @@ struct snd_kcontrol_new {
 	snd_kcontrol_info_t *info;
 	snd_kcontrol_get_t *get;
 	snd_kcontrol_put_t *put;
+	snd_kcontrol_lock_t *lock;
+	snd_kcontrol_unlock_t *unlock;
 	union {
 		snd_kcontrol_tlv_rw_t *c;
 		const unsigned int *p;
@@ -75,6 +80,8 @@ struct snd_kcontrol {
 	snd_kcontrol_info_t *info;
 	snd_kcontrol_get_t *get;
 	snd_kcontrol_put_t *put;
+	snd_kcontrol_lock_t *lock;
+	snd_kcontrol_unlock_t *unlock;
 	union {
 		snd_kcontrol_tlv_rw_t *c;
 		const unsigned int *p;
diff --git a/sound/core/control.c b/sound/core/control.c
index 4199342d4ffe..c8aab9abd306 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -126,10 +126,12 @@ static int snd_ctl_release(struct inode *inode, struct file *file)
 	scoped_guard(rwsem_write, &card->controls_rwsem) {
 		list_for_each_entry(control, &card->controls, list)
 			for (idx = 0; idx < control->count; idx++)
-				if (control->vd[idx].owner == ctl)
+				if (control->vd[idx].owner == ctl) {
 					control->vd[idx].owner = NULL;
+					if (control->unlock)
+						control->unlock(control);
+				}
 	}
-
 	snd_fasync_free(ctl->fasync);
 	snd_ctl_empty_read_queue(ctl);
 	put_pid(ctl->pid);
@@ -306,6 +308,8 @@ struct snd_kcontrol *snd_ctl_new1(const struct snd_kcontrol_new *ncontrol,
 	kctl->info = ncontrol->info;
 	kctl->get = ncontrol->get;
 	kctl->put = ncontrol->put;
+	kctl->lock = ncontrol->lock;
+	kctl->unlock = ncontrol->unlock;
 	kctl->tlv.p = ncontrol->tlv.p;
 
 	kctl->private_value = ncontrol->private_value;
@@ -1487,6 +1491,12 @@ static int snd_ctl_elem_lock(struct snd_ctl_file *file,
 	vd = &kctl->vd[snd_ctl_get_ioff(kctl, &id)];
 	if (vd->owner)
 		return -EBUSY;
+
+	if (kctl->lock) {
+		int err = kctl->lock(kctl, file);
+		if (err < 0)
+			return err;
+	}
 	vd->owner = file;
 	return 0;
 }
@@ -1511,6 +1521,8 @@ static int snd_ctl_elem_unlock(struct snd_ctl_file *file,
 	if (vd->owner != file)
 		return -EPERM;
 	vd->owner = NULL;
+	if (kctl->unlock)
+		kctl->unlock(kctl);
 	return 0;
 }
 

-- 
2.55.0

