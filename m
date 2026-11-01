Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793491257;
	b=xvTRrqSm4Qq1Zo5W/4KtgagELjhY7gMxVilgS4qhKBLcSHt5BKwoC7BzcPWeq4TYRYmM
	 2hfDx+yufBD4NJcOeC3G6YvCqEpLOz6v7CsVcd8r8OZQeO57+6WH23YRb7pY2Mc/tjmqQ
	 xyypWmws7arilrT8fCnG+AkHc5xtBbO/5lTX66lKp4/STxdAxl/MsshaBYPQSiZvK/4Jl
	 G8W30MJP7BvhDmP3AoARcJvIhUFN8s1SMs8QfP9Dc7ORuZDemUEGhH6cG+Kk5BVIVgqaB
	 8/C0Zqj+bp2hfmtZoNMyj2H7z1hiYdG5b05jQ8VyoKFvQzQM8/XG1DZmttTtGoMqP8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793491257;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=AS4YxmSH0A0yOPNXcyneEDvVUTek3imuYid/u0iLlmA=;
	b=nvOx5JcQDYdTcoOzVMLoDM6U0f6UmUfs2O0tNKg7KozmJnrjlca1Fjf/OVaKn/7++k+h
	 ZoPaYSdz7CqbRrypkYIozeJb6hbMa/viub58OhWEzUanBwXDp0fZf9PxSfN5GYU4hjFJ/
	 AudakgmOCAZN9+dHSTK7OQZYvMMlZfiBQjeqdSO0lOfrhEqDO8nl3BcWuf5wSavoRZesR
	 HZ9Xhm2CE1i4toXrs78GoDW7Ka9iO/eQfgF1f814B/+GMz1DV14WygX3j4Dwp6v7ryrAL
	 garrIsnkXnHZ7eyDB3x2+8m/McrPABaTYu7x4FCz9SUuxQEWOC7qI7oEd+i3BcRcf2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b="B8CMWhX/";
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B37D60A261E;
	Sun,  1 Nov 2026 00:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B37D60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=B8CMWhX/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793491249; x=1794096049; i=arc@gmx.li;
	bh=AS4YxmSH0A0yOPNXcyneEDvVUTek3imuYid/u0iLlmA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=B8CMWhX//mark+NxplpqyDjTpUcGOLU2xVgJvIi4x/fVdcaeKZLYGZFCy3+OH5OK
	 N+XHnPwB02NloIxpaGhhefDtlaLF50qvAgMPfzxrNz2qePUZH2vrEG+wnmJVwMQmL
	 q+9EB8pSZilezYiy6DwirrlPnobpagZllB7ND3Nm4E0Oo4rL4+Lcywi3KYWr1EZLG
	 5kq7kbeeLxKHASNPJaFNamgnohZAzs5fo+vHR4UEipK9axWfZRsNgdxZOCnE0ImE4
	 jUrvqacurX7fUei56gvDw/tU4RIS16npJKCfiNeJ3mTkmE/tl2IFXCeW8aR4OQPxO
	 sK7/cj8hQStcUGKB9g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXp5Q-1x2XYC3lzI-00RFL3; Sun, 01
 Nov 2026 01:00:49 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC PATCH 10/11] ALSA: mixer_audient: add control value caching
Date: Sun,  1 Nov 2026 01:00:12 +0100
Message-ID: <20261101000013.11880-11-arc@gmx.li>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101000013.11880-1-arc@gmx.li>
References: <CAMZ8TEw=rmc=H3L60j-o_wa0fNc9eOhG7ZY0SdttFf+p-qUfkQ@mail.gmail.com>
 <20261101000013.11880-1-arc@gmx.li>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DiB5in0tUeAs/9XrMEqjIEtx7QwS5jtUGUFXv2FeA+oogta0f/k
 bZErSbU6mAs1WbmP1F4yXlyINYK9d+pWOLfxAhUHUeqlgp76bWSzDXXvSIHrCGeKgmHN/3a
 yir6Pq1SSK3Mu0kxQGj+XQxhAJ/Cc8WbkQp3nfKz96uOylejDEmJY/LUcWqCZ4Jhn0aOh1o
 HTX1ehUGw9MOA3ADVCPSQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:v91VNstn5bs=;a9A5A3T8hXYOwUfxyQQ3lZhN4iy
 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
 uL6IfnpgIwqFjl9HTmw==

In preparation of id14 support, add control value caching.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_audient.c | 112 +++++++++++++++++++++++++++-----------
 1 file changed, 81 insertions(+), 31 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 7cb8245a64d0..24b594fb1bc7 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -38,6 +38,7 @@ static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_=
mixer, -12800, 600);
 #define SND_AUDIENT_CTYPE_FLAGS_SIGNED		(1L <<  0)
 #define SND_AUDIENT_CTYPE_FLAGS_INIT_HW		(1L <<  1)
 #define SND_AUDIENT_CTYPE_FLAGS_FORCE_SET	(1L <<  2)
+#define SND_AUDIENT_CTYPE_FLAGS_CACHE		(1L <<  3)
=20
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
@@ -49,7 +50,7 @@ static const struct snd_audient_ctrl_type {
 	union {
 		long integer;
 	} max;		/* for booleans holds physical int value for true */
-	u32 init;
+	u32 init;	/* hardware and cache are initialized to this value */
 	const unsigned int *tlv;
 	u8 unit;
 	u8 sel;
@@ -89,7 +90,8 @@ static const struct snd_audient_ctrl_type {
 	},
 	[SND_AUDIENT_TYPE_MIXER] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_INTEGER,
-		.flags =3D SND_AUDIENT_CTYPE_FLAGS_SIGNED,
+		.flags =3D SND_AUDIENT_CTYPE_FLAGS_SIGNED
+			 | SND_AUDIENT_CTYPE_FLAGS_CACHE,
 		.len =3D 2,
 		.min.integer =3D -128 * 256,
 		.max.integer =3D 6 * 256,
@@ -285,11 +287,18 @@ static inline int snd_audient_set_cur(struct usb_mix=
er_interface *mixer,
=20
 static int snd_audient_raw_get_one(struct usb_mixer_interface *const mixe=
r,
 			const struct snd_audient_ctrl_type *const ctype,
+			const u32 *const cache,
 			const u8 cidx, u32 *const value)
 {
 	int ret;
 	s32 buf =3D 0;
=20
+	if (cache) {
+		*value =3D cache[cidx];
+
+		return ctype->len;
+	}
+
 	ret =3D snd_audient_get_cur(mixer, ctype, cidx, &buf);
 	if (ret < 0)
 		return ret;
@@ -309,15 +318,16 @@ static int snd_audient_raw_get_one(struct usb_mixer_=
interface *const mixer,
=20
 static int snd_audient_raw_set_one(struct usb_mixer_interface *const mixe=
r,
 			const struct snd_audient_ctrl_type *const ctype,
-			const u8 cidx, const u32 value)
+			u32 *const cache, const u8 cidx, const u32 value,
+			bool force)
 {
 	int ret;
 	u32 buf;
=20
-	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET) {
+	if ((ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET) || force) {
 		buf =3D !value;		/* just make it different */
 	} else {
-		ret =3D snd_audient_raw_get_one(mixer, ctype, cidx, &buf);
+		ret =3D snd_audient_raw_get_one(mixer, ctype, cache, cidx, &buf);
 		if (ret < 0)
 			return ret;
 	}
@@ -328,6 +338,9 @@ static int snd_audient_raw_set_one(struct usb_mixer_in=
terface *const mixer,
 		if (ret < 0)
 			return ret;
=20
+		if (cache)
+			cache[cidx] =3D value;
+
 		return 1;
 	}
=20
@@ -338,8 +351,8 @@ static int snd_audient_raw_set_one(struct usb_mixer_in=
terface *const mixer,
 static int snd_ctl_audient_boolean_get(struct snd_kcontrol *kctl,
 				       struct snd_ctl_elem_value *ctl_val)
 {
-	struct usb_mixer_elem_list *const list =3D snd_kcontrol_chip(kctl);
-	struct usb_mixer_interface *const mixer =3D list->mixer;
+	struct usb_mixer_elem_info *const elem =3D snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *const mixer =3D elem->head.mixer;
=20
 	const unsigned int nchan =3D snd_audient_kctl_channels(kctl);
 	const unsigned int hwchan =3D snd_audient_kctl_hwchannels(kctl);
@@ -357,7 +370,8 @@ static int snd_ctl_audient_boolean_get(struct snd_kcon=
trol *kctl,
 		u32 buf;
 		int ret;
=20
-		ret =3D snd_audient_raw_get_one(mixer, ctype, base + i, &buf);
+		ret =3D snd_audient_raw_get_one(mixer, ctype, elem->private_data,
+					      base + i, &buf);
 		if (ret < 0)
 			return ret;
=20
@@ -374,8 +388,8 @@ static int snd_ctl_audient_boolean_get(struct snd_kcon=
trol *kctl,
 static int snd_ctl_audient_boolean_set(struct snd_kcontrol *kctl,
 				       struct snd_ctl_elem_value *ctl_val)
 {
-	struct usb_mixer_elem_list *list =3D snd_kcontrol_chip(kctl);
-	struct usb_mixer_interface *mixer =3D list->mixer;
+	struct usb_mixer_elem_info *const elem =3D snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *const mixer =3D elem->head.mixer;
=20
 	const unsigned int hwchan =3D snd_audient_kctl_hwchannels(kctl);
 	const struct snd_audient_ctrl_type *const ctype
@@ -394,7 +408,8 @@ static int snd_ctl_audient_boolean_set(struct snd_kcon=
trol *kctl,
 							  : ctype->min.integer;
 		int ret;
=20
-		ret =3D snd_audient_raw_set_one(mixer, ctype, base + i, buf);
+		ret =3D snd_audient_raw_set_one(mixer, ctype, elem->private_data,
+					      base + i, buf, false);
 		if (ret < 0)
 			return ret;
=20
@@ -408,8 +423,8 @@ static int snd_ctl_audient_boolean_set(struct snd_kcon=
trol *kctl,
 static int snd_ctl_audient_integer_get(struct snd_kcontrol *kctl,
 				   struct snd_ctl_elem_value *ctl_val)
 {
-	struct usb_mixer_elem_list *const list =3D snd_kcontrol_chip(kctl);
-	struct usb_mixer_interface *const mixer =3D list->mixer;
+	struct usb_mixer_elem_info *const elem =3D snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *const mixer =3D elem->head.mixer;
=20
 	const unsigned int nchan =3D snd_audient_kctl_channels(kctl);
 	const unsigned int hwchan =3D snd_audient_kctl_hwchannels(kctl);
@@ -427,7 +442,8 @@ static int snd_ctl_audient_integer_get(struct snd_kcon=
trol *kctl,
 		s32 val;
 		int ret;
=20
-		ret =3D snd_audient_raw_get_one(mixer, ctype, base + i, &val);
+		ret =3D snd_audient_raw_get_one(mixer, ctype, elem->private_data,
+					      base + i, &val);
 		if (ret < 0)
 			return ret;
=20
@@ -449,8 +465,8 @@ static int snd_ctl_audient_integer_get(struct snd_kcon=
trol *kctl,
 static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
 				   struct snd_ctl_elem_value *ctl_val)
 {
-	struct usb_mixer_elem_list *list =3D snd_kcontrol_chip(kctl);
-	struct usb_mixer_interface *mixer =3D list->mixer;
+	struct usb_mixer_elem_info *const elem =3D snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *mixer =3D elem->head.mixer;
=20
 	const unsigned int hwchan =3D snd_audient_kctl_hwchannels(kctl);
 	const struct snd_audient_ctrl_type *const ctype
@@ -475,7 +491,8 @@ static int snd_ctl_audient_integer_set(struct snd_kcon=
trol *kctl,
 		s32 val =3D ctl_val->value.integer.value[i];
 		int ret;
=20
-		ret =3D snd_audient_raw_set_one(mixer, ctype, base + i, val);
+		ret =3D snd_audient_raw_set_one(mixer, ctype, elem->private_data,
+					      base + i, val, false);
 		if (ret < 0)
 			return ret;
=20
@@ -516,6 +533,8 @@ static int snd_audient_add_ctrl(struct usb_mixer_inter=
face *mixer,
 	struct snd_kcontrol *kctl;
 	struct usb_mixer_elem_info *elem;
=20
+	int ret;
+
 	knew.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER;
 	knew.name =3D ctrl->name;
 	knew.info =3D snd_ctl_audient_info;
@@ -523,7 +542,9 @@ static int snd_audient_add_ctrl(struct usb_mixer_inter=
face *mixer,
 						   ctrl->hwchannels);
 	knew.tlv.p =3D ctype->tlv;
 	knew.access =3D SNDRV_CTL_ELEM_ACCESS_READWRITE
-			| SNDRV_CTL_ELEM_ACCESS_VOLATILE
+			| ((ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE)
+			   ? 0
+			   : SNDRV_CTL_ELEM_ACCESS_VOLATILE)
 			| (ctype->tlv ? SNDRV_CTL_ELEM_ACCESS_TLV_READ : 0);
=20
 	switch (ctype->type) {
@@ -539,34 +560,63 @@ static int snd_audient_add_ctrl(struct usb_mixer_int=
erface *mixer,
 		return -EINVAL;
 	}
=20
+	elem =3D kzalloc(sizeof(*elem)
+		       + ((ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE)
+			  ? (sizeof(u32) * ctrl->hwchannels)
+			  : 0),
+		       GFP_KERNEL);
+	if (!elem)
+		return -ENOMEM;
+
+	elem->head.mixer =3D mixer;
+	elem->channels =3D ctrl->channels;
+
+	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE)
+		elem->private_data =3D elem + 1;
+
 	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_INIT_HW) {
 		int i;
=20
 		for (i =3D 0; i < ctrl->hwchannels; i++) {
-			int ret =3D snd_audient_raw_set_one(mixer, ctype,
-							  ctrl->val_offs + i,
-							  ctype->init);
+			ret =3D snd_audient_raw_set_one(mixer, ctype,
+						      elem->private_data,
+						      ctrl->val_offs + i,
+						      ctype->init, true);
 			if (ret < 0)
-				return ret;
+				goto free_elem;
 		}
-	}
-
-	elem =3D kzalloc_obj(*elem);
-	if (!elem)
-		return -ENOMEM;
+	} else if (elem->private_data) {
+		u32 *const cache =3D elem->private_data;
+		int i;
=20
-	elem->head.mixer =3D mixer;
-	elem->channels =3D ctrl->channels;
+		if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET)
+			for (i =3D 0; i < ctrl->hwchannels; i++)
+				cache[i] =3D ctype->init;
+		else
+			for (i =3D 0; i < ctrl->hwchannels; i++) {
+				ret =3D snd_audient_raw_get_one(
+							mixer, ctype, NULL,
+							ctrl->val_offs + i,
+							cache + i);
+				if (ret < 0)
+					goto free_elem;
+			}
+	}
=20
 	kctl =3D snd_ctl_new1(&knew, elem);
 	if (!kctl) {
-		kfree(elem);
-		return -ENOMEM;
+		ret =3D -ENOMEM;
+		goto free_elem;
 	}
=20
 	kctl->private_free =3D snd_usb_mixer_elem_free;
=20
 	return snd_usb_mixer_add_control(&elem->head, kctl);
+
+free_elem:
+	kfree(elem);
+
+	return ret;
 }
=20
=20
=2D-=20
2.56.0

