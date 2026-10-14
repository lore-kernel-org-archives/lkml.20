Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2A141A91E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962758; cv=none; b=qEfzEbD9N83E7KT8QayNz5275BAPyPXO8FLevq+zvgppn/IlQjlnHQBYym+JlEWnMd/lyp7LRoKPnpbDz+ShxPiF1HMcJX8b14gLI0P/6xUCIKxoR0MuMa3Wbc9hY+pEsz4ryTkfGsf3CDhRfohSgyaQBL8beEDLVUuyrkJALSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962758; c=relaxed/simple;
	bh=l4SPsE6hUZzdH+Qt8qaHUjdFoBe0vV50Kvu0KI2diGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t7PhvueI6geg8VJvn6fNEyHKkkhNUXC2HsxzUexEctjjx8DeWeSX3k5mISfqSv1PxOtTCp/kTkb5WodkXlx/4X50GAmZAGIcBYJoW2/hjOGgvDEpzSvNqjVlx1KpP2tecj/TZvcgw3oIo9gqR4cLzoGw1JSmbdJgyJThU8OE3xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iI/OzBJX; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iI/OzBJX"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-16079d54c17so4803813c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962756; x=1792567556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Etm6ClrcBWm5fy49QND/rngwEsT/VESg8/v5EOMf2FQ=;
        b=iI/OzBJXVcavSV/zWUVW3/C/IDY3buP0Zj45+aRbnOhZBv5eAIC2ZdOAb/WapgdXRB
         motrNKy22C7nIt3GhM0EZMfyuNrihkuW0y5jEHsDkUnTqHC/pHYsCqM+NR6DDtZSSNiq
         VcYBMNFDBf0iUTHf7SH73aIjn9MoKVBEupIStonZFTPPSBBo6+fc+I6C3Js6HfxFqTxL
         YE1Cv8plDUo+EvTv9jiak98uHpn6QN/8Dj5jVztuqNGdDyVV3BNYO6zYbn5GMl9jR68J
         9wbf5vwWmYqbfort5+AgHTe1JDvj7OSlVYKeHVmDBpSa4L/Wkowyh4/NozC6TwnxTqpX
         1KMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962756; x=1792567556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Etm6ClrcBWm5fy49QND/rngwEsT/VESg8/v5EOMf2FQ=;
        b=KcrpeG7/C8t4LPk+aRAOb7GCO8Aux2rfTQIrVSQZw+DNqOcgXiR6/e1S2cWDl9NnjD
         pqku4ZMQIujNMJC2YuaL4z0/wyfYezo1jwRtV0nURiKn5j7vR+wYpxxdtLMAjIqYLxGV
         5waOGhvQ4QghJzDojDxh4WVmpLAZZHcMzB48+fMYbc9okv8/5od9wHZVe/X2HwSyHfCq
         imxIJ+lV5RCt85hrvHqcXCeWLwsqXxwpwToQYzYry3wiPOoFDRu6igGwBR3vae8o3j8+
         9vCY6QaRj/B2kqnNbKpKzr6GOETxnQdeLNnIKiqnUW1inm4BuTg/998acdEoDxFqDs3I
         QLtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOdR6+kqY5KsC4AjirkJZjwgADVZvDxBfyHNpV9puA7HfWiEAdmmvOGhdAIM3g64u7lmo2kcWqIDqu/Fk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzoE52+78TLGBnVttE2QlPwZCEq8vDIJrUAN83lNK8UjgleV+f
	OAf3tB9gIpcYXK80P9gEGOxsiSEXkTZTCG6aZ4BfbqdsbBK8ucq90CyM/dae1g==
X-Gm-Gg: AYBFou2vlCzcRYdfE+aMyreq/e8oB3EuyD9+AGCq3s7/S0dslbZMmKQMZkjsy8NfF6U
	5dyVtCh/UiEwcTHHttIrnJ8eWPKNrHFL3l0gvCBm3zRNBjlHWSn3uYbNQGlJeoBIkZHuHnue6kb
	FDx/GLdMPspIXrvZn6Fn/FOgdIidsL8kx4u5Dq30oaFZM0CmYsWjDZ6CM5XUu5r8ZtedzjP53EQ
	qLSXBZq7mqEEsnGJ6Wku+MlXT3poabvTLUAgCqDwqIuBPO2dJ+1SB6AImG09GMY68hsEgG4c6lB
	CnvJUij12pY6Yuv3dgf+aCuk69nZd0lMidpFu8vOkQ3dkjvcf3RYXQPXk7aHMAQOq7iJEilOGdt
	kViidjN5GM2+IBi8UzaexaNPeeD0Gvz13yndmYJTZ99fcTkE1KvQlagY22pI6nIU7XAmnSp5DVg
	2OX+yKg47sXvtlWqVwoV1rLE35hO506KE0g7fXazM3TayaUyaqfoCbYn65K6WzIEI=
X-Received: by 2002:a05:7022:290:b0:151:2e62:fe5b with SMTP id a92af1059eb24-16a5dbfd567mr23448651c88.22.1791962755498;
        Wed, 14 Oct 2026 00:25:55 -0700 (PDT)
Received: from linmach ([182.156.30.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm44461526c88.15.2026.10.14.00.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:25:55 -0700 (PDT)
From: Aayush Kumar <aayushkmx@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Kumar <aayushkmx@gmail.com>
Subject: [PATCH v2] ALSA: hda/realtek: Fix speaker and mic mute LEDs on IdeaPad Pro 5 14IAH10
Date: Wed, 14 Oct 2026 12:55:05 +0530
Message-ID: <20261014072505.60358-1-aayushkmx@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The speaker and microphone mute LEDs on the IdeaPad Pro 5 14IAH10
do not follow the ALSA mute state. This machine has an ALC287 codec
with SSID 17aa:3914, but shares PCI SSID 17aa:3843 with the Yoga
Book 9i and currently gets its fixup.

Add a codec SSID quirk that runs the IdeaPad ACPI LED fixup. Chain
the existing bass speaker amp fixup so the audio setup is retained.

Tested on the IdeaPad Pro 5 14IAH10: muting and unmuting the
headphone sink toggled the physical speaker mute LED. Muting both
microphone controls changed the ALSA mic LED state from 0 to 1.

Signed-off-by: Aayush Kumar <aayushkmx@gmail.com>
---
Changes in v2:
- Add a comment about the conflicting PCI SSID.
- Rebase onto sound.git for-next.

 sound/hda/codecs/realtek/alc269.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 542245156..aff1a1e40 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4386,6 +4386,7 @@ enum {
 	ALC295_FIXUP_HP_OMEN,
 	ALC285_FIXUP_HP_SPECTRE_X360,
 	ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP,
+	ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP_LED,
 	ALC623_FIXUP_LENOVO_THINKSTATION_P340,
 	ALC255_FIXUP_ACER_HEADPHONE_AND_MIC,
 	ALC236_FIXUP_HP_LIMIT_INT_MIC_BOOST,
@@ -6611,6 +6612,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
 	},
+	[ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP_LED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_ideapad_acpi,
+		.chained = true,
+		.chain_id = ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP,
+	},
 	[ALC287_FIXUP_LENOVO_YOGA_PRO7] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_yoga_pro7_audio,
@@ -8427,6 +8434,11 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x383d, "Legion Y9000X 2019", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3842, "ThinkBook X G2 IAH", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_4_THINKPAD),
+	/* IdeaPad Pro 5 14IAH10 shares PCI SSID 17aa:3843 with Yoga Book 9i;
+	 * use codec SSID to distinguish them
+	 */
+	HDA_CODEC_QUIRK(0x17aa, 0x3914, "Lenovo IdeaPad Pro 5 14IAH10",
+			ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP_LED),
 	SND_PCI_QUIRK(0x17aa, 0x3843, "Lenovo Yoga 9i / Yoga Book 9i", ALC287_FIXUP_LENOVO_YOGA_BOOK_9I),
 	/* Yoga Pro 7 14IMH9 shares PCI SSID 17aa:3847 with Legion 7 16ACHG6;
 	 * use codec SSID to distinguish them
-- 
2.56.0

