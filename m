Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C74549E156
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996684; cv=none; b=rrzmVzzLB1ALojwcnJjxGheVD674rM1AhLuFw0payLAS1pGQxJTii5ieysn7oyZBebpaPWlObo5K6SkJDFCmogx9tG5YbHaUc4v2zVlfG+eUK3R+MH4MKTi2qZAx9GRo5yl2h8PRoaNkrB2dLX0BXACSXsNWsvKi2DsXK0hfdYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996684; c=relaxed/simple;
	bh=z+KT0opHPPLJV8lq+y8SaNTENcvQ79qUmfubd7VVy1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m8qRJOXIm3EICWY1rW6AZOY71Dpcame4mQfWcFVzK1Eg1QkZpz+5mQYmuOFTKLheGadGYsTZkCMwScQv7pcDzDepTX9LXYWcCC0swLq7pv3+o8Y1XE05jbQtGYQhSZENQATiD1Xwu8tFMkfIidALWJoNXLI3xP7UkI/zuIuqX5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNrWdONH; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNrWdONH"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so2604231a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789996683; x=1790601483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jf9WmBVrLvYjugpl1B0vrvXG7saGw5Sc77C5149Rj4M=;
        b=bNrWdONHkoJ5zjneiBqGk32cJQjar8oyJS8sOFudwcFtE8/dAv5TR8vHqmspmIyjXW
         8wCxkWsRxCK2LWTzAWjmQQgJ7GJo6637nfXmpBLqDHL33chqI+L9Eb56IqVkjaFeaxla
         Zi5WTWH90XCagyibchQkIh43v/cUQ8/GrMFRiCe/U4c/3G383feNLw5gv2TeZXKTuOl4
         gMYFtIhT2CHFFNvfJ4Pm9oQEUAxpsbyv2indvs4tim3kUKUakEDVsK6BSu5juuwHLsY1
         xvsWfm2oJqo2TtfeYjMDJRXjyqN2txfdCuto9oClTu5br+I1j3f4vfQCWlrqAH9lqJty
         XJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789996683; x=1790601483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jf9WmBVrLvYjugpl1B0vrvXG7saGw5Sc77C5149Rj4M=;
        b=VM5MfhvZEoKc1mXEsqsAIMd7einO5YlozJclaIGP1kZgvVvV/2MDBN96kHtk0UzBf0
         Nh1mlIWhAxj8PRZsJGtBHzyWKwExH9dziGXlwOs9UPamaIQEiVK0u4TjIZl4VkM9YOeT
         w+7+yHzrUYy5zsZ5zRqcsLqc6XdjhzOa4B3nZMRyz/C7pmR1uLT8gFEslbYyJS95U4VK
         oG1HYlSfFnDQl4VeM/w5tyzuTst0SqKwjtv8sQgitaQTLYIySmH30veqnVRfrWGiNo4y
         nuQ8Kvhg2RkgyUuTf7sE+TJnKR+wKAG5mUEHUpkT4XhRVPDxYaPOzCaX/9IgupoTA7T+
         q3Ow==
X-Forwarded-Encrypted: i=1; AKwUvBzh/KOERaCU/aO8VoFG0533hI0IH1jX3rJE4dHZypYvzuTOF02/4H6xq1od+MYYBaPoGaAuHRZ0OJSmxV8=@vger.kernel.org
X-Gm-Message-State: AFuF++mOnnmB7clsjw2yP3WFFOgjz8UmgAV85QNh+uzqZPX11Imq827N
	SvUJGFdNGfj5QHoTZC4Ft+sncodjbtc/PIdLAFpE/b7iRYrPOMMt2XuC
X-Gm-Gg: AYBFou3xcE6+SPh9JnN+TpnhuPZYKgoZ28NUKTiEnnl+ZxI2qvwMGELlKXpIAMH+VJ0
	lECi60xITjyGGveI0eeuBE3RJILIAZrgryhA+Zy7Nr57iA9FlaRrtu4tnVZO2Q3wyuu6ClYKUVp
	3NrjLJTvD6mg7BiZ++zrFDTXZBLeW2C9zOUNUT5j+SX2QpZ6rNayFy1phHO/My3DZOhaPHs+Xt7
	N6HlK+UpeoLLKRqWq3Kz5oAorEMMJUqijA36W1mPpOoqXcxRaX6ILa2WoJYZSwmN9ZpUGByQrsb
	kmIJWlrn1tZgP4NhfGQITZtAWGz2ITmekSGkI8U1gR3dzIIoq7WVyYlq740tQQpZcRkPFmKJSd3
	pGhxfpVxFv+SvaVgGR0OaNvoBz7Tfl6MfUtQSDmAFKaHp+B8DDbn3ncWYfONBY6T22sWNVlgrN5
	gujyr3ic2a+et1MpnXrOfeovpzw++B57+xMFbPS62KU8v6Q4syKs+A61e3ElSPfq7pfmcCCWPdt
	KdvlAZ9Z7pngelxbIDXqbAaXvWywWR6bVADW6Mabf6ged7eNKp55ArFJgkVx7cpVaJ2l+iCgHm9
	nTo9QOa6SXDtb4zNYEaBE9KYl9qc8RE2
X-Received: by 2002:a17:902:e946:b0:2dd:c0ff:e72a with SMTP id d9443c01a7336-2ddc0ffe9a0mr89973305ad.60.1789996682772;
        Mon, 21 Sep 2026 06:18:02 -0700 (PDT)
Received: from arch.taild3b82f.ts.net ([2401:4900:ad3f:661a:5996:8705:7fb0:88b3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3314313esm20251352eec.14.2026.09.21.06.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:18:02 -0700 (PDT)
From: Krish Gulati <krishgulati7@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Zhang Heng <zhangheng@kylinos.cn>,
	Eric Naim <dnaim@cachyos.org>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Kailang Yang <kailang@realtek.com>,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>,
	Bob Song <songxiebing@kylinos.cn>,
	erph.briones27@gmail.com,
	Krish Gulati <krishgulati7@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Victus 15-fb2xxx
Date: Mon, 21 Sep 2026 18:47:03 +0530
Message-ID: <20260921131728.8999-1-krishgulati7@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Victus 15-fb2xxx (PCI SSID 103c:8c2f) with the ALC245 codec
does not turn on the mute LED when audio is muted.
Add a quirk entry to enable it.

Reported-by: erph.briones27@gmail.com
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221946
Signed-off-by: Krish Gulati <krishgulati7@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5127a111c59c..617e2500505b 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7603,6 +7603,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8c17, "HP Spectre x360 2-in-1 Laptop 16-aa0xxx", ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8c21, "HP Pavilion Plus Laptop 14-ey0XXX", ALC245_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8c2d, "HP Victus 15-fa1xxx (MB 8C2D)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
+	SND_PCI_QUIRK(0x103c, 0x8c2f, "HP Victus 15-fb2xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c30, "HP Victus 15-fb1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c3f, "HP Victus 15-fa1xxx (MB 8C3F)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c46, "HP EliteBook 830 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
-- 
2.55.0

