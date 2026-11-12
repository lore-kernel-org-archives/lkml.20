Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=155.254.16.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504751;
	b=T2AGgJnv2Yupldk6S0eCQqajwXAyAV3WGwEoogsiwbcxU2a4IdSTlL+Jcozb/JiNem3Y
	 JL9lvI8VReUYeyOJ7e4uAF7HbWnZ+BhHmm3bIBqLbOYBFQtNmoP3d5S77I27BXnwkrbJJ
	 H1M8Y/y6w3giUUG7R1LZ1JdMUp1uBan7KtuPn3cYHfLunWKvEAw7PDCl07pdqu567T0bH
	 87f+wd8/Gy8yU94EkAL78IwN+bNnseDcjXxhLoXdBoHccVlx3pMln8QXwU3c4HQz4E/G7
	 /Kp17EuCZ9+OF6SpfxuQTMVmIySR9O4LvRjieTmjIppb4gPk1n5RZctlGOCEC/MszaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y1bVloTNnbdHgzouYDIE3DTRqKDUMOSVPHqHp115ktc=;
	b=jeLAs7ializVFQPfhMysqVhJ7n8ONPiTbFDcEwH4TT33SUcSC2wT3NZ4UYML6U1oBPaQ
	 TDkNp7al5HiNrcwmmQ/jXc4CD7MTaK0twGJ/pB+JZ+10pb5IDkcNzw/Z/0bkdFSNdEPnl
	 W5Q5rRqlvXMKlZkxUnKqyx+rsC5ERXt0DJG/BZT7rjDeX22AsMOZPF+cOra1QSloqIez/
	 lQ1WnURahv9r+oO1ZIyX45Jw4wIjyua4mUCjFgTqeDtuTH7J3WZ9nXv+rz+neo4R9zYVD
	 ZH+PxmxatpHI6l/Wejaucl9X5WMflwD1p4TnRVeWwr+wCqLZsJLP4/O3UZCcQNowNFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=4d2.org;
	spf=pass smtp.mailfrom=4d2.org;
	dkim=pass header.d=4d2.org header.i=@4d2.org header.a=rsa-sha256 header.s=mail header.b=OGLQZ0Km;
	dkim=pass header.d=4d2.org header.i=@4d2.org header.a=rsa-sha256 header.s=mail header.b=PxpvqTDy;
	arc=none smtp.remote-ip=155.254.16.17
Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF43606A323;
	Thu, 12 Nov 2026 17:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF43606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=4d2.org header.i=@4d2.org header.a=rsa-sha256 header.s=mail header.b=OGLQZ0Km;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.a=rsa-sha256 header.s=mail header.b=PxpvqTDy
Received: from localhost (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 0824B1792EC4;
	Thu, 12 Nov 2026 09:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1794504742; bh=8ilM/WW0yNFwn5Z6YnV4TBSV6++RgvlA1QK7yTEHAMo=;
	h=From:To:Cc:Subject:Date:From;
	b=OGLQZ0KmT6RbS9yjfZBGq5xA16IoWxPDapS1veX949CSz+4dnXF8pnjRDqSl96uIw
	 /RNaX1TtsJq3U3Yeyp1KZOea+ZXnsau5Vtxo5S4C1vIHJsMl5ncSUfghe9LpsIOThy
	 XnbdFelt1nJmbIvEEqP7oeyyyVqJD8vAyZwsAJ8rgcznDJyXQLxvh2rkt5hcQlex+s
	 fNUEr5/lZh/i2eNCk5P4GLYNq+kBHk+HbHbeZCre0joQY8aghD3ffQMr6gD3jiuX3d
	 4tRwto4nPe+QFGFqp73ax4UaN+bx8WG57GViUOpich7l5RZTavZaoK27uW3vAxwDaC
	 i1MVN7p/3gDcg==
X-Virus-Scanned: amavis at 4d2.org
Authentication-Results: bayard.4d2.org (amavis); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by localhost (bayard.4d2.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8aEd1t-1uNO; Thu, 12 Nov 2026 09:32:12 -0800 (PST)
Received: from Headcrab-PC-Fedora (unknown [IPv6:2409:8a02:544a:fd80:923f:eea5:4b58:a8ed])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: wiagn@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 0A9511792E4C;
	Thu, 12 Nov 2026 09:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1794504732; bh=8ilM/WW0yNFwn5Z6YnV4TBSV6++RgvlA1QK7yTEHAMo=;
	h=From:To:Cc:Subject:Date:From;
	b=PxpvqTDy/05OGbzxx6KmSi3E7lZR8dj0oxPuSad4L5qfeYqLFKvCUK1uEyAXb+fVH
	 svCM4RihUkP1hMffaUwIk1dW/r8E7bk0JGJ7aUP5s5yEYWiNUhKswRo0Hg/F1eePAI
	 hwl3GftustPgmILLDcUs2BUY3AQOiqUekG9OzTbYEYv5suWMTq80RZO2OS0H4ThC5H
	 RuajiGtejBHTLTIkgdM4EAMloY7fceNzLtmkMnX/uJazj0pRRoaHBCN0FllYBeGoTY
	 tbYlG5AVwjRiYU/zDS0nr+dH2xkpLYPahLHhkBnk82acXspQcYfpe8PkyCOi54fSaB
	 e/h+rt2K5SRBA==
From: Shengyu Qu <wiagn@4d2.org>
To: perex@perex.cz,
	tiwai@suse.com,
	hulianqin@vivo.com,
	i@rong.moe,
	g@b4.vu,
	jon@soh.re,
	hhkieu@gmail.com,
	panxucc@gmail.com
Cc: wiagn233@outlook.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shengyu Qu <wiagn@4d2.org>
Subject: [PATCH v1] ALSA: usb-audio: Add native DSD support for NiceHCK Octave
Date: Fri, 13 Nov 2026 01:31:31 +0800
Message-ID: <20261112173131.86655-1-wiagn@4d2.org>
X-Mailer: git-send-email 2.56.0
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

NiceHCK Octave is an OEM of TTGK TT39039F01-PROMAX[1] and supports DSD64/
DSD128/DSD256/DSD512[2].

It advertises the UAC2 RAW_DATA format on altsetting 4 of its playback
interface, but without the DSD_RAW quirk flag the driver exposes it only as
a SPECIAL format that cannot be used.

Add QUIRK_FLAG_DSD_RAW for the device (USB ID 3302:39c3), so the altsetting
is exposed as DSD_U32_BE, enabling native DSD playback.

[1] https://www.audiosciencereview.com/forum/index.php?threads/nicehck-octave-dongle-dac.65535/post-2390027
[2] https://szttgk.com/product/HIFIAUDIOMODULE/846.html

Signed-off-by: Shengyu Qu <wiagn@4d2.org>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 4ec1f2a0b359a..d59eef24363ec 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2829,6 +2829,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_DSD_RAW),
 	DEVICE_FLG(0x3302, 0x17c2, /* TTGK Technology USB-C Audio */
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
+	DEVICE_FLG(0x3302, 0x39c3, /* NiceHCK Octave */
+		   QUIRK_FLAG_DSD_RAW),
 	DEVICE_FLG(0x339b, 0x3a07, /* Synaptics HONOR USB-C HEADSET */
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
 	DEVICE_FLG(0x3443, 0x930d, /* NexiGo N930W 60fps Webcam */
-- 
2.56.0

