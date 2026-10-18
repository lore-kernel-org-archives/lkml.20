Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F59D4D5986
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792357061; cv=none; b=OCvWoe3vrItCK734fVtvm9ckq6MKma6NjA6rEhRCwiuVcSYiQNekdJ/9bXYaAa9nR/K7+3G/VWna7oULA+4ObLTSXN+WOtNQMpluQXcDXLRZT7ighzV+Y+nc1ZtVsg/1VcvoI9QZghDraDAs/ddGANyjBVHLnvp1x3uTckztUMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792357061; c=relaxed/simple;
	bh=egCkSl1ziENZtLgdaKC+K1+MML1bessZk/jEY6CYHho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O4xQf0ZbKyzkrR/i5EdUV7KBYrqh044syBTHMLvYptUMTQxDXcaGWNCij4/3bGMNVj4Z/VUJZbTjuFzfX48SgRSPTcnjvYqM0XbtzyB0HVMElEF+hT1JKOBMLqWyRS8HvbiK3lapm1FFx0jQs9G9kLBDrIQAN5XjjQqHwmv9YWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jee2R4LK; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jee2R4LK"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b060ec084so888499f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792357057; x=1792961857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlhaq0uy1Evc/akvQOutaQ2B/WUPQcS2vQ+budKfpsw=;
        b=jee2R4LKe3D+1NB8z+lMa11Qx9qKeOxE6POEThOOuvqsHzjS0NMcadsLdqxc1c+ZEO
         dsS9DzdgVz0M5dSKsZYpFHVdRGrv9pTQoY8SRH9+UcqWxYkRkiZ9rnGlapuQWsFRemcF
         YvqHcfVB2nZFKd1RWOf0gKhyXr8Bv1w4VFApvwWRJTDB+1csoVflLucL2px8Rm+fustu
         SOb8lYtye3X9KFNlSRZIdnaWx0ZbqMOxMm2hWuIFBErMrgHbuWH+Xu+8wMP7AL5eG4Zw
         bDitejyOaR8DwBQOSepZpMRMTrDROChrbRAzOeR+AulP2a5+X78/4b28mVFkjWzbsYR9
         nQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792357057; x=1792961857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vlhaq0uy1Evc/akvQOutaQ2B/WUPQcS2vQ+budKfpsw=;
        b=g7TpYsAxGUv5U+THy+NwnsNRmLpNge8UgKWNtHIuOXvGNr9lSD4loC4nEEHRFS8Vhc
         VPMJIubCf8Ca9sw/sdaVyT4r3Pua02zSM+WU81kLJuw6CAzePdOrOCC0DoDpnHoEOXWg
         8WqlByBk5AQhVCvdF82+DrXNCNNPyVdl4Hj+9obfJz+sJzeZcn0tXsX3FxiCNqyzXeRx
         bsIn/yzkURwswvipycO7nOCZghXc2yehH4e/0TpI9OPTsGKFGYymTZ7JB8k3Di7Ttw23
         21FRHgLvnr6lw9MiU6gFqF4D7mK2w96/95lB/wT334XeHkvlVM/zdlQKJUtz5b3rMelG
         2kXw==
X-Forwarded-Encrypted: i=1; AKwUvBy2dvsnLxUcjZKEnwL+gbetQqUvy8PO155qTvFzK7iAYujtF7jrVxI50dGpthHl+O3YzNj05ojblpjlfAM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKepi0Rq0UXbAllxnAWUWG9mCMadNsgHVf809R7v0MhW6V3yj09
	7TkW+aMZQbSmNCWzCAsI6LwkfVifuxDD9s7OJqQFyGLiPgF6Mr+GDov2
X-Gm-Gg: AYBFou2sbFT3cmWZbJffSQIzd5L+F7QRvZ/LHv92klWwKCWPRk0HUyMw8KJ+8X3EeGS
	AfPoxqmt+1yXICnsUlEFRJ8A3Nl+/wvJduNbheKlCVHuaQ/OZ2fWXTwocECiKFdKvQkaqqrFyXD
	x9PjNn5t0z5O7Yxa7cLMByKm/LuEP+gqZny9sZD+kBNzeln5cOdrtf1Qbiq3BW6sjtK31d+zk7F
	m03swdY+B0GXNyextaBnG3wO+7UHTRlXtn2/HPvdhDOKhtKbXKX6hzSZ9L7F7zPYBLaLtt8u01M
	3hNAkGxv/XOS9rByy+mbSRjL50hZP0D46mBXQEixUbYY9MROK+PbR1XQ0VAajC02TlkCTfSU3Fp
	2iCqphGucii418frI6vOQ9C9XSjD3sKT/ityLltVXk7m6p9yw5BMmXApfXzsruxE4TIMk1C6bzO
	ivfNLZr0G/sjPOMt0CXJhvKUWq8m2oAKPPPgbnWulQnXL5wX5rE+cDBnaIEvRdHM4swraXVfUoi
	fKM74dIIiRup/FpxEc/8VtNEk2MVTrBo7Fur4W0c2Ml2OAAYCtJ7vRnXESMwZHwaM5gTg==
X-Received: by 2002:a05:6000:4549:b0:48b:69d4:bb35 with SMTP id ffacd0b85a97d-48e07bbe545mr6877543f8f.12.1792357057391;
        Sun, 18 Oct 2026 13:57:37 -0700 (PDT)
Received: from localhost ([178.214.243.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5177sm18496263f8f.30.2026.10.18.13.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 13:57:36 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	tiwai@suse.de
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH v10 7/8] ALSA: usb-audio: add the Topping M62's mutes
Date: Mon, 19 Oct 2026 01:57:09 +0500
Message-ID: <20261018205711.168291-8-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018205711.168291-1-mikhail.v.gavrilov@gmail.com>
References: <20261018205711.168291-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

M Control Center shows a MUTE beside each level these controls offer,
and the card keeps it: a MUTE left on by another host silences that
input or output here, with nothing on Linux to show it or to clear it.

Offer each as a switch named after its level, so that alsa-lib's simple
mixer joins the two and a sound server mutes through the card: the
inputs' MUTEs at property 05 of their targets, the outputs' at property
04 of both targets of their pair, and in Mobile Mode those of the
Playback 1/2 knob and the Recording fader at property 04 of theirs. The
card takes 1 for muted, so each switch is the inverse, on when the
sound passes. Each was pressed in the application and captured, in
both modes. The application writes them all off at each connect, and
so does the first bind here. The card reports the outputs' in its
announce, as 0x64/04 and 0x62/04, and that report has the last word.

The card also releases a MUTE by itself. In Pro Audio and Live Streaming
Mode, HP's volume written from the host while HP was muted released the
MUTE in 29 writes of 54, by HP's sound through a cable to AUX, and the
card reported each release at 0x64/04; a MUTE written right after the
volume did not hold in 7 probes of 9. No other level written from the
host released its MUTE. A sound server writes such a volume as a matter
of course: PipeWire, switching back to a device it has saved as muted,
writes the MUTE and then the volume 4 ms later, and the card released
HP's MUTE after 11 such switches of 20, for about two seconds before
PipeWire wrote the MUTE again. So a level set while its switch is off is
only kept, and the switch writes it on its way on, just before the
MUTE 0, as M Control Center writes a level turned under a MUTE before
releasing it. A bind and a resume, which write a level and then its
MUTE, leave a muted level to its switch the same way.

In Live Streaming Mode a level turned one step on the panel released its
port's MUTE in 257 turns of 260. The card reported every release of HP,
AUX and OTG OUT and most of IN 1's and IN 2's, and the switches follow
those reports rather than guess: a release left unreported stays shown
as muted, as M Control Center shows it. A level kept under a MUTE the
card has released, or one the card has reported, is dropped rather than
written over the card's own.

The MUTE on each of Pro Audio Mode's loopback returns has no property of
its own: the application writes the return's gain to off and, when
released, back to its level, and a return carrying a tone stayed as it
was with 1 written to 04 or 05 of its targets. Off is already the
bottom step of that volume control, so the returns get no switch.

Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
 sound/usb/mixer_topping.c | 106 +++++++++++++++++++++++++++++++++++---
 1 file changed, 98 insertions(+), 8 deletions(-)

diff --git a/sound/usb/mixer_topping.c b/sound/usb/mixer_topping.c
index 854ff0a..5fd14b3 100644
--- a/sound/usb/mixer_topping.c
+++ b/sound/usb/mixer_topping.c
@@ -46,6 +46,7 @@
  * after the card appears.
  */
 
+#include <linux/bitmap.h>
 #include <linux/bits.h>
 #include <linux/build_bug.h>
 #include <linux/cleanup.h>
@@ -115,6 +116,7 @@ struct topping_ctl_desc {
 	const unsigned int *tlv;	/* NULL for a switch */
 	const s32 *map;		/* what each step writes, or NULL: the step */
 	bool sw;		/* an on/off switch, not a level */
+	bool mute;		/* a MUTE, 1 when on: the switch is its inverse */
 	u8 resend;		/* written again after this one if on, or 0 */
 	u8 modes;		/* the modes that have it, or 0 for all */
 };
@@ -163,21 +165,51 @@ static_assert(ARRAY_SIZE(topping_m62_lb_gain) == 103);
 
 static const DECLARE_TLV_DB_SCALE(topping_tlv_lb, -9000, 100, 1);
 
+/*
+ * Each level has the MUTE the vendor application shows beside it, as a
+ * switch of the same name: property 05 for an input and 04 for an
+ * output, where 1 is muted.  The application writes all of them with
+ * the sound on at every connect, and so does the first bind here; the
+ * card reports the outputs' in its announce, and that report has the
+ * last word.  The card also releases a MUTE by itself: HP's in about
+ * half the writes of HP's volume made under it, and any port's when its
+ * level is turned on the panel.  So a level set while its switch is off
+ * is only kept, and written on the switch's way on, as the application
+ * writes a level turned under a MUTE before releasing it.  The card
+ * reports most of its own releases, and the switch follows the report;
+ * a release left unreported is not guessed at.  A loopback return's
+ * MUTE has no property: the application writes the gain to off and
+ * back, and off is the bottom step of the return's volume here.
+ */
 static const struct topping_ctl_desc topping_m62_ctls[] = {
 	{ "Mic1 Analog Capture Volume", 0x21, 0, 0x04, 0, 88,
 	  0, topping_tlv_gain },			/* 0 dB */
+	{ "Mic1 Analog Capture Switch", 0x21, 0, 0x05, 0, 1, 1,
+	  .sw = true, .mute = true },
 	{ "Mic2 Analog Capture Volume", 0x22, 0, 0x04, 0, 88,
 	  0, topping_tlv_gain },			/* 0 dB */
+	{ "Mic2 Analog Capture Switch", 0x22, 0, 0x05, 0, 1, 1,
+	  .sw = true, .mute = true },
 	{ "Aux Capture Volume", 0x23, 0, 0x04, 0, 99,
 	  81, topping_tlv_out_9 },		/* 0 dB */
+	{ "Aux Capture Switch", 0x23, 0, 0x05, 0, 1, 1,
+	  .sw = true, .mute = true },
 	{ "Bluetooth Capture Volume", 0x25, 0, 0x04, 0, 99,
 	  99, topping_tlv_out_0 },		/* 0 dB */
+	{ "Bluetooth Capture Switch", 0x25, 0, 0x05, 0, 1, 1,
+	  .sw = true, .mute = true },
 	{ "OTG Capture Volume", 0x27, 0, 0x04, 0, 99,
 	  99, topping_tlv_out_0 },		/* 0 dB */
+	{ "OTG Capture Switch", 0x27, 0, 0x05, 0, 1, 1,
+	  .sw = true, .mute = true },
 	{ "Headphone Playback Volume", 0x64, 0x63, 0x03, 0, 99,
 	  0, topping_tlv_out_9 },		/* the quiet end */
+	{ "Headphone Playback Switch", 0x64, 0x63, 0x04, 0, 1, 1,
+	  .sw = true, .mute = true },
 	{ "OTG Playback Volume", 0x62, 0x61, 0x03, 0, 99,
 	  99, topping_tlv_out_0 },		/* 0 dB, unity */
+	{ "OTG Playback Switch", 0x62, 0x61, 0x04, 0, 1, 1,
+	  .sw = true, .mute = true },
 	/*
 	 * A loopback return's gain is written to both targets of its pair
 	 * and never reported.  It starts at 0 dB, unity, as the vendor
@@ -197,15 +229,20 @@ static const struct topping_ctl_desc topping_m62_ctls[] = {
 	 * headphones, which carry it with every input while the recording
 	 * does not, and its Recording fader, the level of the recording.
 	 * Both are whole decibels, -90 to +12 and -90 to 0, where Pro Audio
-	 * Mode takes Q25 on the same targets.  Neither is reported, so the
-	 * first bind writes 0 dB: the knob then passes the playback's level
-	 * on unchanged, as Pro Audio Mode's outputs do with the mixer out of
-	 * the path, and the fader is at its top.
+	 * Mode takes Q25 on the same targets.  Neither is reported, nor is
+	 * either MUTE, so the first bind writes 0 dB and the sound on: the
+	 * knob then passes the playback's level on unchanged, as Pro Audio
+	 * Mode's outputs do with the mixer out of the path, and the fader is
+	 * at its top.
 	 */
 	{ "PCM Playback Volume", 0x53, 0x54, 0x03, -90, 12,
 	  0, topping_tlv_lb, .modes = TOPPING_MOBILE },
+	{ "PCM Playback Switch", 0x53, 0x54, 0x04, 0, 1, 1,
+	  .sw = true, .mute = true, .modes = TOPPING_MOBILE },
 	{ "Recording Capture Volume", 0x51, 0x52, 0x03, -90, 0,
 	  0, topping_tlv_lb, .modes = TOPPING_MOBILE },
+	{ "Recording Capture Switch", 0x51, 0x52, 0x04, 0, 1, 1,
+	  .sw = true, .mute = true, .modes = TOPPING_MOBILE },
 };
 
 /*
@@ -535,6 +572,7 @@ struct topping_mixer {
 
 	spinlock_t val_lock;		/* the cache and kctl[] against reports */
 	int *val;			/* one per row of the model's ctls */
+	unsigned long *kept;		/* levels set under their MUTE, unwritten */
 	unsigned int *sel;		/* one per row of its enums */
 
 	/* the volume controls and switches first, then the selectors */
@@ -548,6 +586,7 @@ static void topping_mixer_release(struct kref *ref)
 
 	kfree(tm->kctl);
 	kfree(tm->sel);
+	bitmap_free(tm->kept);
 	kfree(tm->val);
 	mutex_destroy(&tm->lock);
 	kfree(tm);
@@ -585,12 +624,45 @@ static int topping_index_of(const struct topping_mixer *tm, u8 target,
 	return -1;
 }
 
+/* whether the row after @idx is the MUTE of the level in it */
+static bool topping_muted(const struct topping_model *m, int idx)
+{
+	return idx + 1 < m->num_ctls && m->ctls[idx + 1].mute;
+}
+
 static int topping_write_ctl(struct topping_mixer *tm, int idx, int value)
 {
-	const struct topping_ctl_desc *d = &tm->model->ctls[idx];
-	s32 wire = d->map ? d->map[value] : value;
+	const struct topping_model *m = tm->model;
+	const struct topping_ctl_desc *d = &m->ctls[idx];
+	s32 wire = d->mute ? !value : d->map ? d->map[value] : value;
+	bool kept;
 	int err, other, on;
 
+	/*
+	 * A level set while its switch is off is only kept: written under
+	 * the MUTE, it may be taken for a release.  The switch writes it on
+	 * its way on, before the MUTE 0, so that the sound comes back at it.
+	 */
+	if (topping_muted(m, idx)) {
+		scoped_guard(spinlock_irqsave, &tm->val_lock) {
+			on = tm->val[idx + 1];
+			if (!on)
+				__set_bit(idx, tm->kept);
+		}
+		if (!on)
+			return 0;
+	} else if (d->mute && value) {
+		scoped_guard(spinlock_irqsave, &tm->val_lock) {
+			kept = test_bit(idx - 1, tm->kept);
+			other = tm->val[idx - 1];
+		}
+		if (kept) {
+			err = topping_write_ctl(tm, idx - 1, other);
+			if (err)
+				return err;
+		}
+	}
+
 	err = topping_write(tm, d->target, d->prop, wire);
 	if (!err && d->target_pair) {
 		/*
@@ -599,6 +671,10 @@ static int topping_write_ctl(struct topping_mixer *tm, int idx, int value)
 		 */
 		err = topping_write(tm, d->target_pair, d->prop, wire);
 	}
+	if (!err && topping_muted(m, idx)) {
+		scoped_guard(spinlock_irqsave, &tm->val_lock)
+			__clear_bit(idx, tm->kept);
+	}
 	if (!err && d->resend) {
 		other = topping_index_of(tm, d->resend, d->prop);
 		scoped_guard(spinlock_irqsave, &tm->val_lock)
@@ -622,7 +698,8 @@ static int topping_write_sel(struct topping_mixer *tm, int idx,
  * values the cache was born with; at a later bind, with what was set
  * while this side was alone, which is still only in the cache; and after
  * a resume, in case the card came up on its own defaults or was changed
- * on its panel while the host slept.
+ * on its panel while the host slept.  A level whose switch is off is
+ * kept for the switch, as a put keeps it.
  *
  * Errors are not passed on.  The HID driver logs the ones that mean
  * something, and a card that cannot be written now is written again by
@@ -724,12 +801,24 @@ static void topping_report(struct topping_component *comp, u8 target,
 		topping_report_sel(tm, target, prop, value);
 		return;
 	}
+	if (tm->model->ctls[idx].mute)
+		value = !value;
 	if (value < tm->model->ctls[idx].min ||
 	    value > tm->model->ctls[idx].max)
 		return;
 
 	guard(spinlock_irqsave)(&tm->val_lock);
 
+	/*
+	 * The card's word, on a level or on the release of its MUTE, drops
+	 * a level kept under that MUTE, rather than have it written over
+	 * the card's later.
+	 */
+	if (topping_muted(tm->model, idx))
+		__clear_bit(idx, tm->kept);
+	else if (tm->model->ctls[idx].mute && value)
+		__clear_bit(idx - 1, tm->kept);
+
 	if (tm->val[idx] == value)
 		return;
 	tm->val[idx] = value;
@@ -1202,9 +1291,10 @@ static struct topping_mixer *topping_mixer_new(struct usb_mixer_interface *mixer
 	spin_lock_init(&tm->val_lock);
 
 	tm->val = kzalloc_objs(*tm->val, m->num_ctls);
+	tm->kept = bitmap_zalloc(m->num_ctls, GFP_KERNEL);
 	tm->sel = kzalloc_objs(*tm->sel, m->num_enums);
 	tm->kctl = kzalloc_objs(*tm->kctl, m->num_ctls + m->num_enums);
-	if (!tm->val || !tm->sel || !tm->kctl) {
+	if (!tm->val || !tm->kept || !tm->sel || !tm->kctl) {
 		kref_put(&tm->ref, topping_mixer_release);
 		return NULL;
 	}
-- 
2.43.0

