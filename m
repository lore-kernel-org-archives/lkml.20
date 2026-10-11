Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017C1314D13;
	Sun, 11 Oct 2026 22:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791756846; cv=none; b=UhZ4rWT5X7IPuh+z83DX+n8rmhoQj7B2RdvD7pOjtMDOT5CQE6B1FI7RdnqMJxRbTHk+SYAPbQ6Ppj1nazqcdWYzEMr6vYZGtfiCuCTP6nr2xML6wwIU7FVVjhLvqv4r3THUG0mAlUP+d3Dm8ewCA/Uy9pqMT0kQrfXnzvwrQLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791756846; c=relaxed/simple;
	bh=dT47kaXg2PKJA7n3es8e8/4dwfChMErkBViAGAAWINg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ph1zbK1/JUuri+SyuOBV45BPuz+PxtxVViCHEnmvxcgq+ZrpjpxTYPZV8vu7XBHlzA6TdfhDRJTqGE2z0LnwXq8ikKyyZWx38Q3htrXDW/YffJO4bJJWKIDNlrXVClOdonrayN8vDHUZGDVNuyB6j/yo7uPMW9QPxZ832esWF8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=lpgi8R4b; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="lpgi8R4b"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 97A398100C;
	Mon, 12 Oct 2026 00:14:00 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4W7ctl9ywvH; Mon, 12 Oct 2026 00:13:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1791756839; bh=dT47kaXg2PKJA7n3es8e8/4dwfChMErkBViAGAAWINg=;
	h=From:To:Cc:Subject:Date;
	b=lpgi8R4bWAaq7BHPEgEdyVNKk8ZhIJHfG7bn9i7gt7QqpvmCFHFAP2ol+DLODWFQC
	 tQQF8RcFEeRtRrR15rsu3BjSqw1MBI0yBcwWK0AmVLvWZe9RtKdPTR6E6tkJ0TKxpE
	 WHBNZqbeeoq2uHNAdJrxqlsYap+auC4WKzZVoqfbRMjRINn7GPIiEwT2x8GZ+VLkvv
	 cwAFAPGfXhv0eRQr10vEJ7MtCQ2c2Ayb/wqocQlnUkPfZWUKiBX7gn8QAZJD1qHB00
	 3ikm43KhbC6GmDr1gJ9JR0MEeGYkcKREI7h+f1ChFzOlItSQh2dj7ugt99l+dl4FAK
	 iJeRgzLy9dDqw==
From: =?UTF-8?q?Ali=20Ahmet=20Memi=C5=9F?= <aliamemis@disroot.org>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: core: Use the allocated major number with major=0
Date: Mon, 12 Oct 2026 01:13:34 +0300
Message-ID: <20261011221350.1690703-1-aliamemis@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit bd8f21876189 ("ALSA: core: propagate actual error code from
register_chrdev"), alsa_sound_init() only treats negative values from
register_chrdev() as errors. With the major=0 module option
register_chrdev() allocates a major number dynamically and returns it
but snd_major and the devices still use 0. The devices are then
created without device numbers so no /dev/snd nodes appear and sound
is unusable.

Use the returned major number when major=0 is given.

Fixes: bd8f21876189 ("ALSA: core: propagate actual error code from register_chrdev")
Signed-off-by: Ali Ahmet Memiş <aliamemis@disroot.org>
---
 sound/core/sound.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/core/sound.c b/sound/core/sound.c
index 24f40763a20c..a0349a7e9495 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -396,7 +396,6 @@ static int __init alsa_sound_init(void)
 {
 	int err;
 
-	snd_major = major;
 	snd_ecards_limit = cards_limit;
 
 	err = register_chrdev(major, "alsa", &snd_fops);
@@ -404,6 +403,9 @@ static int __init alsa_sound_init(void)
 		pr_err("ALSA core: unable to register native major device number %d\n", major);
 		return err;
 	}
+	if (!major)
+		major = err;
+	snd_major = major;
 
 	err = snd_info_init();
 	if (err < 0) {
-- 
2.55.0

