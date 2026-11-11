Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419487;
	b=1ToBoAbWmN9fYdNglv1Y+2RKG426tcRINvRsNa3Gve6AstzOPdWyPj6OyPL6vbTyG4nB
	 K0K530nO9fG1QhWqtmJj+0bdpq88VVdOgP2Gf3i1CfWXkUrEGI2vy1/6t+01LUqmQYIgA
	 mfEnYWiRDnVOPUle7iNTbgfwm5gIFlDVGCm3dMBMuP0pwIt+OzLXJ3WcczGyN2skYvZOu
	 NNSLUFfiP3RXuLDt/HQ+S5KV5CJG+mj0mUOkU+Vy53MR6qXy/1d4bGpASAqp1RapNXOAK
	 IsnhqrFdfILqJvidYaZgePmcHvGGkOGFw8C6kRnhsDJ0CNB7c6J16yq7203EZAPdMmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419487;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=kNvahHNr+ZnzS6BVqxpaB44fT0M1MamccoIc3pC6eE4=;
	b=1eYDTxpCDjVEIAzf/WGpP+PypNTXtUmNgJdLvmEKutw9MDnlwofFMscdnl4VD9UCBqSd
	 iBw+Rh6cBWg+lGV+5qddsci8vXHNdJp51oIeUZ5klOwooaHlsXmA2SfbQoaSMaYenisHo
	 Y4/wfcQp25FOhTiau+jq0da11yXpcyGDoWRuvlS4+cDJKcYsMm4CvxB9QAjhr4Tm64K7e
	 B1HmuPffZnJPlPPJueChURMyIABrA35m7bDf/BbpFfg2MWGiYeDnAKfMB8OK/su8YoyS4
	 wxJ8ZYD4RkrOgRraG2D9+cn/xOj3yBRZE6CZvebpYLWeyzI7Wb/AD8I5BWeWXSDcJKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tootLfOq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hIqtQddj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tootLfOq;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hIqtQddj;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B173D606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B173D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tootLfOq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hIqtQddj;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tootLfOq;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hIqtQddj
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6D3581F45A;
	Wed, 11 Nov 2026 17:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794419484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kNvahHNr+ZnzS6BVqxpaB44fT0M1MamccoIc3pC6eE4=;
	b=tootLfOq6n+huT/L0wPFtVc9Cr37kH/3CByuKhioM9XtkQVUn2upi819BxHqSKE+/LluF1
	qU0osjk6nzn+JsznB6gTAg8bFQqMfPf+Yzmn/F0JUX1SmvBUgJGG3x06/L4+WbYSmqTe2E
	xrVTRbRxEpvMd/UhAJIADVa5QZTFJN8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794419484;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kNvahHNr+ZnzS6BVqxpaB44fT0M1MamccoIc3pC6eE4=;
	b=hIqtQddjhDYyd/etrvpeoXmab+twE6gMqWJKKg9qhdzq9i45GpZfcUAUbH0CY7trU5VAia
	FtxH4wE8vKmocAAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794419484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kNvahHNr+ZnzS6BVqxpaB44fT0M1MamccoIc3pC6eE4=;
	b=tootLfOq6n+huT/L0wPFtVc9Cr37kH/3CByuKhioM9XtkQVUn2upi819BxHqSKE+/LluF1
	qU0osjk6nzn+JsznB6gTAg8bFQqMfPf+Yzmn/F0JUX1SmvBUgJGG3x06/L4+WbYSmqTe2E
	xrVTRbRxEpvMd/UhAJIADVa5QZTFJN8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794419484;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kNvahHNr+ZnzS6BVqxpaB44fT0M1MamccoIc3pC6eE4=;
	b=hIqtQddjhDYyd/etrvpeoXmab+twE6gMqWJKKg9qhdzq9i45GpZfcUAUbH0CY7trU5VAia
	FtxH4wE8vKmocAAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5B8261339F;
	Wed, 11 Nov 2026 17:51:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +SJmCxur9GphXQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 11 Nov 2026 17:51:23 +0000
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
Subject: [PATCH v2 0/8] mm/khugepaged: collapse_file() cleanups
Date: Wed, 11 Nov 2026 17:51:13 +0000
Message-ID: <20261111175121.1328383-1-pfalcato@suse.de>
X-Mailer: git-send-email 2.56.0
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
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,arm.com:email,linux.dev:email]
X-Spam-Score: -11.80
X-Spam-Level: 
X-Spam-Flag: NO

Here are a bunch of cleanups for collapse_file() that attempt to aid
code readability and understanding. This is part 1 out of N, and only
attempts to address the main collapse loop. The exit path is still a
mess but I figure it's much easier to review if I send this batch as-is,
versus sending the whole thing.

Tested using the khugepaged shmem and file selftests.

Based on top of latest mm-core/for-next.

Note that some review comments from v1 went unaddressed
(Nico's larger restructuring, some small Lorenzo suggestions) for a couple
of small reasons. The main one being that I want to get this v2 out before
going insane :)) I agreed to work with Nico, and I'll either send out some
of his patches as a followup, or he will.

In any case, I'm tired of this function and I hope this kicks off some
discussion :)

Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <liam@infradead.org>
Cc: Nico Pache <nico.pache@linux.dev>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>
Cc: Usama Arif <usama.arif@linux.dev>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org

Changes in v2:
- Rebased on current mm-core/for-next, which contains a number of fixes to
  the amazingly simple and awesome collapse_file() function.
- Fix the "bad unlock balance" reported by syzbot ci (syzbot ci, Lorenzo)
- 1/8:
  - Fold in v1 5/8 (kerneldoc); new helpers get their kerneldoc in
    the patch that introduces them. (Lorenzo)
  - Group the input fields of collapse_file_state and make end and
    is_shmem const; is_shmem is now a bool. (Lorenzo)
  - Wrap the prepare_collapse_file_folio() declaration to fit in 80
    columns. (Lorenzo)
  - Keep the original LRU drain behaviour (drain only after a
    successful shmem_get_folio()) (Lorenzo)
- 2/8: New patch. Turn value entries into NULL before calling
  prepare_collapse_file_folio().
- 3/8 (v1 2/8):
  - Rename collapse_read_folio() to maybe_read_folio(). (Lorenzo)
  - Replace the compound condition with an early-return guard.
    (Lorenzo)
  - Comment on why the xa_lock is dropped. (Lorenzo)
  - Expand the commit message. (Lorenzo)
- 5/8 (v1 4/8): Drop a duplicate blank line.
- 6/8: Add a commit message, noting that errors before try_to_unmap()
  no longer call try_to_unmap_flush() themselves.
- 7/8: Explain in the commit message why the refcount and dirty checks
  don't need the i_pages lock. The flush added by 854e5ff8b3ce now
  happens at out_putback.
- 8/8: Retitle (drop "fix"), since 854e5ff8b3ce already reworded the
  comment; drop a stray blank line.

  Link to v1: https://lore.kernel.org/all/20260720142913.846902-1-pfalcato@suse.de/

Pedro Falcato (8):
  mm/khugepaged: separate out windy folio logic from collapse_file
  mm/khugepaged: sanitize the folio passed to file folio collapse logic
  mm/khugepaged: factor out page cache folio reading
  mm/khugepaged: factor out and simplify dirty/writeback handling
  mm/khugepaged: simplify prepare folio locking and exit paths
  mm/khugepaged: hoist isolation into collapse_isolate_folio()
  mm/khugepaged: hoist more code into collapse_isolate_folio()
  mm/khugepaged: flesh out try_to_unmap_flush() comment

 mm/khugepaged.c | 461 ++++++++++++++++++++++++++++++------------------
 1 file changed, 286 insertions(+), 175 deletions(-)


base-commit: 8d21e3d3faf19f461f6d0380fe8a1f5bdba97f25
-- 
2.56.0

