Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FF24C6F1B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786412; cv=none; b=ZfUy9FgYXWRgf6eePX4bH9NsIT26TcGu+6Xzmbt+z86rnDeEEO700hyBmGeFErl4WeklfiX3fvi9pCQOg7R9Uz0qGyVOxT3r4Ilgwghc/EicLR3h3qbSx2vIEjFDen53plserMP/muyJZ4tZEu6PW+Nf1u3aeYkjxmOLYwgdoSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786412; c=relaxed/simple;
	bh=kUOr/kXMiEHJllHl5FfrdB2jjdM1d+MjF5uadLEvrz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W79AJ9EaawbcB2XO8KZA/tWqnk+U83BfIEPRI25dJGSMFxH8PFZ5NGwBbM1DIwk3vdZn5UqKdxAnhyfsf1tNS+1hyJxUzeyW0Tj1nbnVzFlS7SfcsQ9QQjIMjvwgc5jIt5VIOPXAXzMQ7pnzwvclddxffyJiNYIDQYGfxdDVC3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9P/Own6; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9P/Own6"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso3780133a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788786401; x=1789391201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6SxQC1ayWQCOsksETTmVt8rx2S1MTrrOl76Pd3OeUuw=;
        b=K9P/Own6aA1ed3yRY33F8o7yCZCXQGZbbI5VONJr581lkdOfGz/ecACdtWg0ntZhsk
         OG8HA/MU6V/QewoeFr0qSeho3AYtTypFZxrPX+h6bvodKg2VW2DVFIANZWpk7O6z/5Cf
         Do+IWVaYbWI0Zl/U5c+UAdSkSZ8zutS5umCFLCI1LdeJYOQcxVMGY4uoXp0bnDFqCgW8
         3JMXgnvycXpFukGHA340BYGX6LH1sBEwWWs8Wj763SvguLdtyx0jr+1QYj9l9cKNxvhR
         ggq2r+sNKqpmK9MAMcSRj0j4Rl88MW5Wcb7/PseOL3AA6zaGtaX0CacPU9sk9+8A7Nsv
         QZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786401; x=1789391201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6SxQC1ayWQCOsksETTmVt8rx2S1MTrrOl76Pd3OeUuw=;
        b=cL5MHR1U1pQPeoUV0HGFstAjbmMZSQMRfUOHAXCr66zZU5w7EKV3cAQtz6fuTMrBTc
         DPO8q4bM0QbzLQQO+STDULtW+1DtjCp6aPwcXxuS0kdgHHlcY5sEMFh8ybq7g3wExHSp
         TfSjW+hoxmw1AgdKbDiKqQ31nwrNYN1z1X3QkksLJk6YmPLfoR78vtmKnVtXciFOAByB
         PklZvhMRQSpwzFz87/DcHbOoht8MWBEx1B2HGpwbxTSXjBbbaWuGbkjFm12f8kk4tmnr
         LPFWs59OjxhOmO/7joMmok/0ojxZuO52J3wsA7/lAORi96FJXdNZhKs8zzl+dLfMZ1DB
         byeg==
X-Forwarded-Encrypted: i=1; AKwUvBxkwOUB7IlHaWdJ6/Le0K5YMX9C2VQaDYlQo72fScnKPCFLuNdYnpfeOmiDAxTaWnfqDBXXH3meqYVGNYk=@vger.kernel.org
X-Gm-Message-State: AFuF++mbn0wnoh2KN3w4UnDU2zHwfMPonAvkvVrRp+XO5AiHVBP/3J7F
	ogvRoBcv6V7tdQgc1l74zwxsyTrnfc8R+9oO3MRNb2JZdf9TVsWcADM=
X-Gm-Gg: AYBFou2ZiSleD0ar8dvpoa7YqmTUL2XQve86hPr6LovbbgZHRisy0n+cevQGGjKOnj1
	Q62T6ACMLQjpzBu2jS0NxplkxXnnfk0eW/a5/BJqindumiQhXzu7Zb9f+JkwSupk4UGdEuYkmri
	oHLitwoqxz1HAjP0Yrm+iaBWrjQnsAK8BXsyIx3EUCQL4onn04SuUtxdt1dXV8xij/6tSHNHzgw
	KWHDvpV+ieMQER3Ca6bAF8QUkwvgpLJxfpIve9t2EpF7p85D339jUwOSj6kNnZ3agrXvdm/ftZW
	h9YpC6ZO543ocjTcRPlftnWph8v5Rw5PdXmeKquzXHthV27j1+8VbhD2fAGNd4kaVGQZtQ0NTf6
	id+NoXRGoChnTYbUP1sVFw+k/tjmpqnhWNHAaaAFAeAT/ZrRUAPVJS1qTW3xeYc5HOh+5qhOIgV
	Alvu8d+Z3SV6F8NY8xxwFpicpMxMTY/8itzgTXsZP8AcQGHfVevARDHZhx4KgkrCjNVAUuo41I5
	EUXiFL08B9YlXAK
X-Received: by 2002:a17:90b:5790:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39b2624f0ffmr33674550a91.23.1788786400789;
        Mon, 07 Sep 2026 06:06:40 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b07b197a9sm26742398a91.0.2026.09.07.06.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:06:40 -0700 (PDT)
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
Subject: [PATCH bpf v3 1/2] bpf, arm64: set up the frame pointer for the exception callback
Date: Mon,  7 Sep 2026 22:06:23 +0900
Message-ID: <20260907130624.611942-2-donggeunyoo.kernel@gmail.com>
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
Acked-by: Xu Kuohai <xukuohai@huawei.com>
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

