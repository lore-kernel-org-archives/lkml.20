Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540932;
	b=jRoveIEPFoLMh+c8J6UNRK+CeTlhSC37sYCK+h/4uyZpbHPvM5y2JWVzjF62FDy+xur1
	 dON3vEH1Kq8XDwonHqpXzJrcgCjMzAPQgaQt98ddXkdRyBuQaiPKHa9ugPoPp9T9LOLZ4
	 8Su2JemH6ifGDQAZuPUqgrvo1HCT5yWm7mAfPrPboSUO8/J6igVGQJNhonS17/b285QI9
	 OV5bqcvMc0yDmVc6t6r3BNjqKTcEyMZJvmIWfpKnfQFWFSy/4dELBnF1fK2h4GiUJu5N5
	 aEQtSw2MxtnECqfJ3WxnjABT+2WLyqC6FYfttf2YAkc7oTiuuhNa6YVTEMgMzTdw5GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rjuLQ3sQch1AgnD9MXsNCce3VktIWaK+QChBd/wj6dI=;
	b=BJYbp/D7T3fIOjfJKfCxfIn1Weomjbbd40p5ZD0qMQu1ubKBETJTnGPDHpJGmmsfJSEF
	 b8yYjtuvYnuaKrYvJKtGjAQW50U7GbYRwi3V+XnzRajupAmyC0QPUSFpqORAiI1wB3HFS
	 HoslS5WD4SzAYonekDU/A8YK2Y2NFtAI1j0CnD3tT3Wz0QHCpH1oe6pA0N0mbR1uTxKrI
	 ilOgwfx1U448OKQ2r0dhrvctdSID4C0Rjk1qj/1p3ipHm+i17g3T2MdGGKvEpydYiUexI
	 HycgRlW4moUMunLu753O8tiuhg6zRb2pPcSYajcVwAkcLSNer0D4R9lB4+NmYr5M0dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=f3g80KUj;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FA7606A89A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36FA7606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=f3g80KUj
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so1152034eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794540931; x=1795145731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjuLQ3sQch1AgnD9MXsNCce3VktIWaK+QChBd/wj6dI=;
        b=f3g80KUjmBiI8Nu7ygQD1UrptTiWJ7jj4pv5Zgq4nuAkItzFJ+J1VLE0UdZ1P9LSTE
         Q6DdJlpuZ52Gjb+wKa6aG07BtJSe0NRmMM32S9D+HuPiTjuRs55TgpwmjpxPpWJC80ag
         NaW1c0B0rXWDp1i8Mf5pzARrdDgXaH98X9kUUwGuq43SP+HXSlttIRq+VQQjnfftSDI9
         2/xl3VFLYzmqAk6hrTMm9WUtP19WtMXvdSdW2mA6hWvPikT0D4CRu3Efsfd9cz0c7fvm
         4yLsTWAqaUzcr9mVzCYwNx5fL3XQr0KYCCdMdymH8o6YRHBhUAdVIQpn3Vl4MwLv2n1O
         RtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540931; x=1795145731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rjuLQ3sQch1AgnD9MXsNCce3VktIWaK+QChBd/wj6dI=;
        b=uG2VKoONTSIx8B9OuXkpnQPUh1inc4M2qq1Fh0lIPcq+WPatnoNQF9G7D+yD9UsYic
         Bi7I9waEqQGZwm0oPXKprFcf2cfRHKJ0orQq/0S0jOTiMQyxy3YYQ+QKLmpJDRTQp6Ul
         Cp4+1sdjUa7dDnvEE9nfEFVDIRykvIfNFO1Eg15oTIkRSFjvepFqfXd6IYQP33ZiSMVM
         UYWH+bvA/szGR7582onVL6fs6JVf2OQpKku6hIgyIdxO3YLWxAv0kAkVS7ygEVV+LGCK
         0aVug7UUzM1qHj2PFZuzoG5ICjpcDfI/hoKntd48WUO5QTrobJKbLFimQnCdoIy+wUyU
         oZJQ==
X-Forwarded-Encrypted: i=1; AL+hErGmgF42Kjz+24B0/IKf6TfDsBWo8aVwBt+XFAt4ocsyqn6LBnYyWlM7Sa0O3YC9ygmZ+LnRg7Q6YPfTYl8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JkQBcUyrF30s4ZexR0T9lcZnb6u/aF8N+z/Ffg7HlVVb31V6u
	fKMm/iqyfWdFR3JWAjA4u0hLX20kkRa2mer0tw/mPNOdxuPYc9+HcdzpMAmSZzAGwgI=
X-Gm-Gg: AYBFou3ZoBjPeogNFY6/PNS135JMIXjvh40v2fzl06cfY9L1D6v5inhHSRcwupwJ8zO
	04XBFkIxuITRS5jZfyjHDumHSENH8pnTwaYPf42Pfq0LhZhyCxRyXq6rgbXtzpidHOfZesCiyh+
	UcphT5FEB1fop8yS33512dXvJiGhc4vlBIJFH0dSrQuDetotD4qJiUnFTqkJL303zZKZoPyUo/W
	C3OWA2M6eGD+NsVf1FIoLaBXRtn4QazfMqF3WBdDL5+RJ1zP6BEw/uoexBuycqZJbBHpBEOMsMK
	KhcoA2OM1fZ17u3F7CgJbfdDNmFqC6dMeoJLBXeycOGJ6dbNiTm4+yE1U9+scqZ3JukGUgZygKB
	vjiDX0cTZymspoOu75UlmjYrhlTcDqZIFpCzXNElZ2zC+GERQ15H9GccqmcX/CR9fd6wrTPXpym
	MUfMPe+QlmfEolQJKN9rwCD5U3+Kl48p/Wr6JMVRSuhKSYTUjzPphvautf5ALDB4BFPOy6Lp8vj
	CwKU7qmfR8PFsQIRuvrsjvTn6vEJQXmvQqK0tD7ji+acahfo+XqGi+qzfEmim+Edisem7zulDq2
	8WTwDtpeJ7UrwB25sRhMCziHcTrWqzA40FSNBGaCc/UnLarn4c3TyHxGB1etJg==
X-Received: by 2002:a05:693c:80cf:b0:36e:9773:84b9 with SMTP id 5a478bee46e88-379673132d2mr1035256eec.23.1794540931106;
        Thu, 12 Nov 2026 19:35:31 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm2959426eec.15.2026.11.12.19.35.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 19:35:30 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>
Cc: Li Zhe <lizhe.67@bytedance.com>,
	Andrew Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 03/14] mm/mm_init: verify zones for template-initialized pages
Date: Fri, 13 Nov 2026 11:34:31 +0800
Message-ID: <20261113033442.62970-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261113033442.62970-1-songmuchun@bytedance.com>
References: <20261113033442.62970-1-songmuchun@bytedance.com>
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

Template-based ZONE_DEVICE initialization bypasses
__init_single_page(), which means copied struct pages do not run the
vmemmap zone consistency check.

Verify each destination after copying the template so the fast path gets
the same validation as regular page initialization.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
v2:
- Apply the zone verification in memmap_init_page_from_template().
- Collect Reviewed-by from Mike Rapoport.
---
 mm/mm_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 639880afe0ee..5ce5a325021c 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -724,6 +724,7 @@ void __meminit memmap_init_page_from_template(struct page *page,
 		memcpy_nontemporal(page, template, sizeof(*page));
 	else
 		memcpy(page, template, sizeof(*page));
+	vmemmap_optimization_verify_zone(page);
 }
 
 struct zone __meminit *pfn_to_zone(unsigned long pfn, int nid)
-- 
2.54.0

