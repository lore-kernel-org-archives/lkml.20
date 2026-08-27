Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED703A453A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787873480; cv=none; b=Us3bc6lce15+ut5dBNxV+zN3H5nYiyshHi3NgN1Vqi/b/elqlDxC+s/vlI/nSN3V3u9ecuu9WeXoBKwLl9jgrwuw3P0C8XrVLp6VMD2ZLdZJG9f/PH/P6jkandADjMIAcd/AqrPor44BItSRxLq9wiey9uKBxzrpiT9XC09n21M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787873480; c=relaxed/simple;
	bh=3I5dS/SQ6pCyb3i0Ix/G3rblivqux+gR9oaHKYEaKnY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sqIsuFyJggabtS0+pEDFGgdIVfqgkkvmrdgH/arU7DUHe8zjDY2tCDHKCvn5CoKCeOBQ352R22x/ZXA24DNr/U6xiiJcREY7qOqTDG9+neSxSSTy5BL3qmZZ+fxoZ5RAdBB2RL45VmEvtAYgZgBnOsqHoYd3Yqeg454oojhi7lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stevensd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F0WE0Vee; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stevensd.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F0WE0Vee"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d52734fc41so4602075ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787873479; x=1788478279; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brDKxupp32vlfYsuON/JY3iAK7z2zOrfUeaeP3zp25g=;
        b=F0WE0VeeAQdzh0CIlwv1meqQbhzCsbR96VDhR0EaTiqYsmWRamm8ir76N2R0XrYMwZ
         l8xcCIZJ2d/B9i7wQdrdQiM/bB2ZQEutThINttOILceOC1swN03B9ctKDgsYGG1JC8Tv
         FzzUJSQbp5zeJkbiG6TEnVPX9R7VbgzcZOU2HFZfA1maAZ44o2nEERunsZBYIaj22hlx
         zGUAMD6h4Pg6DgkubIrXCKcLC4aKaxoU0NuiL6sXg+mgXgy+3hN0kayGgHmmF49W8Wil
         nLiCl9VLgyTyq73qDqdmQDzGyP15I9fupqSw2+InLeOsxXDROEBFYymCS8JBf+kEW5KE
         2eJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787873479; x=1788478279;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brDKxupp32vlfYsuON/JY3iAK7z2zOrfUeaeP3zp25g=;
        b=OrrgGwY+CEQMGcTNznRGi3tBWiPLQdFhyecfIFDMZ5asXbBt/v8NViUzi7UGEMu2aI
         rtoUNwDjLp1Y8peEzfyedJ9cf1NEeFONjP5j9h9+YVHq/pBnuSjnmXWkxTvOvNnWhg+1
         9axfcV7NWpqUW+i5NUiun0BrMF3IMnSHdMGhqdgY1jXf0MWEQBGYJIfenShbBlKBQfsu
         MmvJXvhsJsARiq0SZVb075Q2X7gN9/KK4kf9SOFDkV5Hk8I5P4BffyMJ2mwJOf6eX4Tp
         2Mj7sA3iQXn4PI/JqzNfbhWeiibVTniT9J+ukJgB/yHeKBlSTcYm0yVVWA4Qx+kMOZ8r
         yFIQ==
X-Gm-Message-State: AFuF++kTbvZyAS+zZQEjk/MwCeQbs+ZhdUqLYOSCWD3clRp9GwGJi/hM
	iQjNAtJvHDtBX56m9jyJGaNgEV++aRnUeKU5JyLV40Ei+Tv91avcsCSp6DfgKkafaRye5AnllcP
	3dy6RQA2T24PwRw==
X-Received: from dybeb10.prod.google.com ([2002:a05:7300:a2ca:b0:328:4d52:8cd0])
 (user=stevensd job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:458b:b0:2d6:f3f0:3e7a with SMTP id d9443c01a7336-2d74dc2ade3mr36333205ad.3.1787873478170;
 Thu, 27 Aug 2026 16:31:18 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:29:39 -0700
In-Reply-To: <20260827232948.2520558-1-stevensd@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827232948.2520558-2-stevensd@google.com>
Subject: [RFC 01/10] Add !MEMCG memcg_list_lru_alloc implementation
From: David Stevens <stevensd@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, suleiman@google.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev, 
	David Stevens <stevensd@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a stub implementation of memcg_list_lru_alloc() when CONFIG_MEMCG
isn't enabled.

Signed-off-by: David Stevens <stevensd@google.com>
---
 include/linux/list_lru.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/list_lru.h b/include/linux/list_lru.h
index a450fffe1550..40eaeaa3424c 100644
--- a/include/linux/list_lru.h
+++ b/include/linux/list_lru.h
@@ -79,10 +79,10 @@ static inline int list_lru_init_memcg_key(struct list_lru *lru, struct shrinker
 	return list_lru_init_memcg(lru, shrinker);
 }
 
+#ifdef CONFIG_MEMCG
 int memcg_list_lru_alloc(struct mem_cgroup *memcg, struct list_lru *lru,
 			 gfp_t gfp);
 
-#ifdef CONFIG_MEMCG
 /**
  * folio_memcg_list_lru_alloc - allocate list_lru heads for shrinkable folio
  * @folio: the newly allocated & charged folio
@@ -106,6 +106,11 @@ static inline int folio_memcg_list_lru_alloc(struct folio *folio,
 {
 	return 0;
 }
+
+static inline int memcg_list_lru_alloc(struct mem_cgroup *memcg, struct list_lru *lru, gfp_t gfp)
+{
+	return 0;
+}
 #endif
 
 void memcg_reparent_list_lrus(struct mem_cgroup *memcg, struct mem_cgroup *parent);
-- 
2.55.0.897.gb25b4bd76c-goog

