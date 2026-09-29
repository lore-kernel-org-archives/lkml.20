Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF9251EDFA;
	Tue, 29 Sep 2026 12:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684176; cv=none; b=mZpZXQp9jRS0FXmAFOOtVSDDQkj19djegk+4IjQvvzu681ZpGy2pPYOBb6aBHb1gIqR2n4vCHum8AaMRjFyMgS0AJidSIR5gWjm/tcGsFd07GdRzt3Zb8qfslJC9SWAffGkvpWYA6rri81HrJ7bNgH3HdT94smfdqo9wVOG1mDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684176; c=relaxed/simple;
	bh=ozo/JN2TBahOT9sx9eLhFC4jmrEjD2jsBaNmzoTwfcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yqnf0VdBwKVHOjXDkG4nTXhMATE4JG6p4TtBIdajkA52KXagsxTdGXR35QMxy/eaCNMVn6h+NHefpqWrpm5lb/BCkirPAkONDcrAVdvzwdOk/ptlCTQGSY8tWA2z4HiwZKl+iX7+xdn1QjyNQyq3pMl0cOqCog6PkAym8lmU7NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pGQtGv97; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6RDDBLje; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=axJtrSB+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E6YTAO8+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pGQtGv97";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6RDDBLje";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="axJtrSB+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E6YTAO8+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8AE5921D89;
	Tue, 29 Sep 2026 12:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790684168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uxGIH1nhOzmjae6MD+mtSp2Zz2/PeQLiVFgKV1HGfnA=;
	b=pGQtGv977yjHxwRKYA88Yg5PDdt92UNnk0X9a0hBKqT3+h6GFmycegDkOEYTbHndZ1/CfX
	YyXFuZQ+IjYUaIlOgSDgLxDMFoD72K+KZGjCgQcFaNK1xEBlrKSmmaNbnQeBjhQg/mFrdK
	eeKEcszrzey59xluMpGyZq8vddZOR/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790684168;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uxGIH1nhOzmjae6MD+mtSp2Zz2/PeQLiVFgKV1HGfnA=;
	b=6RDDBLjeIVfvq8VTcffChNMyu86v4TXz9jfMN7uPAvjdCDIKn7e8Lk2E0krVijojOPe9jE
	SOStf8CzX3souVCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790684164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uxGIH1nhOzmjae6MD+mtSp2Zz2/PeQLiVFgKV1HGfnA=;
	b=axJtrSB+vrpC1L6bWJmu+mY7psziHpY0U8a7H/aW08KI/Z9k005/9/PbkgyED+v4UXRsGY
	NvJXMChguM5c+pyQUNISNVWjP4QzJvXpFMudS54NY83xR59tuJEutGYiBmBBsQgO8FRa5i
	gpf883BQU3mAIf3bI6qZBhn7Dd5pmiY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790684164;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uxGIH1nhOzmjae6MD+mtSp2Zz2/PeQLiVFgKV1HGfnA=;
	b=E6YTAO8+t+wSyfqW5VnZ+6JfDDllhlLITfKIJnS0duB2q0kpH7dvDrtpO2jeNdsjAFjShC
	PHA0L6la3Vh1f6Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5AD3E133F1;
	Tue, 29 Sep 2026 12:16:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DPV9DQSsu2r/SgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 12:16:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Zipdox <zipdox@zipdox.net>
Subject: [PATCH 0/3] ALSA: usb-audio: fix for UAC2 mixer unit handling
Date: Tue, 29 Sep 2026 14:15:53 +0200
Message-ID: <20260929121558.1464094-1-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Hi,

here is a series of patches to address a long-standing issue about
handling of UAC2/3 mixer unit.  We have some translation between UAC1
and UAC2/3 feature and mixer units, but the latter is handled
incorrectly with a bogus wIndex.  Also, the current code tries to
retrieve the information by multiple calls even though UAC2/3 can
already give in a shot.  So there is an optimization for that, too.

Link: https://lore.kernel.org/d46fcac6-bd7e-4fc4-95e1-4e8d39f92ad3@zipdox.net

Takashi

===

Takashi Iwai (3):
  ALSA: usb-audio: Check mixer matrix size for UAC2/3 at parsing
  ALSA: usb-audio: Fix UAC2 mixer unit request handling
  ALSA: usb-audio: Optimize min/max/res parse for UAC2

 sound/usb/mixer.c | 239 ++++++++++++++++++++++++++++------------------
 sound/usb/mixer.h |   2 +
 2 files changed, 150 insertions(+), 91 deletions(-)

-- 
2.55.0

