Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAB345D917;
	Sun, 18 Oct 2026 12:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792327347; cv=none; b=Pd7gIn+I0oK5vYiKRnkM/LK4Ny6WpI9JDthGDD08YuWknOTWWVc8xpahsiuGk8YmpDRwpuBStMS02IgFtMW35B0bXQyCacxlK2s5vzz1aNSx3tO6UMTeHCFshaJVdIR1hLYfTG8jpiQhOJSstCiVvbbXnb3B23cK++BScq5rbMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792327347; c=relaxed/simple;
	bh=jz/clWODMmaEJpVYRhtW35AZ52aX8kOfC0yTz/cXQzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JzKAL+bANtap7gB4mCDJRgxH2o0QhrYibrWon8f37kiQxO4FluNVmyiZERDLV0SCPHLXtaprXB4TmrNFx3F1twwHif+Y3d3Lg4OX0kB6pX6VuzlVMd35PZ1uC/oGForuzOfs/cXdWQN8A9LwjhVcoZ7VxT3+AzozYsADsJ5HG8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZaXKxGkn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZaXKxGkn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7F11F000C4;
	Sun, 18 Oct 2026 12:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792327346;
	bh=ittBtqQP83FQsrqQWd21RseQssuKkyaMzMK1Jy3Z4W4=;
	h=From:To:Cc:Subject:Date;
	b=ZaXKxGknvEmYDuEcHeMPkgA+LroFgWIPwsDgjPZcJPx4idLn7rHAbWY527jBu5tuB
	 ddTTkc6T1gfYQU4C8tT1sgbFI5i4ss5RQBEWomDNzYOAJ0fgnHZtRKcLxloe0m/yc6
	 pDi3O9pZFoNJ/qNfKXixPIrwf/iQNPsuSvUv0O844w8LtMTSKH7D2lZsT0E1mQTkOR
	 bE6a4i5EsBYKqL/VuWyfKg2tztMvXgy8B7pwG4eb6uGTh4QJCvlJTK+gQJIm2A3lKr
	 SMmwR4ZC3Wirh5ZGCw7syVGvyAro0zY6JGIbYQjszVYMk1JRt2gYUDncNMRkSph9cE
	 hHNK/pabz2GAw==
From: Thorsten Blum <blum@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Will Porter <mrwillporter@gmail.com>
Cc: Thorsten Blum <blum@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ALSA: usb-audio: Simplify usb_audio_make_shortname()
Date: Sun, 18 Oct 2026 14:41:54 +0200
Message-ID: <20261018124155.2081-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1784; i=blum@kernel.org; h=from:subject; bh=jz/clWODMmaEJpVYRhtW35AZ52aX8kOfC0yTz/cXQzM=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlX9k0Wv2UUkG69rKlzrvecxVsnz27k2Cx7nDubm1XqW reOTOnajlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZiIZAPD//QdlvGc0gUn5d4+ cfi5nME18EaJ/sVWzpNKTw0snr97uISRYfb1eBtJE5/l4df2TH51P+bTD/6rczeULlLJmBDwVdv yAw8A
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Copy the preset and quirk product names directly and remove the local
char s pointer. Return after trimming the device product name and use
the USB device ID as a fallback.

No functional change.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 sound/usb/card.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 9307da95efbe..8a62e8e1c6fc 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -618,30 +618,24 @@ static void usb_audio_make_shortname(struct usb_device *dev,
 {
 	struct snd_card *card = chip->card;
 	const struct usb_audio_device_name *preset;
-	const char *s = NULL;
 
+	*card->shortname = 0;
 	preset = lookup_device_name(chip->usb_id);
 	if (preset && preset->product_name)
-		s = preset->product_name;
+		strscpy(card->shortname, preset->product_name);
 	else if (quirk && quirk->product_name)
-		s = quirk->product_name;
-	if (s && *s) {
-		strscpy(card->shortname, s, sizeof(card->shortname));
+		strscpy(card->shortname, quirk->product_name);
+	if (*card->shortname)
 		return;
-	}
 
-	/* retrieve the device string as shortname */
 	if (dev->product && *dev->product) {
 		strscpy(card->shortname, dev->product);
-	} else {
-		/* no name available from anywhere, so use ID */
-		scnprintf(card->shortname, sizeof(card->shortname),
-			  "USB Device %#04x:%#04x",
-			  USB_ID_VENDOR(chip->usb_id),
-			  USB_ID_PRODUCT(chip->usb_id));
+		strim(card->shortname);
+		return;
 	}
 
-	strim(card->shortname);
+	scnprintf(card->shortname, sizeof(card->shortname), "USB Device %#04x:%#04x",
+		  USB_ID_VENDOR(chip->usb_id), USB_ID_PRODUCT(chip->usb_id));
 }
 
 static void usb_audio_make_longname(struct usb_device *dev,
