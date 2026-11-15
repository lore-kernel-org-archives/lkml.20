Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779037;
	b=qpwBeC3linrTz7cPiIdvZ54x2NsulGqu1LyJEDhU60VHi+1KC57Ru49okeYP9bgcKoA9
	 gct4WTj5UaH8dwZo1W1r8EAdVMfAAacCTf6pqcJ2CjYozjT40NFQq5Qgp0JAQCqS+UxA6
	 ACNc9o+DKQSY/P+TpdEWo/h/qMud6UuhXjbLlhdMjj+Y2/nwh4ibBG4eI9wdfvry6/jpy
	 UVldshNKS9TNd7Ig282ggS3pNDqcm+xvZ8qE9N2G7edpt3gJL3/mxUoXsl3+wEcOEowpK
	 vaRAHMk2p1NP8I5jrHoOtZK1uYWlbNErSpu7UwWLVq48qZRbebBo2bMUxMJ/EP5iRFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779037;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=0U1AJ8rKeQpRlmFpkowdYdemxzFJQFVNBp7PnYvm4g8=;
	b=0IL/w4HP6UUwAjbdSCr+RgFhOXT4OnVJ5KhKWS0RelqKGlut3E1NX13bFEciKcnSlz0c
	 RbmLdGbddcYdFAZklqm4ywxn6AAJjJ1Yv2GlT1cdwHXQS1WGbyztgbCJ9i2NLTCD1Fsx0
	 oA5rU0qJkPQ2Zd9go+pvvvb7dUMn6YttzqBw7GnFQv6YqVOilqPGQIOEZZeMLtgtYEhyT
	 02ZM/PM6mRsKInhV7vxe388i8soA4LB97hSPBcS8S2eEzxAQ7hj8XIuTceJvMrphwU0Vu
	 tn9PZc6+0t54EfTOM9X1WP6W0DOgJlgo+AxjZrKhBtKJq8DEwH2/uVOQm2/bu9uPrHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=Yav2hdhV;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E61360A3803
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E61360A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=Yav2hdhV
DKIM2-Signature:  i=1; m=1; t=1794779034;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:XBbb+C3OyzvI7LuI3ieLz/nIAipI
   epICdIkfvPfH/mr91UbSCt57Q7U5ihGkXb9VT0IpNCIPq+DWTAHSQZE15XfRDoSm06jhpZCjWc8
   CBmu71uBXVeOehKJTOtPk/t/DV4XVScGAdu0zth0bpRwlOF7a16bGRfAMyLLtSNLb150DIJnfNT
   s+FHsHSbFLRgEzFOIAbE99LTF5Z8h+8WvOQ15DpegO6VcTZjX00SS4ru08/oyyP7IUEqIgG1G2R
   18pEJ+sFQ82GTUFpsEpQPD3e8bjlblajXeuKnrBa/KkfaZRjpqZ91678g8GTyzh3PCDfKjv4zD0
   WaNTAvxBvVCjnA==;
Message-Instance:  m=1;
 h=sha256:
   48Vye025OphFA534PdW9duExwBTe8tqhq9az7Y7AFCs=:
   CQlk8h78QfDzybvQxul3lcnlKFKzE6/RqVKfJy2E6Kk=,
  sha512:
   toBc+wwXhrlQWveDT1pKrn0a4jICNMXUfQ1oo0XDxIC+Lr2QeyxzKT0LGahAptTLV2a2qrN83jftN9JAQOMpvw==:
   oMHr92QrTEaCkBu4s0dYzokZVDa1Sht2iUsIyEcgsdm8gt5LhtKHdA50DKnaLgTCO3biTQXrdjcttP32lpH/tQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779034; x=1795383834; i=arc@gmx.li;
	bh=0U1AJ8rKeQpRlmFpkowdYdemxzFJQFVNBp7PnYvm4g8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Yav2hdhVlv6spFp8UozWnGapOaE+rfX8pS+pURFUSn6yEatxIdMSw+lIblV4sQuf
	 tIkmhB4QJU1ja7v3c4n9VzPEYpLyLx2rsxPy+EhhPoz/cQzTs39M4jFdv1sQB1K4O
	 ADnCsXzPmL2++pZYexiYrtj7X4wa9A1jM14U3Uwkqq9+0SbAaCx3ZLL5sxMzjEjwk
	 0FUTaQMgkkHTbH+5d62x6KU2wrUYO01jD8GkHKNiLzZhbabggfvdh326bz16GtArH
	 qUxn6pX/U0MBjGaPWl2W+aKLzI1vnuJu4XKC0VsKfYnO1m+EPj24MXQxIGwc7mxOs
	 z4suP/B8Jk7pWOOpCQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAOJP-1xHPDV1AGh-00CqyE; Sun, 15
 Nov 2026 22:43:54 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V4 PATCH 16/19] ALSA: mixer_audient: Replace the Audient iD14 MkI FU 12 control
Date: Sun, 15 Nov 2026 22:43:33 +0100
Message-ID: <20261115214336.17917-17-arc@gmx.li>
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
X-Provags-ID: V03:K1:Q6dgHos2sye4Wi6X5jF/cMAbPzXYa/luswLEkuAiJnmbzf2+giw
 oE/sQd9nydut35KPNfl0xXEooHieXl2axuwzHDxbEJot1BGd9gXUFogOqek6KFg0C7zoIyR
 ZzkrDtm0fzFp89/vRd08eD3lZOrY+809Zn2SRbJrIwcVqPM3muia7YCBu4H7ZvOa98Km1Cd
 X+qf6BvXU8w1GzlpZi5RQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:znYhbC+x04w=;Dz7Qt2r6g8J0vFW8JrOCsdzfsd+
 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

From: Will Porter <mrwillporter@gmail.com>

Feature unit 12 sets the level of the mixer outputs: channels 1-2 Main,
3-4 Cue. Two firmware faults make the generic control wrong on the
MkI:

- GET CUR does not return the FU 12 value. It returns a reply buffer
  that the device shares with FU 10, MU 60 and XU 51. The buffer holds
  the data of the last GET or SET to any of them. So the generic
  sticky-GET check passes, because GET echoes the SET just sent. The
  check then writes the stale value that it read first to channel 1.
- Main L ignores its level, but Main R applies it. So any Main value
  other than 0 dB unbalances the main outputs. audient_id14_map already
  records this asymmetry. A loopback cable measured it: Main R at
  -20 dB and -40 dB changes its output by -20.0 and -40.9 dB. Main L
  at the same values changes nothing. Cue L and Cue R both work: Cue L
  follows the set value within about 1 dB down to at least -70 dB; the
  headphone residual hides lower levels.

Replace the generic control with one of the same name, count and range.
It is "Monitor Mix Playback Volume", with four values from 0 to 127 in
1 dB steps. 127 is 0 dB. Value 0 writes 0x8000, the floor that
Audient's iD application writes, and the TLV declares it as mute. On
Cue L, value 0 gives no output above the fixed headphone residual,
about 76 dB below 0 dB. The four values keep the Main L/R, Cue L/R
layout of existing saved ALSA states.

The control holds Main at 0 dB, as the iD application does. (The
application has no Main fader and writes 0 dB at launch.) A put always
sends 0 dB to channels 1-2 and returns that value to the caller. Get
reports it too. For Cue the control shows the last value the device
accepted. At probe the driver writes the iD application's launch values
once per channel: Main 0 dB, Cue muted. A channel whose probe write
fails reads as mute until a put succeeds.

The iD14 MkI profile in alsa-ucm-conf writes 127,127,127,127 to this
control at boot and when its HiFi verb starts. The new control accepts
that write: Main stays at 0 dB and Cue goes to 0 dB, the same result as
with the generic control.

Differences from the generic control:
- Value 0 is now mute. It was -127 dB.
- The control holds Main at 0 dB. A Main R attenuation stored with the
  generic control (for example 107, -20 dB) now restores as 0 dB, which
  raises Main R by 20 dB. Main L never applied that attenuation, so
  Main R comes up to the level that Main L already had. FU 12 comes
  before the monitor controller (XU 54) and the headphone level
  (FU 10), so the volume knob still sets the listening level.
- Cue starts muted at every probe. An output routed to the Cue Mix
  keeps that routing across a module reload or a rebind. On mains
  power it also keeps it across a replug. If the probe writes succeed,
  that output is then muted until user space sets the Cue level
  (alsactl restore or the UCM boot write). On bus power the MkI returns
  to DAW Thru when it enumerates, so no output is on the Cue Mix at
  probe.

The control does not fit the generic types, so the device table gains
a create hook for controls the tables cannot describe, called after
the tables.

Signed-off-by: Will Porter <mrwillporter@gmail.com>
=2D--
 sound/usb/mixer_audient.c | 167 ++++++++++++++++++++++++++++++++++++++
 sound/usb/mixer_maps.c    |   2 +-
 2 files changed, 168 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 30e1309cec3a..e86f0e1ec4f0 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -487,11 +487,15 @@ static const char *const snd_audient_id14_mk1_matrix=
[] =3D {
 	NULL
 };
=20
+static int snd_audient_id14_mk1_create(struct usb_mixer_interface *mixer)=
;
+
 static const struct audient_devinfo {
 	u32 usb_id;
 	const struct snd_audient_ctrl *controls;
 	const char *const *const matrix_names;
 	const unsigned int matrix_channels;
+	/* controls the tables cannot describe; called after the tables */
+	int (*create)(struct usb_mixer_interface *mixer);
 } audient_devinfo[] =3D {
 	{
 		.usb_id =3D USB_ID(USB_AUDIENT_VID, USB_EVO4_PID),
@@ -504,6 +508,7 @@ static const struct audient_devinfo {
 		.controls =3D snd_audient_id14_mk1_controls,
 		.matrix_names =3D snd_audient_id14_mk1_matrix,
 		.matrix_channels =3D 2,
+		.create =3D snd_audient_id14_mk1_create,
 	},
 	{ 0 } /* sentinel */
 };
@@ -1079,6 +1084,165 @@ static int snd_audient_add_ctrl(struct usb_mixer_i=
nterface *mixer,
 }
=20
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
+#define ID14_FU12_CHANNELS	4
+#define ID14_FU12_MAIN_CHANNELS	2	/* CN 1-2, held at 0 dB */
+#define ID14_FU12_MAX		127
+#define ID14_FU12_MUTE		0
+
+static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_id14_fu12, -12700=
, 0);
+
+static const struct snd_audient_ctrl_type snd_audient_id14_fu12_type =3D =
{
+	.len =3D 2,
+	.unit =3D ID14_FU_MIX,
+	.sel =3D UAC_FU_VOLUME,
+};
+
+struct snd_audient_id14_fu12 {
+	struct usb_mixer_elem_list list;	/* first: snd_usb_mixer_elem_free */
+	long val[ID14_FU12_CHANNELS];
+	u8 valid;				/* bit per channel */
+};
+
+static int snd_audient_id14_fu12_write(struct snd_audient_id14_fu12 *f,
+				       unsigned int ch, long val)
+{
+	__le16 buf =3D cpu_to_le16(val =3D=3D ID14_FU12_MUTE ? -128 * 256
+				 : (val - ID14_FU12_MAX) * 256);
+	int ret;
+
+	ret =3D snd_audient_set_cur(f->list.mixer, &snd_audient_id14_fu12_type,
+				  ch + 1, &buf);
+	if (ret < 0)
+		return ret;
+
+	f->val[ch] =3D val;
+	f->valid |=3D BIT(ch);
+
+	return 0;
+}
+
+static int snd_ctl_audient_id14_fu12_info(struct snd_kcontrol *kctl,
+					  struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type =3D SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count =3D ID14_FU12_CHANNELS;
+	uinfo->value.integer.min =3D 0;
+	uinfo->value.integer.max =3D ID14_FU12_MAX;
+
+	return 0;
+}
+
+static int snd_ctl_audient_id14_fu12_get(struct snd_kcontrol *kctl,
+					 struct snd_ctl_elem_value *ctl_val)
+{
+	struct snd_audient_id14_fu12 *f =3D snd_kcontrol_chip(kctl);
+	unsigned int ch;
+
+	/* a channel that was never written reads as mute */
+	for (ch =3D 0; ch < ID14_FU12_CHANNELS; ch++)
+		ctl_val->value.integer.value[ch] =3D (f->valid & BIT(ch))
+						   ? f->val[ch]
+						   : ID14_FU12_MUTE;
+
+	return 0;
+}
+
+static int snd_ctl_audient_id14_fu12_set(struct snd_kcontrol *kctl,
+					 struct snd_ctl_elem_value *ctl_val)
+{
+	struct snd_audient_id14_fu12 *f =3D snd_kcontrol_chip(kctl);
+	long *const v =3D ctl_val->value.integer.value;
+	unsigned int ch;
+	int changed =3D 0;
+
+	for (ch =3D 0; ch < ID14_FU12_CHANNELS; ch++)
+		if (v[ch] < 0 || v[ch] > ID14_FU12_MAX)
+			return -EINVAL;
+
+	CLASS(snd_usb_lock, pm)(f->list.mixer->chip);
+	if (pm.err < 0)
+		return pm.err;
+
+	/* Main is held at 0 dB: report that back to the caller */
+	for (ch =3D 0; ch < ID14_FU12_MAIN_CHANNELS; ch++)
+		v[ch] =3D ID14_FU12_MAX;
+
+	for (ch =3D 0; ch < ID14_FU12_CHANNELS; ch++) {
+		int ret;
+
+		if (!(f->valid & BIT(ch)) || f->val[ch] !=3D v[ch])
+			changed =3D 1;
+
+		ret =3D snd_audient_id14_fu12_write(f, ch, v[ch]);
+		if (ret < 0)
+			return ret;
+	}
+
+	return changed;
+}
+
+/* At probe, set Main to 0 dB and mute Cue. */
+static int snd_audient_id14_mk1_create(struct usb_mixer_interface *mixer)
+{
+	struct snd_kcontrol_new knew =3D {
+		.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name =3D "Monitor Mix Playback Volume",
+		.access =3D SNDRV_CTL_ELEM_ACCESS_READWRITE
+			  | SNDRV_CTL_ELEM_ACCESS_TLV_READ,
+		.info =3D snd_ctl_audient_id14_fu12_info,
+		.get =3D snd_ctl_audient_id14_fu12_get,
+		.put =3D snd_ctl_audient_id14_fu12_set,
+		.tlv.p =3D snd_audient_tlv_id14_fu12,
+	};
+	struct snd_audient_id14_fu12 *f;
+	struct snd_kcontrol *kctl;
+	unsigned int ch;
+
+	f =3D kzalloc_obj(*f);
+	if (!f)
+		return -ENOMEM;
+
+	f->list.mixer =3D mixer;
+	f->list.id =3D ID14_FU_MIX;
+
+	for (ch =3D 0; ch < ID14_FU12_CHANNELS; ch++) {
+		const int ret =3D snd_audient_id14_fu12_write(f, ch,
+				ch < ID14_FU12_MAIN_CHANNELS ? ID14_FU12_MAX
+							     : ID14_FU12_MUTE);
+
+		if (ret < 0)	/* the channel stays unknown and reads as mute */
+			usb_audio_warn(mixer->chip,
+				       "iD14: cannot set FU 12 channel %u (%d)\n",
+				       ch + 1, ret);
+	}
+
+	kctl =3D snd_ctl_new1(&knew, f);
+	if (!kctl) {
+		kfree(f);
+		return -ENOMEM;
+	}
+
+	kctl->private_free =3D snd_usb_mixer_elem_free;
+
+	return snd_usb_mixer_add_list(&f->list, kctl, false, true);
+}
+
 /* called from mixer_quirks.c */
 int snd_audient_controls_create(struct usb_mixer_interface *mixer)
 {
@@ -1118,5 +1282,8 @@ int snd_audient_controls_create(struct usb_mixer_int=
erface *mixer)
 		}
 	}
=20
+	if (info->create)
+		return info->create(mixer);
+
 	return 0;
 }
diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index b88244b12a98..0ff180e450b5 100644
=2D-- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -543,7 +543,7 @@ static const struct usbmix_name_map audient_id14_map[]=
 =3D {
 /* Audient iD14 MkI: model-specific control map. */
 static const struct usbmix_name_map audient_id14_mk1_map[] =3D {
 	{ 11, NULL },			/* FU, see mixer_audient.c */
-	{ 12, "Monitor Mix Playback" },	/* FU, partial coverage */
+	{ 12, NULL },			/* FU, see mixer_audient.c */
 	{ 60, NULL },			/* MU, see mixer_audient.c */
 	{}
 };
=2D-=20
2.56.1

