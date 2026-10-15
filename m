Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0623A4F68C8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792106584; cv=none; b=BvG8ucloJqTprlVVSnJj25gPFsq/3ZisWrM1Nyu12En8e21GSp1RRSDwn2TP/V6ZB37ZXRdokSFNcNZErXf7EXbFbDd2laopwEpb7J5tVaqeyfQVC8OfoS6M6mGiWhLd2lZdEDeX+CzbBfUTj+Sz9q7+zvvst7An2upq8lHXRJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792106584; c=relaxed/simple;
	bh=NIVzQ+RJCCvoNJTkWGq+tQGBzXKOSJUfZgl5oF2rlZU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q6WFTetghF/LEDrz9PhqLleqyfrl6p8yY097KHgcyrKCXE5hqdf+1S0+rgha1bupdH7uLIsX2X64AAFdSlMGtjzH/DGw2BW3deCatXoU2u5FhTIyRT+KBNlQ9Z8ImH9KU08jnYEapwGUSVb43TNDuS1vD15ea6/G61zoNyUrBBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mF1m7ZBR; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mF1m7ZBR"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-533861a59b8so21965301cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792106581; x=1792711381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=03oMX6BgLkysOvRrvfzzjSMNwOnFtfGZ6sCBy/TZ3gc=;
        b=mF1m7ZBRox2MnjjljYs2DutrrSuifZUKHXoPKse9jsGLSVLyODBdFiIAHJTY7nR9Yh
         0Ad348k8kD/aQ///RNS9q2p4SfbdvM1SiTtjkNztB+PHSBwnZ+2mxvsoub/REETj9uIV
         2saJc4PFWqSSCyYlfsds2JDonAI603nOrtGEXxsn5H0Jyug8ISRui78M1GUDOLwunHsH
         2QMXiXnvS1CJNUntOsMWjteZ0p7RntkVhFWTdxbvaH+Fvju3R7wNoc8aS35VPOWZRxM0
         xGEVDNL8K1JeeoK57VH/wf2AwgfW/O4Dbs+MisSiszbZrPIDR4MmJCHMbQheSBEJpbCf
         o05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792106581; x=1792711381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=03oMX6BgLkysOvRrvfzzjSMNwOnFtfGZ6sCBy/TZ3gc=;
        b=jL1W7qR+Smqu9kzZFS4cGb4dGpbzJuIUFf/mO1EVUbpXNy4CrgxynNWdBPU2r5BhrL
         H4+JqFkxvZbioHfdgPGQGnQsUK/EdRv+QvFP1kCoByoxdJC0S/BweJa564JmgpqXqfrg
         Kfnk8nKvmDrgYUjz61wl2BxDRYZqze16rQS3HynXV4xIL3BtnjO3ORj7DUg/oJnJzVyj
         1FIg5jHHB5TPJJ+ZtoB3qkPNgHiYavq2lfsXJmovPy/RF6/hbtMI7MTa6RwG4KrZFxpN
         c8bNN9Y4D8KQWBqvTPeLtDT5Z6IslKDJZ6E+ZAq2AJwlq/KoTramAoNfwHZFLWr+bDtP
         ynAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGfVIQIeZ1+597RWUxiD6Pe9GSncjVgTMJYMcb+kcn2hvIp30enydERIh1iC5RGfkqJ2j8r3Gtn7B5MfQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhUe7hgCidb++l/i8vzoWIT3Mk5wm/FY6R2gq5vgCxf0A8lspz
	P3Ld3Q3ZYQhWh8YTkt07Mgcp/65gqfsOA9rgunJ2bzokwxjfyMCfu5D1qnSdD4I5
X-Gm-Gg: AYBFou1hAAPT1a2NWojhcPlxuCjy6nHtVSX5qaGVylvOOdhjwjTuJpEm+U/moJ2ZE0k
	6zoasTi4/2IDbuNaCkB//NtNkdHXq1orePN697MXP1qyTTS20pOreYH86a0nz6541jyo06sXcvR
	t1kz6koYOjNRZHOpJJT5f+KlhcAF8vFhj3XnsnikR30guRcblLlZs29YQ4u2K3qe8rwLEoVfCfK
	Tt7GnZOQNH5Z4xny2QmEh1mn/iFsxOhnZ2CuT1MgMxiDpyveWL/l6XKaudnZ+j+ExYYmkHx5Tvo
	udYg1dcodWkKNrZL2VC5nGwLYNrnASCGSG/FadV2szOVcqL+SEoV1xJZJKaYsnjFk5SYcfTCC/E
	RLyb/t6bRkbVTu+1JrFSyieq17O8OQ32j0owAJzzafOrkr4ZIoAZaU01/0pyALmV3HBJyxujur/
	Tonvg/npJJQArxhoiunjqFAptZmgAH7Imy3spg8bvuXtCc36b4M85FZFobmhq8lHEFQzundGQNv
	DZsdZ7zsvh4TVpf
X-Received: by 2002:a05:622a:130d:b0:530:b2e4:4e30 with SMTP id d75a77b69052e-5359fde2799mr324546181cf.61.1792106580684;
        Thu, 15 Oct 2026 16:23:00 -0700 (PDT)
Received: from chowdhury.taild927b5.ts.net ([2607:fb91:5000:22c8::3f3b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a9bbad2sm6453911cf.18.2026.10.15.16.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 16:23:00 -0700 (PDT)
From: Imtiaz Chowdhury <imtiazc56@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Imtiaz Chowdhury <imtiazc56@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add HP ENVY Laptop 13-ba1xxx quirk
Date: Thu, 15 Oct 2026 19:22:10 -0400
Message-ID: <20261015232210.35946-1-imtiazc56@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the HP ENVY Laptop 13-ba1xxx, the F5 and F8 key's LED were not
working at all.

Add a quirk for subsystem ID 0x8820 so it uses the existing
ALC245_FIXUP_HP_X360_MUTE_LEDS fixup, as done for the 13-ba0xxx.

Tested on HP ENVY Laptop 13-ba1063cl: F5 and F8 LED lights work as
intended. Checked the audio systems both with headphones and no
headphones, and there were no issues.

Signed-off-by: Imtiaz Chowdhury <imtiazc56@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 76a7ed218..799a5a7a8 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7696,6 +7696,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8812, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
 	SND_PCI_QUIRK(0x103c, 0x881d, "HP 250 G8 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x881e, "HP Laptop 15s-du3xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
+	SND_PCI_QUIRK(0x103c, 0x8820, "HP ENVY Laptop 13-ba1xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8846, "HP EliteBook 850 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8847, "HP EliteBook x360 830 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x884b, "HP EliteBook 840 Aero G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
-- 
2.56.0

