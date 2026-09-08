Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D74D559CBC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873249; cv=none; b=th/IM890PIPWYjTR3HKXrHpRXSvZtkaSV7CU3xBx0HtzReGS63kEz6rcV4Zib+kPzUzrL1JkmiAu52FiEwkc61hunHMb5BF75rHg6m/jrbKcclEO+1mGPbiBM3AFyT6vbL/grPVV6/F0pcxsvfqK1fJh2gRAUCvPHd+M0KJn3Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873249; c=relaxed/simple;
	bh=HpBFvtYbBbaBVYOSmjDeMZxcswzVX3gJi0+gdtI6+cQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lAXl7oPCf8C9TPwJhO/R7p55XbmKotbmue3jpE7Ye0r5Mt+yik0o5rQwKIEdOPhA2yyNeIwF3xK3v9hOLb2E+9Xex0pSqc/8/gVxh5DUV36ew+KUxUWRNQrOK1S0ZgtvSpM3NvwpU/iGq/GJoVBSzbTZrK7Fsx9jXi8JZcCW8uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ip9j/d4z; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ip9j/d4z"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591bb18so826714a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788873236; x=1789478036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YxLP4rXMEUOlBTXUJ41qDJ2wD0esY5E0fZn3mGsmNX4=;
        b=ip9j/d4zThDzG/NtkhbEw4JpmAFe+neYygMTqDPaXP34kR1R2mNR+t7CppypNEGdM9
         o+cbb1wNIljgIM6kvxsrjuOaGyToON6LpwDtMVlUBgIzDLVMxiWoknQvGj5jKcb6qrnK
         45k79ObgE5Qn3OqUwJDUTTwYIYKTP4epHwGYTZYaVs6k2v7tY2lVtEyqeWZJzG+KrhhC
         P1t750zh9vQkQ6mLxU5r0XATpga8EID+490++RG27SvHWrph1wG5Zcv6Urs9GiZlXb3b
         4zKsJORDCAnqJPu78MdS3PkM0RoySN+IzQymTC2uCv1Wx52lfgtE3MANpKNfQnyT4Lge
         ZTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873236; x=1789478036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YxLP4rXMEUOlBTXUJ41qDJ2wD0esY5E0fZn3mGsmNX4=;
        b=kUSy5zd8f4L4d7eBud/WpWdUzrAxCY/OqMnFV7urqXxOvJuov8hoSbbqzBofykaJJJ
         E6xjskM2kedp08U10mKuDR8oWLWH+j1P2IznZ0YQbbp51owVqgqBjCOzD+I1ECNfgWeK
         khQKjXpk6kgDj80F3tDZ24rR4hZyG2dizmDpqFyNjaXUDblSH+XQpYFrkDliGMVSm8FL
         PIHRwlaxJ2e5ZKybJ4VSe+q1iaaKgMvCjM+36ds9Ous20NlgRM+byUG8N/Myi7PrnUu2
         S6oHQw7ghLrY+sqkDvPY1IkvTA5HH71njZDBGzSXDVJAMRmH6Jsp/KrpSMa9D3niUrQl
         lVDg==
X-Forwarded-Encrypted: i=1; AKwUvByzVTvys/OMI0QBtlUetcKPvHX028jFTpCloeShih10ZH2yGcQU0HYoOxH8gSBemuMuyUGrJ6ywoqcOXao=@vger.kernel.org
X-Gm-Message-State: AFuF++m2C69j9+g6wCmlGGJrC6O5+MN8VV1CWNQw42Tqtef1Ucxv0rhm
	gBTOT3j7so6yXK2t4+MtzfVaYRz8TFGwe/v61xF848MLaScKsJu/LI2n
X-Gm-Gg: AYBFou12f4mAF2N2DT7FT6bi39flLkc3pKJoDwPg3KYtXT5sy9cuiIQH2Bti0a7r4w4
	0gEevuQILQM8WJIknVVirxSb1N5D2+dH7hX6Do+iiaD5h/Ok0kOM9muPQSOtptbacJvyemtUfDh
	UMQVdnsND7Lacmo/9jT+/Ze+hywBExgc+J6Se7bJgj+Khl/PxCe+NL7ah7tsNeZapiZ8XxDKKAQ
	SIgGgPt+SSCs3Tm/rE1D90oAcLa0I3Qc248Qh7EVKSf5MKEr8EXAdV1TmgOwNUQ8aioYjJ1Nd2y
	rsDSmdoZd9Gslr3SS47w9JvU8tE9YVwYkp6jdF6Dcfn+oMiS0Wl82XxqwrAPbymiGrwEFyt/C6N
	S3ax3YyqoQN80VqrTuLjknXOIcgBxqa6h6+FAT73kgj5vG7DRHeuEJeehWXH+POVEQO69GLYYri
	/zZbPO7C35XWqy2Js/Q0bzlKjp2//bc1Zr2lBNbrTgeEEVIkg67vDy4SW+8OMD
X-Received: by 2002:a17:907:3f09:b0:c25:f7db:4bea with SMTP id a640c23a62f3a-c290446b88cmr319041366b.16.1788873235525;
        Tue, 08 Sep 2026 06:13:55 -0700 (PDT)
Received: from [127.0.0.1] ([2a09:bac6:37a9:1e5a::306:1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6e1c93sm625170866b.63.2026.09.08.06.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:13:55 -0700 (PDT)
From: Caleb Kan <calebkan1106@gmail.com>
Date: Tue, 08 Sep 2026 14:13:38 +0100
Subject: [PATCH RFC v2 05/11] kmsan: report trie-backed stack depot traces
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-stackdepot-trie-v2-5-1996d5cef732@cloudflare.com>
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

KMSAN stores ordinary origin stacks and synthetic alloca and chain origins
in stack depot and retains the resulting persistent handles. Once trie
storage is enabled, these handles can refer to trie-backed entries, while
kmsan_print_origin() still relies on the hash-only stack_depot_fetch() API.

Use one KMSAN_STACK_DEPTH array to materialize each origin and chained
stack in turn. Preserve the chain's head and next-origin handles before
reusing the array for the chained stack. The array covers both the regular
save limit and the smaller synthetic records.

Pass the scratch array into a common origin-printing helper. Keep local
storage for standalone kmsan_print_origin() calls, but let kmsan_report()
reuse its existing stack_entries array after printing the report stack.
With x86-64 Clang 19, the regular nested report path uses 752 bytes, below
its 768-byte size before this conversion.

lib/stackdepot.c is uninstrumented, so stack_depot_fetch_into() unpoisons
the successfully copied range before returning it to KMSAN. Remove the
now-redundant explicit unpoisoning of chained entries. Origin depth and
use-after-free metadata remain in the handle's extra bits and are
unchanged.

Update test_stackdepot_roundtrip() to use caller-owned storage while
retaining its frame-count and kmsan_check_memory() checks. This verifies
that the copy-out API returns initialized entries to instrumented callers.

Signed-off-by: Caleb Kan <ckan@cloudflare.com>
---
 mm/kmsan/kmsan_test.c |  4 ++--
 mm/kmsan/report.c     | 28 ++++++++++++++++------------
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/mm/kmsan/kmsan_test.c b/mm/kmsan/kmsan_test.c
index 31f47cc4dab4..7c04e4b21873 100644
--- a/mm/kmsan/kmsan_test.c
+++ b/mm/kmsan/kmsan_test.c
@@ -669,7 +669,7 @@ static void test_long_origin_chain(struct kunit *test)
  */
 static void test_stackdepot_roundtrip(struct kunit *test)
 {
-	unsigned long src_entries[16], *dst_entries;
+	unsigned long src_entries[16], dst_entries[16];
 	unsigned int src_nentries, dst_nentries;
 	EXPECTATION_NO_REPORT(expect);
 	depot_stack_handle_t handle;
@@ -680,7 +680,7 @@ static void test_stackdepot_roundtrip(struct kunit *test)
 		stack_trace_save(src_entries, ARRAY_SIZE(src_entries), 1);
 	handle = stack_depot_save(src_entries, src_nentries, GFP_KERNEL);
 	stack_depot_print(handle);
-	dst_nentries = stack_depot_fetch(handle, &dst_entries);
+	dst_nentries = stack_depot_fetch_into(handle, dst_entries, ARRAY_SIZE(dst_entries));
 	KUNIT_EXPECT_TRUE(test, src_nentries == dst_nentries);
 
 	kmsan_check_memory((void *)dst_entries,
diff --git a/mm/kmsan/report.c b/mm/kmsan/report.c
index d6853ce08954..0770658ba932 100644
--- a/mm/kmsan/report.c
+++ b/mm/kmsan/report.c
@@ -83,9 +83,9 @@ static char *pretty_descr(char *descr)
 	return report_local_descr;
 }
 
-void kmsan_print_origin(depot_stack_handle_t origin)
+static void kmsan_print_origin_with_buf(depot_stack_handle_t origin,
+					unsigned long *entries)
 {
-	unsigned long *entries = NULL, *chained_entries = NULL;
 	unsigned int nr_entries, chained_nr_entries, skipnr;
 	void *pc1 = NULL, *pc2 = NULL;
 	depot_stack_handle_t head;
@@ -97,7 +97,8 @@ void kmsan_print_origin(depot_stack_handle_t origin)
 		return;
 
 	while (true) {
-		nr_entries = stack_depot_fetch(origin, &entries);
+		nr_entries =
+			stack_depot_fetch_into(origin, entries, KMSAN_STACK_DEPTH);
 		depth = kmsan_depth_from_eb(stack_depot_get_extra_bits(origin));
 		magic = nr_entries ? entries[0] : 0;
 		if ((nr_entries == 4) && (magic == KMSAN_ALLOCA_MAGIC_ORIGIN)) {
@@ -123,14 +124,10 @@ void kmsan_print_origin(depot_stack_handle_t origin)
 			origin = entries[2];
 			pr_err("Uninit was stored to memory at:\n");
 			chained_nr_entries =
-				stack_depot_fetch(head, &chained_entries);
-			kmsan_internal_unpoison_memory(
-				chained_entries,
-				chained_nr_entries * sizeof(*chained_entries),
-				/*checked*/ false);
-			skipnr = get_stack_skipnr(chained_entries,
-						  chained_nr_entries);
-			stack_trace_print(chained_entries + skipnr,
+				stack_depot_fetch_into(head, entries,
+						       KMSAN_STACK_DEPTH);
+			skipnr = get_stack_skipnr(entries, chained_nr_entries);
+			stack_trace_print(entries + skipnr,
 					  chained_nr_entries - skipnr, 0);
 			pr_err("\n");
 			continue;
@@ -147,6 +144,13 @@ void kmsan_print_origin(depot_stack_handle_t origin)
 	}
 }
 
+void kmsan_print_origin(depot_stack_handle_t origin)
+{
+	unsigned long entries[KMSAN_STACK_DEPTH];
+
+	kmsan_print_origin_with_buf(origin, entries);
+}
+
 void kmsan_report(depot_stack_handle_t origin, void *address, int size,
 		  int off_first, int off_last, const void __user *user_addr,
 		  enum kmsan_bug_reason reason)
@@ -193,7 +197,7 @@ void kmsan_report(depot_stack_handle_t origin, void *address, int size,
 			  0);
 	pr_err("\n");
 
-	kmsan_print_origin(origin);
+	kmsan_print_origin_with_buf(origin, stack_entries);
 
 	if (size) {
 		pr_err("\n");

-- 
Git-155)

