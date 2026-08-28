Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ABE41C6A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896794; cv=none; b=Sl/TKamjwEyY4h6wrtZXMmCk+Kb3JEgtVwGQalHqEChKeNHzrcWfpfbY+yHVLwKrSzWKQ+07dHWIg09SF4ryqe0r/V3EBI0hCnzWislMO/rIsi3882el+Mw7QyKGeaS3XNsOE5vUIUI0/riO6Whl3PioUYDA2AUxGy9TfGuxLNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896794; c=relaxed/simple;
	bh=fb1Dg6UJ5xV3K13FUqbr+ufWbZWL87oJPMlhvOJgiKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EfnGMOI5Qbj+nXSIMBbVoegB2ZJUCtYyjFr8uO8O5eAbtOoj40VY+ZCs1jAulZ4IgybpJhi6L7NEfmP3OlNdA9RPkR5Q77bRT4E1WrqJ1GgqVWWULyTNdwTNlmoJ4EwGX2MPPUOJegTSTTLw0X84F6tq5zdSk9ry5HmtDcJEZmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OIXNMYfn; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIXNMYfn"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso619162a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787896793; x=1788501593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W67g2+Dtuws6uyQi/Oz6Kv22fM7UlvitqiW6NCwEKwg=;
        b=OIXNMYfnmYEh2T4adY6Wvk397NssYgrFi9HjSz43+1w1+GGthJmSlrcow795FqLzv0
         ck8u3AFSxs39PzqFScXkOSix6AHy4FeFOflj9SJqtzVVNgIdTllAq5QlIF17wiaHyveV
         RhKzEwr8yk+0x92rEym/vbgCDcy4owwPbI0d4r4imYc2fxxfsCiIiC9eFOQ4EXwiWmyT
         LOfjOkS8mzhl8j82CZE0armprY2PSJRHAzx4xz+yz8Yzrs3WT9IJCqyFkyOgEiSyfbtt
         y51RciL/N6b4GT/Ibcd5byDQrc55OTOQCwJuVPEjZxfs7R+4kNzTgf2h9Vd4VE3R1xQR
         zP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896793; x=1788501593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W67g2+Dtuws6uyQi/Oz6Kv22fM7UlvitqiW6NCwEKwg=;
        b=bm5h6JFySmUxnWjubyuR8a5mjqkYKELka7yjFO6um9+F9DjTrkrxa3f+c6Y2us0/Rx
         qG31VcZY+WZ4dL0HOjpDoqL4WpTs5nn3dkMjWQ8MvpxCKQVJHnCcifUm8Sc3F/Xs8frR
         po9cLQOvzgimwyXbRVqOiRWZe9aYonbrKW4zcvZo+5FUfrsdH/OKuXTuvEYKzdrvRHNp
         wugqJ4jDq6GKt8gUE3JJw0sE4T0EmrKc+P1M0mKJNtnFq4YOiY8m113SOFP+iJCwMlwY
         rpZxjpbStsKJSLbuJzrI/Li8JNwM1ARY3AS16Hk9rdjhgxqmLsRHaWmkQTTNAZDYWB4i
         CqCw==
X-Forwarded-Encrypted: i=1; AHgh+RqupDuBZ7fQpvvmxf9sk+E+avzOoFlZkEgTUysmpxLOk5O6i6sjMumUk21CsQ1eESkSPHhsOeMGGXO7i18=@vger.kernel.org
X-Gm-Message-State: AFuF++lpxjMMStOsxSpdfqBSiI07ewYH3vWDPfKQVo6MyeR5ThZMriab
	1rfxNfpSDCycdUANR8btmgXxiIlOCYevwQhaz51bTjPp5jCj+xC0OaW0
X-Gm-Gg: AR+sD12FO40KDN89vx2mWy5ZhwHwF143/VXy1YyPNctviRQ1u1fEIc2/mJinqdohlCW
	vscA3ROLMIxfgrbSrN/nedXza5UcKGduzOzP2CZcxdLKFTdep3lJoFGwiIOZBudrTSaACNjvfOC
	iJveoCS8EcGABeLUzNcGuqzDicGlt8RhGQk1zNAT8sPi0eO9L/uxn3d0QwznmpQ5X8hGP9GavRj
	S05bHX5/6/1OkyFkT6px5S1T4lzlpnejDi2+La6jQOoFVw8czsbv15vCs1XmxhqUhYdbMY98OhP
	shk0GRHYt/2ianAVGCv03dbq8QRO9lMIbPefmI4tRfM2IdudkDZkjxNqQFhf36XMG5WiC8YraY1
	X3VJFgKz5NZOP2D3UWCEJBwDLC5c6u/E2sGmfTxrreyGc9m0hxrJV9vdKVnQSPR9giH5FnROygh
	pV0/3GpaBWpaCRjH0ILn0TIlSO4I1DwA0CA8QVqO9FDLuPilj8f3HXt+F/1LH2or4Ly6FqzQDbT
	1d/TAYHdKegHQ==
X-Received: by 2002:a17:90b:5405:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-396d0de4c19mr9263684a91.6.1787896792757;
        Thu, 27 Aug 2026 22:59:52 -0700 (PDT)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea808csm5826241a91.2.2026.08.27.22.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:59:52 -0700 (PDT)
From: Vernon Yang <vernon2gm@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org
Cc: nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	zokeefe@google.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org,
	Vernon Yang <yanglincheng@kylinos.cn>
Subject: [PATCH v4 1/3] mm: khugepaged: fix swap entry value to folio_pfn()
Date: Fri, 28 Aug 2026 13:59:24 +0800
Message-ID: <20260828055926.346744-2-vernon2gm@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828055926.346744-1-vernon2gm@gmail.com>
References: <20260828055926.346744-1-vernon2gm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vernon Yang <yanglincheng@kylinos.cn>

When the swap entries found exceed max_ptes_swap, the loop is left via
break with folio still holding the xarray value that encodes the swap
entry, not valid folio pointer.

That value is passed to trace_mm_khugepaged_scan_file(), which feeds it
to folio_pfn(). On FLATMEM and SPARSEMEM_VMEMMAP, the page_to_pfn() is
plain pointer arithmetic, so the trace event merely prints bogus
scan_pfn. On classic SPARSEMEM, the page_to_pfn() reads page->flags,
dereferencing the tiny encoded integer and oopsing khugepaged whenever
the trace event is enabled.

So when folio is the swap entry value, simply set pfn to -1, just like
exhausted scan naturally.

And the folio_put() has maybe dropped the last reference of folio. The
trace_mm_khugepaged_scan_file() is left with a dangling folio pointer.
so using the folio_pfn() before dropping the reference, closing
use-after-free window.

About calling the respective trace_xxx() functions separately on success
and failure, refer to [1].

[1] https://lore.kernel.org/linux-mm/ao6jVbVHLUmuY2UA@gremlin/

Fixes: d41fd2016ed0 ("mm/khugepaged: add tracepoint to hpage_collapse_scan_file()")
Cc: stable@vger.kernel.org
Signed-off-by: Vernon Yang <yanglincheng@kylinos.cn>
---
 include/trace/events/huge_memory.h |  6 +++---
 mm/khugepaged.c                    | 11 ++++++++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/include/trace/events/huge_memory.h b/include/trace/events/huge_memory.h
index 5a48c5406cce..7b526528f85b 100644
--- a/include/trace/events/huge_memory.h
+++ b/include/trace/events/huge_memory.h
@@ -178,10 +178,10 @@ TRACE_EVENT(mm_collapse_huge_page_swapin,
 
 TRACE_EVENT(mm_khugepaged_scan_file,
 
-	TP_PROTO(struct mm_struct *mm, struct folio *folio, struct file *file,
+	TP_PROTO(struct mm_struct *mm, unsigned long pfn, struct file *file,
 		 int present, int swap, int result),
 
-	TP_ARGS(mm, folio, file, present, swap, result),
+	TP_ARGS(mm, pfn, file, present, swap, result),
 
 	TP_STRUCT__entry(
 		__field(struct mm_struct *, mm)
@@ -194,7 +194,7 @@ TRACE_EVENT(mm_khugepaged_scan_file,
 
 	TP_fast_assign(
 		__entry->mm = mm;
-		__entry->pfn = folio ? folio_pfn(folio) : -1;
+		__entry->pfn = pfn;
 		__assign_str(filename);
 		__entry->present = present;
 		__entry->swap = swap;
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 75639298efc2..b597a3e68606 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2683,6 +2683,7 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 	int present, swap;
 	int node = NUMA_NO_NODE;
 	enum scan_result result = SCAN_SUCCEED;
+	unsigned long failed_pfn = -1;
 
 	present = 0;
 	swap = 0;
@@ -2715,6 +2716,7 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 
 		if (is_pmd_order(folio_order(folio))) {
 			result = SCAN_PTE_MAPPED_HUGEPAGE;
+			failed_pfn = folio_pfn(folio);
 			/*
 			 * PMD-sized THP implies that we can only try
 			 * retracting the PTE table.
@@ -2726,6 +2728,7 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 		node = folio_nid(folio);
 		if (collapse_scan_abort(node, cc)) {
 			result = SCAN_SCAN_ABORT;
+			failed_pfn = folio_pfn(folio);
 			folio_put(folio);
 			break;
 		}
@@ -2733,12 +2736,14 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 
 		if (!folio_test_lru(folio)) {
 			result = SCAN_PAGE_LRU;
+			failed_pfn = folio_pfn(folio);
 			folio_put(folio);
 			break;
 		}
 
 		if (folio_expected_ref_count(folio) + 1 != folio_ref_count(folio)) {
 			result = SCAN_PAGE_COUNT;
+			failed_pfn = folio_pfn(folio);
 			folio_put(folio);
 			break;
 		}
@@ -2771,9 +2776,13 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 		} else {
 			result = collapse_file(mm, addr, file, start, cc);
 		}
+		trace_mm_khugepaged_scan_file(mm, -1, file, present, swap,
+					      SCAN_SUCCEED);
+	} else {
+		trace_mm_khugepaged_scan_file(mm, failed_pfn, file, present,
+					      swap, result);
 	}
 
-	trace_mm_khugepaged_scan_file(mm, folio, file, present, swap, result);
 	return result;
 }
 
-- 
2.53.0

