Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540979;
	b=JGaDytV6i6APkAS06D+cETLC68/k1od+2UBaV+HxHRA54+loM1D+qFDp08bIQM/IntUk
	 zrjfctDg8laANNZdNJ9BhjLn9pbZyLW84iFLb3QxvJPkuaDtDiT7AOXILjQcjjO7S0h/F
	 H2Fo1q/dHVEFPzvAqB43CDk7HZgIt7HLmJ6iiS6WhmGZ4/CfpMedPKXW3SqJCDsD8xMTk
	 QbH0FQHQesJQumMRoPvAgEqJ/ao9Po4GaRwEblw/2IUa9hsT6QWi8NoKw4jSjMbqH/iz9
	 lRzqVPas7nv7o0dxK07fPRnu8Npwd38VAD4E/xx5Blohm74f5zV2U+gaIxKo5UdI7Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GJ+IqbvwnkZ7lgF5M/SYmtKGJnK0HFHx42IVNot2lew=;
	b=Z6HzHwRQ9FNxSl9zDMU3gcnh4CRaqAu8irW3CmVrhN2A6Mxh9Zr/icksCde2tYAplrW+
	 07YU0hm0tkkNLu3RaHDx0xIZwoJHLoe+XtpayAKK85ssEy2yt1hcsBf5s6Fk4pOGIje8A
	 +slpVvwCnlQaCJQtJ0UrHv6MpFW2R61y0VbCllVRHLF1uM/NhxzBwsopZO90cArdbfeBx
	 J8G0Eho2ee9Puyhre3lfQ+VdDgooP8OY5o0bRfMd8VmT9hvckH2XzPRAnCHY6n6XhFSXm
	 /Jab5+EpqOQR7UrZwsHnSAueT943iOABqK/kh1v8skp9Q22yrOL0APGLroenZAYyc4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=U3XBeCOo;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAE4606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEAE4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=U3XBeCOo
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37000e7234bso1300464eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794540978; x=1795145778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJ+IqbvwnkZ7lgF5M/SYmtKGJnK0HFHx42IVNot2lew=;
        b=U3XBeCOo1X87eZx+jZbO/tYA/SfOQ8EzhcAHzallhTt3Y9C7IBV7CuAitDz2VKN/YH
         aRNMPtD12cQ0sByexwb55WiWeX47dVYGb0RtrOrC3dtSgrPSoDiUYIj4SGbYZS0dFGNc
         f1txGA9NJSTag6bWVDYBjjTN1e+BjDo4TLRvf6I+GvuYZr0B984kg2pmo0V7Rk93AHFE
         KIeOhhJ94KYgkjjsvmAaqxXijxomp6DiOpVK7Du4fXindfxr7Ta8BKLFAX7OG9oKgWN/
         xBsqTUC2S2vmEAnSAdEJlq5f/KL4HYDPvHlr5ZnSzp8wNFotAHhmPMddmBK4rbGBo3XS
         e2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540978; x=1795145778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJ+IqbvwnkZ7lgF5M/SYmtKGJnK0HFHx42IVNot2lew=;
        b=gSJVrtJekV95wIEtRvV25QVFcwR4Oc5s2Qtc6OWoF5RsBvnA/7ukJJqGOOM4HAT7je
         il5mDA+LHn1vDipcsOpJE3qLpaKC0cINuodMxAr0VaR5zKIZTTBM/Ptz3xs328bVVCDp
         V4GQ3yelyt8PJU6kiX8T81P+/peYeldl8J7ibwI5Eo5hiB7EjtywaSIYSi8yWimp5Ixi
         v8oLxTCyaGjuLipN5y+zWCduzS2DcdIKGQ5HrTPIzpHJkFOo08ZO51l2h5StTiojIRIY
         KqYCfwoUCX/99KTfXlwkAxNdPG627Z/ppLECMukwndTMlG33zMXez1hCetVqNKNJwliY
         Ydcw==
X-Forwarded-Encrypted: i=1; AL+hErHhBes16r3ozeVOVlSFGOVPLXeaT+jGBtrGqKNZd6JOUt2rvWpY6WlCglgerxcO2/DkeUbvozgMYOp6rkQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ad1kHABZrdKKL0RjUuc0kC70mIiOItlO4fiyFI4pgxQbT6dGR
	E1vh5Bg33KfUNPco4XoiRgTGgm3ApcuJli1AC1X9vURkNTwg5Abuw3qIp/liSNopbkU=
X-Gm-Gg: AYBFou2hqakhuGixvoy+vzL4CBdcD9mwA+KwZseXZwsj0JtfT5aNjkuUMQP3jCazlcR
	ZwW2GpzB5vWAevQ09E6FSxc1OPcNsiZV5EubHJNz5MaAI7C6Ympp3FLehiJ3duVQUFIdAaGahO9
	gUnJtVhhjPQOOt2vvCD3vq5QhFTEP0uJbNpD2RcaStHgTKZi9ujZ3vwkKBGbIW2SuCgthXe5jeV
	QEHj6GHd66UtUlzCNKUBTrg8o3V7Y9hhdiVebERLI8Nk9pmTfIWtb86H3VMPYpFDEICPoaFX/la
	VkKM59BeA9vWpk79JmnNb2olH0GqVvK7AF6qLHTz+wtAR5sHXImE3Jbm6ySfUTYT+xRgFYo5NnG
	bcmrPirFCUAkSPZVC45lxe0zzCbGqEOzqxwwiJsJoJf21XaFy9syFd1o8AYTmS5c2vTFh9zL1b6
	uar58UANQRxXwbApQLHDFIFs60gmz4zaV1NzZEDJDuQadi9nGcis1TjRgzOlPGyVMVRakLy6UsE
	29qVuyPk6DIHa5XDG1gvZu64NCFJil01qnsC+4nthjEntidoCIjwiWZ650Ss5lupU0xaFl9BHSL
	Crbuq6waWNa8lAF0wclH50EvhdNAQlulbdGCIUGM07BQUTQYysTeEGpmO7pANw==
X-Received: by 2002:a05:7301:1625:b0:36c:9f1a:30b8 with SMTP id 5a478bee46e88-37966c4a5fbmr1089440eec.31.1794540977804;
        Thu, 12 Nov 2026 19:36:17 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm2959426eec.15.2026.11.12.19.36.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 19:36:17 -0800 (PST)
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
Subject: [PATCH v2 13/14] mm/cma: localize init_cma_pageblock() to cma.c
Date: Fri, 13 Nov 2026 11:34:41 +0800
Message-ID: <20261113033442.62970-14-songmuchun@bytedance.com>
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

Move init_cma_pageblock() from mm_init.c into cma.c so it lives
alongside the CMA code that uses it.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/cma.c     | 8 ++++++++
 mm/mm_init.c | 9 ---------
 mm/mm_init.h | 8 --------
 3 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index 46e72734ba72..7ca0e100504d 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -30,6 +30,7 @@
 #include <linux/io.h>
 #include <linux/kmemleak.h>
 #include <trace/events/cma.h>
+#include <linux/page-isolation.h>
 
 #include "internal.h"
 #include "cma.h"
@@ -138,6 +139,13 @@ bool cma_validate_zones(struct cma *cma)
 	return true;
 }
 
+static void __init init_cma_pageblock(struct page *page)
+{
+	init_pageblock_migratetype(page, MIGRATE_CMA, false);
+	adjust_managed_page_count(page, pageblock_nr_pages);
+	page_zone(page)->cma_pages += pageblock_nr_pages;
+}
+
 static void __init cma_activate_area(struct cma *cma)
 {
 	unsigned long pfn, end_pfn, early_pfn[CMA_MAX_RANGES];
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 6bf25d03902d..9a51cecee547 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2211,15 +2211,6 @@ void __init init_cma_reserved_pageblock(struct page *page)
 	adjust_managed_page_count(page, pageblock_nr_pages);
 	page_zone(page)->cma_pages += pageblock_nr_pages;
 }
-/*
- * Similar to above, but only set the migrate type and stats.
- */
-void __init init_cma_pageblock(struct page *page)
-{
-	init_pageblock_migratetype(page, MIGRATE_CMA, false);
-	adjust_managed_page_count(page, pageblock_nr_pages);
-	page_zone(page)->cma_pages += pageblock_nr_pages;
-}
 #endif
 
 /*
diff --git a/mm/mm_init.h b/mm/mm_init.h
index 7cde357d6324..1723db7e54cc 100644
--- a/mm/mm_init.h
+++ b/mm/mm_init.h
@@ -40,14 +40,6 @@ struct zone *pfn_to_zone(unsigned long pfn, int nid);
 void init_cma_reserved_pageblock(struct page *page);
 #endif
 
-#ifdef CONFIG_CMA
-void init_cma_pageblock(struct page *page);
-#else
-static inline void init_cma_pageblock(struct page *page)
-{
-}
-#endif
-
 /* Memory initialisation debug and verification */
 #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
 DECLARE_STATIC_KEY_TRUE(deferred_pages);
-- 
2.54.0

