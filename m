Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616246;
	b=G+RKo9UGs6CHKdWeWdfDupWC+JrkoFR67yfWKdE36G1HFtuUJukUh/jMRJYe+zjHIYPl
	 7fzuY70gBRyTz7zsYKsinumrwCTtwmbxzxdImQ7bzMk75B4yKBlb7mxXzeRuTcl4ci22G
	 uQD6fmLbL5kXrGAhJ7ggyUwnK2IKoXUHliPqfCYsvWOqo6H+D9fMfBqoNOBWJkAMsJkXq
	 b70XRZGvzbPpXhscDSk9H8efaAg/nERBljEg+8XeHS8QDe3/AbpeuoHXvkfBGsxhG9uzQ
	 g90tNsbjKpHuVugm5YFm6H1q6P9jnTKt2cEGjtIkRRN8AwMjxf0ppXDpCr4kpm88Enw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=AMF4QHAGquMqZj2Vy845rVn3rz16W/4eYJ+XdOmh9/k=;
	b=RXFiuwGDrdcZ93jxYWnjuHRmalxxgWyScznwH05BvxwqlW3P7dOA3kWrEDhbkh+kkpvb
	 1PpH7JPQkYZtdYlq74gpOuns/t+v6b8B8qCM28EOMP0czdIk/KzTL0KqL0xMGbQTzPuck
	 Kva1f8WQDZQjWTPbMGUfI2Fe+YFDImesPynhgQrKb2I0Q6nPJWjlYB4Br1eXIwL5O/NMw
	 NiegP/JpqeI5v/qfGt0ETXAwljTvPinWSV4lOfikWWLs9ZLX7dCWWGIUG2xsWwZdBGgzq
	 FUthQdaVXb3qNYU6Sup2+CaDdbjdUDZIfMDCk/19fozlK1xNBhWni5J2RozNcNujKkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--suseendranb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=TpPXbtMD;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0A3606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE0A3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suseendranb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=TpPXbtMD
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso1170897a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792616245; x=1793221045; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMF4QHAGquMqZj2Vy845rVn3rz16W/4eYJ+XdOmh9/k=;
        b=TpPXbtMDhK8DnIHR5IRl7yUlsvvL5rPDT4DiEwMLkZ226NR3RF9nrSh7K3+7imRKTN
         u7ZJh3lW4Wm1yfBTye1USFage3uFLmI+2blTMc5IoPOiUGQYt1TjmzXw7+oemrr11Hbc
         Le58JJu+ijlEGOlU+D/hwkDOoA6BOZ3FnnTnfJJQQw6vLCr84TQfX4BINFZyzdol/+Ui
         pY8arT6gsVgWYKaJgvEZEwNcmpl9OHlbhcfHUc3EXV1TIwddjLUz6PEnivaABGW5IQ55
         ewfFe24bb4De+iYZukruKEb+kl8EHnwKAzZcFV0RkWx+yWhvCpkBhDAJozG9yvI9ud4b
         V0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616245; x=1793221045;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMF4QHAGquMqZj2Vy845rVn3rz16W/4eYJ+XdOmh9/k=;
        b=rsIXa5LbG+zVlEYMhopkcADYg274XhyuVZfgutOPISEshr3Psg3d1PF6CnEpMbGHOp
         JO9kZ6fsoNQYD59hcJ4NRiQsI1UwNY2zEAOIvHeYF+91GyP7u0ofoSN2zPCQ9TOup9FK
         YhvawlqNqTnl2zJrexPVFWHhWgHPlPT2YBo1Lp4LD7XZyL4OdWaHiHJYITkGymDuTn/q
         pJlbEWsJa58zVUqt5p867IMKuTT/rcm4oxgpn0fxeyD4GrEKIR8NGRcgcYRsuEpurGou
         YWtUSC0HcFuSIxnYP1k7KJp/CqYLf5tI3cSfPrgY1v141l2bASNpy4F8e/z9oxqaXkPb
         9oUA==
X-Forwarded-Encrypted: i=1; AKwUvBx6Lh6LTtnLmSa1c5FAPKtLrccYOMUC2GZtb64vR/KGZqljATmYMYFio9nIvkxOmvkgHIIodg4NiIAvGZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdyv7q6pg8R81pUV+OMIe9botWJEv96lh6qCZF+FIpJnGSfkSv
	ckqPrcQz9SG1k/RRXbjqV/gVzd6hFyumpdw5+wzP/XZwkLvw9psd7hY0dFFOeS6NbB5HBZvRKDX
	nbC0tTDYT6LDWbZeV6A0F1pibxg==
X-Received: from pgbj24-n1.prod.google.com ([2002:a05:6a02:61d8:10b0:cd6:9a6f:2802])
 (user=suseendranb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:3d08:b0:3c3:6f6c:aa21 with SMTP id adf61e73a8af0-3e287dd5c8dmr2833277637.11.1792616244847;
 Wed, 21 Oct 2026 13:57:24 -0700 (PDT)
Date: Wed, 21 Oct 2026 20:56:26 +0000
In-Reply-To: <20261021205626.3286270-1-suseendranb@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021205626.3286270-1-suseendranb@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021205626.3286270-3-suseendranb@google.com>
Subject: [PATCH 2/2] mm/zswap: classify compression dst overflow as poor compression
From: Suseendran Bhaskaran <suseendranb@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>
Cc: Chengming Zhou <chengming.zhou@linux.dev>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, SJ Park <sj@kernel.org>, Chris Li <chrisl@kernel.org>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, 
	Suman Kumar Chakraborty <suman.kumar.chakraborty@intel.com>, linux-crypto@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Suseendran Bhaskaran <suseendranb@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit dca4437a5861 ("mm/zswap: store <PAGE_SIZE compression failed page
as-is") and commit 0b1bf60c324a ("mm/zswap: reduce the size of the
compression buffer to a single page") updated zswap_compress() to pass a
PAGE_SIZE destination buffer to crypto_acomp_compress() (so
incompressible pages typically overflow the PAGE_SIZE buffer due to
compressor metadata overhead) and check:

    if (comp_ret || !dlen || dlen >= PAGE_SIZE)

Because crypto_acomp_compress() previously returned -EINVAL on
destination buffer overflow, this check conflated destination buffer
overflow (incompressible page) with unexpected compressor failures and
did not set comp_ret = -ENOSPC when rejecting incompressible pages,
resulting in two user-facing issues:

1. When zswap writeback is disabled (e.g. memory.zswap.writeback = 0),
   zswap_compress() sets 'comp_ret = comp_ret ? comp_ret : -EINVAL' and
   jumps to unlock. Whether the compressor fails on destination overflow
   with -EINVAL or succeeds with dlen == PAGE_SIZE, comp_ret becomes
   -EINVAL. Consequently, incompressible pages are misaccounted in
   debugfs under reject_compress_fail instead of reject_compress_poor
   (leaving reject_compress_poor stuck at 0 and triggering false
   compressor failure alerts on normal incompressible workloads).

2. When zswap writeback is enabled, any non-zero comp_ret (such as
   -EINVAL from an invalid compressor context, -ENOMEM, or a hardware
   accelerator error) is treated identically to an incompressible page:
   comp_ret is cleared to 0 and the raw page is stored uncompressed in
   zsmalloc. This silently masks genuine compressor failures
   (reject_compress_fail is never incremented) and miscounts pages that
   encountered a compressor error under stored_incompressible_pages.

Update zswap_compress() to treat only comp_ret == -ENOSPC or
(!comp_ret && dlen >= PAGE_SIZE) as an incompressible page (storing it
uncompressed in zswap when writeback is enabled to preserve LRU order,
or rejecting it with comp_ret = -ENOSPC when writeback is disabled so
zswap_reject_compress_poor is incremented), while jumping to unlock on
unexpected compressor errors (comp_ret || !dlen) so
zswap_reject_compress_fail is properly incremented.

Fixes: dca4437a5861 ("mm/zswap: store <PAGE_SIZE compression failed page as-is")
Signed-off-by: Suseendran Bhaskaran <suseendranb@google.com>
---
 mm/zswap.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 37f34e406c8e..5f2a941fcaf1 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -881,12 +881,12 @@ static bool zswap_compress(struct page *page, struct zswap_entry *entry,
 	 * only adds metadata overhead.  swap_writeout() will put the page back
 	 * to the active LRU list in the case.
 	 */
-	if (comp_ret || !dlen || dlen >= PAGE_SIZE) {
+	if (comp_ret == -ENOSPC || (!comp_ret && dlen >= PAGE_SIZE)) {
 		rcu_read_lock();
 		if (!mem_cgroup_zswap_writeback_enabled(
 					folio_memcg(page_folio(page)))) {
 			rcu_read_unlock();
-			comp_ret = comp_ret ? comp_ret : -EINVAL;
+			comp_ret = -ENOSPC;
 			goto unlock;
 		}
 		rcu_read_unlock();
@@ -894,6 +894,9 @@ static bool zswap_compress(struct page *page, struct zswap_entry *entry,
 		dlen = PAGE_SIZE;
 		dst = kmap_local_page(page);
 		mapped = true;
+	} else if (comp_ret || !dlen) {
+		comp_ret = comp_ret ? comp_ret : -EINVAL;
+		goto unlock;
 	}
 
 	gfp = GFP_NOWAIT | __GFP_NORETRY | __GFP_HIGHMEM | __GFP_MOVABLE;
-- 
2.56.0.218.g1ec904b173-goog

