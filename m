Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1FA37A4AB
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791390757; cv=none; b=oGEsLeQmPSsG5yIIth7td0ryK9MtxfoqYKbY0GHfYAgXQA2AF+8LiBpR+TVyPBy4DAjsnpE84HEL6T1nTITPPmKZ287xr3YI/GZDUp/QpapCV84JULwsl3/7ADkr196MakFH+BsThBcTelc/QJJX1SpKlqRKMyOEG9/ZpPhy25o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791390757; c=relaxed/simple;
	bh=W6AnEZMSPK4gfU5mRZnciisNPE+2MuFs12OCsFJRvmM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d6me4QmiA4U6FTdqBURUttzcLIsLgXRjqZvOXoojeUrVpOQbFW2yk61X9CRONaVj6qHAXAFR0Qq/m4zlKV5pskod3TESkLUtLzt9jjVcX7w4G9/AB1G7WznKn+Dcm4QBIo8ZWxiO/xVVlbWIGl7LkgCo0KLhsDyP6KGoxTDF1zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=WkBPBIC1; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="WkBPBIC1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=4x2ow5ljtjbw3hplheentgfmim.protonmail2; t=1791390741;
	x=1791649941; bh=um/MWEinqxCvpmwJ3KG/Y2wDcHMbrP2w+5dgfERQ2Tw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WkBPBIC12GeoNfkUUoI9G1AmqTxxftyTSpusbkd5W1IKUSfNvGMEss68mB7jnQLO4
	 eApII0CrUYchFyof8fejb5El4YwTXE1MaWgMqXXTAEjXylmb6QmIctNHHK+eS7+DE4
	 d7jmF+FR4dIPD+BXDDyedlpHDQx++CKn1GuxG6MbOxRM/2zbr+mM1xuIBBNcIgaHfp
	 lRxvwOrYkK/MXKXEFBizkHAsqWS9XIXtzj0ZgHru3YwLs4L634MMKwWVFi01JobcFF
	 f3wSN2QJBwgbNr4wfovE/qPjUsp40PxCKvTNcXFTWAQaXZ2aOdtm+RxGx59rk3kClY
	 BMXGWs8M7105A==
Date: Wed, 07 Oct 2026 16:32:14 +0000
To: tiwai@suse.de, Devin Christensen <dchristensen8@proton.me>
From: Devin Christensen <dchristensen8@proton.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5] ALSA: hda/ca0132: Add Sound BlasterX AE-5 external RGB LED strip support
Message-ID: <20261007163207.2621040-1-dchristensen8@proton.me>
In-Reply-To: <20261006152520.1409881-1-dchristensen8@proton.me>
References: <20261005141244.2130023-1-dchristensen8@proton.me> <87mrsrorxc.wl-tiwai@suse.de> <20261006152520.1409881-1-dchristensen8@proton.me>
Feedback-ID: 45895322:user:proton
X-Pm-Message-ID: 4cbfe35e6d2eb7a18adb499af58d3f8067d591a1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Sound BlasterX AE-5 and AE-5 Plus expose a 3-pin 5V addressable RGB
header driven directly by the CA0113 PCIe-to-HD-Audio bridge. Rather
than using the CA0132 DSP or MMIO GPIO, the CA0113 contains an
autonomous HDA link sniffer that snoops a designated HDA DMA playback
stream, extracts the 24-bit GRB color payload, and serializes it as
800 kHz single-wire NRZ pulses to the strip (WS2812B protocol).

Expose the strip through volatile card control elements:

  "AE-5 LED Strip"        (RW, BYTES): 300-byte RGB payload representing
                          up to 100 addressable LEDs (3 bytes per LED).
  "AE-5 LED Strip Count"  (RW, INTEGER): Active LED count (1..100).

The controls are marked with IFACE_CARD and SNDRV_CTL_ELEM_ACCESS_VOLATILE
so changes do not trigger unnecessary audio daemon wakeups or state
restoration by alsactl.

Writes allocate an idle HDA playback stream, format a 32 KB DMA buffer
populated with repeating WS2812 frames (preamble, audio words per LED,
and reset gap), configure the CA0113 BAR2 serializers and stream-tag
pin mux, and pulse the stream long enough for the reset latch to fire.
Access is serialized with a per-spec mutex, and the controls are only
registered on QUIRK_AE5 devices.

The strip transport uses snd_hdac_dsp_prepare() / snd_hdac_dsp_cleanup(),
which require CONFIG_SND_HDA_DSP_LOADER. All strip-related code and struct
fields are conditionally compiled under
IS_ENABLED(CONFIG_SND_HDA_DSP_LOADER), with a no-op stub for
ae5_add_strip_controls() when disabled.

Signed-off-by: Devin Christensen <dchristensen8@proton.me>
---
Updated to v5 to preserve colors across LED count changes:

- Parse, compare, and cache the full 100-LED payload (AE5_STRIP_MAX_LEDS)
  in ae5_strip_ctl_put() and ae5_strip_ctl_get(), passing only the active
  count to ae5_strip_send_frame(). This avoids discarding colors for
  inactive LEDs when userspace configures the strip before increasing
  the count.

Thanks,
Devin

v5:
 - Parse, compare, and cache the full 100-LED payload (AE5_STRIP_MAX_LEDS)
   in ae5_strip_ctl_put() and ae5_strip_ctl_get(), passing only the active
   count to ae5_strip_send_frame(). This preserves colors for inactive
   LEDs when userspace configures the strip before increasing the count.

v4:
 - Reserve HDA stream by marking s->opened =3D 1 under bus->reg_lock in
   ae5_strip_find_stream(), and clear on completion/error, preventing
   TOCTOU race with concurrent PCM stream assignment.
 - Check pm.err after CLASS(snd_hda_power_pm, pm)(codec) to avoid MMIO/DMA
   access on suspended or failed-to-resume devices.
 - Check return value of ae5_strip_send_frame() in control put callbacks,
   propagating errors to userspace and avoiding uncommitted state divergenc=
e.
 - Write DMA buffer words using cpu_to_le32() for big-endian architecture
   safety.
 - Remove redundant/overwritten orig_sd_ctl save and interrupt mask clearin=
g.

v3:
 - Move #include <linux/dma-mapping.h> into main header block.
 - Check s->opened in ae5_strip_find_stream() to avoid stealing open stream=
s.
 - Guard all strip code and struct members with IS_ENABLED(CONFIG_SND_HDA_D=
SP_LOADER)
   and provide a static inline stub for ae5_add_strip_controls().
 - Return 1 from put callbacks when values change (using memcmp on colors).

v2:
 - Use CLASS(snd_hda_power_pm, pm)(codec) for RAII power management.
 - Switch userspace interface from sysfs to volatile card control elements
   ("AE-5 LED Strip" and "AE-5 LED Strip Count").

 sound/hda/codecs/ca0132.c | 391 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 390 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
index 0f8fb62f0..896091c11 100644
--- a/sound/hda/codecs/ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -18,6 +18,7 @@
 #include <linux/types.h>
 #include <linux/io.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <asm/io.h>
 #include <sound/core.h>
 #include <sound/hda_codec.h>
@@ -1060,6 +1061,8 @@ enum dsp_download_state {
  * CA0132 specific
  */
=20
+#define AE5_STRIP_MAX_LEDS 100
+
 struct ca0132_spec {
 =09struct hda_gen_spec gen;
=20
@@ -1162,6 +1165,13 @@ struct ca0132_spec {
 =09 * Renames PlayEnhancement and CrystalVoice too.
 =09 */
 =09bool use_alt_controls;
+
+#if IS_ENABLED(CONFIG_SND_HDA_DSP_LOADER)
+=09/* AE-5 WS2812 strip control */
+=09struct mutex ae5_strip_mutex;
+=09u32 ae5_strip_cur_colors[AE5_STRIP_MAX_LEDS];
+=09int ae5_strip_cur_num_leds;
+#endif
 };
=20
 /*
@@ -6846,6 +6856,15 @@ static int ca0132_alt_add_mic_boost_enum(struct hda_=
codec *codec)
=20
 }
=20
+#if IS_ENABLED(CONFIG_SND_HDA_DSP_LOADER)
+static int ae5_add_strip_controls(struct hda_codec *codec);
+#else
+static inline int ae5_add_strip_controls(struct hda_codec *codec)
+{
+=09return 0;
+}
+#endif
+
 /*
  * Add headphone gain enumerated control for the AE-5. This switches betwe=
en
  * three modes, low, medium, and high. When non-headphone outputs are sele=
cted,
@@ -7149,6 +7168,10 @@ static int ca0132_build_controls(struct hda_codec *c=
odec)
=20
 =09switch (ca0132_quirk(spec)) {
 =09case QUIRK_AE5:
+=09=09err =3D ae5_add_strip_controls(codec);
+=09=09if (err < 0)
+=09=09=09return err;
+=09=09fallthrough;
 =09case QUIRK_AE7:
 =09=09err =3D ae5_add_headphone_gain_enum(codec);
 =09=09if (err < 0)
@@ -8316,8 +8339,367 @@ static void sbz_setup_defaults(struct hda_codec *co=
dec)
 }
=20
 /*
- * Setup default parameters for the Sound BlasterX AE-5 DSP.
+ * Sound BlasterX AE-5 External WS2812B RGB LED Strip Transport
  */
+#if IS_ENABLED(CONFIG_SND_HDA_DSP_LOADER)
+#define AE5_STRIP_DMA_SIZE=09=090x8000
+#define AE5_STRIP_TOTAL_WORDS=09=09(AE5_STRIP_DMA_SIZE / sizeof(u32))
+#define AE5_STRIP_PREAMBLE_WORDS=095
+#define AE5_STRIP_WORDS_PER_LED=09=094
+#define AE5_STRIP_RESET_GAP_WORDS=0983
+
+#define CA0113_SERIALIZER_BASE(spec, ch)=09((spec)->mem_base + 0x42c + (ch=
) * 0x40)
+#define CA0113_SERIALIZER_CLK(spec, ch)=09=09((spec)->mem_base + 0x43c + (=
ch) * 0x40)
+#define CA0113_SERIALIZER_OUT(spec, ch)=09=09((spec)->mem_base + 0x454 + (=
ch) * 0x40)
+
+static void ae5_strip_encode_24(u32 u, u32 *words)
+{
+=09/*
+=09 * 24-bit pixel -> 4 x 32-bit audio words (6 bits per word).
+=09 * Hardware audio serializer transmits MSB first (bits 31 down to 0).
+=09 * For word i (i8 =3D 23, 17, 11, 5), bit_idx 0..5 (MSB to LSB within t=
he word)
+=09 * is placed at n =3D 29 - bit_idx * 4:
+=09 *   Bit 0 -> 0b100 << n (375ns high, 1042ns low): BIT(n + 2)
+=09 *   Bit 1 -> 0b111 << n (1083ns high, 333ns low): BIT(n + 2) | BIT(n +=
 1) | BIT(n)
+=09 */
+=09int i8 =3D 23;
+=09int i, bit_idx;
+
+=09for (i =3D 0; i < 4; i++) {
+=09=09u32 out =3D 0;
+
+=09=09for (bit_idx =3D 0; bit_idx < 6; bit_idx++) {
+=09=09=09int bit =3D (u >> (i8 - bit_idx)) & 1;
+=09=09=09int n =3D 29 - bit_idx * 4;
+
+=09=09=09out |=3D (bit ? (BIT(2) | BIT(1) | BIT(0)) : BIT(2)) << n;
+=09=09}
+=09=09words[i] =3D out;
+=09=09i8 -=3D 6;
+=09}
+}
+
+static struct hdac_stream *ae5_strip_find_stream(struct hda_codec *codec)
+{
+=09struct ca0132_spec *spec =3D codec->spec;
+=09struct hdac_bus *bus =3D &codec->bus->core;
+=09struct hdac_stream *s, *dsp =3D NULL, *first =3D NULL;
+
+=09guard(spinlock_irqsave)(&bus->reg_lock);
+=09list_for_each_entry(s, &bus->stream_list, list) {
+=09=09if (s->direction !=3D SNDRV_PCM_STREAM_PLAYBACK)
+=09=09=09continue;
+=09=09if (s->opened || s->running || s->locked)
+=09=09=09continue;
+=09=09if (!first)
+=09=09=09first =3D s;
+=09=09/* The DSP DMA consumes the DSP-loader stream (tag in dsp_stream_id)=
. */
+=09=09if (spec->dsp_stream_id && s->stream_tag =3D=3D spec->dsp_stream_id)
+=09=09=09dsp =3D s;
+=09}
+
+=09s =3D dsp ? dsp : first;
+=09if (s)
+=09=09s->opened =3D 1;
+
+=09return s;
+}
+
+/*
+ * Caller must hold spec->ae5_strip_mutex.
+ */
+static int ae5_strip_send_frame(struct hda_codec *codec, const u32 *grb_co=
lors, int num_leds)
+{
+=09struct ca0132_spec *spec =3D codec->spec;
+=09struct hdac_bus *bus =3D &codec->bus->core;
+=09struct snd_dma_buffer dmab;
+=09struct hdac_stream *hstr =3D NULL;
+=09unsigned int format, stream_tag;
+=09u32 enc_words[4];
+=09__le32 *dst;
+=09int word_idx =3D 0;
+=09int frame_words;
+=09int led, w, i;
+=09int retries =3D 20; /* ~100ms max */
+
+=09if (!spec || !spec->mem_base)
+=09=09return -ENODEV;
+=09if (num_leds <=3D 0 || num_leds > AE5_STRIP_MAX_LEDS)
+=09=09return -EINVAL;
+
+=09lockdep_assert_held(&spec->ae5_strip_mutex);
+
+=09CLASS(snd_hda_power_pm, pm)(codec);
+=09if (pm.err < 0)
+=09=09return pm.err;
+
+=09/*
+=09 * 44.1kHz, 24-bit, 2-channel format (0x4031) matches Windows CtxHda
+=09 * HDAUDIO_STREAM_FORMAT.
+=09 */
+=09format =3D snd_hdac_stream_format(2, 24, 44100);
+
+=09for (;;) {
+=09=09hstr =3D ae5_strip_find_stream(codec);
+=09=09if (!hstr) {
+=09=09=09if (--retries <=3D 0) {
+=09=09=09=09codec_warn(codec, "AE5 strip: no free azx stream after retries=
\n");
+=09=09=09=09return -EBUSY;
+=09=09=09}
+=09=09=09usleep_range(5000, 10000);
+=09=09=09continue;
+=09=09}
+
+=09=09stream_tag =3D snd_hdac_dsp_prepare(hstr, format, AE5_STRIP_DMA_SIZE=
, &dmab);
+=09=09if ((int)stream_tag > 0)
+=09=09=09break;
+
+=09=09/* Prepare failed (e.g. -EBUSY due to race with playback starting); =
retry */
+=09=09scoped_guard(spinlock_irq, &bus->reg_lock)
+=09=09=09hstr->opened =3D 0;
+
+=09=09if (--retries <=3D 0) {
+=09=09=09codec_warn(codec, "AE5 strip: snd_hdac_dsp_prepare failed %d\n",
+=09=09=09=09   (int)stream_tag);
+=09=09=09return (int)stream_tag;
+=09=09}
+=09=09usleep_range(5000, 10000);
+=09}
+
+=09/* 1. Populate the 32KB DMA buffer with repeating WS2812 frames + reset=
 gaps */
+=09memset(dmab.area, 0, AE5_STRIP_DMA_SIZE);
+=09dst =3D (__le32 *)dmab.area;
+
+=09/* Words per frame: preamble + (num_leds * words_per_led) + reset gap *=
/
+=09frame_words =3D AE5_STRIP_PREAMBLE_WORDS + (num_leds * AE5_STRIP_WORDS_=
PER_LED) +
+=09=09      AE5_STRIP_RESET_GAP_WORDS;
+
+=09while (word_idx + frame_words <=3D AE5_STRIP_TOTAL_WORDS) {
+=09=09/* Preamble per Windows CtxHda FUN_00042944 */
+=09=09for (w =3D 0; w < AE5_STRIP_PREAMBLE_WORDS; w++) {
+=09=09=09*dst++ =3D 0;
+=09=09=09word_idx++;
+=09=09}
+=09=09/* LEDs */
+=09=09for (led =3D 0; led < num_leds; led++) {
+=09=09=09ae5_strip_encode_24(grb_colors[led], enc_words);
+=09=09=09for (w =3D 0; w < AE5_STRIP_WORDS_PER_LED; w++) {
+=09=09=09=09*dst++ =3D cpu_to_le32(enc_words[w]);
+=09=09=09=09word_idx++;
+=09=09=09}
+=09=09}
+=09=09/* Zero reset gap (> 1.8 ms; WS2812 requires > 50 us low) */
+=09=09for (w =3D 0; w < AE5_STRIP_RESET_GAP_WORDS; w++) {
+=09=09=09*dst++ =3D 0;
+=09=09=09word_idx++;
+=09=09}
+=09}
+=09while (word_idx < AE5_STRIP_TOTAL_WORDS) {
+=09=09*dst++ =3D 0;
+=09=09word_idx++;
+=09}
+=09/* Ensure DMA buffer writes are committed before triggering the HDA str=
eam */
+=09wmb();
+
+=09/* 2. Configure CA0113 BAR2 hardware registers */
+=09/* Power up clocks (CtxHdb 0x141b7 / 0x14210) */
+=09writel(readl(spec->mem_base + 0xc04) | 0x7, spec->mem_base + 0xc04);
+
+=09/* Base serializer initialization (CtxHdb 0x14ba4) */
+=09writel(readl(spec->mem_base + 0x400) | 1, spec->mem_base + 0x400);
+=09for (i =3D 0; i < 4; i++) {
+=09=09writel(readl(CA0113_SERIALIZER_BASE(spec, i)) & ~1,
+=09=09       CA0113_SERIALIZER_BASE(spec, i));
+=09=09writel(0, CA0113_SERIALIZER_CLK(spec, i));
+=09}
+=09writel(readl(spec->mem_base + 0x408) | 1, spec->mem_base + 0x408);
+=09writel(readl(spec->mem_base + 0x40c) | 1, spec->mem_base + 0x40c);
+=09writel((readl(spec->mem_base + 0x410) & ~0xb) | 0x14, spec->mem_base + =
0x410);
+
+=09/* Configure serializers 0..3 clocking (CtxHdb 0x14a6c) */
+=09for (i =3D 0; i < 4; i++)
+=09=09writel(readl(CA0113_SERIALIZER_CLK(spec, i)) | 0x33,
+=09=09       CA0113_SERIALIZER_CLK(spec, i));
+
+=09/* BAR2 + 0x100 format & channel enables:
+=09 * - base 0x70f
+=09 * - bit 28 =3D 1 (24-bit audio format via CtxHdb 0x14f58)
+=09 * - bits 29..31 =3D 1 (44.1 kHz sample rate via CtxHdb 0x14fa4)
+=09 * - bits 4..7 =3D 0xf (stage 1 enables)
+=09 * - bits 12..15 =3D 0xf (stage 2 enables)
+=09 * =3D> 0x3000ff8f
+=09 */
+=09writel((readl(spec->mem_base + 0x100) & ~0xe000ffff) | 0x3000ff8f, spec=
->mem_base + 0x100);
+
+=09/* Enable serializer output drivers for pins 0..3 (CtxHdb 0x14e94) */
+=09for (i =3D 0; i < 4; i++)
+=09=09writel(readl(CA0113_SERIALIZER_OUT(spec, i)) | 1,
+=09=09       CA0113_SERIALIZER_OUT(spec, i));
+
+=09/* Route all channels 0..3 to stream_tag (CtxHdb 0x1502c) */
+=09writel((stream_tag << 28) | (stream_tag << 20) | (stream_tag << 12) | (=
stream_tag << 4),
+=09       spec->mem_base + 0x104);
+
+=09/* Enable CA0113 MMIO GPIO 0 & 1 */
+=09ca0113_mmio_gpio_set(codec, 0, true);
+=09ca0113_mmio_gpio_set(codec, 1, true);
+
+=09codec_dbg(codec, "AE5 strip: send_frame: num_leds=3D%d stream_tag=3D%u =
(0x%08x)\n",
+=09=09  num_leds, stream_tag, readl(spec->mem_base + 0x104));
+
+=09/* 3. Trigger stream transmission on HDA link */
+=09snd_hdac_dsp_trigger(hstr, true);
+=09/*
+=09 * WS2812 latches on the >50us reset gap after one frame. The 32KB buff=
er holds ~64
+=09 * repeating frame+reset cycles; at ~1.4ms/frame a 15ms run transmits ~=
10 complete
+=09 * cycles - more than enough to latch reliably. Keep it short so rapid =
sysfs writes
+=09 * (OpenRGB effects/theme changes) are not serialized behind a 1s block=
ing sleep.
+=09 */
+=09usleep_range(15000, 20000);
+=09snd_hdac_dsp_trigger(hstr, false);
+=09codec_dbg(codec, "AE5 strip: trigger complete\n");
+
+=09/* Teardown: clear 0x104 pin mux back to 0 */
+=09writel(0x00000000, spec->mem_base + 0x104);
+
+=09snd_hdac_dsp_cleanup(hstr, &dmab);
+=09scoped_guard(spinlock_irq, &bus->reg_lock)
+=09=09hstr->opened =3D 0;
+
+=09return 0;
+}
+
+static int ae5_strip_ctl_info(struct snd_kcontrol *kcontrol,
+=09=09=09      struct snd_ctl_elem_info *uinfo)
+{
+=09uinfo->type =3D SNDRV_CTL_ELEM_TYPE_BYTES;
+=09uinfo->count =3D AE5_STRIP_MAX_LEDS * 3;
+=09return 0;
+}
+
+static int ae5_strip_ctl_get(struct snd_kcontrol *kcontrol,
+=09=09=09     struct snd_ctl_elem_value *ucontrol)
+{
+=09struct hda_codec *codec =3D snd_kcontrol_chip(kcontrol);
+=09struct ca0132_spec *spec =3D codec->spec;
+=09int i;
+
+=09guard(mutex)(&spec->ae5_strip_mutex);
+=09for (i =3D 0; i < AE5_STRIP_MAX_LEDS; i++) {
+=09=09u32 grb =3D spec->ae5_strip_cur_colors[i];
+
+=09=09ucontrol->value.bytes.data[i * 3 + 0] =3D (grb >> 8) & 0xff;
+=09=09ucontrol->value.bytes.data[i * 3 + 1] =3D (grb >> 16) & 0xff;
+=09=09ucontrol->value.bytes.data[i * 3 + 2] =3D grb & 0xff;
+=09}
+=09return 0;
+}
+
+static int ae5_strip_ctl_put(struct snd_kcontrol *kcontrol,
+=09=09=09     struct snd_ctl_elem_value *ucontrol)
+{
+=09struct hda_codec *codec =3D snd_kcontrol_chip(kcontrol);
+=09struct ca0132_spec *spec =3D codec->spec;
+=09u32 colors[AE5_STRIP_MAX_LEDS];
+=09int i, num_leds, change, ret;
+
+=09guard(mutex)(&spec->ae5_strip_mutex);
+=09for (i =3D 0; i < AE5_STRIP_MAX_LEDS; i++) {
+=09=09u8 r =3D ucontrol->value.bytes.data[i * 3 + 0];
+=09=09u8 g =3D ucontrol->value.bytes.data[i * 3 + 1];
+=09=09u8 b =3D ucontrol->value.bytes.data[i * 3 + 2];
+
+=09=09colors[i] =3D ((u32)g << 16) | ((u32)r << 8) | (u32)b;
+=09}
+=09change =3D memcmp(spec->ae5_strip_cur_colors, colors,
+=09=09=09sizeof(spec->ae5_strip_cur_colors)) !=3D 0;
+=09num_leds =3D spec->ae5_strip_cur_num_leds;
+=09ret =3D ae5_strip_send_frame(codec, colors, num_leds);
+=09if (ret < 0)
+=09=09return ret;
+=09if (change)
+=09=09memcpy(spec->ae5_strip_cur_colors, colors,
+=09=09       sizeof(spec->ae5_strip_cur_colors));
+=09return change;
+}
+
+static int ae5_strip_num_leds_info(struct snd_kcontrol *kcontrol,
+=09=09=09=09   struct snd_ctl_elem_info *uinfo)
+{
+=09uinfo->type =3D SNDRV_CTL_ELEM_TYPE_INTEGER;
+=09uinfo->count =3D 1;
+=09uinfo->value.integer.min =3D 1;
+=09uinfo->value.integer.max =3D AE5_STRIP_MAX_LEDS;
+=09return 0;
+}
+
+static int ae5_strip_num_leds_get(struct snd_kcontrol *kcontrol,
+=09=09=09=09  struct snd_ctl_elem_value *ucontrol)
+{
+=09struct hda_codec *codec =3D snd_kcontrol_chip(kcontrol);
+=09struct ca0132_spec *spec =3D codec->spec;
+
+=09guard(mutex)(&spec->ae5_strip_mutex);
+=09ucontrol->value.integer.value[0] =3D spec->ae5_strip_cur_num_leds;
+=09return 0;
+}
+
+static int ae5_strip_num_leds_put(struct snd_kcontrol *kcontrol,
+=09=09=09=09  struct snd_ctl_elem_value *ucontrol)
+{
+=09struct hda_codec *codec =3D snd_kcontrol_chip(kcontrol);
+=09struct ca0132_spec *spec =3D codec->spec;
+=09int val =3D ucontrol->value.integer.value[0];
+=09int ret;
+
+=09if (val < 1 || val > AE5_STRIP_MAX_LEDS)
+=09=09return -EINVAL;
+
+=09guard(mutex)(&spec->ae5_strip_mutex);
+=09if (spec->ae5_strip_cur_num_leds =3D=3D val)
+=09=09return 0;
+=09ret =3D ae5_strip_send_frame(codec, spec->ae5_strip_cur_colors, val);
+=09if (ret < 0)
+=09=09return ret;
+=09spec->ae5_strip_cur_num_leds =3D val;
+=09return 1;
+}
+
+static const struct snd_kcontrol_new ae5_strip_ctls[] =3D {
+=09{
+=09=09.iface =3D SNDRV_CTL_ELEM_IFACE_CARD,
+=09=09.name =3D "AE-5 LED Strip",
+=09=09.access =3D SNDRV_CTL_ELEM_ACCESS_READWRITE |
+=09=09=09  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+=09=09.info =3D ae5_strip_ctl_info,
+=09=09.get =3D ae5_strip_ctl_get,
+=09=09.put =3D ae5_strip_ctl_put,
+=09},
+=09{
+=09=09.iface =3D SNDRV_CTL_ELEM_IFACE_CARD,
+=09=09.name =3D "AE-5 LED Strip Count",
+=09=09.access =3D SNDRV_CTL_ELEM_ACCESS_READWRITE |
+=09=09=09  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+=09=09.info =3D ae5_strip_num_leds_info,
+=09=09.get =3D ae5_strip_num_leds_get,
+=09=09.put =3D ae5_strip_num_leds_put,
+=09},
+};
+
+static int ae5_add_strip_controls(struct hda_codec *codec)
+{
+=09int i, err;
+
+=09for (i =3D 0; i < ARRAY_SIZE(ae5_strip_ctls); i++) {
+=09=09err =3D snd_hda_ctl_add(codec, 0,
+=09=09=09=09      snd_ctl_new1(&ae5_strip_ctls[i], codec));
+=09=09if (err < 0)
+=09=09=09return err;
+=09}
+=09return 0;
+}
+#endif /* CONFIG_SND_HDA_DSP_LOADER */
+
 static void ae5_setup_defaults(struct hda_codec *codec)
 {
 =09struct ca0132_spec *spec =3D codec->spec;
@@ -8741,6 +9123,10 @@ static void ca0132_init_chip(struct hda_codec *codec=
)
 =09unsigned int on;
=20
 =09mutex_init(&spec->chipio_mutex);
+#if IS_ENABLED(CONFIG_SND_HDA_DSP_LOADER)
+=09mutex_init(&spec->ae5_strip_mutex);
+=09spec->ae5_strip_cur_num_leds =3D 10;
+#endif
=20
 =09/*
 =09 * The Windows driver always does this upon startup, which seems to
@@ -9626,6 +10012,9 @@ static void ca0132_free(struct hda_codec *codec)
 #ifdef CONFIG_PCI
 =09if (spec->mem_base)
 =09=09pci_iounmap(codec->bus->pci, spec->mem_base);
+#endif
+#if IS_ENABLED(CONFIG_SND_HDA_DSP_LOADER)
+=09mutex_destroy(&spec->ae5_strip_mutex);
 #endif
 =09kfree(spec->spec_init_verbs);
 =09kfree(codec->spec);
--=20
2.55.0


