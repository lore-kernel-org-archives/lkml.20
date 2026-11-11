Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419491;
	b=M9+y2zfOtSsXmWKkJsAW6PVCMGD/m3+RBabktIty4J8C4Ini1Ssu1lrB+wnn6H3vVHFE
	 Se1bWOXVuVNNe9vXZk3gX9gCnhycNQrKaHorDonS1EbDgxkxei2Yh7tsLRVsw+oEgEmk+
	 87UDYGAHSHIqRzygGZ3Aof4zCB5E0EVeFTGMg7mADTG/+JwRtcOMWGmtNJnXuBJOvDt7R
	 gyFlIOfw7V7EvZGpODk5UHJsY6phZ+iAIdMP8MLCpD7F7XugraW8vwEve16eowmJDuasi
	 ju23/2LyGBrU8LC6IepmUidiQBgIqoA0LC3+VlfcNaVRATC0Oub5hvPst49tfe9yg4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419491;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:X-Spam-Level:
	 X-Spam-Flag;
	bh=+HiscfN4+DVbmqui1EUJQgaWwTJHFwhJVZ/d6WtcwgA=;
	b=jVhQLSaKh02xYsTYoYPGkFPQEVDQnapbvN5cMjQiJych+Jdo1Fx41BTz6V1KYu0EcuYN
	 dYKO8n3163aHjEbUYiSYC6d2s1o9Xgz6TkXcUWuJZx78SNj5IsBuUF8Q9ARLJZYfWM6cu
	 L8p7YkbrCVERX8/xg2KbgETdu7FuVYlYsw4Qk6KMLny0u+CghFgpc36J9GHGZtXBI8VVR
	 sFwvzmd5P9w559KiE0VxJyPjpxIgbYm0r2WngbYJssBnoZv/VMZGihDCJPPEBEOBAcv3x
	 CFiXUXMnPeDBUQ9BnUAo15hYHy2VNbfTMNsdWcfRo/EqXhj5/Em9TiM9D2F8JwOaJpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aVtr62aZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EqWUrHka;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aVtr62aZ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EqWUrHka;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159BD606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 159BD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aVtr62aZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EqWUrHka;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aVtr62aZ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EqWUrHka
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 808B91F78E;
	Wed, 11 Nov 2026 17:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794419489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+HiscfN4+DVbmqui1EUJQgaWwTJHFwhJVZ/d6WtcwgA=;
	b=aVtr62aZ4JKq28xOjAsXbZN9koW/kss+w99l6WB4ET+8EbE2fEEQKgvGu5fjChrsxlk2qn
	QCWhVaXu1GX1xjPDV3AWWJUJeRJaQvsYVsnEFiOYOEc1jgAl6TAT3ozOwUI0wOVzyWMVzQ
	wvNJJwD+71gWFL+3Qumn/sQfkveP/xY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794419489;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+HiscfN4+DVbmqui1EUJQgaWwTJHFwhJVZ/d6WtcwgA=;
	b=EqWUrHka6Q1KNEBxYxIGTZlMYsHy8ZvGlp5vSwkY9LKJrPkEnDZnDW8PfnrY0JShawPGQ4
	LADGpBrtJ4cdcVAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794419489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+HiscfN4+DVbmqui1EUJQgaWwTJHFwhJVZ/d6WtcwgA=;
	b=aVtr62aZ4JKq28xOjAsXbZN9koW/kss+w99l6WB4ET+8EbE2fEEQKgvGu5fjChrsxlk2qn
	QCWhVaXu1GX1xjPDV3AWWJUJeRJaQvsYVsnEFiOYOEc1jgAl6TAT3ozOwUI0wOVzyWMVzQ
	wvNJJwD+71gWFL+3Qumn/sQfkveP/xY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794419489;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+HiscfN4+DVbmqui1EUJQgaWwTJHFwhJVZ/d6WtcwgA=;
	b=EqWUrHka6Q1KNEBxYxIGTZlMYsHy8ZvGlp5vSwkY9LKJrPkEnDZnDW8PfnrY0JShawPGQ4
	LADGpBrtJ4cdcVAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7542A134F4;
	Wed, 11 Nov 2026 17:51:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +SJmCxur9GphXQAAD6G6ig:T6
	(envelope-from <pfalcato@suse.de>); Wed, 11 Nov 2026 17:51:28 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>
Cc: Pedro Falcato <pfalcato@suse.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Kiryl Shutsemau <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] mm/khugepaged: simplify prepare folio locking and exit paths
Date: Wed, 11 Nov 2026 17:51:18 +0000
Message-ID: <20261111175121.1328383-6-pfalcato@suse.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111175121.1328383-1-pfalcato@suse.de>
References: <20261111175121.1328383-1-pfalcato@suse.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-15.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RL8d8xedm6iu8o66torxsk6bwd)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -15.80
X-Spam-Level: 
X-Spam-Flag: NO

folio_trylock() + folio_get() do the exact same thing on both is_shmem
and !is_shmem paths. Unify them into one path.

At the end of the day, there are two large invariants for the function:
 - xarray lock is not held at exit. Either it was dropped on error, or
   dropped on success/IO.
 - success always means a locked-and-ref'd-up folio.

After this transformation, it's trivial to notice how simple the error
paths are, so do away with the gotos and hoist some code.

Signed-off-by: Pedro Falcato <pfalcato@suse.de>
---
 mm/khugepaged.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 0eee2b6bbe64..236df9be7e27 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2314,7 +2314,8 @@ prepare_collapse_file_folio(pgoff_t index, struct collapse_file_state *state)
 		 * will not succeed.
 		 */
 		lru_add_drain();
-		goto xa_unlocked;
+		state->folio = folio;
+		return SCAN_SUCCEED;
 	}
 
 	if (!is_shmem) {
@@ -2337,31 +2338,19 @@ prepare_collapse_file_folio(pgoff_t index, struct collapse_file_state *state)
 			xas_unlock_irq(state->xas);
 			if (dirty && !inode_is_open_for_write(mapping->host))
 				filemap_flush(mapping);
-			result = SCAN_PAGE_DIRTY_OR_WRITEBACK;
-			goto xa_unlocked;
-		}
-	}
-
-	if (is_shmem) {
-		if (folio_trylock(folio)) {
-			folio_get(folio);
-		} else {
-			result = SCAN_PAGE_LOCK;
-			goto xa_locked;
-		}
-	} else {	/* !is_shmem */
-		if (folio_trylock(folio)) {
-			folio_get(folio);
-		} else {
-			result = SCAN_PAGE_LOCK;
-			goto xa_locked;
+			return SCAN_PAGE_DIRTY_OR_WRITEBACK;
 		}
 	}
 
-xa_locked:
+	/*
+	 * Note: trylock + simple folio_get() is safe here due to the i_pages
+	 * lock being held; this excludes truncation happening in parallel.
+	 */
+	if (!folio_trylock(folio))
+		result = SCAN_PAGE_LOCK;
+	else
+		folio_get(folio);
 	xas_unlock_irq(state->xas);
-xa_unlocked:
-	state->folio = folio;
 	return result;
 }
 
-- 
2.56.0

