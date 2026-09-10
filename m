Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243CB3CB2F8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022076; cv=none; b=lA+ZN3PBVXYM6fr69wUWRdn1f6Rgk2rfJojoCU7TCnHuL4tjzkGKqGLwCP/OIsmRf+7jVn8WZcHcdkp9+JKB1c/fd8Gf0Tf31D7fyMlm8CjaDtazcv3xwZbH3G/ELSbm6pC07N6goOJgAzqRwpUsa5IUHaCK/BQ48pzcmUu1Grg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022076; c=relaxed/simple;
	bh=b4FdR30FydbrmTOLVCvDeBJIEmRP4nTqeD5QzuoTGEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=berQHikbmg1tnYuyoaC+n3KiHUMRUGbuXd2eITQS9QcAAIZDVfCiVpRCq8uXrcSwkZF5hMoW6UMr+HxPqT2QuHTMdSELquX553HXdPORcjHeQWvRh1T8BhXXVGiVuO9LbUyM3aoffRhVSRgpXSElCuSvuMncrQnL2sk9b6IuTIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZGdGB1K6; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZGdGB1K6"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso5921971a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789022070; x=1789626870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0BGuwwnpIgT7eCl3rvqq0NlL+Ip0lSFu+Xm8xqE1I4=;
        b=ZGdGB1K6iIu5HwdRqCGhmjVzPSp/EZXL2nlP7rvB+1Kk8vIjtG026y6zMQX/TVGdeo
         WRgiro7HDr43pu9qosAOX/upsN3i5Ij20E9owkZfgptqD3UU7L/OITHi3aoQBRLGeJ4O
         As+5SbXP5Aoezy5Mj0uSJz8ac3Mn4tLHfaRceI9DhD+Zs6XYl/AwP2FzMBNFTMsWLy6y
         F5u4VIQUKVcEK6yEB3wUVrg1w/lTk5xy3MHFTb03mHjsPrpYAoq6LXvA2JhTkCFVfCkz
         u3sGZ4SXJgFV6Kz6ErZIlju3bbrA8IMziTewAsafPcWCZDzbcWK8S1xa67yo4NwsUft6
         yxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022070; x=1789626870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l0BGuwwnpIgT7eCl3rvqq0NlL+Ip0lSFu+Xm8xqE1I4=;
        b=b/Qieao78b8o+KEJyzHytYoKVADmpwj3E8MiN5ZIBNBlEoYKYhgn6rPNeLWb2swTGR
         SZHuNxYL/eMMl0thRJY4CELEGBKDf/p/CeawN/6+bhcZIFdAAcf2NMBiHS+bZ6yoZNZS
         4oBacDiv3L3tlcRfOP6oAbq1lzOQ3JOXEtxExpomxQkZTy6TwzgLetlwHRlZWW8aohpW
         QIcELUlZqqBM0UdMeTGVJ8RV0Tkjb8/YpCvqjCrtVM73dgyYUrTd6LA/R8fW4H8+p2gk
         jRxfvqUOeLvYR/ArfsmU1Qtzhosza+xnUDdWEQVo1ArlPeorKNh6fE91GCkHD5e1hgxv
         cFLQ==
X-Forwarded-Encrypted: i=1; AKwUvByuCq9SuNc+vE64Ywrr8oLJvTqJH2nAgoKCxLsUpIN3T/hvg/pQJISZyHXVe06xbBX2SUn8xWo7SQqkM9E=@vger.kernel.org
X-Gm-Message-State: AFuF++kL+RFnoTvsN5xnAqnKD8LnLSHd8oTTGqu2a7jJCO8NSTXH1lVH
	uvpGmcOEHozenjTsqJ6CfJ/fZNg20gdDTmQcQQ3wTHXur1xkySniUMgmK1E9oOsZwWc=
X-Gm-Gg: AYBFou36bqizFlKqfIjoCk7yrWwkjoQ1BMnhe/F2n8GChP465UGPFyHbSKyBUI7sg/z
	xBqibITWq5Im7YhjkKKwGD6UyA/YRTrBFcqddAHDj4vcyJ0tTY2eJOBfWephz1ITXHUQWSwz883
	eYSEUohdzlwxiWUmFhxeArrKMXZ/S9he281svZhiWPxr5baxT641XT9hvKRm49Gi2NkDa98g3hU
	dC1igeDDwvJqztCQEgfTdx7IWUFFnydDH/fP2Z/jlowKrzdNZf6P5GjG8rFM1xxUQ/JC6JTuPCr
	3Jv3nmu08sn3Cx5F4NqHWxTCkAJksGRwAjYXGud7DvdVScOvRZBcj1NqjqXHznyOWTt+KpQsPIM
	RfkCAuNXPCprUxmoyetVu+JeAHaEHCJgCcTnUhmg9rV+zxPvzHoLP1eQpikYYIm4HiuSJODI5+3
	+dWumKZoBsiHrCOvOFNI2lA+1b85byhG7Mj/qwh2MZmkdvEmk7Vs8WkZ0PtzQnSqcKXI8Kz0eE7
	PcViRSQ5PYXuRUIGC81r6ZsCoDDn8kONhE=
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr61630953a91.9.1789022070455;
        Wed, 09 Sep 2026 23:34:30 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d84fdbae4sm1213094a91.14.2026.09.09.23.34.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:34:30 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	David Laight <david.laight.linux@gmail.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>
Subject: [PATCH v6 17/17] mm/hugetlb: localize HUGE_BOOTMEM_ZONES_VALID
Date: Thu, 10 Sep 2026 14:32:56 +0800
Message-ID: <20260910063256.64386-18-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260910063256.64386-1-songmuchun@bytedance.com>
References: <20260910063256.64386-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HUGE_BOOTMEM_ZONES_VALID is only used by the huge_bootmem_page flag
handling in mm/hugetlb.c. Keep the definition next to that private data
structure instead of exposing it through the public hugetlb header.

No functional change is intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v6:
- Collect Acked-by from Qi Zheng

v2:
- Collect Acked-by from Mike Rapoport
---
 include/linux/hugetlb.h | 2 --
 mm/hugetlb.c            | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 255a258f11d1..900c95e346b2 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -675,8 +675,6 @@ struct hstate {
 	char name[HSTATE_NAME_LEN];
 };
 
-#define HUGE_BOOTMEM_ZONES_VALID	BIT(0)
-
 int isolate_or_dissolve_huge_folio(struct folio *folio, struct list_head *list);
 int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn);
 void wait_for_freed_hugetlb_folios(void);
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index c8fd3a6ce812..894efb6b1ebc 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -55,6 +55,8 @@
 #include "sparse.h"
 #include <linux/page-isolation.h>
 
+#define HUGE_BOOTMEM_ZONES_VALID	BIT(0)
+
 struct huge_bootmem_page {
 	struct list_head list;
 	struct hstate *hstate;
-- 
2.54.0

