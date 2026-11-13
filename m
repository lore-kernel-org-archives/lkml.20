Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588158;
	b=c6gQaTTQj6RzsP08RJjjloiWEy8V/eXwnnqA0P9DO/dlstvIPe0qp3XZ/daxAW5CeqQ0
	 HbxkNz+hwsvSvp6Vdx07xSmpcQM8mMC1TtvyfbuqLyvTw5eeSg+Ljr1P1O4SanRodhmbn
	 mGbAezT+WSMfl8quuPnhsqPt5iBUMkCRCPQEaaVq4nBh//E65dMevkQ0TkNjyyV2o9uwQ
	 HGQsMRuqjSMiITyt+qg3S9jVxKUcNBNYBD21j/tZ+2DuXmpSSDZ6Lzy9e32uK2sLKjYwN
	 cgIrpbOG9oRa6EfPspQdfagJkmlBKrH3yajRGthcrQ4nh/snKTPJrY2mKKebAOq8mHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Me5yfIzDRGI7/xvPxV35hthDkGXlSHz/rORd9jtaqKo=;
	b=M3rAp3jLfCM3ckGHcBHW7th+m2vqfFZATgAWbHieIqoL2D7hFpkl0dKc0yTIxLKGr5JM
	 Vl+X7k3WQA72gp72eC+bICpE1x6meR5TUtJ4wigjAZPdqvQGtedzk5pEA25LcQDXUeBZp
	 SVac+JuyCc13auZSP6gq48qXxkirUWnDdeXEDRnT10Z8MIno+QfnWtseBWaAwEzVDMwc+
	 5XUKHApnwPwSqRCvjT4oNeHMG45EIW+ECn8LB3fRsIBQCLxfsg+cECj7UthoPZZEspIDT
	 szJdoy9oP/ZobDQ3KVjMQ29B3mkWElEHKPe2DlFX+rBQnBtHZVUV6MqnhgXObm9aTyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AfrOrdF0;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF036074E14
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAF036074E14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AfrOrdF0
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1739125eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588157; x=1795192957; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Me5yfIzDRGI7/xvPxV35hthDkGXlSHz/rORd9jtaqKo=;
        b=AfrOrdF0DbjjjVl2799XgV5rVH458X+uEeRIFQqxiRh3sPFGhMhlN5tALRMgloQ+Es
         /MzkJX2N+Fnc4Pt59wE2tc2Wq3xCxSiotreEvntrxuBr48RNLi4eYg8/6ww2n+QZW0OP
         5hOqtw6JL91rx1jYZDB6UQlS9yPyL6AHvZC1GBBO1iXjNZpXHEt2YelXygvtrzDdbfJR
         seFFNQohfoxFi4f0ChYWSWohj3apGnFzs3pjrjcNy1MGlmQnV5eMSuNOIPenACGQf5kx
         Zx3kLS8E/uM/ButS4AwHfQBchLSnS6SrY4gS7p1H0sWUgG0fiRHakyQloDlkNZTTSo+W
         LYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588157; x=1795192957;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Me5yfIzDRGI7/xvPxV35hthDkGXlSHz/rORd9jtaqKo=;
        b=1Jv0RSoyUCaItHJPaTZT+4oIIK6+VN/j5weno983UMao1+AWzrUbjFYHAWECjVACTf
         W4gXyvaCxNsRnwcMbuE6wb2ksYxz0P+N70IMuFW31Dab4wwcl3plbL3sBhy3NMrz66Ey
         KBPslEyLjlpNmCJt5OFOG08KpjPDkfTW7fFrNO7I/KkETs50eYF4N5l6pBNExzcb8JYo
         nIGqQMXwP69783MLz4fT9K+LtXwwLyfPcrCyof63VYoIsGcYZz0IEnvf9xHSsGoDDJ4W
         yTQoDYgfHjsemdxwSWjb9U/3DlYh/SSveMW6TspMf5InIt1LaZaFJUpa99H5ig9BfTjL
         gfzw==
X-Forwarded-Encrypted: i=1; AL+hErGlTSbbMoRJDyKM1iUwYLjvv+kbRzGovNtvzmLEM1d97m5pwb23QwVS4H9PlVghE+ZYAtaueYhVIKtFeYI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8td7Ds7wiIJ1aU09fHWOh8aKKg6RfjT8JxFMR7b43nuURz55Qr
	Zq8JJWqLI/Vh6zMMHxE6OwXUVnHnJ0Gy6V5ck/zJlL+91thBsA73zb9PimH3YJ1dqyiCKEuEYzx
	jRkkmOtN29Q==
X-Received: from dlbuy12.prod.google.com ([2002:a05:7022:1e0c:b0:1b0:166c:6a91])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4508:20b0:163:c5eb:d42f
 with SMTP id a92af1059eb24-1b503060401mr2912951c88.5.1794588156804; Fri, 13
 Nov 2026 08:42:36 -0800 (PST)
Date: Fri, 13 Nov 2026 08:41:49 -0800
In-Reply-To: <20261113164152.2095566-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113164152.2095566-19-irogers@google.com>
Subject: [PATCH v13 18/21] perf env: Add __guarded_by and __must_hold annotations
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Add __guarded_by(), __must_hold(), and __must_hold_shared() annotations
to the bpf_progs and cgroups trees and helpers in struct perf_env.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf-event.h |  5 +++--
 tools/perf/util/env.c       |  1 +
 tools/perf/util/env.h       | 19 +++++++++++--------
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/tools/perf/util/bpf-event.h b/tools/perf/util/bpf-event.h
index da4eeb4a1a73..3f3323f98f49 100644
--- a/tools/perf/util/bpf-event.h
+++ b/tools/perf/util/bpf-event.h
@@ -6,11 +6,11 @@
 #include <linux/rbtree.h>
 #include <api/fd/array.h>
 #include <stdio.h>
+#include "env.h"
 
 struct bpf_prog_info;
 struct machine;
 union perf_event;
-struct perf_env;
 struct perf_sample;
 struct perf_session;
 struct record_opts;
@@ -42,7 +42,8 @@ int machine__process_bpf(struct machine *machine, union perf_event *event,
 int evlist__add_bpf_sb_event(struct evlist *evlist, struct perf_env *env);
 void __bpf_event__print_bpf_prog_info(struct perf_bpil *info_linear,
 				      struct perf_env *env,
-				      FILE *fp);
+				      FILE *fp)
+	__must_hold_shared(&env->bpf_progs.lock);
 void bpf_metadata_free(struct bpf_metadata *metadata);
 #else
 static inline int machine__process_bpf(struct machine *machine __maybe_unused,
diff --git a/tools/perf/util/env.c b/tools/perf/util/env.c
index 50993b0dedc5..9e8e5d1d822a 100644
--- a/tools/perf/util/env.c
+++ b/tools/perf/util/env.c
@@ -302,6 +302,7 @@ void perf_env__exit(struct perf_env *env)
 }
 
 void perf_env__init(struct perf_env *env)
+	__context_unsafe(/* initialization */)
 {
 	memset(env, 0, sizeof(*env));
 #ifdef HAVE_LIBBPF_SUPPORT
diff --git a/tools/perf/util/env.h b/tools/perf/util/env.h
index 23d35425efe3..6b2083e3640c 100644
--- a/tools/perf/util/env.h
+++ b/tools/perf/util/env.h
@@ -139,16 +139,16 @@ struct perf_env {
 	 */
 	struct {
 		struct rw_semaphore	lock;
-		struct rb_root		infos;
-		u32			infos_cnt;
-		struct rb_root		btfs;
-		u32			btfs_cnt;
+		struct rb_root		infos __guarded_by(&lock);
+		u32			infos_cnt __guarded_by(&lock);
+		struct rb_root		btfs __guarded_by(&lock);
+		u32			btfs_cnt __guarded_by(&lock);
 	} bpf_progs;
 #endif // HAVE_LIBBPF_SUPPORT
 	/* same reason as above (for perf-top) */
 	struct {
 		struct rw_semaphore	lock;
-		struct rb_root		tree;
+		struct rb_root		tree __guarded_by(&lock);
 	} cgroups;
 
 	/* For fast cpu to numa node lookup via perf_env__numa_node */
@@ -223,7 +223,8 @@ int perf_env__nr_cpus_avail(struct perf_env *env);
 void perf_env__init(struct perf_env *env);
 #ifdef HAVE_LIBBPF_SUPPORT
 bool __perf_env__insert_bpf_prog_info(struct perf_env *env,
-				      struct bpf_prog_info_node *info_node);
+				      struct bpf_prog_info_node *info_node)
+	__must_hold(&env->bpf_progs.lock);
 bool perf_env__insert_bpf_prog_info(struct perf_env *env,
 				    struct bpf_prog_info_node *info_node);
 struct bpf_prog_info_node *perf_env__find_bpf_prog_info(struct perf_env *env,
@@ -233,9 +234,11 @@ void perf_env__iterate_bpf_prog_info(struct perf_env *env,
 						void *data),
 				     void *data);
 bool perf_env__insert_btf(struct perf_env *env, struct btf_node *btf_node);
-bool __perf_env__insert_btf(struct perf_env *env, struct btf_node *btf_node);
+bool __perf_env__insert_btf(struct perf_env *env, struct btf_node *btf_node)
+	__must_hold(&env->bpf_progs.lock);
 struct btf_node *perf_env__find_btf(struct perf_env *env, __u32 btf_id);
-struct btf_node *__perf_env__find_btf(struct perf_env *env, __u32 btf_id);
+struct btf_node *__perf_env__find_btf(struct perf_env *env, __u32 btf_id)
+	__must_hold_shared(&env->bpf_progs.lock);
 #endif // HAVE_LIBBPF_SUPPORT
 
 int perf_env__numa_node(struct perf_env *env, struct perf_cpu cpu);
-- 
2.56.1.703.gf848ed807c-goog

