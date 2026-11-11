Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419488;
	b=TlHZW9uIVIx3o40ukcaSq9lXEajOc35zWrJOzgfnYK00xploZ3wOFDySMktiRJlM1amU
	 Bhf2yo3cBxPLG6yjfCIls2FDFNBecUHEG8R6v5tlvrNa9Pm1BJO9sEekgHv4Wq+BT6M1i
	 IC5xdwZEAxOim3lxh2BJuLvsGpHCKOdPDhhLuGBUPgoabYzbT76fQqcGSw1mU25CqWva0
	 Z95SrlkFrL4O+azxlyp7w9KLE1wLGgn1v7A+5AjqmRaxCPYWgkmx2rSB4s74vZAEZN3eh
	 0EfhlvyBlgEhmkjwmt00GxJ7QjzuispxcsAH9T8DdnlFVRN1JMhJElRQFrSv7A46/Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419488;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Server:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id:X-Rspamd-Pre-Result:X-Rspamd-Action;
	bh=xRMdRlOxbltCEqYlrFTaG1YeHSsYiY9ekiVfHPvc9XQ=;
	b=onWz3ods66ie9grk5UYCvAyfvwLY15mNay05Ziqm45jDkVK2i3hGMJH9VB+gyUThaabE
	 yixJp7y79a79eVCv0deM5N0aaHolo7OszwDPnMqymjJCI4IpTbOJOIjXceVrHcgqc5X7v
	 Mj3X2kMy8H3DNAch7XKTJuGaRTftlaZ8UX5EXqRwQtW+8uG0qXqPwd4H5x0zdAL5gLpHA
	 R5NLOAr3Qvv8eacvVI5Dd2Q49KuR4CKiTAsSHE3aBTTm5JpzMJrA4kFqdekAcTabHNOek
	 w8zrO7afLw2JAsYhNXV9/NYOwvWSYuw3H50M2frFux1/MYbNV4vrgSLjOtBVwP5Nzog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3FA606A336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D3FA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6F7F921E49;
	Wed, 11 Nov 2026 17:51:26 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 687061339F;
	Wed, 11 Nov 2026 17:51:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +SJmCxur9GphXQAAD6G6ig:T3
	(envelope-from <pfalcato@suse.de>); Wed, 11 Nov 2026 17:51:25 +0000
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
Subject: [PATCH v2 2/8] mm/khugepaged: sanitize the folio passed to file folio collapse logic
Date: Wed, 11 Nov 2026 17:51:15 +0000
Message-ID: <20261111175121.1328383-3-pfalcato@suse.de>
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
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Queue-Id: 6F7F921E49
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action

At that point, the folio (which is taken from the i_pages xarray
directly) can assume 3 different kinds of values:

1) NULL. This is the complete absence of value from the xarray.
2) An xa_value. This is generally a shadow entry in the page cache, or a
   swap entry in shmem page cache.
3) A real struct folio*.

This is confusing. Collapse NULL and xa_value into NULL right at the top
of the loop. Collapse logic generally doesn't care whether something is
fully absent, or whether there's some sort of underlying shadow entry.

This simplifies a bit of reading logic in prepare_collapse_file().
No functional change intended.

Signed-off-by: Pedro Falcato <pfalcato@suse.de>
---
 mm/khugepaged.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 0fe19acf470b..ac148db2a4a0 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2225,6 +2225,19 @@ struct collapse_file_state {
 	bool readahead_done : 1;
 };
 
+/**
+ * real_folio() - Convert a page cache folio * into a real folio *
+ * @folio: struct folio * to convert.
+ *
+ * Return: NULL if the passed folio is invalid (XA value, NULL), otherwise @folio.
+ */
+static inline struct folio *real_folio(struct folio *folio)
+{
+	if (!folio || xa_is_value(folio))
+		return NULL;
+	return folio;
+}
+
 /**
  * prepare_collapse_file_folio() - Prepare the collapsing of a single file folio
  * @index: folio index in the page cache
@@ -2249,7 +2262,7 @@ prepare_collapse_file_folio(pgoff_t index, struct collapse_file_state *state)
 	struct folio *folio = state->folio;
 
 	if (is_shmem) {
-		if (xa_is_value(folio) || !folio_test_uptodate(folio)) {
+		if (!folio || !folio_test_uptodate(folio)) {
 			xas_unlock_irq(state->xas);
 			/* swap in or instantiate fallocated page */
 			if (shmem_get_folio(mapping->host, index, 0,
@@ -2267,7 +2280,7 @@ prepare_collapse_file_folio(pgoff_t index, struct collapse_file_state *state)
 			goto xa_locked;
 		}
 	} else {	/* !is_shmem */
-		if (!folio || xa_is_value(folio)) {
+		if (!folio) {
 			state->do_readahead = !state->readahead_done;
 			result = SCAN_FAIL;
 			goto xa_unlocked;
@@ -2420,8 +2433,12 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 			continue;
 		}
 
-		/* At this point folio can be NULL, or a value. */
-		state.folio = folio;
+		/*
+		 * At this point folio can be a value. Make values NULL. The
+		 * value itself isn't interesting here. Collapse only cares
+		 * about the absence of a folio.
+		 */
+		state.folio = real_folio(folio);
 		result = prepare_collapse_file_folio(index, &state);
 		folio = state.folio;
 		if (result != SCAN_SUCCEED)
-- 
2.56.0

