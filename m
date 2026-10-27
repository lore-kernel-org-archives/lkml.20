Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086581;
	b=CTdGP/pZR757y38yB6uA29V8buVwysIMdNdZmU3+vJhLatUPOCWIk8oYAbBlTQSPmVr6
	 LImUv5s10hYx81NQkOxTDMZhLQCDW9naMW0vSmeL1iNqTnyf/7xrcO5JulPLmbbiSUJXt
	 sBMm7MiYImsa9nArALJfLrY0CRYZWzukcKAE7QY9nWhg8bf7k/yArH+oCrHfdFpUPsXuk
	 v+EkVc1IHLlgo6QZZg+nsaNmhUARNeeklt/bDH0xZRbVOryXj2at2yAWjQGFFMB3X1UKL
	 +44TevIDMtLtUekZDTKFn6iMJ2VT/p0OVbfc5KowEVGVGMCAviRICb/r3GKaeywrHpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=WsDVlDiCyeeoi6YHVgqDovvrMD/IKVknSNFW9xBDDdM=;
	b=lA9AWVf0za7HIGyY6U9gfZ5iAd6Rf96ZHLl4v4ErEEXrMqk9LWKffLmXwaigB1hR/YsZ
	 vM6zCdLcYyforaFOMwt9Z1TZpn5s0XJpcGqC6x21ZclwUozN066ufYeqLDozdhSxKdK2Y
	 9YheGE+MWej8VGQRhL2p0PBrneGDHCF9AAELcE2OxNDImEvrbPgcy9U6ykZmMRwvAeoZf
	 1lDqX9wi+Vw/9dZQ+ziezwdij+Wh3GOJsuWi+UhkTUwDFnGF7roIx+WkYmu6C94kT2PGo
	 PwJs3JX/pZczLljp+6Om6yU51ZJKZ4Wh+bpXsl6tl316yUvmbW2YCcLT/vlBPBLgagg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=oXS3sM3f;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4595E60A382F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4595E60A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=oXS3sM3f
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ea7190aea1so17539085ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793086581; x=1793691381; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WsDVlDiCyeeoi6YHVgqDovvrMD/IKVknSNFW9xBDDdM=;
        b=oXS3sM3fj2XUadb1vc02xfYY7JbNUjMzEB1ySQjFATcVV+4RJ6CNOqYCN+U9s9XxSP
         si6YHQT30AZD9j6WiJrWoLTheN6jeOPZ5ePo8ir8ejCjumrJJtV83vfg56+xUpAoOkT6
         5qjOKS1SP2re90ySQ0wAQXmiVC9h3nJ/zmoyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086581; x=1793691381;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WsDVlDiCyeeoi6YHVgqDovvrMD/IKVknSNFW9xBDDdM=;
        b=aOCKEO3E+UoBn3jk/qeWG1LXivxdtoWu4EUosuP6GirjE184o+zn/RbgpUHsxcrPxC
         xYZO300XgfyzBq9t5G4b9UHEm6kuok3IQutGXcy3DPlQHXmVup73N6GoIq5B7l9+w4Qi
         zvW+V68Gk6XT9NqMu1ujNZH9K9QQxccs0JxXozgqnWKTEzHYwVU1PZ3pgg3BZ8kvpJdl
         8QkY3StAFGNyiFt5pJmwbgk+nHXAXs55NGp+a6fI+lzjgPPgTPOjrZ65RBGVXhM6XJ1C
         TG3LwE/arr1SBkmgXFHYQggaUbRTNUbuwpInxuXXDwVq/5ErWVEJdXQyEwWPwStEO5Ob
         cuXg==
X-Forwarded-Encrypted: i=1; AKwUvBw41oJ7EiEvSY7oU3KRRkVqxI6EC8uB/JW/TW5VHzcjsQLacyvnzg8wjzBRFzclqEKTDMOz8OCb5J8GJDg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUXeayAEwX/hJ97fqIApRgNEGNYv/JhMtuCMXiO/teaqisPm6r
	nT90xnMVTyW0ZGr5h3Q+MVT4LQkRV/9MjzqojRcxcNCvaIOFV3hu6wV1ilEMIgYOceE=
X-Gm-Gg: AYBFou1Q1ocRNcG594acxL08OwSZxwvsUUIv6Nd63amXLlgcEebJaJTurK1M3yQx0JZ
	9/AyoYWvdUaaNFQgxxa6NHnIpZ3+IiFAABgFc3Bj13Bv3q0H1RpKc5nkl9whszIIPbtbQbXB46i
	gBlV4ABdtC1xb9p+d412pvxt6xSh4IE9ewUlPMP1KVGKKcEWcVccWm9O6m40E1kE0U41r7MENJh
	vD8jkgfGeFxKGxLs1Rg+gyGFZkhnbUroKdE13jBU6wdQV33gXdS/WXA+Bxl+Kn/GDoCKfHRgxwk
	ePUpW7pvYHYp8ujgOPersbHg18HTuc0oVjtpQmdhD9jy7zagPkgWKAXlmr5ZZht9XR9NowiN5x0
	gG9qLG0GQfWY5pe0SysEloSN94pRtDCAMpVocAcH9N1U/XA2RkQlBQp6K9MwB1U/goffmDDW+A2
	oWFVLST3HYFIm699nffZ/qbqNaen0mgB0vtLvKv+sex+q4BqdFaWgfC1nsYRBDAHlOJMwleJ8jB
	fbemGHboNCU6Jp9luLbvEGlb9Qf/fD+PNTwjX9NtDJqs2HnDuvdpdHWWNQnz1ncHGl6CuvC3tYP
	h4NbybrRrLDsRpHaPZkIo02PbxSHl0tPrqiZhQpFDlKIE1HgrgBmBWiX0sbGo17iQqqlDJx5Qs6
	kXA3t6s9MVw0iEaOK7FaXYDs=
X-Received: by 2002:a17:90b:35c6:b0:3ad:a17d:f46c with SMTP id 98e67ed59e1d1-3adeb194872mr6931650a91.62.1793086580701;
        Tue, 27 Oct 2026 00:36:20 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614d7dsm2480038a91.3.2026.10.27.00.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:36:20 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:36:16 +0800
From: Chris Down <chris@chrisdown.name>
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH 8/8] slub_kunit: Add a test for the kmalloc_partition boot
 parameter
Message-ID: <7c619e0ff37d83b825549ee257bb60a82bc8006f.1793086056.git.chris@chrisdown.name>
References: <cover.1793086056.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1793086056.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 lib/tests/slub_kunit.c | 46 ++++++++++++++++++++++++++++++++++++++++++
 mm/slab.h              |  4 ++++
 mm/slab_common.c       |  3 ++-
 3 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index 646596663b33..0fe10cbfc83d 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -430,6 +430,49 @@ static void test_slab_buckets(struct kunit *test)
 }
 #endif
 
+#ifdef CONFIG_KMALLOC_PARTITION_CACHES
+/*
+ * Each partition copy is a separate cache, unless the copies were disabled
+ * with kmalloc_partition=0: then they alias the KMALLOC_NORMAL caches.
+ */
+static void test_kmalloc_partition(struct kunit *test)
+{
+	enum kmalloc_cache_type type;
+	struct kmem_cache *s;
+	unsigned int idx;
+	bool found;
+	void *p;
+
+	for (type = KMALLOC_PARTITION_START + 1; type <= KMALLOC_PARTITION_END; type++) {
+		for (idx = 0; idx < ARRAY_SIZE(kmalloc_caches[type]); idx++) {
+			struct kmem_cache *normal = kmalloc_caches[KMALLOC_NORMAL][idx];
+			struct kmem_cache *part = kmalloc_caches[type][idx];
+
+			if (!kmalloc_partition_enabled) {
+				KUNIT_EXPECT_PTR_EQ(test, part, normal);
+			} else if (normal) {
+				KUNIT_EXPECT_NOT_NULL(test, part);
+				KUNIT_EXPECT_PTR_NE(test, part, normal);
+			}
+		}
+	}
+
+	p = kmalloc(64, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, p);
+	s = virt_to_slab(p)->slab_cache;
+	idx = kmalloc_index(64);
+	if (!kmalloc_partition_enabled) {
+		KUNIT_EXPECT_PTR_EQ(test, s, kmalloc_caches[KMALLOC_NORMAL][idx]);
+	} else {
+		found = false;
+		for (type = KMALLOC_PARTITION_START; type <= KMALLOC_PARTITION_END; type++)
+			found |= s == kmalloc_caches[type][idx];
+		KUNIT_EXPECT_TRUE_MSG(test, found, "allocated from %s", s->name);
+	}
+	kfree(p);
+}
+#endif
+
 #if defined(CONFIG_PERF_EVENTS) || (defined(CONFIG_KPROBES) && defined(CONFIG_SMP))
 #define NR_ITERATIONS 1000
 #define NR_OBJECTS 1000
@@ -628,6 +671,9 @@ static struct kunit_case test_cases[] = {
 #ifdef CONFIG_SLAB_BUCKETS
 	KUNIT_CASE(test_slab_buckets),
 #endif
+#ifdef CONFIG_KMALLOC_PARTITION_CACHES
+	KUNIT_CASE(test_kmalloc_partition),
+#endif
 #ifdef CONFIG_PERF_EVENTS
 	KUNIT_CASE_SLOW(test_kmalloc_nolock_and_friends_perf),
 #endif
diff --git a/mm/slab.h b/mm/slab.h
index 185df5e68419..934b9db1ef6b 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -394,6 +394,10 @@ extern struct kmem_cache *kmem_cache;
 extern bool slab_buckets_enabled;
 #endif
 
+#if IS_ENABLED(CONFIG_KUNIT) && defined(CONFIG_KMALLOC_PARTITION_CACHES)
+extern bool kmalloc_partition_enabled;
+#endif
+
 /* A table of kmalloc cache names and sizes */
 extern const struct kmalloc_info_struct {
 	const char *name[NR_KMALLOC_TYPES];
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 5391149a2eed..406e8688ee0e 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -782,7 +782,8 @@ EXPORT_SYMBOL(random_kmalloc_seed);
 #endif
 
 #ifdef CONFIG_KMALLOC_PARTITION_CACHES
-static bool kmalloc_partition_enabled __ro_after_init = true;
+VISIBLE_IF_KUNIT bool kmalloc_partition_enabled __ro_after_init = true;
+EXPORT_SYMBOL_IF_KUNIT(kmalloc_partition_enabled);
 
 static int __init setup_kmalloc_partition(char *str)
 {
-- 
2.54.0

