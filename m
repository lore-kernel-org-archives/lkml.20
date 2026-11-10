Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331175;
	b=2/QG5QJeixHBWJa48TSux64Jihd080kG5GuQITY0sDzMEzz5h9jHeAk5Vpuc4Oyi5yUO
	 QF8g/6hMZ7Dx99YEQxBDouMWVSBxCz9OSFt0rKXW23cX+CyeXIPhjb0d6J6gtrpKhvLrr
	 x6J4N8OJT1qUALKZhIThWtIvCzO4YRJgBVe5AtGAbbwASo8p034u083twleAC2w31U3zl
	 E2v9LSCiAF6+NCEAMhrP/AIN1WxLnLfNUZuYURpwrylKRBYiOjVlEWk12wbFbWbDTNa3x
	 ttCAmKVlz8V5pjPDkgGhgGd2Y9TO3avf5XJkcwgQ/TDc8FcMSXcKaEYHHgfWHtwlfow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331175;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=KFrBAQI4dIm/fP3ro/XqhmpHfLGZgz+aDz0WQQ1iWt4=;
	b=hHfzPkFmViCba4hqZnN4A/3/9eARu6S/pNyPFpyklVBQ6M88oHjllm6AE8mDUrL12A2b
	 ym/QW0WPIUeDLWsl58nQFVVNV7m0BbXaEri2SP6xFxoI1HoR94KkZv4TzVZf3ioRLX7Km
	 dcTiBAHH8Uh1HZn5YJ4SUvJIqP2YcZ6Y6dtpG08ZBp1ZYu7SSGDm/9H8+4nLZ//1GsI0B
	 yRNVKCZ2aKdWHJB0Zy9ilgbaEW0Rh3eDl27wyu7/JEeQTJRV9Mm1+LWnipL92T813WBQC
	 6oGl6Gl4sipuHNcufVueUIn5G+tTmTYx+ObuSYYvaigRrM1KyWonbnekZn0lcUmhkUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OovIHZa3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E417560A260A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OovIHZa3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBBF1F0089F;
	Tue, 10 Nov 2026 17:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794331174;
	bh=KFrBAQI4dIm/fP3ro/XqhmpHfLGZgz+aDz0WQQ1iWt4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OovIHZa3P7XGNFcuOtc9v4pvh1X4IidT9UiIpEQNMPNShZLqJRZLcslYhiieRMeGa
	 I3GVMyyox1TGLLEHeVvRbPwbdZp96PbI1kbgYhgDjMAcmpkrWYXwcw9ei8wPvJloem
	 Y4BzjUsCkU5mhvc4i7md/MaP4Noq6wuHmqd8IkK8VyrRnu4qShhW4HMRLo8oj0XPc4
	 02cgY3EsknZOVNUQ92+gwHgnZPH/+tgv1ZpTLO+OiAT0cpVVIXp5kgN0X7SoVhQe0H
	 8cmG+zn7sPo4HOjmAq0ktxpUuk2llP+vnTQUVON7GM2eR/ncoMijuIzUnL9odkLvxE
	 NgPWs82P0dxng==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 10 Nov 2026 17:19:13 +0000
Subject: [PATCH v3 3/3] mm/khugepaged: release contended mmap read lock
 after scanning enough VMAs
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
Message-Id: <20261110-khugepaged-latency-fix-v3-3-6eea743cf9a3@kernel.org>
References: <20261110-khugepaged-latency-fix-v3-0-6eea743cf9a3@kernel.org>
In-Reply-To: <20261110-khugepaged-latency-fix-v3-0-6eea743cf9a3@kernel.org>
To: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3442; i=ljs@kernel.org;
 h=from:subject:message-id; bh=ckbCh9orwtsZv4mAlUI9tJN6KMn95OOQcVZzcKqPlhw=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI+B4keLg0QF968ozFY+mzChkmtB+YKftN3Yw15KKwh6
 7+zs6u8o5SFQYyLQVZMkeX5F/H9QSJh8zov+LvBzGFlAhnCwMUpABPxrmb4X9x3/dTurd6Pjvzu
 Ej1oeq5p2pLPf+RTQzzS3U/dbDjcYMPIsGNurzzz878TMjQfduf/vSpu0WPQkGkzbze7ye/LF99
 NZQYA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

khugepaged walks an mm's VMAs under the mmap read lock in
collapse_scan_mm_slot(), checking for ineligible VMAs first, and skipping
them if encountered.

It charges cc->progress 1 page against the /sys/.../pages_to_scan budget
when these are encountered, however only checking this budget once an
eligible PMD-spanning VMA is encountered.

It can therefore hold the mmap read lock for a long time if there are a
large number of ineligible VMAs present in an mm, over which time no mmap
write locks (and thus no VMA write locks) can be acquired.

Address this by checking whether the mmap lock is contended after 1-10
ms (depending on CONFIG_HZ), i.e. the granularity of jiffies. This is a
long time for a lock to be held, so is a reasonable compromise for
determining when best to do this.

Skipping an ineligible VMA costs ~100 ns on tested hardware (x86 server),
so a batch of 1024 bounds the lock hold to ~100 us without expensive
high-grained timer checks.

This scales for large numbers of VMAs, and tests with ~1M ineligible VMAs
reduced the maximum mmap read lock hold time from ~93ms to ~110us.

This was also observed to reduce mmap_lock stalls in concurrent threads of
a similar duration. Note that a reader re-acquiring the lock can currently
steal it from a writer that is queued but not yet running, so the full
benefit to writers depends on the linked rwsem change.

Local measurements indicated no change for ordinary use cases, so this is
all upside.

This work came out of investigations into mmap stalls when getting latency
numbers for an unrelated patch series.

Link: https://lore.kernel.org/all/20261105-rwsem-dont-steal-from-queued-writer-v1-1-275e070f426f@kernel.org/
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 mm/khugepaged.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

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
2.56.0

