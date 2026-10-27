Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086548;
	b=TtWaZPdBwp+wDMBOYlVGbqk9olqSfwBfrcpFR1yws7ieL7cfntkDjqMs/yYpLdlUNL32
	 zOmvAqk4MZZLhlgOQyK+5mmJ8ssXNcZL7JN/du24zhWcwp6LaFs6P22oR/KUAf0g7d445
	 SGeQVtVB5uGjauSWzbUVHnakgPdqWjrkZONXqmDMFmIUNqLGBWON+frzcVpiKoc2JKl2L
	 RvIoimpvQPUK9ddHmrnAyut8lfMVD5JtXw1IxEi4rovTsU3YXE9B3yW8O/3vcNBfLdgc3
	 gAHiWGx0J2qh2f+ZPoWO3IPHK1lJeeS1+uluxyLZIP42w01PzYkelpG/2OjOlNCMEYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=sN6UGPpUTXeJgZ2lTe0CetjR/EEvcG4cIahELjc1+Mo=;
	b=csy4djdpMy0H3G3zAq9axvL5A/sYTDNV/S0MXBsniP/KAOAagFK5rzEoFd5yMtNEh6SZ
	 Xa4W3dH0PcvzNSt7Tn8LRVNSR5iFpgysDlja5cmxK41DYlriqU52xTD8NfaLGePE7ztJ/
	 /B2d7dgT8vXGz0aw0i4Q9s3tGR1LUsgo2mV+925sRagi7aHY+Ot03zl4VwbxJuoWBSqJb
	 U1yWAcABN4BHs+YkA52CWvEUc/u7MVQmQ3p9ICJaNoNCMQjtotEcC1YlWxrucyHiHela+
	 hiNvtOR66HlPXbLJiyEpKosZn0uAsmTZz3e369tLKnYDlXWXGZe2cNMK7z/dqoL0HMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=fAiXxZKB;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3013E606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3013E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=fAiXxZKB
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-89ff475a152so1521011b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793086546; x=1793691346; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sN6UGPpUTXeJgZ2lTe0CetjR/EEvcG4cIahELjc1+Mo=;
        b=fAiXxZKBWY8H0gWlOOTToiLfSVY/mehDO8qgrRu+4YIETSxmnjYIO1QbkvuyOtWEJH
         Dqx5WyLbLDt1fRSP6vMZu93WK93ZrbmOpU76q3DEMVxZYZZgM9U/hQm8bHOMh7dgZsWY
         aIlVc7K6drYWA4kDzhZ1Y18RrgHzpDmMc1wG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086546; x=1793691346;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sN6UGPpUTXeJgZ2lTe0CetjR/EEvcG4cIahELjc1+Mo=;
        b=GAPCpP0iNw/qMb1JNSC3nLcnqAKhRPBZz6Nu0j/t6+xJIjiizszyIbkJ0L42RA1mXl
         jWYoHQflCqkeRFCOhqWtPjsxy0eAxs+7Rd1C8v9IfrUf7jY4yPvkzvEeDhaEocux1SYJ
         LYpkDAZi1I8VF265uWjJl79K4WFP6xHIQep+tKRBeRSvx3DIbGUs96+Wxh+nGxSBLVMd
         Zv3fLxstiDMzN7eJnSma2HSDBttxnkzio57WdQL1cOXlM+D16fxdsnd6SVj5RNMfQvc2
         /6K4D88aWxHQI0RPGtp4xUOiuZQhN8jQaT1qOJeZf66N8O8OsvGiKWLyHUAXs8lhahXl
         kzvw==
X-Forwarded-Encrypted: i=1; AKwUvBzUtb6vC17MjUpygKPg06kPmS/vU1uqwoAo38jQ/YzgkPgH2NEpwFJInKBP/ypbbwQkdMLzQ+w5VZDn/eE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZVrby/GuQxIz+s/HX8WiiJ3t6LpeERKCmpVUAtSHUHWbIl2Vk
	eAKPP6ZoqrLDSluM+/H4tpTbwg8Lo3uVvAmx0f98uONqdM6FpQMDSkxU7Gy+2Sq2p6o=
X-Gm-Gg: AYBFou39QTdyn5GMEhUlPGZUC9iV5ZUsk1XWEdvm+o6bg4deuorKXlx6/IPiA0FQNF7
	GlOS7gxYGiHVdYq0Ru+OhpW+ZavS+oHc5LO28yGKOYkEOr/tTw+THcgmRMAZ9iwTgitx8XhBRj7
	ndoIozesbzTXxosajpCE9yY+BGT0SFO8A7InkUxImVR/zJXvxogH/2+OytWUpZ771iwLWOUeILS
	3TqFsYM/adRzalAiPtpelxgdw6sDSbdZT5RGJjpRfZTo228T/IE5LZgivWmY9Ae0BCl9ifCEFPa
	jj5D88ewF/9UTdNyaXZukAujVePu/IQKDh8oHzwlse5l9ECZVpkFIkjyGoXFDDanFPZRsufWXPK
	22raU93hBoFJV/hBgMono3B7ACmU8AQ51b0b+KHKoy7UsxfMtlLWv85Qu9FrkmtUfK3KqZQqBVP
	ga79x/WX1JbFkhNF2JHEuoLp6w/7egjC8mrMtMTW4Tx46Ig9ofy61ohDidIItBzatCYPnz4Itz9
	QnN0mQB77FfIHU+RVZeszWxUurheop+c0J04FpZU6cqrizlhCVGlRgpOdEK9KKerPDYleltLKuZ
	RqBdSk/AFTzTNdj86yUmXhvS9wmsW6nYgHqogPN46yJzFm4Ca3NLbS0vtcQr78uyXdtKx+7jrQb
	xsiyNCvVv1Nin/uoDAcjbHbE=
X-Received: by 2002:a17:90b:4b92:b0:3ac:6fcf:81a2 with SMTP id 98e67ed59e1d1-3adeb137d1cmr7346559a91.57.1793086546607;
        Tue, 27 Oct 2026 00:35:46 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614daasm2511140a91.4.2026.10.27.00.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:35:45 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:35:42 +0800
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
Subject: [PATCH 2/8] slub_kunit: Add a test for slab_freelist_hardened=
Message-ID: <b5bab23337f5448d8a134c71d42a9e3165ba3366.1793086056.git.chris@chrisdown.name>
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
 lib/tests/slub_kunit.c | 52 ++++++++++++++++++++++++++++++++++++++++++
 mm/slub.c              |  2 ++
 2 files changed, 54 insertions(+)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index e3b63f0338d5..5ace73368523 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -9,6 +9,8 @@
 #include <linux/delay.h>
 #include <linux/perf_event.h>
 #include <linux/kprobes.h>
+#include <linux/string_choices.h>
+#include <linux/swab.h>
 #include "../mm/slab.h"
 
 static struct kunit_resource resource;
@@ -107,6 +109,54 @@ static void test_first_word(struct kunit *test)
 	kmem_cache_destroy(s);
 }
 
+static void test_freelist_hardened(struct kunit *test)
+{
+	struct kmem_cache *s = test_kmem_cache_create("TestSlub_freelist_hardened",
+					64, SLAB_CONSISTENCY_CHECKS);
+	bool hardened = slab_freelist_hardened_enabled();
+	unsigned long ptr_addr, raw;
+	void *a, *b, *c;
+
+	a = kmem_cache_alloc(s, GFP_KERNEL);
+	b = kmem_cache_alloc(s, GFP_KERNEL);
+	c = kmem_cache_alloc(s, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, a);
+	KUNIT_ASSERT_NOT_NULL(test, b);
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	if (virt_to_slab(a) != virt_to_slab(b) ||
+	    virt_to_slab(b) != virt_to_slab(c)) {
+		kmem_cache_free(s, a);
+		kmem_cache_free(s, b);
+		kmem_cache_free(s, c);
+		kmem_cache_destroy(s);
+		kunit_skip(test, "objects were allocated from different slabs");
+	}
+
+	/*
+	 * Caches with debug flags have no sheaves, so a and b are pushed onto
+	 * the slab freelist in that order.
+	 */
+	kmem_cache_free(s, a);
+	kmem_cache_free(s, b);
+
+	ptr_addr = (unsigned long)b + s->offset;
+	raw = *(unsigned long *)ptr_addr;
+
+	kunit_info(test, "freelist hardening is %s\n", str_on_off(hardened));
+	KUNIT_EXPECT_EQ(test, raw == (unsigned long)a, !hardened);
+#ifdef CONFIG_SLAB_FREELIST_HARDENED
+	if (hardened)
+		KUNIT_EXPECT_EQ(test, raw,
+				(unsigned long)a ^ s->random ^ swab(ptr_addr));
+#endif
+
+	kmem_cache_free(s, c);
+	validate_slab_cache(s);
+	KUNIT_EXPECT_EQ(test, 0, slab_errors);
+	kmem_cache_destroy(s);
+}
+
 static void test_clobber_50th_byte(struct kunit *test)
 {
 	struct kmem_cache *s = test_kmem_cache_create("TestSlub_50th_word_free",
@@ -480,6 +530,7 @@ static struct kunit_case test_cases[] = {
 #ifndef CONFIG_KASAN
 	KUNIT_CASE(test_next_pointer),
 	KUNIT_CASE(test_first_word),
+	KUNIT_CASE(test_freelist_hardened),
 	KUNIT_CASE(test_clobber_50th_byte),
 #endif
 
@@ -505,5 +556,6 @@ static struct kunit_suite test_suite = {
 };
 kunit_test_suite(test_suite);
 
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 MODULE_DESCRIPTION("Kunit tests for slub allocator");
 MODULE_LICENSE("GPL");
diff --git a/mm/slub.c b/mm/slub.c
index c82bc626b657..de4937fcb293 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -46,6 +46,7 @@
 #include <linux/prandom.h>
 #include <kunit/test.h>
 #include <kunit/test-bug.h>
+#include <kunit/visibility.h>
 #include <linux/sort.h>
 #include <linux/irq_work.h>
 #include <linux/kprobes.h>
@@ -220,6 +221,7 @@ static DEFINE_STATIC_KEY_FALSE(strict_numa);
  * so it must not change once the first slab has been populated.
  */
 DEFINE_STATIC_KEY_TRUE_RO(slab_freelist_hardened);
+EXPORT_SYMBOL_IF_KUNIT(slab_freelist_hardened);
 static bool slab_freelist_hardened_early __initdata = true;
 
 static int __init setup_slab_freelist_hardened(char *str)
-- 
2.54.0

