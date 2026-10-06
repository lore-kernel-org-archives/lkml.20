Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D135456E15;
	Tue,  6 Oct 2026 13:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294052; cv=none; b=mvE56WLTbLsaDgSPAyb6ryFG/lDK3TdvXh884hSQ9POnrDTbtD354yus12mNawYT2IkZxdw8P8x9oRoP6j60b4y5EUFnQAS3gz/DBVYy27JMivvni88AxzE/SyROHM6qsZhHH3l6k021dOF8Mi41P1vbuI9D2ViHDxMx0cq/IUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294052; c=relaxed/simple;
	bh=jc3TSLXldXteeuO1/4m7Zp9oJvtjcpCAcs3SyOAEuYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A+RAAo3F2iz1wHQ7sHO32gk4y4kh2NPEPRAO1S6DeBWJepaefYOdavrpjdw4jzk8u1hO2zixj2Dov8wYKrCjhzHOWjUmoUTZaBlfJPx8HTJk/mqUVBNTBZIIOixE89Erat+XmQIlEhH3Fu6zTeJzKM7e5N1OXCVwMeHgRYw6v1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WAydl2Ge; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DMWvOtxx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CAoXwtsN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DSroREms; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WAydl2Ge";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DMWvOtxx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CAoXwtsN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DSroREms"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6BCD122002;
	Tue,  6 Oct 2026 13:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791294043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MhC74u0euHiG6EiTkvFEObitfBMnKo6wcSCms+38sDc=;
	b=WAydl2Ge9XsUUydAHBCi67N61OK8vE6SNbeyPUmHGC1J2CLiUO6rVgTV57YwaRWrmgdIsH
	0BrQXHSV0J+7Puqw5NJW+MVUD7AxTMqb5NUeTnW3HVEy2ez7K+0BhMmejAZj0nLgjs20Cr
	p5zozO2g0jVEpiFNxao+wa7SbAXzkZo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791294043;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MhC74u0euHiG6EiTkvFEObitfBMnKo6wcSCms+38sDc=;
	b=DMWvOtxxneDCKe1+mruHVBVku7GnAS4Oa8XhQLzrmohLVtIAqAyqvHAEC4BTXe6f4NFQD0
	KOJI/VZPnl2nQODQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CAoXwtsN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DSroREms
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791294039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MhC74u0euHiG6EiTkvFEObitfBMnKo6wcSCms+38sDc=;
	b=CAoXwtsNWqxxGAkxRiKuzdFD6hD7vw3pFgXKQWzTuZFn/v57+arcgFu7tv55/koIm9NrAh
	74hSyUkORn2wbtYsNF+zWvU2T57sY0hijJ5V3BCWgY+BKp5PQO+ZfT5m8SHI7sgMFwMzjI
	ncXioUQwAeiLlOXyKGwcvYzyte0DzYY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791294039;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MhC74u0euHiG6EiTkvFEObitfBMnKo6wcSCms+38sDc=;
	b=DSroREmsIQawiu5m49Wu5v7auY42yzahHrGXtFfYImU18li9MaHoPfUhU2DT5HQpmxkjoh
	h1xo1YCPFcLrXkDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DF5513A5C;
	Tue,  6 Oct 2026 13:40:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1eVrAVf6xGq1cAAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Tue, 06 Oct 2026 13:40:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] ALSA: seq: Drop the bogus RCU guard from clientptr()
Date: Tue,  6 Oct 2026 15:40:25 +0200
Message-ID: <20261006134035.478529-2-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006134035.478529-1-tiwai@suse.de>
References: <20261006134035.478529-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6BCD122002
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
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

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

