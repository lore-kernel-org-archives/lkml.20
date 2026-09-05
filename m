Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A737314B95
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 08:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788598215; cv=none; b=uWIZL1v6jgoJF77ipMvEJGByGgoXkSzk8T0L3+1lmialJWXlskFEUg1L3a/OZM8vWAjoJXGuntxspOg/hMHIWLyzVHmNjig03usqyxaXgEwfVJiQbuM1SUlo7n624J6J7CpxIJ0TmZY2CLuDURCXMshDpUGxuB6NwgfJSN58c8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788598215; c=relaxed/simple;
	bh=418GUUCHPriYoCUp96gnknZxNvDG4KIlym1boqpP0rc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RqCr59GnskiZArrMAXdq/o3BJoMSLjAKDnhgzRoVgD0STjfpjOd0e+IccxMvy7fKRdXarpMKB2HyE6C1TPVCHLz1FfzxZDUDx2ux6Y2rj9M9ALIma2EnuQx1cWWKDZQlWbKau2Luj81wHc9/6Fpbe3COtPHYQkrAZZWME0ksyig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJXTtBmH; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJXTtBmH"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2db3305f94fso2089575ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 01:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788598209; x=1789203009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wi1PNVlf9ygKz7D9d545aLc7cRBusDmxm541j+QdCUI=;
        b=FJXTtBmH8oVgCY8S+WugEHHy2hRMiZO2kvYNnQkbYLZNIi07JneE0g+ml3Ak8xez4V
         ILu9stX6ZYrLsRTG844fJxrYIRLa+tJR/LHI0BeSm48kyHmTaEPnwTWFiRMGb173kQXI
         YVOCV5siki3s6qI0AwXCM/KIPLECGOuFqX1jbciA3C7HW+nEibLAsoXHU5iVa64AKwor
         Qxx76kb1KpC2zNfxOKsqsjPJOjWjcI7HRjLGt5GNz3RUxisG5hloi5Sml2mEfDxYtHhx
         xD6/O+mLxuiYXRzdgPK0k2DQSCYEZ9QTwiIIbpwiQTeO2m7qs4aH7pc498UMPyPFMlOr
         MdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788598209; x=1789203009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wi1PNVlf9ygKz7D9d545aLc7cRBusDmxm541j+QdCUI=;
        b=eCJSxXoS5fvga1hnYXXA41VRRdWRViMXRhvDRCbhQbikadFRH9s4LiA8FgtQYo45ek
         fuIDurjUWJ143+0F1cLbuGTSD4ccuh+F18B8KSyBX9rXogNI0ROvyPXP63chGm7X5Y9Z
         PWM2wcBXuJZP/c7+daoRe1pRAao40DWcq+AyWzp2PlXCFqtrxRvN4qEaLp+ELD25sGV6
         V3yAnKYUpg5Ma/SdSK2HAb8m0qURM7kGEuTHLicvst3O8zAv9IHymnqjLIeosp4MiM4N
         p15fXTORf4YSDSQdp9Y6SpbZiDYQJhUF1RcbwA8+YKYMWXlSXVjex5gB9cR46RXweY0I
         ihpA==
X-Forwarded-Encrypted: i=1; AKwUvBy3aKHgELdRlAsOdyv5XMw1Q226nAQWk/fnUpmUmHFLVF7CSoCziWXK7zWLGt41tR4cZ7k+BgrEMEZ9NcY=@vger.kernel.org
X-Gm-Message-State: AFuF++lVmC1KdXvaifG36VG4N7E/PVLTWOsIQVYeLrZ3Z6uhOBhcFfg7
	rLGy/TdBcBDew1/jm6YYFF6f4E6C2oYIwultVeKwqqxXWQGAlkYiZDdS
X-Gm-Gg: AYBFou0BffrVEsx3JbP+JelXIAcHAgxU8Fr8UcuiGt1G6XLPra5kF/GBkrIhsY5b5Il
	AsLASqRiKKsW3N3spP4seI9dp2mWhasNdOc391amWHGL9upnXZ1VKbQ9jXQcDHXbyjPJigln1Tp
	Bgwh43uurRu9Elv2uNj5SkFWpFLLFzdyyxBXTgz805RQ5T+FUmS60AbkBN5Kt44luiz2Y4EfRSg
	kfep47l9KP7w0Q3PGgvR35TC6wBf8EvOmhg9fNBeX3MNPbS4ih23h/a7lLSIQF058QaKSrxsHyI
	dycmMWMYd01BZROJvsssmAWdE6i66cevYlFaItdQiHJG2APRWYigXvn7W1tTvOjmZjFU/ZiXY1V
	wqJNWv0JRN8Lb3pa56lsaALunM3XsLCCxtnZx7HK47UjP3z1oya0IS2SuirGnXfOs+YbdN5LGFT
	LRFfqhwNh6jyGrPRcWgHoWMGCbFq+d1W996ELy6izdkmbVtQAP+CAV11IA/gvQAYTf6Lali8V+S
	7DAs6g/7iMZnZBip0Tv7iBhz4uaAd14iKCgmxPfZtLgS4ct4iruQBdSjksnWZVIx8M86RPWvSm/
	TpfgCjfYfLvImn2+GfnGww==
X-Received: by 2002:a17:902:8c83:b0:2d8:d4cc:5bb5 with SMTP id d9443c01a7336-2db128a7a5fmr111814335ad.21.1788598209380;
        Sat, 05 Sep 2026 01:50:09 -0700 (PDT)
Received: from arch.taild3b82f.ts.net ([2401:4900:531d:da35:5001:ad51:d51:ab15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm11899378eec.18.2026.09.05.01.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 01:50:08 -0700 (PDT)
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
	Krish Gulati <krishgulati7@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Omen 16-wd0xxx mute LED
Date: Sat,  5 Sep 2026 14:19:05 +0530
Message-ID: <20260905084951.9595-1-krishgulati7@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SND_PCI_QUIRK entry for HP Omen 16-wd0xxx (PCI SSID 103c:8ba9)
using ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT, which controls the mute
LED via a COEF bit write on the ALC245 codec. Without this quirk,
the mute LED does not reflect mute state on this model.

Tested on the affected hardware; mute LED now toggles correctly.

Signed-off-by: Krish Gulati <krishgulati7@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 95b40a177d2b..740476a9a344 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8371,6 +8371,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0xf111, 0x000f, "Framework Laptop 13 Pro PTL", ALC295_FIXUP_FRAMEWORK_LAPTOP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0xf111, 0x010f, "Framework Laptop 13 PTL", ALC295_FIXUP_FRAMEWORK_LAPTOP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0xf111, 0x0010, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK(0x103c, 0x8ba9, "HP Omen 16-wd0xxx", ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
 
 #if 0
 	/* Below is a quirk table taken from the old code.
-- 
2.55.0

