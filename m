Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239F544CAE4;
	Wed,  7 Oct 2026 09:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365824; cv=none; b=t0zqLQNcfLZX3ZDuzzp3qxKvZLoyTdIDqnnfQ/ClaWjKzlxXyGG6odF6PiUIPRagfeqwC5o1SS8pltGGVCg8urWL9pyqP0nyf5M7xxz1xs9Bi2tKbbRN0pUnNGp08ZyLA/A009yoaeV97bWmohOkW43z+9dHXmoc3n3dzc2DDfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365824; c=relaxed/simple;
	bh=qPjLp5938AwifVmCmCeri7/S/c0IYj8XDlWzL8RKi/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gsMLbjrFNBs53DJfHXn1lcdhefA6+dC9taVdFBtRBKQg7Y2HisbIJpLXiTCQT9llEs9Lzd4iGha0J7bv9lej+c2LA48s3skNDRnIVOiPYWFcC2IBNqIHs0pFSAo59SOfik/TqUhEqfYxtrGu1BpzkoM4pIGhooRsbiWZf1w7G+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wqmu6SRQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=em2jFnQn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wqmu6SRQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=em2jFnQn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wqmu6SRQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="em2jFnQn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wqmu6SRQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="em2jFnQn"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 40BB321F78;
	Wed,  7 Oct 2026 09:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791365801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GfO5qB3bvDrHn7YuWNa8R2LH1IGW1j670o0djnTr7Jw=;
	b=wqmu6SRQI4qsEE9T25tj0Q7kt9t7oEnjhi/ickWr+F74342Db4DEH38Cr0r+yA69NQ8StJ
	D9p/ty8muhBbYPz0wFbGDwOwoshl3LtnTetANP+ogx68vPvfCBl2rkhXHokfWi/OpyQWsL
	OgKr8U3g2cvAoLSNEQcmL6+m+7VN9TA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791365801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GfO5qB3bvDrHn7YuWNa8R2LH1IGW1j670o0djnTr7Jw=;
	b=em2jFnQnoSjcvch3TBbPUw0JCiYUgp/aULDP1D6vtpG6UZEUAWmoN5ig6LZSLvYT5bgEQn
	dsz2G5t84T3nlYDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791365801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GfO5qB3bvDrHn7YuWNa8R2LH1IGW1j670o0djnTr7Jw=;
	b=wqmu6SRQI4qsEE9T25tj0Q7kt9t7oEnjhi/ickWr+F74342Db4DEH38Cr0r+yA69NQ8StJ
	D9p/ty8muhBbYPz0wFbGDwOwoshl3LtnTetANP+ogx68vPvfCBl2rkhXHokfWi/OpyQWsL
	OgKr8U3g2cvAoLSNEQcmL6+m+7VN9TA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791365801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GfO5qB3bvDrHn7YuWNa8R2LH1IGW1j670o0djnTr7Jw=;
	b=em2jFnQnoSjcvch3TBbPUw0JCiYUgp/aULDP1D6vtpG6UZEUAWmoN5ig6LZSLvYT5bgEQn
	dsz2G5t84T3nlYDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D581713B95;
	Wed,  7 Oct 2026 09:36:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9oTPLKgSxmpMDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 09:36:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] ALSA: Fix some bugs reported by Sashiko
Date: Wed,  7 Oct 2026 11:36:27 +0200
Message-ID: <20261007093638.1049688-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Level: 

Hi,

here is the revised patch series of the previous fix series.
Now Sashiko reports the existing bugs, I took a look, grabbed a few
critical ones, and here are the fix patches.  About a half are about
core stuff and a few about USB-audio mixers.


Takashi

v1: https://lore.kernel.org/20261006134035.478529-1-tiwai@suse.de

v1->v2: fix mutex() scope in USB mixer mutex in patch 5.

===

Takashi Iwai (8):
  ALSA: seq: Drop the bogus RCU guard from clientptr()
  ALSA: pcm: Fix TOCTOU state overwrite in snd_pcm_drop()
  ALSA: hda: Fix potential UAF for gating jack
  ALSA: usb-audio: Fix invalid UAC2/3 mixer unit matrix evaluation
  ALSA: usb-audio: Fix data race at mixer_ctl_feature_info()
  ALSA: pcmtest: Fix a bogus pointer read in snd_pcmtst_pcm_pointer()
  ALSA: usb-audio: Fix mixer bitmap cache over 32 channels
  ALSA: core: Add missing barriers for power_ref vs card->shutdown

 sound/core/init.c              |   4 +
 sound/core/pcm_native.c        |   2 +-
 sound/core/seq/seq_clientmgr.c |  21 ++---
 sound/drivers/pcmtest.c        |   3 +-
 sound/hda/common/jack.c        |   9 ++-
 sound/usb/mixer.c              | 141 +++++++++++++++++++++++----------
 sound/usb/mixer.h              |   3 +-
 sound/usb/mixer_scarlett.c     |  18 ++---
 sound/usb/mixer_us16x08.c      |  20 ++---
 9 files changed, 139 insertions(+), 82 deletions(-)

-- 
2.55.0

