Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D108142E42B;
	Wed,  7 Oct 2026 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366181; cv=none; b=meaEL9/YuPwhbroJXusCeeA9W5BYprKoZ8XrrXqG0YGo+jS4Lgp9dhVdmrNTLkz7UpOj9AuXzagMAx6u3tJ7DKznCMRwdUQ4JGrW5uJp0tKMVtjwCVr5W+vYr6dRhyULruqRxzRbEiiLfmhDQ70S+gK/rKaoc0jGtCI2Wb/MKJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366181; c=relaxed/simple;
	bh=hVPUD6aJHHscT4NKl8KK/rHUFgbnzxt4gmsfQTasopk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZZSb81aaa7433oaukx/+ZSEseic68RNvY0nqhoP4/GZCnKLQ5yFP6KpE9YmH+SkEuHnda25N+xvcxQGBsr/CYjUaIldxyYYCdrgNNKc5CeXZ5NAzAHQwgpgi9KhKipIQCIws2qp+Z9cTqg6rLiaMJNjratHDtNhg33x2gZ2VC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hafbunw/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PbZIAI2B; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hafbunw/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PbZIAI2B; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hafbunw/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PbZIAI2B";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hafbunw/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PbZIAI2B"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E5D7621FDB;
	Wed,  7 Oct 2026 09:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791366165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9aUvmySQag4wouaC0PQI7x0ZCP7VDgh93id5NPqUmJE=;
	b=hafbunw/PmI7ic6UpZ6IuAZaguZ/Vq7YfMFFKp0tV7GHBq4Gw5wOaRmY0pvrLNSuG33j/o
	TXdoWG7YE0C1o5b+d0030cu0V5TVTdsrW0DEcgFIcmw5eAY4KWpIqAtNjGcwE/xgIMIhBi
	ITqR2nj931bcKS2soDc1a9ehniUjCZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791366165;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9aUvmySQag4wouaC0PQI7x0ZCP7VDgh93id5NPqUmJE=;
	b=PbZIAI2Be4+6/WATjZXUyInGzrPCqeY51Seiu5FDwMsBA9kYDQqjc1HFlao1qxWuXJ/+qH
	XLAxent1rZ8c/wAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="hafbunw/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PbZIAI2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791366165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9aUvmySQag4wouaC0PQI7x0ZCP7VDgh93id5NPqUmJE=;
	b=hafbunw/PmI7ic6UpZ6IuAZaguZ/Vq7YfMFFKp0tV7GHBq4Gw5wOaRmY0pvrLNSuG33j/o
	TXdoWG7YE0C1o5b+d0030cu0V5TVTdsrW0DEcgFIcmw5eAY4KWpIqAtNjGcwE/xgIMIhBi
	ITqR2nj931bcKS2soDc1a9ehniUjCZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791366165;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9aUvmySQag4wouaC0PQI7x0ZCP7VDgh93id5NPqUmJE=;
	b=PbZIAI2Be4+6/WATjZXUyInGzrPCqeY51Seiu5FDwMsBA9kYDQqjc1HFlao1qxWuXJ/+qH
	XLAxent1rZ8c/wAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD52A13B9B;
	Wed,  7 Oct 2026 09:42:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AS17ChUUxmp0FQAAD6G6ig:T8
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 09:42:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] ALSA: seq: Don't lose partial read failure
Date: Wed,  7 Oct 2026 11:42:31 +0200
Message-ID: <20261007094234.1051316-8-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007094234.1051316-1-tiwai@suse.de>
References: <20261007094234.1051316-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E5D7621FDB
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Level: 

snd_seq_read() returns an error even if one or more events have been
successfully read before the error (except for -EAGAIN case), but this
rather doesn't follow the POSIX standard that wants the processed
bytes.  Change the behavior to return the processed bytes when it's
positive, instead.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index ba5619d0b0b0..0711a9e23b5f 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -480,11 +480,11 @@ static ssize_t snd_seq_read(struct file *file, char __user *buf, size_t count,
 	if (err < 0) {
 		if (cell)
 			snd_seq_fifo_cell_putback(fifo, cell);
-		if (err == -EAGAIN && result > 0)
-			err = 0;
 	}
 
-	return (err < 0) ? err : result;
+	if (result > 0)
+		return result;
+	return err < 0 ? err : 0;
 }
 
 
-- 
2.55.0

