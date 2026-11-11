Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411359;
	b=3O+iSZmLqFco1YExX6WmGh8FYBcezUr6c/9LXKpbQFmQwS1j4YXemDweXnfA+DLlxqnR
	 KQ1Knoaf73Eby67pz0Ih7hzQMtOnAyIcqWZV64+1YE0+k5zH3uWxYbLNsKH255N5C37nc
	 wG70Vlgig6m8CjlBsmFDYitITKMyKSo4YQUxE4Q/TKbwEAVZ1nj219bcAu0DYF84BJbpJ
	 0dGlU5CisOM2j3iJWZmx8zxr2A4eOf2rRC6wi01fhQ5RgBjchsI/F6tdNQNYcz0132djv
	 ZY/LXUsGrBGToOvAXVQ4mpyxDPsy8sk6ghlMfbNTnOarvE4Kqkey5q3h69ahVoWrAag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411359;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fj67uJIexCq/nLllAUwirpRaTK68JNnZnw90fZ+XBzg=;
	b=oQV6ORN8SMHWrJOoo6JHzrLoQisSStdUq2OYOgC+JgxpUetocQgmmaL+oM10xHj/azAq
	 /aNKBwwSTGifq82bLeOgPD9gWMYvyg0w8RVrhYI+0Rpgb07X2T4Pf0XYZKTEJmP52QPS1
	 CEhQS9LvJCKgzQWr4t2XFI4m4wJ4sx3diM/+mtmge+Td6g++PHnYptHkl+N5ZZAC/K/VT
	 e9NiGp7v4vgptrDfcGc2CNPTsB2INi156hchCjhFpGrO61/IrKwRwAL4Sa5hhCw4wN+Hz
	 3M0WTebAYBMTw8AnOTQ6QU/VEPkntAT4FR9Hn0XvThy9mMXp5PZSr+UwzW7bgOMo9DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lXqDEgFQ;
	arc=none smtp.remote-ip=91.218.175.111
Received: from mta0.migadu.com (out-111.mta0.migadu.com [91.218.175.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19D2606A8AC
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C19D2606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lXqDEgFQ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cW3e6v6S8n5JercVte195CK4nR9zZ28vbmPV4+LMgoQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794411357; v=1; x=1795016157;
 b=lXqDEgFQs69ZIepWDgXjCTUbjhRebCFqTIyg6OfAeio52PM7KbzGOs/Pi0QGQZVL9e9q7AvC
 mQA1KvSgaj9bQc7FvHfUlBEc4KUpphQ1Y+/zzG4twzU12HWkhm/EqNdNJ04+K6q7MIN2LbWeygU
 neof1gSc+H7sy0KbubsK62rE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 57900353a63a43d2;
	Wed, 11 Nov 2026 15:35:56 +0000
X-Mizu-Trace-ID: 57900353a63a43d2
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
Subject: [PATCH 1/2] crypto: zstd - use vmalloc() for stream workspaces
Date: Wed, 11 Nov 2026 07:07:39 -0800
Message-ID: <20261111153532.1036709-2-usama.arif@linux.dev>
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

The zstd acomp streams retain their workspaces after the last transform
has been freed. The first is allocated during transform initialization;
additional per-CPU streams are allocated on demand. They are released
when the algorithm is unregistered.

In a 4 KiB-page x86-64 build, each stream requests 1,566,281 bytes.
If kvmalloc() succeeds via kmalloc(), it occupies an order-9 block
(2 MiB). vmalloc() needs 383 backing pages (1,532 KiB), 516 KiB fewer
per stream. Across 384 populated streams, that is 193.5 MiB less
workspace backing if all would have used kmalloc(). There is no such
gain when kvmalloc() already falls back to vmalloc().

Use vmalloc() and vfree() directly to avoid the high-order allocation.
This uses vmalloc address space, page tables and bookkeeping; the
figures above compare workspace backing only.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 crypto/zstd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/crypto/zstd.c b/crypto/zstd.c
index 76bdaca327330..f012293919368 100644
--- a/crypto/zstd.c
+++ b/crypto/zstd.c
@@ -44,7 +44,7 @@ static void *zstd_alloc_stream(void)
 	if (!wksp_size)
 		return ERR_PTR(-EINVAL);
 
-	ctx = kvmalloc_flex(*ctx, wksp, wksp_size);
+	ctx = vmalloc(struct_size(ctx, wksp, wksp_size));
 	if (!ctx)
 		return ERR_PTR(-ENOMEM);
 
@@ -56,7 +56,7 @@ static void *zstd_alloc_stream(void)
 
 static void zstd_free_stream(void *ctx)
 {
-	kvfree(ctx);
+	vfree(ctx);
 }
 
 static struct crypto_acomp_streams zstd_streams = {
-- 
2.53.0-Meta

