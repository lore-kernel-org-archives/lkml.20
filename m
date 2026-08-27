Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE3838D3ED
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803125; cv=none; b=ZvSiwS76J2skTGIBq0i4/po9z5EE7icZLeRCGLNtCvg0IOhOo7pvsgtDEccBf1WpbcIyd25+s/6JI6TLQLtB++GCbZy2nWnic/Q89wBPXBJTgTr+cOsvtAxWJUKxq+5odWSnSwShiK0IkFBbYi9LWfEkIKwVlczoWLvmQ53Ys6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803125; c=relaxed/simple;
	bh=fnlndgyS+0lMEvKhIWQHZnrrmWJ12W0ngfJa+Pn3Asw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cxT6LMBEyqRVWRYG3v8rG8NOJa/bT5pRsrF3XXf4tRl4x3Jm2htcWDxRsr8VkVa5utATv+Ds+f6/J/5Rz1lFgvVK5VIXuzMlaLsnrJKYtOdGRjiX9dIjhSoK7e0tpgY8Khs+KaoLp3yTosl/RfkjPTylZITwycOA1EYZ8LXXJjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qfyIbhrU; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qfyIbhrU"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f4e1568932so154758a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787803122; x=1788407922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ielF9GNSqNYO2qJux1/hWiFGNLSXmzQdkPugM7U1Opk=;
        b=qfyIbhrUqsW4UjPeMqqAQNYMjaGABCGQOlR9bfC+wDe2wujRwSQP+rkBQThxxhx7fp
         Wv8WkR7OneSi7lx8v9EzJHgyKVD6CJ6uOW5xuPt/9CDfBhoLb4HSGqNDbaISUbOqBq7G
         IYnSYCnDHBQBkLWUCcDiWONWdBb0YTkfkzmYC+ahJR64RZ9/CmkAoUkIDDT9Fn5PAlvj
         x8K24TdCthYKuC5lX2heESsXrWAXwR+AA2l9YiKhU5fkMWfO3z+unVs4zkckT0mlqfgb
         jqCAXfgSfzO6GHIRmOere3fqSKYQi9jPBrWVb1CLtkozzrVLDksVLjKV7Gt2jEK3A/Pw
         kICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803122; x=1788407922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ielF9GNSqNYO2qJux1/hWiFGNLSXmzQdkPugM7U1Opk=;
        b=oZ3glTMyHLZ6esWApAlqoYXWg+F/RuF2///4QiHnfkLB5NlInLdoWBAJzjVS3GqYuw
         DV0wbdNnyKiL7nt9IaFkItPya9XPss8IUF0Oz5A5Aq9UH+4ajfoAcehHBALPQQKy0Qyj
         RqUsOjwSQreTvF79tXz8wi7IsBuSeJhNJB4/LmNZ+pNouTVrKMDv9BXF5pjDOOolgZlb
         J3ZaTgtrfCxhdok0S2J6rvc+Bnh5sKBPoqNm8praZidE+BURMA6zSczV2tzNaBbHkKCV
         CR94LRXuyHRRdWjreu7KEhSl9wg8ajD/dZg2T7B6ew2ulfEQpu/2FQAWDBA7MWA3cx4E
         lrGA==
X-Gm-Message-State: AFuF++lQF9aOKvd4Xl2cHKhdtM9VRiC7jBECYqMCg77pzMnKDluIacqR
	YxlgBLMQV1Hae3I1Kd6Ma3Vw99RHXweL2A/sRSTC3o52O2C3iGhnQKwb
X-Gm-Gg: AR+sD13oNjJe85SH2JYWRPcpfneRec2eom0X4d/v0WEfF5y4Vs30hdInR7Mc4vSQZq1
	Zye7CoEwlIDbdirNDO6xS+oO2S3kFFPYJGhpGw/8Rc7/qYCd3g5asW42nocUZ6xzAZ0D+H81WsK
	ni2KHLS/gZBue9y6hXvrLRafM/AQBy560oK4/1eRPDkuWBHziA+G2lqb2YKZAjZUYYaYpo6FWZP
	hew8aTWe72OBn/z7V4P49/zilxxD8CgJMpN/f2OBJmqlKk45v5lkh/fWZRLVEzkcYHMhiHskvIs
	aSJhkQqrsjuYhzr4YCbcW4ZfRG049KHkFWU/QgX+WtD2i7+EBTGjn8c3N+YBVQSC2wB2GIZp9zV
	UsSgmwSqLBezlHI8DS8CqaxcwLdrnrRkZF3sMlY/nf88xDoeQmaJY8i0A6iJw1tqrm9PEghaAU1
	xwqjeFMpRh0fZJMIXFqNFK998mcb8vHzBl0Aize1zLoLgFu0WHWbK00QTmE6KH8KurwT6Au+z6v
	M6KfZF6YSdgFAbLIeyCk8U5SEWc9uvFOuob32wwcoDdrUgGfaEMphJpVeyjSdyEkh2bnEX5RHxA
	1NNOyNBN
X-Received: by 2002:a05:6820:849a:b0:6a3:e0fb:6f39 with SMTP id 006d021491bc7-6b1a04d64c6mr10480599eaf.23.1787803122401;
        Wed, 26 Aug 2026 20:58:42 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-467367af2bfsm900825fac.6.2026.08.26.20.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 20:58:41 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Wed, 26 Aug 2026 21:58:33 -0600
Subject: [PATCH 1/8] lockdep: Traverse adjacency lists directly in
 zap_class()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-lockdep-memblock-v1-v1-1-e2db855391ec@gmail.com>
References: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>
In-Reply-To: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787803120; l=3636;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=fnlndgyS+0lMEvKhIWQHZnrrmWJ12W0ngfJa+Pn3Asw=;
 b=BhJsCRPisozK9mZUxc1+Fl/TV0QfI84/20FK1Rj4lJcVcQtKsV93sMuQAcGGXh1FGQwjkYVji
 JpeZWEcPVPwDfF/nXsIi2BnLG10Z2EC+KDFrv+zJTGSZZWYFswAlAHq
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Lockdep's canonical graph representation is its per-class adjacency
lists (locks_after and locks_before). However, zap_class() operates on
a flat storage-layer projection of the graph: it scans the global
list_entries_in_use bitmap across the entire edge pool.

This global scan has a few defects:

0. Search Inefficiency:

On a typical booted laptop with ~2,000 lock classes and ~6,500 active
dependency list entries, zapping a single class forces 6,500+ table
inspections under graph_lock across 4 KB of bitmap. Zapping a batch of
classes during module unload multiplies this into tens of thousands of
global array iterations.

1. Projection maintenance: the bitmap must be kept up-to-date.
   given 0, its a net burden, but we still need the bitmap elsewhere.

2. Incompatible with Array Segmentation:

The loop relies on contiguous pointer arithmetic (list_entries + i) to
map bitmap indices back to entries. This completely breaks once
list_entries is segmented into dynamic 64 kB memblock slabs residing
on disjoint memory pages.

So just implement the adjacency check literally, per graph-theory.

Real-world lock classes have very short adjacency lists: 3..5 entries
on average for class->locks_after and class->locks_before, rarely
exceeding 15.

Directly walking these lists visits only ~10..15 nodes per zapped
class, replacing 6,500+ global table dereferences with a handful of
cacheline-local pointer hops (>99.8% reduction in loop iterations).

Note: We continue clearing bits in list_entries_in_use for now, as
alloc_list_entry() still queries the bitmap in this commit. The bitmap
itself is eliminated soon

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 kernel/locking/lockdep.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 2d4c5bab5af8..6a4f21f3e9c8 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -6243,8 +6243,7 @@ static void remove_class_from_lock_chains(struct pending_free *pf,
  */
 static void zap_class(struct pending_free *pf, struct lock_class *class)
 {
-	struct lock_list *entry;
-	int i;
+	struct lock_list *entry, *tmp, *other, *other_tmp;
 
 	WARN_ON_ONCE(!class->key);
 
@@ -6252,11 +6251,29 @@ static void zap_class(struct pending_free *pf, struct lock_class *class)
 	 * Remove all dependencies this lock is
 	 * involved in:
 	 */
-	for_each_set_bit(i, list_entries_in_use, ARRAY_SIZE(list_entries)) {
-		entry = list_entries + i;
-		if (entry->class != class && entry->links_to != class)
-			continue;
-		__clear_bit(i, list_entries_in_use);
+	list_for_each_entry_safe(entry, tmp, &class->locks_after, entry) {
+		list_for_each_entry_safe(other, other_tmp, &entry->links_to->locks_before, entry) {
+			if (other->links_to == class) {
+				__clear_bit(other - list_entries, list_entries_in_use);
+				nr_list_entries--;
+				list_del_rcu(&other->entry);
+				break;
+			}
+		}
+		__clear_bit(entry - list_entries, list_entries_in_use);
+		nr_list_entries--;
+		list_del_rcu(&entry->entry);
+	}
+	list_for_each_entry_safe(entry, tmp, &class->locks_before, entry) {
+		list_for_each_entry_safe(other, other_tmp, &entry->links_to->locks_after, entry) {
+			if (other->links_to == class) {
+				__clear_bit(other - list_entries, list_entries_in_use);
+				nr_list_entries--;
+				list_del_rcu(&other->entry);
+				break;
+			}
+		}
+		__clear_bit(entry - list_entries, list_entries_in_use);
 		nr_list_entries--;
 		list_del_rcu(&entry->entry);
 	}

-- 
2.55.0

