Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740240;
	b=C25JyB2cii/hmoD1ymatIQKegcLNQd6gJOFfXb+FZHYIbEif/iLUx0cBTkhDLtx33sZQ
	 ZZG/BtTvma6U9q6W/rC1xrMP/cDL9t9IcyHv+/4GR0YiRiVT0Xo8q/3EV7bHONsZbDeap
	 zQvN0mBlBYf/TmKYmRtncfhM2eIWlEB83CVfZvh7rRNt1taUuxGywWjJ7HO2hTJI+hceq
	 0k0vHZf/vDYzWxTQzEV2x9hf+oWmZrHaP/C4VmwlpXwz5KdXU/BMm5hbrmCGqyzkb5qOc
	 bX5axOBn71r3Wd6MQorucmkrNcZVcAkNdJivjvx8DkrPbL5jpCnbT89yWxYvfpdDEjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oibzb0WyOnXCVqHk/JQbkuYKg2Gn7hJGWFHttlYByP8=;
	b=Eoovg5GoYY5QHRWOMj3FK0Kec6ZuGU3syVHP9yuc7O7ZcjZmxEHnG4k8ZIK+BJwU4epB
	 gF3OkhmG1in/4qgOoIRVImHXcrvLfLYpARbLIkBh8WR/Rk/bggabv+AfaOaDKNCTrt5EZ
	 0GlDr80qYQXk7mZvJaFvXTZo705pYaMQSSzaUAzG8Elzdn1yBZTx+3OMb/wT8Bl1gP4E8
	 QOknFvsiCO3MOA4TFdcYBJGnvbZmNNts80+6NRBirDVz/uhfuFN3ZYhlf+6rkz4g7xGaV
	 cGudUii7L6eYj8Di9azBq2tHDBsfsO80MNljKl+ZufPvO994LL/bj1soyuRAkh0oxJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=OLEqYr5p;
	arc=none smtp.remote-ip=209.85.128.97
Received: from mail-wm1-f97.google.com (mail-wm1-f97.google.com [209.85.128.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16316606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16316606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=OLEqYr5p
Received: by mail-wm1-f97.google.com with SMTP id 5b1f17b1804b1-4a610c7e61cso7019585e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793740238; x=1794345038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oibzb0WyOnXCVqHk/JQbkuYKg2Gn7hJGWFHttlYByP8=;
        b=OLEqYr5pikrldqmuRgbA7Tw+OjqWnFMUBnyP6Q6zxezEjz4ElLaXgBitayQTfX0mpW
         ZDuchmLJjtrzC/EnOU7o6WGvr7u2BFC9VK72vqItAFiqoxLheVWSyOZBcsJ4+IYCpayL
         kc6BgkvrKWU4RZeLM0jrem84B6EKNHkEMdNiG4g+GuA13bOYm0M45/SWQeMHhG55TKS8
         2HZIGBn1nrUfvdgFwl8QMb4NtkDSXmlbaRwAPJzpwOiVs48vedSM4zRKm7oYeUpwrQmA
         Anv1towlYXo1ypwCsBxpSsRQ0ncrPh8PdfUxr62O5uau19HzmwYtugS0PTj1RaneMnDc
         xELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793740238; x=1794345038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oibzb0WyOnXCVqHk/JQbkuYKg2Gn7hJGWFHttlYByP8=;
        b=r0zo/gzO0nvqrp2iixt9FpIQVulh1q2wRgDAqavmbLdPFYPGa9RXqFGvO/PZg6OHZ8
         n2Kpz/tL7Mh74lke0vkiefRrL8I4Kd+jaBGij45mOxonucTJ5Ra6b0KXO9RNkSHdTX4d
         RjbzOQ1VTCDmhkDQ0RPkiO8YJSCTpTHpVwiwgDpjOw2KBeINBH/yYz8PyVXkfb3z2YAM
         +wcYmkUixBIXj7EdRgKwtJhTIT4YPfoYvSEu1Sy9PNwE5iNNCetIbuHz7yCQWtnOxipo
         1yMm3XFiBMGN38YoJElESnHAHxbO+Bsi0x8BpXUvOQLJgIaM9xreBRd/n/QIUQ1GF0Zf
         nJrw==
X-Forwarded-Encrypted: i=1; AKwUvByR+LzdMY9RDxBkGkEiPuW7mJMdvkV8uPXDTmEmKmE/3lN9EHkBQQvETFVkg1cRnO9mKXwy/aEfBp9oMRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xIpw8nLSTQ5BusoDdmcd4UxTtwUhd5BQGLrnxDvw8Eb5D3jDB
	qmAs/QjvN8VJEhn4byXhRLnDPDMiy8SFomfYTtU8CTm0bnvVD6eePGI8U/dpAw4C4Qj1tUcfG9v
	pdke8ihtYlWsiAP+iYdQVnXMcZUIfXgv/YcNSCK1Xgu6LMMy16DF7
X-Gm-Gg: AYBFou05MXJhWNfId4yWiW60HU9v7yUsdmLl6QHaoBq+WcjXbRWkNFExO1TPl/YG+Fw
	Ny5JE8sHJCvTkEEZY6Z2MmXw+8s7EfHtKJcRiA6VN2GSomZmAOA3pwQSaOlGo9B25y3/Wb2emfh
	Ds6ndy0f+dE27TfFsZbLZ2AS/6mfLS1mlLG2aY5UuV0Q4CtfDyNsOcobWS2C+ajGP2nVwtL/77E
	W3tvhlgU0f4RjMKIJf4QKgxb0lPZ1VwXVg7D48IeR6XoUrZ1vZiHBXIftDbAlBmmAx+IDIlZLwV
	onfN2gkupnixhy9opaXjJM7u7NH2uxyYsH8cmLeiRXQVxTKM7ijTWukGeLNQUhVGnmE4yVhPlae
	NYU5x8YOcGlu+fAP09w==
X-Received: by 2002:a7b:ce0d:0:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4ac177538c5mr250973225e9.1.1793740238406;
        Tue, 03 Nov 2026 13:10:38 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-4b412a71624sm221415e9.2.2026.11.03.13.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:10:38 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [IPv6:2620:125:9025:23::204])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id E300F43622;
	Tue,  3 Nov 2026 14:10:36 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id E08F8E40437; Tue,  3 Nov 2026 14:10:36 -0700 (MST)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 2/4] io_uring/alloc_cache: mark cache success paths as likely
Date: Tue,  3 Nov 2026 14:10:29 -0700
Message-ID: <20261103211031.592745-3-csander@purestorage.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103211031.592745-1-csander@purestorage.com>
References: <20261103211031.592745-1-csander@purestorage.com>
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

The point of a struct io_alloc_cache is to serve allocations from the
cache to avoid a call to kmalloc(). Only very high queue depth workloads
require more concurrent allocations than the fixed-size io_alloc_caches
can provide. So mark the success paths in io_alloc_cache_get() and
io_alloc_cache_put() as likely.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 io_uring/alloc_cache.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/io_uring/alloc_cache.h b/io_uring/alloc_cache.h
index 962b6e2d04cc..aa007b380f1b 100644
--- a/io_uring/alloc_cache.h
+++ b/io_uring/alloc_cache.h
@@ -19,22 +19,22 @@ bool io_alloc_cache_init(struct io_alloc_cache *cache,
 void *io_cache_alloc_new(struct io_alloc_cache *cache, gfp_t gfp);
 
 static inline bool io_alloc_cache_put(struct io_alloc_cache *cache,
 				      void *entry)
 {
-	if (cache->nr_cached < cache->max_cached) {
+	if (likely(cache->nr_cached < cache->max_cached)) {
 		if (!kasan_mempool_poison_object(entry))
 			return false;
 		cache->entries[cache->nr_cached++] = entry;
 		return true;
 	}
 	return false;
 }
 
 static inline void *io_alloc_cache_get(struct io_alloc_cache *cache)
 {
-	if (cache->nr_cached) {
+	if (likely(cache->nr_cached)) {
 		void *entry = cache->entries[--cache->nr_cached];
 
 		/*
 		 * If KASAN is enabled, always clear the initial bytes that
 		 * must be zeroed post alloc, in case any of them overlap
-- 
2.56.0

