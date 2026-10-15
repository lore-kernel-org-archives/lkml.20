Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2446C496D4C;
	Thu, 15 Oct 2026 11:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792063384; cv=none; b=OEtO4cDPsTtdNkEVCLORFVZRtWBKy6DewGc0DgUdsAWF3kvRlikJya1ZpHjxnt+DtCTecQCwDzQ7N6NuZkn1bDU9kfhAdSc4VxkYKkHs8XVXJzd/7QgRirthXGAAueCg8LP0Brg/sRvfMaq9ESiNyJifv+6xHYyhb6EaqkjRJ8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792063384; c=relaxed/simple;
	bh=AZ/P7eWYM2XgxubfOQXat5xhCbvsmcrymhIherAUJ3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gO+9XLvEzfXLR1+4Ix8rBnC+ajpIf9PB5Dp/67w7yFYHApU8oC4DMpmwoGEkJB46MHXrqIvzpgEV15VF838YxjE2LWqk8LdnKU9BORhPW0yJ+VnaXAn5MLh0jl7eXG6QsKCR2Y7nmtRE6fwz4ADY1CvrNdZW56DMuLa2fP9NlOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cHKIboG9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LULk9oze; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C2cIP8F9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JOkECapC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cHKIboG9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LULk9oze";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C2cIP8F9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JOkECapC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E599122373;
	Thu, 15 Oct 2026 11:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792063381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cdfSGqvu2Zeh+2ZegbL7lrMbjR59Xsctd/M0aTAEWWs=;
	b=cHKIboG9U79pAa9fkqoRU9wArYfyDMJx8dNlzwoSQfSo4BSnSqQnd8GYKtYCnq2h7MgDb6
	aRrxFzXV1d+PMtGMIMVQxpd6NjvU6fYgz/jbHeExR050kz4i7tiy+k9gK43tsYdff2vGCq
	fvDr2X8bnHu2nTQh9yuO6zREEcdBfPc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792063381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cdfSGqvu2Zeh+2ZegbL7lrMbjR59Xsctd/M0aTAEWWs=;
	b=LULk9ozeVOUDGGnFAg78P47CulgFdxvi9fr9ZS+i3hOFWYgRwEyXSaY0PZLn0U08ha7TQw
	qKyqoi3SrJF2fHAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=C2cIP8F9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JOkECapC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792063379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cdfSGqvu2Zeh+2ZegbL7lrMbjR59Xsctd/M0aTAEWWs=;
	b=C2cIP8F9gxBKk5fbdSmz8IFbG1+Izvh3SzRpbfRp0/MWxwNXnCF9sTY7T9t25u1Dl7DsD/
	p8ufXWdB9LKYFdVQW3mKAfVbExtV/VJ+bEdjwov3FBwKqH8Wm3db7GVkB3UOHj/6jr9urK
	R1B3rwEm5uDPIXwCpllZcE2j6vddm70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792063379;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cdfSGqvu2Zeh+2ZegbL7lrMbjR59Xsctd/M0aTAEWWs=;
	b=JOkECapCnW+ZCv2RWGwNV5iwCQJdbhqAnMOQBqQgMrW7Bg4AdHZL6It4KGSmOWbMdVzx/Z
	ErZipT6SN8ovy3Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 79E2F132C9;
	Thu, 15 Oct 2026 11:22:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ub/sB5O30GqVSwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 Oct 2026 11:22:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: core: Serialize snd_refcount put and sync
Date: Thu, 15 Oct 2026 13:22:41 +0200
Message-ID: <20261015112256.3902-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E599122373
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,sashiko.dev:url];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01

When a thread tries to sync-and-destroy the resource with
snd_refcount_sync(), it might lead to a UAF in a very slight time
window.  Namely, snd_refount_put() calls wake_up() after
atomic_dec_and_test(), but wait_event() in snd_refcount_sync() checks
the condition via atomic_test() without serialization, hence the
thread that called snd_refcount_sync() can continue immediately to
release the resource before another thread calls wake_up().

For avoiding the race above, introduce the spinlock and take it at
snd_refcount_put() and snd_refcount_sync() in order to serialize the
operations.

Fixes: dcca9b6064c3 ("ALSA: Add simple refcount helper functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20261015071838.31082-1-tiwai%40suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h | 1 +
 sound/core/misc.c    | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index daa91a46a16b..657b12e1e95b 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -84,6 +84,7 @@ struct snd_device {
 struct snd_refcount {
 	atomic_t count;
 	wait_queue_head_t waiter;
+	spinlock_t lock;
 };
 
 void snd_refcount_init(struct snd_refcount *ref);
diff --git a/sound/core/misc.c b/sound/core/misc.c
index 066fb9ecdcdc..6fe199e76e83 100644
--- a/sound/core/misc.c
+++ b/sound/core/misc.c
@@ -183,11 +183,13 @@ void snd_refcount_init(struct snd_refcount *ref)
 {
 	atomic_set(&ref->count, 0);
 	init_waitqueue_head(&ref->waiter);
+	spin_lock_init(&ref->lock);
 }
 EXPORT_SYMBOL_GPL(snd_refcount_init);
 
 void snd_refcount_put(struct snd_refcount *ref)
 {
+	guard(spinlock_irqsave)(&ref->lock);
 	if (atomic_dec_and_test(&ref->count))
 		wake_up(&ref->waiter);
 }
@@ -195,6 +197,7 @@ EXPORT_SYMBOL_GPL(snd_refcount_put);
 
 void snd_refcount_sync(struct snd_refcount *ref)
 {
-	wait_event(ref->waiter, !atomic_read(&ref->count));
+	guard(spinlock_irq)(&ref->lock);
+	wait_event_lock_irq(ref->waiter, !atomic_read(&ref->count), ref->lock);
 }
 EXPORT_SYMBOL_GPL(snd_refcount_sync);
-- 
2.55.0

