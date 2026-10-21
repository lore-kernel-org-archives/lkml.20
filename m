Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616231;
	b=y3TXqRu02sOh35YAOdMjGncEdhlZbc3EB8oPfotjurAiEXk9K+BX4zjqlTP+ibygpR49
	 2HEQ4ZOMVIGtdEV7FetFZ9qLfsDWqt+y9OEzB1cfBNwWVJPKNjYSxaOU/zSvmThtiwiQW
	 cMtyoJ/1ao5nQ+EY3KFIJLC3ZQA736fg1TkXkby6V+IgVIN3AOjynuRvurFzS1XacyYaW
	 tJusPD0AG3+CZevct9Kr+VoITxdsZeX2ujwtbbg922oC8UlZMhHMiPvfi2Bv8d3PYgwgp
	 aQiPOrwqtl+AkwfGISevJhEg8NDrnevkoxh20tZYlOZwm6T4OuKfceNJluxj3CHXPmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=TjGoXIwxwvYJCfSB4uUwJbeswXlbVh5GTXRCoqO+ToQ=;
	b=AxQUIBtwRhyEbmYOkb9mElvKMTkNfIH7LLZ7HfIaZgEP5TyKS8UtnM3Gw71irhz37CK3
	 4PsNLyUJEcpc/WwRx3NdT0ep0I0G90nrAahBu7wk4IUB5tATeGHfuCgILq+wFJvYoU/xG
	 n9ErmCBKdCu425BgQX8X+FHxsf4lYa/37rH6gtUUtlPc/IOhoVvH86Enh2x2iQxTzl4t4
	 WcSfYYBZE+tunwi5oC1TB6ucnGs59Iw7Y+wW8/pnYQ67+PLHWZbFJaXVq1afqMx23IvWR
	 4mR26x3m/gxaJWMtehczZKCqjO/QgIc0tqzxyMbd74DUnqRNu1MAIR4f4qH5hYH0QKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--suseendranb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=umQqFLME;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BC8606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9BC8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suseendranb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=umQqFLME
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9572e892dso7778675ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792616227; x=1793221027; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TjGoXIwxwvYJCfSB4uUwJbeswXlbVh5GTXRCoqO+ToQ=;
        b=umQqFLMES1JPk4420IiZfNB632/zKzT4sUli4e84ALhzsGfTMxij98Ebgf4YZBFddi
         UY0aT6RxGWFJxA2T6p2sbTyG287UseVXX2ncIGOgoti5UqCbHVrKTtaiYpNNI+j4LAar
         nGb1FSgj2y7WGclgeYpYjjHYrzorVhnjHzudMRVFbZet4qdhmSOE9r2lIB50BxOjOeI0
         xm7ybJbYUG3nnmz0yOrH/6Xyb4ebFEvx19bFprxv0GGmp6ei1HuRfEp5Ec+tLJ061gW+
         cegn0mkiT6X4OMftE1OFDD0ia7mB95JVk2JEmld1h0LzLCea9Drn92lKVpK6mCZFaaCQ
         C1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616227; x=1793221027;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TjGoXIwxwvYJCfSB4uUwJbeswXlbVh5GTXRCoqO+ToQ=;
        b=wDVbUQjYhlRh5Y0BInC7t+HF3l0tKEXtptQkLGyfc2H4MPOz5fgLa8DWdOWaU4XgZK
         iAAlaqX9KMXJwdinajZgdi6MpMUTpL2Ybe8unFDeSgpQaZNjN+WC6XyCujYiubJlzjqt
         yPBJMdBnMrAOr3nZOaZePsHbtd7T60Vzw+MBX4A9xEdKqFlry36dndEWqCnN7yWelExF
         9hQns5grsBO/6jJwSOmBZh3zwhWNfQy/vf17WgFwxgaIamU9F7m4yCxVSyJamqoE4H0o
         zOnmWxlNpBNblkk4R2f68byvUmk7UlWUJ01XOt760zGogmJ5V4Cs4IucRJQ1tG7UN5cn
         xPvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgWFZIXJdROm0KXp2WdfW36ix/7zkH00TqCd6FZ1/8/xoPEVeWgpDkb2wO8obbUoA3q6XRy/7QFrv0eEY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvpR2mCSFZ8gNNFA/Pm//MZe8oAU4vAve5Oa/Sg7qyO+VrJh91
	vpR6zhlqwASCcKpvpwXWiBOigSKtvEKEnRMzhVEGzGm6SEEVR5VCT2N9u/Gt2H3+5gk1wwkI5kg
	xis8tHLJGhdHxzyVy0aJuWVJlPg==
X-Received: from plot22.prod.google.com ([2002:a17:902:8c96:b0:2e9:8ef0:cf73])
 (user=suseendranb job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:26c8:b0:2e6:7c6:8d40 with SMTP id d9443c01a7336-2ea43c0b534mr25135175ad.27.1792616226856;
 Wed, 21 Oct 2026 13:57:06 -0700 (PDT)
Date: Wed, 21 Oct 2026 20:56:24 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021205626.3286270-1-suseendranb@google.com>
Subject: [PATCH 0/2] mm/zswap: distinguish incompressible pages from
 compressor failures
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
compression buffer to a single page") updated zswap to pass a
single-page (PAGE_SIZE) destination buffer to crypto_acomp_compress()
(so incompressible pages typically overflow the PAGE_SIZE buffer due to
compressor metadata overhead). Because the single-buffer software
compressors return -EINVAL on destination buffer overflow and
zswap_compress() checks 'if (comp_ret || !dlen || dlen >= PAGE_SIZE)',
destination buffer overflow (incompressible page) is conflated with
unexpected compressor failures, causing two user-visible bugs:

1. Broken debugfs telemetry when writeback is disabled
   (memory.zswap.writeback = 0):
   Single-buffer software compressors (zstd_compress_one(), lz4, lz4hc,
   lzo, and lzo-rle) return -EINVAL on destination buffer overflow
   (whereas the multi-segment streaming path in zstd_compress(),
   deflate, and 842 return -ENOSPC). Furthermore, in zswap_compress(),
   'comp_ret = comp_ret ? comp_ret : -EINVAL' forces comp_ret to -EINVAL
   even when comp_ret == 0 and dlen == PAGE_SIZE. As a result,
   incompressible pages are misaccounted in
   /sys/kernel/debug/zswap/reject_compress_fail instead of
   reject_compress_poor, leaving reject_compress_poor at 0 and causing
   false-positive compressor failure alerts in monitoring.

2. Silent masking of real compressor failures when writeback is enabled
   (memory.zswap.writeback = 1):
   Because zswap_compress() checks 'if (comp_ret || !dlen || dlen >=
   PAGE_SIZE)' and unconditionally clears comp_ret = 0 to store the raw
   page in zsmalloc, genuine compressor errors (such as -ENOMEM,
   -EINVAL from an invalid context, or hardware accelerator errors) are
   silently masked as incompressible pages. Users see 0
   reject_compress_fail events, and pages that encounter an unexpected
   compressor error are miscounted under stored_incompressible_pages.

Patch 1 updates zstd_compress_one(), lz4, lz4hc, lzo, and lzo-rle to
return -ENOSPC on destination buffer overflow, matching the streaming
path in zstd_compress(), deflate, and 842.

Patch 2 updates zswap_compress() to treat only comp_ret == -ENOSPC or
(!comp_ret && dlen >= PAGE_SIZE) as an incompressible page (storing it
uncompressed in zswap when writeback is enabled to preserve LRU order,
or rejecting it with comp_ret = -ENOSPC when writeback is disabled so
zswap_reject_compress_poor is incremented), while jumping to unlock on
unexpected compressor errors (comp_ret || !dlen) so
zswap_reject_compress_fail is properly incremented.

Suseendran Bhaskaran (2):
  crypto: return -ENOSPC on compression destination overflow
  mm/zswap: classify compression dst overflow as poor compression

 crypto/lz4.c     | 2 +-
 crypto/lz4hc.c   | 2 +-
 crypto/lzo-rle.c | 2 +-
 crypto/lzo.c     | 2 +-
 crypto/zstd.c    | 5 ++++-
 mm/zswap.c       | 7 +++++--
 6 files changed, 13 insertions(+), 7 deletions(-)

-- 
2.56.0.218.g1ec904b173-goog

