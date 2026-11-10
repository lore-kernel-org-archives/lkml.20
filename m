Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323456;
	b=mEUPkCHpBfQYLqP0PDlff9DFSGniAq0qVfdU3MGQ56fiy+PXEBd78/H40Euf3rnB2dOR
	 nCRYIIah4voEw4YS6PrZDydL2Nah6v2zajeMfnAuF5uQ7lb3HUx16TXH3gwH6+m7UjIsi
	 US6QKyogS7EmNJfA8iqaPoiEsFH4/OByFcCaq6qmuCN1d7f+GnhkUFMudn7JhkL9J0kda
	 ybaxrti7iE5rVzLRYc9VEV3Ds3oE2SFfwjQn6cAZloyhoN5nmAKmskggfhSsq8FVEgAfb
	 8vFYTBdFrrK6ghCbWeb0FYVbH+18VxLG/5SivQw9WKxXTQyS/mYGII7I115SSq6SCXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323456;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=D9yxkaw6ZrAXW+SO4mJkooT0uzl2j90D+9HSPrIHqSc=;
	b=o7ikJwZkPU4jiDH94j1Te39HUpbRUkH1Ujige2sKRehwdXQyNIfdO0kWI1Mc9zWMEoF9
	 S1oMHzqs9YLq/zCA0ER4qPOkuMXdg9X7U0BzFWcdLlN8RYsm+TaZBVCFWgX9QLgtBxsIH
	 1oLXChpUDA64/sbdH/Vc6TFnaLcjfh20gPvFO9BQDXgHSmuDPlYNMtmd80n5wFOcD7Jq9
	 EUpVrUs6KUBGD+y6JH/4T+y8tg2aLXMBATpdfPAwLeNkzYK2LoDrDc6Wey0hm3gJGoIuQ
	 UvTaoACSMn9smgzxPu3uJFpkaLfNld/ciZSi2qhx5HRcRjIwCBDuYL3T2pkl2p5MfNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="UJKOM5j/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFF8606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UJKOM5j/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A52E21F0089F;
	Tue, 10 Nov 2026 15:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794323455;
	bh=D9yxkaw6ZrAXW+SO4mJkooT0uzl2j90D+9HSPrIHqSc=;
	h=From:Date:Subject:To:Cc;
	b=UJKOM5j/qfm9UA57rKmDJPywu+1MpnR7psxvF5MztxtwTBfjw76xrroP/gApZ26Zl
	 y+r6pEJIi7KQUnYtCM9GBAXco3ArXjQsPj7mq/NA9jRJ1/XZ3DfLNy3ds5+mXP8EBI
	 4yU5SG0sqd3JiOOJXkVJTN4Q+YCKw92IOPVcCADPeekqQjyafEsYPIeMe09a7v9UuR
	 7NzdR9uKtAmXZFLBbzm/sJhye6QjkVFoCdVhd3dxpFfvnY4Nv1OtEblDhjjzIzsAip
	 rc57LzeqfPg1oijt9gK4fa5MI9S52bhM+3B3BQe3TjHv/7VXVY4Rr7lUBm0/GhdYlM
	 MJIQpsIIKoz3g==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 10 Nov 2026 15:10:40 +0000
Subject: [PATCH] mm/vma: predicate vma_assert_stabilised() on
 CONFIG_DEBUG_VM
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
Message-Id: <20261110-vma-fixup-debug-asserts-v1-1-0b2e0680cd7e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSwqAMAwFr1KyNmArqHgVcVFt1Cz80NgiiHc3u
 HiLgTfzgFBkEujMA5EyCx+7gi0MTKvfF0IOyuBKV1trS8ybx5nvdGKgMS3oRQuXoAuVa2bStRO
 ofUbS21/uh/f9AOziYEdpAAAA
X-Change-ID: 20261110-vma-fixup-debug-asserts-2d327fe27f8c
To: Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, Lance Yang <lance.yang@linux.dev>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, ljs@kernel.org, 
 Seunghyun An <san55@wisc.edu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3945; i=ljs@kernel.org;
 h=from:subject:message-id; bh=AjcoNBiXFjIr7zMwvTj45YNXUEW6Apq5OgXBX+VmZYQ=;
 b=kA0DAAoWz53NioHifxQByyZiAGrzM/yj/skJHnNSO9mo71dlXgNJiR357l9zRUrXoubw0APA3
 oh1BAAWCgAdFiEE5/QXv1IUVp6J0E9Gz53NioHifxQFAmrzM/wACgkQz53NioHifxT8yAEA0uwi
 mJOl7OZnM8yK+AUWEki7eb4lfSoCOVwQ2e+hrNIA+gKxTYPd93zkwj9lOKOXvw/H+brUbalFZnG
 uVh7J4eQL
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

I introduced commit 17fd82c3abe0 ("mm/vma: add and use
vma_assert_stabilised()") with the intent of picking up programmatic bugs
when debugging mm code, but kept the general practice of asserting even
when CONFIG_DEBUG_VM is not set in line with existing code.

However, it turns out doing so can cause performance regressions,
especially when asserted in vma_has_anon_rmap() which is referenced in a
number of hotpaths.

Since the intent was always a debug-only assertion, explicitly check for
CONFIG_DEBUG_VM and do not assert if it isn't set.

Really all of the assert paths need to be predicated on this, but start
with this one only, out of caution.

Additionally, since a detached VMA is trivially stabilised (nothing to
stabilise against), check for this case at the outset, and update
vma_has_anon_rmap() to not explicitly need to check for this.

This also, importantly, avoids reading any VMA fields if CONFIG_DEBUG_VM is
not set.

Target the commit which introduced vma_has_anon_rmap() for the fix, as this
is where the issue started manifesting in practice.

Fixes: 38564710f443 ("mm: implement and use vma_has_anon_rmap(), silence KCSAN")
Reported-by: Seunghyun An <san55@wisc.edu>
Closes: https://lore.kernel.org/linux-mm/20261110000002.1834454-1-san55@wisc.edu/
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
Note that vma_is_anon_rmap() was introduced in 7.4, so no need for a cc: stable,
just needs to be sent to Linus as a hotfix. Thanks!
---
 include/linux/mmap_lock.h | 19 ++++++++++++++-----
 mm/vma.h                  |  3 +--
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
index 9ccbbcbd7aca..9c3a9c6525c1 100644
--- a/include/linux/mmap_lock.h
+++ b/include/linux/mmap_lock.h
@@ -408,6 +408,11 @@ static inline void vma_assert_locked(const struct vm_area_struct *vma)
 	vma_assert_write_locked(vma);
 }
 
+static inline bool vma_is_attached(const struct vm_area_struct *vma)
+{
+	return refcount_read(&vma->vm_refcnt);
+}
+
 /**
  * vma_assert_stabilised() - assert that this VMA cannot be changed from
  * underneath us either by having a VMA or mmap lock held.
@@ -418,9 +423,18 @@ static inline void vma_assert_locked(const struct vm_area_struct *vma)
  *
  * With lockdep disabled we may sometimes race with other threads acquiring the
  * mmap read lock simultaneous with our VMA read lock.
+ *
+ * Assert only if CONFIG_DEBUG_VM is set.
  */
 static inline void vma_assert_stabilised(const struct vm_area_struct *vma)
 {
+	if (!IS_ENABLED(CONFIG_DEBUG_VM))
+		return;
+
+	/* Detached VMAs are trivially stabilised. */
+	if (!vma_is_attached(vma))
+		return;
+
 	/*
 	 * If another thread owns an mmap lock, it may go away at any time, and
 	 * thus is no guarantee of stability.
@@ -454,11 +468,6 @@ static inline void vma_assert_stabilised(const struct vm_area_struct *vma)
 	vma_assert_locked(vma);
 }
 
-static inline bool vma_is_attached(const struct vm_area_struct *vma)
-{
-	return refcount_read(&vma->vm_refcnt);
-}
-
 /*
  * WARNING: to avoid racing with vma_mark_attached()/vma_mark_detached(), these
  * assertions should be made either under mmap_write_lock or when the object
diff --git a/mm/vma.h b/mm/vma.h
index 3fc3b47a954b..05300badd70b 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -278,8 +278,7 @@ static inline pgoff_t vmg_end_pgoff(const struct vma_merge_struct *vmg)
  */
 static inline bool vma_has_anon_rmap(const struct vm_area_struct *vma)
 {
-	if (vma_is_attached(vma))
-		vma_assert_stabilised(vma);
+	vma_assert_stabilised(vma);
 	/* KCSAN gets confused about the optimistic check. Silence it. */
 	return data_race(vma->anon_vma);
 }

---
base-commit: 93d7a816a2df3e907e2719bd12b0073f1285fc5c
change-id: 20261110-vma-fixup-debug-asserts-2d327fe27f8c

Cheers,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>

