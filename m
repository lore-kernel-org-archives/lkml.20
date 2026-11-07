Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794047463;
	b=4aL//gs6NkrduBgYBDwZWLFHH1jq2b9ta9FdIt6s4MQ07RmAZVDPO2M2mbfnEwTamLJH
	 5I8wK5H/2U3M9QCR8PVioRNjnwXVrMOlLUYACjNh0IyrZyGMMaOY7jm973ZeynxJmyMvB
	 Cm4qKgmpg8nFEbcTRLzQAGQTa4T/Fl/HxciVLRlXhNvGYUjXMalhwaCrk14K7XvydA2ua
	 XgUDHRmW0ScXgQPA3ON1LKbGk6ZdEgrJFoqobjkaYrisC0l98EJMcRckxmHKOaUAyv2pe
	 v+P3W18MjX/jJNmjwDjsND/PLXHmC86XxWUuJXgxC3hYXoOD4DJdLcJrrDkba+W/BgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794047463;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qnfaXKSjzVJK7X+JqrAUXuAfLa2GhSU1USswboGhOL0=;
	b=kG5ajYpHqet8ZXFOLuCcQYVcFuPKzLqK+2bZW73nLynh9arq9bpyaLCiKI81QXLrreAM
	 XvlD2cL2u+Ghf0HJjzNIChZhjzdD4g6tYMcQI67AejBSwF31f9IR5tov5jPdDWUkUmwkU
	 SFYi7NSa1qO2P/eFNHaYUue2P8dDa5MKhwvSrXY1bO1S7uR05BeJsyCzG1SwP5UI97jQK
	 zm3x7I9lMRvlU6G55oPbz4M168qKWykkUbUoFwvhMuWKKIwgYUJ2JUXLjeFKxsXAiEAf3
	 dUzyY3RtZEkYaRONTy+dbXCRodFSiKa6hFi7xygrNioVWmCkW/2SzsnaBHfUZM6T2gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Wc8PkROU;
	arc=none smtp.remote-ip=91.218.175.245
Received: from mta0.migadu.com (out-245.mta0.migadu.com [91.218.175.245])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73988606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73988606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Wc8PkROU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RsCoCmOPMyHJd+R/ztk5rMnp9buDWmn47/QOCHLh9IA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794047459; v=1; x=1794652259;
 b=Wc8PkROUmnrUppOP/U+Uvpe3LJkTskW4WEVIWTvNN2+/MB5KAGCiimASsH9xdK1ghbb7zQ7G
 SuEFF2OWaADsJdilE51qbcrNA6tbY2g/Pp/tLv3fOaKgXv6VwZUZdgYB/uB7MX0Pxtwgu18I6eV
 8MXR1+pjoU6RWhhulg8RnHiE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5feb844c2993f120;
	Sat, 07 Nov 2026 10:30:59 +0000
X-Mizu-Trace-ID: 5feb844c2993f120
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
Subject: [PATCH v3 0/3] mm: hugetlb: fix CMA-related issues
Date: Sat,  7 Nov 2026 18:30:44 +0800
Message-ID: <cover.1794046188.git.zhengqi.arch@bytedance.com>
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
 mm/cma.c                  |  5 +++--
 mm/gup.c                  | 31 +++++++++++++++++++++++++++++++
 mm/hugetlb_cma.c          |  4 ++--
 6 files changed, 39 insertions(+), 34 deletions(-)


base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
-- 
2.54.0

