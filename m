Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470316;
	b=kcf0BQtq4MD/5ZTxwZqgLf4lCQkUIMFE1oDXoodT6s5VgRmGzdsH6eFSCPfh4RKkAqKr
	 450/0LD8kFaqDt4HQPUkrH5KDLenHCgbZvnAeJOMmIFWbiY3xzBlYFKXICK9kjZeiynWB
	 IFjG0DwHNeNXugwRfR0bXpjFQe/vQ3NsO9u8QYrBeXRIv483dS2QQFbGW8I1BjAgPjNRh
	 jNhlVCfFa/KPDRSrcBIAQbIQ/dV2//lH+BrTxD0J8hVzQl1TaCZdJrVOjojHkilEetCjt
	 5XGpxD7h6mXTsPaafg0m8XYZyTIznBMaoTSdwloYgHZayLjj5+gBTpReJaxwYN0KVWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470316;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=mm0f6ZegSc/kIAJAFcHf5HKPATgqgEdOu78KRVCwkOM=;
	b=MdDzqa/YRfuDofTjCDi0rALCEqzUIo/1eS2os/d4oZtNb0oYRYfGDiszjQmVNBfUoHII
	 DjiPw4J0XTqTmGPUliyqJ0gEsq5Y7r28RleAfW6tqSpMbRaiAzLvHexjAEleXJTyPZEpW
	 nnJ68lpkD0crdZJspfn+vGNGRI9eHp65+4bs3JEN9Z5FLVLz2/P1Eb/blhhTmDwjxboNf
	 KIKT8yUlXw8BdHh9sEoYUJrOWckhecQ/T6errWIcMNNYBgOikhXyg3kyAazToPSa3z18z
	 Sevrt/YqrKq9Mw5BV/Z2a5Iqt7FxPA1xYspE/vI5oDBxhrBmsLfs0BSwfzxHoSqpaOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CKYV6iZD;
	arc=none smtp.remote-ip=95.215.58.155
Received: from mta1.migadu.com (out-155.mta1.migadu.com [95.215.58.155])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E31606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5E31606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CKYV6iZD
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=j8LBCrptwcQ++/fqbiB9fY3r4o3bk6mYIL5BmRBs9Dw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794470313; v=1; x=1795075113;
 b=CKYV6iZDRoBsw376ojOHDen9rUUse+0D+4uUQjPzhXoFJ7aSK57sIrW69WOFLaxIFI/TciDF
 hX5u/z+wBOOVHSLDq0HkU4nb3sWYMnTJqXIun1H9htaE5z+dXeCtn51/aOwZbpWzzdkhafEfP6o
 8gtEC0I3Z+EpyPFCfmSdxZaY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 818ae350442c464e;
	Thu, 12 Nov 2026 07:58:33 +0000
X-Mizu-Trace-ID: 818ae350442c464e
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
Subject: [PATCH] mm/mglru: check need_resched() in fill/drain_evictable()
Date: Thu, 12 Nov 2026 15:58:27 +0800
Message-ID: <20261112075827.255602-1-hui.zhu@linux.dev>
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
pending; the caller restarts the migration where it left off.  A
remote resched_curr() sets TIF_NEED_RESCHED directly in the target's
thread_info, so the flag can still be set with interrupts off.

This follows walk_pud_range(), which already pairs need_resched()
with a MAX_LRU_BATCH cap, and commit 6e9be217a3ce ("mm/mglru: use a
smaller batch for reclaim").

Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
---
 mm/vmscan.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 6a1af9b92349..47f2cb25eb46 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5533,7 +5533,8 @@ static bool fill_evictable(struct lruvec *lruvec)
 			success = lru_gen_add_folio(lruvec, folio, !active);
 			VM_WARN_ON_ONCE(!success);
 
-			if (!--remaining)
+			/* stop early to shorten the irq-off section */
+			if (!--remaining || need_resched())
 				return false;
 		}
 	}
@@ -5562,7 +5563,8 @@ static bool drain_evictable(struct lruvec *lruvec)
 			VM_WARN_ON_ONCE(!success);
 			lruvec_add_folio(lruvec, folio);
 
-			if (!--remaining)
+			/* stop early to shorten the irq-off section */
+			if (!--remaining || need_resched())
 				return false;
 		}
 	}
-- 
2.53.0

