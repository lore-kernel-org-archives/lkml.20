Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A23E496D53;
	Mon, 19 Oct 2026 10:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405434; cv=none; b=bnKRO82AD9DE+cwNIKdI5TE1aSlaAEPcM0aZs5ysFbIQkEWQbGP8UdafTllNWKvBEjVDlCp26K2thuqOOkQmFkFH560ZYV6j4Bylr8/oCkcOAi2/EF9bKqebGZyfu4BWIJ4LwjZklY/4HIvynmHzRoq9I2nXiVfwDDhNDWGFb1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405434; c=relaxed/simple;
	bh=CaoT/uf9yGNMSnZay0+VPUgCwq0nmEaTd91fIYl4ZGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AZ4rP2XurhItX+P+BQPUVfLq32pWnWokEjrvDY5gylz8x4S4o3Vn7RJ37/zh0v5+BDJm3ANz3Vx8wEDhjj7oT1Gqt0I8b6T3Z5K1FAFucBugDFV+zis1SX5HAddFEyEltwbAC60rt/mOaCCM18XSVl7/MKDkBT21pZvHWSg+gbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LiLydUbe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ubskq2ys; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LiLydUbe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ubskq2ys; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LiLydUbe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ubskq2ys";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LiLydUbe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ubskq2ys"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 83AF31F441;
	Mon, 19 Oct 2026 10:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792405431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=f3aO6QrmEmWuqorGy29ChZkGSEnc+9ZjcNq9MHbp1SQ=;
	b=LiLydUbeh9XPXivskgMhZV5sbzrBvy6f65S50Fm7khERCx625dNOtfW+eskD19BPtP4wbv
	ppTwIIpu8CtVIh3BBoPCZMbC0wzg9MvGI+/zj0b6TZJk1/vU99Axlpepys7Tvp16BY70+x
	Gbxh6gWcoFLGjxwOuj55UkRoxFylbaA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792405431;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=f3aO6QrmEmWuqorGy29ChZkGSEnc+9ZjcNq9MHbp1SQ=;
	b=Ubskq2ysujDo2MnFhg8mRbULv8QAKaEQP/aqDLesGJeJ2Kp0IMTcP2bvcogA6blbQm7wNQ
	k4sosM9zI8P/vNDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792405431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=f3aO6QrmEmWuqorGy29ChZkGSEnc+9ZjcNq9MHbp1SQ=;
	b=LiLydUbeh9XPXivskgMhZV5sbzrBvy6f65S50Fm7khERCx625dNOtfW+eskD19BPtP4wbv
	ppTwIIpu8CtVIh3BBoPCZMbC0wzg9MvGI+/zj0b6TZJk1/vU99Axlpepys7Tvp16BY70+x
	Gbxh6gWcoFLGjxwOuj55UkRoxFylbaA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792405431;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=f3aO6QrmEmWuqorGy29ChZkGSEnc+9ZjcNq9MHbp1SQ=;
	b=Ubskq2ysujDo2MnFhg8mRbULv8QAKaEQP/aqDLesGJeJ2Kp0IMTcP2bvcogA6blbQm7wNQ
	k4sosM9zI8P/vNDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 428E8136CC;
	Mon, 19 Oct 2026 10:23:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YIgjBrfv1WoXWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Oct 2026 10:23:51 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Will Bush <will@willbush.dev>
Subject: [PATCH] ALSA: usb-audio: Avoid applying boot quirk for Behringer UMC204HD
Date: Mon, 19 Oct 2026 12:23:38 +0200
Message-ID: <20261019102347.2425406-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.com:url,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

There have been reports about a regression with the recent boot quirk
for Behringer devices; it broke UMC204HD models(1397:0508 and
1397:0509).  The quirk was to just run usb_get_descriptor(), so I
expected it rather harmful, but in this case, it doesn't look so,
resulting in an error like 'failed to read device descriptor: -110'
that leads to a fatal probe error.

As a quick workaround, skip the quirk for those UMC204HD models.

Fixes: b5c4823cf3e4 ("ALSA: usb-audio: Apply boot quirk for Behringer models generically")
Reported-by: Will Bush <will@willbush.dev>
Closes: https://lore.kernel.org/45162613-2802-401c-84c9-742f9c8c68e6@app.fastmail.com
Closes: https://bugzilla.suse.com/show_bug.cgi?id=1285896
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 4fadb1fdcdea..4ac4aef47dd7 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1790,8 +1790,15 @@ int snd_usb_apply_boot_quirk_once(struct usb_device *dev,
 	}
 
 	/* Behringer devices may need explicit device descriptor read at boot */
-	if (USB_ID_VENDOR(id) == 0x1397)
+	if (USB_ID_VENDOR(id) == 0x1397) {
+		/* the quirk seems breaking on some Behringer devices */
+		switch (id) {
+		case USB_ID(0x1397, 0x0508): /* UMC204HD */
+		case USB_ID(0x1397, 0x0509): /* UMC204HD */
+			return 0;
+		}
 		return snd_usb_cm1a_boot_quirk(dev);
+	}
 
 	return 0;
 }
-- 
2.55.0

