Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329877;
	b=HvSrDtroPKmCSYD+fDVXuZ5X7ZISzif1qKbg/TORKvkcDly7CTz5mjM0LNvSWXz+WHpf
	 q8Y6GFwpfDRrMAyBU2Q7ov6y1IVEdEiQwpccLCJzHkYyJCt2jHlc1dQLVvYWUyTjfzYWf
	 4YwxWCtZzW11g+mQ5+4aVJPo3aizmhSgbmfPfElcz3z7ZGHQI68A39I54MJLTXdv0LBNU
	 jpLJmkP+WZSGZrCfbc/nKPbd57GdzpYbpkV6fCGV8h6znN83x5Isz0zpM1ctZ4ze3WpwU
	 OXQo5N/Ey9zoGMSrLpoMeJ5ht8n4w9DbybZWn/NX1Djfm+AUoNpv0P+mjGituKGGYsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329877;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=JbTBuXRxbATil13VQfmSROal5KZd0JmHctFeuDO/odI=;
	b=mliT8F57+ntwSZz+mQa9PzuWJwgYnDrtmioQI6Hy7eTlP702sqmgkkWWyghM9GuXAxIv
	 T0njTZLXhHhorNkcO3GIHoZ/X2wMfBSAxjwF5QGv8tKltyHem8fgJUfR4fOHn5Ppc8VcP
	 oQxKbF18Ib5DLRYdPPGS90vdJNfXwsFP5EWTbb2E7E67mNURaqgWIU+Fi4hHyFY207362
	 Xe7FDGkj4PAd8quR1i50fjhic8M9tDCr1A0jg4gtuB64iYWLHltaay4KHuIOFReL4hsqV
	 fJ/O+uDJzF+E1HYlYmHlCuj5f7JnMbUOATnPctZjBNh5UoW+zTGGx+XbX2LkKgQ0GvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bfu626Kw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691A0606A837
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bfu626Kw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA7B1F008A5;
	Tue, 10 Nov 2026 16:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794329877;
	bh=JbTBuXRxbATil13VQfmSROal5KZd0JmHctFeuDO/odI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bfu626KwVogfTJj8jaiDaRkJqmwZQNSxJ2L/mRSUe79KfKrc0KYeXaTl27q650ODJ
	 1axZTpHPlFgB6vVFFGpfFn05OtyoOOYmq/Ub2vfl7n8LMdPy6c1rpr4TgGk3pfD2m5
	 Gfu9tvO3ck7Wpd+hyRvcTBYkHtLQdJ0J7x+OrybcCpc7q45nFjAjiCf6eF1xIEUXhc
	 3U9EfMH0BKmIitYzZUwMXiQdE82vhXtUWZrQkB9m0IbQgM+TfPLyG5YtFO3anNCwc5
	 0EfyTUoX6CDJN8ufbqLkFMk2hpUdAugM11oj6H8SwQ7qevbo9tBPscm0mI3sBs0XY+
	 TrNld9fbuAepQ==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 10 Nov 2026 16:57:44 +0000
Subject: [PATCH 2/3] mm: only assert VMA locks if CONFIG_DEBUG_VM is set
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-tame-vma-asserts-v1-2-be293ff499a7@kernel.org>
References: <20261110-tame-vma-asserts-v1-0-be293ff499a7@kernel.org>
In-Reply-To: <20261110-tame-vma-asserts-v1-0-be293ff499a7@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>
Cc: ljs@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3440; i=ljs@kernel.org;
 h=from:subject:message-id; bh=4EpJ116zFLkOIel92sc9+BafyFBTVp7rWM0n4oPQ7KY=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI++/K6rN50T/LePQf3rAItS+NXj8NWNjqe1wy4r33x5
 KFlXqwxHaUsDGJcDLJiiizPv4jvDxIJm9d5wd8NZg4rE8gQBi5OAZjIFx6G//7Rp9eIMfHyPFNZ
 EmH1uSRTNHJiRt7s+RZ/Cy9s8FOqusPIsGlXod9k9/6UjJAIv6l6Utw+L/a7frngN9ft+p+ZzOs
 EeAA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

Similar to the mmap lock asserts, we have also asserted VMA locks
regardless of whether or not the kernel is a debug build or not.

Similarly, these are asserting basic assumptions about kernel code which
should never assert in production code.

Since all such bugs are generally asserted using VM_WARN_ON_ONCE() or
similar, it creates an odd and inconsistent situation where some
programmatic asserts are only checked under CONFIG_DEBUG_VM and some are
always checked.

Since the intent is the same as any VM_WARN_ON_ONCE() check, do not assert
if CONFIG_DEBUG_VM is not set.

Implement by updating vma_assert_attached() and vma_assert_detached() to
use VM_WARN_ON_ONCE() rather than WARN_ON_ONCE(), and gating
vma_assert_[write_]locked() and vma_assert_can_modify() on CONFIG_DEBUG_VM.

nommu loses its CONFIG_LOCKDEP asserts if !CONFIG_DEBUG_VM in
vma_assert_[write_]locked(), but this doesn't seem to be a problem.

In addition, there were already inconsistencies - vma_assert_write_locked()
uses VM_WARN_ON_ONCE_VMA() and performs no actions if CONFIG_DEBUG_VM is
not set, and vma_assert_locked() looked up vma->vm_refcnt but also only
asserted if CONFIG_DEBUG_VM was set.

Therefore simply update these functions such that they're predicated on
CONFIG_DEBUG_VM and update their kdoc descriptions accordingly.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 include/linux/mmap_lock.h | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
index 9367430ee53c..bada7a03ddf4 100644
--- a/include/linux/mmap_lock.h
+++ b/include/linux/mmap_lock.h
@@ -354,9 +354,14 @@ int vma_start_write_killable(struct vm_area_struct *vma)
 /**
  * vma_assert_write_locked() - assert that @vma holds a VMA write lock.
  * @vma: The VMA to assert.
+ *
+ * Assert only if CONFIG_DEBUG_VM is set.
  */
 static inline void vma_assert_write_locked(const struct vm_area_struct *vma)
 {
+	if (!IS_ENABLED(CONFIG_DEBUG_VM))
+		return;
+
 	if (!IS_ENABLED(CONFIG_MMU)) {
 		mmap_assert_write_locked(vma->vm_mm);
 		return;
@@ -369,11 +374,16 @@ static inline void vma_assert_write_locked(const struct vm_area_struct *vma)
  * vma_assert_locked() - assert that @vma holds either a VMA read or a VMA write
  * lock and is not detached.
  * @vma: The VMA to assert.
+ *
+ * Assert only if CONFIG_DEBUG_VM is set.
  */
 static inline void vma_assert_locked(const struct vm_area_struct *vma)
 {
 	unsigned int refcnt;
 
+	if (!IS_ENABLED(CONFIG_DEBUG_VM))
+		return;
+
 	if (!IS_ENABLED(CONFIG_MMU)) {
 		mmap_assert_locked(vma->vm_mm);
 		return;
@@ -480,12 +490,12 @@ static inline void vma_assert_attached(struct vm_area_struct *vma)
 	if (!IS_ENABLED(CONFIG_MMU))
 		return;
 
-	WARN_ON_ONCE(!vma_is_attached(vma));
+	VM_WARN_ON_ONCE(!vma_is_attached(vma));
 }
 
 static inline void vma_assert_detached(struct vm_area_struct *vma)
 {
-	WARN_ON_ONCE(vma_is_attached(vma));
+	VM_WARN_ON_ONCE(vma_is_attached(vma));
 }
 
 static inline void vma_mark_attached(struct vm_area_struct *vma)
@@ -549,6 +559,9 @@ struct vm_area_struct *lock_next_vma(struct vma_rcu_iter *rvmi,
 
 static inline void vma_assert_can_modify(struct vm_area_struct *vma)
 {
+	if (!IS_ENABLED(CONFIG_DEBUG_VM))
+		return;
+
 	if (vma_is_attached(vma))
 		vma_assert_write_locked(vma);
 }

-- 
2.56.0

