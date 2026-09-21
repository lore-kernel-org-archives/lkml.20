Received: from mta0.migadu.com (out-200.mta0.migadu.com [91.218.175.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D93033A6F1
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996672; cv=none; b=gx3X6MqYRcX9oloKrbdSw7CmcCCd4kW3h/9czUc6PXcas2+MSBOATnnKZmMts9BagEfB10M9zFMhYEjYzSzsmCai+TQyajcD2IomqO6GCScxRhb5oBVac7MobKtyfBIAi82vsr6PxTu52LIJbrWzmigY13z4jqyrDg049JJIV20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996672; c=relaxed/simple;
	bh=TgBqgmk/OGkiRG4oFsrkPk1fFb54WBL3zueWiSKqe7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bKuHwW5gAhih42Dy4ItY2Jg9E+cwqqxWvCafEgGEeO7Bz6/JTRprKCDnQ6hZNXcoBLiLogFJYRpaEC+L7a6IOHLNPaqv40pjfG+ciXPjsqe6HF+TfqHDGvsVZNW34aOqVZzsO5pIuiaw4qoTlxeCSix8KoWO0EN01NbfCxT3vzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=E4vNZoGT; arc=none smtp.client-ip=91.218.175.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="E4vNZoGT"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TgBqgmk/OGkiRG4oFsrkPk1fFb54WBL3zueWiSKqe7I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789996668; v=1; x=1790601468;
 b=E4vNZoGT1Z9K7ZSq8aTtO8JWLC+bxKugBY5+nu/e0Zu3M/HhYKxssxvflfUQqzbWM2Sqsywx
 4uitAdpslgeTvro0v2ET1uPLP9ZOv/xjnkybrDjkoDcwmX9b4o8R8L3iFKziwWVv8bw0FRMvnus
 Ih7RxqEmgQ1AADo942YiqV48=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f052238703df67d5;
	Mon, 21 Sep 2026 13:17:48 +0000
X-Mizu-Trace-ID: f052238703df67d5
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Mon, 21 Sep 2026 21:17:21 +0800
Subject: [PATCH v2 1/3] mm/vmalloc: fix vmalloc_dump_obj address alignment
 for last-page lookups
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vmalloc_dump_obj-v2-1-73fceb3ed1c8@linux.dev>
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

vmalloc_dump_obj() uses PAGE_ALIGN() to normalize the input address
before looking it up in the per-node busy tree.  PAGE_ALIGN() rounds
up, which can push an address in the last page of a vmalloc allocation
to va_end -- outside the [va_start, va_end) range that
__find_vmap_area() searches.  This causes the lookup to miss the VA
and return false, degrading diagnostic output in OOM dumps and KASAN
reports to the less informative "vmalloc memory" fallback.

The upward alignment can also change the addr_to_node() mapping when
the page boundary crosses a vmap zone boundary, causing the search to
hit the wrong node entirely.

Use PAGE_ALIGN_DOWN() instead, which rounds down to the page
containing the address.  This keeps the address within the VA range
and preserves the correct node mapping.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/vmalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 859e6d2d57a3..df42d8a6f058 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -5277,7 +5277,7 @@ bool vmalloc_dump_obj(void *object)
 	unsigned long addr;
 	unsigned long nr_pages;
 
-	addr = PAGE_ALIGN((unsigned long) object);
+	addr = PAGE_ALIGN_DOWN((unsigned long) object);
 	vn = addr_to_node(addr);
 
 	if (!spin_trylock(&vn->busy.lock))

-- 
2.25.1

