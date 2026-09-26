Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09393932EF
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790449496; cv=none; b=dX6xSsleqkDhSzzDDiy20sDnVYTvDl1a89+QHejLGALWaJSgSYMRhX4tFCfRuWr+sUizASVEtkI3LtBMMrhP4jvByyT6Coa4i0+99eNw/aM+EYXRKsD2xOUxZQ0GTrEy7lKOj0XkxqpDw3zmchszLQQ0sT5gU4+o13tTtLHxnzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790449496; c=relaxed/simple;
	bh=V3XiUh5nnx1gn42dOp/mUNnAwFgjdsBCrh/AMawRcCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pxRQl1QeVOHin2lH+r945qTRmrQwyaiTPDh747lDqPHIu7qABtVKJLnPz5I7qs44jg5hTcQQ+fSQQvzFZ51X3WlhXI1Um5EJSkEA3lVj8+8Qh2o02KcRKnG1cgDJU2EKpSiE7msFph8QbZ07//Rrr1ZxeLseJ6KlLbqanuBAx5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6YMJLgZ; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6YMJLgZ"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48877902c99so1670088f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790449493; x=1791054293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Z3mExGBP/NAQOTT2WR7fMc/rt+qt2PR/9Q+VQL5svM=;
        b=E6YMJLgZ6MZjiYFv8jvh07mLItu8W45RaqGd8MND/T81sCL/mApODiLRGEgjUGtN8X
         EHLNjgTUgbeA1uPC/jL0EhG/NLFX87RYH5hBiRE2jxyt9AnjAmPD324M3AGWpjT/jmjS
         ygwnpEasLeFVBfD6lzEbZHzSWpVyIBaJP39Em4QYsTCukRxKOwAH/3NyOx8jYPe7AMkK
         TGAwCi9WCRDISKomYFUC6KfVhxgGfvC8ATzvLN53vPEly65BBkR3mKGHRaMlomqZnCkv
         JBvuluHYr4sKPlp561CRyANqXR4sP6zS++OiknBBv+zissFF82alFJaGWzjQHjv8cHd4
         ZW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790449493; x=1791054293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Z3mExGBP/NAQOTT2WR7fMc/rt+qt2PR/9Q+VQL5svM=;
        b=h+VxiVQQStXVxF3Midg48GAP6e2eslQja7nDLq43zSxzkfdbjBTBgzWOgPumz7GUDs
         +EzLgUtzL6dV60FkvyauyioxtEUUMRmGpdGpGjg6n5JG41YjUg0W2gijHWIKD62qcCZP
         P0eNRkCq8meS+IWwPS+77DYIEAkXAMLxZUke9L29NSowPehQP1b+4cM26AP1kdewFz0d
         dDoFU12+xf9e4kHwUF1raSuRJf/Okb25jD58Efnu8IBGJphY63YyXtVBbGk67i8jQq+V
         j1BiSzckElWyVdtvE+ZAMus/6vETNg1h9daPziApzJ5iY2yUh95fqDwLMkwKO7zTYI2u
         6UpA==
X-Forwarded-Encrypted: i=1; AKwUvByUKT3u5DXYDtAaZ+MeKwLoG6VcaqCJBibikQFDnnHVmja1BGlTX1LCsuOZcHOIRX1UoyDSWHWBTd1dIX0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3xaSRI15TmRjgi3Wy5lzwGR9/cCBCs65aN32lmLNg9qKwqMmn
	0HhBKm/PkolF+J9r+RFa/N4RUc2W0HbbLAFIpr9Xb8gnJJNRtvHkRj8b
X-Gm-Gg: AYBFou0FxoltXzpGPP+0zMfg3bxykCysUuGak6pZrVhnYzEl8nZ2MxtUhn3k12yd6zt
	BfvbjCWC8oCqaOnfNzAJeCWJM5LNoM76yuQX76d2fP47+j29XX57p0UcsWLSGf8WaG6L6+I9/7f
	1vvdO5DZ5/WrvCSb/gpLJC+PKdFE4TNi6k1vOEapCH+NenXqCS3KPyPsalj6fbt0ATuB04aqTxk
	WixvfFh6h4Eq7CC8tPpFELtTqUMUd4o8TebvuB8e/7Ze4JRKZG1KDADSanpXEt1y2LJvbLrXlJs
	wyA6PkXLfoYsJfZHGLVwfvHPDii0+LS+CCkOq3Dmw39PcLNZdJ8uUtpa1+Kjc5QnxVVz7IWEjRE
	oU9N8J5vO0UNjcADSNYPc9X88KMpK+BxvoMsbmO+JVhae+ccP9jAQi4ymDlvhzwjLdOb3DsXpw9
	qKwsZHavPD3TaUNczOWF150IB4NPEEFiquronpckaJcpAESVJe8ynmCzrPSba1C8gXbFHAE7hKF
	A8YfDzsoDQWnIyaONkxqv/FFVyWCaBgBtCNMm/h9dG0zSx+6V/Bcoh2vDexGvJBUV2M1LBj9rqr
	vEYkFQPXjANl8fypiGVxyDFZ4yojVLWuWcR94abCFBB6aZ5xebk=
X-Received: by 2002:a05:6000:41c9:b0:487:f31:8037 with SMTP id ffacd0b85a97d-488716c227cmr16665554f8f.14.1790449492843;
        Sat, 26 Sep 2026 12:04:52 -0700 (PDT)
Received: from mikebook.tail5724d6.ts.net (83-244-142-114.cust-83.exponential-e.net. [83.244.142.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm15216880f8f.9.2026.09.26.12.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 12:04:52 -0700 (PDT)
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
Subject: [PATCH 2/8] perf bench futex: Set the number of hash buckets in futex wake
Date: Sat, 26 Sep 2026 20:04:01 +0100
Message-ID: <20260926190407.1106421-3-michalpl2003@gmail.com>
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

'perf bench futex wake -b N' fails unless N happens to be the number of
buckets the kernel is already using:

  $ perf bench futex wake -b 128
  Requested number of hash buckets does not currently used.
  Requested: 128 in usage: 64
  perf: prctl(PR_FUTEX_HASH): No such file or directory

The other futex benchmarks call futex_set_nbuckets_param() to ask the
kernel for the requested size, but 'futex wake' only checks afterwards
which size is in use, so the request never reaches the kernel. The call
now happens before the run summary, as in the other benchmarks.

Fixes: 60035a3981a7 ("tools/perf: Allow to select the number of hash buckets")
Assisted-by: LLM
Signed-off-by: Michal Pluta <michalpl2003@gmail.com>
---
 tools/perf/bench/futex-wake.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/bench/futex-wake.c b/tools/perf/bench/futex-wake.c
index 66d30ca91405..58427bb55c03 100644
--- a/tools/perf/bench/futex-wake.c
+++ b/tools/perf/bench/futex-wake.c
@@ -175,6 +175,8 @@ int bench_futex_wake(int argc, const char **argv)
 	if (!params.fshared)
 		futex_flag = FUTEX_PRIVATE_FLAG;
 
+	futex_set_nbuckets_param(&params);
+
 	printf("Run summary [PID %d]: blocking on %d threads (at [%s] futex %p), "
 	       "waking up %d at a time.\n\n",
 	       getpid(), params.nthreads, params.fshared ? "shared":"private",
-- 
2.43.0

