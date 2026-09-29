Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4A5495AF7;
	Tue, 29 Sep 2026 12:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683419; cv=none; b=qBlI3gy2uXb0cOjPGd5NkC5uYrqUNKucBpU5WYhf4sblEpv0dlEwUOWuvdBnJc+73FNyDSmsdOuMCWyYkynQufraXDO1AT3s6a0rLNbdF9tvPKVTAsjLLHDI9hbwp+C8tCKJJOPTbmeoRDNPBF1jf3Tew4H5TKuvJqiv2RjUY7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683419; c=relaxed/simple;
	bh=PciWmux5HC5M2ATiQSEpq6zzLM96CmzakRTho6QSq58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a85+fUF+a904va2Z2tosx/bcxrtcATh2tlABW8ZoxXF07l5Odo+SkSgW0sI4nCDNqz3qq6n1UZtI6Dw+OlGOcgHxnj6uWQ5OfhvsxYTN+4tejDsUXWpIoQB0Pn+imbuGQVFfpG533xUc+J6c5wQGPB8NOgR5wx8V6BDwMaHg6ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KswvEEw9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XANZYQaW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Dh4XFkPw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yoq9i3p7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KswvEEw9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XANZYQaW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Dh4XFkPw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yoq9i3p7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D0F3B1F76B;
	Tue, 29 Sep 2026 12:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790683411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Xa50dbhvCypPo+vN82ToespHPquiCP3aRkNeiNkZCcE=;
	b=KswvEEw9/BRTKFki8jGndIXGJVFQMVCzdzEZmwAJp/0OYtAljCqQDKYTfp1TLWf7/GHasM
	n3QSBgYCoiSBaJzjSaT2/Zw6EdY8e5M3HsfUcvMPIGzb+sy6vwIU4ApxMXy0zNtyOATNgS
	+k8UfJclYhGC8hC4o4C1TqJjCP6agGs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790683411;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Xa50dbhvCypPo+vN82ToespHPquiCP3aRkNeiNkZCcE=;
	b=XANZYQaWXPBDOVmMbm2CKx0qQ5kFJovd0XKJHApNQPIIqSAjWRMgeTa/9SOY4ihpklv+Bu
	CW6UmRb7wImo5CDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Dh4XFkPw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yoq9i3p7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790683406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Xa50dbhvCypPo+vN82ToespHPquiCP3aRkNeiNkZCcE=;
	b=Dh4XFkPw9lOmbZOoL8U3nfLVp3GrzfW+Vq12xSthSsU1QXEt2RS7GZfnmZbpGka2izKANU
	d9gR9qUnCOMMny3meBTjP6/DYUy4lcyf7zzzkaKE6jS1pHelMJr3C48RabwmSuIsqMgbTa
	LbNw3KNRzQIiEtaxNvjnBvCZiE+Rlxw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790683406;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Xa50dbhvCypPo+vN82ToespHPquiCP3aRkNeiNkZCcE=;
	b=yoq9i3p7xZ0MB7ytPWSxXEJL3GWfEAV+gHxItKZfAhvuqcSjRKedUybiAh95/9pTpGdSsn
	8rXih2rGFwft3CCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 99312133F1;
	Tue, 29 Sep 2026 12:03:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZpXjHA6pu2q0PAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 12:03:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Jan Lentfer <jan.lentfer@web.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Apply boot quirk for some Behringer models
Date: Tue, 29 Sep 2026 14:03:06 +0200
Message-ID: <20260929120309.1460348-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[web.de,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FREEMAIL_ENVRCPT(0.00)[web.de]
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: D0F3B1F76B
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Jan reported that a few Behringer devices became broken since the
recent optimization to avoid usb_string() call at probe time at the
commit b364a0d23cae ("ALSA: usb-audio: Use strings in struct usb_dev
for manufacturer & co").  Interestingly, the devices seem requiring
the explicit descriptor read at probing time, and the optimization
above dropped it.

There is already a boot quirk for another model, Behringer CM1A
(1397:1234), that adds a device descriptor read, and this seems
working for them, too.  So just apply the same boot quirk to those
affected models:
 - Behringer K-2 Mk II (1397:1230)
 - Behringer Kobol Expander (1397:1249)
 - Behringer 2-XM (1397:1256)

Fixes: b364a0d23cae ("ALSA: usb-audio: Use strings in struct usb_dev for manufacturer & co")
Reported-and-tested-by: Jan Lentfer <jan.lentfer@web.de>
Closes: https://lore.kernel.org/e7087d42-5e74-4d85-b1c5-b11eff235d41@web.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 294c7026b93c..de6a82a42eb7 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1702,7 +1702,10 @@ int snd_usb_apply_boot_quirk_once(struct usb_device *dev,
 	switch (id) {
 	case USB_ID(0x07fd, 0x0008): /* MOTU M Series, 1st hardware version */
 		return snd_usb_motu_m_series_boot_quirk(dev);
+	case USB_ID(0x1397, 0x1230): /* Behringer K-2 Mk II */
 	case USB_ID(0x1397, 0x1234): /* Behringer CM1A */
+	case USB_ID(0x1397, 0x1249): /* Behringer Kobol Expander */
+	case USB_ID(0x1397, 0x1256): /* Behringer 2-XM */
 		return snd_usb_cm1a_boot_quirk(dev);
 	}
 
-- 
2.55.0

