Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982751;
	b=F+zhgKDuHm9Y47vrpwM/Tlhf358yOSuYMgBuRQsHavrtt11Dlg6fKz3BJezKw9Ux2Er8
	 uqGzerTgLbLIVit9zanK8GDqfRuNqpGNOjnq0A7ZKYhGVo/m+DQuQNeXDQ9UUDcx9Ov/z
	 yGBCd54Je1AAKoLB6OcyQMB3KLa2jCYTxMHiaFqLnKxFdRCYWU0ZxtO7fPQtpeN53yZld
	 SnN1bbl3fzaE3HUIkTqG4aLt232r8GkCNH3R8LYjqqhBqQrtjP1Py7SFDpl5VZn6A3lR7
	 x3LsOVRN07QQxjAIUCq0zR/h2Of1N7lh1kCngeMRzbALcfRyJDQZRwlrZBBt+detnww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ogULZeKBoS9bJBR+xY1nkcv/MSU5DLXAv7RQ492d6Mc=;
	b=0T8mn53AZQ9JovRBPG5EJ4fQ3+hOGpD6lSMIw8fEK/MMASs/v/WRt3Z1QyFW81gEGt4F
	 e0ViZvY/jDglGnKl3qrnots3ftKCbmza4n+U02ph+6+VNX6MXD0fXncmOXw0x5ZctOaux
	 a0BJpgj6QcLVEY8cezFDMCUocH0KtoV9N0VYIbt2SNEVJaYbCJJG2CDn61/olzDPe/QxP
	 ipiak7mjYiC0XA6zqSEHqOdiJ0SOBDoSpG9mHSWfPp0j4XRLVIW6PF8lIJg4tZgdBy4rm
	 Ds0az3YSBSOgYR427vm7ksBtjeaca1C45snGgObPfRVTBiI6lm8loXyBm27G9ZwWjtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWfQ0qij;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D771606D819
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D771606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWfQ0qij
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-85a5455bd3cso480313a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982750; x=1794587550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ogULZeKBoS9bJBR+xY1nkcv/MSU5DLXAv7RQ492d6Mc=;
        b=XWfQ0qijEUU6r3i77dltIp1xpP1PX7rWnJKD7DwgrGVmseb3neS5ZwJ3PewAuqAOIo
         IQWn9wl9JWf9aXNsWdn94cG41ExL62ycerJZpERBSgzXyKpPPXg/eLsEsgO6EfHqGqsT
         zxATjs/M5mLsa0L5ZOZmbOTBcpCViz098hmPJDmZB8uDfqmfYD64WVMTjGAy64/QNmos
         6gE80NvNXg+w+imSsy+r0dX9mT/bIcHmjfAYlUh/ogPMeJQucHMVXXZYSH2sJTKmJ8aU
         OmWTOBW4sxee2h2G7yu5P9xiFFFf3c4JjBqfZi+IfU2sxx3HkgtHoEYUlu8gh7fjZGPu
         GR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982750; x=1794587550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ogULZeKBoS9bJBR+xY1nkcv/MSU5DLXAv7RQ492d6Mc=;
        b=1bcfIj4JtENNbDPMeb5uw8jH6oWMYXPQn1X/pHlsJw08FyVvyzdHuUEJxIM31Uh8VI
         rJSrkVNMiT1O/JGzukibn1xdGnuGEnpbHR9u+6KsAfsQSOVSOj2BAhSRlVApH1FE81Kx
         9hsry2Z4ueeqrmElMyEzIvuZjE9zfGx+Y7OWMlaIzeq5lOihMikZoSjO2NInWdrbQ2+Y
         WRUvPmgBpikRwKys7D5XPQk0frWZFgMG5Gtgl6mSoq61KIWLkmZycCXpJI0zb3Isthxp
         70fwk9ccd7Iw9xkRZM5EAW0wlt5oGbnRLZjcK5pVAg2nZIHRks2J03lA7uqg3FeDeA8g
         GoiA==
X-Forwarded-Encrypted: i=1; AKwUvBzUi2okQAs7jp0scd/vwX4wGM0kiELWzn5gVc8HpTFfiUbjU9SpgGpmgCRoMvWZ8ZblReHk6r4pLGuoj6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+djc4cS59pxMHTGMsdV4pt+RQ8p2aXrgop1uQ+Iq2fyoVquPcV
	TUaiTVkDB0chXZNl2gwfkkvRPiR35SEzgyfxHDHR2ERbblx2UUbiThxM
X-Gm-Gg: AYBFou0HtrUzlrP49tDXE9PQw1FI+7zmYS6C+Xs7fchjO7Lb4anzCmTOJEMz9/1tjDt
	zJCG0VLVesBXuxBeFjOZMb797APRJuu1L4W4D++a8GXzFbRFbAf5p1gO/J2qw4Mf6cmbUVXst5a
	pq3xBzMphv6+ecZypLpyO8qdkYJl0mdztWYKjMD2braTjbCAquFJVDA/Qg2TBiUHNed4t8QQ2pV
	yzirLPBspM4LiBSf0jIHJGpAnZpqTPckrKP2o0J7PpEKgVDE+59MKBDd8IMgDJ9qZpy/Qe90/gC
	q6i3ErRWy/AANDPUbNGoMbnaBof6irU73tUHdjapJ4r11BYtmMDkBxIrCwBHZLRqkZICp6Tv7eD
	P1zAeqLj78uiYmSpoQXo3Hots2gRZ946gu8bE0t/1I1sKeoYLS4VxC8CuEXLkMyf3/P96gWybqU
	xbhJ/iPl0NeqBHDyKgC23D+mk/qH4zSeO77Yt3Zacz5n9pnn4x8ijvmLxH5H9rpIrQhrpNuTj9/
	psZ9IfgwUsxJGkmHh7CvS41pa6iHlJ2DoMobtBAoVtjPtbnPV43w43tBpFii5vpD14CdMx5dvyA
	cPi2f4bgbD0DAiWRTqffrU5fM7t1yP6fB+l5SX+AJLE7bwLMfEVbYs1RJweqYf/F3vM=
X-Received: by 2002:a05:6830:310b:b0:829:10c4:2c11 with SMTP id 46e09a7af769-85f1cb65e44mr3643211a34.0.1793982749727;
        Fri, 06 Nov 2026 08:32:29 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:29 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 05/16] ALSA: mixer_audient: make USB control transfer size configurable
Date: Fri,  6 Nov 2026 10:31:18 -0600
Message-ID: <20261106163129.1006907-6-mrwillporter@gmail.com>
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

Previously, the USB transfer size was hardcoded in the datatype get/set
functions. Make it configurable in the ctype structure in preparation of
new control types for the id14.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 131 ++++++++++++++++++++++++--------------
 1 file changed, 84 insertions(+), 47 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 1f3744a7c10a..57d856d25271 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -12,6 +12,8 @@
 #include <linux/usb.h>
 #include <linux/usb/audio-v2.h>
 #include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/bitops.h>
 #include <sound/core.h>
 #include <sound/control.h>
 #include <sound/tlv.h>
@@ -35,8 +37,12 @@ enum snd_audient_type {
 /* Mixer matrix: -128dB (mute) to +6dB */
 static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_mixer, -12800, 600);
 
+#define SND_AUDIENT_CTYPE_FLAGS_SIGNED		BIT(0)
+
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
+	unsigned long flags;
+	size_t len;		/* datatype size, can be 1, 2 or 4 bytes */
 	bool invert;
 	union {
 		int integer;
@@ -50,6 +56,7 @@ static const struct snd_audient_ctrl_type {
 } snd_audient_ctypes[SND_AUDIENT_TYPE_NCTYPES] = {
 	[SND_AUDIENT_TYPE_MONITOR] = {
 		.type = SNDRV_CTL_ELEM_TYPE_INTEGER,
+		.len = 2,
 		.min.integer = 0,
 		.max.integer = 127,
 		.unit = 0x38,
@@ -59,6 +66,7 @@ static const struct snd_audient_ctrl_type {
 	[SND_AUDIENT_TYPE_PHANTOM] = {
 		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert = false,
+		.len = 4,
 		.min.integer = 0,
 		.max.integer = 1,
 		.unit = 0x3A,
@@ -67,6 +75,7 @@ static const struct snd_audient_ctrl_type {
 	[SND_AUDIENT_TYPE_MUTE] = {
 		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert = true,
+		.len = 4,
 		.min.integer = 0,
 		.max.integer = 1,
 		.unit = 0x3A,
@@ -75,6 +84,7 @@ static const struct snd_audient_ctrl_type {
 	[SND_AUDIENT_TYPE_MUTE_OUT] = {
 		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert = true,
+		.len = 4,
 		.min.integer = 0,
 		.max.integer = 1,
 		.unit = 0x3B,
@@ -82,6 +92,8 @@ static const struct snd_audient_ctrl_type {
 	},
 	[SND_AUDIENT_TYPE_MIXER] = {
 		.type = SNDRV_CTL_ELEM_TYPE_INTEGER,
+		.flags = SND_AUDIENT_CTYPE_FLAGS_SIGNED,
+		.len = 2,
 		.min.integer = -128 * 256,
 		.max.integer = 6 * 256,
 		.unit = 0x3C,
@@ -236,44 +248,91 @@ static inline u16 snd_audient_kctl_channels(struct snd_kcontrol *kctl)
 #define U8_U8(HI, LO) ((((u16)(HI)) << 8) | ((LO) & 0xFF))
 
 static inline int snd_audient_get_cur(struct usb_mixer_interface *mixer,
-				      const u8 unit, const u8 sel,
-				      const u8 cidx,
-				      void *const buf, const size_t len)
+			const struct snd_audient_ctrl_type *const ctype,
+			const u8 cidx, void *const buf)
 {
 	struct usb_device *const dev = mixer->chip->dev;
-	const u16 value = U8_U8(sel, cidx);
-	const u16 index = U8_U8(unit, mixer->hostif->desc.bInterfaceNumber);
+	const u16 value = U8_U8(ctype->sel, cidx);
+	const u16 index = U8_U8(ctype->unit,
+				mixer->hostif->desc.bInterfaceNumber);
 
 	const int ret = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
 					UAC2_CS_CUR, AUDIENT_REQTYPE_GET,
-					value, index, buf, len);
+					value, index, buf, ctype->len);
 
-	if ((ret >= 0) && (ret != len))
+	if ((ret >= 0) && (ret != ctype->len))
 		return -EIO;
 
 	return ret;
 }
 
 static inline int snd_audient_set_cur(struct usb_mixer_interface *mixer,
-				      const u8 unit, const u8 sel,
-				      const u8 cidx,
-				      void *const buf, const size_t len)
+			const struct snd_audient_ctrl_type *const ctype,
+			const u8 cidx, void *const buf)
 {
 	struct usb_device *const dev = mixer->chip->dev;
-	const u16 value = U8_U8(sel, cidx);
-	const u16 index = U8_U8(unit, mixer->hostif->desc.bInterfaceNumber);
+	const u16 value = U8_U8(ctype->sel, cidx);
+	const u16 index = U8_U8(ctype->unit,
+				mixer->hostif->desc.bInterfaceNumber);
 
 	const int ret = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
 					UAC2_CS_CUR, AUDIENT_REQTYPE_SET,
-					value, index, buf, len);
+					value, index, buf, ctype->len);
 
-	if ((ret >= 0) && (ret != len))
+	if ((ret >= 0) && (ret != ctype->len))
 		return -EIO;
 
 	return ret;
 }
 
 
+static int snd_audient_raw_get_one(struct usb_mixer_interface *const mixer,
+			const struct snd_audient_ctrl_type *const ctype,
+			const u8 cidx, u32 *const value)
+{
+	int ret;
+	__le32 buf = 0;
+	s32 val;
+
+	ret = snd_audient_get_cur(mixer, ctype, cidx, &buf);
+	if (ret < 0)
+		return ret;
+
+	val = le32_to_cpu(buf);
+
+	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_SIGNED)
+		val = sign_extend32(val, 8 * ctype->len - 1);
+
+	*value = val;
+
+	return ret;
+}
+
+static int snd_audient_raw_set_one(struct usb_mixer_interface *const mixer,
+			const struct snd_audient_ctrl_type *const ctype,
+			const u8 cidx, const u32 value)
+{
+	int ret;
+	u32 val;
+
+	ret = snd_audient_raw_get_one(mixer, ctype, cidx, &val);
+	if (ret < 0)
+		return ret;
+
+	if (val != value) {
+		__le32 buf = cpu_to_le32(value);
+
+		ret = snd_audient_set_cur(mixer, ctype, cidx, &buf);
+		if (ret < 0)
+			return ret;
+
+		return 1;
+	}
+
+	return 0;
+}
+
+
 static int snd_ctl_audient_boolean_get(struct snd_kcontrol *kctl,
 				       struct snd_ctl_elem_value *ctl_val)
 {
@@ -296,12 +355,11 @@ static int snd_ctl_audient_boolean_get(struct snd_kcontrol *kctl,
 		u32 buf;
 		int ret;
 
-		ret = snd_audient_get_cur(mixer, ctype->unit, ctype->sel,
-					  base + i, &buf, sizeof(buf));
+		ret = snd_audient_raw_get_one(mixer, ctype, base + i, &buf);
 		if (ret < 0)
 			return ret;
 
-		ctl_val->value.integer.value[i] = le32_to_cpu(buf) ? 1 : 0;
+		ctl_val->value.integer.value[i] = buf ? 1 : 0;
 
 		if (ctype->invert)
 			ctl_val->value.integer.value[i] ^= 0x1;
@@ -334,27 +392,18 @@ static int snd_ctl_audient_boolean_set(struct snd_kcontrol *kctl,
 		return pm.err;
 
 	for (i = 0; i < hwchan; i++) {
-		u32 rbuf;
-		u32 buf = cpu_to_le32(ctl_val->value.integer.value[i] ? 1 : 0);
+		u32 buf = ctl_val->value.integer.value[i] ? 1 : 0;
 		int ret;
 
 		if (ctype->invert)
-			buf ^= cpu_to_le32(0x1);
+			buf ^= 0x1;
 
-		ret = snd_audient_get_cur(mixer, ctype->unit, ctype->sel,
-					  base + i, &rbuf, sizeof(rbuf));
+		ret = snd_audient_raw_set_one(mixer, ctype, base + i, buf);
 		if (ret < 0)
 			return ret;
 
-		if (rbuf != buf) {
+		if (ret)
 			changed = 1;
-
-			ret = snd_audient_set_cur(mixer, ctype->unit,
-						  ctype->sel, base + i,
-						  &buf, sizeof(buf));
-			if (ret < 0)
-				return ret;
-		}
 	}
 
 	return changed;
@@ -379,16 +428,13 @@ static int snd_ctl_audient_integer_get(struct snd_kcontrol *kctl,
 		return pm.err;
 
 	for (i = 0; i < hwchan; i++) {
-		u16 buf;
-		s16 val;
+		s32 val;
 		int ret;
 
-		ret = snd_audient_get_cur(mixer, ctype->unit, ctype->sel,
-					  base + i, &buf, sizeof(buf));
+		ret = snd_audient_raw_get_one(mixer, ctype, base + i, &val);
 		if (ret < 0)
 			return ret;
 
-		val = le16_to_cpu(buf);
 		ctl_val->value.integer.value[i] = val;
 	}
 
@@ -417,24 +463,15 @@ static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
 		return pm.err;
 
 	for (i = 0; i < hwchan; i++) {
-		s16 rbuf;
-		s16 buf = cpu_to_le16(ctl_val->value.integer.value[i]);
+		s32 val = ctl_val->value.integer.value[i];
 		int ret;
 
-		ret = snd_audient_get_cur(mixer, ctype->unit, ctype->sel,
-					  base + i, &rbuf, sizeof(rbuf));
+		ret = snd_audient_raw_set_one(mixer, ctype, base + i, val);
 		if (ret < 0)
 			return ret;
 
-		if (rbuf != buf) {
+		if (ret)
 			changed = 1;
-
-			ret = snd_audient_set_cur(mixer, ctype->unit,
-						  ctype->sel, base + i,
-						  &buf, sizeof(buf));
-			if (ret < 0)
-				return ret;
-		}
 	}
 
 	return changed;
-- 
2.47.3

