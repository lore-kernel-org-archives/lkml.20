Received: from mta0.migadu.com (out-154.mta0.migadu.com [91.218.175.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3626644C662
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547153; cv=none; b=IzSspU6DePfL+joApyhN0WQ+UjB5BLf5QGH4v8GVcoYmqJnSv8b+e1sZvN+zBCqxOsmltStNDJLYZzQyd3Vi91a3r7jboq5weFh8Qu4A1TiGkPa9I/5kN04nKqj3tbQ+llL4SCRWljiQ8ndHiOoMn8Ns8rbhJhN1FUgOuG5zqGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547153; c=relaxed/simple;
	bh=TgBqgmk/OGkiRG4oFsrkPk1fFb54WBL3zueWiSKqe7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f+h5s5DmK8Xw8Qa8RFHxHL7N9tYoyXicMr/683PKsHjSg8kHoAZ4Ny60H1uswe0a/b58UYw4NhV2JpRmW7hUQ4rcVSB9tC6TLykv9KDkxPNf7oNCle921uUBVyrPqOc7+8LKeLh5lN8T+hg/8mHgm8etmBKLWPcTxZpAr+TbRd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mxWZ3a5S; arc=none smtp.client-ip=91.218.175.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mxWZ3a5S"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TgBqgmk/OGkiRG4oFsrkPk1fFb54WBL3zueWiSKqe7I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789547141; v=1; x=1790151941;
 b=mxWZ3a5S60Wa5HGuVt5Xpgegd0w934B026RhIHea/bfbbzJ5TR8xkFXpoch98392Bhy/qz2e
 TNAsCgDySYfWU7PdPwsVIo5bVmZMuD/DEBE1jPe6Ok+Y0i5YC7Ji0WL0jrcSapwE1Mh4FV/nLUt
 5uzORfZMaQHJsXWk1VK9ZUhg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 440f386aa9fdf0d8;
	Wed, 16 Sep 2026 08:25:41 +0000
X-Mizu-Trace-ID: 440f386aa9fdf0d8
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Wed, 16 Sep 2026 16:25:28 +0800
Subject: [PATCH 1/3] mm/vmalloc: fix vmalloc_dump_obj address alignment for
 last-page lookups
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-vmalloc_dump_obj-v1-1-7aa402d224df@linux.dev>
References: <20260916-vmalloc_dump_obj-v1-0-7aa402d224df@linux.dev>
In-Reply-To: <20260916-vmalloc_dump_obj-v1-0-7aa402d224df@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>
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

