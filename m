Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52A837FF7A;
	Thu,  3 Sep 2026 16:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451512; cv=none; b=Wni6BKySVmqZRVD1MYE83Jc7LIo6kE4NIBqvAr/LVLZyF7u+y5hjFUHDDVyuHwzOFXcx5U/wJg9mzqyC4xeygnMY/Hukt2X+zzxBnu75BQJVIImcR9T2J/18hk6UUVhbtQdwcEtNVTeFhbqrwWBqJFfYeywTWOuqueV3f7Czcu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451512; c=relaxed/simple;
	bh=ho5zu+RdfP9YEmqju2u+PjrDr3lHNihrfMw2WcCCsJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mYVKCW/8bTqdvqwzCC0fNfvur9iESqnhbxPszyPmoi3XphgV37r+XsznmiA6l3dEQvi6PwGeO34P1FSCjUg5PYTluy7+uE8iYI0sdXZIbYm2QBO5lg3NrTXYCAwtnuGbZXBMwbUz3FfskleQVzY4CCP5cSwTN5W3HDOQOjqqeKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0D1ctgBN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h1/MnrF1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J93ZoTn4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ATjwo5P6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0D1ctgBN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h1/MnrF1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J93ZoTn4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ATjwo5P6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A732B21F8E;
	Thu,  3 Sep 2026 16:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788451504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CPAP/ltmfm9mq9K6mPqjdxTm4fknaXs9KSrE0XfEh8o=;
	b=0D1ctgBNFk9hYrXlSX5SP3OwbF8JCQCfEC75ZLO6AWkWJucdYypD7MNFw8z3ujWiQtjI7G
	+mMwr+WV0g4qo5NklaqMxG6VefIG80SIfQFQJJLWxDxpkBChC2J5KADG7q3C4MSWrYvsbL
	EJxHbo7n7FFP8wULQDPZNPnkBbGQjw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788451504;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CPAP/ltmfm9mq9K6mPqjdxTm4fknaXs9KSrE0XfEh8o=;
	b=h1/MnrF1BzMImeosNHdeBnf/BSRRx8hHoXp+7ZNhB07yVjL46GbV3XhUzgKq/W/TgmnlxK
	Q/2sKbClXOs6gEDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=J93ZoTn4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ATjwo5P6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788451500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CPAP/ltmfm9mq9K6mPqjdxTm4fknaXs9KSrE0XfEh8o=;
	b=J93ZoTn44t3oeGVQ+nsJVNN5beJ+g3pbWXozvirCrVv604Hq83BwF//DIZRbN8X98tA8sH
	dXrebh+l7obqI9vq9LY6kGSJ7oCRBZQXS5TK4xlY98O/lupKnLuHuWomJyv3OtIxSV7GuL
	N+g64fQ96MWH2SSlkyA+9vAHw8btuY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788451500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CPAP/ltmfm9mq9K6mPqjdxTm4fknaXs9KSrE0XfEh8o=;
	b=ATjwo5P6L2ofNtQCeVThVokHK1nQW43G9mUELsTXmxBUW7YSk2hT1mQQhZUNKzc8/1f+lv
	ZEcwy6oKrHCxRUDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6B6AF136D9;
	Thu,  3 Sep 2026 16:05:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HQz4GKyamWo2dQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Sep 2026 16:05:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Michal Pecio <michal.pecio@gmail.com>
Subject: [PATCH v2 0/3] ALSA: usb: Avoid embedded URBs
Date: Thu,  3 Sep 2026 18:04:36 +0200
Message-ID: <20260903160458.1938392-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: A732B21F8E
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO

As the recent fix for caiaq driver showed, some other USB drivers need
to be fixed for their use of embedded URBs, too.

This is a revised patch series to convert those to the dynamically
allocated ones via usb_alloc_urb().


Takashi

===

Takashi Iwai (3):
  ALSA: usb: ua101: Avoid embedded URBs
  ALSA: usb: hiface: Avoid embedded URBs
  ALSA: usb: 6fire: Avoid embedded URBs

 sound/usb/6fire/comm.c |  42 +++++++++-----
 sound/usb/6fire/comm.h |   2 +-
 sound/usb/6fire/midi.c |  43 +++++++++-----
 sound/usb/6fire/midi.h |   2 +-
 sound/usb/6fire/pcm.c  | 128 ++++++++++++++++++++++++-----------------
 sound/usb/6fire/pcm.h  |   5 +-
 sound/usb/hiface/pcm.c |  44 +++++++-------
 sound/usb/misc/ua101.c | 102 ++++++++++++++++----------------
 8 files changed, 213 insertions(+), 155 deletions(-)

-- 
2.55.0

