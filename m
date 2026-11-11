Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411361;
	b=PDb+t1/sDEpRNUPLxFi6cXuCJ0oNk8zPifxfgxIr5q/rukxmFUACEj71OIkC+f3BsyRZ
	 hSOR694WKN25y7oHv5kcp/HacCmVeQV3r5de82wJdDmH4imQqRQeaiKToUPEHz9tGNl8a
	 zvNt526g6DLNjcFbsBm8TSoPwfRLMj12a9jVHgD+yMO84jY374ip2TFdBvhe/APc2tPYJ
	 IvvSK5/BRQMJpyoyNFyuR0A4KLsKKqiZZhvMUBxG/Cs5A2w+2sdm9L+ksDPgpKrHaMXKZ
	 fifn4SQevYMrmE4B3i8o3fqdV0x//2PzhDEKfQI8xdwpixKpEmtt34W87rzV4NRoc+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411361;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ymrbQazdLeg+pCGWurk8n0D0XL5o29ESgMmIKPn6rw0=;
	b=pRWDzlbbWalAdGiQS9SqDCaFBzYmTsounLySGGpjsW205ySc8cKQ7VznWp9KYBNsQWXB
	 B3Qi62uzr1hkxsNFGSuwRTSdRK7UxGDklw1CWRzMTiG4fdCuXbLY+zHsBEtNgw/4bZWZz
	 S9NbO3LqdkKPHDT9e1TF3fjwpve92bsAF2gmlenMa31U9liW6inE8kNzp+EV+9U94kt4m
	 c9TdK1BE8mSC9P4duIW1ozsuy1Vot42hGwQCy7MGXF3ZJZhXrVWvs2u3zv3CQD4ewcSWH
	 tBJWkfCEhAsLHFP0jZH0e3s9cE7ytMmhtI55uVdjAqQWk22Rb5WfjxamEHZ6XTz8S0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="JG/SU1Jf";
	arc=none smtp.remote-ip=95.215.58.205
Received: from mta1.migadu.com (out-205.mta1.migadu.com [95.215.58.205])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0647060A380A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0647060A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JG/SU1Jf
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=B4avA2HMujRiEbRvCpZxZXa2sgy7oVdlWYyRAX8qanU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794411359; v=1; x=1795016159;
 b=JG/SU1JfyZfJp6rRj2Cg0JsuugkZ86L8wxwJDSTG6D/eGP8A18fshrbwthMgADSH4ICWAktQ
 3f6/j1ihVo+FJ/xBdXoKuJCEELyDoXF+ewJqE9rMVZf96wY9lSiXwoYPdiQzxLs569sLSAgOOWq
 7efZrvHX2EzQbuWCALmtJV5Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 9c1c4dea31d188d1;
	Wed, 11 Nov 2026 15:35:59 +0000
X-Mizu-Trace-ID: 9c1c4dea31d188d1
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
Subject: [PATCH 2/2] crypto: deflate - use vmalloc() for stream workspaces
Date: Wed, 11 Nov 2026 07:07:40 -0800
Message-ID: <20261111153532.1036709-3-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111153532.1036709-1-usama.arif@linux.dev>
References: <20261111153532.1036709-1-usama.arif@linux.dev>
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

The deflate acomp streams outlive the transforms that use them. One
stream is allocated during transform initialization; additional
per-CPU streams are allocated on demand. They are freed only when
the algorithm is unregistered.

In a 4 KiB-page x86-64 build, each stream requests 145,320 bytes.
If kvmalloc() succeeds via kmalloc(), it occupies an order-6 block
(256 KiB). vmalloc() needs 36 backing pages (144 KiB), 112 KiB fewer
per stream. Across 384 populated streams, that is 42 MiB less
workspace backing if all would have used kmalloc(). There is no such
gain when kvmalloc() already falls back to vmalloc().

Use vmalloc() and vfree() directly, as the crypto lz4 implementations
already do. This uses vmalloc address space, page tables and
bookkeeping; the figures above compare workspace backing only.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 crypto/deflate.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/crypto/deflate.c b/crypto/deflate.c
index 710ebba7ce850..a8692532a65da 100644
--- a/crypto/deflate.c
+++ b/crypto/deflate.c
@@ -20,6 +20,7 @@
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/vmalloc.h>
 #include <linux/zlib.h>
 
 #define DEFLATE_DEF_LEVEL		Z_DEFAULT_COMPRESSION
@@ -40,7 +41,7 @@ static void *deflate_alloc_stream(void)
 						     DEFLATE_DEF_MEMLEVEL));
 	struct deflate_stream *ctx;
 
-	ctx = kvmalloc_flex(*ctx, workspace, size);
+	ctx = vmalloc(struct_size(ctx, workspace, size));
 	if (!ctx)
 		return ERR_PTR(-ENOMEM);
 
@@ -51,7 +52,7 @@ static void *deflate_alloc_stream(void)
 
 static void deflate_free_stream(void *ctx)
 {
-	kvfree(ctx);
+	vfree(ctx);
 }
 
 static struct crypto_acomp_streams deflate_streams = {
-- 
2.53.0-Meta

