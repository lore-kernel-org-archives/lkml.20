Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FBB49C4DE
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304482; cv=none; b=NHHZ515g3ocH/ExxNkNObmCZRIFAl+993QkyOLQY6w8a1FY7xu7YLV1EiA5MLRjrnZ9TvHYMFm+TnHgL7Z/sO02vPsokP3mK1JzpGWvcTmjWlZ2LrkOjShIx3CUF8OzmrEMKeL5sQEziCJao1rWJ0K4pt6qv1fP0HkJjuBITdsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304482; c=relaxed/simple;
	bh=S2uUX2Fk8n+vP/qgMl3qIzP8JEsoknNWZdUieCr5bPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hia78SH5JiEHEuQeVc65Ak3L4gbBmH1ddULKMOYuyi0ZguGxs3eL3/nqyk2zZ59GFh57bazBhldRL+yjX2b4TO8m20YbiqmLHahhvDMZ+4UwoooODn2VQ4BQ7nYqCVi65xDJQBYXs4FQZHeZETm2ebIz8wCJFopZ25Y9RYsMeK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VkVOq88z; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VkVOq88z"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49ff680331aso31945435e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791304479; x=1791909279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRTKpE752UBxEVvsukPxz0g+FDjlA3TSMkGVEa1/WS8=;
        b=VkVOq88zM1h4RUc4VFxjbTRDqiwnC5HOm9haZpRRlWlXUQ8Y9A9y9jUxeisIcHiTv7
         yoqn79hpBLhh/+JJPxrtS1vPIg0scDNsDltgiij94yPreU/2hZlrIGevhQMhECsYaXol
         8pzb7Ic7ZK1m44FUT4h8oks27BxpzbVfZoKCoZJCC6/cUCpWT0AQBrFbaKnOd/bJyCtB
         P8BHhgUtLlaoqGOl0CNIE/N4iHIpcN6J1yV5vAadXFdXkI/1EVM/bfN2hertW3FeU8Kv
         54zVd97JiK7Pl4Y7RfjhynTgRTQLpY3NlSzcol12mNb4KVz0QW6pRMn38G+B9gAd9Y2y
         DT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304479; x=1791909279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRTKpE752UBxEVvsukPxz0g+FDjlA3TSMkGVEa1/WS8=;
        b=E6xRbc7Xcf97mQH5LOyZQs7SIkJSFdBz5pkxWslmsuod2IIUhqK55s8MRHJVkLLXA5
         lTnd94RWZaoMtQ+bz5Urx9PTiFPhH5oQgBTr+stgHY98FcZMQLq/kFwZwiph01zRsOmR
         xRJZCTDVI/AVV6+VrmQm5iMUmt2V1KlXhxR+hwVn0X4oj2pKkTSo9MMnYUqzGAt+jhgq
         XZQWX5sgKdSMw4Kr2zUkFyKkgHdL4etVSoJtAfv8ZVjtX1BRRjwyPFSoRPb6nmpTE3El
         xQvejS+mwkkr/kPrQqrLho/n+fu04QMqKMbaL6+Rzil0/JjRTPCaji3Ljx5vcjcNoKAS
         Sv2w==
X-Forwarded-Encrypted: i=1; AKwUvBzcgveVyALDhfgPLpoPnniVTOQCnpq9YMImev1Yd9mEcY2UCy0jc63lvvUl1mzSSrmeDrtC62/pJr0rJog=@vger.kernel.org
X-Gm-Message-State: AFuF++nx/S7p5lx2jOJNA0qGa+AS714htkIbg0svtEfJZBmKJBwmYTPk
	ECGiEn2JmZ3BPi1zJObaQ/msjfwSU/awO6OiqwwFWt7XFsjTPO09ja7pvdy3hov1ZKM=
X-Gm-Gg: AYBFou2z19CCCPc1raDKnxghXClpc0my8rxVmhf8gP1u9VKmQyw5FqK0/XMkohOQb4G
	EgJsz6bMD0SE4ROBoro0CNsrTi9YA/B9c0Gwrez8aJsdl3epSbjj6xvPBv9r2yGpJ+V+IASgyhP
	vWMu8L2H99Zah4XuxvrAixE4oq3zGlDpvNSwjpQq2/mWw++xQFlBriel0PB72KIchY2wTC6mN3f
	85unDHMMLFI42b/p6RaCtRUuB94+SRQLAxZP6lhvKMSIrFX7USNmHy+HN+qeK0Ps61oZxxxc/6C
	WO2ua+5/uTWiHG7WpM0nMCndzz4QZMlljO7NE1Yr3SUV7mAX6HaU/G423nakXsQ+nDWTObjo81W
	nDDbKA/j9NiuVqdhVNjhUjfDxrZAyo19zwtyVlpwxTNkdnlX2fNzolffbKTBR38lzvs91vjzgjr
	8adLdA1Qc5oE47CeddlxpamSfkrGCIS1LKhwAQPSXAOX9YGuRrq82+STUWkRlD56Mdy3fSwMPRi
	/wXTQA+o8/+
X-Received: by 2002:a05:600c:3b1a:b0:4a0:251f:dabd with SMTP id 5b1f17b1804b1-4a1680f17f8mr174885775e9.16.1791304479057;
        Tue, 06 Oct 2026 09:34:39 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17a0fc2e4sm78918555e9.3.2026.10.06.09.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:34:38 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 Oct 2026 17:34:12 +0100
Subject: [PATCH v5 1/2] perf tests: mmap-basic: Only test userspace reading
 on supported platforms
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-rdpmc-detection-logic-v5-1-b25c9d49baa1@linaro.org>
References: <20261006-rdpmc-detection-logic-v5-0-b25c9d49baa1@linaro.org>
In-Reply-To: <20261006-rdpmc-detection-logic-v5-0-b25c9d49baa1@linaro.org>
To: Ian Rogers <irogers@google.com>, Michael Petlan <mpetlan@redhat.com>, 
 Qiao Zhao <qzhao@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>
Cc: Leo Yan <leo.yan@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

mmap_user_read_instr() and mmap_user_read_instr_disabled() are the same
test for platforms that libperf doesn't support userspace counter
reading for. Only run the 'enabled' test for platforms that do support
it in order to simplify it in the next commit and not run the same test
twice. The test can then assert stronger guarantees and have fewer edge
cases to handle as we know it only runs in places where
'rdmpc_supported' will be true.

"unsupported" hasn't been a relevant skip reason since
commit 588d22b40480 ("perf test: Expand user space event reading (rdpmc)
tests") added the UNKNOWN fallback for unsupported platforms. Remove it
and leave only "permissions".

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/mmap-basic.c | 51 ++++++++++++++++---------------------------
 1 file changed, 19 insertions(+), 32 deletions(-)

diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.c
index 5cec7644952c..208cd889f23d 100644
--- a/tools/perf/tests/mmap-basic.c
+++ b/tools/perf/tests/mmap-basic.c
@@ -378,13 +378,13 @@ static int test_stat_user_read(u64 event, enum user_read_state enabled)
 	return ret;
 }
 
-static int test__mmap_user_read_instr(struct test_suite *test __maybe_unused,
+static int __maybe_unused test__mmap_user_read_instr(struct test_suite *test __maybe_unused,
 				      int subtest __maybe_unused)
 {
 	return test_stat_user_read(PERF_COUNT_HW_INSTRUCTIONS, USER_READ_ENABLED);
 }
 
-static int test__mmap_user_read_cycles(struct test_suite *test __maybe_unused,
+static int __maybe_unused test__mmap_user_read_cycles(struct test_suite *test __maybe_unused,
 				       int subtest __maybe_unused)
 {
 	return test_stat_user_read(PERF_COUNT_HW_CPU_CYCLES, USER_READ_ENABLED);
@@ -406,42 +406,29 @@ static struct test_case tests__basic_mmap[] = {
 	TEST_CASE_REASON("Read samples using the mmap interface",
 			 basic_mmap,
 			 "permissions"),
-	TEST_CASE_REASON_EXCLUSIVE("User space counter reading of instructions",
-			 mmap_user_read_instr,
+
 #if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
 			 (defined(__riscv) && __riscv_xlen == 64)
-			 "permissions"
-#else
-			 "unsupported"
-#endif
-		),
+	/*
+	 * libperf only supports userspace read for these platforms, see
+	 * tools/lib/perf/mmap.c
+	 */
+	TEST_CASE_REASON_EXCLUSIVE("User space counter reading of instructions",
+				   mmap_user_read_instr,
+				   "permissions"),
 	TEST_CASE_REASON_EXCLUSIVE("User space counter reading of cycles",
-			 mmap_user_read_cycles,
-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
-			 (defined(__riscv) && __riscv_xlen == 64)
-			 "permissions"
-#else
-			 "unsupported"
+				   mmap_user_read_cycles,
+				   "permissions"),
 #endif
-		),
+
+	/* Counter read via userpage fallback is supported on all platforms */
 	TEST_CASE_REASON_EXCLUSIVE("User space counter disabling instructions",
-			 mmap_user_read_instr_disabled,
-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
-			 (defined(__riscv) && __riscv_xlen == 64)
-			 "permissions"
-#else
-			 "unsupported"
-#endif
-		),
+				   mmap_user_read_instr_disabled,
+				   "permissions"),
 	TEST_CASE_REASON_EXCLUSIVE("User space counter disabling cycles",
-			 mmap_user_read_cycles_disabled,
-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
-			 (defined(__riscv) && __riscv_xlen == 64)
-			 "permissions"
-#else
-			 "unsupported"
-#endif
-		),
+				   mmap_user_read_cycles_disabled,
+				   "permissions"),
+
 	{	.name = NULL, }
 };
 

-- 
2.43.0

