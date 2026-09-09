Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077C13148D0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788922715; cv=none; b=u+NoEbRq/qEm8Avfk43ktkrlrpcBkFoUqqlBgVVXuXWGrKaXnwXTqH9cXHaK6Inj50KGTmgFkpSLVxGG3ZGNiMurU+K0jO4DFY94PqMSrREGs1umJbuca+UHvwBzA3YSGM/BeyCTfazOW3/XWPvJ+IYppftV0FlQRCSVO4RYHVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788922715; c=relaxed/simple;
	bh=K7uQcMj7z4luXqRDBQtVBqzLIiGA/6p1ooKeTvkbEwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JLXhCoGszXB/320MgMSNQGl/XxgBXaZMFPiLLC8csI496JZ/28D6krdou/DcqbEyHPAkbnPpW8tlSosBtaWR6ufqxUcTGTSYXxLMGYdtQzTT6SX7h7isAHHTQ3twfGAWyFHP4wWWF3PdzmY65dtsB2WzKgbKIws/NRxLRolUItM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWgCeAsz; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWgCeAsz"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so4438794a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 19:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788922713; x=1789527513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdv4IQZIJENY7PTBs1f5yW/iQydimvcyHFBLXl2Ap5U=;
        b=YWgCeAszWD58jLr8cMamtsH+7cPpBLTa4b3yW3RqNvZLwdRwF+HWW5hroYGTy0ngQQ
         4jr5bB0OjCnxsw+taUOZOuoG8H8prvbIC5NJEvTrZY4B5Ze9SRYhDTunq809zvJz6XyU
         Q5CCOzV5DZuuE2edPLOrgBNbaYx1B3reIvvF6cyA5673Wg3uP39wGGBUd+1eXyUUwojO
         LQLXod0ZmEQfi8uYYmUb5sSO9FeOHach9nG7Wv+blF407x59KCGl+mBLadunxusFQTrS
         t6GEQk0LTAHQMZhBB3vg7/1YP5YqEU4tA9LC3ZgnKWm+BxHxlJy49bPBEPYjWvhmYj1v
         5dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788922713; x=1789527513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sdv4IQZIJENY7PTBs1f5yW/iQydimvcyHFBLXl2Ap5U=;
        b=Yv0Mdfrc/7Z4h4vlzukfG+KHFLd/K8YtQ4GaCuxss4ya9o5gB0Ijtx9Wa+OgdcZdDf
         5BVKUpq1ips6LVr5F+heeEzcTTjJB8toKlI4OkrFNY2TC6eD7FnZ3sWZ8F1/MxKxuWv+
         Xslb1jNCOq54P8KFaDTfyX5EbRPXe8Ch48bAGiDohsV6sgJKRhO6jqBqzNyVyeJudaH5
         S236b+4/W0FIjJVbc+wNUbrIFLt+6eWb5ZBSWpj1nf1jzi5q9fazw6FiMcL2gH6epTuw
         S8XmBX0RlPdbauszYY4/x0fYbyWuIr+WeUFZpz49jFiywlZbFl0Yb4CWxJsyQIfTgYEA
         Reog==
X-Forwarded-Encrypted: i=1; AKwUvByba1kbVdTsbIVEuUs6xWz8l6RDqqUgHC37YNj9Gi4rBf47tUdVZBJIijB+B3/dxkDSh8xEX+J8lgailao=@vger.kernel.org
X-Gm-Message-State: AFuF++k+77VhCg2CGVmPVrFJhCLv7WkAZ5yhTp7hNQ26rBX7ogXZiA+P
	b10zeMt+bPFpb4iCKxoSn9QxdEPqpqb97Nm2ZWMka3eu4JMWhW2vDQfx
X-Gm-Gg: AYBFou0Q5gz2KMtrWtUWEbdFuUzrOuOHm8jWC9VNyWsPubvInSsB9IcPLhKAjfTlOLN
	xsU927T19X0AXF0B+peqwWOhJZ9Q4QsCqoeRdsDyBAWiivIDTgYcRksRSipNRm70rcJMYtonSm9
	JEAqH8REZM3H0ii3GnjuTTjQkT8g869iA80E8GK7cYg8j0kobZ82lUwEPVb9QKK/ZYSUerOGwMa
	L9RDrmG4dDFFVgs0T26MCKjLU/Mz2iPpCs7bUV9drqPnOAV+tgX3e4LX8AxYq5HSPa7Imq9oNO0
	o6zxRV1w68GzYf/IM/1EE1xBIA6/IiKD4JUiZCR2+5hB+TfS7IVj4TaWsfT6eAeC2U1VpGUjEpP
	P7dmvNOfnYTgzZhQp9DQk5hJOM9NKStgt1F8E8/4qIuNZ/ixO6/AAoaD5jZT1XFI8PGvZfiqCQV
	Hz/Qh7VN8gaScjVxSxu05Ph15Dgs9lXanxLuRuK6qjRNhUCURyLL7xn/gCmUxjuP/otoKha2dpm
	jxRsM+U6eC2Cg==
X-Received: by 2002:a17:90b:3a81:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39b2612eaa4mr45424270a91.10.1788922713364;
        Tue, 08 Sep 2026 19:58:33 -0700 (PDT)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39451sm35077172a91.7.2026.09.08.19.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 19:58:32 -0700 (PDT)
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
Subject: [PATCH v5 1/3] mm: khugepaged: fix swap entry value to folio_pfn()
Date: Wed,  9 Sep 2026 10:58:01 +0800
Message-ID: <20260909025804.3233645-2-vernon2gm@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909025804.3233645-1-vernon2gm@gmail.com>
References: <20260909025804.3233645-1-vernon2gm@gmail.com>
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

Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Fixes: d41fd2016ed0 ("mm/khugepaged: add tracepoint to hpage_collapse_scan_file()")
Cc: stable@vger.kernel.org
Signed-off-by: Vernon Yang <yanglincheng@kylinos.cn>
---
 include/trace/events/huge_memory.h | 6 +++---
 mm/khugepaged.c                    | 7 ++++++-
 2 files changed, 9 insertions(+), 4 deletions(-)

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
index e6947fe142ee..6ee0ad13a31f 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2690,6 +2690,7 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 	int present, swap;
 	int node = NUMA_NO_NODE;
 	enum scan_result result = SCAN_SUCCEED;
+	unsigned long failed_pfn = -1;
 
 	present = 0;
 	swap = 0;
@@ -2722,6 +2723,7 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 
 		if (is_pmd_order(folio_order(folio))) {
 			result = SCAN_PTE_MAPPED_HUGEPAGE;
+			failed_pfn = folio_pfn(folio);
 			/*
 			 * PMD-sized THP implies that we can only try
 			 * retracting the PTE table.
@@ -2733,6 +2735,7 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 		node = folio_nid(folio);
 		if (collapse_scan_abort(node, cc)) {
 			result = SCAN_SCAN_ABORT;
+			failed_pfn = folio_pfn(folio);
 			folio_put(folio);
 			break;
 		}
@@ -2740,12 +2743,14 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 
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
@@ -2780,7 +2785,7 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 		}
 	}
 
-	trace_mm_khugepaged_scan_file(mm, folio, file, present, swap, result);
+	trace_mm_khugepaged_scan_file(mm, failed_pfn, file, present, swap, result);
 	return result;
 }
 
-- 
2.53.0

