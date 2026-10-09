Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A613438BC
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791514177; cv=none; b=Zb9+6g1asdMcO2fDt1HvpKhEk/oFM4QSu8i/kDbhONXRPWhcIdtaplhedCnIQ2FTgG0FXQsUMKuKr/ueQ5shI6HDxM1UP15fdqVJ618Rh/4yUOUYHuNq+/fubxPIU8BujlllnwY2o/8YzoN/d6I0yeQ5YBDV6WRYaZzw0rudRnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791514177; c=relaxed/simple;
	bh=s/2LCHpJcFe7mdGsNOn8rWuhPrYlQbr5s95Lq/YjepI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSwOmEJyD33Ndl2IXUP02SmFrFmWOkgX02n/ttat7QLW91Xxid4SgKe86vheNVMXE9AHvMnlc4Fb5CFw54EO6MtFq34+TdcW1E1fnNarw0mmBXlcvVk1tF22UHTdWbr2FNOyRZbrws3H7ZWV8kp/8Gx0WyDFTMD3kLCVouNG48I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9qnTnzZ; arc=none smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9qnTnzZ"
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-826f42e479dso2860425a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 19:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791514175; x=1792118975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pau7ZpfOJ8U3wXvhmFaM13ITCxuhgbfJPt9hODooWg0=;
        b=f9qnTnzZBjL39qlGzBS6Dp4T18sfM+vj5dDyPLXxx8E3MSj4Gthqn2PQBIehpvYpF4
         7opxpFytsiE6a0sy5jaoSNJONWvUbGzbDo9gryQOqJ/dqz8poQ+FyoMfgNA9QYFpxzXs
         Y1tUtd5ZiW1w0rGNkWo2QzgjbfGJLb7PemLCWR+f+m5vm3RS8flfsT+E3eiRBuSfXojl
         TyrFN06uHMq0AGKirLebFm5LWecaLuBUFYgEGe/opTIWPb8J29tKKODnv/jS7MHHaZZQ
         IjKqzvoea10ktLrlEuOYPyIyNq8WLeo4OfFL7chKBnjV8Xb364BUDvL1yVDkiBJUlRjO
         ltgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791514175; x=1792118975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pau7ZpfOJ8U3wXvhmFaM13ITCxuhgbfJPt9hODooWg0=;
        b=X/QdpR+4wRsAZYBRZLPzp3Yo3ghkGPAYQsIb4aAPFSw7JsOufnmr8kGqlkStMrJErs
         JXrViffOyv0/jAINg508PUXx1dBuZsxkkn3UKISaJwMOyqC4stnJpOt/ieO1vMZpU+iX
         C55Uy1NRv9II/VC8hMI+unPzsJ7XOjVDgWvoiqEvpo2pKcVe81usVaJCZM1upincChzI
         nMape0dQF9NG/lhWAV2x67yW5D5D//AynuczAz353AvtxsVJluumpwgqTVqSQVv0R6ZB
         wf/EIxbH6ZQaX+uu7IZjTCoGywjUeOSu5IJHJoXfWbEs9zJ3HNHbcrlAk+F3AC8SMIOu
         FuYg==
X-Forwarded-Encrypted: i=1; AKwUvByfV51We3rxGzYgEQVlFeBXsx7zQ2msTswSOaF54Vf1VHWX74Dhh21eMuNqsU3facFzOB/D8N1OPiOb56E=@vger.kernel.org
X-Gm-Message-State: AFuF++k2b6/bkgkk4VHg/Q7zJXRMOt6K4vbS4/YX9WgferddMKTzMpJj
	fUqU7tjGUELKun5oZg5dEo//dkn6R8tOFu8bh5R33BJuG9t3/tKuwP/N
X-Gm-Gg: AYBFou1+tJ2xi6AU3AQaf2GaSoxv3zLIz0zclnOPE4hdZDKmu3fbsJzdI7NFr23Z+2A
	pxgCVQTCHfZiLxlLiccseDEvYAm5FScAe67Dh3pSUgdc4O5L0/9hG+HHHxGlgTbGfupUGEZtqxk
	Ndp/yuZ2pQom/eBgTDJK2sg19U4edGbqfImACunSjU+BiG3XyPZfZ74JPPEyj5ZqIb60wxw3YeX
	rjmanm3fvv7SEYhHu8RtlVoLPH0iXkDE/Ag7rR1+4LXI0KLmq5Z2b1j7D2ErQK3QJN0S5OX84M7
	o7my/xi+2UGpiT/f2GRdqFpzY5nieYyZJxDrE2AxEkb6su8cCkv50JXWkWW8eQQBxxztmzGt/Ri
	jaJHZT4FzDzcUgR3iYL8xN/EojTIgN3pvHJBYt2N4PzEIposuBpmLWBDpEJR535Xe0yA7GcJVeq
	VZIqET+l7IY0qWfraT0TOkkTOywHqzLCW7mjmpv2PGg4pBVl1D1zKz7oZ4jzI2D9EhsQstcH+2f
	yQJtCk4sCM653UDt+WMCi+sQoctDxkBoTWkjYLuW2qeS7sB0Pub42tj33NCmYONvDhEstmLi6jR
	/g==
X-Received: by 2002:a05:6830:6d11:b0:81d:54f9:d6a3 with SMTP id 46e09a7af769-83090c28e88mr344579a34.4.1791514174928;
        Thu, 08 Oct 2026 19:49:34 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8303a614308sm840792a34.27.2026.10.08.19.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 19:49:33 -0700 (PDT)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Puranjay Mohan <puranjay@kernel.org>,
	kkd@meta.com,
	kernel-team@meta.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v1 2/3] bpf, x86: Skip the PROBE_MEM address range check under SMAP
Date: Fri,  9 Oct 2026 04:49:22 +0200
Message-ID: <20261009024925.3169077-3-memxor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009024925.3169077-1-memxor@gmail.com>
References: <20261009024925.3169077-1-memxor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5134; h=from:subject; bh=s/2LCHpJcFe7mdGsNOn8rWuhPrYlQbr5s95Lq/YjepI=; b=owGbwMvMwCXmrmtenRyi38x4Wi2JIetEmEiCSvPbn+35qzZ8ZGjnXhZ1leXb57/nDnUX15guvDN9 VYdFRykLgxgXg6yYIkvJ/31MxicqfwfaLuOGmcPKBDKEgYtTACZieobhn4L2IUMLsTMXhV4fnDx9G9 8D685tSlN9wt4tvnpz0eXbJXYM/+x0A9f4zF3REWW4qn7q3eNMkssktky9Nz9Gqq+1lOV/JDMA
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=B34BD741DE8494B76E2F717880EF20021D46C59B
Content-Transfer-Encoding: 8bit

The x86 JIT guards every PROBE_MEM load with a range check that keeps user
addresses, the guard page above TASK_SIZE_MAX and the vsyscall page away
from the load, because a kernel-mode fault on those addresses would oops
under SMAP instead of reaching the load's exception table entry. The check
is nine instructions and 39 bytes (32 when the offset is zero) in front of
a load of a few bytes. For "r7 = *(u64 *)(r0 + 2200)" on a 5-level paging
kernel, with VSYSCALL_ADDR and TASK_SIZE_MAX + PAGE_SIZE - VSYSCALL_ADDR as
the two constants:

  movq    $-10485760, %r10
  movq    %rax, %r11
  addq    $2200, %r11
  subq    %r10, %r11
  movabsq $72057594048413696, %r10
  cmpq    %r10, %r11
  ja      load
  xorl    %edi, %edi
  jmp     done
load:
  movq    2200(%rax), %rdi
done:

The previous patch made do_user_addr_fault() resolve the exception table
entries of BPF programs for faults on user addresses when SMAP is enabled.
On such kernels, emit the bare load with its exception table entry, as the
arm64, riscv, s390 and loongarch JITs already do. All BPF programs run with
SMAP active once the CPU feature is enabled, and the feature cannot change
after boot, so checking it at JIT time is sufficient. Kernels without SMAP,
including those booted with nosmap, keep the range check.

Measured with veristat over every object of the BPF selftests and over 466
production objects from Meta's fleet, on an x86-64 guest with SMAP, with
and without this series on top of bpf-next:

                        programs  with PROBE_MEM  reduction per program
                                                  mean  median    max
  BPF selftests             3324              91  35.0%  37.5%  74.4%
  Meta production programs  1710             228   7.0%   1.8%  69.2%

No program grows. The socket and task iterators of the selftests lose about
half of their code, dump_tcp6 goes from 4386 to 2124 bytes, and the
smallest production programs lose 60% to 69%. Loads through trusted
pointers and the probe_read helpers do not use PROBE_MEM, which is why most
programs are unaffected.

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 arch/x86/net/bpf_jit_comp.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 083fcd6cf15b..793e7cd5a5c4 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -2133,6 +2133,7 @@ static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *
 		const s32 imm32 = insn->imm;
 		u32 dst_reg = insn->dst_reg;
 		u32 src_reg = insn->src_reg;
+		bool probe_mem, bounds_check;
 		bool accesses_stack_only;
 		u8 b2 = 0, b3 = 0;
 		u8 *start_of_ldx;
@@ -2709,6 +2710,15 @@ static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *
 		case BPF_LDX | BPF_PROBE_MEMSX | BPF_B:
 		case BPF_LDX | BPF_PROBE_MEMSX | BPF_H:
 		case BPF_LDX | BPF_PROBE_MEMSX | BPF_W:
+			probe_mem = BPF_MODE(insn->code) == BPF_PROBE_MEM ||
+				    BPF_MODE(insn->code) == BPF_PROBE_MEMSX;
+			/*
+			 * With SMAP enabled, a load from a user address faults and
+			 * do_user_addr_fault() resolves the exception table entry of the
+			 * program, as for an unmapped kernel address, so the address range
+			 * check is only needed without SMAP.
+			 */
+			bounds_check = probe_mem && !cpu_feature_enabled(X86_FEATURE_SMAP);
 			insn_off = insn->off;
 			if (src_reg == BPF_REG_PARAMS) {
 				if (insn_off == 8) {
@@ -2724,8 +2734,7 @@ static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *
 				 */
 			}
 
-			if (BPF_MODE(insn->code) == BPF_PROBE_MEM ||
-			    BPF_MODE(insn->code) == BPF_PROBE_MEMSX) {
+			if (bounds_check) {
 				/* Conservatively check that src_reg + insn->off is a kernel address:
 				 *   src_reg + insn->off > TASK_SIZE_MAX + PAGE_SIZE
 				 *   and
@@ -2772,6 +2781,8 @@ static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *
 				/* populate jmp_offset for JAE above to jump to start_of_ldx */
 				start_of_ldx = prog;
 				end_of_jmp[-1] = start_of_ldx - end_of_jmp;
+			} else if (probe_mem) {
+				start_of_ldx = prog;
 			} else if (!accesses_stack_only) {
 				err = emit_kasan_check(env, &prog, src_reg,
 						       insn_off,
@@ -2785,14 +2796,14 @@ static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *
 				emit_ldsx(&prog, BPF_SIZE(insn->code), dst_reg, src_reg, insn_off);
 			else
 				emit_ldx(&prog, BPF_SIZE(insn->code), dst_reg, src_reg, insn_off);
-			if (BPF_MODE(insn->code) == BPF_PROBE_MEM ||
-			    BPF_MODE(insn->code) == BPF_PROBE_MEMSX) {
+			if (probe_mem) {
 				struct exception_table_entry *ex;
 				u8 *_insn = image + proglen + (start_of_ldx - temp);
 				s64 delta;
 
 				/* populate jmp_offset for JMP above */
-				start_of_ldx[-1] = prog - start_of_ldx;
+				if (bounds_check)
+					start_of_ldx[-1] = prog - start_of_ldx;
 
 				if (!bpf_prog->aux->extable)
 					break;
-- 
2.53.0-Meta

