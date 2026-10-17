Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0485231E83B
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792198253; cv=none; b=sE9OAUBPmx0nmv7+TJTfaottdYiCdS2TC57Gu9jYjLAg2YAwerUh0jTZV+49JP9pGkGcyGvy8XecWe58rwRe8s4ySG+OOaAL9g6yjHFHKsAKJRgSSwH73Kb/FdiZe9UytO7dOe4fI/0Cjr8ANuBMJqMWKrBkbapYtE7z0Mch4MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792198253; c=relaxed/simple;
	bh=5V8rinvEffdQKrE933/i9Jyx4668IhiI+lCFsqIuIZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hpTA3tMUHzbsAfU6eQNuv7dsbRggpKpwTuNXNgFeq6+Wja3uJUH8ogWNTWyxQ+DLRiQO2ZV95cX1tUL7UStD3NYWMUfSI6TGRfAjt29VrtIJHTFoc+CYIaiv76LCKRvP/SgcwGc3Ahl98OxvVupA9oUwsenQe9sYXdkvpt6MnWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gehfVjRO; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gehfVjRO"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-53a448f86e0so340860b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792198250; x=1792803050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t+hJXj8wwiIb+5no1EG7QW0zHdqHn0SmMCU0JKT/7aQ=;
        b=gehfVjROL79+MsFFUIGuyrVCyf4r0h1E9bbuMkuV84/ZaS1BwEL0bfHMAmD9NL2VdT
         GVGgeVmy9nHjrYYdRxGcf4k8xAGFVGvr4GjaYYzjxLy2XwC73Rnx61QunLMUUpIAA5V2
         1feC4FsXQzc2xYeMFys3cNsMjtuoERILxL2I5uyETcQESlwmDz3XGLa6E5bjpBOjQ7I4
         CbxyDQfqOupAGlslzuAc81M7BtqsixdKmFME0zcKvWNvdddxElXC5NPB1PGgsm5IBU6M
         S+YBXEkWhPnboNMtZSTzrg4jXGn0WJ0oZlyoWD5SpiY6OzCrhHwMXslGPOaJjeAnLZwl
         nNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792198250; x=1792803050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+hJXj8wwiIb+5no1EG7QW0zHdqHn0SmMCU0JKT/7aQ=;
        b=beCCXzK/S1i/LgBY1bkm+sGCkmvkYCh2vqOr/qYZ/7fMddVX9oAR+gzowf+QJcdxUi
         /jrFPzNWnBpgEL/fwDosQbzNpbhUTx+WzT2IvR6uwTSbZhhS8wHN6R3gHJNG0F1l9869
         9+/axwI8EOR2AHy1TUJJCQG6S5wSUgeMbGhh/xUaGSBCDl3ZVS+Wyp237+1OUJ4vXeLm
         8Z6R9ZvtDSqp1crJvj+gvQ1d1t4Hjj+jTwgqO3x9/XFDRlsNxbbqjAwNvjzbjrYniURk
         0CZ3okdzmmKHlB92YHmSni79AuqVEVxJyIC1tzFCak72vi3FL5sJEDuKGw0hwEgYJShV
         BxLw==
X-Forwarded-Encrypted: i=1; AKwUvBxISdK99dgVCQWN4jYkd2NMCnd18skez3X/rD9e4XB15fr1oy1x9s0qYb31fkD/nxasRRSJPCURH+Ycv4k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcQsQrgED4Rd0NRZ/BiJAg3G1xp4nmYiBgmMuXGWSsGnnNIKQ4
	vZFCWf84glAH8GvTAA2yQz4uoRBx6EgDqgj0yhBWJoTYHj1Vvv0b5Ahz
X-Gm-Gg: AYBFou2gxZ6U2Wa8/ERTI2tjjEucgq/ZY3QC+oquTQ+7BTHIXdmXyR/c1N1m0hI8Ka9
	aEzvPRB/oCK8dC7FU8sLwXIDp7I7mb7MMbwdbegbOJJDdFkWZQzZmZxmgbUYBSJlcS1t0Qa/Qhe
	LHJ7YGjlRwrSvCLadBSPYX1HirXMwdtyx9nxUp/1iRQ7mzo2NrsAgzf34omTl7g24Q+AP2Jh9hA
	R5sI6v0K4vua8WYDTCqdwjLzQJnGX2wlEbw44NtKINrwafvpYG67EH/gQE50kIYZnCsogQtdBLd
	KAuHNxZA3A5GK88EcGK8ZZvLIbA0zTDRA3YipizcStj801uDL6rP6yG4ytuvm/v2IEuZvYQAuGv
	hBLKlAAh14aMI/8GtSGfLHbz3tDjPFrOpn8uuz0OnlEL+q5WOKbkH2D7GnI+41rU7W0heI/2nYH
	cwXvoRAWaq6Yd50fNqeOERiqOpQ1K6SPIUJuvYQa2Ph0soz0xN8x1Y63Wg98mLmoU=
X-Received: by 2002:a05:6808:1245:b0:537:3bdb:2d7b with SMTP id 5614622812f47-53cd247bf4fmr1239261b6e.11.1792198249790;
        Fri, 16 Oct 2026 17:50:49 -0700 (PDT)
Received: from fedora ([2806:266:482:9274:1367:9be1:68ed:86d5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73b63cff2sm2843941fac.7.2026.10.16.17.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 17:50:49 -0700 (PDT)
From: Luis Gerardo Lopez Hernandez <gamaerry@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luis Gerardo Lopez Hernandez <gamaerry@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix internal speakers on Acer Aspire AL16-31P
Date: Fri, 16 Oct 2026 18:50:39 -0600
Message-ID: <20261017005039.9139-1-gamaerry@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Acer Aspire AL16-31P (Intel Alder Lake-N, Realtek ALC269VC,
PCI/codec SSID 2782:1718) has its internal speakers wired to pin 0x1b,
but the BIOS marks that pin as not connected (0x411111f0) and only
exposes pin 0x14 as the speaker. As a result the internal speakers are
silent while headphones, HDMI and Bluetooth work.

This is the same layout as the Infinix Y4 Max and MEDION E15433, which
share the 0x2782 subsystem vendor. Reuse their fixup, which configures
pin 0x1b as an internal speaker and limits the internal mic boost.

Tested by booting with snd-hda-intel model=2782:1705: the fixup is
picked, pin 0x1b is used as a speaker output, the internal speakers
work, and they are muted when headphones are plugged in.

Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Luis Gerardo Lopez Hernandez <gamaerry@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 36d3bc23a..2a0d25493 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8671,6 +8671,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x2782, 0x1701, "Infinix Y4 Max", ALC269VC_FIXUP_INFINIX_Y4_MAX),
 	SND_PCI_QUIRK(0x2782, 0x1705, "MEDION E15433", ALC269VC_FIXUP_INFINIX_Y4_MAX),
 	SND_PCI_QUIRK(0x2782, 0x1707, "Vaio VJFE-ADL", ALC298_FIXUP_SPK_VOLUME),
+	SND_PCI_QUIRK(0x2782, 0x1718, "Acer Aspire AL16-31P", ALC269VC_FIXUP_INFINIX_Y4_MAX),
 	SND_PCI_QUIRK(0x2782, 0x4900, "MEDION E15443", ALC233_FIXUP_MEDION_MTL_SPK),
 	SND_PCI_QUIRK(0x2782, 0xa128, "Positivo N15RPE-S", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x2782, 0xa212, "Lunnen Ground 14", ALC269VC_FIXUP_LUNNEN_GROUND_14),
-- 
2.56.0

