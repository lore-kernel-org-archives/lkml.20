Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982758;
	b=BhN6jWyQYe+DJx8dI+uAthBIENXlU3FN4oJI0/I1SmIfiGzQ9sjrV+/aZiFxNePnrmFi
	 AqK1tOPWYbi6IJEgMSkBhO2aFBesjjINGRw3fPtb+1tDsHAMuymtn2+9WhMwZHrOHFfqF
	 kYinZB4AuWsuD2zHoQ+VhTvSQDNEKQCKY/7BrmkVOoC6rZB3jB1kqDgURMs8geXiCRZBY
	 5xlMz4ZH7LUZb3/DwlY1JRjDTR913/O/nlWo2r7C6jUOW2ekxvrbT8oMGjQXiV4qI9Wmh
	 aQDTsLuw1GEAJQHUM4HlcTyYb6S7VLC2R0PGZ4+066HxLMbM2x691UBfHtAkDWqXaNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D/M7GyBgeNO84CQBDcamWNo+zSK6J9cfiPVBMe2UG5o=;
	b=yryfTf2u4LVvm2IGg76cIa3tyU0y9IjKUl5L4EPITEPUBONMD66nZIoBWIzdxo5YSyI3
	 WLOa4vT6cR59ZCsDX+wWDq3SDf3p1a3Ys8bHEFjlrBfksvCurl0cTbfWvYN6jN9GKQUGY
	 ou/n/cJAWkxqttlkpjBiantqwu1T31fQpu5rWXaYwUDZpmAzx9IRYYYWNdOQLfnasS/Rw
	 S+ZhKkWMggeVB11nuSO7FTqzopkx/wlVaGuykFVXB8K7+fYBkObqaCB+7yQG3GmwmVj/c
	 mOYSL1DUMs+K2Of6+1hlU0jl3yAcTY5EnzcBrYh1AvaBte3nu1f2jCwZTiwaxiC9oyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vgX+GbcS;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C1F606EEB3
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7C1F606EEB3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vgX+GbcS
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-843cf077f10so1209088a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982757; x=1794587557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/M7GyBgeNO84CQBDcamWNo+zSK6J9cfiPVBMe2UG5o=;
        b=vgX+GbcS/A4iw9aK1JgaaEJBUlvwp4FLv0UDcldq8hzsrusmyCBXD8Oy0Hv6iLZDVm
         UCj6v3PRQMFe60eJD5fnAz8W4np287FlCR59zKTbG9Eo12valAQ0Gcxk5B4pCiibOWD+
         /nEZFz4hRLIEtG1C2b20CqZVB9spqJpj5gympB3hPUxQtXkq0Qgoj/OjkMtDxFUs9N3G
         NX+NOLu6EsOcgfwPFL03PtYKT8aB8+LC7J1JJoWHtAkQq0agvGJ11gcCqHp3gw7qkkKW
         cdxllCEf/nDKCgClivarnyTqm6AwZLZaYzCBuu9khKv7MzYuvwLGg+x2ds2TlCcJy3qn
         RQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982757; x=1794587557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/M7GyBgeNO84CQBDcamWNo+zSK6J9cfiPVBMe2UG5o=;
        b=HqnZYH3PVSXcnQA3oGD9ENK3DwP0K20yxJ5mK3Gq7gJF03lT1Va1eBjAALaWXwcBlk
         818zhoiTK9Mf8GN1Z+4Wijg1LFLYt4tO5rCYEARPsrCsCdTj6XJPnXjrZ7zN7X2w+bEE
         YeHFcngM1tfM9VulNP+S4jmA9iGKvZr5I/LRfyx5DNf6k1qE1M1DVFSyZTnLakRSEf4r
         G7TIqdHbJxiMJjdhwv434EHHLh2bMWj3jHJY+iywRVS4zOBGzvQKvnuisSIpLymmT2Q3
         0PRmMfwueKBOVScVuekytsCKd5RPdDY3io9f6ds9ByUneEAGO2YSQ/dgvzmoJ+kKxNuy
         3aBg==
X-Forwarded-Encrypted: i=1; AKwUvBzwvIlvbUcq2btSkBx2RTTIW9oeQwtBhWSOuBOJTCLZ5fdG5aTcyhKRXV2tNHJH1iLx2xDEynW2/g+1uGk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HxlGHMsBr8cuJJ2AmBQJj0MU7A10DR2GtLDhRrXNuP+P5ZmLL
	qr1aymJqULsMjMQNwDUJ47li24BRGKXeb8JkIyfUhgTmu4LQXQyGk53q
X-Gm-Gg: AYBFou1CAF9Y3qM/cj0y3CHzES8qOOC1BqkmDgv85xDwZZUgz2SAEEc016tZ4BtJnoD
	8uXwbukHQOh7nBDDzDVdygS3+TAnfUyLRbmm6vpXwrIKRxt8i8gh63Er8KQ1COA3xxdinDhtpu3
	ObS/UGlPCY7hfNvdyqls2NfTLFB5M9x5MbdChcZGkj8EaYYfPB/SdOpBWSSC0qow6OH45yPwDOT
	LkUIKaMDUa3bZawUgsuXDUA+uyHVuzpyaR+2fB39pfaEMihPTOaiBoINqOgkPaJBHr/LZ8xyufi
	iUCNATKaJ5dEiK70kFtghV/ImD2yTx9v6C5ZjB2USJHADOlUrDScYArCUxjleHvwOcJ3qxgHsls
	+J5ZPaaWBeVQW7akzOWVwxptVUGrUygO6tQNVy7WrG/Dqh4ZyZytyF37j8KBp4DwuKENZA3IZVr
	kBdrNU00+f1+T6DNhfORsQb9PKWrXvgWOEBXx76VeUCtD1piPJRLIpiz9L0xRH5WCeEudLypLHs
	ixdRnPquYIQFJdS1TyjUwkDJHRZlGigCy7BzQWDw1T2kGbcSaFmOHRVOmMDqSOF10CiXolEt2f9
	77XjA8hrNL9UlmPCBh8sZsRN3YwBotnWpdAHxqLaV96kPJxbq5gB7M3eEnodP6OaYGw=
X-Received: by 2002:a05:6830:438b:b0:844:4959:e854 with SMTP id 46e09a7af769-85f1cfb9903mr2824281a34.11.1793982756769;
        Fri, 06 Nov 2026 08:32:36 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:36 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 13/16] ALSA: mixer_audient: Add enumerated controls
Date: Fri,  6 Nov 2026 10:31:26 -0600
Message-ID: <20261106163129.1006907-14-mrwillporter@gmail.com>
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

The iD14 has selectors with a fixed set of device values: output
routing, mono mode, the iD key function, talkback source and the
digital input mode. Add an enumerated control type with a value list.

The item list has one item more than the values. A put cannot select
it. A get shows it for a device value outside the list, so a value set
by other means stays visible as such, not as a wrong item, and for a
write-only value that no write has confirmed.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 130 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index c4ce2340f8bb..3e6cd8981b4f 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -42,6 +42,27 @@ static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_mixer, -12800, 600);
 #define SND_AUDIENT_CTYPE_FLAGS_FORCE_SET	BIT(2)
 #define SND_AUDIENT_CTYPE_FLAGS_CACHE		BIT(3)
 
+/*
+ * An enumerated control: item i sends values[i]. The texts have one item
+ * more than the values. A put cannot select that last item: a get shows it
+ * for a device value outside the list ("Other"), or for a write-only value
+ * that no write has confirmed ("Unknown").
+ */
+struct snd_audient_enum {
+	const char *const *texts;
+	const u32 *values;
+	unsigned int items;
+};
+
+#define SND_AUDIENT_ENUM(name, texts_, ...)				\
+	static const u32 name##_values[] = { __VA_ARGS__ };		\
+	static const struct snd_audient_enum name = {			\
+		.texts = texts_,					\
+		.values = name##_values,				\
+		.items = ARRAY_SIZE(name##_values),			\
+	};								\
+	static_assert(ARRAY_SIZE(texts_) == ARRAY_SIZE(name##_values) + 1)
+
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
 	unsigned long flags;
@@ -54,6 +75,7 @@ static const struct snd_audient_ctrl_type {
 	} max;		/* for booleans holds physical int value for true */
 	u32 init;	/* hardware and cache are initialized to this value */
 	unsigned int res;	/* integers: device units per control step, 0 = 1 */
+	const struct snd_audient_enum *enumeration;
 	const unsigned int *tlv;
 	u8 unit;
 	u8 sel;
@@ -560,12 +582,116 @@ static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
 	return changed;
 }
 
+static unsigned int snd_audient_enum_item(const struct snd_audient_enum *e,
+					  u32 value)
+{
+	unsigned int item;
+
+	for (item = 0; item < e->items; item++)
+		if (e->values[item] == value)
+			break;
+
+	return item;	/* e->items: not in the list */
+}
+
+static int snd_ctl_audient_enum_get(struct snd_kcontrol *kctl,
+				    struct snd_ctl_elem_value *ctl_val)
+{
+	struct usb_mixer_elem_info *const elem = snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *const mixer = elem->head.mixer;
+
+	const unsigned int nchan = snd_audient_kctl_channels(kctl);
+	const unsigned int hwchan = snd_audient_kctl_hwchannels(kctl);
+	const struct snd_audient_ctrl_type *const ctype
+						= snd_audient_kctl_type(kctl);
+	const u8 base = snd_audient_kctl_cidxoffs(kctl);
+
+	unsigned int i;
+
+	CLASS(snd_usb_lock, pm)(mixer->chip);
+	if (pm.err < 0)
+		return pm.err;
+	/* serializes the transfers and the cache, also between gets */
+	guard(mutex)(&mixer->lock);
+
+	for (i = 0; i < hwchan; i++) {
+		u32 val;
+		int ret;
+
+		ret = snd_audient_raw_get_one(mixer, ctype,
+					      snd_audient_cache_slot(elem, i),
+					      base + i, &val);
+		if (ret == -ENODATA) {	/* unknown write-only value */
+			ctl_val->value.enumerated.item[i] =
+				ctype->enumeration->items;
+			continue;
+		} else if (ret < 0) {
+			return ret;
+		}
+
+		ctl_val->value.enumerated.item[i] =
+			snd_audient_enum_item(ctype->enumeration, val);
+	}
+
+	for (; i < nchan; i++)
+		ctl_val->value.enumerated.item[i] = 0;
+
+	return 0;
+}
+
+static int snd_ctl_audient_enum_set(struct snd_kcontrol *kctl,
+				    struct snd_ctl_elem_value *ctl_val)
+{
+	struct usb_mixer_elem_info *const elem = snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *const mixer = elem->head.mixer;
+
+	const unsigned int hwchan = snd_audient_kctl_hwchannels(kctl);
+	const struct snd_audient_ctrl_type *const ctype
+						= snd_audient_kctl_type(kctl);
+	const struct snd_audient_enum *const e = ctype->enumeration;
+	const u8 base = snd_audient_kctl_cidxoffs(kctl);
+
+	unsigned int i;
+	int changed = 0;
+
+	for (i = 0; i < hwchan; i++)
+		if (ctl_val->value.enumerated.item[i] >= e->items)
+			return -EINVAL;
+
+	CLASS(snd_usb_lock, pm)(mixer->chip);
+	if (pm.err < 0)
+		return pm.err;
+	/* serializes the transfers and the cache, also between gets */
+	guard(mutex)(&mixer->lock);
+
+	for (i = 0; i < hwchan; i++) {
+		const unsigned int item = ctl_val->value.enumerated.item[i];
+		int ret;
+
+		ret = snd_audient_raw_set_one(mixer, ctype,
+					      snd_audient_cache_slot(elem, i),
+					      base + i, e->values[item], false);
+		if (ret < 0)
+			return ret;
+
+		if (ret)
+			changed = 1;
+	}
+
+	return changed;
+}
+
 static int snd_ctl_audient_info(struct snd_kcontrol *kctl,
 			    struct snd_ctl_elem_info *uinfo)
 {
 	const struct snd_audient_ctrl_type *const ctype
 						= snd_audient_kctl_type(kctl);
 
+	if (ctype->type == SNDRV_CTL_ELEM_TYPE_ENUMERATED)
+		return snd_ctl_enum_info(uinfo, snd_audient_kctl_channels(kctl),
+					 ctype->enumeration->items + 1,
+					 ctype->enumeration->texts);
+
 	uinfo->type = ctype->type;
 	uinfo->count = snd_audient_kctl_channels(kctl);
 
@@ -613,6 +739,10 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 		knew.get = snd_ctl_audient_boolean_get;
 		knew.put = snd_ctl_audient_boolean_set;
 		break;
+	case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
+		knew.get = snd_ctl_audient_enum_get;
+		knew.put = snd_ctl_audient_enum_set;
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.47.3

