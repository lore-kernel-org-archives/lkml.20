Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=89.253.219.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843349;
	b=IVIriOZDBr2sOzB9xrDU66UZkMkgb6204SCPsaucZWBShYuAy0RHs04Y3ceMCeInalzf
	 sZtwZdNfrg2meD+SE9aM3f/nCZu4hENKiReJ95HBrw6OwFSa2GAIYNY6K2DoTXl+ZPG9F
	 0TURL6uBZ8gFNL9AhDF/bWjVxn+5gZZO9JylvGl4+wEnccG7QUWjvIXXBoWzl9rV96xVr
	 gCEu9AptjBSIcZdjBhTBRI+iVicjDYofb8B9MXHMbGQn3VgeKUcEzuetPyMF9WukQBjIG
	 0qclHxK5HdkAUrXej5vqMVoNVTFmaDbleYzox/3vIR55voxnZhNFN/rCiSXQArARo4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843349;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PFDkUoBde82ZqlM3CEocIkldTYpUm6HYgTj1BM5xcl4=;
	b=TbCKXRzUO8hEMfB/68QvExc/xqq58hVSNqp/sabf6TfenvWtots1eu2gR33S/VOwx3Qs
	 ndAFlx0C58bbk8T+/F1Gym3Rr1PGZlXXQJogLkNzJ9VWFhktXt8xUY2Zb/O/Sxhwwvj2o
	 c+4ByHNWNbkUZm3Xp2IkBNNx6UVNotJoeulU3oaBmzxEVVcgFESS0x/RscPZiU6hZaSSf
	 QRzbNecSooOfzG5E2x1gdZBdkY1p/Z7e4A6hJ6/k/vQoImO17bh5zNYTA6DLx/Tbm4Gz5
	 fuj8bm7Cg3C5eUGgpZGCsiXrJ0LJtZyg98ydpm9Ef4Ws43iU9VJc7jRtdPr7JDQNHhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pavel.bz;
	spf=pass smtp.mailfrom=pavel.bz;
	dkim=pass header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=hxGz5Yv9;
	arc=none smtp.remote-ip=89.253.219.113
Received: from mail.pavel.bz (mail.pavel.bz [89.253.219.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674F7606A32A;
	Mon, 16 Nov 2026 15:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 674F7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pavel.bz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pavel.bz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=hxGz5Yv9
Received: from p-745-g5.lan (unknown [182.53.106.11])
	by mail.pavel.bz (Postfix) with ESMTPSA id 9C7B8616A1;
	Mon, 16 Nov 2026 15:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.pavel.bz 9C7B8616A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pavel.bz; s=primary;
	t=1794843340; bh=PFDkUoBde82ZqlM3CEocIkldTYpUm6HYgTj1BM5xcl4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hxGz5Yv9Hw96sN+XIrXZShuDB1CvAr/zV8DjKjrSXE3vMCqpSRfkpazoVeRoY+nkb
	 v+f7bfi9JhEq1AjsGM/MIVXioLNzthUB/nP40VhE2hNvP6XYeXDU+E2ip79LIy5bBo
	 bYEj9huLx97VPLzKMRDzPAYLh1FyaGzz8Yr9kj443qtTswuDA+ffvv6NjYG7i+3gTk
	 OXb7RSvx2tPlYW/uKsWB76CWs85VsvM6/ik8q8/vmLKWABS6MsYanulYp28jNwNwKx
	 AIzsQ0lSQtKB5VAQM1yttYIsHBrUEXqJPqQtO/+ZTRdAy6TC5TolTQkaNG1A25uNZu
	 wg59fwR10DMIQ==
From: Pavel Artemev <a@pavel.bz>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] ALSA: usb-audio: drive XiiSound playback volume instead of skipping it
Date: Mon, 16 Nov 2026 22:35:20 +0700
Message-ID: <20261116153521.188570-2-a@pavel.bz>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116153521.188570-1-a@pavel.bz>
References: <20261116153521.188570-1-a@pavel.bz>
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

Replace the XiiSound (040b:0897) playback feature unit workaround from
commit ba9bccdf711a ("ALSA: usb-audio: Skip broken playback feature unit
on XiiSound chips") with quirk flags that keep the unit exposed and make
its hardware volume work.

Wire-level captures (usbmon on Linux, USBPcap on the vendor's own
Windows 10 stack) show the playback feature unit is functional as a
hardware volume: per-channel SET_CUR writes apply deterministically,
the master channel gates both ears symmetrically, and intermediate
values are audible and graded.  Windows drives exactly this unit on
every slider and button step, writing all three channels with plain
0..100 raw values mapped linearly from its slider.

The "any volume below the maximum mutes one or both channels" behaviour
that motivated the skip is host-side, not firmware:

  * the unit advertises a bogus 0.00..0.39 dB range, under which every
    user-space volume at or below 0 dB - the whole normal PipeWire
    range, 100% included - resolves to the raw minimum, which silences
    the channel;
  * the stereo volume control's GET_CUR returns a constant value, so
    the sanity check classifies it as broken and init_cur_mix_raw()
    writes the minimum to both channels at every mixer build;
  * user space applies one logical volume change as fragmented writes
    (one per channel, the first carrying the stale sibling value), and
    these devices silently drop control writes in the first seconds
    after enumeration, so a channel can be left behind at a stale
    value that no later write corrects.

Enable three quirk flags for 040b:0897.  The new
QUIRK_FLAG_MIXER_INIT_VOLUME_MAX initializes all channels of every
volume control to the maximum once at mixer creation (superseding the
probe-time minimum writes; on the wire the sequence per channel is
minimum then maximum), and the existing MIXER_PLAYBACK_LINEAR_VOL and
MIXER_CAPTURE_LINEAR_VOL replace the bogus dB scale with a linear one,
so user-space volumes map onto the full raw range.  The controls stay
writable; hardware volume then behaves like on Windows.

The create-time pin writes of the previous quirk sit inside that
post-enumeration write-loss window and are dropped along with every
other early write; the device comes up audible after a plug only
because it powers up with every volume channel at the maximum, which
the explicit init reproduces if a write ever does land.  No separate
resume re-pin is needed: with the controls created, the standard mixer
resume path restores the cached values.

Testing: the same flag combination ran on the device as a locally
built DKMS module against a 7.2 tree through a wire-level verification
campaign: the initialization writes were observed on the bus at every
mixer build, the full raw range became reachable from PipeWire (route
volumes 0/13/100 for 0.0/0.5/1.00), and mute and balance track.  This
upstream form compiles for sound/usb without warnings and passes
checkpatch, but has not been load-tested as-is.

Closes: https://github.com/alsa-project/alsa-ucm-conf/issues/760
Closes: https://github.com/linuxmint/linuxmint/issues/822
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221401
Assisted-by: LLM
Signed-off-by: Pavel Artemev <a@pavel.bz>
---
 Documentation/sound/alsa-configuration.rst |  4 +
 sound/usb/mixer_maps.c                     | 19 -----
 sound/usb/mixer_quirks.c                   | 99 +++++++++-------------
 sound/usb/quirks.c                         |  5 ++
 sound/usb/usbaudio.h                       | 11 +++
 5 files changed, 60 insertions(+), 78 deletions(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index 689eccf6a..da5eb7a0b 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2413,6 +2413,10 @@ quirk_flags
           versa (same for 88200 <-> 96000 and 176400 <-> 192000).  The driver
           sends the partner rate in SET_CUR so the device ends up running at the
           requested one.
+        * bit 34: ``mixer_init_volume_max``
+          Initialize all channels of the volume controls to the maximum value
+          at mixer creation.  For devices that silence their audio path while
+          a volume channel sits at the minimum value.
 
 This module supports multiple devices, autoprobe and hotplugging.
 
diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 9218ca631..98b414621 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -374,20 +374,6 @@ static const struct usbmix_name_map dell_alc4020_map[] = {
 	{ 0 }
 };
 
-/*
- * Weltrend XiiSound chips (040b:0897, e.g. Redragon H878):
- * the playback feature unit is broken; its volume controls act like
- * mute switches below the maximum value and the channel mapping is
- * unreliable, so any hardware volume change mutes one or both
- * channels.  Skip the unit entirely and let userspace fall back to
- * software volume; the unit is pinned to maximum/unmuted by the
- * mixer quirk in mixer_quirks.c.
- */
-static const struct usbmix_name_map xiisound_map[] = {
-	{ 5, NULL },	/* playback feature unit */
-	{ 0 }
-};
-
 /*
  * Corsair Virtuoso calls everything "Headset" without this, leading to
  * applications moving the sidetone control instead of the main one.
@@ -804,11 +790,6 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.id = USB_ID(0x1395, 0x0025),
 		.map = sennheiser_pc8_map,
 	},
-	{
-		/* Weltrend XiiSound (Redragon H878) */
-		.id = USB_ID(0x040b, 0x0897),
-		.map = xiisound_map,
-	},
 	{
 		/* Microsoft USB Link headset */
 		.id = USB_ID(0x045e, 0x083c),
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 4c7d68311..95877685b 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4603,59 +4603,6 @@ static int snd_audiofuse_controls_create(struct usb_mixer_interface *mixer)
 	return err;
 }
 
-/*
- * Weltrend XiiSound chips (040b:0897, e.g. Redragon H878):
- * the playback feature unit (id 5) is broken; its volume controls act like
- * mute switches below the maximum value and the channel mapping is
- * unreliable, so the unit is hidden from userspace entirely (see the
- * quirk in mixer_maps.c) and userspace falls back to software volume.
- * Pin the unit's master and channel volumes to the reported maximum
- * and unmute them, so the audio path stays fully open.
- */
-static int snd_xiisound_init_fu_pins(struct usb_mixer_interface *mixer)
-{
-	struct snd_usb_audio *chip = mixer->chip;
-	unsigned char buf[2];
-	int ifnum, ch, err;
-
-	if (mixer->protocol != UAC_VERSION_1)
-		return 0;
-
-	ifnum = snd_usb_ctrl_intf(chip->ctrl_intf);
-
-	/* unit 5 is the playback feature unit on these chips */
-	for (ch = 0; ch <= 2; ch++) {
-		err = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0),
-				      UAC_GET_MAX,
-				      USB_DIR_IN | USB_TYPE_CLASS |
-				      USB_RECIP_INTERFACE,
-				      (UAC_FU_VOLUME << 8) | ch,
-				      (5 << 8) | ifnum, buf, 2);
-		if (err < 2)
-			return 0; /* no such unit/channels, nothing to pin */
-
-		err = snd_usb_ctl_msg(chip->dev, usb_sndctrlpipe(chip->dev, 0),
-				      UAC_SET_CUR,
-				      USB_DIR_OUT | USB_TYPE_CLASS |
-				      USB_RECIP_INTERFACE,
-				      (UAC_FU_VOLUME << 8) | ch,
-				      (5 << 8) | ifnum, buf, 2);
-		if (err < 0)
-			return err;
-
-		buf[0] = 0; /* unmute */
-		err = snd_usb_ctl_msg(chip->dev, usb_sndctrlpipe(chip->dev, 0),
-				      UAC_SET_CUR,
-				      USB_DIR_OUT | USB_TYPE_CLASS |
-				      USB_RECIP_INTERFACE,
-				      (UAC_FU_MUTE << 8) | ch,
-				      (5 << 8) | ifnum, buf, 1);
-		if (err < 0)
-			return err;
-	}
-	return 0;
-}
-
 int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 {
 	int err = 0;
@@ -4669,9 +4616,6 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x0644, 0x8047):
 		err = snd_us16x08_controls_create(mixer);
 		break;
-	case USB_ID(0x040b, 0x0897):
-		err = snd_xiisound_init_fu_pins(mixer);
-		break;
 	case USB_ID(0x041e, 0x3020):
 	case USB_ID(0x041e, 0x3040):
 	case USB_ID(0x041e, 0x3042):
@@ -4863,9 +4807,6 @@ void snd_usb_mixer_resume_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x0bda, 0x4014): /* Dell WD15 dock */
 		dell_dock_mixer_init(mixer);
 		break;
-	case USB_ID(0x040b, 0x0897): /* Weltrend XiiSound (Redragon H878) */
-		snd_xiisound_init_fu_pins(mixer);
-		break;
 	}
 }
 
@@ -5218,6 +5159,41 @@ static void snd_fix_plt_name(struct snd_usb_audio *chip,
 	usb_audio_dbg(chip, "something wrong in kctl name %s\n", id->name);
 }
 
+/*
+ * A Feature Unit volume channel left at the minimum value silences its
+ * audio path on some devices.  Write the maximum volume to all channels
+ * once at mixer creation, so that the audio path is open; the controls
+ * remain writable and the hardware volume operates normally afterwards.
+ */
+static void snd_usb_mixer_init_volume_max(struct usb_mixer_interface *mixer,
+					  struct usb_mixer_elem_info *cval)
+{
+	int i, idx, err;
+
+	usb_audio_info(mixer->chip, "applying init volume max quirk\n");
+
+	if (!cval->cmask) {
+		/* master channel */
+		err = snd_usb_set_cur_mix_value(cval, 0, 0, cval->max);
+		if (err < 0)
+			usb_audio_dbg(mixer->chip, "cannot init control %d ch 0 to max: %d\n",
+				      cval->control, err);
+		return;
+	}
+
+	idx = 0;
+	for (i = 0; i < MAX_CHANNELS; i++) {
+		if (!(cval->cmask & BIT(i)))
+			continue;
+		/* per-channel writes apply independently; keep going on error */
+		err = snd_usb_set_cur_mix_value(cval, i + 1, idx, cval->max);
+		if (err < 0)
+			usb_audio_dbg(mixer->chip, "cannot init control %d ch %d to max: %d\n",
+				      cval->control, i + 1, err);
+		idx++;
+	}
+}
+
 void snd_usb_mixer_fu_apply_quirk(struct usb_mixer_interface *mixer,
 				  struct usb_mixer_elem_info *cval, int unitid,
 				  struct snd_kcontrol *kctl)
@@ -5265,6 +5241,11 @@ void snd_usb_mixer_fu_apply_quirk(struct usb_mixer_interface *mixer,
 		if (cval->control == UAC_FU_VOLUME && strstr(kctl->id.name, "Capture"))
 			snd_usb_mixer_fu_quirk_linear_scale(mixer, cval, kctl);
 
+	/* devices that silence a channel left at the minimum value */
+	if (mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_INIT_VOLUME_MAX)
+		if (cval->control == UAC_FU_VOLUME)
+			snd_usb_mixer_init_volume_max(mixer, cval);
+
 	/* ALSA-ify some Plantronics headset control names */
 	if (USB_ID_VENDOR(mixer->chip->usb_id) == 0x047f &&
 	    (cval->control == UAC_FU_MUTE || cval->control == UAC_FU_VOLUME))
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a4eb0d0cd..6ef6d4410 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2502,6 +2502,10 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_FIXED_RATE),
 	DEVICE_FLG(0x03f0, 0x654a, /* HP 320 FHD Webcam */
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
+	DEVICE_FLG(0x040b, 0x0897, /* XiiSound/Weltrend Temple and rebranded headsets */
+		   QUIRK_FLAG_MIXER_INIT_VOLUME_MAX |
+		   QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL |
+		   QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL),
 	DEVICE_FLG(0x041e, 0x3000, /* Creative SB Extigy */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x041e, 0x324d, /* Creative Sound Blaster Play! 3 */
@@ -2979,6 +2983,7 @@ static const char *const snd_usb_audio_quirk_flag_names[] = {
 	QUIRK_STRING_ENTRY(PLAYBACK_URB_FIXUP),
 	QUIRK_STRING_ENTRY(ALWAYS_SET_RATE),
 	QUIRK_STRING_ENTRY(SWAP_RATES),
+	QUIRK_STRING_ENTRY(MIXER_INIT_VOLUME_MAX),
 	NULL
 };
 
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index c6d59218d..ba505e1b9 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -262,6 +262,15 @@ extern bool snd_usb_skip_validation;
  *  The device applies a requested sample rate to the other base-rate family
  *  (44100 <-> 48000, 88200 <-> 96000, 176400 <-> 192000).  Send the partner
  *  rate in SET_CUR so that the device runs at the requested rate.
+ * QUIRK_FLAG_MIXER_INIT_VOLUME_MAX
+ *  A Feature Unit volume channel left at the minimum value silences its
+ *  audio path on some devices; user space that does not write all
+ *  channels of such a control would leave the device silent.  Where
+ *  GET_CUR is broken the kernel additionally discards the test values
+ *  and initializes the channels to the minimum at every mixer build.
+ *  Initialize all channels of the volume controls to the maximum once
+ *  at mixer creation; the controls remain writable and the hardware
+ *  volume operates normally afterwards.
  */
 
 enum {
@@ -299,6 +308,7 @@ enum {
 	QUIRK_TYPE_PLAYBACK_URB_FIXUP		= 31,
 	QUIRK_TYPE_ALWAYS_SET_RATE		= 32,
 	QUIRK_TYPE_SWAP_RATES			= 33,
+	QUIRK_TYPE_MIXER_INIT_VOLUME_MAX	= 34,
 /* Please also edit snd_usb_audio_quirk_flag_names and alsa-configuration.rst */
 };
 
@@ -338,5 +348,6 @@ enum {
 #define QUIRK_FLAG_PLAYBACK_URB_FIXUP		QUIRK_FLAG(PLAYBACK_URB_FIXUP)
 #define QUIRK_FLAG_ALWAYS_SET_RATE		QUIRK_FLAG(ALWAYS_SET_RATE)
 #define QUIRK_FLAG_SWAP_RATES			QUIRK_FLAG(SWAP_RATES)
+#define QUIRK_FLAG_MIXER_INIT_VOLUME_MAX	QUIRK_FLAG(MIXER_INIT_VOLUME_MAX)
 
 #endif /* __USBAUDIO_H */
-- 
2.56.1

