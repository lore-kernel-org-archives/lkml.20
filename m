Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540969;
	b=0jAbSPP92k4arQe77szna0k25Yvb+Ej6eJT6VVp2bdE9/EHs+jFiENqp5El7pzL6eB+O
	 JX8cs0YlDYVPo487ftaMLB6qsKKP2cHgwCD3Qxgmj8HAFvYOaSeslxjgPzx/9OsXsaOgv
	 yVNqyMNAzc8O4drw36dx4cLmVzVi1HOyjH+9oe/YCq44drGlyrGq2sfilwchIR81fghK/
	 Dpn1h+BPWQ8ec+/sPEGuRMGF6YNgdxNPjy0ks/NMOx0uXteZN6Y7kCfwQclR3DauK9Wxz
	 Ec2TOVpYTL5daGBFO1qxY7BDwCeV9uT/UlMT5KSRb0tpFf5dMrYyj0JOoAy2F8XWIiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7AZpKqSn+eNMSBHSNGygoACY8QaCFei3YoxUNTE9SgM=;
	b=hWKRaa37qBroUTKp0pO6d4Xq94dxygbsbJ7j5WSxA1CUcrrtbTinlg97p4SoMFZIZjwi
	 5cMuEAY8NIFYz62blE5c/AjK8tvzsuRLz13n0fv3+aIJZIwZASYUSb8nQorz20zPcyw6N
	 6Y8ksnoZldOl8+U+3RHMCcrNGxIZHeXJ5QBJqrwdkWAp1uQohCQ9h0+SL10UgXdzIhkmf
	 HlbbKMAnJsyPP0wW/KyqD1i7Kw8GWtlQdzxl8sDrbo4Fs48Q39tvbE2Ca200GmwgSvvgu
	 RL5/fM3Vm3k5JrDKC5ZLOvzDTBhpaGhEc/53roWpiZh+xBhUMMcSqeA3J3PjyjE7pig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CXA4UHv4;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A91D606A88D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A91D606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CXA4UHv4
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3720addb068so814972eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794540968; x=1795145768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AZpKqSn+eNMSBHSNGygoACY8QaCFei3YoxUNTE9SgM=;
        b=CXA4UHv4bcHi5sCk8uiqSDRIAYIYwfS6BIvIoMREgHL0uYGVT4M4R03cytLcstJB85
         q+XNFetecYgwZLV7KFaAfasig76Wn3Gm08fY61esuIVCZQaChzAXOE2wMwq7/e0CcI8T
         T2RwGpsWX3Sf7I2rpEdR/sc0agmxKjB+tt0eqGfekZcCXegw3f+vinELnRiN70x2I2BV
         ZakM6XBgaOXYVhVIKgfO7VzgLjJH24j/tj3C13awFbQ6UMnLdlGAeUTwa5qntP4bVpau
         c6buFvVvF/IKr4GBOYQYmdZ8c5/YUPw2kY79GV6dBtk8i55n08+KPRRxpff/2fMXX5I7
         6JRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540968; x=1795145768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AZpKqSn+eNMSBHSNGygoACY8QaCFei3YoxUNTE9SgM=;
        b=UD2lx2WkRZ+FHsTltOPJDKljL7SQ/tJGVFv9ISs9pTiwcdLC1YDllJ1sIimbp/B+Sl
         GC1D1ZNs/6j3kjpakdJLpa8Nt6BUgcmtxCdMfJK2i4/RGtxw1l7x0HLfQ//G0byfafiX
         u3pq3Y940yQxRUWQopu2YnV7f6glltyEE3sPTgUGHHtLOMTwo9DGExM6DrNTp/EdKG0D
         2gm32RgkP17OjalfTA2MnpArcAWHJOzPBWu3pWi8qFWqOs7XKFQoaLUkFt8Vlum/a5pZ
         mzjeqKHW+9zziCLJndK9NUJmgwzvIFEOI4L355kjIddZbTbfVA9fMrR5FFj3yJ+IIESp
         4++Q==
X-Forwarded-Encrypted: i=1; AL+hErHWUfFdW8znJpxhURWDLapuK89cJmMypuF9lSZeT7l/xPtxTMyZo6eEaRKRgWPKLoJ4xNRn3HySxbbhKhc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DFv+VEVfy/VBrXr9XRQmsFKyaQT0/fV1hBcOduzv61l+C08PH
	OqagzvRZ7Y2nUcA8U7b1NVy0zQDz9HYbTmeOateoUIQGlRFad2QCaags5IqL8dS1dfo=
X-Gm-Gg: AYBFou295uwtf1KyGoALO4VCqu9RiytQuMM6hMkyn94CLRWx5oBunHpnDm4PGoOr+a1
	0Lt6qyETVbkT+n/cUgvTbCNxuPWYotUbcWx0BfmOGl1HBtf5Nr4v6dNym9A+42m0L9kGrZDDoWX
	rzase4aZ3dVCzDFT0J5LVWCCeD0R72KkGM5vW84NoYxmXzC2K9HJOys7znsH3HCiM8UI56tVeTx
	EMosrm4AekaoNyemn5EcSQvXJGXKVdhRVF52yclPTZQ7qel+1t6agWjlSBMvYsEP2u8OyiBim0y
	vG0LkycvVe4aDCsoDhxDdD/nM+Im0hauUtdCcSpu5TxXbjd37M0gjMuxDd9+HZPJ+BKrv5ckvWI
	Y904/hlqRtq4ciiQuqY7AN9wEL+LzEUuHIMtnpq4NVSG0o6aFMqFE4Dwe873zl4/nNyuzBh/8Jz
	K1rW/MUCLPcpaCvjF7f2Ckk1M8UDe+RoGBdx2cr5bsTucojc8eZ2NoOYHqi7V9gPmyhDscbPXfV
	GLBSLtv0HsETlXz6KBFifb7cJr8BkNR6N9Uagw140DQ5FDG8irDOXrgMOztVFZhNJroAwFce1JF
	wkMioWj9eC0M5C9nZokG7Ito+5+IYb5MMxpDrVVJFvAAvlaFhieU8PT3MjRM0Q==
X-Received: by 2002:a05:7300:8a19:b0:377:1bfe:14d6 with SMTP id 5a478bee46e88-37965f9d236mr963581eec.6.1794540968350;
        Thu, 12 Nov 2026 19:36:08 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm2959426eec.15.2026.11.12.19.36.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 19:36:07 -0800 (PST)
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
Subject: [PATCH v2 11/14] mm/mm_init: make memmap_init_page_from_template() static
Date: Fri, 13 Nov 2026 11:34:39 +0800
Message-ID: <20261113033442.62970-12-songmuchun@bytedance.com>
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

memmap_init_page_from_template() is only used within mm/mm_init.c, so make
it static.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/mm_init.c | 2 +-
 mm/mm_init.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 84de0870f78a..6bf25d03902d 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -719,7 +719,7 @@ static __meminit void pageblock_migratetype_init_range(unsigned long pfn,
 	}
 }
 
-void __meminit memmap_init_page_from_template(struct page *page,
+static __meminit void memmap_init_page_from_template(struct page *page,
 		unsigned long pfn, const struct zone *zone, struct page *template)
 {
 	/*
diff --git a/mm/mm_init.h b/mm/mm_init.h
index c821aee774d3..7cde357d6324 100644
--- a/mm/mm_init.h
+++ b/mm/mm_init.h
@@ -110,8 +110,6 @@ bool memblock_has_mirror(void);
 void memblock_free_all(void);
 
 void memmap_init_page_common(struct page *page, enum zone_type zone, int nid);
-void __meminit memmap_init_page_from_template(struct page *page,
-		unsigned long pfn, const struct zone *zone, struct page *template);
 void __meminit memmap_init_compound_page_frozen(struct page *head,
 		unsigned long pfn, const struct zone *zone, unsigned int order);
 
-- 
2.54.0

