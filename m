Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794766453;
	b=pEFItNvWzEVDzfMYWbuknxOjEz7mwGWg9uVJeTrpBcxutisXGXVvD6tb/ZWkByv8RI1A
	 13YOhsY59YAJJ9f8aW54zS+g6r0UpHUgOaapuM7Hkq5yFOshzwLaXNZ+6ILN5ftGBcfOu
	 h7vEZQCl0JE57lmUD6XCm7bDrMluxdLEJZ7Z1b5u94n6REV4ND88DIZsDSeep+tK+Cuu/
	 S3m4qEMgHuGKHKQvNwt7+EjUlT56v/pwC1e2IzNeGp2InoaWVN6jCkoovwOyFMGN/iras
	 l9T2saBiNWYWaLsWhRh5g1Uw2Ig4ShX5+k7uZSNgCrhjEAlkAhAmSQ7bRICjm5OOJDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794766453;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Envelope-From;
	bh=+k5tKf6urPY8lWMEjLDvjWecJXDmPvgqG1+tcJ/GJR4=;
	b=HXI99yX8+ZJPuznM4sR6DshJkVLk18LFjInGOuWGxLkSXqHNGGEHriT99NJdHZvi0E/o
	 OqMEImuOZgXTDIRguLuoHw7xyCJsdop1WCXeOxUzNLuOyXMxaHmkTtFS/1YZDpJQ24sZ3
	 XkMccrCRR9rwzn1AKTJADRBq7P46hDnYzULmLqroTDyp2jsGrjYyYSSZKF1M6dENj60Aw
	 TrmxGcBw/cQjwkaJj/pBD/X0NNknDy0JdrhaJNhURpeeKzHq6DHX7oPqk8kQAxhjEhAsm
	 zf3JKbxu/E5iiovpidAlAGm7j032vshO/HjCSv2VFQloF/AZSRGZHCA8j5ToCAbHQDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=liuolia.eu;
	spf=pass smtp.mailfrom=liuolia.eu;
	dkim=pass header.d=liuolia.eu header.i=@liuolia.eu header.a=rsa-sha256 header.s=default header.b=KF7WLUcY;
	arc=none smtp.remote-ip=198.54.127.131
Received: from out-2z4y-a131.jellyfish.systems (out-2z4y-a131.jellyfish.systems [198.54.127.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B040F606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B040F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=liuolia.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=liuolia.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=liuolia.eu header.i=@liuolia.eu header.a=rsa-sha256 header.s=default header.b=KF7WLUcY
Received: from mail.privateemail.com (unknown [217.31.190.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jSJz34hDhz6tkP;
	Sun, 15 Nov 2026 18:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=liuolia.eu;
	s=default; t=1794766433;
	bh=+k5tKf6urPY8lWMEjLDvjWecJXDmPvgqG1+tcJ/GJR4=;
	h=From:To:Cc:Subject:Date:From;
	b=KF7WLUcYG9SlWaDOi3S6I1r4AHqLJ+MFcuczAiGYmbAQjcAI28goBj42DAw87uTZ7
	 AEwqmwCCMPwlQS7YldQb13IlQjQEZCifCMnuo6ghPDjCgCM+q5cDHk/91R8m2/NSuo
	 x4q8vtE7L3FvIbSifanF70yjK8IZuKuvpfF9IjkBQopmKR4GfdR5y8FiOJQl8R5dOZ
	 czFRK++hQMYrDl/5f5oE7fPBaztnkaZcwljSNSRIWtL8tj5m1sKPTOPUH4yl5F+Z97
	 NUl8aqq+RdZPYLOXpWpQN+UZbHP754pTovW14sBSZqFCMz7gFgeRSRUxPeZHVWMgqc
	 imOQ+L3l6gEOg==
From: Vytautas Liuolia <vytautas@liuolia.eu>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vytautas Liuolia <vytautas@liuolia.eu>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Add quirk for VF0790
Date: Sun, 15 Nov 2026 19:13:24 +0100
Message-ID: <20261115181324.97843-1-vytautas@liuolia.eu>
X-Mailer: git-send-email 2.43.0
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
X-Envelope-From: vytautas@liuolia.eu

The Creative Live! Cam Chat HD VF0790 (041e:4097) has the same audio
interface layout as the VF0770: interface 3 offers S16_LE and S24_3LE
capture altsettings at 8, 16, 44.1 and 48 kHz. The 24-bit altsettings
advertise the same wMaxPacketSize as their 16-bit counterparts, e.g.
216 bytes at 48 kHz, which holds 54 frames of S16_LE but only 36 frames
of S24_3LE instead of the 48 needed per 1 ms packet. The device then
delivers only 36 frames per packet.

PipeWire picks S24_3LE by default, so 1/4 of the samples are lost: the
captured audio sounds chopped and carries a constant 1333 Hz buzz, one
discontinuity every 0.75 ms. Timed raw captures at 48 kHz with arecord
deliver about 36000 frames/s with S24_3LE and 48000 frames/s with
S16_LE.

As done for the VF0770, only report the 16-bit 48 kHz altsetting. The
other 16-bit rates have not been verified, so leave them out as well.

Tested with this patch applied to snd-usb-audio from v7.0: the capture
stream now only lists the S16_LE 48 kHz altsetting, PipeWire uses it
without any local configuration, and recordings no longer show the
1333 Hz artifact.

The problem was diagnosed, and this patch written, with the help of an
AI coding assistant (Claude Code).

Cc: stable@vger.kernel.org
Signed-off-by: Vytautas Liuolia <vytautas@liuolia.eu>
---
 sound/usb/quirks-table.h | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index b6da5bcb15e4..56f32b3f873f 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -187,6 +187,40 @@
 	},
 },
 
+/*
+ * Creative Technology, Ltd Live! Cam Chat HD [VF0790]
+ * Same audio interface layout as the VF0770 above. The 24-bit altsettings
+ * advertise the same wMaxPacketSize as their 16-bit counterparts, so only
+ * 3/4 of the frames fit into each packet and the audio is chopped. Only
+ * report the 16-bit 48kHz altsetting.
+ */
+{
+	USB_AUDIO_DEVICE(0x041e, 0x4097),
+	QUIRK_DRIVER_INFO {
+		QUIRK_DATA_COMPOSITE {
+			{ QUIRK_DATA_STANDARD_MIXER(2) },
+			{
+				QUIRK_DATA_AUDIOFORMAT(3) {
+					.formats = SNDRV_PCM_FMTBIT_S16_LE,
+					.channels = 2,
+					.fmt_bits = 16,
+					.iface = 3,
+					.altsetting = 4,
+					.altset_idx = 4,
+					.endpoint = 0x82,
+					.ep_attr = 0x05,
+					.rates = SNDRV_PCM_RATE_48000,
+					.rate_min = 48000,
+					.rate_max = 48000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 48000 },
+				},
+			},
+			QUIRK_COMPOSITE_END
+		},
+	},
+},
+
 /*
  * HP Wireless Audio
  * When not ignored, causes instability issues for some users, forcing them to

base-commit: 6db55dc5b1272e8fe63328a3bca610fe1fb5d382
-- 
2.43.0

