Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505677;
	b=hkjwiOsBY/2dGts9zmEOW+LaJ9Vj4XwAwV63phdTlKEQNSZvw60HlxZo01Wzb1sqWA/5
	 Io4gduFm6OMDN7nUBIrkDu2sF3frzitz6EaQbpecHh6slU8zbk1SK1MbUR1+tbVLpAzSf
	 03k+xldVk9pTqiG+c9u3bhfm/eYQYqz6pFdsfvTjnHrNu3R4mGwBm9NZoQcNdXWlMb8b2
	 sywAGDQbDiJIMSr7rGLz5MJYELEPOHbYbYBBcBXJToj7nkD71R8a2tKR85Lri/o24u8jJ
	 pXoXb/yu/93FpQQ7tvyLsP0pBiALw10oSu6a87Gso6w+7XRfnjkHhlf099StcdoR8CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=sQFeKDZLpv+uAiBMOa7dMDV/Pt3XjThlBAiwUAdIC5E=;
	b=NQNOyGQlebTVxys5XwYeGEkZcm4GRSwX8bFb2OlZjErS9QLr2aCE7OjkS927lnERhk2Z
	 BqtR8topUKsUf6pyu7xmMrhIs6BTcJfNj0Ufbmqsj5+lVX2NCJF+X0hgnwevjDG/LHsOY
	 +w8Ag9OMFVx6AWW5M1XRbGMqIW/JDn+NfyP2AYgjyrW5H42JNZG6p2FiIUOT8fR+Ckaa/
	 G5wpuR24E7/hxatT0wdHPkGEO1EcdkHu2W+jxO+B6VutEaBhjVM/SY4s4oOifmST7F4Zz
	 kWG5AStLvDev5NOUUGXDnmyGr9DxFTfvaR/FlcSnM8RhidiWGp5gSIfVH08gwa5IzOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OfKQXqCI;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F21D606B24E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F21D606B24E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OfKQXqCI
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b060ec084so2353114f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505676; x=1793110476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sQFeKDZLpv+uAiBMOa7dMDV/Pt3XjThlBAiwUAdIC5E=;
        b=OfKQXqCInK3LtSb1jx4q1SvB4vwl6ZrdV9HwES02TbcwjQOZTVufMk2crhU/fXbUGJ
         oELaP5oYO8v25uh3SbUuip0awB/N88AJrABUWQ2vKTKyV/BOGANz6i4/4kXD4n/83PPC
         kimVCL2sYyZaByzeY83hU1Hmi1jL9ePU8OV1bor+4GX23gUCrdQEYBRXpO86dZGzKr3t
         U4b57M6aPC9iM7NOfyvHTgiKjIXei2zpgCYYxhackgw7tGp3jsmodMCH79vP6K+M4K5B
         gMkZ7kpe8NY4TXUDx4Zyu0rBcipV/leUEfwu7JboZw29EiFL1bbAIMNtOo0BgCNDpdjP
         /SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505676; x=1793110476;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sQFeKDZLpv+uAiBMOa7dMDV/Pt3XjThlBAiwUAdIC5E=;
        b=NZWWje2IKB8/3k2aWs+AjI4TWRwT0pJCG14dMYcTmOs6MB9uYF4MiHJ1wd5FYXIXEa
         Z0WHHVlW0VhStbWnVEF2LR84oHVH0se/RKy3c+xTVWmQdf1WYy1sJdI9UW6B+vvYxKB+
         XaPgrYzyrssD4e15UmJAtaQdDvuki1BpwmCEYKxJERHaZfp0EO61Z1N7Sq7xeswSPYvJ
         ZD/juDmNFduA161vHDopw2+NRlxh22XlfuqTDq1qBOc6+EQA7znEgpyCIloBvRYsKuM0
         nIcbYpSz1lQL+D+08XFDyoVJZL4YkTSwEzQ5CAZfQWXyiEZf9XFhemSuSzJitWvjzWSS
         0Xlg==
X-Forwarded-Encrypted: i=1; AKwUvBxunQBGSa0hYL3Pm/SWYK4ruRgm6StSA13p8Un36jLfEV32020NI1e81R1jcSMtPLT4oBRzvJOou2nkYa0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHOuT/MyvU2qafuv3V49b1WW6B52dODYEwOJGWRGTw6cHWyLYp
	fDYOZoTYHBSFfeTM1ZQ17Rdlm/v9SESMeXa54WWZpr5Dnf9X4TMVbLA6
X-Gm-Gg: AYBFou3j+FkT7yvM6zEz35WK8FR90UDJHqTC5hyNnosoLljGeiNw+nlZHex9JR/pUfK
	AIOF83pFKzKniPOPhfZZy1Fbf2SOPHza997s/SqOUQ4D5PCXTQxJyK27GVsNKDgUVcAcZMHoU7h
	EbK0CBVTe+TELQaVz7gsE7vXSie4oQ3ZihV0STDJsghUANJgddeHfJ0PJZIGlPmlZm+Akwwywpf
	Xtuw1fzQAPhhJSwhATsz47URRzOkqySVUbu1VE0jiIkPneke9gdO43/Bzy0Q67IB82locz8ZYJ5
	9ZJ1grAAND4ITWnyJYQxsp/kRN9Lud9oxkV8+l7i7oqEQ2kKaYzXEv7qhUzm2XSvElgqxAtgn5G
	bhv1EoDONVf3Y+LBkc3/dQKa6YRc+84YgJGMs9YLF3RHOeNgrsuIGwctWwXR6rR5TLuMzl+60F2
	x/G8YMU+3cqCC1lSb2PM2zBbA3FEwzNv7j4mkHYjo+RS7CRLmuLzWjRER81FZ7ok4SKOHu6KmHN
	+CyMezKeZnj5fPEu2JXQ3rm7dK2meXqAMJ1pSpuMT9+8oYlOTuxHelYvGmkyEXnue4wkvZ+c3Ft
	KWITJIuLkLXdoQ1yTjJ4rFGn611Z9nDvVftVajQX9DQ=
X-Received: by 2002:a05:6000:186e:b0:48d:ee0d:8b3d with SMTP id ffacd0b85a97d-48e07f9d49fmr25091594f8f.28.1792505675613;
        Tue, 20 Oct 2026 07:14:35 -0700 (PDT)
Received: from archlinux.cern.ch (ppilicho-1.dyndns.cern.ch. [2001:1458:202:228::101:227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80f9cdsm6256287f8f.11.2026.10.20.07.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:14:35 -0700 (PDT)
From: Patryk Pilichowski <pat.pilichowski@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Patryk Pilichowski <pat.pilichowski@gmail.com>
Subject: [PATCH v2 1/2] platform/x86: msi-wmi: Sort scancodes numerically
Date: Tue, 20 Oct 2026 16:14:26 +0200
Message-ID: <20261020141427.1580282-2-pat.pilichowski@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020141427.1580282-1-pat.pilichowski@gmail.com>
References: <20261020141427.1580282-1-pat.pilichowski@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The scancode enum is grouped by model, so the values are not in order
and are hard to follow. The grouping is not meaningful either, as the
same event codes are used across MSI models.

Sort the enum by scancode, give every entry an explicit value and use
lowercase hex.

No functional change.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Patryk Pilichowski <pat.pilichowski@gmail.com>
---
 drivers/platform/x86/msi-wmi.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index 05c35133a1b3..5369ac28f4c5 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -33,25 +33,22 @@ MODULE_ALIAS("wmi:" MSIWMI_MSI_EVENT_GUID);
 MODULE_ALIAS("wmi:" MSIWMI_WIND_EVENT_GUID);
 
 enum msi_scancodes {
-	/* Generic MSI keys (not present on MSI Wind) */
-	MSI_KEY_BRIGHTNESSUP	= 0xD0,
-	MSI_KEY_BRIGHTNESSDOWN,
-	MSI_KEY_VOLUMEUP,
-	MSI_KEY_VOLUMEDOWN,
-	MSI_KEY_MUTE,
-	/* MSI Wind keys */
 	WIND_KEY_TOUCHPAD	= 0x08,	/* Fn+F3 touchpad toggle */
-	WIND_KEY_BLUETOOTH	= 0x56,	/* Fn+F11 Bluetooth toggle */
-	WIND_KEY_CAMERA,		/* Fn+F6 webcam toggle */
-	WIND_KEY_WLAN		= 0x5f,	/* Fn+F11 Wi-Fi toggle */
-	WIND_KEY_TURBO,			/* Fn+F10 turbo mode toggle */
-	WIND_KEY_ECO		= 0x69,	/* Fn+F10 ECO mode toggle */
-	/* MSI Claw keys */
 	CLAW_KEY_VOLUMEDOWN	= 0x21,
 	CLAW_KEY_CENTER		= 0x29,	/* MSI M-Center main menu */
 	CLAW_KEY_QUICK_LONG	= 0x2a,	/* MSI M-Center quick access long hold */
 	CLAW_KEY_VOLUMEUP	= 0x32,
+	WIND_KEY_BLUETOOTH	= 0x56,	/* Fn+F11 Bluetooth toggle */
+	WIND_KEY_CAMERA		= 0x57,	/* Fn+F6 webcam toggle */
 	CLAW_KEY_QUICK_SHORT	= 0x58,	/* MSI M-Center quick access short press */
+	WIND_KEY_WLAN		= 0x5f,	/* Fn+F11 Wi-Fi toggle */
+	WIND_KEY_TURBO		= 0x60,	/* Fn+F10 turbo mode toggle */
+	WIND_KEY_ECO		= 0x69,	/* Fn+F10 ECO mode toggle */
+	MSI_KEY_BRIGHTNESSUP	= 0xd0,
+	MSI_KEY_BRIGHTNESSDOWN	= 0xd1,
+	MSI_KEY_VOLUMEUP	= 0xd2,
+	MSI_KEY_VOLUMEDOWN	= 0xd3,
+	MSI_KEY_MUTE		= 0xd4,
 };
 static struct key_entry msi_wmi_keymap[] = {
 	{ KE_KEY, MSI_KEY_BRIGHTNESSUP,		{KEY_BRIGHTNESSUP} },
-- 
2.56.0

