Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811642;
	b=TcegAYnpcejMkFkWFSAQyAb1WLC9I4VrT2Gza2rvJaD6+Z3MMRDdlLXX2ZArA1foU2qY
	 1P35FI3po/zlAmKqt6C+p22JoGhg6aqN8rL9OojUQlmtnZocdNV0zkNCTFKtLrjPl1YJM
	 eW0+pyqvwyTl1jxj+kdhHhS4rr7so+V8CNIjft5tBjcIMLqsg0hMo3m/ukp+fhpkc/yuE
	 qzCSW4+OvH34cYmr25gmN+rZ/16my4UysZ0Rzdaq/KqHPaxLL5QCO1u6h3pIoM8bJxYWu
	 oKrfYaqzoR3AGm9lN4ODDK3XRcvthU4QtHvCikRWB+JHVzQpstx+zZXFhKeqAs6Augg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811642;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=3U+iFMsR7Wf6izMeYzL3XEBnXOJ8vfgZxFGf5leGhvM=;
	b=rQkDOrEcCf7iZYBQe20GDgBkQypNnYxIXJKyXJ5Ib5EfOjXc1cufjqVHRoS+/tH+vXMO
	 0rD/ocM8RhGBHDTBXbWpgmIlxwwbPKfXehLHZ46kxHrIz53MV4vIRhd+FrxfvsvAex6+/
	 H/eS/PnZpjH64UWSr2XDPCUdYEV5SSXkacCq9BEnJX2ApYgivmEyLwqH+csqV6EUPkMp/
	 miglfVJqs/aHp264bdgNG9icBDxutmyhU1ONmuuS3bZGl/mHqAsFJg9iFCaT0+vdLRUnf
	 5KjGsR/ZKFctm2rP10grRouPZm4oh2kW4FJbn2EVupjy+5gCLhKX640335AAO+hqdig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LD6ejzLV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A036606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LD6ejzLV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12AF1F000C5;
	Mon, 16 Nov 2026 06:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794811642;
	bh=3U+iFMsR7Wf6izMeYzL3XEBnXOJ8vfgZxFGf5leGhvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LD6ejzLVqR8AUJ+Xda9FHUcUBs6d9zxbCmNuusg03uIJxYTZS+tTC8SpyUjNtAPkf
	 UdXj0ebnLwKrLEMBOZHzghtpFNfFNIggbaaLrE8TvW/5TAX0KFTIgGBkEtFa/RqkLy
	 6f37iw1UQY+6v/ewpyfStd23CXSbbD47iP6+m36zWp5/APDhb6Ah3IOzR+0zQ0xh0p
	 rSL51wa75o3AxKQhGi8afDrv1vgmVNotLiqMCnlBaEyhIc/xXjXTts+ow30t7HM8Ej
	 JpWDX9/vGr1WqSferEgjgGXoQ3D84LupLrDiah82kmYcEQxA2l3u8YepvBnasEJP68
	 LroJHEfVSVq+Q==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Mon, 16 Nov 2026 07:47:09 +0100
Subject: [PATCH v4 01/10] slab, kunit: pin test slabs by an extra
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
Message-Id: <20261116-slub_tiny_rework-v4-1-227a4b3636a5@kernel.org>
References: <20261116-slub_tiny_rework-v4-0-227a4b3636a5@kernel.org>
In-Reply-To: <20261116-slub_tiny_rework-v4-0-227a4b3636a5@kernel.org>
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

Acked-by: Harry Yoo (Meta) <harry@kernel.org>
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

