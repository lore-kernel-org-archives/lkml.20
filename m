Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F7039AD5E
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790449498; cv=none; b=qzoWEZaKwPXnUZeXMBe0oHSbBoYKIdmy/nbHngBTuob3q0K6RSOlDih2Bdm0xodklEvDxflMzsgUiCozVlfcK7W3yK6fwsRaeOMczk3O45RooXi3Y/sfDkcLdC/TncXgEkXLKUfRzDxpUpdVWlOjw+Jjq9B87U/qdwR2sb1Ufr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790449498; c=relaxed/simple;
	bh=JsjWOn/Ig6TvpTUnWlM9GCCVCkgc+Omf00J9318U2AA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ulmuU/Pzp0WGWBdFm87Wqs66EztY/vVY0++ymxmhcQZ3GWuJwZixE2gqdO8zPLR4ocq7Mz5nSuabXUiy9D9BAGAmgLm6RBCvfexUdgaQi/Jq1Ssdeaknp/QHxJGHX4p86F6wjdy0WQZI2mmGsofXBBO/DntS4SzNEwdmh0LDWGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lE9l3z7j; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lE9l3z7j"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488780459e2so1847711f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790449495; x=1791054295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=moYt9xjLjCCJeOMnvr2pWP4tP6d9gyEqKgc2feoMj+E=;
        b=lE9l3z7jw2gRqKXDBmXQp4OBNZO/UQGkM2fNv5u6WYY7JH60+dfjP1zI/JMEO4kTm0
         8XuPPEqIF16az2AJ1/GUXRw4YR7qAXLXy25Xblg7GrXohT9DrHb+ZRLIgTIJH4QOC3N1
         8MaA25RL1JqP7Xx9gKPzgLGGWfMojQmIve5LbFiCgr6Jwn9AJ1TV3XbMfGjEZSVNLZDJ
         pGtekaDB6Ywu2ylJEtosm5kCWFxLha0LLzbLKkFMa4vbA4a5YcqtqmWo2AeSKnHEQXDd
         xZ71du9JVh0YL1PNMQF+uelJ7a0Sl7c2P1WbWBga8ReqUFeR4DFxKSN1JjMe3PrkmzKY
         8x+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790449495; x=1791054295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=moYt9xjLjCCJeOMnvr2pWP4tP6d9gyEqKgc2feoMj+E=;
        b=LDdegquL56ENQismkmxwiFxaCzy7dGqTl10l/H0+7DvUFrVkQg7RNUPPwgzc5MeD/S
         AECagtsiFham8NxvDymig64yGHCDAxSQtDSwEHb/hU9psHYCVzFx3moDyIBkZiIPABfn
         WA+1cN2MdE5eTtxkicAcl5MXMFh29nlSMQ9zXHiIN3VfeQHiH04qskJu2RVa0OVuGqrL
         umnmVQ8f3Xtpy6neThsLC5MG84fouBK+zEsXYhdAIGh4fJ0FaH5+Vi0Q2QUwxB/8OFbW
         kHqWuzVg3tf0qDfcBp8W5xJlYIZFOqUTsUwWaX/4A5BYskxgenDa5Cc//5cVhxLurjYt
         28/g==
X-Forwarded-Encrypted: i=1; AKwUvBzx4egPgeXMBFRUKrjoS/wdqpZgefh60VRjyr/GJiA5Z6fD/EPIgjW0uM2asPI9PisA9nLvKiuWzH8c0XQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuCz98YhbtfmEFGy/fzxOXP8WocQSLz4vSAb3hX6RfFjPYsSnW
	L2cykwG7OVJ/urDNyDqFvoSUSgnTNS6DyT51Du2JrkK/GPq776x20ThQ
X-Gm-Gg: AYBFou21ybReQmeEPJjEX8emhbyNfvWv6Ansv86wmzsTp2IUZJYcg9ZwChB2hUtnnZd
	AaMyRbE2Wmw91TFtEef8wJYt03bDBnqztuu6kDre6de2DH6Ej6C5UE+o1diS3jaiDLEnisdcpNc
	OmNK82DQDIdZ3KiRITDwIWHfBVyqgdZiEaiKI0u0h8nYwkN/eDTgVGGWLRlcTqNQxwA0nzl2ehI
	AZqXHcxSahIXe8bPxW7OahyBFGPCR+3B4xwFuAGnlLcMQzgwxLAmoNq1NkNG38VZWQ3tW9SB0Kv
	dPYEY0Hp6165Ei9zSw8X1NnS6ZotXxzVsjFiWjz4Gm8X4Eu8CouBff/NqVfkIRehW40HaGOEhj3
	QmaygCiS5/K23uooHz34h+pFFSR0IkXeQvOnIizkyHOIrvkMzc3A6IUrI5Mj6ECdUtpQQvRQa2w
	3FyJp9aqUyDLHBYfXwj9TR8NOXBXe7Dudh5chM5RlY+sq7tigDOCljLXynEmyxdt1T4DnzYl57A
	vF2PRQwgz1mTVOc0WEkpda/zpHTonLGxLP2NHKjlK7vYCXVQlwPs0iSX9xLj6D6OrBda6AOE8a2
	LhzhqZ9HMSr4gOunSldYlAJ/bggUCq14Nq75Lw7JySewWbspmEw=
X-Received: by 2002:a05:6000:384:b0:488:63f2:8766 with SMTP id ffacd0b85a97d-48871728c55mr16484789f8f.21.1790449494691;
        Sat, 26 Sep 2026 12:04:54 -0700 (PDT)
Received: from mikebook.tail5724d6.ts.net (83-244-142-114.cust-83.exponential-e.net. [83.244.142.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm15216880f8f.9.2026.09.26.12.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 12:04:54 -0700 (PDT)
From: Michal Pluta <michalpl2003@gmail.com>
To: acme@kernel.org,
	namhyung@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 4/8] perf bench futex: Reject invalid -q, -f and -b values
Date: Sat, 26 Sep 2026 20:04:03 +0100
Message-ID: <20260926190407.1106421-5-michalpl2003@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926190407.1106421-1-michalpl2003@gmail.com>
References: <20260926190407.1106421-1-michalpl2003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some values make a futex benchmark hang or are silently ignored.

'futex requeue -q 0' never finishes, because no thread is requeued.
'futex hash -f 0' never finishes either, because with no futexes the
workers never notice that the run is over. A negative -b is treated as
if it had not been given, and the kernel simply auto-sizes the hash.

Print an error for these values, except for -b -1, which still means
automatic sizing.

Fixes: 0fb298cf95c0 ("perf bench: Add futex-requeue microbenchmark")
Fixes: a043971141f1 ("perf bench: Add futex-hash microbenchmark")
Fixes: 60035a3981a7 ("tools/perf: Allow to select the number of hash buckets")
Assisted-by: LLM
Signed-off-by: Michal Pluta <michalpl2003@gmail.com>
---
 tools/perf/bench/futex-hash.c    | 3 +++
 tools/perf/bench/futex-requeue.c | 4 ++++
 tools/perf/bench/futex.c         | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/tools/perf/bench/futex-hash.c b/tools/perf/bench/futex-hash.c
index 32b88df8ee6d..710c253cfe17 100644
--- a/tools/perf/bench/futex-hash.c
+++ b/tools/perf/bench/futex-hash.c
@@ -161,6 +161,9 @@ int bench_futex_hash(int argc, const char **argv)
 	if (!params.nthreads) /* default to the number of CPUs */
 		params.nthreads = perf_cpu_map__nr(cpu);
 
+	if (!params.nfutexes)
+		errx(EXIT_FAILURE, "-f/--futexes must be at least 1");
+
 	worker = calloc(params.nthreads, sizeof(*worker));
 	if (!worker)
 		goto errmem;
diff --git a/tools/perf/bench/futex-requeue.c b/tools/perf/bench/futex-requeue.c
index 5d4708f40c60..bc6efc2ecadb 100644
--- a/tools/perf/bench/futex-requeue.c
+++ b/tools/perf/bench/futex-requeue.c
@@ -207,6 +207,10 @@ int bench_futex_requeue(int argc, const char **argv)
 	if (params.broadcast)
 		params.nrequeue = params.nthreads;
 
+	/* A regular requeue that moves no threads would never finish. */
+	if (!params.pi && !params.nrequeue)
+		errx(EXIT_FAILURE, "-q/--nrequeue must be at least 1");
+
 	futex_set_nbuckets_param(&params);
 
 	printf("Run summary [PID %d]: Requeuing %d threads (from [%s] %p to %s%p), "
diff --git a/tools/perf/bench/futex.c b/tools/perf/bench/futex.c
index 1968c9d00b5b..5757d47f8f7c 100644
--- a/tools/perf/bench/futex.c
+++ b/tools/perf/bench/futex.c
@@ -17,6 +17,9 @@ void futex_set_nbuckets_param(struct bench_futex_parameters *params)
 {
 	int ret;
 
+	if (params->nbuckets < -1)
+		errx(EXIT_FAILURE, "-b/--buckets must be -1 (auto), 0 or more");
+
 	if (params->nbuckets < 0)
 		return;
 
-- 
2.43.0

