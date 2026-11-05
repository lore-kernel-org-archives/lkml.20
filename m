Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.247
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884971;
	b=1jhPBogfX+sh2S5k0OfIVzAD0vmBx0HEFvDoGITjdEDLAa3xErF/Kdin3RfbnMDbhdrS
	 Dfe/i3zf8/u/baDe1ma+dBsSswcF7YNlJx/uNNl3+86cFooPYQGJTYb1f23NEHuW6iibH
	 RTN/vBpwg6367lxQCcu28WIVPhXU+R3ce9ZpZ4kVgbBGm4hjgDHwglhX5C0/ziCB3/YcX
	 Ms3LFYtnLcI2yfAtrnOU9vyD3tERRQLyVi/JV2BqGuYh3xo4DgC1fHGLpNr4P6iJZQpg6
	 B07JRuTHrasHJjmq9C39jS1a2ZaLys0jvjDyN9E/vyEPeqPXUvPozb2772KBWXbmIAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884971;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fri77Ouh0dXSItKeLm+uZQQa1TNA6WNylQ1SLkvlG9s=;
	b=T+l6Qfq4gpRc5/Yox/v5yFprf3ikmoME4V4QxCLt+ZQYueplg82QkvOKoZ1bknkZ4KYR
	 qefevG8zREkNmGt6QzDW8pZkF5b9IP8oK7NUxYxI1nK2qJgkkuubSRPooEJi8mfKbUVR7
	 oUsugsO8ExwYgjE+dyQdnzieYBPQ2ErwPK+8kSdH0kvGI149c1JwW70QY8ofHgbjJDHDg
	 2MRY9Xjn8y3mlBRCnGqGTXDybf3gFRENUfAnkwwz2eUw7h/NFwQo0Mx4/41KJ+pFK46+o
	 RZZ+BYkboo9Qj52jzlnJGrRKR+FLv942anbm5XmgXADj4DU+RBODgJZtntF30dQpNQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=axpKCeIN;
	arc=none smtp.remote-ip=91.218.175.247
Received: from mta0.migadu.com (out-247.mta0.migadu.com [91.218.175.247])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6EC606D821
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD6EC606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=axpKCeIN
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1lVizr8Ol+N2CmNjk66k3Xjp7AKzedZ36gloFs1PijY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793884969; v=1; x=1794489769;
 b=axpKCeINbD4YGzjd9KkMnJyuCLkebbF6Q8aSNteiraie0QLDpBDPxCzYXpdCaqiff/KZ+rSq
 oCJsXjmND0TbUpJA6yKb6SJTktKf+L2gbnVHqA00qcgEmui5tqmujgNI61Dy35asPtMvtC03SWD
 hQR5laQI4uWOTi9Nv/CppMoU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1c23da4eaab331e3;
	Thu, 05 Nov 2026 13:22:48 +0000
X-Mizu-Trace-ID: 1c23da4eaab331e3
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ridong Chen <ridong.chen@linux.dev>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [RFC PATCH 1/3] mm/mglru: skip redundant bitmap store in lru_gen_use_mm()
Date: Thu,  5 Nov 2026 21:22:18 +0800
Message-Id: <20261105132220.2233677-2-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105132220.2233677-1-ridong.chen@linux.dev>
References: <20261105132220.2233677-1-ridong.chen@linux.dev>
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

From: Ridong Chen <chenridong@xiaomi.com>

lru_gen_use_mm() is called from context_switch() on every switch to a
user task and unconditionally sets mm->lru_gen.bitmap to -1. The bitmap
is only cleared by the page table walkers in get_next_mm() during aging,
so between aging passes it is already all ones and the store is
redundant.

The store is not free when the mm_struct is shared: every CPU running a
thread of the same process must take the cacheline in exclusive state,
so the line bounces between CPUs on every context switch. On x86,
switch_mm_irqs_off() returns early when switching between threads of
the same mm, which can make this the only shared write on that path.

Read the bitmap first and only write it when it is not already set.
The semantics are unchanged: the plain WRITE_ONCE() had no ordering
guarantees, and a walker clearing a bit concurrently can be missed in
either version.

Tested on an i7-13700HX (8P+8E cores, 24 threads), with turbo disabled
and the performance governor. On each CPU two tasks sched_yield() to
each other, either as threads of one process (shared mm) or as one
process per CPU (private mm, control). Context switches per second per
CPU, median of 5 runs, averaged over 2 boots of each kernel:

  CPUs   shared mm              private mm
         base     patched       base     patched
     1   1114766  1106870 -0.7% 1104512  1109284 +0.4%
     2   1086513  1110204 +2.2% 1110334  1112209 +0.2%
     4   1085872  1112258 +2.4% 1113146  1112467 -0.1%
     8   1085945  1111371 +2.3% 1111662  1111876 +0.0%
    16    660870   666748 +0.9%  665470   667058 +0.2%
    24    579382   596472 +2.9%  596177   598500 +0.4%

The 16 CPU case uses both SMT siblings of each P-core, which share the
L1/L2, so less of the traffic crosses cores. With the patch, the shared
mm case is within noise of the private mm case.

will-it-scale context_switch1 and sched_yield do not show a difference
(within 1% for both threads and processes): sched_yield runs one task
per CPU and never switches, and context_switch1 leaves the pipe peer
unpinned, so most switches stay on one CPU and the line does not move.

Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 include/linux/mm_types.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 1ed35d258d2e..3680cc0fd714 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1553,7 +1553,8 @@ static inline void lru_gen_use_mm(struct mm_struct *mm)
 	 * used since the last time it cleared the bitmap. So it might be worth
 	 * walking the page tables of this mm_struct to clear the accessed bit.
 	 */
-	WRITE_ONCE(mm->lru_gen.bitmap, -1);
+	if (READ_ONCE(mm->lru_gen.bitmap) != -1UL)
+		WRITE_ONCE(mm->lru_gen.bitmap, -1UL);
 }
 
 #else /* !CONFIG_LRU_GEN_WALKS_MMU */
-- 
2.34.1

