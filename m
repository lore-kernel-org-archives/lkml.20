Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569674;
	b=bBC7A8UIp5GDXbfeJYTpdNIQjdyNqmj80EjWJZvyLoApIsBRvlatEh93aMmPd5d0q26X
	 F9NXOfxSv2dXdpXzLgopLPLEPflidpckIv/Ns2J0tr84DhyTblf1m3fcYHypCq0dJMzPs
	 0oF/SZaqZRT75eMEHa7DeyQBcVGrDXdx5bA1FjFw3xAysweWF78tnE49SdP1LXSEsPGc9
	 kLNTHAXozO1bxEfJ8Eorks2LPBIPf0JO02+n5luwJlQk/WXfnh6taQTJF5FTlvpo6diSA
	 zq50ykS+k7tMPCY4rJ8v1H0T8pGLFAaBHtq+WPVWX/LcR9Fo6/D0qMoTceVaMT7RHDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PiI4cMavYXtb8vt/MajCrhWPebqVcKLkNr8147+y6WU=;
	b=Iape79x1m3XOSCCUVq1GE2WfeJC2QWvcNCrHSs2NTf/HI+WRYIrshPl6ehBlP77CEGq/
	 dTc+63r4PUi1eEpKV9aSRqStQbZzpWJBNygt7StDTPBUZmBnlt/RIR3opKw8F2dLtyTIw
	 bRSIbzBoZ+sog1wKl+L7GKPwpjX7ponNNTq/c768+uIFz9OQ1iI6Prs5th4Mu+v9N6Fpb
	 7oXXXqAeFfqq2SuR+kCY9kGexZTFu5r68FOmAGmRiC6r0DSp4FS20+i7/ryijamywKKn6
	 qLRBqxHq/+Pb47rvvMvlOUUtrKZqfL7idLPKSZzmzAfiNJ+4Slh25T92/Y73yQIKCOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=beu0BXXQ;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40988606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40988606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=beu0BXXQ
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1359987eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792569673; x=1793174473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PiI4cMavYXtb8vt/MajCrhWPebqVcKLkNr8147+y6WU=;
        b=beu0BXXQNA4InNFt82BaFOJL7zjfNzYGRue65Lszr5n1WGFG30rIq1M+HQKabuKkU7
         WSGmDMMMCbDASNd576d4BDkYI/1wp6mgI/GmHyILQKHOSInIEZ1qkcYS0t9hULGA+kn4
         jJoOCAhS6O9mMs8W39ak8jOyiwaM8xvuuz/XFO4h/fHkykK3R3oP0lnsMN7QbzJJ+7Nt
         pZ1Ebg3bWHyPBJcfET7k48n8OnHw4wWjxUjiJKiA2d9nOVooBcUAkN6zawPdFd79CJYE
         1LCplnCxiXImwEi+W866dU/4WYnve+jSyw5TAMWa3ZSZGLM1vXr6YUZm0Hcdr9dR9PpO
         XT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569673; x=1793174473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PiI4cMavYXtb8vt/MajCrhWPebqVcKLkNr8147+y6WU=;
        b=MG5GlGODNADHwFckaZ9WmSOsjSSHTOFL8vLcvlQEyc5w8QOme9TsUn5XC6tw4VqICA
         MNxvqyXiR+hKgbX5uSTleVLIuw6AGfQsl6DRlTe4gFmTbSlcGHBVHdPuwImI6EkZDfi6
         qEOuJeCf4IhqnEQ77CwiryZCj/6aq/7mF2yh2u5UPyocijnfKZzZAlpky/YYaYhAOoon
         pcTox+hf5U75So+fYCgdiW53KvaoZqAWDdmbm5Fzyk4t1FTDFZOujCQRX5NsDkWv6G4Q
         59Pn8Tvy0HljQCTom2yo6XSLubtd/xObR6Y5EAysvC5YspITSPbJHe+9UBVsMKO0T9K7
         AH6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzVedNuIRIS6hlAeZkFSB/QOckPJVVFSduhSc1SGcr5uV/iA1AhtP9NIE/KEvlrvUU+FpEBPY8it87/dPY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJe1V90Y0akVUOkxdu1pNdJPGAjwZv/atSxa3AgHC6OWfC9IUda
	SPtDdmRP3zbhEAP6J1NL57ThX50NVIUyJtAus6dl96b9QjCk/3sjHAJUlL18RGTIaE0=
X-Gm-Gg: AYBFou24RRwz+O1PP3lVuE9tYbaVSg3ciRJrYztcPYBztqCs34F5rNLzmyTL33JFVv3
	nzltcd25PNFIAu8CQovzW+hq31EwogLO+D3wdf/2EmB/m4sCQH6SqZdbyx0YSQS4gGolnXAMa+j
	h4CYzFB+nROq0YOBDydW/c9t+EkjDYovTEcYpRw7cE5BSytf0SoQi+R6wPe32Sbc3q/qihaxuZ0
	I/OcilNs0+FoG3y++Fmf804oTJ8WHpJgsLXxaBxSH7H+/dxhSBt84mrhzt5jZ620CoEX011M1Cn
	6EHqF1xY9o08m4fYSzXGu6Z7i7d4dQ9F5aa7Qu/cNscRVP5U+1D4VTf6bcv4xtvrT7D1hXmyL4W
	XSxFVBU47zzQaJUzwXOxLNsAhk8dwWtdPQMv8HB9mfGhMFqGtOEq+fwzfkXJsj7Wt5/cMUgolic
	RUIHpRSCi4ENYJ1zjivai9rhaYs1P93zPv9LY3TlID7pgVIoR3BazqgKHZ0gg3SVyZ6WuPW94Pv
	a64OmUleMj9zityHEQ5D0b5HhWI02i88PrseeCXPfEEgd8pVj3G8CpLmNROOOV84mRInIOLMnr1
	tpJYq2awu353XfuVr6daoAoJZ+Vf
X-Received: by 2002:a05:7022:e1d:b0:141:4c37:a212 with SMTP id a92af1059eb24-190a051dd9amr2581121c88.2.1792569672784;
        Wed, 21 Oct 2026 01:01:12 -0700 (PDT)
Received: from Terra.tail0ac356.ts.net ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367416a1fb9sm4470610eec.20.2026.10.21.01.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:01:11 -0700 (PDT)
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
Subject: [PATCH bpf v2 1/2] bpf: Validate stack arg reads against caller state
Date: Wed, 21 Oct 2026 01:00:59 -0700
Message-ID: <20261021080100.2663618-1-bestswngs@gmail.com>
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

check_stack_arg_read() bounds a stack argument index with the callee's
BTF-derived argument count, then uses the index in the caller's
stack_arg_regs[] array. The array's actual logical length is recorded in
caller->out_stack_arg_cnt, so the bound and indexed object can diverge.

A crafted BPF_PROG_LOAD can use an argument mismatch to mark a static
subprogram's BTF information unreliable. Later calls return from
btf_check_subprog_call() before check_outgoing_stack_args(), while
check_func_call() continues the static call on -EINVAL. The callee can
then read a slot that the caller never allocated or initialized. The
earlier commit 4286f5deee14 ("bpf: Validate outgoing stack args when
btf_prepare_func_args fails") closed this hole for the first call, but
not for later calls after the subprogram has been marked unreliable.

Callbacks have a related problem. The verifier can make incoming stack
arguments readable from outgoing slots at the helper call site. However,
helpers and kfuncs invoke callbacks through an ABI that passes at most five
arguments, so the runtime callback receives no stack arguments. Async
callback verification can also reach check_stack_arg_read() without a
caller frame.

On x86-64, KASAN reports the direct-call out-of-bounds copy as:

  BUG: KASAN: slab-out-of-bounds in check_load_mem+0xb51/0xc60
  Read of size 80 at addr ffff8881009af550 by task poc/131
  Call Trace:
   check_stack_arg_read at kernel/bpf/verifier.c:4234
   (inlined by) check_load_mem at kernel/bpf/verifier.c:6645
   do_check_common at kernel/bpf/verifier.c:19568
   bpf_check at kernel/bpf/verifier.c:21318
   bpf_prog_load at kernel/bpf/syscall.c:3134

Reject callback subprograms with incoming stack arguments before their
state is pushed. For direct calls, retrieve the slot with
bpf_get_spilled_stack_arg(), which validates the index against the caller's
out_stack_arg_cnt and rejects uninitialized slots before copying the
register state.

Fixes: 0f6bd5e7a804 ("bpf: Support stack arguments for bpf functions")
Reported-by: <co+eada64ce90ecebce@bugs.sh>
Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
Changes in v2:
- Reject callback subprograms that declare stack arguments.
- Drop the curframe-zero check because only async callbacks can reach that
  state, and callbacks with stack arguments are now rejected earlier.
- Explain that commit 4286f5deee14 closed the hole for the first call only.

 kernel/bpf/verifier.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 72a3f5998dd27f..f461e9e5d19da5 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -4228,7 +4228,12 @@ static int check_stack_arg_read(struct bpf_verifier_env *env, struct bpf_func_st
 	}
 
 	caller = vstate->frame[vstate->curframe - 1];
-	arg = &caller->stack_arg_regs[spi];
+	arg = bpf_get_spilled_stack_arg(spi, caller);
+	if (!arg) {
+		verbose(env, "invalid read from uninitialized stack arg off %d\n", off);
+		return -EACCES;
+	}
+
 	cur = vstate->frame[vstate->curframe];
 	bpf_diag_mod_begin(env, &cur->regs[dst_regno], arg, BPF_DIAG_MOD_WRITE);
 	cur->regs[dst_regno] = *arg;
@@ -9839,6 +9844,10 @@ static int push_callback_call(struct bpf_verifier_env *env, struct bpf_insn *ins
 	err = btf_check_subprog_call(env, subprog, caller->regs);
 	if (err == -EFAULT)
 		return err;
+	if (bpf_in_stack_arg_cnt(&env->subprog_info[subprog])) {
+		verbose(env, "callback subprog cannot have stack args\n");
+		return -EINVAL;
+	}
 
 	/* set_callee_state is used for direct subprog calls, but we are
 	 * interested in validating only BPF helpers that can call subprogs as
-- 
2.56.0

