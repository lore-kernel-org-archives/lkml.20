Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673123;
	b=Ds11P3wdTqIkSPFyqWW2LgeYbHRDESa588IJlX7jEuJmYBmVwtIFokXNi1U3I7A3WjK+
	 +NjuieRtW9HTf0DGqBZpmUVbP7OKUsDw1rZ2WxOSjwriCcF4xqXdtfR47F+QlDxSvlMvt
	 zyaYvcSm/EIGKjF9zKMpfzUqCrz+32Esd9wASx8KC+cSXUoHsMUmQPSx0nUiVE3Njk4Q9
	 i/c3YLUOkUIMK1Sm6J8yIyM5d2GevSocqhjzBAm0vPq0Qtr4SKvomyESxBo1eVa6k4kCh
	 AYF3NRzEYt0dHVVnpqGv5yUVuFXvrcTIuYWPwjoHQymhjCQHspW8LnMZdsizu85GTcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673123;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=/e/DML6VhtXmgchh3D6VG9pyLDvWkm3EATTpFCuaGRU=;
	b=ZvLt8z+La/Da17cv1q22huP5lxd67PVvl497bHXI9kBvor6COQUTwe6Dxc/0+V5HC6G9
	 2vHGqjVZaqrFqY4U5yCUxCSA3nFuvsQgkchzpgC5AyFxgt/GzPeotl5WCb3rovIrsqXOP
	 RKrj9LM/MeN5KdaCwioJ9gapmUt/MwPQtGG8Ujs+DAkPoIjPU/0KzX0UTXWvNM1dUf9ON
	 f+G+WYMuSHlZQ9zM96AwhuMf+gYZ1TP7Vq0uvP6b+1fi5MbU4fBxGFN+I7q+N3awA8n/A
	 +SUCuw0RZKll68vdXNat7uVTcRNnhaGTILbPILODCaiG4427/Vcg0XpPcTKptw2ntFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="okvv/uDS";
	arc=none smtp.remote-ip=95.215.58.245
Received: from mta1.migadu.com (out-245.mta1.migadu.com [95.215.58.245])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C002606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C002606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=okvv/uDS
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=o6tCkHrPXDXhUkW2Vt2Sq4pwRH/wGrxJv76uyLTjs3U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792673121; v=1; x=1793277921;
 b=okvv/uDSMVdtUW3PVNE6GhlTCQI1AUXhJnra80miBUS03Z78F36usxu3yOBnVZIAQLPrbjO2
 Qe0VYmVCEhbtr64u5JnJnmUlW7c4WgeqS4DhoQ9YnZ8bT07CvMZVR1Kke/2Aa+t6+JtUDQu6bS7
 LNWKj1qqkvUEMLUutK83rETM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e24c385dd572482f;
	Thu, 22 Oct 2026 12:45:21 +0000
X-Mizu-Trace-ID: e24c385dd572482f
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH] mm/page_alloc: remove unneeded forward declaration of __free_pages_ok()
Date: Thu, 22 Oct 2026 20:45:04 +0800
Message-ID: <20261022124504.75642-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.56.0
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

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

All remaining callers of __free_pages_ok() appear after its definition, so
the forward declaration near the top of mm/page_alloc.c is no longer
needed.  Remove it.

Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 mm/page_alloc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 0396c50b96f0..6db90e0aa929 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -216,8 +216,6 @@ gfp_t gfp_allowed_mask __read_mostly = GFP_BOOT_MASK;
 unsigned int pageblock_order __read_mostly;
 #endif
 
-static void __free_pages_ok(struct page *page, unsigned int order,
-			    fpi_t fpi_flags);
 static void reserve_highatomic_pageblock(struct page *page, int order,
 					 struct zone *zone);
 
-- 
2.56.0

