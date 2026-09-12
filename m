Received: from mta0.migadu.com (out-86.mta0.migadu.com [91.218.175.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19A039022B
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789242643; cv=none; b=P+7yb4Ejyxpg59tQXzOU4bUecpBU4io/Kj13A03FTPkyS3/RD8XYw7BuUJCEYuYpTZoOHM7ET6yAAYkqNo0fq5as8ZOj4lynIoWDYG0q69BFmmUCLnhABmZ9o9svum2mZ1t57OeB0XOjtkmnogrJQXoqnNJr+g8ul075EpIwzvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789242643; c=relaxed/simple;
	bh=IZQWpLfgOYy2HoyGgwPrn56oEiNSXBhTyZWh8PoLnm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NZNeSKYxGdoXhQS4C5B9VsdlqZ3nuc28X9eT4/LEPFvVB9W4AXoHlcNnxBn2pL+GvRV3lV35QqEAxI++C6vr21bJoc7DuwXQZU+QL6ZokRxdDyyY7ly6eGSfpAYTRuzQTbU41YQMOaH5EfuG9E0k433ST9UHAYqK5KpHSFep6vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vI4PQNvt; arc=none smtp.client-ip=91.218.175.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vI4PQNvt"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IZQWpLfgOYy2HoyGgwPrn56oEiNSXBhTyZWh8PoLnm8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789242639; v=1; x=1789847439;
 b=vI4PQNvtzlz5BVglkofWTsBPA2OSAuND2Xwvxxxa6xJ/msUylIFRfjkuTMEihxVtkwfQtU71
 Pk9Mmmccy09A3gqx8ZBJeUKYQYs1Y4gU5zjrGMB5nEr2SHTFoGNTndIhWP/6M5zr36YcfEKlqON
 XbTZkjx4hK5Dw0euM25ihMW8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 657099db2046fc3f;
	Sat, 12 Sep 2026 19:50:39 +0000
X-Mizu-Trace-ID: 657099db2046fc3f
X-Migadu-Flow: FLOW_OUT
From: Ilya Gladyshev <ilya.gladyshev@linux.dev>
To: ilya.gladyshev@linux.dev
Cc: akpm@linux-foundation.org,
	andrew+netdev@lunn.ch,
	apopple@nvidia.com,
	artem.kuzin@huawei.com,
	baolin.wang@linux.alibaba.com,
	david@kernel.org,
	Liam.Howlett@oracle.com,
	edumazet@google.com,
	harry.yoo@oracle.com,
	hramamurthy@google.com,
	ivgorbunov@me.com,
	joshwash@google.com,
	kirill@shutemov.name,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	muchun.song@linux.dev,
	pfalcato@suse.de,
	rppt@kernel.org,
	surenb@google.com,
	torvalds@linuxfoundation.org,
	vbabka@suse.cz,
	willy@infradead.org,
	yuzhao@google.com,
	ziy@nvidia.com
Subject: [PATCH v6 3/3] mm: implement page refcount locking via dedicated bit
Date: Sat, 12 Sep 2026 22:50:10 +0300
Message-ID: <ebd6540ad89a4bb80e2a62d00901b5c827315b66.1789239015.git.ilya.gladyshev@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789239015.git.ilya.gladyshev@linux.dev>
References: <cover.1789239015.git.ilya.gladyshev@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current page refcount implementation uses a single counter value
(zero) as dead. So, to prevent incrementing a dead refcount in
folio_try_get(), it fundamentally requires a CAS loop.

This CAS loop can act as a serialization point and can become a
significant bottleneck during high-frequency file read operations
[1][2].

This patch reallocates the refcount value range:

(1) refcount < 0 means dead refcount (uninit / frozen)
(2) refcount = 0 allowed only as a temporary state (see below)
(3) refcount > 0 is a regular reference count

In other words, refcount is now split into "dead bit" and a 31-bit
counter.

Refcount decrement now works as follows:
1. Counter decrement
2. If it is now zero, try to put it deep inside the dead zone
   (CAS to INT_MIN). Or you can view it as "set up frozen bit and reset
   counter".
3. This CAS can fail only if someone grabbed a reference in-between --
   that's okay, this page is their problem now.

The size of the dead zone allows performing an optimistic increment
inside page_ref_add_unless_frozen(), replacing the previous read + CAS
loop with a single RMW operation. This reduces cache line bouncing and
improves scalability, especially in NUMA scenarios.

[1]: https://lore.kernel.org/all/20251017141536.577466-1-kirill@shutemov.name/
[2]: https://lore.kernel.org/all/CAHk-=wj00-nGmXEkxY=-=Z_qP6kiGUziSFvxHJ9N-cLWry5zpA@mail.gmail.com/

Reviewed-by: Artem Kuzin <artem.kuzin@huawei.com>
Co-developed-by: Ivan Gorbunov <ivgorbunov@me.com>
Signed-off-by: Ivan Gorbunov <ivgorbunov@me.com>
Signed-off-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>
Acked-by: Linus Torvalds <torvalds@linuxfoundation.org>
---
 include/linux/page-flags.h | 13 +++++++++++++
 include/linux/page_ref.h   | 30 +++++++++++++++++++++++++-----
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 7a863572adce..b19721e0e7ca 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -196,6 +196,19 @@ enum pageflags {
 
 #define PAGEFLAGS_MASK		((1UL << NR_PAGEFLAGS) - 1)
 
+/* Most significant bit in page refcount */
+#define PAGEREF_FROZEN_BIT BIT(31)
+
+/* Page reference counter can be in 3 logical states,
+ * which are described below with their value representation
+ *        state              |         value
+ * (1)  safe with  owners    |   1...INT_MAX
+ * (2)  safe with no owners  |         0
+ * (3)  frozen               |  INT_MIN....-1
+ *
+ * State (2) can only temporarily occur inside dec_and_test.
+ */
+
 #ifndef __GENERATING_BOUNDS_H
 
 /*
diff --git a/include/linux/page_ref.h b/include/linux/page_ref.h
index 82ff3a99297a..cc7a9d7db504 100644
--- a/include/linux/page_ref.h
+++ b/include/linux/page_ref.h
@@ -64,7 +64,7 @@ static inline void __page_ref_unfreeze(struct page *page, int v)
 
 static inline bool __page_count_is_frozen(int count)
 {
-	return count == 0;
+	return count & PAGEREF_FROZEN_BIT;
 }
 
 static inline bool page_is_frozen(const struct page *page)
@@ -79,7 +79,12 @@ static inline bool folio_is_frozen(const struct folio *folio)
 
 static inline int page_ref_count(const struct page *page)
 {
-	return atomic_read(&page->_refcount);
+	int val = atomic_read(&page->_refcount);
+
+	if (unlikely(val & PAGEREF_FROZEN_BIT))
+		return 0;
+
+	return val;
 }
 
 /**
@@ -150,7 +155,7 @@ static inline void init_page_count(struct page *page)
 
 static inline void set_page_count_frozen(struct page *page)
 {
-	set_page_count(page, 0);
+	set_page_count(page, PAGEREF_FROZEN_BIT);
 }
 
 static inline void page_ref_add(struct page *page, int nr)
@@ -220,6 +225,9 @@ static inline int page_ref_sub_and_test(struct page *page, int nr)
 	VM_WARN_ON_ONCE_PAGE(page_is_frozen(page), page);
 	int ret = atomic_sub_and_test(nr, &page->_refcount);
 
+	if (ret)
+		ret = !atomic_cmpxchg_relaxed(&page->_refcount, 0, PAGEREF_FROZEN_BIT);
+
 	if (page_ref_tracepoint_active(page_ref_mod_and_test))
 		__page_ref_mod_and_test(page, -nr, ret);
 	return ret;
@@ -250,6 +258,9 @@ static inline int page_ref_dec_and_test(struct page *page)
 	VM_WARN_ON_ONCE_PAGE(page_is_frozen(page), page);
 	int ret = atomic_dec_and_test(&page->_refcount);
 
+	if (ret)
+		ret = !atomic_cmpxchg_relaxed(&page->_refcount, 0, PAGEREF_FROZEN_BIT);
+
 	if (page_ref_tracepoint_active(page_ref_mod_and_test))
 		__page_ref_mod_and_test(page, -1, ret);
 	return ret;
@@ -275,9 +286,18 @@ static inline int folio_ref_dec_return(struct folio *folio)
 	return page_ref_dec_return(&folio->page);
 }
 
+#define _PAGEREF_FROZEN_LIMIT	((1 << 30) | PAGEREF_FROZEN_BIT)
+
 static inline bool page_ref_add_unless_frozen(struct page *page, int nr)
 {
-	bool ret = atomic_add_unless(&page->_refcount, nr, 0);
+	int val = atomic_add_return(nr, &page->_refcount);
+	bool ret = !(val & PAGEREF_FROZEN_BIT);
+
+	/* Undo atomic_add() if counter is locked and scary big */
+	while (unlikely((unsigned int)val >= _PAGEREF_FROZEN_LIMIT)) {
+		if (atomic_try_cmpxchg_relaxed(&page->_refcount, &val, PAGEREF_FROZEN_BIT))
+			break;
+	}
 
 	if (page_ref_tracepoint_active(page_ref_mod_unless))
 		__page_ref_mod_unless(page, nr, ret);
@@ -312,7 +332,7 @@ static inline bool folio_ref_try_add(struct folio *folio, int count)
 
 static inline int page_ref_freeze(struct page *page, int count)
 {
-	int ret = likely(atomic_cmpxchg(&page->_refcount, count, 0) == count);
+	int ret = likely(atomic_cmpxchg(&page->_refcount, count, PAGEREF_FROZEN_BIT) == count);
 
 	if (page_ref_tracepoint_active(page_ref_freeze))
 		__page_ref_freeze(page, count, ret);
-- 
2.55.0

