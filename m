Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839163;
	b=o98cVJgnwgGakz4V7iPmMWvTv6UfG6hLqRIp6l0tIt1RjXJYwhVL+ViAnfrvzsIbyqNb
	 szOPJPUS2uV8ayX8Tkh1U1z1Ipk4Ut2ydLVSq49hGvNP+v78Sk5DDT8743VK//8TiQBEQ
	 UO8T7UCcNYG53PvTXeBBiNlQddkWZVul49f0TVHOHCMdsO+Qhk25/Oz9E7kgLlxwDmYGC
	 096YH8/CgVKSRc50OmIVoTvZAieTK9h3dvnufPXryQODKTZoCgjUwoT+7ZX5EWwft/CgV
	 +Y+FuyNHOydNe6DhVwgGm9UPCuUchwagBRTxVTb0saJgZarVQ0kjVkTs9US3cLLwbsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839163;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=jrOuKOLefBDbQrIDmzKsRBbnEiDduXnoZh5j36Brwn8=;
	b=uOx3DoJ6BxQyXJiUkh9OekNCG0DT55Kh5x8V6il2tizYxOT1wJI4CPsi2g0TshZ9hXzP
	 bHES3j89VXNw7ln3cbp/RYz5X1HrepBp1XB2B52MFHXheNZhDG4pV6IqEcnr7LPnwKagN
	 BTaifpb7tjHloaJXVzv/NtmOJd1lTuQAXBvkNNKH82fwHfRDfjCm/51Z83dMNSH46lDnt
	 6j7xW5s3ji3kCM3y4Z2uHVW2tu2yxcVTfNiuAo7giC85vjtdACjr4Jr4zhTWGD2/23oVm
	 LhisLT7k92Lh134Hj87VCclypaScDSBezIt2uts4i1P7oQE5unZaUHAp7nW8gw2POxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=PcfieQM2;
	arc=none smtp.remote-ip=109.224.244.121
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0755A606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0755A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=PcfieQM2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794839161; x=1795098361;
	bh=jrOuKOLefBDbQrIDmzKsRBbnEiDduXnoZh5j36Brwn8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PcfieQM2a2ox1vJm8UFb2VFkpKoO/bSNiMm2xOKVCvUJOk12mfGUVupxTV3+GSxxG
	 bGPI1FOrDGkqm6cH8athGzYaqCcBbCqAW5T6xUzaYP1nEPZUX7vGqzkAT+oIPGbavv
	 ttjBQjcKPQG8LmSKeHpjmt7lkwEVxpsA0PRBwooCDeJCnz0VDUrR+49tsbyKPX4Npf
	 piJQLwdAEZrf5f4eqU+ecQPPGTms5WMTfz7dZ+fxMoKQOFp5xSPAZ+L6YF8ol0gQok
	 ZUS/iBv7JDB76XCjYmnmAKpil9aESbRwoOXUY+TM/Bold42yO2zfWEQ0tGbNKhrqqg
	 m/UNjkHlLMN4A==
Date: Mon, 16 Nov 2026 14:25:56 +0000
To: tiwai@suse.de, Devin Christensen <dchristensen8@proton.me>
From: Devin Christensen <dchristensen8@proton.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, rafael@gexdigital.net
Subject: [PATCH 1/2] ALSA: hda/ca0132: Fix AE-5 LED strip color corruption during animation
Message-ID: <20261116142542.4178770-2-dchristensen8@proton.me>
In-Reply-To: <20261116142542.4178770-1-dchristensen8@proton.me>
References: <20261116140237.4137662-1-dchristensen8@proton.me> <87qzgkyi5l.wl-tiwai@suse.de> <20261116142542.4178770-1-dchristensen8@proton.me>
Feedback-ID: 45895322:user:proton
X-Pm-Message-ID: df78f766fba91100cc1f6188520b64dfa2f5317d
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

In ae5_strip_send_frame(), formatting repeating frame cycles across the
32 KB DMA buffer combined with stopping the HDA stream after an arbitrary
15-20 ms delay causes transmissions to be cut off mid-frame / mid-byte.

WS2812 shift registers latch on signal low (>50 us), so terminating
mid-byte leaves partial bits in the registers, shifting color channel
alignments (e.g. blue/white shifting to green/purple/red) on subsequent
frames.

Fix this by populating exactly one WS2812 frame followed by the reset gap
and zero-filling the remainder of the 32 KB buffer. Reduce usleep_range
to 8-10 ms, which guarantees the frame has completed and the stream
terminates cleanly during trailing silence without truncating active LED
data.

Fixes: c3e35f355fad ("ALSA: hda/ca0132: Add Sound BlasterX AE-5 external RG=
B LED strip support")
Signed-off-by: Devin Christensen <dchristensen8@proton.me>
---
 sound/hda/codecs/ca0132.c | 54 +++++++++++++++------------------------
 1 file changed, 20 insertions(+), 34 deletions(-)

diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
index b3e768be8..b127fe50f 100644
--- a/sound/hda/codecs/ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -8421,8 +8421,6 @@ static int ae5_strip_send_frame(struct hda_codec *cod=
ec, const u32 *grb_colors,
 =09=09u32 ser_base[4], ser_clk[4], ser_out[4];
 =09} saved;
 =09__le32 *dst;
-=09int word_idx =3D 0;
-=09int frame_words;
 =09int led, w, i;
 =09int retries =3D 20; /* ~100ms max */
=20
@@ -8470,38 +8468,25 @@ static int ae5_strip_send_frame(struct hda_codec *c=
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
@@ -8572,12 +8557,13 @@ static int ae5_strip_send_frame(struct hda_codec *c=
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
--=20
2.56.0


