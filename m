Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793671662;
	b=08KcsL1ncflPEz+7aPyhgtF6q3A4HgggxtTaYJbCdN9Juhm7IDQ+RPRCEdNNKecFo9z/
	 1r8cwnWPdUPPUqnWYq0nEM0+fzo3Ymcsu16VU0i2x5qQDINeZLvXxHsrQM1uNEwsfw2vG
	 J5T3GchdfQka5MwT8fqD7rdblFm3zt3dPNKWg7sSWnVTsyJOPh5OhLMBVpL/GNeLYXWhX
	 bA/c0vaXAMNw9SQCCUDcEbe04PGSVyndUxq+nfcZYTYEbUvR2QdtcJNMc2L22Hk2xJ1Pw
	 UT6xGIA60s6/vlFfCFvRfXaYNoyfgJ3vHdR3l/0dSpwH28IQvCstgWx3rAdkj1QACZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793671662;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=UCNW70wWpSOTe+qYE8btjgaS6NPKbF5U87PIw6GRK5A=;
	b=RUAfpjRX/qoztJToFlt+vPOmSeRQavXOLVM9HWYxJ4jwaIBKguph/CdBSBANJQQWhsCc
	 SC0G9/TvX46m1vrm94HGZflJgpP3aQXT8moJev3bWCeOiCqVK51EOSwYEtbubIm5qwM05
	 9WXK7qLdjrS3NbFszW1Whn/3OxuYVOCzWTdtFkx8vdKjePX1YEEHRyYlKDD3dwE3kDgOX
	 MX4EoDZuA8YhAL5akV1+pkteDNw2LQCVOhTpb+yWnmeCaZKesj7VFXju+qJeBncRtta8b
	 i1uP61mmcWId6FqiXfSJ6gqOfRY674FEAnRRQTWkxopukA3EQ9lSR8j5tjD2QC4Ux8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CALEGwdc;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F764606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F764606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CALEGwdc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=UCNW70wWpSOTe+qYE8btjgaS6NPKbF5U87PIw6GRK5A=; b=CALEGwdcQDVbA73bpGaOuE67Qg
	k0OuzbETTSvvki/bgzXs+kXGUIY8LcKWUhQqaVM4FdqBiB2DXo7hZgbwGLyJxH1A0YFPW1NzLcFz3
	r5fDIf6UfB6PTla1NaMBjqsGz1zSlc2hdqvLVqkHX9fYrqqhp5kfRmvV0JlkNyBoWxpM5ZM559/52
	i+mth+Brijk152leS4KzvwT5+qXbLhKnib/B4TfYqnbMKEtbU86v0XMBig8+4Q5AutaFjyqhjBdv2
	rIk4WVJCzsvsVjiNCh+I94vG3rK171dNbD9BfJUabV08jOBUI2XLjrd4ZApRO71Ly7i9QBifpPmBW
	rFHieI/g==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3vt-00000000qsM-3jKy;
	Tue, 03 Nov 2026 02:07:38 +0000
From: "Liam R. Howlett (Google)" <liam@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	maple-tree@lists.infradead.org,
	Lorenzo Stoakes <ljs@kernel.org>,
	Chris Mason <mason@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	"Liam R. Howlett (Google)" <liam@infradead.org>
Subject: [PATCH v2 0/3] maple_tree fixes for 7.3
Date: Mon,  2 Nov 2026 21:07:21 -0500
Message-ID: <20261103020724.2614498-1-liam@infradead.org>
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

With CONFIG_DEBUG_MAPLE_TREE, MT_WARN_ON() and the other WARN macros
print the tree and call dump_stack() rather than WARN(), so syzbot never
sees them.  Patch 3 makes them WARN once per call site, after the dump,
and makes the BUG macros BUG() after theirs.  The userspace tests make
WARN() fatal to keep failing as they did on dump_stack().

Changes since v1:
- Drop rhashtable patch.  It is still undecided and will go to linux-crypto
- A reverse walk from index 0 returned the new root entry a second time;
  fixed and tested (Andrew's review bot)
- Fixes tags point at the commits that introduced the problems
- The WARN macros' once state is reset by clear_warn_once
- WARN() is fatal in maple-shared.h (Lorenzo); the maple test exits
  non-zero on a failure

Liam R. Howlett (Google) (3):
  maple_tree: Fix rcu reader NULL dereference after the tree is emptied
  maple_tree: Test emptying tree while RCU reading
  maple_tree: Update internal warning and bug_on code

 include/linux/maple_tree.h          |  48 ++++----
 lib/maple_tree.c                    | 112 ++++++++++++++-----
 lib/test_maple_tree.c               | 165 ++++++++++++++++++++++++++++
 tools/testing/radix-tree/maple.c    |  13 ++-
 tools/testing/shared/maple-shared.h |  33 ++++++
 5 files changed, 316 insertions(+), 55 deletions(-)

-- 
2.47.3

