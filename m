Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E35954EEC4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155612; cv=none; b=bBn5KZrOTNEgs9NcqesgmDjqFpT5fOC8HCx63+Co8js2VRhv3MHzlu8vPv6Za86/hHnNz+3yfx5MUrVLiWGBd25Q5Ni9Bza0K/+oBw4M1lzWxH/Iz7HLKjvHMpmJ6RBVGyfi4affRU2FMmf7C/4g1lfe/9J2w+qfBTaKfwkArWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155612; c=relaxed/simple;
	bh=M6S66wtLpyo+yveSpW5ETKNDeT9jMUeCPYSrX3fey7U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=As8h+WmP4zmyLBU+m2u8pW3fVSZPDTLt6ApdJkX80ZkCbUkcP+ySXo7gHjMZWQkDgdimS8vtnakm22VyRpBdi8Vi1UOqmeNpP/mgQyRdsI2TxuScpgb8KovwEJUqF8pUm+O03lAVKWqTb3BGRB6b4cibxIofy/SBKJ9cVopAkeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AR1S8AnJ; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AR1S8AnJ"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso9943635e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789155594; x=1789760394; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/U2nrxWGjJiKW1yLpk0W49cM4yF19DMUslRfhb7YXzY=;
        b=AR1S8AnJlihss39i/NHT942fFdDRlQzKZk7acsFkXc5IDY5/jr9X+297YIRe5D4TX3
         Fu7BtDcd7O1QAxlPoMARMGYn1EQihbUtkwVSzUFnobPigSO+s+0711SvLppC8yYA7kSM
         S1mZL+Z4dDq9z1ORk4ddk+LHTtzS2QVbIl+pm36dxw+ZX9codVUyKw0h4jdvJwf917Ae
         oDlPi0oezp8TL9uNEDrfZJK9mCE++jzsoCPQ+HbVok2HZ7DPKNWXLx/y5JInwMIt3XhE
         eMVSkk8cpyTaXeMdMOX1jnwx/tUr4fUoS2GIghmE+AMgL6RFOT0Vw96whIIG8NZBFUcv
         ufyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789155594; x=1789760394;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/U2nrxWGjJiKW1yLpk0W49cM4yF19DMUslRfhb7YXzY=;
        b=R5TxgQbec7arfuasCsKQvpMqo89e820duHCsq7zlsdyyba8nEd6MZmh5h5e6bDe7FD
         9ypuezIcSEVhXiVGlbfhxWIDvaN8WD6TUfoelMFbl1985gJ4IWldmacRYuw+E+sQLcra
         o93Ey8ZE6+RPn/ypxB7JH4GvdWwpji8qiYgB2SjNGIRunzX4lL+PY7aHcS7doHYSifH4
         wU3VlIiYvkfysZoqeBru/shymgb+zusBTJbdVfONQED28Y6ykH7mDjnE+s3Id6di897K
         3Wvx1YSLogNXkN3UXzBuveaXyCJveSpxplUZ2aWMAa6apDFH3T8v0qRMxEk4UPuo/+1k
         eTkw==
X-Forwarded-Encrypted: i=1; AKwUvBwRk/OKG+vnIh3u8Oh4AI34ZvXWxfflgGT23MrO4cjcl2Zpmn89/qTPvrgk7uEF1xB/X6dIsjEedCW62K4=@vger.kernel.org
X-Gm-Message-State: AFuF++mb12BmdN5cdrUNsI2096h1FHKAH+Ya2SrY5pRU2U9xchIwdbWs
	zzdXOiWSsA8OznAmqvi3nBY3FtLho4x+dejN1v2BiU4JqpmijKZbhnguaS4AI2xyRpJ9qbw1gjz
	BcxzYJP5KXtu2hG3IE564Eg==
X-Received: from wmoi19.prod.google.com ([2002:a05:600c:4813:b0:499:b7b4:7c4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b1f:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49e619e0f85mr68949845e9.16.1789155593836;
 Fri, 11 Sep 2026 12:39:53 -0700 (PDT)
Date: Fri, 11 Sep 2026 20:39:36 +0100
In-Reply-To: <20260911193937.602202-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260911193937.602202-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911193937.602202-3-vdonnefort@google.com>
Subject: [PATCH v2 2/3] tracing/remotes: Catch nr_page_va overflow in
 ring_buffer_desc sizing
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

The number of pages per remote ring buffer is capped by
ring_buffer_desc::nr_page_va (32 bits). A buffer_size large enough to
overflow that field would silently allocate a descriptor smaller than
what was asked for.

Return SIZE_MAX from trace_buffer_desc_size() on nr_page_va overflow.

Fixes: 2e67fabd8b77 ("ring-buffer: Introduce ring-buffer remotes")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 include/linux/ring_buffer.h | 4 ++++
 kernel/trace/trace_remote.c | 6 +++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
index 11bffb6a142d..eac3e9080c3c 100644
--- a/include/linux/ring_buffer.h
+++ b/include/linux/ring_buffer.h
@@ -295,6 +295,10 @@ static inline size_t trace_buffer_desc_size(size_t buffer_size, unsigned int nr_
 	unsigned long nr_pages = __calc_nr_pages_ring_buffer_desc(buffer_size);
 	struct ring_buffer_desc *rbdesc;
 
+	/* Capped by ring_buffer_desc::nr_page_va */
+	if (nr_pages > UINT_MAX)
+		return SIZE_MAX;
+
 	return size_add(offsetof(struct trace_buffer_desc, __data),
 			size_mul(nr_cpus, struct_size(rbdesc, page_va, nr_pages)));
 }
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index c17902e42ef1..2d5bc423efca 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -980,9 +980,12 @@ int trace_remote_alloc_buffer(struct trace_buffer_desc *desc, size_t desc_size,
 			      const struct cpumask *cpumask)
 {
 	size_t min_desc_size = trace_buffer_desc_size(buffer_size, cpumask_weight(cpumask));
-	unsigned int nr_pages = __calc_nr_pages_ring_buffer_desc(buffer_size);
 	struct ring_buffer_desc *rb_desc;
 	int cpu, ret = -ENOMEM;
+	unsigned int nr_pages;
+
+	if (min_desc_size == SIZE_MAX)
+		return -E2BIG;
 
 	if (desc_size < min_desc_size)
 		return -EINVAL;
@@ -991,6 +994,7 @@ int trace_remote_alloc_buffer(struct trace_buffer_desc *desc, size_t desc_size,
 	desc->struct_len = min_desc_size;
 
 	rb_desc = __first_ring_buffer_desc(desc);
+	nr_pages = __calc_nr_pages_ring_buffer_desc(buffer_size);
 
 	for_each_cpu(cpu, cpumask) {
 		unsigned int id;
-- 
2.55.0.1007.g17ff1f9808-goog

