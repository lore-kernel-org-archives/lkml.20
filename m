Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596233;
	b=AY+gNQaB0zT4HweVzchlhmWoSMGiT6eUWLM2feQcIPIC+UccqI+sFggrfir6k96eFfXj
	 PBBI0C6t/EoSoyBqSuvGoNNyhWZ3V6dawOMjLVyPs7p4Lja4CCB+LsfXvOOD7pEZThTxt
	 yHbNULYyiv2zPVodIz4lwl7tA5Qc0AIis0o9GTAtu5t1IDqxJo3P2lJYfcbhYfQjqBVuo
	 29/Kq12qJinwZC5nyCWZLTz/4FnY50raZfK204UXNxek/+4PI4X++HLd/6WkMKcK3SRmF
	 Q8MIPr3mWmGC2dipwBaQpqBnZjrl3wmgm369QDb1UOByAb6TyxjYM1gjpdm4D1VKcmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eMKilXOc8iF9aDdrmQW0L2QZLW9z0erSCAgXdVbBET0=;
	b=plN66aNEq9xepR35nf1k0SqKm1uCEbiI2Bz4cyfYu0U2iBNlJ/qvPhLsA1lFbxfk7ruV
	 X4ikH0+P+FQi45muNbJmh9N7COc+yhqSa7Fm7t4UvJp6urD6DJyVhqRVji8WC/5+8JOHt
	 xgXEhl461S8VhXQhuZBy/bH7EGMOyFVc5SLUi1QBKW9QnaCfIHzeIgN1Aqvx4MrmTxnOu
	 d+FNSNTFuGaB03N2bEDQm080GQcej94W41ewBUthmFzJnR5hAjkJR3K7XkN+3K3aXBfkR
	 LSMQ94/hlEQSMofbvR8LoKtJLoQbbr/gR94hhozMGmtMql+NgMSe1/LRWT7K1EoXnrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=t5BwRVNW;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B058D606B632
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B058D606B632
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=t5BwRVNW
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e09aa5264so625799f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1794596231; x=1795201031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMKilXOc8iF9aDdrmQW0L2QZLW9z0erSCAgXdVbBET0=;
        b=t5BwRVNWU59FaHByUZSqjh5C9/fdw71VtR0gudEz32CDQwObcKjWSTvKaii1kCZXLk
         cOvCeBS1cSA3DZiqJzK/BP4QizUYmc0i/bHgI9ED8byAsbbuyTlTrGYN7mZn+27/xUks
         5NXsMehbj+J89VqD5vTEUsU7Ii7dBvKqUa4M5uxoYlNVlv3bHVu3yHpgZ5IkLM2hDc13
         Q4/akarz2DcKEwNUb+wbNy4R8idqTrnLzkYWGhSnklyAqGojRO3KV9AUIcKjarGFPx6x
         2ccRQGrf6JiA/mGmRLo06izKDzC512jABC9ERz6YNQpBeACydYwpJj9rQ5gZLfPaq804
         7aIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596231; x=1795201031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eMKilXOc8iF9aDdrmQW0L2QZLW9z0erSCAgXdVbBET0=;
        b=no4A2F5MvlDgDi55rEyiVwBjdeedRJrfAmwC3ek1AvsJnCXQaPplcv9F+aDgf+gbGj
         wqEZjh261jC1uEVEFFk61kUasC2VP3XrJWMRduRfITgHWm+dSXMSenCHztKT3UWb9UJ1
         pl3SWyg1baUCtt2lro6l6VNl5erokTIHsd6DJkwrh03YopLoplp8wONwG5EoR5drRbxa
         +CXKERZOXRC0dDol/ktf6KvsBXfENCXKfAlKQgnlQvmvjKWaVIV7MrO32aaO9dsjnt6u
         Mr13dZQrp5ncTclmlBlWs19M4ZC1NGvFP8TZmKsaxBJ/9gIlyAerpE/iLbekzwz5xTtM
         wTKg==
X-Forwarded-Encrypted: i=1; AL+hErHLi11A8EUnuDcM9EWXSf9wPdG/ZAwmCPrYUuFHEH/dIX/4JKS+DP0ZFL+tKyrvTh8+yTXaeUU1TCpIeUQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YSpxvHwsN/awlg/EdIK+8B0tJFbe5a2zSkljJ+RvUwhwTInEG
	uImyqNHD/+GRYrK27e9dP2dwBARDSiSZrC1vXruTW6ztGSo7j5WBWVWinxrtl6swD8w=
X-Gm-Gg: AYBFou1EPeeXYnFtaUaaj+Sxcck+fR7TVGjmZsBSlZRyJ2OBkfLh760uoP1pLn+Pbyo
	K/Byg2z+1A4Dv42pQAxJ7Zwjs1VW/DZR2xnRob98csdZ3UnrQ9Yq3LeOyvjuuCDRIAgIXqy9Xgg
	TvbZERWXWtJtkniVl7SysQrMZXu63l2ubMi8RzOhWIif/zD51TmSyWkAlooLTr4zm22+SEEq8aH
	8SL+Y0+8+9NvWPsKjAO854XH1CfE5nBLDcu6yVM7DB9gNeUYtjJ5s2MUqoixW9YdjZl5s29LVYJ
	uE7EwNaIZ41+f5oBVLxkMHbXsq4+SfAPxHOX6qG2vZZQH+CNbLAMuZVTjDrYSgNrnOU6EAYj7V8
	QdaW+EojwLpUCKdjptDE3u536uV/nrJcC4+xA3U1bHb+DE6kmEnHG0wsenun0YD9988ppjr1GNT
	gnFPsvHn+AzHnxpGow7fW59sDv8B0MOBYJLEDTohvHWkYnZzMtTz6ni2nfcN0BvraSlp/QsAaeq
	La/Sw4jLEsGR9yfEC7q3qXbe2UttE+5Bg3lkbZDimrG4QOk/9GUUEIxIT0R1a2pDLi/hXHAIBG5
	uFLZ8lr6C3ImN4SIX6zIOiCBk0sMTA==
X-Received: by 2002:a05:6000:2204:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-49c7467aa37mr8267530f8f.46.1794596231138;
        Fri, 13 Nov 2026 10:57:11 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:ec8::179:1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm6417589f8f.21.2026.11.13.10.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:57:10 -0800 (PST)
From: Matt Fleming <matt@readmodwrite.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@kernel.org>,
	Caleb Kan <ckan@cloudflare.com>,
	Caleb Kan <calebkan1106@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	kernel-team@cloudflare.com,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH v3 03/10] kmsan: use stack_depot_fetch_into() for origin reports
Date: Fri, 13 Nov 2026 18:56:55 +0000
Message-ID: <20261113185702.1332171-4-matt@readmodwrite.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113185702.1332171-1-matt@readmodwrite.com>
References: <20261113185702.1332171-1-matt@readmodwrite.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Caleb Kan <ckan@cloudflare.com>

KMSAN stores ordinary origin stacks and synthetic alloca and chain origins
in stack depot and retains the resulting persistent handles. Once a later
patch stores compressed frames, these handles can refer to records whose
frames must be decompressed before use, while kmsan_print_origin() still
relies on the pointer-returning stack_depot_fetch() API.

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
[mfleming: reworded for compressed frames]
Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
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
2.43.0

