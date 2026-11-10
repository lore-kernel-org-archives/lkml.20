Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289741;
	b=ycM8rXmM/11FKSNGek1wElOjYE65XL7acVN+QScGa/4ZsF+Uzq5zPCiEWluCkj7S6YdJ
	 OMXkZRhVnyoC9htCd1hV48AsHtfZSrteInSgE401LtMSf115EYGfF5Ct7XBZRRUw0KQM4
	 FzySttTM0pfttkanXqkIh47ye2YDRPXukls2Ss4VQORasKj0wm+Vzy0kMTTn9ynqLAWJ/
	 /48eU57XBC/mVSudq2lgT/Q+VfHVLY288bSEwBpLpr4xQWVJzFm8b7ReaK92YRbD/ELRZ
	 1Qzsz6AvqWhG6E5NqfN2dbrVbgvQT1cl9y9ogGQDrihn4VeoX3PN04tu+8bwtT3qOLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xEWSzx4ZGcyPZGxiCFnQgQ4OA1lpLc+LVHPbJjOB2UQ=;
	b=rtGwG5VMxi191sh4csZS4O2y0fZeQNKhkLpY92vHZRExexRbvPXpOurUGa6NV5Jl2RB1
	 Di8uEbC7ZFIBitq7NaNaJm40SXtFWY4ojxkulZaxn0QFAt4vMUeo5ehk8flbgEX7PbDye
	 wnXQwmoa1VmJBwOf/m6GGDARRd8y+Odxyu1aNzNUcPWrygrl3/04K06+aEkQVgsip4Os2
	 aM4RuaQPsNqKMPCn3/856ps7OjLJVFb3xQUDayMcwJMDWL70ir7t79JXlqDM+SZuhQTfp
	 N9GWfS+hE9WGyYps3DpOHK6BRg1Bu42T6aJaoLDc3wEm94iiatLx/a0PrJn+y0PGFvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IR6wF7Di;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09964606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09964606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IR6wF7Di
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a070781f63so709901b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794289740; x=1794894540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xEWSzx4ZGcyPZGxiCFnQgQ4OA1lpLc+LVHPbJjOB2UQ=;
        b=IR6wF7Did2sGiE/Vf2nG8/SuD2dZYjeiM6nhvGjMTSRS8m/AwT7K2RlgEPZQoQAEjk
         nOIEPTCcDVfopg8xZe0JhAMbWqzTqrRwhPupKjVu+h8Zf54EMMdlAQjTcyfXTmdNfZWL
         qOv1vpNBqoOPFPmKRg00gLY1HNHafoycGRQpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289740; x=1794894540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xEWSzx4ZGcyPZGxiCFnQgQ4OA1lpLc+LVHPbJjOB2UQ=;
        b=EGCcUddewDbn4S4RpGVcKspbOF972NnmkSvowRizx+mefByO5FwOWjT1/bU+63k61P
         2RcNVZwwz7uxfJGwQ5hs2y1IDgnF0YnTXUfNZWGfKdGQ8MstN5mA9xyOTRJr4kTE6tJ/
         86yt3YlNl7s/e6mOF6hkx0Y3sbt9No5sGblDwwtJKk+1xZJlLD/GxYRGeZeLH+Sbp0ZZ
         udPkha6KlNLd+Rk/jhU9M5QydTyNC4mGcWqfdIfHThBzRCT5r+OZC7Kx6JKWT3JSVlTb
         84Q5RNByqmcXhgseglffy3XO9qGtQEDe6NVTExgVLv/vUfZ6WqtNZl4/LemWmmTU0+Za
         a6lA==
X-Forwarded-Encrypted: i=1; AL+hErFFYRDawtF9JwclMxYGDrp/izX5F20a0Rz9is6R8ocFISVshDe30YydRQeNr7REIRxqKXOKKji14GujUmw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8v8vyQEzOWdq/1Rug/XKUiSiSncphopBOKIe6PFkUXf/Xge2gH
	MSG8zkPrJWc37N5/hbDdT5I/lbffvcBYI6matDuqG13w+TTZFIf551VaLyvNWdZ8oQ==
X-Gm-Gg: AYBFou0gqjVMd9zpPpZ/AhbNBGt3WNviN+fn1E0oKHbMM++tN+POLF8z0cbyduWt32z
	WRJ+XBh89vE8Z0xipLbGuGTxgww0Lc/DolwWzP3+eY6ly7lR5WiAkgCQqfn4s0l1kwB+yEbgmYT
	P7pJHrRWEqzNLYhNuUoH6ZAr9KU57ovCyW1cJwNrkfSoWR2N0IDVbnMJSl/6iSgFRNsEmCeBvmJ
	fUj2Pfs7WXT3nDYZQhLYZPRcSozUq6mSW2LguHe6AwPamrtz/pS/jSjuRjdcJX/EciEk0hwm0GG
	IpKNzKEol77K9Rt79HjRPq65rA9cQjpZ7mRVR27Tyjat4YvrMEhwUMfm2YJS+NDJB50o8vRyucD
	j17ATf3ph9Qh2BynYsuKMftcvNENUyPyTG2cXY52mDPMB2ACVagJ9jZxPvYFFNaogFdmC3pWb17
	ECSNZe1Lo4oOsc837GKxuBO7UFtamqRViyIKmZ0Woedb7yjR8y4EmoEB+5aXVE4uxinSzi3RGdl
	5Q1j7uLz0BZexCCl1h8OXOaGglTPFIGIeO2Fx+MGokOB9XdMWUWY4Zygp3DlvQ3X8AW8DiQwULv
	o1nDNz8oL9mgnmGtgYal7V9IA62dB7E437Tpig5nnszTL7NqGHkSpFY8IDQh5zRYT6BDp8WAgLi
	PJTMj+7CuHyeQt24wYQ==
X-Received: by 2002:a05:6a21:6e04:b0:3e2:3392:53f1 with SMTP id adf61e73a8af0-3f18c6267ebmr1458477637.5.1794289740404;
        Mon, 09 Nov 2026 21:49:00 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d67e53asm444634a12.5.2026.11.09.21.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:48:59 -0800 (PST)
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
Subject: [PATCH v2 05/11] zram: check mem_limit before allocating zsmalloc object
Date: Tue, 10 Nov 2026 14:48:10 +0900
Message-ID: <20261110054836.1515030-6-senozhatsky@chromium.org>
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

zram_can_store_page() is called after zs_malloc(), so once we reach
mem_limit every write that doesn't fit into a partial zspage allocates
a new zspage only to free it right away.

Check mem_limit in zram_write_page() before compressing the page and
allocating from zsmalloc, and update max_used_pages after zs_malloc()
succeeds.  mem_limit was never a hard limit, the allocation that
crosses it happens before the check anyway, so now we can go over the
limit by up to one zspage per concurrent writer, and writes fail early
until enough slots are freed.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 Documentation/admin-guide/blockdev/zram.rst |  4 +++-
 drivers/block/zram/zram_drv.c               | 25 +++++++++------------
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/Documentation/admin-guide/blockdev/zram.rst b/Documentation/admin-guide/blockdev/zram.rst
index 148b7cf3b924..db256c53b127 100644
--- a/Documentation/admin-guide/blockdev/zram.rst
+++ b/Documentation/admin-guide/blockdev/zram.rst
@@ -181,7 +181,9 @@ Set memory limit: Optional
 
 Set memory limit by writing the value to sysfs node 'mem_limit'.
 The value can be either in bytes or you can use mem suffixes.
-In addition, you could change the value in runtime.
+In addition, you could change the value in runtime.  The limit is
+checked before zsmalloc allocation, so memory usage may slightly
+exceed it (by up to one zspage per concurrent writer).
 Examples::
 
 	# limit /dev/zram0 with 50MB memory
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 2c2e11b2b663..d38b20a22595 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -177,8 +177,9 @@ static void mark_slot_accessed(struct zram *zram, unsigned long index)
 #endif
 }
 
-static inline void update_used_max(struct zram *zram, const unsigned long pages)
+static inline void update_used_max(struct zram *zram)
 {
+	unsigned long pages = zs_get_total_pages(zram->mem_pool);
 	unsigned long cur_max = atomic_long_read(&zram->stats.max_used_pages);
 
 	do {
@@ -190,12 +191,10 @@ static inline void update_used_max(struct zram *zram, const unsigned long pages)
 
 static bool zram_can_store_page(struct zram *zram)
 {
-	unsigned long alloced_pages;
-
-	alloced_pages = zs_get_total_pages(zram->mem_pool);
-	update_used_max(zram, alloced_pages);
+	if (!zram->limit_pages)
+		return true;
 
-	return !zram->limit_pages || alloced_pages <= zram->limit_pages;
+	return zs_get_total_pages(zram->mem_pool) <= zram->limit_pages;
 }
 
 #if PAGE_SIZE != 4096
@@ -2266,10 +2265,7 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
 	if (IS_ERR(handle))
 		return PTR_ERR(handle);
 
-	if (!zram_can_store_page(zram)) {
-		zs_free(zram->mem_pool, handle);
-		return -ENOMEM;
-	}
+	update_used_max(zram);
 
 	src = kmap_local_page(page);
 	zs_obj_write(zram->mem_pool, handle, src, PAGE_SIZE);
@@ -2308,6 +2304,9 @@ static int zram_write_page(struct zram *zram, struct page *page,
 	if (same_filled)
 		return write_same_filled_page(zram, element, index);
 
+	if (!zram_can_store_page(zram))
+		return -ENOMEM;
+
 	zstrm = zcomp_cstrm_get(zram->comps[ZRAM_PRIMARY_COMP]);
 	mem = kmap_local_page(page);
 	ret = zcomp_compress(zram->comps[ZRAM_PRIMARY_COMP], zstrm,
@@ -2333,11 +2332,7 @@ static int zram_write_page(struct zram *zram, struct page *page,
 		return PTR_ERR(handle);
 	}
 
-	if (!zram_can_store_page(zram)) {
-		zcomp_cstrm_put(zstrm);
-		zs_free(zram->mem_pool, handle);
-		return -ENOMEM;
-	}
+	update_used_max(zram);
 
 	zs_obj_write(zram->mem_pool, handle, zstrm->buffer, comp_len);
 	zcomp_cstrm_put(zstrm);
-- 
2.56.0.506.g506a7eabc5-goog

