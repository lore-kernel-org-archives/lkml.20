Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4B83B5847
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789196795; cv=none; b=CN6PK6YULExbAEJWh/T01f9zAMjaVQtr1XLZwDPUO6241G4MKYnGbLBd5iDt2uYWBaW7dWi+StcKwhp8HMrl0t+wkz9arOR+umQacdgd82R4lgzgJsDnc/XIvRw16L5KkFrGcuofJ14oRdvsKKFpG5t8vHQyYrxWO9jNMRZ8+6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789196795; c=relaxed/simple;
	bh=U8JrI7RP1dXP7kc+B490B10XD+OGKPNOJ3lbTY+Usu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TybrsPlBcPgZc/XfEadxgW+VweXcst1rBqu89jVEqomU2l6c6Qw/W+9s4n0AOY22zUCXVMZG4tlWc13QyMjQauyINPIxefXtH9GUDYXlUjmXusUt3Wn4CLRaF+QrEoqBa3WLsmSGtp5dMzVE0LCmKT0zrhXDVP7Xs8q80P5cO3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qFi+a6dF; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFi+a6dF"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fb334e72so5940635ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789196791; x=1789801591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RFD7e3/Ygy1RhBnoMlc3o820j50hxkBbgirpClRtSIY=;
        b=qFi+a6dFkigU5iXGK3HmRXz3lxVJ0bnG6qPZZOoNu4d0lgC9CqhMVcWLT9AVGi3jZX
         bji/yqOBYNqh+fNsHb9ruc/ZykZ6xAyfckIq1ZAwyBnBGJO3sdOjPMtkohjrBOrvaWNd
         O3+I9h8BvMXPQN6IWyDTyB3JtKULGOD3RuiNjUOSlp6d/V5phEe3iJIAo/E6F7aluGnw
         IJPDy5p72HmQ/SDAIGdoLeigqk4yw0y2X6gcx/8A8Xkfy8z0tlLQqV1u8MozEFEfPP43
         kqvvD35w7RU3lwYhjaf60ssY7pxzNjR8acJbXRZ5AA7/GmBpW1zPPqsXXpoKPCSFp64U
         8KSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789196791; x=1789801591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RFD7e3/Ygy1RhBnoMlc3o820j50hxkBbgirpClRtSIY=;
        b=HnUAZEa6JkDxGJbyuvCkHRNYwUif2pCF6AP+8KJCScSLY7qOa0d3AXHu/AYMZRtZMK
         KWFF0//qpOi+jh92ky9EbRSVrsAgpA2Eh970pLXnTHEXJisKirG29+JEriNm3q2Z5x57
         mVDhHb8Sqh3j0DMdi4WJKMXGs/UiOLJGXu0ZJ1/bGLQGAJbX/7+OlfWXg/WvsYOvVM7y
         jEMR0vo6ARG3b+bjDy0OFgowlwXjp/XDOhGbhb+/Vms6g73ykaU7+1BOFc8hmags60UM
         aabWXHyK/+OhjKcqWKMUMbk3R6yWFBH9KDc6qinadI+nbKZiI7tjI5QvwcwVLYqpiRn4
         WgzQ==
X-Forwarded-Encrypted: i=1; AKwUvByJUiezk7ZzPFRvR0bRU3YR7EA1y7wdZtdFQ4zjh1i6Oa7tB6QAN3eAnfyQiWjSQwC9z7dKUATQrPBTfwo=@vger.kernel.org
X-Gm-Message-State: AFuF++nD85ZmPHynnkd4gJAA50EJ945RbetvmicK8Rla4cZpWYBEV1Vh
	6/kzeeMQ3cWlgc9eNbYrBw8boP4uKDm/pQyvZboqpPXlOAJgHr4Olnl3
X-Gm-Gg: AYBFou3tYGLwsH9vxFvpPCdVTwjU4veKPdVAGFXWOoW3dptIAWfVE7EwVHmPqnDZbsj
	LKwrNEsCljqoeaz+L0crmHGTQLLXymQuqUo6s0m007yHMRQQI5TN16a6+JuvtbHaWWCbjG+WDit
	kYcRbdrg/vIA+45ZbE40xbmDgVWfTzA9Ue/vAjiOQRWtmJW635YaPyR+6KXgOTCQvrAEZWldK5B
	tNz8rK1QAgh9izdftpNHdPR4Fwr6J/8s43yfa0JeLpcU/oS/ReMhxaKjRQIcvCBQckVoB7JhHGf
	Bf6lT/PlNI/Sh7iMMsGTb6ybH06lvFb47GcaFVtlRf3JFUwC/yO5mBuuJuEEt4LkVswgm6zErlh
	/eIPjyY2fZLgMEZo+NMGXnFyTbTDZkqzcvw9BH9sMNKkBSGAn12QheSOav7GWO3Ad58cpjYEHYO
	1ToWQnbWPBs6g+OEDXU5hI7VbXKDHqyya+8rjW1sXXsy8wGSFV8ktZD9c40nSDCSz2zBDOGnPGA
	RSYJW2xmIbS7U7xVqMi7nnhjv/JoQ8UvcKfmXz9ak9GmxeN8POTD1MmPQa8MQSU6nSKwy/oldKS
	GEmmls7W7kcnDry+avY16a1bA9iShyj/
X-Received: by 2002:a17:90a:ec8c:b0:395:4290:46e0 with SMTP id 98e67ed59e1d1-39d9bbe4910mr14949404a91.5.1789196791252;
        Sat, 12 Sep 2026 00:06:31 -0700 (PDT)
Received: from arch.taild3b82f.ts.net ([2401:4900:c0be:f9c:5201:1178:2a59:a316])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm9250140a91.1.2026.09.12.00.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 00:06:30 -0700 (PDT)
From: Krish Gulati <krishgulati7@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mazen001.ahmed001@gmail.com,
	Krish Gulati <krishgulati7@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Victus 15-fa1xxx (MB 8BB1) mute LED
Date: Sat, 12 Sep 2026 12:36:13 +0530
Message-ID: <20260912070618.21272-1-krishgulati7@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mute LED on this board does not respond to mute state changes
because no fixup is matched for SSID 103c:8bb1. The reporter
verified the LED can be toggled manually via COEF index 0x0B.

Reported-by: Mazen Ahmed <mazen001.ahmed001@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221982
Tested-by: Mazen Ahmed <mazen001.ahmed001@gmail.com>
Signed-off-by: Krish Gulati <krishgulati7@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f7786e1b0878..d49a7d59407b 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7567,6 +7567,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b96, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b97, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8ba9, "HP Omen 16-wd0xxx", ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
+	SND_PCI_QUIRK(0x103c, 0x8bb1, "HP Victus 15-fa1xxx (MB 8BB1)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bb3, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bb4, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bb6, "HP Laptop 15-fd0039nt", ALC236_FIXUP_HP_15_FD0XXX),
-- 
2.55.0

