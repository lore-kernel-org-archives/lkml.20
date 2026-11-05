Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854092;
	b=xBQ3HBStc+DavMqvjeoVQ6eiWVY3E7BopStSlA2KCpvUJFMx1Zy6auMx87oyk6sONqMw
	 qkfiegYyLQx8lwjFapgeMlXdGq487MdS1rfe6ixaxTqe8QsCw8UnbN0nsWtWAkyZsnQLv
	 2jge/F0G9DPLKb7kb4Lk6Qj1xbdyw4uUrtAl5DDGYljJC/XV1cSmWPhOfBZ/o3JwMCZHd
	 fX2mkHmSXVQxHeXecOA7QRng92UxrJlLt0csuvBlSu22V4B7ruxW3ws2Gbo1z4Si2Mz2g
	 w280aqC1qWoYZoak5Q4j3cNpzHpmxq2hzB5p9I3T7lJ9qJEIg0ujrufkvz4Zem782yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ig3cy4g2u7CXskVAimAX4bU14IYSOF358bPQNQDlMyc=;
	b=CboLM9lIZIN9UAAB8zGJQk2UK0yaeU0OcNW3wblDVIm/Z5A7TIqb9kIMbyjH4ebclDnZ
	 8PEFpKImYXlz3Q5DvmgxgG0keMuA9vqXslcwxbwQiNKCagm/YqjkvMmPsgNBdxNcz/DJS
	 kdzro+NE47dE9ndmJ4CsZ1KgaeL51o9FvdABm4wf4m177jrUlJzP+zN+tsVD1CDSaYg4Y
	 BGV7sNz0PZFR+I3Z7BQuvs1a4PH/DgjiA1sTd3KjbcOg8y2pjqzMT2Tdj+2PUp72AA9Qp
	 xn0YZDe4JNUNrfMInvI5vSHQ81Mc/yPBe2gGUe+3JQSAGrQWoon8GldSWjFsdDnhXMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GNcDKh1W;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C894606A332
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C894606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GNcDKh1W
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3820053eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 20:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793854091; x=1794458891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ig3cy4g2u7CXskVAimAX4bU14IYSOF358bPQNQDlMyc=;
        b=GNcDKh1WrwbKVrr7xapvlw9tZAdXzl557bDRLx/tyOSvppS+gQJlpSnM/l2RbSOZ9T
         bANF7hjz+WtbX0aUbRQjdG3QfdxSi5FrxB/nw/ptTNcmjhLB170PVYj3+S0TXQrO3tc4
         m/7nMzac3/k3iU2wiBPMVsdJDN8AOSbRcMrQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854091; x=1794458891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ig3cy4g2u7CXskVAimAX4bU14IYSOF358bPQNQDlMyc=;
        b=zPWK6o7C7aXNNAwtZwho43MZdXbOuB8+1MNPJQMlnvkPe3pidxnJAsXTqQlGSTzXik
         5QrtSoPqlGYuWznkL2r5d36rOP7FW0JtOc1JRQs8Lzwsn1soAZLXL4coGC8pT078H/Gk
         vbrdIKit346RwGrP4aqgR1XK+2fOlZrPR3rMk/fOEdXrISENyLfyxtyccUB0nhLzhi0/
         55J47YGor/OvxO/adVchsHc5JN74kBeoxm+qQchASv73Ew9NvxWKyDprEvafmLJ4br9a
         l/xYGSSzb9TiKudBKKBVUOF0C2xt+kZ3KbTNA2LEhhtJkpcTuiGr2wOqlE/U+xuRU0wm
         EAvA==
X-Forwarded-Encrypted: i=1; AKwUvBxSX33jUf9/n6+g9ck+20O6vbCm/oeJ2p43WzoMpiWq6bPscDpmYRMRHHAeNjYknltIEIqiT5ryH5vmIyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z95i55gUrkibiaOE6/yNLNv0DjkNHrUyxSHziZZPuBnOXXJ/bXS
	UpPu//FP+ZUK9XeFqk43sQClIWsVYWUCKNOwTTu3zYZtGZmwQLVD6h8MIWWaQBeUWA==
X-Gm-Gg: AYBFou1LUu5Tnvjl1XkqR0SAKwE1OdxXQARXq3pbUV/C2BFjw7+P7eWdQuujJe3CrXU
	iSDIroQ0Tp2H5716yNqqYHdwM0wTBq9ZDaSVyMMJxNe+6x6XKhPfmPfA2uQCNd7nOeSCnEPBaGU
	lNNind5fEq3Ij6PKvdbPGLVA57eh/E3q28lxy+xyyH1HeYlqoChkhy+pRt+oJGL8d6AUwa5V8b3
	7HbzTDzdE4iYzKgpXIwmS5DLvmV/EpY36lo6MTXUYOLwIh2c59C2tMxbX/ecExVRPD+nI18IUX0
	T+eViwPYig2eDl1iU+g2jzH0xG0AA2IG1apF7Gb+71p99XpKUP7rscHRi9M7krS/WVQLaHr5INi
	ufvNrq7XpffL+q0HzgW3m5WNvY9m4C6NSl7YLkFNxrTc6Pn5lXh6XkpDPO02XNeeKPlIqvQnXK1
	BqPwn1XdAneigso1NWd3QgWSOKZ/nS0saeoFXkpmac6LdfDR/K5ISrs/qGZoCPtBPOqLWz7cnXj
	9BIdtZsnHlqpe0SAVU6/yo9sD0gAxWTJ87ASlvDnLqRkmHIAmuCUbsmm49ULyg5VQ7zCg8gqeqJ
	YtcUKRN0c7NL8TO6lRT8Kvxl9Qim2PwRVAKdIytyaBRytdH/RnzN0WI/2+ZcgYCiI4ElOOOe9TU
	VW79LW6l4mp2JeAlYb/GR6nVEiXzy4z5giKgAdT0=
X-Received: by 2002:a05:7022:628a:b0:1ac:1343:fa54 with SMTP id a92af1059eb24-1ac5bbb4863mr35522622c88.14.1793854091285;
        Wed, 04 Nov 2026 20:48:11 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:37bc:b763:7ec7:65b4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c6f0dcsm17142927c88.21.2026.11.04.20.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:48:10 -0800 (PST)
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
Subject: [PATCH 4/7] zram: allocate zsmalloc object under slot lock
Date: Thu,  5 Nov 2026 13:47:34 +0900
Message-ID: <20261105044752.1997895-5-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105044752.1997895-1-senozhatsky@chromium.org>
References: <20261105044752.1997895-1-senozhatsky@chromium.org>
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

zram_write_page() and write_incompressible_page() allocate and
write zsmalloc object first and take slot lock only to free the
old slot data and set the new handle.  The next patch makes
zsmalloc store object location directly in zram table entry, so
we need to free the slot before we allocate a new object for it.

Free the slot and allocate the object under slot lock.
recompress_slot() already allocates objects under it, and
GFP_NOIO reclaim cannot re-enter zram write path.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 2c2e11b2b663..e2710ce35b1f 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -2260,14 +2260,19 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
 	struct zs_handle *handle;
 	void *src;
 
+	slot_lock(zram, index);
+	slot_free(zram, index);
 	handle = zs_malloc(zram->mem_pool, PAGE_SIZE,
 			   GFP_NOIO | __GFP_NOWARN |
 			   __GFP_HIGHMEM | __GFP_MOVABLE, page_to_nid(page));
-	if (IS_ERR(handle))
+	if (IS_ERR(handle)) {
+		slot_unlock(zram, index);
 		return PTR_ERR(handle);
+	}
 
 	if (!zram_can_store_page(zram)) {
 		zs_free(zram->mem_pool, handle);
+		slot_unlock(zram, index);
 		return -ENOMEM;
 	}
 
@@ -2275,8 +2280,6 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
 	zs_obj_write(zram->mem_pool, handle, src, PAGE_SIZE);
 	kunmap_local(src);
 
-	slot_lock(zram, index);
-	slot_free(zram, index);
 	set_slot_flag(zram, index, ZRAM_HUGE);
 	zram->table[index].handle = handle;
 	set_slot_size(zram, index, PAGE_SIZE);
@@ -2325,25 +2328,27 @@ static int zram_write_page(struct zram *zram, struct page *page,
 		return write_incompressible_page(zram, page, index);
 	}
 
+	slot_lock(zram, index);
+	slot_free(zram, index);
 	handle = zs_malloc(zram->mem_pool, comp_len,
 			   GFP_NOIO | __GFP_NOWARN |
 			   __GFP_HIGHMEM | __GFP_MOVABLE, page_to_nid(page));
 	if (IS_ERR(handle)) {
 		zcomp_cstrm_put(zstrm);
+		slot_unlock(zram, index);
 		return PTR_ERR(handle);
 	}
 
 	if (!zram_can_store_page(zram)) {
 		zcomp_cstrm_put(zstrm);
 		zs_free(zram->mem_pool, handle);
+		slot_unlock(zram, index);
 		return -ENOMEM;
 	}
 
 	zs_obj_write(zram->mem_pool, handle, zstrm->buffer, comp_len);
 	zcomp_cstrm_put(zstrm);
 
-	slot_lock(zram, index);
-	slot_free(zram, index);
 	zram->table[index].handle = handle;
 	set_slot_size(zram, index, comp_len);
 	mark_slot_accessed(zram, index);
-- 
2.56.0.398.g882cbad275-goog

