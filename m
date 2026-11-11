Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419490;
	b=eY5IMXVKimVqIn1rb++pVVY0z5A93LeQsFReaeZtvdMBZtKOFce4LbQ0SZgrWrcwf6/y
	 u2uYBUv2f6jo1vVUPbKW4AY+zHTqYL32XteqKgcbuB6WKGDzx6YA2gZvaGpR+vlKSqko0
	 RAqRYhkHRERPZyu+n/raEuv8J8Fihl9kaXt+8MRZV59VKbJRnqTK+FtYnblyzYlXeRwUJ
	 8Z1YspocTipwdk7/2T5Mt7FI/yNiPZZJlhND4XAHjT9yMaOr9cU+BvIhXxTmbAI3hm0Cn
	 DJZHrzyipxivYu8MmzGxrKyf6ZczI5tpYm2VQL1PFzhumnj7/gF4mn5Hmd9hSLiXr2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419490;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Queue-Id:
	 X-Rspamd-Pre-Result:X-Rspamd-Action:X-Rspamd-Server:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=tOYuvTPV5xGOYsXlvOip9uAQksG43BGEcO5SFlSXiQc=;
	b=wC+vJSY30MQQ69bF9gORn+b0/fq8BgNfCQKviszfw6RheljPW9V64p2UqrcDemjjGOOr
	 a0Au27hLYqOAegQ1rPIlOz1RoUKGB5J3jND7jgMqNoF6J4m4AmwelBe4j6oKZKm5TfngG
	 SifhLC9ZRr+KJBbs0ioE3Y+PgQZM6JmIsvdpKIOjGvjbJkHZgkiXqDGgrSjTOmyYhem+/
	 V2cxyvfg9Yy6u7U5w5Tg16a1vcFy/G9Vn0u0YKKX+3NXE1ExoV84AAmVzHeaknPmXAPoJ
	 75TNrP6NtjNjndNq8KzWwIb8+KTD95LDjaPu17nP1vfoXlo8E8n+ooJDTIQM85vV2Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D67606A89D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27D67606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 75E601F45B;
	Wed, 11 Nov 2026 17:51:28 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F4C21339F;
	Wed, 11 Nov 2026 17:51:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +SJmCxur9GphXQAAD6G6ig:T5
	(envelope-from <pfalcato@suse.de>); Wed, 11 Nov 2026 17:51:27 +0000
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
Subject: [PATCH v2 4/8] mm/khugepaged: factor out and simplify dirty/writeback handling
Date: Wed, 11 Nov 2026 17:51:17 +0000
Message-ID: <20261111175121.1328383-5-pfalcato@suse.de>
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
X-Rspamd-Queue-Id: 75E601F45B
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

Dirty/writeback folios can easily share most of the branch. These checks
are still gated under !is_shmem due to shmem not really having issues
with dirty folios.

While here, reflow the comment.

Signed-off-by: Pedro Falcato <pfalcato@suse.de>
---
 mm/khugepaged.c | 47 ++++++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index d5647a3ac095..0eee2b6bbe64 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2299,8 +2299,8 @@ prepare_collapse_file_folio(pgoff_t index, struct collapse_file_state *state)
 	struct address_space *mapping = state->mapping;
 	enum scan_result result = SCAN_SUCCEED;
 	const bool is_shmem = state->is_shmem;
+	bool dirty, new = false;
 	struct folio *folio;
-	bool new = false;
 
 	folio = maybe_read_folio(index, state, &new);
 	if (!folio)
@@ -2317,39 +2317,40 @@ prepare_collapse_file_folio(pgoff_t index, struct collapse_file_state *state)
 		goto xa_unlocked;
 	}
 
-	if (is_shmem) {
-		if (folio_trylock(folio)) {
-			folio_get(folio);
-		} else {
-			result = SCAN_PAGE_LOCK;
-			goto xa_locked;
-		}
-	} else {	/* !is_shmem */
-		if (folio_test_dirty(folio)) {
+	if (!is_shmem) {
+		dirty = folio_test_dirty(folio);
+		if (dirty || folio_test_writeback(folio)) {
 			/*
-			 * This page is dirty because it hasn't
-			 * been flushed since first write.
+			 * This folio is either dirty or under writeback.
+			 * khugepaged cannot operate on such folios.
 			 *
-			 * Trigger async flush for read-only files and
-			 * hope the writeback is done when khugepaged
-			 * revisits this page. Writable files can have
-			 * their folios dirty at any time; blindly
-			 * flushing them would cause undesirable
+			 * For dirty folios, trigger async flush for
+			 * read-only files and hope the writeback is done
+			 * when khugepaged revisits this page. Writable
+			 * files can have their folios dirty at any time;
+			 * blindly flushing them would cause undesirable
 			 * system-wide writeback.
 			 *
 			 * This is a one-off situation. We are not
 			 * forcing writeback in loop.
 			 */
 			xas_unlock_irq(state->xas);
-			if (!inode_is_open_for_write(mapping->host))
+			if (dirty && !inode_is_open_for_write(mapping->host))
 				filemap_flush(mapping);
 			result = SCAN_PAGE_DIRTY_OR_WRITEBACK;
 			goto xa_unlocked;
-		} else if (folio_test_writeback(folio)) {
-			xas_unlock_irq(state->xas);
-			result = SCAN_PAGE_DIRTY_OR_WRITEBACK;
-			goto xa_unlocked;
-		} else if (folio_trylock(folio)) {
+		}
+	}
+
+	if (is_shmem) {
+		if (folio_trylock(folio)) {
+			folio_get(folio);
+		} else {
+			result = SCAN_PAGE_LOCK;
+			goto xa_locked;
+		}
+	} else {	/* !is_shmem */
+		if (folio_trylock(folio)) {
 			folio_get(folio);
 		} else {
 			result = SCAN_PAGE_LOCK;
-- 
2.56.0

