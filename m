Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793752780;
	b=Wlh1czhrLKUhPiB+xah8k86HvXZUJAhHIjNgElyDIDK38Xci+aesfUD3deYEZ6x4YOgk
	 pk9AU8lgYGj54LgmeGCXVZbthP7dwQ0lmfIWVAD0hI8q/5njLdYJjB+QdiFe0C699EaFB
	 7ZFzU5h+BtcDK+mD1KEX+9eAvBQVzZwJXN1BlVnB1vwiXEuxAqwlJXaumK+qNx2Hj2vs4
	 DJnTBKivHUf1YjQUk8kxZQNynwEISB9/ECcim5ou7IJMkpLtQqmoA6LrLtC2lThsXPaMv
	 NjW/y5NIpHY1SZM4gmdHBVG5q20zIObqqoVNJh68d4v+t3gzJnLx2P0ejH+trMhaBLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793752780;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+O+pkPnJezxUbDLb9nqWUUW01sXrmpX00Gprg49lIhY=;
	b=dIp3BfYBcVC+uOv+kir1tAYT8f28oGyo4+xeYJ/1IwpM1HjYQDuZgX5y1ggGcOJ1VH9p
	 j9kVxx5g7WV/ntblslBTFpVE8g5+Q43ouaYifKlmJSOV7VCCOhW2RePo/2RAy9yW/7n1y
	 /KoILB1RcKsPFrW6Xxwo0xfDriEPsgdRoDSJZsa/p2WknEbO4zvTEVG4p5oNScIcV0UYs
	 U46dR0FkypNela9/kv/XRRh+3ADdIsU0pmsYN7D9dJuKPDywukbWwcS8JYfcc0U7mvU9l
	 24NG6IzitZUNJpIvKeTTe5h5fKh/Vw8k5TPMJlu33cPzNORObqlDJKo2/NIQzhkHIuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="UG/+EVFf";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B7F606A31B;
	Wed,  4 Nov 2026 00:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UG/+EVFf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793752779;
	b=PvtT+iyxeIaSzZiAI+mV+EYlyPoq9UyVeEhjjOBIdQG8Qc4sCVLj6v+vwJgpZ00Z6vqm
	 5P6E6d6gN0svgdfjValzzyHdYb6bWmiZSlKe8vjYHmAzBwD+0Ht+RlsQiEG6ys4U+nSFq
	 A6ke/g5vlCLYGAdqVTViTNO8T3xizqFvgTqK9vnZI68l5pkpAL1a3kaFMe049FSEgtVco
	 KRTqpoYGeEZCpk/FKhKQQ1N6k/MID9zSN+N+Pc2Z7VHaHr6dBjRar26xnmH9/CQRZiWPv
	 g6N4+m2wy8GSFDqYVR+bhDSi5Gj3bu2nkCYirhuGOCZ8MHqkKDZ1f+v+fApmQXN9X3g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793752779;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+O+pkPnJezxUbDLb9nqWUUW01sXrmpX00Gprg49lIhY=;
	b=AGULh2LhGebvoFrYVbGtvHnhNLg4RIOBuUjZn9oDFohGfLEm3cf2GOeeEawspaQmwjcz
	 pRJjqOxcv8mk+o9Nhu+VI7DrELJrI63tujPTrsvZ5xKRBv8Ek56GPuxXrKVbaIRd1KjYK
	 cO0VYBRiOXCUlolvZ9G9aKdqAbuDiJjhM6lBPrwOPfOmKOvNbWKV9D5GO0pOqfm2kfvE1
	 mP3SHCvLIoEc7MKACFEFsKfDed/MRsOKMIdc7BEYrG1e5V/r14yEdkOpm6d5LzeGVyKBk
	 qNDXh5hq43sg5GDRpk4U78DQA/uTKd52lE39Xg9HYVxACN2j33smX1RMBBEPxyzYUyg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 16AD91F000C1;
	Wed,  4 Nov 2026 00:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793752779;
	bh=+O+pkPnJezxUbDLb9nqWUUW01sXrmpX00Gprg49lIhY=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=UG/+EVFfZZlnGC46q7fUFz/14rT7VKNNh2beb/zT/4JRH2Njc4Ys/MxJN40uIJJwC
	 cLCIqH08xBp5jaYgEX5IDgf9bouTDbhn6z1amx/rSHyrtKBseO2HaVafb9y7T3w0fo
	 EixrI4cGnXjmnTe0c3aZsdFbmSIfJtuKfy1nBsApF6GRE4api3jQwRwzy3wXqG0Ljh
	 GLByTqUhf4N5mCOhudC50qPTP1XT0M/0JusG2meDRAv5ND8X4SKkPdXG8zIQtq6Q62
	 Tu64SphZl2qBZYqn9Y0d20YPsVZWDlH4WWV+ea5IZUUisJv2vjlon6TQk5PlDUdaLc
	 Uebj2X5GBAAAA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9907E46B9B;
	Wed,  4 Nov 2026 00:39:38 +0000 (UTC)
From: Riley via B4 Relay <devnull+riley.redeker.gmail.com@kernel.org>
Date: Wed, 04 Nov 2026 11:39:38 +1100
Subject: [PATCH] ALSA: usb-audio: Add quirk for Yamaha ZG02
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
Message-Id: <20261104-yamaha-zg02-v1-1-3fd61b8c564f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMT3crE3MSMRN2qdAMj3RRz00SL5LSUxMRkQyWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgCuY3tBbwAAAA==
X-Change-ID: 20261104-yamaha-zg02-d75a8cfdaac1
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Riley <riley.redeker@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793752778; l=3436;
 i=riley.redeker@gmail.com; s=20261104; h=from:subject:message-id;
 bh=QfAs+gUhXiKkL5wB51Zjd56vxHsgYEBg+Im4XPnvZHo=;
 b=REIeVRBrNFUpjO85xAq43voKcSvOApMyTOUHbvak5DKrYqtr9s3PFhA0CB3t7hjtpFJ1N+5PC
 pmdQ+FwIXqJBomg5u7X2T/T+yrNGr5qH7U28vXdfCg+jYGVwMW51bZD
X-Developer-Key: i=riley.redeker@gmail.com; a=ed25519;
 pk=wo/NEUhxXVG+kr+llQuIWhIFFvK0zNLuzLmkrUPQBR4=
X-Endpoint-Received: by B4 Relay for riley.redeker@gmail.com/20261104 with
 auth_id=1401
X-Original-From: Riley <riley.redeker@gmail.com>
Reply-To: riley.redeker@gmail.com
Content-Transfer-Encoding: 7bit

From: Riley <riley.redeker@gmail.com>

The Yamaha ZG02 game streaming mixer (0499:1516) exposes UAC2 audio
streaming interfaces with a vendor-specific interface class. Only its
MIDI interfaces get bound today: the Yamaha catch-all QUIRK_AUTODETECT
entry rejects the PCM interfaces because create_auto_pcm_quirk()
expects a UAC1-sized FORMAT_TYPE descriptor (bLength >= 8), while the
ZG02 has the 6-byte UAC2 one. As a result no PCM device is created.

The interface layout matches the Steinberg UR22 (0499:1509):

  0: UAC2 AudioControl (vendor class), clock source ID 1
  1: playback, 10ch S32_LE 48kHz, async isochronous OUT
  2: capture, 4ch, isochronous IN used as implicit feedback
  3: Yamaha MIDI
  4: vendor bulk interface

Add the same composite quirk and QUIRK_FLAG_GENERIC_IMPLICIT_FB for
it. The generic UAC2 implicit feedback detection does not apply here
because it requires USB_CLASS_AUDIO.

Tested on a 7.3 kernel with this patch applied (no quirk_alias): the
card registers as USB0499:1516, implicit feedback is set up from EP
0x81, and playback (voice chat and game buses) and capture (microphone)
work. The full channel mapping (playback 1-2 voice chat bus, 3-10 game
bus; capture 1-2 streaming mix, 3-4 microphone) was verified with
quirk_alias=04991516:04991509, which applies the same quirk and flag
entries.

Assisted-by: Claude Opus 5.5
Signed-off-by: Riley <riley.redeker@gmail.com>
---
Hi,

The Yamaha ZG02 currently shows up with MIDI only and no PCM device, so
it's unusable as a sound card on Linux.

I've been running the identical quirk via quirk_alias since 2026-11-03 in
daily use (including voice chat), and tested this patch itself on the
device: playback, capture and implicit feedback all work. Full lsusb -v
output for the device is available if useful.

A UCM profile that splits the streams into Game / Chat / Microphone /
Streaming Mix is going to alsa-ucm-conf separately.
---
 sound/usb/quirks-table.h | 14 ++++++++++++++
 sound/usb/quirks.c       |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 8b2316fe8..e85eeb536 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -404,6 +404,20 @@ YAMAHA_DEVICE(0x105d, NULL),
 		}
 	}
 },
+{
+	USB_DEVICE(0x0499, 0x1516),
+	QUIRK_DRIVER_INFO {
+		/* .vendor_name = "Yamaha", */
+		/* .product_name = "ZG02", */
+		QUIRK_DATA_COMPOSITE {
+			{ QUIRK_DATA_STANDARD_AUDIO(1) },
+			{ QUIRK_DATA_STANDARD_AUDIO(2) },
+			{ QUIRK_DATA_MIDI_YAMAHA(3) },
+			{ QUIRK_DATA_IGNORE(4) },
+			QUIRK_COMPOSITE_END
+		}
+	}
+},
 {
 	USB_DEVICE(0x0499, 0x1718),
 	QUIRK_DRIVER_INFO {
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 05a9f6727..7c581e283 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2556,6 +2556,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x0499, 0x1509, /* Steinberg UR22 */
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
+	DEVICE_FLG(0x0499, 0x1516, /* Yamaha ZG02 */
+		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x0499, 0x3108, /* Yamaha YIT-W12TX */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x04d8, 0xfeea, /* Benchmark DAC1 Pre */

---
base-commit: 3f2882212c558336d0bf3b1c03b8e1a6b348a6e0
change-id: 20261104-yamaha-zg02-d75a8cfdaac1

Best regards,
--  
Riley <riley.redeker@gmail.com>


