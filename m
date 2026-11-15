Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779040;
	b=DR8eDwIzUM3wEPzEl9wzJpsPb++N1hZn0+pk19h8FVK5rqP0wjZb8PzBza4Nt17DgbM9
	 BI0nouX/sBRjJxJBhOjjVZYacQ6ZKSUnEI1UOEF9ZBxriz+ef8a0a9em1Ocd2n0+5RYbP
	 XKeKk2wyI0qdUITkaQU/ADvIeT0TroTg05mGdPlxrP/Z3vcw/lXYMbX9Hmp6T7qwwR5Yu
	 C4P69SoOu4gDiI1ScjhbT/2RoLoo4va/eHh3i1WAVxgWaWCMmLHyRA2UF4flFIh1tk+rK
	 o7ZJ3FfwJnsxJvoWOzmixUck64fXj5eYpGE//oDPmyr08ouV2UPqAYvG0UStdjkKGLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779040;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=Z/TG298ncROM96Lh28rZS8wjaoI3ZwlIrqYdNmU0z44=;
	b=KSELGRiFD3nvLmIJpli5HyeTN/Ynb25IHfUmGNSZJryz26AoHpeA2GoWXjFJHUok2SWo
	 +YWa1qs5VLAUoco1Aq9hkWNmYNWE293zqQiK8rWLsNNgozuBinCuHkhSROoLawUMhtnLy
	 sygbb7BBC0bbWfBw3QXwlUAx+BVZwvD7wJbs+XdpgofXSr6o+YbWOlvFGWGCHDl7blf9x
	 htDYYJ6LXqeGfrXIJXbv93MJocR3iZm/lgBl8SiujC8grQSLsTqR4feeHhme34z7rX9EP
	 KKPCX6orq3NQI2OfDTXaLTcsGuukECsiviSYFcBa2utinxnuLX4n7dSEgUj1U0LH1Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=Q772SxYq;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A6360A3811
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30A6360A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=Q772SxYq
DKIM2-Signature:  i=1; m=1; t=1794779037;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:k6Aj+H7mk70QHyni5Kmp7qQxKc2x
   4lwR1s1M4/+rc/NbernKb5jGMIBnZsKn9Ovtdb6Qls3P8eN3TprKBrTTBw5YXY1BKMMjSeqg34C
   t3jvNyqUO8oSFzQa0F5hTGlkcD89VOqeEQnn7uEOPpIvzvveZCgThUsAS7JdyC+e+3ZPja0c9Tn
   GvN7K9XWBTMnu/NRLBjr69UWjgG3HpeA21eiPNEEPZJ8yDGp1wrCVcCMGY57YQ0qGzAR8uVtunr
   A8L4h71l1hhl//zMjGhiY0wG0i/B0FCEGYVNd42Eau9jyRk6dlCX3FM7jzUhYDqri8jlbwBtRhA
   2jBg7WyIk5CB3A==;
Message-Instance:  m=1;
 h=sha256:
   fakZGCt6IzZszPwHPXtrxpbipw6EqP+QiROfxGLYxF8=:
   zjxkc3PVnh1HEdZUioLE9kZ8oDKkQbuR1n1dqVKLui0=,
  sha512:
   ERcQbjio/UKIYo89C1JbfQl61/uXGySZ3rbPAS65QRzNswkq7eoS7qwAAxE0LlR+MXG9wJDEi7p+yTZ/EahalQ==:
   +i9PUwRuKTp8MMATDxacmSLDl0VTUB4x+JtS/1npdAC8o3TlSGLTUx1NTdWA6Fro1HzVk7OzzmIK50OzTZTBdg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779037; x=1795383837; i=arc@gmx.li;
	bh=Z/TG298ncROM96Lh28rZS8wjaoI3ZwlIrqYdNmU0z44=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Q772SxYqcB3wmQ1sTW0YinRxMfI9v/8murPGkLglti3b1cflwtjrYdWpwOQi1H0I
	 U6PZnbxq4qG9tElQ3sHW/UD536Umdg86UdyR0U0Kc4oEG/WDqLocw9copMCaLjqtO
	 N/eec12WQdUdivvB0SCA61cE0dp41LVd/fgkifCHKjfi6hLtpnnXCffr5Ds+yxsM5
	 ldMdrWT++xiQFtsfL/3yrOxy+WDbQPvCeO3K0WnGR4xwgw+2WykjPrztJqZkPowXC
	 yY6TT5SeF7m5kpTpqvDvIJ0eViM0RAEoGySxkrKi4xVQXxOw0GT+LLzcwoVyk4AZR
	 u4Is7KWO9wyDM+zj/A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHoRK-1xG2Is41kk-00ECeI; Sun, 15
 Nov 2026 22:43:57 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V4 PATCH 19/19] ALSA: mixer_audient: Refactor FU12 special cases into generic set/get functions
Date: Sun, 15 Nov 2026 22:43:36 +0100
Message-ID: <20261115214336.17917-20-arc@gmx.li>
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
X-Provags-ID: V03:K1:ZugXt8uCnyKOfVJs2WIr+I2TyEo4qHXfA0pubZRtazr1VMZIOhC
 FykB9anpTZaaz39UApVabPuAN5Y+QH61k7kInK5BLGW6m0d1hiiDCiC3xUxEtoYhdVUQnYh
 1VoVtDUrVXu6GHaKApiHzu0i0A++N9VozT+p4p/vQmeyTfOySS/97/7Wj3gJN0+Y1mnKPNs
 DJE1mU68I7voG5OOKzZGQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:G0G+RsCun0w=;nv1mi1Yj8f4puoNZm077T/ROutm
 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
 IZmdazKmHJWPg/Uwycmri78ZcPW1No=

With the unified get and set functions it is trivial to merge the iD14 FU1=
2
quirks into the generic table controls and remove even more redundant code=
.
Add an ID14_FU12 control type, implement the respective case branches in
set/get and remove specific iD14 FU12 code.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_audient.c | 289 +++++++++++++++-----------------------
 1 file changed, 113 insertions(+), 176 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 13940572de3f..e24a6e9facc1 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -55,17 +55,45 @@ enum snd_audient_type {
 	SND_AUDIENT_TYPE_ID14_MON_ID_KEY,
 	SND_AUDIENT_TYPE_ID14_MON_TALKBACK_SRC,
 	SND_AUDIENT_TYPE_ID14_OPTICAL_MODE,
+	SND_AUDIENT_TYPE_ID14_FU12,
 	SND_AUDIENT_TYPE_NCTYPES
 };
=20
 /* Mixer matrix: -128dB (mute) to +6dB */
 static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_mixer, -12800, 60=
0);
=20
+/*
+ * iD14 MkI FU 12, the mixer output level: CN 1-2 Main, 3-4 Cue. GET RANG=
E
+ * works (-127 ... 0 dB, 1 dB steps), but GET CUR returns a reply buffer =
the
+ * device shares with other units, not the FU 12 value. So the generic
+ * control shows stale data, and its sticky-GET check passes and then wri=
tes
+ * that stale value to Main L.
+ *
+ * The firmware ignores Main L (CN 1) but applies Main R (CN 2), so any M=
ain
+ * level other than 0 dB unbalances the main outputs (Cue L and Cue R bot=
h
+ * work). This control holds Main at 0 dB: a put sends 0 dB to CN 1-2
+ * whatever it asks for, and get reports it.
+ *
+ * It keeps the generic control's name and format: four values, 0 ... 127
+ * in 1 dB steps, 127 =3D 0 dB, 0 =3D mute (0x8000). It shows the last va=
lue the
+ * device accepted, and every put sends all four channels.
+ */
+#define ID14_FU12_MAIN_CHANNELS	2	/* CN 1-2, held at 0 dB */
+#define ID14_FU12_MAX		127
+#define ID14_FU12_MUTE		0
+#define ID14_FU12_HW_MUTE	(-128 * 256)
+
+static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_id14_fu12, -12700=
, 0);
+
+/* control type flags */
 #define SND_AUDIENT_CTYPE_FLAGS_SIGNED		BIT(0)
 #define SND_AUDIENT_CTYPE_FLAGS_INIT_HW		BIT(1)
 #define SND_AUDIENT_CTYPE_FLAGS_GET_BROKEN	BIT(2)
 #define SND_AUDIENT_CTYPE_FLAGS_CACHE		BIT(3)
=20
+/* Private control element types for quirky controls */
+#define SNDRV_AUDIENT_CTL_ELEM_TYPE_ID14_FU12	(SNDRV_CTL_ELEM_TYPE_LAST +=
 1)
+
 /*
  * An enumerated control: item i sends values[i]. A get of a device value
  * outside the list returns -EIO; it does not show a wrong item.
@@ -376,6 +404,20 @@ static const struct snd_audient_ctrl_type {
 		.unit =3D ID14_IT_DIGITAL,
 		.sel =3D ID14_IT_OPTICAL_MODE,
 	},
+	[SND_AUDIENT_TYPE_ID14_FU12] =3D {
+		.type =3D SNDRV_AUDIENT_CTL_ELEM_TYPE_ID14_FU12,
+		.flags =3D SND_AUDIENT_CTYPE_FLAGS_SIGNED
+			 | SND_AUDIENT_CTYPE_FLAGS_INIT_HW
+			 | SND_AUDIENT_CTYPE_FLAGS_CACHE,
+		.len =3D 2,
+		.min.integer =3D -127 * 256,
+		.max.integer =3D 0,
+		.init =3D ID14_FU12_HW_MUTE,
+		.res =3D 256,
+		.unit =3D ID14_FU_MIX,
+		.sel =3D UAC_FU_VOLUME,
+		.tlv =3D snd_audient_tlv_id14_fu12,
+	},
 };
=20
=20
@@ -470,6 +512,7 @@ static const struct snd_audient_ctrl snd_audient_id14_=
mk1_controls[] =3D {
 	ID14_CTRL("iD Key Function Playback Enum", MON_ID_KEY, 0, 1),
 	ID14_CTRL("Talkback Source Capture Enum", MON_TALKBACK_SRC, 0, 1),
 	ID14_CTRL("Digital In Mode Capture Enum", OPTICAL_MODE, 0, 1),
+	ID14_CTRL("Monitor Mix Playback Volume", FU12, 1, 4),
 	{ 0 }, /* sentinel */
 };
=20
@@ -492,15 +535,12 @@ static const char *const snd_audient_id14_mk1_matrix=
[] =3D {
 	NULL
 };
=20
-static int snd_audient_id14_mk1_create(struct usb_mixer_interface *mixer)=
;
-
 static const struct audient_devinfo {
 	u32 usb_id;
 	const struct snd_audient_ctrl *controls;
 	const char *const *const matrix_names;
 	const unsigned int matrix_channels;
 	/* optional: controls the tables cannot describe, created after them */
-	int (*extra_init)(struct usb_mixer_interface *mixer);
 } audient_devinfo[] =3D {
 	{
 		.usb_id =3D USB_ID(USB_AUDIENT_VID, USB_EVO4_PID),
@@ -513,7 +553,6 @@ static const struct audient_devinfo {
 		.controls =3D snd_audient_id14_mk1_controls,
 		.matrix_names =3D snd_audient_id14_mk1_matrix,
 		.matrix_channels =3D 2,
-		.extra_init =3D snd_audient_id14_mk1_create,
 	},
 	{ 0 } /* sentinel */
 };
@@ -739,6 +778,31 @@ static int snd_audient_enum_item(const struct snd_aud=
ient_enum *e, u32 value)
 	return -EIO;
 }
=20
+static inline u32
+snd_audient_fu12_from_ctl(const struct snd_audient_ctrl_type *ctype, long=
 val)
+{
+	s32 ret;
+
+	if (val =3D=3D ID14_FU12_MUTE)
+		ret =3D ID14_FU12_HW_MUTE;
+	else
+		ret =3D ctype->min.integer + val * ctype->res;
+
+	return (u32)ret;
+}
+
+static inline long
+snd_audient_fu12_to_ctl(const struct snd_audient_ctrl_type *ctype, u32 bu=
f)
+{
+	s32 val =3D (s32)buf;
+
+	if (val =3D=3D ID14_FU12_HW_MUTE)
+		return ID14_FU12_MUTE;
+	else
+		return min(DIV_ROUND_CLOSEST(val - ctype->min.integer,
+					     (long)ctype->res),
+			   snd_audient_int_max(ctype));
+}
=20
 static int snd_ctl_audient_get(struct snd_kcontrol *kctl,
 				       struct snd_ctl_elem_value *ctl_val)
@@ -799,6 +863,10 @@ static int snd_ctl_audient_get(struct snd_kcontrol *k=
ctl,
 				ctl_val->value.enumerated.item[i] =3D ret;
 			}
 			break;
+		case SNDRV_AUDIENT_CTL_ELEM_TYPE_ID14_FU12:
+			ctl_val->value.integer.value[i] =3D
+					snd_audient_fu12_to_ctl(ctype, buf);
+			break;
 		}
 	}
=20
@@ -834,6 +902,11 @@ static int snd_ctl_audient_set(struct snd_kcontrol *k=
ctl,
 			if (v->enumerated.item[i] >=3D e->items)
 				return -EINVAL;
 			break;
+		case SNDRV_AUDIENT_CTL_ELEM_TYPE_ID14_FU12:
+			if (v->integer.value[i] < 0
+			    || v->integer.value[i] > ID14_FU12_MAX)
+				return -EINVAL;
+			break;
 		}
 	}
=20
@@ -859,6 +932,14 @@ static int snd_ctl_audient_set(struct snd_kcontrol *k=
ctl,
 		case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
 			val =3D e->values[v->enumerated.item[i]];
 			break;
+		case SNDRV_AUDIENT_CTL_ELEM_TYPE_ID14_FU12:
+			if (i < ID14_FU12_MAIN_CHANNELS) {
+				val =3D ctype->max.integer;
+			} else {
+				val =3D snd_audient_fu12_from_ctl(ctype,
+							v->integer.value[i]);
+			}
+			break;
 		}
=20
 		ret =3D snd_audient_raw_set_one(elem, ctype, base + i, val,
@@ -879,25 +960,30 @@ static int snd_ctl_audient_info(struct snd_kcontrol =
*kctl,
 	const struct snd_audient_ctrl_type *const ctype
 						=3D snd_audient_kctl_type(kctl);
=20
+	uinfo->type =3D ctype->type;
+	uinfo->count =3D snd_audient_kctl_channels(kctl);
+
 	switch (ctype->type) {
-	case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
-		return snd_ctl_enum_info(uinfo,
-					 snd_audient_kctl_channels(kctl),
-					 ctype->enumeration->items,
-					 ctype->enumeration->texts);
 	case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
 		uinfo->value.integer.min =3D 0;
 		uinfo->value.integer.max =3D 1;
 		break;
-	default:
+	case SNDRV_CTL_ELEM_TYPE_INTEGER:
 		uinfo->value.integer.min =3D snd_audient_int_min(ctype);
 		uinfo->value.integer.max =3D snd_audient_int_max(ctype);
 		break;
+	case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
+		return snd_ctl_enum_info(uinfo,
+					 snd_audient_kctl_channels(kctl),
+					 ctype->enumeration->items,
+					 ctype->enumeration->texts);
+	case SNDRV_AUDIENT_CTL_ELEM_TYPE_ID14_FU12:
+		uinfo->value.integer.min =3D 0;
+		uinfo->value.integer.max =3D ID14_FU12_MAX;
+		uinfo->type =3D SNDRV_CTL_ELEM_TYPE_INTEGER;
+		break;
 	}
=20
-	uinfo->type =3D ctype->type;
-	uinfo->count =3D snd_audient_kctl_channels(kctl);
-
 	return 0;
 }
=20
@@ -949,9 +1035,22 @@ static int snd_audient_add_ctrl(struct usb_mixer_int=
erface *mixer,
 		int i;
=20
 		for (i =3D 0; i < ctrl->hwchannels; i++) {
+			u32 init;
+
+			switch (ctype->type) {
+			case SNDRV_AUDIENT_CTL_ELEM_TYPE_ID14_FU12:
+				if (i < ID14_FU12_MAIN_CHANNELS)
+					init =3D ctype->max.integer;
+				else
+					init =3D ctype->init;
+				break;
+			default:
+				init =3D ctype->init;
+				break;
+			}
 			ret =3D snd_audient_raw_set_one(elem, ctype,
 						      ctrl->val_offs + i,
-						      ctype->init, true);
+						      init, true);
 			if (ret < 0)
 				usb_audio_warn(mixer->chip,
 					       "%s: cannot set channel %d (%d)\n",
@@ -976,165 +1075,6 @@ static int snd_audient_add_ctrl(struct usb_mixer_in=
terface *mixer,
 }
=20
=20
-/*
- * iD14 MkI FU 12, the mixer output level: CN 1-2 Main, 3-4 Cue. GET RANG=
E
- * works (-127 ... 0 dB, 1 dB steps), but GET CUR returns a reply buffer =
the
- * device shares with other units, not the FU 12 value. So the generic
- * control shows stale data, and its sticky-GET check passes and then wri=
tes
- * that stale value to Main L.
- *
- * The firmware ignores Main L (CN 1) but applies Main R (CN 2), so any M=
ain
- * level other than 0 dB unbalances the main outputs (Cue L and Cue R bot=
h
- * work). This control holds Main at 0 dB: a put sends 0 dB to CN 1-2
- * whatever it asks for, and get reports it.
- *
- * It keeps the generic control's name and format: four values, 0 ... 127
- * in 1 dB steps, 127 =3D 0 dB, 0 =3D mute (0x8000). It shows the last va=
lue the
- * device accepted, and every put sends all four channels.
- */
-#define ID14_FU12_CHANNELS	4
-#define ID14_FU12_MAIN_CHANNELS	2	/* CN 1-2, held at 0 dB */
-#define ID14_FU12_MAX		127
-#define ID14_FU12_MUTE		0
-
-static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_id14_fu12, -12700=
, 0);
-
-static const struct snd_audient_ctrl_type snd_audient_id14_fu12_type =3D =
{
-	.len =3D 2,
-	.unit =3D ID14_FU_MIX,
-	.sel =3D UAC_FU_VOLUME,
-};
-
-struct snd_audient_id14_fu12 {
-	struct usb_mixer_elem_list list;	/* first: snd_usb_mixer_elem_free */
-	long val[ID14_FU12_CHANNELS];
-	u8 valid;				/* bit per channel */
-};
-
-static int snd_audient_id14_fu12_write(struct snd_audient_id14_fu12 *f,
-				       unsigned int ch, long val)
-{
-	__le16 buf =3D cpu_to_le16(val =3D=3D ID14_FU12_MUTE ? -128 * 256
-				 : (val - ID14_FU12_MAX) * 256);
-	int ret;
-
-	ret =3D snd_audient_set_cur(f->list.mixer, &snd_audient_id14_fu12_type,
-				  ch + 1, &buf);
-	if (ret < 0)
-		return ret;
-
-	f->val[ch] =3D val;
-	f->valid |=3D BIT(ch);
-
-	return 0;
-}
-
-static int snd_ctl_audient_id14_fu12_info(struct snd_kcontrol *kctl,
-					  struct snd_ctl_elem_info *uinfo)
-{
-	uinfo->type =3D SNDRV_CTL_ELEM_TYPE_INTEGER;
-	uinfo->count =3D ID14_FU12_CHANNELS;
-	uinfo->value.integer.min =3D 0;
-	uinfo->value.integer.max =3D ID14_FU12_MAX;
-
-	return 0;
-}
-
-static int snd_ctl_audient_id14_fu12_get(struct snd_kcontrol *kctl,
-					 struct snd_ctl_elem_value *ctl_val)
-{
-	struct snd_audient_id14_fu12 *f =3D snd_kcontrol_chip(kctl);
-	unsigned int ch;
-
-	/* a channel that was never written reads as mute */
-	for (ch =3D 0; ch < ID14_FU12_CHANNELS; ch++)
-		ctl_val->value.integer.value[ch] =3D (f->valid & BIT(ch))
-						   ? f->val[ch]
-						   : ID14_FU12_MUTE;
-
-	return 0;
-}
-
-static int snd_ctl_audient_id14_fu12_set(struct snd_kcontrol *kctl,
-					 struct snd_ctl_elem_value *ctl_val)
-{
-	struct snd_audient_id14_fu12 *f =3D snd_kcontrol_chip(kctl);
-	long *const v =3D ctl_val->value.integer.value;
-	unsigned int ch;
-	int changed =3D 0;
-
-	for (ch =3D 0; ch < ID14_FU12_CHANNELS; ch++)
-		if (v[ch] < 0 || v[ch] > ID14_FU12_MAX)
-			return -EINVAL;
-
-	CLASS(snd_usb_lock, pm)(f->list.mixer->chip);
-	if (pm.err < 0)
-		return pm.err;
-
-	/* Main is held at 0 dB: report that back to the caller */
-	for (ch =3D 0; ch < ID14_FU12_MAIN_CHANNELS; ch++)
-		v[ch] =3D ID14_FU12_MAX;
-
-	for (ch =3D 0; ch < ID14_FU12_CHANNELS; ch++) {
-		int ret;
-
-		if (!(f->valid & BIT(ch)) || f->val[ch] !=3D v[ch])
-			changed =3D 1;
-
-		ret =3D snd_audient_id14_fu12_write(f, ch, v[ch]);
-		if (ret < 0)
-			return ret;
-	}
-
-	return changed;
-}
-
-/* At probe, set Main to 0 dB and mute Cue. */
-static int snd_audient_id14_mk1_create(struct usb_mixer_interface *mixer)
-{
-	struct snd_kcontrol_new knew =3D {
-		.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER,
-		.name =3D "Monitor Mix Playback Volume",
-		.access =3D SNDRV_CTL_ELEM_ACCESS_READWRITE
-			  | SNDRV_CTL_ELEM_ACCESS_TLV_READ,
-		.info =3D snd_ctl_audient_id14_fu12_info,
-		.get =3D snd_ctl_audient_id14_fu12_get,
-		.put =3D snd_ctl_audient_id14_fu12_set,
-		.tlv.p =3D snd_audient_tlv_id14_fu12,
-	};
-	struct snd_audient_id14_fu12 *f;
-	struct snd_kcontrol *kctl;
-	unsigned int ch;
-
-	f =3D kzalloc_obj(*f);
-	if (!f)
-		return -ENOMEM;
-
-	f->list.mixer =3D mixer;
-	f->list.id =3D ID14_FU_MIX;
-
-	for (ch =3D 0; ch < ID14_FU12_CHANNELS; ch++) {
-		const int ret =3D snd_audient_id14_fu12_write(f, ch,
-				ch < ID14_FU12_MAIN_CHANNELS ? ID14_FU12_MAX
-							     : ID14_FU12_MUTE);
-
-		if (ret < 0)	/* the channel stays unknown and reads as mute */
-			usb_audio_warn(mixer->chip,
-				       "iD14: cannot set FU 12 channel %u (%d)\n",
-				       ch + 1, ret);
-	}
-
-	kctl =3D snd_ctl_new1(&knew, f);
-	if (!kctl) {
-		kfree(f);
-		return -ENOMEM;
-	}
-
-	kctl->private_free =3D snd_usb_mixer_elem_free;
-
-	return snd_usb_mixer_add_list(&f->list, kctl, false, true);
-}
-
 /* called from mixer_quirks.c */
 int snd_audient_controls_create(struct usb_mixer_interface *mixer)
 {
@@ -1174,8 +1114,5 @@ int snd_audient_controls_create(struct usb_mixer_int=
erface *mixer)
 		}
 	}
=20
-	if (info->extra_init)
-		return info->extra_init(mixer);
-
 	return 0;
 }
=2D-=20
2.56.1

