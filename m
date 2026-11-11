Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419494;
	b=O8hHqtD6xYZoGzFwnoGyjqUCuvzwdHS6DmC72ubWcxcoY2kuapVuGtLedUBEoXoK7u6I
	 g6CE9R/qvTd0qEBAFwueocXcj5c+x+nozWqucTKlBUJ0zfKbFwtIWTSIyZtAj1ZCun8Wu
	 dAg3mO+h9NLBb3MbDKHfPv3Xli2+Y5EtToMmfdpNry62Vk3YdUgL//ICkBi6nmTz8BF1P
	 rySG8RJ8nYQ+5RhtPipY3HrHsiJ71mMIql1PiMKQBdsGCT8DulydIHvmflEnLUEG5y3Ik
	 ZRDaz47sdCkkrFb8ZwVmg0cCNpkLDgWMiP5I56HsOs9z/+Dmgki2osbzlNU4c89XI1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419494;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:X-Spamd-Result:
	 X-Spam-Score;
	bh=nYqyrDunD/XWdDgSUSWZHVidq8sUw+omObbXg7Rq1Gk=;
	b=lXOBPqR6X9LNx3/PqacsQRUTQ1l6LrEDaRC5JLICH3rBk2hvXm6FTgZ7bOvL6n57fhKe
	 lzHaZYpVcXiDdRYO1DosREoYpG+66L1BIYKCt0XirzUweQ+srAPrzNNmfqIi7u42GIE+2
	 SLWBnHlFIoH/GENICnje4BtK5uQ2tTsk21M7ELeK1Zw7ERc2jvmDu7NOykInLPH+X0KIl
	 l8utlwvSBOeWa6tEpH08f5m4Jf70jKJHTtNvz0+6KfHZ95rqx8nCzB0Jb+AyYg5GF4JZG
	 VCTWRTUxghoDaCJMy3fnuLHLfogeCyK+xuSg5IlQ88BVJjPzmFKrIEbFEdAaru0VyAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0up1x29w;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=P5RqRwxq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0up1x29w;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=P5RqRwxq;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CA7606A8BE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41CA7606A8BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0up1x29w;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=P5RqRwxq;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0up1x29w;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=P5RqRwxq
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9AF6E1F458;
	Wed, 11 Nov 2026 17:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794419491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nYqyrDunD/XWdDgSUSWZHVidq8sUw+omObbXg7Rq1Gk=;
	b=0up1x29wREGV/og/O6xlhVvTMl2hXZjCiKGexinb33873S6TYitZMXkYrm//2igUo1OOYu
	9CW22/lWQ9aGtTCMCayQ3y8g1Y+gcfIrLjBBEaRWRqHsQZwqTNNGJHVcMJ4hj+KohDoC2t
	6YNqlM/CICcx6JXt41GntWM7N+jWY6k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794419491;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nYqyrDunD/XWdDgSUSWZHVidq8sUw+omObbXg7Rq1Gk=;
	b=P5RqRwxqYpjdMocB9UkI9SiPCQz79pvmBCthmhM1qd/lLsieA7RV0nY2P3uAo+aTzF/zWl
	AIsOcvPO4covwFBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794419491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nYqyrDunD/XWdDgSUSWZHVidq8sUw+omObbXg7Rq1Gk=;
	b=0up1x29wREGV/og/O6xlhVvTMl2hXZjCiKGexinb33873S6TYitZMXkYrm//2igUo1OOYu
	9CW22/lWQ9aGtTCMCayQ3y8g1Y+gcfIrLjBBEaRWRqHsQZwqTNNGJHVcMJ4hj+KohDoC2t
	6YNqlM/CICcx6JXt41GntWM7N+jWY6k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794419491;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nYqyrDunD/XWdDgSUSWZHVidq8sUw+omObbXg7Rq1Gk=;
	b=P5RqRwxqYpjdMocB9UkI9SiPCQz79pvmBCthmhM1qd/lLsieA7RV0nY2P3uAo+aTzF/zWl
	AIsOcvPO4covwFBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D10E134F4;
	Wed, 11 Nov 2026 17:51:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +SJmCxur9GphXQAAD6G6ig:T8
	(envelope-from <pfalcato@suse.de>); Wed, 11 Nov 2026 17:51:30 +0000
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
Subject: [PATCH v2 7/8] mm/khugepaged: hoist more code into collapse_isolate_folio()
Date: Wed, 11 Nov 2026 17:51:20 +0000
Message-ID: <20261111175121.1328383-8-pfalcato@suse.de>
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
X-Spam-Flag: NO
X-Spam-Level: 
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

Checking expected refcounts or dirtiness has no need for the i_pages
xarray lock.

Page cache lookups are generally done locklessly, only requiring the RCU
lock and folio_try_get(). This makes it so refcount stability isn't
guaranteed under the i_pages lock.

Testing for dirtiness is in no way excluding anything with the i_pages
lock. Rather, the folio lock plays a more important role here.

Thus, move this logic into collapse_isolate_folio(), without the lock.

Signed-off-by: Pedro Falcato <pfalcato@suse.de>
---
 mm/khugepaged.c | 93 ++++++++++++++++++++++---------------------------
 1 file changed, 42 insertions(+), 51 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 1e58ae5b3e74..accd8b4895d3 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2404,13 +2404,53 @@ static enum scan_result collapse_isolate_folio(struct collapse_file_state *state
 
 	if (!filemap_release_folio(folio, GFP_KERNEL)) {
 		result = SCAN_PAGE_HAS_PRIVATE;
-		folio_putback_lru(folio);
-		goto out_unlock;
+		goto out_putback;
 	}
 
 	if (folio_mapped(folio))
 		try_to_unmap(folio, TTU_IGNORE_MLOCK | TTU_BATCH_FLUSH);
+	/*
+	 * We control 2 + nr_pages references to the folio:
+	 *  - we hold a pin on it;
+	 *  - nr_pages reference from page cache;
+	 *  - one from lru_isolate_folio;
+	 * If those are the only references, then any new usage
+	 * of the folio will have to fetch it from the page
+	 * cache. That requires locking the folio to handle
+	 * truncate, so any new usage will be blocked until we
+	 * unlock folio after collapse/during rollback.
+	 */
+	if (folio_ref_count(folio) != 2 + folio_nr_pages(folio)) {
+		result = SCAN_PAGE_COUNT;
+		goto out_putback;
+	}
+
+	/*
+	 * At this point, the folio is locked and unmapped. If the PTE
+	 * was dirty, try_to_unmap() has transferred the dirty bit to
+	 * the folio and we must not collapse it into a clean
+	 * file-backed folio.
+	 *
+	 * If the folio is clean here, no one can write it until we
+	 * drop the folio lock. A write through a stale TLB entry came
+	 * from a clean PTE and must fault because the PTE has been
+	 * cleared; the fault path has to take the folio lock before
+	 * installing a writable mapping. Buffered write paths also
+	 * have to take the folio lock before modifying file contents
+	 * without a mapping, typically via write_begin_get_folio().
+	 */
+	if (!state->is_shmem && folio_test_dirty(folio)) {
+		result = SCAN_PAGE_DIRTY_OR_WRITEBACK;
+		goto out_putback;
+	}
 	return SCAN_SUCCEED;
+out_putback:
+	/*
+	 * The folio may have been unmapped with TTU_BATCH_FLUSH.
+	 * Flush before releasing the lock and our last reference.
+	 */
+	try_to_unmap_flush();
+	folio_putback_lru(folio);
 out_unlock:
 	folio_unlock(folio);
 	folio_put(folio);
@@ -2545,60 +2585,11 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 		xas_lock_irq(&xas);
 		VM_BUG_ON_FOLIO(folio != xa_load(xas.xa, index), folio);
 
-		/*
-		 * We control 2 + nr_pages references to the folio:
-		 *  - we hold a pin on it;
-		 *  - nr_pages reference from page cache;
-		 *  - one from lru_isolate_folio;
-		 * If those are the only references, then any new usage
-		 * of the folio will have to fetch it from the page
-		 * cache. That requires locking the folio to handle
-		 * truncate, so any new usage will be blocked until we
-		 * unlock folio after collapse/during rollback.
-		 */
-		if (folio_ref_count(folio) != 2 + folio_nr_pages(folio)) {
-			result = SCAN_PAGE_COUNT;
-			xas_unlock_irq(&xas);
-			folio_putback_lru(folio);
-			goto out_unlock;
-		}
-
-		/*
-		 * At this point, the folio is locked and unmapped. If the PTE
-		 * was dirty, try_to_unmap() has transferred the dirty bit to
-		 * the folio and we must not collapse it into a clean
-		 * file-backed folio.
-		 *
-		 * If the folio is clean here, no one can write it until we
-		 * drop the folio lock. A write through a stale TLB entry came
-		 * from a clean PTE and must fault because the PTE has been
-		 * cleared; the fault path has to take the folio lock before
-		 * installing a writable mapping. Buffered write paths also
-		 * have to take the folio lock before modifying file contents
-		 * without a mapping, typically via write_begin_get_folio().
-		 */
-		if (!is_shmem && folio_test_dirty(folio)) {
-			result = SCAN_PAGE_DIRTY_OR_WRITEBACK;
-			xas_unlock_irq(&xas);
-			folio_putback_lru(folio);
-			goto out_unlock;
-		}
-
 		/*
 		 * Accumulate the folios that are being collapsed.
 		 */
 		list_add_tail(&folio->lru, &pagelist);
 		index += folio_nr_pages(folio);
-		continue;
-out_unlock:
-		/*
-		 * The folio may have been unmapped with TTU_BATCH_FLUSH.
-		 * Flush before releasing the lock and our last reference.
-		 */
-		try_to_unmap_flush();
-		folio_unlock(folio);
-		folio_put(folio);
-		goto xa_unlocked;
 	}
 
 xa_locked:
-- 
2.56.0

