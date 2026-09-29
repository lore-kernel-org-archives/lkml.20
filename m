Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FEB397352
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666420; cv=none; b=r9rYjMhghrxX8AossR977nGRinQZeT2nItQ8EYdHCR6+r3oidVtDRkkUb2KjhHfAmKGvdON4rhfXTBC8Z7BJ/wbR/A0Bq06ymwks2CfuQNp/HVvyJbKQTpd5xRpRwbtChKw8NvwGW69yoofRfUlb9B6u5eedgL/jb2CzPMzx204=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666420; c=relaxed/simple;
	bh=hAFCmyambOtOUowXgJlcuQm8/DvwK6flPXdxxHnmIpg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MalHXXQs3aFzKVpI/MDdJAfVIc/7sxtc/IDOrA5ByOJ0QAtDVFmNLUc56FlfddlyOzCeUTiaIp3EssM2hLYoto+7wRyf/yrR3/OJczw7+0fuhSFWhuPiHq5C9fZCvLSRZDVJdfL9TLnWsq2IbEaYkOA3NBK137vhDk83lV59kQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JRuPMlvh; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JRuPMlvh"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86917d18880so2927557b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790666418; x=1791271218; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWPIKm0R00qZrqpqFbbPuyKWkI2RzsxoZ6cWRG3D+E8=;
        b=JRuPMlvhlpL1vBpGH2kVi/JOck74NHNA7xGLS0R4KtgezCb13I/uWUE3GVs815ZTjl
         krL/BDePb3coLgZvoHBAVNRK5pvoOzb9nK+sUb6NA6GAZwIrNxcCo9qIx/IW1Twk84Ec
         oseixeucGKPBdoVm8PYS7JVgBYLruXGazgCGMfsIfhA2obGiT+VYd59F1rSKVvoN5z8s
         YZpLn4KFjcB6onF+hEtTS5PtWIu6eg+xHyHXIMpdzZu5EKCfG2pA+zT9vc95yYH9TD3B
         MbK4omQfcqR0P6BzpiJNAPQ7t6GVhy11b0ebtnM0MpW/3ksCORJv36BjqtD2A5r6nZL6
         bdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666418; x=1791271218;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWPIKm0R00qZrqpqFbbPuyKWkI2RzsxoZ6cWRG3D+E8=;
        b=SLCkVi60VbQ9xQ1JkWeYSGKAFhSXs4si5fM2qFBFlOKKMucRrYqNIcyW4vGzbFTW67
         EC5a3JM0tazvdUiT/0Q40nwmjBq8z+1kwdWaltu2P4LV+NwQcrmF1rSRRVyJKbBC8EIg
         3XJSgqefgw4qSPT953zVk8SBjkNV38Swmv1wDKFAyirLq3r3lV+b3zy9clsx8ioBbbu7
         rFCsN4uB9TzQ0Naf8StD6nFprVCpIsPXlZ+4EEtVo7hzGSW9iNrT8z1RRX3Xsxx8jUZO
         i5enl+pCTq/0KEMHtCD0b2qlsWtFt6Qw9XN5Y5OnjYvlEoASi4VrisYP5jGlV18kKUjY
         xD+w==
X-Forwarded-Encrypted: i=1; AKwUvBysNo7MFZIqnCeQC8kybLESjiB15H1Nw9PGLgPLW0ZAbMcLYHOsMIpadlLSRi28mFqDyWBseQUTj5MA6Js=@vger.kernel.org
X-Gm-Message-State: AFuF++m+i2GLhQsYblHtUiOkxU4HZMs6AtkAhf8S8bGvxF8m8Viv+DyK
	4fC1DyC06TIbzMGtuKLMium18CAF6NMac+llm4z8rK0b6gdxdxu4gIeK9ERGrFDcNGslhbM6+D7
	d
X-Received: from pfri23.prod.google.com ([2002:aa7:8d97:0:b0:880:ce97:3519])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4fce:b0:884:db57:2d5c
 with SMTP id d2e1a72fcca58-884db575d22mr2732742b3a.41.1790666417974; Tue, 29
 Sep 2026 00:20:17 -0700 (PDT)
Date: Tue, 29 Sep 2026 07:20:16 +0000
In-Reply-To: <20260929010031.2186255-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929010031.2186255-1-morbo@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929072016.2360806-1-morbo@google.com>
Subject: [PATCH v3] fortify: add KUnit tests for __counted_by and __counted_by_ptr
From: Bill Wendling <morbo@google.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, thomas.weissschuh@linutronix.de, 
	Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

The '__counted_by' and '__counted_by_ptr' attributes associate a
flexible array member or pointer member with a struct field that holds
its element count. Supporting compilers use these annotations to
compute dynamic object sizes via '__builtin_dynamic_object_size()' for
runtime bounds checking with CONFIG_FORTIFY_SOURCE.

Add KUnit tests ('fortify_test_counted_by_flex' and
'fortify_test_counted_by_ptr', guarded by CONFIG_CC_HAS_COUNTED_BY and
CONFIG_CC_HAS_COUNTED_BY_PTR respectively) to verify that:

 - '__builtin_dynamic_object_size()', if available, returns the expected
   logical byte size for annotated flexible array and pointer members.
 - Fortified operations ('memset()' and 'memchr()') succeed within the
   logical bounds and detect out-of-bounds read and write accesses
   beyond the annotated count.

Allocate the test buffers with extra physical capacity (2 * size) in
'noinline' helpers and hide the returned pointers with
OPTIMIZER_HIDE_VAR() so allocation-size attributes, physical slab
bounds, and compiler optimizations do not mask the '__counted_by' and
'__counted_by_ptr' checks.

Signed-off-by: Bill Wendling <morbo@google.com>
---
v3: - Use "IS_ENABLED(CONFIG...)" instead of "#ifdefs". It's a lot cleaner
      and documents better when skipped.
    - Use "kunit_kzalloc" and "struct_size" for the flexible array member.
    - Use KUNIT_EXPECT_BDOS which skips the test if BDOS isn't available.
v2: - Move tests to the 'fortify' KUnit tests. It uses UBSAN, which is
      what gets triggered by 'counted_by'.
---
 lib/tests/fortify_kunit.c | 114 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/lib/tests/fortify_kunit.c b/lib/tests/fortify_kunit.c
index 413cdbf3dc0d..8baf6dc96bab 100644
--- a/lib/tests/fortify_kunit.c
+++ b/lib/tests/fortify_kunit.c
@@ -1011,6 +1011,118 @@ static void fortify_test_kmemdup(struct kunit *test)
 	kfree(copy);
 }
 
+struct counted_by_flex_struct {
+	size_t size;
+	int array[] __counted_by(size);
+};
+
+/*
+ * Allocate the struct out-of-line with extra physical capacity so that
+ * __alloc_size() and physical slab bounds do not mask the __counted_by()
+ * logical bounds check.
+ */
+static noinline struct counted_by_flex_struct *
+alloc_counted_by_flex_struct(struct kunit *test, size_t size)
+{
+	struct counted_by_flex_struct *s;
+
+	s = kunit_kzalloc(test, struct_size(s, array, 2 * size), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, s);
+
+	/* Intentionally fake the size so that we can trigger a trap. */
+	s->size = size;
+	return s;
+}
+
+static void fortify_test_counted_by_flex(struct kunit *test)
+{
+	size_t size = 128;
+	struct counted_by_flex_struct *s;
+	size_t elem_bytes = size * sizeof(s->array[0]);
+
+	if (!IS_ENABLED(CONFIG_CC_HAS_COUNTED_BY))
+		kunit_skip(test, "requires CONFIG_CC_HAS_COUNTED_BY");
+
+	s = alloc_counted_by_flex_struct(test, size);
+
+	OPTIMIZER_HIDE_VAR(s);
+	OPTIMIZER_HIDE_VAR(elem_bytes);
+
+	/* __builtin_dynamic_object_size() should return the logical length. */
+	KUNIT_EXPECT_BDOS(test, s->array, elem_bytes,
+			  "struct counted_by_flex_struct");
+
+	/* Within-bounds write and read succeed. */
+	memset(s->array, 0x42, elem_bytes);
+	KUNIT_EXPECT_EQ(test, fortify_write_overflows, 0);
+	KUNIT_EXPECT_NOT_NULL(test, memchr(s->array, 0x42, elem_bytes));
+	KUNIT_EXPECT_EQ(test, fortify_read_overflows, 0);
+
+	/* Out-of-bounds write and read past logical size are caught. */
+	memset(s->array, 0x42, elem_bytes + 1);
+	KUNIT_EXPECT_EQ(test, fortify_write_overflows, 1);
+	KUNIT_EXPECT_NULL(test, memchr(s->array, 0x42, elem_bytes + 1));
+	KUNIT_EXPECT_EQ(test, fortify_read_overflows, 1);
+}
+
+struct counted_by_ptr_struct {
+	char *ptr __counted_by_ptr(size);
+	size_t size;
+};
+
+/*
+ * Allocate the struct out-of-line with extra physical capacity so that
+ * __alloc_size() and physical slab bounds do not mask the __counted_by_ptr()
+ * logical bounds check.
+ */
+static noinline struct counted_by_ptr_struct *
+alloc_counted_by_ptr_struct(struct kunit *test, size_t size)
+{
+	struct counted_by_ptr_struct *s;
+
+	s = kmalloc_obj(struct counted_by_ptr_struct);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, s);
+
+	/* Intentionally fake the size so that we can trigger a trap. */
+	s->size = size;
+	s->ptr = kzalloc(2 * size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, s->ptr);
+
+	return s;
+}
+
+static void fortify_test_counted_by_ptr(struct kunit *test)
+{
+	size_t size = 128;
+	struct counted_by_ptr_struct *s;
+
+	if (!IS_ENABLED(CONFIG_CC_HAS_COUNTED_BY_PTR))
+		kunit_skip(test, "requires CONFIG_CC_HAS_COUNTED_BY_PTR");
+
+	s = alloc_counted_by_ptr_struct(test, size);
+
+	OPTIMIZER_HIDE_VAR(s);
+	OPTIMIZER_HIDE_VAR(size);
+
+	/* __builtin_dynamic_object_size() should return the logical length. */
+	KUNIT_EXPECT_BDOS(test, s->ptr, size, "struct counted_by_ptr_struct");
+
+	/* Within-bounds write and read succeed. */
+	memset(s->ptr, 0x42, size);
+	KUNIT_EXPECT_EQ(test, fortify_write_overflows, 0);
+	KUNIT_EXPECT_NOT_NULL(test, memchr(s->ptr, 0x42, size));
+	KUNIT_EXPECT_EQ(test, fortify_read_overflows, 0);
+
+	/* Out-of-bounds write and read past logical size are caught. */
+	memset(s->ptr, 0x42, size + 1);
+	KUNIT_EXPECT_EQ(test, fortify_write_overflows, 1);
+	KUNIT_EXPECT_NULL(test, memchr(s->ptr, 0x42, size + 1));
+	KUNIT_EXPECT_EQ(test, fortify_read_overflows, 1);
+
+	kfree(s->ptr);
+	kfree(s);
+}
+
 static int fortify_test_init(struct kunit *test)
 {
 	if (!IS_ENABLED(CONFIG_FORTIFY_SOURCE))
@@ -1054,6 +1166,8 @@ static struct kunit_case fortify_test_cases[] = {
 	KUNIT_CASE(fortify_test_memchr_inv),
 	KUNIT_CASE(fortify_test_memcmp),
 	KUNIT_CASE(fortify_test_kmemdup),
+	KUNIT_CASE(fortify_test_counted_by_flex),
+	KUNIT_CASE(fortify_test_counted_by_ptr),
 	{}
 };
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

