Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868239;
	b=kKGPVzcw1udH5EzO08aCmQN/oR4U/ZJ7hAIjNzJkRVU6GK9/EiEsBzCyLpw5fgHCAvx8
	 /oO03wVtCBOw58FQEO1lWhcS8mKpPC07GwuWI3IVF/Fgyf1+fZFfZbyFdqQuoelEZbEAe
	 oT3CuV4GeMo1lCwFHJnA4Rg3yyMMpQfQid+oUvVAj6AkSQB8WdkEzETzGPPqMjkGspGMc
	 xSFbivxmtOwM0+hKDdq9VNE49yvN9rErR65AJCzImcSRYdXSaRj3CuyimVPRm9+7ULYAL
	 w+rQ3HekvYWpVQSsPtp99BhLLWAy+OJ00kET8U7tUWzhr+zslbYwd7TeSmaUocfiSmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868239;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=dm7hinjZ2Hv+FWkKpGdKWF8U9Pzj/MHQHGGecTaoJOg=;
	b=npUIgm0MV1xYalnbKJ8v0HQ6dVOJainqR502WhHSQ429ip1mxuE7fQzI5gl/4S9H/JKD
	 ++nNSn7x5BraIwm/MBgvw4t0AWWTgOYUuxkhML9aR3PhUrRmpR5D2gs/yHrgWbziGPBDA
	 DK+FiszL1nZn1jbCvUmdPm82jEIgr+KF7y0jA/H9/6tNCFBWhcRqkVuZhYBhcXFtIo1D7
	 uMwGKFK+Z/XAHhNOjNYo6b/wrYt84ZTfkeHWkfFm6hcyxovVLF/lr8LhXO3GTupYKK+GV
	 pyjVuurqAeAzLJr/gfI3y/TK8xk/9HucgagLVyReSABxY85jOo7gSclmXV9C9cNn2yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cejgT5a3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4C0606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cejgT5a3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7161F00A16;
	Thu,  5 Nov 2026 08:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868239;
	bh=dm7hinjZ2Hv+FWkKpGdKWF8U9Pzj/MHQHGGecTaoJOg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cejgT5a3IGcZ7drU+mnxmAA0JdW+j4iFA8tEz2xpYm+bBKiuBIuQ0K7RKlwvUOYPY
	 sZrI+CbasH1q5A/qudt2JA4jENjECGpcW7XC39O3D5GiWQQxfIIdLg/FZ7S9INv6cT
	 owd3RXPAMbUUea6PDY8nPlgnS14ohetgj7AkTLhfxEMtXOsUjyo+x/Olvz6PAK6pcy
	 ae0uOUofbN4UoBMUVE3BPlzjdxT/PCtVxcyySaikhYXN4lMWJfQgD1Qa3faPLj495E
	 TzQYA07ncTOgCjByaGuQ9Dv3LXMj87NV83PEJEKRwXJbzTj8JZwmurMnMxAPIig19Z
	 lAMpcuu3BBCrw==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Thu, 05 Nov 2026 09:43:50 +0100
Subject: [PATCH v3 01/10] slab, kunit: pin test slabs by an extra
 allocation
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
Message-Id: <20261105-slub_tiny_rework-v3-1-0484ce59eabb@kernel.org>
References: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
In-Reply-To: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
To: Harry Yoo <harry@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>, 
 Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
X-Mailer: b4 0.16.0

Several of slab kunit tests allocate and free a single object from the
test cache, perform intentional UAF actions and validation, while
expecting the empty slab to stay on the partial list.

This subtly relies on non-zero s->min_partial. It currently compile-time
defaults to a non-zero value, but in theory a sysfs write racing with
the kunit test could change it. More importantly, the upcoming
CONFIG_SLUB_TINY changes will make it possible to run the kunit tests
with s->min_partial being a compile-time zero, which means the tests
will now do unintended UAF writes on the page allocator level, and also
report failures, as flagged by sashiko [1].

To prevent this in a robust way, add an extra object allocation to the
tests, that will prevent the slab being freed. Use migrate_disable() to
prevent migration to a different NUMA node, which would place the
allocation to a different slab.

[1] https://sashiko.dev/#/patchset/20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org?part=8

Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 lib/tests/slub_kunit.c | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index e3b63f0338d5..40427f7edf4c 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -51,10 +51,16 @@ static void test_next_pointer(struct kunit *test)
 {
 	struct kmem_cache *s = test_kmem_cache_create("TestSlub_next_ptr_free",
 							64, SLAB_POISON);
-	u8 *p = kmem_cache_alloc(s, GFP_KERNEL);
+	void *pin;
+	u8 *p;
 	unsigned long tmp;
 	unsigned long *ptr_addr;
 
+	migrate_disable();
+	pin = kmem_cache_alloc(s, GFP_KERNEL);
+	p = kmem_cache_alloc(s, GFP_KERNEL);
+	migrate_enable();
+
 	kmem_cache_free(s, p);
 
 	ptr_addr = (unsigned long *)(p + s->offset);
@@ -89,6 +95,7 @@ static void test_next_pointer(struct kunit *test)
 	validate_slab_cache(s);
 	KUNIT_EXPECT_EQ(test, 0, slab_errors);
 
+	kmem_cache_free(s, pin);
 	kmem_cache_destroy(s);
 }
 
@@ -96,7 +103,13 @@ static void test_first_word(struct kunit *test)
 {
 	struct kmem_cache *s = test_kmem_cache_create("TestSlub_1th_word_free",
 							64, SLAB_POISON);
-	u8 *p = kmem_cache_alloc(s, GFP_KERNEL);
+	void *pin;
+	u8 *p;
+
+	migrate_disable();
+	pin = kmem_cache_alloc(s, GFP_KERNEL);
+	p = kmem_cache_alloc(s, GFP_KERNEL);
+	migrate_enable();
 
 	kmem_cache_free(s, p);
 	*p = 0x78;
@@ -104,6 +117,7 @@ static void test_first_word(struct kunit *test)
 	validate_slab_cache(s);
 	KUNIT_EXPECT_EQ(test, 2, slab_errors);
 
+	kmem_cache_free(s, pin);
 	kmem_cache_destroy(s);
 }
 
@@ -111,7 +125,13 @@ static void test_clobber_50th_byte(struct kunit *test)
 {
 	struct kmem_cache *s = test_kmem_cache_create("TestSlub_50th_word_free",
 							64, SLAB_POISON);
-	u8 *p = kmem_cache_alloc(s, GFP_KERNEL);
+	void *pin;
+	u8 *p;
+
+	migrate_disable();
+	pin = kmem_cache_alloc(s, GFP_KERNEL);
+	p = kmem_cache_alloc(s, GFP_KERNEL);
+	migrate_enable();
 
 	kmem_cache_free(s, p);
 	p[50] = 0x9a;
@@ -119,6 +139,7 @@ static void test_clobber_50th_byte(struct kunit *test)
 	validate_slab_cache(s);
 	KUNIT_EXPECT_EQ(test, 2, slab_errors);
 
+	kmem_cache_free(s, pin);
 	kmem_cache_destroy(s);
 }
 #endif
@@ -127,7 +148,13 @@ static void test_clobber_redzone_free(struct kunit *test)
 {
 	struct kmem_cache *s = test_kmem_cache_create("TestSlub_RZ_free", 64,
 							SLAB_RED_ZONE);
-	u8 *p = kmem_cache_alloc(s, GFP_KERNEL);
+	void *pin;
+	u8 *p;
+
+	migrate_disable();
+	pin = kmem_cache_alloc(s, GFP_KERNEL);
+	p = kmem_cache_alloc(s, GFP_KERNEL);
+	migrate_enable();
 
 	kasan_disable_current();
 	kmem_cache_free(s, p);
@@ -137,6 +164,7 @@ static void test_clobber_redzone_free(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, 2, slab_errors);
 
 	kasan_enable_current();
+	kmem_cache_free(s, pin);
 	kmem_cache_destroy(s);
 }
 

-- 
2.56.0

