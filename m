Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792979591;
	b=Y07ZxSECCSB6SpTXk7W/v7p1t6Su8NetCi+bUuNorrfcQgexRY9f1XbC/C8E5XpVtqN/
	 6yRVlvvr9paGXbAqx/qRJLuEdY+BT/3IPrQn6OZKhXuj0Cp26278+Y1M1Cqlt7a8nJc7p
	 tJuAG+KoPsWRelJBnVvIw1f8DckTikr3Q7Eh5E92/Vu57Z064RMtwvXyWA7l18FLw/G+Y
	 7SsVNEadLIvxwAy4p0zjveskjae2pYrSgyofgdRvMOYwTRyyY0sG1Vlx/qS/Yv5wm5uW/
	 uLWolyEhv/bOa7c48nGWdD/SLDLe3zPzPt7JbX8SDsnbAujzjsrEkcFEW7GilKNrsZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tkGyQEb1F9hHz/xznoehXSDNs1CLiz2rTicTpUpSfbo=;
	b=3D8vXf81N/ACrXKl3YMvRltCB1Bz9yZpQGtk0b7FuWfdUQpBPDT0ygl6I2U2nu1myzHs
	 iFN25SaD7jVNtGBFbA5OYbNBWUYpmTS9X0mIcj1ZC1+qfsFNIlCLpwB/tHMbKIku8dtNN
	 DWgDDuSXvmzpFcg6JEh5SxjbBPqtciWD0Qfnb1UOq/7Id2/SLd1pYt6K68i1mEf9oUxqG
	 WMtvOYl2/Ka2GPjskuaxHDm854KpauTqGoVhhIzhmm09W/h+gJz02fKp5vvk3z7RkYFF0
	 zQaPcvPBXYaeA7bWFTCKhCcKq8Ig32wWZoaXwZixccN2E9crUXOlrNdHYGGxrPfGoZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aCbxvSOx;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE00606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BE00606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aCbxvSOx
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e608cd460eso15314585ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792979591; x=1793584391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tkGyQEb1F9hHz/xznoehXSDNs1CLiz2rTicTpUpSfbo=;
        b=aCbxvSOxwsThWLKE0MsJS5hHxV0kdTRowgCgVwHYIl9kQID2jYpEWIQO4hFIrS6md2
         q6MPryXGuVhtMtb545P1A7QR2PjKZI6SyIIJGzlBHkuvpojfdInfvdDAWdbIw5YKt+g7
         yGQxuZzCDJAx7vpxBmFWN3czElUqVF6facxQA3ldeaoSrK2SFR3Wq09ViqPLY2N2f9Hc
         ws/gzxBcqPfoOjuQRO2T9UqB2qIhF6U3h1OTdEleetSE7BaFlvI3K4Xcivm/TR19+Lwi
         kyKs6NDQ22n4GYNtdYCtFa9xIMEUOBTeZDKXhbrUoAEzV5y8zfUk9odtDFLVK4MQlxPg
         btiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792979591; x=1793584391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tkGyQEb1F9hHz/xznoehXSDNs1CLiz2rTicTpUpSfbo=;
        b=lp7GbKbGcnivPak56V8TmHZehaj41nKfi/F/iSzl6QW07NYS7U8lUEOvSY97Mlb5FS
         /tA9VlJ3sAEFzqER5QsYoFCLxlsCTRsgGwIuXCf5v72+wfQJ19Q2mvYTEnx7hmE0W7BI
         Ml4qMhMnz8fbNi5FSs4nzJIqU+lLKI1GkJ63d6Kj84vD12HU9FK/QRFt7ajy75GHTLfG
         jHD8s11KUtxAcSYaIMLHG2q4wmFoM+Rz2JZXRAUuMJQDOU1G9GjIziZ+Abjz40cUWKOf
         jLAGRvi4+YEPfwCrQa+RNRVxOLVxeMletgHqkED0M3ZAjzqtR2xdph3jkEgZe87tUJDw
         dneg==
X-Forwarded-Encrypted: i=1; AKwUvBxAlzN7Bf2X8KNn9CbYwCSS1rusbTL2rB/NbJeJ5uyEKeb+DLOGMXOdClQg7I65ev+kwFI3RvVMfrVM0KE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNhyEVksxdpYCayv8dcUQ9BTC1GMfyd17j7v9dJ7cQjRuc7Feq
	KUoOxM3L/+uSHsPVsFE9NknLDm93ufrYGB/N4i8KL/4pa8UNcDiI+B4L
X-Gm-Gg: AYBFou2KXJUG8U1/fEZvgewePc+zKmhm/x7HeCrcpX8DM0Jzeodv2AR0g8pD3hVjYiZ
	cpHxDvHofadLcV96zrFVxkx+Q6ZIabc7U2HbmvaJrL4x6Ye3JE5qnD1y4kQu1tr5Ri9F6DXsWsI
	jN59fSYpr4Dh4jjbOgpG3+hfmjUiozjtFTv430yFeGJUNc4fgfc/m3wjrR7Rab4lOs2BoFgC0Px
	tGqJMX12CRqYFmb4eAqEDSca/wg3t6Nm1YB70Qc+oy7zSODElJvsIGj2T6wSvOoqjC9gCQEbssS
	AZyqlX74DRjKpfozSppxbYLFNMf9d2GLMQu+f8RbeDne2PXrGyd/5rKwtPXH0dyogH/NP2WukC0
	CJzja8py07uhX/A3jsPy2QqWLUHCk4A59uXnkh6RTq3rcmZ/MCmMf76J+49cKDO3fokmYYqJ8Sn
	0Wsz8iGtDobGqiUSxTlgc6HHFrJHvoY8MsP9PcOn4/ElopElh+b0ahYW5mASSvVb4pJa7Ap4ufE
	ge0vwtFO1ECi0c5odAuSgiKidObb2V29JV+3zey8govqoybNMaLmjs1KKQv3xassb37W+8grCvf
	jzT7qpDKnJcdJqSoUVS/V/Ai1MihCRDtrG6VGSFhn+Q+GBiuAw==
X-Received: by 2002:a17:902:e5cd:b0:2e9:658f:c33e with SMTP id d9443c01a7336-2ea9c0d4beamr44584065ad.8.1792979590768;
        Sun, 25 Oct 2026 18:53:10 -0700 (PDT)
Received: from Terra.tail0ac356.ts.net ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9af3232bsm10137655ad.10.2026.10.25.18.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:53:09 -0700 (PDT)
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
Subject: [PATCH bpf v3 1/2] bpf: Validate stack arg reads against caller state
Date: Sun, 25 Oct 2026 18:52:49 -0700
Message-ID: <20261026015250.1674676-1-bestswngs@gmail.com>
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
Changes in v3:
- Rebase onto the bpf tree at commit 00d2cdf1637e ("Merge branch
  'bpf-track-borrowed-iterator-result-lifetimes'").

Changes in v2:
- Reject callback subprograms that declare stack arguments.
- Drop the curframe-zero check because only async callbacks can reach that
  state, and callbacks with stack arguments are now rejected earlier.
- Explain that commit 4286f5deee14 closed the hole for the first call only.

 kernel/bpf/verifier.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index c223bf3bc9cdb6..a0a5f075d2018a 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -4666,7 +4666,12 @@ static int check_stack_arg_read(struct bpf_verifier_env *env, struct bpf_func_st
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
@@ -11451,6 +11456,10 @@ static int push_callback_call(struct bpf_verifier_env *env, struct bpf_insn *ins
 	err = btf_check_subprog_call(env, subprog);
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

