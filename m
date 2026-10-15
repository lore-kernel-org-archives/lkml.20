Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764BB4AA59C;
	Thu, 15 Oct 2026 07:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050888; cv=none; b=UjWN7xT47TaFw2LwivyMnVXvpDC/MUkzBldmo18hGGBfrOqIPmzRiYH5/i/Od1MHHxt4m7uvbd8xyW3F6kQsuX1z+qjKSogW/Uqrh4yhMtUa1MXrVHHRNHkFbNqqNrRP6cQZBv55K10LWcQZ+DOFuX+7cH3025lJecbt5yifduw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050888; c=relaxed/simple;
	bh=h9tO7vxqxPIqSmibKshkj8aim4a/9qc3nrb4oZ7zKIY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=feyeHqz8IxYvwdEZCUkCPtl/WZ0Jb7kafxJ+ybm4U60KQgHoefy6LrqQcfyJ6nwHqeT0ZFk9UGTyK7aGEonSTy6GCWsPPZ8T2PGlboPjsjCyGtR4DY3NmHHhQ7dQV385xdHmtTpibo51JoISdS4mN/TpQd+A2hTf6sqhMHE43gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hahIvhrq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bB6t0D0X; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UkiilY+s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TXVXvKs9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hahIvhrq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bB6t0D0X";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UkiilY+s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TXVXvKs9"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ECEB522363;
	Thu, 15 Oct 2026 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792050884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=khuUg0FSxblbW8XAP39TOmeefw9e+QrYzLsLg7I24MM=;
	b=hahIvhrqmydGwIP9yyzYYWcOpeNJ/hoevvcqYLh+ep5LpdLm3QLMuWU7cT7tMKtc0p65q0
	ap/mzcm4DeJtt5Qs8gDCg0ks/gmw5PxOk8lUlN0twMCbklMep6yBkhJbpSQMa/ZBspRp+L
	4o6evWAkNcNuMc1XEr1XfK2j/tgf6KY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792050884;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=khuUg0FSxblbW8XAP39TOmeefw9e+QrYzLsLg7I24MM=;
	b=bB6t0D0X+SQXMGoeyRCMa37z+7pHbI6LWnKi3KAvE3yj6RKWX3ALxZo4bhzyoYYGincKZ6
	r1U1x3qKXaIoxCBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792050882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=khuUg0FSxblbW8XAP39TOmeefw9e+QrYzLsLg7I24MM=;
	b=UkiilY+su34IuwbW6uNvmbhRYxlMjITN1uBCLj4RYbtprAz8hPmsk5zPkONIlHteRXkCTq
	leHVCj4UnN8x5yFAuVr6DwaABPiv2WZA7MrdQ8sh+z26W4fmjx4m31MNe+DbT/m3DgcSTM
	8yppMYVWUkkmkr0qjhl/eKCquNzM6yg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792050882;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=khuUg0FSxblbW8XAP39TOmeefw9e+QrYzLsLg7I24MM=;
	b=TXVXvKs9cUWpfyKX2O+Ula7bcDt10djsfWa/aP/6qSjNe+vvQ8nQVJwzSTFkkIjP+T75PZ
	tCd0y5WyzcAfBSDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B21CA132C9;
	Thu, 15 Oct 2026 07:54:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AEZ6IsKG0Go/XwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 Oct 2026 07:54:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: ump: Correct return size of fill_rpn()
Date: Thu, 15 Oct 2026 09:54:38 +0200
Message-ID: <20261015075439.50088-1-tiwai@suse.de>
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]

The RPN/NRPN conversion in fill_rpn() is supposed to return the number
of bytes of the resultant UMP packet, but it returns boolean values.
This would result in the incorrect ump_bytes in the converter, which
will confuse stream processing.  Correct to the right value 8 as a MIDI
2.0 UMP packet.

Fixes: e6ce8a28c768 ("ALSA: ump: Transmit RPN/NRPN message at each MSB/LSB data reception")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump_convert.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/ump_convert.c b/sound/core/ump_convert.c
index 85cc67de6330..0a7972d91ec5 100644
--- a/sound/core/ump_convert.c
+++ b/sound/core/ump_convert.c
@@ -323,7 +323,7 @@ static int fill_rpn(struct ump_cvt_to_ump_bank *cc,
 					      cc->cc_data_lsb);
 
 	reset_rpn(cc);
-	return 1;
+	return 8;
 }
 
 /* convert to a MIDI 1.0 Channel Voice message */
-- 
2.55.0

