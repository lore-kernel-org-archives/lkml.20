Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233584;
	b=1dx3RziRlMuc/l8YO2hP344Es3yR8XznjsC5rzRbcTrcKb/sjRa3riTu7N5t6SDAwiKg
	 p68TnkJjFtbGPaTHRmwM6HLXMjO27IY/ylEcCiMQLjzh2LSOP3QhARte07QNbFnUy/A8r
	 5txy3kHHXrJfmZK1jWe+UDYwMdi2HGRUQAE+fwhWGnSVAblX0YdzXqLsu08Ttq6xL3i+o
	 KC3zh0nOCwYZGhEGxK4UMyOYIMPB8pX9Zf0sG/Ve2Oq2ONmoCMX7fA+BFQsrhRuYpyfER
	 q3ZEgJy12IdJd7B4TYMWRJK/9SGH36RWAZU/8qK1wF1sfCwKii0v+BAWWI5UZV+6Cqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233584;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uRrUL/Sj9GAie9CqChw90/XCAsPH+Lp3goKZrDcCREM=;
	b=IYJ8Egos9Xdnm5m7GIe0OPREkV+JdEySS+o8lukH4jq28FG0e6YQ3z9uxT3l9EmgQPJ6
	 roSJGtMcFgsD54G040jtQn/XjK2+oBpbozF5Z/4JBsv0B6WdyqQBdLdq3r1LQgJQ024YE
	 pWvbupZoKOfot00cr0F78oIRChFLyWKiK86pu3tf/eTC0ZH2M19a6E/9VymDq4KCOBtyf
	 4evHFFaEKSgDJNZiqZ3PnF5CknhaKqZjUXmFMH7pEsZ5R5xYgJTTx0leyk8PfNcnYNtBg
	 UcSxWJ/oVnAmk58bds0xG/9XD0aG2K0S+icgjTCdutPrjrqpLpRAE/pXofgWrdhBh/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K21mgRLn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0DB606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K21mgRLn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C09D1F008A1;
	Mon,  9 Nov 2026 14:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794233583;
	bh=uRrUL/Sj9GAie9CqChw90/XCAsPH+Lp3goKZrDcCREM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K21mgRLnyqoFLvs1X8OKuAQXN7wur61w/y1XP4IFX5OQRv5B7djdPS8mqSz95sy0C
	 2DYjY9fgeYV9IvVc+Bp16C60Zf79ZMjqeK+5/XHnXijMWFDENajBZDq11Aml3mgzvm
	 WHtGi/GRNQRQ34cBhdmwZWD/fY2dl95lCS7+8Ivv51VIAZ2+aVZi+/IPC1opm2sz61
	 +CSlX9/fPscw8yEkrKf1LDDefayQBVX2H0bzXbiauyfCqHdOWJs7uwyc8ycos0qSO4
	 FrcP/CpiubfmpEpq5JtZ5v5w3iH1ZK5gRh+DMCvzw0dFqwkCHHMT9JLmgrsl3vDMUB
	 JmOhieZeNhtxg==
Date: Mon, 9 Nov 2026 14:12:57 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mm/khugepaged: release contended mmap read lock
 after scanning enough VMAs
Message-ID: <avHUKAT7-H5Ov5RC@gremlin>
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>
 <au3CUJO9zBMHLx-B@gremlin>
 <8ffe5804-a8a1-4486-b5eb-7ce5f451b77c@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ffe5804-a8a1-4486-b5eb-7ce5f451b77c@kernel.org>

On Mon, Nov 09, 2026 at 03:01:29PM +0100, David Hildenbrand (Arm) wrote:
> On 11/6/26 13:07, Lorenzo Stoakes (ARM) wrote:
> > On reflection, I think this would be better implemented as something like:
> >
> > static void collapse_scan_mm_slot(unsigned int progress_max, ...)
> > {
> > 	unsigned int long lock_start = jiffies;
> > 	...
> >   	for_each_vma(vmi, vma) {
> > 		...
> >                 if (time_after(jiffies, lock_start) && mmap_lock_is_contended(mm)) {
> >                         mmap_read_unlock(mm);
> >                         cond_resched();
> >                         mmap_read_lock(mm);
> >                         lock_start = jiffies;
> >                         vma_iter_set(&vmi, mm_slot->address);
> >                         continue;
> >                 }
> > 	}
> > }
> >
> > Which avoids magic numbers, and means if we hold the lock for 1-10ms (depending
> > on HZ), which is a long time in the kernel to hold a lock, AND the lock is
> > contended, we drop/reacquire.
>
> That approach indeed sounds better to me regarding lock contention.

Unfortunately it makes things measurably worse (it's not fine-grained
enough). Trying to get a fine-grained timer will involve preemption
disable/enable pairs, so a no go.

This is the alternative I have locally which explains the number, puts VMA in
the name and it applies to _all_ VMAs as requested.

Let me know what you think!

The jiffies version would obviously just be this but with the above, but that
one results in max ~2 ms-level stalls rather than ~200us.

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 7d1414a9b2a5..59bbef61f104 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -66,6 +66,13 @@ static DEFINE_READ_MOSTLY_HASHTABLE(mm_slots_hash, MM_SLOTS_HASH_BITS);

 static struct kmem_cache *mm_slot_cache __ro_after_init;

+/*
+ * The number of VMAs to walk before checking for, and relieving, mmap lock
+ * contention. This bounds the maximum mmap read lock to an estimated ~100 -
+ * 300us depending on hardware.
+ */
+#define KHUGEPAGED_MAX_VMA_SCAN_BATCH 1024
+
 /**
  * struct khugepaged_mm_slot - khugepaged information per mm that is being scanned
  * @slot: hash lookup from mm to mm_slot
@@ -2910,6 +2917,7 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 	struct mm_struct *mm;
 	struct vm_area_struct *vma;
 	unsigned int progress_prev = cc->progress;
+	unsigned int nr_vmas_batch = 0;

 	lockdep_assert_held(&khugepaged_mm_lock);
 	*result = SCAN_FAIL;
@@ -2942,6 +2950,18 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 	for_each_vma(vmi, vma) {
 		unsigned long hstart, hend;

+		/* Relieve mmap lock contention after walking a batch of VMAs. */
+		if (nr_vmas_batch++ >= KHUGEPAGED_MAX_VMA_SCAN_BATCH) {
+			nr_vmas_batch = 0;
+			if (mmap_lock_is_contended(mm)) {
+				mmap_read_unlock(mm);
+				cond_resched();
+				mmap_read_lock(mm);
+				vma_iter_set(&vmi, mm_slot->address);
+				continue;
+			}
+		}
+
 		cond_resched();
 		if (unlikely(collapse_test_exit_or_disable(mm))) {
 			cc->progress++;

--
Cheers, Lorenzo
