Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=89.253.219.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926009;
	b=3KbKhUEhBziEqKmimv1vqsxke+/+IBHpBNYYLDszEmSawFkdmUAOR1r6Xdi/4y6g/wwQ
	 7qgiEVLe2xwYXedi+t2bTUSTw299+NEMC5O+F0/40vFX+19a+wacprLygmbfT/XbfL3Eb
	 kdderp9UEOdqKQaqVV//CPigaZl4REYAtgoJCB0jlElliEz7zQTqV/7nPpi0uz01aFbw/
	 HPITgIORGfCOFBMu8zXo2lhet7rt4hegbc2pw829xoUWziYGOx512pv1WpjPsJSe+PDRi
	 wJItimvxoX7rTg4Z/S1BrmDrgHyEwvlONqyl/Njvh5nVLjdHksx9J2akfyay+EWeFrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926009;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L4jjUhCmAzYRwQ5FNsVtxBL1BU0DKL690L/TAwjo0qI=;
	b=NKbQe/3aU/7EGvI/ty7YZ4yWMR/a0leuCgGp9aReYfzSHPNT/rHKlLiNDGOiOlfpVxGD
	 rQVE7TXjfp8m6chEVrG/L4KKvPD5K8QaCwwXYB6iK4RGzEqOKU8B/LYwQZbDMCHqt/NHr
	 aSxVOaDj9b+bWEp3+QqaanheWpPMf2DSoUaauw3fihZb9m2fXhyI0+P327woqUQS5B03s
	 lbCAGRrmpV2hpd2zpHa1Cx+mL7rQyYtBOnDvk1wWY/L+m/OVXmITzNjqJWxOhhTaGI8hf
	 JqM36qOnxn95IkA2shFW+GUwWC3wzPLlxTjRXxXesVBO/R6e5sXpE+vrCvHIyqIrQzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pavel.bz;
	spf=pass smtp.mailfrom=pavel.bz;
	dkim=pass header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=mV50EWJZ;
	arc=none smtp.remote-ip=89.253.219.113
Received: from mail.pavel.bz (mail.pavel.bz [89.253.219.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7D9606A32A;
	Tue, 17 Nov 2026 14:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B7D9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pavel.bz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pavel.bz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=mV50EWJZ
Received: from p-745-g5.pavel.bz (unknown [130.94.27.201])
	by mail.pavel.bz (Postfix) with ESMTPSA id 0D40A616E7;
	Tue, 17 Nov 2026 14:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.pavel.bz 0D40A616E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pavel.bz; s=primary;
	t=1794926007; bh=L4jjUhCmAzYRwQ5FNsVtxBL1BU0DKL690L/TAwjo0qI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mV50EWJZ7O2J2oAtzTfgYe+tK7JwTZ+LIKf12NYY+O7Q7oq0jexnhp1o3o1WGe1H3
	 VpHfZw340Yza6TZjAov9xLZqTPq/V2XdyEztTi/uo7ZGQUTJFqSvfGlYG4q5xs3kYb
	 CC5yjLOmJRmSYM2ji9Rnr2IEb1ruF6MAXrnKBz3Gfc4vUPP3PdBTsdhl8Xl3uEXoRn
	 zrOs89NMGePEfJJIMfrWvm5IDEpz+LOieygOWM346RmZHmAIHpPq+YoaV7Od0w4NPT
	 KM5hCDN9n1ec5iM7wX6Y+B4JJNiVWyEMN28bi5ZB1GxUQ2wn89u+YDkRfS2qpWTa5o
	 k5Lshi5pN9D4Q==
From: Pavel Artemev <a@pavel.bz>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ALSA: usb-audio: drive XiiSound playback volume instead of skipping it
Date: Tue, 17 Nov 2026 21:33:13 +0700
Message-ID: <20261117143314.41853-2-a@pavel.bz>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117143314.41853-1-a@pavel.bz>
References: <20261117143314.41853-1-a@pavel.bz>
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
hardware volume: per-channel SET_CUR writes apply deterministically and
independently (a fast pair CN1<-50 + CN2<-100 applies exactly; a lone
channel write does not disturb its sibling), the master channel gates
both ears symmetrically, and intermediate values are audible and graded.
The vendor's Windows driver drives exactly this unit on every slider and
hardware-button step, writing all three channels with plain 0..100 raw
values mapped linearly from its slider.

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
QUIRK_FLAG_MIXER_INIT_VOLUME_MAX makes init_cur_mix_raw() initialize the
channels of volume controls to the maximum instead of the minimum: it
runs exactly where the broken-GET minimum writes would, supersedes them
(also when range discovery is deferred with -EAGAIN and initialization
repeats later from mixer_ctl_feature_info()), and touches nothing else -
controls whose GET_CUR works are read, not written, and switches keep
the safe unmuted minimum.  The existing MIXER_PLAYBACK_LINEAR_VOL and
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
exact tree also ran on the device as a DKMS module against 7.3.4: the
broken-GET stereo control is initialized to the maximum in place of
the minimum, the other controls are read but not written, and the
linear raw mapping holds (route volume restores landed as 13/100/35
on the bus for 0.5/1.0/0.7).

Closes: https://github.com/alsa-project/alsa-ucm-conf/issues/760
Closes: https://github.com/linuxmint/linuxmint/issues/822
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221401
Link: https://lore.kernel.org/linux-sound/20261116153521.188570-2-a@pavel.bz
Assisted-by: LLM
Signed-off-by: Pavel Artemev <a@pavel.bz>
---
 Documentation/sound/alsa-configuration.rst |  4 ++
 sound/usb/mixer.c                          | 13 ++++-
 sound/usb/mixer_maps.c                     | 19 -------
 sound/usb/mixer_quirks.c                   | 59 ----------------------
 sound/usb/quirks.c                         |  5 ++
 sound/usb/usbaudio.h                       | 11 ++++
 6 files changed, 32 insertions(+), 79 deletions(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index 689eccf6a..ea7f5aa31 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2413,6 +2413,10 @@ quirk_flags
           versa (same for 88200 <-> 96000 and 176400 <-> 192000).  The driver
           sends the partner rate in SET_CUR so the device ends up running at the
           requested one.
+        * bit 34: ``mixer_init_volume_max``
+          Initialize the volume control channels to the maximum value instead
+          of the minimum at mixer creation.  For devices that silence their
+          audio path while a volume channel sits at the minimum value.
 
 This module supports multiple devices, autoprobe and hotplugging.
 
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 95209ec00..bf1d9fbf0 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1310,7 +1310,18 @@ static void init_cur_mix_raw(struct usb_mixer_elem_info *cval, int ch, int idx)
 			       "%d:%d: failed to get current value for ch %d (%d)\n",
 			       cval->head.id, mixer_ctrl_intf(cval->head.mixer),
 			       ch, err);
-	snd_usb_set_cur_mix_value(cval, ch, idx, cval->min);
+	/*
+	 * QUIRK_FLAG_MIXER_INIT_VOLUME_MAX: some devices silence an audio
+	 * path while a volume channel sits at the minimum value, so
+	 * initialize those to the maximum instead.  Only volume controls:
+	 * for switches the minimum is the safe (unmuted) value.
+	 */
+	if ((cval->head.mixer->chip->quirk_flags &
+	     QUIRK_FLAG_MIXER_INIT_VOLUME_MAX) &&
+	    cval->control == UAC_FU_VOLUME)
+		snd_usb_set_cur_mix_value(cval, ch, idx, cval->max);
+	else
+		snd_usb_set_cur_mix_value(cval, ch, idx, cval->min);
 }
 
 /*
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
index 4c7d68311..583971944 100644
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
index c6d59218d..61794fdc4 100644
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
+ *  Initialize the volume control channels to the maximum instead of
+ *  the minimum; the controls remain writable and the hardware volume
+ *  operates normally afterwards.
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

base-commit: f930156051f6a3dcd454ff723ca36b14d49650d2
-- 
2.56.1

