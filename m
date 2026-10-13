Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7DC4FDA6F;
	Tue, 13 Oct 2026 12:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893140; cv=none; b=oVvHLK/obGT/C47iOifm3V9sfFW0WGxciHlN3dmH7MEdpDnyvzuXhYkFB/cIF56wzhgOyks7OtpIMJmEuw0Btx2jJsvW2r8GlcK/HOIDjLt5eGjTD0hzp5mCjuwzXmVJ3kBw/4IU3/eLsSMkk7g+E49ml42QX5mEi9YFmYSn4Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893140; c=relaxed/simple;
	bh=Tne7BpBxI6kMvfAFkDYGfWzbeskucMHztVo32OT9KGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KanY4qjzBH5JmAsFGj/2sAn5jL28aoBv1IUGgjfPDv4yuFTxyE76yP7vn8CrFdOfIYDOnrVDbJOG6q+Tj8g4rkHZwWE+RsyhDXGcOCjgteh2Ci6mfVewd8NRjENcdDSlE2+s6IXBJgedEQtDnAAxAXIqAewTsc/ZPxtsK0knBtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vjVA5FIQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AcyQbZ/O; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P++0mhRW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=c3ItBisc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vjVA5FIQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AcyQbZ/O";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P++0mhRW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c3ItBisc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C465421E90;
	Tue, 13 Oct 2026 12:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791893137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hh3B6JhZ6zCtOMAfUG7Lob3y0RyFjH+ORRrFBP6OKwg=;
	b=vjVA5FIQCfyOajX3VHYU5viScKo9qhLh452UXoUyVBGnpIy43lj7XpvBZg7v6eRtJLGdQe
	umqNpXrB+WcnauavJhw1SOlIH+dXLpfwUzVaCMivKv2CaViiMaWaW9HuIr2AI0S9DPVGDA
	QK4wLdR3xZW0ARxd7vigQ5GdZyCCYRk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791893137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hh3B6JhZ6zCtOMAfUG7Lob3y0RyFjH+ORRrFBP6OKwg=;
	b=AcyQbZ/OGHJmLToVOLHYCJSfj4s4gjNI86HebyzREyGwJSdSmtPOYrgVtZM5iDm/2NQezO
	IwSgine5ws8emWDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=P++0mhRW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=c3ItBisc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791893136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hh3B6JhZ6zCtOMAfUG7Lob3y0RyFjH+ORRrFBP6OKwg=;
	b=P++0mhRWaVNLhpH26xcdOdnRbRX+tOhhDorSlmyBMg+jJTl7cRBvW+JiqrPFxrDQm2vV61
	D3+UXQgjsLmbn7F6FkeH/itxnhSkV71ufyeIK8R16srAIQEc25cFD147Egnu6U4o2NAIKz
	upLDMCxs4+7ZfX/BwdHNsMHR14C2gng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791893136;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hh3B6JhZ6zCtOMAfUG7Lob3y0RyFjH+ORRrFBP6OKwg=;
	b=c3ItBiscHS19FmzU7upLFN2F0cVPe+PQH5rBlKKG8VaTWaJaYPbDdtfZnjWCJqZT98+nd6
	9OReLSICN9+tvfCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8802A13341;
	Tue, 13 Oct 2026 12:05:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6Ox+GJAezmrxFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Oct 2026 12:05:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] ALSA: yet more fixes for Sashiko bug reports
Date: Tue, 13 Oct 2026 14:05:21 +0200
Message-ID: <20261013120528.52586-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C465421E90
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01

Hi,

here is yet another series of small fixes for issues reported by
Sashiko.


Takashi

===

Takashi Iwai (4):
  ALSA: jack: Fix kctl free at error in snd_jack_kctl_new()
  ALSA: usb-audio: Use fixed control index for us16x08 mixer elements
  ALSA: pcm: Protect delay DMA sync in forward and rewind, too
  ALSA: line6: Use kzalloc() for PCM buffer allocation

 sound/core/jack.c         |  2 +-
 sound/core/pcm_native.c   | 10 ++++++++++
 sound/usb/line6/pcm.c     |  2 +-
 sound/usb/mixer.c         |  6 ++++--
 sound/usb/mixer.h         |  5 +++--
 sound/usb/mixer_quirks.c  |  2 +-
 sound/usb/mixer_us16x08.c |  3 ++-
 7 files changed, 22 insertions(+), 8 deletions(-)

-- 
2.55.0

