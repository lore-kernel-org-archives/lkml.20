Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794535300;
	b=MNq/V2UpmK6y5fQS28dmpJ7PZISOSBjBOw10iC9oDlsIIWRIRq54xChxwiXvKl788tLt
	 nclkx/7rXLGdO2L/DSujkQI2NyoUfHn6hix/re6oFP4dhhzWljk8VNVXEsfk9UKU4zLH1
	 AVTmZJdD39JHnJsQ8woAzWQjuUiDelHNIrXhmlPKnyf0mbEy0zog5ON/JwixRctYe5A0S
	 j3Y9iGASfbh8daEoukmCPG7PM39sveP11duKY5CCIXhZaLDALU4mYUCwT/ddRtBlLlpez
	 cRJ4fGYwU+Wuay/dyNCT3ZAXR4/s4edAIntYVtyoN/1+9bB7yN6O6D+l7wqlPTxiztQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794535300;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+XENL97JZ5WlH8CS4X3HjVZPICr7WyHaHAeuB5MXbDg=;
	b=a2AUa/Wxwc8NsYDauLbshehEo90keQ9XWAQPqIkmeeFalsYDhgCw82/l3blRzKIhxc8k
	 8VzH83dPkVTnZKBEfeS/ydA8JUTgbDCDTD0u+nD/HkC/cGiw+SnOj6B0mjZLiuVPKmH2U
	 ahwU+lxyqOwfZ+6PftOgrQ43nxmDHrgEisuf0Svu8gZw2ANuYuEGeHjE/0ktWrJkIjrXJ
	 iyyrAqy4XMJGU9kjoOsz7qQPyrXE7U7/t6TIP8bGBoqlojx6X/BDxrKN097cxK81G/e+3
	 R8+Pg4KM+FQR8kvCXG4MBZflp0wlU5cF4kcx3y78ISctgDv/FgfQxeZsefcCXBpFsXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LmdpTGXU;
	arc=none smtp.remote-ip=91.218.175.111
Received: from mta0.migadu.com (out-111.mta0.migadu.com [91.218.175.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DB8606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7DB8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LmdpTGXU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=R2j6tp93Fg7E7OEyVaIZBnzP1Orh5kRBAZflasE6mHU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794535297; v=1; x=1795140097;
 b=LmdpTGXULYSoS8ateoj12Yqnr8MFsE6nyU+iFJQAgrSXYujepC3HKsZ6hQWLsXGLG59ZTee7
 xbeaH2Wgyr0t1a/lx+MdPr6biHK39qzLPjOzZKUJibqyTyxIQ0wIvgTCrKEh1E8YBuI/diPMDbJ
 +QKUxTMd47hKufEH+r9bhFVM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c96d663c8789d4dd;
	Fri, 13 Nov 2026 02:01:37 +0000
X-Mizu-Trace-ID: c96d663c8789d4dd
X-Migadu-Flow: FLOW_OUT
From: "Hui Zhu" <hui.zhu@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Hui Zhu <zhuhui@kylinos.cn>
Subject: [PATCH v2] mm/mglru: yield the lru_lock earlier in fill/drain_evictable()
Date: Fri, 13 Nov 2026 10:01:32 +0800
Message-ID: <20261113020132.274013-1-hui.zhu@linux.dev>
X-Mailer: git-send-email 2.53.0
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

From: Hui Zhu <zhuhui@kylinos.cn>

lru_gen_change_state() migrates folios in batches of up to
MAX_LRU_BATCH (4096) folios under lruvec_lock_irq().  A full batch
keeps local interrupts off for up to about a millisecond, and CPUs
contending for the same lru_lock spin with interrupts disabled for
that long.

The caller already reschedules between batches, but a batch itself
only ends after 4096 folios.  Stop it early when a resched is
pending, or when the lock has waiters and the current hold has moved
at least MIN_LRU_BATCH folios; the caller restarts where it left off.
TIF_NEED_RESCHED can still be set with interrupts off: a remote
resched_curr() sets it directly in the target's thread_info.  The
minimum batch avoids lock bouncing under sustained contention, while
a waiter now waits ~15us instead of ~1ms.

This follows lru_gen_look_around() in this file, security/keys/gc.c
and jbd2_log_do_checkpoint(), and commit 6e9be217a3ce ("mm/mglru:
use a smaller batch for reclaim").

Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
---
Changlog:
v2:
Also yield on lock contention after a minimum batch (Kairui Song).

 mm/vmscan.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 6a1af9b92349..c1231925159f 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5533,7 +5533,10 @@ static bool fill_evictable(struct lruvec *lruvec)
 			success = lru_gen_add_folio(lruvec, folio, !active);
 			VM_WARN_ON_ONCE(!success);
 
-			if (!--remaining)
+			/* stop early to shorten the irq-off section */
+			if (!--remaining || need_resched() ||
+			    (MAX_LRU_BATCH - remaining >= MIN_LRU_BATCH &&
+			     spin_is_contended(&lruvec->lru_lock)))
 				return false;
 		}
 	}
@@ -5562,7 +5565,10 @@ static bool drain_evictable(struct lruvec *lruvec)
 			VM_WARN_ON_ONCE(!success);
 			lruvec_add_folio(lruvec, folio);
 
-			if (!--remaining)
+			/* stop early to shorten the irq-off section */
+			if (!--remaining || need_resched() ||
+			    (MAX_LRU_BATCH - remaining >= MIN_LRU_BATCH &&
+			     spin_is_contended(&lruvec->lru_lock)))
 				return false;
 		}
 	}
-- 
2.53.0

