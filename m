Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15013F076E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394938; cv=none; b=d5ubj11ew7M0mb0JF0YdQ0y4udGHmJtP7UrBqU1OvJ5wIQdsB2DE9Ltz8zZ6yqXQ8pJgzcKPHLwdxzMKAumndUvMIxd/U0nAbClHXehUKfqxokrCok70QoQ1v/cSduY4WDgL9JPG+gwzbnaJhg+97QBm0q01xHS9XDuyQG7IG5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394938; c=relaxed/simple;
	bh=PCNK6cSo4HrZhDXTZBKzDiMXi0X9E+ccmzt0Odcb45Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P3QAOEwCdoDtwTEcGxvSqwCcmD7uBTmUxqLkeOn37gxi+NJ2Zn4/56soGJ5tf/YqWWcSapFeECaJ+PlBDWWKD8QfQij8S42/rSmP5/eO+FUFswLSanyFnVHVXeerSE6hcSXpGnk1oqM5p00PhXm4nDv93Yy6EG/WfQYWOLuCtug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBK39PS8; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBK39PS8"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33c2520ad38so4926002eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791394936; x=1791999736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VoaLZ/CmdtPDr/c8jAuVoU3GPmcxGaCNhc7b0mTVzTA=;
        b=lBK39PS8NoJ5M+9chiAJWpAZApcEM218yFfApA99Wk0/h4Frm3FShjttvDZoXaB1au
         rJ3kzNblDmocK1Zy5OJfRuXMSNpn4viTA4AX4Jk7DRujgwLK+2iflg7GYeF9bWUxLJtG
         E86ykzGWGeCSSC3oOrKys5Y+8AqXGkhw270pdq6dk0CN4LoQqyNkxt01RNhqGwv77dld
         QY2CF4HDNeGkOypbQ+8WH61ygu4XnFpRgibkhgSlp0I83Pp5kN7/6a7df0mkmMtZHqUZ
         /zP1CXtRC0PbFSQXAl4SCWkZBCZc0zuTTTEaUgDPoZfIBaS1GaBOoINpQA5dXTLsfK9S
         QUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394936; x=1791999736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VoaLZ/CmdtPDr/c8jAuVoU3GPmcxGaCNhc7b0mTVzTA=;
        b=nr2NdelQLRz2OkS0oTakv41Bq6FxOnyubBXV4gCgMWb6r/smp0GxEWkASfnHfXvqfs
         1w1H2+FhJwrR91Powzllyf9uxLumf5D+ojK3Bnmo+kRms0lg8W4Ub7CAcoA/2GS3ahpG
         UUJcvou8J+zJn5TlZzUOriM1M4FC0Mz5Tu+I6ydKQ2yPRwAy/KmvVM9z9FA2RVVTTuGv
         1zx4rHuyRxOu+oD+GH84TnLI0fGV+oATuVbyiBaKViGDphccbfDUA34vGjmiPttoPZSa
         srX5/DuvD7ryZ2LM/XpNpCEA1PRkhUQ6OQ9I+ctfesPT/44MqfTGUmFxNRtCBCSZM04E
         K0ew==
X-Forwarded-Encrypted: i=1; AKwUvBxB1hpnsw8WQ2ysOu7TukKFcYbN15zI5W5Q56RrvzFFXwITdZ+Sob1HRQc5/jJnetI0qqVTCti+R9UyR5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUpb80FTqHN9z8dzuy+8YpP0sf79IJxFj9Gf5FSXj6xknp2uc2
	8acwpMoQMe/EARnDZlZAaDCufYzHiS5GDZoVgSE+lDtHrQbSFpYNNVTL/EYJat10lzg=
X-Gm-Gg: AYBFou1iXpasQPPngsXJ65j1Di+6l/SwUPucr2aFGuKu9ZeygBCKOWPAewYTNxHdVV7
	qgUxGRxhEs1k4TWbgDomiMLjDKLoEMpCX+fVEf9HdNSs5VGWjpMcR0n7QuibZV6aa9oy14k0EQh
	7RgQKASlAYujdRPYzg8sZBJQwJBD6s7gEXHr5adrRiTYLx4nu1LVT0HuInXyifXJs3ta1bu97xc
	8z9BoiCrO6DqfOV4cksQ20NFZHYl2VzRD0IuxOX2C1HkKr+W8QUTJZwTgYwhAgupjbHfxoKzdD2
	bmYKbwePCeve0W+x/QN3DGNux6gB1t+bz1VQxgJ0Ilhy2uPC8sESazIu/en6SKl5/99s6B83KQ9
	WUOOBzMKD35u8fQ5hde/UcJiT1rWjeIeC//lzvMkqRzJ2ew4IapKemkh9KAiseC5cUtyBcdkcVI
	nolg0ja7uXe+WvpMVXctQJHMsQvhmcHUU1bu2ugcDImMJYETOuHtqzXj0r/ZABj1HQoxg7Gq+R0
	n0FH7gS9gfMAzEeGcxlBteYJft/K3LGLv3cimXEO3E=
X-Received: by 2002:a05:7301:470d:b0:351:1e72:7470 with SMTP id 5a478bee46e88-3515dd351e4mr3163842eec.13.1791394935440;
        Wed, 07 Oct 2026 10:42:15 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aff5dd6sm9124558eec.26.2026.10.07.10.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:42:14 -0700 (PDT)
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
	Weiming Shi <bestswngs@gmail.com>,
	co+eada64ce90ecebce@bugs.sh
Subject: [PATCH bpf 1/2] bpf: Validate stack arg reads against caller state
Date: Thu,  8 Oct 2026 01:42:02 +0800
Message-ID: <20261007174203.37071-1-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_stack_arg_read() bounds a stack argument index with the callee's
BTF-derived argument count, then uses the index in the caller's
stack_arg_regs[] array. The array's actual logical length is recorded in
caller->out_stack_arg_cnt, so the bound and indexed object can diverge. A
crafted BPF_PROG_LOAD can use an argument mismatch to mark a static
subprogram's BTF information unreliable. Later calls return from
btf_check_subprog_call() before check_outgoing_stack_args(), while
check_func_call() continues the static call on -EINVAL. The callee can
then read a slot that the caller never allocated or initialized. Async
callback verification also starts at curframe zero, so subtracting one
to find a caller can underflow the frame array.

On x86-64, KASAN reports the resulting out-of-bounds copy as:

  BUG: KASAN: slab-out-of-bounds in check_load_mem+0xb51/0xc60
  Read of size 80 at addr ffff8881009af550 by task poc/131
  Call Trace:
   check_stack_arg_read at kernel/bpf/verifier.c:4234
   (inlined by) check_load_mem at kernel/bpf/verifier.c:6645
   do_check_common at kernel/bpf/verifier.c:19568
   bpf_check at kernel/bpf/verifier.c:21318
   bpf_prog_load at kernel/bpf/syscall.c:3134

The copy replaces the destination with a complete struct bpf_reg_state.
A deterministic reproducer retained a PTR_TO_MAP_VALUE state in
allocation slack, imported it into R0 through this read, and made the
verifier accept a following load through R0.

Require a caller frame before indexing it and retrieve the slot with
bpf_get_spilled_stack_arg(). The helper validates the index against
caller->out_stack_arg_cnt and rejects uninitialized slots before the
register state is copied.

Fixes: 0f6bd5e7a804 ("bpf: Support stack arguments for bpf functions")
Reported-by: <co+eada64ce90ecebce@bugs.sh>
Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 kernel/bpf/verifier.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 5f874979b..a67195aa7 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -4232,8 +4232,18 @@ static int check_stack_arg_read(struct bpf_verifier_env *env, struct bpf_func_st
 		return -EACCES;
 	}
 
+	if (!vstate->curframe) {
+		verbose(env, "invalid read from stack arg off %d without caller\n", off);
+		return -EACCES;
+	}
+
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
-- 
2.55.0

