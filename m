Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8D14BFE85;
	Mon,  5 Oct 2026 15:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214859; cv=none; b=pS/pOL0KhSZmxWbqydYxs/xFC9SNePiMJ0AnQivZU+E/7RkZtzS1H67/Vvg24KXJQgAc310PkOU2JMJNbJKnjpSkDrF/gBbF46BC5g4VF/KmT0msDvulvt6QjUAyl6BvyrMIbA1Qxg3mh+D37bqZ4s9cMj1g/YxPHgyRcykURIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214859; c=relaxed/simple;
	bh=lPnPqNABrtWcDouVXOn0hlDmiPO/3LpDNvtB4P7RHBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwLrnpLy4WAPfZde9wgFE+JfCYcHzw/FIU463JP8zzQnHSEGe2PiYWK56JWUaJMCA2FoLqMPeFDyuarTo3a4/PC3FfYMtQN14bHzaA0MXRcUg0k06HLGN+7d/m0uEsGw4f22TV1BkV74+3vmU9IzsHUFKg1sh5qxpkwkmGFZ9C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=scottgauche.com; spf=pass smtp.mailfrom=scottgauche.com; dkim=pass (2048-bit key) header.d=scottgauche.com header.i=@scottgauche.com header.b=Mr8M45cS; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=scottgauche.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scottgauche.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=scottgauche.com header.i=@scottgauche.com header.b="Mr8M45cS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scottgauche.com;
	s=protonmail; t=1791214846; x=1791474046;
	bh=Ol43mDciEoEWpxgzgSbltwcJn9HQf6a2GoagfSzWtT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Mr8M45cS/kCrX2QYXzbpx1Z90qHQiLIzLnA8sfh9vzpveweBQbXkacQH7tKDPdmZv
	 ctwy6FYxXX1NQBg3A257e6qma7SZ1GPdua4BW3UsGbcdVz3XQIN0+3vTxAQ6cFg93O
	 kAgwl0cJ09dBKn0GmZxKxTcjoC3CLvayR5f7az6LI136ySeBaNCrGMUWT+bceb4mQc
	 Q07DQ+VGn14Bgub+PEakoXg7n4RWM5sYWOjyoR4xpRNxad7spwyBVGMciu+y9c0Kla
	 5Zg003T0QCr+Zrw/RsC/fhUiEs6EBClMo4eFNMfNzRdHYJiQ/4yC2F/MlhLlIk4wLI
	 UeG9YIrzbO4LQ==
X-Pm-Submission-Id: 4hz3WH5Frfz2ScWj
From: Scott Gauche <scott-dev@scottgauche.com>
To: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Scott Gauche <scott-dev@scottgauche.com>
Subject: [PATCH v2] ALSA: hda/realtek: Fix audio after Windows reboot on ASUS Q423SA
Date: Mon,  5 Oct 2026 11:40:17 -0400
Message-ID: <20261005154017.1164657-1-scott-dev@scottgauche.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87se2ksaqb.wl-tiwai@suse.de>
References: <87se2ksaqb.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS Vivobook S 14 Q423SA-U5512 (DMI family S5406SA) with the
ALC294 codec has working analog audio when booted directly after a full
shutdown. After a warm reboot from Windows 11, audio works briefly during
Linux startup, then both the internal speakers and headphones become
silent. PCM playback continues without errors.

Coefficient 0x1b is 0x4e4b on a direct cold boot, but 0x4a4b after the
Windows warm reboot. Restoring bit 10 changes it back to 0x4e4b and
immediately enables both analog outputs. Speaker playback, headphone
playback, jack switching, cold boot, and suspend/resume were tested
successfully. The same 0x4a4b state and immediate recovery with 0x4e4b
were independently confirmed on another S5406SA with subsystem 1043:10c4.

The same coefficient write is already used by
ALC294_FIXUP_ASUS_COEF_1B for the ASUS UX431DA. That fixup cannot be
reused here because it chains to ALC289_FIXUP_ASUS_GA401 and applies
unrelated DAC routing and microphone pin configuration.

Add a model-specific fixup for subsystem 1043:10c4 and chain it to the
existing ALC2XX_FIXUP_HEADSET_MIC fixup instead.

Link: https://github.com/thesofproject/sof/issues/11051
Fixes: f2d08f3651fb ("ALSA: hda/realtek: Fix headset mic on ASUS Vivobook S14 S5406SA")
Signed-off-by: Scott Gauche <scott-dev@scottgauche.com>
---
Changes in v2:
- Add Fixes tag for the original 1043:10c4 quirk.

 sound/hda/codecs/realtek/alc269.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index be5482530a..90ba8dd2a2 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4193,6 +4193,7 @@ enum {
 	ALC294_FIXUP_ASUS_I2C_HEADSET_MIC,
 	ALC294_FIXUP_ASUS_SPI_HEADSET_MIC,
 	ALC294_FIXUP_ASUS_SPK,
+	ALC294_FIXUP_ASUS_Q423SA,
 	ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
 	ALC285_FIXUP_LENOVO_PC_BEEP_IN_NOISE,
 	ALC255_FIXUP_ACER_HEADSET_MIC,
@@ -5669,6 +5670,17 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC294_FIXUP_ASUS_HEADSET_MIC
 	},
+	[ALC294_FIXUP_ASUS_Q423SA] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			/* Restore bit 10 lost after reboot from Windows */
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x1b },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x4e4b },
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC2XX_FIXUP_HEADSET_MIC,
+	},
 	[ALC295_FIXUP_CHROME_BOOK] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc295_fixup_chromebook,
@@ -7819,7 +7831,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x10a1, "ASUS UX391UA", ALC294_FIXUP_ASUS_SPK),
 	SND_PCI_QUIRK(0x1043, 0x10a4, "ASUS TP3407SA", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x1043, 0x10c0, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
-	SND_PCI_QUIRK(0x1043, 0x10c4, "ASUS Vivobook S14 S5406SA", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1043, 0x10c4, "ASUS S5406SA/Q423SA", ALC294_FIXUP_ASUS_Q423SA),
 	SND_PCI_QUIRK(0x1043, 0x10d0, "ASUS X540LA/X540LJ", ALC255_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x10d3, "ASUS K6500ZC", ALC294_FIXUP_ASUS_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1154, "ASUS TP3607SH", ALC287_FIXUP_TAS2781_I2C),
-- 
2.53.0
