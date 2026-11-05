Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879145;
	b=FANZ3yj00TMj7dHnc+vGxCoN0KGLqs3viMa1cMnE6TNor1TesQCR9qOrq+2T6Eysgx6I
	 5nNwR8YJgtXXz0O/HU+Oe/r6s7amyJP/4gKizeDVQj6sVF8GmMig0WtkZztyclKPXI0nK
	 cKayzuFAdc7MD1zkewt8DBCz0PaOePUCWL67EyVtns+bw00MdGG2Jl1Y4Zlph/1E6++8C
	 qjZE+L1QJd0xO7gVVJpSlaXxfoL6Hfykkv3F8gWd/Dox2NR/tL61SFqgDFSOH+XGJlcyG
	 MVEQV+mA8Y3PfShMc+hymwws4RD1bJdUJv3xUT67A82evEbGtK8uoILxQ1ULU93PUIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YBXbNjgUg+UURoPn7/k5hFGZ3UtlzmwcEk29veboZWk=;
	b=SlVs/2LlPidTDDWoXlQfU18IfaEdOAZaQou1vySCAoBoNLlga3swobFSmdeK9HgdEiix
	 zY3RLetYpzZ+n7JDNJ87zWCGMZAZgeP+oVYYoS+in/0gUHvEcqsb+4lPIJnMh1UOTLh28
	 +3RH/rNVn2Ytt1aVTb0YZhYiMkmYi9wMtdoFpbLQy/Xnf+5bfb8Ea+mTDpNKkuNn8aN73
	 VzEod7zSJsTQN8s/kfHjkisFk+G3ziUS24HVVWjTV94P1qfcwMpcS4TvrguOrVu+p6uY4
	 J+Tg4EcVhqixfk0vnL/FokpORT0UIdTme4tu0mevgRKa8pRPnbHoaDhNkBG5qR/flVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ffnYhgre;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F976074728
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64F976074728
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ffnYhgre
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b467581b98so12486765e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879143; x=1794483943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YBXbNjgUg+UURoPn7/k5hFGZ3UtlzmwcEk29veboZWk=;
        b=ffnYhgre80JTE6GQbfcmOoogm1GEw6pB/olqD6Pi1ruPdtAO6t7DhUHa823IrDzazI
         mF20ZMylqkZUhvyvC1kC5pZazDdN3cwH+P82Kq+6dftQQbQfglD0lQTV4bkBuRzq/jh2
         K9/OxvBgSyM0gEftd3i54k7HPrtEcon5khFTY/nuRtkaX49d0A5QQOYtb7Y+RZhLl+xP
         R6URnplKlOCn1nzeoG7mgoZkx31vH7NTbB39C3U5SDFToE1NjDCfE9idbRtqMJUi4E0z
         6flVKd1/8AKTVTNksba/2gLHNVDpRQfZIac0OxWIrhZQ+DOSRkwPj0ejufk6/LmTGVu+
         EgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879143; x=1794483943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YBXbNjgUg+UURoPn7/k5hFGZ3UtlzmwcEk29veboZWk=;
        b=reV97s8qSfpU+inp0K9BUSWEX0uIeMtXNdpK7CMC3//tg/VRmnlqO3xPCQtLmziZin
         4kwigKbctfQYdBqUZTlXwh2JqsDjS5fjB71cgjP7l5utLXKiGEypFI15Y2LpxEW7a2N1
         7mMT7dkTfFZb+l046kyGZLTnpLroym85lpXC0TnY8zJpXtSgp5ffmlhMhCbriSoD0/ip
         NoGwSv8DO3luCamD27NdG9CMlU5gBbqOGQBToExC9E3Xfj7H7N62meOlv12QMNPYVAo/
         ZlBQBSuuZELkZTLLWPjYjVvyEyqtq6tLL2GnnuNFUr29iCMLt3uNrgMEFjN2szUdrcCV
         7s/A==
X-Forwarded-Encrypted: i=1; AKwUvBwuUF5kXsbWgjaA4NBx0H4Iny784lIZlBZ0Xsb9pBWme5HnXFpTRD+zW7/IEgCzXRxhkvfeseeekuzfuy4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DWCXSXo+UwhkKTOKKqGa+9MKZQUdkeKKUCAxolOQyi02qUjen
	hOP+kac+YZfOcstS4yiCL1u6qAXUHYGIQxTVF2/A7MOGU5yWrvWlfImmz8o/CDQq8Ms=
X-Gm-Gg: AYBFou2R8fFb5DflR7eFp51YxyiP88vggcBT0LyALD1CAdvrsEOQ94HYOXlHdF/AHEl
	jBVL9/PUMtJr3cOQnQ4BWH0Fd9I30GFnNaA/LXeOXWbsrqZ2TbejVMtFJZUcF4/Eywyg/ZWVFHN
	cVMnh8YMNJHE7jfSA0pU5QSoDSg5AKfzqb2d1zTQl3v9D6Kz+8y/kC7cNnMJB8bmof+jauzopkD
	r01qFhg2x9SDMvbGDA9KPC1f2DPBf0cQdwH0MY9uT6y9Ab5t4xikrPNVcJBxCwCRiBFzz8ERpPv
	yOh9V5PiYK/MRE/5r3WVOZuZiw/+ThWwooybkMa9XwNs+eolEkx63cXbRXcOm676Md+k+RzQ9vh
	ZckGD0Wu+fl6+Kx++d8qVlY9usd/cUfSERZVg6vFXWcP/iKSBy9k1xxX1+kuXuEYzj2YGcS5jTS
	BRBQdPjOLCs8AZNe6ZrrMI91ZcDoJMRz3eCJJd3hB7fpnIqJ9dhYHjV9XvzPbg7GYBbI2amE8nU
	6JKTfuI1/NafqXibhlLfTFnsOrJY6hzWVYHkU5CezUuIH8zL24+05LaJNatcS1PzrWmuay7w+WN
	xK7cwLSNYaiLlTkWh8Kh6FG5EfmXSveW
X-Received: by 2002:a05:600c:348d:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4ac19234acbmr385559145e9.33.1793879143001;
        Thu, 05 Nov 2026 03:45:43 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:42 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:45:04 +0000
Subject: [PATCH v4 16/19] perf test: Allow infinite named_thread loops
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-16-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
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

Tested-by: Leo Yan <leo.yan@arm.com>
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

