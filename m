Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD4728852E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790643636; cv=none; b=cl8HVNr/cYt6DFKwm8BDWMK6oG3kZXtOMkUnVUvIVVB7epJAULMhH1T9AvBFSF0t/aj0JL304fW5CyQYsbxUmwv2g7MRHA3ipIffk+rjWjQ4bVbevO/rKT8VAiWS7C2A/SeUmvM0tWY121P8WklgT10/+clLM4nRw9E7oEdvv5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790643636; c=relaxed/simple;
	bh=uCsNvbsq45/0kp+rSAwB5S9rjrPOYlh7Gy9FqBUx1dQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Md7NZlIgF5WJG4RstjTB6JMTDkfhs3FVEeOXWQgVkwlO/S8cfhJSU38iY02Fmt0DPZtYjEDBOQeTd+mWfnApmjISf5UVrH93aO2snUgwxkfzPjzradm4InXsK3Yi6DhhF1yJmzsKrrq2aDes7T3B/WXUUBn5qeeysSqlo+D0/kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lu0I9DZO; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lu0I9DZO"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a4a0017549so238987a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790643634; x=1791248434; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UISvcsFKvzVXeDB4zfTPatmPbuHHAhWug9QZEMeCtU8=;
        b=Lu0I9DZOZLHHNnlK4+uBcI6FORr40Xfo1AXe/v7M6H82WXW7Tj/0gRR9wAO2JdDFc7
         eF4cwVqDRNec8YKiJcy7RooIK4Ka2aKFVry+V8l9jYalSFNDbabUbD1ZF+pFJ24vEdJm
         t/2TX0tQcoSq0+lrXGK5hUoRI1v2R3/3yKTGoPEdnx3ijy0Zt2sH3TO+IOZbiMltE2Xf
         L03CTkVxzDZkFiI6wJZQQ5uP3bmgqwgEnajKCj/i19guwCFFPFhMwOL7Kti+pQ/otQCR
         0oiINXYJMZPoxO9Jf3yJcUekSjNDL7kJrbNCKwA53upnherQ/TGrAKBBTuH3woGwnin5
         /J9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790643634; x=1791248434;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UISvcsFKvzVXeDB4zfTPatmPbuHHAhWug9QZEMeCtU8=;
        b=1CAqIq9qWHvAVJaJBdfR6GJwIq7INhvytHLTXw3fCed+W+3hj7PrT3Qwredmvcs5gm
         BWDuNR5/bYVkuRu714IBHWjCk8X+DN2rJyaEGHDmKs+hPax/GG1mNJfQDkl7A0E18GDs
         J/miixG7P32C4iNjWHR8dgzny4g8YN+/lKNisQBrQo5UqYy6T+93jBKJ7t5LdEJ7LtMO
         kYOm3GdOOLf7tHbyJ3e6ZvsIvSTprUrjVnBfwxGl5ZFus/iNknFAHl89PzczVZtWnZEI
         l7PTvyCoEmiMx84oT084ash8J+97XZJO+wgBFN1jlyvMxGA5hmI4rkGZdhpI2DsRq8Au
         e5gA==
X-Forwarded-Encrypted: i=1; AKwUvBy5S6JBne5A5k/ZpCnoUJT3D6U6lQTtRqbgy2op82X6D9QvoQ4zbXE0nQBECVtDuNJvB/t2if6bdzY7NxI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdLGQMDURVUIRUVSzmV35lfS4WaqHCD+ju5r8kFAO1Zlmfo2+t
	GP7WeRiSmzVxs1N6gb2xGzXml3cbMQaa9YNkdJa4gHITOji4221UZ5UOgkp967RfoWyeeZ2KbGK
	T
X-Received: from pjbsp5.prod.google.com ([2002:a17:90b:52c5:b0:3a4:75db:9277])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4406:b0:39e:261:4e0d
 with SMTP id 98e67ed59e1d1-3a098b4b1a6mr13781108a91.25.1790643634205; Mon, 28
 Sep 2026 18:00:34 -0700 (PDT)
Date: Tue, 29 Sep 2026 01:00:31 +0000
In-Reply-To: <20260928231737.2092716-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260928231737.2092716-1-morbo@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929010031.2186255-1-morbo@google.com>
Subject: [PATCH] fortify: add KUnit tests for __counted_by and __counted_by_ptr
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

 - '__builtin_dynamic_object_size()' (both types 0 and 1) returns the
   expected logical byte size for annotated flexible array and pointer
   members.
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
v2: Move tests to the 'fortify' KUnit tests. It uses UBSAN, which is
    what gets triggered by 'counted_by'.
---
 lib/tests/fortify_kunit.c | 119 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/lib/tests/fortify_kunit.c b/lib/tests/fortify_kunit.c
index 413cdbf3dc0d..2335171f84d8 100644
--- a/lib/tests/fortify_kunit.c
+++ b/lib/tests/fortify_kunit.c
@@ -1011,6 +1011,119 @@ static void fortify_test_kmemdup(struct kunit *test)
 	kfree(copy);
 }
 
+#ifdef CONFIG_CC_HAS_COUNTED_BY
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
+	s = kzalloc(sizeof(*s) + 2 * size * sizeof(s->array[0]), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, s);
+
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
+	s = alloc_counted_by_flex_struct(test, size);
+
+	OPTIMIZER_HIDE_VAR(s);
+	OPTIMIZER_HIDE_VAR(elem_bytes);
+
+	/* __builtin_dynamic_object_size() should return the logical length. */
+	KUNIT_EXPECT_EQ(test, elem_bytes,
+			__builtin_dynamic_object_size(s->array, 0));
+	KUNIT_EXPECT_EQ(test, elem_bytes,
+			__builtin_dynamic_object_size(s->array, 1));
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
+
+	kfree(s);
+}
+
+#ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
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
+	s = alloc_counted_by_ptr_struct(test, size);
+
+	OPTIMIZER_HIDE_VAR(s);
+	OPTIMIZER_HIDE_VAR(size);
+
+	/* __builtin_dynamic_object_size() should return the logical length. */
+	KUNIT_EXPECT_EQ(test, size, __builtin_dynamic_object_size(s->ptr, 0));
+	KUNIT_EXPECT_EQ(test, size, __builtin_dynamic_object_size(s->ptr, 1));
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
+#endif /* CONFIG_CC_HAS_COUNTED_BY_PTR */
+#endif /* CONFIG_CC_HAS_COUNTED_BY */
+
 static int fortify_test_init(struct kunit *test)
 {
 	if (!IS_ENABLED(CONFIG_FORTIFY_SOURCE))
@@ -1054,6 +1167,12 @@ static struct kunit_case fortify_test_cases[] = {
 	KUNIT_CASE(fortify_test_memchr_inv),
 	KUNIT_CASE(fortify_test_memcmp),
 	KUNIT_CASE(fortify_test_kmemdup),
+#ifdef CONFIG_CC_HAS_COUNTED_BY
+	KUNIT_CASE(fortify_test_counted_by_flex),
+#ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
+	KUNIT_CASE(fortify_test_counted_by_ptr),
+#endif /* CONFIG_CC_HAS_COUNTED_BY_PTR */
+#endif /* CONFIG_CC_HAS_COUNTED_BY */
 	{}
 };
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

