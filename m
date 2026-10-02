Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BAD3B42F8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967620; cv=none; b=flsyO2K9tGlHA7bgELtikDiOzzXzboeD+XtnDeRgpSQoWNRx2weRBZEfj3a4lFvTlgvFpXy1zdnkE17EFgldwPpiYwbILyTx0DjPkvlo+0u/hYUJ5jDRii9meNNb9oa2z2bESGmJwR24KFmDjC9eDN2hchxhvaJ/caSNcM8v6LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967620; c=relaxed/simple;
	bh=sle9x/1Q0G9d8U+UdOgzu83ljE1Tckn7BBqryy8VLIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t75tbKBQgttpNC0wrCTGC9XeHUZg3rLeZSQf7+HQslcIi/UhL9dZTeVcmYysmiqoFX2TwyHcFu9jMqTz9HwwbKa1QDIIPqyz8+vJcDg/n2PTaRhE5b50mnfXSfAbtlBXdiB2VqcK5G4rdcQuyDE2BgnT1Hs7N+sh4fIAIhFYdEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=om3xXNhH; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="om3xXNhH"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-81b0fe50b37so103363a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790967618; x=1791572418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2aTQWcUPu+eNeNnP4XiNkIY5GhxDkyW+dK8aZP4tnLM=;
        b=om3xXNhHd5ElewzSQUn0ZdzXjRVDFFC1cdL8c5r8N7fLkO4MBRvxQGmiCjh4FlBM8U
         cD8WvCiFbfGSWALpShf+a4RLWOlAwe458AzJDBgObcqu6R6nDKkqj+iVkLBggSYZRA/n
         u2lt3ZeailSfdWbsg0CvTZT4DSVj3HciftQslZlhmJZEglit03AAtSZM7C1Y7EYv+ZtF
         xP8Wj+gAHbsxriQ7UC9WeC4AdnWPh19spAyWRtAQCZzgiE6FOKRR62Z58Z3lZAqUswHc
         AnfBLxhW7F7+GjPf6McVu61Fpcj4LOeUDaRRp1NYoTon7UJv21Jjjl+UeZu6dSoRVAud
         GULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790967618; x=1791572418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2aTQWcUPu+eNeNnP4XiNkIY5GhxDkyW+dK8aZP4tnLM=;
        b=Q+ESgM/IhchDJw6ZUqTTZUMvbz/16GWEJ7oSrOhIbCNnJMkRmJxDJq6wwPyW6DBWKZ
         kXbgdtN/TdeZY0M/tPKrjBQQ5qeHnEPdu8G0jQ3DzdnUo0+LeLtQLbDFNE52zGuseXm+
         vGlnGtTwy3NcFzrNHKWhtQgGq2nwkDQTQaBXA9uAIvE/O6GdmkEbr7qG6UX0E6QAArVq
         qDXeozq3k9C+lwvcQiN7ADamZq07XW6MxdEeASAPyPhv5o5WrrRLxRt7RUyR+c8Q8ITL
         wxApnUFmGoiJ3f5QLeAoj7bJPyU62/REyIQQ2QJQ8J5klNZoeyN0wkkHKppfG8FfsB+y
         hwjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzIRWK44fMALq/jgdBXgHZxlY1agzH0EtcLo85yyXL5W8QHn4orpJsanrClcFzP4ucpm2r/gu+FoTYI0E=@vger.kernel.org
X-Gm-Message-State: AFuF++lWrkn41ggExWZVUP+wtrxi3ma+8G/hmyjXXrEwyN1rpIHaNx3E
	IO0S5LUUH2Pep/L4/T6TKu0422MI/FzbGX0lsxgzNAx9OvI9KFViUGUkWnG3mDhFpV0=
X-Gm-Gg: AYBFou0Z84QqQLNLu8DVSGLN48GXTolWIaEVRlAbdGfRDldAgStEvUntSHTsSrgvHG2
	BdT8oUD8o/VVtFXJQSFhO52gGX9F3SRTnIZm8NOlJbgkQwpFFHntHsfN16/3mh99DhYnSXGs2AW
	m4cnzscHpOENonadRSR1WwTNt/XjjDJccKeYxlfBRdCByRmLAh0d8gvad1TNPixHgSxrNdRTOJu
	bE7VxhZrUypHSAomKNE81K6kpVF0XvoGjxU9qRUwz2CDJWh3Tpfm9Ge9WdPxb2aINjMGVF6BILQ
	nSJMUu/gysIRAE3xAwP9wIPTfzbCM+JePrzCyarHbRwIs8WnDrWBU9VL+dTKfofyxdlq0z4ZtGs
	tcoT9MTulMO0Fn2mGhZDdsT3b2lEg96R8Nnw5L7pmTMiFxB28xF6YyF9UuvL5UwkZNHNMoUs+DR
	BDZOAPPSEFjL3mkSCzQ6J7DJ2jcWk9Ts5tUkZUJ/bH6EXi5wxG7782UnslkY10iWScmXqcQX4u0
	8VxpXr9NbPFOIiVoumAyzJDWVwebLAiX47saENiJsgbd7iX9atuJJAEi0bBeoWjDNqCXsodS9SD
	fKlxNCfOBgJvfdCrNgUKEw==
X-Received: by 2002:a05:6830:83b7:b0:81d:c548:292f with SMTP id 46e09a7af769-823fce1dfb4mr350069a34.12.1790967618248;
        Fri, 02 Oct 2026 12:00:18 -0700 (PDT)
Received: from jaidheer-eg3036tu ([97.98.171.66])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82279e73822sm3796957a34.16.2026.10.02.12.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:00:17 -0700 (PDT)
From: Jaidheer Sirigineedi <jaidheer7@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaidheer Sirigineedi <jaidheer7@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 15-eg3xxx (103c:8bfd)
Date: Fri,  2 Oct 2026 13:59:51 -0500
Message-ID: <20261002185951.33855-1-jaidheer7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mute LED on the HP Pavilion Laptop 15-eg3xxx (PCI SSID 103c:8bfd,
Realtek ALC287) does not work because the machine has no entry in the
quirk table. No fixup is applied, so the mute LED is never driven, even
though the mute function itself works.

The LED is controlled via GPIO pin 4 (mask 0x10), which is exactly what
ALC287_FIXUP_HP_GPIO_LED configures. This was verified on the hardware
with hda-verb: setting the GPIO data bit lights the mute LED, and
clearing it turns the LED off.

  hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_MASK 0x10
  hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DIRECTION 0x10
  hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DATA 0x10   # LED on
  hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DATA 0x00   # LED off

Add a quirk entry for 103c:8bfd using ALC287_FIXUP_HP_GPIO_LED.

Signed-off-by: Jaidheer Sirigineedi <jaidheer7@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5127a111c..f4bea59dd 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7598,6 +7598,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8be8, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be9, "HP Envy x360 2-in-1 Laptop 15-fh0xxx", ALC245_FIXUP_HP_ENVY_X360_15_FH0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8bf0, "HP", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8bfd, "HP Pavilion 15-eg3xxx", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c15, "HP Spectre x360 2-in-1 Laptop 14-eu0xxx", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8c16, "HP Spectre x360 2-in-1 Laptop 16-aa0xxx", ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8c17, "HP Spectre x360 2-in-1 Laptop 16-aa0xxx", ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX),
-- 
2.53.0

