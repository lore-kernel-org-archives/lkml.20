Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982755;
	b=UU6DNG5F+daLLsXABUHU2Nog90g6pK+OvG2RN6y/UzayXyV7I+e82AyFNSeaUVdm/bC0
	 rkQOOzZpH7YkA0t8FmFpQxAkUjtYxTj5TmXZvcxaf59i0EE5q3TP2hL9fZxSD+OTUo5h9
	 F8jQFeLaHlkJ7K4AOT7J+6BuGaqPjC9QThkKRbY3yUim90K8oI3FlmkK0lDE6PM+6vyT6
	 B+q6PTldpvRg2DPQc6tm9a5clmcIrHPKNqaCxx12F2YVMtwoAo2xYc+VlDjfofvKl3xby
	 S1AniDg89KBPKLINCJvf/c4ZrjcyqzmUkzi7qoBw4EgvzclSztE8Ch5TQBp902cynLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y6CV3nwpy9JV3powdrMcn3LQpLwA+ztaN50VcVNjMTY=;
	b=II74gRwfHmNj8t1QhPNW5Jd6rbdm+pnRYQaJx9qqtOZuIKiYsTCUiQckufhRLHLtHeoP
	 DkRGH/LAwK0D8+hV9J6gTds8mpjoP+V4Jhw3RioGI7wPdwoKrQWEPMWBD1QYWiM+YnAza
	 sjDuklUurbCG+8XwbnwWmT732Q/leKrEUc2UtgD7Gcv/VmF+KGjTiTpZdav2NYYviKn6g
	 eLzm5sd7meBAIt2cAxyN4dGmCcqp1VdgOyvcZo6sPw+vvVSB4ojdsMdiPzXp5u2wzxulU
	 v6UJA5p6+886ZtE7InoGpqpmBHkXML+PJ7DqjsL/uKff4FvyE+kipdl/CF9ttaPrcXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkRUP+Se;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C81606A338
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20C81606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkRUP+Se
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8253bc5a613so518610a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982754; x=1794587554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6CV3nwpy9JV3powdrMcn3LQpLwA+ztaN50VcVNjMTY=;
        b=HkRUP+Se2O0T74Y7mfZ5xKk7p+oWqagVVxBBw40WiQ6nn+Bxmss96SbgY1LiXvuUWq
         Ei8EwiyfYhG5mNxGRlswY07NYJ2XBRAse47C5uFFJ9W1ZWZZiMlhLw1m/rOSoFr/y6is
         O4yBc+Q0kGWqzrulSGfXdUlJgC08GsNY+nK8eKPwHlss7Rl4Gje5lVhFJKNQhZMwo9gO
         lgQ5ZEvB0p3kUCBv58Jbf/PoPbnCK3vwBGuO06yPYw/l4huVMYm2NoukXAx6aflAamS0
         9/868nUjEoc1wsenRzQay/kvLBYY/ifzF0vzoKDLBq4wAuBxTrBrrmYx9dpeVsfk9v1j
         1Lrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982754; x=1794587554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y6CV3nwpy9JV3powdrMcn3LQpLwA+ztaN50VcVNjMTY=;
        b=Vz0x36gxXoPoEm+BqeezrlTBHXIU5g7m0liwl9KrkRNSBXOuHgMHB8UHuvGhpAoJQQ
         qniTdKFXXH3irkYmnewh/RqPruMmLJhC3p1I1hHxvoZcVe3EiuCSe3jEP374FOcliiBX
         r9bpJiqwFbeDMisQxZfZ5cMBGiKILFlTTCy6BajdjCQsrJpPppN+ngg5koXqN1EhIztb
         JKkwbXprlkFRSkBCBMyDNcrqaOAOONcFjjfu9UfUyj2z7EmJOpYdUJGq2x/WlTbGpSsd
         0Yb+b0iri/Rr3SCnRZ5G4DebabWhqd/Go8SfCZ+WrLujELPBi/GUilzisma2CkZuamRN
         VBGA==
X-Forwarded-Encrypted: i=1; AKwUvBxX1catbhbSa3jQDAZnOQcVj5kBpfVy/f9Qaw4cvuVXx9zsGF69mvzV60HYoVEibt3BXjNNqJPYrYDaYzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JaEFXlFVMq/f2MNMHP9J8mLl455LkiNyXNzukHGPBXUbjTFWs
	+SQNcD+TNAxyJRDYhZr30JhyaEcrmB0yChZ2vNSva5mLo5NkqiLBvQzf
X-Gm-Gg: AYBFou09P5DNDYeRoH5HZWyQYrYzOQXPQN3vBWNE+2vQl6zqnAHGKpinpplqPaxJojq
	CYLTDgIILbu4Rl0s8ivWMCXXoY7l7zCfIv3s9FsIsX0uOAdwkzsXD4Mn4ZaJO7B/UxU8yPTWFSB
	bLXJliBvSJYlO21Gd2t93GSECFlDrD8EGP4DK4NGbDaVMyCU5lIVAyDlG1AieAgKjkoSmm+f21I
	0JuB4ZCjXYC9FwiYRdTAli5wRbaexqckNTFZKjqemvIO2cT2jTt97ExuWvSXbzxbeIuhNguazEB
	nXNTFukz7lEVZoYWtdfxxV1zyo2GkJxcz0WfgYZLfkZSbZi1LjHvwuzuNMR9CXyXhcXYH7jEFna
	Ekm84rPng1ReT4+zJ5L4sxzjfKCNp5R86bgj9TpUbU5zqt7QFoHsMSC3BDLXxRp4x8Gy6toxXDI
	xC0KUsS0iVOd3/vztsgveE2avzjeW6mAqL9vQ2hry8albVzWqpMlYnAVLPTkATA/zQpSgb29fv3
	B1qXCkbyjlEM7MS7aZjjF7FU4YJNmeS/nYFrOjapyFw9dr8ULN3MqG6DbT0ubCwrMKTvbMS7Ct6
	PQS/12vL3ZgJ5bPeV/OIX2L1PQFhuwdXUScFqdvxv3vfGLs=
X-Received: by 2002:a05:6830:2647:b0:822:6f0d:d04d with SMTP id 46e09a7af769-85f1d000ddamr2722429a34.16.1793982754009;
        Fri, 06 Nov 2026 08:32:34 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:33 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 10/16] ALSA: mixer_audient: add control value caching
Date: Fri,  6 Nov 2026 10:31:23 -0600
Message-ID: <20261106163129.1006907-11-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106163129.1006907-1-mrwillporter@gmail.com>
References: <aupn1wwW7w08M3gu@khmer.arcnet>
 <20261106163129.1006907-1-mrwillporter@gmail.com>
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

From: Christian Ruppert <arc@gmx.li>

In preparation of id14 support, add control value caching.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Co-developed-by: Will Porter <mrwillporter@gmail.com>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
Assisted-by: Claude:claude-opus-5-5
---
 sound/usb/mixer_audient.c | 185 ++++++++++++++++++++++++++++++--------
 1 file changed, 149 insertions(+), 36 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index f61f9fe61345..f7a422392ed1 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -40,6 +40,7 @@ static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_mixer, -12800, 600);
 #define SND_AUDIENT_CTYPE_FLAGS_SIGNED		BIT(0)
 #define SND_AUDIENT_CTYPE_FLAGS_INIT_HW		BIT(1)
 #define SND_AUDIENT_CTYPE_FLAGS_FORCE_SET	BIT(2)
+#define SND_AUDIENT_CTYPE_FLAGS_CACHE		BIT(3)
 
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
@@ -51,7 +52,7 @@ static const struct snd_audient_ctrl_type {
 	union {
 		long integer;
 	} max;		/* for booleans holds physical int value for true */
-	u32 init;
+	u32 init;	/* hardware and cache are initialized to this value */
 	const unsigned int *tlv;
 	u8 unit;
 	u8 sel;
@@ -91,7 +92,8 @@ static const struct snd_audient_ctrl_type {
 	},
 	[SND_AUDIENT_TYPE_MIXER] = {
 		.type = SNDRV_CTL_ELEM_TYPE_INTEGER,
-		.flags = SND_AUDIENT_CTYPE_FLAGS_SIGNED,
+		.flags = SND_AUDIENT_CTYPE_FLAGS_SIGNED
+			 | SND_AUDIENT_CTYPE_FLAGS_CACHE,
 		.len = 2,
 		.min.integer = -128 * 256,
 		.max.integer = 6 * 256,
@@ -238,6 +240,26 @@ static inline u16 snd_audient_kctl_channels(struct snd_kcontrol *kctl)
 	return info->channels;
 }
 
+/*
+ * A cached value is valid once a transfer confirmed it: a read, or a write
+ * that succeeded. A probe transfer that fails leaves it invalid. CACHE |
+ * FORCE_SET without INIT_HW keeps the earlier behaviour: the init value is
+ * assumed, without a transfer.
+ */
+struct snd_audient_cache_entry {
+	u32 value;
+	bool valid;
+};
+
+/* Cache entry of element channel i, or NULL for an uncached control. */
+static inline struct snd_audient_cache_entry *
+snd_audient_cache_slot(struct usb_mixer_elem_info *elem, unsigned int i)
+{
+	struct snd_audient_cache_entry *const cache = elem->private_data;
+
+	return cache ? cache + i : NULL;
+}
+
 
 #define AUDIENT_REQTYPE_SET (USB_DIR_OUT | USB_TYPE_CLASS \
 					 | USB_RECIP_INTERFACE)
@@ -287,12 +309,26 @@ static inline int snd_audient_set_cur(struct usb_mixer_interface *mixer,
 
 static int snd_audient_raw_get_one(struct usb_mixer_interface *const mixer,
 			const struct snd_audient_ctrl_type *const ctype,
+			struct snd_audient_cache_entry *const slot,
 			const u8 cidx, u32 *const value)
 {
 	int ret;
 	__le32 buf = 0;
 	s32 val;
 
+	if (slot && slot->valid) {
+		*value = slot->value;
+
+		return ctype->len;
+	}
+
+	/*
+	 * Cached FORCE_SET controls are treated as write-only: an invalid
+	 * cache entry does not trigger a GET.
+	 */
+	if (slot && (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET))
+		return -ENODATA;
+
 	ret = snd_audient_get_cur(mixer, ctype, cidx, &buf);
 	if (ret < 0)
 		return ret;
@@ -304,43 +340,57 @@ static int snd_audient_raw_get_one(struct usb_mixer_interface *const mixer,
 
 	*value = val;
 
+	if (slot) {
+		slot->value = val;
+		slot->valid = true;
+	}
+
 	return ret;
 }
 
 static int snd_audient_raw_set_one(struct usb_mixer_interface *const mixer,
 			const struct snd_audient_ctrl_type *const ctype,
-			const u8 cidx, const u32 value)
+			struct snd_audient_cache_entry *const slot,
+			const u8 cidx, const u32 value,
+			bool force)
 {
 	int ret;
 	u32 val;
 
-	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET) {
+	if (force) {
 		val = !value;		/* just make it different */
 	} else {
-		ret = snd_audient_raw_get_one(mixer, ctype, cidx, &val);
-		if (ret < 0)
+		ret = snd_audient_raw_get_one(mixer, ctype, slot, cidx, &val);
+		if (ret == -ENODATA)	/* FORCE_SET and not cached yet */
+			val = !value;	/* just make it different */
+		else if (ret < 0)
 			return ret;
 	}
 
-	if (val != value) {
+	force = force || (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET);
+
+	if (force || (val != value)) {
 		__le32 buf = cpu_to_le32(value);
 
 		ret = snd_audient_set_cur(mixer, ctype, cidx, &buf);
 		if (ret < 0)
 			return ret;
 
-		return 1;
+		if (slot) {
+			slot->value = value;
+			slot->valid = true;
+		}
 	}
 
-	return 0;
+	return val != value;
 }
 
 
 static int snd_ctl_audient_boolean_get(struct snd_kcontrol *kctl,
 				       struct snd_ctl_elem_value *ctl_val)
 {
-	struct usb_mixer_elem_list *const list = snd_kcontrol_chip(kctl);
-	struct usb_mixer_interface *const mixer = list->mixer;
+	struct usb_mixer_elem_info *const elem = snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *const mixer = elem->head.mixer;
 
 	const unsigned int nchan = snd_audient_kctl_channels(kctl);
 	const unsigned int hwchan = snd_audient_kctl_hwchannels(kctl);
@@ -353,13 +403,19 @@ static int snd_ctl_audient_boolean_get(struct snd_kcontrol *kctl,
 	CLASS(snd_usb_lock, pm)(mixer->chip);
 	if (pm.err < 0)
 		return pm.err;
+	/* serializes the transfers and the cache, also between gets */
+	guard(mutex)(&mixer->lock);
 
 	for (i = 0; i < hwchan; i++) {
 		u32 buf;
 		int ret;
 
-		ret = snd_audient_raw_get_one(mixer, ctype, base + i, &buf);
-		if (ret < 0)
+		ret = snd_audient_raw_get_one(mixer, ctype,
+					      snd_audient_cache_slot(elem, i),
+					      base + i, &buf);
+		if (ret == -ENODATA)	/* unknown write-only value: off */
+			buf = ctype->min.integer;
+		else if (ret < 0)
 			return ret;
 
 		ctl_val->value.integer.value[i] = (buf == ctype->min.integer)
@@ -375,8 +431,8 @@ static int snd_ctl_audient_boolean_get(struct snd_kcontrol *kctl,
 static int snd_ctl_audient_boolean_set(struct snd_kcontrol *kctl,
 				       struct snd_ctl_elem_value *ctl_val)
 {
-	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kctl);
-	struct usb_mixer_interface *mixer = list->mixer;
+	struct usb_mixer_elem_info *const elem = snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *const mixer = elem->head.mixer;
 
 	const unsigned int hwchan = snd_audient_kctl_hwchannels(kctl);
 	const struct snd_audient_ctrl_type *const ctype
@@ -389,13 +445,17 @@ static int snd_ctl_audient_boolean_set(struct snd_kcontrol *kctl,
 	CLASS(snd_usb_lock, pm)(mixer->chip);
 	if (pm.err < 0)
 		return pm.err;
+	/* serializes the transfers and the cache, also between gets */
+	guard(mutex)(&mixer->lock);
 
 	for (i = 0; i < hwchan; i++) {
 		u32 buf = ctl_val->value.integer.value[i] ? ctype->max.integer
 							  : ctype->min.integer;
 		int ret;
 
-		ret = snd_audient_raw_set_one(mixer, ctype, base + i, buf);
+		ret = snd_audient_raw_set_one(mixer, ctype,
+					      snd_audient_cache_slot(elem, i),
+					      base + i, buf, false);
 		if (ret < 0)
 			return ret;
 
@@ -409,8 +469,8 @@ static int snd_ctl_audient_boolean_set(struct snd_kcontrol *kctl,
 static int snd_ctl_audient_integer_get(struct snd_kcontrol *kctl,
 				   struct snd_ctl_elem_value *ctl_val)
 {
-	struct usb_mixer_elem_list *const list = snd_kcontrol_chip(kctl);
-	struct usb_mixer_interface *const mixer = list->mixer;
+	struct usb_mixer_elem_info *const elem = snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *const mixer = elem->head.mixer;
 
 	const unsigned int nchan = snd_audient_kctl_channels(kctl);
 	const unsigned int hwchan = snd_audient_kctl_hwchannels(kctl);
@@ -423,13 +483,19 @@ static int snd_ctl_audient_integer_get(struct snd_kcontrol *kctl,
 	CLASS(snd_usb_lock, pm)(mixer->chip);
 	if (pm.err < 0)
 		return pm.err;
+	/* serializes the transfers and the cache, also between gets */
+	guard(mutex)(&mixer->lock);
 
 	for (i = 0; i < hwchan; i++) {
 		s32 val;
 		int ret;
 
-		ret = snd_audient_raw_get_one(mixer, ctype, base + i, &val);
-		if (ret < 0)
+		ret = snd_audient_raw_get_one(mixer, ctype,
+					      snd_audient_cache_slot(elem, i),
+					      base + i, &val);
+		if (ret == -ENODATA)	/* unknown write-only value: minimum */
+			val = ctype->min.integer;
+		else if (ret < 0)
 			return ret;
 
 		if (val < ctype->min.integer)
@@ -450,8 +516,8 @@ static int snd_ctl_audient_integer_get(struct snd_kcontrol *kctl,
 static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
 				   struct snd_ctl_elem_value *ctl_val)
 {
-	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kctl);
-	struct usb_mixer_interface *mixer = list->mixer;
+	struct usb_mixer_elem_info *const elem = snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *mixer = elem->head.mixer;
 
 	const unsigned int hwchan = snd_audient_kctl_hwchannels(kctl);
 	const struct snd_audient_ctrl_type *const ctype
@@ -471,12 +537,16 @@ static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
 	CLASS(snd_usb_lock, pm)(mixer->chip);
 	if (pm.err < 0)
 		return pm.err;
+	/* serializes the transfers and the cache, also between gets */
+	guard(mutex)(&mixer->lock);
 
 	for (i = 0; i < hwchan; i++) {
 		s32 val = ctl_val->value.integer.value[i];
 		int ret;
 
-		ret = snd_audient_raw_set_one(mixer, ctype, base + i, val);
+		ret = snd_audient_raw_set_one(mixer, ctype,
+					      snd_audient_cache_slot(elem, i),
+					      base + i, val, false);
 		if (ret < 0)
 			return ret;
 
@@ -517,6 +587,8 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 	struct snd_kcontrol *kctl;
 	struct usb_mixer_elem_info *elem;
 
+	int ret;
+
 	knew.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	knew.name = ctrl->name;
 	knew.info = snd_ctl_audient_info;
@@ -524,7 +596,9 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 						   ctrl->hwchannels);
 	knew.tlv.p = ctype->tlv;
 	knew.access = SNDRV_CTL_ELEM_ACCESS_READWRITE
-			| SNDRV_CTL_ELEM_ACCESS_VOLATILE
+			| ((ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE)
+			   ? 0
+			   : SNDRV_CTL_ELEM_ACCESS_VOLATILE)
 			| (ctype->tlv ? SNDRV_CTL_ELEM_ACCESS_TLV_READ : 0);
 
 	switch (ctype->type) {
@@ -540,36 +614,75 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 		return -EINVAL;
 	}
 
+	elem = kzalloc(sizeof(*elem)
+		       + ((ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE)
+			  ? (sizeof(struct snd_audient_cache_entry)
+			     * ctrl->hwchannels)
+			  : 0),
+		       GFP_KERNEL);
+	if (!elem)
+		return -ENOMEM;
+
+	elem->head.mixer = mixer;
+	elem->channels = ctrl->channels;
+
+	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE)
+		elem->private_data = elem + 1;
+
+	/*
+	 * A failed probe transfer must not fail the card: warn and keep the
+	 * control. Its cache entry stays invalid, so a readable control reads
+	 * the device again on its next get, and a write-only control shows an
+	 * unknown value until a put succeeds.
+	 */
 	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_INIT_HW) {
 		int i;
 
 		for (i = 0; i < ctrl->hwchannels; i++) {
-			int ret = snd_audient_raw_set_one(mixer, ctype,
-							  ctrl->val_offs + i,
-							  ctype->init);
+			ret = snd_audient_raw_set_one(mixer, ctype,
+						      snd_audient_cache_slot(elem, i),
+						      ctrl->val_offs + i,
+						      ctype->init, true);
 			if (ret < 0)
 				usb_audio_warn(mixer->chip,
 					       "%s: cannot set channel %d (%d)\n",
 					       ctrl->name, i, ret);
 		}
-	}
-
-	elem = kzalloc_obj(*elem);
-	if (!elem)
-		return -ENOMEM;
+	} else if (elem->private_data) {
+		struct snd_audient_cache_entry *const cache = elem->private_data;
+		int i;
 
-	elem->head.mixer = mixer;
-	elem->channels = ctrl->channels;
+		for (i = 0; i < ctrl->hwchannels; i++) {
+			if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET) {
+				cache[i].value = ctype->init;
+				cache[i].valid = true;
+				continue;
+			}
+
+			ret = snd_audient_raw_get_one(mixer, ctype, cache + i,
+						      ctrl->val_offs + i,
+						      &cache[i].value);
+			if (ret < 0)
+				usb_audio_warn(mixer->chip,
+					       "%s: cannot read channel %d (%d)\n",
+					       ctrl->name, i, ret);
+		}
+	}
 
 	kctl = snd_ctl_new1(&knew, elem);
 	if (!kctl) {
-		kfree(elem);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto free_elem;
 	}
 
 	kctl->private_free = snd_usb_mixer_elem_free;
 
 	return snd_usb_mixer_add_control(&elem->head, kctl);
+
+free_elem:
+	kfree(elem);
+
+	return ret;
 }
 
 
-- 
2.47.3

