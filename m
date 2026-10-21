Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622377;
	b=a1hnAE+CoV9RR5iaTwWeqUIC0sbGW6vMUOPjKavgk9iruJLTi06OZjstyrwj2gxF8V07
	 RkAPwmck1ha8HYZzdcOCIg6SF6YNthnmw9wemXjklRNJoJKtN59J2B7sCXZlCQUqVGz+i
	 jl08IpJqobHcam2ziwtSFRyrH70qcOrBEMu1Z1MV25KLm/nyQSnzhIMBBMDYeUykRl3Zr
	 0iNpqmZhG3uHo9ftnO0VM6tUrujoAX43c+Wk+d4zdjMZof9J52zeL/7XPEl1tX2Okae0A
	 GYVxBr9tcQFrA2ga669gvhhd44ruWNGBbaq6TfEswpyUjYM9rHOl94kvjO8PPReLKZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=uJ4h+3EYOGUq+tY1E9XD4cWiOD34N3ycV/pwHu8TAqM=;
	b=yBwpoXv606Sito9W7qK+MOadPiiagMu3vSfmgm7dksW44WS9cR9wdFwt+AtuiQyPCp/R
	 aFr+xHO6VF8O7B2m3CXTxx9ES9XC4+9+6sU5O5xcBIpBlshKu4KDVF0TtOTzjERrhjBTQ
	 o/ANL+QDt+T4BdJsfIcyhSzYb1WttkkHL9Wl9mB2c8rhf1FsQIO2+QZdUk9vt8fjeIcu+
	 9C6yFwvJS+iq8pwoJeTLvJMt6f5vmTJ6VI0oZ6Uk4a+eS1nvJ5wYfuxRQhdfLC6urnogc
	 LtfXEEj89DG66Kqjr73rt7A8op1RiD0pAG3PaL1DaESjF5MWASHNV8lH8vUcn2Hjb3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nL9DUy5D;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F10B606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F10B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nL9DUy5D
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1966954eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792622376; x=1793227176; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJ4h+3EYOGUq+tY1E9XD4cWiOD34N3ycV/pwHu8TAqM=;
        b=nL9DUy5D4ZVnwhRQ9rIAfpnksD67Sql5JFJobiyRV5wAGuUC0B1OMfrlLkRpDstzx/
         nEJhRcRxTHAKEFjscqG2KjYKFFK57b84ek/b6RfRGcaPyR+Dm0YQ8UG85uokNx8GNw+z
         yj0+k5pY06zA8Tze+uV42m6XW8d9uZ5Bb8h+8JvDAbC7yyh34GCQkl2nDc2PxdvvejCz
         S7nerA62l5cZ8/tnqGupaiOsPB+1h2zwAeUR80JjAwAG78BQy6bT6kEkbLu32/63yHFh
         W0RWUMW3DTN3HBt54VUbnli3LpEIYnvK0GoGM1evMIEghOP81hXH6qoauxmbVyM7yEDf
         w+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622376; x=1793227176;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJ4h+3EYOGUq+tY1E9XD4cWiOD34N3ycV/pwHu8TAqM=;
        b=f7ftl+Nl1iicFYmF3PkbSgkKcwglUsbHE6GExUmrHuNSgxnve7LpIALILkb6dAv+/R
         J8yDPvmbS9WyliTHuHjF5w/yMj7kq+OsyMyfSvGArc89no/jHJFvws/K6EDH5HpITfJp
         iYpnLDjRmzuCvLOH9pcFbwkEC4mk+3ZPoHMfcL10bXmj6QmAUPjv/3Vs3yVqiBjUIKfD
         dy1iS6cJ/0/fYtN2f2q5SFsFKkwP6fxzAQhayxJDLbCHxIZtYaKzWjPGl78+QpMDK6MO
         G4qiJNoWIpgneuHWECkAXa606400mPRJpjVJx0sGVphdc+cyv4Ng5PmQ6P4fjMl6JUwk
         yJ3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxPEE308T1kTyrdZ0PqMrna7CnnFC+fiBzXDBGmuHey/Tg30IdLmHHaxEBGy5N7SrX4IyY3tnI5za+GRQk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+NhSN9ELjW6nu/eKMv38z81QXbcAu9IY6VOR7EdLdjImHXiDB
	99dpCVNBpd4X7CbT3PxALxXjjGiNdt/RqU2V2go4Iuc03N9iOf1X5ZjEKI3AzFkcH2Orf1ggaQe
	yjVmnabYeVQ==
X-Received: from dlee9.prod.google.com ([2002:a05:7022:6289:b0:190:d435:79f5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701a:ca89:b0:151:2e62:fe6e
 with SMTP id a92af1059eb24-190a57ab490mr4849803c88.19.1792622375825; Wed, 21
 Oct 2026 15:39:35 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:38:56 -0700
In-Reply-To: <20261021223905.715051-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021171044.155240-1-irogers@google.com> <20261021223905.715051-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021223905.715051-9-irogers@google.com>
Subject: [PATCH v7 08/17] perf dso: Pass dso_data to close_data_fd() and dso__list_del()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

close_data_fd() and dso__list_del() only operate on struct dso_data
fields, while close_first_dso() retrieves a struct dso_data * from
dso__data_open. Pass struct dso_data * directly to close_data_fd() and
dso__list_del() so close_first_dso() does not need to recover a
struct dso * from struct dso_data *.

This removes the REFCNT_CHECKING dso pointer from struct dso_data and
avoids dropping _dso__data_open_lock in dso__list_del() to call
dso__put(), preventing lock-order inversions and races during EMFILE
eviction.

Also place the DSOs created in addr_filter__resolve_syms(),
machine__process_ksymbol_register(), and dso__split_kallsyms() into a
dsos collection so dso__dsos(dso) is populated when dso__list_add()
is called.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/auxtrace.c | 16 +++++++++++---
 tools/perf/util/dso.c      | 44 +++++++++++---------------------------
 tools/perf/util/dso.h      |  3 ---
 tools/perf/util/machine.c  | 14 +++++++-----
 tools/perf/util/symbol.c   |  4 ++++
 5 files changed, 38 insertions(+), 43 deletions(-)

diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index f30f86156a3a..5fdbd77eb451 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -29,6 +29,7 @@
 #include "config.h"
 #include "evlist.h"
 #include "dso.h"
+#include "dsos.h"
 #include "map.h"
 #include "pmu.h"
 #include "evsel.h"
@@ -2684,7 +2685,7 @@ static int addr_filter__resolve_kernel_syms(struct addr_filter *filt)
 	return 0;
 }
 
-static struct dso *load_dso(const char *name)
+static struct dso *load_dso(const char *name, struct dsos *dsos)
 {
 	struct map *map;
 	struct dso *dso;
@@ -2693,6 +2694,11 @@ static struct dso *load_dso(const char *name)
 	if (!map)
 		return NULL;
 
+	if (dsos__add(dsos, map__dso(map))) {
+		map__put(map);
+		return NULL;
+	}
+
 	if (map__load(map) < 0)
 		pr_err("File '%s' not found or has no symbols.\n", name);
 
@@ -2794,6 +2800,7 @@ static int addr_filter__resolve_syms(struct addr_filter *filt)
 {
 	u64 start, size;
 	struct dso *dso;
+	struct dsos dsos;
 	int err = 0;
 
 	if (!filt->sym_from && !filt->sym_to)
@@ -2802,9 +2809,11 @@ static int addr_filter__resolve_syms(struct addr_filter *filt)
 	if (!filt->filename)
 		return addr_filter__resolve_kernel_syms(filt);
 
-	dso = load_dso(filt->filename);
+	dsos__init(&dsos);
+	dso = load_dso(filt->filename, &dsos);
 	if (!dso) {
 		pr_err("Failed to load symbols from: %s\n", filt->filename);
+		dsos__exit(&dsos);
 		return -EINVAL;
 	}
 
@@ -2831,13 +2840,14 @@ static int addr_filter__resolve_syms(struct addr_filter *filt)
 
 		err = check_end_after_start(filt, start, size);
 		if (err)
-			return err;
+			goto put_dso;
 
 		filt->size = start + size - filt->addr;
 	}
 
 put_dso:
 	dso__put(dso);
+	dsos__exit(&dsos);
 
 	return err;
 }
diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 24ff066b9878..cbc4f30e7f23 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "dso.h"
 
+#include <assert.h>
 #include <errno.h>
 #include <stdlib.h>
 
@@ -544,22 +545,14 @@ static struct mutex *dso__data_open_lock(void) __returns_ctx_lock(&_dso__data_op
 static void dso__list_add(struct dso *dso) __must_hold(&_dso__data_open_lock)
 {
 	list_add_tail(&dso__data(dso)->open_entry, &dso__data_open);
-#ifdef REFCNT_CHECKING
-	dso__data(dso)->dso = dso__get(dso);
-#endif
-	/* Assume the dso is part of dsos, hence the optional reference count above. */
+	/* Assume the dso is part of dsos, holding it live while on dso__data_open. */
 	assert(dso__dsos(dso));
 	dso__data_open_cnt++;
 }
 
-static void dso__list_del(struct dso *dso) __must_hold(&_dso__data_open_lock)
+static void dso__list_del(struct dso_data *dso_data) __must_hold(&_dso__data_open_lock)
 {
-	list_del_init(&dso__data(dso)->open_entry);
-#ifdef REFCNT_CHECKING
-	mutex_unlock(dso__data_open_lock());
-	dso__put(dso__data(dso)->dso);
-	mutex_lock(dso__data_open_lock());
-#endif
+	list_del_init(&dso_data->open_entry);
 	WARN_ONCE(dso__data_open_cnt <= 0,
 		  "DSO data fd counter out of bounds.");
 	dso__data_open_cnt--;
@@ -729,13 +722,13 @@ static int open_dso(struct dso *dso, struct machine *machine)
 	return fd;
 }
 
-static void close_data_fd(struct dso *dso) __must_hold(&_dso__data_open_lock)
+static void close_data_fd(struct dso_data *dso_data) __must_hold(&_dso__data_open_lock)
 {
-	if (dso__data(dso)->fd >= 0) {
-		close(dso__data(dso)->fd);
-		dso__data(dso)->fd = -1;
-		dso__data(dso)->file_size = 0;
-		dso__list_del(dso);
+	if (dso_data->fd >= 0) {
+		close(dso_data->fd);
+		dso_data->fd = -1;
+		dso_data->file_size = 0;
+		dso__list_del(dso_data);
 	}
 }
 
@@ -748,21 +741,15 @@ static void close_data_fd(struct dso *dso) __must_hold(&_dso__data_open_lock)
  */
 static void close_dso(struct dso *dso) __must_hold(&_dso__data_open_lock)
 {
-	close_data_fd(dso);
+	close_data_fd(dso__data(dso));
 }
 
 static void close_first_dso(void) __must_hold(&_dso__data_open_lock)
 {
 	struct dso_data *dso_data;
-	struct dso *dso;
 
 	dso_data = list_first_entry(&dso__data_open, struct dso_data, open_entry);
-#ifdef REFCNT_CHECKING
-	dso = dso_data->dso;
-#else
-	dso = container_of(dso_data, struct dso, data);
-#endif
-	close_dso(dso);
+	close_data_fd(dso_data);
 }
 
 static rlim_t get_fd_limit(void)
@@ -1858,9 +1845,6 @@ struct dso *dso__new_id(const char *name, const struct dso_id *id)
 		data->fd = -1;
 		data->status = DSO_DATA_STATUS_UNKNOWN;
 		INIT_LIST_HEAD(&data->open_entry);
-#ifdef REFCNT_CHECKING
-		data->dso = NULL; /* Set when on the open_entry list. */
-#endif
 	}
 	return res;
 }
@@ -1918,10 +1902,6 @@ struct dso *dso__get(struct dso *dso)
 
 void dso__put(struct dso *dso)
 {
-#ifdef REFCNT_CHECKING
-	if (dso && dso__data(dso) && refcount_read(&RC_CHK_ACCESS(dso)->refcnt) == 2)
-		dso__data_close(dso);
-#endif
 	if (dso && refcount_dec_and_test(&RC_CHK_ACCESS(dso)->refcnt))
 		dso__delete(dso);
 	else
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index fa5669709eb3..d6b0a1a4dac9 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -261,9 +261,6 @@ struct dso_cache {
 struct dso_data {
 	struct rb_root	 cache;
 	struct list_head open_entry;
-#ifdef REFCNT_CHECKING
-	struct dso	 *dso;
-#endif
 	int		 fd;
 	int		 status;
 	u32		 status_seen;
diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 1d9d3bf57720..4507f82548e3 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -771,6 +771,15 @@ static int machine__process_ksymbol_register(struct machine *machine,
 			dso__set_loaded(dso);
 		}
 
+		if (is_bpf_image(event->ksymbol.name)) {
+			dso__set_binary_type(dso, DSO_BINARY_TYPE__BPF_IMAGE);
+			dso__set_long_name(dso, "", false);
+		}
+
+		err = dsos__add(&machine->dsos, dso);
+		if (err)
+			goto out;
+
 		map__set_start(map, event->ksymbol.addr);
 		map__set_end(map, map__start(map) + event->ksymbol.len);
 		err = maps__fixup_overlap_and_insert(machine__kernel_maps(machine), map);
@@ -780,11 +789,6 @@ static int machine__process_ksymbol_register(struct machine *machine,
 		}
 
 		dso__set_loaded(dso);
-
-		if (is_bpf_image(event->ksymbol.name)) {
-			dso__set_binary_type(dso, DSO_BINARY_TYPE__BPF_IMAGE);
-			dso__set_long_name(dso, "", false);
-		}
 	} else {
 		dso = dso__get(map__dso(map));
 	}
diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index b61a574ce9a3..686fc48841c6 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -1090,6 +1090,10 @@ static int maps__split_kallsyms(struct maps *kmaps, struct dso *dso, u64 delta,
 				dso__set_symtab_type(ndso, DSO_BINARY_TYPE__KALLSYMS);
 			}
 			dso__set_loaded(ndso);
+			if (dsos__add(&machine->dsos, ndso)) {
+				dso__put(ndso);
+				return -1;
+			}
 
 			curr_map = map__new2(pos->start, ndso);
 			if (curr_map == NULL) {
-- 
2.56.0.218.g1ec904b173-goog

