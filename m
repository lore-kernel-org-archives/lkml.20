Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDAD3E5594;
	Tue,  6 Oct 2026 13:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294263; cv=none; b=jVaNFUN8t/+LlWeYv9pLALNe/vFJd8aq08xfwUHgOCw+hEhIkJNlefNQtqelzxFlrB1GNslqRFM7QmJ11ke9EaVAVBfFPD310gjOJ4Pmp5+m80jEteJ3Smq6N7rSA8HiQ+jENVQOQpi+5BG3E0w00BfEOS5loQfdMuwq4RkQe7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294263; c=relaxed/simple;
	bh=OBIxQmRg7OrKKlyFGrvm/xICNovZ5BVEtgvAoYv/WFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rrBQbZW5Ylje34+Im+C7HpfzeuBDaFXIPjEjevfzOK8Tbuy5rP9qZBhjAp7d9zVGyLMgvC9td2bS5hVK9fffmCblsLWFHN7mMmGZx1yKukMrVO7Ks61P+lrMfD5tzt2767+cYdV4Eg/JDIyzefw+dojt+suvGPPL5lDEwWWI4AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kxow4c+2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=j1zeHV2P; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=djxkJvmW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ezzNTzAk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kxow4c+2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="j1zeHV2P";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="djxkJvmW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ezzNTzAk"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C42C7220A5;
	Tue,  6 Oct 2026 13:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791294255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HT8/PDhTgIlYlFktH6fw4m4BmPnl0zVq3igguRM1jqQ=;
	b=kxow4c+2ejrOfwltVqqhCDKJcMhQ6uyqLBkVdRYv4Sx/Un1qfuyLC6ksbfHz5IkuTts4Pu
	d99Q1ebpAnJotHubb2GEJXe0c4NyTilx/Y/rE/nG9m6z6sGXLIhVVNaNxuHuRmBfEuHhuK
	wsf+skxLpkAQFi9ZIPL89QsaX6lDhvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791294255;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HT8/PDhTgIlYlFktH6fw4m4BmPnl0zVq3igguRM1jqQ=;
	b=j1zeHV2PXgJ6gJtcy50YprLpZ4uCyzSj1dsK5W6gE8GHUdtSn7zhrbuiPHyk1xQJvC3PDp
	jlhIlJYTpcaSLiAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=djxkJvmW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ezzNTzAk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791294251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HT8/PDhTgIlYlFktH6fw4m4BmPnl0zVq3igguRM1jqQ=;
	b=djxkJvmWlQawU2TcG3jGMa6KulIdCwRaqgbh7tRy89s0vL+AGX26fN7iKPTz1vMCa9Sr5g
	DpshcLZfcAbV78p9EPr2qxnB4+c40B1Pn5ZrAvznkbrpcPz5QXilL2VGgsuAjrr4GbsT2Q
	d1TstGFZp2KEiZ8x7bmYZlnm75FpWaE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791294251;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HT8/PDhTgIlYlFktH6fw4m4BmPnl0zVq3igguRM1jqQ=;
	b=ezzNTzAkWeZHYgqUa3GnifFyw8JBYRfYtVi5vd9/jF4d4G7pHF2Wr7NVWMsDDS44wIZdHH
	AZesm13GV4ZanKDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8B3181368D;
	Tue,  6 Oct 2026 13:44:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZKdNGSv7xGqjdAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 06 Oct 2026 13:44:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: caiaq: Allow zero-length packet handling for EP1
Date: Tue,  6 Oct 2026 15:44:04 +0200
Message-ID: <20261006134405.479603-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: C42C7220A5
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

The recent fix to avoid OOB access for malformed packets added a
packet length check and returns immediately if it's too short.
However, this can be lead to a regression because the completion
handler doesn't resubmit the packet, while a zero-length packet itself
is valid, per se.

For addressing the potential regression above, change the handling for
a zero-length packet to just resubmit without processing the incoming
contents.

Fixes: aba30af07d4f ("ALSA: usb-audio: caiaq: validate EP1 reply lengths")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
resubmitted due to a typo in the address, sorry for inconvenience!

 sound/usb/caiaq/device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
index dea3a68ca896..a596f5f763b8 100644
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -143,7 +143,7 @@ static void usb_ep1_command_reply_dispatch (struct urb* urb)
 		return;
 	}
 	if (urb->actual_length < 1)
-		return;
+		goto resubmit;
 
 	payload_len = urb->actual_length - 1;
 
@@ -193,6 +193,7 @@ static void usb_ep1_command_reply_dispatch (struct urb* urb)
 		break;
 	}
 
+ resubmit:
 	cdev->ep1_in_urb->actual_length = 0;
 	ret = usb_submit_urb(cdev->ep1_in_urb, GFP_ATOMIC);
 	if (ret < 0)
-- 
2.55.0

