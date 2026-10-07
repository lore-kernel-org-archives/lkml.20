Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503033F107A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394948; cv=none; b=JSKMzOX40S85GNsBX3Tbbyf9A+IufvzCz3L3a2ey7GqjsL9Yqc06oliUhyU+O1aYcA2asgrAM1vGvMwRvwYp+Vogk6ekF99gc8ITY4R9da+xTgEHzJh3bXy81K8TnXuxXeJztq++RxsHJ2H4a1irv8GvqaNfUbFgtrrqfp3P2eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394948; c=relaxed/simple;
	bh=ZVEMir1UVtjeqTDd+kQt9OYW8kEe+ToC0TfYjUegh2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFXcI6XcXuWZyeZlefRwyRzfOClayG+4cTHUHzj/O+733EcM7CD9gU3ki7FbC7wiv/JsmG7CC3Zr7yjdYbMcUcxFn4V7hsMN/7NSfcebNj3IOXdLBMOm8u/JVSETZJiVQpm+Er5zq4cmnbdXjeEpE7dAO91wpfYZMeZwvRJQTDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1UCkofR; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1UCkofR"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33e6279a1d7so928615eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791394942; x=1791999742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nHXvTpeToSMwL5+SVT0PZraPoeYCO8NWG7j1aLQ/JCE=;
        b=I1UCkofRjmJtDEMqSrRX0+dJXFFZFv0KBZ80v0jJJF/am07zpBY66FXD+vY2Agex0S
         4mMoy4tsIjEcPsSw6Zf6SRMBtfzSOflAfr5VF07UebFTzeA/jZPljV9DScD4w6aCDLXZ
         Xguu0ZQrdXIRD6n/9WELDGFznN98kt0dvQUSOXXodE3IYo49gsd7JFO0VsOvMEnokRdK
         7on36iJ8omg2aXOSXYrog+UxOo8LwZtwaHySZ7frMmUV2XfLyYTeu4d6Pv1tUynGB64n
         EoWwM5ZB08Gwr5RrHo7QBgPzGJFBIlBGjOhXGTig39tzteTjMTXuyRyPox2pM831Hqyy
         wetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394942; x=1791999742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nHXvTpeToSMwL5+SVT0PZraPoeYCO8NWG7j1aLQ/JCE=;
        b=THsETAaklcyZU8b1vK766ssLTUIm8Tn+Y8JhOdRYBMg6jH38axs58rM1jf89dX66Rv
         bZ4AS5yHKNxDviPNRKZDOvYbzQf/MCZOMV8B3VEA/KoDdEhcuBLY5AlvXJTBZwCK92E9
         VUhDczvR4ljOaEUUMDCrhV0yL3E5bB8rMY/KaFocdz2TZpSUuGl2WzTv7yAi0DCP0aEb
         Z6qje/Ka3mbSCf5qMSH6pDp1yRFlyAsFqKdBUEHBRK+YoCMqmXdGHYVecl9ZuLJbk5lF
         n0Vme1XEXCi8EdKaAgnhV3Dzt0cnPULkKp5Yswm8lw5EbJwsjDsAHNYQl07PirrOD90h
         E/og==
X-Forwarded-Encrypted: i=1; AKwUvBzsejH2A1GeeWem+9V1QXzaV9vjbNgq70s10dIh2yYM3s0Qqhn+6ujFRNQvNyCyw1KUGA0dkeCMe2GtZqM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPC+nYcbWkD7vda8k+LHbXCCAGxFNM0QFaTEf28JhLVJR+re7N
	E7g29QgIujsE2UHoSg5MgOxXLezWQ7dJWjhpPLxepIDIto/w6MulG7wg
X-Gm-Gg: AYBFou2MJ2d7sO64Ip3mnIwdD5UXKvqdybPYEHPoPq91FBegH/AO9DfVkjD97bKd8d9
	Ri4pP9JhMrjOO/l6ZjS/UTIe/3F6C69ZMeNtH8YqsCVjGm+Rj3NmOVs6hz4jFc9dLsaIKJPvvom
	Bh7mLto+Lj/uAeGTv3VV+T+Teavd5o159SQJ6ntECbPqVUW52ogcD00+9rXiFDaTunppA0eWAJ8
	4/pwdutQxVoqNSOYliFua2rjoAUNkvZ3c9cwee27AFI4MtiLDzbdPrqdE/wgs0ZDu7c7v+AnAO/
	aNvNfugW575ZV0t3gkSAz14fVdBfMf2gRCgPdX7sTi3QEIvpIm5BsnsR7Au7f88lX1qkAiNimUX
	xF1QJBE4HuaETr4mBwQbUnb1qASdCSObkO0oSEMNJ5J9HL1Pd8/AO6XeEdrLLzqTz7v5+xKsy7H
	Pgko33pCnHAELqZ1V9LhsEMpPt8ZW/l0M/kDu5iH0DeaUFRJUJpjvUzYDl4lTIf55+I33Ti89kQ
	xo1bFGiJAsQ7bvrvNKp8dfzn/Qptv6l
X-Received: by 2002:a05:7301:6e9a:b0:351:4d25:861 with SMTP id 5a478bee46e88-3515de80f01mr3202494eec.7.1791394942003;
        Wed, 07 Oct 2026 10:42:22 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aff5dd6sm9124558eec.26.2026.10.07.10.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:42:21 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH bpf 2/2] selftests/bpf: Test missing caller stack argument slots
Date: Thu,  8 Oct 2026 01:42:03 +0800
Message-ID: <20261007174203.37071-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007174203.37071-1-bestswngs@gmail.com>
References: <20261007174203.37071-1-bestswngs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exercise the path where a static seven-argument subprogram has
unreliable BTF and is called through a bridge with only one initialized
outgoing stack argument. The callee expects two stack arguments, but the
unreliable-BTF path skips check_outgoing_stack_args().

Without the fix, the second r11 load copies an 80-byte bpf_reg_state from
stack_arg_regs[1], past the caller's one-element array. Expect the
verifier to reject that load at offset 16.

The fix also rejects the existing uninitialized-stack-argument test
before the later unreadable-register check. Update that test's expected
diagnostic accordingly.

Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 .../bpf/progs/verifier_stack_arg_order.c      | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c b/tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c
index c9fe4857d..23c7515ea 100644
--- a/tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c
+++ b/tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c
@@ -129,6 +129,16 @@ static void subprog_bad_ptr_7args(long *a, int b, int c, int d, int e, int f, in
 	);
 }
 
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
@@ -151,7 +161,7 @@ __naked void stack_arg_read_without_write_1(void)
 SEC("tc")
 __description("stack_arg: read with not-initialized caller write")
 __failure
-__msg("R0 !read_ok")
+__msg("invalid read from uninitialized stack arg off 8")
 __btf_func_path("btf__verifier_stack_arg_order.bpf.o")
 __naked void stack_arg_read_without_write_2(void)
 {
@@ -170,6 +180,27 @@ __naked void stack_arg_read_without_write_2(void)
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
 #else
 
 SEC("socket")
-- 
2.55.0

