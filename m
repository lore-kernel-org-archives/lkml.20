Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC27499F20;
	Sun, 18 Oct 2026 12:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792327351; cv=none; b=ucjc2uMUNKhlgv74fuZrcTq27osh7wFFXgnKWfMOT4x4Q8upcoMKlGfPpm2hlh9dKFkBE+zp1Gtfi5A4sva2xb+RogwXuBisXlCwLuTz1glyRR/yNRcJnHHZbt6BalrSYb35RB4l4HOiF39FbkC6+5r8BpGkRZJPA2HXPQWshrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792327351; c=relaxed/simple;
	bh=7Xay10aIL9pqz1DdL1972mdZQp/JxBiPZpwjPGFZLOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EUCVbJ3IiWmOpasPhRh9yaz/wcuPwjx1Ib9yxKVB702mnNeA5JiCcHbXS7psszTOkG2UGnBmMTBExgiyu/XLsESBSO1ydWUBkTB5YrD4POsLTeXI78n/KsLfVYNgv3kwUHjp9mi+92AeL6YgIWtG4ox+t3GOLlSdSsVtpQ2d3tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceYlBUOL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceYlBUOL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34FAB1F000C4;
	Sun, 18 Oct 2026 12:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792327350;
	bh=DLzVxtQna6+9PYfuQFoVHOp3sCzhIu6t1/4Nee6lgVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ceYlBUOL1WacZ/+25enbsewoLsiY2MhdaqQFUHrML/CqwfELbq0b/BSeeUBCNP+cB
	 yHjqODwClRwsAiE790INPZ812aCVrzbGRtGPo4u26+LwkesHkIsAkzAXqyeaCna4SY
	 yslw75VyCuPwiWoTJ4o8r8PdXYTVxDYx8HeDMj7HGbkGR9i6YW8qNWKOmIkTisMdpw
	 lEsue8nlaY8VOB+TrpjXobuq3w0mTuu+F13/x0/wWgJBNLaqbY5bZpL6wnLWKTHouo
	 iy56ITNEX1+E12ZJ/Yt+8YgKaGVmq8aOJGE+cHDrzUXtFg8PtFDCLzo0JDgWAFDOUo
	 bbCuugBVtZ7iw==
From: Thorsten Blum <blum@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Will Porter <mrwillporter@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: Thorsten Blum <blum@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: usb-audio: Simplify usb_audio_make_longname()
Date: Sun, 18 Oct 2026 14:41:55 +0200
Message-ID: <20261018124155.2081-4-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018124155.2081-3-blum@kernel.org>
References: <20261018124155.2081-3-blum@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3682; i=blum@kernel.org; h=from:subject; bh=7Xay10aIL9pqz1DdL1972mdZQp/JxBiPZpwjPGFZLOk=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlX9i3ZuKb1NI+WzEGt0wqffp6bHelr1uA58W2I5HO+L 3d+9F3/1FHKwiDGxSArpsjyYNaPGb6lNZWbTCJ2wsxhZQIZwsDFKQAT4bZm+Cu3L1XMVfe84wph 37n3TRP4PUw3S2/MbnFRaJDnKO2wmszI8ODnBbWZz3fFxFVPK1YN/8dZotd2wedEl/9Lx3nTphk r8gMA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

To prepare for removing strlcat() from the kernel [1], track the output
length and replace strlcat() with scnprintf() and strscpy().

Replace the speed switch statement with a lookup table.

No functional change.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 sound/usb/card.c | 69 ++++++++++++++++++------------------------------
 1 file changed, 26 insertions(+), 43 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 8a62e8e1c6fc..59979b793fe9 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -642,63 +642,46 @@ static void usb_audio_make_longname(struct usb_device *dev,
 				    struct snd_usb_audio *chip,
 				    const struct snd_usb_audio_quirk *quirk)
 {
+	static const char * const speed_suffixes[] = {
+		[USB_SPEED_LOW] = ", low speed",
+		[USB_SPEED_FULL] = ", full speed",
+		[USB_SPEED_HIGH] = ", high speed",
+		[USB_SPEED_SUPER] = ", super speed",
+		[USB_SPEED_SUPER_PLUS] = ", super speed plus",
+	};
 	struct snd_card *card = chip->card;
 	const struct usb_audio_device_name *preset;
-	const char *s = NULL;
-	int len;
+	enum usb_device_speed speed = snd_usb_get_speed(dev);
+	int len, ret;
 
 	preset = lookup_device_name(chip->usb_id);
 
 	/* shortcut - if any pre-defined string is given, use it */
-	if (preset && preset->profile_name)
-		s = preset->profile_name;
-	if (s && *s) {
-		strscpy(card->longname, s, sizeof(card->longname));
+	if (preset && preset->profile_name && *preset->profile_name) {
+		strscpy(card->longname, preset->profile_name);
 		return;
 	}
 
+	*card->longname = 0;
 	if (preset && preset->vendor_name)
-		s = preset->vendor_name;
+		strscpy(card->longname, preset->vendor_name);
 	else if (quirk && quirk->vendor_name)
-		s = quirk->vendor_name;
-	*card->longname = 0;
-	if (s && *s)
-		strscpy(card->longname, s);
-	else if (dev->manufacturer && *dev->manufacturer)
-		strscpy(card->longname, dev->manufacturer);
-
-	if (*card->longname) {
-		strim(card->longname);
-		if (*card->longname)
-			strlcat(card->longname, " ", sizeof(card->longname));
-	}
+		strscpy(card->longname, quirk->vendor_name);
+	if (!*card->longname)
+		strscpy(card->longname, dev->manufacturer ?: "");
 
-	strlcat(card->longname, card->shortname, sizeof(card->longname));
+	strim(card->longname);
+	len = strlen(card->longname);
+	len += scnprintf(card->longname + len, sizeof(card->longname) - len,
+			 "%s%s at ", len ? " " : "", card->shortname);
 
-	len = strlcat(card->longname, " at ", sizeof(card->longname));
-
-	if (len < sizeof(card->longname))
-		usb_make_path(dev, card->longname + len, sizeof(card->longname) - len);
+	ret = usb_make_path(dev, card->longname + len, sizeof(card->longname) - len);
+	if (ret < 0)
+		return;
+	len += ret;
 
-	switch (snd_usb_get_speed(dev)) {
-	case USB_SPEED_LOW:
-		strlcat(card->longname, ", low speed", sizeof(card->longname));
-		break;
-	case USB_SPEED_FULL:
-		strlcat(card->longname, ", full speed", sizeof(card->longname));
-		break;
-	case USB_SPEED_HIGH:
-		strlcat(card->longname, ", high speed", sizeof(card->longname));
-		break;
-	case USB_SPEED_SUPER:
-		strlcat(card->longname, ", super speed", sizeof(card->longname));
-		break;
-	case USB_SPEED_SUPER_PLUS:
-		strlcat(card->longname, ", super speed plus", sizeof(card->longname));
-		break;
-	default:
-		break;
-	}
+	if (speed < ARRAY_SIZE(speed_suffixes) && speed_suffixes[speed])
+		strscpy(card->longname + len, speed_suffixes[speed], sizeof(card->longname) - len);
 }
 
 static void snd_usb_init_quirk_flags(int idx, struct snd_usb_audio *chip)
