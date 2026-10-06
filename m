Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDBF456E11;
	Tue,  6 Oct 2026 13:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294051; cv=none; b=ik+9ANeYQUBmwDea+K4ec8ia6Xy7qrW6a65eVw3KrcHNEphaCC4S2tqNnqr50g15JEjVhenn7DC4r1im1VW1sx6Aira6E9JVICiErZfSLxHIjKd0ifFBHnX6qJNVTOoWp29TssN7YuNuU1E7EUKGRUp271+pS1aECpDEESkXnY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294051; c=relaxed/simple;
	bh=FlXQU8AdRw4F5Zni787q91/Dz8Vz3IueQSF+yQNTN8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UqiK2lX2OSwzX/Axkdu//waDuGWKAqbcOGCEgVKVuXsDyVNmFe9Gw1mPf+x2Di89rKoRepyUPBHyZREuQmsMMS38Yxo4yN4fiIR05aLWQ8hnwwOzdy92fJms7Z47CZSbbE8jVH6LRBAI6Vly6yOh4iTEWdFRjJ4o82tCeQ2B2MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZkZA9uZl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7kMpW3Op; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GD0WZs3Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MmMhEuWP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZkZA9uZl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7kMpW3Op";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GD0WZs3Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MmMhEuWP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5CB951FB08;
	Tue,  6 Oct 2026 13:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791294043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5kkL7rGD1lfrJV2Q6SexzszHUwfC44V7MT+s8rYk+Dw=;
	b=ZkZA9uZlYlB1MVNARN+RAirvJeL/PTn+JvLq7EEj1NFj3YpAlSP3wruoOBK7t7xH/xO6Lj
	AUnzQIBJD2Qp9ogYTt4qkmTC71dHcl/DByQLN1DxCthoYRp1h206ZpOUoV3Ut1Mgi7svBt
	GaO3l0bZZteVK7afSzTmSFyxPQ7woNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791294043;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5kkL7rGD1lfrJV2Q6SexzszHUwfC44V7MT+s8rYk+Dw=;
	b=7kMpW3Op5m03NjTWg0TEwWhgqYlVv3hAj52F0rY4+vU+sd/UDRxWzTToTNG9PySJiOIXmO
	WBzbd6KrFzOBeRAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GD0WZs3Y;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MmMhEuWP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791294039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5kkL7rGD1lfrJV2Q6SexzszHUwfC44V7MT+s8rYk+Dw=;
	b=GD0WZs3Yl/Z1d2XSy05WTRvPkG1IJ2CEvxsywokPDs/VNJNoDTkIkeVYyqRCHAUIv2qLiR
	j02sJG4WQOZvgFeJptZeMZtkgOmbVje4dvKnQqe3b09iehqkbvyCU0TCXJJcLG3vy3mlr2
	thYTef2otp6UgUFHiVL2+1XqUMS4YZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791294039;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5kkL7rGD1lfrJV2Q6SexzszHUwfC44V7MT+s8rYk+Dw=;
	b=MmMhEuWPtQwpenCI+5o/+qB90uJswYzmIYkFerV5xs+bGP7rNiSR9ZrH2+qwyar8mRTP1r
	RLxnbV0XVIjHwtDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2AF191368D;
	Tue,  6 Oct 2026 13:40:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1eVrAVf6xGq1cAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 06 Oct 2026 13:40:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] ALSA: Fix some bugs reported by Sashiko
Date: Tue,  6 Oct 2026 15:40:24 +0200
Message-ID: <20261006134035.478529-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 5CB951FB08
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Hi,

now Sashiko reports the existing bugs, I took a look, grabbed a few
critical ones, and ere are the fix patches.  About a half are about
core stuff and a few about USB-audio mixers.


Takashi

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

