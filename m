Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854084;
	b=TiDoDXRcLjqnSmgj7fCZOrPdmvf34p49TK2T6SBiowQNjZbUh5nAZQOZDbBAPKjjk+g7
	 urkEHfSpmWtDiUAOAfrculM+z/yApdo5BvWJDmDweBjaUEZlOWvJ6qp36eWImcUC2bh++
	 67XMeWl6W9dy62uJvKcGT9MO6TKCt0x3r09cHbiuRgRv7yhh3ZeNeYp6xlo3bjAdtWfrj
	 LHqaalsxeXuWwun29AYppk2odA9xTp5FO0WyeFGO/QNOQwoaOicTlv/4bw0Q0cY2nQD2q
	 2qZYoSS0dRyygcRlXKOfHLSnSOVwF2T7kGcG8R7f8ZccPpDu+3LBlOCtAmCIDjbICjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7RktNgHUwlwtWmAgMABeK3FK5t5bFNo0JMMWVYG0t8s=;
	b=XxTRxzmaBYPF4Zdy7UNTgDPyD0qkWiNCjRL3mXQAPmRaC87cb2LpHaQXgawYaIIa2vAn
	 tyYWd4PakumXH1EvyDx7FroksK6r2aTQ+Ewo+ZpPyAe18atn+GeG0qNEOPtEZqP6472id
	 9IHzcm/7c5uPWg6WMg/rVGev+JXpIecwXXEZBX/Y+7iNBiGXzUnjx9VCD2VXKkBNi/zS/
	 QUNKdHrsX1tMajbVXFftk8JCnWYYAhkQ4H1CH1o12GqfXVdM+KGbVOkSoWdZAWR0WXgZ/
	 IczpE1je5q5MY9YWF24mZUyD/jzNV0IOK1dH3FuGzciW64YZBzZzQ9K9BrdEX/ox12w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FcFJNonH;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D3A606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2D3A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FcFJNonH
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1931ff67a29so2114800c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 20:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793854083; x=1794458883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RktNgHUwlwtWmAgMABeK3FK5t5bFNo0JMMWVYG0t8s=;
        b=FcFJNonHwrsUGGzPEUXa5IWB1RxPWF9N21EdetTVk9Qfb4o8e49MG0KPclz9Mrr4WJ
         YrD35TxhjwPNaCrCaHT6nMMekSMZ21cXIR7AAhllVk96wT22E9YwAINq9mgRJXuDX+i8
         2RkaahY0Z55IMVK4xKO34U6UAUFJA9yAakU3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854083; x=1794458883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7RktNgHUwlwtWmAgMABeK3FK5t5bFNo0JMMWVYG0t8s=;
        b=XBdD8G7hpfcrowAjAWh67FvXDJPUWLbgukGCUJT3BKjU7qXB+oivb2ogyffaRqbWHn
         0gJ7YF354Iq1JCTkeftg1doWKN/dpZZpCQ+irJLmj3kWcW8Wqf1z7TOBkbt3j2u2E9rD
         y9RcsCbRZKmexcY2bvP6g7WidiOHusvCeTWVhLhZDbvER9LTbAIwWjkUzIpOObAkJCrD
         y/BQHG6CUEl1fw64og9qRJOX4I4wdN5wTiNiDLR4gDtVU3EQh6+axhzaG93og+nS2a1m
         tj3dODrXmgO7h7uDg/vqUriIfRy4HGrdB2EIPiUD5tueKYnlhsIrynRD8QBX+t2qK82a
         g0wQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHfUBcyKIZ9v2bmt/RaJFDC0nHFORouV9cAjMJJRT+eSquk7g4TbEEzoaFSjq/Vz3PIWG9inn6ur4Kyb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PCAnh7dIuBEA3H+GDXyzi1eMrmYOIadZuWC5xDIBCBkO9/V8j
	2oTjUr1Z+m45Qkb0afiLZeWVALyhBZJPpVUn+R3vqKzVX1efTR+lyczlSgZyuSqMSg==
X-Gm-Gg: AYBFou2e6EY9M8TyC9+ijV+Kdil/Vc5lVhm69nJ1512SLDt7SStPkSjXg19cViUyhKt
	bwKNx/yKx10Fp2EHytniaFhsPmk3f8HyoWxWmB99+Zbc+m0nExKJ/TFgc6eLBriNoMzf/dm6YYQ
	TnID1hSzK/bYiiMt5lAGmDFJsSJEcd2GMvFME56n+DVQYFssT0H1u4CTmVFc4E4t/nWTKwVpNx0
	6vwP1OSEKFKZIOAi2N2adXjyDFdlLULaWC+33b3kzCUFHqG2pkPfItJE5XgTIgy4Kn9+hb4BfW2
	icln5c5dOMGcea9jr8I2amotdNhdMsHyeZYe7QRdgcluJS1K3YMuwk6RYGCxwVqzEfcBnFpWNvi
	5AujzLYz8f3zj9fohEdmzHlumpVOR5xmVAoXXEGmS/I0YgBJCyIEVz4BUN/NsWBDs8Xps1/umWX
	hSo4r46gk95JTY4W26phJ0ajEsLVElEg+Ks+yKjcG+bn56VFdU/prjjy2jpVFsocK+xBcfeHj2Q
	qKIeV6EN0yGlXqGfNpBZ4HnyxMwI4KxosX873KmTBrr2dwny987vi8zxVBw1iC8/Uf7shcfA0mu
	Du7aXOrxBNOo/tvtXrWLMS9NZAhtOwkA3ds1M1eBQQBoyKR80Py9+NLwt6PISpK6FstEMBGKm/1
	UnDjWmqZDYfxZaGxp6QI=
X-Received: by 2002:a05:7022:170c:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b0166c6be4mr17748555c88.28.1793854082667;
        Wed, 04 Nov 2026 20:48:02 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:37bc:b763:7ec7:65b4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c6f0dcsm17142927c88.21.2026.11.04.20.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:48:02 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 1/7] zram: drop stale comment in write_incompressible_page()
Date: Thu,  5 Nov 2026 13:47:31 +0900
Message-ID: <20261105044752.1997895-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105044752.1997895-1-senozhatsky@chromium.org>
References: <20261105044752.1997895-1-senozhatsky@chromium.org>
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

zram doesn't do fast/slow-path handle allocation anymore, so
the comment in write_incompressible_page() is stale.  Drop it.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 632045b65bdb..380615b73446 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -2271,11 +2271,6 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
 	unsigned long handle;
 	void *src;
 
-	/*
-	 * This function is called from preemptible context so we don't need
-	 * to do optimistic and fallback to pessimistic handle allocation,
-	 * like we do for compressible pages.
-	 */
 	handle = zs_malloc(zram->mem_pool, PAGE_SIZE,
 			   GFP_NOIO | __GFP_NOWARN |
 			   __GFP_HIGHMEM | __GFP_MOVABLE, page_to_nid(page));
-- 
2.56.0.398.g882cbad275-goog

