Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419492;
	b=P2b9+TSknxekpv6BCqr8ZXgrjU5bklyV2IONBcKTsS6fBsewYBp6hH3fpqhb/+QRUj+V
	 0UCAd28sI/gerEKj7c7yVyNHYlAUd3Ru56dNSc1H6yKyQy2BK5Vyx865q/vrLkklYoLQx
	 HGXmaZVTVlDApGn0ml8IW33ZDJSQUXsAFdD2wSoGTVix+StxOdm9EqCNv3FphSghYRTxK
	 5oa5ZSUYoV1sUB8liaoH4bTJ5vzpo2223Dn7IeveGXDBQnx/OvtCiL9NjeGSWN/X6vwTG
	 0T+mCWrpEcKbMjcuDrC2quOMu5JvpH+uZMJoUYI6IBw4o5Q90D4gY6FGu3dxBoEsJdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419492;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:X-Spamd-Result:
	 X-Spam-Score;
	bh=Lf6sqlY3+yAB952Y5PD4ErVl0pHq5ivSfG0Vn36FN/4=;
	b=nbflHpP7aSOywjXQxEZp9vkp2V3jC77gXMKAkcboZrujyu0tV7PCSqic1q62bQURg4UH
	 maiWKndCX7qAvBeVR/0Lued7OHDjNnEPdYXmOIn/4kW5Wc70cJNN3g0UUt1PRk2VURoGw
	 cA1yL4+n8USjvHyoIIVCJdvMuWGB22GWUHZU2j7jQjwPBR+5m4Raa2urz29bv7aUPwZqS
	 fcOM1aBNJEdGZFPOB5aA6tMMODaKjTm+8zWps2levXXctnh4KzfVJEHwtrgjz8C/GeJcZ
	 +n4Q9N5gGwXuzB8eRVQmZ46ExGuDUlUBc8IJLIN8PTrCl6056u4k+4YdW7+/tjTwVgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=C1ALzjpG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=m44ZE1oZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=C1ALzjpG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=m44ZE1oZ;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1976C606A8BA
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1976C606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=C1ALzjpG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=m44ZE1oZ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=C1ALzjpG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=m44ZE1oZ
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8EDAD21E4E;
	Wed, 11 Nov 2026 17:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794419490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lf6sqlY3+yAB952Y5PD4ErVl0pHq5ivSfG0Vn36FN/4=;
	b=C1ALzjpGwF711mMV3rEPudZhADVNmSEPTWLYjqJIwXh+gpdz+01NSo2UuizdXUSsk6lS4h
	eyJMe3uQYg/1OacEVhzTxH8YneXgsdkMJKdlyVJK02tjBxwIwCzF5b0BSgqvV6ZIpH+n6r
	67QpeWLSSFijLxtAQT/cw6MuM7VCp+Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794419490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lf6sqlY3+yAB952Y5PD4ErVl0pHq5ivSfG0Vn36FN/4=;
	b=m44ZE1oZE1IM3Lqk8qPYxIFReIICotQUlw5cNiZDazgquvJ7On9Y+004BAsv7MRUvAJRIj
	coOIWJqIl2xWnLBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794419490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lf6sqlY3+yAB952Y5PD4ErVl0pHq5ivSfG0Vn36FN/4=;
	b=C1ALzjpGwF711mMV3rEPudZhADVNmSEPTWLYjqJIwXh+gpdz+01NSo2UuizdXUSsk6lS4h
	eyJMe3uQYg/1OacEVhzTxH8YneXgsdkMJKdlyVJK02tjBxwIwCzF5b0BSgqvV6ZIpH+n6r
	67QpeWLSSFijLxtAQT/cw6MuM7VCp+Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794419490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lf6sqlY3+yAB952Y5PD4ErVl0pHq5ivSfG0Vn36FN/4=;
	b=m44ZE1oZE1IM3Lqk8qPYxIFReIICotQUlw5cNiZDazgquvJ7On9Y+004BAsv7MRUvAJRIj
	coOIWJqIl2xWnLBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 80B541339F;
	Wed, 11 Nov 2026 17:51:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +SJmCxur9GphXQAAD6G6ig:T7
	(envelope-from <pfalcato@suse.de>); Wed, 11 Nov 2026 17:51:29 +0000
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
Subject: [PATCH v2 6/8] mm/khugepaged: hoist isolation into collapse_isolate_folio()
Date: Wed, 11 Nov 2026 17:51:19 +0000
Message-ID: <20261111175121.1328383-7-pfalcato@suse.de>
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

Move unwindy folio isolation logic from the main loop to
collapse_isolate_folio().

As a small side effect, try_to_unmap_flush() is no longer called for
errors prior to try_to_unmap(). This should be fine as there are other
mechanisms in place to flush it before references/locks are dropped.

Aside from that, no functional changes intended.

Signed-off-by: Pedro Falcato <pfalcato@suse.de>
---
 mm/khugepaged.c | 118 +++++++++++++++++++++++++++---------------------
 1 file changed, 66 insertions(+), 52 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 236df9be7e27..1e58ae5b3e74 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2354,6 +2354,69 @@ prepare_collapse_file_folio(pgoff_t index, struct collapse_file_state *state)
 	return result;
 }
 
+static enum scan_result collapse_isolate_folio(struct collapse_file_state *state)
+{
+	struct folio *folio = state->folio;
+	enum scan_result result;
+
+	/*
+	 * The folio must be locked, so we can drop the i_pages lock
+	 * without racing with truncate.
+	 */
+	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
+
+	/* make sure the folio is up to date */
+	if (unlikely(!folio_test_uptodate(folio))) {
+		result = SCAN_FAIL;
+		goto out_unlock;
+	}
+
+	/*
+	 * If file was truncated then extended, or hole-punched, before
+	 * we locked the first folio, then a THP might be there already.
+	 * This will be discovered on the first iteration.
+	 */
+	if (is_pmd_order(folio_order(folio))) {
+		result = SCAN_PTE_MAPPED_HUGEPAGE;
+		goto out_unlock;
+	}
+
+	if (folio_mapping(folio) != state->mapping) {
+		result = SCAN_TRUNCATED;
+		goto out_unlock;
+	}
+
+	if (!state->is_shmem && (folio_test_dirty(folio) ||
+				 folio_test_writeback(folio))) {
+		/*
+		 * khugepaged only works on clean file-backed folios,
+		 * so this folio is dirty because it hasn't been flushed
+		 * since first write.
+		 */
+		result = SCAN_PAGE_DIRTY_OR_WRITEBACK;
+		goto out_unlock;
+	}
+
+	if (!folio_isolate_lru(folio)) {
+		result = SCAN_DEL_PAGE_LRU;
+		goto out_unlock;
+	}
+
+	if (!filemap_release_folio(folio, GFP_KERNEL)) {
+		result = SCAN_PAGE_HAS_PRIVATE;
+		folio_putback_lru(folio);
+		goto out_unlock;
+	}
+
+	if (folio_mapped(folio))
+		try_to_unmap(folio, TTU_IGNORE_MLOCK | TTU_BATCH_FLUSH);
+	return SCAN_SUCCEED;
+out_unlock:
+	folio_unlock(folio);
+	folio_put(folio);
+	return result;
+}
+
 /**
  * collapse_file - collapse filemap/tmpfs/shmem pages into huge one.
  *
@@ -2474,61 +2537,12 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 		folio = state.folio;
 		if (result != SCAN_SUCCEED)
 			goto xa_unlocked;
-		/*
-		 * The folio must be locked, so we can drop the i_pages lock
-		 * without racing with truncate.
-		 */
-		VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
-
-		/* make sure the folio is up to date */
-		if (unlikely(!folio_test_uptodate(folio))) {
-			result = SCAN_FAIL;
-			goto out_unlock;
-		}
 
-		/*
-		 * If file was truncated then extended, or hole-punched, before
-		 * we locked the first folio, then a THP might be there already.
-		 * This will be discovered on the first iteration.
-		 */
-		if (is_pmd_order(folio_order(folio))) {
-			result = SCAN_PTE_MAPPED_HUGEPAGE;
-			goto out_unlock;
-		}
-
-		if (folio_mapping(folio) != mapping) {
-			result = SCAN_TRUNCATED;
-			goto out_unlock;
-		}
-
-		if (!is_shmem && (folio_test_dirty(folio) ||
-				  folio_test_writeback(folio))) {
-			/*
-			 * khugepaged only works on clean file-backed folios,
-			 * so this folio is dirty because it hasn't been flushed
-			 * since first write.
-			 */
-			result = SCAN_PAGE_DIRTY_OR_WRITEBACK;
-			goto out_unlock;
-		}
-
-		if (!folio_isolate_lru(folio)) {
-			result = SCAN_DEL_PAGE_LRU;
-			goto out_unlock;
-		}
-
-		if (!filemap_release_folio(folio, GFP_KERNEL)) {
-			result = SCAN_PAGE_HAS_PRIVATE;
-			folio_putback_lru(folio);
-			goto out_unlock;
-		}
-
-		if (folio_mapped(folio))
-			try_to_unmap(folio,
-					TTU_IGNORE_MLOCK | TTU_BATCH_FLUSH);
+		result = collapse_isolate_folio(&state);
+		if (result != SCAN_SUCCEED)
+			goto xa_unlocked;
 
 		xas_lock_irq(&xas);
-
 		VM_BUG_ON_FOLIO(folio != xa_load(xas.xa, index), folio);
 
 		/*
-- 
2.56.0

