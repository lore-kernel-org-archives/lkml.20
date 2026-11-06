Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982749;
	b=amz4kFl9JUdhi4qFMhQEevO0sfsUYo5numgTDyuxo/1q1HNMxOX31ZeCN3O87KW3rAST
	 Rldik9RXF7QSHwMAu+qpe4fSuw7/N+0qVFW6eIz1XkKPfCK2TSyC5GCX7gw/Ur3sCP9+a
	 4ciVHQKbprkYkPjHOUwcchbl5tzkggwRIrmuBC7MW9p9DHYaqqDw4R7bQD1YbRGXRyjHP
	 e4U1FaViU1TIucydS88bFfLzUxGKPeXNUXFwobPAnSGsu7Hv8mJxNAENmM61u+6F8PwYj
	 bxkdJC7/XECe6csDoEmKN9gFkywxfc+HAuz7gLwsTGtwgNIGLn+53VIo+DeUgexuShQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NCzSXDrTwTZh9Azl07FsfjRO1j6KBlia1qfvCETTFgU=;
	b=PDUqzciHyKLq6DVIDp24aTZUDlpxNABxfFxmcYA4/dVyM+3vdCoifevBxM1BSocSFfy6
	 wHzAbX1PlgCyFLR06MYIoP16tBUFMQ0B09e2mjq0L0FuV02EfWbQRfk3CTeZTVnJyVsQo
	 OS7R8vG/12DT7nxGdPqNDmfqER9WXB4WEUlh0ixbDyNmrq6uIy86Gebw8D4w8f/VgnUAo
	 XIQxAZQniq4SJhKIBiNVNUAqLH6QC9yod4xifdu/sdmZS0EsKOrZY+wkotBCR+IjK80Q7
	 kDm90nef2jCYMQxDl0S/RTuYc21euBzd+nZ8jR7EaWgibIdPCri+EjA2mMJwkU51M8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U2u5+XrC;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8D1606D805
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF8D1606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U2u5+XrC
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-833e671ee9fso875732a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982748; x=1794587548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCzSXDrTwTZh9Azl07FsfjRO1j6KBlia1qfvCETTFgU=;
        b=U2u5+XrC18CFyT/wX5c6+zflIqXgOjJZMomrmm3VpO8QqZyjFcm4UM7Nd4k2T31W55
         ioyrsKwa6gBz2fsA/3jckit3L/uSBpK07r5C3bz+KAI+vysOglHLAt6C1PK6nFo9OBsz
         dKKo/iorXVAVK1kgPQoD67qoU+D1wSxwVSca+OKCKEVs6iaSR3ktM4lsAsd07Zu++awK
         9vFt+12hNvShRIcNxY+vYNXbAQqLQFG+EGVdHD9iFv/6mtQ0hXkKf7+TN5crRDxyNMIR
         XD3v0N1u7zT3eQUilDC1lHz3y4LqY7szTJNRve92C7CMCpADbeZYpr0TAoW3dTaYlS+f
         ePZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982748; x=1794587548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NCzSXDrTwTZh9Azl07FsfjRO1j6KBlia1qfvCETTFgU=;
        b=iDOlsZlPM5nvQVcAKBNlVbvVLOpG6CsMilYIVW3Bd2J3JoWAJk6bhKZQNB6eiOS3cU
         yjQl4aVpM3Ytf+ySA3DdXW+VorK2RB/A6a9rsLkdjomctP9dWfCmHOYequ6ay0ixUg25
         bs6Qc9Y6AsnXiEZtI+yM8qyQ3Yq5E4g4LqFRkXv9jE3QGevyjurOgW4+o13dyKrtjMeL
         HWSwuBJIKDzBsovbZu0Gt2pQ3z9eSzffcNIuKyOXUTbZ5LsN+RXEHpixC/rkvzKCoQJh
         g2VbPO/TCUTHSpcVYUrUiyGh7jdCt0sXUrVwYljUEWj9prd8nVufu7AZg+NX5hdi4s0v
         sLvw==
X-Forwarded-Encrypted: i=1; AKwUvBywe7AxQkLDMmfutGoEgAgyhTv6Ezj2XVF9sYaMP+3mKR6rtwF+RTdIsAIspziEWClsPmrH/nN3NLDEfJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q0v41390F4C142xE22jl2rw6OTpvh979dnzvRHFSxFBSkSQc4
	A1Us3XHw1DOSa2++/ygdnYfnJ7xZlaOl+XVcbh5zJUscmJ7CQck82OZdfJoA/w==
X-Gm-Gg: AYBFou1bMw2tJ1BEuGsgOu8zqLhjvcixCp/XG375iw19S18NiEryTI6omGNXjvHCKaI
	twFWe14ZUOMTx5ooZEzi1ME8tTwZghx/8IypEmHri6GLKsK9DggE9s0t1abdmuW5zOk9mAHtuqF
	MiEVcY0PcZSy4aIf9zVT5NqRaLoysHnQ1i3oLblWUSbRTG66YbyYmBWGZ6RAXfm3cjxgLGbhl3a
	bF0czoFX/hbOOYryPfgGZ7b3lrduxDS4x6OCQdyq71PPPttBUy+MtPuWl/U51JHZ65Q/0/CMFk7
	h6m9//e1ufh14G/Ry5iNT29/k6oGI6oZ3kyS/r9Ugbz+gIqQ3W+2MVuZbTgFWIcd2CCWjkmyyN8
	faBrmsZMyVz4c8wHFSVayQbJW4WTAwAqcm5afCZX+ES8eEJix2xnrY4S+zOiaCKl0L+NcFMUHKE
	f/bfkC2HattSfoWQsDOCvkpJz8xPZKb3Y0pNFDBRjJWd1xNx9hJ2zy8jv11mceIzHAVGnIOt6zD
	c2jGGiO6AS8PyRi9po48exRF9/rmlsctB8rLAZLvRdhiVcYjGX0H+obRJaGLLXMiwvKrfhwx9v1
	U39qXUWMafOwai3RuMz/HfYCURyYyWPZtyqA4OlsLRJuWQ==
X-Received: by 2002:a05:6830:2313:b0:822:40fc:2eaa with SMTP id 46e09a7af769-85f1d0e2e0emr2580047a34.27.1793982747756;
        Fri, 06 Nov 2026 08:32:27 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:27 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 03/16] ALSA: mixer_audient: clarify USB control message definition
Date: Fri,  6 Nov 2026 10:31:16 -0600
Message-ID: <20261106163129.1006907-4-mrwillporter@gmail.com>
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

Previously, base values for wIndex and wValue were directly given in the
control type. Construct them from a unit ID and selector for clarity.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 76 +++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 35 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 2afef52a12d9..63714d00592c 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -45,15 +45,15 @@ static const struct snd_audient_ctrl_type {
 		int integer;
 	} max;
 	const unsigned int *tlv;
-	u16 wValue;
-	u16 wIndex;
+	u8 unit;
+	u8 sel;
 } snd_audient_ctypes[SND_AUDIENT_TYPE_NCTYPES] = {
 	[SND_AUDIENT_TYPE_MONITOR] = {
 		.type = SNDRV_CTL_ELEM_TYPE_INTEGER,
 		.min.integer = 0,
 		.max.integer = 127,
-		.wValue = 0x0000,
-		.wIndex = 0x3800,
+		.unit = 0x38,
+		.sel = 0x00,
 		/* no TLV here because we can't describe the cross-fader */
 	},
 	[SND_AUDIENT_TYPE_PHANTOM] = {
@@ -61,31 +61,31 @@ static const struct snd_audient_ctrl_type {
 		.invert = false,
 		.min.integer = 0,
 		.max.integer = 1,
-		.wValue = 0x0000,
-		.wIndex = 0x3A00,
+		.unit = 0x3A,
+		.sel = 0x00,
 	},
 	[SND_AUDIENT_TYPE_MUTE] = {
 		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert = true,
 		.min.integer = 0,
 		.max.integer = 1,
-		.wValue = 0x0200,
-		.wIndex = 0x3A00,
+		.unit = 0x3A,
+		.sel = 0x02,
 	},
 	[SND_AUDIENT_TYPE_MUTE_OUT] = {
 		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert = true,
 		.min.integer = 0,
 		.max.integer = 1,
-		.wValue = 0x0100,
-		.wIndex = 0x3B00,
+		.unit = 0x3B,
+		.sel = 0x01,
 	},
 	[SND_AUDIENT_TYPE_MIXER] = {
 		.type = SNDRV_CTL_ELEM_TYPE_INTEGER,
 		.min.integer = -128 * 256,
 		.max.integer = 6 * 256,
-		.wValue = 0x0100,
-		.wIndex = 0x3C00,
+		.unit = 0x3C,
+		.sel = 0x01,
 		.tlv = snd_audient_tlv_mixer,
 	},
 };
@@ -209,7 +209,7 @@ const struct snd_audient_ctrl_type *snd_audient_kctl_type(struct snd_kcontrol
 	return &snd_audient_ctypes[kctl->private_value & 0xFF];
 }
 
-static __always_inline u16 snd_audient_kctl_valoffs(struct snd_kcontrol *kctl)
+static __always_inline u16 snd_audient_kctl_cidxoffs(struct snd_kcontrol *kctl)
 {
 	return (kctl->private_value >> 8) & 0xFF;
 }
@@ -233,11 +233,16 @@ static inline u16 snd_audient_kctl_channels(struct snd_kcontrol *kctl)
 #define AUDIENT_REQTYPE_GET (USB_DIR_IN  | USB_TYPE_CLASS \
 					 | USB_RECIP_INTERFACE)
 
+#define U8_U8(HI, LO) ((((u16)(HI)) << 8) | ((LO) & 0xFF))
+
 static inline int snd_audient_get_cur(struct usb_mixer_interface *mixer,
-				      u16 value, u16 index,
-				      void *buf, size_t len)
+				      const u8 unit, const u8 sel,
+				      const u8 cidx,
+				      void *const buf, const size_t len)
 {
 	struct usb_device *const dev = mixer->chip->dev;
+	const u16 value = U8_U8(sel, cidx);
+	const u16 index = U8_U8(unit, mixer->hostif->desc.bInterfaceNumber);
 
 	return snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
 			       UAC2_CS_CUR, AUDIENT_REQTYPE_GET,
@@ -245,10 +250,13 @@ static inline int snd_audient_get_cur(struct usb_mixer_interface *mixer,
 }
 
 static inline int snd_audient_set_cur(struct usb_mixer_interface *mixer,
-				      u16 value, u16 index,
-				      void *buf, size_t len)
+				      const u8 unit, const u8 sel,
+				      const u8 cidx,
+				      void *const buf, const size_t len)
 {
 	struct usb_device *const dev = mixer->chip->dev;
+	const u16 value = U8_U8(sel, cidx);
+	const u16 index = U8_U8(unit, mixer->hostif->desc.bInterfaceNumber);
 
 	return snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
 			       UAC2_CS_CUR, AUDIENT_REQTYPE_SET,
@@ -266,8 +274,7 @@ static int snd_ctl_audient_boolean_get(struct snd_kcontrol *kctl,
 	const unsigned int hwchan = snd_audient_kctl_hwchannels(kctl);
 	const struct snd_audient_ctrl_type *const ctype
 						= snd_audient_kctl_type(kctl);
-	const u16 value = ctype->wValue + snd_audient_kctl_valoffs(kctl);
-	const u16 index = ctype->wIndex;
+	const u8 base = snd_audient_kctl_cidxoffs(kctl);
 
 	int i;
 
@@ -279,8 +286,8 @@ static int snd_ctl_audient_boolean_get(struct snd_kcontrol *kctl,
 		u32 buf;
 		int ret;
 
-		ret = snd_audient_get_cur(mixer, value + i, index,
-					  &buf, sizeof(buf));
+		ret = snd_audient_get_cur(mixer, ctype->unit, ctype->sel,
+					  base + i, &buf, sizeof(buf));
 		if (ret < 0)
 			return ret;
 
@@ -307,8 +314,7 @@ static int snd_ctl_audient_boolean_set(struct snd_kcontrol *kctl,
 	const unsigned int hwchan = snd_audient_kctl_hwchannels(kctl);
 	const struct snd_audient_ctrl_type *const ctype
 						= snd_audient_kctl_type(kctl);
-	const u16 value = ctype->wValue + snd_audient_kctl_valoffs(kctl);
-	const u16 index = ctype->wIndex;
+	const u8 base = snd_audient_kctl_cidxoffs(kctl);
 
 	int changed = 0;
 	int i;
@@ -325,15 +331,16 @@ static int snd_ctl_audient_boolean_set(struct snd_kcontrol *kctl,
 		if (ctype->invert)
 			buf ^= cpu_to_le32(0x1);
 
-		ret = snd_audient_get_cur(mixer, value + i, index,
-				      &rbuf, sizeof(rbuf));
+		ret = snd_audient_get_cur(mixer, ctype->unit, ctype->sel,
+					  base + i, &rbuf, sizeof(rbuf));
 		if (ret < 0)
 			return ret;
 
 		if (rbuf != buf) {
 			changed = 1;
 
-			ret = snd_audient_set_cur(mixer, value + i, index,
+			ret = snd_audient_set_cur(mixer, ctype->unit,
+						  ctype->sel, base + i,
 						  &buf, sizeof(buf));
 			if (ret < 0)
 				return ret;
@@ -353,8 +360,7 @@ static int snd_ctl_audient_integer_get(struct snd_kcontrol *kctl,
 	const unsigned int hwchan = snd_audient_kctl_hwchannels(kctl);
 	const struct snd_audient_ctrl_type *const ctype
 						= snd_audient_kctl_type(kctl);
-	const u16 value = ctype->wValue + snd_audient_kctl_valoffs(kctl);
-	const u16 index = ctype->wIndex;
+	const u8 base = snd_audient_kctl_cidxoffs(kctl);
 
 	int i;
 
@@ -367,8 +373,8 @@ static int snd_ctl_audient_integer_get(struct snd_kcontrol *kctl,
 		s16 val;
 		int ret;
 
-		ret = snd_audient_get_cur(mixer, value + i, index,
-					  &buf, sizeof(buf));
+		ret = snd_audient_get_cur(mixer, ctype->unit, ctype->sel,
+					  base + i, &buf, sizeof(buf));
 		if (ret < 0)
 			return ret;
 
@@ -391,8 +397,7 @@ static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
 	const unsigned int hwchan = snd_audient_kctl_hwchannels(kctl);
 	const struct snd_audient_ctrl_type *const ctype
 						= snd_audient_kctl_type(kctl);
-	const u16 value = ctype->wValue + snd_audient_kctl_valoffs(kctl);
-	const u16 index = ctype->wIndex;
+	const u8 base = snd_audient_kctl_cidxoffs(kctl);
 
 	int changed = 0;
 	int i;
@@ -406,15 +411,16 @@ static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
 		s16 buf = cpu_to_le16(ctl_val->value.integer.value[i]);
 		int ret;
 
-		ret = snd_audient_get_cur(mixer, value + i, index,
-					  &rbuf, sizeof(rbuf));
+		ret = snd_audient_get_cur(mixer, ctype->unit, ctype->sel,
+					  base + i, &rbuf, sizeof(rbuf));
 		if (ret < 0)
 			return ret;
 
 		if (rbuf != buf) {
 			changed = 1;
 
-			ret = snd_audient_set_cur(mixer, value + i, index,
+			ret = snd_audient_set_cur(mixer, ctype->unit,
+						  ctype->sel, base + i,
 						  &buf, sizeof(buf));
 			if (ret < 0)
 				return ret;
-- 
2.47.3

