Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793554594;
	b=B19kqWP6LRDhFCAqTll3dVCFQpLLR+yH6h2voA4lRYqIwzWoPj9ECTtlTlvpnc0tnQWi
	 vWwnIQ81NamzCRxkkNxyDe44Vl63wEulI6qJTY+E55WdIsav/WOK/81dnde2DeMsDCwJu
	 HKH9pCaQvjwmzcGVY4TcTUT5TPEnANxY+oul6WKnHX33b6sBOkKkzsz9GYMFAm1CvwPXa
	 1b2o0Rm5gsZKKB+4Q3qxHL6fdDEj0bjRaE/HMRf/GeynxhNhd0isLv/bbp/+1ec1HoKYL
	 x2KHl4pSoJfGR/xRklQ1zC/96xaZeXimI5V1R6vQAgnXG821DASBDVQrTjHnzeS9HkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793554594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zLkUAhIEsQVw9J8rJCtMxwzX85X0dmlthSr43BAfg5E=;
	b=sncgp4eAMFBcnvYlp50/4GfKUYGqW7+KnwCm75xN9QFwFdUMLCNUML2rHUD7zzWWblRA
	 omBOAT1mZo0ZcRXm7uCb7Ud7GKEjToEP7ItUuJuNAj2IBPJ4/NjDBKCix8Ka8qjbtC1CK
	 cTtODMuda0TXcdSuhdP00u7jIYlX/RpwR3A0HqdU6AIYCTkxkVhaYXFeP3nLYu/hm8ekP
	 LELW8qGiUyyvAUR+9c0hNOUyG+M4GRIUZAKCKkT13OaDgVXWZIPBl8kjohQzaLoJrft6E
	 pAV2OCzdlBtbEDxQcep379dKWh06GZlIJedDVD0mpBmQnVrAmdeqO9ShcfUL51lAF7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SzgqRipu;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ADF606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3ADF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SzgqRipu
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-84e513877a3so2118756a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793554593; x=1794159393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zLkUAhIEsQVw9J8rJCtMxwzX85X0dmlthSr43BAfg5E=;
        b=SzgqRipuguqYiIXBRiB+lMRexNXZaczFHHpt/kApHrj9nen69jjpBXL4iqh6ilLKae
         G5Bx1YLd6nNG7jLd/9oc4ZXTJSsmcrOGTc+vLkVpu4V/ZBqMujPeVXsAzUI8k51BYtOp
         4TspU5f4r3pEEIlWhS3kdmyf0bAVgD+paFbE19MSzBEXYe/s/4pCTSg9rOuUU8DayLPl
         mMz/7xI/qzI0ukIX36JzywdHeS6o+vyLC9025aoROXtBfwNAuvVNdD+FYr1PMhFuSAlA
         qtoAUavBsA7PSdkmdticnXDL3s1A2BnVjZtni1TgnuTH4CP1fWaxwPbMxZb/yapgrNPt
         /4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793554593; x=1794159393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zLkUAhIEsQVw9J8rJCtMxwzX85X0dmlthSr43BAfg5E=;
        b=YZtvLYy7orJKTkCn0VOsPRtc3XEIuqthoWBysO4+eQY0ukkBgFe00Dktp74SvL1mHa
         MjBSh51za9sF5DiCAPOk/hPKc/opa2KUaceT3WXp3ptbZgu0zdrEzXKW0BrUXUiPO+qX
         EWhJ37RjzZaUVaX1uuhgW2vRxEWzxA2nLIX2qVVHYCySDsu9y6mEcgQ3Zr61wvIQdBIB
         z1ffixKozFV2bbILBFD2IECcpucT17bV2lmbbnZxmmTTLSj51qEIhDvrjvt/aq8zGeP4
         2Axca3kuEXUk4eB0lZ3sYbLKVsoThFDPUYYZBVdXltDHIhUW+Hmtw4GnkAJI8dOSTSSk
         bRXg==
X-Forwarded-Encrypted: i=1; AKwUvByFQVEVB8pCu97d7OrKaigQvrwmT6x7ZmOIyofZmrb7RFZZK19CNLwrUl0br7FI1DiaV01AwbxPOOdU2v8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKto4gab1iyh6Zs/7Nmq6HF4VkqgQy1w8Zhw6OwiD2EKD5O3xH1
	r9hStf/qsO/sOW78eXxc0HvEQ0dvX4WJO7WMdHwVRWnfI9x6d0ZHYrT5
X-Gm-Gg: AYBFou0yklvQgjOL4aW8B1zCOmL86EYzJE1fbyMf2VOHCUqKrfIxkGZ31mZHiXxoUR4
	HCTeBzSLac6VacEmZFD5/LZjNSFXk5+ps92T/sn4AKQsHSbiQQEqGQl5Si1I/cu3QNHR5b/MltO
	5wMuBIox8NqjyZ3eNmYeuLFfIuOZkiBlC0L4AXNSp9V38YskI7fNC6Yg8hOX86CI6OdHVt1FbUn
	C0Fl4iHjJi7n9MLDZZ0zYgKHo+XN0Ei/ePF0rV36lSTj0FhUOaO3iJov/IRd14B9x2OESgiAsKr
	NNjbuY3UeevxNhoouUNJMHqT4aylYi7pGiuWsVyI0Mth36WYo2HolG5ACEcuHgGZkioJIE0xkVr
	FB7+oxxTskm5N8OB2Hn+uT9J6tWPSHLwiGPQMtW0e6QmWGRDKoV+2zUa8MmeVfpTO/YPKBflXqd
	xF8eKhMaO3cG2LRulueheGXYLUkBObg6DpM2vJUVSdU9CadUaaJbah1YQw80v0J81s6X09/28X5
	JVSEqmfK8+MqUJtFR0MibM7oo9OWiKRIxo71dV5mpkS9eEZ/oOVCLld9psUK3LM97JPblKPSxlP
	EbRjeYAizhADm64HU5q15Z5jFsnSMKSj8YvQEtpkJEdJjw==
X-Received: by 2002:a05:6830:2308:b0:7f9:555:1df0 with SMTP id 46e09a7af769-85d364cabf7mr3558785a34.12.1793554592650;
        Sun, 01 Nov 2026 09:36:32 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d3545b875sm7340271a34.5.2026.11.01.09.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:36:31 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: Re: [RFC PATCH 00/11] Re: ALSA: usb-audio: Audient iD14 MkI vendor controls
Date: Sun,  1 Nov 2026 11:35:57 -0600
Message-ID: <20261101173557.221869-1-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101000013.11880-1-arc@gmx.li>
References: <20261101000013.11880-1-arc@gmx.li>
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

Hi Christian,

Thanks for the RFC, and for splitting it into small patches. It made
the review easy, and the cover letter answers my three questions.

I compiled mixer_audient.c after each patch with W=1, out of tree
against a 7.2 kernel's headers: no warnings. checkpatch --strict
gives only CHECK-level style notes. I can't test on an EVO, so the
points below come from reading the code.

1. Patch 10, cache index

The cache has hwchannels entries, and the probe fills it by element
index (cache[i]). But get, put and the INIT_HW write index it by device
channel:

    *value = cache[cidx];    /* cidx = val_offs + i */
    cache[cidx] = value;

So a nonzero val_offs can access past the allocation. On the EVO4,
"Mic 2 Capture Volume" (val_offs 2) uses cache[2] and cache[3] of a
2-entry array, and "Loopback Right Capture Volume" uses cache[10] and
cache[11]. Those rows would also show other memory, not the value read
at probe. On the iD14 the last matrix element would use cache[54] and
cache[55].

Would indexing relative to the element fix it? The diff at the end of
this mail passes the cache entry of channel i instead of the array, so
that raw_get_one() and raw_set_one() never see cidx for the cache.

2. Probe-time USB errors now fail the whole card

With patch 10 the EVO matrix is read at probe, and with INIT_HW a
control is written at probe. If one of those transfers fails,
snd_audient_controls_create() returns the error, snd_usb_create_mixer()
fails, and the card does not register. As far as I can see,
QUIRK_FLAG_IGNORE_CTL_ERROR does not suppress errors returned by
snd_usb_mixer_apply_create_quirk(). Before this series the quirk sent no
USB traffic at probe, so this is new.

Could we keep the card registering after a failed probe transfer, while
keeping the cache entry invalid until a transfer succeeds?

To save a round, I wrote it out; the diff is at the end of this mail, on
top of your series. Please change or drop anything that doesn't fit your
plans.

It gives each cache entry a valid flag, set when a transfer confirms the
value (a read, or a write that succeeded). A failed probe transfer logs
a warning and keeps the control with an invalid entry. For a cached
write-only control, get still succeeds after a failed probe write, so
that failure alone does not stop alsactl store: boolean and integer
controls return their minimum, and my enum type reports "Unknown". A
readable control retries the GET and returns an error if that retry
fails. Since a get can now fill the cache, the callbacks take
mixer->lock. Control allocation and registration errors still fail the
probe. It contains the point 1 fix as well, since both change the same
cache code.

On the iD14 I tested it with a test-only control that the device
refuses (polarity on Digi 3). The card registered, the log showed one
warning for that control, and get returned off. A put returned -EPIPE;
a subsequent get still returned off.

3. Smaller points

- Patch 05: would sign_extend32(buf, 8 * ctype->len - 1) work in
  place of the shift pair?
- Patch 05: the buffers mix u32/s32 with cpu_to_le32()/le32_to_cpu().
  Would __le32 buffers keep sparse quiet?
- Patch 05: the transfer buffer is 4 bytes on the stack, but nothing
  checks the table's len. Could snd_audient_add_ctrl() return -EINVAL
  unless 1 <= len <= 4?
- Patch 09: with FORCE_SET, a put of the cached value still writes
  (good) but also reports a change, so each alsactl restore sends a
  change event for every such control. Could it write but return 0
  when the cache already holds the value?
- Patch 11: a device with no matrix list would dereference NULL in the
  loop. Would a check on info->matrix_names be worth adding?
- Patch 01: FYI, the file header still says "Audient EVO driver for
  ALSA".

4. iD14 tables on top

I built the iD14 tables on your series, with the cache fix applied.
On an iD14 MkI they passed control read and write checks, the range
checks and a loopback test of the matrix crosspoints. The crosspoints
also kept their values across a module reload and were read back into
the cache.

On top of your patches I needed three generic additions:

- a step size for integer types (res): the iD14 level controls use
  s16 in 1/256 dB; I expose them in whole-dB steps, matching the
  volume knob. The control counts steps from min, as the generic USB
  mixer does with the RANGE resolution;
- an enumerated type with a value list, plus one extra last item that
  a get shows for a device value outside the list;
- a per-device create hook, for the FU 12 control that does not fit
  the tables (in the same patch as that control).

The matrix uses your loop as it is: with 2 channels per element and the
names in the order Mic 1 Main, Mic 1 Cue, Mic 2 Main, ..., element n
starts at CN 2 * n, which is input * 4 + output on the iD14. Does that
fit what you had in mind?

5. Next steps

Would you prefer to incorporate these changes in an RFC v2, or shall I
fold them into the relevant patches when I carry your series, with
notes in the commit messages?

Thanks,
Will

-- >8 --
From: Will Porter <mrwillporter@gmail.com>
Subject: [RFC PATCH] ALSA: mixer_audient: Fix cache indexing and probe error handling

The cache has hwchannels entries, but get, put and the INIT_HW write
indexed it with the device channel (val_offs + i). Pass the entry of
element channel i instead.

A failed probe transfer made snd_audient_controls_create() fail, so
the card did not register. Give each cache entry a valid flag, set
when a transfer confirms the value: a read, or a write that
succeeded. A failed probe transfer logs a warning and leaves the entry
invalid. A readable control then reads the device on its next get,
and returns an error if that read fails; a write-only (FORCE_SET)
control shows its minimum until a put succeeds. CACHE | FORCE_SET
without INIT_HW keeps the earlier behaviour: the init value is
assumed, without a transfer.

A get can now fill the cache, and the control core runs gets in
parallel, so the callbacks take mixer->lock around the transfers and
the cache.

Control allocation and registration errors still fail the probe.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
Proposed changes to patches 08 and 10.

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 30f2f20..ef8fcdf 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -210,6 +210,26 @@ static inline u16 snd_audient_kctl_channels(struct snd_kcontrol *kctl)
 	return info->channels;
 }
 
+/*
+ * A cached value is valid once a transfer confirmed it: a read, or a write
+ * that succeeded. A probe transfer that fails leaves it invalid. CACHE |
+ * FORCE_SET without INIT_HW keeps the earlier behaviour: the init value is
+ * assumed, without a transfer.
+ */
+struct snd_audient_cache_entry {
+	u32 value;
+	bool valid;
+};
+
+/* Cache entry of element channel i, or NULL for an uncached control. */
+static inline struct snd_audient_cache_entry *
+snd_audient_cache_slot(struct usb_mixer_elem_info *elem, unsigned int i)
+{
+	struct snd_audient_cache_entry *const cache = elem->private_data;
+
+	return cache ? cache + i : NULL;
+}
+
 
 #define AUDIENT_REQTYPE_SET (USB_DIR_OUT | USB_TYPE_CLASS \
 					 | USB_RECIP_INTERFACE)
@@ -259,18 +279,25 @@ static inline int snd_audient_set_cur(struct usb_mixer_interface *mixer,
 
 static int snd_audient_raw_get_one(struct usb_mixer_interface *const mixer,
 			const struct snd_audient_ctrl_type *const ctype,
-			const u32 *const cache,
+			struct snd_audient_cache_entry *const slot,
 			const u8 cidx, u32 *const value)
 {
 	int ret;
 	s32 buf = 0;
 
-	if (cache) {
-		*value = cache[cidx];
+	if (slot && slot->valid) {
+		*value = slot->value;
 
 		return ctype->len;
 	}
 
+	/*
+	 * Cached FORCE_SET controls are treated as write-only: an invalid
+	 * cache entry does not trigger a GET.
+	 */
+	if (slot && (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET))
+		return -ENODATA;
+
 	ret = snd_audient_get_cur(mixer, ctype, cidx, &buf);
 	if (ret < 0)
 		return ret;
@@ -285,12 +312,18 @@ static int snd_audient_raw_get_one(struct usb_mixer_interface *const mixer,
 
 	*value = buf;
 
+	if (slot) {
+		slot->value = buf;
+		slot->valid = true;
+	}
+
 	return ret;
 }
 
 static int snd_audient_raw_set_one(struct usb_mixer_interface *const mixer,
 			const struct snd_audient_ctrl_type *const ctype,
-			u32 *const cache, const u8 cidx, const u32 value,
+			struct snd_audient_cache_entry *const slot,
+			const u8 cidx, const u32 value,
 			bool force)
 {
 	int ret;
@@ -299,7 +332,7 @@ static int snd_audient_raw_set_one(struct usb_mixer_interface *const mixer,
 	if ((ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET) || force) {
 		buf = !value;		/* just make it different */
 	} else {
-		ret = snd_audient_raw_get_one(mixer, ctype, cache, cidx, &buf);
+		ret = snd_audient_raw_get_one(mixer, ctype, slot, cidx, &buf);
 		if (ret < 0)
 			return ret;
 	}
@@ -310,8 +343,10 @@ static int snd_audient_raw_set_one(struct usb_mixer_interface *const mixer,
 		if (ret < 0)
 			return ret;
 
-		if (cache)
-			cache[cidx] = value;
+		if (slot) {
+			slot->value = value;
+			slot->valid = true;
+		}
 
 		return 1;
 	}
@@ -337,14 +372,18 @@ static int snd_ctl_audient_boolean_get(struct snd_kcontrol *kctl,
 	CLASS(snd_usb_lock, pm)(mixer->chip);
 	if (pm.err < 0)
 		return pm.err;
+	/* serializes the transfers and the cache, also between gets */
+	guard(mutex)(&mixer->lock);
 
 	for (i = 0; i < hwchan; i++) {
 		u32 buf;
 		int ret;
 
-		ret = snd_audient_raw_get_one(mixer, ctype, elem->private_data,
+		ret = snd_audient_raw_get_one(mixer, ctype, snd_audient_cache_slot(elem, i),
 					      base + i, &buf);
-		if (ret < 0)
+		if (ret == -ENODATA)	/* unknown write-only value: off */
+			buf = ctype->min.integer;
+		else if (ret < 0)
 			return ret;
 
 		ctl_val->value.integer.value[i] = (buf == ctype->min.integer)
@@ -374,13 +413,15 @@ static int snd_ctl_audient_boolean_set(struct snd_kcontrol *kctl,
 	CLASS(snd_usb_lock, pm)(mixer->chip);
 	if (pm.err < 0)
 		return pm.err;
+	/* serializes the transfers and the cache, also between gets */
+	guard(mutex)(&mixer->lock);
 
 	for (i = 0; i < hwchan; i++) {
 		u32 buf = ctl_val->value.integer.value[i] ? ctype->max.integer
 							  : ctype->min.integer;
 		int ret;
 
-		ret = snd_audient_raw_set_one(mixer, ctype, elem->private_data,
+		ret = snd_audient_raw_set_one(mixer, ctype, snd_audient_cache_slot(elem, i),
 					      base + i, buf, false);
 		if (ret < 0)
 			return ret;
@@ -409,14 +450,18 @@ static int snd_ctl_audient_integer_get(struct snd_kcontrol *kctl,
 	CLASS(snd_usb_lock, pm)(mixer->chip);
 	if (pm.err < 0)
 		return pm.err;
+	/* serializes the transfers and the cache, also between gets */
+	guard(mutex)(&mixer->lock);
 
 	for (i = 0; i < hwchan; i++) {
 		s32 val;
 		int ret;
 
-		ret = snd_audient_raw_get_one(mixer, ctype, elem->private_data,
+		ret = snd_audient_raw_get_one(mixer, ctype, snd_audient_cache_slot(elem, i),
 					      base + i, &val);
-		if (ret < 0)
+		if (ret == -ENODATA)	/* unknown write-only value: minimum */
+			val = ctype->min.integer;
+		else if (ret < 0)
 			return ret;
 
 		if (val < ctype->min.integer)
@@ -458,12 +503,14 @@ static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
 	CLASS(snd_usb_lock, pm)(mixer->chip);
 	if (pm.err < 0)
 		return pm.err;
+	/* serializes the transfers and the cache, also between gets */
+	guard(mutex)(&mixer->lock);
 
 	for (i = 0; i < hwchan; i++) {
 		s32 val = ctl_val->value.integer.value[i];
 		int ret;
 
-		ret = snd_audient_raw_set_one(mixer, ctype, elem->private_data,
+		ret = snd_audient_raw_set_one(mixer, ctype, snd_audient_cache_slot(elem, i),
 					      base + i, val, false);
 		if (ret < 0)
 			return ret;
@@ -534,7 +581,8 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 
 	elem = kzalloc(sizeof(*elem)
 		       + ((ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE)
-			  ? (sizeof(u32) * ctrl->hwchannels)
+			  ? (sizeof(struct snd_audient_cache_entry)
+			     * ctrl->hwchannels)
 			  : 0),
 		       GFP_KERNEL);
 	if (!elem)
@@ -546,33 +594,44 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE)
 		elem->private_data = elem + 1;
 
+	/*
+	 * A failed probe transfer must not fail the card: warn and keep the
+	 * control. Its cache entry stays invalid, so a readable control reads
+	 * the device again on its next get, and a write-only control shows an
+	 * unknown value until a put succeeds.
+	 */
 	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_INIT_HW) {
 		int i;
 
 		for (i = 0; i < ctrl->hwchannels; i++) {
 			ret = snd_audient_raw_set_one(mixer, ctype,
-						      elem->private_data,
+						      snd_audient_cache_slot(elem, i),
 						      ctrl->val_offs + i,
 						      ctype->init, true);
 			if (ret < 0)
-				goto free_elem;
+				usb_audio_warn(mixer->chip,
+					       "%s: cannot set channel %d (%d)\n",
+					       ctrl->name, i, ret);
 		}
 	} else if (elem->private_data) {
-		u32 *const cache = elem->private_data;
+		struct snd_audient_cache_entry *const cache = elem->private_data;
 		int i;
 
-		if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET)
-			for (i = 0; i < ctrl->hwchannels; i++)
-				cache[i] = ctype->init;
-		else
-			for (i = 0; i < ctrl->hwchannels; i++) {
-				ret = snd_audient_raw_get_one(
-							mixer, ctype, NULL,
-							ctrl->val_offs + i,
-							cache + i);
-				if (ret < 0)
-					goto free_elem;
+		for (i = 0; i < ctrl->hwchannels; i++) {
+			if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET) {
+				cache[i].value = ctype->init;
+				cache[i].valid = true;
+				continue;
 			}
+
+			ret = snd_audient_raw_get_one(mixer, ctype, cache + i,
+						      ctrl->val_offs + i,
+						      &cache[i].value);
+			if (ret < 0)
+				usb_audio_warn(mixer->chip,
+					       "%s: cannot read channel %d (%d)\n",
+					       ctrl->name, i, ret);
+		}
 	}
 
 	kctl = snd_ctl_new1(&knew, elem);
