Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917244;
	b=vP3NlOAFv/0CIfHJu0WaXCBdAPl13GBpOn+OU7iIJCw1iCGEViXk3o6Yh2kSELaz0ou3
	 CMQzEkCo7xef/+cVhmHnGFHJS5zqpe2m3QTvLo6wm2X1bdR62bt+Of7HJv12sqwmcdqdU
	 ul1muvqzz9SORumbmEMHs5Cb3p1NKVPV8HBP7piDrP6hnhIgSNkfNH9m8oz3MnZWpIvey
	 /aPxFp/AN4BFSb1mSkSAbj1W9UvTIcvdlcHv/qztoMMONp8eKVjPaqZbnziJ7om50z2qg
	 r+qlgfUl96Eki/8oJicJsFmJ9hu8tZ6DDF+wtqil0kyOetofzjjq2bf63AuxgUloXeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pngp1egAaX0YbQYqS/9oJoUz1wuFN3ikmsU5M9jflxo=;
	b=Y3wmpVvPBOHiS4cHpmyckEBaQpYL9erlD2ACQlEgANLEJ1hS+cxE2nBcXaHUPb5yHH8o
	 Gp9qo+LWZXFOcjdrJx/jnF3wZJPuLfFFwn8IN2WdgBnY1hSZHxH709mJO342OUxXHniVL
	 F5mlFgumw1RUhVltZx/zyMmx7/0LAu0pibT3z8PThsEEsddxfU85U3OntxrjW7/bHKz0f
	 aCXBYOa7ccAdpqdVuMccfbktvwmEt+8jtydtpTLYuyYcycf/9J82c9PtmggIziqSa8KLH
	 tHKSTGcK/ckCvhTmjkVrH+yC+fJ7JHiz/whVwn54ZI6WMhQRulMC2oNNhOPtm+TjAlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=KIooos2D;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62382606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62382606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=KIooos2D
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-18818daa3e7so444343c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794917243; x=1795522043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pngp1egAaX0YbQYqS/9oJoUz1wuFN3ikmsU5M9jflxo=;
        b=KIooos2DClZKouyiKhB4rzpkqn4rd+x7CloM3guhbBtlU1l0KZ2WMbtVma9sjSOz1Q
         5JU9eamBERr7f84Z1mmg7V6b3SxsTKRSz7leQkK+CQbLM4FUJhtc5LcXvOkzIehdAImo
         HdfCXBu/zUTJUUr0xbFUQHToM5w6WRCP3gZbQ1XjrI7P1jd8q1RzxgHQCMjV9USOCPdW
         cnzhMguqG3vqSkGAqmh/lYscCCrHq/pPD7VP01d78p/vRBNfiqfc8tUCXOIi9b1pPaDc
         qgeQ1ltBK/0WFa6P1OaAAUL1Pma4gfa1y09Kd8Pt6YcwYRWXYTKQ2Hr4jq5OZYCr/e3m
         dVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917243; x=1795522043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pngp1egAaX0YbQYqS/9oJoUz1wuFN3ikmsU5M9jflxo=;
        b=a4PkAXK1t0kZ8yB7x/Cd3ForMZ7ulMgCqXT5YHzE6vRpVdm1WTs0Oaswrdd/I5fz5O
         VtMsGCyQMlU5EddvbP3ajKT4zgpMkMnypXQkgWL3Q7qWzv1O5o0zN+krcRpS+JjVDBOm
         JZXaRBUUgKX9f2DFS64/bgihTbYLBpBFtBiRWzav9QG9h9EDueD2TfxqJqd42jM4MEQG
         qM9HPgPKKJ9jpSIGo8YIXRbrM5oqLWeOASIEJIT0MPHitbQaq6m5Akoxge8wdAQEYURv
         CDtOc0xqAKOds5HkoUWcBb21ppwuFdRKDW8KEib95znjo4IyWV32ZMu7fSFjU7sKK3a2
         z6cA==
X-Forwarded-Encrypted: i=1; AL+hErHL/oKRulmyWiFOFwybNi5lnWtUkevS5cw8W2ya8yrO5TFYbn4YyIVpZqQCXBVU0t+dA84df0ZU56UHxns=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bDmC12UzkHXSIGUgPz0iO7xU+vupwbq4RdaPQHw6g43QvwHLi
	YAwf8N+eUwsHGkHesImO4orUSM9oCU32Byd+FuF/duaXabpV0uQLfdHKYE8U/odHnwc=
X-Gm-Gg: AYBFou2qFLEOenN/0/v6aHSq30oUrU3m0/+GQ2b2mDhJ0LbqTNFV7F99iKJW9+L5ImN
	zgOWYXyEG4x6AzZHCL4/Gm28tYvXw5YubPQqL3jG8FFwRwyVu3nOge2q+5pEjSPffPPfK0EmxNJ
	dzOUZFPba2UXiRI3rA7KYcwCCPAxVifW6b4jAOnJpQOF5tkw/oKlOf5odq8uqIrEZqt0rzVOgZd
	lulj8r+MFzmWdUfQWz5ygOSzck18lAuZCwMf/te7OHgFOb5efZyY6/q7mlFS76RiuLRzMuE9EIK
	hx0gZnxYLOuP5GFMVtDtIBx2UaKdDuUVKkRPgxmrK/4H3ouxYyLy9JBom6RtTHAbdLeMG9FJqnK
	UKIFAhGyBeodLOL+b5yQT2KlL9KkSexIFZshMboVOTH6dg+aS5vGXmFyvApq5ZbizrntYWMHOqx
	ei1M2JdQM0+50zsMJ5Kjp+JAqbbFrUScrbzesGRnJKujjVRlgAaDLzVIYt30YBKqIx9hkWbV7h3
	Npnxy/oSjYoYRfFVRtlbmeO8vwQWM4lMIOjCDrN4F/76aFlqu6KFONDO7Cc5KsqBI7QQrVDxiwd
	POzRL5CshtEIMp/xBFeaEzNYwA7d1Uoezr00+4ChNoWCVWzaMcy8EI/+CjPUjk2RIHH3caadbMo
	B89BjvDe/Xmw=
X-Received: by 2002:a05:7022:7e85:b0:152:dd1b:4fa7 with SMTP id a92af1059eb24-1b53a3e54fcmr2076054c88.19.1794917243422;
        Tue, 17 Nov 2026 04:07:23 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm47347116c88.5.2026.11.17.04.07.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 04:07:22 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Chris Down <chris@chrisdown.name>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>,
	kasan-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 3/7] mm/page_ext: always use vmalloc for section page extensions
Date: Tue, 17 Nov 2026 20:06:23 +0800
Message-ID: <20261117120627.50601-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117120627.50601-1-songmuchun@bytedance.com>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
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

SPARSEMEM currently tries to allocate each section's page extensions
from the buddy allocator before falling back to vmalloc.  Boot-time
section allocation happens after vmalloc is available, and memory
hotplug allocations do not require physically contiguous backing.

Use vzalloc_node() directly and remove the buddy-specific allocation,
free, and kmemleak bookkeeping.  This leaves one runtime backing type
and lets a later change add memblock as the distinct boot-time path
to simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Add a preparatory cleanup that always uses vmalloc for SPARSEMEM
  section page extensions (suggested by Mike Rapoport)
---
 mm/page_ext.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/mm/page_ext.c b/mm/page_ext.c
index dbc1bfa258f1..3b581242fd52 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -285,15 +285,9 @@ static struct page_ext *lookup_page_ext(const struct page *page)
 
 static void *__meminit alloc_page_ext(size_t size, int nid)
 {
-	gfp_t flags = GFP_KERNEL | __GFP_ZERO | __GFP_NOWARN;
-	void *addr = NULL;
-
-	addr = alloc_pages_exact_nid(nid, size, flags);
-	if (addr)
-		kmemleak_alloc(addr, size, 1, flags);
-	else
-		addr = vzalloc_node(size, nid);
+	void *addr;
 
+	addr = vzalloc_node(size, nid);
 	if (addr)
 		memmap_pages_add(DIV_ROUND_UP(size, PAGE_SIZE));
 
@@ -339,19 +333,10 @@ static int __meminit init_section_page_ext(unsigned long pfn, int nid)
 static void free_page_ext(void *addr)
 {
 	size_t table_size;
-	struct page *page;
 
 	table_size = page_ext_size * PAGES_PER_SECTION;
 	memmap_pages_add(-1L * (DIV_ROUND_UP(table_size, PAGE_SIZE)));
-
-	if (is_vmalloc_addr(addr)) {
-		vfree(addr);
-	} else {
-		page = virt_to_page(addr);
-		BUG_ON(PageReserved(page));
-		kmemleak_free(addr);
-		free_pages_exact(addr, table_size);
-	}
+	vfree(addr);
 }
 
 static void __free_page_ext(unsigned long pfn)
-- 
2.54.0

