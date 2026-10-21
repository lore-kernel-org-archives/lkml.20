Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575620;
	b=JyRANlY/2bL+yoi/2gkgUjSFSmJjuNuAcO3LE0YY0k0/XLEknu5i0H7FaWOL/OOEM+zS
	 kc93zrfYUkM1QRQ/pFDaHpgJKzrBAvIKKhMYmwTmNXVuKLQ/JwDULYzDz7pyo4XXtVjvd
	 F7N8E4GKUIl1ipIz0R5xQ2pS0LALLSmxQpseijCEz1xYIyfBYbKtZXt4/WKJCG3O7DQG8
	 oK9+2uDQSQMCRHo0yYOGblooCIz1iS1ettic+qnZ3WvyGyQMvpXWUrMH5jn8vaGFynWQI
	 LK+HZ5dnkBRWWiR7a1nrADTifbJJ4Q90PHiGf+n73iSiZXZemMV+X5bIqK2TI5At6DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575620;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=1PRsQpweqoI38/fF67s+Y9rXztf6TeEe9ZXZ//e/0Zc=;
	b=e8TiBUXw6OvU2Imqnr35laDg6826PDwn877XhQPCH3kPqegCuWN/eJmZX/LoXi62Uq9y
	 x+JEQM1xKB/eO3KpM/E8HxQqMYtV8VjyN6s0d+JXeQ2NyoMi/CMeunYuzxqO1HjsfxS45
	 LwqYBEVWDrNI2siKXaPBB0e6W3xkn8J26r89RzOv9k//ptQoiZ3DkxtMbtkqHT9hBF1SP
	 D9GdxtmTknm0QpahFsJVPynOTnghvUvfv3NF6iSkvY4UdRN/roXO03CThTM1lsIzwP7S2
	 aVfjjSdmzyEEyVmxKbeqKsykaXmglWgu9E/uMdL0K91xV5+uPZN4+2ywEL9WiuWkMJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j3+BxfqW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE601606A319;
	Wed, 21 Oct 2026 09:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j3+BxfqW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0051F000C9;
	Wed, 21 Oct 2026 09:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792575619;
	bh=1PRsQpweqoI38/fF67s+Y9rXztf6TeEe9ZXZ//e/0Zc=;
	h=From:To:Cc:Subject:Date;
	b=j3+BxfqW08J4KaRbNdude1zO+7/YwLpbBZ5jQAHNc4GNW0hWVboc+mDt18JRxgBuL
	 4YDN05h72J/oMJKHm1S3MNh/FWuQm0l15lyvpxoaHVJbWo8ZNow8EjVN+QZNVCspB2
	 8lJ7Hr5/VKp9bl/DiZ312M1PWjIZjsJLHsaAhmEuvJ/mc1guaMDZdZ7LcSg3jwLTNM
	 1jkwr5d/DEubOSgiAZa+CG27LKwy0OidLpRturQEQhmJIghgVbV+PGlKbqDruDoZPP
	 HQ5WY5XHzi0EQkHNFt5Qv5w8+ZCSteJFaHouv+lTMIZlGBML/4cM5jRdMl03MZ18EV
	 KfWBjsc1qDwCQ==
From: Thorsten Blum <blum@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hiface: Use scnprintf() in hiface_chip_create()
Date: Wed, 21 Oct 2026 11:40:01 +0200
Message-ID: <20261021094002.114508-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1701; i=blum@kernel.org; h=from:subject; bh=zmAS+g5bfNQXAOcoeuT3g4BmPttUc9Fi7CxHYTMss0c=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFk3Ooo+vXt7udh2d5zZ3dCIVu1V/08qFT7/PeVmrfEds /s896z2dZSyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBEZHUZGa7sjbjwoczQtmih W5FWy99y91DW/8YVZj8mf/m16/bc104M/3RSdVY39t5OZH66oltgm3DR4b/PfA7UPtz3JvwO22I /Hm4A
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

To prepare for removing strlcat() from the kernel [1], use scnprintf()
instead. Since scnprintf() returns the number of characters actually
written, drop the length check before usb_make_path().

Also drop the explicit size arguments from strscpy() since they can be
inferred from the destination arrays.

No functional change.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 sound/usb/hiface/chip.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/usb/hiface/chip.c b/sound/usb/hiface/chip.c
index bce28f683666..41a43bc59397 100644
--- a/sound/usb/hiface/chip.c
+++ b/sound/usb/hiface/chip.c
@@ -63,18 +63,15 @@ static int hiface_chip_create(struct usb_interface *intf,
 		return ret;
 	}
 
-	strscpy(card->driver, DRIVER_NAME, sizeof(card->driver));
+	strscpy(card->driver, DRIVER_NAME);
 
 	if (quirk && quirk->device_name)
-		strscpy(card->shortname, quirk->device_name, sizeof(card->shortname));
+		strscpy(card->shortname, quirk->device_name);
 	else
-		strscpy(card->shortname, "M2Tech generic audio", sizeof(card->shortname));
+		strscpy(card->shortname, "M2Tech generic audio");
 
-	strlcat(card->longname, card->shortname, sizeof(card->longname));
-	len = strlcat(card->longname, " at ", sizeof(card->longname));
-	if (len < sizeof(card->longname))
-		usb_make_path(device, card->longname + len,
-			      sizeof(card->longname) - len);
+	len = scnprintf(card->longname, sizeof(card->longname), "%s at ", card->shortname);
+	usb_make_path(device, card->longname + len, sizeof(card->longname) - len);
 
 	chip = card->private_data;
 	chip->dev = device;
