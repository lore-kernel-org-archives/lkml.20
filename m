Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792441168;
	b=VuZCYyopzlVR4xnv21JKTn+qTXhalKc/P8tATs/nkmDGoCcQLwmCAgVefXYPuf0RXjxk
	 kmm8F9oXUJe7QAHi0+Fhy+GE+insunrnX3b+cxRYaT3Mn+8Rhe4pIKe+R4UGsLJenvU2i
	 y+4/s5ekYu43UDiWJEVAkEfd7nhY+BDMmzQ18aRJJvTEnoozQigJNkV4vfTeq7fvJzFSa
	 uVcj0nSawxz7DMfGf22O/xSkOGzZepgicVAKlQYhgi3hE4WSl79U6Prsqc1EXUHjM2jTJ
	 gRt+BsL67nuohxGFOU9OcdOqFbMG8QkNALwxJ3rN9fp5zsgNFfHBCLuspklNCnjDSFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441168;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=LTdVgoSITfVsfZdWSZPA0V20iiS+iFwD6Q/7o3LP7eg=;
	b=z4yWXnS/5FrjHLEiZnflaJt44arqWuCb8pzEQUbxntF9ZNdjLkaHaU1yt3+NAk+MrzP5
	 vxhr1kvHKgDQiFQUn8pUo3dNaJynsEJMmPJ51EtMkQYh6FDuRfLhzQjovuP3E+fYA2g99
	 +2PzNOf1yJ/YUMXRXWNiBT/Sl+cKOx2TYvnY2BT9HT7u11Ba5bfu/rL/8M46ReEd1O2WU
	 0ku4toNHGLOVnCgxlmoqXPudbKySHLFRgjv6GEJZz1A/IKIaWrYto+z3kDTsYJUSUrYeZ
	 Nfz+DWqltbcZoo6ftONGo9ec7STDUQ2VJ0ZqQSASjlOlcc21k5tvQYp6SKNyU4RVBnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=BPP1iqzr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA6E606A31D;
	Mon, 19 Oct 2026 20:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AA6E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=BPP1iqzr
ARC-Seal: i=1; a=rsa-sha256; t=1792441127; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CBtJjlpUmj0H90LZ84cPQcllnZNp+0k/XQOQm9T+aeDK8Ye9E/+q1hLquMjZqCHR2ZEOhMBWy52GoT2rqtNxeIyr/EiXnLg7RMl2ezNBuMky6TLFCHNN0TJyuFm9sKqwrjLfvpf68d7Y6HeVLtWQINHEM/gU1JOoiRObN79ASgc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792441127; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LTdVgoSITfVsfZdWSZPA0V20iiS+iFwD6Q/7o3LP7eg=; 
	b=YHrozDd67KFw+QcGVcoTSliW8zKq04omrjNV81fcHnOrAAwBdOt5m6twxjgIaB8GhDrPQygPYssCme2ZAuazOWk4S1Xr/cyC+4hvo4USgF993xznTva0pl6+ZrebuStLR3GRhU3QCKS5GQLusU/WzWP7/4dz5O1RiPssxs+h1U4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792441127;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=LTdVgoSITfVsfZdWSZPA0V20iiS+iFwD6Q/7o3LP7eg=;
	b=BPP1iqzrJBWDyqG8EGtlmqDQj58sUFJ+ygUtFEEQLwAiFDjLQMH98OW4VwVhxHhj
	4quzNddG3YtWCkU8AtJG/B+T5GVLxFzdxHnoWLX8uWeVCumM2ChtmIM+c1u2ytplE8r
	Yf5GroJX7YWicEceHlyTepZ1kMjPNFIkse3GHrHPCuWKOJtogj4SL2/Te1UNFTA4VZ9
	UnLobaUnGDoJzrWY6q/23g/8UzXQinZGDcruwjuNzm+Mi6HkSkndxG2QMlRTQQgJ0BA
	XgEAaobBfxpCflHwWERcirfJrdsd6g5JJc3EEYsl8Mv2GUlDicIDcj+XZEfnHV62yJt
	E+sroRwrrQ==
Received: by smtp.zohomail.com with SMTPS id 1792441124511640.9708389218838;
	Mon, 19 Oct 2026 13:18:44 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Tue, 20 Oct 2026 04:18:24 +0800
Subject: [PATCH 3/4] ALSA: usb-audio: Add dB scale quirk for an AB13X
 variant
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-b4-uac-ya-audio-v1-3-2d6e053b7f50@rong.moe>
References: <20261020-b4-uac-ya-audio-v1-0-2d6e053b7f50@rong.moe>
In-Reply-To: <20261020-b4-uac-ya-audio-v1-0-2d6e053b7f50@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.de>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-6be7c
X-ZohoMailClient: External

I recently got an AB13X variant with insane volume control, so I tried
to measure its volume mapping @ 1000Hz:

+--------+--------+-----------+---------+----------+--------+
|  hex   |  dec   | dec => dB | mVrms * | mV => dB |  res   |
+--------+--------+-----------+---------+----------+--------+
| 0xd300 | -11520 |    -45.00 |         |          |        |
| 0xdb5a |  -9382 |    -36.65 |   1.285 |   -26.68 | 2138 # |
| 0xe2d0 |  -7472 |    -29.19 |   4.104 |   -21.63 | 1910 # |
| 0xe7cc |  -6196 |    -24.20 |  13.693 |   -16.40 | 1276 # |
| 0xeb8c |  -5236 |    -20.45 |  26.71  |   -13.50 |  960   |
| 0xee8d |  -4467 |    -17.45 |  42.29  |   -11.50 |  769   |
| 0xf10e |  -3826 |    -14.95 |  66.81  |    -9.52 |  641   |
| 0xf335 |  -3275 |    -12.79 |  94.43  |    -8.01 |  551   |
| 0xf517 |  -2793 |    -10.91 | 133.25  |    -6.52 |  482   |
| 0xf6c5 |  -2363 |     -9.23 | 168.73  |    -5.49 |  430   |
| 0xf847 |  -1977 |     -7.72 | 212.05  |    -4.50 |  386   |
| 0xf9a7 |  -1625 |     -6.35 | 267.1   |    -3.50 |  352   |
| 0xfae9 |  -1303 |     -5.09 | 336.3   |    -2.50 |  322   |
| 0xfc13 |  -1005 |     -3.93 | 377.4   |    -2.00 |  298   |
| 0xfd27 |   -729 |     -2.85 | 423.6   |    -1.50 |  276   |
| 0xfe29 |   -471 |     -1.84 | 475.3   |    -1.00 |  258   |
| 0xff69 |   -151 |     -0.59 | 533.1   |    -0.50 |  320   |
| 0x0000 |      0 |      0.00 | 597.7   |     0.00 |  151   |
+--------+--------+-----------+---------+----------+--------+

Footnote *: measured through a power amplifier's loopback line out
to ensure high input impedance (see #). The raw voltage at 0x0000
without going through a power amplifier is 677mVrms.

Footnote #: low output power. Even the impedance of a multimeter is
too low, causing a massive voltage drop (-10dB!), which means that
they are inaudible when connected to earphones. Do not expose them.

The volume control mixer has uneven resolutions in reality. Setting any
value between [0xd300, 0xdb5a] results in the same audible volume as
0xdb5a, (0xdb5a, 0xe2d0] results in the same audible volume as 0xe2d0,
and so on. The read back value always acts like res == 1.

Carefully overrides cval->{min,max,res} so that volume steps with
0.5dB or 1.0dB resolution can be approximately represented togother.
With that, we can expose a 19-step TLV range mapping with 7 items.

The capture mixer is also quirky and requires linear volume.

The AB13X seems to have a lot of variants, probably because it's a OEM
product. I believe mine is one of them considering that its idVendor,
idProduct, Manufacturer and SerialNumber are the same as the original
AB13X. Only the Product string differs.

Both quirks are applied only when the mixer values match the seen ones,
so that they won't be accidentally applied on unaffected variants.

Quirky device sample:

  usb 7-1: new full-speed USB device number 2 using xhci_hcd
  usb 7-1: not running at top speed; connect to a high speed hub
  usb 7-1: New USB device found, idVendor=001f, idProduct=0b21, bcdDevice= 1.00
  usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 7-1: Product: YA USB Audio
  usb 7-1: Manufacturer: Generic
  usb 7-1: SerialNumber: 20210726905926
  usb 7-1: From builtin table apply quirk flag IFACE_DELAY for device 001f:0b21
  usb 7-1: From builtin table apply quirk flag FORCE_IFACE_RESET for device 001f:0b21
  usb 7-1: Found last interface = 0
  usb 7-1: 1:1: add audio endpoint 0x3
  usb 7-1: Creating new data endpoint #3
  usb 7-1: 1:1 Set sample rate 48000, clock 0
  usb 7-1: 2:1: add audio endpoint 0x83
  usb 7-1: Creating new data endpoint #83
  usb 7-1: 2:1 Set sample rate 48000, clock 0
  usb 7-1: [2] FU [PCM Playback Switch] ch = 1, val = 0/1/1
  usb 7-1: [2] FU [PCM Playback Volume] ch = 1, val = -11520/0/1
  usb 7-1: [5] FU [Mic Capture Switch] ch = 1, val = 0/1/1
  usb 7-1: Warning! Unlikely big volume step count (=8191), linear volume or wrong cval->res?
  usb 7-1: [5] FU [Mic Capture Volume] ch = 1, val = 0/8191/1
  input: Generic YA USB Audio as /devices/pci0000:00/0000:00:08.3/0000:67:00.4/usb7/7-1/7-1:1.3/0003:001F:0B21.000F/input/input41
  hid-generic 0003:001F:0B21.000F: input,hidraw12: USB HID v2.01 Device [Generic YA USB Audio] on usb-0000:67:00.4-1/input3

Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/mixer_quirks.c | 99 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 7e2cfb176348..6cdd3ee94d66 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4682,6 +4682,26 @@ static void snd_usb_apply_db_scale(struct usb_mixer_interface *mixer,
 	kctl->vd[0].access &= ~SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK;
 }
 
+static void snd_usb_apply_db_scale_val(struct usb_mixer_interface *mixer,
+				       struct usb_mixer_elem_info *cval, struct snd_kcontrol *kctl,
+				       const unsigned int *scale, const char *desc,
+				       int min, int max, int res)
+{
+	snd_usb_apply_db_scale(mixer, cval, kctl, scale, desc);
+
+	usb_audio_info(mixer->chip,
+		       "overriding [%s] val (%d/%d/%d => %d/%d/%d) to fit %s dB scale quirk\n",
+		       kctl->id.name, cval->min, cval->max, cval->res, min, max, res, desc);
+
+	/*
+	 * We are not fixing the cached values, as get_relative_value() will
+	 * ensure userspace always sees compliant ones.
+	 */
+	cval->min = min;
+	cval->max = max;
+	cval->res = res;
+}
+
 static void snd_usb_mixer_fu_quirk_linear_scale(struct usb_mixer_interface *mixer,
 						struct usb_mixer_elem_info *cval,
 						struct snd_kcontrol *kctl)
@@ -4745,6 +4765,81 @@ static void snd_dragonfly_quirk_db_scale(struct usb_mixer_interface *mixer,
 	}
 }
 
+static void snd_ab13x_quirks(struct usb_mixer_interface *mixer, struct usb_mixer_elem_info *cval,
+			     struct snd_kcontrol *kctl)
+{
+	/*
+	 * Volume mapping based on voltage level measurement @ 1000Hz:
+	 * +--------+--------+-----------+---------+----------+--------+
+	 * |  hex   |  dec   | dec => dB | mVrms * | mV => dB |  res   |
+	 * +--------+--------+-----------+---------+----------+--------+
+	 * | 0xd300 | -11520 |    -45.00 |         |          |        |
+	 * | 0xdb5a |  -9382 |    -36.65 |   1.285 |   -26.68 | 2138 # |
+	 * | 0xe2d0 |  -7472 |    -29.19 |   4.104 |   -21.63 | 1910 # |
+	 * | 0xe7cc |  -6196 |    -24.20 |  13.693 |   -16.40 | 1276 # |
+	 * | 0xeb8c |  -5236 |    -20.45 |  26.71  |   -13.50 |  960   |
+	 * | 0xee8d |  -4467 |    -17.45 |  42.29  |   -11.50 |  769   |
+	 * | 0xf10e |  -3826 |    -14.95 |  66.81  |    -9.52 |  641   |
+	 * | 0xf335 |  -3275 |    -12.79 |  94.43  |    -8.01 |  551   |
+	 * | 0xf517 |  -2793 |    -10.91 | 133.25  |    -6.52 |  482   |
+	 * | 0xf6c5 |  -2363 |     -9.23 | 168.73  |    -5.49 |  430   |
+	 * | 0xf847 |  -1977 |     -7.72 | 212.05  |    -4.50 |  386   |
+	 * | 0xf9a7 |  -1625 |     -6.35 | 267.1   |    -3.50 |  352   |
+	 * | 0xfae9 |  -1303 |     -5.09 | 336.3   |    -2.50 |  322   |
+	 * | 0xfc13 |  -1005 |     -3.93 | 377.4   |    -2.00 |  298   |
+	 * | 0xfd27 |   -729 |     -2.85 | 423.6   |    -1.50 |  276   |
+	 * | 0xfe29 |   -471 |     -1.84 | 475.3   |    -1.00 |  258   |
+	 * | 0xff69 |   -151 |     -0.59 | 533.1   |    -0.50 |  320   |
+	 * | 0x0000 |      0 |      0.00 | 597.7   |     0.00 |  151   |
+	 * +--------+--------+-----------+---------+----------+--------+
+	 *
+	 * Footnote *: measured through a power amplifier's loopback line out
+	 * to ensure high input impedance (see #). The raw voltage at 0x0000
+	 * without going through a power amplifier is 677mVrms.
+	 *
+	 * Footnote #: low output power. Even the impedance of a multimeter is
+	 * too low, causing a massive voltage drop (-10dB!), which means that
+	 * they are inaudible when connected to earphones. Do not expose them.
+	 *
+	 * The volume control mixer has uneven resolutions in reality. Setting
+	 * any value between [0xd300, 0xdb5a] results in the same audible volume
+	 * as 0xdb5a, (0xdb5a, 0xe2d0] results in the same audible volume as
+	 * 0xe2d0, and so on. The read back value always acts like res == 1.
+	 */
+	static const DECLARE_TLV_DB_RANGE(scale,
+		 0,  0, TLV_DB_SCALE_ITEM(-1350, 0, 0), /*                             -5500 */
+		 1,  3, TLV_DB_SCALE_ITEM(-1150, 0, 0), /*               -5200, -4900, -4600 */
+		 4,  5, TLV_DB_SCALE_ITEM( -952, 0, 0), /*                      -4300, -4000 */
+		 6,  7, TLV_DB_SCALE_ITEM( -801, 0, 0), /*                      -3700, -3400 */
+		 8,  9, TLV_DB_SCALE_ITEM( -652, 0, 0), /*                      -3100, -2800 */
+		10, 13, TLV_DB_MINMAX_ITEM(-550, -250), /*        -2500, -2200, -1900, -1600 */
+		14, 18, TLV_DB_MINMAX_ITEM(-200,    0), /* -1300, -1000,  -700,  -400,  -100 */
+	);
+
+	if (cval->min == -11520 && cval->max == 0 && cval->res == 1) {
+		if (!deconflict_playback_tlv_quirks(mixer, kctl))
+			return;
+
+		/*
+		 * These values are carefully chosen so that volume steps with
+		 * 0.5dB or 1.0dB resolution can be approximately represented
+		 * togother.
+		 *
+		 * It's literally a miracle that these values can flawlessly
+		 * align to 100.
+		 */
+		snd_usb_apply_db_scale_val(mixer, cval, kctl, scale, "AB13X", -5500, -100, 300);
+	} else if (cval->min == 0 && cval->max == 8191 && cval->res == 1) {
+		/* The final effects will be printed later. */
+		usb_audio_info(mixer->chip, "applying AB13X Capture quirk (0/8191/1 variant)\n");
+
+		if (deconflict_capture_tlv_quirks(mixer, kctl))
+			snd_usb_mixer_fu_quirk_linear_scale(mixer, cval, kctl);
+	} else {
+		usb_audio_dbg(mixer->chip, "not applying AB13X quirk on unknown variant\n");
+	}
+}
+
 static void snd_usb_mv_silicon_quirks(struct usb_mixer_interface *mixer,
 				      struct usb_mixer_elem_info *cval,
 				      struct snd_kcontrol *kctl)
@@ -4812,6 +4907,10 @@ void snd_usb_mixer_fu_apply_quirk(struct usb_mixer_interface *mixer,
 				  struct snd_kcontrol *kctl)
 {
 	switch (mixer->chip->usb_id) {
+	case USB_ID(0x001f, 0x0b21): /* AB13X Headset Adapter */
+		if (cval->control == UAC_FU_VOLUME)
+			snd_ab13x_quirks(mixer, cval, kctl);
+		break;
 	case USB_ID(0x21b4, 0x0081): /* AudioQuest DragonFly */
 		if (unitid == 7 && cval->control == UAC_FU_VOLUME)
 			snd_dragonfly_quirk_db_scale(mixer, cval, kctl);

-- 
2.55.0

