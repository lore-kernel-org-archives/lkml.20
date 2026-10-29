Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793244561;
	b=Pixh6Bgaigap9+SGWRgE8J7PrRwRD0htg6ve15hukaVdx21Tm4h2Y8szSNRq1oXYvmVl
	 RuehBG6VYUBRoHwqb4SOavFBGckMeiUXNWknN4jfBxp7yw1Gr9LkJYnDzrupsusrhnNLv
	 bq9Vyp2+Q++lmdscAfdZwRdk/5RqX7gngA5rJ0aCbst+FrKlQKRgmXd1ElU1EW49JFW05
	 VvJxElAkfELHq3/r78Zx+bRy0HofEjrBg/5aCxdWdIBZ/U9kRF8Z2RG078HlTV03lu65s
	 j9jZ6Dbr3pCkJAwuLbWW69TLThTDoBtp32U/PvjjlGtd8j1bB2tw3sABGMlhBPeVCLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793244561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r2lP39Zwrg6b6ti0XQBBmhYF5G4i5EE9mhv+bYMknKs=;
	b=yJeK6iedhLUZiV3NvEuYttn/WYq2iOps8Ir9XV4L+9MM4FiiOeDUO85Wlc7S2nUF6tv0
	 u5KaDyEXQqhAcm0+xtYSsbePsbyZLfnQyHioJFpDkLoeQ65aj4erLcV7fMl8k+3084usM
	 E1rYipRneX74ZY3pefBMcJ8aA5C3nffl2iAUvIeL0L+MS14K5Fjs3ODacl/SpLmXpEo4M
	 YWeHsiW4smkv3mugqQPW4kCkNmoppqrGaGYySRoG0/TIatRH5MPfR6XKCVj8TYhEpHSkZ
	 6a0ZVw6kTr38gV3xOyQj0j6PAAi9yjvdLB4ibGfPTJR/do4VoYtfJmUGtTiwRFNmI4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FkstOb1a;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AE5606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37AE5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FkstOb1a
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab41538192so1248789a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793244561; x=1793849361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r2lP39Zwrg6b6ti0XQBBmhYF5G4i5EE9mhv+bYMknKs=;
        b=FkstOb1aJBK1v5iT+BgBG1SChsoebhDJbYmMaVbK7CxnJub6cKdGUUcS6KZ4b1YTVQ
         uoHqZQoAM6PBmWyT4P6A+LzgqoOKdOeeM9VOOUURShHlFGUgrQmC48ThDuCNfTicRPf5
         chsj3E7MRuOxuGk584uvzHWlipMxeSmj0OU9UEQw0wRfgWx/Ml1st8hbbN/5MqeCEz38
         7p0LWs8Msp8Eo7ah23s5PCFMJ6ba7p+MUVxeXC6DVpybGoJaGtt7gko/dYiijtIhw3Bc
         Dggio91+CFbf9r20MGFjJkuQWOs1/M15beg5OWX3PMRoU6oRII6oICkv38HWz3WxtBRE
         kr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793244561; x=1793849361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2lP39Zwrg6b6ti0XQBBmhYF5G4i5EE9mhv+bYMknKs=;
        b=0J8DXuZSjlMLj9O9XEaLcLbOpOAP8t/kDaQeGEC29WCMfdluHbj3noFSXZUD/6Ao/r
         mLVqhkuqcxIA12w8Ut+OI6SxMD3e6V38692b0lSqrW4SlzQzPaV3j1PXViSIRfbAnx31
         xWmxQBcf/dJU//4oYXe3NNxp5hvjM5AMq0pu81qGjPzZoPQy1LXe8kHFp5yp5uFici+D
         2VsHuZuiAfmXCPEjdUyFbqwJbsO6GTIB21kkDwIHI++P7Mi4us1vmgCEjvumEzXUCXSm
         4agG2ROWMdZthqO8i4/x4jbCdJ3r6UbZ5M9vKFR31TclnnCSwzeX/UXiSuUQd5GGkqrX
         fAwg==
X-Forwarded-Encrypted: i=1; AKwUvByaMSRzeIEEta5g1Nv+ifJ6MJQKjz50bT8EuofUZGZEZeLNSRxQUKa0GEG7e/4aKfiQuUocZ2qzTaSJYlw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTibwttXZuGaTYffH7X5v02vvFH55hJs+dSU0XM20NSBl80kb/
	j9v3pnHW7d7sw3HbWO2wk5V0RqMrYEV/QiwdlDnu4ldDhGHyQyM1kM+lAPhiS0N3
X-Gm-Gg: AYBFou2Y2EbOpwYj0tJi6pLtcCGQvr0LAW5P4pcutJIsj+FNUELtGuJapfrRh12y7yd
	S/pUknYY994zyROfW7Onh2YHvE56hoFD/DbfOVaSi2TSG41nzOUQ7muVxiaF1YCN31vDvl8DsPK
	eyBBtoNY2GOtV8/FxoEC6OSAv5l/oEJhGEJMsbLpRcRZZiVv+hp6bSxeJiQMcDvx27j8j6IMoXc
	PhGqJozwatPiG2CbEqLnIImuoljYSwasdX9o7N5b7NCrV0h+wwFk9JxNhd5h2ma0EHU7F8b/kK+
	QkIDlXZXD9fVe+d70VC3Zob34frx37dmSF2WzNY1HDoFQ5VZUXCz0xpnIXb0F9GUYNxcMIl86wV
	jN4MByjAR6Z1OEf24W1ItsoUN73nsUYMJ3up2c1riJiCNaXSSJnKkpS4frCVjEwCgEO4oUyFlUb
	oKqrByVpAQq4NOH5Arn8zwIIQ+HlAXiEzBCG8kfPvrVxlS/NxN2YeofttqmAPVIIb4SPkKeFHJq
	CXhmzzwm8DP9aA7fct94De2f/FnHxP9XNtqb6XkRfIYmKtjK24gt0Uur3JhbCPRYqyPsZMLL3kf
	+gP+kDWwYg2B1WJRHSDKZHYlFuyn7Rr+470m6DoaSIUfYXDfA3RdbvxXyEGzL3k3+0KSt4tOb4j
	Np83y1dhr2YSHkih7Ttqsjm8=
X-Received: by 2002:a17:90b:1343:b0:3a7:ab31:2f4f with SMTP id 98e67ed59e1d1-3ae58228c39mr3338365a91.28.1793244560629;
        Wed, 28 Oct 2026 20:29:20 -0700 (PDT)
Received: from kic-machine.localdomain (122-117-151-175.hinet-ip.hinet.net. [122.117.151.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae57a56a1dsm2828318a91.4.2026.10.28.20.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:29:20 -0700 (PDT)
From: Kuangyi Chiang <ki.chiang65@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ki.chiang65@gmail.com
Subject: [PATCH] ALSA: usb-audio: Add delay quirk for HIK camera
Date: Thu, 29 Oct 2026 11:28:56 +0800
Message-Id: <20261029032856.7100-1-ki.chiang65@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Audio control requests that set the volume sometimes time out on the
HIK 1080P Camera (2bdf:0280).

Adding a 1ms delay between control messages avoids the issue. Apply
QUIRK_FLAG_CTL_MSG_DELAY_1M for this device.

Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a54fabc..d2920bd 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2532,6 +2532,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x2b73, 0x0047, /* AlphaTheta EUPHONIA */
 		   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
+	DEVICE_FLG(0x2bdf, 0x0280, /* HIK 1080P Camera */
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x2d95, 0x8011, /* VIVO USB-C HEADSET */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x2d95, 0x8021, /* VIVO USB-C-XE710 HEADSET */
-- 
2.25.1

