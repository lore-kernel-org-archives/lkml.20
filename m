Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792441178;
	b=pjykvD7r1jg9MPMKH02PmRkEuxH4KQGs9jvRycCJPuGr7p1/2pPv2opxBuuegC2Tq2RB
	 x3FbD4s3V7jAhoRL9duH9h8l8rAxmEC9aoccywCXal+Lt5WhXc18ZsTbFn2J7PCX1t7e/
	 zslb00k2jXyfapXlS8GfYucLjm1wRv7KZ5NjQL4VBdHCgPqGj4DmlhXysA5L9dy8uw6wM
	 RJGktV4gWXZy39HcRPNu1MnzMXuA4XPnXDVVf1TNruzMKwfOAZPq/kfnH/eY3zuqyzZ4Q
	 E1H1PmmQLTbG9qJMdeXFFVrZHnJB43q4QhrSol/58Gawhe8pyEJnUM3129NO8Cm+X9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441178;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=LYDN74urPhus1FTjqWgUFcGEsxt5OFWS2saapF699WY=;
	b=HwTv7xdoic435pXEy8qeyVe9/dS/HmOIp9FAaB7qBUYMliATjiUZa4gHK4U+jGYPvDQA
	 9WR25iRr9GuI42a1zARATt89Gc6zSqEmrhS8Vd8icacgRPvedkYvlYPKgkL2ppsW6XBTI
	 eobU1j6Id0gRYjkjaD4WcuzPd0CmE7KSWaiDKQdS/sqUb8x9NwiPfiXiQTHUxW9JdMcyw
	 6Of1NL0ziz9sE3BF1coYkkpPGFhD0iQ0tZ+m+g2cy0XrQmrzEyg972YtxLA8WY8XOLIuC
	 sAb/lyYKwudE5mIr0UVaJe34ujBDEKT88c4hH4lp3Ovjic5Bff8fy5QUyxLvaN6KrnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=SEP2732e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF0B606A31D;
	Mon, 19 Oct 2026 20:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CF0B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=SEP2732e
ARC-Seal: i=1; a=rsa-sha256; t=1792441129; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V+KXXAK2wtwKdm3j9Jo2Opems9p57moBvt+uOOkDxnnsUpkd0w/zAQO6Qxh+O5hAzfs/2VCIppJ1TNmIAAf2mEswLCQlWHpSf+k8bI0dkUe988RgqD7N+TqTy0zMklkB9XYqvAmm6ZdaTlWIHaB8kAFU/JnZrbl4s9G/w2b/gY0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792441129; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LYDN74urPhus1FTjqWgUFcGEsxt5OFWS2saapF699WY=; 
	b=LMqOvhHONvQL+i/3evVQwd/6SUWjoU4JLne5MPkVpkp41P68A2aKBy11u4U5G4dFeB8Ye27KwYHO50MS1YFaZyWr92/BjMxHy+Yz1+RNxxpy6LxMLJ+HSSBIrWLTBzZ/tfVcGM8ereJCv6VcTUp+MkSSkg96UiEiV0DUwuAVawo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792441129;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=LYDN74urPhus1FTjqWgUFcGEsxt5OFWS2saapF699WY=;
	b=SEP2732ezftDsN46zEcccxoBz5z5YujftcYXDLOP/VCZ3a8fqY+2hqsGQBPyfR+I
	sXw20n7BncGilvmOVlP37yyIFQSMymHIQUNf8VdXwpqMA5bwlKwVq6nJF9X2WIcIsMr
	3nHAzZtJF6dHE4nP2SQ0IX+ff/a7Fn9UBckDqNHjM0zWUhex6ERfvcDmOFSyHjTiTtM
	pxzlsTiV6Zwf/zrifP2Jqcq/6IhuqjZSPPaFd50+bS2cVVrEAXzIuR/JBDbp15YG8Qw
	7y0TE7CAejqKJ4dvKjSHkeMHIJYIs1NBHZJtdPoU7/W+L+wzHsDVWR1RphqAee4kXbu
	U6MvczbQNw==
Received: by smtp.zohomail.com with SMTPS id 1792441126468940.8600773455743;
	Mon, 19 Oct 2026 13:18:46 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Tue, 20 Oct 2026 04:18:25 +0800
Subject: [PATCH 4/4] ALSA: usb-audio: Add dB scale quirk for Xiaomi Speaker
 Mini
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
Message-Id: <20261020-b4-uac-ya-audio-v1-4-2d6e053b7f50@rong.moe>
References: <20261020-b4-uac-ya-audio-v1-0-2d6e053b7f50@rong.moe>
In-Reply-To: <20261020-b4-uac-ya-audio-v1-0-2d6e053b7f50@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.de>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-6be7c
X-ZohoMailClient: External

I recently brought an Xiaomi Speaker Mini (USB Product string, marketing
name: Xiaomi Bluetooth Speaker Mini), which is never advertised as UAC
capable.

By chance, I connected it to my PC, and a UAC device showed up.
Unsurprisingly, it's yet another device with insane volume control, so I
tried to measure its volume mapping @ 1000Hz with a microphone:

+--------+--------+-----------+-------------+--------+
|  hex   |  dec   | dec => dB | measured dB |  res   |
+--------+--------+-----------+-------------+--------+
| 0xd000 | -12288 |    -48.00 |      (mute) |        |
| 0xdd00 |  -8960 |    -35.00 |       -68.6 | 3328 # |
| 0xe540 |  -6848 |    -26.75 |       -61.2 | 2112   |
| 0xea40 |  -5568 |    -21.75 |       -57.0 | 1280   |
| 0xed80 |  -4736 |    -18.50 |       -52.5 |  832   |
| 0xf0a0 |  -3936 |    -15.38 |       -48.3 |  800   |
| 0xf2d0 |  -3376 |    -13.19 |       -42.1 |  560   |
| 0xf4d0 |  -2864 |    -11.19 |       -36.1 |  512   |
| 0xf6c0 |  -2368 |     -9.25 |       -32.0 |  496   |
| 0xf840 |  -1984 |     -7.75 |       -24.0 |  384   |
| 0xf9e0 |  -1568 |     -6.13 |       -17.9 |  416   |
| 0xfb30 |  -1232 |     -4.81 |       -13.9 |  336   |
| 0xfc80 |   -896 |     -3.50 |       -10.0 |  336   |
| 0xfd90 |   -624 |     -2.44 |        -6.0 |  272   |
| 0xfeb0 |   -336 |     -1.31 |        -4.0 |  288   |
| 0xffb0 |    -80 |     -0.31 |        -2.0 |  256   |
| 0x0000 |      0 |      0.00 |         0.0 |   80   |
+--------+--------+-----------+-------------+--------+

Footnote #: running out of the 10-item limit of TLV ranges. The
limitation is from alsa-lib, where MAX_TLV_RANGE_SIZE == 256 Bytes.

The volume control mixer declares res == 256, but actually acts like
res == 1 (i.e., accepts any value between min and max) and has uneven
resolutions in reality. Setting any value between (0xd000, 0xdd00]
results in the same audible volume as 0xdd00, and so on.

Carefully overrides cval->{min,max,res} so that volume steps with
2dB or 4dB resolution can be approximately represented togother.
With that, we can expose a 25-step TLV range mapping with 10 items.

The quirk is applied only when the mixer values match the seen ones,
so that it won't be accidentally applied to unseen variants.

Quirky device sample:

  usb 3-1: new full-speed USB device number 14 using xhci_hcd
  usb 3-1: New USB device found, idVendor=2717, idProduct=5096, bcdDevice= 1.00
  usb 3-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 3-1: Product: Xiaomi Speaker Mini-****
  usb 3-1: Manufacturer: bestechnic
  usb 3-1: SerialNumber: 20160406.1
  usb 3-1: Found last interface = 0
  usb 3-1: 1:1: add audio endpoint 0x3
  usb 3-1: Creating new data endpoint #3
  usb 3-1: 1:1 Set sample rate 48000, clock 0
  usb 3-1: [5] FU [PCM Playback Switch] ch = 1, val = 0/1/1
  usb 3-1: cannot set ctl value: req = 0x4, wValue = 0x200, wIndex = 0x500, type = 4, data = 0x80/0x0
  usb 3-1: [5] FU [PCM Playback Volume] ch = 1, val = -12288/0/256
  input: bestechnic Xiaomi Speaker Mini-2421 as /devices/pci0000:00/0000:00:08.3/0000:67:00.0/usb3/3-1/3-1:1.2/0003:2717:5096.002A/input/input69
  hid-generic 0003:2717:5096.002A: input,hidraw10: USB HID v1.11 Device [bestechnic Xiaomi Speaker Mini-2421] on usb-0000:67:00.0-1/input2

(**** is the last four digits of the device's serial number)

Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/mixer_quirks.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 6cdd3ee94d66..3534f6fad74b 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4840,6 +4840,71 @@ static void snd_ab13x_quirks(struct usb_mixer_interface *mixer, struct usb_mixer
 	}
 }
 
+static void snd_xiaomi_speaker_mini_quirk_db_scale(struct usb_mixer_interface *mixer,
+						   struct usb_mixer_elem_info *cval,
+						   struct snd_kcontrol *kctl)
+{
+	/*
+	 * Volume mapping based on normalized microphone measurement @ 1000Hz:
+	 * +--------+--------+-----------+-------------+--------+
+	 * |  hex   |  dec   | dec => dB | measured dB |  res   |
+	 * +--------+--------+-----------+-------------+--------+
+	 * | 0xd000 | -12288 |    -48.00 |      (mute) |        |
+	 * | 0xdd00 |  -8960 |    -35.00 |       -68.6 | 3328 # |
+	 * | 0xe540 |  -6848 |    -26.75 |       -61.2 | 2112   |
+	 * | 0xea40 |  -5568 |    -21.75 |       -57.0 | 1280   |
+	 * | 0xed80 |  -4736 |    -18.50 |       -52.5 |  832   |
+	 * | 0xf0a0 |  -3936 |    -15.38 |       -48.3 |  800   |
+	 * | 0xf2d0 |  -3376 |    -13.19 |       -42.1 |  560   |
+	 * | 0xf4d0 |  -2864 |    -11.19 |       -36.1 |  512   |
+	 * | 0xf6c0 |  -2368 |     -9.25 |       -32.0 |  496   |
+	 * | 0xf840 |  -1984 |     -7.75 |       -24.0 |  384   |
+	 * | 0xf9e0 |  -1568 |     -6.13 |       -17.9 |  416   |
+	 * | 0xfb30 |  -1232 |     -4.81 |       -13.9 |  336   |
+	 * | 0xfc80 |   -896 |     -3.50 |       -10.0 |  336   |
+	 * | 0xfd90 |   -624 |     -2.44 |        -6.0 |  272   |
+	 * | 0xfeb0 |   -336 |     -1.31 |        -4.0 |  288   |
+	 * | 0xffb0 |    -80 |     -0.31 |        -2.0 |  256   |
+	 * | 0x0000 |      0 |      0.00 |         0.0 |   80   |
+	 * +--------+--------+-----------+-------------+--------+
+	 *
+	 * The volume control mixer declares res == 256, but actually acts like
+	 * res == 1 (i.e., accepts any value between min and max) and has uneven
+	 * resolutions in reality. Setting any value between (0xd000, 0xdd00]
+	 * results in the same audible volume as 0xdd00, and so on.
+	 *
+	 * Footnote #: running out of the 10-item limit of TLV ranges.
+	 */
+	static const DECLARE_TLV_DB_RANGE(scale,
+		 0,  0, TLV_DB_SCALE_ITEM( -6120,  0, 0), /*                             -7104 */
+		 1,  5, TLV_DB_SCALE_ITEM( -5700,  0, 0), /* -6808, -6512, -6216, -5920, -5624 */
+		 6,  8, TLV_DB_SCALE_ITEM( -5250,  0, 0), /*               -5328, -5032, -4736 */
+		 9, 10, TLV_DB_SCALE_ITEM( -4830,  0, 0), /*                      -4440, -4144 */
+		11, 12, TLV_DB_SCALE_ITEM( -4210,  0, 0), /*                      -3848, -3552 */
+		13, 14, TLV_DB_SCALE_ITEM( -3610,  0, 0), /*                      -3256, -2960 */
+		15, 16, TLV_DB_SCALE_ITEM( -3200,  0, 0), /*                      -2664, -2368 */
+		17, 18, TLV_DB_MINMAX_ITEM(-2400, -1790), /*                      -2072, -1776 */
+		19, 21, TLV_DB_MINMAX_ITEM(-1390,  -600), /*               -1480, -1184,  -888 */
+		22, 24, TLV_DB_MINMAX_ITEM( -400,     0), /*                -592,  -296,     0 */
+	);
+
+	if (cval->min == -12288 && cval->max == 0 && cval->res == 256) {
+		if (!deconflict_playback_tlv_quirks(mixer, kctl))
+			return;
+
+		/*
+		 * These values are carefully chosen so that volume steps with
+		 * 2dB or 4dB resolution can be approximately represented
+		 * togother.
+		 */
+		snd_usb_apply_db_scale_val(mixer, cval, kctl, scale,
+					   "Xiaomi Speaker Mini", -7104, 0, 296);
+	} else {
+		usb_audio_dbg(mixer->chip,
+			      "not applying Xiaomi Speaker Mini quirk on unknown variant\n");
+	}
+}
+
 static void snd_usb_mv_silicon_quirks(struct usb_mixer_interface *mixer,
 				      struct usb_mixer_elem_info *cval,
 				      struct snd_kcontrol *kctl)
@@ -4915,6 +4980,10 @@ void snd_usb_mixer_fu_apply_quirk(struct usb_mixer_interface *mixer,
 		if (unitid == 7 && cval->control == UAC_FU_VOLUME)
 			snd_dragonfly_quirk_db_scale(mixer, cval, kctl);
 		break;
+	case USB_ID(0x2717, 0x5096): /* Xiaomi Speaker Mini */
+		if (cval->control == UAC_FU_VOLUME)
+			snd_xiaomi_speaker_mini_quirk_db_scale(mixer, cval, kctl);
+		break;
 	}
 
 	if (cval->control == UAC_FU_VOLUME &&

-- 
2.55.0

