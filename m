Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED24A4AA59A;
	Thu, 10 Sep 2026 16:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056255; cv=none; b=HH64LeTKBouGOp1ZF/wJXuvhB5Kv9SGf9h+/se2fWGTiX/qUmj8YF3qYlx4PRIEAjkeitD3fzSXfBD4h07Oqf2UFHhLogn3SyEIm2mvZGaf4CpDvgiVQpQara+1EWEMI0tNfTdYyZfE1ZOmcriFqtQggwjF3ZVnCc/eiUK0q7PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056255; c=relaxed/simple;
	bh=hvwHEn+OY+kwt2Q94KsBGyqqIKDochX9fFYYiT/f8Uo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QeVcbSXoWBleXuk2L1xS1YiNym3Ju2rtutzBbNwNBQ8eApVCXEY5+/pskwEzFY1asUkchBA07pxKPMQBhOrhdxoXDEPfFXeKZf4jIHUTp6942i43fnus9bfQ8zmEP6biFqLwLAitpPuPYKyvffXlgqYttR2SKJf81epxhdFcEAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1o8F+Ldq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Lc3V4Y1C; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vPhv+2RL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+aEZktps; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1o8F+Ldq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Lc3V4Y1C";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vPhv+2RL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+aEZktps"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 93F7821DA0;
	Thu, 10 Sep 2026 16:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789056247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Jek4u/b1NROOW0fTW/+bkdtRH3NZvPRzw+fEHbLnIF8=;
	b=1o8F+LdqHsIZhFJZff0tVEEDciXjT+aCRT4UGq4JSswUHuPHVxQyccBuST0NetddpMoKTg
	qz5ub+WDn+xcmJKvWvJWCVjqnZFGmgLkk6KYjsCKzir02yuKdeJrPrlAkNcBaNY2CneJNp
	Htolzhv5HI3Tk2NrOS0m/YB7VRBfUDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789056247;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Jek4u/b1NROOW0fTW/+bkdtRH3NZvPRzw+fEHbLnIF8=;
	b=Lc3V4Y1Cam5cIXcF5YifGTw8sPJT6joVINwspODtD4TfgMokmeZN4pnJteO6GLPl0UXtwy
	KnoI55WF7aUIYyCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789056243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Jek4u/b1NROOW0fTW/+bkdtRH3NZvPRzw+fEHbLnIF8=;
	b=vPhv+2RLTK9z6Z9fht7FQ21x6RjIoy7DsW4sbjHVr+15Gjd6kc4ejJpvrHhr3k6nfc8/tL
	UN6DURKNEa9bjwykfqRNJ1a7tHh3ah1DRYHAYD3FEwDQ+Rc5NDYvim4A9Almvs/SSYUWMm
	vc8bDm/cVp8tR6Rnw1LG0ChNkmCm8Sk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789056243;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Jek4u/b1NROOW0fTW/+bkdtRH3NZvPRzw+fEHbLnIF8=;
	b=+aEZktpsEiOgHPm+OIm4xYEhtFMn8Kcz2nEd9GS8Aulce1UcjfNA8iQz3GTUWxzdpDnKyx
	dWQFe09DCR1AKRDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32317137FD;
	Thu, 10 Sep 2026 16:04:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dyzuCvPUomqVNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Sep 2026 16:04:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [RFC PATCH] ALSA: seq: Mark OSS sequencer emulation as deprecated
Date: Thu, 10 Sep 2026 18:03:46 +0200
Message-ID: <20260910160354.1001364-1-tiwai@suse.de>
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
index 2835576040ed..803bddd209e1 100644
--- a/sound/core/seq/oss/seq_oss.c
+++ b/sound/core/seq/oss/seq_oss.c
@@ -276,6 +276,9 @@ register_proc(void)
 {
 	struct snd_info_entry *entry;
 
+	pr_warn("seq-oss: kernel OSS sequencer emulation is deprecated\n");
+	pr_warn("seq-oss: Use user-space solution (alsa-oss or oss-seq-emu) instead.\n");
+
 	entry = snd_info_create_module_entry(THIS_MODULE, SNDRV_SEQ_OSS_PROCNAME, snd_seq_root);
 	if (entry == NULL)
 		return -ENOMEM;
-- 
2.55.0

