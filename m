Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451057;
	b=vZcCJnCHC4OJYbaSBWvDGR4EMRaKKXoffMGkTfpvgHSkG+yw6WX/fZ8UVo+HRxRapVK8
	 rLvMCK94URe4Bkhl+wfm8g74cmT29xUEc9zxPEFDo72x/S+fJwiep6G5XAF8Htz9Q7ENw
	 wF86qre/btzoQapfoGK4A/M5Lw2V656sKOfHFiTM3JReTIMFNBVv4nv3S/AaGgKOvdki1
	 qtxRCDrXcEv05BJheFwbyXT3qxUTTdE1udB+Bn72jKqfoZGXdJpzx0NnMAka4xS9EJWuG
	 ZGcjWET4oiELjKirH9vCyMuctoz8yfaw4GBFwtqi15NKmjAfOKm7NvfhCurF6jaLwpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c9xgNWOsmEBMJb5AmiaBWGNZYkreLzhpNHe1txX3rSk=;
	b=hKh98nEdv0OaBeHXjalojWXr26XqV4n0o+umsVpw3CRjTSPlatIf4MtIgofDxR0dzMte
	 r1FA1+JQN/3acgMkVAHy04jzGb+Ls0zJpletEizDYEmhHX13qVxOTrGA6CvVz/gTi1JFK
	 VvftlPlL2ZYOHcvAR6xv8SA2sYZWy+/M16IVoaqIP+K4Vy41enzwmhXURm2cgVJEXPr/y
	 lcmMMeDHLZQtab897zfID3dOhVQQFdE7nyTvdfk8/uSUixIUSNGWCG72SOClPCK1SZsbp
	 oD3WHOgcR3KRlT8t7OevJnRErv5fzn4mwnvtHp26jgokkmbhEadE5/24vSkuAYnpKUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l4JV7fhZ;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4174D606A880
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4174D606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l4JV7fhZ
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-475920b9ca2so1271606fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794451056; x=1795055856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c9xgNWOsmEBMJb5AmiaBWGNZYkreLzhpNHe1txX3rSk=;
        b=l4JV7fhZd3EzCLYf9koPOJx6IibW41InTvQxeGYdhmCKU0GgA3Rfa2BRDMIQ/mmkSD
         Kqxj5i102jUaS1b/fBp3H9kEYFYolKiR55AUVJGNU9KR19gNwz9nXecntFwR/19gSdd1
         A9gUeNcdGg+dlGnsEPz74LKuVBh6vpVfeNoCXuymQlN1vNb7txqujn3B5Hrxj7fmzpFQ
         fdqi7LvEQuZGGkQKwb+44VBcpHCtGdhwBGDkXlHlCAabM09TXuM37yQ3jL68q+W/SJe6
         p49kgi0cbkFSJPcAYxzi5HNNt3eQX8lADOg5LZgkOFOhiLX+jvz8SMfEha54P9s5kWRv
         NRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794451056; x=1795055856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c9xgNWOsmEBMJb5AmiaBWGNZYkreLzhpNHe1txX3rSk=;
        b=Tn1/YUEZRsz27XrCnvxyYgfod34xzgMBSsZxqZPLlSqUlyrMpNqTUt3enqGkHokDxC
         /zv84m0+qQR876uZWTc4QwJVgBeL/1ToknkXrj4hmmURbdgaZOPmZ1WXSp4vb+mkJ5uD
         0A3dNjQkbb1TPfWVk8RAtSlX/vTh5IAoysEdk7se87RCiqqfiohkTd6Epg/7PAUTbZEa
         O+YPxcB8fofdO6LCc+X2cnvHuJsrr0jTo3Qa32QiNMhR+tmNJaFHhwob87cfG/lbsTK3
         HDrdpUcwknml8Nw2tQwknWYuwxCUUKlfyq1PUUpCt5Iy4YpYxcOEP2kytZ2CV+Ncafcx
         8uzg==
X-Forwarded-Encrypted: i=1; AL+hErFLZ8MLDZl49hEEbba0dEDIoaTfOu/yxL/6DH11a2HhA9n/CNXVrPKjl4I1C7jcrxdj96qb/G51QfN0rUQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/U+uMVQCP+7TCa42BVP6vxt0VNWjYGY8MHbKUAV/0vLcnndsvZ
	xtRKxvPy6yTKsAZKJ48LUG72IPVYm8DTRLOh/Ib72YCsKe5zHrp35C7zEEIDIA==
X-Gm-Gg: AYBFou2B8uIrjUZCZUxIDQBh3CI/Fd+U629DGsXBXz7Zx53doVEWC7rG+9Vn/3xqR1O
	4zl9n8mq/6bUi9ljUfW3ZQKUK7KoXazgwc9UAqUCV3YgKzZVhh+9rUKA22gVsKnmzvONVmyB0aW
	wUz8lgJ9kES+dlq/1vn0qNMBbKUpS/u5IM5kwLE2eHAcRAcn3XeCBBZ78c9rUPVzagum4jy1d+V
	ylev5NIQVr5ralMP/Aap//dLxX9AaAKT7Fc1G8DePPuipqQdxb117JH/HoXfBT8ylIxGCcw8MTT
	VjH+665PsJAxXtC6j4qkJo84U+oY5FKnOz2UKPT9Nt83E49dwq9y5kXnJnZy3sZeUiU8x/HI9nO
	kRRI6xiwU2OYhxecaYnD/ECEw9RmOy6+6+PcSIUssR88wBKvKAQWhwLnKfIovThqPuMRlNlWpUE
	92QiJK18gg6cXHLtx02IWhRSuGBp1WMJlAZdAZZVznBnKLWCKrNWnbSESBnIIFHnud7nQxDknVL
	7T0cIE4wWqtmgEblEBi6y3gv8VdZkbqXUNc7kxy2Z5D9LCsje/HRCKL9HRqW3zPuzfqeuY0+6Eq
	0XE630IG+l+FY+zkMbIpY8WJIn+9cxpITMbT+uoNSdscpQ==
X-Received: by 2002:a05:6870:d608:b0:4a7:443a:e6cd with SMTP id 586e51a60fabf-4ae4685074amr3726728fac.6.1794451056147;
        Wed, 11 Nov 2026 18:37:36 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22f6a1c7sm4327310fac.6.2026.11.11.18.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:37:34 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 2/6] ALSA: mixer_audient: Use the cache of usb_mixer_elem_info
Date: Wed, 11 Nov 2026 20:37:16 -0600
Message-ID: <20261112023720.1503814-3-mrwillporter@gmail.com>
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

A cached control keeps its values in an array that is allocated after
the element and reached through elem->private_data. Every struct
usb_mixer_elem_info already has fields for this: the cached bitmap and
the cache_val[] array.

Use bit i of elem->cached and elem->cache_val[i] for element channel i.
The bit means what the valid flag meant: a transfer confirmed the
value. A successful read or write records the value and sets its bit.
A failed transfer leaves the cached value and the bit unchanged. Remove
the cache struct, its accessor and the extra allocation.

The generic cache holds MAX_CHANNELS values, so refuse a control with
more hardware channels. No control in the tables has more than two.

The generic notify paths clear the cache of an element unless
get_cur_broken is set. A write-only control cannot read its value back
after that, so set get_cur_broken for the cached FORCE_SET controls.
The notify paths do not reach these elements today, because the
elements do not set their unit id.

No functional change for the controls in the tables.

Assisted-by: Claude:claude-fable-5-2
Assisted-by: Claude:claude-sonnet-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 131 +++++++++++++++++---------------------
 1 file changed, 60 insertions(+), 71 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index df1e25a55a7a9..35b562b3aac51 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -555,24 +555,13 @@ static inline u16 snd_audient_kctl_channels(struct snd_kcontrol *kctl)
 }
 
 /*
- * A cached value is valid once a transfer confirmed it: a read, or a write
- * that succeeded. A probe transfer that fails leaves it invalid. CACHE |
- * FORCE_SET without INIT_HW keeps the earlier behaviour: the init value is
- * assumed, without a transfer.
+ * A cached control keeps its values in the cache of struct
+ * usb_mixer_elem_info: bit i of elem->cached and elem->cache_val[i] for
+ * element channel i. The bit is set once a transfer confirmed the value: a
+ * read, or a write that succeeded. A probe transfer that fails leaves it
+ * clear. CACHE | FORCE_SET without INIT_HW keeps the earlier behaviour: the
+ * init value is assumed, without a transfer.
  */
-struct snd_audient_cache_entry {
-	u32 value;
-	bool valid;
-};
-
-/* Cache entry of element channel i, or NULL for an uncached control. */
-static inline struct snd_audient_cache_entry *
-snd_audient_cache_slot(struct usb_mixer_elem_info *elem, unsigned int i)
-{
-	struct snd_audient_cache_entry *const cache = elem->private_data;
-
-	return cache ? cache + i : NULL;
-}
 
 
 #define AUDIENT_REQTYPE_SET (USB_DIR_OUT | USB_TYPE_CLASS \
@@ -621,26 +610,28 @@ static inline int snd_audient_set_cur(struct usb_mixer_interface *mixer,
 }
 
 
-static int snd_audient_raw_get_one(struct usb_mixer_interface *const mixer,
+static int snd_audient_raw_get_one(struct usb_mixer_elem_info *const elem,
 			const struct snd_audient_ctrl_type *const ctype,
-			struct snd_audient_cache_entry *const slot,
-			const u8 cidx, u32 *const value)
+			const unsigned int ch, const u8 cidx,
+			u32 *const value)
 {
+	struct usb_mixer_interface *const mixer = elem->head.mixer;
+	const bool cache = ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE;
 	int ret;
 	__le32 buf = 0;
 	s32 val;
 
-	if (slot && slot->valid) {
-		*value = slot->value;
+	if (cache && test_bit(ch, elem->cached)) {
+		*value = elem->cache_val[ch];
 
 		return ctype->len;
 	}
 
 	/*
-	 * Cached FORCE_SET controls are treated as write-only: an invalid
-	 * cache entry does not trigger a GET.
+	 * Cached FORCE_SET controls are treated as write-only: a clear
+	 * cache bit does not trigger a GET.
 	 */
-	if (slot && (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET))
+	if (cache && (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET))
 		return -ENODATA;
 
 	ret = snd_audient_get_cur(mixer, ctype, cidx, &buf);
@@ -654,27 +645,27 @@ static int snd_audient_raw_get_one(struct usb_mixer_interface *const mixer,
 
 	*value = val;
 
-	if (slot) {
-		slot->value = val;
-		slot->valid = true;
+	if (cache) {
+		elem->cache_val[ch] = val;
+		set_bit(ch, elem->cached);
 	}
 
 	return ret;
 }
 
-static int snd_audient_raw_set_one(struct usb_mixer_interface *const mixer,
+static int snd_audient_raw_set_one(struct usb_mixer_elem_info *const elem,
 			const struct snd_audient_ctrl_type *const ctype,
-			struct snd_audient_cache_entry *const slot,
-			const u8 cidx, const u32 value,
-			bool force)
+			const unsigned int ch, const u8 cidx,
+			const u32 value, bool force)
 {
+	struct usb_mixer_interface *const mixer = elem->head.mixer;
 	int ret;
 	u32 val;
 
 	if (force) {
 		val = !value;		/* just make it different */
 	} else {
-		ret = snd_audient_raw_get_one(mixer, ctype, slot, cidx, &val);
+		ret = snd_audient_raw_get_one(elem, ctype, ch, cidx, &val);
 		if (ret == -ENODATA)	/* FORCE_SET and not cached yet */
 			val = !value;	/* just make it different */
 		else if (ret < 0)
@@ -690,9 +681,9 @@ static int snd_audient_raw_set_one(struct usb_mixer_interface *const mixer,
 		if (ret < 0)
 			return ret;
 
-		if (slot) {
-			slot->value = value;
-			slot->valid = true;
+		if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE) {
+			elem->cache_val[ch] = value;
+			set_bit(ch, elem->cached);
 		}
 	}
 
@@ -724,9 +715,8 @@ static int snd_ctl_audient_boolean_get(struct snd_kcontrol *kctl,
 		u32 buf;
 		int ret;
 
-		ret = snd_audient_raw_get_one(mixer, ctype,
-					      snd_audient_cache_slot(elem, i),
-					      base + i, &buf);
+		ret = snd_audient_raw_get_one(elem, ctype, i, base + i,
+					      &buf);
 		if (ret == -ENODATA)	/* unknown write-only value: off */
 			buf = ctype->min.integer;
 		else if (ret < 0)
@@ -767,9 +757,8 @@ static int snd_ctl_audient_boolean_set(struct snd_kcontrol *kctl,
 							  : ctype->min.integer;
 		int ret;
 
-		ret = snd_audient_raw_set_one(mixer, ctype,
-					      snd_audient_cache_slot(elem, i),
-					      base + i, buf, false);
+		ret = snd_audient_raw_set_one(elem, ctype, i, base + i,
+					      buf, false);
 		if (ret < 0)
 			return ret;
 
@@ -839,9 +828,8 @@ static int snd_ctl_audient_integer_get(struct snd_kcontrol *kctl,
 		s32 val;
 		int ret;
 
-		ret = snd_audient_raw_get_one(mixer, ctype,
-					      snd_audient_cache_slot(elem, i),
-					      base + i, &val);
+		ret = snd_audient_raw_get_one(elem, ctype, i, base + i,
+					      &val);
 		if (ret == -ENODATA)	/* unknown write-only value: minimum */
 			val = ctype->min.integer;
 		else if (ret < 0)
@@ -890,9 +878,8 @@ static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
 						   ctl_val->value.integer.value[i]);
 		int ret;
 
-		ret = snd_audient_raw_set_one(mixer, ctype,
-					      snd_audient_cache_slot(elem, i),
-					      base + i, val, false);
+		ret = snd_audient_raw_set_one(elem, ctype, i, base + i,
+					      val, false);
 		if (ret < 0)
 			return ret;
 
@@ -940,9 +927,8 @@ static int snd_ctl_audient_enum_get(struct snd_kcontrol *kctl,
 		int item;
 		int ret;
 
-		ret = snd_audient_raw_get_one(mixer, ctype,
-					      snd_audient_cache_slot(elem, i),
-					      base + i, &val);
+		ret = snd_audient_raw_get_one(elem, ctype, i, base + i,
+					      &val);
 		if (ret == -ENODATA)	/* unknown write-only value: init */
 			val = ctype->init;
 		else if (ret < 0)
@@ -990,9 +976,8 @@ static int snd_ctl_audient_enum_set(struct snd_kcontrol *kctl,
 		const unsigned int item = ctl_val->value.enumerated.item[i];
 		int ret;
 
-		ret = snd_audient_raw_set_one(mixer, ctype,
-					      snd_audient_cache_slot(elem, i),
-					      base + i, e->values[item], false);
+		ret = snd_audient_raw_set_one(elem, ctype, i, base + i,
+					      e->values[item], false);
 		if (ret < 0)
 			return ret;
 
@@ -1072,24 +1057,28 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 		return -EINVAL;
 	}
 
-	elem = kzalloc(sizeof(*elem)
-		       + ((ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE)
-			  ? (sizeof(struct snd_audient_cache_entry)
-			     * ctrl->hwchannels)
-			  : 0),
-		       GFP_KERNEL);
+	if (ctrl->hwchannels > MAX_CHANNELS)
+		return -EINVAL;
+
+	elem = kzalloc_obj(*elem);
 	if (!elem)
 		return -ENOMEM;
 
 	elem->head.mixer = mixer;
 	elem->channels = ctrl->channels;
 
-	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE)
-		elem->private_data = elem + 1;
+	/*
+	 * The generic notify paths clear the cache of an element unless
+	 * get_cur_broken is set. A write-only control cannot read its value
+	 * back after that.
+	 */
+	if ((ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE) &&
+	    (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET))
+		elem->get_cur_broken = 1;
 
 	/*
 	 * A failed probe transfer must not fail the card: warn and keep the
-	 * control. Its cache entry stays invalid, so a readable control reads
+	 * control. Its cache bit stays clear, so a readable control reads
 	 * the device again on its next get, and a write-only control shows an
 	 * unknown value until a put succeeds.
 	 */
@@ -1097,8 +1086,7 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 		int i;
 
 		for (i = 0; i < ctrl->hwchannels; i++) {
-			ret = snd_audient_raw_set_one(mixer, ctype,
-						      snd_audient_cache_slot(elem, i),
+			ret = snd_audient_raw_set_one(elem, ctype, i,
 						      ctrl->val_offs + i,
 						      ctype->init, true);
 			if (ret < 0)
@@ -1106,20 +1094,21 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 					       "%s: cannot set channel %d (%d)\n",
 					       ctrl->name, i, ret);
 		}
-	} else if (elem->private_data) {
-		struct snd_audient_cache_entry *const cache = elem->private_data;
+	} else if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE) {
 		int i;
 
 		for (i = 0; i < ctrl->hwchannels; i++) {
+			u32 val;
+
 			if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET) {
-				cache[i].value = ctype->init;
-				cache[i].valid = true;
+				elem->cache_val[i] = ctype->init;
+				set_bit(i, elem->cached);
 				continue;
 			}
 
-			ret = snd_audient_raw_get_one(mixer, ctype, cache + i,
+			ret = snd_audient_raw_get_one(elem, ctype, i,
 						      ctrl->val_offs + i,
-						      &cache[i].value);
+						      &val);
 			if (ret < 0)
 				usb_audio_warn(mixer->chip,
 					       "%s: cannot read channel %d (%d)\n",
-- 
2.47.3

