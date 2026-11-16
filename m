Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=89.253.219.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843346;
	b=l5BArwQhm4D6RcGQAZEUAXPFJn6gSsAIwwZn6x0p5GWB5FLia5UcvsAz52ZQ/zpZnrRp
	 ZeWmyHlJrqnNpgySxVPB7OVIXA0i7Tpa9B45HRW7nEqxc8buKpHvamCLqlm8fa/C2E3v8
	 A4yeI/Hj+Tu60jHsuhkxyPUATsQEwZMVfNRiSP7W77ZdqPHTeeyqgV6CEeQiOK2RFTev6
	 vai9Z/eheb0iOSF4YeDG97fkPcTTU9xjCw/1tlRELSE5gdh/z6N9q+COrsRT4OY0/e+X3
	 ekmZvBM60Zys5L3/Zuuj+4H7bEIotmuR0VrlFkTAOhY+syVlPXe7dp8g90YVrmEjfZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843346;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JIR1f2fq9yiZ/XinkXhF0qRH/DJokrhRMy1ABhzPPVg=;
	b=mUUJnFwzMADx3DMJ+6fnzEQtqN0980aAmQSSb8Q5JPiarGnBTLt0c0HqjkYrhbNc6s4K
	 6Gt6wjJCLAaSlufrZmmLn5P92ABdGIb0OyvZMkrzMMX12YnSmwP1zv2FA7SRYeY+Em7LY
	 smfdqrrzVo7h+W12VQxb7uWTZzAF+Ri9z7VnRFXjGNA2ZM9bA8+HbbZzVP/qXIKv6yp/0
	 C0c34S9Kj3/GIk8KMYxU94kv0pyRMnfllczNhQhmTqBKaM3a7sSAaVrVz0UCepbXzmmwx
	 U2R5TLmU8wZsKqHS48xhYD4wziVRVYXCSSJ3ocO4yJkL7bY/0lSsjxZjwMmSJGK+g1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pavel.bz;
	spf=pass smtp.mailfrom=pavel.bz;
	dkim=pass header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=QxikDR2K;
	arc=none smtp.remote-ip=89.253.219.113
Received: from mail.pavel.bz (mail.pavel.bz [89.253.219.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA88606A323;
	Mon, 16 Nov 2026 15:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABA88606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pavel.bz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pavel.bz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=QxikDR2K
Received: from p-745-g5.lan (unknown [182.53.106.11])
	by mail.pavel.bz (Postfix) with ESMTPSA id 1937B616A2;
	Mon, 16 Nov 2026 15:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.pavel.bz 1937B616A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pavel.bz; s=primary;
	t=1794843344; bh=JIR1f2fq9yiZ/XinkXhF0qRH/DJokrhRMy1ABhzPPVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QxikDR2KGRY/qrcorLkWcztpx7kmk9sNsFeVPfgV68tQglGelVke8Qhl4noxKfMg8
	 C1HDYXRC5HGCutWMrkdJBdWsxY249QDzKvjWerSDj5G145KkCFYPypbySGCAY5gGOD
	 A0shgrfIulzqlrzR9PkeBJ1s0PJt5qeczw2dJr53Liqky/51HeQBGaI/5zke+REsK3
	 q9Nt7gsuzyWEocgxwAnJjkKng+BbRflJQXWSArbf/X06m0x5loPho2In9IIT/pZSjx
	 ajoOUs269uRTpR4AZAS2+0WolW+6toyTNOQQ8rBRdGfjf7xCdiWXsQxsl6rXDUNKN6
	 191O25y5bYGPA==
From: Pavel Artemev <a@pavel.bz>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] ALSA: usb-audio: add MIXER_STATE_REPUSH quirk flag
Date: Mon, 16 Nov 2026 22:35:21 +0700
Message-ID: <20261116153521.188570-3-a@pavel.bz>
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

Some USB audio devices silently drop Feature Unit control writes in
the first seconds after USB enumeration, and occasionally drop
individual writes at any later time as well.  When GET_CUR on such a
device is broken there is no way to detect the divergence by reading
back, so the state the host believes in silently drifts from the
hardware state: a channel left at a stale value is never corrected.

The Windows driver of one such chipset (Weltrend/XiiSound, 040b:0897)
handles this by never reading back at all.  USBPcap captures of it
show a single source of truth for the whole channel picture, every
channel of a control written in one short burst - master first, then
the channels - and the complete state re-pushed at every device open.
That every-open re-push is the load-bearing mechanism: it repairs
whatever writes were swallowed around enumeration.

Add QUIRK_FLAG_MIXER_STATE_REPUSH, which replicates that write
discipline in the driver:

  * control puts only record values; the cache is defined as "what
    user space last asked for" and is never read back from the device;
  * a single deferred flush (30 ms quiescence) writes each touched
    feature unit in one burst, master first, derived as the loudest
    channel - never asserted from its own possibly stale cache, and
    never overriding a value user space put explicitly;
  * a PCM stream open requests a full-state re-push of all cached
    volume values, merged into the same timer so a burst never
    observes a half-applied gesture (user space applies one logical
    volume change as multiple per-channel writes and opens streams
    mid-gesture for UI feedback sounds).

Mute switches are only written when user space changed them: a lost
re-assert can at worst fail to mute (power-up is unmuted), and mute
writes during playback audibly chop the stream on these devices.

Volume writes are delayed by the quiescence window, which is not
perceptible for a volume control.

The flag is enabled for 040b:0897, whose loss window was measured on
the wire at 6.5-9 s after enumeration with a ragged tail (beep-ACKed
limit-write probes at increasing delays).

Testing: ran on the device as a locally built DKMS module (7.2 tree,
daily use over 10 days) and wire-verified: 21 volume gestures produced
21 bursts of exactly one write per channel in the master-first order,
no readbacks, no re-sends; endpoint limit notifications fire only on
user arrivals at a limit; no stream chops during playback; replug,
suspend/resume, balance and mute pass end to end.  This upstream port
compiles for sound/usb without warnings and passes checkpatch, but has
not been load-tested as-is.

Closes: https://github.com/alsa-project/alsa-ucm-conf/issues/760
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221401
Assisted-by: LLM
Signed-off-by: Pavel Artemev <a@pavel.bz>
---
 Documentation/sound/alsa-configuration.rst |   5 +
 sound/usb/mixer.c                          | 286 ++++++++++++++++++++-
 sound/usb/mixer.h                          |  10 +
 sound/usb/pcm.c                            |   4 +
 sound/usb/quirks.c                         |   2 +
 sound/usb/usbaudio.h                       |  16 ++
 6 files changed, 316 insertions(+), 7 deletions(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index da5eb7a0b..349a6459d 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2417,6 +2417,11 @@ quirk_flags
           Initialize all channels of the volume controls to the maximum value
           at mixer creation.  For devices that silence their audio path while
           a volume channel sits at the minimum value.
+        * bit 35: ``mixer_state_repush``
+          Defer volume and mute writes into one burst per feature unit, and
+          re-push the complete cached mixer state at every PCM stream open.
+          For devices that silently drop control writes around enumeration
+          and whose controls cannot be read back.
 
 This module supports multiple devices, autoprobe and hotplugging.
 
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 95209ec00..7a5d3ffe5 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -37,6 +37,7 @@
 #include <linux/usb/audio.h>
 #include <linux/usb/audio-v2.h>
 #include <linux/usb/audio-v3.h>
+#include <linux/workqueue.h>
 
 #include <sound/core.h>
 #include <sound/control.h>
@@ -1597,11 +1598,229 @@ static int mixer_ctl_feature_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+
+
+/*
+ * Atomic mixer write bursts (QUIRK_FLAG_MIXER_STATE_REPUSH).
+ *
+ * Some devices silently drop mixer writes issued in the first seconds
+ * after USB enumeration, and can drop individual writes at any later
+ * time as well; GET_CUR is broken on them, so the divergence cannot
+ * be detected by reading back.  The vendor's Windows driver never
+ * reads either: it collects the whole channel picture at a single
+ * source of truth and writes every channel of a control in one short
+ * burst (master first), re-pushing the complete state at every device
+ * open.
+ *
+ * User space applies one logical volume change as multiple fragmented
+ * control writes (one per channel, the first carrying stale siblings),
+ * so the stock write-per-put path cannot produce that burst.  Puts
+ * therefore only record values - the cache is defined as "what user
+ * space last asked for" and is never read back from the device - and
+ * a single flush timer coalesces the fragments.  When it fires, each
+ * touched feature unit is written in the Windows order: the master,
+ * derived as the loudest channel, first, then the changed channels,
+ * one write each.  A stream open requests a full-state re-push
+ * (healing writes lost in the post-enumeration window), merged into
+ * the same timer so a burst never observes a half-applied gesture
+ * (user space opens streams mid-gesture for UI feedback sounds).
+ */
+
+/* quiescence window for the flush; user space applies a stereo change
+ * as two control writes 5..20 ms apart
+ */
+#define MIXER_FLUSH_DELAY	msecs_to_jiffies(30)
+
+static bool is_feature_volume_mute_ctl(struct usb_mixer_elem_info *cval)
+{
+	if (!cval->head.kctl || !cval->head.kctl->info)
+		return false;
+	if (cval->head.kctl->info != mixer_ctl_feature_info)
+		return false;
+	return cval->control == UAC_FU_VOLUME || cval->control == UAC_FU_MUTE;
+}
+
+/* Re-send every cached channel of one control, unchanged values
+ * included
+ */
+static void repush_ctl_cached(struct usb_mixer_elem_info *cval)
+{
+	int c, err, idx = 0;
+
+	if (cval->cmask) {
+		for (c = 0; c < MAX_CHANNELS; c++) {
+			if (!(cval->cmask & BIT(c)))
+				continue;
+			if (test_bit(c + 1, cval->cached)) {
+				err = snd_usb_set_cur_mix_value(cval, c + 1,
+						idx, cval->cache_val[idx]);
+				if (err < 0)
+					usb_audio_dbg(cval->head.mixer->chip,
+						      "repush ctl %d ch %d failed (%d)\n",
+						      cval->control, c + 1, err);
+			}
+			idx++;
+		}
+	} else {
+		/* master channel */
+		if (test_bit(0, cval->cached)) {
+			err = snd_usb_set_cur_mix_value(cval, 0, 0,
+							*cval->cache_val);
+			if (err < 0)
+				usb_audio_dbg(cval->head.mixer->chip,
+					      "repush ctl %d ch 0 failed (%d)\n",
+					      cval->control, err);
+		}
+	}
+}
+
+/* Write one control's pending (changed-since-last-flush) channels. */
+static void flush_ctl_pending(struct usb_mixer_elem_info *cval)
+{
+	int c, err, idx = 0;
+
+	for (c = 0; c < MAX_CHANNELS; c++) {
+		if (!(cval->cmask & BIT(c)))
+			continue;
+		if (test_bit(c + 1, cval->pending)) {
+			clear_bit(c + 1, cval->pending);
+			if (test_bit(c + 1, cval->cached)) {
+				err = snd_usb_set_cur_mix_value(cval, c + 1,
+						idx, cval->cache_val[idx]);
+				if (err < 0)
+					usb_audio_dbg(cval->head.mixer->chip,
+						      "flush ctl %d ch %d failed (%d)\n",
+						      cval->control, c + 1, err);
+			}
+		}
+		idx++;
+	}
+	if (!cval->cmask && test_bit(0, cval->pending)) {
+		/* master channel */
+		clear_bit(0, cval->pending);
+		if (test_bit(0, cval->cached)) {
+			err = snd_usb_set_cur_mix_value(cval, 0, 0,
+							*cval->cache_val);
+			if (err < 0)
+				usb_audio_dbg(cval->head.mixer->chip,
+					      "flush ctl %d ch 0 failed (%d)\n",
+					      cval->control, err);
+		}
+	}
+}
+
+/*
+ * One atomic write burst per touched feature unit, Windows-style:
+ * full = re-push every cached volume value (the stream-open heal),
+ * otherwise only the channels user space changed since the last
+ * flush.  The master is written first and derived as the loudest
+ * cached channel - never asserted from its own (possibly stale)
+ * cache, and never overridden when user space put it explicitly.
+ * Mute switches are only written when user space changed them: a
+ * lost re-assert can only fail to mute (power-up is unmuted), and
+ * mute writes during playback audibly chop the stream on these
+ * devices.
+ */
+static void snd_usb_mixer_flush_pending(struct usb_mixer_interface *mixer,
+					bool full)
+{
+	struct usb_mixer_elem_list *list;
+	struct usb_mixer_elem_info *cval, *master;
+	int id, c, idx, max_val;
+	bool have_ch, touched, master_pending;
+
+	if (mixer->disconnected)
+		return;
+
+	for (id = 0; id < MAX_ID_ELEMS; id++) {
+		master = NULL;
+		max_val = 0;
+		have_ch = false;
+		touched = false;
+		master_pending = false;
+		for_each_mixer_elem(list, mixer, id) {
+			cval = mixer_elem_list_to_info(list);
+			if (!is_feature_volume_mute_ctl(cval) ||
+			    cval->control != UAC_FU_VOLUME)
+				continue;
+			if (!cval->cmask) {
+				if (!master) {
+					master = cval;
+					master_pending =
+						test_bit(0, cval->pending);
+				}
+				continue;
+			}
+			if (!bitmap_empty(cval->pending, MAX_CHANNELS + 1))
+				touched = true;
+			idx = 0;
+			for (c = 0; c < MAX_CHANNELS; c++) {
+				if (!(cval->cmask & BIT(c)))
+					continue;
+				if (test_bit(c + 1, cval->cached)) {
+					if (cval->cache_val[idx] > max_val)
+						max_val = cval->cache_val[idx];
+					have_ch = true;
+				}
+				idx++;
+			}
+		}
+		/* master first (the Windows burst order); a max of 0 is a
+		 * legal volume, hence the explicit have_ch test
+		 */
+		if (master && !master_pending && have_ch &&
+		    (touched || full) &&
+		    (!test_bit(0, master->cached) ||
+		     *master->cache_val != max_val)) {
+			int err = snd_usb_set_cur_mix_value(master, 0, 0,
+							    max_val);
+			if (err < 0)
+				usb_audio_dbg(mixer->chip,
+					      "derive ctl %d ch 0 failed (%d)\n",
+					      master->control, err);
+		}
+		if (master && full && !have_ch && !master_pending)
+			/* unit without per-channel data: own cache */
+			repush_ctl_cached(master);
+		for_each_mixer_elem(list, mixer, id) {
+			cval = mixer_elem_list_to_info(list);
+			if (!is_feature_volume_mute_ctl(cval))
+				continue;
+			if (cval->control == UAC_FU_VOLUME && full &&
+			    cval->cmask) {
+				bitmap_zero(cval->pending, MAX_CHANNELS + 1);
+				repush_ctl_cached(cval);
+				continue;
+			}
+			if (!bitmap_empty(cval->pending, MAX_CHANNELS + 1))
+				flush_ctl_pending(cval);
+		}
+	}
+}
+
+static void snd_usb_mixer_flush_work(struct work_struct *work)
+{
+	struct usb_mixer_interface *mixer =
+		container_of(work, struct usb_mixer_interface,
+			     flush_work.work);
+	bool full;
+
+	scoped_guard(mutex, &mixer->lock) {
+		full = mixer->flush_full;
+		mixer->flush_full = false;
+	}
+	if (full)
+		usb_audio_info(mixer->chip, "flushing mixer state (stream open)\n");
+	snd_usb_mixer_flush_pending(mixer, full);
+}
+
 /* put the current value to feature/mixer unit */
 static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *cval = snd_kcontrol_chip(kcontrol);
+	bool deferred = cval->head.mixer->chip->quirk_flags &
+			QUIRK_FLAG_MIXER_STATE_REPUSH;
 	int max_val;
 	int c, cnt, val, oval, err;
 	int changed = 0;
@@ -1621,10 +1840,22 @@ static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
 				return -EINVAL;
 			val = get_abs_value(cval, val);
 			if (oval != val) {
-				err = snd_usb_set_cur_mix_value(cval, c + 1,
-								cnt, val);
-				if (err < 0)
-					return filter_error(cval, err);
+				if (deferred) {
+					/* record only; one flush writes the
+					 * whole unit in a single burst
+					 */
+					set_bit(c + 1, cval->cached);
+					cval->cache_val[cnt] = val;
+					set_bit(c + 1, cval->pending);
+					mod_delayed_work(system_wq,
+							 &cval->head.mixer->flush_work,
+							 MIXER_FLUSH_DELAY);
+				} else {
+					err = snd_usb_set_cur_mix_value(cval, c + 1,
+									cnt, val);
+					if (err < 0)
+						return filter_error(cval, err);
+				}
 				changed = 1;
 			}
 			cnt++;
@@ -1639,9 +1870,19 @@ static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
 			return -EINVAL;
 		val = get_abs_value(cval, val);
 		if (val != oval) {
-			err = snd_usb_set_cur_mix_value(cval, 0, 0, val);
-			if (err < 0)
-				return filter_error(cval, err);
+			if (deferred) {
+				/* record only; one flush writes the whole unit in a single burst */
+				set_bit(0, cval->cached);
+				cval->cache_val[0] = val;
+				set_bit(0, cval->pending);
+				mod_delayed_work(system_wq,
+						 &cval->head.mixer->flush_work,
+						 MIXER_FLUSH_DELAY);
+			} else {
+				err = snd_usb_set_cur_mix_value(cval, 0, 0, val);
+				if (err < 0)
+					return filter_error(cval, err);
+			}
 			changed = 1;
 		}
 	}
@@ -3248,6 +3489,8 @@ static void snd_usb_mixer_free(struct usb_mixer_interface *mixer)
 	/* kill pending URBs */
 	snd_usb_mixer_disconnect(mixer);
 
+	cancel_delayed_work_sync(&mixer->flush_work);
+
 	/* Unregister controls first, snd_ctl_remove() frees the element */
 	if (mixer->id_elems) {
 		for (id = 0; id < MAX_ID_ELEMS; id++) {
@@ -3903,6 +4146,7 @@ int snd_usb_create_mixer(struct snd_usb_audio *chip, int ctrlif)
 	if (!mixer)
 		return -ENOMEM;
 	mixer->chip = chip;
+	INIT_DELAYED_WORK(&mixer->flush_work, snd_usb_mixer_flush_work);
 	mixer->ignore_ctl_error = !!(chip->quirk_flags & QUIRK_FLAG_IGNORE_CTL_ERROR);
 	mixer->id_elems = kzalloc_objs(*mixer->id_elems, MAX_ID_ELEMS);
 	if (!mixer->id_elems) {
@@ -3974,6 +4218,34 @@ void snd_usb_mixer_disconnect(struct usb_mixer_interface *mixer)
 	mixer->disconnected = true;
 }
 
+/**
+ * snd_usb_mixer_stream_opened - notify mixers of a PCM stream open
+ * @chip: the USB audio chip
+ *
+ * Called from the PCM open path.  Devices flagged
+ * QUIRK_FLAG_MIXER_STATE_REPUSH request a full-state re-push (the
+ * vendor driver's every-open write pattern, healing writes swallowed
+ * in the post-enumeration loss window), merged into the flush timer
+ * so the burst never observes a half-applied gesture.
+ */
+void snd_usb_mixer_stream_opened(struct snd_usb_audio *chip)
+{
+	struct usb_mixer_interface *mixer;
+
+	if (!(chip->quirk_flags & QUIRK_FLAG_MIXER_STATE_REPUSH))
+		return;
+
+	list_for_each_entry(mixer, &chip->mixer_list, list) {
+		if (mixer->disconnected)
+			continue;
+		scoped_guard(mutex, &mixer->lock) {
+			mixer->flush_full = true;
+		}
+		mod_delayed_work(system_wq, &mixer->flush_work,
+				 MIXER_FLUSH_DELAY);
+	}
+}
+
 /* stop any bus activity of a mixer */
 static void snd_usb_mixer_inactivate(struct usb_mixer_interface *mixer)
 {
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index c40f83285..2de8f2fec 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -41,6 +41,10 @@ struct usb_mixer_interface {
 
 	bool disconnected;
 
+	/* atomic write bursts (QUIRK_FLAG_MIXER_STATE_REPUSH) */
+	struct delayed_work flush_work;
+	bool flush_full;	/* full-state re-push requested at next flush */
+
 	void *private_data;
 	void (*private_free)(struct usb_mixer_interface *mixer);
 	void (*private_suspend)(struct usb_mixer_interface *mixer);
@@ -95,6 +99,10 @@ struct usb_mixer_elem_info {
 	int dBmin, dBmax;
 	DECLARE_BITMAP(cached, MAX_CHANNELS + 1);
 	int cache_val[MAX_CHANNELS];
+	/* channels changed since the last flush
+	 * (QUIRK_FLAG_MIXER_STATE_REPUSH); same bit layout as cached
+	 */
+	DECLARE_BITMAP(pending, MAX_CHANNELS + 1);
 	u8 initialized;
 	u8 min_mute;
 	u8 get_cur_broken;
@@ -129,6 +137,8 @@ int snd_usb_mixer_vol_tlv(struct snd_kcontrol *kcontrol, int op_flag,
 int snd_usb_mixer_suspend(struct usb_mixer_interface *mixer);
 int snd_usb_mixer_resume(struct usb_mixer_interface *mixer);
 
+void snd_usb_mixer_stream_opened(struct snd_usb_audio *chip);
+
 int snd_usb_set_cur_mix_value(struct usb_mixer_elem_info *cval, int channel,
                              int index, int value);
 
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 57a26492d..ec8ad7bd7 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -24,6 +24,7 @@
 #include "power.h"
 #include "media.h"
 #include "implicit.h"
+#include "mixer.h"
 
 #define SUBSTREAM_FLAG_DATA_EP_STARTED	0
 #define SUBSTREAM_FLAG_SYNC_EP_STARTED	1
@@ -1271,6 +1272,9 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
 	if (ret < 0)
 		goto err_resume;
 
+	/* may re-push the cached mixer state (write-loss recovery) */
+	snd_usb_mixer_stream_opened(chip);
+
 	return 0;
 
 err_resume:
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 6ef6d4410..5328faa3d 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2504,6 +2504,7 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
 	DEVICE_FLG(0x040b, 0x0897, /* XiiSound/Weltrend Temple and rebranded headsets */
 		   QUIRK_FLAG_MIXER_INIT_VOLUME_MAX |
+		   QUIRK_FLAG_MIXER_STATE_REPUSH |
 		   QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL |
 		   QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL),
 	DEVICE_FLG(0x041e, 0x3000, /* Creative SB Extigy */
@@ -2984,6 +2985,7 @@ static const char *const snd_usb_audio_quirk_flag_names[] = {
 	QUIRK_STRING_ENTRY(ALWAYS_SET_RATE),
 	QUIRK_STRING_ENTRY(SWAP_RATES),
 	QUIRK_STRING_ENTRY(MIXER_INIT_VOLUME_MAX),
+	QUIRK_STRING_ENTRY(MIXER_STATE_REPUSH),
 	NULL
 };
 
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index ba505e1b9..66ba0c8ad 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -271,6 +271,20 @@ extern bool snd_usb_skip_validation;
  *  Initialize all channels of the volume controls to the maximum once
  *  at mixer creation; the controls remain writable and the hardware
  *  volume operates normally afterwards.
+ * QUIRK_FLAG_MIXER_STATE_REPUSH
+ *  Some devices silently drop mixer writes issued in the first seconds
+ *  after USB enumeration, and can drop individual writes at any later
+ *  time as well, so the state the host believes in never reaches the
+ *  hardware (and GET_CUR is typically broken on these devices, so the
+ *  divergence cannot be detected by reading back).  The vendor's own
+ *  Windows driver never reads back either: it collects the whole
+ *  channel picture at a single source of truth and writes every
+ *  channel of a control in one short burst, re-pushing the complete
+ *  state at every device open.  Record control writes instead of
+ *  issuing them directly, and write each touched feature unit in one
+ *  burst from a deferred flush (the master volume first, derived from
+ *  the loudest channel); a PCM stream open requests a full-state
+ *  re-push through the same timer.
  */
 
 enum {
@@ -309,6 +323,7 @@ enum {
 	QUIRK_TYPE_ALWAYS_SET_RATE		= 32,
 	QUIRK_TYPE_SWAP_RATES			= 33,
 	QUIRK_TYPE_MIXER_INIT_VOLUME_MAX	= 34,
+	QUIRK_TYPE_MIXER_STATE_REPUSH		= 35,
 /* Please also edit snd_usb_audio_quirk_flag_names and alsa-configuration.rst */
 };
 
@@ -349,5 +364,6 @@ enum {
 #define QUIRK_FLAG_ALWAYS_SET_RATE		QUIRK_FLAG(ALWAYS_SET_RATE)
 #define QUIRK_FLAG_SWAP_RATES			QUIRK_FLAG(SWAP_RATES)
 #define QUIRK_FLAG_MIXER_INIT_VOLUME_MAX	QUIRK_FLAG(MIXER_INIT_VOLUME_MAX)
+#define QUIRK_FLAG_MIXER_STATE_REPUSH		QUIRK_FLAG(MIXER_STATE_REPUSH)
 
 #endif /* __USBAUDIO_H */
-- 
2.56.1

