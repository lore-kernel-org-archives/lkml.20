Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792970371;
	b=uji4Nc3O8jpyp3SnAARTaDLlyI1E381z77jbBu7QJxe18wzDlmSzDSCSjcUm7mb4Kszt
	 bWQC6vBr+DdeBDAYEf8GdoYsK+GWCC8mYpythkiLxcz6Waa3f7lSgkk/nGsl7u5U1IQsp
	 eoR/Sfvk/BzFgodZ+1CLoR/9qaPOOI0J+DwhqHKRWwTCIDRlyPsNpElblDiMtztKQza4K
	 RcuVt/gXqFX686YZzYMxxZnGMu6IdPZp9T4CYh58D07s0EAnIt729q4fd+gp6hG1hF39+
	 DloN/FmivX6IjUI11QtairvhuTJ1gbfPuOhbxJUiL2VrKton2maYJzpsaSkVZa2zjxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792970371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=98JX+qzH39LcxZEAoy/41LxAE7H0jhKnaaOevXX8J/0=;
	b=njE0DJaV5gu6oVAAjM9pCC4Hr6if9hxKCWm5+eHABKCs1wYIg+N65sOqikCeRBDM0fnm
	 61M9WpQs7TREcbK6kXLMq2598ScTuYyxLt0nhceLhJ/bOXWGhYY7YCtp7++zUNB+dzUiw
	 XcObThvy620567rSyu5nXIEOb8CL3ydyuhy6ZWG/7DExh9PT/R8vx4Z3h3DgrZmSrCFDV
	 vBKYP2m7JYa6+t1zFu/Q2vrdWJXoAF6YkQgIbOHIVHj+YB/a+heY3RhiSy8ty/+F6Zafm
	 gRBEx8EGliaWapKgrKQj1s+SRSmwLNqwwvWASGEPpG333uVm2QBAul87SG9eCeKpWIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IRzWjBZ5;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86680606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86680606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IRzWjBZ5
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so2817627a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792970370; x=1793575170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98JX+qzH39LcxZEAoy/41LxAE7H0jhKnaaOevXX8J/0=;
        b=IRzWjBZ5kqOobrRYzabxpQCI/V/Ct+3DVmtvvjw2X3HjyY0s+ED2mlOkDUd2vzMHPg
         7Nff35K58HafSFcFWtUAATLBbZ1NqhPyIb6AXlOjRZMaiadYo1c659eZ4bDUlOoppgs7
         n3njsvu8bBLXJxkSN+9QV0sxVLyp8vh+dwHtHI7AJFPklMBjWjOHn222QdC4f0fiqMm6
         Gj5hU++G6pRR+tQQOVE+xdiC2bq+l7Gu4K8VdFTWpOxCGqZZrpE4jQYs03iW8hB5MccZ
         UiDUJkDYbP7N+g/3UiInbCtwwrD3AQrzNZ76Z7+urzzpo6Ctv4MrlRMbTpIwVDLmyggU
         c/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792970370; x=1793575170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98JX+qzH39LcxZEAoy/41LxAE7H0jhKnaaOevXX8J/0=;
        b=EsyO61RuBQ3c9Ic9hq92DQWKXxLe7uDWKoZ4OMyi1lvDJvcw2Rda4j8Mdfcb940Li3
         jeBUOp23YC6Wc2PPbb503QBXoxK9KRRhmOgkcHqu22LL89q0aIt1dIzX0rLufbH/duFF
         a5wIyibMazUstAeMCLi4I/xMNSoNcEromQdNLtfltueYCmYZ3lQJ2FRb8G32XdkusrC3
         CoQvSKEHx/IOebO/7bFMFLcVWQOBl9J3YBJxDfvDy1p6pZz9wYoPQceNQFGfAp4WSodZ
         1IPWOh627BphqVBKwb+OT6l4VVtMTByvMYYLFzMescQiQQRG/t2Ka1eMgBWZHqospO6P
         teCA==
X-Forwarded-Encrypted: i=1; AKwUvBzpD2VZlVAIXJ/j2FJSkQuBL7whHbfHhRjB9RAGrVUHHe0JChGr6nXvjOqvsBugMH1lS03Vp6/3YcYpfAc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3Dvd+KXazEhGjSf60jQbZZa/Cazhnn+YJ8ZFsw7q680iUr+Ha
	ShTRSmgermtjRK7llpFWbhxV1HZ1FcxhZj6D03XNWNLCDGhNsdKK/W29
X-Gm-Gg: AYBFou2BVego+zTWD6nSNv9l7nk77FpreDBql2mxQou36fGYVLIDoBkx+h1l+4vHQDW
	AuzUoXS4I8H6EpE3UukyWG4iwIzxKgqkfPROHDzgR/ixCsn9SYH/SeCvjQToAlXs1HZk9jPcoPG
	1FtbvihfmLCR2aCgyw/VfhvHpS8W4D2KbPQl63+9d6NazDg86uheBlfhgK6hyoe7Juxq+rHpUek
	cRMUvP65hg2NSnbyXCNdFUg40myjZMz3K4EHkEHD3CcDA0mR5t78xOSxZUx3dTEn+ARrQclTxVZ
	0ImvJ9lq0VJHJAllqVErvvKDxgtoXTd3R6SFaWkU3A7eOAojSParBnudX+K5gMCTprBS5Lx0d5O
	wH+S4PVwu91PM0auUTIHr3wAHDlmI5AAUhNLMgX0EYu3oFHLZK4gi8HXTiDO9HeAuAXirUIwHzY
	L8WI+ARCbhXiy22+LlAkAqGAH8Ucd0LZcRqc2LEK2rzMhNr/R0XNjKFVUlfLdqfSSoy5KouSbWt
	rguU78cgH84Tnahv2Az3LTA1g6gHmSKwux4GyA4g9s7r6dWULptc3uH
X-Received: by 2002:a05:6402:4405:b0:6b4:1629:b1aa with SMTP id 4fb4d7f45d1cf-6b442a87d34mr7302224a12.2.1792970369657;
        Sun, 25 Oct 2026 16:19:29 -0700 (PDT)
Received: from arch-pc.lan ([185.141.180.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm2776514a12.24.2026.10.25.16.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 16:19:29 -0700 (PDT)
From: Denis Kulikov <dar1knessx@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Kulikov <dar1knessx@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Rate-limit URB submission error at stream start
Date: Mon, 26 Oct 2026 02:18:49 +0300
Message-ID: <20261025231849.148149-1-dar1knessx@gmail.com>
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

When two USB audio devices share a USB 2.0 hub (here a headset and a
microphone), there may not be enough isochronous bandwidth to start the
second stream, and usb_submit_urb() fails with -ENOSPC. PipeWire keeps
retrying to start the stream every ~20 ms, and every attempt logs

  usb 2-1.1: cannot submit urb 0, error -28: not enough bandwidth

On my desktop this was printed up to 94 times per second and flooded
the kernel log.

Use usb_audio_err_ratelimited() for this message, as commit
2db2be5607c4 ("ALSA: usb-audio: Rate limit usb_set_interface error
reporting") already did for a neighbouring message in the same file.

Tested on that desktop (X79, Linux 7.3) with the headset and the
microphone on one hub, starting playback and capture on both for 20
seconds: the stock snd-usb-audio module printed the message 580 times,
the patched one printed it 50 times and suppressed the rest.

Signed-off-by: Denis Kulikov <dar1knessx@gmail.com>
---
 sound/usb/endpoint.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 9c844c55a..8dd0b3525 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1642,9 +1642,9 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
 			err = -ENODEV;
 		if (err < 0) {
 			if (!atomic_read(&ep->chip->shutdown))
-				usb_audio_err(ep->chip,
-					      "cannot submit urb %d, error %d: %s\n",
-					      i, err, usb_error_string(err));
+				usb_audio_err_ratelimited(ep->chip,
+							  "cannot submit urb %d, error %d: %s\n",
+							  i, err, usb_error_string(err));
 			goto __error;
 		}
 		set_bit(i, &ep->active_mask);
-- 
2.56.0

