Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793115963;
	b=mCnfkDT9VRFrG9RzmhE6IPJFGuAcm4S6894i3bEmv/kJkODn4lLUkKYZ2SlwsQuaORGM
	 GTqOcGV2noQTxcW0kOOuevub0B4Wg0Biz0UXOxzczTwOibtN3t39x2w4daOv8t7Gaxbxx
	 UGM1z09kq4U/2J27igNv+5okF3JB5UQRZVszJ0Mlw5I8s8LjgkcDq9wU5kdvwUeYC9UUs
	 +32A5MzUpm5W6oMLOUFI3ErRTaJLmMs3Onxv8xV0p3DC81dPEsR2p7Nxaxffx++oDJu5x
	 am/+MtriJ/95jcoRSzWqEkhCc+rp5+Stc4WD3SwayXMWnfrkCaLusHAW/FCAsxEAPRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1U/f7oPGNubcc6Z6QRWv6i5yV414y9BBz7ooV/FsgrM=;
	b=XEx4ecmER+sPtoeqeBkDs6EEnnHIKnphUUpOpqvduSWIkG5p6U1OQtvB+k2pjIhvqC13
	 Sc2emUlvz7YF7EFrevPe4KrUPepuNrIcRZtoh/I87m5ZCznpNmfcWdzhjgNvf0tKFgMj1
	 GtMn0UvX3Xl7x24z8PJA0CkpfW1lq07+6fLFjHlqL2h7M+CnX7JK5kFfU9IJGpgu/gcju
	 yaGuC0IoLRE8HvFCXibtj8mAXOlAgZ1BMNpIvaWiMi+0yqqBb8br+BfTqUfQy/+hiOCWZ
	 b0/3LCZuLoMxE93MvpQEWArV1NQutP0ndtYtBZwW74XiCTPeLcYweUzh2HBaLZVgLPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dDxSCKV7;
	arc=none smtp.remote-ip=74.125.231.73
Received: from mail-oa2-f9.google.com (mail-oa2-f9.google.com [74.125.231.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627E4606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 627E4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dDxSCKV7
Received: by mail-oa2-f9.google.com with SMTP id 586e51a60fabf-47bd4bcc3e2so15695fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793115962; x=1793720762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1U/f7oPGNubcc6Z6QRWv6i5yV414y9BBz7ooV/FsgrM=;
        b=dDxSCKV7uirI0zJKGKUITji24Pmx13hWIPnSRXOF0IdrdI73IX7Jp49wDeC8fo0GFy
         TEP3yqJug5HAfCZQ8dfgAXECgerbozNJLCGWPHWetz0tP15iMl/F9N5PJM4kEu4Gi9tw
         zX1AorLE67asLZAGd512VBbHcU4zgxFvl7QBAcbJDy8L5kILe+alejUjA6ivBR2JqeYG
         bOI0WLoDP9Yv4jixhxrviramGCGn4MeTc466GBnhtAWTu/rC06O+10lwkvWJJe0e4b3S
         GiRDf7rV5T0KAHh14QsnTjUmHb0t0Eb4OAf9bcTBSK/7Tl3gv8OIwpJAL6c2H+XY0haL
         N3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793115962; x=1793720762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1U/f7oPGNubcc6Z6QRWv6i5yV414y9BBz7ooV/FsgrM=;
        b=wwnHvTlmaJiU/drs2iDeyda2Cvc5yt0n1yprIK4LbJwiWROk7VGIz6abfTM/auwwuF
         j9efj38uGMEKVpvLYpKPx5mIIOPfwczS5W17AAhsvIDZUmAvkKX6bu5kzNBs8ps2BjB4
         XavX/G+ZPvStirbDXhZmbsDjj1qPjPOvAvgNVArj0pgqBN6hQoyX/Wjm2HxEmuWh8z4S
         gzMVN5g41Ywzs3f26+KfYgqCOhAni/66+tnwzpA6F5Ru4rDp7UD+DUfdMxG2+ma5HltS
         C6jtdkBIHGCkLIZagNBaJi9pXouVuglU9NdQ8xysEce8htLvY0FQ0Qe1h3hFApdLLzZH
         6kZA==
X-Forwarded-Encrypted: i=1; AKwUvBxZw22sAUwIIJG5QaUJpsafLlVc1k7R/1Jql8doyzfbMuKGYuqxGvL+owbtbiMggbjU+JG3x4pAs69oBhA=@vger.kernel.org
X-Gm-Message-State: AFq9FYInDppN7QICbhyOZCEqeo4cgdFKhZgLjtVrIDY6dKuvt+s4Gkc3
	lVaKeFcBeuZWHlp15M3gviEM74MRSU5v4isjhOOsg7mrHuJhKCBerPqy
X-Gm-Gg: AYBFou3SYEo210T4I/9eGVpOW+g7cat0P+KmRy+SCK1vlJ/9I30z1EuNqt3xJ+N8W0f
	bWmiCzoBMuAOEp1oUHWTiRhRsJCDZ0b13bEqPAj/TE/vz19VcSShxsdmNz4Zpl8sa9N1DkLzFo6
	PZeISco0zJtOMy8ypPj1eZ39Svw3N/3nz+2089PWAJV4BHd9S47R5AapIKMRqoB6XODQw6f9MBL
	4KTAGvqfhnBlhgUke9fRm0+Tp1zhugf3kgczivKJx/zVogpNJtOUHDYt33zDDdIvMN2Lu79h8k5
	CpBohLf+bBrFK0z5HXQS+/lNQiw7ngxtoCjYRRZk25oHO0g/7JK3W8I5wfpWnkQAnPC4PhIkUaD
	FyUcTe/itJyT8CYS2ZKtw7FCNmrJnxn5PZIHdgVSWaEpNZVf/zwa/++0CNtuglwnKa7SI/kH9xb
	X1qszs8nAjb2rub3VsDfHhcZVdkKQH3XF/pT0JqGLZCNhtLL+UURxgu9Bzg5dsyje+IGyMTQWzj
	ltcWTkZ2CcSpOQdW6+kTd0iRD9lbxZJLnG7JqnhJpBgyrWXdkLDvzK9B3a1BLAQ2YHEmx/HAQeU
	rT1HxnOFx+YapZCKVWo=
X-Received: by 2002:a05:6870:ac14:b0:494:7435:ebc9 with SMTP id 586e51a60fabf-4a83f60f8f9mr6048799fac.52.1793115962282;
        Tue, 27 Oct 2026 08:46:02 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.34])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b78de44esm445828fac.11.2026.10.27.08.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:46:01 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
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
	Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v2] bpf: fix out-of-bounds frame access for async callback stack args
Date: Tue, 27 Oct 2026 23:45:53 +0800
Message-ID: <20261027154553.1043567-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

check_stack_arg_read() resolves the caller frame with

    caller = vstate->frame[vstate->curframe - 1];

and copies caller->stack_arg_regs[spi] into the current register
state.  It bounds spi against the callee's declared incoming stack
arguments, but nothing validates the caller side.  Two kinds of
callback frames reach this code without a validated caller.

Async callbacks (bpf_timer_set_callback and friends) are queued via
push_async_cb(), which builds a fresh verifier state with frame[0]
as the only frame and curframe left at its kzalloc default 0, so the
code above evaluates frame[-1]: an out-of-bounds read behind the
bpf_verifier_state.frame array whose result is used as a pointer.

Synchronous callbacks (bpf_loop, bpf_for_each_map_elem, ...) run with
curframe >= 1, but push_callback_call() ignores every error from
btf_check_subprog_call() except -EFAULT, so a callback subprogram
whose prototype does not match the helper's callback ABI (e.g. more
than five BTF arguments) is still queued for exploration.  Inside
such a callback an r11-based incoming stack argument load passes the
spi bound check, while the kernel helper never passes stack arguments
at runtime:

  - caller->stack_arg_regs is a heap array sized by the caller's
    out_stack_arg_cnt; if no outgoing stack arguments were prepared,
    the load dereferences NULL or reads past the allocation;
  - if a previous subprogram call left initialized outgoing stack
    arguments behind, the stale register state is copied into the
    callback's registers even though the runtime ABI passes nothing
    there.

Kernel helpers pass at most five callback arguments, all in
registers, so an incoming stack argument load can never be valid in
a callback frame.  Reject such loads when the current frame has no
caller (curframe == 0) or is a callback frame (state->in_callback_fn).

This issue was discovered by Tencent CodeBuddy Security.

Fixes: 0f6bd5e7a804 ("bpf: Support stack arguments for bpf functions")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---

v2: Also reject r11-based incoming stack argument loads in synchronous
    callback frames (state->in_callback_fn), not just the async
    curframe == 0 case: push_callback_call() queues callbacks whose
    prototype failed btf_check_subprog_call() with -EINVAL, leaving
    caller->stack_arg_regs unvalidated or stale (sashiko review).
    The curframe check stays necessary because the async timer and
    workqueue setter set_timer_callback_state() does not set
    in_callback_fn.

---
 kernel/bpf/verifier.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 5f874979b8d75..c838ec39590b9 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -4232,6 +4232,11 @@ static int check_stack_arg_read(struct bpf_verifier_env *env, struct bpf_func_st
 		return -EACCES;
 	}
 
+	if (vstate->curframe == 0 || state->in_callback_fn) {
+		verbose(env, "stack arg read from a callback frame\n");
+		return -EINVAL;
+	}
+
 	caller = vstate->frame[vstate->curframe - 1];
 	arg = &caller->stack_arg_regs[spi];
 	cur = vstate->frame[vstate->curframe];
-- 
2.43.7
