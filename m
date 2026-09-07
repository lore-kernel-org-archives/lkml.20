Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701D8486BBA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778696; cv=none; b=jYVVyIL4aYkYp4atEULENjOjGaCwoApcMA5/uE4xJCvAJLV55i/WO5KTfiJkAm5xh/uCwPU3zEaHt/vtXym+b9PLRKa4pyHMWGeH16QYHxBZptIyPEom0TSljlcmGKIBtlYt0FO7Gih03yQ3IEBFwHVLTq88EM6kxzOXbVVTCsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778696; c=relaxed/simple;
	bh=nvRqfcTNrhKWsgYEYqserFC6aFy/Ypxd/ECdksDw0KQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uA3ln2a0kyFfuEI34UsNRluJwh+DCrtdWPpfQP6JLhQorXrzA+M+PgO364ccw44v0q8HiQwpvKSx5XbiO7pYoqqNJkauyYtc/pTWHiNq7ZiLFy9Vi+nV2aE4+OEhV35gB18P4mlr7Ul6OpVNAX4ADRDe3mS00AmTpzzxDE/BhsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ImEf6mle; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ImEf6mle"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so3114543a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788778695; x=1789383495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1AN/04P+M2MfSUIh9oyME08cOW6o5tz/4VT3PS1ydI=;
        b=ImEf6mleRfoRs7G7Qp9RzPadxnMuARp5ySbJs+LfCs+Yeao1WVPXUMyHRqq16mJY4M
         TSIkg+AQQ5iBXQDAlt0QIr6m6xijElJonvMrUaZOVjDD7LEvgtfjDOG6/hwug20yVJnf
         rY+ehCPIbtwRlAUYzs+vYvwMfOSU+QB1S4qD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778695; x=1789383495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y1AN/04P+M2MfSUIh9oyME08cOW6o5tz/4VT3PS1ydI=;
        b=BhdiHv0SnOiFtlvcmA4AjgdeJiFJVCIqtq5Q2sVai5rYaUVzOh3jHcR6pva4fJL9LH
         xEREkf5RQugPY3LuZxCfcp/4Y4W9/bMGN89ZSFqXq7qoAEUcTr7brOjC7Z5/JT8rkFkd
         A/NAzAQ2BHy8UmV3nuPMKb7PA5n4yH3KIS9xz3i2NSknobyMq9+OH2VfJIF1P3EiiXlY
         JdNRaerUcDu0MnZ8/Q2TE3mhcEYYH2zUzL0H5bk13SOibkHfcmVaEk3wnbGWyoNLGJFl
         WFlQ1y00FdgzOlNhUfsjzmaRC01eQNatKUdfEOj90dwnF1yZeTfWhWp60rawc43YMM+B
         JmtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzw6Mihty5aoTzHh7IbhK3ZJdkxr/83oBDb35ouL8LtDqHeo9v4EjqRgF2HqCQ64HmW5Oolh9REx7vokrY=@vger.kernel.org
X-Gm-Message-State: AFuF++mmLJXLalJAg0sFBlGJJ5i94cjuPXj01ofJm382Utw5Rj5PujE0
	nWm29t1KaLuXlRmxb7UZ2x1C5NnmNlAFataoUG8FuDYeQ7PB/7lD/Y/6eVaFkepc1g==
X-Gm-Gg: AYBFou3vpLnuxIfS36fXTxeZDMbo9F8irAK9Dz+Y+s6L2AzrD4cK7sUAIVxsshY5po+
	UZDZPhk/Hj8wup06IO8LkU9yJ9+7zpjouF6Jn32pS+8cfXsjS8xpoi0lGlsHzxo77OoYC7YXzO2
	X7akuehTeudnNO7nUM4n28B0GKdaYqJRAzeSC8JQFWamTHz7w19e8NE9IUY7O0+IG8mp1+rH2lL
	GJOLLaVurQfvhtvPMgSpYviCi8EzRq0xgoobAptEUR5R1hp6AYDwLqQSyqn4EPT10cTCezAdBwd
	4Ts8odVZgklRMcVjA40mPgLDDURCzoMVnl5fXcT6JK4F4DiX3rmYX58CMMgJsIYmUabaCgjDa0t
	uWCp92obh3vCs7Z8TQ1p5A25HpK1z4eAN162wa7/UPgk72UTrBdt/RYu3f7xhK4/Ai41ReRArlc
	IUanXFwC0b4sutw+Czr/3Zqk0A06mEfGe6cpkK3jDfusOXyahQs5JA4DL930oLy5ekI9h2cheiW
	yDViQZ9I8WOUQ1Dfaw57wO909h8g0OXFy+HHfhJTr2+8jS2zjgXzjFcRDKRKuk=
X-Received: by 2002:a17:90b:4fca:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-39b260dd278mr33380803a91.3.1788778694774;
        Mon, 07 Sep 2026 03:58:14 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:7fc7:d8d5:4877:bc3f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b51eb40e6sm10343714a91.16.2026.09.07.03.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:58:14 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 2/2] zsmalloc: remove old object read API
Date: Mon,  7 Sep 2026 19:57:29 +0900
Message-ID: <20260907105739.1793316-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260907105739.1793316-1-senozhatsky@chromium.org>
References: <20260907105739.1793316-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no users left of the old API, all have switched to
SG-list object read API.  Remove it.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 include/linux/zsmalloc.h |  4 ---
 mm/zsmalloc.c            | 77 ----------------------------------------
 2 files changed, 81 deletions(-)

diff --git a/include/linux/zsmalloc.h b/include/linux/zsmalloc.h
index 478410c880b1..5b7298a5026b 100644
--- a/include/linux/zsmalloc.h
+++ b/include/linux/zsmalloc.h
@@ -40,10 +40,6 @@ unsigned int zs_lookup_class_index(struct zs_pool *pool, unsigned int size);
 
 void zs_pool_stats(struct zs_pool *pool, struct zs_pool_stats *stats);
 
-void *zs_obj_read_begin(struct zs_pool *pool, unsigned long handle,
-			size_t mem_len, void *local_copy);
-void zs_obj_read_end(struct zs_pool *pool, unsigned long handle,
-		     size_t mem_len, void *handle_mem);
 void zs_obj_read_sg_begin(struct zs_pool *pool, unsigned long handle,
 			  struct scatterlist *sg, size_t mem_len);
 void zs_obj_read_sg_end(struct zs_pool *pool, unsigned long handle);
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 825022a7a328..11be37c43171 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1134,83 +1134,6 @@ unsigned long zs_get_total_pages(struct zs_pool *pool)
 }
 EXPORT_SYMBOL_GPL(zs_get_total_pages);
 
-void *zs_obj_read_begin(struct zs_pool *pool, unsigned long handle,
-			size_t mem_len, void *local_copy)
-{
-	struct zspage *zspage;
-	struct zpdesc *zpdesc;
-	unsigned long obj, off;
-	unsigned int obj_idx;
-	struct size_class *class;
-	void *addr;
-
-	/* Guarantee we can get zspage from handle safely */
-	read_lock(&pool->lock);
-	obj = handle_to_obj(handle);
-	obj_to_location(obj, &zpdesc, &obj_idx);
-	zspage = get_zspage(zpdesc);
-
-	/* Make sure migration doesn't move any pages in this zspage */
-	zspage_read_lock(zspage);
-	read_unlock(&pool->lock);
-
-	class = zspage_class(pool, zspage);
-	off = offset_in_page(class->size * obj_idx);
-
-	if (!ZsHugePage(zspage))
-		off += ZS_HANDLE_SIZE;
-
-	if (off + mem_len <= PAGE_SIZE) {
-		/* this object is contained entirely within a page */
-		addr = kmap_local_zpdesc(zpdesc);
-		addr += off;
-	} else {
-		size_t sizes[2];
-
-		/* this object spans two pages */
-		sizes[0] = PAGE_SIZE - off;
-		sizes[1] = mem_len - sizes[0];
-		addr = local_copy;
-
-		memcpy_from_page(addr, zpdesc_page(zpdesc),
-				 off, sizes[0]);
-		zpdesc = get_next_zpdesc(zpdesc);
-		memcpy_from_page(addr + sizes[0],
-				 zpdesc_page(zpdesc),
-				 0, sizes[1]);
-	}
-
-	return addr;
-}
-EXPORT_SYMBOL_GPL(zs_obj_read_begin);
-
-void zs_obj_read_end(struct zs_pool *pool, unsigned long handle,
-		     size_t mem_len, void *handle_mem)
-{
-	struct zspage *zspage;
-	struct zpdesc *zpdesc;
-	unsigned long obj, off;
-	unsigned int obj_idx;
-	struct size_class *class;
-
-	obj = handle_to_obj(handle);
-	obj_to_location(obj, &zpdesc, &obj_idx);
-	zspage = get_zspage(zpdesc);
-	class = zspage_class(pool, zspage);
-	off = offset_in_page(class->size * obj_idx);
-
-	if (!ZsHugePage(zspage))
-		off += ZS_HANDLE_SIZE;
-
-	if (off + mem_len <= PAGE_SIZE) {
-		handle_mem -= off;
-		kunmap_local(handle_mem);
-	}
-
-	zspage_read_unlock(zspage);
-}
-EXPORT_SYMBOL_GPL(zs_obj_read_end);
-
 void zs_obj_read_sg_begin(struct zs_pool *pool, unsigned long handle,
 			  struct scatterlist *sg, size_t mem_len)
 {
-- 
2.55.0.979.g7e5102b832-goog

