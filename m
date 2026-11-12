Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451069;
	b=1NaVOeLh6zcqB56FFcPw6e3RM7b136AC42LFHkV07x2kLD67zJQYrufF4j6mEte7PJ82
	 /242BrK6MPZXhIb+LemQ4YdQB5NpOH8uwe8WZ5kQuEBFafrBiG4L5CFhkZswkgxghbnbd
	 IjcBKhaePmNwgAHPwLfRI9EgXGRHy1yRbilH/d3LfK2CacCp59SRCPSSdlY+sXG6Xt2Hw
	 yzfdKYzb9LWl4GMATktaQbi+dVzT59hJQ8g5rxXofWdM2ijOqItqIGODAhZ3fSje1o4TX
	 zotfdWY1uC9djbV0mnsijFEhFXR4pjfxthuM1zyVzj7DYby7AyqN1XPO23RiEAlKccQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=79q4i5uE12BZeM3IYhfo+w3TCZBPmWuPri2dNCkJtd8=;
	b=1DoeIjOqlKGm4j3tmDEjFltClE8ey0jiH2cY05hWbrDeLDkf8v6otdrqjULBtAtUSqkN
	 0z1rcGM5se4dhEb0yZeFP++Edtv7MJWlrF+/wxRdq+l8lXYrpZxlSCnY/52LmHkH7c1lC
	 oB7rFkQ1ML1g0d8BvZ3IUTjYW810b878mZruNrlFAtbWNQC43NISHgL9v+AoIdLPRBoJg
	 Hd/9zcVrzxpcxTnBB42r0X3+2pfmit9JfWz7xtI2oplJNp4CtbArYdAl+/8tbA9+wgeF3
	 HCb6j6zST6TuuI1nZnyxLDdC9jNligjqfkbViOTHrB7FBKvKNOARdkfAcL9XCmeH1Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mZ9rSslR;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6275E60A2627
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6275E60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mZ9rSslR
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-82109f51565so1648735a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794451067; x=1795055867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79q4i5uE12BZeM3IYhfo+w3TCZBPmWuPri2dNCkJtd8=;
        b=mZ9rSslRRU7ZiMDyR2qMWSrOBOuciYf9z7+Yp2PCXBKHk05OCiRdRFgZwrmaKOcsv4
         0NWfviP3xyB5ik6nYJb7OgKxyebTzBOaexPrNGu4IiqPaBCOt4lSXsupHbTJ68zpo82s
         wNM87WHhqRQgqockvCLWNngnoX8gtC+ExLQvu3+Q/wmXJpIYmMmNph/4rQEjgPDNHunP
         FtYt2HN8twOpmpy+Ir6iFgiRgswcwmFnuzwaOTSrLooHagK4zgxnNmQPEdyENiEfxKBq
         KjulqOXqDh/qhL2DNezx5+TMMTWFpa75KlJQft5cLvABdNbbyMMHJ86QSbnQaEQJRGIW
         U+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794451067; x=1795055867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=79q4i5uE12BZeM3IYhfo+w3TCZBPmWuPri2dNCkJtd8=;
        b=ZGW0Q5Xd1RQopLdTe1zkagl6SgGnhoqHI+gvHL9h6Bx3CdARFbBQnJyNAb7WCMjRA5
         pK13iYlSm3YyN4S6QXC68QA1wLCZlQ54czRxGE1Z9BvqxW9sR3L1dEXbnX4Tr+nQ+gkT
         LoSbCmaNj+waIWYKN4q1Qb933i/RPaoawkS4Ndg0Z3K4JTvKiK/oRUa05hHlt5+einC0
         Fv1lOiTsKKHocazbaNoKB9sseTOEPxIAmyw/FxutwktBa+5wCBWVFpaiXzn4Jw6Sbf+h
         fXjKL8M7NpNGn1O8923cHFwZs9ckAmPgEgaWpeADZ3CrDWDtCz0zeaYDpDUrNlJ+86zx
         tQgw==
X-Forwarded-Encrypted: i=1; AL+hErFlpKpQR4C+5P3ujoLxYMQ3qo5/5VO/yQ7JdC/FGAQG1tlhW+YCl9V5oxb2inVs4+lGukkbWEZBur4YPKI=@vger.kernel.org
X-Gm-Message-State: APuU4Z98NAM/0LMgISOiGpbfKAzxlUmnVPtw8W57yIrbomET+Yy6KzmV
	f5xoyBFARImsWcQrRfkXsVXNt9EmmQbsU+MsBj+hkQA1cE/vUPYBv1hUcQOQ5w==
X-Gm-Gg: AYBFou3m9UPfyS685CXC1BHU66lJI9ke/yAiK0pLUqpTDKiF4d3LyTt4hxd6iDEWK6M
	XthJaHri3pgiTzOH12g8IcfuTUEA3+ixnIUdObRW3xtD9h6ed05WPD7i2haz0wE3WaCIi+Jb3UW
	ObC111aHP0xJKehRaOFe++y1cEChqgGlCcPHTGk9B9DmG6UMiNAIuFPbnj8Gj3n2p+xC4FiINeE
	qebaYW4eO1sg9cH+ZYCh7UtklWpeDvTC4C7hFQYzYavjjtiUNUuhac2N1LJi4vLTe5YOEwYtqCs
	OnUVqitkIy0OE1+OrVkx5oqx2npQn8HtvZfeBcpAoKg6jA6sTKXTJD74KCFYHGmsR9DgWIZQWDh
	sV3bPPDTPRZ9X/7X5L5yQLbqg+gvb1l3/xPShqqog6HPbn/AMvlypsoHZ/YwKd9tAUq80QK9jZf
	6fMnp/YF7KpyyV5VHZqyfvz6s2Z1XUILKahreAdSD2zjOFY9IuSwujvBMfTZ6yoWVrEMRbzQExB
	5QXnvX41wSpTRUuC1BbGSWe+E5upNPVBAaKoC6zb4P+IU7SONaMGP+Q9tX2ry09clJMpa/SGNa5
	MwIAOCX+SB3Ly0QF4ifhwbAxDovWSY8w8ZChfKgsZERLgPC3KNT5zXLaBYoLui+msms=
X-Received: by 2002:a05:6820:1341:b0:6dd:1d43:8cd0 with SMTP id 006d021491bc7-719179ad6dfmr2801124eaf.80.1794451067098;
        Wed, 11 Nov 2026 18:37:47 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22f6a1c7sm4327310fac.6.2026.11.11.18.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:37:45 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 6/6] ALSA: mixer_audient: Use the same cache for the iD14 MkI FU 12 control
Date: Wed, 11 Nov 2026 20:37:20 -0600
Message-ID: <20261112023720.1503814-7-mrwillporter@gmail.com>
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

The FU 12 control keeps its own value array and valid mask on a
struct usb_mixer_elem_list. Make it a struct usb_mixer_elem_info, and
use cache_val[ch] and bit ch of cached as the other controls do. Set
channels and get_cur_broken. Remove the private struct.

The list head is the first member of struct usb_mixer_elem_info, so
snd_usb_mixer_elem_free() still frees the right pointer. The control
is still registered with is_std_info false, so the generic notify
paths do not touch it.

No functional change.

Assisted-by: Claude:claude-fable-5-2
Assisted-by: Claude:claude-sonnet-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 54 ++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index edc568830366c..8c81a4c05995f 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -1074,26 +1074,26 @@ static const struct snd_audient_ctrl_type snd_audient_id14_fu12_type = {
 	.sel = UAC_FU_VOLUME,
 };
 
-struct snd_audient_id14_fu12 {
-	struct usb_mixer_elem_list list;	/* first: snd_usb_mixer_elem_free */
-	long val[ID14_FU12_CHANNELS];
-	u8 valid;				/* bit per channel */
-};
-
-static int snd_audient_id14_fu12_write(struct snd_audient_id14_fu12 *f,
+/*
+ * The control is a struct usb_mixer_elem_info whose list head is registered
+ * with is_std_info false. The head is the first member, as
+ * snd_usb_mixer_elem_free needs. cache_val[ch] and bit ch of cached hold
+ * the last value the device accepted.
+ */
+static int snd_audient_id14_fu12_write(struct usb_mixer_elem_info *elem,
 				       unsigned int ch, long val)
 {
 	__le16 buf = cpu_to_le16(val == ID14_FU12_MUTE ? -128 * 256
 				 : (val - ID14_FU12_MAX) * 256);
 	int ret;
 
-	ret = snd_audient_set_cur(f->list.mixer, &snd_audient_id14_fu12_type,
+	ret = snd_audient_set_cur(elem->head.mixer, &snd_audient_id14_fu12_type,
 				  ch + 1, &buf);
 	if (ret < 0)
 		return ret;
 
-	f->val[ch] = val;
-	f->valid |= BIT(ch);
+	elem->cache_val[ch] = val;
+	set_bit(ch, elem->cached);
 
 	return 0;
 }
@@ -1112,13 +1112,13 @@ static int snd_ctl_audient_id14_fu12_info(struct snd_kcontrol *kctl,
 static int snd_ctl_audient_id14_fu12_get(struct snd_kcontrol *kctl,
 					 struct snd_ctl_elem_value *ctl_val)
 {
-	struct snd_audient_id14_fu12 *f = snd_kcontrol_chip(kctl);
+	struct usb_mixer_elem_info *elem = snd_kcontrol_chip(kctl);
 	unsigned int ch;
 
 	/* a channel that was never written reads as mute */
 	for (ch = 0; ch < ID14_FU12_CHANNELS; ch++)
-		ctl_val->value.integer.value[ch] = (f->valid & BIT(ch))
-						   ? f->val[ch]
+		ctl_val->value.integer.value[ch] = test_bit(ch, elem->cached)
+						   ? elem->cache_val[ch]
 						   : ID14_FU12_MUTE;
 
 	return 0;
@@ -1127,7 +1127,7 @@ static int snd_ctl_audient_id14_fu12_get(struct snd_kcontrol *kctl,
 static int snd_ctl_audient_id14_fu12_set(struct snd_kcontrol *kctl,
 					 struct snd_ctl_elem_value *ctl_val)
 {
-	struct snd_audient_id14_fu12 *f = snd_kcontrol_chip(kctl);
+	struct usb_mixer_elem_info *elem = snd_kcontrol_chip(kctl);
 	long *const v = ctl_val->value.integer.value;
 	unsigned int ch;
 	int changed = 0;
@@ -1136,7 +1136,7 @@ static int snd_ctl_audient_id14_fu12_set(struct snd_kcontrol *kctl,
 		if (v[ch] < 0 || v[ch] > ID14_FU12_MAX)
 			return -EINVAL;
 
-	CLASS(snd_usb_lock, pm)(f->list.mixer->chip);
+	CLASS(snd_usb_lock, pm)(elem->head.mixer->chip);
 	if (pm.err < 0)
 		return pm.err;
 
@@ -1147,10 +1147,10 @@ static int snd_ctl_audient_id14_fu12_set(struct snd_kcontrol *kctl,
 	for (ch = 0; ch < ID14_FU12_CHANNELS; ch++) {
 		int ret;
 
-		if (!(f->valid & BIT(ch)) || f->val[ch] != v[ch])
+		if (!test_bit(ch, elem->cached) || elem->cache_val[ch] != v[ch])
 			changed = 1;
 
-		ret = snd_audient_id14_fu12_write(f, ch, v[ch]);
+		ret = snd_audient_id14_fu12_write(elem, ch, v[ch]);
 		if (ret < 0)
 			return ret;
 	}
@@ -1171,19 +1171,21 @@ static int snd_audient_id14_mk1_create(struct usb_mixer_interface *mixer)
 		.put = snd_ctl_audient_id14_fu12_set,
 		.tlv.p = snd_audient_tlv_id14_fu12,
 	};
-	struct snd_audient_id14_fu12 *f;
+	struct usb_mixer_elem_info *elem;
 	struct snd_kcontrol *kctl;
 	unsigned int ch;
 
-	f = kzalloc_obj(*f);
-	if (!f)
+	elem = kzalloc_obj(*elem);
+	if (!elem)
 		return -ENOMEM;
 
-	f->list.mixer = mixer;
-	f->list.id = ID14_FU_MIX;
+	elem->head.mixer = mixer;
+	elem->head.id = ID14_FU_MIX;
+	elem->channels = ID14_FU12_CHANNELS;
+	elem->get_cur_broken = 1;
 
 	for (ch = 0; ch < ID14_FU12_CHANNELS; ch++) {
-		const int ret = snd_audient_id14_fu12_write(f, ch,
+		const int ret = snd_audient_id14_fu12_write(elem, ch,
 				ch < ID14_FU12_MAIN_CHANNELS ? ID14_FU12_MAX
 							     : ID14_FU12_MUTE);
 
@@ -1193,15 +1195,15 @@ static int snd_audient_id14_mk1_create(struct usb_mixer_interface *mixer)
 				       ch + 1, ret);
 	}
 
-	kctl = snd_ctl_new1(&knew, f);
+	kctl = snd_ctl_new1(&knew, elem);
 	if (!kctl) {
-		kfree(f);
+		kfree(elem);
 		return -ENOMEM;
 	}
 
 	kctl->private_free = snd_usb_mixer_elem_free;
 
-	return snd_usb_mixer_add_list(&f->list, kctl, false, true);
+	return snd_usb_mixer_add_list(&elem->head, kctl, false, true);
 }
 
 /* called from mixer_quirks.c */
-- 
2.47.3

