Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8174EF12C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718813; cv=none; b=NqA74rjxQaZbDVqADFM1duTKHJLXakiah9EjTKtc8aPxwpyKF84z+HYjbCN1Q6AoIA775/n9AAjyxACQNHs4QqtPm+TqVAnBdGNp5QTgULijlPGOSxQwyEmFbxDBI9ERcTftc5wRYtzJlPP5Wh0W7uGDxG9erdJI90VDn3Q1O0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718813; c=relaxed/simple;
	bh=zRCLwMimizOccUQZdU8RBVY7ZIBT1Z4u20d/Y3pXF4M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lT+G4D+uGiiaEE4Ir3hI4LB1ykgCHV/yjuWqNj4Kr7RwydbBDHQv9QLDGxbrfwPYX8NkGRqixD9SYeuE7NljxsPV+PkdOhJhF/yN8gzgdZds/esCPJ88/QJSUtvJqiU+QeCJagKoGRSCzqJIzEV8K6RAi85D6yZs009WiUayXcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dqikI3r2; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dqikI3r2"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so9298554eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790718811; x=1791323611; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nuLNuJ1Z55MoJniNmyjLk+CRKY+iECn17Vw6UvtIrSs=;
        b=dqikI3r2jYFo2I4YN3S767+V7iSwhvbB5kh4NB+L+/ARPC8KFZzXRrYcW8mcVFCJip
         l7KPYheuxjPhDksJeZjz1InJ8lhAozzAdbGO/2kw8h6P+smeYBDdpX8BMbdOifdyPRWV
         ipy2VfCtHjbCp8zF9OZ1L5gr6F8QvG5x7CqyVQpR+i3dy22Tepu+myNsdgsbGNJd00Oc
         iN0UTrcVwJxL+SqScsMyRnFYY1JzqGHRYZ3sKtWR/bfBW/OfA6IVlECWGJNMtQ/8zpse
         zS2L4cj6SSyVL3R6DxerlSf+n4jT3ncjdEdfhL8SlcCbudmgWISXZAuu1o3hmUSFOeIh
         dYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718811; x=1791323611;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nuLNuJ1Z55MoJniNmyjLk+CRKY+iECn17Vw6UvtIrSs=;
        b=2iIqPffLTR2ssGbDR8WAWh/oInXB9toIlL+J0zSqAt25CS0SulbTbVvRkM9oQQ2rqS
         MAXOVyVCanWAIw4OqXltmKpuSwl3W4W6W/tHOG/53+Q2hQVfg4TeiOHpMNTQyD7lgkVW
         JKykfQZYSceeO3HpG59HMdPnbhzCB/y77K4mC0SiA7vjX3cikzMHY3H3tJ0BvvlvvGc5
         Lf6OUCf9XSgPAEOfVhF8m0BYFCyJC4TTG351lXe8GZDJLljLThzNXpU5H7FlJnv6BKHh
         mhE8wdN0NCjVF7vUe3AJ69+15N9+dH0FTQ8uKJss0SuX10urrYnz5pRqaWIL4SR1z1GA
         xgVQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/TbKkYWcJR2chL3Hg93gdujZ1KbiVGuj9NunGi+gHXx4//oP1euJVJv61BVJLu2DJ+dWoA9/xBNCXKbw=@vger.kernel.org
X-Gm-Message-State: AFuF++nH5hnj2z1LZiJNBIm2+kAYQsJomLiv9HL7bu2njOIX0J0MsXLb
	6JOwMVvYaHl97Sqyo7bFaSsqJwZ1cd0UMjP8ApUL7qK2n4Mm01H7SsvLBOddhMNzqWo6C0pNSYB
	ipQZiK3TQCBHb+rzDbicNcw==
X-Received: from dlbui24.prod.google.com ([2002:a05:7022:3d18:b0:149:cd53:8931])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:f693:b0:149:cad3:302b with SMTP id a92af1059eb24-14c9feb75f3mr759810c88.34.1790718810620;
 Tue, 29 Sep 2026 14:53:30 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:52:01 -0700
In-Reply-To: <20260929215206.516490-1-nilayvaish@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929215206.516490-1-nilayvaish@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929215206.516490-11-nilayvaish@google.com>
Subject: [PATCH 10/15] mm/memory: use folio_page() in fault and CoW paths
From: Nilay Vaish <nilayvaish@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Greg Thelen <gthelen@google.com>, Roman Gushchin <kfree@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

As part of the memdescs effort, struct folio will be allocated
separately from struct page and will no longer overlay the head page.

Replace direct &folio->page and &new_folio->page uses with
folio_page(..., 0) across copy_present_page(), wp_page_copy(),
do_swap_page(), do_set_pmd(), finish_fault(), and do_cow_fault().

No functional change intended.

Assisted-by: LLM
Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
 mm/memory.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 330cde31bf8b..9252ba338112 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1098,7 +1098,8 @@ copy_present_page(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 	 * over and copy the page & arm it.
 	 */
 
-	if (copy_mc_user_highpage(&new_folio->page, page, addr, src_vma))
+	if (copy_mc_user_highpage(folio_page(new_folio, 0), page, addr,
+				  src_vma))
 		return -EHWPOISON;
 
 	*prealloc = NULL;
@@ -4073,7 +4074,8 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 	if (!pfn_is_zero) {
 		int err;
 
-		err = __wp_page_copy_user(&new_folio->page, vmf->page, vmf);
+		err = __wp_page_copy_user(folio_page(new_folio, 0), vmf->page,
+					  vmf);
 		if (err) {
 			/*
 			 * COW failed, if the fault was solved by other,
@@ -4089,7 +4091,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 			delayacct_wpcopy_end();
 			return err == -EHWPOISON ? VM_FAULT_HWPOISON : 0;
 		}
-		kmsan_copy_page_meta(&new_folio->page, vmf->page);
+		kmsan_copy_page_meta(folio_page(new_folio, 0), vmf->page);
 	}
 
 	__folio_mark_uptodate(new_folio);
@@ -5143,7 +5145,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 		ptep = folio_ptep;
 		nr_pages = nr;
 		entry = folio->swap;
-		page = &folio->page;
+		page = folio_page(folio, 0);
 	}
 
 check_folio:
@@ -5697,7 +5699,7 @@ vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct page *pa
 
 	if (!is_pmd_order(folio_order(folio)))
 		return ret;
-	page = &folio->page;
+	page = folio_page(folio, 0);
 
 	/*
 	 * Just backoff if any subpage of a THP is corrupted otherwise
@@ -5908,7 +5910,7 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
 		} else {
 			/* Now we can set mappings for the whole large folio. */
 			addr = vmf->address - idx * PAGE_SIZE;
-			page = &folio->page;
+			page = folio_page(folio, 0);
 		}
 	}
 
@@ -6093,7 +6095,7 @@ static vm_fault_t do_cow_fault(struct vm_fault *vmf)
 	if (!folio)
 		return VM_FAULT_OOM;
 
-	vmf->cow_page = &folio->page;
+	vmf->cow_page = folio_page(folio, 0);
 
 	ret = __do_fault(vmf);
 	if (unlikely(ret & (VM_FAULT_ERROR | VM_FAULT_NOPAGE | VM_FAULT_RETRY)))
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

