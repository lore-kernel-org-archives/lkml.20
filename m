Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908059;
	b=WJpBnFjGh1HgD9PHeQ14kxP8P1LOKFmgKvG00MrlCJKZF6T3ieDZC9+M6oSXs36pbIt9
	 hBCiygr1MBiB0pjye1aIkGf8swkCqiFONkbxgmOZPIoJEEJWO+it0fgxiKwnpD8uX4mO4
	 4cX9EGGnSgVvPuxrLu0iiVrbsGYG6NVP/fHmghMvGYWIoBcLaMq4gjY/cZo9t55NBJtDA
	 zskeeewKHgDN7WCnmC0iI4IfCvkMmVJbYLY7qPqetW/ltxsiXHzsE4OOpf5qgfY34wfmW
	 mlCjpV8zwkjpF7x7zqNK3WEhbcgrCUvXOLpgOo1L7+b2Dbp9oTu9zyc7kLis+5yLVxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908059;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gCifWas0BpuNzXE9zytOMZSgJlGt46sndvW+hr71f/g=;
	b=koB8/QC+iB+poW7SHL0/XWEdEMjl2Zxu/ROpRkHVhhZ/dBk8AVKoxSgv1fRh3d0qJdCd
	 Ax8HCrXTya8Kq/KCePqhPSNFlTgbzWs20qSL8XZNttgpIKdrEl5NHAzdN3Rl0TsSDdanT
	 IiXEL0K7g31EyYGCaVBjCFwloZ037g71JtrPDd78l+J5IoHQZsykqIMaprQWIUZ75FQjS
	 OLKK6tgva+Sbz9NecyYFHgKVsp+O+ORvZ2AEyi4oRVHBRwSsDEM2LFg511sopKt1QpEQV
	 Y8tUYcZpY45pBegjJO1d02lNhY4+lpS7DREwC7kQrZYH9UGro8lfQY/W5Y43+JNWbuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iUc+VT+c;
	arc=none smtp.remote-ip=91.218.175.176
Received: from mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC4C606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC4C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iUc+VT+c
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/MVFvmVwbUPNerAUsqUVWH7M0FSKEB7lNQ5SvFhDebM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794908056; v=1; x=1795512856;
 b=iUc+VT+cCad0NcfaA9TgdCftE6ozpTGWEIv7/+YaKHnz210DiuouJyGtzK7TrP3s2OLjeUVC
 iTulrF6R/6pQARfrXwEiRzfWC8U0tfvpnmkoACayS3mM7g1V+Sk8ACPQMOwEga3fwmlJ67KOVHy
 ZfjvWWtSC1sTFq4JH8ogGpZs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7d878d55f5a63e93;
	Tue, 17 Nov 2026 09:34:16 +0000
X-Mizu-Trace-ID: 7d878d55f5a63e93
X-Migadu-Flow: FLOW_OUT
From: Qi Zheng <qi.zheng@linux.dev>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	azpijr@gmail.com,
	lance.yang@linux.dev,
	fvdl@google.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 1/3] x86: hugetlb: disable default CMA reservations on 32-bit kernel
Date: Tue, 17 Nov 2026 17:33:57 +0800
Message-ID: <6866920502a4eaafd99a9e272df572e3a7d3da4e.1794907279.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1794907279.git.zhengqi.arch@bytedance.com>
References: <cover.1794907279.git.zhengqi.arch@bytedance.com>
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

A 32-bit x86 kernel can run on a 64-bit-capable CPU advertising GBPAGES.
arch_hugetlb_cma_order() checks only this feature and returns a nonzero
order, although gigantic HugeTLB support on x86 requires CONFIG_X86_64.
Specifying hugetlb_cma= can therefore reserve a CMA area that cannot
serve the intended gigantic HugeTLB allocations.

On non-PAE kernels, the folded PUD_SHIFT yields a 4 MiB order, which is
equal to MAX_PAGE_ORDER. With CONFIG_DEBUG_VM enabled, this triggers the
VM_WARN_ON(order <= MAX_PAGE_ORDER) check in hugetlb_cma_reserve(),
warning that hugetlb_cma is attempting to reserve a non-gigantic order.

Require CONFIG_X86_64 as well as GBPAGES when selecting the default CMA
order to avoid these ineffective reservations.

Fixes: cf11e85fc08c ("mm: hugetlb: optionally allocate gigantic hugepages using cma")
Cc: stable@vger.kernel.org
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Acked-by: Oscar Salvador <osalvador@suse.de>
---
 arch/x86/mm/hugetlbpage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
index 3b26621c91286..70726a99ede7b 100644
--- a/arch/x86/mm/hugetlbpage.c
+++ b/arch/x86/mm/hugetlbpage.c
@@ -45,7 +45,7 @@ arch_initcall(gigantic_pages_init);
 
 unsigned int __init arch_hugetlb_cma_order(void)
 {
-	if (boot_cpu_has(X86_FEATURE_GBPAGES))
+	if (IS_ENABLED(CONFIG_X86_64) && boot_cpu_has(X86_FEATURE_GBPAGES))
 		return PUD_SHIFT - PAGE_SHIFT;
 
 	return 0;
-- 
2.54.0

