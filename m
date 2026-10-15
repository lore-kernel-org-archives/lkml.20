Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69306348C7D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028168; cv=none; b=N3fciJ9p50LXP0ekMnmAIa972iGaGbhSdjjaWCKYMx46pOJqns7NzrCBniSoVY7KAnkC6jI2jF1jDzRNj4WYvthsk51wQkcfauMxWl9g1+4AhybQICi76EbongJ9KAsY5BKpEE3BgVpYBvdcP1tV6dRK7PHMZ9dLMtwfy23UzKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028168; c=relaxed/simple;
	bh=6Ib9/3TAiZ5uh1YJF6IxWNpmxmLNwQ08hjbdiSyCHMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tovH8o259WhZGXs/VsDWi2Wb6LI4G3KdP+IIyxT61A1LSRAW1RaaTyy4fgTZS/2r+bND4se8WE2wqMtGJUBNAI1CKK7Su0PKD+RUstYbjKqYG4EuPiZBYqb3T/krwEfrcLG3sy6bRzx4rM0HQ9fJiN0gSy8NWAs10cTxWPXBEO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sW/X9gJT; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sW/X9gJT"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-354ba08cfd1so7934414eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028165; x=1792632965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGx9VJI94ETrm3YJBJ7sXJGNSawHPsY7ho7tP+XWN54=;
        b=sW/X9gJTpXXG7EnWw9pT69m3E9acn6urOVZVm1Csd5X4fQJ6BsTGM64l/aRXaFheNP
         UH2JbvURo6/eLq4FPiFauge74E8Aj1HuwbHe0vovphsUqNk4xVdoyhPh2o53dCPAwbHo
         w8j+Lf6f7K9qMrFk/jCtaDnov3Ejh3Hf9rTggEz0MtntGmL4J+eir0um7jlSL6zACRhS
         yTUNJg8H15J2Db0KNtKEY3B0KDWntVuj1q6/W3BRPpUv0rKdncs2UJaxhk0yIef4vxGB
         pvGEvQMMWaOXAu2AsoQHFDfp+c3DGgTpgfQpmqMHqrdp2HRfqra3mkOe/AKi5uxNkG9s
         Y+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028165; x=1792632965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGx9VJI94ETrm3YJBJ7sXJGNSawHPsY7ho7tP+XWN54=;
        b=ps5+YQX0XKObd6Dt+UTpuDANj2Cdkf0710TKqMCePjRMukxhI2TfnDy2N6fZIPdlU+
         +GMSzGlObPgjW5AuvOSSDyhZI/76YJRZHz3uWVBKYUrhUQV04DTwBdyv5AR+D0VHS7al
         N/uL7kEsOTUTbjd5vp1owqbiCJZZNUKeoRC66gt+HcOJ5BiQ6RLUFcTuc5jMgmuz+pUW
         He7KMM/cjNs59I6cy+Pu51oVr5JBki5+Gc4ZtCTmehmjwZMGl+9deTiTdAQlULK7xGJQ
         jThFVqRK7lIhnQO6hYwXhujoE/bxUamu/tWT1H+VpQibfeomhVqmaURqrSaVNHy6U1Ro
         XbpA==
X-Forwarded-Encrypted: i=1; AKwUvBy/KFx2HOMFDSwY0DtScl6AtRWmEuv+daoshOdVnRbVlTFB4M6PTPs0SWHPZK6JvIFrmkOFchXRe/Pk1FQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiXtYqOKVIeVcqFFf2GI4+k8TDmKNu2EmIC7+7jDQIrYRDr5wY
	OhBOeCFz6p809piPu+1DvmZx7WKNJyzY3xyvYhwXmr4aUxa0FL8UMH/Y
X-Gm-Gg: AYBFou3TCqffzuMVnO4lxjZsi4sbxV0zFHR6z6AB4cTq0zFt0heli0ZeDD9rs9o4F8X
	UbM+rRF3DoIsPOC6333m0XIfQMHWJvGK/hn89moMuDLfX/H04txWTEKs9N96dFa/UVUFvtddIg4
	MlIsw2XY+4rpwnsek0j5YoNzIN5wG9dF1ZJIbRYT0DuqnrvS9cFGtmNXpkqT8T0ftB7R9W4SL4k
	L2HMVQ5se5QBRWSd4ckH678+/8FcB5s0b7cSmHglCef7fdyUAX4XRjvYOQEpkNRSOgaMPdfH8+j
	12XDyRX423hn4hLKaTdg0Cmw9WH5LZcP9/8QvMl9U+k8Uu6Yu43fBLeQ1gBAZOnhXI6+SRCsiPa
	mfzRJLzzpAjjALjFNtMi/If3vOXecHhwX46SQAKvIenn74x4J5qoi7YqJNRA2BSJd8iMGXhIzYN
	WrC3DoQIjfGMqpzY+nibKgi4flEi/7TMG8+C93MOKs2dFlY5D/xHlAiRGJ7HsLo44ANUXC1ulSq
	SBL
X-Received: by 2002:a05:7300:c8c7:b0:35f:4780:518e with SMTP id 5a478bee46e88-35f478052f2mr547033eec.16.1792028165379;
        Wed, 14 Oct 2026 18:36:05 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm47863101eec.15.2026.10.14.18.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:36:05 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 15 Oct 2026 09:35:51 +0800
Subject: [PATCH bpf-next v3 2/3] selftests/bpf: Test freeing a struct_ops
 map under a running prog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-selftests-bpf-struct-ops-assoc-timer-v3-2-efe643d4b2a3@gmail.com>
References: <20261015-selftests-bpf-struct-ops-assoc-timer-v3-0-efe643d4b2a3@gmail.com>
In-Reply-To: <20261015-selftests-bpf-struct-ops-assoc-timer-v3-0-efe643d4b2a3@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Amery Hung <ameryhung@gmail.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

st_ops_assoc_in_timer_no_uref drops every reference to the struct_ops
map while a timer callback of its prog calls .test_1 through the
association, and checks that the callback ends up with no struct_ops.

The timer first fires 500ms later and .test_1 returns right away, so the
callback hardly ever runs .test_1 while the map is freed, and the test
can't catch a map that is freed under a running .test_1.

Add st_ops_assoc_in_timer_free, which starts the timer right away,
restarts it with no delay until the association is gone, and makes
.test_1 spin in bpf_loop() when the timer callback calls it. Share the
steps of st_ops_assoc_in_timer_no_uref with it through a helper.

st_ops_assoc_in_timer_free run in a loop on kernels of the same bpf-next
commit with KASAN enabled, x86_64 VM with 32 vCPUs, without and with
the previous fix:

              without the fix           with the fix
  outcome     Oops (int3) on run 1      100 of 100 passed, 0.27 s each

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 .../bpf/prog_tests/test_struct_ops_assoc.c         | 29 +++++++++++++++++++---
 .../bpf/progs/struct_ops_assoc_in_timer.c          | 16 ++++++++++++
 2 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c b/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
index 461ded7223515..987117091c676 100644
--- a/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
+++ b/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
@@ -136,7 +136,8 @@ static void test_st_ops_assoc_in_timer(void)
 	struct_ops_assoc_in_timer__destroy(skel);
 }
 
-static void test_st_ops_assoc_in_timer_no_uref(void)
+static void run_st_ops_assoc_in_timer_no_uref(int timer_ns, int wait_map_free,
+					      int spin_loops)
 {
 	struct struct_ops_assoc_in_timer *skel = NULL;
 	struct bpf_link *link;
@@ -157,10 +158,13 @@ static void test_st_ops_assoc_in_timer_no_uref(void)
 	/*
 	 * Run .test_1 by calling kfunc bpf_kfunc_multi_st_ops_test_1_prog_arg() and checks
 	 * the return value. .test_1 will also schedule timer_cb that runs .test_1 again.
-	 * timer_cb will run 500ms after syscall_prog runs, when the user space no longer
-	 * holds a reference to st_ops_map.
+	 * timer_cb will run timer_ns after syscall_prog runs and, with wait_map_free, every
+	 * timer_ns after that until the map is freed. With 500ms, it first runs when the
+	 * user space no longer holds a reference to st_ops_map.
 	 */
-	skel->bss->timer_ns = 500000000;
+	skel->bss->timer_ns = timer_ns;
+	skel->bss->wait_map_free = wait_map_free;
+	skel->bss->spin_loops = spin_loops;
 	err = bpf_prog_test_run_opts(bpf_program__fd(skel->progs.syscall_prog), NULL);
 	ASSERT_OK(err, "bpf_prog_test_run_opts");
 
@@ -178,6 +182,21 @@ static void test_st_ops_assoc_in_timer_no_uref(void)
 	struct_ops_assoc_in_timer__destroy(skel);
 }
 
+static void test_st_ops_assoc_in_timer_no_uref(void)
+{
+	run_st_ops_assoc_in_timer_no_uref(500000000, 0, 0);
+}
+
+/*
+ * Keep calling .test_1 through the association from the timer callback, and
+ * stay in it for a while each time, while the map is being freed. The map
+ * must not be freed under a running .test_1.
+ */
+static void test_st_ops_assoc_in_timer_free(void)
+{
+	run_st_ops_assoc_in_timer_no_uref(0, 1, 1 << 20);
+}
+
 void test_struct_ops_assoc(void)
 {
 	if (test__start_subtest("st_ops_assoc"))
@@ -188,4 +207,6 @@ void test_struct_ops_assoc(void)
 		test_st_ops_assoc_in_timer();
 	if (test__start_subtest("st_ops_assoc_in_timer_no_uref"))
 		test_st_ops_assoc_in_timer_no_uref();
+	if (test__start_subtest("st_ops_assoc_in_timer_free"))
+		test_st_ops_assoc_in_timer_free();
 }
diff --git a/tools/testing/selftests/bpf/progs/struct_ops_assoc_in_timer.c b/tools/testing/selftests/bpf/progs/struct_ops_assoc_in_timer.c
index 0bed49e9f2170..47a44c8e8b114 100644
--- a/tools/testing/selftests/bpf/progs/struct_ops_assoc_in_timer.c
+++ b/tools/testing/selftests/bpf/progs/struct_ops_assoc_in_timer.c
@@ -25,6 +25,13 @@ int test_err;
 int timer_ns;
 int timer_test_1_ret;
 int timer_cb_run;
+int wait_map_free;
+int spin_loops;
+
+static int spin(u32 i, void *ctx)
+{
+	return 0;
+}
 
 __noinline static int timer_cb(void *map, int *key, struct bpf_timer *timer)
 {
@@ -34,6 +41,12 @@ __noinline static int timer_cb(void *map, int *key, struct bpf_timer *timer)
 	timer_test_1_ret = bpf_kfunc_multi_st_ops_test_1_assoc(&args);
 	recur--;
 
+	/* Try again later until the map is freed */
+	if (wait_map_free && timer_test_1_ret != -1) {
+		bpf_timer_start(timer, timer_ns, 0);
+		return 0;
+	}
+
 	timer_cb_run++;
 
 	return 0;
@@ -53,6 +66,9 @@ int BPF_PROG(test_1, struct st_ops_args *args)
 		bpf_timer_init(timer, &array_map, 1);
 		bpf_timer_set_callback(timer, timer_cb);
 		bpf_timer_start(timer, timer_ns, 0);
+	} else if (spin_loops) {
+		/* Stay in the trampoline while the map may be freed */
+		bpf_loop(spin_loops, spin, NULL, 0);
 	}
 
 	return MAP_MAGIC;

-- 
2.43.0

