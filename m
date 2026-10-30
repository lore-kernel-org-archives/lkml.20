Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361242;
	b=y55mhAkyLu6DLsFt/YDraOTV8D3JizlDELjmygVfXiX3uLxZmPzp+ZLDf2Lr2YJQnJeV
	 /hSEfq1p2myHMyTvK+lSCSBAqRhaH+RsBus7r0O6u7FcEGCSboOYnyLbOonYFptaKc5rU
	 4hB6F7zlqRFzuTUalltagcKigkmVXMvXra7JiqNjChIbUwTI3I4MyrhPiGUD+U2wCduqH
	 gjRm4ANG9K+lL2P5sHi0O9up0ib0rpBXa79COH3qMEqjHTc7moTOAD62pGp/qnyJaZsfE
	 dhwI/C3Z6I/uX0xtxFUHCbmTa73ewdUhisLxDD9hxRpAyC6qRkh7D2BiYW7vxwlgNvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=rifggq3wvmtKN9HBpcJIa5sJWlnd49WFlLOgBeYNSRk=;
	b=HORc6/M4dej6UclS9irZHaVBuvyod2l8/pvBpynOk2Z4wsZs6OvImVpncLEUq5jTzXVD
	 F9log+qFIgFPZz2K3xpCZaYJMkah3QwKSAMbudRD13LlW2jI1VTC5yhmANMQ4y7lYn1De
	 YkZycPr5wjSRqKJMrEWArqZaBKwUEahUA71hJ7kiJi6eRRxxRypdvvpYu+jR2oOzeVbyy
	 CFrjyPEeW+ipGWYM1mwCYFGAmK6y0nZm+dQgciADWSgs4uZjjigEKqySa2lvLEZYbxPN5
	 KD+LzSGD/aCO0MGFP4WEtBDjxozwceQelQzj6CWSeY+1EpeeAYvz9Gcxo+ZKH+IHRkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxyEvOzq;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E33F606A338
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E33F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxyEvOzq
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-19305bcb72cso460453c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361240; x=1793966040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rifggq3wvmtKN9HBpcJIa5sJWlnd49WFlLOgBeYNSRk=;
        b=xxyEvOzqrbzcQJzLVkp035VbfRAh6iTF2D9eMoC/wyCk+0IIWkwpm/ITiz0QLnIO8N
         8O9s+KvlI7UG1pa5k49XfYk+MFxePnmHyNvOIyF0YRPFWOaVfPLf0mWy41/QCJRrtBlD
         KSwubb821xm13piN6Y0kp/IxqMw5jXvei/Zd2KzTYLxdBaWIqDxBtdorCY94fGec/Zry
         IWzXeKPRKcY5MaBzhvXA3NiTeD/CfDebU/S8TvA+jXmNN4+m5JLMkp3MIg7tEh89OfA/
         bhDfwfbl6d7nVrPYWQ4anN6xKq0u+2dZetbJbfU1bktQZlWZQ9d8D3ZQi7l2Y25uCvd9
         11hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361240; x=1793966040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rifggq3wvmtKN9HBpcJIa5sJWlnd49WFlLOgBeYNSRk=;
        b=dpGXOJqRmpPyCnU/MAyFbi5/QbM9fQ7FkBi89g1507yEWxJuBfx9QbtuQ0Sm6VXNgy
         XbuoswPXGW0tgVImTX7xjjUb/aKtfSLfxYA2cxRcR8bLEfGsdQU6Qo1iq9lR5IGdu3DS
         I/Hl6jtfqv5Mr5S0p9O1lH15o3humGuLB3Z82+U6V+fXTvcUh68TcUMTQv4V9HFKU9Jl
         0SeqXrLTiQhAc9tBYpqUx9GRYr/83/m+6wg8ZKkrXrAVJYuepQ3qlfBDRsqJ4DyPsq93
         AyqEvPq5D5kmNSbc8mHSIRcJz76/tcb5N8xBRe7GCkXwv23AtVWFXEKOcAv6X2W7Ty+n
         jhPg==
X-Forwarded-Encrypted: i=1; AKwUvByiPg09k2N6hlghd0SIy8la5a5+WQkgJo9pP+qMPgqiUCzEQ+SCdRFmmOijOOSBeKWx9DI3G4dQVDJFc7M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYiaqv2Mh0oLd4XUzwIGI6WC4rO0SFoqLdmVeQo02kWWYtH3k/
	Jxe6ODGYzLSkDnOYFgIJ4/Ag+sRBfIP+Q/i/HdNT2dAT69k4ObuEyGeiusnqXJJL
X-Gm-Gg: AYBFou2GMkrFcf+Pm8T6R9WEKBEKTgphsoPdnHOijOIby/Tp3cMc8HTwd4nQKaiSCuI
	2kYOsyWuf9DNg6KaZDnYHycSgyCVJy/EwyX0K/Yq+0L0rxQm27KQ1E1Ld7L/PlWjcUaowXVgKMg
	ZR2LROA5VA5QGNUuRVXwUhxUY9NSz0cRZbBqSsr2NZDk0+LGKRz4W0zpsRx7025htzcZq+qN6Qe
	Go+dLjKgOcoXJeIKfrFKJpEuYguQxLGAdoebvBDwLWaZZVZTY188hkqQbddZdFqYWMoLCzfRxrQ
	RmmtLoWiL2R7vWc6S29rJ7NRpYSRkStR7eCFyFoT4tamVlHVHLDK/JxA3+M+Q27cEFJn2YlXHf7
	Yk7FOMzMRblUOwaREdntFk7rA3w4DGU/7B/sXU2sAgjnjNlrqurDxFCH3xFK+3EzSeZ10MYD5V5
	PUNQG9O6PSv1Umyg1LT2wxp3YlfU5EplpB6aBCslml/6Bh9LmIZF8Nv0vsbyP++J5IbSZe2LOBK
	mPMAUW92ysauxQdRM2Spj/JNJSw+4pUkhMO4tE53zfiBsZ6JKZ5IbXUgVDzIQx6m339j4TGvXqQ
	kDY23v7mMUUlALouBLY4qFUw
X-Received: by 2002:a05:701b:2311:b0:189:d6bf:7ec7 with SMTP id a92af1059eb24-1ac5ae39462mr2790819c88.19.1793361240486;
        Fri, 30 Oct 2026 04:54:00 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:54:00 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:52:06 -0400
Subject: [PATCH bpf-next v2 21/22] selftests/bpf: Test jumps around patches
 of bpf_do_misc_fixups()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-bpf-verifier-patch-batch-v2-21-55cd43439f7c@gmail.com>
References: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
In-Reply-To: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

bpf_do_misc_fixups() queues its patches and applies them at once,
relocating every jump through a map from old to new indices.

No test checks the xlated code of jumps that target, skip or leave such
patches, a jump that the patches push out of its 16-bit range, or an
indirect jump to a patched instruction.

Check the xlated code for forward and backward jumps to a patched
instruction, jumps over patches, and a may_goto whose jump leaves its
own patch and crosses another one. Check that a jump over 8200 guarded
divisions fails to load, and that a gotox to a guarded modulo by zero
lands on the guard.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/verifier.c  |   2 +
 .../selftests/bpf/progs/verifier_patch_list.c      | 175 +++++++++++++++++++++
 2 files changed, 177 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/verifier.c b/tools/testing/selftests/bpf/prog_tests/verifier.c
index 04740ba37e918..40788891641b5 100644
--- a/tools/testing/selftests/bpf/prog_tests/verifier.c
+++ b/tools/testing/selftests/bpf/prog_tests/verifier.c
@@ -96,6 +96,7 @@
 #include "verifier_netfilter_retcode.skel.h"
 #include "verifier_bpf_fastcall.skel.h"
 #include "verifier_or_jmp32_k.skel.h"
+#include "verifier_patch_list.skel.h"
 #include "verifier_percpu_addr.skel.h"
 #include "verifier_precision.skel.h"
 #include "verifier_prevent_map_lookup.skel.h"
@@ -287,6 +288,7 @@ void test_verifier_netfilter_ctx(void)        { RUN(verifier_netfilter_ctx); }
 void test_verifier_netfilter_retcode(void)    { RUN(verifier_netfilter_retcode); }
 void test_verifier_bpf_fastcall(void)         { RUN(verifier_bpf_fastcall); }
 void test_verifier_or_jmp32_k(void)           { RUN(verifier_or_jmp32_k); }
+void test_verifier_patch_list(void)           { RUN(verifier_patch_list); }
 void test_verifier_percpu_addr(void)          { RUN(verifier_percpu_addr); }
 void test_verifier_precision(void)            { RUN(verifier_precision); }
 void test_verifier_prevent_map_lookup(void)   { RUN(verifier_prevent_map_lookup); }
diff --git a/tools/testing/selftests/bpf/progs/verifier_patch_list.c b/tools/testing/selftests/bpf/progs/verifier_patch_list.c
new file mode 100644
index 0000000000000..1370cdd5e5836
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/verifier_patch_list.c
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bpf.h>
+#include <bpf/bpf_helpers.h>
+#include "../../../include/linux/filter.h"
+#include "bpf_misc.h"
+
+/*
+ * bpf_do_misc_fixups() guards each division by a register against division
+ * by zero with a 4 insn patch. Jumps to a patched insn must land on the
+ * first insn of its patch, other jumps must follow the insns they target.
+ */
+
+SEC("raw_tp")
+__description("patch list: forward jumps to and over patched insns")
+__arch_x86_64
+__arch_arm64
+__success
+__xlated("0: call")
+__xlated("1: r1 = r0")
+__xlated("2: r0 = 7")
+__xlated("3: if r1 > 0x5 goto pc+1")
+__xlated("4: r0 = 9")
+__xlated("5: if r1 != 0x0 goto pc+2")
+__xlated("6: w0 ^= w0")
+__xlated("7: goto pc+1")
+__xlated("8: r0 /= r1")
+__xlated("9: if r0 > 0x3 goto pc+4")
+__xlated("10: if r1 != 0x0 goto pc+2")
+__xlated("11: w0 ^= w0")
+__xlated("12: goto pc+1")
+__xlated("13: r0 /= r1")
+__xlated("14: exit")
+__naked void patch_list_forward(void)
+{
+	asm volatile (
+	"call %[bpf_get_prandom_u32];"
+	"r1 = r0;"
+	"r0 = 7;"
+	"if r1 > 5 goto l0_%=;"
+	"r0 = 9;"
+"l0_%=:"
+	"r0 /= r1;"
+	"if r0 > 3 goto l1_%=;"
+	"r0 /= r1;"
+"l1_%=:"
+	"exit;"
+	:
+	: __imm(bpf_get_prandom_u32)
+	: __clobber_all);
+}
+
+SEC("raw_tp")
+__description("patch list: backward jump to a patched insn")
+__arch_x86_64
+__arch_arm64
+__success
+__xlated("0: call")
+__xlated("1: r1 = r0")
+__xlated("2: r2 = 0")
+__xlated("3: if r1 != 0x0 goto pc+2")
+__xlated("4: w0 ^= w0")
+__xlated("5: goto pc+1")
+__xlated("6: r0 /= r1")
+__xlated("7: r2 += 1")
+__xlated("8: if r2 < 0x3 goto pc-6")
+__xlated("9: exit")
+__naked void patch_list_backward(void)
+{
+	asm volatile (
+	"call %[bpf_get_prandom_u32];"
+	"r1 = r0;"
+	"r2 = 0;"
+"l0_%=:"
+	"r0 /= r1;"
+	"r2 += 1;"
+	"if r2 < 3 goto l0_%=;"
+	"exit;"
+	:
+	: __imm(bpf_get_prandom_u32)
+	: __clobber_all);
+}
+
+/* The jump of may_goto leaves its own patch and crosses another one. */
+SEC("raw_tp")
+__description("patch list: may_goto between patched insns")
+__arch_x86_64
+__success
+__xlated("0: *(u64 *)(r10 -16) = 65535")
+__xlated("1: *(u64 *)(r10 -8) = 0")
+__xlated("2: call")
+__xlated("3: r1 = r0")
+__xlated("4: if r1 != 0x0 goto pc+2")
+__xlated("5: w0 ^= w0")
+__xlated("6: goto pc+1")
+__xlated("7: r0 /= r1")
+__xlated("8: r12 = *(u64 *)(r10 -16)")
+__xlated("9: if r12 == 0x0 goto pc+9")
+__xlated("...")
+__xlated("15: if r1 != 0x0 goto pc+2")
+__xlated("16: w0 ^= w0")
+__xlated("17: goto pc+1")
+__xlated("18: r0 /= r1")
+__xlated("19: exit")
+__naked void patch_list_may_goto(void)
+{
+	asm volatile (
+	"call %[bpf_get_prandom_u32];"
+	"r1 = r0;"
+	"r0 /= r1;"
+	".8byte %[may_goto];"
+	"r0 /= r1;"
+	"exit;"
+	:
+	: __imm(bpf_get_prandom_u32),
+	  __imm_insn(may_goto, BPF_RAW_INSN(BPF_JMP | BPF_JCOND, 0, 0, 1 /* offset */, 0))
+	: __clobber_all);
+}
+
+/*
+ * The conditional jump skips 8200 divisions, which their patches turn into
+ * 32800 insns, too far for its 16-bit offset.
+ */
+SEC("raw_tp")
+__description("patch list: jump pushed out of range by patches")
+__failure __msg("cannot be patched due to 16-bit range")
+__naked void patch_list_jump_out_of_range(void)
+{
+	asm volatile ("					\
+	call %[bpf_get_prandom_u32];			\
+	r1 = r0;					\
+	if r0 == 0 goto 0f;				\
+	.rept 8200;					\
+	r0 /= r1;					\
+	.endr;						\
+0:	r0 = 0;						\
+	exit;						\
+"	:
+	: __imm(bpf_get_prandom_u32)
+	: __clobber_all);
+}
+
+#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_powerpc)
+/*
+ * An indirect jump to a patched insn must land on the first insn of its
+ * patch, here the check that skips the modulo by zero.
+ */
+SEC("socket")
+__description("patch list: indirect jump to a patched insn")
+__success __retval(7)
+__naked void patch_list_indirect(void)
+{
+	asm volatile ("					\
+	.pushsection .jumptables,\"\",@progbits;	\
+jt0_%=:							\
+	.quad l0_%= - socket;				\
+	.size jt0_%=, 8;				\
+	.global jt0_%=;					\
+	.popsection;					\
+	r1 = 0;						\
+	r6 = 7;						\
+	r0 = jt0_%= ll;					\
+	r0 = *(u64 *)(r0 + 0);				\
+	.8byte %[gotox_r0];				\
+l0_%=:							\
+	r6 %%= r1;					\
+	r0 = r6;					\
+	exit;						\
+"	:
+	: __imm_insn(gotox_r0, BPF_RAW_INSN(BPF_JMP | BPF_JA | BPF_X, BPF_REG_0, 0, 0, 0))
+	: __clobber_all);
+}
+#endif
+
+char _license[] SEC("license") = "GPL";

-- 
2.43.0

