Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793240768;
	b=VcSZ0uc3O2dfyJFA4mt4J9yMZ1D7HEmYBGxUaMa3zlpe6QLvw7m9LAfvEFD9kMf1k1cT
	 xGOKd2wmgreKRgzE93/C2CGEHalPLBdh2eyTeVbtFm0yFWLHQwLItJtJN3NIT8qIynt0h
	 KtfuAHBtpfdSXN1jtMJ9JqHQewdgvMrk810YqyDkvRaTZdHbCo/C96bEfzSy8jhyjkdnj
	 H3u/VxmpE1eP/qubNICz6sfhF47/x1G1s5TGQDoVtLl4RP0iKEGPF6PFEj/gNHFzUfzbu
	 y7S6WvfOBW0tQojXVk0AbJIn4DZ5aScAv757WU5sejNGf10BIwgdSy7+5XQU7QzqFrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Pvfj7EdS2QFUg439b/Ol1E/yvGVDEmD0zO/yL8SbzK0=;
	b=EsVs2u2l0ja86FWnAcQl7Ujz7+3IjlKPQ/noDitxPUi20U1zWZ85EOY0Y2GIb4/B393m
	 OZtUNSdR5RXqDtpkYIuDrNgtw8v0krJHJLrApvHTpNwLqSYj8KSsg9HZCFDl7HqRz8iTD
	 OHW58ooDAfLHSPh43/DKzJEfr0W7u1p7N0rzzF/sCQs5mjB2pk4TgI5om3lkDJADWwrRm
	 kF1C2o0xeHWQm6+OtoepNMrIqtDk0fr6O68gox5aWlRnS4mAO6hi8o5zvlYGpmc/KsXKR
	 6SDBb6LV+yC6+tcxMAUUv33spS6FvqP5gN/R/JuFCdPrCmeUUGlmkAvPS/jB9Ep5h/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="CDT21hP/";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A50606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A50606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CDT21hP/
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so213920eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793240767; x=1793845567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pvfj7EdS2QFUg439b/Ol1E/yvGVDEmD0zO/yL8SbzK0=;
        b=CDT21hP/GlTmhBuNiR1ijCfSgXjpfR1mKfuJMG8qH/bcdwyKTxCmbtYA6yfSHrmEA5
         7mmnsS1B83fiEGyF4V6JSoLkSmok6tHErOFu30Z/Rmn+C3yWki1sb3Po9f88lqRUN6uv
         U6hVt4H6LHCoBjEcy5kWNaPgZcjTLFcL9QJmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793240767; x=1793845567;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pvfj7EdS2QFUg439b/Ol1E/yvGVDEmD0zO/yL8SbzK0=;
        b=MK04AeekQMxgErI5GAnOAw1zjsEBRJxrQwqYahZrBf5xQCaDxiOZJo+dZm9CxqM85g
         /YBwrVqB/YZPlP7cwlYaxL9LM64TKOMiNTYr8Sg4hFVomf0IS8VpYozh09tiOeX/jbl0
         NcGe32WlKgJS7/pxrAFxHOa9QBCOxwu5tBBnr3Ilt9iXtDmPGD6YydQ0tR/BLgTMtCI6
         YgxmRPiAhqDWToM/Dv+ltSztTHz6gvi37Y048VmxmXhkFsXc4I5cPI0pQcp1Zo5MBdQz
         4oq4X8OoMffGwSRpuQvo50VUOlyM2079gwCA75lvrWWXbq2uHuCL3noSMhCBrw5ARMD3
         /lKw==
X-Forwarded-Encrypted: i=1; AKwUvByKp4+8WeBgxREU5ZC8PN1zBxAynIPdiCWqR6sbPa17/YLZXpOASfPdxEBDxl7Rgzp0xiHUvriNpe9rSag=@vger.kernel.org
X-Gm-Message-State: AFq9FYLk+B3Hy3GdNkdjc6i4WZC9tAqRpvwqNsADWVjCdeYuaK6ln/fY
	OTi0t34TaZQp9Ag0HUknbt1lz8eWoGVXNs9EiErLag8pPJZ7XtUxI8Ga/a3M4Ull8A==
X-Gm-Gg: AYBFou2O4iJKdL4ZBB3lmp3SSzpoMHhGSy+Grk5V0/qccg4z5aVrR6GABciavXbEsgX
	7OPa4la5cOKQt97SjShI1WRco61q7glH1sGGdgAWMpPPBueSdbfwks6ao5+xSqKNvrplsLh8C64
	TwMbQ3tXXNgOqsqBogjqBaEYu8JbD4ASSMLuaRUKL4LmAt1GZBDy0i7HXxdd4VeRpxIOvaw1nCJ
	90z+YHqyqPaKkj6gabxbfOI/uy7g36Zb/NPEAdymSx8lCD+jlwBgC6rK+UKDUQsk9BDydluBdEc
	cOtm9ZvkKddrPdIL1v5mqb5oLY8BtjyMaK7ipPDCcZ0qH5NgdBZgF31Zqku1XMgDMsCiSyCOuNC
	O9KJVJn4g1waR6geZMK51WE7DeFPwqwQewg/gUTUqRINEV85mNDz/PUmwjifae4byGGsTUgbthZ
	Nb4RsHiQ8mLbBxaX7jZYjxtIBeKEk87PsoUvTMIKdHxNI7BkYd1CJnGwan2L5o3ZqWuTIIRySrL
	0PNwtzlOFuwAeuezSNdEfQBNUayhSFRi0D4FYqtAAOwb+fDwKlZbX67bKL0dKcEqnC7Mz01Fj/7
	8QRKV8x8tT8k/pvxJLqnGQk5BSOweLFpnVVfDtra9Fp4fhi1ljSLm+h4pMgLdzEmu5HRtrA4RzE
	GYipBhQBGLM3E0Ew=
X-Received: by 2002:a05:7301:1622:b0:360:db68:3264 with SMTP id 5a478bee46e88-36a203ad867mr6567630eec.6.1793240766517;
        Wed, 28 Oct 2026 19:26:06 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:f72e:e03e:c64e:b5b3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239338e2sm13387055eec.18.2026.10.28.19.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 19:26:06 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:26:01 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Xueyuan Chen <xueyuan.chen@vivo.com>, Barry Song <baohua@kernel.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	xueyuan.chen21@gmail.com
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction
 budget-aware
Message-ID: <auKqt6b4AxCLziIH@google.com>
References: <cover.1786003779.git.xueyuan.chen@vivo.com>
 <anVWZVOt-xeD0dMH@google.com>
 <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <anXJ-5_vO7-toSe1@google.com>
 <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>

On (26/08/07 09:25), Nhat Pham wrote:
> Hmm we'd need to collect more data in our workloads to determine, but
> if we can compute compactable ratio (freeable_pages / total_pages) on
> a per size class basis, can we just skip the size class whose ratio is
> too bad? Would that at least cut down on the vast majority of
> fruitless memcpys and lock acquisitions etc?

To calculate those we need to tool pool/class locks.  But technically
possible.  Not sure, how would be determine the threshold tho.

On the other alternative is quite simple.  We can make it
"default ZSWAP", for example.

---

diff --git a/mm/Kconfig b/mm/Kconfig
index afff1b25b543..72542946bc53 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -157,6 +157,17 @@ config ZSMALLOC_CHAIN_SIZE
 
 	  For more information, see zsmalloc documentation.
 
+config ZSMALLOC_SHRINKER
+	bool "Enable zsmalloc pool shrinker"
+	default y
+	help
+	  This option enables the zsmalloc pool shrinker, which allows
+	  the zsmalloc pool to be shrunk when the system is under memory
+	  pressure. The shrinker will attempt to free up memory by
+	  compacting zspages and releasing empty zspages back to the system.
+
+	  If unsure, say N.
+
 endmenu
 
 menu "Slab allocator options"
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 7ef80e0da626..e0d7ab9142bb 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -276,8 +276,10 @@ struct zs_pool {
 
 	struct zs_pool_stats stats;
 
+#ifdef CONFIG_ZSMALLOC_SHRINKER
 	/* Compact classes */
 	struct shrinker *shrinker;
+#endif
 
 #ifdef CONFIG_ZSMALLOC_STAT
 	struct dentry *stat_dentry;
@@ -2050,8 +2052,9 @@ void zs_pool_stats(struct zs_pool *pool, struct zs_pool_stats *stats)
 }
 EXPORT_SYMBOL_GPL(zs_pool_stats);
 
+#ifdef CONFIG_ZSMALLOC_SHRINKER
 static unsigned long zs_shrinker_scan(struct shrinker *shrinker,
-		struct shrink_control *sc)
+				      struct shrink_control *sc)
 {
 	unsigned long pages_freed;
 	struct zs_pool *pool = shrinker->private_data;
@@ -2067,7 +2070,7 @@ static unsigned long zs_shrinker_scan(struct shrinker *shrinker,
 }
 
 static unsigned long zs_shrinker_count(struct shrinker *shrinker,
-		struct shrink_control *sc)
+				       struct shrink_control *sc)
 {
 	int i;
 	struct size_class *class;
@@ -2105,6 +2108,10 @@ static int zs_register_shrinker(struct zs_pool *pool)
 
 	return 0;
 }
+#else
+static void zs_unregister_shrinker(struct zs_pool *pool) { }
+static int zs_register_shrinker(struct zs_pool *pool) { return 0; }
+#endif
 
 static int calculate_zspage_chain_size(int class_size)
 {
