Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348517;
	b=H4LBkwxcJWIluHviBdz8UYka3NcrYZHTEDmA1cY6Hc7t562DCTCyXKpnNiwEe1w8iNQF
	 KmXcXulRfVcCpDoBLp0fRgzK+C53KshKBhyumPbp6sBSeqnr5OkzBK18p61WuSPwJr0A+
	 IeIlaxcwGUZ8DAgrpbiJLnd6796EISennMSZaEmKOZTSeIcjIEnx8rTd3e11R17U6YI/c
	 hsbND55E/5E7xlYhty5lXs5UrXMKTDXrpf9f6YHinI85MDtfkFJz5B7Ea7gY4X2VYfymz
	 UYB7mgV005lXhcGhMBoYCSf0l4gvtJtn/KRREw1/DevnbhO2Xy5YEPryPSN5ji4Rh+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=D5IoiVKU6c11zvPIBTpWzpiL7D+oTvKoeSrpXNhIJ/4=;
	b=JXsF5gPQh5ujncx+1EEl/3jnX1s2zm7D+aoWfCz6xi1qLVEIGd8awc8mf1Afg5uGVAZX
	 kh/RixDTRRxkYvbQ0IiDDWzQHDXAjZUPq6LSX1rOc1b8SnaisVYK4d2cS8e0B0BIM9KBB
	 QVVCdEEdT/xE+sfsj/95rBmejVlbl4V0qL+bb9QJNW89vQEygN+pMXEWb8tgvTkmG2xy+
	 d7xTXmcIIzzLbayJb6FBZOjfvPJR89vILNkEIcDqh5Tj8CFr/aiZoKxdmk6wL+mApLL0s
	 rDd8Xm55XxmATMFsF0BxwJhHqXu4cZME3tQBUGsE7JUzMd5EsYBSArBpyJoDC1ycD+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ezbxX3MZ;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3792060A6F6E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3792060A6F6E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ezbxX3MZ
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a2af4c8cbaso2048649c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794348515; x=1794953315; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D5IoiVKU6c11zvPIBTpWzpiL7D+oTvKoeSrpXNhIJ/4=;
        b=ezbxX3MZqaqK+CM2mW7HIJjlHuhNOcKpGilxmywQKFeS/ZtGXhanhFj3ePb87L/xbR
         97zzuhsGtgIMcjpRL7uXx4pTl+gOT/mhnqAq7PYEWw22Fkv8gWPMIg/XdDUYNbXhAT/i
         ZhCmraGZG3xtaiklXOtH7Y3nlB+uuoWcd3OdRjcxnFweWjSSy0kpu55+wqljvJhwHpEW
         PAWs4j5PWbYHjZgWguN1Awz04d4rdNWylY5JHbN3ac2FwkGyyD9VMRM9tkBdFjEtp2Ck
         CSyK3LIg17qkUNPhiOP2ZQduo8qvMSixfbXjNClyyC462AAeXfRZ+d55jUGOGltRkutv
         EjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348515; x=1794953315;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5IoiVKU6c11zvPIBTpWzpiL7D+oTvKoeSrpXNhIJ/4=;
        b=NBqzXPM56KuP7AjPrcf4VJNaMud3cceMxQpTfnZ2/Y4yO4R/OJv/6I2SXvyBIMHI4E
         Ofb6u8yCptan/c3S2p3YK6pK9EvDdDGCEB4gLu2oGJ6HloPVBW2np5SebU1oB9TeAGL2
         q15gaISiIuyJknawFmPyNfwL7np9Osr1LUbiGEjCxnkLbLoFqcAFwfhEafgXroZqdBNS
         DssNvyTmMjV4OWxyoq4km5iPPK1TrI7ff4foJQ5Xv1pr4ql+BaDE0Erw9vJkPCDwhwEH
         dfBG1WBd4Y9B+POdug0LLdq/g0pE9hUtoZiHA9ZfKPYuEQ8fNwL66lWBMcpq5CJ+g0Pt
         2LXQ==
X-Forwarded-Encrypted: i=1; AL+hErGDesHZ3VM9XRVDDm1dPqb02b79lX+SGRHPI0CwjBeMIEX/B2BjwqZAaKnznbT77ZRgcayVVpd1fUL7Gig=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+TOIThMlGF+NhiTnPob2ckxAli1UbhiqzR7lN3UD8+wq/HP2s
	dC0rZ+SZaW23asFQ0u5goKc0DWD8ryD1rcx08XbHNoQu1tTFnyLpYLwMW1mwaRqCoFvolhZrJxJ
	eKRq6qPIfPw==
X-Received: from dled10-n1.prod.google.com ([2002:a05:701b:42ca:10b0:1af:74c2:e2b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:c91:b0:143:2968:564c
 with SMTP id a92af1059eb24-1b3c0318478mr280277c88.26.1794348514819; Tue, 10
 Nov 2026 14:08:34 -0800 (PST)
Date: Tue, 10 Nov 2026 14:07:50 -0800
In-Reply-To: <20261110220803.2503416-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027231513.816148-1-irogers@google.com> <20261110220803.2503416-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110220803.2503416-8-irogers@google.com>
Subject: [PATCH v3 07/20] perf db-export: Store symbol database IDs in a hashmap
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, haghdoost@uber.com, 
	namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Currently, db-export reserves sizeof(u64) bytes ahead of every allocated
struct symbol via symbol_conf.priv_size and accesses the database ID at
a negative offset via symbol__priv(). This adds 8 bytes to every loaded
symbol across all DSOs even when only a subset of symbols are exported,
and relies on negative-offset pointer arithmetic ahead of struct symbol.

Store exported symbol database IDs in an on-demand sym_db_ids hashmap in
struct db_export keyed by struct dso_symbol * instead of using
symbol__priv(), and retain exported struct dso references in db_export
until db_export__exit() so exported DSO and symbol database IDs remain
valid across the export session.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/db-export.c | 126 ++++++++++++++++++++++++++++++++----
 tools/perf/util/db-export.h |  16 +++++
 2 files changed, 129 insertions(+), 13 deletions(-)

diff --git a/tools/perf/util/db-export.c b/tools/perf/util/db-export.c
index 6a5db62cd58b..e7b807e968cf 100644
--- a/tools/perf/util/db-export.c
+++ b/tools/perf/util/db-export.c
@@ -4,21 +4,46 @@
  * Copyright (c) 2014, Intel Corporation.
  */
 
+#include "db-export.h"
+
 #include <errno.h>
+#include <stdbool.h>
+#include <stddef.h>
 #include <stdlib.h>
+#include <string.h>
+
+#include <linux/err.h>
+#include <linux/zalloc.h>
 
+#include "call-path.h"
+#include "callchain.h"
+#include "comm.h"
 #include "dso.h"
+#include "event.h"
 #include "evsel.h"
+#include "hashmap.h"
 #include "machine.h"
-#include "thread.h"
-#include "comm.h"
-#include "symbol.h"
 #include "map.h"
-#include "event.h"
+#include "map_symbol.h"
+#include "symbol.h"
 #include "thread-stack.h"
-#include "callchain.h"
-#include "call-path.h"
-#include "db-export.h"
+#include "thread.h"
+
+static size_t dso_sym_hash(long key, void *ctx __maybe_unused)
+{
+	const struct dso_symbol *ds = (const struct dso_symbol *)key;
+	const void *dso_ptr = ds->dso ? RC_CHK_ACCESS(ds->dso) : NULL;
+
+	return (size_t)dso_ptr ^ (size_t)ds->sym;
+}
+
+static bool dso_sym_equal(long key1, long key2, void *ctx __maybe_unused)
+{
+	const struct dso_symbol *ds1 = (const struct dso_symbol *)key1;
+	const struct dso_symbol *ds2 = (const struct dso_symbol *)key2;
+
+	return ds1->sym == ds2->sym && RC_CHK_EQUAL(ds1->dso, ds2->dso);
+}
 
 int db_export__init(struct db_export *dbe)
 {
@@ -28,6 +53,26 @@ int db_export__init(struct db_export *dbe)
 
 void db_export__exit(struct db_export *dbe)
 {
+	if (dbe->sym_db_ids) {
+		struct hashmap_entry *entry;
+		size_t bkt;
+
+		hashmap__for_each_entry(dbe->sym_db_ids, entry, bkt) {
+			struct dso_symbol *key = (void *)entry->pkey;
+
+			dso_symbol__exit(key);
+			free(key);
+		}
+		hashmap__free(dbe->sym_db_ids);
+		dbe->sym_db_ids = NULL;
+	}
+	for (size_t i = 0; i < dbe->dsos_cnt; i++) {
+		dso__set_db_id(dbe->dsos[i], 0);
+		dso__put(dbe->dsos[i]);
+	}
+	zfree(&dbe->dsos);
+	dbe->dsos_cnt = 0;
+	dbe->dsos_alloc = 0;
 	call_return_processor__free(dbe->crp);
 	dbe->crp = NULL;
 }
@@ -148,6 +193,18 @@ int db_export__dso(struct db_export *dbe, struct dso *dso,
 	if (dso__db_id(dso))
 		return 0;
 
+	if (dbe->dsos_cnt == dbe->dsos_alloc) {
+		size_t new_alloc = dbe->dsos_alloc ? dbe->dsos_alloc * 2 : 16;
+		struct dso **new_dsos = realloc(dbe->dsos,
+						new_alloc * sizeof(*new_dsos));
+
+		if (!new_dsos)
+			return -ENOMEM;
+		dbe->dsos = new_dsos;
+		dbe->dsos_alloc = new_alloc;
+	}
+
+	dbe->dsos[dbe->dsos_cnt++] = dso__get(dso);
 	dso__set_db_id(dso, ++dbe->dso_last_db_id);
 
 	if (dbe->export_dso)
@@ -156,15 +213,60 @@ int db_export__dso(struct db_export *dbe, struct dso *dso,
 	return 0;
 }
 
+/*
+ * Return the database export ID assigned to (@dso, @sym) in @dbe->sym_db_ids,
+ * or 0 if @sym has not been exported yet.
+ */
+u64 db_export__symbol_db_id(struct db_export *dbe, struct dso *dso,
+			    struct symbol *sym)
+{
+	struct dso_symbol key = {
+		.dso = dso,
+		.sym = sym,
+	};
+	long db_id = 0;
+
+	if (sym && dbe->sym_db_ids)
+		hashmap__find(dbe->sym_db_ids, &key, &db_id);
+	return (u64)db_id;
+}
+
 int db_export__symbol(struct db_export *dbe, struct symbol *sym,
 		      struct dso *dso)
 {
-	u64 *sym_db_id = symbol__priv(sym);
+	struct dso_symbol src = {
+		.dso = dso,
+		.sym = sym,
+	};
+	struct dso_symbol *key;
+	long db_id;
 
-	if (*sym_db_id)
+	if (db_export__symbol_db_id(dbe, dso, sym))
 		return 0;
 
-	*sym_db_id = ++dbe->symbol_last_db_id;
+	if (!dbe->sym_db_ids) {
+		dbe->sym_db_ids =
+			hashmap__new(dso_sym_hash, dso_sym_equal, NULL);
+		if (IS_ERR(dbe->sym_db_ids)) {
+			int err = PTR_ERR(dbe->sym_db_ids);
+
+			dbe->sym_db_ids = NULL;
+			return err;
+		}
+	}
+
+	key = malloc(sizeof(*key));
+	if (!key)
+		return -ENOMEM;
+
+	dso_symbol__copy(key, &src);
+	db_id = dbe->symbol_last_db_id + 1;
+	if (hashmap__add(dbe->sym_db_ids, key, db_id)) {
+		dso_symbol__exit(key);
+		free(key);
+		return -ENOMEM;
+	}
+	dbe->symbol_last_db_id = db_id;
 
 	if (dbe->export_symbol)
 		return dbe->export_symbol(dbe, sym, dso);
@@ -192,12 +294,10 @@ static int db_ids_from_al(struct db_export *dbe, struct addr_location *al,
 		}
 
 		if (al->sym) {
-			u64 *db_id = symbol__priv(al->sym);
-
 			err = db_export__symbol(dbe, al->sym, dso);
 			if (err)
 				return err;
-			*sym_db_id = *db_id;
+			*sym_db_id = db_export__symbol_db_id(dbe, dso, al->sym);
 			*offset = al->addr - al->sym->start;
 		}
 	}
diff --git a/tools/perf/util/db-export.h b/tools/perf/util/db-export.h
index 1abbfd398e3a..c56037644d62 100644
--- a/tools/perf/util/db-export.h
+++ b/tools/perf/util/db-export.h
@@ -21,6 +21,8 @@ struct call_return_processor;
 struct call_path_root;
 struct call_path;
 struct call_return;
+struct hashmap;
+struct symbol;
 
 struct export_sample {
 	union perf_event	*event;
@@ -63,6 +65,18 @@ struct db_export {
 				     u64 th_in_id, u64 comm_in_id, int flags);
 	struct call_return_processor *crp;
 	struct call_path_root *cpr;
+	/**
+	 * @sym_db_ids: Hashmap mapping heap-allocated struct dso_symbol * keys
+	 * to their exported 64-bit database IDs, pinning each symbol's DSO.
+	 */
+	struct hashmap *sym_db_ids;
+	/**
+	 * @dsos: Exported DSOs retained so dso__db_id(dso) remains valid until
+	 * db_export__exit().
+	 */
+	struct dso **dsos;
+	size_t dsos_cnt;
+	size_t dsos_alloc;
 	u64 evsel_last_db_id;
 	u64 machine_last_db_id;
 	u64 thread_last_db_id;
@@ -90,6 +104,8 @@ int db_export__comm_thread(struct db_export *dbe, struct comm *comm,
 			   struct thread *thread);
 int db_export__dso(struct db_export *dbe, struct dso *dso,
 		   struct machine *machine);
+u64 db_export__symbol_db_id(struct db_export *dbe, struct dso *dso,
+			    struct symbol *sym);
 int db_export__symbol(struct db_export *dbe, struct symbol *sym,
 		      struct dso *dso);
 int db_export__branch_type(struct db_export *dbe, u32 branch_type,
-- 
2.56.0.542.g3ef89b7020-goog

