Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997474;
	b=5U74YEzypIBvIg5bVQJbsHqbxTrDMLJriQ0otQzyxYzBtpgpXZ9v9QzqsheNjS1fQSwF
	 35srysLxPpRCp8i7kO30jOqEYRjGGE1qpyVS4RExofPMYcn+lUSWvcjpbUauT063sHpEQ
	 R+HH3FScaECLADVYbFqwIER5B+iGDbTF/ZYSSdZJQFG9r8INL9IRUh85n5UxmLqnT7H2i
	 LPF8o6T/3mfEi9+Oeg7XWhPJVTUjNiNm1E2LzuLEfWaipL94RR1Bld8OiI6hcMBBcUO07
	 t6DxMsvDLJqbQR5y32WN/iaNwxBJBqolRXvvub6qL99KaYYFi3cnedXKBCM74IrUOXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=GkgE74Kof9noBWovzKmVwuhiy64Vj0vrOAvghAtEa0c=;
	b=MGy3H33Bs+HzbzjPXpw7hBmHOtL8KqWDJVTnN/Ftz1dE3dDbYxVIw5eSWSIKvKuajhZ2
	 tkz2q7jnZJ0uOOA9hi3OKjp8NkuFc2jmvLvAi8O77ngesiZD32kdRfDuQ5xjNM8zCnDKn
	 SXLZOA8HrImG9mc8EfiMSUeXpWKxBZC5bS6wVkmv4a2jYCYVllxtHQyHOqIuTCLsHTMRY
	 SEGdbepcxb+6thx/V7egyBubn0MoKvEiQV/iz04E2UlIXdbY932VirQTJJ9CeQkeZpQXr
	 yTOFRFIPXGVKwOHby24X7Xljjq7v0R9Wzt/NVh6O7vdn3k3/rG7gjAm77PjQx/I+52A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ZWqFfKpT;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2337606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2337606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ZWqFfKpT
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-186c1aae818so1023171c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792997468; x=1793602268; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GkgE74Kof9noBWovzKmVwuhiy64Vj0vrOAvghAtEa0c=;
        b=ZWqFfKpTOVAVRfllnk/3ekxMppk8CUZ0vGhwwXZp/ZT1NTOamTRCrWadiRySNWAI5J
         hHe7WIRXmD+lOQOcyJ4y2xa9gNfnPvKcMn7Rwj1auFcCEfkxsGLUbyynFoP9r4oVnFfn
         C/4MzSQsJT9rcOTSmAkYfyDUxmd4Xr5TfrhCNSB6WHFDdKU+ogjJJcW5a7oiOI1nsPPd
         f5YdYTT5ieaSTAcZ0mg3BZN+Bpb4NPxkVnE9bcb9ft6Pi4vPlL8DSTqXuysH6TsGN+yK
         McldInbBOWtqyS/BX23qhTJMwZkpf3l+vIi7juCLNF1+4/4jXpnm7Tc7OgtmWOQlTRbo
         hnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792997468; x=1793602268;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GkgE74Kof9noBWovzKmVwuhiy64Vj0vrOAvghAtEa0c=;
        b=VxdLzcv+i4lWzDk3lM1+F1kHSkynPmzKj8OSUgGZ9Wd/b24x8iRdS0tizSCg6BlHX3
         CPxhjHZckSNp8bEpr2wZRakc4ntnuQyJplVoyXH/gcMctZFCv7/4d0/bvcQ2wcsW+EGq
         Wf0ZIU5YlCfOvR3xmCh9pZ8wLs87KXSJv0V0bqFnVYcEEmUC5AIYaaAXiijjHoUeCT2H
         iQuktN2UzpWMALIZVJoUd6LB6OlzP5xbRyPpSJXzOC4aD4Zl6lB4GojeIH5rju/ev+Yw
         M1efLLlYaqkZCOMp4FjGrISDWxdcvM+SS2jLvEAVppPy/1TTTYVvaSYkrONN+EkhV3Ih
         roGw==
X-Forwarded-Encrypted: i=1; AKwUvBymN3rstwUhGyvdK8aCQ/mb1z+i3LA0G8R4rRCu70jIpuZNZ1T2w1HMBY9kg8cBSdcGc0pGZaUWUu8V+Jw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZh2xZ1yRC/+4vUDopeAcAlS26llsQVRn9uSbqMDUbbbupBOEk
	JebU7QzqmSj/3m+EWlfmwoBi4dxq9eAHL9XYhqrtY6XgLESAyXhvSG9jOwPS4dOuxg+js4eNt6i
	8EnR2SqRetA==
X-Received: from dlbsv14.prod.google.com ([2002:a05:7022:3a0e:b0:1a2:b324:b417])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1b0c:b0:144:c127:dd1b
 with SMTP id a92af1059eb24-19937bb2fb2mr11192175c88.39.1792997467592; Sun, 25
 Oct 2026 23:51:07 -0700 (PDT)
Date: Sun, 25 Oct 2026 23:50:44 -0700
In-Reply-To: <cover.1792995775.git.irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <cover.1792995775.git.irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <3de51d76f93fdc1170e9e923589fcc0605e50c17.1792995775.git.irogers@google.com>
Subject: [PATCH 2/3] perf debug: Avoid calling eprintf() in pr_debugN() when
 verbose < n
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alireza Haghdoost <haghdoost@uber.com>, Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Alessio Podda <aleph.pi.gh@gmail.com>, Michael Liang <mliang@purestorage.com>, 
	Shimin Guo <shimin.guo@skydio.com>, Tanushree Shah <tshah@linux.ibm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

pr_debugN() unconditionally evaluated its arguments and called eprintf() ->
veprintf() before checking if verbose >= n. In hot paths such as
dso__load_sym_internal(), two pr_debug4() calls per symbol accounted for
~15% of total CPU time in 'perf top' even at the default verbose == 0.

Guard eprintf() in pr_debugN() with unlikely(verbose >= (n)) and define
pr_debug() in terms of pr_debugN(1, ...).

In test__parsing_callback() (tools/perf/tests/pmu-events.c), move the
test_generic_metric(mexp, 0) call out of the pr_debug() argument list so
the metric evaluation continues to run during 'perf test' when verbose == 0.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/pmu-events.c | 5 ++++-
 tools/perf/util/debug.h       | 5 ++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/pmu-events.c b/tools/perf/tests/pmu-events.c
index f507ce39439a..e6e4f4cf1fa2 100644
--- a/tools/perf/tests/pmu-events.c
+++ b/tools/perf/tests/pmu-events.c
@@ -906,9 +906,12 @@ static int test__parsing_callback(const struct pmu_metric *pm,
 			struct metric_expr *mexp;
 
 			list_for_each_entry (mexp, &me->head, nd) {
+				double result;
+
 				if (strcmp(mexp->metric_name, pm->metric_name))
 					continue;
-				pr_debug("Result %f\n", test_generic_metric(mexp, 0));
+				result = test_generic_metric(mexp, 0);
+				pr_debug("Result %f\n", result);
 				err = 0;
 				(*failures)--;
 				goto out_err;
diff --git a/tools/perf/util/debug.h b/tools/perf/util/debug.h
index 6b737e195ce1..7552c9171d90 100644
--- a/tools/perf/util/debug.h
+++ b/tools/perf/util/debug.h
@@ -33,10 +33,9 @@ extern int debug_type_profile;
 })
 #define pr_info(fmt, ...) \
 	eprintf(0, verbose, pr_fmt(fmt), ##__VA_ARGS__)
-#define pr_debug(fmt, ...) \
-	eprintf(1, verbose, pr_fmt(fmt), ##__VA_ARGS__)
 #define pr_debugN(n, fmt, ...) \
-	eprintf(n, verbose, pr_fmt(fmt), ##__VA_ARGS__)
+	(unlikely(verbose >= (n)) ? eprintf(n, verbose, pr_fmt(fmt), ##__VA_ARGS__) : 0)
+#define pr_debug(fmt, ...) pr_debugN(1, pr_fmt(fmt), ##__VA_ARGS__)
 #define pr_debug2(fmt, ...) pr_debugN(2, pr_fmt(fmt), ##__VA_ARGS__)
 #define pr_debug3(fmt, ...) pr_debugN(3, pr_fmt(fmt), ##__VA_ARGS__)
 #define pr_debug4(fmt, ...) pr_debugN(4, pr_fmt(fmt), ##__VA_ARGS__)
-- 
2.56.0.307.g5fe7bd680c-goog

