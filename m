Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229189;
	b=oRtlYcOxUXYzeyJVNGhlijPesqA/asrCz1MSocpxGETVNFL9mhjpUWAtciCfRv8ACK1B
	 7A1L4fkMiDZoJq35cFCviqk8EcvE2/Kzi6fwcT6tXHZ4vGIgV66NQ+QjlIH2ykgLrL2UH
	 GWqGt5/HMDGJIM2nX1jCXFrAuYCXuF/WPWfMIA0Axesj7WJyb8g//SDxhaBl2fAteQtkh
	 8SesO1UT70jSCd12NwjZpbFNQkuI8tzhWk81J6Th4Q5cFbWPEtKUCIOcJwVEYwAhLmYnL
	 a0vqOvQLdxdQ0nb6En3/z25HPE3soBnQepUc2Sa9Kx+90b4mx+X8YOGQmfT0lIziTWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Bf66K50sN/ej0L8frki1RtqgPCwdRDaZn51n0bwU8VM=;
	b=PfpWLRdrQ91vclkTTFcmwvu7Ee7eL2f87XDx/tdBX1tsAhzzSE9koD7cLNxFmn/gjxvn
	 KyQ/6oIsNk/9qV/aZhvZq0OWfQAO8gfLGPMNU5XRhi7/88w7JeWoYCZAUfUZAT15CzAQO
	 yAqjNWeLWo9iUxJ6xz8VYQUG6654qAmEoCihF6lfc+FU4oOvtS+Jesmd8qWPSdqZ/jgcP
	 Yy1oZufPnwJSb/pdDrwIGTJ4nsH9oqfsD71Non9a1pIXCbaLDHOZ+q5Psy1Sj6C9/vtgY
	 kVVArn0snOf5V89Wj1whAJj5jI54XTAK46MAs+GlGlduxqj74YtN5drWrWH4U1B73+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NAWvgYnL;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E168606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E168606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NAWvgYnL
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0d0f38abdso85547a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794229188; x=1794833988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bf66K50sN/ej0L8frki1RtqgPCwdRDaZn51n0bwU8VM=;
        b=NAWvgYnLD4QUCck7k9pNmkOk0CoS6hSluVdBbZ4zWYWeo/gQJCfVq67X5V0ro0uWNz
         kgqgT2FaNNYOKEEBajysZS6Np2HFCvU5Gse3AIt/jWpBHSqpk7swp1gRYdyborX1ZLlH
         DU2STgIJ0c1qR1etFaMugyU0+u2WyH5S/OFHoUTkDhtPb8VnogCxgcu83KNcf1LihkH9
         MLVJcmbvldvAhZqLlM7N+Nelaz4IqUMzu+RmDEOsplKorKX6BMi6XGR1CFsoFGgdzyY1
         PAe0V1SOjK+ayZzoBCorPp46PKRW+z29SPgkveUjqIXsyLg7W3gofxHIMVltxyM5Q0op
         hXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229188; x=1794833988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bf66K50sN/ej0L8frki1RtqgPCwdRDaZn51n0bwU8VM=;
        b=oHKbB/cLMYaPwM77i9IRvo5ieyPH1qyVuToDxxPOhNEUcDLnZCu4RZW8Vif3MojQdH
         HPyvuBxeFjs9VRnP7veusPEN1f6vr7XNUPig7X98pHIPcaxOqVstnrmdU/fdTTZD9xw8
         GMAANtecsQ9MWWE0qYZ3L1NMCXHwCyIZr8DZTDoe67kLU9EbCaK2k54YyrhVqU+kgrjC
         XTAVSwzQC7THVSxu/PtRXGWxu02PzvjsYi6bgljgTI/vgeXLY4pxNaqNgKd0UBsfhb8B
         gWbTQG/tV59N8RTrlFFtBiaWDZcsrBI3kpg2dl39lkqrg8CuYCOZa9F95PfEwHFuQ/ps
         4Wcw==
X-Forwarded-Encrypted: i=1; AL+hErEpFLog9Z1V3v99cZFFXVxzwz2y5Ha2PS6yMzQf4W4bU6b2CCGveH9seXdS27zMxzl9r5mqDemsYZ7qoqE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bparMNrNBCXx1J9rHu+CV6onl2pM7tLeZ+mwFOYO4fl38rvlA
	dA07ZzZ4Y+AaiH1U9bd3moCGxsMNwmlxmCTcIUJEo3bkB61fR/7OrLy5
X-Gm-Gg: AYBFou3rHwRr2YRAd/f0oQlkPP5VdtRidhSOpx7+InFYJ/K3y+stXFMwsOk5fI716ZD
	krYWwWpsFld/7lJuggvU6WebfByTbaqJN99ar8gTxguYQ28NAGJuQMoetk+Z5JSDmNJWNd3KAsq
	28xQuHw+vsclYjYlb7WaxK3fm8wGgiuCiCRuDyA9upC+haiRNNWUqHhwt7r8UIUXqQa2LYKjpUO
	sTa3x98P3JrSoXDybh5+7XCwrw9f8YEGdzTMsd2h1me+5JRNvk7rJ3j4WEk68CaW2Q4moetD20s
	3EPNo/MO4g2h6AASQYv5hcMGSrou8k9wThqVrNwfLHLLIKKJivzGs/cf3hnivUOm5GXoYe1uVRG
	2yztX6IocfVhG3QFYw8Crw24njFvAbSjcismUtuxmxuVElRQe+RV5jIsIzBV4oroM5gF5+E8pCd
	yo4VEsjOUzQsWCVyAdX5OWelqRpbWnwQxa0ZKgbRWK+RNOhboD+L7G1kbfqcQUfJc5Z+sj9kAXk
	kv2xaHRQPrkwFqnz/72/ctqTzMJjLJSB4KPmBDguqN8hjzpnutzzZI26NqvMWnMoaUc7DTDh48G
	1aq4xLW/CvecZ9I8hvVUgCrwXBruD22piOBHNhkRj29LB8CqjaDFG1azaY55mkILsaXu
X-Received: by 2002:a17:90b:3912:b0:3b0:9a3e:bf8b with SMTP id 98e67ed59e1d1-3b12d4c5f3cmr6392997a91.6.1794229188323;
        Mon, 09 Nov 2026 04:59:48 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969694aasm1534153a12.25.2026.11.09.04.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:59:47 -0800 (PST)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Mon, 09 Nov 2026 20:59:29 +0800
Subject: [PATCH v2 1/3] mm/zsmalloc: remove CONFIG_ZSMALLOC_STAT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-zsmalloc_stat-v2-1-caee41684aba@gmail.com>
References: <20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com>
In-Reply-To: <20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com>
To: Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Nhat Pham <nphamcs@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Xueyuan Chen <xueyuan.chen21@gmail.com>
X-Mailer: b4 0.16.0

CONFIG_ZSMALLOC_STAT only controls the debugfs interface. The class
counters are updated regardless of this option.

Remove the CONFIG_ZSMALLOC_STAT guards and rely on the debugfs API
stubs when CONFIG_DEBUG_FS=n. Skip statistics setup silently when
debugfs is unavailable.

Suggested-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 mm/zsmalloc.c | 33 ++-------------------------------
 1 file changed, 2 insertions(+), 31 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 7ef80e0da626..104ccf3aa170 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -222,9 +222,7 @@ struct zs_size_stat {
 	unsigned long objs[NR_CLASS_STAT_TYPES];
 };
 
-#ifdef CONFIG_ZSMALLOC_STAT
 static struct dentry *zs_stat_root;
-#endif
 
 static size_t huge_class_size;
 
@@ -279,9 +277,7 @@ struct zs_pool {
 	/* Compact classes */
 	struct shrinker *shrinker;
 
-#ifdef CONFIG_ZSMALLOC_STAT
 	struct dentry *stat_dentry;
-#endif
 #ifdef CONFIG_COMPACTION
 	struct work_struct free_work;
 #endif
@@ -565,14 +561,10 @@ static inline unsigned long class_stat_read(struct size_class *class, int type)
 	return class->stats.objs[type];
 }
 
-#ifdef CONFIG_ZSMALLOC_STAT
-
 static void __init zs_stat_init(void)
 {
-	if (!debugfs_initialized()) {
-		pr_warn("debugfs not available, stat dir not created\n");
+	if (!debugfs_initialized())
 		return;
-	}
 
 	zs_stat_root = debugfs_create_dir("zsmalloc", NULL);
 }
@@ -650,10 +642,8 @@ DEFINE_SHOW_ATTRIBUTE(zs_stats_size);
 
 static void zs_pool_stat_create(struct zs_pool *pool, const char *name)
 {
-	if (!zs_stat_root) {
-		pr_warn("no root stat dir, not creating <%s> stat dir\n", name);
+	if (IS_ERR_OR_NULL(zs_stat_root))
 		return;
-	}
 
 	pool->stat_dentry = debugfs_create_dir(name, zs_stat_root);
 
@@ -666,25 +656,6 @@ static void zs_pool_stat_destroy(struct zs_pool *pool)
 	debugfs_remove_recursive(pool->stat_dentry);
 }
 
-#else /* CONFIG_ZSMALLOC_STAT */
-static void __init zs_stat_init(void)
-{
-}
-
-static void __exit zs_stat_exit(void)
-{
-}
-
-static inline void zs_pool_stat_create(struct zs_pool *pool, const char *name)
-{
-}
-
-static inline void zs_pool_stat_destroy(struct zs_pool *pool)
-{
-}
-#endif
-
-
 /*
  * For each size class, zspages are divided into different groups
  * depending on their usage ratio. This function returns fullness

-- 
2.47.3

