Received: from mail-oa2-f35.google.com (mail-oa2-f35.google.com [74.125.231.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8A93612DB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790703232; cv=none; b=ss7DwHaGmradl2EeQWBoFamvBDSBUFmrzBwS59B0OFiivJia6Ho5OW6yYZoHuFTEiVPc6vcy3ShQKMjd0gUN6tS3WCEzH3q732KUJPpCtNdPxt+Iplnwqnd21n7Y864qgK7+1goKkConQ0yLcsOBh5wDzAyzUwlU8Ooz5ZnV0nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790703232; c=relaxed/simple;
	bh=t03ngpqGywAlmDFkApsdNKV6w83EXEXzp3BGL5y/2bQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KJ2ONR8N+b2WmPF0UG+VsQCH0aPDjcbO0KsJC6FW/aZw/Q98ZIU6C4PHjv3zcIOkj6qmP+QmsNh9UMZo/pY5p7kiteuJUz3U2yNjqRLCW0vXD8H+PRqvcezEqxqAaVxpZFnURBwMtEJfy3QC25dIQAnQI1RDkawmHS3tOJd1Lrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNkDWh7G; arc=none smtp.client-ip=74.125.231.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNkDWh7G"
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-493cf6d8e60so1821267fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790703229; x=1791308029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f29RzKaUTyMrVXkMN4olauWl4LTSFw6FJhXYbC5js08=;
        b=VNkDWh7GOGNuwqosMXxkrMlXFX4nUgCU7Agcb4PA1wz9XYm0OlP2ykzHMtRcW1E+WD
         IJjP+p+5D8V4q4I+dCVlT98EVLGHnVykSIZomJhBe87gA2/0oLyEmnWgRt5XSkhl41zU
         D848K1H63hFqgA8h+snWsFCjRp+T5Z+ttrRFhzwBk8kkDWB1nGP/vo6zwQh6A7zS6w/N
         KeFFTQsXOnLYshoA+b0yeoczpbEDCt6pO4W6uusSRIz/PVHO07k3sr5Ng2YBHMzbnvif
         MyTKcrUpqZMO/7WIB8NKV1bD6tl4RaJv4Mkkbau3w0ZQphPlnmqAr2w8g0E/Iz+oklrY
         7jJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790703229; x=1791308029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f29RzKaUTyMrVXkMN4olauWl4LTSFw6FJhXYbC5js08=;
        b=Ks+c8NHUfxMy6NU8WbUdAVYepkdQaxxX/1nZy9EIgRb+8yEQMtq8wI1Lmj0OneZ3BD
         UMiB0wUAp7EDX6oY0m+nA8cs08X0pfvCZio8Gd/nKDdSImHmTvpFUbvvI81W6fbu1ziQ
         ff+dO/+ewqVrdwSjWC9KE7n8IcTnxyrM4yPHO66uzl2qCj6WWcnptuyXxgoRFl113ypu
         8B+PdrexHoGXOZfvQV980IiWyVQThe48yLP6ftNbizbMtggwbp7INv+740sJW1KJexLG
         KSmDirn3yOt5VvLvjJ1odQ1VdTtJDFXlvgj5o6Dl7XDZCrlCFlgRP7RWPNVMFNiUKvMc
         8bUA==
X-Forwarded-Encrypted: i=1; AKwUvBw+l9V+6mB2ug8Pjm58Hg6QU/ITUW3Ul5noFwoQmvYCOpYfq5NQdPfiCuYFEr+b+2t8q9TLJKM2Z0FiJJQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k5NzKwYVpo0owEdvmtEIzYQu8it8oMOB8vJkfvoDNyGPMgdRNk
	YWmRi29/zSpIHOA5kQH4+RrGGNirX3NeW9WbbgfZqKElDA4a92sY+QjY
X-Gm-Gg: AYBFou1dydjxpu8wtRVElM6HH+fFIpCTOZe+NGOg/d8oa0pwvBYcG6M84mhBfBnlqdg
	F2+noAP7/nnPcEFir1qy7x+K2q9WQs42ZKbIifc5TOABta0zO57AjAyaq/uXKssI/sFtWFjBHfD
	ylEzFsXvtSc5n8Q7wQ1g0/JezPu5MUtZ10Z+r+8c4rwjC1syCR108WNkUTsNYksFZbBGXiPDrJd
	H3ppkW1lNmHhon02vdQ3esW9rDQjVTAoo+ze2E1ZxZ7MIcXbarrqR1idKtwvd9+Jy7p8kp6mSS6
	0US0puNahX+sq8PUPvkzUHEeT7ZwaACyFaM4qPARonNAE0ZbtPOxi8HVLd4Kkl1XkN1G2sUwW+N
	iLIEaNv4gNMbjmBB5wUtfLUqs09m7dc4sQl6XYSDpCQvYfYeMYekIZJTNoNLIbhvYbg/gR9pbKQ
	0zK2bDZuasl4P8OOpxEE9NpraNUmgDmsB00jp+S6NUy9wQZon9rOv3ev61Nri0r+jX3UVd+27x8
	QjJ+zEKyE0JStc7w1b+w8FiSzagCc9baKVGlSoi
X-Received: by 2002:a05:6870:2415:b0:475:e0a7:9f28 with SMTP id 586e51a60fabf-493565e06b2mr11333921fac.22.1790703229425;
        Tue, 29 Sep 2026 10:33:49 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49abdd55a0bsm1442037fac.14.2026.09.29.10.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:33:47 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: Andy Lutomirski <luto@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH] x86/entry: Fail invalid syscall numbers other than -1 with -ENOSYS again
Date: Tue, 29 Sep 2026 12:33:45 -0500
Message-ID: <20260929173345.257226-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 1b1f3b3e1b39 ("x86/entry: Get rid of the sys_ni_syscall()
indirection"), an invalid syscall number leaves regs->ax alone, relying
on the entry code having set it to -ENOSYS. But a tracer stopped at
syscall entry can change regs->ax. The value it wrote is now returned
for any out-of-range number, while a number that hits a hole in the
syscall table still ends up in sys_ni_syscall() and returns -ENOSYS.

For example, with the tracer setting regs->ax to -9999 at entry, 64-bit
syscall 400 (a hole) returns -ENOSYS, but 473 (past the end) and -2
return -9999. The int $0x80 path behaves the same way. v7.2 returns
-ENOSYS for all of them.

This undoes commit b337b4965e3a ("x86/entry: Treat out of range and gap
system calls the same"), which made -1 the only invalid number that
keeps the return value. The syscall_numbering_64 selftest checks this
under ptrace and has failed since v7.3-rc1.

Restore the -1 check in the 64-bit and 32-bit paths, setting -ENOSYS
directly rather than calling sys_ni_syscall(). -1 still keeps the
return value, so a tracer or a tracepoint program that skips the
syscall by setting -1 is not affected.

Fixes: 1b1f3b3e1b39 ("x86/entry: Get rid of the sys_ni_syscall() indirection")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested on v7.3-rc5 x86_64 under virtme-ng (KASAN, lockdep), with
    CONFIG_X86_X32_ABI both off and on:
    
    - selftests/x86/syscall_numbering_64: 37800 failures before, all in the
      ptrace passes that change regs->ax. All checks pass after, including
      the x32 checks with CONFIG_X86_X32_ABI=y.
    - A small tracer that sets regs->ax to -9999 at the syscall-entry stop:
      before, 473, 1000 and -2 returned -9999 while the hole 400 returned
      -ENOSYS. After, all of them return -ENOSYS and only -1 returns -9999,
      as on v7.2. The same holds for int $0x80 (hole 388).
    - ptrace_syscall, syscall_nt, single_step_syscall, syscall_arg_fault and
      check_initial_reg_state (32- and 64-bit), sysret_rip_64 and seccomp_bpf
      (111/111) pass before and after. No new kernel warnings.
    
    The native 32-bit kernel was only build-tested (i386_defconfig). gcc W=1,
    clang W=1 and sparse are clean.

 arch/x86/entry/syscall_32.c |  6 ++++++
 arch/x86/entry/syscall_64.c | 12 +++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/x86/entry/syscall_32.c b/arch/x86/entry/syscall_32.c
index 91123a90710c..ea38537b22c2 100644
--- a/arch/x86/entry/syscall_32.c
+++ b/arch/x86/entry/syscall_32.c
@@ -77,6 +77,12 @@ static __always_inline void do_syscall_32_irqs_on(struct pt_regs *regs, unsigned
 	if (likely(nr < IA32_NR_syscalls)) {
 		nr = array_index_nospec(nr, IA32_NR_syscalls);
 		regs->ax = ia32_sys_call(regs, (unsigned int)nr);
+	} else if ((long)nr != -1) {
+		/*
+		 * ptrace or seccomp may have changed the return value. Only
+		 * -1 keeps it; any other invalid number fails with -ENOSYS.
+		 */
+		regs->ax = -ENOSYS;
 	}
 }
 
diff --git a/arch/x86/entry/syscall_64.c b/arch/x86/entry/syscall_64.c
index 966d3d1b7586..ac5ffa0a502a 100644
--- a/arch/x86/entry/syscall_64.c
+++ b/arch/x86/entry/syscall_64.c
@@ -64,7 +64,7 @@ static __always_inline bool do_syscall_x64(struct pt_regs *regs, unsigned long n
 	return false;
 }
 
-static __always_inline void do_syscall_x32(struct pt_regs *regs, unsigned long nr)
+static __always_inline bool do_syscall_x32(struct pt_regs *regs, unsigned long nr)
 {
 	/* Adjust the starting offset of the table */
 	nr -= __X32_SYSCALL_BIT;
@@ -72,7 +72,9 @@ static __always_inline void do_syscall_x32(struct pt_regs *regs, unsigned long n
 	if (IS_ENABLED(CONFIG_X86_X32_ABI) && likely(nr < X32_NR_syscalls)) {
 		nr = array_index_nospec(nr, X32_NR_syscalls);
 		regs->ax = x32_sys_call(regs, (unsigned int)nr);
+		return true;
 	}
+	return false;
 }
 
 /* Returns true to return using SYSRET, or false to use IRET */
@@ -81,8 +83,12 @@ __visible noinstr bool do_syscall_64(struct pt_regs *regs, long nr)
 	if (likely(syscall_enter_from_user_mode_randomize_stack(regs, &nr))) {
 		instrumentation_begin();
 
-		if (!do_syscall_x64(regs, nr))
-			do_syscall_x32(regs, nr);
+		/*
+		 * ptrace or seccomp may have changed the return value. Only
+		 * -1 keeps it; any other invalid number fails with -ENOSYS.
+		 */
+		if (!do_syscall_x64(regs, nr) && !do_syscall_x32(regs, nr) && nr != -1)
+			regs->ax = -ENOSYS;
 
 		instrumentation_end();
 	}

base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.55.0

