Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A6C547073
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791293263; cv=none; b=Kp9Ai2CFOVmaodh93teU3bczctv7+jAFiDxDN4ssd42qe91LZci/QFGi8Kyi3u6JVHLZOIbL12Q98x4mZV+n/KoCEhwr44226kHoxOoBEEkbpRzLMRHl48j6Kbi1xaw0JcdZ9yIREZbmFLfFfyPmXpQxLhoQSsnGc4a+s0cnoKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791293263; c=relaxed/simple;
	bh=D6SCTdmcByENC3y6LIO2+R7KlyVXFXTr0rb63G7+ObU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gGOi1TtZmyfPdjLrLJGRUc740+f4xaNXbxbxnviQh1fTfiLYO/h/k9Td0FpWL+Zbr9m1lC/wKDHNJqOXYRCO4taWV+irKC/pJxSleGWvRyEy1YDQKIwPSFXdNk9F/Oj/ZaiqsZXi5wEYINFoiUegmbX702027q8noOdeDMiYjW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Bg22N0cU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yXiTH4my; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sRDYN3eG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+dn0/Ggv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Bg22N0cU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yXiTH4my";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sRDYN3eG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+dn0/Ggv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ECF70220B1;
	Tue,  6 Oct 2026 13:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791293256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+eTQT7kfCFg9E9pn+BH+E+AYSJ0PhGECvtNap1x2seA=;
	b=Bg22N0cU1kNDuH1ib+mhpXlSYUMf4FjJvlICyA0IT+dq4gVAauebuZ95la3uuavy7DdtYr
	R8ouv+F+70mUqzRRrKlIWEC518YutDJgcimVB6SvtVxOTpuXgeXdgkA2WTGHAcj3dRcg42
	HcClyTrYOOe8RhUayLk0MS/jeOOgMxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791293256;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+eTQT7kfCFg9E9pn+BH+E+AYSJ0PhGECvtNap1x2seA=;
	b=yXiTH4myms4rHhKj9AhbchI0xQ2AyYY2QJYmuPZ1oWf4yFILluxCTveXj21qyMOmd9teY0
	UmB02WTE7xsl0RCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791293251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+eTQT7kfCFg9E9pn+BH+E+AYSJ0PhGECvtNap1x2seA=;
	b=sRDYN3eG2Bdu40/xI4xOT6cXBeZ4RrbQ+aLvtvlSqA2/AjSBUmpzPIYysGWb7TRSrrE8sc
	hibjfetFiT4b8SdtDTSQrFa/yHW4HxgPXscMDBeL271oKOSnVv7P84++JJ2/G8Dmh9fDdR
	O1mMT4OZIhmItYG6jBdy9wa/UYZHUgw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791293251;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+eTQT7kfCFg9E9pn+BH+E+AYSJ0PhGECvtNap1x2seA=;
	b=+dn0/GgvhexAXkG4+r1xVqlNpW28zMgq9U/K34gR4hjdQSS0acHZ1KCsfyGNWD/TAD+u2F
	BN2/T/JY3OZClPCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C3A5E138A7;
	Tue,  6 Oct 2026 13:27:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UZZlKEP3xGqiYQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 06 Oct 2026 13:27:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: liux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: caiaq: Allow zero-length packet handling for EP1
Date: Tue,  6 Oct 2026 15:27:26 +0200
Message-ID: <20261006132728.475067-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-0.99)[-0.994];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.79
X-Spam-Level: 

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

