Received: from danaos.cslab.ece.ntua.gr (danaos.cslab.ece.ntua.gr [147.102.3.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3705B480353
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.102.3.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204927; cv=none; b=QG7/aGf5dM51cKRlH70BQDUitL0H/DsVe2XYXj7Cp78CN2kVNYOGnMOHtTNqzFR+zB+YKrk9riU8puvDMwfrGONvsuy+u1GHAYdaLU9sM9mov/sghsWb7BkvRRDj5amRkovyVbrcqlSovT7uyDxkDsdEELtt8UZfFtx0TAXrk6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204927; c=relaxed/simple;
	bh=Ar0z0+alqyvvWJZL6lxOGlhOZBgSDcNzH0BkqwPUC4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dhgfEiKIfqBncQdHS2SKkRnqyJn/5XAu/29X12tLGW2t9nrLf4b2OQbAjwyAWbzyaFjSEqcDXfDbRRbd4IEE9qqHnZqyGDo+VysyrhIoXWttqxWFaCx7teDD+d0WffMbVJ2g4VPqneAOgpU35FKGB5T+rYYiI+O+4j5jZ8mol+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cslab.ece.ntua.gr; spf=pass smtp.mailfrom=cslab.ece.ntua.gr; dkim=pass (1024-bit key) header.d=cslab.ece.ntua.gr header.i=@cslab.ece.ntua.gr header.b=Qk3H8B7y; arc=none smtp.client-ip=147.102.3.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cslab.ece.ntua.gr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cslab.ece.ntua.gr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cslab.ece.ntua.gr header.i=@cslab.ece.ntua.gr header.b="Qk3H8B7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cslab.ece.ntua.gr;
	s=smtp-cslab; t=1791204480;
	bh=Ar0z0+alqyvvWJZL6lxOGlhOZBgSDcNzH0BkqwPUC4M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Qk3H8B7y2LHxrqbe41B/4T2Gm25AnI8Qhiv3olkEVMSls9BDv6OBmMYB89DBfhGeY
	 ewea/7CBB2kgYcsGsjz7ako9NGE0IaibJyTVEC7WbV3OIpXClHRkGP100rymvwyHOn
	 KmmF+/Uw69EAVhwmiL+eZNhUMx4bss7O0kw0SLYs=
Received: from [127.0.0.1] (armor.cslab.ece.ntua.gr [147.102.4.33])
	by danaos.cslab.ece.ntua.gr (Postfix) with ESMTPSA id 12922120B35;
	Mon,  5 Oct 2026 15:48:00 +0300 (EEST)
From: Dimitris Charisis <dchar@cslab.ece.ntua.gr>
Date: Mon, 05 Oct 2026 12:47:28 +0000
Subject: [PATCH v3 2/2] test_maple_tree: test maple_range_64 node in RCU
 mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-fix-maple-tree-range64-rcu-v3-2-ebe7fb278e20@cslab.ece.ntua.gr>
References: <20261005-fix-maple-tree-range64-rcu-v3-0-ebe7fb278e20@cslab.ece.ntua.gr>
In-Reply-To: <20261005-fix-maple-tree-range64-rcu-v3-0-ebe7fb278e20@cslab.ece.ntua.gr>
To: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Alice Ryhl <aliceryhl@google.com>, 
 Andrew Ballance <andrewjballance@gmail.com>, 
 Suren Baghdasaryan <surenb@google.com>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Dimitris Charisis <dchar@cslab.ece.ntua.gr>
X-Mailer: b4 0.14.2

This commit adds a test that builds two maple_range_64 trees in RCU
mode.  The first tree has a root that is a full maple_range_64 node and
ensures that the destruction under RCU does not misinterpret the last
slot as metadata. 226 insertions produce such a root on a 64-bit build.

The second tree is a height 3 tree whose root holds 15 child pointers
and metadata in its last slot, so every slot is non-zero and ensures
that the destruction under RCU does not descend into the metadata slot.
3166 insertions produce such a tree on a 64-bit build.

Signed-off-by: Dimitris Charisis <dchar@cslab.ece.ntua.gr>
---
 lib/test_maple_tree.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/lib/test_maple_tree.c b/lib/test_maple_tree.c
index b9367c61e8b50d107ab972fc5222fb6a531fad87..fb40e193a3cb76f0eb02af3aa4a38630692a4a9b 100644
--- a/lib/test_maple_tree.c
+++ b/lib/test_maple_tree.c
@@ -3710,6 +3710,36 @@ static noinline void __init alloc_cyclic_testing(struct maple_tree *mt)
 	MT_BUG_ON(mt, ret != 1);
 }
 
+static noinline void __init check_range64_in_rcu(struct maple_tree *mt)
+{
+	unsigned long i;
+	unsigned long nr_entries = 226; /* Build a full maple_range_64 root node */
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
+}
+
 static DEFINE_MTREE(tree);
 static int __init maple_tree_seed(void)
 {
@@ -3999,6 +4029,8 @@ static int __init maple_tree_seed(void)
 	alloc_cyclic_testing(&tree);
 	mtree_destroy(&tree);
 
+	check_range64_in_rcu(&tree);
+
 
 #if defined(BENCH)
 skip:

-- 
2.47.3

