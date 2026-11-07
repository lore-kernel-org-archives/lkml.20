Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018619;
	b=wOaj6XocKD5etHAGphEO21tqQtb2nqJVRWKNEpPYNw3dYjHuWrSN9Z3NNiLPgsPZM6i0
	 lx8ytQDYRZCWLJyQdUb9JOTn9SaWcEXz/qLhg4gOSuuQWdRBUC8mrvOoACNQeTvf0Uo//
	 wclyazWAn+vkl9i8ysXq193pR8av7Y4951ycpPte824SyyYXBcFBv0pYBoOaGTMk1KZaN
	 AEDcc5JmYKIpzTq/0msZXltC8CJ3X5QbhY4jZRT/NVmgS5nJ6/34ROz1SNJcONVF9UCaB
	 WEK+wUF6ZV6mRke4htBj3xGVIgmv7uxFaoLOjgvmRUTOvXDfNEykdCjxzFNwLcK/1uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tzWys7rD2mzog2Av+jcuYf8OXU66Yvf4rDiAeaSLNnU=;
	b=A70RXAjR4wrauqyr+NQGBTUx7kpPr3gCGV0CeOX/gCca044BHbiFTcAJFnvE2b2bShCb
	 h93mgXmKqZwmm0CEL/VJJO/rbj49Bapu4x45BkrTWy8F6wYqMLo6BU+Z3qPn4A2xZ8Yz8
	 9ImLIRdvbtlTkLUgEzZh24uC12hDezfGgs6ixZt+HitdosWMERKYLFXH+9XGoCsJbpH7q
	 a6razeUC/ZCMndq0s2z11Kso0LaSTfWzbdaD2b7TOWQcTZJpLpf1xsDIujg4ag7WwMNEn
	 hl2U3/kywrlXENmWowZkdCCy3biveOH/ZVsGDjY5n7UieBKAajVh2RD5zicMptzna2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="frgqsYA/";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECAC606A33D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ECAC606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=frgqsYA/
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3704d30b84fso883025eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794018618; x=1794623418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tzWys7rD2mzog2Av+jcuYf8OXU66Yvf4rDiAeaSLNnU=;
        b=frgqsYA/0jS6PMqUnW1uyE8Xqok7XH9iHlQmL7I6++4hLaePXypz+tcUCFbrDO+Mc1
         WfmGw1Rzv7N9t7vQhJuWSJM++cN+ZVacMUwrGfK8t6rHxQ2r1+UIN4ViSHwmtyvAnB7n
         BXrZTykiqlUTZBT1GY5VLFWllLVBbphRQq5Xk7qI8D7LxC6BiRSMYFmAH1Q8W5b5/8cl
         etLEfoGdu3nrsu2wiSpR2RS7aJslMCrAUWAbQjpdfJ/OuA3U/TpF9m13f/uw5/CIKdsu
         mcOacxNk4Ffe3+8yQRGus6w4wv5LetI6uqlLonGPxDv+QTDN+734wm88aan0MMWdokR2
         1vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018618; x=1794623418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tzWys7rD2mzog2Av+jcuYf8OXU66Yvf4rDiAeaSLNnU=;
        b=1haNZFZAhpUdTPoR4DJqj/b16692oAsRPXYyL9nz0CZMDN2aFJwNwDLVV0hvb1Kpv0
         zdSqMqMirFpINUdUnCZpyLn2HFDxlCBGCQBsCq0JPns+yW3y4f/bxrqZ17gT8YMLisGR
         hnyQf/P0tdI4b9ORPwGhl5/P+RUiQplTn2MmXkc/865OSHWPRglr+epSdIZed0BWo9IY
         7jT9FNbNfIzcZvPUsmNgtraOlMRVTklOkfXoZfCG8xvQ1sQQbr7en/6B4cybGOfq5Omu
         Nl3go8oWr/xi2ZnQGHaEl7qtFYUAy58X1SgM+Y04E3PD3oFmMr6udbty42Oqplk7nUYi
         nhbg==
X-Forwarded-Encrypted: i=1; AKwUvBw1f0ofZJvQ1dS9tUwoRQDjmknSXiEABCfX+WWtxYLjrKn2tFlCu+NkAtc5uqOeobVnQnPZoUyfSN4SEG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dlWtyyXGtTILTXKdVs7VLF3u3kiPUhv2Ajp+6E1bIZrZjGPvk
	mMFjpOkLTMkwciCE0E18mu7N3m92eN09LZOjW9HjRTHcrDbObaV3h0Wa1MLNUCXg6ns=
X-Gm-Gg: AYBFou2ZIkQdSOvqS2hwUT2II6UWkmSPEknWnPh8iy7PiJGc1L8wYEtSS0oiRRDF1QJ
	gB5++QDq3jd5ViGlzY85e7z5pM/tNASQErXOTe8Cw8q77jca10FbEvd7+GKvcWv+07NgIuU8gwX
	AmXjavzyoz4tci4fY0gJLSvcIWS6c+87GuZ6DU3HyURIVGk4pCYsm+KyJYRFT25rUENj6cr4B+h
	+GJ1EM0SUvo0FJSk0e3gApqtkbh39ePz8TfrHyo5ihVwsBCaTn6xrCEsxzv98kS7tDuwexJfPoW
	fYw/GiL0jZOobvcipgcc3/5UpFMNrkapzghfIysbGEn5toWq4wFMf0czd36Q56jP8uDR6CMeBaX
	sykgNSHBcncL/+s+gYAEa/kSN81KbsTxDVDKu5+2emESfYL/ZbZuihZ75xUaHlz9igOiWl2JpH7
	hlj73nQRyO9p828jEHSwr3OOFaI/bYgRwMuJSyTMs9UmloWVshDSNaBeVqqBwIk9a/QFQNbf7D9
	zJdSMEWY6cRLkOzizy46353MaND2QRU0j0YWnhooaOEGNG4fz9gdSIZGT+mcRj4IbvM/Lg377rF
	sDjiNcMgxDHfRRseTLmNYIE9tY4WX8fv7RJ/v4TZfxCzIXU+0gS3lAj5oUqw
X-Received: by 2002:a05:693c:68c3:b0:36a:32ac:ad89 with SMTP id 5a478bee46e88-36f722e7fd7mr6072905eec.2.1794018617901;
        Fri, 06 Nov 2026 18:30:17 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm10457077eec.23.2026.11.06.18.30.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 18:30:17 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Yili Zhang <zhangyili01@baidu.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v4 12/13] mm: hugetlb_vmemmap: unify vmemmap range restoration
Date: Sat,  7 Nov 2026 10:27:55 +0800
Message-ID: <20261107022756.77731-13-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107022756.77731-1-songmuchun@bytedance.com>
References: <20261107022756.77731-1-songmuchun@bytedance.com>
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

Restoring an optimized folio and rolling back a partial optimization
both restore a vmemmap range, but the operation is currently implemented
separately in each path.

Use a single range-restoration path for both cases, making rollback an
explicit bounded form of normal restoration.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Tested-by: Andrew Morton <akpm@linux-foundation.org>
---
v4:
- Collect Reviewed-by from Oscar Salvador
- Collect Tested-by from Andrew Morton

v3:
- Collect Reviewed-by from Mike Rapoport

v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 359e53302a67..b8c10671d53b 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -287,6 +287,18 @@ static int vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 	return 0;
 }
 
+static inline int vmemmap_restore_range(unsigned long start, unsigned long end,
+		struct list_head *vmemmap_pages, unsigned long flags)
+{
+	struct vmemmap_remap_walk walk = {
+		.remap_pte	= vmemmap_restore_pte,
+		.vmemmap_pages	= vmemmap_pages,
+		.flags		= flags,
+	};
+
+	return vmemmap_remap_range(start, end, &walk);
+}
+
 /**
  * vmemmap_remap_split - split the vmemmap virtual address range [@start, @end)
  *                      backing PMDs of the directmap into PTEs
@@ -348,19 +360,7 @@ static int vmemmap_optimize_folio(const struct folio *folio,
 		return ret;
 
 	end = start + walk.nr_walked * PAGE_SIZE;
-
-	/*
-	 * vmemmap_pages contains pages from the previous vmemmap_remap_range()
-	 * call which failed.  These are pages which were removed from
-	 * the vmemmap. They will be restored in the following call.
-	 */
-	walk = (struct vmemmap_remap_walk) {
-		.remap_pte	= vmemmap_restore_pte,
-		.vmemmap_pages	= vmemmap_pages,
-		.flags		= 0,
-	};
-
-	vmemmap_remap_range(start, end, &walk);
+	vmemmap_restore_range(start, end, vmemmap_pages, 0);
 
 	return ret;
 }
@@ -382,11 +382,6 @@ static int vmemmap_restore_folio(const struct folio *folio, unsigned long flags)
 	unsigned long end = start + folio_vmemmap_size(folio);
 	int ret, nid = folio_nid(folio);
 	LIST_HEAD(vmemmap_pages);
-	struct vmemmap_remap_walk walk = {
-		.remap_pte	= vmemmap_restore_pte,
-		.vmemmap_pages	= &vmemmap_pages,
-		.flags		= flags,
-	};
 
 	start += VMEMMAP_OPTIMIZATION_SIZE;
 	ret = alloc_vmemmap_page_list(&vmemmap_pages, (end - start) / PAGE_SIZE,
@@ -394,7 +389,7 @@ static int vmemmap_restore_folio(const struct folio *folio, unsigned long flags)
 	if (ret)
 		return ret;
 
-	return vmemmap_remap_range(start, end, &walk);
+	return vmemmap_restore_range(start, end, &vmemmap_pages, flags);
 }
 
 static bool vmemmap_optimize_enabled = IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
-- 
2.54.0

