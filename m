Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DF3332EC8
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790441447; cv=none; b=bDzf7VCgzGHUjs6yQj2qHlERFFP/MsRXSlcRQucw4Z7GcoWcGn6pcn5garZV5gofCDcC6PqdsRjr6m6oSxa7wZ133c7EhSFkyBDHV+L8M2dshkgRTCJkTSmHWxb2Qi+YM5+NqTHBoyyzAkskOeI2yU7Xpr3/Ee66hpKxcU9Xyys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790441447; c=relaxed/simple;
	bh=9ToSpazp9szOS3s71KT/NZ2ANqsW0n9CU2Ous0H+GYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E6xRuOTbZMQYJF0VlRn18SvjRnG1ZYKjQPVy4R6w/L6fPEAFGQmGQFW0uapN0G6ZIBsz3BnkXPG7aRK0ZZJTcvhFEjjC18vmauChAB2teV122cu0Y1q/3OEWjUUJVlSwvpSJaspjoLrFv3x41ZglZaCKVhMp2PQqhh5A/CZ7Ta0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQKGBqo/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQKGBqo/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so6132705e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790441444; x=1791046244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AbvG6DpwILpGJJJKu/S8pOrc1OBCr3aRWelSEGRwlP4=;
        b=IQKGBqo/Et254JfPIRx+7iiDuOAlZ5kaWeRVzMaumbWuFzcbkW9EFZ+1cqxvi5XuWR
         g8qaP3gitUPxfoqrsjjxkMHZoKxqVFfkZIyVPTD9iJMrKe0TSak+SHTM1rT92y71RG2o
         Og8GNTzHWqutgZl5SsabdnWego4M8cghVY9SNjOOCmxmZeSPGrIAp8QcroRBLCowcuwJ
         YUe2dxKTJ/cbTMfFw+amu31xn9P51zIj8HRjTkbh6L6880zzxGKTpbCKZM/sYWOiIq4M
         TsIiWj53h/4ndrDeaZmC4NNdA1iDCqL3d3A4HLPlwOw27tjYGbEzOtZfuZ/NWGdpc3s9
         +tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790441444; x=1791046244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbvG6DpwILpGJJJKu/S8pOrc1OBCr3aRWelSEGRwlP4=;
        b=zMfVZuD4blt3lysOs6f6yF/MyxK1hH8YDBiMmk3E1xi8iahxF9YQsjUenwJ6U1nQA6
         7v2EClcsdU5PSS+oPztavpVsvACJLqFWbLoosacls9tsQEUezMk+KykE8rjzMe1khTzi
         2IG9G4BF3L33CYlporQ8AM+pEkYn54BOy953/PEr6nssXVbblERRnIHvo4+yIe6qFouK
         cCgE3z1uqcE+rzDXD7xC711CGeM57vLE0vCFdBNHmkupt+N9YUpKpNlNF0noYewQ+TDJ
         vdHXS+yYSPQPCHt61OLaGxRXjeHf5xFQeL4cPq4v7vZ90WLQrx0me34ctuQQDK6pLg7p
         5Oxw==
X-Forwarded-Encrypted: i=1; AKwUvBzYnxzH5TBBKT8O876j+Br94xfeR5kM/7xxvZp5AXGVpRzHNmebtZn+K/CD7M5BtdisSRM7REzV4sxtuOY=@vger.kernel.org
X-Gm-Message-State: AFuF++mGEIz2Uw8LYll41B/pNWLd2SPdKZNgd2Ud/mgB4Av1treqAJwQ
	1Gqn6YAuTQFKikaIUi7V6a2cNm14DUCCh5GHgTPvYP3TO0SD8b28XWiw
X-Gm-Gg: AYBFou35NjDC2bWH1fFS88NBZjJmGbBGwdaGYWy9oEvH7iGs5F37UzzUM5dOulvX4T2
	uNiRwcZZJToX9JFAiMWNci+nbByKfYMrAxZs5aot8jIOugt14eApDimnrlorKcouZKcmDHCHcak
	uKKV+AnT7mmO3qnfnkMbKG3PHRecpQ4rsSEqGSazj04UkoLb4CGvMnUjkrVtTUlddHJniL2fvyF
	ojKFCOP6MwjE1f7zgyoZwBSs/unSCllO77pijwtc/XXOtFDrTM7hptSvrCZChFFec4rdPxCrtsz
	+5XeVa5k6ASbCtJ7IIx1lWhWONARIxrGIJ2jiyZRIm5eRBSNBvKNuDYc/8yOzE0rGwbyZ9SSk+L
	olcZ/iT/uZTt+u27GJY9bz0elTaZCqAxPGOrT+G5VduQjY4UD18gpXFopcSew7Yozc+XxFCLAAd
	UMSawGaxgX7msjyUdUR+eawzT1dPd7odrrazp7/mDoRKqj5wc/zv4f8KWu4BoH09TxxLGCehHUX
	ZXq4ho2dagAVkTNyCgDHgRJaL9CYwTLIt6hh7hniqYldN8JCC5OgJoP2HfN7X8gLeT++5HYVewM
	AQvGpKAJ7snmlMRT7n6GwbW2C4YUoHpNH9LqRqe8kODUpx7Y7BzChtjxr8jDVKvfcS7Ims8ZeEP
	+I3DUxw==
X-Received: by 2002:a05:600c:1d04:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-49fe66d0606mr157730645e9.6.1790441444032;
        Sat, 26 Sep 2026 09:50:44 -0700 (PDT)
Received: from archlinux (2a02-8440-558a-f56e-f3da-b3f7-00de-4b6b.rev.sfr.net. [2a02:8440:558a:f56e:f3da:b3f7:de:4b6b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff285550asm90422895e9.3.2026.09.26.09.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:50:43 -0700 (PDT)
From: Patryk Pilichowski <pat.pilichowski@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Patryk Pilichowski <pat.pilichowski@gmail.com>
Subject: [PATCH] platform/x86: msi-wmi: Ignore WMI events for keys also handled by atkbd
Date: Sat, 26 Sep 2026 18:50:34 +0200
Message-ID: <20260926165034.94254-1-pat.pilichowski@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On MSI notebooks, several keys generate a WMI event through the Wind
event GUID in addition to a regular AT keyboard event. Their event
codes are not in the keymap, so every press logs "Unknown key
pressed".

These keys already work through the AT keyboard, so mark their WMI
codes as KE_IGNORE, as is already done for the MSI Claw. On models
where a code does not also produce a keyboard event, the event is
already dropped, so the only change there is that the log
message goes away.

The Wind event GUID is not specific to the MSI Wind. It is present in
17 of 18 MSI notebooks in the linuxhw ACPI dump collection (2012 to
2024), with the same _WED structure. The codes are shared across
models too: the volume keys on the tested notebook send the same codes
as the MSI Claw (0x21, 0x32).

Tested on an MSI Katana 15 B13VFK: Fn (0x0b), mic mute (0x19),
settings (0x1d), mute (0x23) and Bluetooth (0x78) no longer log
unknown key messages, and the keys keep working through atkbd.

Link: https://github.com/linuxhw/ACPI/tree/d6d30c6ef6f4/Notebook/MSI
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Patryk Pilichowski <pat.pilichowski@gmail.com>
---
 drivers/platform/x86/msi-wmi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index c9db750fe5..6c798f6177 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -46,6 +46,12 @@ enum msi_scancodes {
 	WIND_KEY_WLAN		= 0x5f,	/* Fn+F11 Wi-Fi toggle */
 	WIND_KEY_TURBO,			/* Fn+F10 turbo mode toggle */
 	WIND_KEY_ECO		= 0x69,	/* Fn+F10 ECO mode toggle */
+	/* MSI Notebook keys that use Wind GUID */
+	WIND_KEY_FN_NB		= 0x0b,
+	WIND_KEY_MICMUTE_NB	= 0x19,
+	WIND_KEY_SETTINGS_NB	= 0x1d,
+	WIND_KEY_MUTE_NB	= 0x23,
+	WIND_KEY_BLUETOOTH_NB	= 0x78,
 	/* MSI Claw keys */
 	CLAW_KEY_VOLUMEDOWN	= 0x21,
 	CLAW_KEY_CENTER		= 0x29,	/* MSI M-Center main menu */
@@ -66,6 +72,13 @@ static struct key_entry msi_wmi_keymap[] = {
 	{ KE_IGNORE, WIND_KEY_CAMERA,		{KEY_CAMERA} },
 	{ KE_IGNORE, WIND_KEY_WLAN,		{KEY_WLAN} },
 
+	/* These MSI Notebook keys work without WMI. Ignore them to avoid double keycodes */
+	{ KE_IGNORE, WIND_KEY_FN_NB },
+	{ KE_IGNORE, WIND_KEY_MICMUTE_NB },
+	{ KE_IGNORE, WIND_KEY_SETTINGS_NB },
+	{ KE_IGNORE, WIND_KEY_MUTE_NB },
+	{ KE_IGNORE, WIND_KEY_BLUETOOTH_NB },
+
 	/* These are unknown WMI events found on MSI Wind */
 	{ KE_IGNORE, 0x00 },
 	{ KE_IGNORE, 0x62 },
-- 
2.55.0

