Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793671664;
	b=g5RP3/IqPaWQQMLkj62/RUjQ5xuZfnnUPV9XFcuYpCNswIf4KyDM1bIb2S0l+4/T/jdL
	 cSIuvjsVZPFsRCuvFS1LbTJ72qD8hMCPn22rQRMOQfP/oM9gD3ikUnOxuHlqB+ynZkw7u
	 w7e46W17o9y9lUJzKC7jbyxAvyZ1409Zg4qzRMWHnAomq4H6fmevjQClJfU6M/s7Ib7iB
	 YGBD1f4LAIYXdTe6n4lZSPGtSnuSwcH2fY5Zk4J8BlNTBkChsxk4Q/+b6FWTiIJUs4G38
	 +TYOAQOOJlxkLZktsabbaLkb1sDgJ4D5+G16UTV4GAWFHsEIPE+WjeEQe5jMHEj7Wlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793671664;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UUK6dMZMlyfLspx+cnvTRerB/rIYpcvguJ7fRvjfqkk=;
	b=t1Rw/htAyBpBDdB1IZPY/oFwknPOVWSi8cM4v5BfDEZHx5ZCIVHkfP5zVKmV44fIUeSM
	 7c0tW8f1BLbnVuBpwoHxi8XlMhYo/Vb2XTtKERmmd5SDEdXkfadByqu4QfFGQnjLe+c3J
	 W17rnz6YfEHTsKG5qNeV5qCStZrGmegRwnSzOS0rx1MbtoHTfDiIbQQrrglm1Ar9eqCaq
	 fINHnvAeRsNwC5SAlp2LSLfV3vwq47clvPXwPUqxz1xf/0GxBoGAYc3jsX7KcxbOHsX41
	 w0xp6J9eYztACVaogFyVm6ksPiuYDvk8fOZ752pmF2sXnE0vd86PhPiKb/O2qxYeyjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tqkDepCl;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4EF606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B4EF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tqkDepCl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=UUK6dMZMlyfLspx+cnvTRerB/rIYpcvguJ7fRvjfqkk=; b=tqkDepClH/XB2WsLDTpGgw58pb
	3eeCyZOft5L4ztsDzTWG20/8awVk6wfT6aRg17rcDsHisNbbn+7PC8/kEpm4aabx63xYTYcfw+FeF
	CQ2vfIJSZRqwZaccLpenTU+0PR2sHFgImLl96QZpKeuTGLKMYtMO7l7TjEs2MhWwcT1I4J0H7HAkd
	AYxy6Zed5EHvBTdJVphaqv5Ca6cpP5vtfFqh0sWl6GuPIeW3caY2FB98S5iT48cI4q91eP+6lM9J0
	Ailm/TN3//XPMlEws2nIiW+Y0UMgqdsOufUQZTOcyvHWOcQeQuKx0vilvA70tVWMdiFAQPhCoxJ5a
	vUO45uqw==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3w7-00000000qv2-0F0s;
	Tue, 03 Nov 2026 02:07:43 +0000
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
Subject: [PATCH v2 2/3] maple_tree: Test emptying tree while RCU reading
Date: Mon,  2 Nov 2026 21:07:23 -0500
Message-ID: <20261103020724.2614498-3-liam@infradead.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103020724.2614498-1-liam@infradead.org>
References: <20261103020724.2614498-1-liam@infradead.org>
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

Add a test case for the rcu reader being restarted by emptying the tree.
A reverse walk from index 0 must not return the new root entry.

Signed-off-by: Liam R. Howlett (Google) <liam@infradead.org>
---
 lib/test_maple_tree.c | 165 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/lib/test_maple_tree.c b/lib/test_maple_tree.c
index fb40e193a3cb7..10e5577ea0f19 100644
--- a/lib/test_maple_tree.c
+++ b/lib/test_maple_tree.c
@@ -3740,6 +3740,170 @@ static noinline void __init check_range64_in_rcu(struct maple_tree *mt)
 	rcu_barrier();
 }
 
+/*
+ * A reader that restarts after its leaf died may find a tree without nodes:
+ * emptied, or emptied and then given a single entry at 0.  Each case starts
+ * from a tree with nodes, built by check_seq().  The stores run while the
+ * reader holds rcu_read_lock, so they use GFP_ATOMIC.
+ */
+static noinline void __init check_restart_no_node(struct maple_tree *mt)
+{
+	void *ptr = xa_mk_value(1234);
+	void *entry;
+	MA_STATE(mas, mt, 0, 0);
+
+	MT_BUG_ON(mt, !mtree_empty(mt));
+	mt_set_non_kernel(99999);
+
+	/* find: the tree is emptied */
+	mt_init_flags(mt, MT_FLAGS_USE_RCU);
+	check_seq(mt, 100, false);
+	rcu_read_lock();
+	mas_set(&mas, 0);
+	entry = mas_find(&mas, ULONG_MAX);
+	MT_BUG_ON(mt, entry != xa_mk_value(0));
+	MT_BUG_ON(mt, mtree_store_range(mt, 0, ULONG_MAX, NULL, GFP_ATOMIC));
+	entry = mas_find(&mas, ULONG_MAX);
+	MT_BUG_ON(mt, entry != NULL);
+	MT_BUG_ON(mt, mas.status != ma_none);
+	MT_BUG_ON(mt, mas.index != 0);
+	MT_BUG_ON(mt, mas.last != ULONG_MAX);
+	entry = mas_find(&mas, ULONG_MAX);
+	MT_BUG_ON(mt, entry != NULL);
+	MT_BUG_ON(mt, mas.status != ma_none);
+	rcu_read_unlock();
+	mtree_destroy(mt);
+	rcu_barrier();
+
+	/* next: the tree is emptied */
+	mt_init_flags(mt, MT_FLAGS_USE_RCU);
+	check_seq(mt, 100, false);
+	rcu_read_lock();
+	mas_set(&mas, 0);
+	entry = mas_find(&mas, ULONG_MAX);
+	MT_BUG_ON(mt, entry != xa_mk_value(0));
+	MT_BUG_ON(mt, mtree_store_range(mt, 0, ULONG_MAX, NULL, GFP_ATOMIC));
+	entry = mas_next(&mas, ULONG_MAX);
+	MT_BUG_ON(mt, entry != NULL);
+	MT_BUG_ON(mt, mas.status != ma_none);
+	MT_BUG_ON(mt, mas.index != 0);
+	MT_BUG_ON(mt, mas.last != ULONG_MAX);
+	rcu_read_unlock();
+	mtree_destroy(mt);
+	rcu_barrier();
+
+	/* find: the tree is emptied, then holds one entry at 0 */
+	mt_init_flags(mt, MT_FLAGS_USE_RCU);
+	check_seq(mt, 100, false);
+	rcu_read_lock();
+	mas_set(&mas, 0);
+	entry = mas_find(&mas, ULONG_MAX);
+	MT_BUG_ON(mt, entry != xa_mk_value(0));
+	MT_BUG_ON(mt, mtree_store_range(mt, 0, ULONG_MAX, NULL, GFP_ATOMIC));
+	MT_BUG_ON(mt, mtree_store(mt, 0, ptr, GFP_ATOMIC));
+	entry = mas_find(&mas, ULONG_MAX);
+	MT_BUG_ON(mt, entry != NULL);
+	MT_BUG_ON(mt, mas.status != ma_none);
+	MT_BUG_ON(mt, mas.index != 1);
+	MT_BUG_ON(mt, mas.last != ULONG_MAX);
+	rcu_read_unlock();
+	mtree_destroy(mt);
+	rcu_barrier();
+
+	/* find_rev: the tree is emptied */
+	mt_init_flags(mt, MT_FLAGS_USE_RCU);
+	check_seq(mt, 100, false);
+	rcu_read_lock();
+	mas_set(&mas, ULONG_MAX);
+	entry = mas_find_rev(&mas, 0);
+	MT_BUG_ON(mt, entry != xa_mk_value(100));
+	MT_BUG_ON(mt, mtree_store_range(mt, 0, ULONG_MAX, NULL, GFP_ATOMIC));
+	entry = mas_find_rev(&mas, 0);
+	MT_BUG_ON(mt, entry != NULL);
+	MT_BUG_ON(mt, mas.status != ma_none);
+	MT_BUG_ON(mt, mas.index != 0);
+	MT_BUG_ON(mt, mas.last != ULONG_MAX);
+	entry = mas_find_rev(&mas, 0);
+	MT_BUG_ON(mt, entry != NULL);
+	MT_BUG_ON(mt, mas.status != ma_none);
+	rcu_read_unlock();
+	mtree_destroy(mt);
+	rcu_barrier();
+
+	/* prev: the tree is emptied, then holds one entry at 0 */
+	mt_init_flags(mt, MT_FLAGS_USE_RCU);
+	check_seq(mt, 100, false);
+	rcu_read_lock();
+	mas_set(&mas, ULONG_MAX);
+	entry = mas_find_rev(&mas, 0);
+	MT_BUG_ON(mt, entry != xa_mk_value(100));
+	MT_BUG_ON(mt, mtree_store_range(mt, 0, ULONG_MAX, NULL, GFP_ATOMIC));
+	MT_BUG_ON(mt, mtree_store(mt, 0, ptr, GFP_ATOMIC));
+	entry = mas_prev(&mas, 0);
+	MT_BUG_ON(mt, entry != ptr);
+	MT_BUG_ON(mt, mas.status != ma_root);
+	MT_BUG_ON(mt, mas.index != 0);
+	MT_BUG_ON(mt, mas.last != 0);
+	rcu_read_unlock();
+	mtree_destroy(mt);
+	rcu_barrier();
+
+	/* find_rev: the entry at 0 is below the minimum */
+	mt_init_flags(mt, MT_FLAGS_USE_RCU);
+	check_seq(mt, 100, false);
+	rcu_read_lock();
+	mas_set(&mas, ULONG_MAX);
+	entry = mas_find_rev(&mas, 1);
+	MT_BUG_ON(mt, entry != xa_mk_value(100));
+	MT_BUG_ON(mt, mtree_store_range(mt, 0, ULONG_MAX, NULL, GFP_ATOMIC));
+	MT_BUG_ON(mt, mtree_store(mt, 0, ptr, GFP_ATOMIC));
+	entry = mas_find_rev(&mas, 1);
+	MT_BUG_ON(mt, entry != NULL);
+	MT_BUG_ON(mt, mas.status != ma_root);
+	MT_BUG_ON(mt, mas.index != 0);
+	MT_BUG_ON(mt, mas.last != 0);
+	rcu_read_unlock();
+	mtree_destroy(mt);
+	rcu_barrier();
+
+	/* find_rev: the reader is at 0 when the tree gets one entry at 0 */
+	mt_init_flags(mt, MT_FLAGS_USE_RCU);
+	check_seq(mt, 100, false);
+	rcu_read_lock();
+	mas_set(&mas, 0);
+	entry = mas_find_rev(&mas, 0);
+	MT_BUG_ON(mt, entry != xa_mk_value(0));
+	MT_BUG_ON(mt, mtree_store_range(mt, 0, ULONG_MAX, NULL, GFP_ATOMIC));
+	MT_BUG_ON(mt, mtree_store(mt, 0, ptr, GFP_ATOMIC));
+	entry = mas_find_rev(&mas, 0);
+	MT_BUG_ON(mt, entry != NULL);
+	MT_BUG_ON(mt, mas.status != ma_root);
+	MT_BUG_ON(mt, mas.index != 0);
+	MT_BUG_ON(mt, mas.last != 0);
+	rcu_read_unlock();
+	mtree_destroy(mt);
+	rcu_barrier();
+
+	/* find_range_rev: the reader is at 0 when the tree gets one entry at 0 */
+	mt_init_flags(mt, MT_FLAGS_USE_RCU);
+	check_seq(mt, 100, false);
+	rcu_read_lock();
+	mas_set(&mas, 0);
+	entry = mas_find_range_rev(&mas, 0);
+	MT_BUG_ON(mt, entry != xa_mk_value(0));
+	MT_BUG_ON(mt, mtree_store_range(mt, 0, ULONG_MAX, NULL, GFP_ATOMIC));
+	MT_BUG_ON(mt, mtree_store(mt, 0, ptr, GFP_ATOMIC));
+	entry = mas_find_range_rev(&mas, 0);
+	MT_BUG_ON(mt, entry != NULL);
+	MT_BUG_ON(mt, mas.status != ma_root);
+	MT_BUG_ON(mt, mas.index != 0);
+	MT_BUG_ON(mt, mas.last != 0);
+	rcu_read_unlock();
+	mtree_destroy(mt);
+	rcu_barrier();
+	mt_set_non_kernel(0);
+}
+
 static DEFINE_MTREE(tree);
 static int __init maple_tree_seed(void)
 {
@@ -4031,6 +4195,7 @@ static int __init maple_tree_seed(void)
 
 	check_range64_in_rcu(&tree);
 
+	check_restart_no_node(&tree);
 
 #if defined(BENCH)
 skip:
-- 
2.47.3

