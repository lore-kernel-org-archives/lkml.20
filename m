Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411353;
	b=PT9cErtm40K9lRHF/eFVqscmAzla2FwG+9Oi8Gfw6Bt/3wwBI/tnX29dYoaUlwKVCboj
	 5x6WHeh3wd3M7FB1pv6vcHPvgfwKRDL6e4sMfMA98XN55MzbU0FuyjOt5WXT6W1BfM3UO
	 3T+WgHc5lTrGMLBmXfzsmepWzA9Xmtuv/1jNTYa56jQqAtBEQ473venzhDMlZeSdWhTaW
	 vNybqDnQwPUEwVW8DbC4IX8p2aPq9PjYu9LRLkHlNgMkgydNiatk9dgB13ZO+nPw97uKe
	 IQpc3n0DN6udH8fyGU2iLclZ8ngB1j/ZszPZhjIyRhpy1qixwAStxB4t3dI+p8lnURg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411353;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Vz84Kwwxu/OXORILPVs0FJv1ASydR/NK4sfzJcCSGcc=;
	b=qBv50lby/1aGt3xt69i3Q7cGFRw4j0JxFvcdm1d1IJLX9zDhsv9XU+PZ5UcezIOLVOY3
	 Wtgjpi9t1cM1hPSv3hkxIy6ggM29FEjqK5mm/IzDjZKn82+gE6kBpXHSPqDp0dmkgkSQ9
	 jA4P1wVKnga4r7WyF5dFVC7VCg+uvuL/fwe8GImSao2CRTBJ2NMNwp+tyMA4kEDECBr/6
	 iww/ItA1q3WZ2N98lPn+o28O3SUJWseYZxgm20EHKmLF99QhHON5FdtH2g9nOceVvs3+l
	 +tzICSLczOxAWqXow6RT33akvNM+qfQZlV0We0G2kFuhEFfK+muLIWCCYoEFPoWBQvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FuOjHULe;
	arc=none smtp.remote-ip=91.218.175.105
Received: from mta0.migadu.com (out-105.mta0.migadu.com [91.218.175.105])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45D8606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E45D8606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FuOjHULe
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aX9pIIbzr0WUjOOk9ufqdHhoopyWbM7JVXWDvohF98Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794411351; v=1; x=1795016151;
 b=FuOjHULeZ4ZA4/WVPcUF3X0QnNLWtVcic5UB2IwZMDHmSZZNODuGnY07gPZ2fn/9NiQ+iqiL
 /ZOiLmqaNti3Ez5r5JkCMX9rZ+s7ryIILNBDQTLBIyXF1Vl3Lkf8Q4XlNRArwEGfBOMojs30KyW
 bbLw85cRuWKYTmzTzK5D4ipg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 5069cfac4354fb9b;
	Wed, 11 Nov 2026 15:35:50 +0000
X-Mizu-Trace-ID: 5069cfac4354fb9b
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	terrelln@fb.com,
	dsterba@suse.com,
	hannes@cmpxchg.org,
	yosry@kernel.org,
	nphamcs@gmail.com,
	chengming.zhou@linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-crypto@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com
Cc: Usama Arif <usama.arif@linux.dev>
Subject: [PATCH 0/2] crypto: use vmalloc() for large stream workspaces
Date: Wed, 11 Nov 2026 07:07:38 -0800
Message-ID: <20261111153532.1036709-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The zstd and deflate acomp implementations retain per-CPU stream
workspaces until the algorithms are unregistered. On x86-64 with 4 KiB
pages, kvmalloc() can back them with order-9 and order-6 kmalloc()
blocks, respectively.

Use vmalloc() and vfree() instead. For a server with 384 CPUs, if
we have streams on all of the CPUs and kvmalloc() takes the
kmalloc() path for every stream, their workspaces use 193.5 MiB more
for zstd and 42 MiB for deflate.

In five before/after boot pairs on a 96-vCPU x86-64 VM with 8 GiB RAM,
the test populated both algorithms crypto workspaces on every CPU. All
192 baseline workspaces used kmalloc() without these patches. The patches
reduced workspace backing by 48.375 MiB for zstd and 10.5 MiB for deflate
—58.875 MiB combined—in each pair.

In five before/after runs in a 4-vCPU x86-64 VM, median compression
and decompression throughput changed by less than 1% (-0.93% to +0.64%).
Inputs were 4 KiB and 64 KiB synthetic buffers containing pseudorandom
data or a 50/50 mix of repeating-pattern and pseudorandom bytes.
The differences were within the observed run-to-run variation.
 
Usama Arif (2):
  crypto: zstd - use vmalloc() for stream workspaces
  crypto: deflate - use vmalloc() for stream workspaces

 crypto/deflate.c | 5 +++--
 crypto/zstd.c    | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.53.0-Meta

