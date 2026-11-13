Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540965;
	b=QDFXNgwVRkK6hLDrH7touweWUAN/FNc5PHX57DVB7uiIfY5yhg/4LsKONaibTnJUMns4
	 IbzayYIgNCjRuo6UgWF4EpFkgPPE5zi0E8ghzH7TYzbyydf1BlNIzZXA4AaT8H3caoLYJ
	 DexTv96dLBZOSHNdhM+TY01iVBefi5Iy22MJ4SqGCCLn/rnx9GH46zJl4GPH1Rws3BXOt
	 7Fz8RaPGqP0YPy4JStlpSWzHkKUX8FHD7t/JLfs7nRXnIyX1mKck5+3lksd2fx8Nzmfc1
	 CsbV2apu26lNKX6+Ts79mStwdmWgz6VKzCXxK76/u/P4auic633b1giq3taXJBa2Xew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r5KmM3hC9Uv4xFkTrmo3e4C5L84QRkHLCHW26evJoKs=;
	b=VpGN93LNyaZP2oTj3dabLu+r5vH3qHDsnhvvT0mOedqYi5HYeFwyDVYinzsW6SuvUrrS
	 zHjPIiYNqnkNgKZrtn1mPky9ol6pC7RAxixaQHry+kgx16nfmfhLEmejGn1z0Zwg9/N+q
	 MVnJui1duhN84Sq/Ji9Ds2dn6xohx4dg0Ui3ricPITbo2USDvjjzJUx1DYupowTGiRdSp
	 ZPGSm7/Ge7clkagkd0+41GuDsvSOGYjWmGAmCd3hhPnqQK4PAkrItd7s91satS/5EdS2f
	 8jILCrlozzi4VDAlCWbUihFdr7sY+J8zP5NFDyBmkKGDaQVG+6RT+kpZe5I72IxrKuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=GREWqCXn;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD305606A881
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD305606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=GREWqCXn
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36dbde64409so855422eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794540964; x=1795145764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5KmM3hC9Uv4xFkTrmo3e4C5L84QRkHLCHW26evJoKs=;
        b=GREWqCXn5eus/NhYka3coulN1RbYUXfFzd6diIwvAPbgyMDiSZCfmt81bpHflicT3I
         ULXt+6Ixb7TDKu5nfkWlipJk9M9fjU7lSLnzTwXzixLZ1ox4U6hJ5ZWGfYgGbHlB+zSy
         lt+/HcK8ESduiqr0GuHwsIim/yNo5pP62UlwqwjmRokUho44XPTrEx4Pl9z88AURBa+i
         pzXJszt5+8wfSUkqML/fDwVJFghILPeT9eakJjsQ4DRkiUiG2jxAeRXYV8QnSGN1zJYZ
         sf74sXSSTpb3NbVelsYUYNz3f/61LnpBfaf/nz2eQOJ9E+gnbm5u7cQQ5KMOB2buX/Ok
         TZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540964; x=1795145764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5KmM3hC9Uv4xFkTrmo3e4C5L84QRkHLCHW26evJoKs=;
        b=0uv659ArjVdZtVHFXJyOkJlzOaavOhWdbBdkmwEwUO9QSYQvAsTxq7OTamvNJz+3mX
         MIcusqzmVBP1gDCaTjqLMYEc2N4rUQTHEGiolRXSS5A5ZugqEbq9KEgHBKdoSLLWExp8
         lYQlPbqdivgTjol5j29jT578bcYoN0bb+FbXeDYg5HIpAJnZTseL4gHCQscARU3gEJjT
         hSFQdaYcTxS5H1d+jhRY1hrJH24fCmn38GxwlNxRaL5NDDmwynh1nLXs56D7+M3qjaqq
         kDlJqZKYIcWJ0X+Ong5oGa5p/HoNs1wv1pBGZ73ox0SUD/j+xKfIB4kqH507lsKCwnzK
         mqyw==
X-Forwarded-Encrypted: i=1; AL+hErHU1Uo8qyDi+9FWjh26z1poyBZnZfIVxLpzcneWjj/Y78dr1aVVGvUNsLEB1xFN0prMpPzMwPIA8C9ettM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P9Hub3Tg/Gsi1Ce4EmEJCZQ0RH5FC6f9sy0KjcPVpHazZHOBI
	CsaNnuo8KRafIaTZbenQd7SSH7HuzAI5SrlFAB/2C0SNIl9TgIyJ0hPqL/5qyu4GZoQ=
X-Gm-Gg: AYBFou0coIta9I+xnSJYdnqJigYQNTHrS6EMvVjUgJBemZZ+SiumVv07X3h6YZbt5ob
	AbxeAGRlL50vgjG+4kRBN097V7GJvIF4mnU+eBCW+qSq4Hn8xfW224ex1E3k4vUWWfA80MvVjyj
	qNGt+MLZrvz7HpDXbyz3CyEO9r1kf6ob/J4YzpEysflB/rkeyhpzi7BJfa6E5yp7/GJjQmbv2yM
	U0d1uJeBLNzcvqL9W2jHHwK4Y2HEmuTZzaVgQNLb9i8NKXsIUMedYrwqWZ8LNeeDXTraGSB5kQr
	QuFk8vU7dp8lok2XrHleWzRUpHVF1JQ27xtZi3mDXxo+5xYPenG3yFvy2xAt6VD/1KzIfueTLhR
	kvzBdkk5J+ltZfJ7UYSHel6A8l1ng3UvRJWaaFP6FaAssAJaP0GDlanjnBjGg0WaSz7p2Q8zsEn
	bFG0D6FCg/5LAXNYImyLT3TCcOvNMlkMwEaLY6RNDRTo5OPiuNX7jQKQoNWtdUMyrF1iZBuLO7x
	R/2pUrmSCESp+efp2glseSGxi8LEJvN59XLs0XuNP7Sscy4eS+TH5OFlS35tJVvekGdpZ/d4+H5
	PlwCsoig/JCOx1duYMiT0qJo4gTQ6152PHnzxDtzW+TUALFeokuZrcdHF8dGdQ==
X-Received: by 2002:a05:7301:182a:b0:377:d6e5:e64a with SMTP id 5a478bee46e88-37965f9bfdamr1034369eec.7.1794540963741;
        Thu, 12 Nov 2026 19:36:03 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm2959426eec.15.2026.11.12.19.35.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 19:36:03 -0800 (PST)
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
Subject: [PATCH v2 10/14] mm/mm_init: make __init_single_page() static
Date: Fri, 13 Nov 2026 11:34:38 +0800
Message-ID: <20261113033442.62970-11-songmuchun@bytedance.com>
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

__init_single_page() is only used within mm/mm_init.c, so make it
static.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/mm_init.c | 2 +-
 mm/mm_init.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index ea9ff690d4e0..84de0870f78a 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -618,7 +618,7 @@ void memmap_init_page_common(struct page *page, enum zone_type zone, int nid)
 #endif
 }
 
-void __meminit __init_single_page(struct page *page, unsigned long pfn,
+static __meminit void __init_single_page(struct page *page, unsigned long pfn,
 		unsigned long zone, int nid)
 {
 	memmap_init_page_common(page, zone, nid);
diff --git a/mm/mm_init.h b/mm/mm_init.h
index 721221d2e4c0..c821aee774d3 100644
--- a/mm/mm_init.h
+++ b/mm/mm_init.h
@@ -110,8 +110,6 @@ bool memblock_has_mirror(void);
 void memblock_free_all(void);
 
 void memmap_init_page_common(struct page *page, enum zone_type zone, int nid);
-void __meminit __init_single_page(struct page *page, unsigned long pfn,
-				unsigned long zone, int nid);
 void __meminit memmap_init_page_from_template(struct page *page,
 		unsigned long pfn, const struct zone *zone, struct page *template);
 void __meminit memmap_init_compound_page_frozen(struct page *head,
-- 
2.54.0

