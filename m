Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779032;
	b=zcp55QjPTsrHAmkFteK6aXIxSoAMbEBTvO2NXthrE4wvRnO9iSr0s5VRIBl5O2PsDAKP
	 vKjSVF9qQKUVuJy19c7PAklHrTZ5NE+MdauVM3EBuja1ZGwrwEM79TuwzQUV593TYu1gj
	 ZHuJN+5rnc87D28KjbZjp+6uwydoV8eGqTYo3e4iS6og0+JOyN9zU4TEOd8i+SG+NRbw8
	 TlnjVjP9EPWujrDu8a3VpyotgELIyasBQhCbc5DrtagqSTvdkBUPW/cZ2DZ2RyIgTR/jC
	 sM4o4kRw0m1IdmumhjP3OhYEcWpRAuZ14MyjK41o826OcPJBMByO34fkOD2ijdGn77g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779032;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=yMcJZbHN9+N4ZlVJjba3bn48apK8DE6WS5GiBJ3R7UU=;
	b=qjDtaLJ9Jmw1fnNaCa+XejmOE/FbL68WTS+irWpJKEmwtGkKcMiXsyaY/5O1zRhdBAsw
	 lXmO6AFv1tVxMcl+i+ql3f0V41hOpMvh2nT3nOU/lthBlKKT3qX0sdKKiDQOCM7I1JCvs
	 pJClDykyTLHgSgFtMQSk1brMiSHnsmVGm3e8+WSPt/D2zMcxsbM+ZITO7B/uWposCB3wA
	 fqGEMKWxd33OuDfsiHH7gTt5gmS9mHr6vd1VM9teb2TocqKBiCaY3l8UviJQmSPCVAgmG
	 nTnmpvrKMr8cJUM0d/gpRDKCSKgwR8jA+97ea/bSHi6DRwS2XIPB3rW/PXlQYhx7ftg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=EC3nt9hc;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CE460A2609
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00CE460A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=EC3nt9hc
DKIM2-Signature:  i=1; m=1; t=1794779029;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:fER3KTXvOLQ71LeQeRIQeyw7pLRl
   mFo6o1llTxWwuSFphKCx+6MVvuumhFP35Y1zDLjeAi4Ta7kEXp4//HpBvx01O7gSSEVZkS1S1qQ
   Kv9L5m+ctfoQP49IExdPnU2rL+ZWYOx4MzQW72onPihfb9EUKRjY7wMmIAHei+k3anaffgKI777
   28NoxNFFWxLX31m63I+7hEhgE7lQGB17bf/ZJmp+68GZTSKZM4T5rX/a9U3g7mwNvlUWMhhq+9n
   7PNBImNngk+mpusMJsMSPhNTJRoKotssYdTUIWJMNSYr3aZg3UnVBE/ZyUlUtY1iTe17h6ri/4j
   47OsGEMDbmUoaA==;
Message-Instance:  m=1;
 h=sha256:
   NorUkq18Qq1s2BnfdusP/xps2KPX6eIHUE6N3sUJMGY=:
   ydQZSI8/G3826i4YPYErqx/zjVLtkfC1Pr/h8TXPkIg=,
  sha512:
   GZ6XwAdX+F28oKIbmbKY5TOklsfWdQ6hkyZS1ScO75a5xZ6ZF0vPHg1FDKqMREsULhw+hpM94dLZxEY+oqkKCg==:
   1TsjRcSo9EXvlsQmqI48+UBgOphcRsiFenT9X3ISVoSDRXZY4xMIDB5A7YS3aX6QaNIrKG607UIyJOFiScSvfQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779029; x=1795383829; i=arc@gmx.li;
	bh=yMcJZbHN9+N4ZlVJjba3bn48apK8DE6WS5GiBJ3R7UU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EC3nt9hcODqz0Ydz2z/EkOr8BekjFg70eaBM7Pa7GRfbN+6GZDyb+8qCDBX17AnU
	 tUpv12QjXIez1drzHRoVBK1rCx/CdHQ8Pn+CujE5jut0Vke7cCmno7Nh+28FoC1QC
	 yaQvTczysdh0eyWcncCUePpHXJ3ULuEvDeYGZl2ILSmFfOOQYqN+x1lMIzP8l8h58
	 DUAaKw9wa5mxzyY2vYcDgHZeSqoNC6tzXyOYtpwyC42tfz+TDe9AyGHm6ENeO9UlY
	 tTtSgWmpVRxv0R0xTVpjJoUdRVc0/epDSyEiEZz7ckpKkbd/HCnNA6yAawyVmBfdH
	 iE003OCSkRmcc63tTQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBlxM-1xImOe3MrM-004mnv; Sun, 15
 Nov 2026 22:43:48 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V4 PATCH 10/19] ALSA: mixer_audient: add control value caching
Date: Sun, 15 Nov 2026 22:43:27 +0100
Message-ID: <20261115214336.17917-11-arc@gmx.li>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112023720.1503814-1-mrwillporter@gmail.com>
References: <20261112023720.1503814-1-mrwillporter@gmail.com>
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
X-Provags-ID: V03:K1:eamxWCMXhRw1P4iq1jmVE1lT1KY0JozXUWDAFUeq/BJhV2WO29B
 0eTpuucy0bGO0oU3zkynaXQTx8qBEQmrrkt5uvanUjkPtmqkQUjy+fKLKIwJDDwX+VAXoaw
 rN4aS4UJgmzjoMo7PF2Nw0bxW0BaXU/RAhWyGEa8oquw3bPFuwi9BxTPYqSu0j5QJilI0QT
 +5WrtfBeSvUyRiqpJfZRQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:do+5JkynQlY=;g6st3+f52jlSH9NW45LFiheDSl7
 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

In preparation of id14 support, add control value caching.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Co-developed-by: Will Porter <mrwillporter@gmail.com>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
=2D--
 sound/usb/mixer_audient.c | 144 +++++++++++++++++++++++++++-----------
 1 file changed, 105 insertions(+), 39 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index bdfcb7fcf531..33c5e0a8f0e0 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -40,6 +40,7 @@ static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_=
mixer, -12800, 600);
 #define SND_AUDIENT_CTYPE_FLAGS_SIGNED		BIT(0)
 #define SND_AUDIENT_CTYPE_FLAGS_INIT_HW		BIT(1)
 #define SND_AUDIENT_CTYPE_FLAGS_GET_BROKEN	BIT(2)
+#define SND_AUDIENT_CTYPE_FLAGS_CACHE		BIT(3)
=20
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
 	[SND_AUDIENT_TYPE_MIXER] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_INTEGER,
-		.flags =3D SND_AUDIENT_CTYPE_FLAGS_SIGNED,
+		.flags =3D SND_AUDIENT_CTYPE_FLAGS_SIGNED
+			 | SND_AUDIENT_CTYPE_FLAGS_CACHE,
 		.len =3D 2,
 		.min.integer =3D -128 * 256,
 		.max.integer =3D 6 * 256,
@@ -285,14 +287,33 @@ static inline int snd_audient_set_cur(struct usb_mix=
er_interface *mixer,
 }
=20
=20
-static int snd_audient_raw_get_one(struct usb_mixer_interface *const mixe=
r,
+static int snd_audient_raw_get_one(struct usb_mixer_elem_info *const elem=
,
 			const struct snd_audient_ctrl_type *const ctype,
-			const u8 cidx, u32 *const value)
+			const unsigned int cidx, u32 *const value)
 {
+	struct usb_mixer_interface *const mixer =3D elem->head.mixer;
 	int ret;
 	__le32 buf =3D 0;
 	s32 val;
=20
+	if (cidx > MAX_CHANNELS)
+		return -EINVAL;
+
+	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE) {
+		if (test_bit(cidx, elem->cached)) {
+			*value =3D elem->cache_val[cidx];
+
+			return ctype->len;
+		} else if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_GET_BROKEN) {
+			/*
+			 * Cached FORCE_SET controls are treated as write-only:
+			 * an invalid cache entry does not trigger a GET.
+			 */
+			return -ENODATA;
+		}
+	}
+
+
 	ret =3D snd_audient_get_cur(mixer, ctype, cidx, &buf);
 	if (ret < 0)
 		return ret;
@@ -304,43 +325,55 @@ static int snd_audient_raw_get_one(struct usb_mixer_=
interface *const mixer,
=20
 	*value =3D val;
=20
+	set_bit(cidx, elem->cached);
+	elem->cache_val[cidx] =3D val;
+
 	return ret;
 }
=20
-static int snd_audient_raw_set_one(struct usb_mixer_interface *const mixe=
r,
+static int snd_audient_raw_set_one(struct usb_mixer_elem_info *const elem=
,
 			const struct snd_audient_ctrl_type *const ctype,
-			const u8 cidx, const u32 value)
+			const unsigned int cidx, const u32 value, bool force)
 {
+	struct usb_mixer_interface *const mixer =3D elem->head.mixer;
 	int ret;
 	u32 val;
=20
-	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_GET_BROKEN) {
+	if (cidx > MAX_CHANNELS)
+		return -EINVAL;
+
+	if (force) {
 		val =3D !value;		/* just make it different */
 	} else {
-		ret =3D snd_audient_raw_get_one(mixer, ctype, cidx, &val);
-		if (ret < 0)
+		ret =3D snd_audient_raw_get_one(elem, ctype, cidx, &val);
+		if (ret =3D=3D -ENODATA)	/* FORCE_SET and not cached yet */
+			val =3D !value;	/* just make it different */
+		else if (ret < 0)
 			return ret;
 	}
=20
-	if (val !=3D value) {
+	force =3D force || (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_GET_BROKEN);
+
+	if (force || (val !=3D value)) {
 		__le32 buf =3D cpu_to_le32(value);
=20
 		ret =3D snd_audient_set_cur(mixer, ctype, cidx, &buf);
 		if (ret < 0)
 			return ret;
=20
-		return 1;
+		set_bit(cidx, elem->cached);
+		elem->cache_val[cidx] =3D value;
 	}
=20
-	return 0;
+	return val !=3D value;
 }
=20
=20
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
@@ -353,13 +386,17 @@ static int snd_ctl_audient_boolean_get(struct snd_kc=
ontrol *kctl,
 	CLASS(snd_usb_lock, pm)(mixer->chip);
 	if (pm.err < 0)
 		return pm.err;
+	/* serializes the transfers and the cache, also between gets */
+	guard(mutex)(&mixer->lock);
=20
 	for (i =3D 0; i < hwchan; i++) {
 		u32 buf;
 		int ret;
=20
-		ret =3D snd_audient_raw_get_one(mixer, ctype, base + i, &buf);
-		if (ret < 0)
+		ret =3D snd_audient_raw_get_one(elem, ctype, base + i, &buf);
+		if (ret =3D=3D -ENODATA)	/* unknown write-only value: off */
+			buf =3D ctype->min.integer;
+		else if (ret < 0)
 			return ret;
=20
 		ctl_val->value.integer.value[i] =3D (buf =3D=3D ctype->min.integer)
@@ -375,8 +412,8 @@ static int snd_ctl_audient_boolean_get(struct snd_kcon=
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
@@ -389,13 +426,16 @@ static int snd_ctl_audient_boolean_set(struct snd_kc=
ontrol *kctl,
 	CLASS(snd_usb_lock, pm)(mixer->chip);
 	if (pm.err < 0)
 		return pm.err;
+	/* serializes the transfers and the cache, also between gets */
+	guard(mutex)(&mixer->lock);
=20
 	for (i =3D 0; i < hwchan; i++) {
 		u32 buf =3D ctl_val->value.integer.value[i] ? ctype->max.integer
 							  : ctype->min.integer;
 		int ret;
=20
-		ret =3D snd_audient_raw_set_one(mixer, ctype, base + i, buf);
+		ret =3D snd_audient_raw_set_one(elem, ctype, base + i, buf,
+					      false);
 		if (ret < 0)
 			return ret;
=20
@@ -409,8 +449,8 @@ static int snd_ctl_audient_boolean_set(struct snd_kcon=
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
@@ -423,13 +463,17 @@ static int snd_ctl_audient_integer_get(struct snd_kc=
ontrol *kctl,
 	CLASS(snd_usb_lock, pm)(mixer->chip);
 	if (pm.err < 0)
 		return pm.err;
+	/* serializes the transfers and the cache, also between gets */
+	guard(mutex)(&mixer->lock);
=20
 	for (i =3D 0; i < hwchan; i++) {
 		s32 val;
 		int ret;
=20
-		ret =3D snd_audient_raw_get_one(mixer, ctype, base + i, &val);
-		if (ret < 0)
+		ret =3D snd_audient_raw_get_one(elem, ctype, base + i, &val);
+		if (ret =3D=3D -ENODATA)	/* unknown write-only value: minimum */
+			val =3D ctype->min.integer;
+		else if (ret < 0)
 			return ret;
=20
 		if (val < ctype->min.integer)
@@ -450,8 +494,8 @@ static int snd_ctl_audient_integer_get(struct snd_kcon=
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
@@ -471,12 +515,15 @@ static int snd_ctl_audient_integer_set(struct snd_kc=
ontrol *kctl,
 	CLASS(snd_usb_lock, pm)(mixer->chip);
 	if (pm.err < 0)
 		return pm.err;
+	/* serializes the transfers and the cache, also between gets */
+	guard(mutex)(&mixer->lock);
=20
 	for (i =3D 0; i < hwchan; i++) {
 		s32 val =3D ctl_val->value.integer.value[i];
 		int ret;
=20
-		ret =3D snd_audient_raw_set_one(mixer, ctype, base + i, val);
+		ret =3D snd_audient_raw_set_one(elem, ctype, base + i, val,
+					      false);
 		if (ret < 0)
 			return ret;
=20
@@ -517,6 +564,8 @@ static int snd_audient_add_ctrl(struct usb_mixer_inter=
face *mixer,
 	struct snd_kcontrol *kctl;
 	struct usb_mixer_elem_info *elem;
=20
+	int ret;
+
 	knew.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER;
 	knew.name =3D ctrl->name;
 	knew.info =3D snd_ctl_audient_info;
@@ -524,7 +573,9 @@ static int snd_audient_add_ctrl(struct usb_mixer_inter=
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
@@ -540,13 +591,30 @@ static int snd_audient_add_ctrl(struct usb_mixer_int=
erface *mixer,
 		return -EINVAL;
 	}
=20
+	elem =3D kzalloc_obj(*elem);
+	if (!elem)
+		return -ENOMEM;
+
+	elem->head.mixer =3D mixer;
+	elem->channels =3D ctrl->channels;
+	elem->head.id =3D ctype->unit;
+	elem->control =3D ctype->sel;
+	elem->get_cur_broken =3D (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE)
+			&& (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_GET_BROKEN);
+
+	/*
+	 * A failed probe transfer must not fail the card: warn and keep the
+	 * control.
+	 * We don't initialize the cache: This will be done implicitly when
+	 * the control is first successfully accessed.
+	 */
 	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_INIT_HW) {
 		int i;
=20
 		for (i =3D 0; i < ctrl->hwchannels; i++) {
-			int ret =3D snd_audient_raw_set_one(mixer, ctype,
-							  ctrl->val_offs + i,
-							  ctype->init);
+			ret =3D snd_audient_raw_set_one(elem, ctype,
+						      ctrl->val_offs + i,
+						      ctype->init, true);
 			if (ret < 0)
 				usb_audio_warn(mixer->chip,
 					       "%s: cannot set channel %d (%d)\n",
@@ -554,22 +622,20 @@ static int snd_audient_add_ctrl(struct usb_mixer_int=
erface *mixer,
 		}
 	}
=20
-	elem =3D kzalloc_obj(*elem);
-	if (!elem)
-		return -ENOMEM;
-
-	elem->head.mixer =3D mixer;
-	elem->channels =3D ctrl->channels;
-
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
2.56.1

