Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA25449B00;
	Thu,  3 Sep 2026 14:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447429; cv=none; b=hwiOMK/kzBYle3uBCab2SdOwYip99URtfDghQtO9K98AF3nzPGUWluilFTYGW9ZRJ4qXV3j22M/uIafzfLYu0MkC/QKguc8oojy3ElcZ0aAKeE/VFQitilUR6udggWd5ZGiPMyMMvZm/qJu8zDJIolqqgR6+lEuOBaMzB42cEl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447429; c=relaxed/simple;
	bh=GM/jDfsCUY6YIdVF0aHFnafrT4DDpQIdN7te4iKyV88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YLLyqWvc5izDxfiJQM7PRwL1VPFOxBBQiIXHI07X7qytldu4P2jQlcR9h6nbRUEvNrhFJtv2CdduwQVPe8OaFlsdpbfYPJzBtlb0FpvHji9tOKcJ7Qpu+kosFecmOic36Ou0OyOn+pNoT3x4eKxqAMhkXjIzLjYnvAqw57V6wXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vMQD2MO+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=llR45hBX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xh/hPa+P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=j/Y3uzqg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vMQD2MO+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="llR45hBX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xh/hPa+P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="j/Y3uzqg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 369E421D50;
	Thu,  3 Sep 2026 14:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788447422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GfreeyqJNgQNnXjGIqKcOXx3dpLKjQowl8aMNQHs+jI=;
	b=vMQD2MO+abfeKVYEVA9z0hh6/4Ib4vOp7aar2aY990nBPGTe4JM9/UH2rjdX0QsbmiSYBv
	hOhz7UUWrkU0lzX0rkxBWAm+T2cHt03Yu8cGe3uwqZcz6nVkoaDdmqJYX9egqtL3rjMavU
	kKg4FY+eWtRrguCpLjHuzJHjCNfdTjk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788447422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GfreeyqJNgQNnXjGIqKcOXx3dpLKjQowl8aMNQHs+jI=;
	b=llR45hBXHrgTky1qvEU4Dp37aYGHKpDCeCRvigGwdFkNmelGAatUWkaHhD90NNkw8orNqD
	ZXW/MzK9e1Ns5/CQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="xh/hPa+P";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="j/Y3uzqg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788447418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GfreeyqJNgQNnXjGIqKcOXx3dpLKjQowl8aMNQHs+jI=;
	b=xh/hPa+P9Cm/1vC7ieJNs/wycePP2rHhOzAVsDxgmQAWdnZ4YIXNBUx5wQ4X6SNYchQjta
	raShZGYUDCk2URZfPlB9NEqvYs6SLbpbUgCJwz9WPAsl969wY2CsDr6AccaUCWnRpI1o8y
	ImcplJScQy6Zbh0tiKtylAM9CKlYyIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788447418;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GfreeyqJNgQNnXjGIqKcOXx3dpLKjQowl8aMNQHs+jI=;
	b=j/Y3uzqgw89rsMeCNp8qUq+WACwkNfPN1fkO5/rU4cW3em/MLPwRR7ygoywU91lF0GE/Cj
	mFvdKTRW57ytM0AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F06C6136D9;
	Thu,  3 Sep 2026 14:56:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JaR4ObmKmWo6MQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Sep 2026 14:56:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Michal Pecio <michal.pecio@gmail.com>
Subject: [PATCH 0/3] ALSA: usb: Avoid embedded URBs
Date: Thu,  3 Sep 2026 16:56:42 +0200
Message-ID: <20260903145648.1914352-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 369E421D50
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -3.01

As the recent fix for caiaq driver showed, some other USB drivers need
to be fixed for their use of embedded URBs, too.
In this patch series, those are converted to the dynamically allocated
ones via usb_alloc_urb().


Takashi

===

Takashi Iwai (3):
  ALSA: usb: ua101: Avoid embedded URBs
  ALSA: usb: hiface: Avoid embedded URBs
  ALSA: usb: 6fire: Avoid embedded URBs

 sound/usb/6fire/comm.c |  35 +++++++-----
 sound/usb/6fire/comm.h |   2 +-
 sound/usb/6fire/midi.c |  36 ++++++++-----
 sound/usb/6fire/midi.h |   2 +-
 sound/usb/6fire/pcm.c  | 120 +++++++++++++++++++++++------------------
 sound/usb/6fire/pcm.h  |   5 +-
 sound/usb/hiface/pcm.c |  22 ++++----
 sound/usb/misc/ua101.c | 102 ++++++++++++++++++-----------------
 8 files changed, 184 insertions(+), 140 deletions(-)

-- 
2.55.0

