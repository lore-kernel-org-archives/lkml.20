Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451060;
	b=ZN7tizXqabd0eWpFAkd8iiiY/enmL39u6u2316DBHNslkot/hq57jF39p9J0amonDdPP
	 FV2XbqKk7zd1VdCVOt/w6Xheh0kGMc5p+Pf23GhUCvIyVs/t63x45ctL7qWFJwdKvSgrA
	 W3mkPnuOjWvoB5YJ9Zjh0V/1EH7BQjEtYa5id1Qb4Te52NkLcRZ9mzQpKtLYyoi7nQwD+
	 uGwcOOZ+bmteY6jvWlTc5rLMFSz/fl2Exus+qMrZ+pJJGgCpAZ5HS4ePpeqD8RVN5RSvo
	 GUJklE0BJxDsOrH12sAp7H8Vg3mZh/B72MK2AsmaC/4xu1bW+svkYcxeKyK4p85ulPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4LGltwQ3Kf8DkYrU7swKYOQk0fsRi67eRsuvppsb45E=;
	b=ll4doPnDZlv+bt3TZZ9cAUL0PTpnrplS9bd8fr30XBCOcREDjbJhClq9X7vi3K4tYSrV
	 oJYn5hipMH5c+fboVBUbeULz2LizmUZJkNdvSe6kxGp2hkuFQhqdovYeiwPb2+zD3LWgn
	 DAkSvwcES6Ga0ET5Hz6aYj8lu9vtgRg4s+XGIQfj1JNiO2Ep/bpVzsIvhP6fKZLo5BLfr
	 MczvdAXtmuWtoR6on25BCkdYS2fZ3iI+BRyKbNiADs5nl/OcJScywohohlRT9kckL/BzT
	 goyA3qq9TszOXjlS36rLKVs7qwfwuUX8mVEtwpJfqFpVJrJX6hzSgNrqVkL3Qu+cI7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mj5xkh4T;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48F4606A88C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A48F4606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mj5xkh4T
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8451a619da7so2334179a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794451058; x=1795055858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LGltwQ3Kf8DkYrU7swKYOQk0fsRi67eRsuvppsb45E=;
        b=mj5xkh4T6RqD6GDvHyQl55SV4gBgq/24mN3Nv1xMtiLLI0xe/fN9nBVvuoqMfIvHn7
         UXB6At2xQrs9rrlsq+zyuidgpmHPC5/5KZQqPtFOe+XSeu17h3OTHbgKzUDso9nhQcXY
         AxdcxDdtWO9r4oivVWF8V/Pdgayhb1WvliC36aSFnhx1k9B6mfrifblnPqlp3L6PbhXd
         qkCHUGiBLPNXs12U0s++2ZNlY42CJ8ysjTIKLfHkEDdxpBqHsxJjLuPZgtMXhAU3Mrtc
         F9pWz82dtLL/LPIHL/AdDoMkUY/islXuMt0yXyo9QGXcSNIpR+RA/xdoyb8tiikbnoht
         8DyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794451058; x=1795055858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LGltwQ3Kf8DkYrU7swKYOQk0fsRi67eRsuvppsb45E=;
        b=cGkb9N7MCmFzO3ZHZf9rLZ0Vk423knKsPMjzSMr3fkNRzxweTyJCAbEj1GRUwXp/FK
         TpANYjESIynT95ecGEjvQX60PU8B4QAJZvEyBoklFhbSUlhvh+khtJNO1ydBzL4ZBvxs
         qZHZAQrb8n39xNTmO9ztWK0LtsZedoQbXGjDk1VaAXtA5LdXY+ydfh5Hig6B8R3+2bh6
         sNBtCJUASXbxj/tMJ3fPmmKlV08glAoNtoX1ZQ5Zs7rzFgTn8z79n2+wEIhemgwYH3Rs
         aijlBuFT6W8rK0IyU1o28FoDMDr7jiIsUGD4mrIrNDVsqVwZJnw8QpMh/QN0XDX6ucAQ
         1Dxg==
X-Forwarded-Encrypted: i=1; AL+hErHlBftKFJw+7GVedyWZWuB+d/zq4e5BR3paepSlQtMh+ZQGNonne2OC9l3wKUlSNcYSXc4kaFPOP/Lcn50=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lKOcmxx63ngrs2Z5ofxbzBkegErFqPnGjjBSPlbbTSjOWH7D8
	fqEhzNpmZ5r7MTZ9qlnHzsGmNPH8fYATX9zJD4Iab2E5QDHxLB7XudLj
X-Gm-Gg: AYBFou0/0YdW+lj9K1jIXoPcaywXHLv/YBzptO73sXlmin0uxrE5nLCGdtdtroM6ttX
	XjekAyHT6iOfIPC6MGx+lk1x74vExEngzhjzMxaIIcgIk09yd4AN+B/haPTi56lOrZFD1W/Uvf4
	m/9MXVfFKR/ppDmJMmuAt57Si83hP5eK9iuAwLssE7syA5dStM8bD1dv9zrgqhM/IO8O64ZPWio
	tbp6ODhNtgVY79vCN9L/G46OQoTLnzBs3o7zKfIu9MuBUA6QlmQ0qjTSCxME1Br5udKMPyu9lPS
	hTdtT61t0Ln5CBNrfXJxWjRlglenpEBFjd1b78I13eO598t+NE7L5Q3CQAZcnjfSZTY8lOP7tSw
	uu7eGhWwkUqFAQzkYt36b3l7uVTmKdbrmJHVQ4DT5+YlHb9+6wHnw7sSIG/ZrsRx5rtDjH3n6PO
	0KffEz0JoO/SgatCy0n/FZx32mxYHp/Rd7jGorwaAQCl6DxEnrwldahf8Trt4z1bkRpbRBTXpTr
	jWnbWx9+NUbyR1xjKojuOQOpu36YzfsGsJnQJufcVPuMqrgIRDjdwUcgCF2V0mizLed+WnrQ1XQ
	WnB3r5ReQVJn59g7ahTosC7AEzgjeWQvWQgzTJmTZbtxSU71JdDnUjPe/Pv/Ow4aIDY=
X-Received: by 2002:a05:6820:858a:20b0:717:da:ba41 with SMTP id 006d021491bc7-719178602cbmr2115739eaf.28.1794451058360;
        Wed, 11 Nov 2026 18:37:38 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22f6a1c7sm4327310fac.6.2026.11.11.18.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:37:37 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 3/6] ALSA: mixer_audient: Replace three flags with an access mode
Date: Wed, 11 Nov 2026 20:37:17 -0600
Message-ID: <20261112023720.1503814-4-mrwillporter@gmail.com>
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

The INIT_HW, FORCE_SET and CACHE flags allow eight combinations. The
control tables use three: no flag, CACHE alone, and all three together
(ID14_WO). Name these three with an enum in a new field, access:

  READBACK:   every get reads the device
  CACHED:     read once, then use the cache
  WRITE_ONLY: never read; show the last write

The SIGNED flag stays.

With a mode, the set helper decides "is it a change" and "send it"
separately. It no longer needs the force argument, or a compare value
that is made different to force a write. The probe write of a
write-only control calls the send helper directly.

The mode also decides the VOLATILE access bit and get_cur_broken.
Remove the ID14_WO macro and the code for the combinations that no
table uses.

No functional change for the controls in the tables.

Assisted-by: Claude:claude-fable-5-2
Assisted-by: Claude:claude-sonnet-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 172 ++++++++++++++++++++------------------
 1 file changed, 90 insertions(+), 82 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 35b562b3aac51..1bc6b4bbd2910 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -62,9 +62,23 @@ enum snd_audient_type {
 static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_mixer, -12800, 600);
 
 #define SND_AUDIENT_CTYPE_FLAGS_SIGNED		BIT(0)
-#define SND_AUDIENT_CTYPE_FLAGS_INIT_HW		BIT(1)
-#define SND_AUDIENT_CTYPE_FLAGS_FORCE_SET	BIT(2)
-#define SND_AUDIENT_CTYPE_FLAGS_CACHE		BIT(3)
+
+/*
+ * How a control reaches the device.
+ *
+ * A cached value is valid once a transfer confirmed it. A read or a write
+ * that succeeds records the value and sets its cache bit. A transfer that
+ * fails leaves the cached value and the bit unchanged.
+ *
+ * WRITE_ONLY: GET stalls or does not report writes. The driver writes the
+ * init value at probe and sends every put. A get shows the last value
+ * written, or an unknown value while none was.
+ */
+enum snd_audient_access {
+	SND_AUDIENT_ACCESS_READBACK = 0,	/* every get reads the device */
+	SND_AUDIENT_ACCESS_CACHED,		/* read once, then use the cache */
+	SND_AUDIENT_ACCESS_WRITE_ONLY,		/* never read; show the last write */
+};
 
 /*
  * An enumerated control: item i sends values[i]. A get of a device value
@@ -177,14 +191,6 @@ static const char *const snd_audient_id14_optical_texts[] = {
 SND_AUDIENT_ENUM(snd_audient_id14_optical, snd_audient_id14_optical_texts,
 		 0, 1);
 
-/*
- * Write-only: GET stalls or does not report writes. Show the last value
- * written, write the init value at probe, and send every put.
- */
-#define ID14_WO	(SND_AUDIENT_CTYPE_FLAGS_CACHE		\
-		 | SND_AUDIENT_CTYPE_FLAGS_FORCE_SET	\
-		 | SND_AUDIENT_CTYPE_FLAGS_INIT_HW)
-
 #define ID14_BOOL(unit_, sel_)				\
 	{						\
 		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,	\
@@ -220,9 +226,9 @@ SND_AUDIENT_ENUM(snd_audient_id14_optical, snd_audient_id14_optical_texts,
 	}
 
 /*
- * A readable enum. It has no cache entry, so a get always reads the device
- * and never uses init. Write-only enums set .init and .flags without this
- * macro.
+ * A readable enum. Its access mode is READBACK, so a get always reads the
+ * device and never uses init. Write-only enums set .init and .access
+ * without this macro.
  */
 #define ID14_ENUM(unit_, sel_, len_, enum_)		\
 	{						\
@@ -235,6 +241,7 @@ SND_AUDIENT_ENUM(snd_audient_id14_optical, snd_audient_id14_optical_texts,
 
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
+	enum snd_audient_access access;
 	unsigned long flags;
 	size_t len;		/* datatype size, can be 1, 2 or 4 bytes */
 	union {
@@ -285,8 +292,8 @@ static const struct snd_audient_ctrl_type {
 	},
 	[SND_AUDIENT_TYPE_MIXER] = {
 		.type = SNDRV_CTL_ELEM_TYPE_INTEGER,
-		.flags = SND_AUDIENT_CTYPE_FLAGS_SIGNED
-			 | SND_AUDIENT_CTYPE_FLAGS_CACHE,
+		.access = SND_AUDIENT_ACCESS_CACHED,
+		.flags = SND_AUDIENT_CTYPE_FLAGS_SIGNED,
 		.len = 2,
 		.min.integer = -128 * 256,
 		.max.integer = 6 * 256,
@@ -330,7 +337,7 @@ static const struct snd_audient_ctrl_type {
 	/* the documented boost is a fixed +10 dB */
 	[SND_AUDIENT_TYPE_ID14_IN_BOOST] = {
 		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
-		.flags = ID14_WO,
+		.access = SND_AUDIENT_ACCESS_WRITE_ONLY,
 		.len = 2,
 		.min.integer = 0,
 		.max.integer = 10 * 256,
@@ -340,7 +347,7 @@ static const struct snd_audient_ctrl_type {
 	},
 	[SND_AUDIENT_TYPE_ID14_IN_POLARITY] = {
 		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
-		.flags = ID14_WO,
+		.access = SND_AUDIENT_ACCESS_WRITE_ONLY,
 		.len = 1,
 		.min.integer = 0,
 		.max.integer = 1,
@@ -350,7 +357,7 @@ static const struct snd_audient_ctrl_type {
 	},
 	[SND_AUDIENT_TYPE_ID14_MON_ID_KEY] = {
 		.type = SNDRV_CTL_ELEM_TYPE_ENUMERATED,
-		.flags = ID14_WO,
+		.access = SND_AUDIENT_ACCESS_WRITE_ONLY,
 		.len = 2,
 		.init = 0xffff,		/* ScrollControl */
 		.enumeration = &snd_audient_id14_id_key,
@@ -359,7 +366,7 @@ static const struct snd_audient_ctrl_type {
 	},
 	[SND_AUDIENT_TYPE_ID14_MON_TALKBACK_SRC] = {
 		.type = SNDRV_CTL_ELEM_TYPE_ENUMERATED,
-		.flags = ID14_WO,
+		.access = SND_AUDIENT_ACCESS_WRITE_ONLY,
 		.len = 1,
 		.init = 0xff,		/* None */
 		.enumeration = &snd_audient_id14_talkback,
@@ -369,7 +376,7 @@ static const struct snd_audient_ctrl_type {
 	/* the power-on mode is S/PDIF */
 	[SND_AUDIENT_TYPE_ID14_OPTICAL_MODE] = {
 		.type = SNDRV_CTL_ELEM_TYPE_ENUMERATED,
-		.flags = ID14_WO,
+		.access = SND_AUDIENT_ACCESS_WRITE_ONLY,
 		.len = 4,
 		.init = 1,		/* S/PDIF */
 		.enumeration = &snd_audient_id14_optical,
@@ -557,10 +564,7 @@ static inline u16 snd_audient_kctl_channels(struct snd_kcontrol *kctl)
 /*
  * A cached control keeps its values in the cache of struct
  * usb_mixer_elem_info: bit i of elem->cached and elem->cache_val[i] for
- * element channel i. The bit is set once a transfer confirmed the value: a
- * read, or a write that succeeded. A probe transfer that fails leaves it
- * clear. CACHE | FORCE_SET without INIT_HW keeps the earlier behaviour: the
- * init value is assumed, without a transfer.
+ * element channel i. See enum snd_audient_access for when the bit is set.
  */
 
 
@@ -611,27 +615,24 @@ static inline int snd_audient_set_cur(struct usb_mixer_interface *mixer,
 
 
 static int snd_audient_raw_get_one(struct usb_mixer_elem_info *const elem,
-			const struct snd_audient_ctrl_type *const ctype,
-			const unsigned int ch, const u8 cidx,
-			u32 *const value)
+				   const struct snd_audient_ctrl_type *const ctype,
+				   const unsigned int ch, const u8 cidx,
+				   u32 *const value)
 {
 	struct usb_mixer_interface *const mixer = elem->head.mixer;
-	const bool cache = ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE;
 	int ret;
 	__le32 buf = 0;
 	s32 val;
 
-	if (cache && test_bit(ch, elem->cached)) {
+	if (ctype->access != SND_AUDIENT_ACCESS_READBACK &&
+	    test_bit(ch, elem->cached)) {
 		*value = elem->cache_val[ch];
 
 		return ctype->len;
 	}
 
-	/*
-	 * Cached FORCE_SET controls are treated as write-only: a clear
-	 * cache bit does not trigger a GET.
-	 */
-	if (cache && (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET))
+	/* A write-only control never sends a GET: its value is unknown. */
+	if (ctype->access == SND_AUDIENT_ACCESS_WRITE_ONLY)
 		return -ENODATA;
 
 	ret = snd_audient_get_cur(mixer, ctype, cidx, &buf);
@@ -645,7 +646,7 @@ static int snd_audient_raw_get_one(struct usb_mixer_elem_info *const elem,
 
 	*value = val;
 
-	if (cache) {
+	if (ctype->access == SND_AUDIENT_ACCESS_CACHED) {
 		elem->cache_val[ch] = val;
 		set_bit(ch, elem->cached);
 	}
@@ -653,41 +654,55 @@ static int snd_audient_raw_get_one(struct usb_mixer_elem_info *const elem,
 	return ret;
 }
 
-static int snd_audient_raw_set_one(struct usb_mixer_elem_info *const elem,
-			const struct snd_audient_ctrl_type *const ctype,
-			const unsigned int ch, const u8 cidx,
-			const u32 value, bool force)
+/* Send a value and, for a cached control, record that the device has it. */
+static int snd_audient_raw_send_one(struct usb_mixer_elem_info *const elem,
+				    const struct snd_audient_ctrl_type *const ctype,
+				    const unsigned int ch, const u8 cidx,
+				    const u32 value)
 {
-	struct usb_mixer_interface *const mixer = elem->head.mixer;
+	__le32 buf = cpu_to_le32(value);
 	int ret;
-	u32 val;
-
-	if (force) {
-		val = !value;		/* just make it different */
-	} else {
-		ret = snd_audient_raw_get_one(elem, ctype, ch, cidx, &val);
-		if (ret == -ENODATA)	/* FORCE_SET and not cached yet */
-			val = !value;	/* just make it different */
-		else if (ret < 0)
-			return ret;
+
+	ret = snd_audient_set_cur(elem->head.mixer, ctype, cidx, &buf);
+	if (ret < 0)
+		return ret;
+
+	if (ctype->access != SND_AUDIENT_ACCESS_READBACK) {
+		elem->cache_val[ch] = value;
+		set_bit(ch, elem->cached);
 	}
 
-	force = force || (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET);
+	return 0;
+}
+
+/*
+ * Set one channel. Returns 1 if the value changed, 0 if not, or a negative
+ * error. A write-only control sends every value; the others send only a
+ * changed one.
+ */
+static int snd_audient_raw_set_one(struct usb_mixer_elem_info *const elem,
+				   const struct snd_audient_ctrl_type *const ctype,
+				   const unsigned int ch, const u8 cidx,
+				   const u32 value)
+{
+	bool changed;
+	u32 cur = 0;
+	int ret;
+
+	ret = snd_audient_raw_get_one(elem, ctype, ch, cidx, &cur);
+	if (ret < 0 && ret != -ENODATA)
+		return ret;
 
-	if (force || (val != value)) {
-		__le32 buf = cpu_to_le32(value);
+	/* -ENODATA: write-only and not cached yet */
+	changed = ret == -ENODATA || cur != value;
 
-		ret = snd_audient_set_cur(mixer, ctype, cidx, &buf);
+	if (changed || ctype->access == SND_AUDIENT_ACCESS_WRITE_ONLY) {
+		ret = snd_audient_raw_send_one(elem, ctype, ch, cidx, value);
 		if (ret < 0)
 			return ret;
-
-		if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE) {
-			elem->cache_val[ch] = value;
-			set_bit(ch, elem->cached);
-		}
 	}
 
-	return val != value;
+	return changed;
 }
 
 
@@ -758,7 +773,7 @@ static int snd_ctl_audient_boolean_set(struct snd_kcontrol *kctl,
 		int ret;
 
 		ret = snd_audient_raw_set_one(elem, ctype, i, base + i,
-					      buf, false);
+					      buf);
 		if (ret < 0)
 			return ret;
 
@@ -879,7 +894,7 @@ static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
 		int ret;
 
 		ret = snd_audient_raw_set_one(elem, ctype, i, base + i,
-					      val, false);
+					      val);
 		if (ret < 0)
 			return ret;
 
@@ -977,7 +992,7 @@ static int snd_ctl_audient_enum_set(struct snd_kcontrol *kctl,
 		int ret;
 
 		ret = snd_audient_raw_set_one(elem, ctype, i, base + i,
-					      e->values[item], false);
+					      e->values[item]);
 		if (ret < 0)
 			return ret;
 
@@ -1035,9 +1050,9 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 						   ctrl->hwchannels);
 	knew.tlv.p = ctype->tlv;
 	knew.access = SNDRV_CTL_ELEM_ACCESS_READWRITE
-			| ((ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE)
-			   ? 0
-			   : SNDRV_CTL_ELEM_ACCESS_VOLATILE)
+			| ((ctype->access == SND_AUDIENT_ACCESS_READBACK)
+			   ? SNDRV_CTL_ELEM_ACCESS_VOLATILE
+			   : 0)
 			| (ctype->tlv ? SNDRV_CTL_ELEM_ACCESS_TLV_READ : 0);
 
 	switch (ctype->type) {
@@ -1072,40 +1087,33 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 	 * get_cur_broken is set. A write-only control cannot read its value
 	 * back after that.
 	 */
-	if ((ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE) &&
-	    (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET))
+	if (ctype->access == SND_AUDIENT_ACCESS_WRITE_ONLY)
 		elem->get_cur_broken = 1;
 
 	/*
 	 * A failed probe transfer must not fail the card: warn and keep the
-	 * control. Its cache bit stays clear, so a readable control reads
-	 * the device again on its next get, and a write-only control shows an
+	 * control. Its cache bit stays clear, so a cached control reads the
+	 * device again on its next get, and a write-only control shows an
 	 * unknown value until a put succeeds.
 	 */
-	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_INIT_HW) {
+	if (ctype->access == SND_AUDIENT_ACCESS_WRITE_ONLY) {
 		int i;
 
 		for (i = 0; i < ctrl->hwchannels; i++) {
-			ret = snd_audient_raw_set_one(elem, ctype, i,
-						      ctrl->val_offs + i,
-						      ctype->init, true);
+			ret = snd_audient_raw_send_one(elem, ctype, i,
+						       ctrl->val_offs + i,
+						       ctype->init);
 			if (ret < 0)
 				usb_audio_warn(mixer->chip,
 					       "%s: cannot set channel %d (%d)\n",
 					       ctrl->name, i, ret);
 		}
-	} else if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE) {
+	} else if (ctype->access == SND_AUDIENT_ACCESS_CACHED) {
 		int i;
 
 		for (i = 0; i < ctrl->hwchannels; i++) {
 			u32 val;
 
-			if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET) {
-				elem->cache_val[i] = ctype->init;
-				set_bit(i, elem->cached);
-				continue;
-			}
-
 			ret = snd_audient_raw_get_one(elem, ctype, i,
 						      ctrl->val_offs + i,
 						      &val);
-- 
2.47.3

