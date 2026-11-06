Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948653;
	b=5YoprDo+P1GGcrr6oa6M8aNljL0wYgej/l+S/hah7sA5eFDpvRNQRTLU88zzREDyLy8S
	 VJdXC38q87tXNaqPXYHWJpjMiFmPJTS2c4f9TRig3IQz2rDjceA8WL4Yz1VqcDt0M3k5M
	 8dBJnvIdfS7SlmbOUOHoh+3M2cFFBjmk2tnJfwTWSCKLH1dJN6nlRPbASXmCNJUbVToUs
	 tjjwko8t1/NbRuAeqIw6PK1z8xYSURxgw5cbprR0Z1RGpx7gcMUIKeiN8n8tlXSbPaqAy
	 GZqd1Xfe6fTA59hCV+xQK7sz+hg8KzDwNRFgmeCiUSpdVsTF8yBoNwo3SG4wjlviuHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zj6YsX4Tj4P8BXnzaEP353OTjciTY2+kaiklZ9lU7mc=;
	b=j22Y6aIP9+6U/wrGqH1puk3JkduzT1s9EnFkF8YID84mQy/61orG8CrRks3EplrEnyMT
	 ynEcTXeoWJ3Uupcx7j9QWXfS1Im7ySn5q7mQFve7pg7ShVMJnfop8d4gierX3+mcyAqbL
	 UJW8AbtCQyx/rcRiYc8c4yEK/w7NC6Ia+Q05ZaIcuFa1CRTR/UgWo86D+fdxhEAnu4e3e
	 qcq5ktzypZZ3UsMC4YokvbJI+fdPesoz7hb5O9PQhTJY9+QoLgxMDEftCAblaKChEetn3
	 X1iHlkzpwtlgZXlRfWtoq0y31ZtZViwAMPl7zUOTvRUmAZ49cIpA97N5jOoCZEaguYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b0ikmBKS;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC52606D83D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFC52606D83D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b0ikmBKS
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so495910c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793948652; x=1794553452; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zj6YsX4Tj4P8BXnzaEP353OTjciTY2+kaiklZ9lU7mc=;
        b=b0ikmBKSveGPnhPyK0Mwb7J1CfZWwPrM3pydafQMyn3ugiqroOHvE8+kMvW4qticSk
         3kB7ZhnvSHWDLyxWjHkYZrkHwNaP/+NisiFWAuz2B5gemhcxwTUKvZ5vDSGQ3rjgiVvp
         iKDKkt9G7sjE3t1D9pl4xzl2WZOmHhnuUtDd7MPEgzei8Y99u6Qf2oZgId5JVeFDqHGS
         CX4t8J3L4fbBFpN3VQXEUq6l1MMo5JVvTPdanw6hQP2K6+A2u+Ckm74y+r3Fjn5SCRkU
         HixDSr6OM3BJRlT2CkmoQgofzMwdjfWfjGXfp43wi9Pbuto+fIxcey+/0JgCVTjZ9HAO
         jiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948652; x=1794553452;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zj6YsX4Tj4P8BXnzaEP353OTjciTY2+kaiklZ9lU7mc=;
        b=nsWm+6i196TXqYeGpy3+9YCEaPYf+Ix+lnRvSq6pqx5MOckp1bOtuxGJLVGt1lFTH2
         TUmKXJsfZr9jXoyjMeFNj6qeOmQnyd4pGNFqwEJ4K5Jxc8mlK2Rv57IS+qDa/YlTF11W
         v3sSwmDXat7wXtwis6WU2jgcDj0H5FOfTtqqKlr03LN2hyD2W0bmDZFIkz57syBsa4TN
         eA4y/SQxI6Y4MyrESV0N436kyTtwsfwO9jTIaekkd/o2+/H9qfStVJO3rXN0purn1ktX
         vEqUrZ+Ji7DaIwzUcYChPuW5YdiRm3BEUKwz+XSyP3y3ivdVH2jwrVD407VIv7DOn56H
         PHiQ==
X-Forwarded-Encrypted: i=1; AKwUvBydwxUFMjUU+QWLJ0avDRAa0RW5ipcCTQletEkkqSBR8ogqmvJwljOjJ5WFaG+HwhwSQrse/NCJ3LvjTN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UuP7wHIZeaHrqnJGimsvccA3IDa64BsgfBqgrp+3B5kk5Ox4q
	vkadSP00022cEewMRWRgjx/10IrCGVIhqwDzq1Mf2fr8QOqMeNZn7LQS1fpSbhXfc1IlNt6rlgb
	f05U/AR3KRw==
X-Received: from dldyq28-n2.prod.google.com ([2002:a05:701b:455c:20b0:1b2:48fb:f4d0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:a8e:b0:19a:8e3e:530e
 with SMTP id a92af1059eb24-1b25d32ea5amr2314713c88.8.1793948651489; Thu, 05
 Nov 2026 23:04:11 -0800 (PST)
Date: Thu,  5 Nov 2026 23:03:34 -0800
In-Reply-To: <20261106070344.329897-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106070344.329897-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106070344.329897-11-irogers@google.com>
Subject: [PATCH v10 10/20] perf dso: Pass dso_data to close_data_fd() and dso__list_del()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
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

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c | 44 ++++++++++++-------------------------------
 tools/perf/util/dso.h |  3 ---
 2 files changed, 12 insertions(+), 35 deletions(-)

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
index f6c60bafcde1..0c18c0f3ef88 100644
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
-- 
2.56.0.455.g6c5a503b38-goog

