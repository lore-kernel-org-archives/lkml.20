Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514244;
	b=3zmZfcG5joc26P8Fx2oRVpLX5/Qf2jorD5GawHUxjZaPm5Ur39L9z+pxoDmQsXyfjwvh
	 AZCBgyW5DYWgucMSRLmalTSC01ynuAxWghHLvf6eqonnUZwH0nUP4motQVu0YoorR7rtA
	 4MANvwvXlaMSvHAimWaHlIUXcNTZRmayuVb5JfDBEiswFyGSO78kvSHF8CPk8c+gkGFcy
	 a/1pmEG4VHZ76/eIBj/sKSmwlA0gumL27k4uoJN/C5eAuOVbTx1EHYQoC/7EzFM5LB4Rq
	 ilwLm4PlW5PD2n1/jVjRAeum+fDoJtmaKdXYXA+aHZupWbNgZOXUWecwkZ/bBOtbHRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/LwAeitRqiV6AhpsXAWScwN7IyxTF0Uu2WwuV2X0lXU=;
	b=d8ymwJ7g5+Oa2vLNJg0WUbL5ctoIP2lnWisg1Gh/TNOev3+eVVmlk4NZXY3E1OOmRnn/
	 4nSbjhpnb6q4S5VuxXJQJX361XM6iQLf68bXmswv0J71R/+IBcq7s/IMZuy9ICX/ayyym
	 w7dZNXQHQRfcsxGO84QN54BIinjYuN9lojIxrxJ1xq03SFQWjfooCzbnTtDo5XJsqdThW
	 iyV8PZAxiIlZXYa6coyGdgkiaEk25EkBOsMaJuNJdP05RslEeSmvfYJaz/EtzOHckB2lS
	 Db7ZyUvQeL+1PIPw/zil+9o1H1J0PDhGm2h1IXRRUtAXzzM8qzXUYWIX51qqyiSihTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jIl2g2mv;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2212B60A4AD0
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2212B60A4AD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jIl2g2mv
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so7473595eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792514238; x=1793119038; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LwAeitRqiV6AhpsXAWScwN7IyxTF0Uu2WwuV2X0lXU=;
        b=jIl2g2mvr6t9SavZvY1+65ME4B/zrczIQzdVPpF0lRJR+XhhYNnEzyDPb+I+or1qp0
         2GLF763prxMyfDblEdDdkv2jmVl4muk3vQuCuTtK4fyavHKQ+kmnIAeTS2BKj9X3VMfv
         oJx8xuhADk2Y1d9jj0T1G/TzDYtHoPeR9VBdGtwQf7J8zl9Lz+SUMSqvKaMaSr0hPDND
         Lll4o7o+/vOVifsEVLaM1iSab39w+YJQl66z+OZwwqL66Xx4kTstyJ7QYDeUkENcl88Q
         ap+8uy//2SsavCQh0lt5F+dooswOg6XxFtHGWVZNj1F2PXhDawIichnAXliI4X+AaG6d
         nnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514238; x=1793119038;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/LwAeitRqiV6AhpsXAWScwN7IyxTF0Uu2WwuV2X0lXU=;
        b=vPhkRB7jdCTkfmn4YdkiXPHO0ki9V6Hy1P49ix49Ve1N9fNNeRTbZxY5E2M0iQj7P1
         J3YByh77+8IcRaJfasW/gFmtz6u7T/Kr6hjN2YC+GZbnk463hu5uyzli9KQ52ecgeLQZ
         jFtbAPpKuy+J3UYpTU1PsjJsFlyKNOngrIkcBmvZzBibSUPS7oHETbcBytBFiv2yXntr
         BsD3hGQ5hqmkM74yPGMOXEZGQwe9JsTCUA4iGoALm/TwBMdGTUUOSFi1C4vX9kZlUOtl
         3ME26DRX1x3foyfYL4ZkwbyEk7R3fDE3TlXXm1XayEyF6GuAe4r7Ecw62h8boEHh7R/0
         2jUw==
X-Forwarded-Encrypted: i=1; AKwUvBzA31X7keSmnfaiYHEGMh4l1N/He2E1nVopU7/+/bmu3L9OIkSCOJoBpHHSef3YfqCz8YX2UY6V5S4GnmQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHph50pUG6QoMQNHXY1dXYAYnPB7A1Wy1tRCIVbSfyXMUOIVPN
	E67TrTQ2nJEdHwIpfRpBvi+CeUnv3fHchHxDXypg5ja7fkgCbuXGgYNZUj6vVSGEReZ1ApLJbeo
	96/Mpr4aGpA==
X-Received: from dlec18-n1.prod.google.com ([2002:a05:701b:4292:10b0:15d:9efd:93a5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea8c:b0:151:2e62:fe6d
 with SMTP id a92af1059eb24-1851238aed8mr15251249c88.22.1792514237679; Tue, 20
 Oct 2026 09:37:17 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:36:34 -0700
In-Reply-To: <20261020163640.746159-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261016221700.1282659-1-irogers@google.com> <20261020163640.746159-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020163640.746159-12-irogers@google.com>
Subject: [PATCH v5 11/17] perf dso: Expand context analysis annotations
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Annotate struct dsos fields with __guarded_by(&lock), annotate dso__data_open and
fd_limit in util/dso.c with __guarded_by(&dso__data_open_lock), and
tighten __dsos__findnew_id() and __dsos__addnew_id() from shared to
exclusive lock requirements.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/dso-data.c |  4 ++++
 tools/perf/util/dso.c       | 14 +++++++++-----
 tools/perf/util/dsos.c      | 10 ++++++++--
 tools/perf/util/dsos.h      | 13 +++++++------
 tools/perf/util/vdso.c      |  1 +
 5 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/tools/perf/tests/dso-data.c b/tools/perf/tests/dso-data.c
index 18b7052a2dc5..6ef59929e6c0 100644
--- a/tools/perf/tests/dso-data.c
+++ b/tools/perf/tests/dso-data.c
@@ -116,12 +116,14 @@ static int dso__data_fd(struct dso *dso, struct machine *machine)
 
 static void dsos__delete(struct dsos *dsos)
 {
+	down_write(&dsos->lock);
 	for (unsigned int i = 0; i < dsos->cnt; i++) {
 		struct dso *dso = dsos->dsos[i];
 
 		dso__data_close(dso);
 		unlink(dso__name(dso));
 	}
+	up_write(&dsos->lock);
 	dsos__exit(dsos);
 }
 
@@ -254,6 +256,7 @@ static int set_fd_limit(int n)
 }
 
 static int test__dso_data_cache(struct test_suite *test __maybe_unused, int subtest __maybe_unused)
+	__context_unsafe(/* single-threaded test */)
 {
 	struct machine machine;
 	long nr_end, nr = open_files_cnt();
@@ -324,6 +327,7 @@ static long new_limit(int count)
 }
 
 static int test__dso_data_reopen(struct test_suite *test __maybe_unused, int subtest __maybe_unused)
+	__context_unsafe(/* single-threaded test */)
 {
 	struct machine machine;
 	long nr_end, nr = open_files_cnt(), lim = new_limit(3);
diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 4dc518f7cb7d..5f4b4cd9a089 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -525,7 +525,8 @@ void dso__set_module_info(struct dso *dso, struct kmod_path *m,
  * Global list of open DSOs and the counter.
  */
 DEFINE_MUTEX(dso__data_open_lock);
-static LIST_HEAD(dso__data_open);
+static struct list_head dso__data_open __guarded_by(&dso__data_open_lock) =
+	LIST_HEAD_INIT(dso__data_open);
 static long dso__data_open_cnt __guarded_by(&dso__data_open_lock);
 
 static void dso__list_add(struct dso *dso) __must_hold(&dso__data_open_lock)
@@ -757,7 +758,7 @@ static rlim_t get_fd_limit(void)
 	return limit;
 }
 
-static rlim_t fd_limit;
+static rlim_t fd_limit __guarded_by(&dso__data_open_lock);
 
 /*
  * Used only by tests/dso-data.c to reset the environment
@@ -766,7 +767,8 @@ static rlim_t fd_limit;
  */
 void reset_fd_limit(void)
 {
-	fd_limit = 0;
+	/* Only called by single-threaded test setup. */
+	context_unsafe(fd_limit = 0);
 }
 
 static bool may_cache_fd(void) __must_hold(&dso__data_open_lock)
@@ -1723,8 +1725,10 @@ void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 		dso_id->build_id = id->build_id;
 		changed = true;
 	}
-	if (changed && dsos)
-		dsos->sorted = false;
+	if (changed && dsos) {
+		/* dsos write lock held by caller. */
+		context_unsafe(dsos->sorted = false);
+	}
 }
 
 int dso_id__cmp(const struct dso_id *a, const struct dso_id *b)
diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index b5c8086941d5..f8e4395d9b1b 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -12,6 +12,7 @@
 #include <unistd.h>
 
 void dsos__init(struct dsos *dsos)
+	__context_unsafe(/* initialization */)
 {
 	init_rwsem(&dsos->lock);
 
@@ -50,6 +51,7 @@ void dsos__exit(struct dsos *dsos)
 static int __dsos__for_each_dso(struct dsos *dsos,
 				int (*cb)(struct dso *dso, void *data),
 				void *data)
+	__must_hold_shared(&dsos->lock)
 {
 	for (unsigned int i = 0; i < dsos->cnt; i++) {
 		struct dso *dso = dsos->dsos[i];
@@ -182,7 +184,8 @@ static struct dso *__dsos__find_by_longname_id(struct dsos *dsos,
 		}
 		qsort(dsos->dsos, dsos->cnt, sizeof(struct dso *),
 		      dsos__cmp_long_name_id_short_name);
-		dsos->sorted = true;
+		/* write_locked is true, so dsos->lock is held exclusively. */
+		context_unsafe(dsos->sorted = true);
 	}
 
 	res = bsearch(&key, dsos->dsos, dsos->cnt, sizeof(struct dso *),
@@ -194,6 +197,7 @@ static struct dso *__dsos__find_by_longname_id(struct dsos *dsos,
 }
 
 int __dsos__add(struct dsos *dsos, struct dso *dso)
+	__must_hold(&dsos->lock)
 {
 	if (!dso)
 		return -EINVAL;
@@ -285,6 +289,7 @@ static struct dso *__dsos__find_id(struct dsos *dsos, const char *name, const st
 }
 
 struct dso *__dsos__find(struct dsos *dsos, const char *name, bool cmp_short, bool write_locked)
+	__must_hold_shared(&dsos->lock)
 {
 	return __dsos__find_id(dsos, name, &dso_id_empty, cmp_short, write_locked);
 }
@@ -319,6 +324,7 @@ static void dso__set_basename(struct dso *dso)
 }
 
 static struct dso *__dsos__addnew_id(struct dsos *dsos, const char *name, const struct dso_id *id)
+	__must_hold(&dsos->lock)
 {
 	struct dso *dso = dso__new_id(name, id);
 
@@ -335,7 +341,7 @@ static struct dso *__dsos__addnew_id(struct dsos *dsos, const char *name, const
 }
 
 static struct dso *__dsos__findnew_id(struct dsos *dsos, const char *name, const struct dso_id *id)
-	__must_hold_shared(&dsos->lock)
+	__must_hold(&dsos->lock)
 {
 	struct dso *dso = __dsos__find_id(dsos, name, id, false, /*write_locked=*/true);
 
diff --git a/tools/perf/util/dsos.h b/tools/perf/util/dsos.h
index 857a79fd8805..cc7e3a42f9cb 100644
--- a/tools/perf/util/dsos.h
+++ b/tools/perf/util/dsos.h
@@ -19,18 +19,19 @@ struct machine;
  */
 struct dsos {
 	struct rw_semaphore lock;
-	struct dso **dsos;
-	unsigned int cnt;
-	unsigned int allocated;
-	bool sorted;
+	struct dso **dsos __pt_guarded_by(&lock) __guarded_by(&lock);
+	unsigned int cnt __guarded_by(&lock);
+	unsigned int allocated __guarded_by(&lock);
+	bool sorted __guarded_by(&lock);
 };
 
 void dsos__init(struct dsos *dsos);
 void dsos__exit(struct dsos *dsos);
 
-int __dsos__add(struct dsos *dsos, struct dso *dso);
+int __dsos__add(struct dsos *dsos, struct dso *dso) __must_hold(&dsos->lock);
 int dsos__add(struct dsos *dsos, struct dso *dso);
-struct dso *__dsos__find(struct dsos *dsos, const char *name, bool cmp_short, bool write_locked);
+struct dso *__dsos__find(struct dsos *dsos, const char *name, bool cmp_short, bool write_locked)
+	__must_hold_shared(&dsos->lock);
 struct dso *dsos__find(struct dsos *dsos, const char *name, bool cmp_short);
 
 struct dso *dsos__findnew_id(struct dsos *dsos, const char *name, const struct dso_id *id);
diff --git a/tools/perf/util/vdso.c b/tools/perf/util/vdso.c
index 93828e660672..fc75c0cf372f 100644
--- a/tools/perf/util/vdso.c
+++ b/tools/perf/util/vdso.c
@@ -126,6 +126,7 @@ void machine__exit_vdso(struct machine *machine)
 
 static struct dso *__machine__addnew_vdso(struct machine *machine, const char *short_name,
 					  const char *long_name)
+	__must_hold(&machine->dsos.lock)
 {
 	struct dso *dso;
 
-- 
2.56.0.212.g129ede20d9-goog

