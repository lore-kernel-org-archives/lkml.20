Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76BF390CAB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790665325; cv=none; b=uNUOtbCcSwi+/hjPoO8T57b2VYDgEYdwvxBkMvul/4pSkaFjRqHfjJsfLPZzMrLbIG6uk3MYZWQEi1lDLHq6iW43UGGyq8LhIKv2LL7kseeWyVky0f93HTBbwET25qllvTNPtmJCGJ2nrNynY6uV3bNrQi6maF9owwXA5r2mLLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790665325; c=relaxed/simple;
	bh=ahaPSs6pTTg8M+OYFo9RVetP3oklKSEOmJZ1AbJjFe4=;
	h=From:Date:Subject:Message-ID:To:Cc; b=E57CvX+M0tXuAxzTWcT+rj2MQlPleqeg7U3/i5IX0MBPicT/joehQ6DhKazTCphAxqR2B5fE2jLg32URyz+xYPDylLuxnlfMPsPyXcFVYY2nwdpaqBk/iuCZfJl7OS0Rzl3IB42QHSX2nXsZcub10grPM4Z5LOD3p6SWmWgn+WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dgu.ac.kr; spf=pass smtp.mailfrom=dgu.ac.kr; dkim=pass (2048-bit key) header.d=dgu-ac-kr.20251104.gappssmtp.com header.i=@dgu-ac-kr.20251104.gappssmtp.com header.b=lQzziN0N; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dgu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dgu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dgu-ac-kr.20251104.gappssmtp.com header.i=@dgu-ac-kr.20251104.gappssmtp.com header.b="lQzziN0N"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0f64df6a6so1178282a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dgu-ac-kr.20251104.gappssmtp.com; s=20251104; t=1790665322; x=1791270122; darn=vger.kernel.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SgyANliL/9OSzsbx4LMgJ4Uc8A7rCA+xzM8G8mL5nTg=;
        b=lQzziN0NFDZX49hrxv9IVe92KPBmXCqVFtq+eFRj3u58HTwMZwSGLgbpUUwiKB6m50
         U4Elfv3tKMA3CnLpUFPFFdQpTU6vPBw09zdKLCCKEYDyq7TSz77wPjHVwEt0gxnUEIcS
         XtSM7b+tIqEsgIy5Bg0CdFAcKoK32Ll55QF9N846FgxCmOJX5sHqyeywRxxoSFbG91I+
         nKKg2Gn80EEg30lEu/9+jRBUUQts3+bgcsSYr6vKp8s0NX5KTxHPJikUpxUR5sury4Rn
         DwDXX7S9XrNI1JOTL7DiM2Bq2/zuheh4zMkuMxYfUwjM0p4HM5r0/T4f7KUoQL0qOaPu
         +Inw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790665322; x=1791270122;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SgyANliL/9OSzsbx4LMgJ4Uc8A7rCA+xzM8G8mL5nTg=;
        b=2Jk1DsSWLIouJaWnZ07W87P/b6o2hCK1jMjFDgBqkB77Ic4fwdGcOufO/5LTec/djb
         PNXy7QotfuvwKTLpjFoQBkzttHOzuhHExtAVxjmJrMsce2O5WE90H3eBg9DtandGy2QJ
         6slcWlb7jPrnly7lmMxHZF+ogP+lHkp+We+HivKEs7LFktsT4Pq8yI+4CvcCd4HLpfXg
         knixSRWJGFR6baynYl1aYLbKSK1sd7NQwsQU9Yf+52UK5sdh93IqAH9yOGG1Y1Tb4mtx
         mGkp9PcBx6GFKTbXeu4y4+9m/kM5OiVmFnJyl5QQhfbfoftzXJMJ292Dto99U93GXqH0
         pXFg==
X-Forwarded-Encrypted: i=1; AKwUvBx1pvsskVPJamJE7x6l1l36RCoSS5WO8j7DGKt4vGRwOm3HnhW3K6EwqKlCh5qdxrdNt+M7GbCISuQO3gs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiA616s1ft3IFn2faXjRkLreNO4uB8slxynAsAyyZuA5MmRp9a
	VcNAebPOBzWPaPKCe+dRf6Nr2Md7tNtckhcCPuORolhrsXOj25wpzbsgKwv8i1kx5Lw=
X-Gm-Gg: AYBFou0e4+mmzF3LwdOkST9gLSG3B8honuhEEmSNTteivop7H0JrDjaWddY3hV39hHz
	THSQdapLwI2bsyzYZlf0tJtFbjXqSJo1line+htI+pzobDlT7h1RvSgXtOnosCX5Xd/KHK5tOd3
	2pScyUgBaA4S0cPN17hEKbvJsNY/Q5nJSnGkCu0HqMZ/Rj4tjlyF3FrIas5hWfyOX+ujHgIP6gX
	twkBEf2BKx/16RC9xDAzx5qBV8X05LbZdIIOUFKnZT4+jTeOWkVriJFj8GfjKR9CkAAWf2U51oE
	wTCnklm9K5PrkkLa08SPdl+BBzLr4/2UGGqKTQvROrFfa7pXa5UEWKWkQoIHChzu9z+CXcfl9n6
	8ZsbqBPvfldo9JJtdHhzJbd9slST4D36oxe9qpe3TtoAbC/zYDuyd/zcT+l5OCm7hW9+YvXzeOZ
	reOzLj+LWq4ExkAQ9oYKpKdbRlDCA/PoC+HAsngxZw9n/r4uwa12qz/K4=
X-Received: by 2002:a17:90a:902:b0:3a0:d9ae:4f3c with SMTP id 98e67ed59e1d1-3a0d9aef037mr5103648a91.18.1790665322087;
        Tue, 29 Sep 2026 00:02:02 -0700 (PDT)
Received: from PC2. ([175.193.106.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49869b9fasm4329281a91.12.2026.09.29.00.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:02:01 -0700 (PDT)
From: Park Tae-sun <ts930@dgu.ac.kr>
Date: Tue, 29 Sep 2026 14:56:34 +0900
Subject: [PATCH] mm/mlock: fix zero-length request normalization and integer
 overflows
Message-ID: <179066531783.50175.13377521828379196177@dgu.ac.kr>
To: Andrew Morton <akpm@linux-foundation.org>,
 Liam R. Howlett <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Park Tae-sun <ts930@dgu.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

mlock() and munlock() currently normalize the requested address range
using:

    len = PAGE_ALIGN(len + offset_in_page(start));
    start &= PAGE_MASK;

This performs multiple arithmetic operations on user-provided values
without validating intermediate overflows.

First, a zero-length request with an unaligned address is incorrectly
converted into a non-zero page range. Because
PAGE_ALIGN(offset_in_page(start)) rounds any non-zero offset up to a
full page, a request such as mlock(0x1005, 0) falsely locks an entire
4KB page (or fails with ENOMEM if unmapped), and munlock(0x1005, 0)
silently unlocks memory that should remain locked. Conversely, an
aligned mlock(0x1000, 0) is a no-op. Zero-length behavior should be a
consistent no-op regardless of address alignment.

Second, a sufficiently large length wraps around to zero during page
alignment (e.g., len = ULONG_MAX). Because PAGE_ALIGN(x) is defined as:

    (((x) + PAGE_SIZE - 1) & PAGE_MASK)

when len is close to ULONG_MAX, adding (PAGE_SIZE - 1) wraps around:
on a 64-bit system with 4KB pages, ULONG_MAX + 4095 wraps to 4094, and
masking with PAGE_MASK clears the lower 12 bits, producing 0.
When len becomes 0, the subsequent check in apply_vma_lock_flags():

    end = start + len;
    if (end == start)
        return 0;

evaluates to true and immediately returns 0 (success) without locking or
unlocking the requested memory range. Similar wrap-around issues have
previously been addressed in mincore() and madvise() by checking for
zero length after PAGE_ALIGN().

Finally, address addition overflow (start + len < start) is currently
detected only inside apply_vma_lock_flags(), after mmap_write_lock has
already been acquired and memlock rlimits checked, improperly returning
-ENOMEM instead of -EINVAL. Per POSIX.1-2024 and man 2 mlock, arithmetic
overflow of the requested range represents an invalid argument and must
fail with -EINVAL before modifying VMAs or acquiring locks. Note that
apply_vma_lock_flags() already contains:

    if (end < start)
        return -EINVAL;

but this was obscured because rlimit accounting preceded it.

Introduce a common check_mlock_range() helper to:
1. Return 0 immediately for zero-length requests without taking mmap_lock.
2. Validate intermediate and final arithmetic additions using
   check_add_overflow().
3. Reject lengths that wrap to zero under PAGE_ALIGN() with -EINVAL.
4. Detect start + len address overflow before taking mmap_write_lock.

Signed-off-by: Park Tae-sun <ts930@dgu.ac.kr>
---
 mm/mlock.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 8 deletions(-)

diff --git a/mm/mlock.c b/mm/mlock.c
index 39215a3eab1f..203017797076 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -616,6 +616,47 @@ static int __mlock_posix_error_return(long retval)
 	return retval;
 }
 
+/**
+ * check_mlock_range - Validate and page-align the requested address range.
+ * @start: Pointer to the start address. Untagged and page-aligned on success.
+ * @len:   Pointer to the length. Page-aligned on success.
+ *
+ * Return: 0 if the range is valid, or -EINVAL on arithmetic overflow.
+ * If *len is 0, *len remains 0 and 0 is returned; callers should treat this
+ * as a no-op and return 0 immediately without acquiring mmap_lock.
+ */
+static int check_mlock_range(unsigned long *start, size_t *len)
+{
+	unsigned long end;
+
+	/* Untag user pointer (e.g. AArch64 TBI / x86 LAM) before arithmetic. */
+	*start = untagged_addr(*start);
+
+	/*
+	 * A zero-length request must not be rounded up by PAGE_ALIGN()
+	 * to a non-zero range when *start is unaligned. Return 0 so caller
+	 * can exit early without modifying VMAs or taking locks.
+	 */
+	if (!*len)
+		return 0;
+
+	/* Guard against addition overflow between length and start offset. */
+	if (check_add_overflow(*len, (size_t)offset_in_page(*start), len))
+		return -EINVAL;
+
+	*len = PAGE_ALIGN(*len);
+	/* Check whether PAGE_ALIGN() wrapped a non-zero length to zero. */
+	if (!*len)
+		return -EINVAL;
+
+	*start &= PAGE_MASK;
+	/* Reject address wrap-around (start + len < start) before taking locks. */
+	if (check_add_overflow(*start, (unsigned long)*len, &end))
+		return -EINVAL;
+
+	return 0;
+}
+
 static __must_check int do_mlock(unsigned long start, size_t len,
 				 vma_flags_t *flags)
 {
@@ -623,13 +664,12 @@ static __must_check int do_mlock(unsigned long start, size_t len,
 	unsigned long lock_limit;
 	int error = -ENOMEM;
 
-	start = untagged_addr(start);
-
 	if (!can_do_mlock())
 		return -EPERM;
 
-	len = PAGE_ALIGN(len + (offset_in_page(start)));
-	start &= PAGE_MASK;
+	error = check_mlock_range(&start, &len);
+	if (error || !len)
+		return error;
 
 	lock_limit = rlimit(RLIMIT_MEMLOCK);
 	lock_limit >>= PAGE_SHIFT;
@@ -689,10 +729,9 @@ SYSCALL_DEFINE2(munlock, unsigned long, start, size_t, len)
 	vma_flags_t flags = EMPTY_VMA_FLAGS;
 	int ret;
 
-	start = untagged_addr(start);
-
-	len = PAGE_ALIGN(len + (offset_in_page(start)));
-	start &= PAGE_MASK;
+	ret = check_mlock_range(&start, &len);
+	if (ret || !len)
+		return ret;
 
 	if (mmap_write_lock_killable(current->mm))
 		return -EINTR;
-- 
2.43.0

