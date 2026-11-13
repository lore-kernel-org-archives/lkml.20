Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559887;
	b=B6uPmRu3BinZPMwSGsimc6B4LwG+2JLZrTV17H0awC1K1993Z0uSDh9Se5UaRnJsNu0g
	 3YuBzSFxoJ28Nap9AT7IA2PV+IqMWIEWDEqqD6pc4uJj3bgqLk4HAdanGVGrFES2Xyujl
	 HHDsAFMnr7Y/M1pEvLqe2/eh8HwCTuP39zqgUIixu8dPMFJ4PoQkTm3LWbVn6gAANB9Rn
	 CrXRQ0eUbqxlU4B5OoFFz75C4RbzlLccwafims83UP052njGA3439kCA2xKnkVKn50MlX
	 sJlcFLYDTZn+OLMFMyg4QEPPmabN9mmkOfHH/SIuBreWmPAn1Xywdm4okTu+kwjHmJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:Subject:To:Cc:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=77Y95W/UaJg257+QBwzQ+4jh+bph1WESxo/Gei8xe2A=;
	b=mFJDSTSUf3JKHVyHsXiNOwb4khb1RN6gJxDeJcqOcwIGd5cWgZATFTOwoFnN3+PZb3ba
	 NRKveUzYl3S+5yZEHldvr/pi7r/lbVtLeiuKDf1PifddZalrKVBtxppeRMVP9/7G7XZjk
	 1k/kajOyTfWt7BY4k7Lp+M0Fn+PkE7LIEehrg7ZUCIvGyTqxEMfTH+ocyva+DI19YNzMe
	 8JMbX9LONtV+pGpEBs90L3zZhBA/mPj49EYkagcmVuus50NZ5NbqKqOz4uzzvNXzfw1ZA
	 DD+Hdhv3mahVDNSdbEcX7eAsS3czEZRIH+f3JkRwk6+jcMRlv7GHAOxqXts3bjtOV0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=brVck6GD;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5E3606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA5E3606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=brVck6GD
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ae93a86008so456151a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559886; x=1795164686; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=77Y95W/UaJg257+QBwzQ+4jh+bph1WESxo/Gei8xe2A=;
        b=brVck6GDzg2l9Hd8ZDcj7od0ctXW1NWDQ5vZNcZ5RAm0ytXk7uT52keYCAc8GFvT6O
         GSPdgCSfKoXH3VE87n3N6oGbCcW3OxvcNkSKdFIp1YMUORZjeuqOlgzSJTKq/tH76O0s
         jGmzt6oEd1lV0VvBndnX0dNHhw2bU0tZhMa8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559886; x=1795164686;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=77Y95W/UaJg257+QBwzQ+4jh+bph1WESxo/Gei8xe2A=;
        b=qOleS8/u3zwDNqm3B3mudI5Z5nyefPYXD7z8Kddqo9VS1j9vhs1m5fAfghDgm4zer1
         LtYEEnMcpCC0yeTmRBCAaMGcA+FWnaTA7hpueMp/Wj6hdeHiSeCZtoCpnZGX74146gy8
         zMZP6U2b3PMGBXM0DP0zKjBT90X9kn+zmmznrIiYEfQDlD3FCbi7NtxMurhtzZBxWc9X
         cyl1eDrt9jxushUErsL05F3PCeF7oPpRbDzHO6INL5XLTUt1pNyx6vAzln5LD9INOvFh
         vgQ6lLoNrPDBSRU/H9vPS94ZlGeqAp2hzlpyrkCBAXxg3/0xLE6JBX2SCBjM8K9SYWnr
         OYqA==
X-Forwarded-Encrypted: i=1; AL+hErGd1tUln+zcoS2oDNy9cLsuKbIuFcEU9tXf0mlMX9VNuGQrAwZ652qeLzV3a/erDVpoazJ1VLj3/9LhTc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hCagMTXdLY47iVx1dtXbKNwKMToOD+D1b1CiH5RDppoK1NM1D
	hdhl27MQ+suuHAY+IAcnxdMltUm0EhKOCzbFCzSe3o6tgGq8AvWpANTs4Nc6bVupa48=
X-Gm-Gg: AYBFou1Ud7apvJC13hSy2BWwYyuWq/yYaBhESceoKu8faZqIlFCizxnyovCgKbrD+3D
	NxWPtPCHhATZRS41ZXqtEdx4ohe1baOQtiRNFqir2RXHV1EuysJec0DBkRVS97ea2Ea4Q+c5MhX
	26SUhPrLyJCvkm7XlHhIXhvpAY4ItduW/KjMQCDyo3RoWJDZ6yCx4B5W7X5bqvLS9HGEnspTht4
	i601cg1+nNUTQN3n/TDzT8bG6mi7h/viQRclsfQWWGqw36TW9CwqJDaYaDYEeK2tQFnjJALmOgF
	ok5z9Uq4IekDufd8iXbaP7uZAU9pHjm0s8Lw1dBWbMpo4vCKpAVuLv+ZRpwHguvSWDKXZiP+M6i
	0vgiRln47WnX7J+Tz2I++UL3tETea9e+3JLdZlkJOCHFXiVmLaL8ZyEA6lvWZy+smBR8/jiD1iZ
	MjwR92H6E8gLm5DmU6pNsooZ06a9tB/agYkKuAiQM6y0PCp/jhQusSegE+jvyzNCWQUpU7XZC0F
	4ypTV+2O9jDAhySNSUOJPOMuFg/HkdztgDVaQuHGXBzN+qk1RHV7X6SncLZaEJ9TXwS7N4oE9Wi
	1oeQ+gLZ90g45hy97/hvmuXabzdOIAudgzrdIc/EH2v+zLoO0m8fDNYP8vUw9tAaY7dbiZE8jYu
	P1C85Ej/n0H2Yp1JtOFDQxv5kZ08yhZCsmvLuPFfCPyjmXP4Xe96lKV2KOL/CHn/AdFVzPe5teV
	k7n9TKna098SJdYOp142mKkl3UMbm76LI4R5bNvne0nwuHlXAyoE/V3roqJ6E=
X-Received: by 2002:a17:90b:53d0:b0:3ac:b2e6:317d with SMTP id 98e67ed59e1d1-3b1b0a10840mr1664527a91.35.1794559886175;
        Fri, 13 Nov 2026 00:51:26 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec63b9bsm3619209a91.12.2026.11.13.00.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:51:24 -0800 (PST)
Date: Fri, 13 Nov 2026 00:51:22 -0800
Message-ID: <cover.1794506262.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v3 0/6] mm/slab: Support selecting slab hardening features at boot
To: Vlastimil Babka <vbabka@kernel.org>,
    Harry Yoo <harry@kernel.org>,
    Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>,
    Christoph Lameter <cl@gentwo.org>,
    David Rientjes <rientjes@google.com>,
    Roman Gushchin <roman.gushchin@linux.dev>,
    Kees Cook <kees@kernel.org>,
    Marco Elver <elver@google.com>,
    GONG Ruiqi <gongruiqi@huaweicloud.com>,
    Jonathan Corbet <corbet@lwn.net>,
    linux-mm@kvack.org,
    linux-hardening@vger.kernel.org,
    linux-doc@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Slab hardening settings are currently all build time choices. This means
that, unfortunately, hosts with different requirements end up needing
separate kernel images. At Meta, for example, some hosts are built with
these options and the rest of the fleet isn't, and that's one of the
things that keeps those kernels apart.

This series does two things:

- SLAB_FREELIST_HARDENED and SLAB_FREELIST_RANDOM are cheap enough with
  sheaves that it makes more sense to just enable them by default than
  to make them switchable. With both on, system level benchmarks didn't
  change measurably, only slowpath heavy microbenchmarks did [1].

- SLAB_BUCKETS and KMALLOC_PARTITION_CACHES cost memory (Harry measured
  about 1 MiB and 18 MiB respectively after boot on a 64 CPU VM [2]), so
  they get slab_buckets= and kmalloc_partition= boot parameters, which
  default to on when the option is built in.

Whether those two should be folded into a single slab_hardening= is
still open [3].

v3:

- Rebase onto slab/for-next.
- Always build the slab_buckets and kmalloc_partition tests and skip them
  at runtime when the option isn't built in, instead of leaving them out
  with #ifdef (Kees).
- Declare slab_buckets_enabled and kmalloc_partition_enabled in
  mm/slab.h without any #if (Kees).
- Drop the remaining #ifdefs around slab_buckets= and
  kmalloc_partition=. Both are now always registered and ignored when
  the option isn't built in (Kees).
- Keep both flags as plain __ro_after_init bools rather than static
  keys, since they're only read when caches are created and not on the
  allocation path.

v2:

- Make SLAB_FREELIST_HARDENED and SLAB_FREELIST_RANDOM default y instead
  of adding boot parameters for them (Vlastimil).
- Skip the memdup_user() part of the slab_buckets test on !MMU
  (Sashiko).
- Keep slab_buckets= and kmalloc_partition= separate for now. We can
  discuss whether to merge them into slab_hardening= or similar, as
  Harry suggested.

v2: https://lore.kernel.org/r/cover.1793253633.git.chris@chrisdown.name
v1: https://lore.kernel.org/r/cover.1793086056.git.chris@chrisdown.name

[1] https://lore.kernel.org/r/auITixAJMfLtfa7i@chrisdown.name
[2] https://lore.kernel.org/r/179312451613.474906.1475329637924619088@kernel.org
[3] https://lore.kernel.org/r/aud4gPOUzvHtLYnJ@thinkstation

Chris Down (6):
  mm/slab: Enable SLAB_FREELIST_HARDENED by default
  mm/slab: Enable SLAB_FREELIST_RANDOM by default
  mm/slab: Support disabling SLAB_BUCKETS at boot
  slub_kunit: Add a test for the slab_buckets boot parameter
  mm/slab: Support disabling KMALLOC_PARTITION_CACHES at boot
  slub_kunit: Add a test for the kmalloc_partition boot parameter

 .../admin-guide/kernel-parameters.txt         | 15 ++++
 lib/tests/slub_kunit.c                        | 85 +++++++++++++++++++
 mm/Kconfig                                    | 11 +++
 mm/slab.h                                     |  3 +
 mm/slab_common.c                              | 52 ++++++++++--
 5 files changed, 157 insertions(+), 9 deletions(-)


base-commit: ce6518e61e3b4bf4f97f7ac6204049b9eba7eb75
-- 
2.56.1

