Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=89.253.219.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907550;
	b=stsMY+FDCwsNa+OkCtREYVAP3N8KZV+aENvg2W/slrzie/r9driLGtbomo+06GPllyNX
	 QfZHsIgS0eps7koKbpLG1NIdWL8omVRmJy/3F1AXZ35DCcpEkWwuIEYPBrUJi6tZ1696O
	 tUMbP/397MHnaDgo1uh/UnKQ3tA100XBQyIvz4pX/Wi+d6M+XdmU9sJhc2ic59pA4j/Od
	 g1ZZuZflPPHsZTvAzeeyK3hxKbSGthmwbZYXKC2550JEZRttpRJQSDCD5B47ItMxTbodM
	 lkDF9hZ7OwA5tCfwWJorJW7FilwPGakDs4Ka6cOd7G4bSIMqenvUBfEKVLusrCJUJ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907550;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L80t/QqgBjrTPtWTweseO/5fp4ZyMyGJXa2OxzE9T+c=;
	b=xhvc5Qqya1u9dHXlhng2CroXZxyNYgDWp006VbClJlDDTV3oA2b/pQGesoUj2YQyKVuf
	 vO0p+SKWwufD9EUqCgeKQzE7qzjQrLsk0ZnFM4M52MhvEDXENRCFIhDd3spbzBWO8v5D9
	 1x4xHnJTu7uAM3q9ebZ+PJizmhOR48eFJyiIyXwUPn6FVM47ElBdpnmXklLGcw0Lmp8kF
	 A/0AuVlvLYFNCgG1iv3LAa8hxR1peGHy52y729FVjWiFDrWCPsTHGUAO33mjl/hn72y9P
	 jpR/21h4m4fnFF0A6kP6f5H74zwMMTLQLjFgVU80Mj10SphR++q7+fq9S1WUNBpE3ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pavel.bz;
	spf=pass smtp.mailfrom=pavel.bz;
	dkim=pass header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b="QeEosC/0";
	arc=none smtp.remote-ip=89.253.219.113
Received: from mail.pavel.bz (mail.pavel.bz [89.253.219.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76DC606A32A;
	Tue, 17 Nov 2026 09:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B76DC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pavel.bz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pavel.bz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=QeEosC/0
Received: from p-745-g5.lan (unknown [182.52.139.49])
	by mail.pavel.bz (Postfix) with ESMTPSA id D65FC616B5;
	Tue, 17 Nov 2026 09:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.pavel.bz D65FC616B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pavel.bz; s=primary;
	t=1794907548; bh=L80t/QqgBjrTPtWTweseO/5fp4ZyMyGJXa2OxzE9T+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QeEosC/0Yqt+TUNSUNUa46rU2YCsHGUOXqmFbxXwMfQeTq1OuYSphAoYaR7evSFMG
	 rV3h3R1V2HsCr/clITjttSIUIwLK+iWC4/wCd4A0r0xlrdPmDLxxQIRIuyzr0ORsac
	 EyacjsRS1bomM9d3WLUn93EiNXxqbtWWPqbVNRBey/ZLUrTAzIqU9glNM1ZGFeqEiS
	 3vF91wtPcZd7pIVY+6J7KRZD2i1UzDrbP3odw1V6AO19NWrR9V99Vcetrn+NDlpZUR
	 XDLwYMZRGAiTOEx2norNcPDEOFSFVULSSrxignuOiy6akB5Pzt27SOVuWk43FPdgmH
	 Uri5PBxF8TTXg==
From: Pavel Artemev <a@pavel.bz>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 2/2] ALSA: usb-audio: add MIXER_STATE_REPUSH quirk flag
Date: Tue, 17 Nov 2026 16:25:32 +0700
Message-ID: <20261117092532.408981-3-a@pavel.bz>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117092532.408981-1-a@pavel.bz>
References: <20261117092532.408981-1-a@pavel.bz>
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

  * volume and mute puts only record values; the cache is defined as
    "what user space last asked for" and is never read back from the
    device, and never invalidated by device status notifications;
  * a single deferred flush (30 ms quiescence) writes each touched
    feature unit in one burst, master first, derived as the loudest
    channel - never asserted from its own possibly stale cache.  An
    explicit master put is sticky: once user space has set the master,
    derivation stops for that unit and the master is only written
    when user space puts it again;
  * a PCM stream open and a resume re-push all cached volume values
    through the same timer - the every-open repair the Windows stack
    relies on.

The flush runs under the mixer lock, like the write path of the put
callback it replaces, so a put can never interleave with a burst.
The flush worker is cancelled synchronously on disconnect.  On
suspend it is cancelled without waiting: a flush in flight may be
blocked in runtime-PM resume, waiting for the suspend callback to
finish, so waiting for it there would deadlock the PM worker against
the flush worker.  Values recorded but not flushed stay in the cache;
the resume path then requests a full re-push that re-derives and
re-asserts them.

Only controls written through mixer_ctl_feature_put() with a volume
or mute selector are deferred.  Mixer unit controls share that put
callback but store an input channel number in the selector field and
are excluded (num_outputs is only ever set for mixer units); other
feature unit controls (AGC, tone) keep the direct write path; and
read-only channels are neither written nor cached, matching the
direct write path.  A derived master equal to the cached value is
not re-sent: an unchanged limit value re-delivered makes these
devices emit their in-headset limit notification with no user action
nearby.  The residual gap - a sporadically dropped master write is
only healed by the next change, not by an unchanged re-push - is
accepted; the vendor driver has no readback either.

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
suspend/resume, balance and mute pass end to end.  The same mechanism
also ran on the device as a DKMS module against 7.3.4, wire-verified:
volume gestures (PipeWire 0.5/1.0/0.7) each produced exactly one
burst of one write per channel in the master-first order (13/100/35),
with no readbacks, no re-sends, and no writes to the capture unit.
The changes over the previous revision (suspend without waiting,
resume re-push, mixer unit and read-only exclusion, sticky explicit
master) are verified by analysis of the runtime-PM core semantics,
and ran on the device as a DKMS module against 7.3.4 with normal
operation, but are not yet re-verified on the wire.

Closes: https://github.com/alsa-project/alsa-ucm-conf/issues/760
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221401
Link: https://lore.kernel.org/linux-sound/20261117074318.378876-3-a@pavel.bz
Assisted-by: LLM
Signed-off-by: Pavel Artemev <a@pavel.bz>
---
 Documentation/sound/alsa-configuration.rst |   5 +
 sound/usb/mixer.c                          | 397 ++++++++++++++++++++-
 sound/usb/mixer.h                          |  14 +
 sound/usb/pcm.c                            |   4 +
 sound/usb/quirks.c                         |   2 +
 sound/usb/usbaudio.h                       |  18 +
 6 files changed, 426 insertions(+), 14 deletions(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index ea7f5aa31..9b4b13969 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2417,6 +2417,11 @@ quirk_flags
           Initialize the volume control channels to the maximum value instead
           of the minimum at mixer creation.  For devices that silence their
           audio path while a volume channel sits at the minimum value.
+        * bit 35: ``mixer_state_repush``
+          Defer volume and mute writes into one burst per feature unit, and
+          re-push the complete cached mixer state at every PCM stream open
+          and after resume.  For devices that silently drop control writes
+          around enumeration and whose controls cannot be read back.
 
 This module supports multiple devices, autoprobe and hotplugging.
 
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index bf1d9fbf0..2ac5a54a4 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -37,6 +37,7 @@
 #include <linux/usb/audio.h>
 #include <linux/usb/audio-v2.h>
 #include <linux/usb/audio-v3.h>
+#include <linux/workqueue.h>
 
 #include <sound/core.h>
 #include <sound/control.h>
@@ -584,13 +585,22 @@ static int set_cur_ctl_value(struct usb_mixer_elem_info *cval,
 	return snd_usb_mixer_set_ctl_value(cval, UAC_SET_CUR, validx, value);
 }
 
+/* read-only indication of one channel of a control (channel 0 = master);
+ * read-only channels are not written and not cached
+ */
+static unsigned int mixer_ch_readonly(const struct usb_mixer_elem_info *cval,
+				      int channel)
+{
+	if (channel == 0)
+		return cval->master_readonly;
+	return cval->ch_readonly & BIT(channel - 1);
+}
+
 int snd_usb_set_cur_mix_value(struct usb_mixer_elem_info *cval, int channel,
 			     int index, int value)
 {
 	int err;
-	unsigned int read_only = (channel == 0) ?
-		cval->master_readonly :
-		cval->ch_readonly & BIT(channel - 1);
+	unsigned int read_only = mixer_ch_readonly(cval, channel);
 
 	if (read_only) {
 		usb_audio_dbg(cval->head.mixer->chip,
@@ -1608,15 +1618,275 @@ static int mixer_ctl_feature_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
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
+ *
+ * The whole flush runs under the mixer lock, like the write path of
+ * the put callback it replaces: snd_usb_set_cur_mix_value() completes
+ * its USB transfer before updating the cache, so an unlocked flush
+ * could clobber values recorded concurrently by a put.
+ */
+
+/* quiescence window for the flush; user space applies a stereo change
+ * as two control writes 5..20 ms apart
+ */
+#define MIXER_FLUSH_DELAY	msecs_to_jiffies(30)
+
+static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol);
+
+static bool is_feature_volume_mute_ctl(struct usb_mixer_elem_info *cval)
+{
+	if (!cval->head.kctl || !cval->head.kctl->put)
+		return false;
+	/* the info callback is shared with processing unit controls, whose
+	 * put writes through a different path and does not manage the
+	 * shared cache; the put callback is unique to feature unit and
+	 * mixer unit controls, which the cache does cover
+	 */
+	if (cval->head.kctl->put != mixer_ctl_feature_put)
+		return false;
+	/* mixer unit controls share that put callback but store the
+	 * 1-based input channel in cval->control, not a UAC_FU_* selector;
+	 * num_outputs is only ever set for mixer units, so it tells the
+	 * two apart
+	 */
+	if (cval->num_outputs)
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
+			if (!(cval->cmask & BIT_ULL(c)))
+				continue;
+			if (test_bit(c + 1, cval->cached)) {
+				err = snd_usb_set_cur_mix_value(cval, c + 1,
+								idx, cval->cache_val[idx]);
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
+/* Write one control's pending (changed-since-last-flush) channels.
+ * Pending bits are only set together with cache_val by a put, so the
+ * value is written unconditionally; the cache bit may have been
+ * cleared under us, and snd_usb_set_cur_mix_value() sets it again.
+ */
+static void flush_ctl_pending(struct usb_mixer_elem_info *cval)
+{
+	int c, err, idx = 0;
+
+	for (c = 0; c < MAX_CHANNELS; c++) {
+		if (!(cval->cmask & BIT_ULL(c)))
+			continue;
+		if (test_bit(c + 1, cval->pending)) {
+			clear_bit(c + 1, cval->pending);
+			err = snd_usb_set_cur_mix_value(cval, c + 1,
+							idx, cval->cache_val[idx]);
+			if (err < 0)
+				usb_audio_dbg(cval->head.mixer->chip,
+					      "flush ctl %d ch %d failed (%d)\n",
+					      cval->control, c + 1, err);
+		}
+		idx++;
+	}
+	if (!cval->cmask && test_bit(0, cval->pending)) {
+		/* master channel */
+		clear_bit(0, cval->pending);
+		err = snd_usb_set_cur_mix_value(cval, 0, 0,
+						*cval->cache_val);
+		if (err < 0)
+			usb_audio_dbg(cval->head.mixer->chip,
+				      "flush ctl %d ch 0 failed (%d)\n",
+				      cval->control, err);
+	}
+}
+
+/*
+ * One atomic write burst per touched feature unit, Windows-style:
+ * full = re-push every cached volume value (the stream-open heal),
+ * otherwise only the channels user space changed since the last
+ * flush.  The master is written first and derived as the loudest
+ * cached channel - never asserted from its own (possibly stale)
+ * cache.  An explicit master put is sticky: once user space has set
+ * the master, derivation stops for that unit and the master is only
+ * written when user space puts it again; a lost write is healed by
+ * the next full re-push, the same residual accepted for derived
+ * masters below.
+ * The derived master is skipped when it already equals the cached
+ * value: re-sending an unchanged limit value makes these devices emit
+ * their in-headset limit notification with no user action nearby.
+ * Mute switches are only written when user space changed them: a
+ * lost re-assert can only fail to mute (power-up is unmuted), and
+ * mute writes during playback audibly chop the stream on these
+ * devices.
+ *
+ * Called with mixer->lock held.
+ */
+static void snd_usb_mixer_flush_pending(struct usb_mixer_interface *mixer,
+					bool full)
+{
+	struct usb_mixer_elem_list *list;
+	struct usb_mixer_elem_info *cval, *master;
+	int id, c, idx, max_val;
+	bool have_ch, touched, master_pending;
+
+	lockdep_assert_held(&mixer->lock);
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
+				if (!(cval->cmask & BIT_ULL(c)))
+					continue;
+				if (test_bit(c + 1, cval->cached)) {
+					/* seed from the first cached value:
+					 * raw volume ranges can be signed
+					 * and all-negative
+					 */
+					if (!have_ch ||
+					    cval->cache_val[idx] > max_val)
+						max_val = cval->cache_val[idx];
+					have_ch = true;
+				}
+				idx++;
+			}
+		}
+		/* master first (the Windows burst order) */
+		if (master && !master_pending && !master->master_explicit &&
+		    have_ch &&
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
+		if (master && full && !master_pending &&
+		    (master->master_explicit || !have_ch))
+			/* user-owned master, or a unit without per-channel
+			 * data: re-assert the cached master value
+			 */
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
+		if (mixer->disconnected)
+			return;
+		if (full)
+			usb_audio_dbg(mixer->chip,
+				      "flushing mixer state (stream open)\n");
+		snd_usb_mixer_flush_pending(mixer, full);
+	}
+}
+
 /* put the current value to feature/mixer unit */
 static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *cval = snd_kcontrol_chip(kcontrol);
+	bool deferred;
 	int max_val;
 	int c, cnt, val, oval, err;
 	int changed = 0;
 
+	deferred = (cval->head.mixer->chip->quirk_flags &
+		    QUIRK_FLAG_MIXER_STATE_REPUSH) &&
+		   is_feature_volume_mute_ctl(cval);
+
 	guard(mutex)(&cval->head.mixer->lock);
 	max_val = get_max_exposed(cval);
 	if (cval->cmask) {
@@ -1632,10 +1902,27 @@ static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
 				return -EINVAL;
 			val = get_abs_value(cval, val);
 			if (oval != val) {
-				err = snd_usb_set_cur_mix_value(cval, c + 1,
-								cnt, val);
-				if (err < 0)
-					return filter_error(cval, err);
+				if (deferred) {
+					/* record only; one flush writes the
+					 * whole unit in a single burst.
+					 * Read-only channels keep the
+					 * direct-path behaviour: no write,
+					 * no cache update.
+					 */
+					if (!mixer_ch_readonly(cval, c + 1)) {
+						set_bit(c + 1, cval->cached);
+						cval->cache_val[cnt] = val;
+						set_bit(c + 1, cval->pending);
+						mod_delayed_work(system_wq,
+								 &cval->head.mixer->flush_work,
+								 MIXER_FLUSH_DELAY);
+					}
+				} else {
+					err = snd_usb_set_cur_mix_value(cval, c + 1,
+									cnt, val);
+					if (err < 0)
+						return filter_error(cval, err);
+				}
 				changed = 1;
 			}
 			cnt++;
@@ -1650,9 +1937,26 @@ static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
 			return -EINVAL;
 		val = get_abs_value(cval, val);
 		if (val != oval) {
-			err = snd_usb_set_cur_mix_value(cval, 0, 0, val);
-			if (err < 0)
-				return filter_error(cval, err);
+			if (deferred) {
+				/* record only; one flush writes the whole
+				 * unit in a single burst.  Read-only
+				 * masters keep the direct-path behaviour:
+				 * no write, no cache update.
+				 */
+				if (!mixer_ch_readonly(cval, 0)) {
+					set_bit(0, cval->cached);
+					cval->cache_val[0] = val;
+					set_bit(0, cval->pending);
+					cval->master_explicit = true;
+					mod_delayed_work(system_wq,
+							 &cval->head.mixer->flush_work,
+							 MIXER_FLUSH_DELAY);
+				}
+			} else {
+				err = snd_usb_set_cur_mix_value(cval, 0, 0, val);
+				if (err < 0)
+					return filter_error(cval, err);
+			}
 			changed = 1;
 		}
 	}
@@ -3259,6 +3563,8 @@ static void snd_usb_mixer_free(struct usb_mixer_interface *mixer)
 	/* kill pending URBs */
 	snd_usb_mixer_disconnect(mixer);
 
+	cancel_delayed_work_sync(&mixer->flush_work);
+
 	/* Unregister controls first, snd_ctl_remove() frees the element */
 	if (mixer->id_elems) {
 		for (id = 0; id < MAX_ID_ELEMS; id++) {
@@ -3685,8 +3991,12 @@ void snd_usb_mixer_notify_id(struct usb_mixer_interface *mixer, int unitid)
 		if (!list->is_std_info)
 			continue;
 		info = mixer_elem_list_to_info(list);
-		/* invalidate cache, so the value is read from the device */
-		if (!info->get_cur_broken)
+		/* invalidate cache, so the value is read from the device;
+		 * under QUIRK_FLAG_MIXER_STATE_REPUSH the cache is the
+		 * host-side truth and is never invalidated
+		 */
+		if (!info->get_cur_broken &&
+		    !(mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_STATE_REPUSH))
 			bitmap_zero(info->cached, MAX_CHANNELS + 1);
 		snd_ctl_notify(mixer->chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &list->kctl->id);
@@ -3783,8 +4093,13 @@ static void snd_usb_mixer_interrupt_v2(struct usb_mixer_interface *mixer,
 
 		switch (attribute) {
 		case UAC2_CS_CUR:
-			/* invalidate cache, so the value is read from the device */
-			if (!info->get_cur_broken) {
+			/* invalidate cache, so the value is read from the
+			 * device; under QUIRK_FLAG_MIXER_STATE_REPUSH the
+			 * cache is the host-side truth and is never
+			 * invalidated
+			 */
+			if (!info->get_cur_broken &&
+			    !(mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_STATE_REPUSH)) {
 				if (channel)
 					clear_bit(channel, info->cached);
 				else /* master channel */
@@ -3914,6 +4229,7 @@ int snd_usb_create_mixer(struct snd_usb_audio *chip, int ctrlif)
 	if (!mixer)
 		return -ENOMEM;
 	mixer->chip = chip;
+	INIT_DELAYED_WORK(&mixer->flush_work, snd_usb_mixer_flush_work);
 	mixer->ignore_ctl_error = !!(chip->quirk_flags & QUIRK_FLAG_IGNORE_CTL_ERROR);
 	mixer->id_elems = kzalloc_objs(*mixer->id_elems, MAX_ID_ELEMS);
 	if (!mixer->id_elems) {
@@ -3976,6 +4292,7 @@ void snd_usb_mixer_disconnect(struct usb_mixer_interface *mixer)
 {
 	if (mixer->disconnected)
 		return;
+	cancel_delayed_work_sync(&mixer->flush_work);
 	if (mixer->urb)
 		usb_kill_urb(mixer->urb);
 	if (mixer->rc_urb)
@@ -3985,6 +4302,34 @@ void snd_usb_mixer_disconnect(struct usb_mixer_interface *mixer)
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
+			mod_delayed_work(system_wq, &mixer->flush_work,
+					 MIXER_FLUSH_DELAY);
+		}
+	}
+}
+
 /* stop any bus activity of a mixer */
 static void snd_usb_mixer_inactivate(struct usb_mixer_interface *mixer)
 {
@@ -4007,6 +4352,14 @@ static int snd_usb_mixer_activate(struct usb_mixer_interface *mixer)
 
 int snd_usb_mixer_suspend(struct usb_mixer_interface *mixer)
 {
+	/* Do not wait for an in-flight flush here: its control writes can
+	 * be blocked in runtime-PM resume, waiting for this very suspend
+	 * callback to finish - cancel_delayed_work_sync() would deadlock
+	 * the PM worker against the flush worker.  Cancel without waiting;
+	 * values recorded but not yet flushed stay in the cache, and the
+	 * resume path requests a full re-push that re-derives them.
+	 */
+	cancel_delayed_work(&mixer->flush_work);
 	snd_usb_mixer_inactivate(mixer);
 	if (mixer->private_suspend)
 		mixer->private_suspend(mixer);
@@ -4067,6 +4420,22 @@ int snd_usb_mixer_resume(struct usb_mixer_interface *mixer)
 
 	snd_usb_mixer_resume_quirk(mixer);
 
+	/* A suspend may have cancelled a flush that had not fired yet:
+	 * the values are restored above, but a master derived only at
+	 * flush time may lag behind its channels.  Request a full
+	 * re-push, which re-derives and re-asserts everything.  The
+	 * lock is only tried: an in-flight flush whose control write
+	 * triggered this very resume holds it and already delivers the
+	 * state, so there is nothing to re-arm in that case.
+	 */
+	if (mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_STATE_REPUSH &&
+	    mutex_trylock(&mixer->lock)) {
+		mixer->flush_full = true;
+		mutex_unlock(&mixer->lock);
+		mod_delayed_work(system_wq, &mixer->flush_work,
+				 MIXER_FLUSH_DELAY);
+	}
+
 	return snd_usb_mixer_activate(mixer);
 }
 
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index c40f83285..281dbfe1d 100644
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
@@ -95,6 +99,14 @@ struct usb_mixer_elem_info {
 	int dBmin, dBmax;
 	DECLARE_BITMAP(cached, MAX_CHANNELS + 1);
 	int cache_val[MAX_CHANNELS];
+	/* channels changed since the last flush
+	 * (QUIRK_FLAG_MIXER_STATE_REPUSH); same bit layout as cached
+	 */
+	DECLARE_BITMAP(pending, MAX_CHANNELS + 1);
+	/* user space has put this master explicitly: stop deriving it from
+	 * the channels (QUIRK_FLAG_MIXER_STATE_REPUSH)
+	 */
+	bool master_explicit;
 	u8 initialized;
 	u8 min_mute;
 	u8 get_cur_broken;
@@ -129,6 +141,8 @@ int snd_usb_mixer_vol_tlv(struct snd_kcontrol *kcontrol, int op_flag,
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
index 61794fdc4..b530513a3 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -271,6 +271,22 @@ extern bool snd_usb_skip_validation;
  *  Initialize the volume control channels to the maximum instead of
  *  the minimum; the controls remain writable and the hardware volume
  *  operates normally afterwards.
+ * QUIRK_FLAG_MIXER_STATE_REPUSH
+ *  Some devices silently drop mixer writes issued in the first seconds
+ *  after USB enumeration, and can drop individual writes at any later
+ *  time as well, so the state the host believes in never reaches the
+ *  hardware (and GET_CUR is typically broken on these devices, so the
+ *  divergence cannot be detected by reading back).  The vendor's own
+ *  Windows driver never reads back either: it collects the whole
+ *  channel picture at a single source of truth and writes every
+ *  channel of a control in one short burst, re-pushing the complete
+ *  state at every device open.  Record volume and mute control writes
+ *  instead of issuing them directly, and write each touched feature
+ *  unit in one burst from a deferred flush (the master volume first,
+ *  derived from the loudest channel); a PCM stream open requests a
+ *  full-state re-push through the same timer.  Under this flag the
+ *  cache holds what user space last asked for and is never invalidated
+ *  by device status notifications.
  */
 
 enum {
@@ -309,6 +325,7 @@ enum {
 	QUIRK_TYPE_ALWAYS_SET_RATE		= 32,
 	QUIRK_TYPE_SWAP_RATES			= 33,
 	QUIRK_TYPE_MIXER_INIT_VOLUME_MAX	= 34,
+	QUIRK_TYPE_MIXER_STATE_REPUSH		= 35,
 /* Please also edit snd_usb_audio_quirk_flag_names and alsa-configuration.rst */
 };
 
@@ -349,5 +366,6 @@ enum {
 #define QUIRK_FLAG_ALWAYS_SET_RATE		QUIRK_FLAG(ALWAYS_SET_RATE)
 #define QUIRK_FLAG_SWAP_RATES			QUIRK_FLAG(SWAP_RATES)
 #define QUIRK_FLAG_MIXER_INIT_VOLUME_MAX	QUIRK_FLAG(MIXER_INIT_VOLUME_MAX)
+#define QUIRK_FLAG_MIXER_STATE_REPUSH		QUIRK_FLAG(MIXER_STATE_REPUSH)
 
 #endif /* __USBAUDIO_H */
-- 
2.56.1

