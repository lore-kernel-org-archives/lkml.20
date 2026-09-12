Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DEF4BEE32;
	Sat, 12 Sep 2026 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217406; cv=none; b=uQLAYSPMXFrWeLC62Qmn3+4Y11lEr4WhRjITzocnYWwMmIAG6hdBML3ANYA36tIJT9M4Q/vkU0WRIosZE9QJiPYZuQl5hEcXtkk+qBgMZY3xQ57gvUra6HvrUS3sKV3cofB14Bpb8h9GVpWJDifjPxPgsM4Gd/rk99qoWp8vm8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217406; c=relaxed/simple;
	bh=q3T0G97yfWMmccxv2HnzusgWav3z706LG/8Zd0v7pmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q9WkFnHAtlIpuMg5+0G4BPgUN302U0F8qmP9WgoOWo9XZccjQDqDHJExfpacxgxXZCaZ7SsxBqSInB+e8FOKHQiHQv2O2YzMViHFbrvJgIIj8calSgDXXFl+U92ISz/d+UthSwPOx7fhohpW9TW9+5j2YYCTmNKY4nIMVLlnYQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YB7+xOK5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EhmrQHrw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sQbbmrRh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yi9LkzB9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YB7+xOK5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EhmrQHrw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sQbbmrRh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yi9LkzB9"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A8C231F38E;
	Sat, 12 Sep 2026 12:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789217398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WOsmQv99DvjdBTfIEwio9sIJd/aTiSVGfXFN3OZs0jQ=;
	b=YB7+xOK5jQs/oDmHLR9Gw5ujEA3pM1DPoHbZegUTkPrjTWcHooJrK/F1HAIHFsprmxYZNB
	G27x8mXLsQTczI+hui2nVBa6MmMxJuXkULmv6hExiVbmvF8PlOXFXyDLZauG0siG4ePBWN
	qWdbMXIluKCMfV+8MujT1dXiL4A6Iy8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789217398;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WOsmQv99DvjdBTfIEwio9sIJd/aTiSVGfXFN3OZs0jQ=;
	b=EhmrQHrw8Pe4XiEjZIswPVte5im19IDrJyCvT1p6bIPQAeTg2zoRYT/6oLvOho4Jd6cCQS
	TYpk82sdiMOvn/Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789217394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WOsmQv99DvjdBTfIEwio9sIJd/aTiSVGfXFN3OZs0jQ=;
	b=sQbbmrRhvrvfEB8JSFjs/XxlSPoddfyRpTOuCSy5WtdGWkbQCpHGy2r7POQtu4hHypauxO
	PSiyuKYzA50ufzG6CcOZNpTXV/pT9b7MBwxHBAx/8+EAr+bOMwrOvCtV8ZAYVt3XtV94rD
	oqgg0OpE1tfuAow/6PrAB4p1emQJ9Jk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789217394;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WOsmQv99DvjdBTfIEwio9sIJd/aTiSVGfXFN3OZs0jQ=;
	b=yi9LkzB9YAxhy9pMVneWwH89LSulu7nCHtK5SiyfZPddy5f/dx5aq7DIubHYbBsNSEEm0s
	elWpc/xyQ/Xv9IBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6673B13687;
	Sat, 12 Sep 2026 12:49:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AHlFF3JKpWqTGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 12 Sep 2026 12:49:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v2] ALSA: seq: Mark OSS sequencer emulation as deprecated
Date: Sat, 12 Sep 2026 14:49:45 +0200
Message-ID: <20260912124951.416761-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -2.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

OSS sequencer API emulation has been implemented as a client of ALSA
sequencer, decades ago, at the time where OSS was still use.  But the
API itself became very niche, and almost noone using it for a real
purpose any longer -- only exceptions are AI and fuzzers, who have
been causing significant maintenance burden for issues they hit &
found.

Meanwhile, the most features of OSS sequencer API emulation can be
achieved in user-space, either by ALSA-OSS layer (aoss) or oss-seq-emu
program:
  https://github.com/alsa-project/alsa-oss
  https://github.com/tiwai/oss-seq-emu
where the former is LD_PRELOAD wrapper and the latter is a CUSE-based
daemon.  So we can drop the stuff from the kernel sooner or later.

Now, let's mark the OSS sequencer emulation as deprecated and give a
warning when loaded, so that we can drop it later actually.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: put the warning for snd-seq-oss at the right place

 sound/core/seq/Kconfig       | 7 +++++--
 sound/core/seq/oss/seq_oss.c | 3 +++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/core/seq/Kconfig b/sound/core/seq/Kconfig
index e4f58cb985d4..0d606159103e 100644
--- a/sound/core/seq/Kconfig
+++ b/sound/core/seq/Kconfig
@@ -27,14 +27,17 @@ config SND_SEQ_DUMMY
 	  will be called snd-seq-dummy.
 
 config SND_SEQUENCER_OSS
-	tristate "OSS Sequencer API"
+	tristate "OSS Sequencer API (deprecated)"
 	depends on SND_OSSEMUL
 	select SND_SEQ_MIDI_EVENT
 	help
 	  Say Y here to enable OSS sequencer emulation (both
 	  /dev/sequencer and /dev/music interfaces).
 
-	  Many programs still use the OSS API, so say Y.
+	  The OSS sequencer API is almost nowhere used, hence this option will
+	  be dropped soon.
+	  Use user-space wrapper (alsa-oss) or CUSE daemon (oss-seq-emu)
+	  instead of the kernel-side emulation.
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-seq-oss.
diff --git a/sound/core/seq/oss/seq_oss.c b/sound/core/seq/oss/seq_oss.c
index 2835576040ed..64a7e62029cc 100644
--- a/sound/core/seq/oss/seq_oss.c
+++ b/sound/core/seq/oss/seq_oss.c
@@ -67,6 +67,9 @@ static int __init alsa_seq_oss_init(void)
 {
 	int rc;
 
+	pr_warn("seq-oss: kernel OSS sequencer emulation is deprecated\n");
+	pr_warn("seq-oss: Use user-space solution (alsa-oss or oss-seq-emu) instead.\n");
+
 	rc = register_device();
 	if (rc < 0)
 		goto error;
-- 
2.55.0

