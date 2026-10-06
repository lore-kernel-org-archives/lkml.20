Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB5238AC65
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791325498; cv=none; b=JGjuFp8vNDrFvIhdwAKS6zgR8ESnks7hXHK7jOBOxLPwNEBLDUFe6XztIU+nZUhtBZSZGRytMLpIqyPkpVvNx13I72fwQcWGLmaawgBOs58fywn1L26XQRGZDUpf5jZebnTk1cFEgPZK+D2thdqcGGYtgsXqsuQ/8U6/iHMR4EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791325498; c=relaxed/simple;
	bh=C/wjBB6ODndbUHD9ckG0IP7OsNMrq0W3o6908fW2L50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SkyakA0g0lISppkNS+xWbWsTnrUVk9dbCOjFADXjn4jDVsWyuKy14hD1+3g7wthZQyfNmZTyElgqkp0Q0kLP38BLE6Yr+MwkYTfhn4gQXPTsDiK9TyscOnBmAgh71XEE6j437BL2AHNrKsqbJuFeKpUz4908xaCyvD0qbifDvt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=HQnFtNIa; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="HQnFtNIa"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-48e94879f02so483889fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791325496; x=1791930296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NRmWs1MEMIQ0AZDf8upgCfJOi1tx4WylAjm9X23MxPc=;
        b=HQnFtNIaajFZYK80ldSYTSAAMUKUysYyH6MipFGMpjBRzEVqOQqTsAx1T+JdpSNzwK
         jBOkSJ4kt6CXvtE4QjDQGBJFkAytnjfzzL+FAwzf0usU+gmqUQmFmgh7oTNJOnn34JHk
         cPseTxtiRe/0jlUYAVccbL0dP9ZswtZGGKyjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791325496; x=1791930296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRmWs1MEMIQ0AZDf8upgCfJOi1tx4WylAjm9X23MxPc=;
        b=unFBz7TOZffp0Hw7k6SSUTFIA6IIxNS241YZNLMCs6SY/fEMDsMknDKru4dqUxibO5
         H+PPv7wfsJnq276dGNgPw9cqzV/bnqAPufDpOve1UAfIdP91AXPE1SvARAX3DE/v4gcg
         3RM+4yM8O/+NtEFZzaw4MaSm7iEu9sq06po5Jg5i7FCvCC7/3bFASWxBbaesGUOz+jqs
         p40NxIWmB0FugWNCWnpptCZQZPACs/7vr0tb5QSF65F+qkhZ55RpntSGHiVHyl78LpzH
         T/SWo+pf+PYqiHk0+sEqyH0gu3hvTzegrsNGvXxR2UCwZDdoVveRApLC1+3b0heE9Eov
         ccmQ==
X-Gm-Message-State: AFuF++lZX/3NvyrQlq6bgIkZYP4cuEvxyra+0YrpvCMyeydvbw8/7D8V
	RYFIkCd6275YsFizHYuYwKPvNNbT5RpS00p2QopuYS9vuV+vBqJJLiGjRjatBnLX+ZWedCqCot+
	FBupXFKQ=
X-Gm-Gg: AYBFou2ggvNZUDPPSUiSNTqnImKwyfncXV6ajFNNkmd9cFiahM87zST/GHbL3vK/OYD
	PUMD2Q8m/GOV4s7TeG6o8NPINOaEf6Dqv8RMvS1gJOckXSuxaex3U+HITyO1GI5R+AE43lj4Ba6
	IQpwinQMvk7rGXvvpMg0IKeWbDcck91ee4ZplGCjO700zpqGINgGMvukIZnswRZFxzCKAY8J8X/
	479py/bJUzzAGa0JqG9XAPiskJmYJngAKk9xjM335+hH+ZHUvIoNz5nGprJ6geiz7Tw4lZzjKgx
	ZfFeD7q9igaoD7JP8fKpG4FmkYyB1arK66SQo+esjroRQNhqpi7lMKSCJisKn8TpwF6TOl0eKeO
	ohjopLlxIHxyACQMmhKPjgvkZTqfL9dSIR8kS8yAGgI5Q1iPWfEq0iT/VkvdRyyQUETHG2hx7QL
	Yku2ThymTvyOwfLAwAK9benik4HtRlZP4vw1s5+7+iBi/1zkNEDHH+4/amuvpFC8j9d4keJmATu
	n4H9vRQDG0ZebngoG19VK2yHcoFTg4WVa2g1FqQBN7zwkIlwHQ+RE3GxM6Jz9TSnS8Bd8zoQWw=
X-Received: by 2002:a05:6870:c248:b0:449:bccf:bb6e with SMTP id 586e51a60fabf-4a2591dc120mr415992fac.7.1791325495841;
        Tue, 06 Oct 2026 15:24:55 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a25716e1f5sm578773fac.9.2026.10.06.15.24.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 15:24:55 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-kernel@vger.kernel.org
Cc: tglx@kernel.org,
	mingo@redhat.com,
	outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH] futex: Use a keyed hash for global futex buckets
Date: Tue,  6 Oct 2026 15:24:50 -0700
Message-ID: <20261006222450.42518-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The global futex hash is a public jhash2 of the key, which for private
and shared-anonymous futexes includes an mm_struct pointer. A task can
populate a bucket with futex_waitv() and time nonmatching wakes to learn
which chosen user addresses collide. Shared-file keys have predictable
inode sequence numbers, so the task can also identify the bucket and
turn those timings into constraints on current->mm.

The per-mm private hash does not prevent this: a task can disable it
through PR_FUTEX_HASH. NUMA-routed private futexes and shared-anonymous
keys also use the global hash.

Use SipHash-2-4 with a boot-time random key for global bucket selection.
Hash the three identity fields individually, without padding or the
separately handled NUMA node. Keep the original futex keys and equality
checks, and leave the per-mm hash, which only hashes userspace addresses
and offsets, unchanged. Initialize the secret before the global tables
are made available and keep it fixed for their lifetime.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 kernel/futex/core.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index a061f54b606d..941713b62ee1 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -42,7 +42,9 @@
 #include <linux/pagemap.h>
 #include <linux/plist.h>
 #include <linux/prctl.h>
+#include <linux/random.h>
 #include <linux/rseq.h>
+#include <linux/siphash.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include <linux/kmemleak.h>
@@ -58,6 +60,7 @@
 static u32 __futex_mask __ro_after_init;
 static u32 __futex_shift __ro_after_init;
 static struct futex_hash_bucket **__futex_queues __ro_after_init;
+static siphash_key_t futex_hash_key __ro_after_init;
 
 static __always_inline struct futex_hash_bucket **futex_queues(void)
 {
@@ -386,8 +389,12 @@ __futex_hash(union futex_key *key, struct futex_private_hash *fph, struct futex_
 	}
 #endif
 
-	hash = jhash2((u32 *)key, offsetof(typeof(*key), both.offset) / sizeof(u32),
-		      key->both.offset);
+	/*
+	 * Global bucket collisions are observable through futex operations.
+	 * Use a keyed hash so they do not disclose the mm pointer in the key.
+	 */
+	hash = siphash_3u64(key->both.ptr, key->both.word, key->both.offset,
+			    &futex_hash_key);
 
 	if (node == FUTEX_NO_NODE) {
 		/*
@@ -2090,6 +2097,8 @@ static int __init futex_init(void)
 	unsigned int order, n;
 	unsigned long size;
 
+	get_random_bytes(&futex_hash_key, sizeof(futex_hash_key));
+
 #ifdef CONFIG_BASE_SMALL
 	hashsize = 16;
 #else
