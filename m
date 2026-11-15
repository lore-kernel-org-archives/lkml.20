Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779055;
	b=Gk++EF8KnXr0sU+XZo1dZq34pBlBWQvdyZa8ct7h42nZ0hZudbEVpYhP/+cerSeA+qZG
	 DDRj8XpFlChbK/rrL6Gwta98WTbJDNX1Yi3JNm2xF8//H2b0uYbkb5L1AarDU+hbJDtRV
	 Ksn9utwdc3Bg2Ip/X+NlewppRC019ZOSL7Aa3cqXEUTY2AXOAuzjdUvw4OEZq55BVGzKa
	 rtui6yZL1MYfg+4yYatcMCYGeBr3sIWExNLh9A2+YczFv1YE0pzFSn3HKIkBSNnrFI+kZ
	 Y8/Y8sx3de/0nxzk8XZ7q5bhH+kS1aCG/UQo+W3Obp3eRbMrj/iGkX5GHLBa6FQCYCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779055;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=fSYna4/B72JkPuwn8GXFwuxHRLSKUU95oFK5u6377Ew=;
	b=wgMY84PNpEVlgcb9nKWkZ/rMBamc2lZa4elwmbuLJc7Wio4DVcGQvuyr/6sOE8Fr7O5C
	 4zD+QgFJQUbEFZ8R5z16uCH90WDQdtdpa5TS9ItDfpExC7SMg/+/dGaBQmH1XlZBjxh0v
	 ywFkYzA6lwtOzV/YT8+ceTwpPrKK8BAMLOPluTbyzzTKCJ6RFD2qIDyEnLMzSRF2vguLJ
	 nrBy8dFFi1ifntcMmicPwAvd7aUGHcngtwj1ZP5CqH25z2coIYWmHkcF5c3NUB3ZYCB5k
	 wnXM5T09CGMQdkJbSSFh9GjUDWv4TfJYbf5zUcMTeC9nIJjA5JhwJRjmCqT3lmD6b5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=iba73RQt;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06EF606A335
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E06EF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=iba73RQt
DKIM2-Signature:  i=1; m=1; t=1794779053;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:m8frVrfxSc9Rqc8SpuUhAQ00qsVy
   FUkNxH3g/qDwZlRNqKU7+HYjplQTUXPm9mZBBgCeO6wkviEw+BSttpj3vZKwE4n/7nwk8O4lpsE
   LQnOSq+6VOho6s9kxIo3m0yWfr45U8rQKFrAbnb5Jr0tTm8hYftqPetx54yM2X2GWghaAlJt4nJ
   FePgOqxPriktmMQnKUxhCkvpLumAU/zNExOj8DrH82ecvjnjyhZ3sYDhgDlbST3kP7uZtGwQUHf
   0/nrpUNaPUCACpOI/iUu2It16KUG29rAVtMVVWEYP9cULPoooFztLVnL6DCR578vw9lAEcDmxYG
   0l1r1bq8WbWLhQ==;
Message-Instance:  m=1;
 h=sha256:
   x3BRTikUMI5Hhn7mIxnraKlIxtpm+EhyV4Wqua5x1G8=:
   bNMi6XRDCVO9sBb5LA4scRbLH2kGMgLBWEXTljA8G8I=,
  sha512:
   ggJPWbMyU7Om3Lr18elw2kCgo2kZZqQ00VySO65l91VRhL3G4z+R1Xv9t4dBVSkfMpbzbOBgzhU5XRZlvM11vw==:
   LBMOByk89ZpA9Xb1QCqkUUvvpCKp5y9wCQ8AtfYSGIbiTnBgtI7DJatblxaYdHJmLVh82qDJYoY2HU5U2+yQZg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779035; x=1795383835; i=arc@gmx.li;
	bh=fSYna4/B72JkPuwn8GXFwuxHRLSKUU95oFK5u6377Ew=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=iba73RQtzhCrqsgw+jHh0RARnWf46TWiegblOdkPqo0dnTv6S4lxNxVNpkPcpgnB
	 IrskJDUGq/cRAvUeTRQypdJM1KGuRhL5acCgzSX3YN2IyO6jwMPatDIrK+ofw1U0k
	 4WanXrZLyw7XuPf8Y5uiAuSJLhHRJrkKCo8R9lqRkJpDKvccS2P+VQ16xH+2uYvQx
	 xlCYlCnUKNaJ+gNycJ3YBgQEnSWp88YnnvvyybKKSH8G+1xPRW+1msXTTg7BKLG6+
	 +eqyvQe2sEiXXVuabH6x8zEY1dXDoJ0Y/Kner7VkPNjWDMv0gQAgnnD4zht12l9TL
	 JBUpDbxqk2oglmWnOw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0oBx-1wZ6aM0ekH-00vGeS; Sun, 15
 Nov 2026 22:43:55 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V4 PATCH 17/19] ALSA: mixer_audient: Fold in the review changes to patches 12-16
Date: Sun, 15 Nov 2026 22:43:34 +0100
Message-ID: <20261115214336.17917-18-arc@gmx.li>
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
X-Provags-ID: V03:K1:KJWU0sIoLRqOgbrWB3nj2UEeJil21SNFpdytwE6TkDydJYcHm1V
 0XhZ2hDjxjR6+CJzMNRAR3emy4SX31RmXvwpepedmWxGqCvvRtVSVEGVRSSrTXz1WmnV53i
 7I52b9ltvSpFdIOruDKpaHryHah6C8mDr4IJMP/iPmCYTyEXzDHNlvG2uJT+BX1Q7jLepxP
 uiWEepBRNcvMU/sAaSXQw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Bgwv6Y/PxlA=;snfrGlrgkZWj+djO8clg6hs0cf8
 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

From: Will Porter <mrwillporter@gmail.com>

This patch is not for merging. It carries the changes from the review
of RFC patches 12 to 16 as one diff, so that the patches after it apply
to the RFC with the enum fix. The next version of the series has these
changes in patches 12, 13, 15 and 16.

- Declare snd_audient_int_max(), snd_audient_int_min() and
  snd_audient_int_from_ctl() inline.
- snd_audient_enum_item() returns the item or -EIO, and get propagates
  the error.
- snd_ctl_audient_info() uses a switch.
- A comment on ID14_ENUM() says that readable enums do not use init.
- The two case labels in mixer_quirks.c share one call.
- Rename the create hook to extra_init and say that it is optional.

Signed-off-by: Will Porter <mrwillporter@gmail.com>
=2D--
 sound/usb/mixer_audient.c | 58 +++++++++++++++++++++++----------------
 sound/usb/mixer_quirks.c  |  2 --
 2 files changed, 34 insertions(+), 26 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index e86f0e1ec4f0..f144fc549c88 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -219,6 +219,11 @@ SND_AUDIENT_ENUM(snd_audient_id14_optical, snd_audien=
t_id14_optical_texts,
 		.sel =3D (sel_),				\
 	}
=20
+/*
+ * A readable enum. It has no cache entry, so a get always reads the devi=
ce
+ * and never uses init. Write-only enums set .init and .flags without thi=
s
+ * macro.
+ */
 #define ID14_ENUM(unit_, sel_, len_, enum_)		\
 	{						\
 		.type =3D SNDRV_CTL_ELEM_TYPE_ENUMERATED,	\
@@ -494,8 +499,8 @@ static const struct audient_devinfo {
 	const struct snd_audient_ctrl *controls;
 	const char *const *const matrix_names;
 	const unsigned int matrix_channels;
-	/* controls the tables cannot describe; called after the tables */
-	int (*create)(struct usb_mixer_interface *mixer);
+	/* optional: controls the tables cannot describe, created after them */
+	int (*extra_init)(struct usb_mixer_interface *mixer);
 } audient_devinfo[] =3D {
 	{
 		.usb_id =3D USB_ID(USB_AUDIENT_VID, USB_EVO4_PID),
@@ -508,7 +513,7 @@ static const struct audient_devinfo {
 		.controls =3D snd_audient_id14_mk1_controls,
 		.matrix_names =3D snd_audient_id14_mk1_matrix,
 		.matrix_channels =3D 2,
-		.create =3D snd_audient_id14_mk1_create,
+		.extra_init =3D snd_audient_id14_mk1_create,
 	},
 	{ 0 } /* sentinel */
 };
@@ -759,13 +764,15 @@ static int snd_ctl_audient_boolean_set(struct snd_kc=
ontrol *kctl,
  * With a step size (res), an integer control counts steps from min:
  * 0 ... (max - min) / res. Without one it shows the device value.
  */
-static long snd_audient_int_max(const struct snd_audient_ctrl_type *ctype=
)
+static inline long
+snd_audient_int_max(const struct snd_audient_ctrl_type *ctype)
 {
 	return ctype->res ? (ctype->max.integer - ctype->min.integer) / ctype->r=
es
 			  : ctype->max.integer;
 }
=20
-static long snd_audient_int_min(const struct snd_audient_ctrl_type *ctype=
)
+static inline long
+snd_audient_int_min(const struct snd_audient_ctrl_type *ctype)
 {
 	return ctype->res ? 0 : ctype->min.integer;
 }
@@ -782,8 +789,8 @@ static long snd_audient_int_to_ctl(const struct snd_au=
dient_ctrl_type *ctype,
 		   snd_audient_int_max(ctype));
 }
=20
-static long snd_audient_int_from_ctl(const struct snd_audient_ctrl_type *=
ctype,
-				     long val)
+static inline long
+snd_audient_int_from_ctl(const struct snd_audient_ctrl_type *ctype, long =
val)
 {
 	return ctype->res ? ctype->min.integer + val * ctype->res : val;
 }
@@ -873,16 +880,16 @@ static int snd_ctl_audient_integer_set(struct snd_kc=
ontrol *kctl,
 	return changed;
 }
=20
-static unsigned int snd_audient_enum_item(const struct snd_audient_enum *=
e,
-					  u32 value)
+/* The item index of a device value, or -EIO if the value is not in the l=
ist */
+static int snd_audient_enum_item(const struct snd_audient_enum *e, u32 va=
lue)
 {
 	unsigned int item;
=20
 	for (item =3D 0; item < e->items; item++)
 		if (e->values[item] =3D=3D value)
-			break;
+			return item;
=20
-	return item;	/* e->items: not in the list */
+	return -EIO;
 }
=20
 static int snd_ctl_audient_enum_get(struct snd_kcontrol *kctl,
@@ -906,8 +913,8 @@ static int snd_ctl_audient_enum_get(struct snd_kcontro=
l *kctl,
 	guard(mutex)(&mixer->lock);
=20
 	for (i =3D 0; i < hwchan; i++) {
-		unsigned int item;
 		u32 val;
+		int item;
 		int ret;
=20
 		ret =3D snd_audient_raw_get_one(elem, ctype, base + i, &val);
@@ -917,8 +924,8 @@ static int snd_ctl_audient_enum_get(struct snd_kcontro=
l *kctl,
 			return ret;
=20
 		item =3D snd_audient_enum_item(ctype->enumeration, val);
-		if (item >=3D ctype->enumeration->items)
-			return -EIO;
+		if (item < 0)
+			return item;
=20
 		ctl_val->value.enumerated.item[i] =3D item;
 	}
@@ -976,22 +983,25 @@ static int snd_ctl_audient_info(struct snd_kcontrol =
*kctl,
 	const struct snd_audient_ctrl_type *const ctype
 						=3D snd_audient_kctl_type(kctl);
=20
-	if (ctype->type =3D=3D SNDRV_CTL_ELEM_TYPE_ENUMERATED)
-		return snd_ctl_enum_info(uinfo, snd_audient_kctl_channels(kctl),
+	switch (ctype->type) {
+	case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
+		return snd_ctl_enum_info(uinfo,
+					 snd_audient_kctl_channels(kctl),
 					 ctype->enumeration->items,
 					 ctype->enumeration->texts);
-
-	uinfo->type =3D ctype->type;
-	uinfo->count =3D snd_audient_kctl_channels(kctl);
-
-	if (ctype->type =3D=3D SNDRV_CTL_ELEM_TYPE_BOOLEAN) {
+	case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
 		uinfo->value.integer.min =3D 0;
 		uinfo->value.integer.max =3D 1;
-	} else {
+		break;
+	default:
 		uinfo->value.integer.min =3D snd_audient_int_min(ctype);
 		uinfo->value.integer.max =3D snd_audient_int_max(ctype);
+		break;
 	}
=20
+	uinfo->type =3D ctype->type;
+	uinfo->count =3D snd_audient_kctl_channels(kctl);
+
 	return 0;
 }
=20
@@ -1282,8 +1292,8 @@ int snd_audient_controls_create(struct usb_mixer_int=
erface *mixer)
 		}
 	}
=20
-	if (info->create)
-		return info->create(mixer);
+	if (info->extra_init)
+		return info->extra_init(mixer);
=20
 	return 0;
 }
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index f06839b89fe1..c68aa6f17e45 100644
=2D-- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4781,8 +4781,6 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixe=
r_interface *mixer)
 		break;
=20
 	case USB_ID(USB_AUDIENT_VID, USB_EVO4_PID): /* Audient EVO 4 */
-		err =3D snd_audient_controls_create(mixer);
-		break;
 	case USB_ID(USB_AUDIENT_VID, USB_ID14_MK1_PID): /* Audient iD14 MkI */
 		err =3D snd_audient_controls_create(mixer);
 		break;
=2D-=20
2.56.1

