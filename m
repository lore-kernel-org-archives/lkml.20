Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C579463
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986787; cv=none; b=dn2dUXT7HcnM8DJUn0r/d1oNsQ0ttkJ8mYeVLNii0Za6xl23As+zlw8hcFInktz8iWVs4Jy11XqxMvFaf3oPqS1y+ySiF5qYk/4pz0SHW/4oOqoNrL5iRLAGNm68iOY0FKlEUKB2OSue64s/Qm7/A3l0ObZnYo2vhna98X7Sk/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986787; c=relaxed/simple;
	bh=WXr9ldQDU9OnFr0eE0jxZwCY1mTk8mnGOWEHkwmd430=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZwUgzczagY+lVN2PrRALFEkKoTAtEuChBJH3EDilMib5ryqYqE2MvAF8BMbLnZMiLmHFtlnuSBte3aWNYJhkZjpWyUqLNTytgn2wGTnAF6+FvlD751obv80v8f47ysdt+IZKlyzpJMkLWTh1BFmAwbWrLEKAoXolQxg2MZDkR00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FxSpXnrR; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FxSpXnrR"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8881a7875e5so85242b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986785; x=1791591585; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K+i7FF1JdoB4a6M9CS0sHYTwNj12mJrugew1z6DccSk=;
        b=FxSpXnrRwgzt5PLb2ulxlRxb/2kTk2CwsVui9gWaiEWX7fhGtYTYm9J2lsss4ooXfq
         IHGw2GGgELrTGlLaFUBWnXqeGzH7pOlwcsYYPTfZoQwn0X8H1o6pei8YWea/p635AmeO
         ZU0JBmtsGf8D8HVZnQC0xBjHETEdfjx8/IVekFHkEdMBxdi/H89OvSFGvhaPvdkvYhKY
         NCwmdGpy+X577/IIQ0IwWvYBci9yPU6B1JwC5kZuZbkPfjJkdvA/3wTFF6VTEQkviXJq
         iebeYah6d6FzfNm4gR9e2ydDQg8f4aAtVoWnGaiePuOgNorEJ1WELRGj3ia8V68lxxPn
         7p9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986785; x=1791591585;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+i7FF1JdoB4a6M9CS0sHYTwNj12mJrugew1z6DccSk=;
        b=yj/0LqmLEyDhyHYazhzJcqnCwv/g9HQ9sXWQXEnmjOMcVg4EiJt38Hm2K65Nnesdyt
         5ygU+TFld8wCigYcu22p7KNM0fOaWhJrBYx4Rvh4tjcgIwLVzmFWgNypXiNk0GuU1TbU
         0CEO1kR52a3h0F/ahmsjkUQyhq11g1lwKjNaKDnPmelqVmXdNEKLMmx5lBRb3SiDSM8n
         iZYa23eyMOW5Ww1MYBd9xdneZXKKwPwyDp3dqNol4BOaehd9BsOQsHyfIwPrJa+5wL8g
         wXsjQpDrpU7tzjfeoU/+jlQeYvRJfKn3BCWUhGzfaQTAQuEfPrXaSzFF2crnEdq8iFvi
         o+ZA==
X-Forwarded-Encrypted: i=1; AKwUvBxkCLqiHZXDvo5ldgT2nBl5rtr+j1QCATeKHPUNDoRNoOxKwQWhnWzZrb959B6rsTSMMSO4IMkZgjSv3Ws=@vger.kernel.org
X-Gm-Message-State: AFuF++k2JjFgLbHBaVM9+nUYiBZ5EuQ4zsBBN5db5AGa8fjcDAYN433F
	iMQCUKXBpc9Zu5a8kJdZSXWlvw+Cpewk7p5mHUkuEuHyE3WVp/gTUrPf+40xI6xCE+7rrCNcKtt
	DGF4k6bJvkVZ9VO2WUP5rgg==
X-Received: from pfpk16.prod.google.com ([2002:aa7:9d10:0:b0:88b:9d6d:1e0e])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3d0d:b0:880:849d:c07c with SMTP id d2e1a72fcca58-88af665979cmr3880920b3a.25.1790986784885;
 Fri, 02 Oct 2026 17:19:44 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:18:58 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003001859.502725-1-jthoughton@google.com>
Subject: [PATCH v4 1/2] mm/khugepaged: Never install PMDs in
 uffd-minor-registered VMAs
From: James Houghton <jthoughton@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, liam@infradead.org, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Yang Shi <shy828301@gmail.com>, zokeefe@google.com, 
	hughd@google.com, Kiryl Shutsemau <kas@kernel.org>, jthoughton@google.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Userfaultfd minor faults provides userspace with the ability to manually
install PTEs with UFFDIO_CONTINUE. Right now, MADV_COLLAPSE can map
holes in the VMA when a naturally-aligned THP is present. This is not
true for khugepaged collapse: the PTEs will be retracted, but a PMD will
not be installed.

When MADV_COLLAPSE installs a PMD that mapped holes in the VMA,
userspace is likely to expect UFFDIO_CONTINUE to succeed on the
should-be holes. UFFDIO_CONTINUE will fail and return EEXIST.

This is not inherently a problem, as MADV_COLLAPSE is an explicit
userspace action. But, especially because MADV_COLLAPSE can be invoked
by an external process via process_madvise(), a rogue caller could break
a userfaultfd-minor resolver thread.

Userspace cannot generally use MADV_COLLAPSE to resolve userfault minor
faults, as MADV_COLLAPSE will only resolve such faults if a
naturally-aligned THP is present, so this is not a functional
regression for userspace.

The naturally-aligned THP case is the only case where this quirk exists.
Collapsing otherwise requires all PTEs to be present for
userfaultfd-registered VMAs (i.e., max none PTEs is 0), which is
correct. This check is essentially bypassed for naturally-aligned THPs.

Suggested-by: Lance Yang <lance.yang@linux.dev>
Tested-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: James Houghton <jthoughton@google.com>
---
Changes since v3:
  - Prevent page table retraction in patch 1. Please see the comment
    next to it. So this patch now has two hunks instead of one.
  - Reworded the comment and combined the userfaultfd checks in patch 1.
    (Thanks David)
  - Simplified the selftest a bit given the behavior change in patch 1.
  - Undid a change in v3's selftest that incorrectly handled the case
    where MADV_COLLAPSE was not supported entirely.
  - Rebased on top of mm-unstable, which includes Kiryl's changes.
v3: https://lore.kernel.org/linux-mm/20260910023411.514987-1-jthoughton@google.com/
v2: https://lore.kernel.org/linux-mm/20260828222640.1638457-1-jthoughton@google.com/
v1: https://lore.kernel.org/linux-mm/20260828005004.2870750-1-jthoughton@google.com/
---
 mm/khugepaged.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 913086eaf17b..438c4af1c058 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1868,10 +1868,11 @@ static enum scan_result try_collapse_pte_mapped_thp(struct mm_struct *mm, unsign
 		return SCAN_VMA_CHECK;
 
 	/*
-	 * Keep pmd pgtable while the uffd bit is in use; see comment in
-	 * retract_page_tables().
+	 * Don't collapse if there might be PTE markers for userfaultfd-based
+	 * access protection or if collapsing might bypass userfaultfd minor
+	 * faults.
 	 */
-	if (userfaultfd_protected(vma))
+	if (userfaultfd_protected(vma) || userfaultfd_minor(vma))
 		return SCAN_PTE_UFFD;
 
 	folio = filemap_lock_folio(vma->vm_file->f_mapping,
@@ -2093,8 +2094,13 @@ static bool file_backed_vma_is_retractable(struct vm_area_struct *vma)
 	 * and cannot be recycled to a shared PMD. Other vmas can still
 	 * have the same file mapped hugely, but skip this one: it will
 	 * always be mapped in small page size for these registrations.
+	 *
+	 * Userfaultfd-minor-registered VMAs should also not be retracted.
+	 * PMDs will not be installed, as doing so can suppress minor faults.
+	 * If retraction were allowed, khugepaged might continually cause
+	 * unnecessary userfaultfd minor faults for already-CONTINUE'd pages.
 	 */
-	if (userfaultfd_protected(vma))
+	if (userfaultfd_protected(vma) || userfaultfd_minor(vma))
 		return false;
 
 	/*

base-commit: b2b4b29b76dabdee576eba66953a66ca61c5fca0
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

