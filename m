Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379646;
	b=Lms4fNWQlBWGzg/r8sEiB8eAVbDfmMFzHcWubXfsqj4c9RLGtMHe1BVQteCEjcVnPUOm
	 rJArwg5WSMNGIfLpQS3c+5q6rnTdNuhdjA3HvYibCs1OV2FLA7oOHXHBz9UAwoEBZZY7j
	 b3wwrUbEKp+IEOD9Ch4O5ZyI/WazKjWz+CPBba6aAf1tEF4R2VVF/J2jr3qpFVa4pts6V
	 cHAaWvHsvkRScE0M0unXulyD4vbpt+Aqehw7YYweo0ACQpZ9ZqsdJoT113LWuTHm3a50W
	 UE7Bh5RjJKQZwWs4Ja+86ozctwOe+8p5AYuspJfw8rXRjBBlGdlP78cM9fRgzflGhOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379646;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2K5Lo5CC0BJazFf+COtM6z2jABCzILHmwB0Q0hAmwAo=;
	b=XNCLblMs94qlYMJTEpKBWqpWfsUdQBA3PD5Th0EllvhpRGjY2kgwxPsnIzf7Fw413mW6
	 OqDSMkY71AuqdwecOJ4CJ4v6o1fYV/eYWWWA18FbukCSePKfw5J+UwZiOvmO4+bHs7vN/
	 FQeRywtDBOHDqXkEqdcosK3gReRzGesPBEUrWlT4eiOlN+yLPxWha4wf+UgqZ6CxVR+IZ
	 JOn3e07gNtvTI8sKzaNcC6ixKxpTH5WEB+UiWBIqaFpRKoAG1y98+2iM49Ik2JFNmc5zd
	 TZp7AFUuzsKQ4EJfBvL/cuiP5RhWjOA0IwaBJa8lZU1bpIKwFhjrcObhciHrQRfRZhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SUWGwlkL;
	arc=none smtp.remote-ip=95.215.58.78
Received: from mta1.migadu.com (out-78.mta1.migadu.com [95.215.58.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A387606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A387606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SUWGwlkL
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Zhr+OZCIJ+rG7prkwF1NKaUKd7dwOdP2HKtFKrke94Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794379643; v=1; x=1794984443;
 b=SUWGwlkL6ZDFRJe6894EcZFQYnKd4hGK88rCP0v1R9QJBeD/khVFLxwEplhrQpP7cDrYv8up
 iA7OHKhsGGgyIS3+o5eZxfQ+n5jcNAT0nsFn6Qy6SZkMqgaQLs8ox2o2mlHqZSJRzDX0Af6Ql/s
 QlF46bGd7w0KE1h6OQlqzElE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c58a145eb21155fb;
	Wed, 11 Nov 2026 06:47:23 +0000
X-Mizu-Trace-ID: c58a145eb21155fb
X-Migadu-Flow: FLOW_OUT
From: Qi Zheng <qi.zheng@linux.dev>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	azpijr@gmail.com,
	lance.yang@linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v4 0/3] mm: hugetlb: fix CMA-related issues
Date: Wed, 11 Nov 2026 14:46:49 +0800
Message-ID: <cover.1794379433.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.48.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Qi Zheng <zhengqi.arch@bytedance.com>

Hi all,

This series fixes three CMA-related issues in HugeTLB reservation,
long-term pinning and allocation:

 - Avoid ineffective CMA reservations on 32-bit x86 kernels running on
   CPUs that advertise 1 GiB page support.
 - Allow long-term pins of explicitly CMA-allocated HugeTLB folios,
   which already own the CMA memory.
 - Preserve the caller's GFP mask when allocating from CMA.

Changes in v4:
 - add comment to cma_alloc_frozen_compound().
   (suggested by Oscar Salvador)
 - collect Reviewed-by tag.
 - rebase onto next-20261110.

Changes in v3:
 - Drop the cpuset fix. A more comprehensive fix across the HugeTLB
   allocation paths will follow in a separate patchset.
 - Check for __GFP_COMP instead of adding it in
   cma_alloc_frozen_compound(), and leave __GFP_NOWARN to callers.
   (suggested by Oscar Salvador)
 - Clarify the CMA ownership comment in folio_is_longterm_pinnable().
   (suggested by Muchun Song)
 - Collect Reviewed-by and Acked-by tags.

Changes in v2:
 - Replace the PF_MEMALLOC_PIN allocation restriction with a GUP exception
   for HugeTLB folios marked HPG_cma. (suggested by Muchun Song)
 - Pass the caller's GFP mask through cma_alloc_frozen_compound() instead
   of skipping CMA when direct reclaim is disallowed.
   (suggested by sashiko)
 - Remove unnecessary revalidation of successfully allocated folios after
   cpuset changes. Retry only failed allocations.
   (pointed by Jose A. Perez de Azpillaga)
 - collect Reviewed-by and Acked-by.
 - Rebase onto next-20261104.

Thanks,
Qi

Qi Zheng (3):
  x86: hugetlb: disable default CMA reservations on 32-bit kernel
  mm: gup: allow long-term pins of CMA-allocated HugeTLB folios
  mm: hugetlb: fix GFP mask propagation to CMA

 arch/x86/mm/hugetlbpage.c |  2 +-
 include/linux/cma.h       |  2 +-
 include/linux/mm.h        | 29 +----------------------------
 mm/cma.c                  | 10 ++++++++--
 mm/gup.c                  | 31 +++++++++++++++++++++++++++++++
 mm/hugetlb_cma.c          |  4 ++--
 6 files changed, 44 insertions(+), 34 deletions(-)


base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
-- 
2.54.0

