Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6663CF047;
	Wed,  7 Oct 2026 17:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393658; cv=none; b=AU8mTmqKPiuArMFlLozyQmWnr9XSMexK8b/d/ZpgHQqCENJ41TJD9sChLljtAZ0awV1atyvKGMRmbRE1CQJPnoyHjLPxpMIyk69WtW8kBdMlC7aT6NCmXssFDKDNbdOf13pP2qp/bjG337r8YMRVjC3DO5i0opz+iAJKL9cVb+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393658; c=relaxed/simple;
	bh=7oM31t3HwopHDhlZZEF9la4w/9oYEmKPMuETEDxShmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rKnV3UG5sJ5sVdEJCFYiQJaRCK/zaB51dHtWpuhkg/eBzJx5m3xF2mlerOTX6+rHokqB3ZYCasQ2WDvlEppEqg2kPqZYdAFTNxoGZS6xH0XOSh6916jLlFYWBVsTwYCTLpL+wBL7uHIADRRkuRKagfs0KPAbwm8k2J1q6zppHqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yazpDFiZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fUyzZRkG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yazpDFiZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fUyzZRkG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yazpDFiZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fUyzZRkG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yazpDFiZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fUyzZRkG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 444971F444;
	Wed,  7 Oct 2026 17:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GYp5WsjRQB9EFfe6K4pZece2pmmgbczQC7CvgAb6oJk=;
	b=yazpDFiZ+JmIGQ926GXk3C+1n6qfHPPtJTaJDxbVn/x8WPb5OdHW1OkXpcL2VerkrM89/T
	8hymBSaXZ25kHzQ5J2Z3zztUE8Q0tGL60gK0dn78GvnMBX5Bz4fk2oTHzkHLa0qYb5ASVY
	8lsLsWZmwleFGiYMLyayz03OYn+w64Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GYp5WsjRQB9EFfe6K4pZece2pmmgbczQC7CvgAb6oJk=;
	b=fUyzZRkGPp57X7W8tfGI7w5yIadfWXYBiFZt0wBhDFqFC4N7rVQj5mx6RcKjFBYM5ZhZSl
	JNTXLGBzd6d4XQCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yazpDFiZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fUyzZRkG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GYp5WsjRQB9EFfe6K4pZece2pmmgbczQC7CvgAb6oJk=;
	b=yazpDFiZ+JmIGQ926GXk3C+1n6qfHPPtJTaJDxbVn/x8WPb5OdHW1OkXpcL2VerkrM89/T
	8hymBSaXZ25kHzQ5J2Z3zztUE8Q0tGL60gK0dn78GvnMBX5Bz4fk2oTHzkHLa0qYb5ASVY
	8lsLsWZmwleFGiYMLyayz03OYn+w64Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GYp5WsjRQB9EFfe6K4pZece2pmmgbczQC7CvgAb6oJk=;
	b=fUyzZRkGPp57X7W8tfGI7w5yIadfWXYBiFZt0wBhDFqFC4N7rVQj5mx6RcKjFBYM5ZhZSl
	JNTXLGBzd6d4XQCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DCF5013354;
	Wed,  7 Oct 2026 17:20:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8rcALXZ/xmp1CgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 17:20:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/8] ALSA: Fix some bugs reported by Sashiko
Date: Wed,  7 Oct 2026 19:20:36 +0200
Message-ID: <20261007172051.13240-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 444971F444

Hi,

here is the revised patch series of the previous fix series.
Now Sashiko reports the existing bugs, I took a look, grabbed a few
critical ones, and here are the fix patches.  About a half are about
core stuff and a few about USB-audio mixers.


Takashi

v1: https://lore.kernel.org/20261006134035.478529-1-tiwai@suse.de
v2: https://lore.kernel.org/20261007093638.1049688-1-tiwai@suse.de

v1->v2: fix mutex() scope in USB mixer mutex in patch 5.
v2->v3: covering selector unit with mutex, destroy the mixer mutex in patch 5
	fix MAX_CHANNELS check in patch 7

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
 sound/hda/common/jack.c        |   9 +-
 sound/usb/mixer.c              | 146 +++++++++++++++++++++++----------
 sound/usb/mixer.h              |   3 +-
 sound/usb/mixer_scarlett.c     |  18 ++--
 sound/usb/mixer_us16x08.c      |  20 ++---
 9 files changed, 143 insertions(+), 83 deletions(-)

-- 
2.55.0

