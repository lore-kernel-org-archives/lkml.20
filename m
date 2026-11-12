Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451054;
	b=J/8fLvtMehP8Uq8ssSozVyCkxe6HW7aG+V5NVHgUrIhJnpxxQG6OOIzSQNXQQ7nZCXZ9
	 o3du0NQmHEIqEZiRDLJ/eq3vnIJ2uBEDCVh9PjAFZ2IJfMHUaFVVVUMiE5bJeXWsT1d9C
	 zIbSId/9djOtA8opJ1pyujYMHnJ665ZLjgqf3IFup6i67lOsU29li6LMtaNIo5PwVNerX
	 ojskaGNrPBsIHDotNzwLJwy88fx5+DkGp26pS8CFDpTw1P0XvDhRnuLyfu7MaIjVU6378
	 BmBsKQGqe4ukFRr8Q+SFexCNbFYP6UeKWTGOgEr9wXpceiqliBeJfuZGPeNwe36otzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6W0fNXslGyBParY8Oqnxf9aa5mpuA6VW71AbceQTcxE=;
	b=zrIFE7GnZ54slJ4IS/Uu+v2fHzJLqaeA57vrag8+Cor8Xw/yVBu53mzq5sD1Uq2kL12c
	 ng0wThU6OV582uS3DlCQTNIXSZvUjbJEZNxgGDmZyZASbWw1cPVhDYS/Dn9P12BUegaqg
	 uhNPDUmQ+6lVksWaPHJbD/pvzvRaQKb5iqmF/CsXeHhR2ogQVcGCiTMATegMNK6LTxfrk
	 H5gT93pCFUJ8uByCyGZRZ+Eaod047xruma1ESBRGYnnKGWa7X5wxdjXMgm7u7GEt6VsDG
	 lrkWRSkPkhIkxG1nrEpSIi0rPXQk9yRdzw+3CQI3lYTDMBE2bUMTOjCm0GNtxHB21hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0Zce0Py;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8639F606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8639F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0Zce0Py
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4adba7b3399so1573350fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794451053; x=1795055853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6W0fNXslGyBParY8Oqnxf9aa5mpuA6VW71AbceQTcxE=;
        b=i0Zce0PywtrG7piZ23OflFxv23LyVh6JOzgVUoZVFQCkKPKKtrz0tNuJyT9uMvf8cY
         lpR+aASWPy4+SRpuZjvXQG3nOBcAMvEGp4DIlqHfhYW+oUsKkygi9aLxq9B12TulW/2r
         WdCqD85prszls+u95OteXhyQKBp5nbzbWLNSPKY6pGePOaww6MRKZXA30azxTZNH90ZM
         ZDRn3RLt2DAp2NPd+0R/9gfw1FAUeDVNXdJrnprUvoEaR7zyhrvJvc9KYsiE3pL+3YIf
         7jOn0qKo9aQbXqcPfuum8apvLLxOy8bscGuiC6Tl5R2b1VefkxrO5KtHGHU4D887KF76
         qiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794451053; x=1795055853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6W0fNXslGyBParY8Oqnxf9aa5mpuA6VW71AbceQTcxE=;
        b=xiRXWtKdjg1qq9QNTKxTiltD2qrh1z1O8SXESp5r018jKtH0XQcJ5zCnAh7gBfBC+1
         wzhxY5rbImMv8NnLB2pryCESl5h3j9TdqFX8ia5kzC00obVwg9j9eBYDuGH1WI8vurr8
         BK/bzLIZGSX7oOQg6uVwboP3fOphaoIDMUX5GzqWMV3ryaa52HnNhNn6bpTmX/lt4e/d
         BVdagfCleIP97CjcxnMtUp4NxDTfzPrjEM8NTWi4BHpXDkLWLVa+zAfTqX2vU4WXSea+
         /sqxGUo6zHivrpNsUGJ2YWO8DvZ11e1i/BvCmsE+kn4u/Bk7CaVndRLXIhh+elp+quag
         qvBA==
X-Forwarded-Encrypted: i=1; AL+hErEWCB4FX89U4JWwJS2j0EbTabCQJF+Fz2Ci7RYJim5RTfSSpjt+1359CrD6XhTrzCl+QydORlJrkkyAQVg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YdeVRZZs5sNY6kSFywqh020OlUVwXCCwPi9ePMsxshpjBnvms
	gjGbIDYf/6Mxe+S8dBfau2p/Rb4UWaortsv/YixWViEOXq5CzU2sgVqD
X-Gm-Gg: AYBFou1JUfJX0GChTAkkClfw5UoIUuobV8gRfTgwK7Xbi3ETgclhfbZE4vevB+eBy9x
	rqsc8Qljm8+XoIWbrK9L+udov31q2AsB0/hre2cYZ4aFFb3nF/Vzg/t6x3ZRxwZmuKih3Mih3h8
	i5iWfDqB5vpElF/ZMZKMF8vFgykNB8mMYOhYOPCC1pIowXlHVcla2PdozlwBq6Sy2vrhmwWiwBp
	YbIOvxGIZ4fs2a4rOP49DIFqv5pLyVwTG8b6VDVu6vxg3x5gLkg5B2AYE7YkoZuxjf+uHFV8bm6
	uo5ZMhrtUdZ3zPqMSyrYaI80W21f4VvM3++q7jlsMObjXYZEuAaKS2ZZpi91xFnWXI3jcn4seMK
	1+P4M3IgzOoGsoih43AwDPot6b2eBvwupudeFnfXdIltUO25wYw/qSHvCfjFgGk9na90osgSGSa
	qT4r/77736qwGzIxDzdMC+79Gx/eAdcj0MVljhEveP7FcEF4qjP1bqZIDJ0Le+8GPolwl8/aq6F
	xWkLVd7jw5kxDGbjjDvSBQ5zgy/lxR0NJvSGbdZhNwWg1+pk8ilCxAD7z4FALtZhfOBKz1fNCkq
	IQz933ubAECW0hWMHKPFGo/UF6wB643ug6p51mgtlD1rpTSeQMy30sjwb6v2u250i5s=
X-Received: by 2002:a05:6870:d1c3:b0:449:bccf:bb6e with SMTP id 586e51a60fabf-4ae4682ad7amr3465583fac.7.1794451053171;
        Wed, 11 Nov 2026 18:37:33 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22f6a1c7sm4327310fac.6.2026.11.11.18.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:37:32 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 1/6] ALSA: mixer_audient: Fold in the review changes to patches 12-16
Date: Wed, 11 Nov 2026 20:37:15 -0600
Message-ID: <20261112023720.1503814-2-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112023720.1503814-1-mrwillporter@gmail.com>
References: <avOFQAGTVkCXgs2l@khmer.arcnet>
 <20261112023720.1503814-1-mrwillporter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is not for merging. It carries the changes from the review
of RFC patches 12 to 16 as one diff, so that the patches after it apply
to the RFC with the enum fix. The next version of the series has these
changes in patches 12, 13, 15 and 16.

- Declare snd_audient_int_max(), snd_audient_int_min() and
  snd_audient_int_from_ctl() inline.
- snd_audient_enum_item() returns the item or -EIO, and get propagates
  the error.
- snd_ctl_audient_info() uses a switch.
- A comment on ID14_ENUM() says that readable enums do not use init.
- The two case labels in mixer_quirks.c share one call.
- Rename the create hook to extra_init and say that it is optional.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 58 +++++++++++++++++++++++----------------
 sound/usb/mixer_quirks.c  |  2 --
 2 files changed, 34 insertions(+), 26 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 4180d7d8b325c..df1e25a55a7a9 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -219,6 +219,11 @@ SND_AUDIENT_ENUM(snd_audient_id14_optical, snd_audient_id14_optical_texts,
 		.sel = (sel_),				\
 	}
 
+/*
+ * A readable enum. It has no cache entry, so a get always reads the device
+ * and never uses init. Write-only enums set .init and .flags without this
+ * macro.
+ */
 #define ID14_ENUM(unit_, sel_, len_, enum_)		\
 	{						\
 		.type = SNDRV_CTL_ELEM_TYPE_ENUMERATED,	\
@@ -494,8 +499,8 @@ static const struct audient_devinfo {
 	const struct snd_audient_ctrl *controls;
 	const char *const *const matrix_names;
 	const unsigned int matrix_channels;
-	/* controls the tables cannot describe; called after the tables */
-	int (*create)(struct usb_mixer_interface *mixer);
+	/* optional: controls the tables cannot describe, created after them */
+	int (*extra_init)(struct usb_mixer_interface *mixer);
 } audient_devinfo[] = {
 	{
 		.usb_id = USB_ID(USB_AUDIENT_VID, USB_EVO4_PID),
@@ -508,7 +513,7 @@ static const struct audient_devinfo {
 		.controls = snd_audient_id14_mk1_controls,
 		.matrix_names = snd_audient_id14_mk1_matrix,
 		.matrix_channels = 2,
-		.create = snd_audient_id14_mk1_create,
+		.extra_init = snd_audient_id14_mk1_create,
 	},
 	{ 0 } /* sentinel */
 };
@@ -779,13 +784,15 @@ static int snd_ctl_audient_boolean_set(struct snd_kcontrol *kctl,
  * With a step size (res), an integer control counts steps from min:
  * 0 ... (max - min) / res. Without one it shows the device value.
  */
-static long snd_audient_int_max(const struct snd_audient_ctrl_type *ctype)
+static inline long
+snd_audient_int_max(const struct snd_audient_ctrl_type *ctype)
 {
 	return ctype->res ? (ctype->max.integer - ctype->min.integer) / ctype->res
 			  : ctype->max.integer;
 }
 
-static long snd_audient_int_min(const struct snd_audient_ctrl_type *ctype)
+static inline long
+snd_audient_int_min(const struct snd_audient_ctrl_type *ctype)
 {
 	return ctype->res ? 0 : ctype->min.integer;
 }
@@ -802,8 +809,8 @@ static long snd_audient_int_to_ctl(const struct snd_audient_ctrl_type *ctype,
 		   snd_audient_int_max(ctype));
 }
 
-static long snd_audient_int_from_ctl(const struct snd_audient_ctrl_type *ctype,
-				     long val)
+static inline long
+snd_audient_int_from_ctl(const struct snd_audient_ctrl_type *ctype, long val)
 {
 	return ctype->res ? ctype->min.integer + val * ctype->res : val;
 }
@@ -896,16 +903,16 @@ static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
 	return changed;
 }
 
-static unsigned int snd_audient_enum_item(const struct snd_audient_enum *e,
-					  u32 value)
+/* The item index of a device value, or -EIO if the value is not in the list */
+static int snd_audient_enum_item(const struct snd_audient_enum *e, u32 value)
 {
 	unsigned int item;
 
 	for (item = 0; item < e->items; item++)
 		if (e->values[item] == value)
-			break;
+			return item;
 
-	return item;	/* e->items: not in the list */
+	return -EIO;
 }
 
 static int snd_ctl_audient_enum_get(struct snd_kcontrol *kctl,
@@ -929,8 +936,8 @@ static int snd_ctl_audient_enum_get(struct snd_kcontrol *kctl,
 	guard(mutex)(&mixer->lock);
 
 	for (i = 0; i < hwchan; i++) {
-		unsigned int item;
 		u32 val;
+		int item;
 		int ret;
 
 		ret = snd_audient_raw_get_one(mixer, ctype,
@@ -942,8 +949,8 @@ static int snd_ctl_audient_enum_get(struct snd_kcontrol *kctl,
 			return ret;
 
 		item = snd_audient_enum_item(ctype->enumeration, val);
-		if (item >= ctype->enumeration->items)
-			return -EIO;
+		if (item < 0)
+			return item;
 
 		ctl_val->value.enumerated.item[i] = item;
 	}
@@ -1002,22 +1009,25 @@ static int snd_ctl_audient_info(struct snd_kcontrol *kctl,
 	const struct snd_audient_ctrl_type *const ctype
 						= snd_audient_kctl_type(kctl);
 
-	if (ctype->type == SNDRV_CTL_ELEM_TYPE_ENUMERATED)
-		return snd_ctl_enum_info(uinfo, snd_audient_kctl_channels(kctl),
+	switch (ctype->type) {
+	case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
+		return snd_ctl_enum_info(uinfo,
+					 snd_audient_kctl_channels(kctl),
 					 ctype->enumeration->items,
 					 ctype->enumeration->texts);
-
-	uinfo->type = ctype->type;
-	uinfo->count = snd_audient_kctl_channels(kctl);
-
-	if (ctype->type == SNDRV_CTL_ELEM_TYPE_BOOLEAN) {
+	case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
 		uinfo->value.integer.min = 0;
 		uinfo->value.integer.max = 1;
-	} else {
+		break;
+	default:
 		uinfo->value.integer.min = snd_audient_int_min(ctype);
 		uinfo->value.integer.max = snd_audient_int_max(ctype);
+		break;
 	}
 
+	uinfo->type = ctype->type;
+	uinfo->count = snd_audient_kctl_channels(kctl);
+
 	return 0;
 }
 
@@ -1332,8 +1342,8 @@ int snd_audient_controls_create(struct usb_mixer_interface *mixer)
 		}
 	}
 
-	if (info->create)
-		return info->create(mixer);
+	if (info->extra_init)
+		return info->extra_init(mixer);
 
 	return 0;
 }
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 41d559d639d22..763bbeb2cd9da 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4541,8 +4541,6 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 		break;
 
 	case USB_ID(USB_AUDIENT_VID, USB_EVO4_PID): /* Audient EVO 4 */
-		err = snd_audient_controls_create(mixer);
-		break;
 	case USB_ID(USB_AUDIENT_VID, USB_ID14_MK1_PID): /* Audient iD14 MkI */
 		err = snd_audient_controls_create(mixer);
 		break;
-- 
2.47.3

