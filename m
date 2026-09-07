Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDE54CC266
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786424; cv=none; b=JlfjOy+uQSa6Ub4z822m5fYBZndfCTuK/5J+ApUgLXc4VN9HoKrcMTiEwxuTiwc7GBo0pAjBL1yHyv2IMHqwIXCM8piMpltzyQWTdFj5Bo37rCGzIy/iPMnmNnUAHAdGZIgrPyCTLbgo2QuqVPS+6ZCjcxvwLBQiun/qlJYwqeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786424; c=relaxed/simple;
	bh=Aq2Yj8WlY/n8sjOdlrRc6EEnwqw44OPa3KHFRf4++So=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8OyuB7O8rYAiGUWfH7TCpTOU/4/7WBufd85BqyP63Oux6l4G4ybbWLbrex9RxE2stB8JnqSZrYBDyNhdGpwP0Rd2QXUThfyqdY/81GCWaFi0OtnO4BOAzCIICfynieKcjOerbK+R2Ct7c8MmqKsVmSkPJtc6ubuW66W4XLPXVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hs2ov4Uk; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hs2ov4Uk"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso3780202a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788786407; x=1789391207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YnZZQEjTT3ispo9t2Rp3ilMwMqDfcn5R3yYWSok4gBU=;
        b=Hs2ov4UkFW+3Ps6wOnyI0xRBCDAmGThte3uzHkEIoQ4hk7Q4nQVnnEsy+77xUC0awn
         nRn1dtYLhkuPIBrYPe3guKnvth68e4aq3ydEYZqy4u7tniI8rFfFI9QaCFK6BBkZ3Wqh
         aqCpc7OqNlMWOPPVsgv//a11tcQrx5uQ+LRbcZ1HSKAglqMQI0HZuvTHe2OE0jhRNlAi
         8KWaCjtCPyNkmDL+bD/POxZHQ1GBtB/G+15RSfnfXwXcdOmquP6HajZ0+YDZA7A5JxOi
         Z+Tj4W8yscWftdJtvvw/KAF8KO8eM5nNtWRkm0A4wdBvGWDlBLP6JKX6M6dea+klLvam
         Cj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786407; x=1789391207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YnZZQEjTT3ispo9t2Rp3ilMwMqDfcn5R3yYWSok4gBU=;
        b=St4mIgW4If4b908M+FKqrAjXqYJNYJ7PlHac0GvERVIUEpgDK+JtfU9y8C2C3YyY4t
         XQsoDT1bQR89ac/FltZHH6t7gPyNSveh/rJPCYjeKZx9W51MNIwbUDHbUgpz38GyPq50
         AZhzXmhkARWBKPQg8xj3MzN39TRIW7dHlFW51X9aRO5Oi5vnNB3qVh2sRm0zq6wiWm+G
         l+Lks9T4JFKtsTiOzSTp3MBog1O4dkaurWziZMCOl1sAJn3JizYmNq1a5KKn/qrZHKyJ
         tRiAU0Zt+vFCSpVjchCJHGKdgOeQG36Q/TV52mT+yk9QoBuS7EfSuBNgPtY4huDTMozs
         h7tQ==
X-Forwarded-Encrypted: i=1; AKwUvByIq0mWZOW0Ab7Y0QbOcqAH2vx20ulC4/oiTZdHm1QIGqMcoPwtOfYRqTWyURKRpShFh6WmjHNjRSwD3j4=@vger.kernel.org
X-Gm-Message-State: AFuF++ktbhAp+Vq2KBF5mekpmvHhRRRShl/vqOeirTGZEE3A9/MLsxrs
	d5vfJu7kS8WFki3VaqygzJL1f2cByEKc3t/rf25nYwJsRaAVS0typjA=
X-Gm-Gg: AYBFou2/wtleL8BXUMJiDtZijT0X6aQT20/EJMmMAFIWQPNXak28mTi9hNYCm2QWedB
	LoGhiZsQlRU9hVGlNqFp461MaTdALnZdx6wQE5udJRw73rFlPcYHpMGZo8q3x3NNPaBq42ORWrj
	O49IhjvF2dbeKRzXSWwlwaUiPOZfxWxHFfeOI5Qh8kx9PAd5n8bAAYWiNcmB0wqrjigDt3gHqQS
	Hntpl4G1pOSWDOf6Twzn/3Zi172nMMwDHntSU9bQD2QRKQ0VONSa9+46qnJxn3FYacrkAXNjYMg
	YLslx24t+RxR9SBSnnWFYho7GKnWVElhswm9FvZS5ltoE1O4uBPO3HyZamw/JWtjhSFiHrGzSSZ
	m/JM2khPwiRElFsF9gOCmiRVhh3TeouCBwPTe8Tg6PBi9mlXxQ1aGse/NnFuD36IzKgIP0BGibt
	63+nKNNZh/qV1lTrnL5m2C7h872A10L7pfaEXsHZwRB1NqKiguw1OV+z1AAnqWtpEKdTwy4sQvq
	zn4LM0HhKcVcwaA
X-Received: by 2002:a17:90b:3809:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-39b261014e2mr32056634a91.7.1788786407241;
        Mon, 07 Sep 2026 06:06:47 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b07b197a9sm26742398a91.0.2026.09.07.06.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:06:46 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Song Liu <song@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Yonghong Song <yonghong.song@linux.dev>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH bpf v3 2/2] selftests/bpf: cover the exception callback using its own BPF stack
Date: Mon,  7 Sep 2026 22:06:24 +0900
Message-ID: <20260907130624.611942-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907130624.611942-1-donggeunyoo.kernel@gmail.com>
References: <20260907130624.611942-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing exception tests do not reach a callback that materializes
BPF_REG_FP into a register. They either throw from the main program,
where BPF_REG_FP already holds the value the callback needs, or use a
callback whose only stack accesses are frame pointer relative, which the
arm64 JIT rewrites to be stack pointer relative.

Add a test that throws from a subprogram using its own BPF stack, with a
callback that hands the address of a local variable to
bpf_probe_read_kernel(). The helper and the callback have to name the
same slot for the value read back to be the one the helper stored.

Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 .../selftests/bpf/prog_tests/exceptions.c     |  1 +
 .../testing/selftests/bpf/progs/exceptions.c  | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/exceptions.c b/tools/testing/selftests/bpf/prog_tests/exceptions.c
index 3588d6f97fd4..639866ce09a9 100644
--- a/tools/testing/selftests/bpf/prog_tests/exceptions.c
+++ b/tools/testing/selftests/bpf/prog_tests/exceptions.c
@@ -55,6 +55,7 @@ static void test_exceptions_success(void)
 	RUN_SUCCESS(exception_ext, 0);
 	RUN_SUCCESS(exception_ext_mod_cb_runtime, 35);
 	RUN_SUCCESS(exception_throw_subprog, 1);
+	RUN_SUCCESS(exception_throw_subprog_stack_cb, 0x1234);
 	RUN_SUCCESS(exception_assert_nz_gfunc, 1);
 	RUN_SUCCESS(exception_assert_zero_gfunc, 1);
 	RUN_SUCCESS(exception_assert_neg_gfunc, 1);
diff --git a/tools/testing/selftests/bpf/progs/exceptions.c b/tools/testing/selftests/bpf/progs/exceptions.c
index c8d716fbd419..91c81971e58c 100644
--- a/tools/testing/selftests/bpf/progs/exceptions.c
+++ b/tools/testing/selftests/bpf/progs/exceptions.c
@@ -212,6 +212,36 @@ int exception_throw_subprog(struct __sk_buff *ctx)
 	return 0;
 }
 
+u64 exception_cb_stack_src = 0x1234;
+
+/*
+ * The address handed to the helper has to be this callback's own stack
+ * slot, not one from a frame that is already gone.
+ */
+__noinline int exception_cb_stack(u64 cookie)
+{
+	volatile u64 val = 0xdead;
+
+	bpf_probe_read_kernel((void *)&val, sizeof(val), &exception_cb_stack_src);
+	return val;
+}
+
+/* Throws from a subprogram that has a stack of its own. */
+__noinline static int throwing_subprog_stack(struct __sk_buff *ctx)
+{
+	volatile u64 pad[4] = {};
+
+	bpf_throw(pad[0]);
+	return 0;
+}
+
+SEC("tc")
+__exception_cb(exception_cb_stack)
+int exception_throw_subprog_stack_cb(struct __sk_buff *ctx)
+{
+	return throwing_subprog_stack(ctx);
+}
+
 __noinline int assert_nz_gfunc(u64 c)
 {
 	volatile u64 cookie = c;
-- 
2.53.0

