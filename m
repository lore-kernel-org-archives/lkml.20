Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621766;
	b=jGSR65o+UPRfBhVQC2odPGzxp31OKuGVu8pNV+O/w5LOsfOvF3So4M+lgfp2iLvoMpb7
	 BITPy57E8ydX1dc+zlKFns5MKDerXQkfMPUynxMINyhIoleTUNbQdozHM762botTx1W/J
	 B4mklUfaEKrLiZgK9xZt6iGOoMwBwh1iOiGo1MkZK2UDXOAKAu/Zvgkpk2q76zLcOi1wU
	 9fMwIIXxWqEOAoBIRzUSGcYt5ua3i02j3sVpJKrOdk+jLvXrNWuKwZmSx1fn11GDzyfly
	 14qU7uU7Kx03JaYjxjDVo5edFPC3/f+ddP7rbiG51sxEUET+bVozPKvyviKZ6fVVkOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=a05nv5fincC2k/bvjU+c6gmqxIBRW8o0fYRmcOAk9I0=;
	b=PdMX97Gqgq9xXWf7wRCkLpkoPoKSMOdGJfLbGmCAu8pHd7qLnY6xpg4iCda2cyDz3oyM
	 Xk35uwif/EGyGyQEYcg3+aAgE1we0MfLjI0q7msbQpdefNkq078f2L16/3Wpuyotqwpiw
	 RgUXvCZ9heKmgsXLUaJpriaAOZ3dNMVORJjKT3vjpbYWWu6WBux4A0JuapsGiqeuFdsiu
	 ArxOMOxzGCCFWJjLpeo/qth+FeqGWNrUF17noUr2hcny/ijpiPS6WJIZNDf8A6nZjtTAM
	 lECR98sfc9QktAEsPybEAyplD3g34s+pNwjFs12RSuWhuClr8PN+mJVM/PqtofcXY8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vcm9YzIQ;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FA6606A87C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7FA6606A87C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vcm9YzIQ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso28853505e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621764; x=1794226564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a05nv5fincC2k/bvjU+c6gmqxIBRW8o0fYRmcOAk9I0=;
        b=vcm9YzIQOFVHOXv+tT+vOKl0R2mPxx8MLFjVxWEBW/qSxGg78kivt1ysTRtPc6Z8LF
         jcpQbBE77ezkl54ZlRTHRCvhwv2dsoFOVYfrT3hTypMDAENM3G2vhyxmsGj9t2n6NWUs
         qltuf2tIA+0frHoDJ2UI3nosIEZy3c+xl2IWtYw5OE6ECby0UbCZ7phcvlBq+WMFJuxA
         4Vj5TNwIRJ2uzKiiyruJeGmAWwvHAhrxjIWi53TZaDzE9krITT19127f2Fx5ECyWbZJZ
         7nvUsnFWo111AmPSMYiRw5BI39iONoRWzzN3aGKMjyc5koluLWGAhysnvqzRDS4e5w/3
         xyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621764; x=1794226564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a05nv5fincC2k/bvjU+c6gmqxIBRW8o0fYRmcOAk9I0=;
        b=02Jnow9BPUuav6V3jAn9BhkNJ6sxnmyE0YatEvFaiJnHbYZTs8+wwPfXyJ1EQY1K+W
         IktvWrROP2BzhMfnvMn4ryOtbIuCTvhRLCg6SMVKeEI6Lt9SaD745n+AYSqZY0CqJCag
         SVUhXnk/YOR/9uRZWWy8d01wUOPYXrru4oDipH7WxG5eNd5M0LNRV2mLXXd1NOvWr0dK
         UNEcz6ZYEsqnGCZ93EGS2j6+zvPIiySZGebMs7VAzonny+tBwFqD9EIRlVVw5WeMFBgB
         2xH3ZesJVknRG52Hk6wVtB0VlQAUtbYcqfTZRv9Lu73wn2b9J4e2eqF5sQIMDEwFKuck
         gRtg==
X-Forwarded-Encrypted: i=1; AKwUvByyd6aVL1MLhj8L2fnGrFqHjYDsyz5ODtmWbkqsl5+3ITPlRnlgnhl8jU4JzAQj4MZmML9HH/Cx7ZH1ZQ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtlQj5VFLnBcS93EbPD4/ouicekLwewHm1ZHshphqSSGvGLnht
	Q8Z+TjtMZ2ne524NyYAqvfh7cP59EPgU3pNi8DlYi5vW+fHZCtph1w4Zvp+sfLJXMy4=
X-Gm-Gg: AYBFou2IedPDTO6TvfT664gK+Wg08ooOP7vjvXHCT7WpaUWApVL/iTJz+Ng66Aozlec
	plPYxjTK5dKs6Se+MXd7r1Y3yUzjmHesOzh7CKASqQXkzNOmKthZRlvc+hQ9tnspatynBpDVBVj
	L3qlZo3lmc/wQkvrp36qYPvPNVkekhT817ygGS7Zoc3FoEPvbLMsAXZJ15LyXEEIdgGo+D41OXh
	sVVRhlWst/361dsSHEtho0WFfGTB9BOwM4QxZkgYuIGXMVJf44IHITZ+xO/hl8Qp0R+f1aVLS5m
	6BTwmRALJEw0cKHnNG2hQTq0Lj08P3yMeHsKEjBPITi6GnbfGsLjRPxCIoEt5x1j7HoC8gjr5Sq
	kSqQnHSr3LuVLampvrL+iWJ+bDnYrNhSkoqRzxpsRecxG0+lW77Jw00UbljMXBpyjDlDYoTfVrQ
	XlzSdirizeQItBeWfQ73V05V6IYoNXq6EEy3RMnO/A5SLOPxffdxDmKA23U3AOkwVWQ4yV69GrG
	wuwmBhHO4SsbEFvXiHFECkYxKgz92lbStsfXBoH/i00QEMvqc3+DaKdT9sp/20ChtKkunDM4cA7
	6X1S2twbQfytHRIT6yeTTmGmL4Xj+4kY2x8tu2DaiwkPxPqzjWcBVXc=
X-Received: by 2002:a05:600c:3b88:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4ac187a6ffcmr237933795e9.29.1793621764239;
        Mon, 02 Nov 2026 04:16:04 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:16:03 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:30 +0000
Subject: [PATCH v3 16/18] perf test: Allow infinite named_thread loops
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-16-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2

The following test will want this to run forever, so add support by
treating 0 loops as infinite.

Convert i and named_threads_work to be unsigned to avoid undefined
signed overflow behavior in infinite loop mode.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/Documentation/perf-test.txt     | 2 +-
 tools/perf/tests/workloads/named_threads.c | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/perf/Documentation/perf-test.txt b/tools/perf/Documentation/perf-test.txt
index f66ccd77bfe7..9fbfe7819a61 100644
--- a/tools/perf/Documentation/perf-test.txt
+++ b/tools/perf/Documentation/perf-test.txt
@@ -98,7 +98,7 @@ OPTIONS
 		nrloops: brstack, context_switch_loop
 
 	'named_threads' accepts the number of threads and the number of loops to
-	do in each thread.
+	do in each thread. Use 0 for an infinite loop.
 
 	The datasym, landlock, deterministic and callchain workloads don't accept
 	any.
diff --git a/tools/perf/tests/workloads/named_threads.c b/tools/perf/tests/workloads/named_threads.c
index d051d41a3cfe..6672c2f77684 100644
--- a/tools/perf/tests/workloads/named_threads.c
+++ b/tools/perf/tests/workloads/named_threads.c
@@ -11,7 +11,7 @@
 #define MAX_THREADS 25
 
 static int iterations = 500;
-int named_threads_work = 1234;
+unsigned int named_threads_work = 1234;
 
 typedef void *(*thread_fn_t)(void *);
 
@@ -19,7 +19,8 @@ typedef void *(*thread_fn_t)(void *);
 noinline void *named_threads_thread##n(void *arg __maybe_unused)	\
 {									\
 	pthread_setname_np(pthread_self(), "thread" #n);		\
-	for (int i = 0; i < iterations; i++)				\
+	for (unsigned int i = 0;					\
+	     i < (unsigned int) iterations || iterations == 0; i++)	\
 		named_threads_work += 3;				\
 									\
 	return NULL;							\
@@ -65,7 +66,7 @@ static thread_fn_t thread_fns[MAX_THREADS] = {
 
 /*
  * Creates argv[0] threads that run a unique function named "thread[x]" which performs
- * a multiplication in a loop for argv[1] loops.
+ * a multiplication in a loop for argv[1] loops (use 0 for infinite loop).
  */
 static int named_threads(int argc, const char **argv)
 {

-- 
2.43.0

