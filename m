Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FE0188005
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791023448; cv=none; b=ZG0Mt8VtLfVgCvc9jwe1atmMdPXLsMVX04/lm2JXWhExrRTTo7VRGlmSpRzEx/3sDtRvbnIgWIReqJVHtvLXG6jZXEcvxQ8jK+nl8BAWbZUL4avZJ7u7qHm61Lx8iJkVhXe4IZy/GCkvCB/9vAPM+qbCbi8rh8UemalvgFqH/Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791023448; c=relaxed/simple;
	bh=DShMsqHNVKO91T7Yyb+iFlD3Yt/tA9oiAmE9p8tWelU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cSMn0qPD+pIr4cLHNRF0ZG3uxMMpFiQpmkjbFxeiLVTW0z5uM0v1RhmyM06MGPzBEJdOFG86rga6mjw0N8txk0+wjHdtc9MpD6geA2wC/1xbBWQCeqINdbRHVfFTd8wVRkOGPK9+uJv8VCvA4e241KaerqN+9aIP42o9crEUG04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krUQWJpG; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krUQWJpG"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc794a06e5fso140520a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791023439; x=1791628239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4OIv8n/HT65OVykH/XmjfYmij9l4kWjigrp7qJ7DUYA=;
        b=krUQWJpGHiBGceHvMmIaFhEyAFPx5HaPneahLNOHKK8ViZm/ZmJFlhq/QQGJEG0WqV
         E98khnu84GUfDW1UlYvbrabZAlp/6n26aof9wsdcx2FpwY3o9kPB0zbEmAA2XKy6tZKA
         4pyc3ViM1oH/wbyQihDCHRGf5llcbNPdA8JqeA4cLLe41zXgzjGIg4lwA8hvwi7+s7UD
         U3cLfMhdJE15JEoHdG1VNFS+/XxrAMDOwmR8Qqop0zf3/9ruae9he62QRoR+iY2i9Vsy
         6uuOIZjO4s5l/MkME/QJuX4w73dj93R+y+UbowHC4Wh6mruDEKa7qBBT4611k7fMBy0D
         zrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791023439; x=1791628239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4OIv8n/HT65OVykH/XmjfYmij9l4kWjigrp7qJ7DUYA=;
        b=J0fF6Mn6WkgKk9vTmDc504xjA07VzEyBRQnkb9Nu4pNiteCX15TnWETCq2sv5qRwsP
         3hQagwARBO/R+rDf9+h+EASg93fSwiYxUP+3H+2GSPeWByutXij+P2jq2wXkj5RrBeT5
         thlP9k7/jCnKq3ZhLx3gW669PiEcJ6KY4aR5qegvQu+Bn33kwe8PDjKBudP4DqfoGe1O
         Y23/MQNbNs4OZT/UA/SiXwWITxwKzRJM2om72tkw6WfjKJpUM+O3X3DcwQ3gCGdv2uwf
         ItbBTNfkNyrcKL1YdTgMB03k7yAhjyBRif6s8xKa9rv5O4mI/TXIZulkwlp0lxLIh1R9
         EHpg==
X-Forwarded-Encrypted: i=1; AKwUvByj1i7PzewTUNXATlLBWUTxTB0hESxOVyE5Y2haNbv7KNOSvfsNqdpB5d7U6Hm1h6VgccSIKULxEhm+cfw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2I1VKr0mi+P1iq7sK5rFxvteFvbpf2Ny/iGx5OIIAUq1sMWiC
	4qPG16HQlQlwps9PBSfEW/9pjLL7fn5wEfqx+moN18SFQR00i94QsfE=
X-Gm-Gg: AYBFou2/zNvxQ43DyJIDo00gQSDgtT/9aUXnEEY7waG2LWtkJXqouXjBfnelDOj+dPx
	eE8rmKRCwYOd9+Oyfyru7lvb+kIFKgaAziG0THw8mLZXX7KqZbOzy/Aao2yI2J3vOef7A13ClLw
	CqD8KyVts472nddzB3pcYDaH+UFfDPukHlx65BBu70w55zXY7/ZfcQgSbklLkUP2YC4fugf5rxn
	AA9JHngPAPxPoB/jEQsk2udwuckZfPTf2cEbkzxbH8iz+2kzYgnEStR+h9JrSBdTZjq+h1Gv6MX
	xPJpSzaVo27FhiTatG4i+j0rg9afioVbYUbid3wogz+Di9UJcVXssz518QmIdwxsJfCPx4f0kmo
	FyDKF+AM2rcgflqU064KKtEmo7AlWMsSpYV8sltq+uCpyjb6VdizT/6g2CucOk1VAVNE1OofCJy
	y7iuU1I2L7T4CENOH2W7z16LXoHeukkNcZOLS59dDS3cnSyHWBxhMdtEdTfpBWRWjnAtQQFM7Wa
	gwnT44cs3JMSNVcNwpRI1f2NQ==
X-Received: by 2002:a17:90a:fc47:b0:39e:6a80:b795 with SMTP id 98e67ed59e1d1-3a6cec9b170mr4991753a91.37.1791023438924;
        Sat, 03 Oct 2026 03:30:38 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a709a4e80bsm2121961a91.4.2026.10.03.03.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 03:30:38 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: akpm@linux-foundation.org,
	rppt@kernel.org
Cc: peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	kas@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4 1/2] userfaultfd: clear the inherited uffd bit in move_swap_pte()
Date: Sat,  3 Oct 2026 19:30:29 +0900
Message-ID: <20261003103030.63380-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003103030.63380-1-donggeunyoo.kernel@gmail.com>
References: <20261003103030.63380-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UFFDIO_MOVE on a swapped-out page installs the source PTE at the
destination unchanged, so a uffd bit set on a write-protected or
RWP-protected source lands in a destination VMA that was never
registered for either.  Nothing clears it there, and userspace sees:

 - /proc/<pid>/pagemap reports the page as uffd-tracked (bit 57), both
   while it is swapped out and after it is faulted back in.
 - MADV_COLLAPSE fails with EINVAL on a range containing it, because the
   collapse scan bails on a swap entry with the uffd bit set.
 - With CONFIG_PAGE_TABLE_CHECK, faulting the page in warns.
   do_swap_page() carries the bit into the present PTE and, since the
   destination isn't WP-registered, also makes it writable:

   WARNING: mm/page_table_check.c:202 at __page_table_check_ptes_set+0x185/0x1e0
   Call Trace:
    set_ptes+0x67/0xc0
    do_swap_page+0x990/0xfe0
    __handle_mm_fault+0x7d0/0xeb0
    handle_mm_fault+0x9c/0x250
    do_user_addr_fault+0x207/0x650
    exc_page_fault+0x65/0x150
    asm_exc_page_fault+0x26/0x30

Reaching it takes UFFDIO_MOVE out of a WP- or RWP-protected area into
one that isn't, on a page that is swapped out at the time.  It hasn't
been seen in practice.

A resident page doesn't carry the bit, because move_present_ptes() builds
the destination PTE from dst_vma->vm_page_prot.  Clear it on the moved
swap entry as well, then re-arm it if the destination is RWP-registered.

The WP case has been there since v6.8, where UFFDIO_MOVE was added.

Fixes: adef440691ba ("userfaultfd: UFFDIO_MOVE uABI")
Cc: <stable@vger.kernel.org>
Assisted-by: LLM
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/userfaultfd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 74f04c323c50f..f39f109f17989 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1449,6 +1449,7 @@ static int move_swap_pte(struct mm_struct *mm, struct vm_area_struct *dst_vma,
 	orig_src_pte = ptep_get_and_clear(mm, src_addr, src_pte);
 	if (pgtable_supports_soft_dirty())
 		orig_src_pte = pte_swp_mksoft_dirty(orig_src_pte);
+	orig_src_pte = pte_swp_clear_uffd(orig_src_pte);
 	/* Re-arm RWP on the moved swap entry if dst_vma is RWP-registered. */
 	if (userfaultfd_rwp(dst_vma))
 		orig_src_pte = pte_swp_mkuffd(orig_src_pte);
-- 
2.53.0

