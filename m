Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606605;
	b=t6l2m3pD8TywIrsOURz6DvP5erNdtBchnawtN2c2wOKYGjWOjfSjnogUUQ7ywg1elGBG
	 e/+lzXYMDEhs1egx78TBF27utUXyazRfrWU5rdN9Igixgo5/O31pka40ytZdrvJcD0voQ
	 7Ajpw91VTQWclHKuC6sPF17yrlCg6aQpbueavSDF5VMkGsTJORFkxY3JfWsoyKcPy0fqe
	 fP5QJj5aldaGB2AG76g7rnpWDpOLplGkVnCw5zTCZn6/WrHm7vlUAEKMu20184VLtgZH+
	 iSH/EfCATuMuCEzY/0lmJzIdIHxDuDXg3VrkjeYtqODvssOZp4XBi+W6qnfOW9ZvMfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=llBYrxQhgFsLLiJLTWG5Tbxxm+BqQeWYst4Tp/BglWc=;
	b=ejDRcTENoQQTAQ4uU/tJGVkxWcrv0qyPFQp+iaXGf8EdyIbHhppEiaJiuKh9yTaq4bYJ
	 zgP0cqPftPDU7WnYp3iKvpoH5Pjzg9IatL6uHZF23hCuC05N9KD+yEACylmpzSwwrsxWM
	 1GXwjxt1WR9jY1phmqO29QsVgGjanyVn7lQ6EZ8Vtfer2AOOdVmiBMrR3LbIkYkMOzp6T
	 5zoE3PI9wQ80xA63iwLH/dmktQlMZmzK/RPEpEQ9CMBcSgTmUE05wSI2LNMpL8gk4w6YF
	 5025TXTY+mKKyaFenXL2i9rWLAJB9Jk1wQOj+kY+ZJGmU6HGIKhsgRgXoRwtH5++FnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vwrizk16;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52A5606C9AB
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C52A5606C9AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vwrizk16
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a05b68f851so1868449b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794606602; x=1795211402; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=llBYrxQhgFsLLiJLTWG5Tbxxm+BqQeWYst4Tp/BglWc=;
        b=Vwrizk161LvXkmnhOYG85yAv265+ZBHh0bE6KQbLuyxlKO/s1hq4rbdIwi/hQylKzQ
         hvhrK2fdQUleLEA5nGp9fJ43t5uYKxmRjkztIh7NTZSJRYN3JEFC0Y6zbn16KsBUCxck
         c+QLJsvyu/zctoC4X7FA9Jrkc0AVQnnTVtAN0XUA7UW0n316vt9igv0ZeXR/KSfyJurY
         rZ040+WvNL0fXUIBLStVDShD5bz6smX7m8GTgLJvnn5J2ETo8ewC45Uapd0B5uXAakQd
         +ZdVTNqcK7s8Qm39iMBkmcmRLQsag5o7jviiqxtFUiwl+vtieU1VynFTZEkM6BA0oejL
         AZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606602; x=1795211402;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=llBYrxQhgFsLLiJLTWG5Tbxxm+BqQeWYst4Tp/BglWc=;
        b=gVSClr2emUoWcaVHuBgHrdT/hf5O7lEz+hVl5fvYZvChUshXv1/5uA8LW/8YHMqHX8
         9hFHhE/tCU6r/QplzBQ4PjiRJpo7IHA7kcZnS8FpCs9Sa5gHnzlD51qR3wv5wbNheZlx
         2gsxU2TQBHbHTn80kJ4dA/2ps1N4H9rmQSrX4p9wI28SzYfJWzChEk/C5gAicG8aUd2X
         XndX5vTi/RYsTOlSlSKJUgJV8z6p2Pz9Ntr+wSyHNFCRqQT5OEcOaKKJEEcmm/bgowKX
         ksSelS0aeLHSqatN+0GNH8eEc1spj3Clku5IGOWuwY2hmDH60U+OObpb2kwo9g+aT/Ea
         ZtRg==
X-Forwarded-Encrypted: i=1; AL+hErGEOFF3LqH0cLrEqKVFFcO8HNKr5WCGmBURsvQ+k6Ix26lLm/xMagQR2osfL//6RIPQKySHIMuQdRJqUfw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cZ+/blC7vjLDG7xLnQcpdeYi5t0wuTxg/KwpDdY3PT8U0Y9eA
	+IMtpFyOniedok1qDStXoHIgu8HI+RrGL/xqhrEcnbkAAHZvYE+G9V9TyPAYhKvMwrFboxBubTC
	vnpY/4Q21Hw==
X-Received: from pgdo13-n1.prod.google.com ([2002:a05:6a02:620d:10b0:cc7:a092:edd9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:8201:b0:3e2:3de2:5937
 with SMTP id adf61e73a8af0-3f63514fe97mr5684215637.44.1794606601862; Fri, 13
 Nov 2026 13:50:01 -0800 (PST)
Date: Fri, 13 Nov 2026 13:48:43 -0800
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
Message-ID: <20261113214850.3329699-20-irogers@google.com>
Subject: [PATCH v1 19/26] perf threads: Use generic hashmap for thread shards
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Convert threads_table_entry::shard in util/threads.{c,h} to
DECLARE_HASHMAP(threads_map, pid_t, struct thread *) and replace
hashmap__for_each_entry{,_safe}() loops with hashmap__for_each{,_safe}().

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/threads.c | 16 ++++++++--------
 tools/perf/util/threads.h |  4 +++-
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/tools/perf/util/threads.c b/tools/perf/util/threads.c
index 98cf7edaf748..c2c675d064b3 100644
--- a/tools/perf/util/threads.c
+++ b/tools/perf/util/threads.c
@@ -136,15 +136,15 @@ void threads__remove_all_threads(struct threads *threads)
 {
 	for (int i = 0; i < THREADS__TABLE_SIZE; i++) {
 		struct threads_table_entry *table = &threads->table[i];
-		struct hashmap_entry *cur, *tmp;
-		size_t bkt;
+		pid_t tid;
+		struct thread *val;
 
 		down_write(&table->lock);
 		__threads_table_entry__set_last_match(table, NULL);
-		hashmap__for_each_entry_safe(&table->shard, cur, tmp, bkt) {
+		hashmap__for_each_safe(&table->shard, tid, val) {
 			struct thread *old_value = NULL;
 
-			if (hashmap__delete(&table->shard, cur->key, /*old_key=*/NULL, &old_value))
+			if (hashmap__delete(&table->shard, tid, /*old_key=*/NULL, &old_value))
 				thread__put(old_value);
 		}
 		up_write(&table->lock);
@@ -171,12 +171,12 @@ int threads__for_each_thread(struct threads *threads,
 {
 	for (int i = 0; i < THREADS__TABLE_SIZE; i++) {
 		struct threads_table_entry *table = &threads->table[i];
-		struct hashmap_entry *cur;
-		size_t bkt;
+		pid_t tid;
+		struct thread *th;
 
 		down_read(&table->lock);
-		hashmap__for_each_entry(&table->shard, cur, bkt) {
-			int rc = fn((struct thread *)cur->pvalue, data);
+		hashmap__for_each(&table->shard, tid, th) {
+			int rc = fn(th, data);
 
 			if (rc != 0) {
 				up_read(&table->lock);
diff --git a/tools/perf/util/threads.h b/tools/perf/util/threads.h
index da68d2223f18..059d7a617e63 100644
--- a/tools/perf/util/threads.h
+++ b/tools/perf/util/threads.h
@@ -10,9 +10,11 @@ struct thread;
 #define THREADS__TABLE_BITS	3
 #define THREADS__TABLE_SIZE	(1 << THREADS__TABLE_BITS)
 
+DECLARE_HASHMAP(threads_map, pid_t, struct thread *);
+
 struct threads_table_entry {
 	/* Key is tid, value is struct thread. */
-	struct hashmap	       shard;
+	struct threads_map     shard;
 	struct rw_semaphore    lock;
 	struct thread	       *last_match;
 };
-- 
2.56.1.703.gf848ed807c-goog

