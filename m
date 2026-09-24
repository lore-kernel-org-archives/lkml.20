Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28F034A797
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236716; cv=none; b=KO0lgkw6k5g8EBRYMyXRx1e34OxNueNOUplR0F9Jfpnr3gAD1qXNUfenFZqrwkExl9aYTqnpGw1AkOcwBxSQgUohlDQHK0LVfVTUNBKjLTojY32h+Ic15P9oFVx3whiKIAaeUXOnrtEuJk74F75P8G1c1GbQX4uw9BMyvRcZnZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236716; c=relaxed/simple;
	bh=DzMSx1CmV1cP2gnbnvgaolGqQOfTr+u7d0CKEQDb8HU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYQetpYgH2pQLsVaLdC/xCq+8aOD0u5OKdDg7DCmA6UvMkEaLHh82+xpE5vKM96QYYDMQPn3P6Obll05uC7RUFT+6urq8hZkG/i+dEZVjOQKLFq/8fF9o3bsRD8aJkn8WL4JKxWd/fLe7Snj9yHTwJ4maGCjhIWhWQvmIJi2SSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=OLaDw8ck; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="OLaDw8ck"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd4f99cso1410802a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790236714; x=1790841514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r910VhEWgy1eIdXLPcYAHanh/sXYvzfGYAge0OSfUc=;
        b=OLaDw8ckgq4Woj0+aBWNNsVukyE8mwV8XaEFbPdsK4RTfhN7b792DNWVeo/khekE0j
         c5dRPdvm7I+pOLItTm1IYT53IK6itfgmZq1wY+rilGrprByQzNGlLunK2E48i6G9Gxl0
         w3r6fAQ7RnYYd8yHRSR8puuoESpUU52UrTTj9Udw3n5w1iYJGw3kx77tkqzn4E/KDC/q
         U83a2copJ4lBkfc7Is2JSSftr5HqhSu6meAeWN+uyS4KESR6LSQxGThd+/MCU/8LSn6T
         vCcUXnresS8Zqh1yCHwAd1rsO+TN2WR3LQJc/qrdm5KRl3cMIaQIv/1ZcgF58fW4peEf
         WQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790236714; x=1790841514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8r910VhEWgy1eIdXLPcYAHanh/sXYvzfGYAge0OSfUc=;
        b=JO8h4ZC2dhFVb+DZ0MAOkzEkQs1i1MnLsZe6GMaM+eD+589jCl9KTVirIR/TfuL0Bo
         pazVEFYvcEfLs4Ns3zsBPvBCfaZc12ae2c37c8DDBxJSdYjvzrFFwXUZ4VO9NACGFFiK
         XelGb/RkymiR/YIXDH+qTmXrGrcE/7Jh5D1fYeF9YZW7zPyof69puCDBLSx13hc8P8tg
         Ucj59TZ9uKEV2wuQIP2AgVAeL938NRkbbVVtSD/5rs0OjgfUPPjEXjJPJ88rZJLbkVHG
         hu2vSsbMKldrc4hNyxLpUx0rbyOEyLymiLqN8HVwoJRH3NnK7bjAPw4YSck7FswV3Xiy
         m1cw==
X-Forwarded-Encrypted: i=1; AKwUvBxvhAzCsu0rUrHwi41XaE0OnTgNdWyJ8dM6xjPoq21HrJja+lXIKgLn5PyXW4lxyfKZl1wY1POZB7+2IAA=@vger.kernel.org
X-Gm-Message-State: AFuF++liRNV90b5Rf3UEyeB5uqC01RWr0k5QKpe0pTLKOVAahgANjdfm
	8jjwM2tMhdjGohEwRA3r8rpXHO2WuMTz0CQPAjjzNUtwPcuHFfOfNg3omuD91BUZ2G4=
X-Gm-Gg: AYBFou0kUG05VrLAZuBvnqkyFIBQxYR3OIY22+vgiTSF81uZ3GhYIhDlBOgvMr6heT4
	LICEkeKFmdUP/KGVL/G2kAisCwUdyGj2iobFx339+2nsmsHWZz/soaD9f/sHx3Dne5DMbgM5Jic
	yMhSMd4O+oI8yjauXocGoQWA75+LeavXQaxUS4fH81BVkXxGDj63Pzoy/G8yfPhNZgLh9ckrbSp
	7eEjQ3YGQUY7M0xbP3BvsdkPoz3uDTXiMcDlShUgkiigHSo2SI6r1AnPk71s2fND8iOTsMfIivu
	89/Gdb22NDD+olu/eHXzC/s93rvq3C8sm7+yvCpUvTOm267wMjmUiLOoJQhmpQR3wEcg2BXs92f
	DQc2hUC9UBemgxieoj/ixRqrTApZexGXAF702nQlkjuHWUKmyh2IREHYQZiXFFSipgKN4r4gV2M
	OJ+HnGBICmS1y68sX6Rs9O9sJ4uaMYEcvz3xPqPnS1vhK7jK0gQ6xUVZw6IlqRnu92mTSAyWJPq
	vEm1SiEAtvCoSsYY5s=
X-Received: by 2002:a17:90b:4fca:b0:3a0:910e:84aa with SMTP id 98e67ed59e1d1-3a098d45437mr1424739a91.12.1790236713758;
        Thu, 24 Sep 2026 00:58:33 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972eec92sm3575622a91.7.2026.09.24.00.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:58:33 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v2 6/6] mm/mm_init: add zone mismatch warning during page init
Date: Thu, 24 Sep 2026 15:52:59 +0800
Message-ID: <20260924075259.2013039-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260924075259.2013039-1-songmuchun@bytedance.com>
References: <20260924075259.2013039-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For vmemmap-optimized sections, tail struct pages may be backed by
shared vmemmap pages. Those shared pages must carry the same page zone
ID as the struct pages initialized for the section.

Warn in __init_single_page() if the shared tail page has a different
page_zone_id(), which would indicate inconsistent initialization.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- New patch.
---
 mm/mm_init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 1650d6bc1211..bd02e8d06965 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -609,6 +609,9 @@ void __meminit __init_single_page(struct page *page, unsigned long pfn,
 	if (!is_highmem_idx(zone))
 		set_page_address(page, __va(pfn << PAGE_SHIFT));
 #endif
+	VM_WARN_ON_ONCE(vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)) &&
+			page_zone_id(page + VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) !=
+			page_zone_id(page));
 }
 
 #ifdef CONFIG_NUMA
-- 
2.54.0

