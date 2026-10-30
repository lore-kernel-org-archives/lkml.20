Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793385140;
	b=Md4M42VBmIgR8UADWt3YbLod/IjnC6ZkbYPHgnpQnKuOQTLUAeuDwuIUvV7r6VuXumit
	 f5/0+Klb48eJa7XMuKl3kva6Cj6Sd2in2VV6xzWuDz6zd8nxe8Fnmx3l1sB2NVj4UpnRi
	 M9yhltVHBTzbGwYdt1XIIxGcNZWi9t6cYlqPQSgh4nwE1Y2+RXgQKePEHimAVsnHukX2+
	 pxSgl9thFgc7Fk7wQWyMghJhiyM2tnv5S3OtM3TL+YMmodYL5kpwp4a83A2ImLuibfhxp
	 gcdv1GDqMdkrwdX9BVRqT85r+KMsH3dG8/ejYBJMduffbyaNsPOA2QbXAK7aTXep2Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385140;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=SmhaNZx9fzAsP3d5pmW+pPxvxrjdQVasbzqQOyPPKdo=;
	b=yLOZO9RDCHWbueE+lOg8vKefUNvN6F0xuoQR6b32DsM02eLDCEO6XBPElwBk90fZSLRh
	 GN4qAIykxDF/i8duWae7uBds4WJ/2P0xyvgvTXNQu0T5HcKCn/6/fUfh/OnxsdtEApUX+
	 6LLM41ySWYn/xsDZV9RtC6dTJEKyA36QOQHWp7k+urHO8upsw9F387CaTtS3TAK7aXg65
	 JOz2S2TR9SYvSTBILVquL9xaOA1O0jrcpYSwCLhbp+dKgCEHL1faMlWYUlBf22SJzX6rO
	 CFoBkyrCvROwaKsPVPwDBwdUXDG9cXMoHahGfb1Z1aJ1i5MxRqsN0kGoYloNzIcbHNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=hVbj95Uf;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D217606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D217606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=hVbj95Uf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=SmhaNZx9fzAsP3d5pmW+pPxvxrjdQVasbzqQOyPPKdo=; b=hVbj95Uf9oJvIeAQES6vymLH/j
	wKuzMjROSMhvF8gwrne+31UshGKyvIZ94yq49SJuKr0jq2FRRSmciwYsM7YIvPyj5imTltcBMrtM6
	Xtskm4Z5ye5w8yGkDzMKgkq78skBHsnIcqB+dYzX89XukVEM7B4TixkeJuvqoCiVggCrwVG7gPsjP
	1OOCYj2cI3yB4NxENHdplwFvwOQImAHnZ7zlNy19tFdd1ArdncLZrrIA/bFWvYMxfX/+bZdpFEu+n
	VUgSeRiawR46HouMDGDrCdzGhPODXB3wzt/lM/GUXdMf+y+ZYlxAvVQEmNdQhcgaBUo1Wy1hR1l+C
	eN3NbUDQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xMrOb-0040uF-2z;
	Fri, 30 Oct 2026 18:32:10 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 30 Oct 2026 11:31:10 -0700
Subject: [PATCH v2] mm: kmemleak: scan modified objects as soon as they are
 grayed
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
Message-Id: <20261030-kmemleak-gray-drain-v2-1-3ec29a96668e@debian.org>
X-B4-Tracking: v=1; b=H4sIAG3i5GoC/22NQQ6CMBBFr0Jm7Zi2SkVX3sOwKHQKI1JMi0RCu
 LuAcefyJf+/N0GkwBThkkwQaODInV9A7RIoa+MrQrYLgxJKSyFTbFpqH2QarIIZ0QbDHp3NhNT
 C2fNRw/J8BnL83qy3/MvxVdyp7FfVuqg59l0Yt+wg192voP8WBokSD+okVKqdLTO6WirY+H0XK
 sjnef4Aa/H7O8kAAAA=
X-Change-ID: 20261015-kmemleak-gray-drain-fd80160fd946
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=6632; i=leitao@debian.org;
 h=from:subject:message-id; bh=Am15vGy4KAT+0gKSou3UJAm8KE5mqNB0nSviaBtOpGg=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq5OKm9gbp1quqr7syMzZeIrmtcUtbY0rBcskXP
 8jLe9DqKu+JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCauTipgAKCRA1o5Of/Hh3
 bTP1D/93vZdWtXAgQ/ZWYTKCd4Zo3+u2tNGXofD71UzmXPugdegMEu59HaVSvyd8/dOI00GmUTS
 RVHjUAlmgX1tA6tBV0+UEjC/XGcbYxv/PhrbRrXQ8DUl0zQJ4y/ObrG17yanhYIZh+QHaIJzu0z
 p6vhii17vZA7h53+r+6bmsE/05gyJ3BET++tXIttgdRwbT7+GUHnFV0RyfynoshHr777UD0+5uW
 VlqZBWUNxPiOxK4rvbLJakYLnYFV6EW9LyJWzViSbFk02gxkIjTqbHB449kRHAHyfDvoHBK18XH
 stBYEVDFjsz2g3DLm2U7YSH4CmZJIT9OPAZpv9DXX8cKxSq7Fc2r8mVGFuUEa+kuwWtmak5nb9e
 m/qSRKYdLegwJvP0ZMuOtT3ZnFcybphBjG0w7TyYsd6PQ7whCSEseWVQrLaXeRp52WZjvM1zaFj
 /gpEfNRMJVu3FDVgpSxkOZTQdh3hFE+55wnDwhELU7HXxaYSl10vBXmU0HkCLkMCjmiie0mIXjO
 5yQP1yggPxqVlI9elSRRam9vl0hWYr6Ga+ukgAMtykB6aeunF51U8UH+rEXATEfm3LEXUWlJAss
 pdUQfcvxvfQN8UiD4ehWXit/6HxqL1JYbqhx5zZxdth253c8KYYxEQYJ+pCryfgo2YNwVQHeJnN
 E5/akRAq0HEATtw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

kmemleak keeps reporting the guard page of a systemd-journald thread
stack on Meta's debug kernels, even with min_unref_scans set:

  unreferenced object 0xffff88829a30ae40 (size 256):
    comm "systemd-journal", pid 961, jiffies 4294814590
    backtrace (crc 49b3881c):
      kmem_cache_alloc_noprof+0x2ee/0x630
      vm_area_dup+0x36/0x750
      __split_vma+0xef/0x7d0
      vma_modify+0x11c3/0x18a0
      vma_modify_flags+0x1ea/0x2a0
      mprotect_fixup+0x249/0x630
      do_mprotect_pkey+0x531/0x820
      __x64_sys_mprotect+0x7c/0x90

The VMA is still mapped. It was never faulted in, so it has no anon_vma
and no file, and the only pointer to it is a slot in a maple tree leaf.
The mm tree runs in RCU mode: every write replaces the leaf with a copy
and frees the old one after a grace period. journald rewrites its tree
every couple of seconds, while a scan on a large debug host takes many
minutes, so the leaf kmemleak queued is freed before its turn, and the
copy that replaced it was linked after its parent had been scanned.

The pass over modified objects is meant to catch such moved references,
and the new leaf, being a new white object, does get grayed there.

But the gray list is only scanned after the whole object_list walk, and
by then that copy has been replaced and freed as well. The confirmation
scan has no such pass, so the miss repeats round after round no matter
how many consecutive scans are required.

Scan the gray list during the walk instead, within a jiffy of an object
being grayed. Do it from a variant of kmemleak_cond_resched(), which
already pins the current object while the RCU read lock is dropped. The
live leaf is then read shortly after the walk reaches it, before it can
be freed.

Scanning the gray list after every grayed object made a full scan 41%
slower (1.72s -> 2.42s, arm64 guest with lockdep) when the pass grays a
million objects that do not point to each other. Scanning it at most
once a jiffy keeps that at the baseline, leaves idle, file storm and
mmap churn workloads unchanged, and still removes the false positives
at HZ=100.

I was able to come up with a reproducer that reproduces these false
positives most of the time:

https://github.com/leitao/linux/commit/1291579c487303c5ffbea2cf532649d26329c8a9

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v2:
- Keep kmemleak_cond_resched() and its callers as they are. Pass 2 calls
  a new kmemleak_resched_drain() helper, which decides when to scan the
  gray list and calls the new __kmemleak_cond_resched() (Catalin). The
  other two callers keep need_resched() and are not touched.
- Scan the gray list at most once a jiffy (Catalin). Doing it after every
  grayed object cost up to 41% of the scan time in a synthetic worst
  case. This part can be dropped if it is not wanted.
- Add the scan time numbers to the commit message.
- Keep Catalin's Reviewed-by, as both changes follow his review.
- Link to v1: https://patch.msgid.link/20261016-kmemleak-gray-drain-v1-1-3270256fdc8e@debian.org

Tested on an arm64 virtme-ng guest (8 vCPUs, lockdep, HZ=1000,
min_unref_scans=1), two boots of ten scans per kernel, same base:
- Guard VMA reproducer: base reported live guard VMAs as leaks in 19
  of 20 scans (up to 106 at once) and needed a confirmation pass in 17.
  v2 reported none and never needed one, so a scan took 13.6s instead
  of 26.4s.
- Pass 2 graying 1M objects that do not point to each other: base
  1.74s, v1 2.46s, v2 1.73s per scan.
- No lockdep, RCU or WARN splats in any run.

The v2 changes, the changelog update and the measurements above were
done with Claude Code (claude-opus-5-5).
---
 mm/kmemleak.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 8fa409a4f9fb26..7e24408ba83821 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -1696,8 +1696,10 @@ static void scan_gray_list(void)
  * Conditionally call resched() in an object iteration loop while making sure
  * that the given object won't go away without RCU read lock by performing a
  * get_object() if necessaary.
+ * If @scan_gray is set, also scan the gray list while the RCU lock is dropped.
  */
-static void kmemleak_cond_resched(struct kmemleak_object *object)
+static void __kmemleak_cond_resched(struct kmemleak_object *object,
+				    bool scan_gray)
 {
 	if (!get_object(object))
 		return;	/* Try next object */
@@ -1709,6 +1711,8 @@ static void kmemleak_cond_resched(struct kmemleak_object *object)
 	raw_spin_unlock_irq(&kmemleak_lock);
 
 	rcu_read_unlock();
+	if (scan_gray)
+		scan_gray_list();
 	cond_resched_tasks_rcu_qs();
 	rcu_read_lock();
 
@@ -1721,6 +1725,26 @@ static void kmemleak_cond_resched(struct kmemleak_object *object)
 	put_object(object);
 }
 
+static void kmemleak_cond_resched(struct kmemleak_object *object)
+{
+	__kmemleak_cond_resched(object, false);
+}
+
+/*
+ * Scan newly grayed objects within a jiffy, not after the object_list walk:
+ * one may hold the only reference to another and be freed by then, like a
+ * maple tree node being replaced.
+ */
+static void kmemleak_resched_drain(struct kmemleak_object *object,
+				   unsigned long *last_drain)
+{
+	if (need_resched() ||
+	    (!list_empty(&gray_list) && time_after(jiffies, *last_drain))) {
+		__kmemleak_cond_resched(object, true);
+		*last_drain = jiffies;
+	}
+}
+
 /*
  * Scan all task kernel stacks, rescheduling between tasks. Each task is looked
  * up and pinned within its own RCU read-side section, so no lock is held across
@@ -1863,6 +1887,7 @@ static void dedup_flush(struct xarray *dedup)
 static int __kmemleak_scan(bool full)
 {
 	struct kmemleak_object *object;
+	unsigned long last_drain;
 	struct zone *zone;
 	int __maybe_unused i;
 	int stop = 0;
@@ -1979,10 +2004,10 @@ static int __kmemleak_scan(bool full)
 	 * Check for new or unreferenced objects modified since the previous
 	 * scan and color them gray until the next scan.
 	 */
+	last_drain = jiffies;
 	rcu_read_lock();
 	list_for_each_entry_rcu(object, &object_list, object_list) {
-		if (need_resched())
-			kmemleak_cond_resched(object);
+		kmemleak_resched_drain(object, &last_drain);
 
 		/*
 		 * This is racy but we can save the overhead of lock/unlock

---
base-commit: 587858367581b9c55c3690f4e63382ad622719d4
change-id: 20261015-kmemleak-gray-drain-fd80160fd946

Best regards,
--  
Breno Leitao <leitao@debian.org>

