Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579597;
	b=413M2MCvz5P3hUQlvkgI/3U/rY64QxNNEX5ELJJeRjItND/R8BkR9/DKUwFMxaNUxVR7
	 GinhclkxYG3rtt9b8T/KWomSY+CWZAHGU6YvpL1SSTYYT6i9VIXP+gcQqZj426mR1KAlo
	 7zniHICxxAYAYOY+oxeGSCNxrWeotYHP1V8eNtow5qyGamPy9abnAqGosFVlReJhom/kM
	 To8Y6LsYPasA963GjXWTM7sX5/n6XajcnttQ8ta6JiLaxz+ibgkvSzyrTxl7cPo4iU86h
	 gelvBmsYQL8tdxBKaFNWaseK2+Sv9jUsvDWNLH1TTAiz94+6dqsjlga+f1b5DJbfgGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579597;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=8Ln8a6B5JWVgO2SdI7+XPcEjNg0Whvfeh4x4YBBJr4o=;
	b=s8tbfq37Ec6GqQgUyryLlPao030Gaed6MkzbhhbUm7zZX8saA+CVWygD1kvCypwMs/EF
	 X2Pf9eNeLa/RW6OMEi90mffg5OvV29nt27vAPh54irNECo/ESp3fsTNIPSs9n1A0is4Ay
	 yaTRiWb3BCp+Ko6Ru/xVSTSU1dKvExY4DcBdOGhQ9kdbFYSWQ2VuKwNAgu+mzZQAREGy1
	 bH/r5/HnqwsBRnwRjwYffvSxWIdRPOSBhz944O8zVqqTfM6N1ymnTyqA0omI/diXRvKsR
	 VBPH5iUVJWVCinhXrxAg6ACMKzvFdiAYiPGf69jK6mwqktNHixyp77AHzZaVIPyIQNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=HBpN+gKB;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9156606A330;
	Mon,  2 Nov 2026 00:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9156606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=HBpN+gKB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793579589; x=1794184389; i=arc@gmx.li;
	bh=8Ln8a6B5JWVgO2SdI7+XPcEjNg0Whvfeh4x4YBBJr4o=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HBpN+gKBzrsk8XVwVKBColn1oUbb2pmmrCgKTFBZeuzDLmb8WkgMdDmpTd9OdEg7
	 k/MNEnq6SjRJbAbOWa5OItX3lYu523JxX87M4xCQzshYxzuXlWS/Mk5p/TXuRwZH9
	 HRICl4/1g4NxfYUFOafqTCjxRv8ie2ULDlD6SmHZ9Vqq831/4pUaX4VW1Gv6eE/Y2
	 MPG6AapsryApIibsNaxIDoCUhEe76OCv6+t9kKFEukTvqpCbv1t4Bh8GBNu6CD9i0
	 oDh+Lv69X7dLJyJfDPOWAG+UTGLF5D50pRTwSiOr1YrOf8Gcxrj9Mkn8t0fqv1gsS
	 TShhGtiXFVVqkPBB/w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mg6Zq-1wtGeY43qQ-00ZjWG; Mon, 02
 Nov 2026 01:33:09 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V2 PATCH 10/11] ALSA: mixer_audient: add control value caching
Date: Mon,  2 Nov 2026 01:32:56 +0100
Message-ID: <20261102003257.10134-11-arc@gmx.li>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102003257.10134-1-arc@gmx.li>
References: <20261101173557.221869-1-mrwillporter@gmail.com>
 <20261102003257.10134-1-arc@gmx.li>
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
X-Provags-ID: V03:K1:KWoZoDoQ4Z5ZZilivkhElRcCkr4Qkxo4l8oa4KvBPqlgOipuS/G
 hqfaIyNCx6/bxHSPMGtOwlC2t3flUJARV2ksaTnlNHRd5m+aCxyZOpSoe/rEBWzz3XB3uvP
 bM6+N2bAkeMaR0TwpQb8xPrqIg2zTwy3yDL4q6z98zKM7118+f6WO3V+wqGeN2WNy5j27Jm
 S3632EkXaoer7OR+Q+Kow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tY8H0d10Bj8=;5754dbGKVV8WkWTVtMO01xp0Fbl
 fJmWxF5JLrnmbeAMojoJ+lIK0dD4yQ7CzfhcmH5FGWCF0TR2LYAe/x2k9KqdvTUdrjlNXjWDE
 FSdyzfRxdkAWBMVLn4TjN+QY7vtzto4yBneWgtUnfbvUdsukw7gNbYUUpo1Kehld+Dv2II0HS
 DF4xr64rfqILzVSf1WJc9r/FKzaZYQSzC6fMx+obT9CeRfM4PwwkqaU9W7tYzU6HET7BDPQIt
 RtIhYV7HBuVblVcWOEOD0rI974IQsWbv7v00t37kvf7Hh2VJsmyHlkQDW1XCtUQ4QKW/M8R/v
 GwS9PwN5/cTzxw/rpWkJjs+7Dd3OeirbgQBayoE4NpIFo5r4AtVYHn/Ls6EM8Tp/nOSoLL/u6
 CowKFbQXN9pNrO+QKQQFY0r29JvinYEIeBcwa9en4E4CbE/Ip9xeokJVIEGa/5loODxoNJe8s
 4kG4puWX/Z4atFRrRxeDFasFAZyh73fw/XEKRcsLaPUEgkO+vzHgN3b5aJzXqW4lktLhP9hbJ
 +U4NZ4ceje4usd/xphOX933XEbU9ONNUgf/04Z2ZHfEs9gMtjwpIg48P25mT2RavRqGgaqbYg
 SgX8lWra2RRzIILk4aYdUCdB9+dqY5iZREDb6MBls0Ta+yynKjEB28kyHqyyfGwMmJqLW9IOQ
 Jzcm05GbM+Gz5x08r+V+ltR0EZzqFBMUj/mC/tGuqTpIqOHIlOBvNcI3zZ3z8on4Db8KiDKTg
 VExHwrLkF2BJShpLLZnrhGkacow6f41RsDicMmLMmuA4kB8Kso02mubLDhLM39ihMUkcLU4//
 z5uCheQ0OUZrC4Po2fSZAEaXDjJxLRhjduJcxFE0VJNbqdXrS3z+uAZjy5FT0fuxX4uGNF+4x
 wG2EIbsKtk6r/8Z/NeyUmUYQWXykszM32D6Nk3rYGjnH+PqdEKTnmC6aioKTSnzvgjrbtpAcJ
 jAumjOwK6Qr4TMmVUeTJjdURqe/EpbKu5FBglRQMCZRIWvEw7WqxB1gceCt1j7cQ10U8vC+q1
 KnNJXrAoZfEL3XNkOvlpKxRXhRk7enHzyukJoQoiGj/n+0Lsbj/X3m1rErC5CImP/zBGhq+NP
 +AfVK590VGr4I3z8BFPqIgI+F2Y+vt2Zn4BX8nDIZ81ZqPa1fwEzChmbROQjMGwxJQOSgaotS
 7gMnBjT47cGHUfNEwZe/KpSGB7dqmIfhWrzQ8P1GjSdrScXKyIXUIHmPw2AlT8DUPv8M+PJXN
 ERou0JKW03BEZ+dRtegT7fp3hRPt0ht2wL22vRo7wMb43AaWiDBenh9ZyruYvZle0vw9G5nZe
 6WaBGwvt0660OC+5iWzp9Wgc1PIwkgZlq+C3tndzooWtDCt/4aUPFdy3FRH0N5YqFvBbE+UMF
 k5Sd3dznIz0bhvaws0Ac++HuPY3gP0sGVjL348eKqnQDJHqHynipXKk+lIOxfMFlQrp/sN8Ph
 GUUortlmuy8e/P21mpoWLJyd/JWjBE6E/Xb8XsTIFT/GbCe2hcJ+7LKEKkiPi6WJXRz/DOczS
 rsHZkGJ0kjMvsnbZgnOOuk+gDat+cUGqdkUjwWbfJugCIFdkm7RBZUd0yrH/BX9hZbfbktnry
 d9VmNXlCdqdyhRVnvgLPaX6JCbKmy+ALihjkEmdP6EQJB2XO+y1PKS7Gzl3EEMyQSWZFUe3PD
 28QuvutsOr11lfZXbqHT0IlXuP3QdauWLRURv1r7xbqRC7hIRGF+gcIh4lrmA8sPHasLaquaQ
 /swgdKioh2WAiLO51VvCE+BnPKqwxCdONLg6y+XgYuz1CQ+SsvuzSBUQFb139aZDgWk7NTdUy
 TUezR0CPeW6F9JcccQuYpSdziBEWxbCk34sgm3KG5WKgoDZF9RLmN5RFBJ8rOn9hlV1KuGZre
 LFlLlbWqP9OB55M3vdujKK3QzNxpr1YLvOfhNwlRXQh/ue7FeZB58LG2gjws5n+Y8r0vI0/IJ
 IIlse36g9a+7Lomth3JIUVoXbb0xMMCaE2eW63eAEoQICvPqlKs3br8Ovk0j3E33qiGYj7j9z
 9TmNDlaYDA8zlXjzeCkP7fxVslzcL/2TXWV2mru3cjVU+wm5F+hjeG+y84o6ND70Haml/UVWT
 gbr5aMytRfnLksdZKoI+1w3gpLsKYda8wxplfjzrhSM95OebPqFA5M+dEDaY/JKrUtEaWo8JK
 2uJUmkhd4zhhxl1sBf7jXWy9glSO7UCoUylvR9TpnArjr5CHTCOGrqmoySj+HfOML4wx90e3k
 5ckchzQuKs+lFiM9wAL5Jba9f6PzRWoH3lmVtgSHuYTVFMkQDzxyTC8LieRuy4OdqxDRpKNzo
 gVxnelUrhilUZjHfLtksXoR8ZQYE4uZQh9SN29MDZYn/VOZewBFDXw7sgZipDUZmyLirvBCIT
 WzKQ8cl8eJj6pmzn3DoDj5ukmGMGNRUSBweaymawOQioL/b/xIETZk6eqnlRkR+G137/3ZkNt
 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
 5SutmqJ87cpQH9BlZGf4WDAEzB+4RsI=

In preparation of id14 support, add control value caching.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Co-developed-by: Will Porter <mrwillporter@gmail.com>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
Assisted-by: Claude:claude-opus-5-5
=2D--
 sound/usb/mixer_audient.c | 186 ++++++++++++++++++++++++++++++--------
 1 file changed, 150 insertions(+), 36 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index f61f9fe61345..856fb669af3f 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -40,6 +40,7 @@ static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_=
mixer, -12800, 600);
 #define SND_AUDIENT_CTYPE_FLAGS_SIGNED		BIT(0)
 #define SND_AUDIENT_CTYPE_FLAGS_INIT_HW		BIT(1)
 #define SND_AUDIENT_CTYPE_FLAGS_FORCE_SET	BIT(2)
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
@@ -238,6 +240,26 @@ static inline u16 snd_audient_kctl_channels(struct sn=
d_kcontrol *kctl)
 	return info->channels;
 }
=20
+/*
+ * A cached value is valid once a transfer confirmed it: a read, or a wri=
te
+ * that succeeded. A probe transfer that fails leaves it invalid. CACHE |
+ * FORCE_SET without INIT_HW keeps the earlier behaviour: the init value =
is
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
+	struct snd_audient_cache_entry *const cache =3D elem->private_data;
+
+	return cache ? cache + i : NULL;
+}
+
=20
 #define AUDIENT_REQTYPE_SET (USB_DIR_OUT | USB_TYPE_CLASS \
 					 | USB_RECIP_INTERFACE)
@@ -287,12 +309,26 @@ static inline int snd_audient_set_cur(struct usb_mix=
er_interface *mixer,
=20
 static int snd_audient_raw_get_one(struct usb_mixer_interface *const mixe=
r,
 			const struct snd_audient_ctrl_type *const ctype,
+			struct snd_audient_cache_entry *const slot,
 			const u8 cidx, u32 *const value)
 {
 	int ret;
 	__le32 buf =3D 0;
 	s32 val;
=20
+	if (slot && slot->valid) {
+		*value =3D slot->value;
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
 	ret =3D snd_audient_get_cur(mixer, ctype, cidx, &buf);
 	if (ret < 0)
 		return ret;
@@ -304,43 +340,58 @@ static int snd_audient_raw_get_one(struct usb_mixer_=
interface *const mixer,
=20
 	*value =3D val;
=20
+	if (slot) {
+		slot->value =3D val;
+		slot->valid =3D true;
+	}
+
 	return ret;
 }
=20
 static int snd_audient_raw_set_one(struct usb_mixer_interface *const mixe=
r,
 			const struct snd_audient_ctrl_type *const ctype,
-			const u8 cidx, const u32 value)
+			struct snd_audient_cache_entry *const slot,
+			const u8 cidx, const u32 value,
+			bool force)
 {
 	int ret;
 	u32 val;
=20
-	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET) {
+	if (force) {
 		val =3D !value;		/* just make it different */
 	} else {
-		ret =3D snd_audient_raw_get_one(mixer, ctype, cidx, &val);
-		if (ret < 0)
+		ret =3D snd_audient_raw_get_one(mixer, ctype, slot, cidx, &val);
+		if (ret =3D=3D -ENODATA)	/* FORCED_SET and not cached yet */
+			val =3D !value;	/* just make it different */
+		else if (ret < 0)
 			return ret;
 	}
=20
-	if (val !=3D value) {
+	force =3D force || (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET);
+
+	if (force || (val !=3D value)) {
 		__le32 buf =3D cpu_to_le32(value);
=20
 		ret =3D snd_audient_set_cur(mixer, ctype, cidx, &buf);
 		if (ret < 0)
 			return ret;
=20
-		return 1;
+		if (slot) {
+			slot->value =3D value;
+			slot->valid =3D true;
+		}
+
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
@@ -353,13 +404,19 @@ static int snd_ctl_audient_boolean_get(struct snd_kc=
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
+		ret =3D snd_audient_raw_get_one(mixer, ctype,
+					      snd_audient_cache_slot(elem, i),
+					      base + i, &buf);
+		if (ret =3D=3D -ENODATA)	/* unknown write-only value: off */
+			buf =3D ctype->min.integer;
+		else if (ret < 0)
 			return ret;
=20
 		ctl_val->value.integer.value[i] =3D (buf =3D=3D ctype->min.integer)
@@ -375,8 +432,8 @@ static int snd_ctl_audient_boolean_get(struct snd_kcon=
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
@@ -389,13 +446,17 @@ static int snd_ctl_audient_boolean_set(struct snd_kc=
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
+		ret =3D snd_audient_raw_set_one(mixer, ctype,
+					      snd_audient_cache_slot(elem, i),
+					      base + i, buf, false);
 		if (ret < 0)
 			return ret;
=20
@@ -409,8 +470,8 @@ static int snd_ctl_audient_boolean_set(struct snd_kcon=
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
@@ -423,13 +484,19 @@ static int snd_ctl_audient_integer_get(struct snd_kc=
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
+		ret =3D snd_audient_raw_get_one(mixer, ctype,
+					      snd_audient_cache_slot(elem, i),
+					      base + i, &val);
+		if (ret =3D=3D -ENODATA)	/* unknown write-only value: minimum */
+			val =3D ctype->min.integer;
+		else if (ret < 0)
 			return ret;
=20
 		if (val < ctype->min.integer)
@@ -450,8 +517,8 @@ static int snd_ctl_audient_integer_get(struct snd_kcon=
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
@@ -471,12 +538,16 @@ static int snd_ctl_audient_integer_set(struct snd_kc=
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
+		ret =3D snd_audient_raw_set_one(mixer, ctype,
+					      snd_audient_cache_slot(elem, i),
+					      base + i, val, false);
 		if (ret < 0)
 			return ret;
=20
@@ -517,6 +588,8 @@ static int snd_audient_add_ctrl(struct usb_mixer_inter=
face *mixer,
 	struct snd_kcontrol *kctl;
 	struct usb_mixer_elem_info *elem;
=20
+	int ret;
+
 	knew.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER;
 	knew.name =3D ctrl->name;
 	knew.info =3D snd_ctl_audient_info;
@@ -524,7 +597,9 @@ static int snd_audient_add_ctrl(struct usb_mixer_inter=
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
@@ -540,36 +615,75 @@ static int snd_audient_add_ctrl(struct usb_mixer_int=
erface *mixer,
 		return -EINVAL;
 	}
=20
+	elem =3D kzalloc(sizeof(*elem)
+		       + ((ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE)
+			  ? (sizeof(struct snd_audient_cache_entry)
+			     * ctrl->hwchannels)
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
+	/*
+	 * A failed probe transfer must not fail the card: warn and keep the
+	 * control. Its cache entry stays invalid, so a readable control reads
+	 * the device again on its next get, and a write-only control shows an
+	 * unknown value until a put succeeds.
+	 */
 	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_INIT_HW) {
 		int i;
=20
 		for (i =3D 0; i < ctrl->hwchannels; i++) {
-			int ret =3D snd_audient_raw_set_one(mixer, ctype,
-							  ctrl->val_offs + i,
-							  ctype->init);
+			ret =3D snd_audient_raw_set_one(mixer, ctype,
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
-	elem =3D kzalloc_obj(*elem);
-	if (!elem)
-		return -ENOMEM;
+	} else if (elem->private_data) {
+		struct snd_audient_cache_entry *const cache =3D elem->private_data;
+		int i;
=20
-	elem->head.mixer =3D mixer;
-	elem->channels =3D ctrl->channels;
+		for (i =3D 0; i < ctrl->hwchannels; i++) {
+			if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET) {
+				cache[i].value =3D ctype->init;
+				cache[i].valid =3D true;
+				continue;
+			}
+
+			ret =3D snd_audient_raw_get_one(mixer, ctype, cache + i,
+						      ctrl->val_offs + i,
+						      &cache[i].value);
+			if (ret < 0)
+				usb_audio_warn(mixer->chip,
+					       "%s: cannot read channel %d (%d)\n",
+					       ctrl->name, i, ret);
+		}
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

