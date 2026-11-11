Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419487;
	b=tuFqpZC3BUEBC2XedeKo3PJE8lUmwZAMvy+I8DAM3WLKsjnUjMua7o0hSsZNnCzBz0Oz
	 E922RmPbsMcGBLXe+XCsjBOFBn9aqnpKXczDKIUcecsdE0CPgBym6mEuNSgjEEBryrFLo
	 ZviHFsGqWED75EHJAvPubBiruS5h6N0UkUUtEGw/2XFAUG4dPOmTgtSKvVTzXfopl3lYI
	 ttOwu73D5t70GZ8US0B7PsJLZJWVVQdnxsQCTN3eK8Pj04a+nRjWApBo8Fq4Ytjsklb4n
	 73gKQEjNLxrnc6R+DbDiIASFIqux6XYkLo9CWdb7n2P1GRuapQzN5+p03MCw6KQSAZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419487;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Queue-Id:
	 X-Rspamd-Pre-Result:X-Rspamd-Action:X-Rspamd-Server:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=wL2QDiXgYZ0Yn6yfW/NEQwRS6ba4jqEjyh6K7k8Gtdc=;
	b=nWg23S5+scWp52WibbZ94ObKb6kEWNW3agQhxMuw+4KMm4BaVfPME9CAc22m8DqPqZkx
	 2vKNpVkfTMiXaTWoKzuE60c5ognpH74Ptu0ZV/cBOOAXbviwzPttUhd9X9jCmDe5Pi9sM
	 eP6Uzmw6nnGDgtgnZ2P7NO0Jk2Hz4uCfcQ+avdFueVLViUNBtNZ5Pe/2jvApnh1wrJo6Z
	 UHJjvW2qmyulwUAyME32DxfzVPB7xaATBO/XCXLlzFmWKOlByhCUL/eaaDDaadX6vmrcB
	 SV7wovjCyL0guxdlD+a3YScV8ZN8BmGwDsAOVzivA6n8+BtHz08qGYRbiHu1dIuvh/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A1D606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19A1D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 69D7F1F458;
	Wed, 11 Nov 2026 17:51:25 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62A06134F4;
	Wed, 11 Nov 2026 17:51:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +SJmCxur9GphXQAAD6G6ig:T2
	(envelope-from <pfalcato@suse.de>); Wed, 11 Nov 2026 17:51:24 +0000
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
Subject: [PATCH v2 1/8] mm/khugepaged: separate out windy folio logic from collapse_file
Date: Wed, 11 Nov 2026 17:51:14 +0000
Message-ID: <20261111175121.1328383-2-pfalcato@suse.de>
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
X-Rspamd-Queue-Id: 69D7F1F458
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

Separate out complex folio-related logic from the main collapse_file()
loop, and introduce a new helper struct to help marshal arguments back
and forth.

No functional change intended.

Signed-off-by: Pedro Falcato <pfalcato@suse.de>
---
 mm/khugepaged.c | 202 ++++++++++++++++++++++++++++++------------------
 1 file changed, 128 insertions(+), 74 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 24eb8281ea3c..0fe19acf470b 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2211,6 +2211,105 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 	i_mmap_unlock_read(mapping);
 }
 
+struct collapse_file_state {
+	/* Inputs */
+	struct address_space *mapping;
+	struct file *file;
+	struct xa_state *xas;
+	/* folio is in-out; preparing might modify it */
+	struct folio *folio;
+	/* collapse end index */
+	const pgoff_t end;
+	const bool is_shmem : 1;
+	bool do_readahead : 1;
+	bool readahead_done : 1;
+};
+
+/**
+ * prepare_collapse_file_folio() - Prepare the collapsing of a single file folio
+ * @index: folio index in the page cache
+ * @state: helper struct of state being passed back and forth.
+ *
+ * prepare_collapse_file_folio() helps prepare the THP collapsing of file folios
+ * (both shmem and !shmem), including the reading of folios, initial tests for
+ * dirty/writeback, locking, etc.
+ *
+ * Context: Expects @state->mapping->i_pages.xa_lock to be held. Releases the same xa_lock.
+ *          On success, returns a refcounted and locked folio in @state->folio (that may
+ *          not be the same that was passed in).
+ *          If readahead needs to be (and can be) done, sets state->do_readahead.
+ * Return: Appropriate scan_result value (on success, SCAN_SUCCEED).
+ */
+static enum scan_result
+prepare_collapse_file_folio(pgoff_t index, struct collapse_file_state *state)
+{
+	struct address_space *mapping = state->mapping;
+	enum scan_result result = SCAN_SUCCEED;
+	const bool is_shmem = state->is_shmem;
+	struct folio *folio = state->folio;
+
+	if (is_shmem) {
+		if (xa_is_value(folio) || !folio_test_uptodate(folio)) {
+			xas_unlock_irq(state->xas);
+			/* swap in or instantiate fallocated page */
+			if (shmem_get_folio(mapping->host, index, 0,
+					&folio, SGP_NOALLOC)) {
+				result = SCAN_FAIL;
+				goto xa_unlocked;
+			}
+			/* drain lru cache to help folio_isolate_lru() */
+			lru_add_drain();
+			goto xa_unlocked;
+		} else if (folio_trylock(folio)) {
+			folio_get(folio);
+		} else {
+			result = SCAN_PAGE_LOCK;
+			goto xa_locked;
+		}
+	} else {	/* !is_shmem */
+		if (!folio || xa_is_value(folio)) {
+			state->do_readahead = !state->readahead_done;
+			result = SCAN_FAIL;
+			goto xa_unlocked;
+		} else if (folio_test_dirty(folio)) {
+			/*
+			 * This page is dirty because it hasn't
+			 * been flushed since first write.
+			 *
+			 * Trigger async flush for read-only files and
+			 * hope the writeback is done when khugepaged
+			 * revisits this page. Writable files can have
+			 * their folios dirty at any time; blindly
+			 * flushing them would cause undesirable
+			 * system-wide writeback.
+			 *
+			 * This is a one-off situation. We are not
+			 * forcing writeback in loop.
+			 */
+			xas_unlock_irq(state->xas);
+			if (!inode_is_open_for_write(mapping->host))
+				filemap_flush(mapping);
+			result = SCAN_PAGE_DIRTY_OR_WRITEBACK;
+			goto xa_unlocked;
+		} else if (folio_test_writeback(folio)) {
+			xas_unlock_irq(state->xas);
+			result = SCAN_PAGE_DIRTY_OR_WRITEBACK;
+			goto xa_unlocked;
+		} else if (folio_trylock(folio)) {
+			folio_get(folio);
+		} else {
+			result = SCAN_PAGE_LOCK;
+			goto xa_locked;
+		}
+	}
+
+xa_locked:
+	xas_unlock_irq(state->xas);
+xa_unlocked:
+	state->folio = folio;
+	return result;
+}
+
 /**
  * collapse_file - collapse filemap/tmpfs/shmem pages into huge one.
  *
@@ -2249,8 +2348,13 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	XA_STATE_ORDER(xas, &mapping->i_pages, start, HPAGE_PMD_ORDER);
 	enum scan_result result = SCAN_SUCCEED;
 	int nr_none = 0;
-	bool do_readahead = false;
-	bool readahead_done = false;
+	struct collapse_file_state state = {
+		.is_shmem = is_shmem,
+		.xas = &xas,
+		.mapping = mapping,
+		.file = file,
+		.end = end,
+	};
 
 	/*
 	 * MADV_COLLAPSE ignores shmem huge config, so do not check shmem
@@ -2270,7 +2374,7 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 
 retry:
 	result = SCAN_SUCCEED;
-	do_readahead = false;
+	state.do_readahead = false;
 	xas_set_order(&xas, start, HPAGE_PMD_ORDER);
 	__folio_set_locked(new_folio);
 	if (is_shmem)
@@ -2299,79 +2403,29 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 		folio = xas_load(&xas);
 
 		VM_BUG_ON(index != xas.xa_index);
-		if (is_shmem) {
-			if (!folio) {
-				/*
-				 * Stop if extent has been truncated or
-				 * hole-punched, and is now completely
-				 * empty.
-				 */
-				if (index == start) {
-					if (!xas_next_entry(&xas, end - 1)) {
-						result = SCAN_TRUNCATED;
-						goto xa_locked;
-					}
-				}
-				nr_none++;
-				index++;
-				continue;
-			}
-
-			if (xa_is_value(folio) || !folio_test_uptodate(folio)) {
-				xas_unlock_irq(&xas);
-				/* swap in or instantiate fallocated page */
-				if (shmem_get_folio(mapping->host, index, 0,
-						&folio, SGP_NOALLOC)) {
-					result = SCAN_FAIL;
-					goto xa_unlocked;
+		if (is_shmem && !folio) {
+			/*
+			 * Stop if extent has been truncated or
+			 * hole-punched, and is now completely
+			 * empty.
+			 */
+			if (index == start) {
+				if (!xas_next_entry(&xas, end - 1)) {
+					result = SCAN_TRUNCATED;
+					goto xa_locked;
 				}
-				/* drain lru cache to help folio_isolate_lru() */
-				lru_add_drain();
-			} else if (folio_trylock(folio)) {
-				folio_get(folio);
-				xas_unlock_irq(&xas);
-			} else {
-				result = SCAN_PAGE_LOCK;
-				goto xa_locked;
-			}
-		} else {	/* !is_shmem */
-			if (!folio || xa_is_value(folio)) {
-				do_readahead = !readahead_done;
-				result = SCAN_FAIL;
-				goto xa_locked;
-			} else if (folio_test_dirty(folio)) {
-				/*
-				 * This page is dirty because it hasn't
-				 * been flushed since first write.
-				 *
-				 * Trigger async flush for read-only files and
-				 * hope the writeback is done when khugepaged
-				 * revisits this page. Writable files can have
-				 * their folios dirty at any time; blindly
-				 * flushing them would cause undesirable
-				 * system-wide writeback.
-				 *
-				 * This is a one-off situation. We are not
-				 * forcing writeback in loop.
-				 */
-				xas_unlock_irq(&xas);
-				if (!inode_is_open_for_write(mapping->host))
-					filemap_flush(mapping);
-				result = SCAN_PAGE_DIRTY_OR_WRITEBACK;
-				goto xa_unlocked;
-			} else if (folio_test_writeback(folio)) {
-				xas_unlock_irq(&xas);
-				result = SCAN_PAGE_DIRTY_OR_WRITEBACK;
-				goto xa_unlocked;
-			} else if (folio_trylock(folio)) {
-				folio_get(folio);
-				xas_unlock_irq(&xas);
-			} else {
-				result = SCAN_PAGE_LOCK;
-				goto xa_locked;
 			}
+			nr_none++;
+			index++;
+			continue;
 		}
 
+		/* At this point folio can be NULL, or a value. */
+		state.folio = folio;
+		result = prepare_collapse_file_folio(index, &state);
+		folio = state.folio;
+		if (result != SCAN_SUCCEED)
+			goto xa_unlocked;
 		/*
 		 * The folio must be locked, so we can drop the i_pages lock
 		 * without racing with truncate.
@@ -2667,7 +2721,7 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	folio_unlock(new_folio);
 
 	/* Readahead may take invalidate_lock; source folios are unlocked. */
-	if (do_readahead) {
+	if (state.do_readahead) {
 		for (index = start; index < end;) {
 			folio = filemap_lock_folio(mapping, index);
 			if (IS_ERR(folio)) {
@@ -2685,7 +2739,7 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 		}
 		/* Drain the local LRU batch before retrying isolation. */
 		lru_add_drain();
-		readahead_done = true;
+		state.readahead_done = true;
 		goto retry;
 	}
 out_put:
-- 
2.56.0

