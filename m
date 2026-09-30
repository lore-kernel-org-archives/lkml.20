Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7287D50C29B;
	Wed, 30 Sep 2026 15:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783656; cv=none; b=SVNSDwe0UJbyj9X6tEeibgjx59r3cS5TdLs121+8epLGjzqAmuh9YHdcw2h8KiP07oshQA/qD5bDnU/QIKFt+A3uftqI2OuoSp27TvNQ0xqVcIyqHsczzAsU6XuUQP6bAIy0VrruKSW5COXS78XMWJ4uMByGUrElJLHYr35rZxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783656; c=relaxed/simple;
	bh=aDJfcJJUiqAQIRz6lkBTQfkQHjMxAdwVjpRnP1kQ4Fk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u9n9O3X+zCMpBJhsQYiByDGTJBfijTFjJoc3IYneTTwnK7gQ3MFyeft1u3XG/QvNA29NH3AatPcCaThtfrCHEM/rIp586IfI3wNiFEfp/MMzaJ2eVYnWG3MpUVZ+ZvDzANwEbS1tEHG0J4uvclJYBSYclFrKoiTd+V6kYUIUSYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rIcUf5gG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4dFGaGOu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qsYN7Yfk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f+91/+/3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rIcUf5gG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4dFGaGOu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qsYN7Yfk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f+91/+/3"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EE2C31F8D5;
	Wed, 30 Sep 2026 15:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790783643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nGFhL//yENYXyDWrwbAoybQaKO9RsHEeoRgqeea+6+Y=;
	b=rIcUf5gGRwr9YQSpU13xWKVI1uC3pauHz8D0IU85fD+z30s+0c5kX3N0DY+QR9lwc3h00Q
	uTKREcjd9f4rUvqOSVfLDPODszLRot1E1RVmY3ARfEl8tBoIC8Jwe/cI+ggWsAEM7xF/JR
	iA2P/SaFbq26ojYF9RVmWP79F5pcm0Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790783643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nGFhL//yENYXyDWrwbAoybQaKO9RsHEeoRgqeea+6+Y=;
	b=4dFGaGOubowMjwPzQBMBNzpGNKIIjbFkHRdBQ7tbMzF6VNdpp96iMDV1Ga8tERYHcveJRc
	Kq54Cjy6V4kQLFDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qsYN7Yfk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="f+91/+/3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790783639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nGFhL//yENYXyDWrwbAoybQaKO9RsHEeoRgqeea+6+Y=;
	b=qsYN7YfkLmAT0DjKoxS3OfoXhMgfFx8+y3t6UIO3uKC+kre6xxamxaDzs3XYJOUHZiSzsn
	UhMCTELvWhFym9a2Qui2bDDdwZEaSTSEbTfzM+tbhoSwnLSXXrXx9E4qce3RnG8nKJOtZF
	/ljt/fv4kFWHO8P8OZtLXFizupO7JsM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790783639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nGFhL//yENYXyDWrwbAoybQaKO9RsHEeoRgqeea+6+Y=;
	b=f+91/+/3o9dhG9hz/MrShn1sdtPfWWFeNY/QMU+qNHA0ZTlBNkDdIJ7SS9IU6v+vHOKBQ6
	PsR46Rp6XAwneNCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8375F13722;
	Wed, 30 Sep 2026 15:53:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C85QFZYwvWqkVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 30 Sep 2026 15:53:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] ALSA: usb-audio: fix for UAC2 mixer unit handling
Date: Wed, 30 Sep 2026 17:53:49 +0200
Message-ID: <20260930155356.348608-1-tiwai@suse.de>
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
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: EE2C31F8D5
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Hi,

here is a revised series of patches to address a long-standing issue
about handling of UAC2/3 mixer unit.  We have some translation between
UAC1 and UAC2/3 feature and mixer units, but the latter is handled
incorrectly with a bogus wIndex.  Also, the current code tries to
retrieve the information by multiple calls even though UAC2/3 can
already give in a shot.  So there is an optimization for that in the
last patch, too.

Link: https://lore.kernel.org/d46fcac6-bd7e-4fc4-95e1-4e8d39f92ad3@zipdox.net


Takashi

v1: https://lore.kernel.org/20260929121558.1464094-1-tiwai@suse.de
v2: https://lore.kernel.org/20260930132419.297102-1-tiwai@suse.de

===

Takashi Iwai (3):
  ALSA: usb-audio: Check mixer matrix size for UAC2/3 at parsing
  ALSA: usb-audio: Fix UAC2 mixer unit request handling
  ALSA: usb-audio: Optimize min/max/res parse for UAC2

 sound/usb/mixer.c | 244 +++++++++++++++++++++++++++++-----------------
 sound/usb/mixer.h |   2 +
 2 files changed, 154 insertions(+), 92 deletions(-)

-- 
2.55.0

