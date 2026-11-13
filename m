Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559903;
	b=NH6NAMnky7A77UicTfCeHqj1yENOuKYIk0XdVilpIDKwEvm55xRXkGZDho0RTu0LNXyf
	 +CZNEgKpJtIa/yOOucCjqhlYJTtlz8WdyPCrKwpY4PXGBmcunm3Wkcm0Df9YuEXdJUEzp
	 6+4WLEexjAxiGkfVaUpgRDEWHs3m+4/mg1nc8x391pEYAlatrtYsOdgB9jbU4OVg5ihad
	 8qu2LwoVmqu64VXGg7NdQBqb1KKq9P3IdK3we6ZP9chZrYR4h+x3KsnFlniv/oZ74nGry
	 cvs4RNF9vuPDZFw4N678vRngHoDgFU8r08cPSf7kZP35BOEkVzhdV9FAtGrwmocCPXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=E7JpIOJtGBaq2Xw74Bm81qRvbnlUv386MdM8N1c/N3M=;
	b=OGSKg4Jk+hwIicMT15LRjQpqDDlFpmQIqa2xic1407jsdBaToH40FCmPwJr3q2989SXR
	 loIZyalFSHUnE2tq5WltNIlerrvUylJ+xiNWeiuXlI69zdlIVZ1itTneEq6x8wsVduIVD
	 iVm3bv1gHgJwpfTorgaz4q16saCwyPnMRx8X5W8cb4YcaaJHE9ZUfKHCppESPKC3/ou9N
	 Gudsk0oIwsaqNPd9m0B4O3whdoGjq+sQHoLoXAl6sTddwpaCNO6zdIMiVvisteklO9z1K
	 j+J/MFVZ6sDNexiwCJmu9ly/e0a1R57eYwRzsgmnyFVguuTJZji0i32aGYRggj9/hDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=F2hxiijA;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C4E606C180
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3C4E606C180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=F2hxiijA
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ed1f1a7695so2549615ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559902; x=1795164702; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E7JpIOJtGBaq2Xw74Bm81qRvbnlUv386MdM8N1c/N3M=;
        b=F2hxiijAHc7/Pg4AdpkMlrYeYxAwjZK74A017Lebaba7WHeuuzb4ZzzOMb3jv1zmio
         HN3k8edj6s73igqBm+a9yIqc4gJqKWrSjXjrxJUJzJ/V20am6KJgqzAO4fwzJ+lNKOzq
         thi7zPurlLWgN00Qx7rWaJcabUXlFAxq0KVgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559902; x=1795164702;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7JpIOJtGBaq2Xw74Bm81qRvbnlUv386MdM8N1c/N3M=;
        b=A/h7MAipKWLrUpViZHzrSrjmutg0QVVPVRGFhIBYGfXy4bI0YBxa/r4Msv1LXLUtMu
         vNmocDtA5aH7xSaKkRjwg8RjjwHIUxOGL6GTnKQD2JfJaq35dmPp9blt9ybZUP9T6xp2
         K0vLbi4VNUQG78rfQK4neH2IDFVo24xOmy8G+aZBMW5r7qdl1vOzRiTPPy4dlHRWzPkA
         MksEdXaSsbtaBLEVUP/kjReCyZr8dG9RDSQKKkpvpDDLxCsEqL0HevCktEsgPIo+MltO
         kc+BcUxnmlolfJwDfyyZSJPCK/+MOnHHE+Mh/Yvk2qH5RdxrnFHtXitlFhbDfty2UdC9
         h5nA==
X-Forwarded-Encrypted: i=1; AL+hErHG4Yt+UXmMFseWztZQr6/p2bsSuf28GUzYmlgwIJWttVT9WZ76xlsLSkdCpDeyeO9AqAsNTRZiJGH6cWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NKECTJkCiiaFfJZe8TFXDoG3i0lTumzkwk+V7thy9LZCOvDoq
	QQNll6DSQ9ntL/V2NYt3b/SfbqKu9IKxrRQkjDF4XAts1+yfI35Fss0nmaMkd7qN7VU=
X-Gm-Gg: AYBFou3uB9WJ6gV0P+lFNfAacXegc0wnNKQJlehaynZ9Hpl35hcq3mi18GrBSl8KdON
	qcTyaj6w8KO6JKohNwZJ4+MfgZ4q3oDzY8nrSbHpmNP5IxNf80AEzDteonBYlRNIZbV36vBaZZO
	6GNVIi1oqYg6RrVabghdtF2DqziiyS92X8jF8Dy+drSs6iIyQrNVP4AWctcehRtx1+1mDrtjqOg
	nn6eViqQnl0Jvo6kzARqLcCYHv2xZr2Bci26aOWo4tcpOXiEHOrgoHb24pkObXIGAEE4uUhBQIZ
	/MecAINsZMVVjTTHmi4uaHl/TDf6bnX0ssKVvsRZZk76Zf1xWBNwXN505HkzRXo65rZsUH5eud6
	lYWvEEB4uDopT3O85ExAQOk+uRH2mVjhVLBgTiZFF8fj48hfcNc5uhqgAI0bWRemhjaXZBn3hBf
	CLMt0XZc3VTkBKQNoqR/mwpxTEEPaQ/PTYaewmAalT9MpUlFQ44k0osicCO1McQDhr9cfYxUvq5
	NTwtsPgtIILwk9BPkOa0XS6xIrvUv8lSFLjQGhCvGgCAAgb7KQGyAZvzwlIRJ3Ce3PTMShVy4wB
	WYDUqELB8AgNKCwKOz1IoWMffUr7qQJDlCm9mU7LPuEIr87q3478ufrl3gJA8D6br1uXQpQKZir
	MHh3HsbXuFdRh/oVmnBmVqc78f4PwEqch3P3JmXSmWoyjUkIIPfqf+/Fp4s5M+A8gkm95qXBTMe
	dXQJPNTs+cc5KyPgfrq+Qah5JGoK+J7tAMeG74uEf7yGdnERJDKxMB/IszazFCvbI1WGxRB/C4v
	/wQaHz+
X-Received: by 2002:a17:903:3d10:b0:2ed:a8bc:6d48 with SMTP id d9443c01a7336-2ee0dc06844mr17927715ad.43.1794559902021;
        Fri, 13 Nov 2026 00:51:42 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7d9971sm6839925ad.34.2026.11.13.00.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:51:41 -0800 (PST)
Date: Fri, 13 Nov 2026 00:51:35 -0800
Message-ID: <14d2fcd42e3e8aa20ac8dcb736a9411cbfc9bcd0.1794506262.git.chris@chrisdown.name>
In-Reply-To: <cover.1794506262.git.chris@chrisdown.name>
References: <cover.1794506262.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v3 4/6] slub_kunit: Add a test for the slab_buckets boot
 parameter
To: Vlastimil Babka <vbabka@kernel.org>,
    Harry Yoo <harry@kernel.org>,
    Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>,
    Christoph Lameter <cl@gentwo.org>,
    David Rientjes <rientjes@google.com>,
    Roman Gushchin <roman.gushchin@linux.dev>,
    Kees Cook <kees@kernel.org>,
    Marco Elver <elver@google.com>,
    GONG Ruiqi <gongruiqi@huaweicloud.com>,
    Jonathan Corbet <corbet@lwn.net>,
    linux-mm@kvack.org,
    linux-hardening@vger.kernel.org,
    linux-doc@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
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
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Check that memdup_user() allocates from the memdup_user buckets by
default, and from the regular kmalloc caches when they're turned off
with slab_buckets=0. The test is skipped on kernels built without
CONFIG_SLAB_BUCKETS.

Make slab_buckets_enabled global and export it to KUnit so that the
test can see it.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 lib/tests/slub_kunit.c | 40 ++++++++++++++++++++++++++++++++++++++++
 mm/slab.h              |  2 ++
 mm/slab_common.c       |  4 +++-
 3 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index e3b63f0338d5..1af3f087134f 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -9,6 +9,8 @@
 #include <linux/delay.h>
 #include <linux/perf_event.h>
 #include <linux/kprobes.h>
+#include <linux/mman.h>
+#include <linux/string.h>
 #include "../mm/slab.h"
 
 static struct kunit_resource resource;
@@ -296,6 +298,42 @@ static void test_krealloc_redzone_zeroing(struct kunit *test)
 	kmem_cache_destroy(s);
 }
 
+static void test_slab_buckets(struct kunit *test)
+{
+	unsigned long user_addr;
+	const char *name;
+	void *p;
+
+	if (!IS_ENABLED(CONFIG_SLAB_BUCKETS))
+		kunit_skip(test, "requires CONFIG_SLAB_BUCKETS");
+
+	if (!slab_buckets_enabled)
+		KUNIT_EXPECT_NULL(test, kmem_buckets_create("TestSlub_buckets",
+							    0, 0, INT_MAX, NULL));
+
+	if (!IS_ENABLED(CONFIG_MMU))
+		kunit_skip(test, "userspace allocation needs an MMU");
+
+	user_addr = kunit_vm_mmap(test, NULL, 0, PAGE_SIZE,
+				  PROT_READ | PROT_WRITE,
+				  MAP_ANONYMOUS | MAP_PRIVATE, 0);
+	KUNIT_ASSERT_NE_MSG(test, user_addr, 0, "Could not create userspace mm");
+	KUNIT_ASSERT_LT_MSG(test, user_addr, (unsigned long)TASK_SIZE,
+			    "Failed to allocate user memory");
+
+	p = memdup_user((void __user *)user_addr, 64);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, p);
+
+	name = virt_to_slab(p)->slab_cache->name;
+	if (slab_buckets_enabled)
+		KUNIT_EXPECT_TRUE_MSG(test, strstarts(name, "memdup_user-"),
+				      "allocated from %s", name);
+	else
+		KUNIT_EXPECT_TRUE_MSG(test, strstarts(name, "kmalloc-"),
+				      "allocated from %s", name);
+	kfree(p);
+}
+
 #if defined(CONFIG_PERF_EVENTS) || (defined(CONFIG_KPROBES) && defined(CONFIG_SMP))
 #define NR_ITERATIONS 1000
 #define NR_OBJECTS 1000
@@ -489,6 +527,7 @@ static struct kunit_case test_cases[] = {
 	KUNIT_CASE(test_kfree_rcu_wq_destroy),
 	KUNIT_CASE(test_leak_destroy),
 	KUNIT_CASE(test_krealloc_redzone_zeroing),
+	KUNIT_CASE(test_slab_buckets),
 #ifdef CONFIG_PERF_EVENTS
 	KUNIT_CASE_SLOW(test_kmalloc_nolock_and_friends_perf),
 #endif
@@ -505,5 +544,6 @@ static struct kunit_suite test_suite = {
 };
 kunit_test_suite(test_suite);
 
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 MODULE_DESCRIPTION("Kunit tests for slub allocator");
 MODULE_LICENSE("GPL");
diff --git a/mm/slab.h b/mm/slab.h
index e94ac63d10dc..6a28951f6d5d 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -390,6 +390,8 @@ extern struct list_head slab_caches;
 /* The slab cache that manages slab cache information */
 extern struct kmem_cache *kmem_cache;
 
+extern bool slab_buckets_enabled;
+
 /* A table of kmalloc cache names and sizes */
 extern const struct kmalloc_info_struct {
 	const char *name[NR_KMALLOC_TYPES];
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 272d22f411c2..5575706b8938 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -29,6 +29,7 @@
 #include <linux/memcontrol.h>
 #include <linux/stackdepot.h>
 #include <trace/events/rcu.h>
+#include <kunit/visibility.h>
 
 #include "../kernel/rcu/rcu.h"
 #include "internal.h"
@@ -410,7 +411,8 @@ EXPORT_SYMBOL(__kmem_cache_create_args);
 
 static struct kmem_cache *kmem_buckets_cache __ro_after_init;
 
-static bool slab_buckets_enabled __ro_after_init = IS_ENABLED(CONFIG_SLAB_BUCKETS);
+bool slab_buckets_enabled __ro_after_init = IS_ENABLED(CONFIG_SLAB_BUCKETS);
+EXPORT_SYMBOL_IF_KUNIT(slab_buckets_enabled);
 
 static int __init setup_slab_buckets(char *str)
 {
-- 
2.56.1

