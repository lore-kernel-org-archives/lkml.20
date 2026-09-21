Received: from mta0.migadu.com (out-210.mta0.migadu.com [91.218.175.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019D149E134
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996684; cv=none; b=quHt1uvlEgcLuSF1B2V3YL3pnSs6NhEZvM9vK+yTtikW1f8DuGBoqFIEIpGp1J2DwLCemakn0hbp2yb3jekDULPmYYwzIRMzlq4a3PyYHPErRsH/ST/K9ILfCFs8+CLkW/bYeBlwapV2MugDEvC9zDQuchthWZ+jZNfD+LPHIOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996684; c=relaxed/simple;
	bh=IN3u//Q3+OpLA8rMnVjE8v9xBIK2AikPADGADNf418I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f6n5gGQ9MBXWZr8LbfYduSA8VXgD5bmSXgtna0ywbLmBd1gTnwxpACOwN5S4NClJjUHieB5cAbQn4WFMNcxDSzUuuztdtoebZjFYXdmHJQIMxRCjiHf9g5OmwPa4ANs0gU5HTSOrNnaFBT2FNpf0t1ugpRukkDVd/q3SZYqJTqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=myA1+5KR; arc=none smtp.client-ip=91.218.175.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="myA1+5KR"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IN3u//Q3+OpLA8rMnVjE8v9xBIK2AikPADGADNf418I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789996681; v=1; x=1790601481;
 b=myA1+5KRkTOpFpgN9Q7qgN+XSlBivE/MVPxxYjs+yMiMagjddcNTGevuYj+9z2O5eA4TEJQt
 X0YPrWdUw+XglWLP4iIDUMuTvTxoEvNYtoUhP968mOD6fsh+JU8gbRzxTXlARXkD5e7AQkcp5M7
 5HngVexuaiONVCvxe8lRki60=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 28b20bafde2dc762;
	Mon, 21 Sep 2026 13:18:00 +0000
X-Mizu-Trace-ID: 28b20bafde2dc762
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Mon, 21 Sep 2026 21:17:23 +0800
Subject: [PATCH v2 3/3] mm/vmalloc: skip vmalloc_dump_obj for non-vmalloc
 addresses
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vmalloc_dump_obj-v2-3-73fceb3ed1c8@linux.dev>
References: <20260921-vmalloc_dump_obj-v2-0-73fceb3ed1c8@linux.dev>
In-Reply-To: <20260921-vmalloc_dump_obj-v2-0-73fceb3ed1c8@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.14.3

From: Ye Liu <liuye@kylinos.cn>

vmalloc_dump_obj() unconditionally searches all vmap nodes even when
called with a non-vmalloc address (e.g. a slab or stack pointer from
mem_dump_obj()).  Add an is_vmalloc_or_module_addr() check at the
entry to avoid the unnecessary per-node trylock and rb-tree traversal.

Use is_vmalloc_or_module_addr() rather than is_vmalloc_addr() because
module, BPF, and execmem allocations reside in MODULES_VADDR..MODULES_END
on x86_64, arm64, and riscv -- outside VMALLOC_START..VMALLOC_END -- but
are still tracked in the same vmap_nodes rb-tree.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/vmalloc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 30c610f678dc..d8095b558365 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -5277,6 +5277,9 @@ bool vmalloc_dump_obj(void *object)
 	unsigned long addr;
 	unsigned long nr_pages;
 
+	if (!is_vmalloc_or_module_addr(object))
+		return false;
+
 	addr = PAGE_ALIGN_DOWN((unsigned long) object);
 
 	/*

-- 
2.25.1

