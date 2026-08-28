Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E45437F331
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896804; cv=none; b=h3fW0YqHcKILdNr+yPh5WS6cij3RG6yAzH/WUUhUAnVUgeg3ZCbOItH6lmjM1kLgIbNlWT1Hc8PoBnpTg4NiSj425dvVyk67Vcw8oNJFwrDUKDtwvYviTsXX6mEA2Z4v7WGsos2Ugd+Oc3Ops4tlq0Qg+kHdncm+W/n/QUPeHmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896804; c=relaxed/simple;
	bh=Y3Pxlkk3hzSYzpWCXoMK+05Swu3IcTLWgfLRWxwUd4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SWYxRjhZ0hE02tC+04gHGhKOv+TUeOPLt8czrXyWxvxhtgWkE6HPvOWEkcg+2hIYr6iY9hTqXiPJhcAyfNyfiruPLZqejv99MePSaVsFDzWXEWDUQA9NKOpYFy9GPvJ6KDyfrpG8LSZb7aEu2tyrfsOl8L8pIX156ATklk87Xu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjMg8G76; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjMg8G76"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d71a50caa9so8314755ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787896803; x=1788501603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CxXRXO9cihd6J9ek1BtX6/zY0HVJ8iMxbQFVA3IYgog=;
        b=XjMg8G76FUW7yVRFQqU1SDmLhsJsOwW45apqogrsrFWo/aYUSy1XgQhM0c+Y40rJpF
         Zr1TQPAEYDuQZcCghWFKdkSktxfmUSbwRRgycQdlMsuwzAQY0xER8FJSJz1qZtbtyA/Y
         rJ3R0hAis0TutAI+XL6gaSbsLFjf8xlDsTKXTWryf9ZnwpEvqCqIZ0hblVL9h5IdA1x3
         SkG6hSbCtFPszh7AwrCaNk4Xc6goiygHv4acyCi3IkPaTyBIIauo/k+yxv5FOjB2I/hc
         KDlukGYCsSm7UROFHDJjIPVMEYjA/oTzAYipo/hdgXRMMHJe+npEIk+C5Pk7PBdhifxK
         l3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896803; x=1788501603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CxXRXO9cihd6J9ek1BtX6/zY0HVJ8iMxbQFVA3IYgog=;
        b=pJNJyOS//XM38bJdG/kAIowtb16ru9cbXtw90CgBsV4wvesYiWXBo2jRwDWUSEMnPg
         KHr0ANcSfrO9Z++9SZKEtj5Mx9oT9UwBVAH18mUK7pxLui5KnPYcVTq6okgT35h1kp4c
         Z7tu51ExC9WoiqdM/JO2uX+f6hSU9gnCLaOzBPYIOcrXBbRuw7tPwLNtwGhvsTQUHoW4
         OyK4yZMVBlNT5DtlkgYRAuslg+vckUK0iqNDwG1qpN0Fmgaoe+D7DdOdBW6Tj9AISlE9
         s/dq2YMsiDpUgbMZokJuW89M1Tm+qYAmwy5zyC8GWwdKf3MAHXkqTieeFvpnLpQUe1jn
         MH0A==
X-Forwarded-Encrypted: i=1; AHgh+RocucAFJcQRmL8NzT2mDVzNFxkZj5SwXsvTboKjH2PQi9ZgN6rgjs/H5TJ17JvH2V8BK1C54Ef2IZAd+SQ=@vger.kernel.org
X-Gm-Message-State: AFuF++meSH8SWhDPKLD85gsHTLas6TOJ88c0UOn5Fc+E7S86cHAkuA7H
	5/52DD7OadOn2kzNrKDQvlvTR06Vjx6GXuVycTiXYoJTMNnTEjC/RuxS
X-Gm-Gg: AR+sD12tc3zJshofPJi8jWkPvtpMWuypcvRDv9AHjV7qdxHRpvvoyyLpM2YeWC+xPLm
	YI5R+a9elify9mfoCU7pSqN3NqeYiC2XaVMSIbFHhjEyCryZnD2uq0ZqZo/k/5zffhAE5D5QDPs
	sgEbBuYFC/w2yjIe0yKwd0VHgnFCXW0hHdk82k9GK8ItRXMOAxwMWFM8muIPkOul8Zz2wW6JBOI
	4gGlklxTwrBohpAYr2BE2w8lw7W0gBjfRB1C+Twku3ezhCyI8iWxEuXuNt9H187dYRi5ly93eyB
	2klpH+8Ck/DNCeh9Ha/11Fix290UoRAsWKZPWOxOe6/Myn54cg5Gmwf1mRoXGjLApjDnc5OM6mW
	yE18gBFcKW4BzKOW8BH9diFjw4ieLDJOjmus/SvYq9fXMcTxiqv0/9x6reAd4KvcrLQQ83S7HF2
	33xVgYQ3RC8g+lzT2F2mJFxh8TyAYzJtWO7AARgesh8wbE9zo7yzyzg2Yr2yM6kD8ksNAUmTvLm
	gk=
X-Received: by 2002:a17:90b:264c:b0:396:61f1:da5c with SMTP id 98e67ed59e1d1-396d0e86577mr9497339a91.4.1787896802700;
        Thu, 27 Aug 2026 23:00:02 -0700 (PDT)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea808csm5826241a91.2.2026.08.27.22.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:00:02 -0700 (PDT)
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
Subject: [PATCH v4 3/3] mm: khugepaged: fix folio is used after folio_put/unlock()
Date: Fri, 28 Aug 2026 13:59:26 +0800
Message-ID: <20260828055926.346744-4-vernon2gm@gmail.com>
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

On the rollback path, folio_put() has already dropped the last reference
of new_folio. On the success path, new_folio is already unlocked and can
be freed concurrently. The trace_mm_khugepaged_collapse_file() is left
with a dangling folio pointer.

So using the folio_pfn() before dropping the reference, closing
use-after-free window.

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Fixes: 4c9473e87e75 ("mm/khugepaged: add tracepoint to collapse_file()")
Cc: stable@vger.kernel.org
Signed-off-by: Vernon Yang <yanglincheng@kylinos.cn>
---
 include/trace/events/huge_memory.h | 6 +++---
 mm/khugepaged.c                    | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/trace/events/huge_memory.h b/include/trace/events/huge_memory.h
index fa828967e1fb..5fb4d92cfd84 100644
--- a/include/trace/events/huge_memory.h
+++ b/include/trace/events/huge_memory.h
@@ -211,10 +211,10 @@ TRACE_EVENT(mm_khugepaged_scan_file,
 );
 
 TRACE_EVENT(mm_khugepaged_collapse_file,
-	TP_PROTO(struct mm_struct *mm, struct folio *new_folio, pgoff_t index,
+	TP_PROTO(struct mm_struct *mm, unsigned long new_pfn, pgoff_t index,
 			unsigned long addr, bool is_shmem, struct file *file,
 			int nr, int result),
-	TP_ARGS(mm, new_folio, index, addr, is_shmem, file, nr, result),
+	TP_ARGS(mm, new_pfn, index, addr, is_shmem, file, nr, result),
 	TP_STRUCT__entry(
 		__field(struct mm_struct *, mm)
 		__field(unsigned long, hpfn)
@@ -228,7 +228,7 @@ TRACE_EVENT(mm_khugepaged_collapse_file,
 
 	TP_fast_assign(
 		__entry->mm = mm;
-		__entry->hpfn = new_folio ? folio_pfn(new_folio) : -1;
+		__entry->hpfn = new_pfn;
 		__entry->index = index;
 		__entry->addr = addr;
 		__entry->is_shmem = is_shmem;
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 4d360ae87769..52b4476898d9 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2256,6 +2256,7 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	struct address_space *mapping = file->f_mapping;
 	struct page *dst;
 	struct folio *folio, *tmp, *new_folio;
+	unsigned long new_pfn = -1;
 	pgoff_t index = 0, end = start + HPAGE_PMD_NR;
 	LIST_HEAD(pagelist);
 	XA_STATE_ORDER(xas, &mapping->i_pages, start, HPAGE_PMD_ORDER);
@@ -2275,6 +2276,7 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	result = alloc_charge_folio(&new_folio, mm, cc, HPAGE_PMD_ORDER);
 	if (result != SCAN_SUCCEED)
 		goto out;
+	new_pfn = folio_pfn(new_folio);
 
 	mapping_set_update(&xas, mapping);
 
@@ -2678,7 +2680,7 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	folio_put(new_folio);
 out:
 	VM_BUG_ON(!list_empty(&pagelist));
-	trace_mm_khugepaged_collapse_file(mm, new_folio, index, addr, is_shmem, file, HPAGE_PMD_NR, result);
+	trace_mm_khugepaged_collapse_file(mm, new_pfn, index, addr, is_shmem, file, HPAGE_PMD_NR, result);
 	return result;
 }
 
-- 
2.53.0

