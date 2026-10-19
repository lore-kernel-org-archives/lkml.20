Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792450949;
	b=Zfuo2+gn4R/2gh6SO86K/ELWqEN7S4YJCm0cjBcC5fdxy6ekEIsEUNuU0CcMHVur4k++
	 RW8pUzB5VZwWNeuFTXe6mnebqe6j2Gzj0WML4fnc2D0RTCCRTTP0um50F43TtZW9Wm4vc
	 bwnO8bXTg61WZv4TcGghX6ChHH8Ex8JwdbecsAtyCEV1NfmcO3PbPkUsmbjg0gaOvYYt0
	 kFEXNOla8aygJl0KX41KWrNlxMgFkhOZk08IBD6ktwVMO8rzaCE6AFTilrNSCs6Zsdkb5
	 n7TImt2HnAdfy1TRWxy1aNLD/YWIT4CeSq0X5EJ/dkh11qblCQdderx+88YasmY2j8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SxXk8dddMwy/ogUv/hn3+CQ1fsGwLG6Bsf0XfAWIAd0=;
	b=HsTD95G71ChszTReiqBkXZL45H9z8zpGVh90voChKiQHepb7aNan9wSUVvDcEsebErbM
	 R/NLGyCuB6ssDFm4BEHGsQqu73GZW59j2akfGMysUcFgB0c0Vur8h1+Zchq6gCHi07l8S
	 amqPD8ATLi1NemL8LjDT9bFRFaTdbDnnTgRNT7nidMQYaPdw5l7asENafbkkwx1nF7T5Y
	 eTb/vY75+vdaaqRhtjyrpig2A0PCH2Gz5Eagre8ZfW8bBXFJkkNBznp7Vx1q+FXJD0BLl
	 nZtYnnwscmb/shU7ujc9/DMCSlfBQjS/r26zfj4W0VxRt0oH8NvePLpMQRIurN1Ue5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=emiDRE4z;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD10606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CD10606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=emiDRE4z
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-48e94879f02so829585fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792450948; x=1793055748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SxXk8dddMwy/ogUv/hn3+CQ1fsGwLG6Bsf0XfAWIAd0=;
        b=emiDRE4zcj2JsBGQh06HE7dGvppqe0sb9TFgS7L2xP6c33OipiChuVT/v0s1WkecoJ
         oX1ZBGi3nfgLE+X1TeOxSy3meWqYJT8WfUH4zw4cvFYelVBDnnxMC1H3zLJ58wbaLMkL
         G66zkr16V98kQoKy/DuXmZJIfFHYlwQCdHGX8C+i56gFZehACCPe4iHktSFCeM/CwUrl
         mtFNC074cQc1aA9s9LpAQ8o1oymL/ntHSR+BFyLdJhk4+3bia0YCDcUQ4RSOEPl8v3tU
         BAjnGiQHtwhu7BS6YvQwuZpkD1Kc9fUQt6LG5Wx8jsNhK3ASiox/q7JRTGndRigpc1SV
         8VFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450948; x=1793055748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SxXk8dddMwy/ogUv/hn3+CQ1fsGwLG6Bsf0XfAWIAd0=;
        b=01DJ4kHkI/9AQTeEU2xV3eqOH4/efzMIEH577f4f2DZad+0bHALS2R8y2MA9Bw8fhL
         Wg4A6GO6QfAHyb3RPOOvrrJAVpuzJcsgsq1JwVPWoHgGVZU9JAlhMoQ+yrKHxgkpYX5G
         Qvl2fjzWKAS66cnYsqp9TTnFj2Z9RAH1v61Onb2RevoDwSbcbI2BDR6K1I6yLoyTYdCB
         lboCGFb6HeyfsCpH8etZKWlwAGV1cY2pnvQVYQIV6JUUSEnHC5nt721NiBlIXmtMiGWl
         J2y9xnEQxBYKqe1QRLx1uckXmU7Qa2JO348aCnLIUDARoivlwHMZOp7WMINH5ctTRRCJ
         JiWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZMgMhp1z12uwsPz7zCeJS+rwN4sWljHwIM9M9Dg57Hu/AWfOctqNBVEuEaPqaIyAEVTMf750/F7fZ8dQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYISdOBWdHxKR+QY8WxQX74CO9TjlWEmokwQNNXpDvI6MJock3fE
	gUxQLDdNoh8dzbo0CKKKWndGeiHnSdkOkVndSGlBT26PDQlw4ij3FIiU
X-Gm-Gg: AYBFou3IcuVfh9wUF0mrL4IFMV9uSYyIT7dCf1TYlYya6s9dtCqPiBuw1qOCQAw4DXr
	FQOOspuJ2z/h5Py9UNW6QZGamFQBbKEoFDzlrrMJd2fi/rudkOa9jyYnxJwihxQNDOuEmSYKJyo
	rNFAFaGoVMTgUc+Abhm4ekeKSq389IV+37O5kIacv1q5jf0J/pZoFF3gu9nxA5BD7IER61mQWTp
	St5A2hkOGRy8IYRTbSn3RvONxEvv9g+D7zOBPy4shhbv1HCsw8GoBr0ufIcWGZUtCR7ek4yXgcg
	1ZTFldvU3gRPexW7o6o/XkakaZ0bAzAUKfyNHgJustFeCZ4c/5D9IiqlZ3xoDNhsUvpeR6Xv950
	AF3kqYocMjPwr3sDKj30idHe6sKl6Tt8JYh/orsZq7ZTfLhBfu6917bMm0fJ0GIpLrXj8vYshSD
	ZCdop7S8FtGlzRL1SQ+g2n68qjQAapIcTFWE+7lb9ULrxn89gQ0298U5zdoVk1XE7oHH0L2KHeu
	uVUjOX6UsjN93f88Cbgw8JoVts=
X-Received: by 2002:a05:6870:8112:b0:4a2:4d67:5977 with SMTP id 586e51a60fabf-4a7578ad1a5mr7023842fac.18.1792450948070;
        Mon, 19 Oct 2026 16:02:28 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73b6d7e0csm9327797fac.12.2026.10.19.16.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:02:25 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>,
	Will Porter <mrwillporter@gmail.com>
Subject: [PATCH 5/5] ALSA: usb-audio: Replace the Audient iD14 MkI FU 12 control
Date: Mon, 19 Oct 2026 18:01:59 -0500
Message-ID: <20261019230159.834954-6-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019230159.834954-1-mrwillporter@gmail.com>
References: <20261019230159.834954-1-mrwillporter@gmail.com>
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
  -20 dB, -40 dB and mute changes its output by -20.0, -40.9 and
  -56.6 dB. Main L at the same values changes nothing. Cue L and Cue R
  both work.

Replace the generic control with one of the same name, count and range.
It is "Monitor Mix Playback Volume", with four values from 0 to 127 in
1 dB steps. 127 is 0 dB. Value 0 is mute (0x8000), the floor that
Audient's iD application writes, and the TLV says so. The four values
keep the Main L/R, Cue L/R layout of existing saved ALSA states, but
Main is now held at 0 dB.

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
  power it also keeps it across a replug. That output is then silent
  until alsactl restore runs. On bus power the MkI returns to DAW Thru
  when it enumerates, so no output is on the Cue Mix at probe.

Test setup:
- iD14 MkI, firmware 1.1.1
- Bazzite 44, kernel 7.2.9-ogc3.1.fc44
- snd-usb-audio built out of tree from the v7.2.9 sound/usb sources
  and the complete driver (this commit and the later ones)

Results:
- the loopback measurements above
- the Cue master, by ear
- a put of 107,107,90,90 reads back 127,127,90,90
- alsactl restore of the Cue level across a replug

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient_id.c | 147 +++++++++++++++++++++++++++++++++++
 sound/usb/mixer_maps.c       |   2 +-
 2 files changed, 148 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_audient_id.c b/sound/usb/mixer_audient_id.c
index 47e16e572..b729ca0d7 100644
--- a/sound/usb/mixer_audient_id.c
+++ b/sound/usb/mixer_audient_id.c
@@ -45,6 +45,7 @@
 #define ID14_IT_DIGITAL		0x01	/* input terminal: optical and coaxial inputs */
 #define ID14_FU_OUT		0x0a	/* feature unit before the outputs */
 #define ID14_FU_IN		0x0b	/* feature unit on the inputs: CN 1-2 Mic, 3-10 Digi */
+#define ID14_FU_MIX		0x0c	/* feature unit after the mixer: CN 1-2 Main, 3-4 Cue */
 #define ID14_ROUTE		0x33	/* routing XU: CN = destination */
 #define ID14_MON		0x36	/* monitor controller XU */
 #define ID14_MIXER		0x3c	/* mixer unit: 14 inputs x 4 outputs */
@@ -506,6 +507,149 @@ static int id_add_ctl(struct usb_mixer_interface *mixer, const struct id_ctl *c)
 	return snd_usb_mixer_add_list(&e->list, kctl, false, true);
 }
 
+/*
+ * iD14 MkI FU 12, the mixer output level: CN 1-2 Main, 3-4 Cue. GET RANGE works
+ * (-127 ... 0 dB, 1 dB steps), but GET CUR returns a reply buffer the
+ * device shares with other units, not the FU 12 value. So the generic
+ * control (hidden by the name map) shows stale data, and its sticky-GET
+ * check passes and then writes that stale value to Main L.
+ *
+ * The firmware ignores Main L (CN 1) but applies Main R (CN 2), so any Main
+ * level other than 0 dB unbalances the main outputs (measured with a
+ * loopback; Cue L and Cue R both work). The iD application has no Main
+ * fader and writes 0 dB to Main at launch. This control holds Main at 0 dB:
+ * a put sends 0 dB to CN 1-2 whatever it asks for, and get reports it.
+ *
+ * It keeps the generic control's name and format: four values, 0 ... 127
+ * in 1 dB steps, 127 = 0 dB. Value 0 is mute (0x8000), the floor the iD
+ * application writes. It shows the last value the device accepted, and
+ * every put sends all four channels.
+ */
+#define ID14_FU12_CHANNELS	4
+#define ID14_FU12_MAIN_CHANNELS	2	/* CN 1-2, held at 0 dB */
+#define ID14_FU12_MAX		127
+#define ID14_FU12_MUTE		0
+
+static const DECLARE_TLV_DB_MINMAX_MUTE(id14_fu12_tlv, -12700, 0);
+
+struct id14_fu12 {
+	struct usb_mixer_elem_list list;	/* first: snd_usb_mixer_elem_free */
+	long val[ID14_FU12_CHANNELS];
+	u8 valid;	/* bit per channel */
+};
+
+static s16 id14_fu12_raw(long val)
+{
+	return val == ID14_FU12_MUTE ? ID_DB_MIN : ID_DB(val - ID14_FU12_MAX);
+}
+
+static int id14_fu12_write(struct id14_fu12 *f, unsigned int ch, long val)
+{
+	u8 buf[2];
+	int err;
+
+	put_unaligned_le16(id14_fu12_raw(val), buf);
+	err = id_xfer(f->list.mixer, true, ID14_FU_MIX, UAC_FU_VOLUME, ch + 1, buf, sizeof(buf));
+	if (err < 0)
+		return err;
+	f->val[ch] = val;
+	f->valid |= BIT(ch);
+	return 0;
+}
+
+static int id14_fu12_info(struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = ID14_FU12_CHANNELS;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = ID14_FU12_MAX;
+	return 0;
+}
+
+static int id14_fu12_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *v)
+{
+	struct id14_fu12 *f = snd_kcontrol_chip(kctl);
+	unsigned int ch;
+
+	/* A channel that was never written reads as mute. */
+	for (ch = 0; ch < ID14_FU12_CHANNELS; ch++)
+		v->value.integer.value[ch] = f->valid & BIT(ch) ? f->val[ch] : ID14_FU12_MUTE;
+	return 0;
+}
+
+static int id14_fu12_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *v)
+{
+	struct id14_fu12 *f = snd_kcontrol_chip(kctl);
+	unsigned int ch;
+	long val;
+	int err, changed = 0;
+
+	for (ch = 0; ch < ID14_FU12_CHANNELS; ch++)
+		if (v->value.integer.value[ch] < 0 || v->value.integer.value[ch] > ID14_FU12_MAX)
+			return -EINVAL;
+
+	CLASS(snd_usb_lock, pm)(f->list.mixer->chip);
+	if (pm.err < 0)
+		return pm.err;
+
+	/* Main is held at 0 dB: report that back to the caller. */
+	for (ch = 0; ch < ID14_FU12_MAIN_CHANNELS; ch++)
+		v->value.integer.value[ch] = ID14_FU12_MAX;
+
+	for (ch = 0; ch < ID14_FU12_CHANNELS; ch++) {
+		val = v->value.integer.value[ch];
+		if (!(f->valid & BIT(ch)) || f->val[ch] != val)
+			changed = 1;
+		err = id14_fu12_write(f, ch, val);
+		if (err < 0)
+			return err;
+	}
+	return changed;
+}
+
+/*
+ * At probe, write the iD application's launch values: Main at 0 dB (the
+ * iD application has no Main fader) and Cue muted.
+ */
+static int id14_fu12_create(struct usb_mixer_interface *mixer)
+{
+	struct snd_kcontrol_new knew = {
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "Monitor Mix Playback Volume",
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE | SNDRV_CTL_ELEM_ACCESS_TLV_READ,
+		.info = id14_fu12_info,
+		.get = id14_fu12_get,
+		.put = id14_fu12_put,
+		.tlv.p = id14_fu12_tlv,
+	};
+	struct snd_kcontrol *kctl;
+	struct id14_fu12 *f;
+	unsigned int ch;
+	int err;
+
+	f = kzalloc_obj(*f);
+	if (!f)
+		return -ENOMEM;
+	f->list.mixer = mixer;
+	f->list.id = ID14_FU_MIX;
+
+	for (ch = 0; ch < ID14_FU12_CHANNELS; ch++) {
+		err = id14_fu12_write(f, ch, ch < ID14_FU12_MAIN_CHANNELS ?
+				      ID14_FU12_MAX : ID14_FU12_MUTE);
+		if (err < 0)	/* the channel stays unknown and reads as mute */
+			usb_audio_warn(mixer->chip, "iD14: cannot set FU 12 channel %u (%d)\n",
+				       ch + 1, err);
+	}
+
+	kctl = snd_ctl_new1(&knew, f);
+	if (!kctl) {
+		kfree(f);
+		return -ENOMEM;
+	}
+	kctl->private_free = snd_usb_mixer_elem_free;
+	return snd_usb_mixer_add_list(&f->list, kctl, false, true);
+}
+
 /*
  * iD14 MkI mixer crosspoints: CS 1, CN = input * 4 + output, s16 in
  * 1/256 dB. The control value is the raw s16, -128 dB (mute) ... +6 dB;
@@ -632,6 +776,9 @@ int snd_audient_id14_mk1_controls_create(struct usb_mixer_interface *mixer)
 		if (err < 0)
 			return err;
 	}
+	err = id14_fu12_create(mixer);
+	if (err < 0)
+		return err;
 	for (in = 0; in < ARRAY_SIZE(id14_mix_inputs); in++) {
 		for (out = 0; out < ID14_MIX_OUTPUTS; out++) {
 			err = id14_mix_add_ctl(mixer, in, out);
diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 63a77f3eb..2228fd34f 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -529,7 +529,7 @@ static const struct usbmix_name_map audient_id14_map[] = {
 /* Audient iD14 MkI: model-specific control map. */
 static const struct usbmix_name_map audient_id14_mk1_map[] = {
 	{ 11, NULL },			/* FU, see mixer_audient_id.c */
-	{ 12, "Monitor Mix Playback" },	/* FU, partial coverage */
+	{ 12, NULL },			/* FU, see mixer_audient_id.c */
 	{ 60, NULL },			/* MU, see mixer_audient_id.c */
 	{}
 };
-- 
2.47.3

