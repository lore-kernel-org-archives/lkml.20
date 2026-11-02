Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590005;
	b=QouAmURbQ7fjvCEnJN/96wQM1a0w/QLPSINdS6nvnEnWDcOQl8dZmZA7eedBLJjVak27
	 sHsT3U/MUvfhlNSyjTs5orqUq8JyFOIDO8ar23GqFAH1hWA1sLWZnXgjVIC+teUHNJtxd
	 BrNQS69THrLL1kU7P6KTPkf34cgxsXBLvpEHkSbiZnMr1ynhj3k61uQDEjBDIUcqYfN8R
	 YW18o8ssCUh6hjcDNb7aidQGE4py8FDXqXQxCtAYbzuMOYuG+qilCgsIyjjK9RaZ5GqsV
	 LpKPrVVZHiMM2voj7DvtWu0WXqKtRwsummrI1Vx4d24bTakB84q3ahljc+uvl6PjorQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GPOIR7ihnEWi5dQHoLquvqe1BdctrHDrgH+hOV6uyaw=;
	b=ZUpiibYJCsdutBcNO5ArHIrcTR1Gni497OjRaVxvaGA0zSv1TKCb3rQ9LS2L3nPhlhdP
	 3S5U4LbR4Msgd7ss2VhJMeqSJX1aRF6S8TzY5d5jCNtsy3+msfAlcSmPPg7b/M05P6QwE
	 GqnGeVJ+fH9QTnDWTZS1BRLshhjFWC/8wYX8VIez+w49dgYXUTbLLGWGHLCxffUiU0paR
	 HCwmG67gmXRXXs1d4XIjD1VZMUkoLIE4ru8+GuaQI8bur9rhOMIUjjDkJZ9F8Wr4SMdxO
	 OaMBnX+Z7LpHZmi4jeNHW16avaZXEyPYmxL6Mehgoo6ierfeFng2WJlr+C0H9/Agz2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=V1bn2CPX;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A25606A338
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36A25606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=V1bn2CPX
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdaefe02d5dso1344640a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793590004; x=1794194804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPOIR7ihnEWi5dQHoLquvqe1BdctrHDrgH+hOV6uyaw=;
        b=V1bn2CPXzrofkoGw5rK4siFomdOdmkeboSfLoXy2WFxDo5wiXOVVlV0X8mI8zyCtt0
         9Jtx/sFgYad9j7p+in+GSJkSSpd0I95bo0h5PNWytDTDRTAU6cMx0tABWr0CkuQwXftH
         fK6LEtYNtJrGjc2MeZIJTVNqAlLLECQB4KTUjW7+KjZ3ZguHXbzHd5ThfPggeFYkDVTg
         JmBYpZ/8NnuQAd6UFlOHUuzUO93v2SGLX1YBTpnzgVZr2R2ZKxBbIuyQWrcAtUPoQD14
         LQjfWqEwLqUP7r5qog6wBFhXp1FAg7tGkkkai9lvR9FCixUHAA+r84ZPH30Ca84k/UOQ
         toTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793590004; x=1794194804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GPOIR7ihnEWi5dQHoLquvqe1BdctrHDrgH+hOV6uyaw=;
        b=0DIT2tGVTeqkb82sneaVkBhtkj8g6Cm+0CXsD8K9SmlSCnEFi3sp3FDhxMmhrExBwq
         0Je3FSNNNvxaz3ZZ9fNr9maMwIKQZBptXEDEuuPRXs19zzfXdT+2aK44OCmFLVvJSiNE
         cTD0vUeDa9z3SCMac8b148xXtqxapHEDBD36gVgtQs2GOn6+jqlBYwdB/OIHAAFMtVju
         iP6Oo8/uGHaxKJVaNO5KLAlkMimZshR/M4yYuLKQsihFtoT9r8HE/R7P0Z5H6BynVC0+
         ACRxFDB49/lWoxn3T2dB6E56IK1JBQo2xKKS6kvtkTDd/UGpWJUfp+imibpi5x2lJn/S
         HJ5w==
X-Forwarded-Encrypted: i=1; AKwUvByNP95oGI6GCkZxxUEo+57H/G5CI49N08WGEvyjPiJZTDMiWO2sGc06gwrBB67RL1OZu9CAnmfC6fldlag=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k+dhMypILphSq4l70vrB07PSq334qfvolhKgbuVnXQ1BvPZVz
	tSSle7Spk5VOgBlwxZ3fNjCBqGAHWb4xyygf3hXC/9c2AMD9MzmbDKh00wL2vSOjQ+0=
X-Gm-Gg: AYBFou3xcLHNgH3DEsd4P9Yiv1EcplmjRjqChkO3e4oxa58vseb0eqcROlYpHBa0Qmc
	udbapUKwgYI2rU+rwYhMmH+7vDgCa7RIcN1Lf2RHT4SP+hdL9H2nC41oAuqVOE6ZMXg/DYsLcTQ
	/npeNdKzhY0egbFdDGFuswsqjRJXYb6Z7R070ay/Sb/IiCVdc/YgLNIL32b1KspnYhWNln3k9jP
	tnACvRLbrXclDhOpS3bSJdgRxNQBtFohnnLqHQY1/xlTCFUzYGdAOhMZ7JqRBxSVBZTFh5JSg+K
	OPf1wHYsIbswiFU0cVHPruKzPufZiGIcjFZ2XRpQleyGZbH6kshUAM3bbg9/F/JMCeXpXgcW8ic
	TxnLCSEhrq37TDoas2WnRSb+LB6h6Z75Gwnm5+tA5hb8nyXj6VayM02DidtfCbuohidnAHEe8tE
	Xwnd51Hs11ng925f5mnbEnoZOcWA786Xjixk1xolzKmmJQ63VWAWCxe9FDYtWXq9SPA48wIOUr0
	uYNglW4h40r334+IPRoQvzOIgbHtfuV73J42o5GhrxY0PhjWrESyexymVJm39vHfZLcOaQtaE0a
	jRE3v8kAFCy26BWq01H+eTrWD3gojca04wXBpjLSGmhU3xJ1jw==
X-Received: by 2002:a17:90a:ec88:b0:3ac:7556:8eec with SMTP id 98e67ed59e1d1-3ae89817e67mr7564625a91.39.1793590004538;
        Sun, 01 Nov 2026 19:26:44 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm12303317a91.10.2026.11.01.19.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:26:43 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 06/12] mm: hugetlb_vmemmap: rename vmemmap_remap_pte() to vmemmap_optimize_pte()
Date: Mon,  2 Nov 2026 11:25:19 +0800
Message-ID: <20261102032525.3597743-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102032525.3597743-1-songmuchun@bytedance.com>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
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

Both optimization and restoration update vmemmap PTEs by remapping them,
so "remap" does not identify the callback's role.  Use "optimize" for the
optimization callback to match "restore" and make the two directions
explicit and consistent.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
---
v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index c9635679a36d..5e84004db4b8 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -213,8 +213,8 @@ static struct page *vmemmap_dup_page_from_list(const struct page *src,
 	return dst;
 }
 
-static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
-			      struct vmemmap_remap_walk *walk)
+static void vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
+				 struct vmemmap_remap_walk *walk)
 {
 	struct page *page = pte_page(ptep_get(pte));
 	pte_t entry;
@@ -302,7 +302,7 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 {
 	int ret;
 	struct vmemmap_remap_walk walk = {
-		.remap_pte	= vmemmap_remap_pte,
+		.remap_pte	= vmemmap_optimize_pte,
 		.vmemmap_tail	= vmemmap_tail,
 		.vmemmap_pages	= vmemmap_pages,
 		.flags		= flags,
-- 
2.54.0

