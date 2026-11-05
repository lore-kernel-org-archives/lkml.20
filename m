Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891809;
	b=RqfDD+2N9ETrOCmQotJAZPZRTYc/Y58SrUYrBwmrdUcVLEyVinRtfFUABwyoifFhxA/v
	 XyrVzdccT6sP45ToSPIDtftgbdVGlzY28RnD92thAPuxBksf66kxBezgeUM31a+k/ZkGg
	 erZFnqtAbab0/++UAuDZcb5jtU4fU+U4+SPi2K/rstQT6IJm9NUBAcQlsJ4h7zD5POKFL
	 tbAyN36NXhK/Vqnb1jdqUYFxd2IKGeu9rFH2I7oa+0kc1pghx+zhgOpaOn/oWOHzTB8KQ
	 2yViZqbtXHVjSWMmHxh+0tXlSuF55U/IHCky2da3bVR7E2Cs8dLo10/GjJxt22Ac1kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+xLP5sX+Az8NNDxUgGQSyeK7Lykrka0DGr+DHwN4gqw=;
	b=QiQd+Ip7qRjdJ1HhkH3JHJWc6lVj9nxDPYLT4m4sO0zGbslIAkVvNnrIpwIG/I3KCSsw
	 6YcCS/sX11o+AVlw+AZT8ELAPk1TApb8mlqo5QpNfuDAs6RSKOnjy3YzdOXs4kDbCjSAK
	 2Y9v79WE80jUbWM3TScMckMOmxLWvZgwsY+DH0cDpMz9GPV9e8PY3x5af4obaTF2rCuTj
	 IxqQ1gWsncOr5c6w7+QC0FLFXeTLTifQIenaIZ+E/ioPo6wQY6eAHsKaOCTkRxhjvVGey
	 tDtGLt7dh1/ZyCWbMeTOQTevYyjTnJkUmbb4BIVE6hOCFW2Rsea0KLsBAT1QSGLOGkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NrSgYROR;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ADA606EEA3
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8ADA606EEA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NrSgYROR
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36dbde64409so1720491eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793891807; x=1794496607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+xLP5sX+Az8NNDxUgGQSyeK7Lykrka0DGr+DHwN4gqw=;
        b=NrSgYRORYlrSjwPacx4qXzDRKf2zLlLrdLhC53KU8Fie8ysABdtaftAUE9h9FlsBOB
         B0ivrg2awwtAB1VdDjXxnopxzZ1i+52aXXIMbrtnC2cTqGVizHElu++2UhrLCHdPTH0D
         zaok7jZEpxyacZdWZ4qE++HlNJ+Mc8pUA5/MzqgDs552fgjAWIYXhMK0h6YAOcDqF7GF
         DSLNme6Xd+DF5mImL7Gyd4+FFmesKyuLKQQvjxtBx8j5mKYuAWs5Y+O1SrgahgLLZRNG
         vqNqDkRADcC2TOvtjCbflNhMmJ+7rfDe+NwDYgUKbnQj5xQBaZf9tNr5SkcYWo10CUfo
         bknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891807; x=1794496607;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xLP5sX+Az8NNDxUgGQSyeK7Lykrka0DGr+DHwN4gqw=;
        b=tu+CD/e4NRMlUpPmXYPnUvS1r98UtaHhf1yYzAmfiUAuqhBo5SCRhASMy8qKIa93cE
         EOSafyxN+x5KsPbLxJlYVp6oHay7oJehIIT/f66b977l7hlWiOJ+dNSEhnTIspVA9onu
         vCMC8xwanZ1SinOX5y24v385e9+DiQithQhwZ5uEc4ay/OhIjt9TEWJYioA9c3UD0E4A
         lmu2l3yQYb9W6oSn+Ef5ekL+ZaI+PbtM+7mCSefX1BGTstM+ROGwcDH0Je/azwp3Nl3M
         BWrAqdNh47OlNNiojapAJPfbhQRnY+hHv+Wr55/ZREE5OT9MjjBAhiCQNG+FzeYZl6pC
         QlPA==
X-Forwarded-Encrypted: i=1; AKwUvBzNL0m4rhE7MoJt/lzL+Y0mbVS7l4TQAHlBxi0Dj9bGZyT32AFXYnINb2hsTjaZapf8KhhL+eSG9X11jv0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fRVKywwkiee+cx32eJt6YAdkpztpk5MqHOgK3NpEzyA94gM27
	sTQl2b+YPgm4Z7Iyjlfi/Z3+OXiGPlJ3Uy08/iX94a07n8er1RkTsG0J
X-Gm-Gg: AYBFou2v9GgzVWO0DMFrYIxKyLvHPzYvj68tQufensL5y38mZ1gx1CbgeiQaL9I0Kav
	LidyiEJC30nPkrJMSM10geGtkVwE2Ij09zXugzzAqYSS09qA5x8rzq3d+XBoxQYiWrm5XOY1HmD
	OYtfbwFzWT4VaCClj6f+U27gUTN40aI9uq09wY38IWYSzvnG99ZO4Os1W0XLircF/fI2kEPu5/L
	LD76S9FNc2Bxug+6oowkxb8XHrDLXn/msk/2Cs8E8VBGqplts1GZnBrpzWJhjGHvuT6GsFB2yQT
	yreQWv/h70SZHtSRAJJE3uv175sKt+MnuxHfzcGRYXv9r3E9ku2JaJPldbWFlMyTc6fBf1YmfMB
	MA8cyP1RxF+BhzwNS4e2idlD3eyP9EjO3PSFoUa+x7kt6LJEmnN1EKev6OcEjOkkeaZIQEgNpQF
	h5hH5rci7Eb4XT5d3ZxC67KbFWTA5orNSQ2ia4Tkb33RKnRgSPJUJUiQ9SvL7FCldaB+azUPhcE
	W4+LUnYFJYJTAfUDot2W0E9tBI+dHNzcslzOl2vjAfJWCYXuiF0v/up5lQiyYemnsbuPb2PtGht
	YVMt8oiPIXQEwhDUCil5JeZgVq306nSrBIe+iPuFuunXC5w6lrXFKt5S9AI42w1XO9Y497rHafi
	UHG/eTOyBlKJZCveL+XQ4pRDOLfag4fpQBFWiyWr57YwesQ7E7A==
X-Received: by 2002:a05:693c:4153:20b0:358:8f02:e0ca with SMTP id 5a478bee46e88-36a4236903fmr29749397eec.9.1793891806383;
        Thu, 05 Nov 2026 07:16:46 -0800 (PST)
Received: from cachyos (2a01cb0c82caf900a186612f304bfea5.ipv6.abo.wanadoo.fr. [2a01:cb0c:82ca:f900:a186:612f:304b:fea5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6d3dsm21567087eec.7.2026.11.05.07.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:16:45 -0800 (PST)
From: =?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	=?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
Subject: [PATCH v8 4/8] ALSA: usb: babyfacepro: add routing flags and varispeed pitch
Date: Thu,  5 Nov 2026 16:15:49 +0100
Message-ID: <20261105151553.223722-5-i.bahloul01@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105151553.223722-1-i.bahloul01@gmail.com>
References: <20261105151553.223722-1-i.bahloul01@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add loopback, AN 1>2, the sample clock source, the AN1/2 input link,
the MS processor, DIM, width, FX send and the varispeed pitch.  The
clock source is not a register write: it is a bit of the host settings
word sent with the keepalive, so bf_settings_write() now composes that
word from the tracked state.  The optical output's format is a second
bit of that word: "Optical Out Format" switches the port between ADAT
(the default) and S/PDIF, and the bit follows every settings write.

bf_state_apply_flags() re-applies this state too, and probe also runs
it after writing the power-on default, since the cold init cleared the
flag registers.  A Phones master change made while DIM is engaged
moves the level DIM releases back to.

Signed-off-by: Ismaïl Bahloul <i.bahloul01@gmail.com>
---
 sound/usb/babyfacepro/babyfacepro-ctl.c | 823 ++++++++++++++++++++++--
 sound/usb/babyfacepro/babyfacepro.c     | 117 +++-
 sound/usb/babyfacepro/babyfacepro.h     |  35 +-
 3 files changed, 902 insertions(+), 73 deletions(-)

diff --git a/sound/usb/babyfacepro/babyfacepro-ctl.c b/sound/usb/babyfacepro/babyfacepro-ctl.c
index fe6266ea1..5482b6f09 100644
--- a/sound/usb/babyfacepro/babyfacepro-ctl.c
+++ b/sound/usb/babyfacepro/babyfacepro-ctl.c
@@ -10,8 +10,10 @@
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
@@ -252,7 +254,9 @@ int babyface_write_default_mixer(struct snd_usb_babyface *chip)
 			chip->xpoint[out][src][1] = level;
 		}
 
-	/* Host settings word (clock source Internal). */
+	/* Host settings word - composed from tracked state (clock defaults
+	 * to Internal, chip->clock_optical is zero-initialized).
+	 */
 	return bf_settings_write(chip);
 }
 
@@ -325,6 +329,33 @@ static int bf_master_get(struct snd_kcontrol *kctl,
 	return 0;
 }
 
+/* The master step to put on the wire.  The cache keeps the real
+ * volume: mute wins, and DIM is the fixed -20 dB step on the Phones
+ * pair, so every writer derives the wire value the same way.
+ */
+/* The two master registers to put on the wire.  The cache keeps the
+ * real volume: mute wins, and DIM is the exact -20 dB pair the
+ * hardware's own button writes (0xcb / 0x0333, cap_dim2.pcap), not the
+ * master curve's value at that step.
+ */
+static u8 bf_out_reg8(bool muted, bool dim, u16 step)
+{
+	if (muted)
+		return BF_MASTER_MUTE;
+	if (dim)
+		return BF_MASTER_MINUS20_8;
+	return bf_master_reg8(step);
+}
+
+static u16 bf_out_reg16(bool muted, bool dim, u16 step)
+{
+	if (muted)
+		return 0;
+	if (dim)
+		return BF_MASTER_MINUS20_16;
+	return bf_master_reg16(step);
+}
+
 static int bf_master_put(struct snd_kcontrol *kctl,
 			 struct snd_ctl_elem_value *ucontrol)
 {
@@ -332,7 +363,8 @@ static int bf_master_put(struct snd_kcontrol *kctl,
 	int out = bf_master_out[kctl->private_value];
 	long nl = ucontrol->value.integer.value[0];
 	long nr = ucontrol->value.integer.value[1];
-	u16 l, r, wire_l, wire_r, flag;
+	bool muted, dim;
+	u16 l, r, flag;
 	int ret = 0;
 
 	/* Reject anything outside the declared range, so the registers and
@@ -350,33 +382,40 @@ static int bf_master_put(struct snd_kcontrol *kctl,
 	if (l == chip->master[out][0] && r == chip->master[out][1])
 		return 0;
 
-	wire_l = chip->muted[out] ? 0 : l;
-	wire_r = chip->muted[out] ? 0 : r;
+	muted = chip->muted[out];
+	dim = out == 1 && chip->dim;
 	flag = bf_flag_cycle[chip->flag_cnt];
 	chip->flag_cnt = (chip->flag_cnt + 1) & 3;
 
 	/* Both registers, as TotalMix writes them: the 8-bit is the analog
 	 * level, the 16-bit the digital one.
 	 */
-	ret = bf_vendor_write(chip, BF_REQ_GAIN, bf_master_reg8(wire_l),
+	ret = bf_vendor_write(chip, BF_REQ_GAIN, bf_out_reg8(muted, dim, l),
 			      BF_REG_MASTER_8 + 2 * out);
 	if (ret < 0)
 		return ret;
-	ret = bf_vendor_write(chip, BF_REQ_GAIN, bf_master_reg8(wire_r),
+	ret = bf_vendor_write(chip, BF_REQ_GAIN, bf_out_reg8(muted, dim, r),
 			      BF_REG_MASTER_8 + 2 * out + 1);
 	if (ret < 0)
 		return ret;
-	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, bf_master_reg16(wire_l),
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT,
+			      bf_out_reg16(muted, dim, l),
 			      (BF_REG_MASTER_16 + 2 * out) | flag);
 	if (ret < 0)
 		return ret;
-	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, bf_master_reg16(wire_r),
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT,
+			      bf_out_reg16(muted, dim, r),
 			      (BF_REG_MASTER_16 + 2 * out + 1) | flag);
 	if (ret < 0)
 		return ret;
 
 	chip->master[out][0] = l;
 	chip->master[out][1] = r;
+	/* A Phones change while DIM is engaged re-bases the restore point. */
+	if (chip->dim && out == 1) {
+		chip->dim_saved[0] = l;
+		chip->dim_saved[1] = r;
+	}
 	return 1;
 }
 
@@ -411,6 +450,7 @@ static int bf_mute_put(struct snd_kcontrol *kctl,
 	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
 	int out = bf_master_out[kctl->private_value];
 	bool muted = !ucontrol->value.integer.value[0];
+	bool dim;
 	u16 flag;
 	int ret = 0;
 
@@ -418,51 +458,33 @@ static int bf_mute_put(struct snd_kcontrol *kctl,
 	if (muted == chip->muted[out])
 		return 0;
 
+	dim = out == 1 && chip->dim;
 	flag = bf_flag_cycle[chip->flag_cnt];
 	chip->flag_cnt = (chip->flag_cnt + 1) & 3;
 
-	if (muted) {
-		ret = bf_vendor_write(chip, BF_REQ_GAIN, BF_MASTER_MUTE,
-				      BF_REG_MASTER_8 + 2 * out);
-		if (ret < 0)
-			return ret;
-		ret = bf_vendor_write(chip, BF_REQ_GAIN, BF_MASTER_MUTE,
-				      BF_REG_MASTER_8 + 2 * out + 1);
-		if (ret < 0)
-			return ret;
-		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, 0x0000,
-				      (BF_REG_MASTER_16 + 2 * out) | flag);
-		if (ret < 0)
-			return ret;
-		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, 0x0000,
-				      (BF_REG_MASTER_16 + 2 * out + 1) | flag);
-		if (ret < 0)
-			return ret;
-	} else {
-		/* Unmute restores the cached volume (TotalMix keeps the
-		 * pre-mute fader value host-side), 8-bit + 16-bit.
-		 */
-		ret = bf_vendor_write(chip, BF_REQ_GAIN,
-				      bf_master_reg8(chip->master[out][0]),
-				      BF_REG_MASTER_8 + 2 * out);
-		if (ret < 0)
-			return ret;
-		ret = bf_vendor_write(chip, BF_REQ_GAIN,
-				      bf_master_reg8(chip->master[out][1]),
-				      BF_REG_MASTER_8 + 2 * out + 1);
-		if (ret < 0)
-			return ret;
-		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT,
-				      bf_master_reg16(chip->master[out][0]),
-				      (BF_REG_MASTER_16 + 2 * out) | flag);
-		if (ret < 0)
-			return ret;
-		ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT,
-				      bf_master_reg16(chip->master[out][1]),
-				      (BF_REG_MASTER_16 + 2 * out + 1) | flag);
-		if (ret < 0)
-			return ret;
-	}
+	/* TotalMix keeps the pre-mute fader value host-side, so unmute
+	 * restores it; mute is the 8-bit mute code and a zero 16-bit.
+	 */
+	ret = bf_vendor_write(chip, BF_REQ_GAIN,
+			      bf_out_reg8(muted, dim, chip->master[out][0]),
+			      BF_REG_MASTER_8 + 2 * out);
+	if (ret < 0)
+		return ret;
+	ret = bf_vendor_write(chip, BF_REQ_GAIN,
+			      bf_out_reg8(muted, dim, chip->master[out][1]),
+			      BF_REG_MASTER_8 + 2 * out + 1);
+	if (ret < 0)
+		return ret;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT,
+			      bf_out_reg16(muted, dim, chip->master[out][0]),
+			      (BF_REG_MASTER_16 + 2 * out) | flag);
+	if (ret < 0)
+		return ret;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT,
+			      bf_out_reg16(muted, dim, chip->master[out][1]),
+			      (BF_REG_MASTER_16 + 2 * out + 1) | flag);
+	if (ret < 0)
+		return ret;
 	chip->muted[out] = muted;
 	return 1;
 }
@@ -655,6 +677,20 @@ int babyface_create_masters(struct snd_usb_babyface *chip)
 	return 0;
 }
 
+/* Boost's 0x21 commit value (0x0003) is NOT a persisted register bit -
+ * PROTOCOL.md's "Ref level" section found it only in the one-shot 0x21
+ * value alongside the 0x17 state write, so it has to be re-sent
+ * alongside EVERY preamp write (phantom/PAD toggles, AN 1>2, link and
+ * the state replay included), or Boost would silently degrade to plain
+ * -10dBV the next time anything else touches this shared byte.
+ */
+int bf_preamp_commit(struct snd_usb_babyface *chip)
+{
+	return bf_vendor_write(chip, BF_REQ_PREAMP_COMMIT,
+			       chip->ref_level == BF_REF_LEVEL_BOOST ?
+			       0x0003 : 0x0000, 0x0000);
+}
+
 int bf_preamp_state_write(struct snd_usb_babyface *chip)
 {
 	int ret;
@@ -662,16 +698,7 @@ int bf_preamp_state_write(struct snd_usb_babyface *chip)
 	ret = bf_vendor_write(chip, BF_REQ_PREAMP, chip->preamp, BF_REG_PREAMP);
 	if (ret < 0)
 		return ret;
-	/* Boost's 0x21 commit value (0x0003) is NOT a persisted register
-	 * bit - PROTOCOL.md's "Ref level" section found it only in the
-	 * one-shot 0x21 value alongside the 0x17 state write, so it has
-	 * to be re-sent alongside EVERY preamp write (phantom/PAD toggles
-	 * included), or Boost would silently degrade to plain -10dBV the
-	 * next time anything else touches this shared byte.
-	 */
-	return bf_vendor_write(chip, BF_REQ_PREAMP_COMMIT,
-			       chip->ref_level == BF_REF_LEVEL_BOOST ?
-			       0x0003 : 0x0000, 0x0000);
+	return bf_preamp_commit(chip);
 }
 
 /* Phase (polarity) invert (AN1-4 only, PROTOCOL.md "Phase toggle",
@@ -1278,3 +1305,679 @@ int babyface_create_preamp(struct snd_usb_babyface *chip)
 	}
 	return 0;
 }
+
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
+	long np = ucontrol->value.integer.value[0];
+	int p, ret = 0;
+
+	if (np < -50 || np > 50)
+		return -EINVAL;
+	p = np;
+
+	guard(mutex)(&chip->mutex);
+	if (p == chip->pitch)
+		return ret;
+
+	/* The DDS quad is a ratio on top of the family rate, the same at
+	 * every sample rate; bf_pitch_write() sends it with the settings
+	 * keepalive that commits it.
+	 */
+	ret = bf_pitch_write(chip, p);
+	if (ret < 0)
+		return ret;
+	chip->pitch = p;
+	return 1;
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
+	int prev = -1, notify = -1;
+	int i, ret = 0;
+
+	scoped_guard(mutex, &chip->mutex) {
+		if (on == chip->loopback[out])
+			return 0;
+		for (i = 0; i < 6; i++)
+			if (chip->loopback[i])
+				prev = i;
+		ret = bf_loopback_write_map(chip, out, on);
+		if (ret < 0)
+			return ret;
+		/* Single-active model (TotalMix writes one pair at 0x0001,
+		 * the rest 0x0000): toggling one output clears the others.
+		 * The cleared one did not get its own put(), so tell user
+		 * space.
+		 */
+		memset(chip->loopback, 0, sizeof(chip->loopback));
+		chip->loopback[out] = on;
+		if (on && prev >= 0 && prev != out)
+			notify = prev;
+		ret = 1;
+	}
+	if (notify >= 0 && chip->loopback_kctl[notify])
+		snd_ctl_notify(chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
+			       &chip->loopback_kctl[notify]->id);
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
+	guard(mutex)(&chip->mutex);
+	if (an12 == chip->an12)
+		return 0;
+	v = (chip->linked ? 0x0400 : 0x0000) | (an12 ? 0x1000 : 0x0000);
+	ret = bf_vendor_write(chip, BF_REQ_PREAMP, v, 0x1000);
+	if (ret < 0)
+		return ret;
+	ret = bf_preamp_commit(chip);
+	if (ret < 0)
+		return ret;
+	chip->an12 = an12;
+	return 1;
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
+	unsigned int item = ucontrol->value.enumerated.item[0];
+	bool optical;
+	int ret = 0;
+
+	if (item > 1)
+		return -EINVAL;
+	optical = item;
+
+	guard(mutex)(&chip->mutex);
+	if (optical == chip->clock_optical)
+		return 0;
+	chip->clock_optical = optical;
+	ret = bf_settings_write(chip);
+	if (ret < 0) {
+		chip->clock_optical = !optical;
+		return ret;
+	}
+	return 1;
+}
+
+/* Optical Out format: bit 10 of the same BF_REG_KEEPALIVE_SETTINGS
+ * word (PROTOCOL.md, LINUX-VALIDATION.md section 7).  The single optical
+ * port carries ADAT by default; S/PDIF mode uses only AS1/2.  Like the
+ * clock source, this is not a register write of its own.
+ */
+static const char *const bf_optical_texts[] = {
+	"ADAT", "S/PDIF", NULL
+};
+
+static int bf_optical_info(struct snd_kcontrol *kctl,
+			   struct snd_ctl_elem_info *uinfo)
+{
+	return snd_ctl_enum_info(uinfo, 1, 2, bf_optical_texts);
+}
+
+static int bf_optical_get(struct snd_kcontrol *kctl,
+			  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+
+	ucontrol->value.enumerated.item[0] = chip->optical_spdif ? 1 : 0;
+	return 0;
+}
+
+static int bf_optical_put(struct snd_kcontrol *kctl,
+			  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+	unsigned int item = ucontrol->value.enumerated.item[0];
+	bool spdif;
+	int ret = 0;
+
+	if (item > 1)
+		return -EINVAL;
+	spdif = item;
+
+	guard(mutex)(&chip->mutex);
+	if (spdif == chip->optical_spdif)
+		return 0;
+	chip->optical_spdif = spdif;
+	ret = bf_settings_write(chip);
+	if (ret < 0) {
+		chip->optical_spdif = !spdif;
+		return ret;
+	}
+	return 1;
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
+	guard(mutex)(&chip->mutex);
+	if (linked == chip->linked)
+		return 0;
+	v = (linked ? 0x0400 : 0x0000) | (chip->an12 ? 0x1000 : 0x0000);
+	ret = bf_vendor_write(chip, BF_REQ_PREAMP, v, 0x1000);
+	if (ret < 0)
+		return ret;
+	ret = bf_preamp_commit(chip);
+	if (ret < 0)
+		return ret;
+	chip->linked = linked;
+	return 1;
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
+ * the four AN2 (side) crosspoints, AN1/2 0x0001/0x001B and PH3/4
+ * 0x0035/0x004F - the side path is muted (ear-verified 2026-08-26
+ * with the mic on AN2: MS ON = silence); release restores each
+ * block's cached fader values (host-side, like TotalMix).
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
+	guard(mutex)(&chip->mutex);
+	if (on == chip->ms_proc)
+		return 0;
+	if (on) {
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
+	} else {
+		/* Restore each block's own AN2 crosspoint: 0x0001/0x001B
+		 * is the AN1/2 pair, 0x0035/0x004F is PH3/4.
+		 */
+		ret = bf_xpoint_write(chip, 0, 1,
+				      chip->xpoint[0][1][0],
+				      chip->xpoint[0][1][1]);
+		if (ret < 0)
+			return ret;
+		ret = bf_xpoint_write(chip, 1, 1,
+				      chip->xpoint[1][1][0],
+				      chip->xpoint[1][1][1]);
+		if (ret < 0)
+			return ret;
+	}
+	chip->ms_proc = on;
+	return 1;
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
+/* Apply DIM on the wire.  chip->mutex must be held by the caller, the
+ * "Dim Switch" put.
+ */
+int bf_dim_apply(struct snd_usb_babyface *chip, bool on)
+{
+	bool old = chip->dim;
+	bool muted = chip->muted[1];
+	u16 step_l, step_r, flag;
+	int ret;
+
+	lockdep_assert_held(&chip->mutex);
+	if (on) {
+		chip->dim_saved[0] = chip->master[1][0];
+		chip->dim_saved[1] = chip->master[1][1];
+	}
+	chip->dim = on;
+	step_l = on ? chip->master[1][0] : chip->dim_saved[0];
+	step_r = on ? chip->master[1][1] : chip->dim_saved[1];
+	flag = bf_flag_cycle[chip->flag_cnt];
+	chip->flag_cnt = (chip->flag_cnt + 1) & 3;
+	ret = bf_vendor_write(chip, BF_REQ_GAIN,
+			      bf_out_reg8(muted, on, step_l),
+			      BF_REG_MASTER_8 + 2 * 1);
+	if (ret < 0)
+		goto out;
+	ret = bf_vendor_write(chip, BF_REQ_GAIN,
+			      bf_out_reg8(muted, on, step_r),
+			      BF_REG_MASTER_8 + 2 * 1 + 1);
+	if (ret < 0)
+		goto out;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT,
+			      bf_out_reg16(muted, on, step_l),
+			      (BF_REG_MASTER_16 + 2 * 1) | flag);
+	if (ret < 0)
+		goto out;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT,
+			      bf_out_reg16(muted, on, step_r),
+			      (BF_REG_MASTER_16 + 2 * 1 + 1) | flag);
+	if (ret < 0)
+		goto out;
+	ret = bf_vendor_write(chip, BF_REQ_PREAMP,
+			      on ? 0x2000 : 0x0000, 0x2000);
+	if (ret < 0)
+		goto out;
+	return 0;
+out:
+	chip->dim = old;
+	return ret;
+}
+
+static int bf_dim_put(struct snd_kcontrol *kctl,
+		      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+	bool on = ucontrol->value.integer.value[0];
+	int ret = 0;
+
+	guard(mutex)(&chip->mutex);
+	if (on == chip->dim)
+		return 0;
+	ret = bf_dim_apply(chip, on);
+	if (ret == 0)
+		ret = 1;
+	return ret;
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
+/* Width spread: L = 0x1000*(1+w), R = 0x1000*(1-w), L+R = 0x2000.
+ * TotalMix writes the strip's src pair on the AN1/2 block (0x0000)
+ * and on the block at 0x0034 (cap_width3-7): the stereo pair spreads
+ * L/R in opposition, the mirror src (AN2) gets the swapped values.
+ * Caller holds chip->mutex.
+ */
+int bf_width_apply(struct snd_usb_babyface *chip, int w)
+{
+	u16 l = (u16)(((0x2000 * (100 + w) / 2) + 50) / 100);
+	u16 r = 0x2000 - l;
+	int ret;
+
+	/* AN1/2: AN1 L=0x0000, R=0x001A; AN2 L=0x0001, R=0x001B. */
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
+	/* The 0x0034 block: AN1 L=0x0034, R=0x004E; AN2 L=0x0035,
+	 * R=0x004F.  TotalMix writes it in the same drag, so keep the
+	 * two halves together here and in the state replay.
+	 */
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, l, 0x0034);
+	if (ret < 0)
+		return ret;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, r, 0x004e);
+	if (ret < 0)
+		return ret;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, r, 0x0035);
+	if (ret < 0)
+		return ret;
+	return bf_vendor_write(chip, BF_REQ_CROSSPOINT, l, 0x004f);
+}
+
+static int bf_width_put(struct snd_kcontrol *kctl,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_babyface *chip = snd_kcontrol_chip(kctl);
+	long w = ucontrol->value.integer.value[0];
+	int ret = 0;
+
+	if (w < -100 || w > 100)
+		return -EINVAL;
+
+	guard(mutex)(&chip->mutex);
+	if ((int)w == chip->width)
+		return 0;
+	ret = bf_width_apply(chip, (int)w);
+	if (ret < 0)
+		return ret;
+	chip->width = w;
+	return 1;
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
+	long nv = ucontrol->value.integer.value[0];
+	u16 v;
+	int ret = 0;
+
+	/* Check before narrowing (a value >= 0x10000 would wrap to a
+	 * passing u16); see bf_master_put().
+	 */
+	if (nv < 0 || nv > 0x1000)
+		return -EINVAL;
+	v = nv;
+
+	guard(mutex)(&chip->mutex);
+	if (v == chip->fx_send)
+		return 0;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, v, 0x0138);
+	if (ret < 0)
+		return ret;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, v, 0x0153);
+	if (ret < 0)
+		return ret;
+	chip->fx_send = v;
+	return 1;
+}
+
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
+		chip->loopback_kctl[i] = kctl;
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
+		.name = "Optical Out Format",
+		.info = bf_optical_info,
+		.get = bf_optical_get,
+		.put = bf_optical_put,
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
diff --git a/sound/usb/babyfacepro/babyfacepro.c b/sound/usb/babyfacepro/babyfacepro.c
index 019a46fc9..12cfd7fea 100644
--- a/sound/usb/babyfacepro/babyfacepro.c
+++ b/sound/usb/babyfacepro/babyfacepro.c
@@ -100,14 +100,26 @@ int bf_vendor_read(struct snd_usb_babyface *chip, u8 req, u16 idx, u8 *buf)
 				    0, idx, buf, 4, BF_CTL_TIMEOUT, GFP_KERNEL);
 }
 
-/* Sends the BF_REG_KEEPALIVE_SETTINGS word (PROTOCOL.md: "keepalive
- * 0x10 0x05CF wVal = host settings-state register" - a single shared
- * word, not independent per-setting writes).  The clock source is
- * Internal.
+/* Composes and sends the BF_REG_KEEPALIVE_SETTINGS word from every
+ * currently-tracked flag together (PROTOCOL.md: "keepalive 0x10 0x05CF
+ * wVal = host settings-state register" - a single shared word, not
+ * independent per-setting writes).  Clock source and Optical Out format
+ * are tracked today; the single call site this replaces (which used to
+ * hardcode 0x0001, i.e. "always Internal") is why this exists as its own
+ * function rather than an inline write at each call site - the next
+ * flag added to this word (EQ for Record, this driver's own upstream
+ * follow-up list) just OR's in here too, instead of every caller needing
+ * to remember every other bit.
  */
 int bf_settings_write(struct snd_usb_babyface *chip)
 {
-	return bf_vendor_write(chip, BF_REQ_KEEPALIVE, BF_SETTINGS_CLOCK_INTERNAL,
+	u16 w = chip->clock_optical ? BF_SETTINGS_CLOCK_OPTICAL :
+				       BF_SETTINGS_CLOCK_INTERNAL;
+
+	if (chip->optical_spdif)
+		w |= BF_SETTINGS_OPTICAL_SPDIF;
+
+	return bf_vendor_write(chip, BF_REQ_KEEPALIVE, w,
 			       BF_REG_KEEPALIVE_SETTINGS);
 }
 
@@ -193,6 +205,7 @@ int bf_pitch_write(struct snd_usb_babyface *chip, int pitch)
 int bf_cold_init(struct snd_usb_babyface *chip)
 {
 	const struct bf_rate *r;
+	u16 w;
 	int ret, i;
 
 	for (i = 0; i <= 0x3d; i++) {
@@ -225,8 +238,12 @@ int bf_cold_init(struct snd_usb_babyface *chip)
 	r = bf_rate_lookup(chip->rate);
 	if (!r)
 		return -EINVAL;
-	ret = bf_vendor_write(chip, BF_REQ_KEEPALIVE,
-			      (bf_rate_family(r) << 4) | BF_SETTINGS_CLOCK_INTERNAL,
+	w = (bf_rate_family(r) << 4) |
+	    (chip->clock_optical ? BF_SETTINGS_CLOCK_OPTICAL :
+				   BF_SETTINGS_CLOCK_INTERNAL);
+	if (chip->optical_spdif)
+		w |= BF_SETTINGS_OPTICAL_SPDIF;
+	ret = bf_vendor_write(chip, BF_REQ_KEEPALIVE, w,
 			      BF_REG_KEEPALIVE_INIT);
 	if (ret < 0)
 		return ret;
@@ -300,14 +317,77 @@ int babyface_restore_state(struct snd_usb_babyface *chip)
 	return bf_pitch_write(chip, chip->pitch);
 }
 
-/* Re-apply the per-input state that sits on top of the crosspoints
- * (phase invert, stereo split, trim) after a state restore.  The write
- * patterns mirror the corresponding _put() handlers.  Caller holds
- * chip->mutex.
+/* Re-apply the state that sits on top of the masters and crosspoints
+ * (the routing flags, DIM, phase invert, stereo split, trim) after a
+ * state restore.  The write patterns mirror the corresponding _put()
+ * handlers.  Caller holds chip->mutex.
  */
 int bf_state_apply_flags(struct snd_usb_babyface *chip)
 {
-	int ret;
+	int out, ret, on_out = -1;
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
+	ret = bf_preamp_commit(chip);
+	if (ret < 0)
+		return ret;
+
+	if (chip->width) {
+		ret = bf_width_apply(chip, chip->width);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, chip->fx_send, 0x0138);
+	if (ret < 0)
+		return ret;
+	ret = bf_vendor_write(chip, BF_REQ_CROSSPOINT, chip->fx_send, 0x0153);
+	if (ret < 0)
+		return ret;
+
+	if (chip->ms_proc) {
+		/* Same ON pattern as bf_ms_put (cap_ms2.pcap): mute the
+		 * AN2 (side) crosspoints on AN1/2 and PH3/4.
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
+	/* Re-apply an engaged DIM.  bf_dim_apply() rebuilds dim_saved
+	 * from the Phones master, which is still zero on a fresh chip,
+	 * and keeps the mute state on top of the -20 dB step.
+	 */
+	if (chip->dim) {
+		ret = bf_dim_apply(chip, true);
+		if (ret < 0)
+			return ret;
+	}
 
 	/* Re-apply any engaged Phase invert - the crosspoint restore loop
 	 * above already re-wrote xpoint[][] as PLAIN values, so a phase
@@ -1520,6 +1600,13 @@ static int babyface_probe(struct usb_interface *intf,
 		dev_err(&intf->dev, "default mixer restore failed: %d\n", err);
 		goto error;
 	}
+	/* The cold init cleared the flag registers as well. */
+	scoped_guard(mutex, &chip->mutex)
+		err = bf_state_apply_flags(chip);
+	if (err < 0) {
+		dev_err(&intf->dev, "flag restore failed: %d\n", err);
+		goto error;
+	}
 	/* Keep the allocation size independent of the active USB mode. */
 	urbsize = BF_WORDS_PER_FRAME * sizeof(u32) * chip->frames_per_urb;
 	chip->urbs_in = kcalloc(chip->nurbs, sizeof(*chip->urbs_in), GFP_KERNEL);
@@ -1592,6 +1679,12 @@ static int babyface_probe(struct usb_interface *intf,
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
index 06af1aa82..1d4c358d9 100644
--- a/sound/usb/babyfacepro/babyfacepro.h
+++ b/sound/usb/babyfacepro/babyfacepro.h
@@ -115,9 +115,17 @@
 
 /* Host settings-state word carried by the BF_REG_KEEPALIVE_SETTINGS
  * keepalive (PROTOCOL.md "keepalive 0x10 0x05CF wVal = host settings-
- * state register", hardware-verified 2026-08-22/23).
+ * state register", hardware-verified 2026-08-22/23): clock source is
+ * NOT a register write at all, only this flag word changes.  Bit 2 =
+ * clock Optical (bit clear = Internal, the default); bit 10 = Optical-Out
+ * S/PDIF (bit clear = ADAT, the default).  Bit 6 (EQ for Record) is next
+ * in the driver's own upstream follow-up list, not wired to a control
+ * yet - the composer below OR's in every tracked bit, structured so that
+ * one can be added the same way without another flag-stomping rewrite.
  */
 #define BF_SETTINGS_CLOCK_INTERNAL	0x0001
+#define BF_SETTINGS_CLOCK_OPTICAL	0x0004
+#define BF_SETTINGS_OPTICAL_SPDIF	0x0400
 
 /* Preamp state byte (0x17, wIdx 0x003F - full state, verified).
  * NOTE 2026-08-26 (cap_reflevel3.pcap): the 0x0C "base" is NOT a
@@ -182,6 +190,15 @@
 #define BF_REG_LOWMAP_BASE_L		BF_REG_XPOINT_BASE_L
 #define BF_REG_LOWMAP_BASE_R		BF_REG_XPOINT_BASE_R
 
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
@@ -332,6 +349,17 @@ struct snd_usb_babyface {
 					 * (0 = +4dBu, the default)
 					 */
 	struct snd_kcontrol *trim_kctl[4]; /* for snd_ctl_notify */
+	bool loopback[6];
+	struct snd_kcontrol *loopback_kctl[6]; /* for snd_ctl_notify */
+	bool an12;			/* AN 1>2 copy */
+	bool linked;			/* AN1/2 input link */
+	bool ms_proc;			/* MS processor engaged */
+	bool clock_optical;		/* clock source: false = Internal (default) */
+	bool optical_spdif;		/* Optical Out: false = ADAT (default) */
+	int width;			/* width knob -100..+100 */
+	u16 fx_send;			/* FX send level 0..0x1000 */
+	u16 dim_saved[2];		/* pre-DIM Phones master (out 1 L/R) */
+	bool dim;			/* DIM engaged (fixed -20 dB on Phones) */
 };
 
 struct bf_rate {
@@ -376,11 +404,16 @@ int babyface_create_xpoints(struct snd_usb_babyface *chip);
 int babyface_create_trim(struct snd_usb_babyface *chip);
 int babyface_create_preamp(struct snd_usb_babyface *chip);
 int bf_preamp_state_write(struct snd_usb_babyface *chip);
+int bf_preamp_commit(struct snd_usb_babyface *chip);
 int bf_phase_apply(struct snd_usb_babyface *chip, int mic, bool invert);
 int bf_split_apply(struct snd_usb_babyface *chip, int pb, bool split);
 int bf_trim_apply(struct snd_usb_babyface *chip, int mic, int trim_db2);
 int bf_gain_max_db(int mic);
 u8 bf_gain_raw(int mic, int db);
+int bf_loopback_write_map(struct snd_usb_babyface *chip, int out, bool on);
+int bf_width_apply(struct snd_usb_babyface *chip, int w);
+int bf_dim_apply(struct snd_usb_babyface *chip, bool on);
+int babyface_create_flags(struct snd_usb_babyface *chip);
 
 /* Master gain-law helpers (babyfacepro-ctl.c). */
 int bf_master_16bit(int half_db);	/* dBx2 -> 16-bit master */
-- 
2.56.0

