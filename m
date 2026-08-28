Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD11B3BF695;
	Fri, 28 Aug 2026 20:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787948985; cv=none; b=K20zltYv+dQ5+BkUKVDNfahlFcH3s+sbZcqKwx6bGp40eY9YkIOf9+xs7OU5Ji+jHK+i0QFt3QvaqKXH7ACKn1Q0SyDsfc2Z6LWYOMRBGMZiujtAqxqBQ2aCy2o+VEKnLPCJMOdLcAke/C70QlbxCpnXpmO8W0Uovj7OTK4GnyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787948985; c=relaxed/simple;
	bh=Y3Zrs8nmhmKlM1WDzy6QOmWmTBfYStK70BiOokg8tF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UAQZFM0gOXjiUw1CqOJKljaONYRIl2ivOVnPwk4F7z3ltY7n/t2N3T5wyg1WCqtyRLpZkqK+7dDctmOu0vCV6beRDO+X6TLoKTrU4q417sCa9gOC3IakUbKAABOuv+ZfBltx8bY5CGKSUcHZxFSTPB5d2H4bEAi7YM37icnDXFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPx+IDnz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPx+IDnz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 910A6C19425;
	Fri, 28 Aug 2026 20:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787948985;
	bh=Y3Zrs8nmhmKlM1WDzy6QOmWmTBfYStK70BiOokg8tF0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=PPx+IDnzue0K1XvKB0mm4DojZCWdk44VPGgrDXRl5uCJ9DXhYvlAq5Y70ZMgMabOq
	 BDg/OUrpz44Y6UW/Qekaqv+Eyu6FfnXOudJncwgFz+EmHxsgNv40s+8bySa2klHSf1
	 54Cg6/a5YsKOK51KaFZRlRIzL9xqnAh5+pcwvoFFq5BiouG0VQ9LPFhI44VTMYxsWT
	 J7c9nnw1n5Q/VlTCR/FJvTYA1sSguW1ID6mjeifcohNVblHMbpKFKaSDRxIpKnOk1b
	 w/NsWji49nNvHjwIozyhWJi64qwlB6RSLfXYkgGFDvGyIbhCZJ/X97ct8bFb85mRMA
	 BcTJMR32XPmRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C03DC61DCB;
	Fri, 28 Aug 2026 20:29:45 +0000 (UTC)
From: Casey Tunturi via B4 Relay <devnull+casey.samaritansolutions.net@kernel.org>
Date: Fri, 28 Aug 2026 16:29:28 -0400
Subject: [PATCH] ALSA: hda: intel: reset link for HP ENVY 27-p014
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-hp-envy-27-hda-reset-v1-1-0da50c215148@samaritansolutions.net>
X-B4-Tracking: v=1; b=H4sIAKfvkWoC/yXMQQ6CMBBG4auQWTtJmQg0XsW4QPilw6KSDhAI4
 e5WXX6L9w4yJIXRrTgoYVXTd8woLwV1oY0DWPtsEie18+I5TIy47iwNh77lBMPMV1dXpfMNKvG
 U0ynhpdtve3/8bctzRDd/X3SeH8Nj9qp4AAAA
X-Change-ID: 20260828-hp-envy-27-hda-reset-40651087e528
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Casey Tunturi <casey@samaritansolutions.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787948984; l=4237;
 i=casey@samaritansolutions.net; s=20260808; h=from:subject:message-id;
 bh=C3piln1pZqVHnsZn9JFVzZvH1SUyuaWCk14Ya2d/Fdo=;
 b=rFKw+GgWFUcpq4bpz1v84wMIL7thSAEfCSge4HAFV/1YSomDVJ4dAe/v28+0Y39X7gU3Na3gY
 ZrfekU3Pj2FAJt+4NBKjkl/z1qqmHXupxof3Kg3VlxkS5FF+wPcIshT
X-Developer-Key: i=casey@samaritansolutions.net; a=ed25519;
 pk=oAg9oAsm2ZYWlQFWe7kijWzWnqsQZ/KIY59MAWrTRzk=
X-Endpoint-Received: by B4 Relay for casey@samaritansolutions.net/20260808
 with auth_id=926
X-Original-From: Casey Tunturi <casey@samaritansolutions.net>
Reply-To: casey@samaritansolutions.net

From: Casey Tunturi <casey@samaritansolutions.net>

While bringing up audio on an HP ENVY 27-p014, I found that the normal
link reset only discovers the HDMI codec. The CX20753/4 at address 0
appears after a second CRST pulse, with STATESTS left alone and no fixed
delays.

I added that pulse when address 0 is missing, and again before the codecs
resume. Initial setup uses immediate commands long enough to add the
codec, then returns the controller to CORB/RIRB.

That brought analog audio up at boot, and capture kept working through
four deep suspend and resume cycles.

Signed-off-by: Casey Tunturi <casey@samaritansolutions.net>
---
 sound/hda/controllers/intel.c | 77 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 24015c73a..0be97a46f 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -987,6 +987,46 @@ static bool azx_is_pm_ready(struct snd_card *card)
 	return true;
 }
 
+static bool hp_envy_27_needs_reset(struct azx *chip)
+{
+	struct pci_dev *pci = chip->pci;
+
+	return pci->subsystem_vendor == 0x103c &&
+	       pci->subsystem_device == 0x2b3e;
+}
+
+static u16 hp_envy_27_reset_link(struct azx *chip)
+{
+	struct hdac_bus *bus = azx_bus(chip);
+	u32 gctl;
+	u16 statests;
+	int timeout;
+
+	snd_hdac_bus_stop_chip(bus);
+
+	gctl = snd_hdac_chip_readl(bus, GCTL);
+	snd_hdac_chip_writel(bus, GCTL, gctl & ~AZX_GCTL_RESET);
+	for (timeout = 250; timeout; timeout--) {
+		if (!(snd_hdac_chip_readl(bus, GCTL) & AZX_GCTL_RESET))
+			break;
+		udelay(1);
+	}
+
+	gctl = snd_hdac_chip_readl(bus, GCTL);
+	snd_hdac_chip_writel(bus, GCTL, gctl | AZX_GCTL_RESET);
+	for (timeout = 250; timeout; timeout--) {
+		if (snd_hdac_chip_readl(bus, GCTL) & AZX_GCTL_RESET)
+			break;
+		udelay(1);
+	}
+
+	statests = snd_hdac_chip_readw(bus, STATESTS);
+	bus->codec_mask |= statests;
+	snd_hdac_bus_init_chip(bus, false);
+
+	return statests;
+}
+
 static void __azx_runtime_resume(struct azx *chip)
 {
 	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
@@ -1003,6 +1043,8 @@ static void __azx_runtime_resume(struct azx *chip)
 
 	azx_init_pci(chip);
 	hda_intel_init_chip(chip, true);
+	if (chip->pm_prepared && hp_envy_27_needs_reset(chip))
+		hp_envy_27_reset_link(chip);
 
 	/* Avoid codec resume if runtime resume is for system suspend */
 	if (!chip->pm_prepared) {
@@ -2356,6 +2398,34 @@ static const unsigned int azx_max_codecs[AZX_NUM_DRIVERS] = {
 	[AZX_DRIVER_TERA] = 1,
 };
 
+static int hp_envy_27_probe_codec(struct azx *chip)
+{
+	struct hdac_bus *bus = azx_bus(chip);
+	struct hda_codec *codec = NULL;
+	bool use_pio;
+	int probe_mask;
+	int err;
+
+	if (!hp_envy_27_needs_reset(chip) || (bus->codec_mask & BIT(0)))
+		return 0;
+	if (!(hp_envy_27_reset_link(chip) & BIT(0)))
+		return -ENODEV;
+
+	probe_mask = chip->codec_probe_mask;
+	use_pio = bus->use_pio_for_commands;
+	chip->codec_probe_mask = BIT(0);
+	bus->use_pio_for_commands = true;
+	err = snd_hda_codec_new(&chip->bus, chip->card, 0, &codec);
+	chip->codec_probe_mask = probe_mask;
+	if (!err && codec)
+		err = snd_hda_codec_configure(codec);
+	else if (!err)
+		err = -ENODEV;
+	bus->use_pio_for_commands = use_pio;
+
+	return err;
+}
+
 static int azx_probe_continue(struct azx *chip)
 {
 	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
@@ -2428,6 +2498,11 @@ static int azx_probe_continue(struct azx *chip)
 		}
 	}
 
+	err = hp_envy_27_probe_codec(chip);
+	if (err < 0 && err != -ENODEV)
+		dev_warn(chip->card->dev,
+			 "failed to probe HP ENVY 27 analog codec: %d\n", err);
+
 	err = snd_card_register(chip->card);
 	if (err < 0)
 		goto out_free;
@@ -2444,6 +2519,8 @@ static int azx_probe_continue(struct azx *chip)
 		pm_runtime_allow(&pci->dev);
 		pm_runtime_put_autosuspend(&pci->dev);
 	}
+	if (hp_envy_27_needs_reset(chip))
+		pm_runtime_forbid(&pci->dev);
 
 out_free:
 	if (err < 0) {

---
base-commit: c4a0927f535f779700d5ccda8182c2db01e9d551
change-id: 20260828-hp-envy-27-hda-reset-40651087e528

Best regards,
--  
Casey Tunturi <casey@samaritansolutions.net>


