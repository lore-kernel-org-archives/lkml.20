Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419489;
	b=EirieK2OUfkkvKqF5XFdgITO74wcHZs8g5ymQMfohX7qQLTbpGT58vpIP+GDEMJOFtKV
	 xrnMYNhonX13Y+xuCdhU8EzyeHrmRIQ92ynCXIr8cLl9XbX5zq68pLGxMyo0mQ9WBepCT
	 FnK8B4Hf1SSMq1bY4zrpScjZrZOvmHXXtKEjCMsc0/8/8gGS1nK7bLXuVY6aRzAKnr7yv
	 xaQbZIVj511c91ESi62ynSZOYawBQXSMaT8e1QXxbSg4teOD2znG+Lp8uRrZjB3OvqnQs
	 JUuO6yn1Ws1/9tVabw2Zw62jvgCvwrx0N3s5XqJiXkCnc+CEp4Y7gWvmXOWdsf+GyQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419489;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Queue-Id:
	 X-Rspamd-Pre-Result:X-Rspamd-Action:X-Rspamd-Server:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=kEj5fM36biU8ATX3Hs0Bnu0HMNxG5HBdQhLfnJwgrB8=;
	b=QMs2hZyFz5WlITzGfuGD2bbzoCrP96zcxB7hNy36f2rr2ThagkP1QLLuU882hU9ED7Ms
	 LD+QrKOP+sCJkAE+xtmeGyck6Kdw/9A/AmjqhOWCikL2Ukf4QrNPL8+2VCZ79wB3zNzf3
	 8qlQWdN7+tBkqlR1dyop7UyQojNs6l2Ga6ecwKagyO7P62dtgDTuee4dXuYG9j+niyVrU
	 x/yUdLL3gTSccpeOtDKoD5wF1QGfetD30qeZLfaE76ypFtl6ROwSn/NOU0zmsvSjUMai0
	 bYY0AyG6u4FmDRi65LtrTO5zJMwNUhcRPBAXTgrAPHJXW9ivhOt4Xvf2W3cPmPmM9iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBBD606A884
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDBBD606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7257321E4B;
	Wed, 11 Nov 2026 17:51:27 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6BBF5134F4;
	Wed, 11 Nov 2026 17:51:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +SJmCxur9GphXQAAD6G6ig:T4
	(envelope-from <pfalcato@suse.de>); Wed, 11 Nov 2026 17:51:26 +0000
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
Subject: [PATCH v2 3/8] mm/khugepaged: factor out page cache folio reading
Date: Wed, 11 Nov 2026 17:51:16 +0000
Message-ID: <20261111175121.1328383-4-pfalcato@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: 7257321E4B
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00

The two reading mechanisms (shmem, filemap) have similar purposes but
vary subtly. There is no need to have two variants.

Factor out the do_readahead toggling (for regular files) and
shmem_get_folio (for shmem) into its own separate function,
maybe_read_folio(), shared by both paths.

Signed-off-by: Pedro Falcato <pfalcato@suse.de>
---
 mm/khugepaged.c | 77 +++++++++++++++++++++++++++++++++++++------------
 1 file changed, 59 insertions(+), 18 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index ac148db2a4a0..d5647a3ac095 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2238,6 +2238,46 @@ static inline struct folio *real_folio(struct folio *folio)
 	return folio;
 }
 
+/**
+ * maybe_read_folio() - Ensure a folio is uptodate
+ * @index: folio index in the page cache
+ * @state: collapse_file state helper struct
+ * @new: if a new folio is returned, *new = true.
+ *
+ * maybe_read_folio() ensures a folio is uptodate and, if not, either reads it
+ * in synchronously (for shmem), or schedules readahead (for after the collapse
+ * logic untangles itself from all the folio locks it's holding).
+ *
+ * Context: Expects @state->mapping->i_pages.xa_lock to be held. Releases that
+ * same lock on error, or if *@new = true.
+ * Return: Valid folio (locked and uptodate iff *@new), or NULL on error.
+ */
+static struct folio *
+maybe_read_folio(pgoff_t index, struct collapse_file_state *state, bool *new)
+{
+	struct folio *folio = real_folio(state->folio);
+	const bool may_bring_uptodate = state->is_shmem;
+
+	/* Perfectly cromulent, uptodate folio. Proceed. */
+	if (folio && (!may_bring_uptodate || folio_test_uptodate(folio)))
+		return folio;
+
+	/* We're either returning NULL, or starting IO. Drop the lock now. */
+	xas_unlock_irq(state->xas);
+	if (!state->is_shmem) {
+		/* Folio is missing? Let's start readahead, if we haven't already. */
+		state->do_readahead = !state->readahead_done;
+		return NULL;
+	}
+
+	*new = true;
+	/* swap in or instantiate fallocated page */
+	if (shmem_get_folio(state->mapping->host, index, 0,
+				 &folio, SGP_NOALLOC))
+		return NULL;
+	return folio;
+}
+
 /**
  * prepare_collapse_file_folio() - Prepare the collapsing of a single file folio
  * @index: folio index in the page cache
@@ -2259,32 +2299,33 @@ prepare_collapse_file_folio(pgoff_t index, struct collapse_file_state *state)
 	struct address_space *mapping = state->mapping;
 	enum scan_result result = SCAN_SUCCEED;
 	const bool is_shmem = state->is_shmem;
-	struct folio *folio = state->folio;
+	struct folio *folio;
+	bool new = false;
+
+	folio = maybe_read_folio(index, state, &new);
+	if (!folio)
+		return SCAN_FAIL;
+	if (new) {
+		/*
+		 * maybe_read_folio() got a new folio. This folio is locked
+		 * and ref'd up. Nothing tricky (dirty, writeback, etc) is likely to
+		 * have happened, so bail now. But before that, drain the local LRU
+		 * add batch. Otherwise, it's very possible folio_isolate_lru()
+		 * will not succeed.
+		 */
+		lru_add_drain();
+		goto xa_unlocked;
+	}
 
 	if (is_shmem) {
-		if (!folio || !folio_test_uptodate(folio)) {
-			xas_unlock_irq(state->xas);
-			/* swap in or instantiate fallocated page */
-			if (shmem_get_folio(mapping->host, index, 0,
-					&folio, SGP_NOALLOC)) {
-				result = SCAN_FAIL;
-				goto xa_unlocked;
-			}
-			/* drain lru cache to help folio_isolate_lru() */
-			lru_add_drain();
-			goto xa_unlocked;
-		} else if (folio_trylock(folio)) {
+		if (folio_trylock(folio)) {
 			folio_get(folio);
 		} else {
 			result = SCAN_PAGE_LOCK;
 			goto xa_locked;
 		}
 	} else {	/* !is_shmem */
-		if (!folio) {
-			state->do_readahead = !state->readahead_done;
-			result = SCAN_FAIL;
-			goto xa_unlocked;
-		} else if (folio_test_dirty(folio)) {
+		if (folio_test_dirty(folio)) {
 			/*
 			 * This page is dirty because it hasn't
 			 * been flushed since first write.
-- 
2.56.0

