Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F672DB785
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 17:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789839475; cv=pass; b=l61GpeBTI6q1seAP0YbuXSu5u9jYQ1dmRAvhr48Iy+1p8fdt9NMtbUv9JR7oySF6sDM0Ihj9mFckMN6yBPx0TU0SAM+zNlZ+4nxEx6xIXxen5MEhf4u0C2UbmOKgbH+gxNvCxjhWNtpZWdYt7bLAjPvyC/yFOE3R1H5OSxkmYhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789839475; c=relaxed/simple;
	bh=3M3Ly8PtfuuDQudfR3+28sw5EfN2/wDbZ9K6hoePcXE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=azZBO0LyQRavaspsX7JXYAU49F1GtiHI3s5hj+rF1G1gFAzpj6unNLdFj1jI2ApCFh7ZeyVdeyQmurRwz22j1HnqUsGHBOA4wmjmI9ovLE0iZROFluaDFzGgAc6CQ6ZY9B8AdI22AQI6hrpdaTj3IP9wF8gHorsbj0rTM1aNeR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3cqfnVL; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3cqfnVL"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c13f2685f2so1063019b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:37:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789839473; cv=none;
        d=google.com; s=arc-20260327;
        b=WZumdBORTcSHLG3vEG3m2GvdBx84f1/UzW0kYXArSmrnM78kv8KfTzAq35IqmeLdml
         tjHTg0yekKYVGqysDFUepDLTPIhK4btJRxpz0TL1jwPuat9pJNC3BOPCd98yxZVpxGcs
         eYq4F/E9+dHUiHS9ujGIopWHdMwOazwIf9HWrEl1O32cHf5WOv2s+Jv/BzVqKxRA8tgX
         ADlkVu6QwJ7S/Eol/IaYcO6PYYI9HWdkTvCjZIgo//dRx5FYNR0hVpkCNr7pPSlrv5Ip
         uRcDmmeTfeia4Qw84nomwTiiC2aNRZO40ElKn54G1MpZFzHVXGy3KSCNCQA+yBiTE9se
         UWIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=urXzmInWVRHneRjWpEj4c3oyfAKdN4ZIpc92YRdUpZI=;
        fh=LB6TI/6jEqRFs+6WQK/7pZQKg+yG/s5iuNbHhDQmbm4=;
        b=pJC33MYr99zLttgrUGwboTfnsYAurk8p9MSaGh3hPulkNkA/qLBP8pxotaxbFAA5j9
         jW2ZDsboG24oLyZNFC4jkMbmxewOrQvkwZ4XdipGBbOsUhaZxPLxxUSq/SaJHlO8+YNa
         aio19x/QAPOI938ZPtqDMNsiEpk4f0GizgHuFqqmIA8cJ/QlHpLhV9FN7yfcLeMV/P2w
         nRwEA0y842W2dcIIP3UDI3zWPWR/48Sqv1B85bFsYgaDZkFXpGj7q6BiyZsH53licxSD
         JJkcb6cP0lHvaa+gP/H3pyhJFUUeLmi4aYA74xTfYGxiT1duKnElsLKUFhBFtUI1dG77
         vQ+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789839473; x=1790444273; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=urXzmInWVRHneRjWpEj4c3oyfAKdN4ZIpc92YRdUpZI=;
        b=J3cqfnVL9RD+0cki21EAZttOH10vGBFnFvC/DByMmpIXEt2A0kRoMYRbTRrxYskD5b
         61kSYjS4J6uitlRBYgN9Ol6s9egI/FcujXizg7FHkx1F0yCP5zU19rEY+rpgAvsdcc9T
         dl0jmmAGCm45L+PPd2lBIlVNnYHyFWGHLDWmvnntivrnT3m4sawxy+7htB6LqMIG2PoX
         E2O+ZD8RySmGIoXNDTOsvf4C/a1c4xRO2rg9EJLzdjVckbMm5o0QxbKEXSM1ajT9G6uq
         SaYBPaYvlGDGvZFKSKdifpRoZr3cJI84TgM3k5x1uQD049F4v1rkXNk1yiSvGyZr6Y5o
         Mlhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789839473; x=1790444273;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=urXzmInWVRHneRjWpEj4c3oyfAKdN4ZIpc92YRdUpZI=;
        b=vPxjWOASanujm3Zug7TShWBnl41sU3t7RNMA0IFPoCAG9gNpuEGIR/xTgq64iY7B5K
         tlvvLGJ5X1SWzJbLYb0iPmK+P8ozgphR5uMAQWuqGrdw0ff1X4gdNX/qxZKIdtSlruh/
         OafOTdDfyrFmOZHeVDM8/stMraQ6xPzTvzqbGeIRT5NCo9QIC0LfqCVSwxsAhvQaTU98
         iZ4bChls4DJOZReGBiFflbDVQCGyz8CRP2K2AGUVtckirhuCcFpmdj0TGEg/6wrCz2Ak
         3V3l7s9Agw8Gzx4cD04fFX/JG6wlIlPg+U5HeiCD9eJ0DyX/pfwbI+9YVSCvjdySloLe
         ic6g==
X-Forwarded-Encrypted: i=1; AKwUvBwG97CSwTwp/y+tnW8ccVEy4XPzA34/1OgDeCMpv/r9m4Yj2jSCnZVFijDHTlm6/vFqCz5RUvmqYAjkMM4=@vger.kernel.org
X-Gm-Message-State: AFuF++kTgRDEYA3im3OiZVMmJHn8veni5qFv8A60B2sbTezB0WkNl+xO
	clb4Zt2LBzn1Dv/cC8e7h4FTanFPKqxd9amHwspdwqArPt5RXgNhyjGztt6E4im+6d4HhWUYqaF
	TiPQ/scFMZNCU3+JK92QUrIQWerUn4uo=
X-Gm-Gg: AYBFou3LNWB3r0q0/C2ui24Cquw4FZDhCeWWdAecCcZyPBOh8ikS47y1tPEeYdmbk8Z
	UzBF4EEqJa5QgoeyCm9rpaIZXXovcpBBK6xo6RE2GdBeWw2BGE4xqud0IPh69hT190jlXZyjkNA
	P7ONGfB5jhGEvJXumSvJCzyzxbW6M0PZh+5oxx4QmRx8I3TXkWife14FGTxSCgLAwB1WohDSm+i
	72ZUZBP+sm57MqbjAQWDkMCepT/LN2WaHs0GlxCB5eXdEk4TRpoW1Up/Pp9cQ2AdVFhQBNQtZ+9
	qwhoKmrS4syuwxM+vZ1HQOfSLOkeZJK6u71BhqjcktGSRncIZ5b0h6/FhCjoJ0ZN3w4jFc1niX4
	RPhZOgmwlJMUAPSG2MksulOAko3OjDujt76djQSeGlsAOlIgtfjgHw36X0XV6tAvVUE7V/PM6yq
	GF+UdVBL8+W+NO2mbDSLffiQ3aU0mpdDM=
X-Received: by 2002:a05:6820:188f:b0:6a3:1dc5:3570 with SMTP id
 006d021491bc7-6ca9be4ff96mr5127192eaf.31.1789839473388; Sat, 19 Sep 2026
 10:37:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bartosz Brom <bartosz.brom06@gmail.com>
Date: Sat, 19 Sep 2026 19:37:14 +0200
X-Gm-Features: AcwNN1VoogZIq0FCgYpuaMQJlESNWEeYCUSCBaNQtgaYhZ4PzJxlUMUv0QsqjvE
Message-ID: <CAN3WbsSrR_gXGO2Dco4kBuPOw5LGAzHFJgeTW6rXYYvvjkC6Rg@mail.gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Laptop 15-dw1xxx
To: perex@perex.cz, tiwai@suse.de
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The HP Laptop 15-dw1xxx with an ALC236 codec requires the
ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO fixup for its mute LED to work correctly.

Add subsystem ID 0x103c:0x85f1 to the quirk table to apply the existing fixup.

Tested on an HP Laptop 15-dw1xxx; the mute LED now follows the speaker
mute state.
---
Signed-off-by: Bartosz Brom <bartosz.brom06@gmail.com>
---
diff --git a/sound/hda/codecs/realtek/alc269.c
b/sound/hda/codecs/realtek/alc269.c
index 5127a111c59c..bf7a20404233 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7388,6 +7388,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
        SND_PCI_QUIRK(0x103c, 0x85c6, "HP Pavilion x360 Convertible
14-dy1xxx", ALC295_FIXUP_HP_MUTE_LED_COEFBIT11),
        SND_PCI_QUIRK(0x103c, 0x85de, "HP Envy x360 13-ar0xxx",
ALC285_FIXUP_HP_ENVY_X360),
        SND_PCI_QUIRK(0x103c, 0x85f0, "HP Laptop 15-dw0xxx",
ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
+       SND_PCI_QUIRK(0x103c, 0x85f1, "HP Laptop 15-dw1xxx",
ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
        SND_PCI_QUIRK(0x103c, 0x85f3, "HP 250 G8 Notebook PC",
ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
        SND_PCI_QUIRK(0x103c, 0x8603, "HP Omen 17-cb0xxx",
ALC285_FIXUP_HP_MUTE_LED),
        SND_PCI_QUIRK(0x103c, 0x860c, "HP ZBook 17 G6",
ALC285_FIXUP_HP_GPIO_AMP_INIT),
