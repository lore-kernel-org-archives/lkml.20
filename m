Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754A84A6897
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370398; cv=none; b=bXi0qxtFcsmQrFpZnA3gCXPz5Bym0kUJKM6tjPrACcWuD91yZkLq4qPFjhnzqjJiiVsyk21xiYuF3+ffzbZC/LmZIAxV7GypEESF7QUr0/OrgNYpyPYmhFck5sgK4JAH75OS8cLg4wTRNpXEwyazC5N+Y22iGDVIxxamHvgF7lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370398; c=relaxed/simple;
	bh=S2uUX2Fk8n+vP/qgMl3qIzP8JEsoknNWZdUieCr5bPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I/QmMGWm0DBzgXgRiZsjpBAILw3GYlFHt/hkBHNb1wPjWe+KdEAWIRfqKZcGoQs1zX0KmOXFRRlDSZD6vZ0eRxOEFwroFo7BSctUUb/jalrzbUOn3QzA8Z6aoqPqoFIN1i6cl5zd8Vx5Ijdo/eWY/wlCjNHq0vQLbScmOjYAFE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YeMxNrvs; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YeMxNrvs"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so3254588f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791370365; x=1791975165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRTKpE752UBxEVvsukPxz0g+FDjlA3TSMkGVEa1/WS8=;
        b=YeMxNrvsXIbz/EQEMrM/nybThVdsvgOf1veUzIsXYapu6R9ZQBxUjbpcMgG8i9Vlvg
         Lgt4jcgka59fJld5DQbWku3L2aBTyzb2PjiidqOu/wtjQQb6wCBrMd5iiIXXhxPl1HDd
         0MCODKQz6KqJQW6+7HRaot7XVnpAgSYzkBrZOPnALmaFzRFd/E81dKpnw+QviJ4PpRIT
         L6EDXJagdnoTxP7Gi5Y1ZTs6wqx/IduWQw4g5WiM3Rk8J8s/j9BQOnlOr85qCDHxdHX/
         SwcvutFiGmvrR+nWZJz2GvkWPcJkJE1T9z79srwNzzkNHy74zqVkA/gwD24JtkZvc2AS
         yaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370365; x=1791975165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRTKpE752UBxEVvsukPxz0g+FDjlA3TSMkGVEa1/WS8=;
        b=c+w1FiaT4KNzwnY+kd1OEh32qv2jokuA7Ps1ufBkXOk+GTK84DaWnJ4UJN/Oxsg3sQ
         M9yq6pEC8Z4n6pfdx99yylsxke9ooa6q4TKN711kkmonUaoKtPxtFIwYY1wEpd6rV6Cj
         EQsv0599Sz8h5WIA103NAjFXAN/wVkTrZaO4/ZRLEGvjIUlTarICmLbrZkKysxneIEu+
         CtE/ZMQ8ZBkdT36smLJIyYrC6JH1+8L63PejiojQC8IRhM8ZUnGJ1xHfjbcBdzyUzTbC
         pU1ptRBBpoQMZ8177au7cMbadhn/BZwNpRDCg0J6VYy5O0PNO6vwZGMid4FDbbjXP+P1
         b0Ew==
X-Forwarded-Encrypted: i=1; AKwUvBzQ/rokXAtYTV8BlA5/AwdGTx2BDMfHZMVvtNYy1QiWPP3TGxIyFQ9tyN3OWvQtINELdXu+9uEqunKZ05o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKL2xFsg2TgRPiJdK5CaBrNBanBATYgQW+4uYGuM3cokzX2AA0H
	/AyBB5TOWGxuoD2Y/lLZN1SdDMwtQAdOYrV9WNge796acgIjclYfi1c9bWleFlsK7pU=
X-Gm-Gg: AYBFou0Z6sUBD3/zbcxNb2J/NojLZYKra3Aown4MeN0xDGcXoBYSK65Sh9FZpT2PsfN
	ctcS2K+WeUqwoAqoDsqVTPJwFU3CJuG3t9fplkt1GGJsPhUrsFLrnCW23gNTH5KyR67A+rR60a4
	IgDFfHjnW0MhE9RM2u33cib33dN8d4c8P11wc8K6HDeVqQ54sqvd4yukg0VPKworNihwEvy1xBm
	m9myGAZUerjalv59vvDaogBBK1vNhg99bmNUqrVEWkR9F5XGqfMcSclsy2PA2wnKHMHtbWSUTOd
	NnDxNQwTF4C9KX7YAc/aMy4h9w4QymGXiBCb0j2deuVLB0wMwYH+d+wCOeRh74D2OEsolErjM4d
	pom3WiN1epd40luDirdVcXz9BWufw0WXe4czJT0Uqml8axklGwlD86nPgf6sXwq2GiaNiWh9zhO
	p3xi0C9yA+jHMt/PAX8ADrbI1LTYKNqKMyoADzD1ALvGPAznuFLIzhLb09PVoxcZs/0O8fdCYzc
	hRusEEu8GPh
X-Received: by 2002:a05:6000:46d6:b0:488:83b1:16a1 with SMTP id ffacd0b85a97d-48c727288b1mr2055193f8f.7.1791370365226;
        Wed, 07 Oct 2026 03:52:45 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d31767sm5182781f8f.51.2026.10.07.03.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:52:44 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 07 Oct 2026 11:52:12 +0100
Subject: [PATCH v6 1/2] perf tests: mmap-basic: Only test userspace reading
 on supported platforms
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-rdpmc-detection-logic-v6-1-d7ed6a85f864@linaro.org>
References: <20261007-rdpmc-detection-logic-v6-0-d7ed6a85f864@linaro.org>
In-Reply-To: <20261007-rdpmc-detection-logic-v6-0-d7ed6a85f864@linaro.org>
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

