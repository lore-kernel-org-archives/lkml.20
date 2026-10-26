Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792979606;
	b=xGa3UmUK0qRWzoanUuxMydjH0Z5Zct8BRGqi2tXQg8g2j54OK4XAzugHOdJTe+kg3xpx
	 rIHsjmdL1z5nY+xTwdpCwgtkAx9KLAVaqMkXwtZLWQJKVC1a3LWiMqyYK6ZYLEHL4I5c4
	 LOXKBadLl8MVVHf6ji+8FGEaB4B/eQNTDZ9r9PIKnop3bEuH6tP3V8dyqLut3wYSc8sQF
	 CNuX9MkWIipNHW8IE4vipzfBP9Z7EhlNB+/ie0qkOd879cZks5GzXtPMBu3q9P4f9Olrc
	 fAH2MlKHhqH6pgX+fE4ySIQONyDI7YDtKvNEMI+bGXV7vYRZWuy8iyTDFEqKH6LJFRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xjb1mAInVk1HzEdMNZJyI7Brud2BvIWrU6/hsR1V99o=;
	b=RQjXt8fTUUgEzEtYvQY/KUDyWH7hGEc9Qh6KdlHQLpl31IHSp0uC5KNB3VzztgwkKRZp
	 2ZsGoH1iuOjCZZKpWYGl2OJaXqAuidsUbC79zvwn0jcnUpUWxaM13+vPIsD2QGutrFHev
	 g3COxTqCmuHDdXRfBgEd1m77fF0EEIwEd3+UdhfZmH0n6uCPaQTXvp6BoZrOYEm9eVjKk
	 9MhEGx++wDuL4b7lSWS32JblJRlE700J2nRnCj0SmMpGv018r93iBLsPV1/n8SszZqKWe
	 dImI1EPvRmSJ1jmQh2ZIYnIjqxUGuzfXUuQa1w7HheSZ51bsbgsySrbeTJwxQOODZyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KYvu7PZA;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB584606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB584606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KYvu7PZA
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e831e86ebfso14998875ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792979605; x=1793584405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjb1mAInVk1HzEdMNZJyI7Brud2BvIWrU6/hsR1V99o=;
        b=KYvu7PZAowTmf2dOYvKPpMuRlxFdicgWp+ZkgZcvfFbs8OZHihEl43jKXfWvqsNBiP
         A9QVA561SdLihfyOOISiQ/IpAKb1Z+aSAQu0EFRi6DQFLfjqg/PW+6+C4FQNhYe1VYpN
         wScJ3VIUtompHzhbTiVN4C0RaZmHe1S3BwV9RzUrFEoTi3Ok3W8go6PKPg5cmxIZoHmn
         BytuQlZ/io8ccewH7GKzgaky7mRiE8rYg3NEMUHsHyu8YPEzhcFF9nS4ZK9enMsxjoyx
         HrXfJ+Z3E3l2jlOZv5O/T1k63mKp0WBxa/nQlZlWJRN2qL9sBkE1d6BB/p6iSf7iqQCe
         m/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792979605; x=1793584405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjb1mAInVk1HzEdMNZJyI7Brud2BvIWrU6/hsR1V99o=;
        b=zxqGLwoM1XTo9cRS5x3zoU79nwzoiUwaJXoqVSYfEo3KPJOVpj0GiLmOdQGWVMVWdW
         CakYbYgQ18cXqPllCrqZJBcHX+L3hxV+CD8AdERi7hrGDLLHRuvHbgk0V+XD2Qgm4kan
         GcgVxktgOjAcR45uLLa7Zkoe1JvLtAcKu8gX2p8q0mqgKgthT9XT5G30qYR4Y/c9ssd3
         dews9iXm7Cc6oTrs7nDPSywjPSoFsQpDiSXSp5HHHkYi3fpOL9039z7xoSMdWk4mRBIC
         +Qae6PYSHqKavNk7ce1hhlv9XsQqOVCNV+aNtJ+xhGbXvZAZ5Yao4+kRRBlInZjIJN8M
         NWJQ==
X-Forwarded-Encrypted: i=1; AKwUvByuPnGG6PTpZvQqLGuDm0rpxMZYVqx/UeAoBUNWk39HS0wEz1ruXv+QwIFpKMic/A28otOzp+P+rRYFDWk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLKGGmDqOByfATWxCd5xi0VQzEQEUdW+XaMqFKmZi4juO6lHwQ
	xGxNafqpoaJ2HK6t22/VtNRjU2DwUZZo847Qhqb12ndlH4m6mxpLUYdM
X-Gm-Gg: AYBFou3X4nD+6/KC87bYWKX+SW4dSuCJP1H4cPhhpT30HO2FkzZ/hb5r0Odfv1qgscz
	qzA6eV494zPuPRCixDVxohDv2K3FS0xkC4xgZQzFG2hy7UxtICnXBh2dFTHwPJBPFEdVRcZ45x3
	Y5uwIi7TS8GmU2hjcN9AOMhleIPxbXuwPnlgkK0DNQlW2yO1IX1BLV29b8tvnnRQ/AxAe7RTT/Y
	QpPkqu8fS1M4RCtmDEB6wEw2xxtVVdqYIgftHK6VhVmuWxhlTs3ge6Lr60CnbhXIKCEUjpJ2WLZ
	juBu0pEIGb6F/pkvSG4sPHpT7OSzvNFQpobNx7zcFpnsl6mMXUYfnoGDSCVX+LPcFL9Vx7xwelw
	ga1sz37wkwL24kzfspEXa5M2KAQaoDi6rRctG0UTzEJzIUzidDyLsT+/dOLYTsscKxncAHrOZzc
	4UfblplvvwoKmSYHGVST+9puYOEVmI3L0rI4yCWQvSkVyMwyYAF0sbdla1Ki3PABvKK1Pcpc2QU
	bpRcgrzKfnuvTYoBILU+fPFK6R9z5LnaL4tAQVlFzDFaDnCTac37qk6ef3VwY6zjcTwqBRoZAbo
	tqDgb8qbTWY824FbENFvwERkeVTL
X-Received: by 2002:a17:903:1a2b:b0:2e5:6af9:a745 with SMTP id d9443c01a7336-2ea9c8194afmr46914005ad.23.1792979604989;
        Sun, 25 Oct 2026 18:53:24 -0700 (PDT)
Received: from Terra.tail0ac356.ts.net ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9af3232bsm10137655ad.10.2026.10.25.18.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:53:23 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+eada64ce90ecebce@bugs.sh,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: [PATCH bpf v3 2/2] selftests/bpf: Test missing and callback stack arguments
Date: Sun, 25 Oct 2026 18:52:50 -0700
Message-ID: <20261026015250.1674676-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026015250.1674676-1-bestswngs@gmail.com>
References: <20261026015250.1674676-1-bestswngs@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exercise the path where a static seven-argument subprogram has unreliable
BTF and is called through a bridge with only one initialized outgoing stack
argument. The callee expects two stack arguments, but the unreliable-BTF
path skips check_outgoing_stack_args(). Expect the verifier to reject the
second r11 load at offset 16.

Also exercise synchronous and asynchronous callbacks whose BTF prototypes
declare a sixth argument. Initialize the outgoing slot at each helper call
site so the programs reach the callback-specific rejection. Keep a valid
six-argument direct call in each program so bpf_fixup_call_args() records
the stack-argument requirement and cannot become an unrelated rejection
fallback.

The fix also rejects the existing uninitialized-stack-argument test before
the later unreadable-register check. Update that test's expected diagnostic
accordingly.

Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
Changes in v3:
- Rebase onto the bpf tree at commit 00d2cdf1637e ("Merge branch
  'bpf-track-borrowed-iterator-result-lifetimes'").

Changes in v2:
- Add synchronous bpf_loop callback coverage.
- Add asynchronous bpf_timer callback coverage.
- Add the six-argument callback BTF prototype and initialize the outgoing
  stack slot so both tests reach the callback-specific rejection.

 .../bpf/progs/btf__verifier_stack_arg_order.c |  10 ++
 .../bpf/progs/verifier_stack_arg_order.c      | 121 +++++++++++++++++-
 2 files changed, 130 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/progs/btf__verifier_stack_arg_order.c b/tools/testing/selftests/bpf/progs/btf__verifier_stack_arg_order.c
index a980a3a399d3fe..f4fb8f81afa777 100644
--- a/tools/testing/selftests/bpf/progs/btf__verifier_stack_arg_order.c
+++ b/tools/testing/selftests/bpf/progs/btf__verifier_stack_arg_order.c
@@ -26,6 +26,11 @@ void subprog_bad_ptr_7args(long *a, int b, int c, int d, int e, int f, int g)
 {
 }
 
+int callback_6args(long a, long b, long c, long d, long e, long f)
+{
+	return a + b + c + d + e + f;
+}
+
 #else
 
 int subprog_bad_order_6args(void)
@@ -47,4 +52,9 @@ void subprog_bad_ptr_7args(void)
 {
 }
 
+int callback_6args(void)
+{
+	return 0;
+}
+
 #endif
diff --git a/tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c b/tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c
index ab195585223343..5bfcd300c7a09a 100644
--- a/tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c
+++ b/tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c
@@ -5,6 +5,17 @@
 #include <bpf/bpf_helpers.h>
 #include "bpf_misc.h"
 
+struct timer_value {
+	struct bpf_timer timer;
+};
+
+struct {
+	__uint(type, BPF_MAP_TYPE_ARRAY);
+	__uint(max_entries, 1);
+	__type(key, int);
+	__type(value, struct timer_value);
+} timer_map SEC(".maps");
+
 #if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || \
 	(defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)) && \
 	defined(__BPF_FEATURE_STACK_ARGUMENT)
@@ -130,6 +141,25 @@ static void subprog_bad_ptr_7args(long *a, int b, int c, int d, int e, int f, in
 	);
 }
 
+__noinline __used __naked
+static int callback_6args(long a, long b, long c, long d, long e, long f)
+{
+	asm volatile ("r0 = *(u64 *)(r11 + 8);"
+		"exit;"
+		::: __clobber_all
+	);
+}
+
+__noinline __used __naked
+static void subprog_call_bad_ptr_7args(void)
+{
+	asm volatile ("*(u64 *)(r11 - 8) = 0;"
+		"call subprog_bad_ptr_7args;"
+		"exit;"
+		::: __clobber_all
+	);
+}
+
 SEC("tc")
 __description("stack_arg: read without caller write")
 __failure
@@ -152,7 +182,7 @@ __naked void stack_arg_read_without_write_1(void)
 SEC("tc")
 __description("stack_arg: read with not-initialized caller write")
 __failure
-__msg("R0 !read_ok")
+__msg("invalid read from uninitialized stack arg off 8")
 __btf_func_path("btf__verifier_stack_arg_order.bpf.o")
 __naked void stack_arg_read_without_write_2(void)
 {
@@ -171,6 +201,95 @@ __naked void stack_arg_read_without_write_2(void)
 	);
 }
 
+SEC("tc")
+__description("stack_arg: unreliable callee with too few stack args")
+__failure
+__msg("invalid read from uninitialized stack arg off 16")
+__btf_func_path("btf__verifier_stack_arg_order.bpf.o")
+__naked void stack_arg_read_with_short_bridge_write(void)
+{
+	asm volatile ("r1 = 0;"
+		"r2 = 0;"
+		"r3 = 0;"
+		"r4 = 0;"
+		"r5 = 0;"
+		"*(u64 *)(r11 - 8) = 0;"
+		"*(u64 *)(r11 - 16) = 0;"
+		"call subprog_bad_ptr_7args;"
+		"call subprog_call_bad_ptr_7args;"
+		"exit;"
+		::: __clobber_all
+	);
+}
+
+SEC("tc")
+__description("stack_arg: synchronous callback with stack args")
+__failure
+__msg("callback subprog cannot have stack args")
+__btf_func_path("btf__verifier_stack_arg_order.bpf.o")
+__naked void stack_arg_sync_callback(void)
+{
+	asm volatile ("r6 = 0;"
+		"*(u64 *)(r11 - 8) = r6;"
+		"r1 = 1;"
+		"r2 = %[callback_6args];"
+		"r3 = 0;"
+		"r4 = 0;"
+		"call %[bpf_loop];"
+		"r1 = 1;"
+		"r2 = 2;"
+		"r3 = 3;"
+		"r4 = 4;"
+		"r5 = 5;"
+		"*(u64 *)(r11 - 8) = 6;"
+		"call callback_6args;"
+		"r0 = 0;"
+		"exit;"
+		:
+		: __imm_ptr(callback_6args),
+		  __imm(bpf_loop)
+		: __clobber_common, "r6"
+	);
+}
+
+SEC("tc")
+__description("stack_arg: asynchronous callback with stack args")
+__failure
+__msg("callback subprog cannot have stack args")
+__btf_func_path("btf__verifier_stack_arg_order.bpf.o")
+__naked void stack_arg_async_callback(void)
+{
+	asm volatile ("r1 = 0;"
+		"*(u32 *)(r10 - 4) = r1;"
+		"r1 = %[timer_map] ll;"
+		"r2 = r10;"
+		"r2 += -4;"
+		"call %[bpf_map_lookup_elem];"
+		"if r0 == 0 goto l0_%=;"
+		"r6 = r0;"
+		"r7 = 0;"
+		"*(u64 *)(r11 - 8) = r7;"
+		"r1 = r6;"
+		"r2 = %[callback_6args];"
+		"call %[bpf_timer_set_callback];"
+		"r1 = 1;"
+		"r2 = 2;"
+		"r3 = 3;"
+		"r4 = 4;"
+		"r5 = 5;"
+		"*(u64 *)(r11 - 8) = 6;"
+		"call callback_6args;"
+	"l0_%=: r0 = 0;"
+		"exit;"
+		:
+		: __imm_addr(timer_map),
+		  __imm_ptr(callback_6args),
+		  __imm(bpf_map_lookup_elem),
+		  __imm(bpf_timer_set_callback)
+		: __clobber_common, "r6", "r7"
+	);
+}
+
 #else
 
 SEC("socket")
-- 
2.56.0

