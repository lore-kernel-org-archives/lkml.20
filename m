Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001784;
	b=SZuluQEhpZ8SVCoQxdhBF+MiWD9s11KhaCGO0yun4qdHnD4R+O0FRBW0UUpABzB2kSPY
	 2SP2f26lGRxynrEJf9Cd7MVVqENpPJhmGEeZlOXOJW+1v0cvRgHIsE0OR9pgWV3tcCrVH
	 RWI5u+oiUjd0c4mMfROcY98c8/KQ3Z9CJ/Nb3fvzevucMj+KWIAmOzJbaxOVwqjL880kK
	 SmslqmNR+VvxOwvo2hJj2yGjHnJfwa/FPTWV50mfmJ3CsX5nok7MbBC3JUeg9ISR9sZ7+
	 LGxXFhEjsPiQ2uTVEoVdUTojwjulyJrXsiZKcW65K40zSPQqxcB4tBeAXu2EuAsLnXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001784;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F50Qplwui3CICEAhuivMriFrkJSXdydW0DAGmo57Xtw=;
	b=q0Lqt0aYsNO1OQbKyNY2G0BYvGF4CbCQYn0dGnduuUWGs8a1sEAzh4gqDpxbLivxBV2u
	 4heBhnPxSP3veLQJKzPu98jG6Zsn5V0cfvBZUwiLIb9wxgNyrEuuvYXcsStxOQ+BkGx8v
	 2CvtDyhWGqVVY4WJrAuBV+J9hj00LEAbprOdUUxtv86aj4kqynI1MAmPu6nnMy6oMl8TT
	 o8bRvTyWcbL1Z4XPr6Je/G666tu7wuoacNKQupwbXiNOZprULh4FoHPNLuYhZKVGwfzeP
	 lcKBNGDcXl4hpYTfvHk+BSOs6uq+YxiR0WR3aI/P/+4H2Rtt7jBC8i5NwxrJ7ZEklcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UQ28VxWH;
	arc=none smtp.remote-ip=91.218.175.104
Received: from mta0.migadu.com (out-104.mta0.migadu.com [91.218.175.104])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55313606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55313606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UQ28VxWH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pTZFl8UM3ETvokuzfL6iKKBHKQY2m3Ez9MTwzEqi/1A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793001781; v=1; x=1793606581;
 b=UQ28VxWHre72gDnSeRWu3nb1iQZNIm5O3U2D7Zzy8KTK+mN1s0L8AOB27+kZM9fI0+f8G8dY
 NoxqcWBr+OpgCT72GqbU0zwZrZTbaAqWT/S/mizRTjwhFdd6OAQy9+xEfruf1UMlQGS1V5zpE9g
 LukQmeLeovX/4+EjnXt24Xqc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e2e51c17888acd15;
	Mon, 26 Oct 2026 08:03:01 +0000
X-Mizu-Trace-ID: e2e51c17888acd15
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Hao Ge <hao.ge@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	Dev Jain <dev.jain@arm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v3 05/10] mm/vmalloc: reject an unaligned range in vmap_pages_pte_range()
Date: Mon, 26 Oct 2026 16:03:24 +0800
Message-Id: <20261026080329.140244-6-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261026080329.140244-1-hao.ge@linux.dev>
References: <20261026080329.140244-1-hao.ge@linux.dev>
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

commit a739e6b557af ("mm: vmalloc: WARN_ON if mapping size is not
PAGE_SIZE aligned") made vmap_pte_range() warn and bail out when the
size is not a multiple of PAGE_SIZE. Its loop only stops at
addr == end and otherwise steps over it and maps over whatever
follows the page table. vmap_pages_pte_range() has the same kind of
loop but was never given the check.

Add it there as a backstop.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 mm/vmalloc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index d60b99b81ec9..c0f33392c6ad 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -557,6 +557,9 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 	int err = 0;
 	pte_t *pte;
 
+	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
+		return -EINVAL;
+
 	/*
 	 * nr is a running index into the array which helps higher level
 	 * callers keep track of where we're up to.
-- 
2.25.1

