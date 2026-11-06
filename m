Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948659;
	b=Q/WTa3S947C/H6JCTUd4CLmP13nCvV/IQlGHX0qDD84t1tDwyUoMvslB1FEnVdUGqygi
	 F4NjtPtkHyiPYWo0LaWDs/nXb0qJ4qultz7nwVDaXSO22xzl78BBtw/cajk2sY2HyHHuA
	 R2hVXd1jsAx4QAQkDtGd7dfHeO+kw2rDe/gFf6HKRaIZSjXU5uRaQDv5u6W7kfPjxKky3
	 f6X+KJUVFKLbA0/siVTYPxF2rYdgdcZ9sgkcwajf0RoJeqpF5qAHalingq5d3ZqEO12qN
	 BzJBbPzt5EBtTYw5BFW4Rz/x94TWJjd0ZrgQ2xENSneKquWJnt4SfnE1KJd3zh3xu8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=EDmeF/auIXKu1URb5xeGAG2MsbxzBhazL93JWwVXPks=;
	b=dPnPDHudzNCrVKvVqIGv3u7CCch4wv5IAl2fNJMLoevCezLnbOcAWUVfDiJcF9hxY7qY
	 tkvtNxgfyoIFXyBEhiUSzNi9L8GIJuvq3nswnMBmOxyF3L+HZ1RL71o+aG2PsaJdCanbA
	 /6zO0eKgEm23xRpCDFklIy8fud19keb3iG7OhxOriT5yXYSWUkO1iK3p+dEsu785O4XN8
	 YDt/EVj5F15tJJWKkfrmXxO46pNNPXUEwwhkbJoZKEX77Vpe3G/P8sOONRIZGFTNien6B
	 jcD2SSOf0POj27PJ7O3X+vH3ORQ0VdZiKtuao6vgcdLWWYmoyCIceKWNNKmgHCHKD8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e9iAAmEh;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F09606EE84
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6F09606EE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e9iAAmEh
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1aa0fb7f157so987094c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793948658; x=1794553458; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EDmeF/auIXKu1URb5xeGAG2MsbxzBhazL93JWwVXPks=;
        b=e9iAAmEhlmMYl5ZUV/li0yv3XqSJhJEqh84gU8+6cKjuxE2A2xdZasIPTnvdoEvXeh
         r1BWox/LHl5joPwDXmbkGCvpmpJVFG6XA5tN/ca2mqAEaAToYqhocvnQPKSQVSFMzmZ4
         HlH6USbqSha/F47NYMgHt+Ax5PRPua5kLwBCd1NZfh0IOc5bGiTOvPKWr1EADBII/Kdv
         OMcgc47Yz+N9PaMOUIBF2feTmEdBFlSoiKxtdrtd8p2sAPWGH8H11jv0dlOV2fd27hHt
         wfhsLBwSrEtpYH7EjQmGY7tgS4mHS5I0IHWMABzBYT1tlx68RpoUkjcwGlFLsmNE6+Be
         6I9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948658; x=1794553458;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EDmeF/auIXKu1URb5xeGAG2MsbxzBhazL93JWwVXPks=;
        b=hvYsNnMX8sMKOD2c0II/s7EdQydmOaIsSIJTEDa7Vep/lRZhPvwsbzL74+Imng1Fhz
         YhwmYmzGv6mRIf7p17AwP8NsuvCrselhDqZB8fmsPpxLzw1+lSzS2gVAoiYz+lCY+bAL
         6OC1OHAjIGw5bZWCpCDYW6xXpZ30RXrEyiosO3R4aXb2UgJ1+HOBAPL0WM8F26Pmt3KC
         d3u2pfhI9oNlBHFQCxK8xq8ktxU7xwXS6WZ6Sl8YWt3kI4lLCtuj/V/Uv+X1ycl4ZJkp
         F3D9n5DPYA39fchg/OiIWzK5p/NyxiE5q6LlENDvpVKuJ53bObftuVq/ri//awefUtvu
         FLvQ==
X-Forwarded-Encrypted: i=1; AKwUvBySBVIiMiOTRVJ5ok7QwaLsosPujC8ZeVuB8fUV8R9mkMWQC7Xpm+ER/nL41T6cTmwwj00QBQy2KdlNZ5Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IFEar7RvaFwujd3cko7d6t7fYYGNsr2y5roeDog4DZHjUydsS
	RDwMZGJZbYgZL0KCeruJqXl6Tbdcb10wMncDATEpsAkLsyLpNE+RRfXQ3Z1e3NTVn/2Q+hH9X1f
	xGS1MMtM7gw==
X-Received: from dyvs14.prod.google.com ([2002:a05:693c:42ce:b0:36d:d73d:fc3e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b0cd:b0:14c:1f57:3e86
 with SMTP id a92af1059eb24-1b25d3b00bdmr1703920c88.47.1793948657549; Thu, 05
 Nov 2026 23:04:17 -0800 (PST)
Date: Thu,  5 Nov 2026 23:03:37 -0800
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
Message-ID: <20261106070344.329897-14-irogers@google.com>
Subject: [PATCH v10 13/20] perf dso: Expand context analysis annotations
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Annotate struct dsos fields with __guarded_by(&lock), annotate
dso__data_open and fd_limit in util/dso.c with
__guarded_by(&dso__data_open_lock), and tighten __dsos__findnew_id() and
__dsos__addnew_id() from shared to exclusive lock requirements.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/dso-data.c |  4 ++++
 tools/perf/util/dso.c       | 14 +++++++++-----
 tools/perf/util/dsos.c      |  9 +++++++--
 tools/perf/util/dsos.h      | 10 +++++-----
 tools/perf/util/vdso.c      |  1 +
 5 files changed, 26 insertions(+), 12 deletions(-)

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
index 1b3f8b84ed30..7f3a6dabf8a7 100644
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
@@ -320,6 +324,7 @@ static void dso__set_basename(struct dso *dso)
 }
 
 static struct dso *__dsos__addnew_id(struct dsos *dsos, const char *name, const struct dso_id *id)
+	__must_hold(&dsos->lock)
 {
 	struct dso *dso = dso__new_id(name, id);
 
@@ -336,7 +341,7 @@ static struct dso *__dsos__addnew_id(struct dsos *dsos, const char *name, const
 }
 
 static struct dso *__dsos__findnew_id(struct dsos *dsos, const char *name, const struct dso_id *id)
-	__must_hold_shared(&dsos->lock)
+	__must_hold(&dsos->lock)
 {
 	struct dso *dso = __dsos__find_id(dsos, name, id, false, /*write_locked=*/true);
 
diff --git a/tools/perf/util/dsos.h b/tools/perf/util/dsos.h
index dbd06f420753..cc7e3a42f9cb 100644
--- a/tools/perf/util/dsos.h
+++ b/tools/perf/util/dsos.h
@@ -19,16 +19,16 @@ struct machine;
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
 struct dso *__dsos__find(struct dsos *dsos, const char *name, bool cmp_short, bool write_locked)
 	__must_hold_shared(&dsos->lock);
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
2.56.0.455.g6c5a503b38-goog

