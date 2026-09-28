Received: from mail-oi2-f41.google.com (mail-oi2-f41.google.com [74.125.231.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AFA4EBAC8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790609389; cv=none; b=c4P+lZBYtV3lPtdtD3uw2/EM+PdPminlRlPEb5bMTwWia/FNZ66jojhLoftUseq3vtJd9YYptY2ZcV/RF2FpSSa9kcRGhcV/aGdyLfwxakVLVgBUAfanjE9IWY3z1i9L1bEmsuTOVnD7yFwRBGOePDD4efrsqtxcPGnDmMo1C2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790609389; c=relaxed/simple;
	bh=QWsd3wxevy+japnbf8IB+oIJRFrkXbpx/xJHJ2YNGDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LBH5A7EP7VIy70XcTil7SKLE3sO6e62Lfx21x+GuHZxmK21YtXmVgAIvNdZ6FZqiNkI7u/bfzWK8H4SgQqFtg3Df+eZ6hNId05Wv6EBD+n6X7Q8674eQP6bHyY05PYVwxtbLRpKxRJNA+M0lw51hfJkFdazcTtea9++Fy1UvBMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6zdbmTk; arc=none smtp.client-ip=74.125.231.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6zdbmTk"
Received: by mail-oi2-f41.google.com with SMTP id 5614622812f47-4eac14e775aso141668b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790609387; x=1791214187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XoZ89Zwbou41YSb+ju1qDv/4cuEDzLy4HojALjA6SyI=;
        b=V6zdbmTkGBaR5RSR268VCAy/wDdem+kjLY6zqBjYpB42PZBzACOFmMfaDKD2quImKR
         zeqydP90lV+ucXynSfl+4xr582MX3vZWpYnTEd0G6rA9XDVUI2MwSGq3eVsHclJbyNWk
         IeIcIXPHqgN5sJ0bV5gV2bR6Wz7DXhQFTUCeWZl8rxuqgdDc0eh0HA+OrStYuuI2q2bE
         Duqc1usLVGnyf6zOeOw1uPZvTZqKAPhC8YjKLClaKgy3Pw18Mphl91vOnnnxZx+pe9Vr
         e9ka5Jn5rO42g48O6UB/LL28Gb4MMjBbydsKoHj10OS4PQV6W6K4+pMdt9dUj/mLITAg
         Q8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790609387; x=1791214187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XoZ89Zwbou41YSb+ju1qDv/4cuEDzLy4HojALjA6SyI=;
        b=iZbNgsSspk4XoB67CbdAvq7zJBJmDLj7ss2ijgXYK7E39rti3zTk5rUc8lh2k6vN1V
         noC0N+hS3FDMxIfwWYIVA7CTHqNIrEeNWzxxb+BiTWM+R6PQuBI5RHiFVI/7Gp1LVefs
         dG4RahBYwc0zAWVxEm8tl+Kr8Mwp17L/MNwDlZ2sEYgQMrsuGSoSLodj+N6kJ62QX7Cm
         TZczLUgAA/DqIPjc3zk47t2P1Un+iMimaoDdxnhu82FTCKx4YaYD23l10gw9GQ7wGBI9
         ZXUHauf5UsTt89ycdxHsOmh3ZaQ2FtsVZnzWaWdxJGaDUb+nKaoZlf2k8zed19j8dcj2
         SbIg==
X-Forwarded-Encrypted: i=1; AKwUvBzQywjuc+rJz6myKJrGm1k5BPyHQ6MUSB/NSYqIBfG+VqSOASv0eOot85jawVHkmYplgHbEcNFJCEsOzBQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m4adLIlKMN8aRAs5fWVNfVCYbYnboU6WNLyhB77F6LzwBMESWU
	f2Ww8pMM3Pv4iJTQ7dbb+8Go74nFUdUBlUqVqvjLcGqJVsNlIcfi8mLf
X-Gm-Gg: AYBFou0Qj2Ap2lOc5tzBNce864QnGx3Dk3CuKBn34BNHtJ3RxiEW9d1ZuC98EFDqXDx
	HMFtfLpRw/a1OS8Ovha6FrtwnTFAejMv+H7zgzf79mx58kxe5j73n/u4p7Vk5H0II3Xb8dvo4sJ
	lnxaisbN+EmPEEK1iYa4jW45Cngcfishf18jmlVZUHHrQBwG4EAVc41S7NgjnMujL1mtMOsVgjC
	VXCYYFyvxyxH8N/oNZSNUEW6MTBx9nvvjThefV7OKefaLAnTXfs4rX2IEkP/XFyk1g38nS0zjPB
	FcfQvo3yV0NCufvB+4ojOAMi5HqIYLEqhejsmZPZdFbNpeK9wyOQ2MvPykvInNsBEFZDLG0L3FG
	kotKs+cRpUu+Eu6GV2DshG2MEnrGi7jOlBGNh+AoZ4o0Uf7pcc2y2oC3y3sViPkNS6neCEYEBfK
	2DthbvONRb0pCJprgFFv+OsMLg9EWfir/EHOhpWt95Rm+/RHL6XV1LwW6SL1yzAYyIANMGlb6Ez
	o7T4dCglpHe9oslo57M3w==
X-Received: by 2002:a05:6808:1204:b0:4b8:46e3:e229 with SMTP id 5614622812f47-4d72c837a21mr10326982b6e.21.1790609386543;
        Mon, 28 Sep 2026 08:29:46 -0700 (PDT)
Received: from cachyos-SlimIce.lan ([2607:fb90:9a26:9349::e71])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ebb6e9e924sm1895924b6e.1.2026.09.28.08.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:29:45 -0700 (PDT)
From: Jared Wuerzburger <jwuerz@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samuel Dionne-Riel <samuel@dionne-riel.com>,
	Jared Wuerzburger <jwuerz@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek: Fix internal mic on Minisforum V3 and V3 SE
Date: Mon, 28 Sep 2026 10:29:25 -0500
Message-ID: <20260928152925.69032-1-jwuerz@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Minisforum V3 and V3 SE (ALC245, PCI SSID 1f4c:e001) the
internal digital microphone array never produces any audio. The DMIC
pin 0x12 is parsed correctly ("Internal Mic=0x12"), but the headset mic
jack pin 0x19 (BIOS pin config 0x04a19050, jack detect enabled) has no
presence detect wired on these boards: reading GET_PIN_SENSE on 0x19
always returns "present" (as it does on the unused, unconnected pin
0x18), while the headphone jack 0x21 reports correctly.

The generic parser therefore sets up auto-mic switching and, believing
an external mic is always plugged in, permanently routes the ADC to the
empty jack (mixer 0x23 input 0x19 unmuted, input 0x12 muted). The
"Mic Jack" kcontrol reports "on" with nothing plugged in.

Mark pin 0x19 as having no presence detect. The parser then stops
auto-switching and exposes a normal "Capture Source" (Internal Mic /
Mic) control, which desktop audio stacks drive from their Internal
Microphone / Microphone ports. The existing bass speaker DAC routing is
kept by chaining to ALC245_FIXUP_BASS_HP_DAC.

Tested on both models with the same pin config applied through a
snd-hda-intel patch firmware ([pincfg] 0x19 0x04a19150):
 - V3 SE (Ryzen 7 7735U, BIOS 1.03), kernel 7.2.6
 - V3 (Ryzen 7 8840U, BIOS 1.06), kernel 7.2.7
Both boards report the same codec SSID and the same 0x19 default. On
both, the internal mic records at a normal level, headphone jack
detection on 0x21 still switches output, and the bass routing is
retained (DAC1/DAC2 Playback Volume controls present). A headset mic
on the combo jack was not tested (none available); with this change it
has to be selected manually. V3 users already report that the jack mic
gets no input [1], which is the other symptom of the same broken
presence detect.

The patched alc269.c was build-tested with W=1 on tiwai/sound.git
for-linus (7.3-rc3) without new warnings.

The diagnosis, the fixup and this changelog were written with the help
of an AI coding assistant; I reviewed them and tested the change on the
hardware listed above.

Fixes: e34743018249 ("ALSA: hda/realtek: Add quirk for Minisforum V3 SE")
Link: https://github.com/mudkipme/awesome-minisforum-v3/issues/14 [1]
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Jared Wuerzburger <jwuerz@gmail.com>
---
Changes in v2:
- Drop the alc269_fixup_models[] entry (Takashi)
- Add Fixes: tag for the commit that added the V3 (SE) quirk (Takashi)
- Assisted-by: LLM (Takashi)
- v1: https://lore.kernel.org/linux-sound/20260927173237.339476-1-jwuerz@gmail.com/

 sound/hda/codecs/realtek/alc269.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5127a111c5..d9ce10d5d3 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4384,6 +4384,7 @@ enum {
 	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN_HEADSET,
 	ALC285_LENOVO_DAC_RENAME,
 	ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1,
+	ALC245_FIXUP_MINISFORUM_V3_MIC_NO_PRESENCE,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -7136,6 +7137,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC287_FIXUP_TXNW2781_I2C,
 	},
+	[ALC245_FIXUP_MINISFORUM_V3_MIC_NO_PRESENCE] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x04a19150 }, /* headset mic jack, no presence detect */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC245_FIXUP_BASS_HP_DAC
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -8349,7 +8359,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1ee7, 0x2081, "HONOR MRB-XXX M1020", ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO),
 	SND_PCI_QUIRK(0x1f4c, 0xb020, "Minisforum AI X1 Pro",
 		      ALC245_FIXUP_MINISFORUM_JACK_DETECT),
-	SND_PCI_QUIRK(0x1f4c, 0xe001, "Minisforum V3 (SE)", ALC245_FIXUP_BASS_HP_DAC),
+	SND_PCI_QUIRK(0x1f4c, 0xe001, "Minisforum V3 (SE)",
+		      ALC245_FIXUP_MINISFORUM_V3_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1f66, 0x0105, "Ayaneo Portable Game Player", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x2014, 0x800a, "Positivo ARN50", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x2039, 0x0001, "Inspur S14-G1", ALC295_FIXUP_CHROME_BOOK),
-- 
2.55.0

