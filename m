Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2C955D898
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873246; cv=none; b=fFECSdKqP9l74IGHS11D0wbGJsz7PF2GVgoXzMK10ThUqOMWS++OcNLohu6Gh+M4JHU+An6WLXhuBAm6p5c0R98Va2VleXse6SUSs05vyxR/DibUjDI0wIIWeguJR7gLUnAlGKvsQ6rwiIbqcY3hrP6gkfBsOexpCSkFqmakg50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873246; c=relaxed/simple;
	bh=JuqB+ahMRY2MYOuYVspkxDoewP+Aj8jfvUSogE3zVcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VTotrQ6/5332Hmzl7iahtgNLyhceZLsTIhl2iDOuwWTvnO24w40McrWtkoVFnmTNeXkHS/9N1VHjOa0a9weedjcLeRqautkQo9lx+fWfL9+f58HvkqzMRSLcg49/a+MrU6VnTOwhCpjvzzr4igFZ+M4ip8xfvPxXdbWcr/ruOXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3LBq1ei; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3LBq1ei"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c250c6a6a9aso762630966b.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788873234; x=1789478034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bplnJXOhH88sJS1R74ulrkJBYzyAx2Jvgtke5umuzc4=;
        b=o3LBq1eiG5PQ614QfGkuZkc7jVO1smW9WY8GjWkMO1Rr6nLSFrf8eoD4zvWa2j/iwc
         6Aj9PinHMW5b5JqlBEBvulT20/3Mr1Ka9r9QgY5z4uzsRCsaoupG9WWuTyCylGWSp7XR
         Vjsi+elMk3++gMEbr4Qqom/RLVebp0ktpWHtIGgYrdxqYvhI5hKFRf9TCenw2/fnqBmL
         ioDGx7EJh56q4zHw35XtbA7aFH3VJYtieyVt687F8y/GOnvP4sgT48yWUs0C59q9sP6Q
         MdPBkKZAb1wUiFa7ZRHKJ1Rux288wwTm/JZzswYkzUbYYWCGB2I/va9XkFpy3Lp1iaC8
         S3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873234; x=1789478034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bplnJXOhH88sJS1R74ulrkJBYzyAx2Jvgtke5umuzc4=;
        b=kvN6S2RWPF+jLeUBCRjmjLijGHaY0ee0biveTA/s5U2apJVahTQKWRFmXVpjRGqWOO
         lxOYaWTc0HTyz0l1WNOYOlk2IKJJPPbiX4kXEzv3+3kZc4BtKQ6ZyvYY48UZuMHSSPrT
         HRejRUamHP7OY+F/gthnrI+3Ses9LSQU32jWcEX4JOwqxyCEWgeADYDtOtUonjx2YYQg
         IJi3+udWrIsQBKVpKUVBITX3b5JT3M/FUoiNpNDyU97kqlJ+GqwLBLD4iJqOu5nL9zOK
         /bn2hDcT+3xYJYY6R0HkHo96Afg6QB9XagGdOMD7u+VRjWlOoUG0kySibQ2/3E1qPzRY
         OJVA==
X-Forwarded-Encrypted: i=1; AKwUvByJR40fNdPI2tzEN1Y9NcMS6RvPBQZbRBW7iG8oZVhQiPCu5mM3ACM6IPPHQWs8wdVXdOhylJ2QPPGJRRM=@vger.kernel.org
X-Gm-Message-State: AFuF++lreoVTqSNnrA2jJ9aiyitWsbuhx/UGGAdg50eqKrmZeKhpfsXc
	BRPaEYod/d8WsPaXHnnw7j+D4lJNG3Oxdw6J43GzO4g8YxxRAYcB2qqq
X-Gm-Gg: AYBFou1dUpk9g9bP43ewn/YUpbQ1h4F/CRY3YLETkaVsVphk2T8vINBTCnTrSStV7mm
	08wmKthlHaoMopPVb9CFJX/ePpnv9/re+IHEoBOXLlslomOqT9xkBQHp0dhxQA4LkZkSzeUbnbP
	KPEGZjJwJ0XfgIdeMfc64EVDLk91XGEFXUPxsbcJI386LnBC5yVRu6UBq0BOzIHKKkq5F6Ufa2p
	1tjFGKAbe4tFa4J3Bg016ksB+nv60fejpoh84TlBFrTcjoLfXuYlnN1s8TjDZNV4MzQNCMgbDy7
	DKplcZQv+50cSsWkRIVxQjuaN6zuuTMbIT2vv0zfhtLP4hmJPDiuONZmnS/0KDx9FaSnnq6+4EH
	ODWXQKMVmjNqGivrp4GvOxaOLib4zUIrHHziGktHO0usNf0jKpOeXesUCCXF/wVJSVqKHWZtXuf
	bOD5qUlrdIy0lff3jkhunfTDFDAGu7iphOLQN9QMNo+wsvAufXRA==
X-Received: by 2002:a17:907:c50e:b0:c25:6c9a:88bc with SMTP id a640c23a62f3a-c260cc0e2a2mr2114388166b.19.1788873233857;
        Tue, 08 Sep 2026 06:13:53 -0700 (PDT)
Received: from [127.0.0.1] ([2a09:bac6:37a9:1e5a::306:1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6e1c93sm625170866b.63.2026.09.08.06.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:13:53 -0700 (PDT)
From: Caleb Kan <calebkan1106@gmail.com>
Date: Tue, 08 Sep 2026 14:13:36 +0100
Subject: [PATCH RFC v2 03/11] mm/page_owner: preserve accounting with
 countable stack depot records
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-stackdepot-trie-v2-3-1996d5cef732@cloudflare.com>
References: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
In-Reply-To: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, Vlastimil Babka <vbabka@kernel.org>, 
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Oscar Salvador <osalvador@suse.de>, Caleb Kan <ckan@cloudflare.com>, 
 kernel-team@cloudflare.com
X-Mailer: b4 0.16.0

From: Caleb Kan <ckan@cloudflare.com>

page_owner keeps stable struct stack_record pointers in its stack list.
It uses each record's count with a one-count bias to track live base pages
and reads the stored entries directly. A later patch adds a trie backend,
which provides neither a flat record layout nor an independent count field.

Add STACK_DEPOT_FLAG_COUNTABLE to keep these records on the hash backend
and deduplicate them separately from all non-countable records. Store the
discriminator in a new u16 flags field and narrow size to u16. This keeps
the record header size unchanged while covering the configured maximum of
256 frames. Do not otherwise split hash-table deduplication: ordinary and
GET saves can continue to share records. Make COUNTABLE mutually exclusive
with GET because the two flags assign incompatible meanings to the record
count. Reject countable records in stack_depot_put() and require COUNTABLE
in __stack_depot_get_stack_record().

Mark both page_owner save sites countable so its existing accounting and
reporting continue to use stable hash records. Extend the KUnit coverage to
verify direct-record access and isolation between countable and
non-countable records.

Signed-off-by: Caleb Kan <ckan@cloudflare.com>
---
 include/linux/stackdepot.h   | 28 +++++++++++++++-------
 lib/Kconfig.debug            |  3 ++-
 lib/stackdepot.c             | 20 +++++++++++++++-
 lib/tests/stackdepot_kunit.c | 55 ++++++++++++++++++++++++++++++++++++++++++++
 mm/page_owner.c              |  6 +++--
 5 files changed, 100 insertions(+), 12 deletions(-)

diff --git a/include/linux/stackdepot.h b/include/linux/stackdepot.h
index 734529767c8a..7ff67c70d727 100644
--- a/include/linux/stackdepot.h
+++ b/include/linux/stackdepot.h
@@ -53,7 +53,8 @@ union handle_parts {
 struct stack_record {
 	struct list_head hash_list;	/* Links in the hash table */
 	u32 hash;			/* Hash in hash table */
-	u32 size;			/* Number of stored frames */
+	u16 size;			/* Number of stored frames */
+	u16 flags;
 	union handle_parts handle;	/* Constant after initialization */
 	refcount_t count;
 	union {
@@ -84,8 +85,9 @@ typedef u32 depot_flags_t;
  */
 #define STACK_DEPOT_FLAG_CAN_ALLOC	((depot_flags_t)0x0001)
 #define STACK_DEPOT_FLAG_GET		((depot_flags_t)0x0002)
+#define STACK_DEPOT_FLAG_COUNTABLE	((depot_flags_t)0x0004)
 
-#define STACK_DEPOT_FLAGS_NUM	2
+#define STACK_DEPOT_FLAGS_NUM	3
 #define STACK_DEPOT_FLAGS_MASK	((depot_flags_t)((1 << STACK_DEPOT_FLAGS_NUM) - 1))
 
 /*
@@ -144,6 +146,11 @@ static inline int stack_depot_early_init(void)	{ return 0; }
  * Users of this flag must also call stack_depot_put() when keeping the stack
  * trace is no longer required to avoid overflowing the refcount.
  *
+ * If STACK_DEPOT_FLAG_COUNTABLE is set in @depot_flags, stack depot stores the
+ * stack in hash-backed storage for callers that need direct stack_record count
+ * access. This flag does not imply %STACK_DEPOT_FLAG_CAN_ALLOC and is mutually
+ * exclusive with %STACK_DEPOT_FLAG_GET.
+ *
  * If the provided stack trace comes from the interrupt context, only the part
  * up to the interrupt entry is saved.
  *
@@ -178,11 +185,12 @@ depot_stack_handle_t stack_depot_save(unsigned long *entries,
 				      unsigned int nr_entries, gfp_t alloc_flags);
 
 /**
- * __stack_depot_get_stack_record - Get a pointer to a stack_record struct
+ * __stack_depot_get_stack_record - Get a hash-backed stack record
  *
  * @handle: Stack depot handle
  *
- * This function is only for internal purposes.
+ * This function is only for internal purposes. @handle must have been saved
+ * with %STACK_DEPOT_FLAG_COUNTABLE.
  *
  * Return: Returns a pointer to a stack_record struct
  */
@@ -260,10 +268,14 @@ int stack_depot_snprint(depot_stack_handle_t handle, char *buf, size_t size,
  *
  * @handle:	Stack depot handle returned from stack_depot_save()
  *
- * The stack trace is evicted from stack depot once all references to it have
- * been dropped (once the number of stack_depot_evict() calls matches the
- * number of stack_depot_save_flags() calls with STACK_DEPOT_FLAG_GET set for
- * this stack trace).
+ * Drop a reference acquired by stack_depot_save_flags() with
+ * %STACK_DEPOT_FLAG_GET. Calling this for a handle saved without
+ * %STACK_DEPOT_FLAG_GET is invalid; persistent handles are owned by stack depot
+ * for the lifetime of the system.
+ *
+ * The stack trace is evicted once the number of stack_depot_put() calls matches
+ * the number of successful stack_depot_save_flags() calls with
+ * %STACK_DEPOT_FLAG_GET for this stack trace.
  */
 void stack_depot_put(depot_stack_handle_t handle);
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index fcd74edfd93a..3a78c67b6b36 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2792,7 +2792,8 @@ config STACKDEPOT_KUNIT_TEST
 	default KUNIT_ALL_TESTS
 	help
 	  Enable this option to test stack depot API behavior at boot.
-	  This test is built in, so KUNIT must also be built in.
+	  This test is built in because it exercises internal, non-exported
+	  stack depot helpers, so KUNIT must also be built in.
 
 	  KUnit tests run during boot and output the results to the debug log
 	  in TAP format (https://testanything.org/). Only useful for kernel
diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index 4da7279d9f83..66c5e8594566 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -94,6 +94,7 @@ static const char *const counter_names[] = {
 	[DEPOT_COUNTER_PERSIST_BYTES]	= "persistent_bytes",
 };
 static_assert(ARRAY_SIZE(counter_names) == DEPOT_COUNTER_COUNT);
+static_assert(CONFIG_STACKDEPOT_MAX_FRAMES <= U16_MAX);
 
 static int __init disable_stack_depot(char *str)
 {
@@ -467,6 +468,7 @@ depot_alloc_stack(unsigned long *entries, unsigned int nr_entries, u32 hash, dep
 	/* Save the stack trace. */
 	stack->hash = hash;
 	stack->size = nr_entries;
+	stack->flags = flags & STACK_DEPOT_FLAG_COUNTABLE;
 	/* stack->handle is already filled in by depot_pop_free_pool(). */
 	memcpy(stack->entries, entries, flex_array_size(stack, entries, nr_entries));
 
@@ -609,6 +611,9 @@ static inline struct stack_record *find_stack(struct list_head *bucket,
 	list_for_each_entry_rcu(stack, bucket, hash_list) {
 		if (stack->hash != hash || stack->size != size)
 			continue;
+		/* Page owner countable records have a distinct count lifetime. */
+		if ((stack->flags ^ flags) & STACK_DEPOT_FLAG_COUNTABLE)
+			continue;
 
 		/*
 		 * This may race with depot_free_stack() accessing the freelist
@@ -655,6 +660,9 @@ depot_stack_handle_t stack_depot_save_flags(unsigned long *entries,
 
 	if (WARN_ON(depot_flags & ~STACK_DEPOT_FLAGS_MASK))
 		return 0;
+	if (WARN_ON_ONCE((depot_flags & STACK_DEPOT_FLAG_GET) &&
+			 (depot_flags & STACK_DEPOT_FLAG_COUNTABLE)))
+		return 0;
 
 	/*
 	 * If this stack trace is from an interrupt, including anything before
@@ -751,10 +759,18 @@ EXPORT_SYMBOL_GPL(stack_depot_save);
 
 struct stack_record *__stack_depot_get_stack_record(depot_stack_handle_t handle)
 {
+	struct stack_record *stack;
+
 	if (!handle)
 		return NULL;
 
-	return depot_fetch_stack(handle);
+	stack = depot_fetch_stack(handle);
+	if (!stack)
+		return NULL;
+	if (WARN_ON_ONCE(!(stack->flags & STACK_DEPOT_FLAG_COUNTABLE)))
+		return NULL;
+
+	return stack;
 }
 
 unsigned int stack_depot_fetch(depot_stack_handle_t handle,
@@ -828,6 +844,8 @@ void stack_depot_put(depot_stack_handle_t handle)
 	if (WARN(!stack, "corrupt handle or unbalanced stack_depot_put()"))
 		return;
 
+	if (WARN_ON_ONCE(stack->flags & STACK_DEPOT_FLAG_COUNTABLE))
+		return;
 	if (refcount_dec_and_test(&stack->count))
 		depot_free_stack(stack);
 }
diff --git a/lib/tests/stackdepot_kunit.c b/lib/tests/stackdepot_kunit.c
index b0c44c096976..3c526791ef93 100644
--- a/lib/tests/stackdepot_kunit.c
+++ b/lib/tests/stackdepot_kunit.c
@@ -6,6 +6,60 @@
 #include <linux/stackdepot.h>
 #include <linux/string.h>
 
+static void stackdepot_countable_public(struct kunit *test)
+{
+	unsigned long plain_entries[] = {
+		0x141000UL,
+		0x142000UL,
+		0x143000UL,
+	};
+	unsigned long get_entries[] = {
+		0x151000UL,
+		0x152000UL,
+		0x153000UL,
+	};
+	unsigned long fetched[ARRAY_SIZE(plain_entries)] = {};
+	depot_flags_t countable = STACK_DEPOT_FLAG_CAN_ALLOC |
+				  STACK_DEPOT_FLAG_COUNTABLE;
+	struct stack_record *record;
+	depot_stack_handle_t count_handle;
+	depot_stack_handle_t plain_handle;
+	depot_stack_handle_t get_handle;
+	unsigned int get_nr = ARRAY_SIZE(get_entries);
+	unsigned int plain_nr = ARRAY_SIZE(plain_entries);
+	unsigned int nr_entries;
+
+	KUNIT_ASSERT_EQ(test, stack_depot_init(), 0);
+
+	plain_handle = stack_depot_save(plain_entries, plain_nr, GFP_KERNEL);
+	KUNIT_ASSERT_NE(test, plain_handle, (depot_stack_handle_t)0);
+	count_handle = stack_depot_save_flags(plain_entries, plain_nr, GFP_KERNEL,
+					      countable);
+	KUNIT_ASSERT_NE(test, count_handle, (depot_stack_handle_t)0);
+	record = __stack_depot_get_stack_record(count_handle);
+	KUNIT_ASSERT_NOT_NULL(test, record);
+	KUNIT_EXPECT_EQ(test, record->size, (u16)plain_nr);
+	KUNIT_EXPECT_MEMEQ(test, record->entries, plain_entries,
+			   sizeof(plain_entries));
+	nr_entries = stack_depot_fetch_into(count_handle, fetched,
+					    ARRAY_SIZE(fetched));
+	KUNIT_EXPECT_EQ(test, nr_entries, plain_nr);
+	KUNIT_EXPECT_MEMEQ(test, fetched, plain_entries, sizeof(plain_entries));
+
+	get_handle = stack_depot_save_flags(get_entries, get_nr, GFP_KERNEL,
+					    STACK_DEPOT_FLAG_CAN_ALLOC |
+					    STACK_DEPOT_FLAG_GET);
+	KUNIT_ASSERT_NE(test, get_handle, (depot_stack_handle_t)0);
+	count_handle = stack_depot_save_flags(get_entries, get_nr, GFP_KERNEL,
+					      countable);
+	KUNIT_ASSERT_NE(test, count_handle, (depot_stack_handle_t)0);
+	record = __stack_depot_get_stack_record(count_handle);
+	KUNIT_ASSERT_NOT_NULL(test, record);
+	KUNIT_EXPECT_MEMEQ(test, record->entries, get_entries, sizeof(get_entries));
+
+	stack_depot_put(get_handle);
+}
+
 static void stackdepot_fetch_into_roundtrip(struct kunit *test)
 {
 	unsigned long entries[] = {
@@ -72,6 +126,7 @@ static void stackdepot_fetch_into_rejects_missing_or_short_stack(struct kunit *t
 }
 
 static struct kunit_case stackdepot_test_cases[] = {
+	KUNIT_CASE(stackdepot_countable_public),
 	KUNIT_CASE(stackdepot_fetch_into_roundtrip),
 	KUNIT_CASE(stackdepot_fetch_into_rejects_missing_or_short_stack),
 	{}
diff --git a/mm/page_owner.c b/mm/page_owner.c
index cfc31c92d765..1fb1998bc129 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -119,7 +119,8 @@ static __always_inline depot_stack_handle_t create_dummy_stack(void)
 	unsigned int nr_entries;
 
 	nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 0);
-	return stack_depot_save(entries, nr_entries, GFP_KERNEL);
+	return stack_depot_save_flags(entries, nr_entries, GFP_KERNEL,
+				       STACK_DEPOT_FLAG_CAN_ALLOC | STACK_DEPOT_FLAG_COUNTABLE);
 }
 
 static noinline void register_dummy_stack(void)
@@ -181,7 +182,8 @@ static noinline depot_stack_handle_t save_stack(gfp_t flags)
 
 	set_current_in_page_owner();
 	nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 2);
-	handle = stack_depot_save(entries, nr_entries, flags);
+	handle = stack_depot_save_flags(entries, nr_entries, flags,
+					STACK_DEPOT_FLAG_CAN_ALLOC | STACK_DEPOT_FLAG_COUNTABLE);
 	if (!handle)
 		handle = failure_handle;
 	unset_current_in_page_owner();

-- 
Git-155)

