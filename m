Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289730;
	b=m5iwUPIsi6AMBHURtr93Hcqo1bpsQUBTZkotd3iovooL52tUtZLB4KtUnsorUUKM+3yc
	 +8jVJU3TUiX4od8HpAB6gnCaGYUlJ/xwPwssRJucSCJeklrn34pz4F8E8aVE5NEVqxn/u
	 EjFCDv1biWwSyiFlOdXv8ZqZHZJEcNXBSPfTZHzfu1W44/SeN16xN0aVUWTtT2VHyrekN
	 sDgtvU+CU2YF1UJvPsujWexe057NCG6J+aCJTyWwOzpd8AdEicqrJNnBeMFbVlGKgb9Po
	 LvUSew2+U9VTHBOMlsJaMaMXwicISWPUXUmiAJukKgP8sX825ce7tsOjFInW8bmfPtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=95H+FB1wx8Ke6Q9IRtMFfh2ammpGvU9RDrZEDD8q16o=;
	b=gy+T0J14qDWT68vWuw8L2jRIJTfx0AWSeZp1y0BwLWlj41k7pliu4MVSi4FwuWq2eIQq
	 VpcZVGAarHUiKoohx/l98Y6ZFo6MKtReGDy1s34zl55eDTVwwMUVMH+S03GbnuL3bWlOB
	 IVIL/x5f9A9BOdyMvXsXXAI5CZ+cJAscw1tsgAYxGmoPsgFtoKeqYXO5Dr00yo0bLPSOu
	 I591H+QTcI8oeVuEOL0R6Dk2LAuhzx1EvYIkJ3cEAQswQjumE/JJ0/riZyJfCVmVW1nIu
	 1R7ViliFH7WjzJoJdC6Cio3v0VHNBaDrF9PJBzsAoWGs7ihUuuEi30TSRfZ/Q126C5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=V7MpvIUx;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89821606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89821606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=V7MpvIUx
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso958364a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794289729; x=1794894529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=95H+FB1wx8Ke6Q9IRtMFfh2ammpGvU9RDrZEDD8q16o=;
        b=V7MpvIUxCQm8/ZpQmxbWvqfDn2XVhBpp1GBCGmluIw5Y/yhofzE0jk7TZiNVsgb6fM
         e1WdvCfztegeMS3J6EEBON6XIfe8Y6lqjCfFYSEfisvKzhi7hNzVRQKVhnJ6hg1qeLb+
         l1hX7Yo4ayHaePJe5uJGmWO1G/ywod5/svwOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289729; x=1794894529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=95H+FB1wx8Ke6Q9IRtMFfh2ammpGvU9RDrZEDD8q16o=;
        b=l8WBFPHIECbKg7Hnylkle7/+0Fr/oVnrgHS0xWLgwntIY4Tji2gpyoaZTx70ZZoD4v
         jVSu6N9X0hc36e/VDqxNPo1vdZQZ+xCJpNacyRWgZIIbQI7TfCsqRt5JLRXivGiwT7Bb
         wQJPcZi9ZTn8emrp56P8jvUsyDkIZ7JY0134epzGj17ZuGdKUf+UiYdsU0kOiJYGYCMF
         wzz5TVvUsVbpLB3XzMnfOt8WrZkFOrG8lhZt8Afg38ZDL+Uj7s1Q91FuLBgBq85AjcY8
         PW/7CKtLZFIEi8QTdwTljhV3b2YLnZfat8ZIOHoMvVmezyenC3PF5Gs09HGB6zqwrfVO
         z3Zg==
X-Forwarded-Encrypted: i=1; AL+hErFI1AcnS0nGbCGGyHZ9v7skSxzwACNSgfYOZ02IyLKNXk6sdp2U4WSsDQ9HlOmktq5nZ7j37Khxa5OEYxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m5fuhGOtzjD7cnSsL67piCs7ugNWjgbzufjVzusRbPAlmVupO
	7AD4X1YlRvTtQJSZ0lcnDZAemS0AzTJq44uzNfWfo8tm0KIvYRXW+udIo4wTljlWOfNpw1/5ui6
	giQw=
X-Gm-Gg: AYBFou2fXDJYK1PZUiUenOJ88f9VxHRsdIY4GFeTozqCrohUwhlWrsCzVqDcWX0fJX+
	t69x2/XiGYraRUIS7rXf9yTGrZSn8PeK9R9JXeUtYTBE0pd9Dv31AhTXQPPAAIKzWdOmyxQ1kdn
	t2V5T3HirS5zk3NCbN9w9Rqj7/ZX4j0WdwqOIeJdmT5cEia66gny5Um2gE4VafUYrPda0JVrX4D
	S7tBnQmS6M3Q6tqZzqo+iUtavsybtHiIzfiH+PkWkKqgIVm5R3IJecGo7He+57AdLJrmI9jbR2f
	Olwa2937HwMpQlbec5beW1uOqx2xJmKfL1e4fh6Wh7CEQik5gQV//DP7XsfdWug5gfDEeeNPqoQ
	FOZd5gNVCmFOjJ54CzbMa6fnIRW01GhVCLV1i899miIc0u9//G/3cOlP4MbZFMK8vvHfHZrqWBP
	PSiBlAcUriAm9J+nDJb/+Vq1QI7nw2bAi970jcyYj1FkfOJ5YSNvUhctwu7ZRkn61Lo61wZ79lb
	vWirfSBZElMOdhnfTByCx9AvAo6mTncVf0egYvkNoQ2qdp9IHJXzyPb3wAKdkV3bXu1LjjW0eRU
	2QVKQZTDCe88whwn9oArpU74oYFYMR7QvQIZbnwuBcvdJNqnb6GL2qFNIUGX/L3aKugakMcGlDE
	2EqsF1YrnPA8nnkKR7eI=
X-Received: by 2002:a05:6a21:68b:b0:3e2:21c0:3dfa with SMTP id adf61e73a8af0-3f19058a5d9mr1355701637.66.1794289728711;
        Mon, 09 Nov 2026 21:48:48 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d67e53asm444634a12.5.2026.11.09.21.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:48:48 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v2 01/11] zram: drop stale comment in write_incompressible_page()
Date: Tue, 10 Nov 2026 14:48:06 +0900
Message-ID: <20261110054836.1515030-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
In-Reply-To: <20261110054836.1515030-1-senozhatsky@chromium.org>
References: <20261110054836.1515030-1-senozhatsky@chromium.org>
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

zram doesn't do fast/slow-path handle allocation anymore, so
the comment in write_incompressible_page() is stale.  Drop it.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 632045b65bdb..380615b73446 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -2271,11 +2271,6 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
 	unsigned long handle;
 	void *src;
 
-	/*
-	 * This function is called from preemptible context so we don't need
-	 * to do optimistic and fallback to pessimistic handle allocation,
-	 * like we do for compressible pages.
-	 */
 	handle = zs_malloc(zram->mem_pool, PAGE_SIZE,
 			   GFP_NOIO | __GFP_NOWARN |
 			   __GFP_HIGHMEM | __GFP_MOVABLE, page_to_nid(page));
-- 
2.56.0.506.g506a7eabc5-goog

