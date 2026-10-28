Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202162;
	b=RioBGX/eZRvhBgpK47jdKZUoswZ8/IC15K8vZzgKi0FCgoOcAfyXFKQ+mfPel+W5tJp/
	 eCCcMIacUGIdNg9iLCmJqRnaXNQ+rM9+JX9NKXhayCLIX8WlkJgFoL84PKcxrWGawRD13
	 eahRCei9lBjUJ/ywzTV5qRvEcaPLtxKJC0biWYrBPdzu00o3PhcJqu4JmbdFb0hWUZ2Zu
	 VvBLFBEa8JiOaqkQnJyR27MFpxa9hSCMYCbZ9arkZhkb2SlJCVUiRiYyvSViGoDK78H8T
	 tVHZxynLmGDQrzJNIy+pFO95NQV4FmmZKBep9u37fnEiRS+VY1ONBczr+yc0wNa6sOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202162;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pUgYjIVsfvmVUNs8qB5suwB5TeHvRpiFHFLqpx4meZQ=;
	b=hJRK67fVhJ1EupeL/uj7ETsqAD9vbWSXN3tpf1UxsYijlH1Np1S1fkKBdio8NV5GwhL1
	 /1vKKsU2S87yxQZk/K9Mo5oPP55mdbb8x+byDMHnEhJPCpnBUeM26gFWKs4Hfqv3G/MbO
	 9dKtvqBXICtBI60CDnlZd6xr7+miS3JnEArQwGqkQWY/HLaLSIqi1yRgJxktTDcSJqrGM
	 ns1LIpQ4/TzCYyplGMd/Ca1uTMJjzrJqaKHTVgHop7ajHCljyUWpJ4XvEMCoIfRcryyta
	 l5kGY9NRjuQtr0af/C755AZKbafyBB4JiZVIs/3mrQUB2uWupApl2cNKsTX6B/uKQuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AQfeeYHM;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1891B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1891B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AQfeeYHM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=pUgYjIVsfvmVUNs8qB5suwB5TeHvRpiFHFLqpx4meZQ=; b=AQfeeYHMMGo4hJeHsYDE+/Kusv
	OnaEzLdR9C+ACTkeOsiq7LVtyMAXQi7lbkAZRV+QxsHIHLWKLAN3LEIUyC+2ANqDS5SDv2gYpXo/b
	qQMW15ulGnGRtJ1mKdrJAiAbJqAnw9PoxmH7JS0/ljjAYF3mQKZ6GxmU1KtMbcUGqqreLNqb7EjWh
	/tsZKRTbOMl41HHOkW6CWm2zWqzkMiqrKilPDviKvDXX8QImKukI1Ow3UoD87CtEOAbwByhSSAaWN
	6EuhEupnu6nUGSkcpBH9M5BjT/jS2V9YdDlzw+8m/N1bdKv2dm9Etw0U84Xs/mJfGKWkOTsTqjSvN
	BhZCo9eQ==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5nU-00000007Qmm-1fQb;
	Wed, 28 Oct 2026 15:42:40 +0000
From: "Liam R. Howlett (Google)" <liam@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Graf <tgraf@suug.ch>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	maple-tree@lists.infradead.org,
	Lorenzo Stoakes <ljs@kernel.org>,
	Chris Mason <mason@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	"Liam R. Howlett (Google)" <liam@infradead.org>
Subject: [PATCH 0/4] Lib fixes for 7.3
Date: Wed, 28 Oct 2026 11:42:14 -0400
Message-ID: <20261028154218.1668182-1-liam@infradead.org>
X-Mailer: git-send-email 2.47.3
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

Two bugs found by an LLM review, and one problem Lorenzo Stoakes
reported off list.

An RCU reader that restarts after its node dies can dereference NULL if
the tree was emptied, or holds a single entry in the root pointer.
Patch 1 fixes it and patch 2 adds a test.

rhashtable can deadlock when an insert in atomic context grows the
table: the rehash may call vmalloc(), which takes locks that are not
safe against interrupts.  Patch 3 keeps non-blocking callers on
kmalloc() or a nested table.

With CONFIG_DEBUG_MAPLE_TREE, MT_WARN_ON() and the other WARN macros
print the tree and call dump_stack() rather than WARN(), so syzbot never
sees them.  Patch 4 makes them WARN once per call site, after the dump,
and makes the BUG macros BUG() after theirs.

Chris Mason (1):
  rhashtable: fix vmalloc() deadlock in atomic rehash

Liam R. Howlett (Google) (3):
  maple_tree: Fix rcu reader NULL dereference after the tree is emptied
  maple_tree: Test emptying tree while RCU reading
  maple_tree: Update internal warning and bug_on code

 include/linux/maple_tree.h |  54 +++++++++-------
 lib/maple_tree.c           | 110 +++++++++++++++++++++++--------
 lib/rhashtable.c           |  18 +++++-
 lib/test_maple_tree.c      | 129 +++++++++++++++++++++++++++++++++++++
 4 files changed, 257 insertions(+), 54 deletions(-)

-- 
2.47.3

