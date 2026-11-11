Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379650;
	b=zAEZLHvSp0ImDy1vzREoq47py/BPucpjk2lMwulmBgtX0oPNw2urtsYbQsJ77cgpkhjF
	 j1vaIKzOk/P/YE2loSaf0ynlHUqEoI5Lw7uE3tW1xKwIRbiK8HR/xXigWeSdVeT/oYhD6
	 oIVWoTI4XJUCCZCJ6GQMP8HOaPVD9C9jDUjibYaRn0HTvGYlP6dmVxdaJQ+HGvaySHX4L
	 vEEScK9syAjF0/HCiC+yQV36pbgxnSZoywR3w3Nq6+4lKpxgf3nmL6zQ6ldDTMlnwNe9l
	 AjJWV10WWq2cYDcnKIzFoa20O5uvGGBsYa2b5siVeJ42eVzpPCnqo/LQNJxWFpgQ+gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1ir7CRyHEX/3uMqgVqbpHDvK9mkESk561zfXrmyj8v0=;
	b=AzZ1egjnuof/sM0Hyrala/vyfVasAJDYaP5h1VW3VlgDLJuas4x8ebRMzPqqb1M1DXIG
	 sR2bGWW0Yqh3MRRU13ziNd6w5S06JewHwPKbX+XOQ7ku/hdvOW2mFlu/vqO7rC0JkjMk5
	 ZVNAeTfM+3txFxdO6ykdFJjUG0gbV2Uz5mov2zhHG4D7kDejEObOFxMmsBzpPw0noX/pb
	 GvRXx23FnEx6jEVsK2byPhkBbINuagJ3Mrt6zqLnNYphGwgmoJ9YMZou4Kl815PUBeYhy
	 Cx5VHOfAfdWbd/JU8sRlvFicX7qJBQ/hqBKAy88hQLvwX5p/GbhwOhAVAkJTLplU6MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MLENyy2L;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ABB60A5BC4
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4ABB60A5BC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MLENyy2L
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1376589a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794379649; x=1794984449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ir7CRyHEX/3uMqgVqbpHDvK9mkESk561zfXrmyj8v0=;
        b=MLENyy2LvDMD/8IRevEo/r8S8kJeQkpx+xD1OouysJ26Ikr+GFZjSu1bmqki1WruPY
         IixxMIRJBkdaWJtXppunmlG1E23Z7iq90qc45C8b38TnSp1k4v7uhE5NKKb3s6B60FTO
         iuXqCojP+VJhPOJ6oeky9L9D6SocD6a00bE3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794379649; x=1794984449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ir7CRyHEX/3uMqgVqbpHDvK9mkESk561zfXrmyj8v0=;
        b=cVpZnvtVZ9uaLpYGhyKLYEg6KpIApWKg9c9EYVzokIZRxyTA+FqcalZ/Z+vtmkFvn5
         aerNI7XDU1KYf4yrA+bA7kXRf8dAcIJwZYw56iPk+1fgatn8V9quBNXu6PiRQBdU35vV
         OcTRAxSbKDIWoQEZZprWRuqx4xLsb+C4JQOrauc8Dbjj5+5knP+gSNj0IM2TR26vuXam
         oJeqfNQUlOYBaKA677Rne7atuaTBKqQGHIyeLsOQAAzuNLqdXoq72uLM3penMx8cQPYx
         eIOa1y98/IH/Ro+Er3Z99yXUeJEkKxXhwUiM5+QViyqPlzrrapnPEJO86BWOpQsL/7+2
         ky2w==
X-Forwarded-Encrypted: i=1; AL+hErEVUJn89jdCmH5Qqx3m8s6udWJaFJdQutKiwr+HVbE9Ab0oLFdnZ+ceJd5w8wqntqAXthFJ3YtaGaSHck0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9plUDGcEX/eylmnDS6q0g7y+cEqMn5HRADFNwOQmSar5oyrxSx
	debE8OTNEc2Y2cIRkdTbj7a2F30DnbJkUBMh/MAHk3ve/8vBYKLc4UTkOBDAGRxm1g==
X-Gm-Gg: AYBFou1+wBduLNBsX6QgLs6wNCD5OWDz/2Lc7nZFDcXVF8ObBAWWyzuHP7XVUTtEptl
	euNqK+LAP57MVWpEAqwmbFs9JGTCEDkuNo+JWP3kOiEAZkzoMT8j9SiWwoXrsrQ71fXayrWkzhd
	UID0XDi+x/cTcD20t1BWXbe2eiHoxGjVIPpAih4hzZBKNBdCoM66nywhWZWSYoImNu3pFmmikkT
	P9U2Ru+VQBR5n35nEKkitdZVq2X/U6DegaI1B/I5w6w5/csnbq1GApn56j3W4Wryqu6t8ZM5ghA
	lvrlqVDJGDxGiG/b3bTp+8Rxvf7oOPt4lO4zid09SICIp9I+MYPC4lg5EcM23IWufqRMhzApgZU
	Ib+w1IL9jsatKnkff1M+UhfIXIRnezigTujfBcuIYwC0e3zNoLZY70bUmurZLEvzMNQ+0OjSVyH
	kiCN3EcTQJbL4+KMVOLmNcH2JtlVFkPN+kJpxA1mXFf/z6WUhved1pn95Pt66TSz7oNUf778q8m
	7qRo6X4Y7vdpXxc9pUHrL1J2wxYe2mLgGAjg5zaO+bm7vwqxpWGeIusJKP720QOxYG9fZKtvlaT
	v+qLKnGMLoSkw64XDv6THMt7JikhAaH1u5B3mSflIKmMAHQWhekc4X9gMuV1a6VTuwZPuWFurxu
	HhdcuypKzIjcilRV/0Q==
X-Received: by 2002:a17:90b:1344:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3b182ec1ea6mr1487044a91.20.1794379648977;
        Tue, 10 Nov 2026 22:47:28 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:ad6a:b446:df00:78dc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db85a9bsm3268666a91.14.2026.11.10.22.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:47:28 -0800 (PST)
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
Subject: [PATCH v3 05/11] zram: check mem_limit before allocating zsmalloc object
Date: Wed, 11 Nov 2026 15:46:28 +0900
Message-ID: <20261111064707.2568433-6-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
In-Reply-To: <20261111064707.2568433-1-senozhatsky@chromium.org>
References: <20261111064707.2568433-1-senozhatsky@chromium.org>
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

mem_limit can change under us, so read ->limit_pages once.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 Documentation/admin-guide/blockdev/zram.rst |  4 ++-
 drivers/block/zram/zram_drv.c               | 27 +++++++++------------
 2 files changed, 15 insertions(+), 16 deletions(-)

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
index 2c2e11b2b663..74e02cf4f53d 100644
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
@@ -190,12 +191,12 @@ static inline void update_used_max(struct zram *zram, const unsigned long pages)
 
 static bool zram_can_store_page(struct zram *zram)
 {
-	unsigned long alloced_pages;
+	unsigned long limit_pages = READ_ONCE(zram->limit_pages);
 
-	alloced_pages = zs_get_total_pages(zram->mem_pool);
-	update_used_max(zram, alloced_pages);
+	if (!limit_pages)
+		return true;
 
-	return !zram->limit_pages || alloced_pages <= zram->limit_pages;
+	return zs_get_total_pages(zram->mem_pool) <= limit_pages;
 }
 
 #if PAGE_SIZE != 4096
@@ -375,7 +376,7 @@ static ssize_t mem_limit_store(struct device *dev,
 		return -EINVAL;
 
 	guard(rwsem_write)(&zram->dev_lock);
-	zram->limit_pages = PAGE_ALIGN(limit) >> PAGE_SHIFT;
+	WRITE_ONCE(zram->limit_pages, PAGE_ALIGN(limit) >> PAGE_SHIFT);
 
 	return len;
 }
@@ -2266,10 +2267,7 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
 	if (IS_ERR(handle))
 		return PTR_ERR(handle);
 
-	if (!zram_can_store_page(zram)) {
-		zs_free(zram->mem_pool, handle);
-		return -ENOMEM;
-	}
+	update_used_max(zram);
 
 	src = kmap_local_page(page);
 	zs_obj_write(zram->mem_pool, handle, src, PAGE_SIZE);
@@ -2308,6 +2306,9 @@ static int zram_write_page(struct zram *zram, struct page *page,
 	if (same_filled)
 		return write_same_filled_page(zram, element, index);
 
+	if (!zram_can_store_page(zram))
+		return -ENOMEM;
+
 	zstrm = zcomp_cstrm_get(zram->comps[ZRAM_PRIMARY_COMP]);
 	mem = kmap_local_page(page);
 	ret = zcomp_compress(zram->comps[ZRAM_PRIMARY_COMP], zstrm,
@@ -2333,11 +2334,7 @@ static int zram_write_page(struct zram *zram, struct page *page,
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
2.56.0.542.g3ef89b7020-goog

