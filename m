Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B887386571
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 05:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788759772; cv=none; b=mYQwGmTilVuxUqgprxivezE7RbJGa7CieFEKXVKE7GU1tLxIwtJPPINwbVH7Y4yxrMqiK4+/BjKKcKFMfA+UXJnUrbH7lmjzGg4QyjfpDhcDGnN6lkscQYVRNADkoAg2VQyI+pW4Joj3wPJsqJ3gtmJhnAwIOTo9YrLFa5PYxBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788759772; c=relaxed/simple;
	bh=L9Q7H6XzdldeK7oJVUx64Jc4Oyk5d2RSK8iopIFNoWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+TCcrZSNRBXh2LubVA9tI3ZPC6P7Q6/W2tTLbkzGOO9eKjLogsarXMJ+ciGhF4HcWli5hpPjGho7Xcp78iC39zeOzgaFTBHKkJVNdH1b1YT3qvdnoeMdFb9NOxLtBMJGn1S0IPGHg1+ccWqAaRk77UXhRKL9HkCwCeNviFjEZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pGKiPRlr; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGKiPRlr"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d58efc7356so39374035ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 22:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788759771; x=1789364571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVyebJSrPANro9+ZzIJ5GUMECycDoWkIReTgM/W+/mE=;
        b=pGKiPRlrCglX5ZlCCX+8muWb1y+DK89kIAfAtF6w/pV8fWmI+kwlRAzL1fH7QObWJ+
         zuLN3biM2/1oEGi17JfIKa+5IKe3/2CJlyIgsTSkNhHAodz8ARzpIXhMHKnFlQn8RaaZ
         Iu/Ylrp6C9TQwQOJ/J0YmEcVdwLrPVPm3Z83iak61AQuNeAB2nFmprPGE6QQjPPvkCjp
         Fflfra9EgDytmgKwSx71OOm4aPxjGx8DMm6kX1no30TuQ3Y3+nHoVHenqGLgFYpagw2S
         kdPClZGXzs+/fU4MhNGwSM4gATfUmKGdCxNJXvjOIS+PVdyeORtxG5yabPAmEvnNTMP7
         jGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759771; x=1789364571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVyebJSrPANro9+ZzIJ5GUMECycDoWkIReTgM/W+/mE=;
        b=L9poMP1gwt/vK8cUW+fBfMhjXyx1HrvNlb722YoAhPBCepj+V4oAWWbj79IilvJEpy
         awGcT8O560cJc5H+Dvyi0z7MhK4l64hejmG5v/e0VG/VHhLOkeMcRP8B7UxKlT3xoWDP
         1BmH+3vkNZRKgjJFeDSlLtyDkwJDBpSSB0V0roTg9XwV88vsFd7XrYYxDM1YXyhfI7Pk
         Ct3mSd8XgVY+ut+eYSMhHLIcSTtavBebSyAM03DZjmtEP7U/DU5jijia+3QB0Iy9wp5k
         RcE3d8PSfJVV5BD42eFYQhd16SG+uiap+4HVgxuSoStl5QC+ulI8l8vHHllNq1f0QGkt
         G8tg==
X-Forwarded-Encrypted: i=1; AKwUvBw/koQNUnJHDOpbC+WePGTPSZYdaxgk+FFsuGLkLMf3tdVWp8mpMhDm2HzJIR7+qxBEbiJjW2OLXfqSeZE=@vger.kernel.org
X-Gm-Message-State: AFuF++n2NaI2hQNwxzPUwATn/N+w0WIigG1mjjBLtwvuN9QWB187umSA
	V60q8jXiGbpl9zobfU+QfvVfE3mbrozzPPTPJmWZiVcnwEBMq1EkmvnN9LbCA87PDw==
X-Gm-Gg: AYBFou0bNNrk80Wlnx5mm9jLGXTxN86SVpTj3igWFBwddMn378n9DWUf3ngk3GDdy5k
	GNH42a+5Advc3AT5637oTy9yROZR0ZgyzQgeVT2RVV8gYmr5MdznXP3Hdd3dr5VxJyAxA7eCMPJ
	ydPJXd2Ly2Sgf0tP1j4om5V2eRGnYrBR08ya7kmxvSHyPnxIU+Vlw53bWrXVor+AJZhVYK0tecB
	QM9Pb8RsGRNK864DOuWZscFYJhtt0YLIZQ8pe791C88EhwNIvJujYy0fY6PgGh3/0qi2nAB8rem
	zZwTB5AU+fvZBKMfHU1wI5bsdZfI8CZThj9jPVem5yI9nn4ALhBVT2MdGPeBQQrgrpSUOTEgE4L
	AgatdTDqL8vUzHgWsdT/DTH7yPvQmicwNBUawZBWVltbSam778drDaZqFCQExGsrPqfWhX7zxz4
	khAW5+7VRn5g31+bmB55HxCykmELT6u6j0IKx1QAKC+1xS8teurfGWThwXBoLqyaiFoAHUoy+WU
	sma4dw1baYrDVgX
X-Received: by 2002:a17:902:d587:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2db1265add0mr308117045ad.7.1788759770837;
        Sun, 06 Sep 2026 22:42:50 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1483dbddsm39107695ad.12.2026.09.06.22.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:42:50 -0700 (PDT)
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
Subject: [PATCH bpf v2 1/2] bpf, arm64: set up the frame pointer for the exception callback
Date: Mon,  7 Sep 2026 14:42:34 +0900
Message-ID: <20260907054235.473103-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907054235.473103-1-donggeunyoo.kernel@gmail.com>
References: <20260907054235.473103-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A program acting as exception boundary saves all callee-saved registers,
so build_prologue() takes the exception_cb path and never calls
push_callee_regs(). That is the only place find_used_callee_regs() runs,
and with it the only place ctx->fp_used is set, so the callback prologue
does not emit the

  mov x25, sp

that points BPF_REG_FP at the frame the callback runs on. x25 keeps
whatever it held when bpf_throw() was called. If the throw came from a
subprogram that uses its own BPF stack, that is the subprogram's frame
pointer, and since the subprogram never returns it never restores x25
either.

Stack accesses through BPF_REG_FP are rewritten to be stack pointer
relative, so those still land in the callback's own frame. Materializing
the register does not: a callback that passes the address of a local
variable to a helper hands over an address in the dead subprogram's
frame. That address is below the callback's stack pointer by then, and
the helper's own call chain covers it, so the helper can write over its
own return address. 0x1234 below is the value the helper was asked to
store:

  pc : 0x1234
  lr : 0x1234
  Call trace:
   0x1234 (P)
   bpf_test_run+0x188/0x3e0
   bpf_prog_test_run_skb+0x47c/0x998
   __sys_bpf+0xbdc/0xdd8
  Kernel panic - not syncing: Oops: Fatal exception in interrupt

Set ctx->fp_used on the exception callback path so that the existing code
further down sets x25 from the stack pointer. The epilogue restores it
from the main program's save area along with the other callee-saved
registers, as it already does. x86 sets the frame pointer for the
callback from the argument it is passed, and powerpc computes it from
the stack pointer.

Fixes: 5d4fa9ec5643 ("bpf, arm64: Avoid blindly saving/restoring all callee-saved registers")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 arch/arm64/net/bpf_jit_comp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index c18e005a41db..c5f55d6161fe 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -600,6 +600,8 @@ static int build_prologue(struct jit_ctx *ctx, bool ebpf_from_cbpf)
 		 * 12 registers are on the stack
 		 */
 		emit(A64_SUB_I(1, A64_SP, A64_FP, 96), ctx);
+		/* The callback may use its own BPF stack, set up fp for it. */
+		ctx->fp_used = true;
 	}
 
 	/* Stack must be multiples of 16B */
-- 
2.53.0

