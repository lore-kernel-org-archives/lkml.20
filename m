Received: from mta0.migadu.com (out-253.mta0.migadu.com [91.218.175.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3047532B989
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789356855; cv=none; b=WYE42QuaHnZmyAlg073YFsgMWGzKyOX2SV+x8tQcImkGkO69xDKWIJGqb3/W+aFspt9XH9bp4S2s70XKET1xrhb4Q5Z1CpL4NSB97K/bRtuI2NPqkn0qbNvLcfp3zlS5wACSwopt/FFa0NX17kWN79hIXzYwnYOBIRVVoChZq8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789356855; c=relaxed/simple;
	bh=0ZUsP0LswRkkip9tShGsyYFmjM0FkrhaBvJDLod4oH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QEZ6I9Bvy/ALu2E7aUm5E6BIbEn2bchRlkoXWitZyo+MFv8XuwzP/DcSLuAIv8UrlIttTRGnrwQjkR2wOnCc5yX+zJwsND6pymGzutUc3y96ae3UQ086VQP5qPIvihNM/1u4LTPhNKiFPVnWXdjt012ehrxvnjlIYR9poJG58EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=frhkQO5L; arc=none smtp.client-ip=91.218.175.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="frhkQO5L"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0ZUsP0LswRkkip9tShGsyYFmjM0FkrhaBvJDLod4oH4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789356851; v=1; x=1789961651;
 b=frhkQO5LtdWunzsKyZlnoLMs62oBHjdMfCTPAklKUW5P9QGe1PVHKCnRQ3OpsYzBIJIX3VT3
 1SHlrmu4hxM7kWsm1SwvExnH9b4UderxbW9qC/bHHvrByOJnXBVEQ/5oQsBurL1fJI6OYtz96qN
 2Ik8uet51XreKvmvdSPAwpNI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 57ee228aeb5f01e7;
	Mon, 14 Sep 2026 03:34:11 +0000
X-Mizu-Trace-ID: 57ee228aeb5f01e7
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Mon, 14 Sep 2026 11:34:00 +0800
Subject: [PATCH 1/3] mm/vmalloc: group xa_init with vbq field
 initializations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vmalloc_study-v1-1-526f68559706@linux.dev>
References: <20260914-vmalloc_study-v1-0-526f68559706@linux.dev>
In-Reply-To: <20260914-vmalloc_study-v1-0-526f68559706@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.14.3

From: Ye Liu <liuye@kylinos.cn>

Move xa_init() next to the other vbq field initializations instead of
after the unrelated vfree_deferred setup.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
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

