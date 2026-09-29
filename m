Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390EB52ED51;
	Tue, 29 Sep 2026 14:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692927; cv=none; b=YUU0LsnkvE2n2XKp3Vsg6FJM4npx/lBDUXFzOwE2SYvyrj/hfZ5dcHK8cxZovTeNQo0ms1er1pGaGkpagU8ZsulscWeTvV5xLKkZHDS1olR8S1R4A2luG+GKGDeJOhKRkACznSlNqUNR82LX9JV22shRSbASi1koFBMfYIz1L/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692927; c=relaxed/simple;
	bh=kyl7YJ+MNfvTfxXOeDdElNHzfn+MF9uwnX7++Ea4ID4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b50ggiPCx5RXwkwACLT4Z6Z2igHSyppJE7+BXhttNX2M4bERRkFIl2T2YsUd83yVefZvJ2XFNW/H01D9LMgnk5wFjn5KVxw0xrXCteiFGv5CygKo4B2wXgkAoIGJKS+3ebsTYfRzxBo0QZ/w3smCqXuGqRYFJ9dS7xnXmG2FzUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HrCW3Ss6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YtdDhjEa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P+aT7b5W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Gas2s5mR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HrCW3Ss6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YtdDhjEa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P+aT7b5W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Gas2s5mR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D51221F456;
	Tue, 29 Sep 2026 14:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790692909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9mlUlJ1Uj1EwaCTEtXSdce2YuJL1MWogmC7fd3+U35k=;
	b=HrCW3Ss6VzKdC9K8Mysq9k2nZNGDOC/N+UV8SAg0Pv301iP7bn6QJEXfYes8PfBpVkp2QB
	g8JlLT1zDrUUeDmYcOZSQlCGYNKaEEbZv5E2QUgoIqel9bb/DPV6fmqXTE/P+QACQ8DIRE
	+MPO2Q1VIpJe4vvKtuYp2wlmW1SNA8Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790692909;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9mlUlJ1Uj1EwaCTEtXSdce2YuJL1MWogmC7fd3+U35k=;
	b=YtdDhjEauFMKnqgTZ1tw7cDdIhx/8GgTETqSMs39JA5XWry1lmvNnlSep2/RsR67CQ1qDn
	y72p8Gnu1G//KoCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=P+aT7b5W;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Gas2s5mR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790692904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9mlUlJ1Uj1EwaCTEtXSdce2YuJL1MWogmC7fd3+U35k=;
	b=P+aT7b5WFElwjdiPhmQHBECQtUzgg7rTXlskTx5wT+NS686drJ/AojkMa4yNln3MF1UHjd
	Sr23FpqqcU714FE2LF6E+i2FfBu1WGN5UHTzDmU+1wnypg3Zb0GesoVUIgakdrIG5D3u0e
	+X0+ZXwfeuMm+fW+OOibhFbr81vEml8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790692904;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9mlUlJ1Uj1EwaCTEtXSdce2YuJL1MWogmC7fd3+U35k=;
	b=Gas2s5mRWNxWc4A1GA93jcSLRIZkxVodRt8yPc9Pp/cmv94kOCqfnUYMkP5zbw0WWCWhMJ
	tQcscu7GzC6zwjBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C6EF133F1;
	Tue, 29 Sep 2026 14:41:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mIPkHCjOu2rgbAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 14:41:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Faaris Ansari <faarisansari@googlemail.com>
Subject: [PATCH] ALSA: usb-audio: Apply IGNORE_CTL_ERROR quirk to all Audient devices
Date: Tue, 29 Sep 2026 16:41:26 +0200
Message-ID: <20260929144132.1521617-1-tiwai@suse.de>
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
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,googlemail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_ENVRCPT(0.00)[googlemail.com]
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: D51221F456
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Faaris reported a problem with Audient EVO4 device and it turned out
to be a regression by the recent fix commit 87a6f2fa6e6c ("ALSA:
usb-audio: Propagate write errors in generic mixer put callbacks").
It exhibited that the hardware gives errors at accessing the mixer
unit 10 on certain channels, and the change above made it a fatal
error.

We had already a quirk for Audient iD14 to work around such errors
from the mixer controls, and we can simply apply the same for EVO4.
OTOH, it's highly possible that other Audient devices suffer from the
same issue; they must be using similar firmware, after all.

So, in this patch, we apply the quirk generically to all devices with
the vendor ID Audient (2708), instead.  Ignoring the control error
isn't usually less critical than overreaction to the firmware
misbehavior.

Fixes: 87a6f2fa6e6c ("ALSA: usb-audio: Propagate write errors in generic mixer put callbacks")
Reported-and-tested-by: Faaris Ansari <faarisansari@googlemail.com>
Closes: https://lore.kernel.org/CANBVYRCL=8QdLxGg4S6qrahrFtwJxhv-aSGpW7-1S=+iOe4ZGA@mail.gmail.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 294c7026b93c..023c5c07ab66 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2514,8 +2514,6 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x262a, 0x9302, /* ddHiFi TC44C */
 		   QUIRK_FLAG_DSD_RAW),
-	DEVICE_FLG(0x2708, 0x0002, /* Audient iD14 */
-		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x2772, 0x0502, /* Musical Fidelity M6s DAC */
 		   0), /* for avoiding QUIRK_FLAG_DSD_RAW with vendor match */
 	DEVICE_FLG(0x2912, 0x30c8, /* Audioengine D1 */
@@ -2614,6 +2612,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x2622, /* IAG Limited devices */
 		   QUIRK_FLAG_DSD_RAW),
+	VENDOR_FLG(0x2708, /* Audient devices */
+		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	VENDOR_FLG(0x2772, /* Musical Fidelity devices */
 		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x278b, /* Rotel? */
-- 
2.55.0

