Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837772;
	b=wcJWVkLvzaylcnKOnRNA5k7JavHL72TtbivNGsfkRA9C4lp5QT72MpLPXnhN/ProDSjF
	 xHLo5b4cnp+Dq5An+qPn4jAChR7zKK9GuRzcGpQgfPNvf9QUD2Bvd1F2EDmUbOLeaoWvr
	 Ztn8boRlHBzloq+f31XZvIUvqJ5PE8PZ6mgDNWC8Jww7cnR/o4ZP1YRsAKql4Kp5Gb3ks
	 I44NUH/GleTGw5+u5ysBlUgZm6feJTKKiXC9jhqcLr/RCtkLSqppEhF8z0cZFhMWZE4G0
	 vz8qk5E/aei5aC413mPsnMlMXOuT7fQAV+TvYRGLjt1FdFZpgd832XSCdlojYbkqBLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837772;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3RdZVC353S3Jzng/KfaGsJ4ZkY6L2Mnl5rmFAjdCmnw=;
	b=BPscCmod1MtoCovaGZ603s0/BlDCdK9njdU7Tf2dkDRnkFrBb/O6PdwKQlX2bHNPzoDz
	 9xeDoSpORUZloKwZPr0+NuEI6GaCkQsYC9j7XmQAsXrcjUexn1Qx+TOVRLXnvuBtOjgI7
	 3x8W+ovv5ZHotUd7AkrvZSNg8outkVfLdFdz63IcgKmEWe5hjFNEsKTPMqL/HIfyubIrr
	 WrsQo8Esy17RKNd7N+FoK0M6amlXf9b4VrNPpOthoki1Q7aXRBAKI6ZOLdInIH7NISktz
	 ZKoUKgahB/7rfSJscOQlVxYfZYdKMQkM2BX9ow17qLYzPJ+qDvBuH3IMca9Fzkn9tlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=ZoGXtYay;
	arc=none smtp.remote-ip=109.224.244.121
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C85B606A335;
	Mon, 16 Nov 2026 14:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C85B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=ZoGXtYay
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794837768; x=1795096968;
	bh=3RdZVC353S3Jzng/KfaGsJ4ZkY6L2Mnl5rmFAjdCmnw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ZoGXtYaybLuUpFn3Vwe0Ti2Gf241EmMqLPYD/CXvIe+loJVig0yDbnryyZsWrJdgl
	 LMDpmiufReGB5q/8fxjRUqLIo2vwiOdUvQnoIx1rBRGcKjz09EjIPTPKhHy1mZLz35
	 PN2x2epMX6lLe7+wRL4/+nO1dIo9STKYiuwmSWBKSc1WmCCDyQIqjjZQU9H9nFwpdb
	 fa6lEm69mvi9UVY+9uLYvM2gm5ar9JZuC+wOb99YEo2ZDIcFDqRecDZSjosjY2QR2j
	 Hek+Z1Y3BpDUkDZMVSUVQMiHYyG5igcLgbX4UQGON5MU/tf4EBXGfiQUHgDvNa8kOr
	 S0DbIkI5ldmBw==
Date: Mon, 16 Nov 2026 14:02:44 +0000
To: tiwai@suse.de, Devin Christensen <dchristensen8@proton.me>
From: Devin Christensen <dchristensen8@proton.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, rafael@gexdigital.net
Subject: [PATCH] ALSA: hda/ca0132: Fix AE-5 strip color corruption and add on-card LED control
Message-ID: <20261116140237.4137662-1-dchristensen8@proton.me>
Feedback-ID: 45895322:user:proton
X-Pm-Message-ID: 8c17c8ea92dd04b823005f88bf47b1df55d5c032
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This update resolves the external WS2812 RGB LED strip color scrambling
glitch during rapid animation updates, and adds ALSA card control
support for the 5 on-board APA102 RGB LEDs on Sound BlasterX AE-5 cards.

1. Fix external strip color corruption:
In ae5_strip_send_frame(), formatting repeating frame cycles across the
32 KB DMA buffer combined with stopping the HDA stream after an arbitrary
15-20 ms delay caused transmissions to be cut off mid-frame / mid-byte.
WS2812 shift registers latch on signal low (>50 us), so terminating
mid-byte leaves partial bits in the registers, shifting color channel
alignments (e.g. blue/white shifting to green/purple/red) on subsequent
frames. Fix this by populating exactly one WS2812 frame followed by the
reset gap and zero-filling the remainder of the 32 KB buffer. Reduce
usleep_range to 8-10 ms, which guarantees the frame has completed and
the stream terminates cleanly during trailing silence without truncating
active LED data.

2. Add on-card APA102 RGB LED control:
The AE-5 and AE-5 Plus feature 5 on-board APA102 (DotStar) RGB LEDs
providing logo and shroud illumination. These are driven directly by
CA0113 bridge GPIO pins 2 (data) and 3 (clock) mapped through PCIe BAR2
at MMIO offset 0x320.
Expose the on-board LEDs through a volatile card control element:
  "AE-5 On-Card LEDs" (RW, BYTES): 15-byte RGB payload representing
                      the 5 on-board LEDs (3 bytes per LED).
Writes bit-bang the 32-bit start frame, 5 APA102 LED frames (8-bit
brightness and 24-bit BGR color), and 32-bit end frame over GPIO pins 2
and 3, returning the pins to idle low. Mutex serialization and runtime
PM are shared with the external strip control.

Fixes: c3e35f355fad ("ALSA: hda/ca0132: Add Sound BlasterX AE-5 external RG=
B LED strip support")
Signed-off-by: Devin Christensen <dchristensen8@proton.me>
---
 sound/hda/codecs/ca0132.c | 151 +++++++++++++++++++++++++++++---------
 1 file changed, 116 insertions(+), 35 deletions(-)

diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
index b3e768be8..b7c97a079 100644
--- a/sound/hda/codecs/ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -1062,6 +1062,7 @@ enum dsp_download_state {
  */
=20
 #define AE5_STRIP_MAX_LEDS 100
+#define AE5_ONCARD_LEDS 5
=20
 struct ca0132_spec {
 =09struct hda_gen_spec gen;
@@ -1167,10 +1168,11 @@ struct ca0132_spec {
 =09bool use_alt_controls;
=20
 #if IS_ENABLED(CONFIG_SND_HDA_DSP_LOADER)
-=09/* AE-5 WS2812 strip control */
+=09/* AE-5 WS2812 strip and on-card LED control */
 =09struct mutex ae5_strip_mutex;
 =09u32 ae5_strip_cur_colors[AE5_STRIP_MAX_LEDS];
 =09int ae5_strip_cur_num_leds;
+=09u8 ae5_oncard_cur_colors[AE5_ONCARD_LEDS * 3];
 #endif
 };
=20
@@ -8421,8 +8423,6 @@ static int ae5_strip_send_frame(struct hda_codec *cod=
ec, const u32 *grb_colors,
 =09=09u32 ser_base[4], ser_clk[4], ser_out[4];
 =09} saved;
 =09__le32 *dst;
-=09int word_idx =3D 0;
-=09int frame_words;
 =09int led, w, i;
 =09int retries =3D 20; /* ~100ms max */
=20
@@ -8470,38 +8470,25 @@ static int ae5_strip_send_frame(struct hda_codec *c=
odec, const u32 *grb_colors,
 =09=09usleep_range(5000, 10000);
 =09}
=20
-=09/* 1. Populate the 32KB DMA buffer with repeating WS2812 frames + reset=
 gaps */
+=09/* 1. Populate the 32KB DMA buffer: 1 WS2812 frame + reset gap, rest ze=
ro */
 =09memset(dmab.area, 0, AE5_STRIP_DMA_SIZE);
 =09dst =3D (__le32 *)dmab.area;
=20
-=09/* Words per frame: preamble + (num_leds * words_per_led) + reset gap *=
/
-=09frame_words =3D AE5_STRIP_PREAMBLE_WORDS + (num_leds * AE5_STRIP_WORDS_=
PER_LED) +
-=09=09      AE5_STRIP_RESET_GAP_WORDS;
-
-=09while (word_idx + frame_words <=3D AE5_STRIP_TOTAL_WORDS) {
-=09=09/* Preamble per Windows CtxHda FUN_00042944 */
-=09=09for (w =3D 0; w < AE5_STRIP_PREAMBLE_WORDS; w++) {
-=09=09=09*dst++ =3D 0;
-=09=09=09word_idx++;
-=09=09}
-=09=09/* LEDs */
-=09=09for (led =3D 0; led < num_leds; led++) {
-=09=09=09ae5_strip_encode_24(grb_colors[led], enc_words);
-=09=09=09for (w =3D 0; w < AE5_STRIP_WORDS_PER_LED; w++) {
-=09=09=09=09*dst++ =3D cpu_to_le32(enc_words[w]);
-=09=09=09=09word_idx++;
-=09=09=09}
-=09=09}
-=09=09/* Zero reset gap (> 1.8 ms; WS2812 requires > 50 us low) */
-=09=09for (w =3D 0; w < AE5_STRIP_RESET_GAP_WORDS; w++) {
-=09=09=09*dst++ =3D 0;
-=09=09=09word_idx++;
-=09=09}
-=09}
-=09while (word_idx < AE5_STRIP_TOTAL_WORDS) {
+=09/* Preamble per Windows CtxHda FUN_00042944 */
+=09for (w =3D 0; w < AE5_STRIP_PREAMBLE_WORDS; w++)
 =09=09*dst++ =3D 0;
-=09=09word_idx++;
+
+=09/* LEDs */
+=09for (led =3D 0; led < num_leds; led++) {
+=09=09ae5_strip_encode_24(grb_colors[led], enc_words);
+=09=09for (w =3D 0; w < AE5_STRIP_WORDS_PER_LED; w++)
+=09=09=09*dst++ =3D cpu_to_le32(enc_words[w]);
 =09}
+
+=09/* Zero reset gap (> 1.8 ms; WS2812 requires > 50 us low) */
+=09for (w =3D 0; w < AE5_STRIP_RESET_GAP_WORDS; w++)
+=09=09*dst++ =3D 0;
+
 =09/* Ensure DMA buffer writes are committed before triggering the HDA str=
eam */
 =09wmb();
=20
@@ -8572,12 +8559,13 @@ static int ae5_strip_send_frame(struct hda_codec *c=
odec, const u32 *grb_colors,
 =09/* 3. Trigger stream transmission on HDA link */
 =09snd_hdac_dsp_trigger(hstr, true);
 =09/*
-=09 * WS2812 latches on the >50us reset gap after one frame. The 32KB buff=
er holds ~64
-=09 * repeating frame+reset cycles; at ~1.4ms/frame a 15ms run transmits ~=
10 complete
-=09 * cycles - more than enough to latch reliably. Keep it short so rapid =
sysfs writes
-=09 * (OpenRGB effects/theme changes) are not serialized behind a 1s block=
ing sleep.
+=09 * WS2812 latches on the >50us reset gap after the frame. At 44.1kHz st=
ereo
+=09 * (88.2k words/s), a 100-LED frame + reset gap is 488 words (~5.5ms); =
a 10-LED
+=09 * strip is 128 words (~1.5ms). Sleeping 8-10ms guarantees the entire f=
rame and
+=09 * latch reset have completed. The remainder of the 32KB buffer is zero=
-filled,
+=09 * so stopping the stream during the trailing zeros never truncates an =
active LED.
 =09 */
-=09usleep_range(15000, 20000);
+=09usleep_range(8000, 10000);
 =09snd_hdac_dsp_trigger(hstr, false);
 =09codec_dbg(codec, "AE5 strip: trigger complete\n");
=20
@@ -8704,6 +8692,90 @@ static int ae5_strip_num_leds_put(struct snd_kcontro=
l *kcontrol,
 =09return 1;
 }
=20
+static void ae5_oncard_write_bit(struct ca0132_spec *spec, bool bit)
+{
+=09writew(bit ? 0x102 : 0x002, spec->mem_base + 0x320);
+=09writew(0x103, spec->mem_base + 0x320);
+=09writew(0x003, spec->mem_base + 0x320);
+}
+
+/*
+ * Caller must hold spec->ae5_strip_mutex.
+ */
+static void ae5_oncard_send_frame(struct hda_codec *codec, const u8 *rgb_c=
olors)
+{
+=09struct ca0132_spec *spec =3D codec->spec;
+=09int i, bit;
+
+=09if (!spec || !spec->mem_base)
+=09=09return;
+
+=09lockdep_assert_held(&spec->ae5_strip_mutex);
+=09CLASS(snd_hda_power_pm, pm)(codec);
+
+=09/* Start frame: 32 zeroes */
+=09for (i =3D 0; i < 32; i++)
+=09=09ae5_oncard_write_bit(spec, false);
+
+=09/* 5 APA102 LEDs: 8-bit brightness (0xFF), Blue, Green, Red */
+=09for (i =3D 0; i < AE5_ONCARD_LEDS; i++) {
+=09=09u8 r =3D rgb_colors[i * 3 + 0];
+=09=09u8 g =3D rgb_colors[i * 3 + 1];
+=09=09u8 b =3D rgb_colors[i * 3 + 2];
+=09=09u32 val =3D 0xff000000 | ((u32)b << 16) | ((u32)g << 8) | (u32)r;
+
+=09=09for (bit =3D 31; bit >=3D 0; bit--)
+=09=09=09ae5_oncard_write_bit(spec, (val >> bit) & 1);
+=09}
+
+=09/* End frame: 32 ones */
+=09for (i =3D 0; i < 32; i++)
+=09=09ae5_oncard_write_bit(spec, true);
+
+=09/* Return GPIO pins 2 (data) and 3 (clock) to idle low */
+=09ca0113_mmio_gpio_set(codec, 2, false);
+=09ca0113_mmio_gpio_set(codec, 3, false);
+}
+
+static int ae5_oncard_ctl_info(struct snd_kcontrol *kcontrol,
+=09=09=09       struct snd_ctl_elem_info *uinfo)
+{
+=09uinfo->type =3D SNDRV_CTL_ELEM_TYPE_BYTES;
+=09uinfo->count =3D AE5_ONCARD_LEDS * 3;
+=09return 0;
+}
+
+static int ae5_oncard_ctl_get(struct snd_kcontrol *kcontrol,
+=09=09=09      struct snd_ctl_elem_value *ucontrol)
+{
+=09struct hda_codec *codec =3D snd_kcontrol_chip(kcontrol);
+=09struct ca0132_spec *spec =3D codec->spec;
+
+=09guard(mutex)(&spec->ae5_strip_mutex);
+=09memcpy(ucontrol->value.bytes.data, spec->ae5_oncard_cur_colors,
+=09       AE5_ONCARD_LEDS * 3);
+=09return 0;
+}
+
+static int ae5_oncard_ctl_put(struct snd_kcontrol *kcontrol,
+=09=09=09      struct snd_ctl_elem_value *ucontrol)
+{
+=09struct hda_codec *codec =3D snd_kcontrol_chip(kcontrol);
+=09struct ca0132_spec *spec =3D codec->spec;
+=09bool change;
+
+=09guard(mutex)(&spec->ae5_strip_mutex);
+=09change =3D memcmp(spec->ae5_oncard_cur_colors, ucontrol->value.bytes.da=
ta,
+=09=09=09AE5_ONCARD_LEDS * 3) !=3D 0;
+=09if (!change)
+=09=09return 0;
+
+=09memcpy(spec->ae5_oncard_cur_colors, ucontrol->value.bytes.data,
+=09       AE5_ONCARD_LEDS * 3);
+=09ae5_oncard_send_frame(codec, spec->ae5_oncard_cur_colors);
+=09return 1;
+}
+
 static const struct snd_kcontrol_new ae5_strip_ctls[] =3D {
 =09{
 =09=09.iface =3D SNDRV_CTL_ELEM_IFACE_CARD,
@@ -8723,6 +8795,15 @@ static const struct snd_kcontrol_new ae5_strip_ctls[=
] =3D {
 =09=09.get =3D ae5_strip_num_leds_get,
 =09=09.put =3D ae5_strip_num_leds_put,
 =09},
+=09{
+=09=09.iface =3D SNDRV_CTL_ELEM_IFACE_CARD,
+=09=09.name =3D "AE-5 On-Card LEDs",
+=09=09.access =3D SNDRV_CTL_ELEM_ACCESS_READWRITE |
+=09=09=09  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+=09=09.info =3D ae5_oncard_ctl_info,
+=09=09.get =3D ae5_oncard_ctl_get,
+=09=09.put =3D ae5_oncard_ctl_put,
+=09},
 };
=20
 static int ae5_add_strip_controls(struct hda_codec *codec)
--=20
2.56.0


