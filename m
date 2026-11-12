Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489023;
	b=M99N4ANgSd3pTKbEpqehQ3rVBUcC33+T4q72C+Ni4FF7CFcD7uucc3irgnqJoBkSwHuA
	 TOyD3ZNKYRZYD3MzzbSeXTI05DTRfHaE/yrCvNxgoUG9kQN+Vqs364GY3CjTrf57MSOK7
	 oZuff89rtq5I/IUX9t/z0vzq/kVY1AlFQvQi6Z1Evr3sJFRZn39QJc4y3IkFkgagJwBga
	 +kMT9xrAg58uDMK7xRwTfu9KtAJAzaN6T4hSu8D0rdCIdWMi5vRZomPuqP/VIObAgxZUl
	 GdRLMcE9o6zBxApwsuLigolO4ERjXUNjKj5nWTYmnk7f04AR+p0u68IOjWvBEpQthrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489023;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/ScJysAfHU/3UcDNAAYnWlZ68uEE/9WuK+T2tCuHaVA=;
	b=BMCxFJhnIzfI89YLtvpz/YJGBCCDdC8ydOGetd99hm4CefVYq1925nFLks7u3CjQtq5Y
	 3z24kTtid2FU+t7SWLz4boA6NFqPkb6JPVYEawfDCBUaXtASr0n5vHFkBnpDlPhCeNqox
	 d3/aRfqVYDNFoP5VEFYI5BUTbtearR/B2dUrhW5TSCxqOzrDwaMCNZzvfP0Ae+QiXME9e
	 XbJ/u+nvVyY10cl3tsoirw0IP4Eq8bcsw3rEFcU2xyhmxx8YD57ixhyxViyCxUepFf6R7
	 +bLDbiRKyOSj75xmJMGzayq/3FRozGooxuPVTh/K2W6/eWNDAjxESYNg3aCXgUlKhuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sSC54di3;
	arc=none smtp.remote-ip=95.215.58.10
Received: from mta1.migadu.com (out-10.mta1.migadu.com [95.215.58.10])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9769D606A880
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9769D606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sSC54di3
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Khvjz3OMMUyRYmhS0+smYP9TQ+oix+8/Op5iUO6ggxk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794489020; v=1; x=1795093820;
 b=sSC54di3GgxMKWcYF2sSz/O0xlW8ZapetPfB185w55XaPUrxYTxmnsq1q7z2OKmPXlczUrBp
 N+e7mA+F8zvvZSV6U7M+EjV5GgZqBIypCf7FmRr77XgHWYqopk6nFS7hiW3QBfDWDximHNd2ovj
 4QNEu8eHP1y3frIV8evzTZmI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6a1e810a2867f43e;
	Thu, 12 Nov 2026 13:10:19 +0000
X-Mizu-Trace-ID: 6a1e810a2867f43e
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: tj@kernel.org
Cc: void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	liwanwu@kylinos.cn,
	usama.arif@linux.dev,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH 2/6] sched_ext: Make scx_bpf_cid_node() a benign lookup for invalid cids
Date: Thu, 12 Nov 2026 21:09:30 +0800
Message-ID: <20261112130934.563321-3-cui.tao@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112130934.563321-1-cui.tao@linux.dev>
References: <20261112130934.563321-1-cui.tao@linux.dev>
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

From: Tao Cui <cuitao@kylinos.cn>

scx_bpf_cid_node() is documented to return NUMA_NO_NODE when @cid is
invalid or there is no scheduler. Its implementation goes through
scx_cid_to_cpu(), whose cid_valid() calls scx_error() on an invalid
value, so an invalid @cid does end at NUMA_NO_NODE, but only after
flagging the whole scheduler for exit.

Bounds-check @cid in the kfunc instead, keeping the documented benign
return and leaving the aborting validation to the paths whose contracts
call for it.

Fixes: 5cadf7545cc6 ("sched_ext: Add a CID NUMA node lookup kfunc")
Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 kernel/sched/ext/cid.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/sched/ext/cid.c b/kernel/sched/ext/cid.c
index 8e04a8494e11..b09b2c73ccec 100644
--- a/kernel/sched/ext/cid.c
+++ b/kernel/sched/ext/cid.c
@@ -690,6 +690,16 @@ __bpf_kfunc s32 scx_bpf_cid_node(s32 cid, const struct bpf_prog_aux *aux)
 	sch = scx_prog_sched(aux);
 	if (unlikely(!sch))
 		return NUMA_NO_NODE;
+
+	/*
+	 * Bounds-check @cid here rather than letting scx_cid_to_cpu() do it:
+	 * its cid_valid() aborts the scheduler on an invalid value, while
+	 * this kfunc is documented as a benign lookup that returns
+	 * NUMA_NO_NODE.
+	 */
+	if (cid < 0 || cid >= num_possible_cpus())
+		return NUMA_NO_NODE;
+
 	cpu = scx_cid_to_cpu(sch, cid);
 	return cpu < 0 ? NUMA_NO_NODE : cpu_to_node(cpu);
 }
-- 
2.53.0

base-commit: 5b740a72b55c4267ba4d8010f17dde26b26f52d3
