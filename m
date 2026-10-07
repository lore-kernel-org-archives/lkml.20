Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5999E36DA00;
	Wed,  7 Oct 2026 17:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393156; cv=none; b=Z0BwWqzl7v8Kg1/is62G42IgbS5nH4A+ZbK5h2U/zrkiexDK+HQfVJFHk00oYzN+IxVAO2v+y3g+M4gAtIJ/1IectFfDg+Or1yCoq0pnAM1wnF8QMYHI9rArM3EjCdCFAEJCAgK9HbFyFUeM5g/uiNJYU7a5xzy2PZb0y8+nyIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393156; c=relaxed/simple;
	bh=MHnO5W7TFWiF2MUn9ZhHJQz/EDkvtCZplYQNLrDSHRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iyZwypVmqCDypY0m32nGHNL9Bs5Xox0JqYEAB3NnnozsnHZEheix1ZC2qCbsIsFs+1nURL3YFmp92S45RFf5Nb0roGfv5gR+ysg+yPzbTAAx0541rWi8xlgFu31YKEQ7kHwtxQrkakDve3cYdu/VKIkIFU65LeVQ2LdLRxz53PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Vv4xmZUB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mTF4tZaK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Vv4xmZUB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mTF4tZaK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vv4xmZUB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mTF4tZaK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vv4xmZUB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mTF4tZaK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 823351F455;
	Wed,  7 Oct 2026 17:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393153; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WpdmHUonS6exm30FH0LIZsHBMtZ+9trCWgxu3oinyHg=;
	b=Vv4xmZUBpTkuESvPCoe/w/BjP+vJ8A6CIaoN1ksBibNOYU82vrJItDUTUJ/iJuKHxam0bD
	1JdtG5ysHrRwr3TDDEp3O1D97nl/ZRd19NmpfS4bOYGHSANHnl3ZrrNbv/ouEnsgAhJmuK
	FnZuuFVyHF93Vbg5LhxmAxYixWuvu+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393153;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WpdmHUonS6exm30FH0LIZsHBMtZ+9trCWgxu3oinyHg=;
	b=mTF4tZaKsJ1O6ruDh8aztXN83d3MKfJwqufl61kIvSrMpCUVOvYi3kj31tDMgL6ik0CKBx
	9zFJawmpWzD2coAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393153; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WpdmHUonS6exm30FH0LIZsHBMtZ+9trCWgxu3oinyHg=;
	b=Vv4xmZUBpTkuESvPCoe/w/BjP+vJ8A6CIaoN1ksBibNOYU82vrJItDUTUJ/iJuKHxam0bD
	1JdtG5ysHrRwr3TDDEp3O1D97nl/ZRd19NmpfS4bOYGHSANHnl3ZrrNbv/ouEnsgAhJmuK
	FnZuuFVyHF93Vbg5LhxmAxYixWuvu+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393153;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WpdmHUonS6exm30FH0LIZsHBMtZ+9trCWgxu3oinyHg=;
	b=mTF4tZaKsJ1O6ruDh8aztXN83d3MKfJwqufl61kIvSrMpCUVOvYi3kj31tDMgL6ik0CKBx
	9zFJawmpWzD2coAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 541AA13354;
	Wed,  7 Oct 2026 17:12:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aHkaDIF9xmo/AQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 17:12:33 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda: Avoid non-operational GPU warning at regular device removal
Date: Wed,  7 Oct 2026 19:12:29 +0200
Message-ID: <20261007171231.8147-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

When a hda-intel driver is removed manually and it has a GPU with
switcheroo, it always gives a warning like "GPU sound probed, but not
operational:..." no matter whether GPU has been actually operational
or not.  This warning was originally put for machines that really
suffer from the non-operational GPU HDMI audio, but it's seen at the
common path a normal device removal also goes over.

For avoiding a confusing warning, move the check and the warning at
the error path of azx_probe_continue() that is the point where the
non-functional GPU gets detected and given up.

Fixes: 2b360ba9a493 ("ALSA: hda: intel: Fix Optimus when GPU has no sound")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/controllers/intel.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 24015c73a67f..068fc522658a 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1380,7 +1380,6 @@ static void azx_free(struct azx *chip)
 			 * actually stop the chip) to allow GPU to suspend via
 			 * vga_switcheroo, and print a warning.
 			 */
-			dev_warn(&pci->dev, "GPU sound probed, but not operational: please add a quirk to driver_denylist\n");
 			pm_runtime_disable(&pci->dev);
 			pm_runtime_set_suspended(&pci->dev);
 			pm_runtime_enable(&pci->dev);
@@ -2448,6 +2447,8 @@ static int azx_probe_continue(struct azx *chip)
 out_free:
 	if (err < 0) {
 		pci_set_drvdata(pci, NULL);
+		if (hda->vga_switcheroo_registered)
+			dev_warn(&pci->dev, "GPU sound probed, but not operational: please add a quirk to driver_denylist\n");
 		snd_card_free(chip->card);
 		return err;
 	}
-- 
2.55.0

