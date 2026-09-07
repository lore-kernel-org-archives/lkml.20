Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5C8412280;
	Mon,  7 Sep 2026 19:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809719; cv=pass; b=ZeqobcmOm8t5MrVrUGuTXw7QYjyJfbfIjv5GIEHVrPqZITkawDcX/a1wt5Y20+/qGEw4LRuEG4vhvjXCHGSabXWN3+n8M0MB2QF9rkrALncgKMV91gLeeYYfwgErxwdeEOOwwigm10Nz1rZSRgHaxiIatJiGcjmdA9D3FIzVEtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809719; c=relaxed/simple;
	bh=4Y8sx3ONZ3zL53OtxcsBEjCKaLvK0necxZ6DWhdZt7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SnpNMeQc7qyRrp0HoFumnpHqED+JLxKms8EoxlKb030qbNHFL6797LIE9hdwe3TlaujX7F/MKSp6N92/9OhwGo1rc85JeHWYhOd2pfdZcj2rEMp2UY7L59U1E2uh4CfMAe/xQakofwyRohwNJuiwnV3LQajp0LJiFi/7PEXP04U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=W/B7zC+l; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="W/B7zC+l"
ARC-Seal: i=1; a=rsa-sha256; t=1788809698; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c7FxL89vbCVHjrsYKcMiJ7t4cmhq+ZneHwhzqxWT3t/1D/B03bBs6Fk6BPAODfrTqmaOxXFkrP+CQ3x6TtQii9drdWeMl/IMD5ftvE4qc4Gd8bexL5rizTY2DWdgqOy97AolXGewc4mpY03x0L4cBQwdXSuNb2i20dsWMbCcQeQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788809698; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=u/qHrBdVk/gn+RbDm+CHmVxzRHl6sCOs8xPOskDG3ok=; 
	b=lRQiDdFgBXhtBOMHh8WLK+8eUIc2StPBFE2IdxWvi/IHnz7Smp7MQpEMUxFsIbweSVCI5PgPQvRwljaFG+RSY2Wu3U7H2U3M363cOZ9No6yTvt0ZQhX1xgq9MS7aBsWOyMti8WhZmi9MUHvmaLtacKcr8UivHQSCju4+oNkAIpA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788809698;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=u/qHrBdVk/gn+RbDm+CHmVxzRHl6sCOs8xPOskDG3ok=;
	b=W/B7zC+l/WO2WGW00v2CWsFRYY6/enbm6X/3s0dtaZHvPD02fUr4pNhlCC3dyx8J
	ZT3bExEAeqoBSBhNRQ9Iy174qqQNp8e3IYqBaK+kMsLh5BhZXhYFGtJx6jSGzo7YUbX
	VP8PfpZOEJ51e4ZmNKCPdUuJ8eHXXCZAZ5ep8vSsNoEr4DI/MdaXX/j/FlwGY/sQlf7
	N3zBBNs5RoJvX7XJ+Z2t76kzkF/Y+Uk44HddsfxUQssMPH5q99kYFgoZIeR4/cAT5Tm
	GG4XiWUK3UZ9ydiuaRLG79/XlNS7wVat/GLir9NcK+molKrj0pGVXLxIRFmw3KZVay+
	Go4rTOMhNA==
Received: by mx.zohomail.com with SMTPS id 1788809695443853.7795859537737;
	Mon, 7 Sep 2026 12:34:55 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Tue, 08 Sep 2026 03:34:40 +0800
Subject: [PATCH 2/2] ALSA: usb-audio: Add quirks for HP Elite x3 Lap Dock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-uac-hp-elite-x3-lap-dock-v1-2-e226cfe4038e@rong.moe>
References: <20260908-uac-hp-elite-x3-lap-dock-v1-0-e226cfe4038e@rong.moe>
In-Reply-To: <20260908-uac-hp-elite-x3-lap-dock-v1-0-e226cfe4038e@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
X-ZohoMailClient: External

The HP Elite x3 Lap Dock is a laptop-like external display device with a
FHD screen, a keyboard, and a MT touchpad. It can be connected via USB-C
or Miracast. As an e-waste collector, I recently brought one for 69 CNY
(10.2 USD). The price already indicates how broken the device's design
and compatibility are ;-P

When connecting via USB-C, the video source is, of course, DisplayPort
Alternate Mode. However, the audio source has nothing to do with the
DisplayPort signal and is actually from a builtin UAC device.

The builtin UAC device provides three Alternate Settings:

- 1:1 - Capture, S16_LE, 8000/32000/44100/48000Hz
- 2:1 - Playback, S16_LE, 48000Hz
- 2:2 - Playback, S24_3LE, 48000Hz

Unfortunately, the last one is broken because:

- it doesn't accept SET_CUR(SAMPLE_RATE). QUIRK_FLAG_FIXED_RATE works
  around it, however...
- it constantly produces severe harmonic distortion once the capture
  stream is also opened. The interface 2 must be closed and reopened to
  make it recover. IOW, simply closing the capture stream makes no
  difference.

Considering that S24_3LE offers no additional benefit on small speakers
compared to S16_LE, and 2:1 is always usable as an alternative, skip 2:2
to get rid of the trouble.

Setting chip->setup to any non-default value disables the fixup and
reenables 2:2 (in this case QUIRK_FLAG_FIXED_RATE is required).

Quirky device sample:

  usb 7-1.4: new full-speed USB device number 50 using xhci_hcd
  usb 7-1.4: New USB device found, idVendor=03f0, idProduct=0c56, bcdDevice= 0.00
  usb 7-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
  usb 7-1.4: Product: HP Elite x3 Lap Dock
  usb 7-1.4: Manufacturer: HP
  usb 7-1.4: Found last interface = 0
  usb 7-1.4: 1:1: add audio endpoint 0x81
  usb 7-1.4: Creating new data endpoint #81
  usb 7-1.4: 1:1 Set sample rate 48000, clock 0
  usb 7-1.4: 2:1: add audio endpoint 0x1
  usb 7-1.4: Creating new data endpoint #1
  usb 7-1.4: 2:1 Set sample rate 48000, clock 0
  usb 7-1.4: 2:2: add audio endpoint 0x1
  usb 7-1.4: 2:2 Set sample rate 48000, clock 0
  usb 7-1.4: 2:2: cannot set freq 48000 to ep 0x1
  usb 7-1.4: [9] FU [Sidetone Playback Switch] ch = 1, val = 0/1/1
  usb 7-1.4: cannot set ctl value: req = 0x4, wValue = 0x200, wIndex = 0x900, type = 4, data = 0x40/0x0
  usb 7-1.4: [9] FU [Sidetone Playback Volume] ch = 1, val = -17664/0/128
  usb 7-1.4: [2] FU [Headset Playback Switch] ch = 1, val = 0/1/1
  usb 7-1.4: [2] FU [Headset Playback Volume] ch = 2, val = -18944/0/1
  usb 7-1.4: [6] FU [Headset Capture Switch] ch = 1, val = 0/1/1
  usb 7-1.4: [6] FU [Headset Capture Volume] ch = 2, val = -18944/0/1
  input: HP HP Elite x3 Lap Dock Consumer Control as /devices/pci0000:00/0000:00:08.3/0000:c9:00.4/usb7/7-1/7-1.4/7-1.4:1.3/0003:03F0:0C56.0033/input/input129
  input: HP HP Elite x3 Lap Dock as /devices/pci0000:00/0000:00:08.3/0000:c9:00.4/usb7/7-1/7-1.4/7-1.4:1.3/0003:03F0:0C56.0033/input/input130
  hid-generic 0003:03F0:0C56.0033: input,hiddev100,hidraw8: USB HID v1.11 Device [HP HP Elite x3 Lap Dock] on usb-0000:c9:00.4-1.4/input3

Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/quirks.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 6e4808330a80..6462b8390106 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1585,11 +1585,47 @@ static int s1810c_skip_setting_quirk(struct snd_usb_audio *chip,
 	return 0;
 }
 
+static int hp_elite_x3_lap_dock_skip_setting_quirk(struct snd_usb_audio *chip,
+						   int iface, int altno)
+{
+	/*
+	 * 1:1 - Capture, S16_LE, 8000/32000/44100/48000Hz
+	 * 2:1 - Playback, S16_LE, 48000Hz
+	 * 2:2 - Playback, S24_3LE, 48000Hz
+	 *
+	 * 2:2 is broken because:
+	 * - it doesn't accept SET_CUR(SAMPLE_RATE). QUIRK_FLAG_FIXED_RATE works
+	 *   around it, however...
+	 * - it constantly produces severe harmonic distortion once the capture
+	 *   stream is also opened. The interface 2 must be closed and reopened
+	 *   to make it recover. IOW, simply closing the capture stream makes no
+	 *   difference.
+	 *
+	 * Considering that S24_3LE offers no additional benefit on small
+	 * speakers compared to S16_LE, and 2:1 is always usable as an
+	 * alternative, skip 2:2 to get rid of the trouble.
+	 *
+	 * Setting chip->setup to any non-default value disables the fixup and
+	 * reenables 2:2 (in this case QUIRK_FLAG_FIXED_RATE is required).
+	 */
+	if (!chip->setup && iface == 2 && altno == 2) {
+		usb_audio_info(chip,
+			       "%d:%d: skipping broken altsetting on HP Elite x3 Lap Dock\n",
+			       iface, altno);
+		return 1;
+	}
+
+	return 0;
+}
+
 int snd_usb_apply_interface_quirk(struct snd_usb_audio *chip,
 				  int iface,
 				  int altno)
 {
 	switch (chip->usb_id) {
+	/* HP Elite x3 Lap Dock: skip broken altsets */
+	case USB_ID(0x03f0, 0x0c56):
+		return hp_elite_x3_lap_dock_skip_setting_quirk(chip, iface, altno);
 	/* quattro usb: skip altsets incompatible with device_setup */
 	case USB_ID(0x0763, 0x2001):
 		return quattro_skip_setting_quirk(chip, iface, altno);
@@ -2215,6 +2251,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x0124, 0x0c21, /* Generic USB Headphone */
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
+	DEVICE_FLG(0x03f0, 0x0c56, /* HP Elite x3 Lap Dock */
+		   QUIRK_FLAG_FIXED_RATE),
 	DEVICE_FLG(0x03f0, 0x654a, /* HP 320 FHD Webcam */
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
 	DEVICE_FLG(0x041e, 0x3000, /* Creative SB Extigy */

-- 
2.55.0

