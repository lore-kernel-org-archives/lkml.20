Received: from mail-wr2-f19.google.com (mail-wr2-f19.google.com [74.125.225.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273B24E77FD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731623; cv=none; b=kmGy5XeeJXe1lu69wVgDLvrJtEY53uA28VRrDc4V7JF6xlaxJmTbkZeGl8kg7jQtH1e98tGr7VL4/Wfe2vACLqlUm9UeCVBMhP8PdfBVdVQOPfNwo70lgS9iLm7R+362rP7QhYvPdI2LA0Z423dtjcBp9lUsN9pk2ryuubYwPrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731623; c=relaxed/simple;
	bh=N9lsuswxVrYwSTUGqeCQ5aqaC+0b9vUrsXeRgKDNqPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TgGNsVLHCFhATat27/44/bErINPIyOGoOeQSeQ0petGsDPLmXhGyd6SPaMeJCaq98Ec+l7d5gIue25mEPWqMBIC85IQh4dUzlxOo/Vv7EfDU6OEuSgZ6uWACq0Pt8buVKhbjHjee9QGwfD0PZtY14iET1WT68IBeNY0/J+HFIIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MvxFDe9W; arc=none smtp.client-ip=74.125.225.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MvxFDe9W"
Received: by mail-wr2-f19.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so313154f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731614; x=1790336414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ozPCMpHRaeK3oKbMcMB0RXJsnNRXIAIurCYBxInbtzk=;
        b=MvxFDe9W57eFZllWVxD+clwMhtGEcPakGFjlJqa140l1j+ODB72JkG8PREAuunaULM
         oSljb1j/PMatgzZwyzqwSoxQJVFjiNxregFHN8VzjKiNcJy1mtSz+8ehMKxtW+Uj84JF
         MPTpechEnKRj9l6+DmqZgq5bXhScEI+xbDhpsLGAdnFCMFjKUzxpPeL6lW0P30rgEbo4
         gQ8uA3YuZmwOElhxDm9Jo8Q8sH4YuDPxwKvZbUEDQ+QvEtG1HrqABsrJoDKRJqnDLMxs
         UyAGn8go7Jlm79sfsApJSAhg1ynvFFdeICaK4cTwhJHAb462Ku/YJ7oytI3g23OsAYWN
         5TYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731614; x=1790336414;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ozPCMpHRaeK3oKbMcMB0RXJsnNRXIAIurCYBxInbtzk=;
        b=aBdpyY4ClD53PH54X4Vbt8tsu7BAC4oyqrpGOdJnpYoO2iwZSD5nOwlq9/qyU5YHqv
         zX/1KeVOb36mL8eD6nhNzR4pqKRB8PkpP6OuBp02mlNF1uoPgD5qTg4f7dHlODZ0oZuB
         ZWN0Ui6A1LiZr+UrK87oD4r+Y1MeeE1JcbCDy8AOVq58BTTzE8RAI+l0royoFgy74yS5
         GZZrqk3LqHFLnjgSNH2AnvEMLFEvAXTqeJJJ77DOpqCfxvarlNLcU7snjfeX9nJOC4Ob
         qzaJf91noTItTc1ziIM1nWEJ6kF/bAFs9MpYgQfIvNAOErYSXvxPcSBXPHjInqnXT3T8
         kuog==
X-Forwarded-Encrypted: i=1; AKwUvBx2zQ2r9oJHCLy9lKAp8ZSouwS+r15HpHn0MWLNoF5UqfqvJzJpOL/X/csaApFF5Tgy4xiDViMP3CSLhBU=@vger.kernel.org
X-Gm-Message-State: AFuF++mfjQHSM8XUNJ4vdVzlR8DwPc76iHewYUD1DAtp9JiXU22V1sZ5
	jF6q7XFIGdFxPtOlEs8Mlqh63iiechyeVbmoUGq4OIU2AJeQLYOQ7wkU
X-Gm-Gg: AYBFou0oX/GzWWyHBW34vekLPK6eC5mb6Fc0omgIX+7uQV29dxuGUAvlZYMPWw6w1lk
	aabQTGErv6356KgPDPdCqYvGKmym3MMN9SlqSzxL+MImYBlqhHKZzEh3T9kU86uA9b24+dpLKpt
	ZBck259yXXKlEnmKeCAihdGbYNHNLjcQL8OLAOWljuaq4GRxJWdoXnfvJPeLLGOWHWzvpY5ib8/
	1WaE7Ns0g00oIYckBvmketCgcVdylxXTweKCBN4IBuQXfe4FR/WuO6U5oqlNU1M2Y8RFBjKNJgk
	y0PuIVrhCmedNkEcl1otnfQxWw3JISkXAsgbc8FUEUm8zNVwK2UR1hhCUBW5apYSmB52l3q1IeV
	WcFlnTNNjuMcILQ3HI3b8RPTsO1XCs5BP4x0BeIWaeOxBrCsNXGFW5BdnTc1hyU7x/49Wak4pi5
	ztpxWWGXPfVQhlXYitITTV4nYaFcFYEsS4yqSI3w97/gHalkQGnXgwG/JMbj3Z8nrjSDqzpr3PV
	V8SX5SAV4hjDEApw97iwPr1jvHE/TP6gkP8rA==
X-Received: by 2002:a5d:5f4f:0:b0:486:f4ae:72a2 with SMTP id ffacd0b85a97d-4871e2131a7mr3200928f8f.1.1789731613473;
        Fri, 18 Sep 2026 04:40:13 -0700 (PDT)
Received: from cachyos ([41.143.99.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5636sm3734893f8f.5.2026.09.18.04.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:40:12 -0700 (PDT)
From: =?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
To: linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	=?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
Subject: [RFC PATCH v5 4/8] ALSA: usb: babyfacepro: add routing flags and varispeed pitch
Date: Fri, 18 Sep 2026 12:39:40 +0100
Message-ID: <20260918113944.76871-5-i.bahloul01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918113944.76871-1-i.bahloul01@gmail.com>
References: <20260918113944.76871-1-i.bahloul01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds loopback, AN 1>2, sample clock source, AN1/2 link, MS processor,
DIM, width, FX send and varispeed pitch.  Pitch is included here
rather than its own patch because the source function that created
these controls registered all of them, pitch included, in one pass.

bf_state_apply_flags() (re-applying this group after a cold-init, on
top of babyface_restore_state()) is introduced here too, since none
of this state existed for it to restore before this patch.

Signed-off-by: Ismaïl Bahloul <i.bahloul01@gmail.com>
---
 sound/usb/babyfacepro/babyfacepro-ctl.c | 660 ++++++++++++++++++++++++
 sound/usb/babyfacepro/babyfacepro.c     | 210 +++++++-
 sound/usb/babyfacepro/babyfacepro.h     |  42 +-
 3 files changed, 900 insertions(+), 12 deletions(-)

diff --git a/sound/usb/babyfacepro/babyfacepro-ctl.c b/sound/usb/babyfacepro/babyfacepro-ctl.c
index 8ee711b81..2b4dd471d 100644
--- a/sound/usb/babyfacepro/babyfacepro-ctl.c
+++ b/sound/usb/babyfacepro/babyfacepro-ctl.c
@@ -19,8 +19,10 @@
  * state persistence, card lifecycle).
  */
 #include <linux/log2.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/string.h>
 #include <linux/unaligned.h>
 #include <linux/usb.h>
 #include <linux/workqueue.h>
@@ -1457,3 +1459,661 @@ int babyface_create_preamp(struct snd_usb_babyface *chip)
 	return 0;
 }
 
+static int bf_switch_info(struct snd_kcontrol *kctl,
+			  struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 1;
+	return 0;
+}
+
+static int bf_pitch_info(struct snd_kcontrol *kctl,
+			 struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = -50;		/* -5.0 % */
+	uinfo->value.integer.max = 50;		/* +5.0 % */
+	uinfo->value.integer.step = 1;		/* 0.1 % */
+	return 0;
+}
+
+static int bf_pitch_get(struct snd_kcontrol *kctl,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+
+	ucontrol->value.integer.value[0] = chip->pitch;
+	return 0;
+}
+
+static int bf_pitch_put(struct snd_kcontrol *kctl,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+	int p = ucontrol->value.integer.value[0];
+	int ret = 0;
+
+	if (p < -50 || p > 50)
+		return -EINVAL;
+
+	mutex_lock(&chip->mutex);
+	if (p == chip->pitch)
+		goto out;
+
+	/* The DDS quad is a ratio on top of the family rate, the same at
+	 * every sample rate; bf_pitch_write() sends it with the settings
+	 * keepalive that commits it.
+	 */
+	ret = bf_pitch_write(chip, p);
+	if (ret < 0)
+		goto out;
+	chip->pitch = p;
+	ret = 1;
+out:
+	mutex_unlock(&chip->mutex);
+	return ret;
+}
+
+static int bf_loopback_get(struct snd_kcontrol *kctl,
+			   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+	int out = kctl->private_value;
+
+	ucontrol->value.integer.value[0] = chip->loopback[out];
+	ucontrol->value.integer.value[1] = chip->loopback[out];
+	return 0;
+}
+
+/* Write the full 30-channel loopback map: pair (2*out, 2*out+1) at
+ * `on` (0x0001/0x0000), all other channels cleared - exactly what
+ * TotalMix sends on every loopback toggle (cap_loopback2.pcap).  The
+ * full-map write is also the reliable OFF (the old per-pair write
+ * sometimes failed to disengage on the hardware).
+ */
+int bf_loopback_write_map(struct snd_usb_babyface *chip, int out,
+			  bool on)
+{
+	int ch, ret;
+
+	for (ch = 0; ch < BF_LOOPBACK_CHANNELS; ch++) {
+		u16 val = (on && (ch == out * 2 || ch == out * 2 + 1))
+			  ? 0x0001 : 0x0000;
+
+		ret = bf_vendor_write(chip, BF_REQ_LOOPBACK, val, ch);
+		if (ret < 0)
+			return ret;
+	}
+	return 0;
+}
+
+static int bf_loopback_put(struct snd_kcontrol *kctl,
+			   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+	int out = kctl->private_value;
+	bool on = ucontrol->value.integer.value[0];
+	int ret = 0;
+
+	mutex_lock(&chip->mutex);
+	if (on == chip->loopback[out])
+		goto out;
+	ret = bf_loopback_write_map(chip, out, on);
+	if (ret < 0)
+		goto out;
+	/* Single-active model (TotalMix writes one pair at 0x0001, the
+	 * rest 0x0000): toggling one output clears the others.
+	 */
+	memset(chip->loopback, 0, sizeof(chip->loopback));
+	chip->loopback[out] = on;
+	ret = 1;
+out:
+	mutex_unlock(&chip->mutex);
+	return ret;
+}
+
+static int bf_an12_get(struct snd_kcontrol *kctl,
+		       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+
+	ucontrol->value.integer.value[0] = chip->an12;
+	return 0;
+}
+
+static int bf_an12_put(struct snd_kcontrol *kctl,
+		       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+	bool an12 = ucontrol->value.integer.value[0];
+	u16 v;
+	int ret = 0;
+
+	mutex_lock(&chip->mutex);
+	if (an12 == chip->an12)
+		goto out;
+	v = (chip->linked ? 0x0400 : 0x0000) | (an12 ? 0x1000 : 0x0000);
+	ret = bf_vendor_write(chip, BF_REQ_PREAMP, v, 0x1000);
+	if (ret < 0)
+		goto out;
+	ret = bf_vendor_write(chip, BF_REQ_PREAMP_COMMIT, 0x0000, 0x0000);
+	if (ret < 0)
+		goto out;
+	chip->an12 = an12;
+	ret = 1;
+out:
+	mutex_unlock(&chip->mutex);
+	return ret;
+}
+
+/* Clock source (PROTOCOL.md "Clock source / no-lock state",
+ * hardware-verified 2026-08-22, clktest.c): NOT a register write at
+ * all - only the BF_REG_KEEPALIVE_SETTINGS word changes (bit 2 =
+ * Optical). Matches the naming TuxMix's ALSA backend already looks
+ * for ("Sample Clock Source", the same name found on the stock
+ * snd-usb-audio Class-Compliant driver) so it picks this control up
+ * with zero changes on that side.
+ */
+static const char *const bf_clock_texts[] = {
+	"Internal", "Optical In", NULL
+};
+
+static int bf_clock_info(struct snd_kcontrol *kctl,
+			 struct snd_ctl_elem_info *uinfo)
+{
+	return snd_ctl_enum_info(uinfo, 1, 2, bf_clock_texts);
+}
+
+static int bf_clock_get(struct snd_kcontrol *kctl,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+
+	ucontrol->value.enumerated.item[0] = chip->clock_optical ? 1 : 0;
+	return 0;
+}
+
+static int bf_clock_put(struct snd_kcontrol *kctl,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+	bool optical = ucontrol->value.enumerated.item[0] != 0;
+	int ret = 0;
+
+	mutex_lock(&chip->mutex);
+	if (optical == chip->clock_optical)
+		goto out;
+	chip->clock_optical = optical;
+	ret = bf_settings_write(chip);
+	if (ret < 0) {
+		chip->clock_optical = !optical;
+		goto out;
+	}
+	ret = 1;
+out:
+	mutex_unlock(&chip->mutex);
+	return ret;
+}
+
+static int bf_link_get(struct snd_kcontrol *kctl,
+		       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+
+	ucontrol->value.integer.value[0] = chip->linked;
+	return 0;
+}
+
+static int bf_link_put(struct snd_kcontrol *kctl,
+		       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+	bool linked = ucontrol->value.integer.value[0];
+	u16 v;
+	int ret = 0;
+
+	mutex_lock(&chip->mutex);
+	if (linked == chip->linked)
+		goto out;
+	v = (linked ? 0x0400 : 0x0000) | (chip->an12 ? 0x1000 : 0x0000);
+	ret = bf_vendor_write(chip, BF_REQ_PREAMP, v, 0x1000);
+	if (ret < 0)
+		goto out;
+	ret = bf_vendor_write(chip, BF_REQ_PREAMP_COMMIT, 0x0000, 0x0000);
+	if (ret < 0)
+		goto out;
+	chip->linked = linked;
+	ret = 1;
+out:
+	mutex_unlock(&chip->mutex);
+	return ret;
+}
+
+static int bf_ms_get(struct snd_kcontrol *kctl,
+		     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+
+	ucontrol->value.integer.value[0] = chip->ms_proc;
+	return 0;
+}
+
+/* MS-proc: engage per the cap_ms2.pcap ON pattern - write 0x0000 to
+ * ALL FOUR AN2 (side) crosspoints: standard map 0x0035/0x004F (L/R)
+ * + low map 0x0001/0x001B (L/R) - the side path is muted (ear-
+ * verified 2026-08-26 with the mic on AN2: MS ON = silence); release
+ * restores the cached fader values (host-side, like TotalMix).
+ * (The 0x1000/0x0004 writes are the DISENGAGE restore values seen in
+ * cap_ms2 - the driver had them inverted on the engage path.)
+ */
+static int bf_ms_put(struct snd_kcontrol *kctl,
+		     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+	bool on = ucontrol->value.integer.value[0];
+	int ret = 0;
+
+	mutex_lock(&chip->mutex);
+	if (on == chip->ms_proc)
+		goto out;
+	if (on) {
+		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, 0x0000, 0x0035);
+		if (ret < 0)
+			goto out;
+		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, 0x0000, 0x004f);
+		if (ret < 0)
+			goto out;
+		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, 0x0000, 0x0001);
+		if (ret < 0)
+			goto out;
+		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, 0x0000, 0x001b);
+		if (ret < 0)
+			goto out;
+	} else {
+		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT,
+				      chip->xpoint[1][1][0], 0x0001);
+		if (ret < 0)
+			goto out;
+		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT,
+				      chip->xpoint[1][1][0], 0x0035);
+		if (ret < 0)
+			goto out;
+		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT,
+				      chip->xpoint[1][1][1], 0x001b);
+		if (ret < 0)
+			goto out;
+		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT,
+				      chip->xpoint[1][1][1], 0x004f);
+		if (ret < 0)
+			goto out;
+	}
+	chip->ms_proc = on;
+	ret = 1;
+out:
+	mutex_unlock(&chip->mutex);
+	return ret;
+}
+
+/* DIM - cap_dim2.pcap: an absolute -20 dB on the Phones master
+ * (out 1: 8-bit 0xCB / 16-bit 0x0333) regardless of the current level,
+ * plus the 0x17 wVal=0x2000 wIdx=0x2000 flag; release restores the
+ * pre-DIM master host-side.  The master cache keeps the real volume.
+ */
+static int bf_dim_get(struct snd_kcontrol *kctl,
+		      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+
+	ucontrol->value.integer.value[0] = chip->dim;
+	return 0;
+}
+
+/* Apply DIM on the wire.  chip->mutex must be held: this is reached both
+ * from the ALSA control and from the front-panel poll, and taking the
+ * lock here instead would self-deadlock one of the two.
+ */
+static int bf_dim_apply(struct snd_usb_babyface *chip, bool on)
+{
+	u16 flag;
+	int ret;
+
+	lockdep_assert_held(&chip->mutex);
+	if (on) {
+		chip->dim_saved[0] = chip->master[1][0];
+		chip->dim_saved[1] = chip->master[1][1];
+		ret = bf_vendor_write(chip, BF_REQ_GAIN, BF_MASTER_MINUS20_8,
+				      BF_REG_MASTER_8 + 2 * 1);
+		if (ret < 0)
+			return ret;
+		ret = bf_vendor_write(chip, BF_REQ_GAIN, BF_MASTER_MINUS20_8,
+				      BF_REG_MASTER_8 + 2 * 1 + 1);
+		if (ret < 0)
+			return ret;
+		flag = bf_flag_cycle[chip->flag_cnt];
+		chip->flag_cnt = (chip->flag_cnt + 1) & 3;
+		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT,
+				      BF_MASTER_MINUS20_16,
+				      (BF_REG_MASTER_16 + 2 * 1) | flag);
+		if (ret < 0)
+			return ret;
+		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT,
+				      BF_MASTER_MINUS20_16,
+				      (BF_REG_MASTER_16 + 2 * 1 + 1) | flag);
+		if (ret < 0)
+			return ret;
+		ret = bf_vendor_write(chip, BF_REQ_PREAMP, 0x2000, 0x2000);
+		if (ret < 0)
+			return ret;
+	} else {
+		ret = bf_vendor_write(chip, BF_REQ_GAIN,
+				      bf_master_8bit(chip->dim_saved[0]),
+				      BF_REG_MASTER_8 + 2 * 1);
+		if (ret < 0)
+			return ret;
+		ret = bf_vendor_write(chip, BF_REQ_GAIN,
+				      bf_master_8bit(chip->dim_saved[1]),
+				      BF_REG_MASTER_8 + 2 * 1 + 1);
+		if (ret < 0)
+			return ret;
+		flag = bf_flag_cycle[chip->flag_cnt];
+		chip->flag_cnt = (chip->flag_cnt + 1) & 3;
+		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT,
+				      chip->dim_saved[0],
+				      (BF_REG_MASTER_16 + 2 * 1) | flag);
+		if (ret < 0)
+			return ret;
+		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT,
+				      chip->dim_saved[1],
+				      (BF_REG_MASTER_16 + 2 * 1 + 1) | flag);
+		if (ret < 0)
+			return ret;
+		ret = bf_vendor_write(chip, BF_REQ_PREAMP, 0x0000, 0x2000);
+		if (ret < 0)
+			return ret;
+	}
+	chip->dim = on;
+	return 0;
+}
+
+static int bf_dim_put(struct snd_kcontrol *kctl,
+		      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+	bool on = ucontrol->value.integer.value[0];
+	int ret = 0;
+
+	mutex_lock(&chip->mutex);
+	if (on == chip->dim)
+		goto out;
+	ret = bf_dim_apply(chip, on);
+	if (ret == 0)
+		ret = 1;
+out:
+	mutex_unlock(&chip->mutex);
+	return ret;
+}
+
+/* DIM press on the front panel.  The device has no DSP of its own for
+ * this, so the host does it, exactly as it already does for the SET
+ * button's phantom toggle.
+ */
+void bf_panel_toggle_dim(struct snd_usb_babyface *chip)
+{
+	bool on;
+	int ret;
+
+	mutex_lock(&chip->mutex);
+	on = !chip->dim;
+	ret = bf_dim_apply(chip, on);
+	mutex_unlock(&chip->mutex);
+
+	if (ret == 0 && chip->dim_kctl)
+		snd_ctl_notify(chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
+			       &chip->dim_kctl->id);
+}
+
+static int bf_width_info(struct snd_kcontrol *kctl,
+			 struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = -100;
+	uinfo->value.integer.max = 100;
+	uinfo->value.integer.step = 1;
+	return 0;
+}
+
+static int bf_width_get(struct snd_kcontrol *kctl,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+
+	ucontrol->value.integer.value[0] = chip->width;
+	return 0;
+}
+
+static int bf_width_put(struct snd_kcontrol *kctl,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+	int w = ucontrol->value.integer.value[0];
+	u16 l, r;
+	int ret = 0;
+
+	if (w < -100 || w > 100)
+		return -EINVAL;
+
+	mutex_lock(&chip->mutex);
+	if (w == chip->width)
+		goto out;
+	/* Width spread: L = 0x1000*(1+w), R = 0x1000*(1-w), L+R = 0x2000.
+	 * TotalMix writes the strip's src pair on BOTH maps (cap_width3-7,
+	 * PROTOCOL.md "Width strip mapping"): the low map (0x0000+src L /
+	 * 0x001A+src R) and the std block-0 map (0x0034+src L /
+	 * 0x004E+src R) - the stereo pair spreads L/R in opposition, the
+	 * mirror src (AN2) gets the swapped values.
+	 */
+	l = (u16)(((0x2000 * (100 + w) / 2) + 50) / 100);
+	r = 0x2000 - l;
+	/* Low map: AN1 L=0x0000, R=0x001A; AN2 L=0x0001, R=0x001B. */
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, l, 0x0000);
+	if (ret < 0)
+		goto out;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, r, 0x001a);
+	if (ret < 0)
+		goto out;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, r, 0x0001);
+	if (ret < 0)
+		goto out;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, l, 0x001b);
+	if (ret < 0)
+		goto out;
+	/* Std block-0 map (item 0b, the missing half): AN1 L=0x0034,
+	 * R=0x004E; AN2 L=0x0035, R=0x004F.  (The playback strips PB2-6
+	 * target block n-2 - 0x00AE family - reserved for the per-strip
+	 * controls.)
+	 */
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, l, 0x0034);
+	if (ret < 0)
+		goto out;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, r, 0x004e);
+	if (ret < 0)
+		goto out;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, r, 0x0035);
+	if (ret < 0)
+		goto out;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, l, 0x004f);
+	if (ret < 0)
+		goto out;
+	chip->width = w;
+	ret = 1;
+out:
+	mutex_unlock(&chip->mutex);
+	return ret;
+}
+
+static int bf_fx_send_info(struct snd_kcontrol *kctl,
+			   struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 0x1000;
+	uinfo->value.integer.step = 1;
+	return 0;
+}
+
+static int bf_fx_send_get(struct snd_kcontrol *kctl,
+			  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+
+	ucontrol->value.integer.value[0] = chip->fx_send;
+	return 0;
+}
+
+static int bf_fx_send_put(struct snd_kcontrol *kctl,
+			  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+	u16 v = ucontrol->value.integer.value[0];
+	int ret = 0;
+
+	if (v > 0x1000)
+		return -EINVAL;
+
+	mutex_lock(&chip->mutex);
+	if (v == chip->fx_send)
+		goto out;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, v, 0x0138);
+	if (ret < 0)
+		goto out;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, v, 0x0153);
+	if (ret < 0)
+		goto out;
+	chip->fx_send = v;
+	ret = 1;
+out:
+	mutex_unlock(&chip->mutex);
+	return ret;
+}
+
+/* Routing flags + varispeed pitch: registered together since the
+ * source function that created them (pre-split) registered all of
+ * them in one pass.
+ */
+int babyface_create_flags(struct snd_usb_babyface *chip)
+{
+	struct snd_kcontrol *kctl;
+	int i, err;
+
+	kctl = snd_ctl_new1(&(struct snd_kcontrol_new){
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "Varispeed Pitch",
+		.info = bf_pitch_info,
+		.get = bf_pitch_get,
+		.put = bf_pitch_put,
+	}, chip);
+	err = snd_ctl_add(chip->card, kctl);
+	if (err < 0)
+		return err;
+
+	for (i = 0; i < 6; i++) {
+		kctl = snd_ctl_new1(&(struct snd_kcontrol_new){
+			.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+			.name = "Loopback Switch",
+			.index = i,
+			.info = bf_mute_info,
+			.get = bf_loopback_get,
+			.put = bf_loopback_put,
+			.private_value = i,
+		}, chip);
+		err = snd_ctl_add(chip->card, kctl);
+		if (err < 0)
+			return err;
+	}
+
+	kctl = snd_ctl_new1(&(struct snd_kcontrol_new){
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "AN 1>2 Switch",
+		.info = bf_switch_info,
+		.get = bf_an12_get,
+		.put = bf_an12_put,
+	}, chip);
+	err = snd_ctl_add(chip->card, kctl);
+	if (err < 0)
+		return err;
+
+	kctl = snd_ctl_new1(&(struct snd_kcontrol_new){
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "Sample Clock Source",
+		.info = bf_clock_info,
+		.get = bf_clock_get,
+		.put = bf_clock_put,
+	}, chip);
+	err = snd_ctl_add(chip->card, kctl);
+	if (err < 0)
+		return err;
+
+	kctl = snd_ctl_new1(&(struct snd_kcontrol_new){
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "AN1/2 Link Switch",
+		.info = bf_switch_info,
+		.get = bf_link_get,
+		.put = bf_link_put,
+	}, chip);
+	err = snd_ctl_add(chip->card, kctl);
+	if (err < 0)
+		return err;
+
+	kctl = snd_ctl_new1(&(struct snd_kcontrol_new){
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "MS Processor Switch",
+		.info = bf_switch_info,
+		.get = bf_ms_get,
+		.put = bf_ms_put,
+	}, chip);
+	err = snd_ctl_add(chip->card, kctl);
+	if (err < 0)
+		return err;
+
+	kctl = snd_ctl_new1(&(struct snd_kcontrol_new){
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "Dim Switch",
+		.info = bf_switch_info,
+		.get = bf_dim_get,
+		.put = bf_dim_put,
+	}, chip);
+	chip->dim_kctl = kctl;
+	err = snd_ctl_add(chip->card, kctl);
+	if (err < 0)
+		return err;
+
+	kctl = snd_ctl_new1(&(struct snd_kcontrol_new){
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "Width",
+		.info = bf_width_info,
+		.get = bf_width_get,
+		.put = bf_width_put,
+	}, chip);
+	err = snd_ctl_add(chip->card, kctl);
+	if (err < 0)
+		return err;
+
+	kctl = snd_ctl_new1(&(struct snd_kcontrol_new){
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "FX Send Volume",
+		.info = bf_fx_send_info,
+		.get = bf_fx_send_get,
+		.put = bf_fx_send_put,
+	}, chip);
+	err = snd_ctl_add(chip->card, kctl);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
diff --git a/sound/usb/babyfacepro/babyfacepro.c b/sound/usb/babyfacepro/babyfacepro.c
index 3a564f853..c15fca214 100644
--- a/sound/usb/babyfacepro/babyfacepro.c
+++ b/sound/usb/babyfacepro/babyfacepro.c
@@ -103,17 +103,23 @@ int bf_vendor_read(struct snd_usb_babyface *chip, u8 req, u16 idx, u8 *buf)
 				    0, idx, buf, 4, BF_CTL_TIMEOUT, GFP_KERNEL);
 }
 
-/* Sends the BF_REG_KEEPALIVE_SETTINGS word (PROTOCOL.md: "keepalive
- * 0x10 0x05CF wVal = host settings-state register" - a single shared
- * word, not independent per-setting writes).  Hardcoded to Internal
- * clock for now; the clock-source control and the chip->clock_optical
- * bit it composes in land with a later patch in this series, at which
- * point this grows the same way babyface_restore_state() does further
- * down the series.
+/* Composes and sends the BF_REG_KEEPALIVE_SETTINGS word from every
+ * currently-tracked flag together (PROTOCOL.md: "keepalive 0x10 0x05CF
+ * wVal = host settings-state register" - a single shared word, not
+ * independent per-setting writes).  Only clock source is tracked so
+ * far; the single call site this replaces (which used to hardcode
+ * 0x0001, i.e. "always Internal") is why this exists as its own
+ * function rather than an inline write at each call site - the next
+ * flag added to this word (EQ for Record / Optical-Out SPDIF, this
+ * driver's own upstream follow-up list) just OR's in here too, instead
+ * of every caller needing to remember every other bit.
  */
 int bf_settings_write(struct snd_usb_babyface *chip)
 {
-	return bf_vendor_write(chip, BF_REQ_KEEPALIVE, BF_SETTINGS_CLOCK_INTERNAL,
+	u16 w = chip->clock_optical ? BF_SETTINGS_CLOCK_OPTICAL :
+				       BF_SETTINGS_CLOCK_INTERNAL;
+
+	return bf_vendor_write(chip, BF_REQ_KEEPALIVE, w,
 			       BF_REG_KEEPALIVE_SETTINGS);
 }
 
@@ -231,7 +237,9 @@ int bf_cold_init(struct snd_usb_babyface *chip)
 	if (!r)
 		return -EINVAL;
 	ret = bf_vendor_write(chip, BF_REQ_KEEPALIVE,
-			      (bf_rate_family(r) << 4) | BF_SETTINGS_CLOCK_INTERNAL,
+			      (bf_rate_family(r) << 4) |
+			      (chip->clock_optical ? BF_SETTINGS_CLOCK_OPTICAL :
+						     BF_SETTINGS_CLOCK_INTERNAL),
 			      BF_REG_KEEPALIVE_INIT);
 	if (ret < 0)
 		return ret;
@@ -327,6 +335,157 @@ int babyface_restore_state(struct snd_usb_babyface *chip)
 	return bf_pitch_write(chip, chip->pitch);
 }
 
+/* Re-apply the non-master flags (loopback / AN1>2 / link / width /
+ * FX send / MS) after a state restore.  The write patterns mirror the
+ * corresponding _put() handlers.  Caller holds chip->mutex.
+ */
+int bf_state_apply_flags(struct snd_usb_babyface *chip)
+{
+	int out, ret, on_out = -1;
+	u16 l, r;
+
+	/* Loopback: the full 30-channel map from the cached state (the
+	 * single-active invariant keeps at most one pair at 0x0001).
+	 */
+	for (out = 0; out < 6; out++) {
+		if (chip->loopback[out]) {
+			on_out = out;
+			break;
+		}
+	}
+	ret = bf_loopback_write_map(chip, on_out, on_out >= 0);
+	if (ret < 0)
+		return ret;
+
+	ret = bf_vendor_write(chip, BF_REQ_PREAMP,
+			      (chip->linked ? 0x0400 : 0x0000) |
+			      (chip->an12 ? 0x1000 : 0x0000), 0x1000);
+	if (ret < 0)
+		return ret;
+	ret = bf_vendor_write(chip, BF_REQ_PREAMP_COMMIT, 0x0000, 0x0000);
+	if (ret < 0)
+		return ret;
+
+	l = (u16)(((0x2000 * (100 + chip->width) / 2) + 50) / 100);
+	r = 0x2000 - l;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, l, 0x0000);
+	if (ret < 0)
+		return ret;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, r, 0x001a);
+	if (ret < 0)
+		return ret;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, r, 0x0001);
+	if (ret < 0)
+		return ret;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, l, 0x001b);
+	if (ret < 0)
+		return ret;
+
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, chip->fx_send, 0x0138);
+	if (ret < 0)
+		return ret;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, chip->fx_send, 0x0153);
+	if (ret < 0)
+		return ret;
+
+	if (chip->ms_proc) {
+		/* Same ON pattern as bf_ms_put (cap_ms2.pcap): mute the AN2
+		 * (side) crosspoints, both maps.
+		 */
+		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, 0x0000, 0x0035);
+		if (ret < 0)
+			return ret;
+		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, 0x0000, 0x004f);
+		if (ret < 0)
+			return ret;
+		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, 0x0000, 0x0001);
+		if (ret < 0)
+			return ret;
+		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, 0x0000, 0x001b);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* Re-apply an engaged DIM (the fixed -20 dB Phones pair + flag). */
+	if (chip->dim) {
+		ret = bf_vendor_write(chip, BF_REQ_GAIN, 0xcb,
+				      BF_REG_MASTER_8 + 2 * 1);
+		if (ret < 0)
+			return ret;
+		ret = bf_vendor_write(chip, BF_REQ_GAIN, 0xcb,
+				      BF_REG_MASTER_8 + 2 * 1 + 1);
+		if (ret < 0)
+			return ret;
+		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, 0x0333,
+				      (BF_REG_MASTER_16 + 2 * 1) |
+				      bf_flag_cycle[chip->flag_cnt]);
+		if (ret < 0)
+			return ret;
+		chip->flag_cnt = (chip->flag_cnt + 1) & 3;
+		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, 0x0333,
+				      (BF_REG_MASTER_16 + 2 * 1 + 1) |
+				      bf_flag_cycle[chip->flag_cnt]);
+		if (ret < 0)
+			return ret;
+		chip->flag_cnt = (chip->flag_cnt + 1) & 3;
+		ret = bf_vendor_write(chip, BF_REQ_PREAMP, 0x2000, 0x2000);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* Re-apply any engaged Phase invert - the crosspoint restore loop
+	 * above already re-wrote xpoint[][] as PLAIN values, so a phase
+	 * negation needs to be re-asserted on top, the same way the ON
+	 * state itself is applied (bf_phase_apply).
+	 */
+	{
+		int mic;
+
+		for (mic = 0; mic < 4; mic++) {
+			if (!chip->phase[mic])
+				continue;
+			ret = bf_phase_apply(chip, mic, true);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	/* Re-apply any engaged stereo split (fixed constants, no fader
+	 * dependency - see bf_split_apply's own comment).
+	 */
+	{
+		int pb;
+
+		for (pb = 0; pb < 6; pb++) {
+			if (!chip->split[pb])
+				continue;
+			ret = bf_split_apply(chip, pb, true);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	/* Re-apply any non-zero Trim (fader+trim combined, same reasoning
+	 * as phase - see bf_trim_apply's own comment). Only the pair's
+	 * even index needs to fire this (it always writes both channels),
+	 * and bf_trim_put keeps both entries of a pair equal, so the even
+	 * index holds the value that is really on the wire even when the
+	 * odd channel's control was the one the user touched.
+	 */
+	{
+		int mic;
+
+		for (mic = 0; mic < 4; mic += 2) {
+			if (!chip->trim[mic])
+				continue;
+			ret = bf_trim_apply(chip, mic, chip->trim[mic] * 2);
+			if (ret < 0)
+				return ret;
+		}
+	}
+	return 0;
+}
+
 void bf_state_save(struct snd_usb_babyface *chip)
 {
 	struct bf_saved *s;
@@ -361,6 +520,15 @@ void bf_state_save(struct snd_usb_babyface *chip)
 	memcpy(s->trim, chip->trim, sizeof(s->trim));
 	memcpy(s->split, chip->split, sizeof(s->split));
 	s->ref_level = chip->ref_level;
+	s->pitch = chip->pitch;
+	memcpy(s->loopback, chip->loopback, sizeof(s->loopback));
+	s->an12 = chip->an12;
+	s->linked = chip->linked;
+	s->ms_proc = chip->ms_proc;
+	s->clock_optical = chip->clock_optical;
+	s->width = chip->width;
+	s->fx_send = chip->fx_send;
+	s->dim = chip->dim;
 	mutex_unlock(&bf_saved_mutex);
 }
 
@@ -389,6 +557,15 @@ int bf_state_restore(struct snd_usb_babyface *chip)
 		memcpy(chip->trim, s->trim, sizeof(chip->trim));
 		memcpy(chip->split, s->split, sizeof(chip->split));
 		chip->ref_level = s->ref_level;
+		chip->pitch = s->pitch;
+		memcpy(chip->loopback, s->loopback, sizeof(chip->loopback));
+		chip->an12 = s->an12;
+		chip->linked = s->linked;
+		chip->ms_proc = s->ms_proc;
+		chip->clock_optical = s->clock_optical;
+		chip->width = s->width;
+		chip->fx_send = s->fx_send;
+		chip->dim = s->dim;
 		ret = 1;
 		break;
 	}
@@ -398,6 +575,8 @@ int bf_state_restore(struct snd_usb_babyface *chip)
 
 	mutex_lock(&chip->mutex);
 	ret = babyface_restore_state(chip);
+	if (ret == 0)
+		ret = bf_state_apply_flags(chip);
 	mutex_unlock(&chip->mutex);
 	return ret ? ret : 1;
 }
@@ -810,6 +989,13 @@ void babyface_stream_work(struct work_struct *work)
 		if (ret < 0)
 			goto err;
 
+		/* The 0x16 clear also wipes the flag registers (loopback,
+		 * AN1>2, stereo link, width, FX send, MS) - re-apply them.
+		 */
+		ret = bf_state_apply_flags(chip);
+		if (ret < 0)
+			goto err;
+
 		chip->streaming = true;
 		dev_dbg(&chip->dev->dev, "stream started (%u frames/URB, %u URBs)\n",
 			chip->frames_per_urb, chip->nurbs);
@@ -1332,6 +1518,12 @@ static int babyface_probe(struct usb_interface *intf,
 		goto error;
 	}
 
+	err = babyface_create_flags(chip);
+	if (err < 0) {
+		dev_err(&intf->dev, "flag control creation failed: %d\n", err);
+		goto error;
+	}
+
 	err = snd_card_register(chip->card);
 	if (err < 0) {
 		dev_err(&intf->dev, "snd_card_register failed: %d\n", err);
diff --git a/sound/usb/babyfacepro/babyfacepro.h b/sound/usb/babyfacepro/babyfacepro.h
index 505ec1927..9822db312 100644
--- a/sound/usb/babyfacepro/babyfacepro.h
+++ b/sound/usb/babyfacepro/babyfacepro.h
@@ -107,9 +107,13 @@
 
 /* Host settings-state word carried by the BF_REG_KEEPALIVE_SETTINGS
  * keepalive (PROTOCOL.md "keepalive 0x10 0x05CF wVal = host settings-
- * state register", hardware-verified 2026-08-22/23).  Only the
- * Internal value is used until the clock-source control lands with a
- * later patch in this series.
+ * state register", hardware-verified 2026-08-22/23): clock source is
+ * NOT a register write at all, only this flag word changes.  Bit 2 =
+ * clock Optical (bit clear = Internal, the default); bits 6/10 (EQ for
+ * Record / Optical-Out SPDIF) are next in the driver's own upstream
+ * follow-up list, not wired to a control yet - the composer below only
+ * OR's in the clock bit today, structured so those can be added the
+ * same way later without another flag-stomping rewrite.
  */
 #define BF_SETTINGS_CLOCK_INTERNAL	0x0001
 #define BF_SETTINGS_CLOCK_OPTICAL	0x0004
@@ -169,6 +173,15 @@
 #define BF_REG_LOWMAP_BASE_L		0x0000	/* + idx_l */
 #define BF_REG_LOWMAP_BASE_R		0x001a	/* + idx_r */
 
+#define BF_REQ_LOOPBACK			0x15	/* per-output-channel flag */
+
+/* Loopback map width (captured 2026-08-25, cap_loopback2.pcap):
+ * TotalMix writes the FULL 30-channel 0x15 map on every toggle (ON =
+ * the pair at 0x0001 + the other 28 at 0x0000; OFF = all 0x0000).
+ * wIdx = 2xout_index: AN1/2 = 0/1, PH3/4 = 2/3, AS1/2 = 4/5, ...
+ */
+#define BF_LOOPBACK_CHANNELS		30
+
 /* The "cross" register block within each output: the L-registers sit at
  * odd offsets 5..23 and the R-registers at even offsets 4..22 (the stereo
  * source pairs that can be cross-linked).  bf_crosspoint_clear_cross()
@@ -286,6 +299,16 @@ struct snd_usb_babyface {
 					 * (0 = +4dBu, the default)
 					 */
 	struct snd_kcontrol *trim_kctl[4]; /* for snd_ctl_notify */
+	bool loopback[6];
+	bool an12;			/* AN 1>2 copy */
+	bool linked;			/* AN1/2 input link */
+	bool ms_proc;			/* MS processor engaged */
+	bool clock_optical;		/* clock source: false = Internal (default) */
+	int width;			/* width knob -100..+100 */
+	u16 fx_send;			/* FX send level 0..0x1000 */
+	u16 dim_saved[2];		/* pre-DIM Phones master (out 1 L/R) */
+	bool dim;			/* DIM engaged (fixed -20 dB on Phones) */
+	struct snd_kcontrol *dim_kctl;      /* for snd_ctl_notify */
 };
 
 /* The mixer state cached across interface re-probes/resume (see
@@ -306,6 +329,15 @@ struct bf_saved {
 	int trim[4];
 	bool split[6];
 	int ref_level;
+	int pitch;
+	bool loopback[6];
+	bool an12;
+	bool linked;
+	bool ms_proc;
+	bool clock_optical;
+	int width;
+	u16 fx_send;
+	bool dim;
 };
 
 struct bf_rate {
@@ -337,6 +369,7 @@ void bf_state_save(struct snd_usb_babyface *chip);
 int bf_state_restore(struct snd_usb_babyface *chip);
 void bf_state_purge(void);
 int babyface_restore_state(struct snd_usb_babyface *chip);
+int bf_state_apply_flags(struct snd_usb_babyface *chip);
 
 /* -- babyfacepro-ctl.c ----------------------- */
 extern const u16 bf_flag_cycle[4];
@@ -358,6 +391,9 @@ int bf_trim_apply(struct snd_usb_babyface *chip, int mic, int trim_db2);
 int bf_gain_max_db(int mic);
 int bf_gain_db(int mic, u8 raw);
 u8 bf_gain_raw(int mic, int db);
+int bf_loopback_write_map(struct snd_usb_babyface *chip, int out, bool on);
+void bf_panel_toggle_dim(struct snd_usb_babyface *chip);
+int babyface_create_flags(struct snd_usb_babyface *chip);
 
 /* Master gain-law helpers - shared with the front-panel wheels once
  * the front panel lands.
-- 
2.55.0

