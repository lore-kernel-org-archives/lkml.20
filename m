Received: from mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E2F368941
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789440225; cv=none; b=rDuX/e1iFEiR3O/diB32rlB9J8Jbo/Tf09tYNGDvdld+UR3Bayi0TldO+rNmPSR9d7Ewt55SUU3byn2heM/0lval4Wy8ic/GM28FsoL2yRdcUyf1HhiYWhIrODgr8eUgTKlsqOQz4Fb+BhYYqAgisb7uZERlGylIxN78a4K8doM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789440225; c=relaxed/simple;
	bh=DtVe6iy9kJQc88TiAutYrREK+boNgH17VbBNJY5qxyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fBax+P/2rPwvRIlLdTaF/ybwqxk72gAUXtPwH35DMvgxo6xI6zA+zEsYJQKtvlX7L7vMwQZWlqriOyjDfGr8L9Rs40O3gjkXaDepYt9bzsS5Ys3aD0Jp4c3t0fGxgj8ek4HHVCiLTFuhG3Ia4HVcTN9VkJpswW0s7Vylk/HgOYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=V/FRTSn2; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="V/FRTSn2"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DtVe6iy9kJQc88TiAutYrREK+boNgH17VbBNJY5qxyE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789440220; v=1; x=1790045020;
 b=V/FRTSn29A+j4slc/1Ay3rzTNl4t8TUj6+J4EA/vBC7DZI3xgaD8hESrGTOk2lwwNZ33rG5/
 MWeWMgB9Ldw36xftIrZig9Rbl7Y3NRzVof2s0r3q6MsWQzJiXoqMHJyGdRoKZltGT3gveWDyYmN
 KgwXNMjrZJgYZ0M/i6D3Il0A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 17f25854bac11652;
	Tue, 15 Sep 2026 02:43:40 +0000
X-Mizu-Trace-ID: 17f25854bac11652
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Tue, 15 Sep 2026 10:43:30 +0800
Subject: [PATCH v2 1/3] mm/vmalloc: group xa_init with vbq field
 initializations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-vmalloc_study-v2-1-cc4dfe635e22@linux.dev>
References: <20260915-vmalloc_study-v2-0-cc4dfe635e22@linux.dev>
In-Reply-To: <20260915-vmalloc_study-v2-0-cc4dfe635e22@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.14.3

From: Ye Liu <liuye@kylinos.cn>

Move xa_init() next to the other vbq field initializations instead of
after the unrelated vfree_deferred setup.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 859e6d2d57a3..117483dd048c 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -5585,10 +5585,11 @@ void __init vmalloc_init(void)
 		vbq = &per_cpu(vmap_block_queue, i);
 		spin_lock_init(&vbq->lock);
 		INIT_LIST_HEAD(&vbq->free);
+		xa_init(&vbq->vmap_blocks);
+
 		p = &per_cpu(vfree_deferred, i);
 		init_llist_head(&p->list);
 		INIT_WORK(&p->wq, delayed_vfree_work);
-		xa_init(&vbq->vmap_blocks);
 	}
 
 	/*

-- 
2.25.1

