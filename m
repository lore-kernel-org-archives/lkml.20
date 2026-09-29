Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7999A4E56E3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718807; cv=none; b=b4l0EEgmBveZyVRD7WzsI28DWOEH1PhGC0gEd95HfgFn6qlgzP9i6M4U4RxLqj5mgNLdGf/mUizdwgUKXe0Q64erJI9VYaiTQ8vFj5EVvRH9j4+wMTsHTp3ovRZ/1CqsDdLnLqJVa24IrBwDaOhOTDrlKzkcFoEKUwDcbBLDhMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718807; c=relaxed/simple;
	bh=WoaJr5tb+hXIrrWsuy1zRip/WZnisitGsg/RZ3PGvzs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZTOhxnhCZR4NbWaDZQlWb2bHoxdT6ih6lkzwG3LMFOeBnDKeIN1zbeIyeqWvZf/zfE/N4dajgmKp29w2dfJQqOgCTzLsqveuSVQdcJeEhqaNPgLOjiCIBMlGwfDZiAnAU8QBZ2iQ6b+c3j70800B0k1PoEd2S0SOaXvFR1jzcPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p8tYE6PP; arc=none smtp.client-ip=74.125.82.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p8tYE6PP"
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34344599f01so3532795eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790718801; x=1791323601; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e6MALMUB95W7jnY9HmZglriqu96XwkYJATP3d1B7IV8=;
        b=p8tYE6PP/k2sxZfbEkEGxywpr7ugb+GXsaWP3scsEONgX9oOgK/58riNg8ZkJ1sm9f
         lpI0m35u8hyWEp0KxFZAUsxZvnbh22IiuXnKCnU1II8CqPe/HLcYFM5p8ZM4DcMVujTh
         ZVAYc4r2ygUMFnF10R65Ow7h2/cQES+aYmUPrLs/UouqlkYdJCjDxNHkwB6Z4msxIzwK
         ZG1Z5mjhF0tQcfO/ULonuxA2/a8ALxcNqUDXNiOKeXLtx6E8gAX+gzh1ABW3yD6tzDMz
         MVjCtXRtbrXkAz+kGUkGNUCggxH2tCXgPQC8Ko+bRVcQq7lYWP12dEDbR2cUt5jf6+n4
         idJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718801; x=1791323601;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e6MALMUB95W7jnY9HmZglriqu96XwkYJATP3d1B7IV8=;
        b=Rm68TZv/Myo6NPh3UTtAJ1HPBCaDa0sCZ2KNlBts1eDuONBxHqV2AIoVsr2rdF0eRn
         2kIR9d8nsrpY647CsYlH9rfT0bHJ525vAy1EsHE1M56TnzdhWFLHPlwlEuYywBYiHlOQ
         NdxhOSrkc00qF/smygvRkxalNVelkQ+XjchoOZPKcKbasE92xecW93byrXs1Ux4WsOEH
         NpbOuWP5/1G65d+RRrtiwkEDwbDPO3QUXxXp1yROK0lVdNn6ZfHXkH/64ec+Y7Kp+3Ff
         jjpr//vOoORyHXmx9nwnQFGeNrqjRYQWCYNXWV6IHGzLgkdqzEPEZ8TLPQYHiKYAA7/1
         WXqA==
X-Forwarded-Encrypted: i=1; AKwUvBz8xVZcX53DMQG8+93d0ChbnwV8HNI52MMpmjwK0pLzab7Qh9TX28S91hh1Tar4rkFwxElPJ88LrNwmh1c=@vger.kernel.org
X-Gm-Message-State: AFuF++lg4ynhBQ56bOsELK06V1A20V6lAZUUGLL62jhAOgJthUucMcH3
	VG1NJwqTAKQ1+PjEKHLrt2+pZEUrjm4jjIRBYqaw9kRTXnrCsx+zkr+Wy3GJs5NFpvOsJtwwNOW
	Rfme31VQ1JHSPYeTw/uciAw==
X-Received: from dlbox7.prod.google.com ([2002:a05:7022:1207:b0:149:432f:988])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:4314:b0:143:271a:8b82 with SMTP id a92af1059eb24-14c9e8643a8mr511036c88.44.1790718800896;
 Tue, 29 Sep 2026 14:53:20 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:51:56 -0700
In-Reply-To: <20260929215206.516490-1-nilayvaish@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929215206.516490-1-nilayvaish@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929215206.516490-6-nilayvaish@google.com>
Subject: [PATCH 05/15] mm/hugetlb_cma: use folio_page() in hugetlb_cma_free_frozen_folio()
From: Nilay Vaish <nilayvaish@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Greg Thelen <gthelen@google.com>, Roman Gushchin <kfree@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

As part of the memdescs effort, struct folio will be allocated
separately from struct page and will no longer overlay the head page.

Pass folio_page(folio, 0) instead of &folio->page to
cma_release_frozen() in hugetlb_cma_free_frozen_folio().

No functional change intended.

Assisted-by: LLM
Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
 mm/hugetlb_cma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/hugetlb_cma.c b/mm/hugetlb_cma.c
index 95fd2d190f0d..e0fdd07cc6a9 100644
--- a/mm/hugetlb_cma.c
+++ b/mm/hugetlb_cma.c
@@ -47,7 +47,8 @@ static phys_addr_t __init memblock_node_memory_size(int nid)
 void hugetlb_cma_free_frozen_folio(struct folio *folio)
 {
 	WARN_ON_ONCE(!cma_release_frozen(hugetlb_cma[folio_nid(folio)],
-					 &folio->page, folio_nr_pages(folio)));
+					 folio_page(folio, 0),
+					 folio_nr_pages(folio)));
 }
 
 struct folio *hugetlb_cma_alloc_frozen_folio(int order, gfp_t gfp_mask,
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

