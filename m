Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779040;
	b=udNbxPmkeUw08I7SIlQosJCOMo8jlPwjkYcjlBWvIOUf/gICxNUqNmpdhTNbzoMDggRE
	 Ue2y2TWm2ohAq2hPOV5m/gWMALLLWM51nz+oNOzo+N9FyGUc0I/70FlSDw9SIxpZ2k6I7
	 NYinqqT+X9l4TT6k6JcjJTNJZv7P7YimwjRpBjgi8GyUmhqIVBQa0uD3ly7pGUVw8804K
	 gH9MTUCvY3Md2eQNtBM8xDWfLCHA/ihXx2bBslOwcvSqR0atydMyn47Pe76bM5AiqkOjJ
	 8dZb64evse3SuhXE5fB+2omV5pJvuKdczwyQo4E8kNsJmMmoGWfN0xOhB2Sy0Z/soIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779040;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=/6F8Eg/WwjAtvXgqRKbtuikPZ3FK748+Z31seWAT1R0=;
	b=lThHqf/0OGeHkOBoxf09UaRp9nI+M+zGlIzxPvfwjZE3Xe4iszAHKpX3l2KTJogMn0Fu
	 Mijdag4lPS1zMwh2Qw4Ig5MAg2PBthAhnTbMdWVjh78zwxTXFvTc0zLYpY+7ufqd25oa0
	 PPYU13plAzvnpr209g3vrrUynNHs0AkNgrOpnIAexdu4lJQZ3Li+dqn70EdlfIW1wMlTJ
	 I5zLXrIRaxxsm7/rECwq0lT/wNfKDpVrSh9C4DUGCw7/aqYV9i3blpo/o6TPSUgDIo1wh
	 7E6PQBK+PaB5HJBdOENkd5RuiH4OfQnIIj9D7EB/rg87sgGhR2XsR9ROkA8LOzaXKXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b="EaT/PfCj";
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DC160A3818
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84DC160A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=EaT/PfCj
DKIM2-Signature:  i=1; m=1; t=1794779036;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:OcbGORbqSVId91fFpnvOyJPrJ7or
   X/JLewnXQfgRNUIOkP/20QNowpECffEm9lGIgdg/dAppEu4f2//JrBMkZuBvWsFyCXc2rr4cXVW
   9ExDPseg43ZN9YBUbW2FeVHaQOw7x35wLYpJ0aJDZiqv6WX9r/TstGhWDnMlnIj56FyRCEZEdz9
   03JpYb/SUcFzfu/S00HRVp2Ydp/Gc/csOFGTWCEfM6tOG//DgBJjb2qmYjv42VVROFhDOAnLzWW
   O2TluSyZiDsyMMdYFiep+IqS0A3dr6xGSqXOErCTkXXRy60U+QyRaOKr46/xGapykOjSiDR6Ki8
   5CBpFgYCycTmCw==;
Message-Instance:  m=1;
 h=sha256:
   q/G/vBh/71nysHrqxxuH/Z3IDzlfAUTcBcmrXI89blI=:
   adY3fBOCvEkBA4zCDJY8unRIR18MxGveOcapxsXQYYQ=,
  sha512:
   YQ2vIiPNGOiM/mpYrw4W3mGPhgamCEWtk20L1OO3xkLf4UDNsF4G3z9XBq4GvR4lKRkvP/ryU/RdQsyvR6ogPg==:
   6O0KsH0M0xE2x4+PUJViwZrk5+HFhT+KC3AxLdQucmEsy9c2wYHwJ/kvAc2uOX3iVoCBI4BS/ZOPoJEpJ3BnLA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779036; x=1795383836; i=arc@gmx.li;
	bh=/6F8Eg/WwjAtvXgqRKbtuikPZ3FK748+Z31seWAT1R0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EaT/PfCjdEbk4u6/SqyXMbjELoltG5JoNjT5VQ6DD4ILBT4OnCUzFYLVqSDpRsvC
	 5aNudU9UDarKfq8qsB/phBWWXXLq14wByKHAvEEvVacQvpCjde70T/TLzBVrwgHxY
	 xMHg3GuzOBxScfP3V7NFBtD+hGdUPItCL2G1iIvDj5D5l/zG9v90ipqsrmnJ9ylPg
	 elEWisdUkSkqOh/byOu6rHb9ad9JLQPWc5YDmxSQ5xLZS++DgqzWrsLzYhPWO/SjK
	 u6l5QlPok/BzUX++HLCBEuMVgtfeBK83CxmF4HrjKH+VdnQ0Mz64rBvEFEqAxpVk0
	 dR2vKE8k6rdkFIWnoQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MyKDU-1wWdk003ie-010707; Sun, 15
 Nov 2026 22:43:56 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V4 PATCH 18/19] ALSA: mixer_audient: Unify snd_audient_*_set/get functions for different types
Date: Sun, 15 Nov 2026 22:43:35 +0100
Message-ID: <20261115214336.17917-19-arc@gmx.li>
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
X-Provags-ID: V03:K1:YnySgyMRo5f16lN60FYYMNqMjMZ3W+Bq/egacHMeJU0xB95opEG
 yLoW8/8IuS/j8E04331a0CTldDg+ImyLBbHhTNE2gauxDCs7RPIw8NmcE23oCAUbBJrPCg3
 b1uR3QXZcH20bFnHNkp6T+E9fM1hYQapKzyts8BalD7+NdP568uBaYSsmUiL6qDaqBYkWib
 eq0cdu5Z5H99/COogzdCg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cXh8USMwUGw=;5a5P8wBw07OlZh4+peMOLfrmwno
 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
 y7M05ANIBFrFw=

The set/get functions were originally type specific. With more and more
types needed we reached the threshold where it makes sense to merge them
into one function for get and one for set and handle the type differences
in a switch statement. Perform this merge to reduce code duplication.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_audient.c | 294 ++++++++++++--------------------------
 1 file changed, 88 insertions(+), 206 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index f144fc549c88..13940572de3f 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -683,83 +683,6 @@ static int snd_audient_raw_set_one(struct usb_mixer_e=
lem_info *const elem,
 }
=20
=20
-static int snd_ctl_audient_boolean_get(struct snd_kcontrol *kctl,
-				       struct snd_ctl_elem_value *ctl_val)
-{
-	struct usb_mixer_elem_info *const elem =3D snd_kcontrol_chip(kctl);
-	struct usb_mixer_interface *const mixer =3D elem->head.mixer;
-
-	const unsigned int nchan =3D snd_audient_kctl_channels(kctl);
-	const unsigned int hwchan =3D snd_audient_kctl_hwchannels(kctl);
-	const struct snd_audient_ctrl_type *const ctype
-						=3D snd_audient_kctl_type(kctl);
-	const u8 base =3D snd_audient_kctl_cidxoffs(kctl);
-
-	int i;
-
-	CLASS(snd_usb_lock, pm)(mixer->chip);
-	if (pm.err < 0)
-		return pm.err;
-	/* serializes the transfers and the cache, also between gets */
-	guard(mutex)(&mixer->lock);
-
-	for (i =3D 0; i < hwchan; i++) {
-		u32 buf;
-		int ret;
-
-		ret =3D snd_audient_raw_get_one(elem, ctype, base + i, &buf);
-		if (ret =3D=3D -ENODATA)	/* unknown write-only value: off */
-			buf =3D ctype->min.integer;
-		else if (ret < 0)
-			return ret;
-
-		ctl_val->value.integer.value[i] =3D (buf =3D=3D ctype->min.integer)
-						  ? false : true;
-	}
-
-	for (; i < nchan; i++)
-		ctl_val->value.integer.value[i] =3D 0;
-
-	return 0;
-}
-
-static int snd_ctl_audient_boolean_set(struct snd_kcontrol *kctl,
-				       struct snd_ctl_elem_value *ctl_val)
-{
-	struct usb_mixer_elem_info *const elem =3D snd_kcontrol_chip(kctl);
-	struct usb_mixer_interface *const mixer =3D elem->head.mixer;
-
-	const unsigned int hwchan =3D snd_audient_kctl_hwchannels(kctl);
-	const struct snd_audient_ctrl_type *const ctype
-						=3D snd_audient_kctl_type(kctl);
-	const u8 base =3D snd_audient_kctl_cidxoffs(kctl);
-
-	int changed =3D 0;
-	int i;
-
-	CLASS(snd_usb_lock, pm)(mixer->chip);
-	if (pm.err < 0)
-		return pm.err;
-	/* serializes the transfers and the cache, also between gets */
-	guard(mutex)(&mixer->lock);
-
-	for (i =3D 0; i < hwchan; i++) {
-		u32 buf =3D ctl_val->value.integer.value[i] ? ctype->max.integer
-							  : ctype->min.integer;
-		int ret;
-
-		ret =3D snd_audient_raw_set_one(elem, ctype, base + i, buf,
-					      false);
-		if (ret < 0)
-			return ret;
-
-		if (ret)
-			changed =3D 1;
-	}
-
-	return changed;
-}
-
 /*
  * With a step size (res), an integer control counts steps from min:
  * 0 ... (max - min) / res. Without one it shows the device value.
@@ -778,8 +701,9 @@ snd_audient_int_min(const struct snd_audient_ctrl_type=
 *ctype)
 }
=20
 static long snd_audient_int_to_ctl(const struct snd_audient_ctrl_type *ct=
ype,
-				   long val)
+				   u32 buf)
 {
+	s32 val =3D (s32)buf;
 	val =3D clamp(val, ctype->min.integer, ctype->max.integer);
 	if (!ctype->res)
 		return val;
@@ -789,96 +713,19 @@ static long snd_audient_int_to_ctl(const struct snd_=
audient_ctrl_type *ctype,
 		   snd_audient_int_max(ctype));
 }
=20
-static inline long
+static inline u32
 snd_audient_int_from_ctl(const struct snd_audient_ctrl_type *ctype, long =
val)
 {
-	return ctype->res ? ctype->min.integer + val * ctype->res : val;
-}
-
-static int snd_ctl_audient_integer_get(struct snd_kcontrol *kctl,
-				   struct snd_ctl_elem_value *ctl_val)
-{
-	struct usb_mixer_elem_info *const elem =3D snd_kcontrol_chip(kctl);
-	struct usb_mixer_interface *const mixer =3D elem->head.mixer;
-
-	const unsigned int nchan =3D snd_audient_kctl_channels(kctl);
-	const unsigned int hwchan =3D snd_audient_kctl_hwchannels(kctl);
-	const struct snd_audient_ctrl_type *const ctype
-						=3D snd_audient_kctl_type(kctl);
-	const u8 base =3D snd_audient_kctl_cidxoffs(kctl);
-
-	int i;
-
-	CLASS(snd_usb_lock, pm)(mixer->chip);
-	if (pm.err < 0)
-		return pm.err;
-	/* serializes the transfers and the cache, also between gets */
-	guard(mutex)(&mixer->lock);
-
-	for (i =3D 0; i < hwchan; i++) {
-		s32 val;
-		int ret;
-
-		ret =3D snd_audient_raw_get_one(elem, ctype, base + i, &val);
-		if (ret =3D=3D -ENODATA)	/* unknown write-only value: minimum */
-			val =3D ctype->min.integer;
-		else if (ret < 0)
-			return ret;
+	s32 ret;
=20
-		ctl_val->value.integer.value[i] =3D
-			snd_audient_int_to_ctl(ctype, val);
-	}
+	if (ctype->res)
+		ret =3D ctype->min.integer + val * ctype->res;
+	else
+		ret =3D val;
=20
-	for (; i < nchan; i++)
-		ctl_val->value.integer.value[i] =3D snd_audient_int_min(ctype);
-
-	return 0;
+	return (u32)ret;
 }
=20
-static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
-				   struct snd_ctl_elem_value *ctl_val)
-{
-	struct usb_mixer_elem_info *const elem =3D snd_kcontrol_chip(kctl);
-	struct usb_mixer_interface *mixer =3D elem->head.mixer;
-
-	const unsigned int hwchan =3D snd_audient_kctl_hwchannels(kctl);
-	const struct snd_audient_ctrl_type *const ctype
-						=3D snd_audient_kctl_type(kctl);
-	const u8 base =3D snd_audient_kctl_cidxoffs(kctl);
-
-	int changed =3D 0;
-	int i;
-
-	for (i =3D 0; i < hwchan; i++) {
-		long val =3D ctl_val->value.integer.value[i];
-
-		if (val < snd_audient_int_min(ctype) ||
-		    val > snd_audient_int_max(ctype))
-			return -EINVAL;
-	}
-
-	CLASS(snd_usb_lock, pm)(mixer->chip);
-	if (pm.err < 0)
-		return pm.err;
-	/* serializes the transfers and the cache, also between gets */
-	guard(mutex)(&mixer->lock);
-
-	for (i =3D 0; i < hwchan; i++) {
-		s32 val =3D snd_audient_int_from_ctl(ctype,
-						   ctl_val->value.integer.value[i]);
-		int ret;
-
-		ret =3D snd_audient_raw_set_one(elem, ctype, base + i, val,
-					      false);
-		if (ret < 0)
-			return ret;
-
-		if (ret)
-			changed =3D 1;
-	}
-
-	return changed;
-}
=20
 /* The item index of a device value, or -EIO if the value is not in the l=
ist */
 static int snd_audient_enum_item(const struct snd_audient_enum *e, u32 va=
lue)
@@ -892,8 +739,9 @@ static int snd_audient_enum_item(const struct snd_audi=
ent_enum *e, u32 value)
 	return -EIO;
 }
=20
-static int snd_ctl_audient_enum_get(struct snd_kcontrol *kctl,
-				    struct snd_ctl_elem_value *ctl_val)
+
+static int snd_ctl_audient_get(struct snd_kcontrol *kctl,
+				       struct snd_ctl_elem_value *ctl_val)
 {
 	struct usb_mixer_elem_info *const elem =3D snd_kcontrol_chip(kctl);
 	struct usb_mixer_interface *const mixer =3D elem->head.mixer;
@@ -904,7 +752,7 @@ static int snd_ctl_audient_enum_get(struct snd_kcontro=
l *kctl,
 						=3D snd_audient_kctl_type(kctl);
 	const u8 base =3D snd_audient_kctl_cidxoffs(kctl);
=20
-	unsigned int i;
+	int i;
=20
 	CLASS(snd_usb_lock, pm)(mixer->chip);
 	if (pm.err < 0)
@@ -912,32 +760,53 @@ static int snd_ctl_audient_enum_get(struct snd_kcont=
rol *kctl,
 	/* serializes the transfers and the cache, also between gets */
 	guard(mutex)(&mixer->lock);
=20
-	for (i =3D 0; i < hwchan; i++) {
-		u32 val;
-		int item;
-		int ret;
+	for (i =3D 0; i < nchan; i++) {
+		u32 buf;
+		long ret;
=20
-		ret =3D snd_audient_raw_get_one(elem, ctype, base + i, &val);
-		if (ret =3D=3D -ENODATA)	/* unknown write-only value: init */
-			val =3D ctype->init;
+		ret =3D snd_audient_raw_get_one(elem, ctype, base + i, &buf);
+		if (ret =3D=3D -ENODATA)	/* unknown write-only value: off */
+			buf =3D ctype->init;
 		else if (ret < 0)
 			return ret;
=20
-		item =3D snd_audient_enum_item(ctype->enumeration, val);
-		if (item < 0)
-			return item;
-
-		ctl_val->value.enumerated.item[i] =3D item;
+		switch (ctype->type) {
+		case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
+			if (i >=3D hwchan)
+				ctl_val->value.integer.value[i] =3D 0;
+			else if (buf =3D=3D ctype->min.integer)
+				ctl_val->value.integer.value[i] =3D false;
+			else
+				ctl_val->value.integer.value[i] =3D true;
+			break;
+		case SNDRV_CTL_ELEM_TYPE_INTEGER:
+			if (i >=3D hwchan)
+				ctl_val->value.integer.value[i] =3D
+					snd_audient_int_min(ctype);
+			else
+				ctl_val->value.integer.value[i] =3D
+					snd_audient_int_to_ctl(ctype, buf);
+			break;
+		case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
+			if (i >=3D hwchan) {
+				ctl_val->value.enumerated.item[i] =3D 0;
+			} else {
+				ret =3D snd_audient_enum_item(ctype->enumeration,
+							    buf);
+				if (ret < 0)
+					return ret;
+
+				ctl_val->value.enumerated.item[i] =3D ret;
+			}
+			break;
+		}
 	}
=20
-	for (; i < nchan; i++)
-		ctl_val->value.enumerated.item[i] =3D 0;
-
 	return 0;
 }
=20
-static int snd_ctl_audient_enum_set(struct snd_kcontrol *kctl,
-				    struct snd_ctl_elem_value *ctl_val)
+static int snd_ctl_audient_set(struct snd_kcontrol *kctl,
+			       struct snd_ctl_elem_value *ctl_val)
 {
 	struct usb_mixer_elem_info *const elem =3D snd_kcontrol_chip(kctl);
 	struct usb_mixer_interface *const mixer =3D elem->head.mixer;
@@ -945,15 +814,28 @@ static int snd_ctl_audient_enum_set(struct snd_kcont=
rol *kctl,
 	const unsigned int hwchan =3D snd_audient_kctl_hwchannels(kctl);
 	const struct snd_audient_ctrl_type *const ctype
 						=3D snd_audient_kctl_type(kctl);
-	const struct snd_audient_enum *const e =3D ctype->enumeration;
 	const u8 base =3D snd_audient_kctl_cidxoffs(kctl);
=20
-	unsigned int i;
+	typeof(ctl_val->value) *const v =3D &ctl_val->value;
+	const struct snd_audient_enum *const e =3D ctype->enumeration;
+
 	int changed =3D 0;
+	int i;
=20
-	for (i =3D 0; i < hwchan; i++)
-		if (ctl_val->value.enumerated.item[i] >=3D e->items)
-			return -EINVAL;
+
+	for (i =3D 0; i < hwchan; i++) {
+		switch (ctype->type) {
+		case SNDRV_CTL_ELEM_TYPE_INTEGER:
+			if (v->integer.value[i] < snd_audient_int_min(ctype) ||
+			    v->integer.value[i] > snd_audient_int_max(ctype))
+				return -EINVAL;
+			break;
+		case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
+			if (v->enumerated.item[i] >=3D e->items)
+				return -EINVAL;
+			break;
+		}
+	}
=20
 	CLASS(snd_usb_lock, pm)(mixer->chip);
 	if (pm.err < 0)
@@ -962,11 +844,25 @@ static int snd_ctl_audient_enum_set(struct snd_kcont=
rol *kctl,
 	guard(mutex)(&mixer->lock);
=20
 	for (i =3D 0; i < hwchan; i++) {
-		const unsigned int item =3D ctl_val->value.enumerated.item[i];
+		u32 val;
 		int ret;
=20
-		ret =3D snd_audient_raw_set_one(elem, ctype, base + i,
-					      e->values[item], false);
+		switch (ctype->type) {
+		case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
+			val =3D v->integer.value[i] ? ctype->max.integer
+						  : ctype->min.integer;
+			break;
+		case SNDRV_CTL_ELEM_TYPE_INTEGER:
+			val =3D snd_audient_int_from_ctl(ctype,
+						       v->integer.value[i]);
+			break;
+		case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
+			val =3D e->values[v->enumerated.item[i]];
+			break;
+		}
+
+		ret =3D snd_audient_raw_set_one(elem, ctype, base + i, val,
+					      false);
 		if (ret < 0)
 			return ret;
=20
@@ -1029,22 +925,8 @@ static int snd_audient_add_ctrl(struct usb_mixer_int=
erface *mixer,
 			   : SNDRV_CTL_ELEM_ACCESS_VOLATILE)
 			| (ctype->tlv ? SNDRV_CTL_ELEM_ACCESS_TLV_READ : 0);
=20
-	switch (ctype->type) {
-	case SNDRV_CTL_ELEM_TYPE_INTEGER:
-		knew.get =3D snd_ctl_audient_integer_get;
-		knew.put =3D snd_ctl_audient_integer_set;
-		break;
-	case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
-		knew.get =3D snd_ctl_audient_boolean_get;
-		knew.put =3D snd_ctl_audient_boolean_set;
-		break;
-	case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
-		knew.get =3D snd_ctl_audient_enum_get;
-		knew.put =3D snd_ctl_audient_enum_set;
-		break;
-	default:
-		return -EINVAL;
-	}
+	knew.get =3D snd_ctl_audient_get;
+	knew.put =3D snd_ctl_audient_set;
=20
 	elem =3D kzalloc_obj(*elem);
 	if (!elem)
=2D-=20
2.56.1

