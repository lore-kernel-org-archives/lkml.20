Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692892;
	b=X54YtIMAa2x35KqvHJQQonLjjW2YUQ2XP86Mn2tYFsSgLcAksc8kS7Ns6yOsDgkUVYes
	 Ye7Ln8b+V1jbSa1G4V25pJdxa9KZOV/b4WaqFWGQwPX7Bjv8c8an3SCAJ7zQEUVtYNDNQ
	 d+0Izx20QSeGAdk01YXiS31ad3XZGS9Z2OVNcpJh9LXMa2WZsPVSAvGSiqim4fDjUzFSQ
	 W4v5QIH163WcOQClfrSdjOQwUhgjNNIP/sQpThCNIJMm4ldnvBIFxWGbbqs/VbBtj9jDi
	 TN8CAAZKaaDHwQVo9IPMkpXnhXDZBIQrGzrLl5J+kePsSsb4fsmgTHC6K4EY0+u5DGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692892;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=52KCXwmm9ZCNyw3KBw/dQ/3mW8BHvTfiOxfI1L0wd18=;
	b=Hlj2S5xq4vAId5nXVOWKw89iU+t7CKRAvCkzZd5/m1e5eOggpdweDBkHGdHZTDQThKtT
	 H+M+1zfUqkyrg872XM0G7eU1K4oMgwmnQKvIMelJ5Rv84ys1xzaf/BPbXkC/fl5s5v+al
	 tB9HUQm/isV6skfqbAAzwzP4FfhM3OHRq2G4cLm0H9xdCz4F4iFj/SpW8qKzYbaSnrNh6
	 Afeoq4l7b5JsJcx94Qb93aekcv48uEXyjcBqauiJDncOwYVR/dN5uOZc9FIW0vbt07JHj
	 yfQhRIYIkbfC8q0LJZ7yD60JlE9NF5xIZkUXuTM6CuGUP8Gq67eyGqdJDAdguAqLuIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JAFlrt5z;
	arc=none smtp.remote-ip=95.215.58.57
Received: from mta1.migadu.com (out-57.mta1.migadu.com [95.215.58.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457BB606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 457BB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JAFlrt5z
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EbWR22LQF8i7FNouXAnt5TAEQhSWkm045nRZT2gB0fY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793692889; v=1; x=1794297689;
 b=JAFlrt5zHrloovNEv52uOljvv8Ada0Z7DmXl4q/UvI0lNWNARHqcLu+tgnoV9smUvNdFtM3V
 ZqFyXeby0JHQ5rDDt1Pv7s7aWv6Nu0Cx953nyDoT0eCc5qxvS27yAKVPRODA7czR+ewk9ypLiBi
 qAXe37CDRVPgZvBo1zbRcPhI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8deed9b99d672b83;
	Tue, 03 Nov 2026 08:01:29 +0000
X-Mizu-Trace-ID: 8deed9b99d672b83
X-Migadu-Flow: FLOW_OUT
From: Qi Zheng <qi.zheng@linux.dev>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	azpijr@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/4] mm: hugetlb: skip CMA allocations under PF_MEMALLOC_PIN
Date: Tue,  3 Nov 2026 16:01:05 +0800
Message-ID: <5bc00742fe249cf09a3095abccf8889d5fa71116.1793692578.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1793692578.git.zhengqi.arch@bytedance.com>
References: <cover.1793692578.git.zhengqi.arch@bytedance.com>
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

From: Qi Zheng <zhengqi.arch@bytedance.com>

With gigantic overcommit enabled, a fault during long-term pinning
can allocate a fresh HugeTLB folio from CMA despite PF_MEMALLOC_PIN.

The folio must then be migrated before it can be pinned. However,
fresh gigantic migration targets are not supported, so pinning fails
when the HugeTLB pool has no suitable target, even if the original
fault could have allocated pinnable memory outside CMA.

Honor PF_MEMALLOC_PIN in the HugeTLB CMA allocator so the fault can
try the non-CMA fallback, or fail when allocation is restricted to CMA.

Fixes: eb02f14c4a2b ("mm/hugetlb: allow overcommitting gigantic hugepages")
Cc: stable@vger.kernel.org
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/hugetlb_cma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/hugetlb_cma.c b/mm/hugetlb_cma.c
index 95fd2d190f0d2..dde1c866406fb 100644
--- a/mm/hugetlb_cma.c
+++ b/mm/hugetlb_cma.c
@@ -62,6 +62,9 @@ struct folio *hugetlb_cma_alloc_frozen_folio(int order, gfp_t gfp_mask,
 	if (!hugetlb_cma_size)
 		return NULL;
 
+	if (current->flags & PF_MEMALLOC_PIN)
+		return NULL;
+
 retry_cpuset:
 	if (!nodemask) {
 		cpuset_mems_cookie = read_mems_allowed_begin();
-- 
2.54.0

