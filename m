Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606556;
	b=LweD96HgDNHGjLMIvr995QrzReJ9O7ohtSYqbmAQEQvQaae89hcWAMEaYqJfyZP1LOLQ
	 72ZdpsXiHfM/b27lk6JdBp87TxwNPhyWo0h84JcfqZLhP6Bd9zMotdyTQCDmZpqgc95wO
	 cMdIm3HFp+E3/8x1P2Cc9EzGobhr6eh9iacEI5rgu0u1O5DI8GNPJyApIuBvV3Kya0PVV
	 WsYGgDTOFMf7E4ogIKL0WixZ4Qsa4lU97McQvcWJ3/ap702pmo7gT/ftGB4mm3LMtIJbG
	 TDqH0wktFk0GYxsoWFwvMrTxX1kM0zZ7c72XAXD6cIKqw7cg72PepJGIqG5dGTYgFmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Lo+j+iHMT8qE0wPCakw8s/IRh6qon0bzXQhbCYnKkRQ=;
	b=jPHG5I2YmivskW4SLclqCf11VMl6QRuypdmrGTkmxiZMp0CAQHrB6XXfDubdkTiHgLpJ
	 Hgn+0gLjuH7T9JQNXUAYweuzQPuB/w20dfnTIM0q9l2zGGwyeZjz2YfaENMtao3WqbgYZ
	 pY9vRGbNNyGNNMHnRidwD61GKkqFTokuR8Ah9PSLLuqgVvTowDFgGPO3pyfujC5IzLJa9
	 HzN2HATy4p7SB+aZyUDoTyiD538zWjjAgf94oAnR4f9nQoh4sgoWwk3jKwDi3tlKGQldo
	 eBwDC+jkIs7Kxh2nBtnZkr9ZzcsnB0RClwdOl7GGSZtXhwE7foJ0DErV28DjG6jcwsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e01ZT7jl;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68586606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68586606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e01ZT7jl
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aed1b64104so2377580a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794606555; x=1795211355; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lo+j+iHMT8qE0wPCakw8s/IRh6qon0bzXQhbCYnKkRQ=;
        b=e01ZT7jlNllaZ4BpDqA71jnQmH2xDu6ka6XmkftHuAfg2QQgBRAD5RwOUS08ab4doh
         49fC1gnb68KyeY4laElWlgje7rxYAzGJuTWt/UXpugS1Fsf0WnqqT38b99Knjs9DqhUL
         rA9rU0XDPclWUCLpjOWCu7sKJugD1TTVHbWi45gUthpDbaA5ytvOO1VWX+gze0CjPWgO
         QeepRZ6HGI6O8WW1bAGbN/ymp2/it43POxLYNIHQOMP+Gy++qK5q4+g4FMt62wUi22dr
         IMUB44RVu3l8kFdMI8Za98Jw/sA4sFiL/8FSNLkdU+2PhBQiL18mMgLd661l1PQeuoku
         S/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606555; x=1795211355;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lo+j+iHMT8qE0wPCakw8s/IRh6qon0bzXQhbCYnKkRQ=;
        b=UUsbEqmtw39ZbwTnQ/bnYOqekwh4p0/xPfQUPb4LH0cXuSxMCBQMFLZ9mf8VgvULVg
         qWgzAadrW5KHf8UyQjOevuPoS60wmoBCKa+QSoqkIWQ7sREMButLC0dZWyIn6AyUAgBQ
         j6OU345rb2uHufN+mbHky1WrjaWeN4qh0x5Lc7Bvx2mlajzlaqR8M7xrcVq0e7nkTYox
         NmF5ngCuoXSySjLEea8T4GsUBu2m0wBuzgla/jwrUUBi5DCeOmAxx1xsVpJtGiS6+euY
         KumDnvuCi19pPUWetIgAt25zDaOxHxiaZDHLCpBE2yYyN+EFsD0EVSkw/CSYuux5TTW9
         HpHw==
X-Forwarded-Encrypted: i=1; AL+hErFCOaA3d1jLNkBGHT4GjpTmCVKANe/4do8VcFI8MHyatzSYR5cXYG88IHs50SKYAHNf5/TcTxLALLvqCTM=@vger.kernel.org
X-Gm-Message-State: APuU4Z98JA3S1d4e7KCGfdMfOpx0smTT3tS4CZx810lBTJMxjl3XoAVQ
	uJPt1L3tC55rFcG0HNr2qg7EwGwiq3HAjO4EKaWW4scjNhz/69rELEF9eiPZ/7FhyYG6XCzlzmH
	wH+7ozR7DEA==
X-Received: from pgp8-n2.prod.google.com ([2002:a05:6a02:62c8:20b0:cdb:5946:2351])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:54cb:b0:3ac:a139:1b14
 with SMTP id 98e67ed59e1d1-3b1b0d39a69mr3217639a91.57.1794606554564; Fri, 13
 Nov 2026 13:49:14 -0800 (PST)
Date: Fri, 13 Nov 2026 13:48:25 -0800
In-Reply-To: <20261113214850.3329699-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113214850.3329699-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113214850.3329699-2-irogers@google.com>
Subject: [PATCH v1 01/26] perf threads: Fix uninitialized pointer put when
 thread removal misses
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Unlike hashmap_insert(), hashmap_delete() leaves old_key and old_value
untouched when the requested key is not present in the map. In
threads__remove() and threads__remove_all_threads(), old_value was left
uninitialized and passed unconditionally to thread__put() without
checking hashmap__delete()'s return value. If the thread is not present
in the shard, thread__put() dereferences uninitialized stack memory.

Initialize old_value to NULL and only call thread__put() when
hashmap__delete() returns true.

Fixes: 412a2ff473ac ("perf threads: Switch from rbtree to hashmap")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/threads.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/threads.c b/tools/perf/util/threads.c
index 6ca0b178fb6c..98cf7edaf748 100644
--- a/tools/perf/util/threads.c
+++ b/tools/perf/util/threads.c
@@ -142,10 +142,10 @@ void threads__remove_all_threads(struct threads *threads)
 		down_write(&table->lock);
 		__threads_table_entry__set_last_match(table, NULL);
 		hashmap__for_each_entry_safe(&table->shard, cur, tmp, bkt) {
-			struct thread *old_value;
+			struct thread *old_value = NULL;
 
-			hashmap__delete(&table->shard, cur->key, /*old_key=*/NULL, &old_value);
-			thread__put(old_value);
+			if (hashmap__delete(&table->shard, cur->key, /*old_key=*/NULL, &old_value))
+				thread__put(old_value);
 		}
 		up_write(&table->lock);
 	}
@@ -154,14 +154,14 @@ void threads__remove_all_threads(struct threads *threads)
 void threads__remove(struct threads *threads, struct thread *thread)
 {
 	struct threads_table_entry *table  = threads__table(threads, thread__tid(thread));
-	struct thread *old_value;
+	struct thread *old_value = NULL;
 
 	down_write(&table->lock);
 	if (table->last_match && RC_CHK_EQUAL(table->last_match, thread))
 		__threads_table_entry__set_last_match(table, NULL);
 
-	hashmap__delete(&table->shard, thread__tid(thread), /*old_key=*/NULL, &old_value);
-	thread__put(old_value);
+	if (hashmap__delete(&table->shard, thread__tid(thread), /*old_key=*/NULL, &old_value))
+		thread__put(old_value);
 	up_write(&table->lock);
 }
 
-- 
2.56.1.703.gf848ed807c-goog

