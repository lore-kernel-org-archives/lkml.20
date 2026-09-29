Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F15B50B432;
	Tue, 29 Sep 2026 12:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684997; cv=none; b=hvct5JF6sp4syV9czCmcyl68Kq5q1GiyvaQCYTUvX++KC0IVGegoEApAcVRoL6z3cb3u1l5hfgKrLX/QlBENpoHde7WZ+jdogG+HZF6Nb0LlX0G97+oOWRwlcXFcfYgePM/xxTXQ1JJc4ttn58jhpDmUftVguLgGwiYIh9BgaB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684997; c=relaxed/simple;
	bh=De5Jw1KJiDJSyRBdRbxh/06pAZuV3uzth4IIILPRif4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YizU+V9tjhwxUL3qkzmfMIqwetXrRxpXBZbTgc1nSmNeREr6zJs7LzqcGdkbTzoN0fEki1pIEK/aH+gU7hit1o4BKaBtcGg4CFe+MzGdjyz2MmOh0ABRuCtLz2GAcM2YT83ju03hk+5Od0yjWVD5K/AWctEXn7HP9TnQAmYvFxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WXyuMFUk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dWsL9DgE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uIb3PBSt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CTTDFhDy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WXyuMFUk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dWsL9DgE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uIb3PBSt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CTTDFhDy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 51E781F38E;
	Tue, 29 Sep 2026 12:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790684989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fK8rfxU57OGuKQ5dV1SHwXIpRVqG6a6rbD5Y5fiC2YU=;
	b=WXyuMFUkQJTvickO2PwsqfsZEuyZZ6WYl2UYHZO97eRLwp3mcKDiaNghPww52xinD/mvYz
	fnfigErQTru7LFJCBhUVgoWP/knBPbARGqrX5+0GfwzoJWpoCSZWqR6t/060jfeqOqh4kZ
	SiGrbHgN4ARf+nreWz/zZXjZrHspAR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790684989;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fK8rfxU57OGuKQ5dV1SHwXIpRVqG6a6rbD5Y5fiC2YU=;
	b=dWsL9DgE7crZFbecxJBe6qCF6IBJ2CtJq1v35giDdl4Cd79GTzt2ycINlkGtNwp2nOJ2cK
	+V6+GrvOBlsHnVDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790684985; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fK8rfxU57OGuKQ5dV1SHwXIpRVqG6a6rbD5Y5fiC2YU=;
	b=uIb3PBSteJM/p3XGg86OzCraHr+708RAVOqbj+f4gHwnxVseniZsCbi1/yiyKQ6TnZMSUX
	2M4+P7GtaGtWbBBGWLPrD+oqeL6LTzBMSHr8GJDLCRKGbLwDjZHqjYhlkLZPR9HRiYoCPI
	cJE1DevO5w2DsfXst+g3n76bfrmgEgs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790684985;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fK8rfxU57OGuKQ5dV1SHwXIpRVqG6a6rbD5Y5fiC2YU=;
	b=CTTDFhDyGU0WqBosTqpHegA9g8wo4jxYAOQb52LWo8Xp/jjc7/Bvvhq2dbW8pVYfuwoyI3
	VGh50CUYcwqfs8Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DBF5133F1;
	Tue, 29 Sep 2026 12:29:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BJsYOjivu2rIWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 12:29:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Jan Lentfer <jan.lentfer@web.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Apply boot quirk for Behringer models generically
Date: Tue, 29 Sep 2026 14:29:25 +0200
Message-ID: <20260929122938.1471867-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[web.de,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FREEMAIL_ENVRCPT(0.00)[web.de]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Jan reported that a few Behringer devices became broken since the
recent optimization to avoid usb_string() call at probe time at the
commit b364a0d23cae ("ALSA: usb-audio: Use strings in struct usb_dev
for manufacturer & co").  Interestingly, the devices seem requiring
the explicit descriptor read at probing time, and the optimization
above dropped it.

There is already a boot quirk for another model, Behringer CM1A
(1397:1234), that adds a device descriptor read, and this seems
working for them, too.  As the quirk is safe and cheap, just apply the
same boot quirk to all Behringer devices for avoiding the pitfall
again.

Fixes: b364a0d23cae ("ALSA: usb-audio: Use strings in struct usb_dev for manufacturer & co")
Reported-by: Jan Lentfer <jan.lentfer@web.de>
Closes: https://lore.kernel.org/e7087d42-5e74-4d85-b1c5-b11eff235d41@web.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

This is a revised solution from the previous patch
  https://lore.kernel.org/20260929120309.1460348-1-tiwai@suse.de

 sound/usb/quirks.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 1c248075c48e..9207504e9b82 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1784,13 +1784,15 @@ int snd_usb_apply_boot_quirk_once(struct usb_device *dev,
 	switch (id) {
 	case USB_ID(0x07fd, 0x0008): /* MOTU M Series, 1st hardware version */
 		return snd_usb_motu_m_series_boot_quirk(dev);
-	case USB_ID(0x1397, 0x1234): /* Behringer CM1A */
-		return snd_usb_cm1a_boot_quirk(dev);
 	case USB_ID(0x2717, 0xd005): /* Xiaomi audio connector */
 		snd_usb_xiaomi_boot_quirk(dev);
 		return 0;
 	}
 
+	/* Behringer devices may need explicit device descriptor read at boot */
+	if (USB_ID_VENDOR(id) == 0x1397)
+		return snd_usb_cm1a_boot_quirk(dev);
+
 	return 0;
 }
 
-- 
2.55.0

