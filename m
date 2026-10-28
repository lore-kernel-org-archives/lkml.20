Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793145889;
	b=nplhr/q2jYI6Xmob37b7dfMnIsHzn0p/z0igh1Qzek9CYHrcqqXXmVP/cGoRl+RfSE4J
	 oI7VHdOnHppxJxCPSY6qWLAPKkfmnFPTwZ99WjfecpC1+mG1S0clnhbFqMCAKMLl1P58q
	 95Blyx91SiQj3+lwdyU7Q5n558wTZCTQF/PWngqmyriayiod0BJmIERYNdV/9yybO+EEM
	 Fyxs07WSc2R26AXi94ASaQdfxl0CX8n1F4Dt92e4VyDlKFyVaBf/373Gspu0QSDUZ7GWk
	 UIoyV+UrE1eMkhr3CcfObREaLJcBaLXVKOOyr4Mvb8cy7tYuZJMxWYuP4uXPqZPQCGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793145889;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NJvkvuFmPsK0F9Vtc+x4ihvo0Cva+iTyJ9tuAp+LhKw=;
	b=OSov3ndYH7m7IS2cxXlh5h4WNCyCR7U3DfOobsZIiz7x+U+/8NUoUhAVJIfA1ljEI4vM
	 toiCi66cK4G5eUKgIQ3XYBei1LGsimZkxg3jU+TrS0BuWwdx66YF/t8U5XFpqC90JN8CF
	 zRkLi/OyQ9QrRu8evwr1reOu7ODESBU4PJtdp3S4a8caGvnbAB1SX7OirfADoZR1R+1iv
	 B0rl2YiHYj/CWJAYqFJlj9Jtp/ho9bZ6LRInyEZqJ9b6gBVAaQdu9/3qcW8kDrikAhDua
	 DKeXlAsnHKRH1ahgGfk4pFWHtNxLx9uzgnno4UWr3+hypCTcRiVGcbOVk25SQ96rjHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lyaU6yb1;
	arc=none smtp.remote-ip=95.215.58.25
Received: from mta1.migadu.com (out-25.mta1.migadu.com [95.215.58.25])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889EC606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 889EC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lyaU6yb1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=29McrIn6KZ+c/c+mTtQprWWHk0phyF7LIkFFA8ykel8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793145886; v=1; x=1793750686;
 b=lyaU6yb1q9Pe5uMA0WzohOQOcAlqxPCljOKJMLG9GFwr3FCvfwLATWTmnwd32QNYIqNga1E4
 tf8kSNjKuAEedzQuwpYm/2TU2lCVBOmrJD+ZYD47n+vWwy68SOclpsdoS6/G64XyhQpoqo10l6N
 2AG+M6psZts7EXB1F024XF8Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fca77b9b1df609a2;
	Wed, 28 Oct 2026 00:04:46 +0000
X-Mizu-Trace-ID: fca77b9b1df609a2
X-Migadu-Flow: FLOW_OUT
From: Vineet Gupta <vineet.gupta@linux.dev>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	john.fastabend@gmail.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	jose.marchesi@oracle.com,
	david.faust@oss.qualcomm.com,
	Vineet Gupta <vineet.gupta@linux.dev>
Subject: [PATCH bpf-next v1 3/7] selftests/bpf: report SKIP for arena tests a compiler cannot build
Date: Tue, 27 Oct 2026 17:04:07 -0700
Message-ID: <20261028000411.4010967-4-vineet.gupta@linux.dev>
X-Mailer: git-send-email 2.56.0
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

Tests guarded by __BPF_FEATURE_ADDR_SPACE_CAST don't have a dummy fall back
when the compiler doesn't support the feature: so they are absent from such
a report entirely.
Every subtest inside one of those guards is invisible: 22 across six files,
plus the five in stream_arena_fault_address, which has no guard and fails to
load instead (addressed separately, later in this series).

Give each guard an #else with a dummy marked __skip(), so the skip gap is
reported rather than invisible.  Add __skip_without_arena for it, which
expands to __skip() with a fixed reason when the compiler cannot do arena.

Measured on bpf-next with a stock bpf-gcc, test_progs before and after:
six subtests appear that were previously absent from the report
altogether, and arena_kfunc_jit goes OK -> SKIP because every subtest
it has is now one of them.

  arena_kfunc_jit/arena_unsupported          SKIP
  compute_live_registers/arena_unsupported   SKIP
  verifier_arena/arena_unsupported           SKIP
  verifier_arena_large/arena_unsupported     SKIP
  verifier_ldsx/arena_unsupported            SKIP
  verifier_zext/arena_unsupported            SKIP

Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
---
 .../testing/selftests/bpf/progs/arena_kfunc_jit.c  |  9 +++++++++
 tools/testing/selftests/bpf/progs/bpf_misc.h       | 14 ++++++++++++++
 .../selftests/bpf/progs/compute_live_registers.c   | 10 ++++++++++
 tools/testing/selftests/bpf/progs/verifier_arena.c |  9 +++++++++
 .../selftests/bpf/progs/verifier_arena_large.c     | 10 ++++++++++
 tools/testing/selftests/bpf/progs/verifier_ldsx.c  |  9 +++++++++
 tools/testing/selftests/bpf/progs/verifier_zext.c  |  9 +++++++++
 7 files changed, 70 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/arena_kfunc_jit.c b/tools/testing/selftests/bpf/progs/arena_kfunc_jit.c
index b5a01cbc33a7..97912a7b6b5e 100644
--- a/tools/testing/selftests/bpf/progs/arena_kfunc_jit.c
+++ b/tools/testing/selftests/bpf/progs/arena_kfunc_jit.c
@@ -112,6 +112,15 @@ int arena_arg_jit_args5(void *ctx)
 				   (u64 *)&val[4]);
 	return 0;
 }
+#else
+
+SEC("socket")
+__skip_without_arena
+__success
+int arena_unsupported(void)
+{
+	return 0;
+}
 
 #endif /* __BPF_FEATURE_ADDR_SPACE_CAST */
 
diff --git a/tools/testing/selftests/bpf/progs/bpf_misc.h b/tools/testing/selftests/bpf/progs/bpf_misc.h
index 1b264480e128..ed1ed1b5bd09 100644
--- a/tools/testing/selftests/bpf/progs/bpf_misc.h
+++ b/tools/testing/selftests/bpf/progs/bpf_misc.h
@@ -116,6 +116,10 @@
  *                   feature the toolchain or JIT cannot provide, so a run does
  *                   not report OK for coverage it never executed.
  *
+ * __skip_without_arena
+ *                   __skip() with a fixed reason when the compiler cannot do
+ *                   the arena address space, nothing otherwise.
+ *
  * __log_level       Log level to use for the program, numeric value expected.
  *
  * __flag            Adds one flag use for the program, the following values are valid:
@@ -156,6 +160,16 @@
 #define __success		__test_tag("test_expect_success")
 #define __description(desc)	__test_tag("test_description=" desc)
 #define __skip(reason)		__test_tag("test_skip=" reason)
+
+/*
+ * Without compiler arena support, report the test as SKIP rather than let it
+ * pass vacuously or fail to load.
+ */
+#ifdef __BPF_FEATURE_ADDR_SPACE_CAST
+#define __skip_without_arena
+#else
+#define __skip_without_arena	__skip("compiler does not support the arena address space")
+#endif
 #define __msg_unpriv(msg)	__test_tag("test_expect_msg_unpriv=" msg)
 #define __not_msg_unpriv(msg)	__test_tag("test_expect_not_msg_unpriv=" msg)
 #define __msg_next_unpriv(msg)	__test_tag("test_expect_msg_next_unpriv=" msg)
diff --git a/tools/testing/selftests/bpf/progs/compute_live_registers.c b/tools/testing/selftests/bpf/progs/compute_live_registers.c
index 1ff24bbc7beb..e05431600358 100644
--- a/tools/testing/selftests/bpf/progs/compute_live_registers.c
+++ b/tools/testing/selftests/bpf/progs/compute_live_registers.c
@@ -403,6 +403,16 @@ __naked void addr_space_cast(void)
 		  __imm_addr(arena)
 		: __clobber_all);
 }
+#else
+
+SEC("socket")
+__skip_without_arena
+__success
+int arena_unsupported(void)
+{
+	return 0;
+}
+
 #endif
 
 static __used __naked int aux1(void)
diff --git a/tools/testing/selftests/bpf/progs/verifier_arena.c b/tools/testing/selftests/bpf/progs/verifier_arena.c
index 1ce9c4b78481..3b3410802825 100644
--- a/tools/testing/selftests/bpf/progs/verifier_arena.c
+++ b/tools/testing/selftests/bpf/progs/verifier_arena.c
@@ -713,6 +713,15 @@ __naked void mixed_arena_stack_atomic(void)
 	  __imm(bpf_get_prandom_u32)
 	: __clobber_all);
 }
+#else
+
+SEC("socket")
+__skip_without_arena
+__success
+int arena_unsupported(void)
+{
+	return 0;
+}
 
 #endif /* defined(__BPF_FEATURE_ADDR_SPACE_CAST) */
 
diff --git a/tools/testing/selftests/bpf/progs/verifier_arena_large.c b/tools/testing/selftests/bpf/progs/verifier_arena_large.c
index dbdea14ca76f..34f0a0f88e12 100644
--- a/tools/testing/selftests/bpf/progs/verifier_arena_large.c
+++ b/tools/testing/selftests/bpf/progs/verifier_arena_large.c
@@ -348,5 +348,15 @@ int big_alloc4(void *ctx)
 #endif
 	return 0;
 }
+#else
+
+SEC("socket")
+__skip_without_arena
+__success
+int arena_unsupported(void)
+{
+	return 0;
+}
+
 #endif
 char _license[] SEC("license") = "GPL";
diff --git a/tools/testing/selftests/bpf/progs/verifier_ldsx.c b/tools/testing/selftests/bpf/progs/verifier_ldsx.c
index 49e8cd4bb4f9..35b20d0796db 100644
--- a/tools/testing/selftests/bpf/progs/verifier_ldsx.c
+++ b/tools/testing/selftests/bpf/progs/verifier_ldsx.c
@@ -450,6 +450,15 @@ void kfunc_root(void)
 {
 	bpf_arena_alloc_pages(0, 0, 0, 0, 0);
 }
+#else
+
+SEC("socket")
+__skip_without_arena
+__success
+int arena_unsupported(void)
+{
+	return 0;
+}
 
 #endif /* __BPF_FEATURE_ADDR_SPACE_CAST */
 
diff --git a/tools/testing/selftests/bpf/progs/verifier_zext.c b/tools/testing/selftests/bpf/progs/verifier_zext.c
index 572017fe28fb..dbfeeea4cf9f 100644
--- a/tools/testing/selftests/bpf/progs/verifier_zext.c
+++ b/tools/testing/selftests/bpf/progs/verifier_zext.c
@@ -381,6 +381,15 @@ __naked void zext_arena_cmpxchg32(void)
 		     BPF_ATOMIC_OP(BPF_W, BPF_CMPXCHG, BPF_REG_1, BPF_REG_2, 0))
 	: __clobber_all);
 }
+#else
+
+SEC("socket")
+__skip_without_arena
+__success
+int arena_unsupported(void)
+{
+	return 0;
+}
 
 #endif
 
-- 
2.53.0-Meta

