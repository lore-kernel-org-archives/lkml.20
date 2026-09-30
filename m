Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA484ED1B1;
	Wed, 30 Sep 2026 13:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774687; cv=none; b=Ebv3+7VJU5QokaHQ5cWPABRpWiYbihJuyZEmvHn/qMF7nvwsUhU1pTDiivi2z5al0oxsBJDEcUFqi2kq8FDCgFkxSqaFyYGUCI2nut1fj0hVIzPfV+Wfk4Ek4AxWQQ5dca2BTom06oHBB4rueKyvtYDKZQ+/kQ33rnnLhpWxshs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774687; c=relaxed/simple;
	bh=chtTytvquHevvTjCMQEVy8eyin/dJ76voTEv/FR4ADw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZVaJv0PJdE3RngNymn1aOMYvnkIpK+sTO+tfek06J0l5gObn9oFzAOrwkvRSm4bNOHLNjMwoSY2OBgaYf47AW7ejgKUj/IcAY6oz6lF3FGBm9yDUdtBQZuXTej+AKsVTlWEIHqchogAp0UVPKhlzwnDScjsod+xCwCpfr4zG0Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hcjLkX8/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w1j7vZwL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Lk11xa11; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=77ACc6Y+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hcjLkX8/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w1j7vZwL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Lk11xa11";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="77ACc6Y+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 70A2321E59;
	Wed, 30 Sep 2026 13:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790774670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uCdceDfFaFP+RqEbZDLiDg6rwRlvFyb+Z4PDfQmcUgk=;
	b=hcjLkX8/XkB90Za23fxh6Ji7md0mTaXi7NDmhBNy1XgcUSJv647Ju4TFn1V5bmaIq7HrrV
	nSQGWKhF+CFCzQvJoA69Mu2icgW8jT+sAVsKWxQSeMdrLyBxlofeJltv58JXiVgisZilkL
	boOWtoY8klarqEBtY9qwnsZp1wQMi4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790774670;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uCdceDfFaFP+RqEbZDLiDg6rwRlvFyb+Z4PDfQmcUgk=;
	b=w1j7vZwLB7FT5R3tfjI04vj8OVG4vjD+VeBwejRFr74wMxw32KRwuh5RuWWdHxKUlYH5yf
	CQoqDo817pG6vwCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790774666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uCdceDfFaFP+RqEbZDLiDg6rwRlvFyb+Z4PDfQmcUgk=;
	b=Lk11xa11VdqTbFt9M8zbL0ky+cr4q4GdDAA4SuJKulLszQBfgv/sBB0hEYb7ltOCwYd5Ih
	CfpL8P46QznbrZY1af9Wy6R1oLTOfo3KeNJtx9MONOQwHkPWzh+lxngy5wJpwRz+pYZ5qh
	av0zoKwWWJLsngvm05XIvilI3tC3ZRc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790774666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uCdceDfFaFP+RqEbZDLiDg6rwRlvFyb+Z4PDfQmcUgk=;
	b=77ACc6Y+eS3+kHOUl6l6VkzLG8s8J8LcFladwWx+FJAblqIBbqJsI22YTzKSasEfPCpUPG
	qUilh/vmECCy39BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2DE8613AB8;
	Wed, 30 Sep 2026 13:24:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IluyAYoNvWr8MQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 30 Sep 2026 13:24:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Zipdox <zipdox@zipdox.net>
Subject: [PATCH v2 0/3] ALSA: usb-audio: fix for UAC2 mixer unit handling
Date: Wed, 30 Sep 2026 15:24:03 +0200
Message-ID: <20260930132419.297102-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
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

v1: https://lore.kernel.org/20260929121558.1464094-1-tiwai@suse.de
v1->v2: addressed a few issues spotted by sashiko

===

Takashi Iwai (3):
  ALSA: usb-audio: Check mixer matrix size for UAC2/3 at parsing
  ALSA: usb-audio: Fix UAC2 mixer unit request handling
  ALSA: usb-audio: Optimize min/max/res parse for UAC2

 sound/usb/mixer.c | 241 +++++++++++++++++++++++++++++-----------------
 sound/usb/mixer.h |   2 +
 2 files changed, 152 insertions(+), 91 deletions(-)

-- 
2.55.0

