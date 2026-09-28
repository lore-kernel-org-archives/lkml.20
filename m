Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE0B4A4850
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603033; cv=none; b=HXLtSfxqEKtUdop/F9UHlWZZKyuDbyZHowd5o9qBF/liPUQ5/vsC0i1KLZKXvUJpQ9kXJ5vs3eAZnFv12IUbLJ6+9lWlFbkkQD1zrNy77D/5s2eS8QDWXPhgoGAfUxQBVZGB/Cv8XE0bkJTvSAUaerKr8X2p05Cnm1fMLAZ9sWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603033; c=relaxed/simple;
	bh=mqNxGtc2qZj/pB7g0jn0pOCaDg7IRzMAZBIJBCo08OU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fjeFcpWnjqeO1t6dXf7BzWUGCQ4MC3ysV/ij8/pVi4PLK2QJJBU5JXUfM8XFiwR0RGDZ+rsFk/e7p2mSR/iiqXE9L9jQrBSTCGUBWX+Hi2iVWuabCDWNy4ri6GOm0vba83Hd5Zy/WZXLhXdT8AmvVaoXq1dx5QqYQ45/Hm0h/k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCXhdDb/; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCXhdDb/"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8f333dc2aso1400786e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790603030; x=1791207830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rOxLA1JMar839B+IImDVjERCRoDtVDtOiXPwWspWPbs=;
        b=MCXhdDb/C7gP4lQMUDt2nKxdxuObflbIWptqR2U7x2Zp5pvjFMeVFyReBGiDgIsGhv
         Tvql8afgX8JmywfJ9z1k7P6LM8s6wZCVHZy5/vt9PZ6lmohjCx4Tc2PgIxYWu0jbffPq
         OfDsIgr7av8b3+VvEzvlgEqWYw08EAONapmpJ6clqQBZpp8YXojMa/FZivRIcNC/BvYQ
         wAjGLs7b+66ZzFIngNXuLP1RnOJIJs7DKoejfG6RvaFX5w4Gjq9N927fHJNOZsAaj9BH
         o4hmHh7xZL9KPhxmtSGqGfUMW/zmANVnUIwtJ1ut7kxvVdXbTUmyh26IFXWiEHtWDMPI
         yZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603030; x=1791207830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOxLA1JMar839B+IImDVjERCRoDtVDtOiXPwWspWPbs=;
        b=stWRaVs3FqZb9noGHwG1hlD7aLkX5cjs1grNtkfdr4vzY1FSTBKia1BqeisTmNsikU
         FTQZa6ltIgEC9beaRfFtj64OcKcuOwfWdkpsaN7uQS3tKz9WhG+crLjQqGhJismgnQv2
         HsI4B7RgNyvEWlKG4/EvGEqGPkoxDhy+Qf6o73hSgdDXomiao5QACneFh5deSXZOvGOY
         CQeMALjBIBjj0YGbZ/n+SiBTgdnsXRHZJT+jhOn9SzzFHGUKvmAO3vRGshZEoeBHQ3dD
         t3LFTtDZ1Hx1WCX2yxJeQAfjgOCIKk+gb9Z2l+5HgXTiuhjEH1kwcHEhKewXJtFhKq3l
         IqAg==
X-Forwarded-Encrypted: i=1; AKwUvBzxfobGmMPXcdlWmZCNBiPmarsBkNip/rzVfQJF/CtJH728H2dXxZFoIPHA05HLycmKEtjeV4XYReZpu9g=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2TuQ2+GIehrVdJ5f/c+06AGgNtSc/P4VdXvVfOIZr69GGJTlv
	YbccfWsoxNb4PCx9SSb73rIIqDao63W5oviaY4k/dQnzbnOlcN7dIA0J
X-Gm-Gg: AYBFou3EzRgSswNJBeAq/cwhzCoIVfFSrnuohb5ilZRaJcoXhOnqxLEvdBTkIRbVR5k
	dzH4SNbJME12w9KrHjZWLjHjrnSIT/+fbUX61pG+XYniJuENp2YR9Ckx7cjcRyCW0MwD8nti7bq
	RFaengNpWgxd5Qf/hPoYyYFOGxJ1YEMjknKJ5fuEygF6iMzut5GXNei6g1DMPGrjGPbKRJAOMH9
	s61+O5+z9z1/CupaHTCPuHj8qF9zTYrimdXUhSuVsVo0xXFUYyWGImgyXBphHmI7fEg13GOEgRh
	RWK9MTmEIJrD7HkY6xtMLj5u7cOO3EuvGUqwOGfOV603hXHueQuzKgzqQES+W8aLkpEs5SFnZ5x
	3CqiO7jBYEx9i5aBenmIZLC2BK/vrHeZjMNmvXrqMU1SblhwuVvlOQAlkQggIdZYUtqlMFtZR2j
	OfhV8ppL8nAeFl+L2lCuNe+NXFrvq0RQf8TGN0tLacewBxUcXL7SdyBEnucIxPOBn0PyMtGm8n6
	plewhI9RCmcmteL57QYDlyX1ZeAXIxc8CAmrLAXDg1f/GxoMKO9XbvuLRE+xp5+Jt2yfj7QElg0
	501TI1cF2V9x8zHOzKjTMjD3p7kLxqLHe7g=
X-Received: by 2002:a05:6512:b28:b0:5b8:f7fc:959f with SMTP id 2adb3069b0e04-5b8f7fc976fmr1468909e87.60.1790603029893;
        Mon, 28 Sep 2026 06:43:49 -0700 (PDT)
Received: from DESKTOP-P8LEVVU ([2a02:2a40:1afa:d200:255c:8e92:476c:7c40])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb25a9sm570634e87.44.2026.09.28.06.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:43:49 -0700 (PDT)
From: Bartosz Brom <bartosz.brom06@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Brom <bartosz.brom06@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirks for HP Pavilion 15-eh3174nw and HP Laptop 15-dw1xxx
Date: Mon, 28 Sep 2026 15:43:35 +0200
Message-ID: <20260928134335.1875-1-bartosz.brom06@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Pavilion 15-eh3174nw with an ALC287 codec requires the
ALC287_FIXUP_HP_GPIO_LED fixup for its mute LED to work correctly.

Add subsystem ID 0x103c:0x8bc7 to the quirk table to apply the
existing fixup.

Tested on an HP Pavilion 15-eh3174nw; the mute LED now follows the
speaker mute state.

The HP Laptop 15-dw1xxx with an ALC236 codec requires the
ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO fixup for its mute LED to work correctly.

Add subsystem ID 0x103c:0x85f1 to the quirk table to apply the existing fixup.

Tested on an HP Laptop 15-dw1xxx; the mute LED now follows the speaker
mute state.

Signed-off-by: Bartosz Brom <bartosz.brom06@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5127a111c59c..daca68ece94a 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7388,6 +7388,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x85c6, "HP Pavilion x360 Convertible 14-dy1xxx", ALC295_FIXUP_HP_MUTE_LED_COEFBIT11),
 	SND_PCI_QUIRK(0x103c, 0x85de, "HP Envy x360 13-ar0xxx", ALC285_FIXUP_HP_ENVY_X360),
 	SND_PCI_QUIRK(0x103c, 0x85f0, "HP Laptop 15-dw0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
+	SND_PCI_QUIRK(0x103c, 0x85f1, "HP Laptop 15-dw1xxx", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x85f3, "HP 250 G8 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8603, "HP Omen 17-cb0xxx", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x860c, "HP ZBook 17 G6", ALC285_FIXUP_HP_GPIO_AMP_INIT),
@@ -7581,6 +7582,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8bb4, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bb6, "HP Laptop 15-fd0039nt", ALC236_FIXUP_HP_15_FD0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8bbe, "HP Victus 16-r0xxx (MB 8BBE)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
+	SND_PCI_QUIRK(0x103c, 0x8bc7, "HP Pavilion 15-eh3174nw", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8bc8, "HP Victus 15-fa1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bcd, "HP Omen 16-xd0xxx", ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bd4, "HP Victus 16-s0xxx (MB 8BD4)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
-- 
2.55.0.windows.5

