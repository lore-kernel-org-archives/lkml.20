Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463E53DAAC2;
	Thu,  1 Oct 2026 11:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852705; cv=none; b=NQOH6ag0OvqZy4S4r3gM9Q9iecAaqIDumAwsaUQ48iAIunP86kHWK/PzS5KEHR2ApJjHLi2GJqGKQ5vEjLESYyb5JjlGaknjeTX5T8I+/8zad4UPOxIUxDMf62kAPcIZ3OU1jcWonAtMmHzjBytaQtwUiOoLaqDrEzLT27acsKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852705; c=relaxed/simple;
	bh=rK0HPn5cp2dDiduSOYwtyYQ+l97hfG1niLDCy7PnL2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TIXX2h+/kC+ii7a/OUUztXx1k0PTGKGmKd1cVDB7P/gHNrJW6AnTU2Dd2+d5IthDRe/TU1nyYqKBZw4EWruLrrF1224nwjzlQdqf2B5q25KsFNCcwMo6XizNhfn5ANZf4mzuTV8px7W10XTQNJMaRMFiU/N/uTKQfPjPE9tgClw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gCBBohvQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aECSiyZZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z7GrDx1q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eD3xrxre; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gCBBohvQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aECSiyZZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z7GrDx1q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eD3xrxre"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1969521D20;
	Thu,  1 Oct 2026 11:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=t7ftVT9LQBDsfWdvUEJ90oqJ/KFlxuXZQBEzMwhC30k=;
	b=gCBBohvQETmpQYhc5jkVzdRwhLDq6fU5UUu0v2Dnl+1JcSirfNAEQ7l26g8XI4223OV1w8
	sIDeqVBBHGnf6wgGeTH2QkWN5KWyJgVka402zRhh2NstFzlhFsVzABPaRREQ+XFSBo2axD
	+u7/idbPMONFhS5E1pzHv2Zast7SivE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852698;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=t7ftVT9LQBDsfWdvUEJ90oqJ/KFlxuXZQBEzMwhC30k=;
	b=aECSiyZZLQPLrRIqlvaOEzWLs9AwUWw/C2GS/0XOsyej0o18QMh9+V6SI1vFiGzJswExPY
	L2iEtN9f4PIZITDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Z7GrDx1q;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eD3xrxre
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=t7ftVT9LQBDsfWdvUEJ90oqJ/KFlxuXZQBEzMwhC30k=;
	b=Z7GrDx1qcPusIoMLDd8Pq5Me8A6Vz2dEcPQwS4xy1IHNWo++wnSKI6V/OJvHSxpKzy+mtj
	H5O39q3dpKgVdIIbdAnZk/MSHsTLPLi6b/Wcjcyj1hkB0bnTZGQ5W5Mgl15sA4kvmPucG/
	093zA2hpssW9IlPMYVlVsVMqXrOx35Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852694;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=t7ftVT9LQBDsfWdvUEJ90oqJ/KFlxuXZQBEzMwhC30k=;
	b=eD3xrxreE9lFsRZWei/K0T6PDgJOKcJLY3Do9yqUGXxfLvNuARtU+Nr+P1jcIPk4h2YFYo
	Be6q8UeNCkkkoHAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE4C2134B3;
	Thu,  1 Oct 2026 11:04:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 00/32] ALSA: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:03:40 +0200
Message-ID: <20261001110447.486782-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1969521D20
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

here is a series of trivial changes as a cleanup.

So far, many sound drivers use the manual call of
snd_card_free_on_error() helper in order to deal with the errors at
probe time.  This can be gracefully done via auto-cleanup, and here
are the conversions.

Only code refactoring, and no functional changes are expected.


Takashi

===

Takashi Iwai (32):
  ALSA: galaxy: Use auto-cleanup for probe card error handling
  ALSA: sc6000: Use auto-cleanup for probe card error handling
  ALSA: ad1889: Use auto-cleanup for probe card error handling
  ALSA: ali5451: Use auto-cleanup for probe card error handling
  ALSA: als4000: Use auto-cleanup for probe card error handling
  ALSA: atiixp: Use auto-cleanup for probe card error handling
  ALSA: au88x0: Use auto-cleanup for probe card error handling
  ALSA: azt3328: Use auto-cleanup for probe card error handling
  ALSA: bt87x: Use auto-cleanup for probe card error handling
  ALSA: ca0106: Use auto-cleanup for probe card error handling
  ALSA: cs4281: Use auto-cleanup for probe card error handling
  ALSA: cs5535audio: Use auto-cleanup for probe card error handling
  ALSA: echoaudio: Use auto-cleanup for probe card error handling
  ALSA: emu10k1x: Use auto-cleanup for probe card error handling
  ALSA: ens137x: Use auto-cleanup for probe card error handling
  ALSA: es1938: Use auto-cleanup for probe card error handling
  ALSA: es1968: Use auto-cleanup for probe card error handling
  ALSA: fm801: Use auto-cleanup for probe card error handling
  ALSA: ice1724: Use auto-cleanup for probe card error handling
  ALSA: intel8x0: Use auto-cleanup for probe card error handling
  ALSA: lola: Use auto-cleanup for probe card error handling
  ALSA: maestro3: Use auto-cleanup for probe card error handling
  ALSA: oxygen: Use auto-cleanup for probe card error handling
  ALSA: riptide: Use auto-cleanup for probe card error handling
  ALSA: rme32: Use auto-cleanup for probe card error handling
  ALSA: rm96: Use auto-cleanup for probe card error handling
  ALSA: sis7019: Use auto-cleanup for probe card error handling
  ALSA: sonicbibes: Use auto-cleanup for probe card error handling
  ALSA: via82xx: Use auto-cleanup for probe card error handling
  ALSA: ymfpci: Use auto-cleanup for probe card error handling
  ALSA: intel-hdmi-audio: Use auto-cleanup for probe card error handling
  ALSA: Drop unused snd_card_free_on_error()

 include/sound/core.h                |  1 -
 sound/core/init.c                   | 36 ++++++-----------------------
 sound/isa/galaxy/galaxy.c           | 10 +++-----
 sound/isa/sc6000.c                  | 10 +++-----
 sound/pci/ad1889.c                  | 13 ++++-------
 sound/pci/ali5451/ali5451.c         | 13 ++++-------
 sound/pci/als4000.c                 | 13 ++++-------
 sound/pci/atiixp.c                  | 13 ++++-------
 sound/pci/atiixp_modem.c            | 13 ++++-------
 sound/pci/au88x0/au88x0.c           | 11 +++------
 sound/pci/azt3328.c                 | 11 +++------
 sound/pci/bt87x.c                   | 13 ++++-------
 sound/pci/ca0106/ca0106_main.c      | 11 +++------
 sound/pci/cs4281.c                  | 13 ++++-------
 sound/pci/cs5535audio/cs5535audio.c | 13 ++++-------
 sound/pci/echoaudio/echoaudio.c     | 14 ++++-------
 sound/pci/emu10k1/emu10k1x.c        | 13 ++++-------
 sound/pci/ens1370.c                 | 13 ++++-------
 sound/pci/es1938.c                  | 13 ++++-------
 sound/pci/es1968.c                  | 13 ++++-------
 sound/pci/fm801.c                   | 13 ++++-------
 sound/pci/ice1712/ice1724.c         | 13 ++++-------
 sound/pci/intel8x0.c                | 14 ++++-------
 sound/pci/intel8x0m.c               | 13 ++++-------
 sound/pci/lola/lola.c               | 13 ++++-------
 sound/pci/maestro3.c                | 11 +++------
 sound/pci/oxygen/oxygen_lib.c       | 15 +++---------
 sound/pci/riptide/riptide.c         | 11 +++------
 sound/pci/rme32.c                   | 11 +++------
 sound/pci/rme96.c                   | 13 ++++-------
 sound/pci/sis7019.c                 | 13 ++++-------
 sound/pci/sonicvibes.c              | 13 ++++-------
 sound/pci/via82xx.c                 | 13 ++++-------
 sound/pci/via82xx_modem.c           | 13 ++++-------
 sound/pci/ymfpci/ymfpci.c           | 13 ++++-------
 sound/x86/intel_hdmi_audio.c        | 10 +++-----
 36 files changed, 134 insertions(+), 328 deletions(-)

-- 
2.55.0

