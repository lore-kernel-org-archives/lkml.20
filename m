Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779035;
	b=p29ITJ4pS6dWjINgJfqHzbSsejhntdgDuSEJrKnKUdAqi5iznaYHq3GhdwatvU0vyInQ
	 2bIkrMZmV5lbTKziSOW6kWhYNy+sG5OOuuVuIEGxGKeFM0ZucFLxuKMY8mnrhwIA8yL7x
	 l93rEp9c1c0AmYTvuUFd/aO0uPfjdex5W+PLCr2oHk2Qpo73L99sLTjGGG3cXlll2bOht
	 6IZcPTcQEeXspGtCpPVabV6dbc09A/lc1v4YtsUWGtVc+IiJhJSz2Ue5dEo9AxF3HPYgE
	 bssIteCQ3HhjQNIwUIF/7b+q3GWUoQ0395rWmreYQWZ/M7gIRzmJhg63amVfQIVNpnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779035;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=+gTPawPTbZSOkDNmYASs4ciZUvLkt4qhlXR4iJCnUEw=;
	b=YGgezcOBKds9USOmft5AjsQj73lsdPlx1ih7f2Mob2FxrSAtt3wlUkzN8oazpX5cfhUv
	 TEp48izV/4BOdljSgikgIbvRG0nuUcyVnANjBYVACFRtnbxYBTusF2fXWleWudlY2TLbx
	 FtSsxGkDK3BjJmjB4FMmRkdRKtH3rgoCzUvrUwToCk8RDuT4eaK2cpudG7zzcrL+ny43J
	 ah0pxNFJA3kflxb8dfYYl2/QNnAGLJmmCi8yokPE2P09NhILpRg3BwlX9LMFyjAhaCgyo
	 7bxkFD9VUhfbowdtVCgnGEEVPqZHAWMvXjbWvykklXS8f3SlI+nTxNpbEc0PGwJgCtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b="gg/vGmNR";
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DC7606A8AE
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42DC7606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=gg/vGmNR
DKIM2-Signature:  i=1; m=1; t=1794779032;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:oGhkgWl4UvR19jWuhnTkw3Ygi45F
   jGcciVy/AeWORmHzWnOsuu/JXy4rqFliVqjV6CrmU2AQu8OYbIdGwOpD3dmDC1kyrN+SY+P5HdO
   i1V8Uf3cYFr7EgljqRvAgQ1swxB2Jh8taEcz/Nb8U1eyOGf6oH9gO/uALEh6gXcUlHMTgBEV6or
   hnO0zxmuV7xkcxlXH/R8odLcml1ljcmMmoP0VEgyRLHOZ4jgN37W+Q13mD2xpuLQ+WeKw6cYX78
   dbMUwOJTRjNDCd20T2X07UR9szuIY8AekK+QEZCqkw2NlDsgRViKsHHc/4lnDX5o6HUC7fz53F4
   ORyYKzryR1yMYw==;
Message-Instance:  m=1;
 h=sha256:
   Bweecb9ITxl+xfZIzMUwl9kzibQQockkGHtour5PB8Q=:
   FCkz4egjxu5Msb5x5yqxDOMNg5DYMz3zcIvqe6+1oOE=,
  sha512:
   h06S7w26uKiAmb8Jfx5VZGSs+7TPXIGLLXM2t/c/chk6IWIpzARQKxy/Kd8qJKuUk91EP5Ni2jzQqY1XdEJ5Zw==:
   I8PfQJlsKx49eHt/0j3ZqsLUxUuF1jf1RBfcGM2oAaT3tIiHjaD9L60Vv/JZU1g/aZrMi77c9WUaZoLvi5/gXA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779031; x=1795383831; i=arc@gmx.li;
	bh=+gTPawPTbZSOkDNmYASs4ciZUvLkt4qhlXR4iJCnUEw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gg/vGmNRURatiiZQjztZYdDbXvQpViWo2cCSJwyp7PzeHSBeAS1dyZ7dFH6B9oPW
	 oe77yVUFS/j+3gVvUFayLi9iJ9Nn3Kw+ip6xSmPPruJWfrcqETTVdZMWS+ZQ+MnHY
	 8GI3qeSP0BYPIWB4aFOV7bbWQtPXDgdUihGLFix30IiquHbu9DSgcMp+JR+XE9h1f
	 ZRthwnxfIwOtzyHXn2tK4WBoIogGDvzKT/7aE1Qs5IwSpzwBgQHmTeIYzTPE7IUMM
	 QpI6YQU6wS1PTfP1o1lf4hzX2Lx+KWTSC+2h0uL4RueVx3BSSbGdCAlz4+V4Y82mE
	 VZXEJy9fnfOdhxY2Jg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPogF-1x6WBw2Orj-00NrVg; Sun, 15
 Nov 2026 22:43:51 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V4 PATCH 13/19] ALSA: mixer_audient: Add enumerated controls
Date: Sun, 15 Nov 2026 22:43:30 +0100
Message-ID: <20261115214336.17917-14-arc@gmx.li>
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
X-Provags-ID: V03:K1:Zu3Esft0tml7tB4FqLf3OcGJS93Xg1eKzMe8kSBdcQ6ypzC+kQB
 iNANfPIs9azEG2sjgYKXbb5MerzHWm5Kup3uD25j87zoRfmplaZHOk8TQV8K0jiJVXIJua5
 ANWRpUHxMxxqVV6hGyip4R/ulWu3iLKIDGsuc2OYOReF2n2xXPoh76ZfhPahbFrCl7wr9ki
 RJrsaSotznlGInmcYdzxg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EdNCd2vVYs4=;pc9MSKPByh43KqOFFlf5hrE5IMo
 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
 otnhK66D6KDnQofLWWyXHg=

From: Will Porter <mrwillporter@gmail.com>

The iD14 has selectors with a fixed set of device values: output
routing, mono mode, the iD key function, talkback source and the
digital input mode. Add an enumerated control type with a value list.

The item list has one item more than the values. A put cannot select
it. A get shows it for a device value outside the list, so a value set
by other means stays visible as such, not as a wrong item, and for a
write-only value that no write has confirmed.

Signed-off-by: Will Porter <mrwillporter@gmail.com>
=2D--
 sound/usb/mixer_audient.c | 126 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 771a45cf6b45..2e1d4809645f 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -42,6 +42,25 @@ static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv=
_mixer, -12800, 600);
 #define SND_AUDIENT_CTYPE_FLAGS_GET_BROKEN	BIT(2)
 #define SND_AUDIENT_CTYPE_FLAGS_CACHE		BIT(3)
=20
+/*
+ * An enumerated control: item i sends values[i]. A get of a device value
+ * outside the list returns -EIO; it does not show a wrong item.
+ */
+struct snd_audient_enum {
+	const char *const *texts;
+	const u32 *values;
+	unsigned int items;
+};
+
+#define SND_AUDIENT_ENUM(name, texts_, ...)				\
+	static const u32 name##_values[] =3D { __VA_ARGS__ };		\
+	static const struct snd_audient_enum name =3D {			\
+		.texts =3D texts_,					\
+		.values =3D name##_values,				\
+		.items =3D ARRAY_SIZE(name##_values),			\
+	};								\
+	static_assert(ARRAY_SIZE(texts_) =3D=3D ARRAY_SIZE(name##_values))
+
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
 	unsigned long flags;
@@ -54,6 +73,7 @@ static const struct snd_audient_ctrl_type {
 	} max;		/* for booleans holds physical int value for true */
 	u32 init;	/* hardware and cache are initialized to this value */
 	unsigned int res;	/* integers: device units per control step, 0 =3D 1 */
+	const struct snd_audient_enum *enumeration;
 	const unsigned int *tlv;
 	u8 unit;
 	u8 sel;
@@ -537,12 +557,114 @@ static int snd_ctl_audient_integer_set(struct snd_k=
control *kctl,
 	return changed;
 }
=20
+static unsigned int snd_audient_enum_item(const struct snd_audient_enum *=
e,
+					  u32 value)
+{
+	unsigned int item;
+
+	for (item =3D 0; item < e->items; item++)
+		if (e->values[item] =3D=3D value)
+			break;
+
+	return item;	/* e->items: not in the list */
+}
+
+static int snd_ctl_audient_enum_get(struct snd_kcontrol *kctl,
+				    struct snd_ctl_elem_value *ctl_val)
+{
+	struct usb_mixer_elem_info *const elem =3D snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *const mixer =3D elem->head.mixer;
+
+	const unsigned int nchan =3D snd_audient_kctl_channels(kctl);
+	const unsigned int hwchan =3D snd_audient_kctl_hwchannels(kctl);
+	const struct snd_audient_ctrl_type *const ctype
+						=3D snd_audient_kctl_type(kctl);
+	const u8 base =3D snd_audient_kctl_cidxoffs(kctl);
+
+	unsigned int i;
+
+	CLASS(snd_usb_lock, pm)(mixer->chip);
+	if (pm.err < 0)
+		return pm.err;
+	/* serializes the transfers and the cache, also between gets */
+	guard(mutex)(&mixer->lock);
+
+	for (i =3D 0; i < hwchan; i++) {
+		unsigned int item;
+		u32 val;
+		int ret;
+
+		ret =3D snd_audient_raw_get_one(elem, ctype, base + i, &val);
+		if (ret =3D=3D -ENODATA)	/* unknown write-only value: init */
+			val =3D ctype->init;
+		else if (ret < 0)
+			return ret;
+
+		item =3D snd_audient_enum_item(ctype->enumeration, val);
+		if (item >=3D ctype->enumeration->items)
+			return -EIO;
+
+		ctl_val->value.enumerated.item[i] =3D item;
+	}
+
+	for (; i < nchan; i++)
+		ctl_val->value.enumerated.item[i] =3D 0;
+
+	return 0;
+}
+
+static int snd_ctl_audient_enum_set(struct snd_kcontrol *kctl,
+				    struct snd_ctl_elem_value *ctl_val)
+{
+	struct usb_mixer_elem_info *const elem =3D snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *const mixer =3D elem->head.mixer;
+
+	const unsigned int hwchan =3D snd_audient_kctl_hwchannels(kctl);
+	const struct snd_audient_ctrl_type *const ctype
+						=3D snd_audient_kctl_type(kctl);
+	const struct snd_audient_enum *const e =3D ctype->enumeration;
+	const u8 base =3D snd_audient_kctl_cidxoffs(kctl);
+
+	unsigned int i;
+	int changed =3D 0;
+
+	for (i =3D 0; i < hwchan; i++)
+		if (ctl_val->value.enumerated.item[i] >=3D e->items)
+			return -EINVAL;
+
+	CLASS(snd_usb_lock, pm)(mixer->chip);
+	if (pm.err < 0)
+		return pm.err;
+	/* serializes the transfers and the cache, also between gets */
+	guard(mutex)(&mixer->lock);
+
+	for (i =3D 0; i < hwchan; i++) {
+		const unsigned int item =3D ctl_val->value.enumerated.item[i];
+		int ret;
+
+		ret =3D snd_audient_raw_set_one(elem, ctype, base + i,
+					      e->values[item], false);
+		if (ret < 0)
+			return ret;
+
+		if (ret)
+			changed =3D 1;
+	}
+
+	return changed;
+}
+
 static int snd_ctl_audient_info(struct snd_kcontrol *kctl,
 			    struct snd_ctl_elem_info *uinfo)
 {
 	const struct snd_audient_ctrl_type *const ctype
 						=3D snd_audient_kctl_type(kctl);
=20
+	if (ctype->type =3D=3D SNDRV_CTL_ELEM_TYPE_ENUMERATED)
+		return snd_ctl_enum_info(uinfo, snd_audient_kctl_channels(kctl),
+					 ctype->enumeration->items,
+					 ctype->enumeration->texts);
+
 	uinfo->type =3D ctype->type;
 	uinfo->count =3D snd_audient_kctl_channels(kctl);
=20
@@ -590,6 +712,10 @@ static int snd_audient_add_ctrl(struct usb_mixer_inte=
rface *mixer,
 		knew.get =3D snd_ctl_audient_boolean_get;
 		knew.put =3D snd_ctl_audient_boolean_set;
 		break;
+	case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
+		knew.get =3D snd_ctl_audient_enum_get;
+		knew.put =3D snd_ctl_audient_enum_set;
+		break;
 	default:
 		return -EINVAL;
 	}
=2D-=20
2.56.1

