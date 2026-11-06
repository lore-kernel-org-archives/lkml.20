Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982761;
	b=UVyam7Ngp+r01Y9LxKBXlu2oZt1SSkPvmrIWbexrJmZhTJFF0nC4Zo5OPhtJCxrTb8oS
	 FIv34A0YWBt5tOtEjqXMpplzc33GoonSpMjRqOdhmehjk85CWu0D/c6Wt6j+olYwoJqoT
	 jmZAxPHx6YmvAsj2pd+dv8mDfoo/19bvvbWTe17Jc0IqF0GrghOo/uhgeGulIySjd4eYe
	 IHu2qifl0pG9eSR63GZbzWc7SG19hRol+49Q4GkLpsbFkUpFfIO2Ekx+0dSHfrjga6k9P
	 invWjfnns4Urh9DDqTkhN+QzqJ0sTcxMQngfe8IAmb3sKFNgzPg+EAThHYTEfhqvBQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/9d+aJRLTJeL+ntWInk3kcLYgJikRaOhn6OK+A5nYG0=;
	b=JZ8IN9f4pzCdDa4IzYsK+YcbH5t4DZO88GXQnIpQ/LfS6x9BzQfNecDMWM11pfryD/gr
	 uM4smTJrCpiTMHgCZPhBHXdDgBPMdOafETqWjATOLcVv66Wsmb01DwU1R/b79OQK+L8Pd
	 5N78d+ANXiJbUSGIGhGU7LXYYpdevnncKQs1Cak77M+wyyJnTX+YMEkjJSxH7fxi8ySTH
	 U7/c8AA+7wqi3Mo/gnA+8TqvGU1dMhsz26PTEqck8gwxsOMiM+ZJutyzv8GesS7DzsymK
	 iQ2Tc6pTiAtVAwbhtmXwrKBwSvPta+uSZiN2nSc5YB6qe3bBKjv4YZ5K2TWNPQvZ9zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ml+Jh2q0;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C656083603
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1C656083603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ml+Jh2q0
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-82109f51565so353926a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982760; x=1794587560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/9d+aJRLTJeL+ntWInk3kcLYgJikRaOhn6OK+A5nYG0=;
        b=Ml+Jh2q0tEe3KB0V/o8NOCZKJhXsp8A5SEMB3AFqUbgXcGz9yTQWQWA0VSVJsUfTJ4
         wjJ7tKirw+dLWT0f9EfM1HvSmmUxTkT/666wnOwP+yEokZHUdWkT4X12lUuIHedwp64H
         r0WX+CHMLKJyY7LK0yzixeUJtK1Q2BrjpPKUoezQm9OBYwdL9zpRApyFQfBEAXGg5mOI
         KIU3xekOPQEqFUOPVVX+KJQNLZZ36tB/EDH10qQk/AhymgZc5rhT8aD6JrS3RPxX9wqT
         I/Nxie+2xedpya/CqDWbylVZN4EzqokURvdDXR4yQq4AR0OqFfqAPVH1FYCyX7gudXKt
         PgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982760; x=1794587560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/9d+aJRLTJeL+ntWInk3kcLYgJikRaOhn6OK+A5nYG0=;
        b=OnlmoogVT2G0ZUIjpC1GDBR/3i2aOOfujPqp8kPhY2M1kfaPmfRvPGb6vdwWXZ/Pg6
         dH2+Q+PPOJZBP7F0tGn8ojXKRpLhqQIv4Z+8C2aIjfSn4XYWYxlHQ/uRsf6y/R87OgXo
         l65jdIhRkLxc0DIx+RYZijhnGJ71TawTA1MA5RdqwMJklao7kZIMEzW8VsQEZAALavH3
         9fY6aAPkmb7vb2m/5Zr4hYMyvG9i84wZ6gJ8se6Y71JvPXMmlY9UyDu1RhwBeBpPGK0r
         +UxoReoSBG2HFmjf/JrEKPmapsk/fCx6IT2g/JIdJlOqWRQv5UkvTqQybXFaessDprt+
         +DpQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/6GivA+WbkZSOb1noFwgjqhGgaBKVLeIcxaCiFJuFBMDHdGHkJWpq8mYE8CIZ9w0isTm35q0BccSS5lI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8IwwbHFtAd1j3/DOXFIL52DQ8ShbfqD0Q2yaTjEhm6A56pGUq
	ELpkvNzdIpJvN+k6266UMfWxTeZ4xd5gKhf52T0p06IIrg7UPoDSgNzH
X-Gm-Gg: AYBFou1EovRBuNxpir8I3dn+XxVipBZnSTgwJ6jdSIbH4SYT+ApKGesqaH4IQR7FqRL
	uuH/bxZNI90urdn3oOpWRK9mEU11BhGR4R8nyf1MEmbXxP4JB4ICRD9/TSYmpRU5XcqeKCy4ria
	Xfbvrn2C/tmjwt9Uwwlo4xpQ+xwLWuHesfnj+gBb9BjTT4iACvgXX5DlJNJV5BkIgfecbJvM3xM
	lXiyQ1FrGV2sqlAKTcEAQNbM6ljy3VpyRcD3a7TlZZKHSTtX5RWdsTx8WnZkf0lS34ucuRSwH+f
	Pk9XsvZxz5u5gxz9/3Dfda/bMa3NTMWhkxIgEDY8eeSXzxAHJxmgVPoO3RLIJ+kQQsqEbL7itA8
	BCHq/c/uwCl1MFe4KpzvWVSoekGrFKh0yi+/ExFmI+KLwJ5nynZBcDvwFy8oz8wA6IDs/zukMbu
	Cnknh+GFf0iZ5LEzccxagvlRkhnL0ncd8moyy8VrezkX+JCs8Ccja0J5wfO+1NoJKYlOOpOOELG
	R22OCpX/WX836d+4uloy10guti5ql1+AALY74dsrnAaPrHMXhrLNC4fj7A0dBZRTGnaevIBsK61
	bfMdauwcIAz7i+YyNNA9OTaNEVkt3ZLtCCnwsn0GmJlIsg==
X-Received: by 2002:a05:6830:411f:b0:821:a094:b26d with SMTP id 46e09a7af769-85f1cf5a654mr2976333a34.13.1793982759657;
        Fri, 06 Nov 2026 08:32:39 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:39 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 16/16] ALSA: mixer_audient: Replace the Audient iD14 MkI FU 12 control
Date: Fri,  6 Nov 2026 10:31:29 -0600
Message-ID: <20261106163129.1006907-17-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106163129.1006907-1-mrwillporter@gmail.com>
References: <aupn1wwW7w08M3gu@khmer.arcnet>
 <20261106163129.1006907-1-mrwillporter@gmail.com>
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

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 167 ++++++++++++++++++++++++++++++++++++++
 sound/usb/mixer_maps.c    |   2 +-
 2 files changed, 168 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index ad39d17c0b5e..e65c62e1eac4 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -491,11 +491,15 @@ static const char *const snd_audient_id14_mk1_matrix[] = {
 	NULL
 };
 
+static int snd_audient_id14_mk1_create(struct usb_mixer_interface *mixer);
+
 static const struct audient_devinfo {
 	u32 usb_id;
 	const struct snd_audient_ctrl *controls;
 	const char *const *const matrix_names;
 	const unsigned int matrix_channels;
+	/* controls the tables cannot describe; called after the tables */
+	int (*create)(struct usb_mixer_interface *mixer);
 } audient_devinfo[] = {
 	{
 		.usb_id = USB_ID(USB_AUDIENT_VID, USB_EVO4_PID),
@@ -508,6 +512,7 @@ static const struct audient_devinfo {
 		.controls = snd_audient_id14_mk1_controls,
 		.matrix_names = snd_audient_id14_mk1_matrix,
 		.matrix_channels = 2,
+		.create = snd_audient_id14_mk1_create,
 	},
 	{ 0 } /* sentinel */
 };
@@ -1132,6 +1137,165 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 }
 
 
+/*
+ * iD14 MkI FU 12, the mixer output level: CN 1-2 Main, 3-4 Cue. GET RANGE
+ * works (-127 ... 0 dB, 1 dB steps), but GET CUR returns a reply buffer the
+ * device shares with other units, not the FU 12 value. So the generic
+ * control shows stale data, and its sticky-GET check passes and then writes
+ * that stale value to Main L.
+ *
+ * The firmware ignores Main L (CN 1) but applies Main R (CN 2), so any Main
+ * level other than 0 dB unbalances the main outputs (Cue L and Cue R both
+ * work). This control holds Main at 0 dB: a put sends 0 dB to CN 1-2
+ * whatever it asks for, and get reports it.
+ *
+ * It keeps the generic control's name and format: four values, 0 ... 127
+ * in 1 dB steps, 127 = 0 dB, 0 = mute (0x8000). It shows the last value the
+ * device accepted, and every put sends all four channels.
+ */
+#define ID14_FU12_CHANNELS	4
+#define ID14_FU12_MAIN_CHANNELS	2	/* CN 1-2, held at 0 dB */
+#define ID14_FU12_MAX		127
+#define ID14_FU12_MUTE		0
+
+static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_id14_fu12, -12700, 0);
+
+static const struct snd_audient_ctrl_type snd_audient_id14_fu12_type = {
+	.len = 2,
+	.unit = ID14_FU_MIX,
+	.sel = UAC_FU_VOLUME,
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
+	__le16 buf = cpu_to_le16(val == ID14_FU12_MUTE ? -128 * 256
+				 : (val - ID14_FU12_MAX) * 256);
+	int ret;
+
+	ret = snd_audient_set_cur(f->list.mixer, &snd_audient_id14_fu12_type,
+				  ch + 1, &buf);
+	if (ret < 0)
+		return ret;
+
+	f->val[ch] = val;
+	f->valid |= BIT(ch);
+
+	return 0;
+}
+
+static int snd_ctl_audient_id14_fu12_info(struct snd_kcontrol *kctl,
+					  struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = ID14_FU12_CHANNELS;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = ID14_FU12_MAX;
+
+	return 0;
+}
+
+static int snd_ctl_audient_id14_fu12_get(struct snd_kcontrol *kctl,
+					 struct snd_ctl_elem_value *ctl_val)
+{
+	struct snd_audient_id14_fu12 *f = snd_kcontrol_chip(kctl);
+	unsigned int ch;
+
+	/* a channel that was never written reads as mute */
+	for (ch = 0; ch < ID14_FU12_CHANNELS; ch++)
+		ctl_val->value.integer.value[ch] = (f->valid & BIT(ch))
+						   ? f->val[ch]
+						   : ID14_FU12_MUTE;
+
+	return 0;
+}
+
+static int snd_ctl_audient_id14_fu12_set(struct snd_kcontrol *kctl,
+					 struct snd_ctl_elem_value *ctl_val)
+{
+	struct snd_audient_id14_fu12 *f = snd_kcontrol_chip(kctl);
+	long *const v = ctl_val->value.integer.value;
+	unsigned int ch;
+	int changed = 0;
+
+	for (ch = 0; ch < ID14_FU12_CHANNELS; ch++)
+		if (v[ch] < 0 || v[ch] > ID14_FU12_MAX)
+			return -EINVAL;
+
+	CLASS(snd_usb_lock, pm)(f->list.mixer->chip);
+	if (pm.err < 0)
+		return pm.err;
+
+	/* Main is held at 0 dB: report that back to the caller */
+	for (ch = 0; ch < ID14_FU12_MAIN_CHANNELS; ch++)
+		v[ch] = ID14_FU12_MAX;
+
+	for (ch = 0; ch < ID14_FU12_CHANNELS; ch++) {
+		int ret;
+
+		if (!(f->valid & BIT(ch)) || f->val[ch] != v[ch])
+			changed = 1;
+
+		ret = snd_audient_id14_fu12_write(f, ch, v[ch]);
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
+	struct snd_kcontrol_new knew = {
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "Monitor Mix Playback Volume",
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE
+			  | SNDRV_CTL_ELEM_ACCESS_TLV_READ,
+		.info = snd_ctl_audient_id14_fu12_info,
+		.get = snd_ctl_audient_id14_fu12_get,
+		.put = snd_ctl_audient_id14_fu12_set,
+		.tlv.p = snd_audient_tlv_id14_fu12,
+	};
+	struct snd_audient_id14_fu12 *f;
+	struct snd_kcontrol *kctl;
+	unsigned int ch;
+
+	f = kzalloc_obj(*f);
+	if (!f)
+		return -ENOMEM;
+
+	f->list.mixer = mixer;
+	f->list.id = ID14_FU_MIX;
+
+	for (ch = 0; ch < ID14_FU12_CHANNELS; ch++) {
+		const int ret = snd_audient_id14_fu12_write(f, ch,
+				ch < ID14_FU12_MAIN_CHANNELS ? ID14_FU12_MAX
+							     : ID14_FU12_MUTE);
+
+		if (ret < 0)	/* the channel stays unknown and reads as mute */
+			usb_audio_warn(mixer->chip,
+				       "iD14: cannot set FU 12 channel %u (%d)\n",
+				       ch + 1, ret);
+	}
+
+	kctl = snd_ctl_new1(&knew, f);
+	if (!kctl) {
+		kfree(f);
+		return -ENOMEM;
+	}
+
+	kctl->private_free = snd_usb_mixer_elem_free;
+
+	return snd_usb_mixer_add_list(&f->list, kctl, false, true);
+}
+
 /* called from mixer_quirks.c */
 int snd_audient_controls_create(struct usb_mixer_interface *mixer)
 {
@@ -1171,5 +1335,8 @@ int snd_audient_controls_create(struct usb_mixer_interface *mixer)
 		}
 	}
 
+	if (info->create)
+		return info->create(mixer);
+
 	return 0;
 }
diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 30673bbbf762..d719aa6e4c97 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -529,7 +529,7 @@ static const struct usbmix_name_map audient_id14_map[] = {
 /* Audient iD14 MkI: model-specific control map. */
 static const struct usbmix_name_map audient_id14_mk1_map[] = {
 	{ 11, NULL },			/* FU, see mixer_audient.c */
-	{ 12, "Monitor Mix Playback" },	/* FU, partial coverage */
+	{ 12, NULL },			/* FU, see mixer_audient.c */
 	{ 60, NULL },			/* MU, see mixer_audient.c */
 	{}
 };
-- 
2.47.3

