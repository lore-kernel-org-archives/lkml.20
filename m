Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792425065;
	b=QrvWgR093xf6h5uN0qvHO0dLDtuytYnIPdGkX1Js1GSJpMp8nGUy0W/B5OcFrgpJ159E
	 NWGCVZ1tW4rQxMp0JBSdD3WPLNC4qGcAjaRsDhSirNr8tCVn7KE3tMTsEL1+SeUmBHYG0
	 HIScsUl/ZpJkstz46gy10q6wetZzmKdLg0VLM4nWLJofb/Hu9beZBs8E1w+j4uQ/zZnCY
	 VY7n8O+GhbAjkavKJXktK5YTGQBDXvnz5E5lU5WZwyDjm0NCN+AaoHCFhrVTC4j1I+1Ga
	 SZ0POI5+oSkPx8S//oh7lq/XBxSlT4wNJm1P8lecLN7Uy6tDlxGsU7NZphCPkpNCl1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792425065;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U8qRbxVMl9WjIylP4uF+PXHiNMFQO2d35UvAtzhx6sE=;
	b=OpeJFf0cEtCJKAcs61WYGE0PfIbRyh6w7Wjkt88ObS7bCuptHbH6/DGPVWYGpg2IPAkY
	 4uXZqJnzzoGGe/sb5a6HjM1pF80QOSZUYsEw1SD9VOZYLHqndHOh9IfJxzdLLbhwk/dAZ
	 LQAvrR513rwAoKgFz5nhQlZMAqvkDSMsIrlt0q2oiQRC5XXsjYYTDLpsCYPmI1cXym+X2
	 RBbgY09OankZvzu8OwlC2A/2Jq0OI4cduXvDYm6y+WW7yRQdqVcFdSCJeAZuo5VfVNIao
	 tNoZWYu53cmxle7cv5LsvuHBoWYz7E21kLpKKNYEGe8Sj6InA69YUPYvydfFcBqgBpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nxt2g2oi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889B9606AAC6
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nxt2g2oi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719EE1F000C7;
	Mon, 19 Oct 2026 15:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792425065;
	bh=U8qRbxVMl9WjIylP4uF+PXHiNMFQO2d35UvAtzhx6sE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Nxt2g2oiPGhnjIWMFd6cbSzerN9RvuAWTochm/XIy+E3YgUf1ZKNc8ln+V1stW6pX
	 ZcRt0aztuO/x4TKZwVt8iBbJ6Kxejpr3xo3MDRJ0jKzal9WgbiB9Uc/un90xx3FDrT
	 pPcpiOK/8jZsztT3XHl9wl3XRRn1bEhRNSK9HC4iHctRg9PYH6/IUpXxQl5WfpeGZj
	 4YvYG/Ro99+XS/8h9VgRiIe7rpith9RJsbUBI/xyfAdcBbw61aav957VdLN35pfLkH
	 bvsk6kTZEBfE15MbvrhHYoAMi1cgOHa1QNnfeOHRCrJ1olgyKBF2Jqf7b5YssNzsN+
	 OVEYF68UZGAOg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id 1D1F2198004A;
	Mon, 19 Oct 2026 11:50:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 19 Oct 2026 11:51:01 -0400
X-ME-Sender: <xms:YDzWavEfAzDHlbtkw43VHg8TgjhQJAnw1Jjqwece4I3M6InZ-xI0ug>
    <xme:YDzWajRvf9T-pZcLgW2VfcFdhAhsfvQAlVJ-ZmMYXZvghP4XJepVTjFWi3swHcItr
    0x-uN_A_buNRbTB-eqHjn77IPWSTwV0pC00iqlGLEpNCYH5_LZAQTqX>
X-ME-Received: <xmr:YDzWamQt4lUKxuM6mWiRPGQrl3ABRPx4XoY_U5iQ-jLjf99c2A4HLMs4orA>
X-ME-Proxy-Cause: dmFkZTEKM7cQ34PANJkOaDpnT+IXyH0pLg7IoM6i34Jbx05genX6Ndq2TdcGNb9654u2H8
    41WED7y/zjj5LaonH0VFTkPtnxIjhuRVEkvuk8kM9rm/ofB3Z9Tg4QxquxaJFHbDWQqeu/
    Vblnly/EuZwo3Wz9CpGJqqgTrStLmT9zjqH9hVTJAPs00+uZifgMXlnluxpV6wuH9uu7MT
    BObPpnz8l78pdcpT4Vufdwi//iHA9W9CmvvMWThM1WI/4eq4v7bHyLxAHLcqSlwPUMMG0k
    NFb5bNvmq2vpdgPX6RraAkdwYnZfp8UPDvRR9XmyDlbwFnPxU3uIs+BDzqJ7Yv2QnX71lk
    SqTihz8KrnAWYbCEV29gvySR44BJOhM620UDi7RgBFyzLt2FX77tl1bIEBd8zUsl2vqnNF
    nFaX7oJnw9jzl4Im4TmEN0FGPZ+hsD/Hpjbxq0aPtS9IEAD2eUm0nsjguUdSMoJhg0gvJg
    WclWlsxxO7a/TyCOSLZLOk2ezO+K1Pjj6gnvCHiC4xJ7A/NLQkpZIIyLZ6fIYskJfVezB1
    JTKjUjaYrzuI6H1hc1SKjxsKl3ECQXuoGoOaFfx3Txr+D8UvGA/dyqgPe86Zmx4yohNOZO
    g36OTZ7vqw89oUDxbVcG9dYAawcjetiW5em9S+Vas4yhNDrb4krv/lDYi4Bw
X-ME-Proxy: <xmx:YDzWahe6XQtR_czawTECLRbTlkQV8_F02JYYhKqCjvzBSiDbaJX0rQ>
    <xmx:YDzWalD4pdBDtl5ELDDJ1MH7xTird3kdsSn7mgvb21I_dMwrV2TdMQ>
    <xmx:YDzWav3TAoXK8KuPEM4LtTdnNSIUwL795qFfbdo06m35H3kNVyw5Aw>
    <xmx:YDzWalTWwMKpKrOa4fbMkkJAU3XstDwNk42O7fO9r5q-YYmBFZV0Sw>
    <xmx:YDzWakSweUIpfOdYnD9vJqMIMKktN7bTZdMldlEqsQh6COpyGDSZyMsZ>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 11:50:55 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Hugh Dickins <hughd@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Harry Yoo <harry@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	kernel-team@meta.com
Subject: [RFC PATCH 15/18] mm/filemap: read large folios without folio references
Date: Mon, 19 Oct 2026 16:49:08 +0100
Message-ID: <20261019154913.1765974-16-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019154913.1765974-1-kas@kernel.org>
References: <20261019154913.1765974-1-kas@kernel.org>
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

A large folio is in all the slots of its range or in none.  Once the
slot of the last page to copy holds it too, the pages in between are
this folio's: copy them after one lookup.  The folio's size is read
without a reference and only picks the page to check; a split after the
check copies PG_rcu_free to the new folios.

Copy page by page with _copy_to_iter(): the hardened usercopy check of
copy_to_iter() reads the folio's order, which a split can change.

Assisted-by: LLM
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/filemap.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 57 insertions(+), 7 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 55fc471c0489..ace6b1fd6b9e 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2843,9 +2843,6 @@ static bool filemap_read_rcu_can_copy(struct folio *folio, pgoff_t index,
 	/* memory_failure() waits only for readers that got past this */
 	if (folio_contain_hwpoisoned_page(folio))
 		return false;
-	/* One reference covers all of a large folio's pages */
-	if (folio_test_large(folio))
-		return false;
 
 	/*
 	 * The slow path does not call folio_mark_accessed() on the folio that
@@ -2899,6 +2896,60 @@ static struct folio *filemap_read_rcu_lookup(struct xa_state *xas,
 	return folio;
 }
 
+/*
+ * How much of @bytes, starting @offset into page @index, can be copied from
+ * @folio.  A folio is in all the slots of its range or in none: when the slot
+ * of the last page holds it too, so do the slots in between, and the pages
+ * are this folio's.
+ */
+static size_t filemap_read_rcu_size(struct xa_state *xas, struct folio *folio,
+		pgoff_t index, size_t offset, size_t bytes)
+{
+	pgoff_t end = index + DIV_ROUND_UP(offset + bytes, PAGE_SIZE);
+	pgoff_t next;
+
+	if (end - index > 1 && folio_test_large(folio)) {
+		/* Read without a reference: it only picks the page to check */
+		next = folio_next_index(folio);
+		if (next > index && next < end)
+			end = next;
+		xas_set(xas, end - 1);
+		/* A split after this copies PG_rcu_free to the new folios */
+		if (xas_load(xas) == folio)
+			return min(bytes, (end - index) * PAGE_SIZE - offset);
+	}
+	return min(bytes, PAGE_SIZE - offset);
+}
+
+/*
+ * Copy @bytes from @folio, starting @offset into its page at @index.  Page
+ * by page, as copy_page_to_iter() does, without its checks for each call.
+ * Not copy_to_iter(): its usercopy check reads the folio's order, which a
+ * split can change.
+ */
+static size_t filemap_read_rcu_copy(struct folio *folio, pgoff_t index,
+		size_t offset, size_t bytes, struct iov_iter *iter)
+{
+	struct page *page = folio_page(folio, index - folio->index);
+	size_t n = 0;
+
+	while (n < bytes) {
+		size_t len = min(bytes - n, PAGE_SIZE - offset);
+		size_t done;
+		void *kaddr;
+
+		kaddr = kmap_local_page(page);
+		done = _copy_to_iter(kaddr + offset, len, iter);
+		kunmap_local(kaddr);
+		n += done;
+		if (done < len)
+			break;
+		offset = 0;
+		page++;
+	}
+	return n;
+}
+
 /* Bytes one RCU read section copies at most: it holds up grace periods */
 #define FILEMAP_RCU_READ_MAX	SZ_512K
 
@@ -2944,10 +2995,9 @@ static bool filemap_read_rcu_batch(struct kiocb *iocb, struct iov_iter *iter,
 			break;
 
 		bytes = min_t(loff_t, isize - pos, iov_iter_count(iter));
-		bytes = min3(bytes, budget, PAGE_SIZE - offset);
-		/* Not _nofault(): its usercopy check reads the folio's order */
-		n = copy_page_to_iter(folio_page(folio, index - folio->index),
-				      offset, bytes, iter);
+		bytes = filemap_read_rcu_size(&xas, folio, index, offset,
+					      min(bytes, budget));
+		n = filemap_read_rcu_copy(folio, index, offset, bytes, iter);
 		*copied += n;
 		iocb->ki_pos += n;
 		budget -= n;
-- 
2.54.0

