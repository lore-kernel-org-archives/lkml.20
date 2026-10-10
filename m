Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9D0492E4D
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791639742; cv=none; b=b3T3iRWppzB2QN+uIkaimXRndG+djCryRlQ05Wg1dEotY+pHtIrzahH5rnLG6vR+DPwH8XvvWmC0Is0dEtzNb7e7OxZq3Y0Cx1eHeBOW/k9LILx+d6wzgOV1pq04C9xJN3HWWwRD7PeLs64F3fFCdnOpFj3aFwDpzqYipOkQWoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791639742; c=relaxed/simple;
	bh=U/nuTPW1GBByzTKEr0lQQY7u1zzIolnPL33tIXMx1cU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QwahAbR1+F4On26NMkRMkhFQkLXA6Wv3c22RljzX9uxuly2o4iXO9xS/fGLiqWWuT5ses9PTrFiN524TXS1Nmpg2YJgxC3CTyRv0yiS0LHHrjeJylrzHlq6pDjiyfP8rGwbVt6N/mIyPAEDVknxY6LVXM317octTfgg4Q1D2WCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=shPQVteU; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="shPQVteU"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6afb0d2a586so1070903a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791639739; x=1792244539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wqjj2AitxeO3NLrW4eTFLJLT15MYNUPf8jp++HuoGBI=;
        b=shPQVteUHnLgU3JPty5e1vWZpPxkneHim/8NhdvqMRETl4IytjdkAiFDnTdZeFa+ob
         g0EU6re6xblo3CfG+Tkycdc6CnQ0sRul1NXjl4rHuuxbF/wnkUkr1kgzK1p61oeJE2pb
         AveDQSo+8Dk/GpbHPd4uMfuVi+7DWISNUxp6Sy7m7hbgIdBgQJ/42m9mEr4QY5fQun6F
         BrxMk7T7aQQHkelm8u1vrj1suSVlwyzcCOe1GIfFsx4/DXONNV6CJVEn6Rf18wuD8bf6
         RD7aSc4MHuusKMd0e81/ajQzbqx7M4i6PL3slLDP1nzelyWJLHwo3Y1GcIC9GiVvE3vg
         kbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791639739; x=1792244539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wqjj2AitxeO3NLrW4eTFLJLT15MYNUPf8jp++HuoGBI=;
        b=x2MgyhRvb99MAKiaACRW+j7GfK1d+EmO4EZ1m7ootfCeWnnpyfGbLFLcOo9q3sMeoo
         4F7h2S3pfdVGrC+Av5s5NDbJZsq1pchGdy4JYhnP56rjHHcKS01jJ3D+OSRq2mETO+wg
         UoTq0GS0zvCDacLf+RMjK/GEWGGyeo5IWRCufgHc3RVWPstAtpP7mckHUVfDt+ZVfNrc
         hHfDRLFeteq5CB1sU4GceAp1TU0KcsuYszpGqSQR2RLz9LOWAWAld8JqqS1iMm4Wrhn/
         3+MiPtV3/As/pbkVv4FlTJqkZi2JzkCAugbnfL8genWaeaQRDnLkWEeskIgqSwp/J2wD
         PX7A==
X-Forwarded-Encrypted: i=1; AKwUvByVQTM9VR2gVM2i88ZZvomlh+cTkFCwMHwpEgq59LVxIDTGtXndnyL70pLL0S8XV6qAJ2G2soTY4aDU5rI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrrhXC789DYxY90NIx0OLJEz1Pio7udZe+Khs3vfjXIHeoRQeR
	1ziFuoJDAZNb1dd639KRib+mQ0IeHOoLGDmT/vdN12A0TbiD8CSu3yKI
X-Gm-Gg: AYBFou3sUk0xZnm428e6Rtn4rSa8TkfJbvpGI783351fRb6UnLXEgEVsIlfwo+jT0nX
	ipLc/vbFS0a6Y9zpFM4D0+GuxfV+97T3yh9jaPc7lRx6V6ebdPyqkoHgOv9OM/XZCqiGO7MG2m8
	DKyLSzpNAsj50HmtQJQTnMqoI/dEXWzc9suIQY1dl5lt8IwdlzmY9obBVTLyhNR71T092A3v2si
	1h+15C8nbBN8f5DHIRPK6GwJrXBYmO4b6z/GEvRQsf7TgB0g/Xd3VZtJogkgIGRDPlATUeA1Ana
	gyQgXiw4WlBHF/EEhA6ciWrSjEnGL5HnDIGbKjKhZm126r5A9Bx6IfHPdKpsf/M/9KzKiWFua94
	nHWQuZV0oT45nkLET7oHnJNp+hPMRDoWYxeAi6oRqCawJoQ1Ujz4b7sgsue+5YUsM9VLPqX3Q84
	2/UT6tqpmfDmIRfTtH1tJiR7KuQ8kC0mx3WQV0wTcgSy/OP+2YjggDQhSGRW0gJtDtSFv12dioC
	7lBFn/RLQ+kDqq6HTCwSUwnpTUlxPTWppnEJ7O0p+hbEiScNGc=
X-Received: by 2002:a05:6402:5018:b0:6aa:915a:f51e with SMTP id 4fb4d7f45d1cf-6b17c28ef6cmr4582411a12.17.1791639739001;
        Sat, 10 Oct 2026 06:42:19 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd395dsm2704487a12.17.2026.10.10.06.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:42:18 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v3] selftests/seccomp: add Alpha support to seccomp_bpf
Date: Sat, 10 Oct 2026 15:42:00 +0200
Message-ID: <20261010134214.974565-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the seccomp BPF selftests on Alpha with a fallback seccomp syscall
number and architecture-specific syscall register accessors.

Use the NT_PRSTATUS register layout rather than struct pt_regs. The
register set contains r0-r30 followed by pc and unique. Read and update
the syscall number in r1, and set both r0 and the r19/a3 error flag when
synthesizing syscall results.

At syscall entry, r19 still contains the fourth syscall argument, so
callers setting a synthetic return value must also set the syscall
number to -1 to skip execution.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
Changes in v3:
- Drop the /proc/self/syscall availability check and its commit-message
  paragraph. Alpha selects HAVE_ARCH_TRACEHOOK.
- Document that setting r19/a3 at syscall entry requires callers to also
  set the syscall number to -1.
- Add Matt Turner's Reviewed-by after addressing his review comments.

Changes in v2:
- Use the NT_PRSTATUS layout for PTRACE_GETREGSET/PTRACE_SETREGSET.
- Set the Alpha return value and error flag together.
- Check for /proc/self/syscall at runtime (removed in v3).

Validation on AlphaServer ES40, GCC 15.2.1, running
7.3.0-rc1-es40-tsunami-v5a+:
- Standard v3 and the original baseline binary both report 98 pass,
  1 fail, 12 skip. The common failure is the 30-second timeout in
  user_notification_wait_killable_after_reply.
- A separate diagnostic build extending only that test's timeout to
  180 seconds completes it in 34.938 seconds. The full diagnostic run
  reports 99 pass, 0 fail, 12 skip. No timeout change is in this patch.

 tools/testing/selftests/seccomp/seccomp_bpf.c | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 0622bc2..79e8eb3 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -136,6 +136,8 @@ struct seccomp_data {
 #  define __NR_seccomp 354
 # elif defined(__x86_64__)
 #  define __NR_seccomp 317
+# elif defined(__alpha__)
+#  define __NR_seccomp 514
 # elif defined(__arm__)
 #  define __NR_seccomp 383
 # elif defined(__aarch64__)
@@ -1754,6 +1756,30 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 # define ARCH_REGS		struct user_regs_struct
 # define SYSCALL_NUM(_regs)	(_regs).orig_eax
 # define SYSCALL_RET(_regs)	(_regs).eax
+#elif defined(__alpha__)
+/* NT_PRSTATUS contains r0-r30, pc and unique, not struct pt_regs. */
+struct alpha_regs {
+	unsigned long regs[33];
+};
+
+# define ARCH_REGS		struct alpha_regs
+/* The kernel keeps the mutable syscall number in r1. */
+# define SYSCALL_NUM(_regs)	((_regs).regs[1])
+# define SYSCALL_RET(_regs)	((_regs).regs[0])
+/*
+ * Alpha returns positive errno in r0 with the r19/a3 error flag set.
+ * At a syscall-entry stop, r19 is still the fourth syscall argument.
+ * Callers must also set the syscall number to -1 to skip the syscall
+ * before replacing r19 with the error flag.
+ */
+# define SYSCALL_RET_SET(_regs, _val)				\
+	do {							\
+		struct alpha_regs *__regs = &(_regs);		\
+		long __ret = (_val);				\
+								\
+		__regs->regs[0] = __ret < 0 ? -__ret : __ret;	\
+		__regs->regs[19] = __ret < 0;			\
+	} while (0)
 #elif defined(__arm__)
 # define ARCH_REGS		struct pt_regs
 # define SYSCALL_NUM(_regs)	(_regs).ARM_r7
-- 
2.43.0

