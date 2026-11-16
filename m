Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813230;
	b=syHRo12PQqVY72cc9EuqQCLtBktbyeiLLVtgKuIcik9uwuuZgSZwiFgH2QBXtTVH/Z/J
	 E7kFe/q9xCywCt4WBDM++hz0/FJU9oGRl7aqPHZxTkihbsgjhdcctkKf2GaEGzkymFzi6
	 Q4vtXpDFH3QrI/jD8RTgNJvkPCSdUCJutbMvd+Nci2y00E95aQP80wX+GR/ZAG8qq5VrY
	 xdrj2M5cxWV0aM/Xymh8nh40cZRb3Xf/e1TsVeHxgffpKvoupVrfINS8vezVMpDgpjRaw
	 oA8hSfyBVX/w3SRoeuKbCesB7o6K3ZbxyFvs5Nsyw1vljw5cpIU4IQ5bd0iymBzMNwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813230;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9qeNI2RHXZCXvhzDDakVQtkHGPRaeLXMhl6FMpu6bHw=;
	b=Zjz6X7kIQS+zPfk5phQ28zdYrYPoNfqsaGZngdDlKXkYkuadH7UyqUxQjH3klWz150tz
	 /XUlZMvcufDn0YpSKS5F0Q9j5xP1ztaCNeDvdj7n3JIUXgPo+qyBkyGvXhX6EDAkaCA86
	 CaiPTbSp2PycPeaxa1bpFX8NrgcsEe4TDlbPLo3we+jS2+71Nqv+vGcnIPg8sfgL1Hcis
	 BpWty37ZeVIeC80s/AX8TENDgWqsbc/BBfflXoWpE3b0e6WMQRBSb+OgZSrfpCqntwT1O
	 UoCAUgX8qYYq1xqFCSyeO/4bUzyTsXrhdxYMbG5Vf7pw2CdZkS6tFYHfKM+KVC3ASkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nU15+g6Q;
	arc=none smtp.remote-ip=95.215.58.212
Received: from mta1.migadu.com (out-212.mta1.migadu.com [95.215.58.212])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62568606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62568606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nU15+g6Q
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HYLuc3Z03vn3hRM0Gt/LGf7o33deLempu7jZPgTKBzU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794813227; v=1; x=1795418027;
 b=nU15+g6Q9HTaGT+miFGfGHMPjGWb7cORDoEa5n5P3MH0yxa9DNG/JyTDSj9BR65gUJ5vob7O
 y5UDPO64mHapryatDOO8bqIaNQvgqYeBr9zvdXwzMcZC6pyCcPzgR39tSCVJ2YJeAsD21ULMd4H
 3y0HAq6MGcSIbAR7cZdqQGI8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0051f0c538c6aaeb;
	Mon, 16 Nov 2026 07:13:47 +0000
X-Mizu-Trace-ID: 0051f0c538c6aaeb
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Hao Ge <hao.ge@linux.dev>,
	stable@vger.kernel.org
Subject: [PATCH v5 02/11] mm/kmsan: undo the shadow mapping when the origin mapping fails
Date: Mon, 16 Nov 2026 15:13:16 +0800
Message-Id: <20261116071325.263682-3-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116071325.263682-1-hao.ge@linux.dev>
References: <20261116071325.263682-1-hao.ge@linux.dev>
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

kmsan_vmap_pages_range_noflush() first maps the shadow pages and then
the origin pages. If the second mapping fails, the first one is left
mapped, and the callers do not roll it back. The next vmap of the
same metadata range hits the stale PTEs again and fails with a
WARN_ON() and -EBUSY in vmap_pages_pte_range().

Undo the shadow mapping on that error path, the same way
kmsan_ioremap_page_range() cleans up after a partial failure.
__vunmap_range_noflush() only clears the PTEs; nothing has touched
the shadow mapping, so no TLB flush is needed.

Fixes: 47ebd0310e89 ("mm: kmsan: handle alloc failures in kmsan_vmap_pages_range_noflush()")
Cc: stable@vger.kernel.org
Suggested-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 mm/kmsan/shadow.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
index 0c88d89bf0d6..212449db34a1 100644
--- a/mm/kmsan/shadow.c
+++ b/mm/kmsan/shadow.c
@@ -258,6 +258,11 @@ int kmsan_vmap_pages_range_noflush(unsigned long start, unsigned long end,
 					    o_pages, page_shift);
 	kmsan_leave_runtime();
 	if (mapped) {
+		/* Undo the shadow mapping set up above. */
+		kmsan_enter_runtime();
+		__vunmap_range_noflush(shadow_start, shadow_end,
+				       gfpflags_allow_blocking(gfp_mask));
+		kmsan_leave_runtime();
 		err = mapped;
 		goto ret;
 	}
-- 
2.25.1

