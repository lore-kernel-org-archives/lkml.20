Received: from danaos.cslab.ece.ntua.gr (danaos.cslab.ece.ntua.gr [147.102.3.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEDA48A8A3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.102.3.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558765; cv=none; b=WAq5Wpn8pPbFB3Z8SkrBJCIjkfznUyC5cc/9+Ke7knFoPsexluBxd1Cag0W17u5JPduK1110rGYLtJmQJeiP0R2QV9cj+/l08GlmwWiUv3+tX+T7eHVQyNTK5rxGWZNqjIg0xzyJ42+B5OdMWRBReG8+txp8nOWndDR2c0KrW90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558765; c=relaxed/simple;
	bh=taknttCU6rJMJ8zwyv9vXK3jlIjsPKMRnLZRjFDfX5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GGe8QAtjMU5wtyDg6ieoyvEfNlKlh1CgjCzwsRRVXQSINxFGISpTkzgJzPW50ImxRA+hjZ1+NBBnpdWFh+1b9z7N65L+8u/FII1MMZQnGZdXHMQ7X6xImlfjOkIOJiOVs0Wx2ESxbGxlGuI/dbihTzp8CBMbRV8CKj+KfwoKF9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cslab.ece.ntua.gr; spf=pass smtp.mailfrom=cslab.ece.ntua.gr; dkim=pass (1024-bit key) header.d=cslab.ece.ntua.gr header.i=@cslab.ece.ntua.gr header.b=gHofv133; arc=none smtp.client-ip=147.102.3.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cslab.ece.ntua.gr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cslab.ece.ntua.gr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cslab.ece.ntua.gr header.i=@cslab.ece.ntua.gr header.b="gHofv133"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cslab.ece.ntua.gr;
	s=smtp-cslab; t=1789558744;
	bh=taknttCU6rJMJ8zwyv9vXK3jlIjsPKMRnLZRjFDfX5k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gHofv133TPvlF28+QEpcaM5JgD7JoZleuStXVi1KHcOLwqKyEa5RdlsZZijH0/hzi
	 vkcqb/cTlti/McA1gqgIZT4VB9hPkgpKuf8VD+/+Gn9Lrt/G0Px87DFavqMyfUDLG0
	 ieXEKDd1DCFTaVa6Ly9TVv2+QyThQdan3ZewjYso=
Received: from [127.0.0.1] (armor.cslab.ece.ntua.gr [147.102.4.33])
	by danaos.cslab.ece.ntua.gr (Postfix) with ESMTPSA id 282A9120BFD;
	Wed, 16 Sep 2026 14:39:04 +0300 (EEST)
From: Dimitris Charisis <dchar@cslab.ece.ntua.gr>
Date: Wed, 16 Sep 2026 11:38:45 +0000
Subject: [PATCH v2 4/4] test_maple_tree: test a maple_range_64 metadata
 slot in RCU mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-fix-maple-tree-range64-rcu-v2-4-0b09de37eb69@cslab.ece.ntua.gr>
References: <20260916-fix-maple-tree-range64-rcu-v2-0-0b09de37eb69@cslab.ece.ntua.gr>
In-Reply-To: <20260916-fix-maple-tree-range64-rcu-v2-0-0b09de37eb69@cslab.ece.ntua.gr>
To: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Alice Ryhl <aliceryhl@google.com>, 
 Andrew Ballance <andrewjballance@gmail.com>, 
 Suren Baghdasaryan <surenb@google.com>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Dimitris Charisis <dchar@cslab.ece.ntua.gr>
X-Mailer: b4 0.14.2

Add a test that builds a height 3 tree whose root holds 15 child
pointers and metadata in its last slot, so every slot is non-zero.
Ensure the destruction under RCU does not descend into the metadata
slot. 3166 insertions produce such a tree on a 64-bit build.

Signed-off-by: Dimitris Charisis <dchar@cslab.ece.ntua.gr>
---
 lib/test_maple_tree.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/lib/test_maple_tree.c b/lib/test_maple_tree.c
index 461bb0e4816ef6e9c670018a13a88a0e5d0cf89e..fb40e193a3cb76f0eb02af3aa4a38630692a4a9b 100644
--- a/lib/test_maple_tree.c
+++ b/lib/test_maple_tree.c
@@ -3725,6 +3725,19 @@ static noinline void __init check_range64_in_rcu(struct maple_tree *mt)
 
 	mtree_destroy(mt);
 	rcu_barrier();
+
+	nr_entries = 3166; /* Height 3. Root has 15 children + metadata */
+
+	MT_BUG_ON(mt, !mtree_empty(mt));
+	mt_init_flags(mt, MT_FLAGS_USE_RCU);
+
+	for (i = 0; i < nr_entries; i++) {
+		MT_BUG_ON(mt, mtree_test_insert_range(mt, i*10, i*10 + 9,
+						      xa_mk_value(i)));
+	}
+
+	mtree_destroy(mt);
+	rcu_barrier();
 }
 
 static DEFINE_MTREE(tree);

-- 
2.47.3

