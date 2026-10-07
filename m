Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6E93D47A6;
	Wed,  7 Oct 2026 17:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393658; cv=none; b=r+FEVuLbLhI541fLpn0WEV7JzZG4CAAsCjtqCVR/gHZg5IPcYYmWoza5E6gEE3PvFlZfjeB4D2c0BTvX1Gn9jN1qUfjDgZV75s7RXYidVISP37TtlRp5SrRIptzzuvJn3g2B3KHhMxWh5BBVy8+JCUxH2RCk1tqEqQt163Jaf48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393658; c=relaxed/simple;
	bh=jc3TSLXldXteeuO1/4m7Zp9oJvtjcpCAcs3SyOAEuYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eICJYSm7LhNAKcvuEFRP+b8sskxKVgX6zD9zZty5rLtYqM9QTj9sAjtB17y2oijvaiwnvSLOtlJM6QNqsI/dP6x6pM9ZhucaXJMnvJhHG8SUcQpMx+o37gEOBxG0DhByKarMZE8GytizlsRX/YOYkF7Z7eGhGCaKTIMPNwvNx3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GLrQIx8M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2N1ESOVG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GLrQIx8M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2N1ESOVG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GLrQIx8M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2N1ESOVG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GLrQIx8M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2N1ESOVG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 73E721F44E;
	Wed,  7 Oct 2026 17:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MhC74u0euHiG6EiTkvFEObitfBMnKo6wcSCms+38sDc=;
	b=GLrQIx8MCpwJT4J2chG7r2X6ZdktTcJX+VVzF+Cgra+7Kqk46+7Dj3+5rKoghb6udKpXVy
	1gTa4hyfwGA/4GITqw4vsAK2QdZKk6UMyKpwTb2Kr/wf4PAajpD8qhS2qMZH3Ibrgxf9lh
	3FL6jb+EK6c+O5sBY5iNTZqb5iJWnzM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MhC74u0euHiG6EiTkvFEObitfBMnKo6wcSCms+38sDc=;
	b=2N1ESOVGxwIBLmdYFtwXdyl5BCeQnEG1h5aLL+Qyz9sq6bGRXC+Kx5yER79T7TIImh0f6C
	CyhhTAwnNDTK/gBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GLrQIx8M;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2N1ESOVG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MhC74u0euHiG6EiTkvFEObitfBMnKo6wcSCms+38sDc=;
	b=GLrQIx8MCpwJT4J2chG7r2X6ZdktTcJX+VVzF+Cgra+7Kqk46+7Dj3+5rKoghb6udKpXVy
	1gTa4hyfwGA/4GITqw4vsAK2QdZKk6UMyKpwTb2Kr/wf4PAajpD8qhS2qMZH3Ibrgxf9lh
	3FL6jb+EK6c+O5sBY5iNTZqb5iJWnzM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MhC74u0euHiG6EiTkvFEObitfBMnKo6wcSCms+38sDc=;
	b=2N1ESOVGxwIBLmdYFtwXdyl5BCeQnEG1h5aLL+Qyz9sq6bGRXC+Kx5yER79T7TIImh0f6C
	CyhhTAwnNDTK/gBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EEF61139AC;
	Wed,  7 Oct 2026 17:20:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8rcALXZ/xmp1CgAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 17:20:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/8] ALSA: seq: Drop the bogus RCU guard from clientptr()
Date: Wed,  7 Oct 2026 19:20:37 +0200
Message-ID: <20261007172051.13240-2-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007172051.13240-1-tiwai@suse.de>
References: <20261007172051.13240-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 73E721F44E
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]

In the recent refactoring with RCU, clientptr() takes guard(rcu)()
around the client table lookup, but the RCU read-side section ends as
soon as the function returns, so the returned pointer isn't protected
at all.  This gives a false impression as if that the callers were
safe, and confuse reviewers including Sashiko.

Actually, the callers (snd_seq_delete_kernel_client(),
snd_seq_kernel_client_ctl() and snd_seq_kernel_client_write_poll())
never relied on any lock; the caller is the owner of the client (a
kernel client passing its own id, or a user client via its opened
file), hence the client can't be released concurrently by others.

So just drop the confusing and useless RCU guard, read the table via
rcu_dereference_protected(), and document the lifetime rule.  Along
with it, fold __clientptr() into its only user client_use_ptr(); the
id range is already checked there, and it's never called with
clients_lock held, so a plain rcu_dereference() suffices.

Fixes: 7a287e4615d6 ("ALSA: seq: Use RCU for the client table")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 239809ce48d7..ba5619d0b0b0 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -95,23 +95,18 @@ static inline int snd_seq_write_pool_allocated(struct snd_seq_client *client)
 	return snd_seq_total_cells(client->pool) > 0;
 }
 
-/* return pointer to client structure for specified id; call under RCU read-lock */
-static struct snd_seq_client *__clientptr(int clientid)
+/* return pointer to client structure for specified id;
+ * the caller must guarantee the client's lifetime by itself, as neither RCU
+ * nor a use_lock reference is taken here.
+ */
+static struct snd_seq_client *clientptr(int clientid)
 {
 	if (clientid < 0 || clientid >= SNDRV_SEQ_MAX_CLIENTS) {
 		pr_debug("ALSA: seq: oops. Trying to get pointer to client %d\n",
 			   clientid);
 		return NULL;
 	}
-	return rcu_dereference_check(clienttab[clientid],
-				    lockdep_is_held(&clients_lock));
-}
-
-/* return pointer to client structure for specified id */
-static struct snd_seq_client *clientptr(int clientid)
-{
-	guard(rcu)();
-	return __clientptr(clientid);
+	return rcu_dereference_protected(clienttab[clientid], true);
 }
 
 static struct snd_seq_client *client_use_ptr(int clientid, bool load_module)
@@ -124,7 +119,7 @@ static struct snd_seq_client *client_use_ptr(int clientid, bool load_module)
 		return NULL;
 	}
 	scoped_guard(rcu) {
-		client = __clientptr(clientid);
+		client = rcu_dereference(clienttab[clientid]);
 		if (client)
 			return snd_seq_client_ref(client);
 		if (clienttablock[clientid])
@@ -159,7 +154,7 @@ static struct snd_seq_client *client_use_ptr(int clientid, bool load_module)
 			}
 		}
 		scoped_guard(rcu) {
-			client = __clientptr(clientid);
+			client = rcu_dereference(clienttab[clientid]);
 			if (client)
 				return snd_seq_client_ref(client);
 		}
-- 
2.55.0

