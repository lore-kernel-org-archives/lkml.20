Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912807;
	b=5CYzZaK38bBv3Z0KxppJPHkDL1dlCsG46suOfid12Sx22f1a+FD+Mn5Dm+VQQ/ZF9JLS
	 apdvIF5xiFlwQDysqCZQDsHICpxsRPUo5wKLHGMdUXkWfV2RTmO9hWuHCqR+NlIQNTb45
	 WUjgAx9gMXNHGnsG/fSSMckx+asReunzHtj1Rw2XLxFVyvyit+xJ2r8h9AhyniPiWmMaY
	 R8Hih4lrzwbbTykLGKc/+iTiVu88je8o4UBsxZ0yXFTvWflrh80VOg37LSpsvAN0gy1m4
	 FkRfv2LLphakI0RH/raG5xIVVk9jkipa0TiDYAJx+dWIieyF5BA2eEKHb6vcJU7Po/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912807;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=HAGt6qzxx+w+fhbni5wKqfd6ztTkFtnAu2zDI7HIbt0=;
	b=MrA+evZhw55EKk0zWQI6A1MeyTAYK51nUrv5HpMkSxpecsTBGjO+V/5lT6zwqr6DuV9a
	 T9v9yaRAheiI78JR2yqEUQT2RFfnLdWX9R/oI+MMCFJjoBd994hBKXaZGzqhg9Gfz8vvL
	 2Qp7CtDQ6nVUJdMEKM+lArYqH/ZdT+C7jgZbjfcQEWJiy09S1kGoHVakwwNefGs0H/EB9
	 3HXREGPm9YBX/0PrcorwGUGJfbqAZxnIBByIZtAH/ku+7iR4axV2KyIXR82jiod+tshqI
	 +GhJO1pivwe4joJxQR6rzedXfLPJpmu4WdbpfA7UUsFUAbS+BVwjyCqnx+evf437Ewg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MO0yzEhJ;
	arc=none smtp.remote-ip=91.218.175.75
Received: from mta0.migadu.com (out-75.mta0.migadu.com [91.218.175.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8104E606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8104E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MO0yzEhJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=T7WRqNFtG9jzZZ1hVnlsHUAqoqC/MPMVJHymMdDaapM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794912803; v=1; x=1795517603;
 b=MO0yzEhJ7/LWnxZ/7Ww87e7kVdgPkwAV9gDuFa77F/Rpq0SJnhsozzN7jEsMQKDs8KgkiqSl
 InQDxbk2sQIvKRMVOuO14iaDDS/cnK060dCpoxSvwa+PNLpQbyAt25nw8IKHOtcwbGbAcIIxxw+
 iPiq62PRL/nnhC3fcgkXeirM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 121bdd006f390358;
	Tue, 17 Nov 2026 10:53:23 +0000
X-Mizu-Trace-ID: 121bdd006f390358
X-Migadu-Flow: FLOW_OUT
From: Hongfu Li <hongfu.li@linux.dev>
Subject: [PATCH 0/2] mm/memfd: drop stale hugetlb allocation mask handling
Date: Tue, 17 Nov 2026 18:53:10 +0800
Message-Id: <20261117-for-memfd-v1-0-fa68f433171e@kylinos.cn>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM2wpAQBRG4VfRvjZlK6O8ilww8w9bOTSDlLy7w
 eVXq3VRgBcEqpKLPA4JsswRnCZkhnbuocRGU57lmplL5RavJkzOKjDrsoB10AXFfvVwcn6vuvk
 d9m6E2d4B3fcDm4pbRG0AAAA=
X-Change-ID: 20261117-for-memfd-e11675edfe65
To: Hugh Dickins <hughd@google.com>, David Hildenbrand <david@kernel.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
Cc: hongfu.li@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Hongfu Li <lihongfu@kylinos.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794912797; l=1020;
 i=lihongfu@kylinos.cn; s=20260915; h=from:subject:message-id;
 bh=T7WRqNFtG9jzZZ1hVnlsHUAqoqC/MPMVJHymMdDaapM=;
 b=SdohuePMWv/Fij6EOUmEMZdDwQm3KeZxjCEuyeJepEbiEekLkdPRPqAhplP1BCkZLJz7FN2gw
 Aq7B479uToQDnLz556nkhs9zxJxDHu4sHUJjnFWBVciFCef7B7qU/c/
X-Developer-Key: i=lihongfu@kylinos.cn; a=ed25519;
 pk=rUpDSpB3neoNZRlGG6dHlFb3RepiJakcev+ucyqaZzw=

The hugetlb allocation mask computed in memfd_alloc_folio() no longer has
an effect. The call site only dequeues folios from the hugetlb pool, so
the mask selects neither a zone nor a migratetype any more. Remove it,
along with the gfp_mask argument it feeds into
alloc_hugetlb_folio_reserve().

Patch 1 drops the redundant narrowing. Patch 2 drops the gfp_mask
argument of alloc_hugetlb_folio_reserve(), whose only caller passes
exactly htlb_alloc_mask(h), and derives that mask inside the helper
instead.

---
Hongfu Li (2):
      mm/memfd: drop redundant hugetlb allocation mask narrowing
      mm/hugetlb: remove the gfp_mask argument from alloc_hugetlb_folio_reserve()

 include/linux/hugetlb.h |  4 ++--
 mm/hugetlb.c            |  3 ++-
 mm/memfd.c              | 14 +-------------
 3 files changed, 5 insertions(+), 16 deletions(-)
---
base-commit: 0bce4c3c7589a80b09a4f21fcb41811cca5153a1
change-id: 20261117-for-memfd-e11675edfe65

Best regards,
--  
Hongfu Li <lihongfu@kylinos.cn>

