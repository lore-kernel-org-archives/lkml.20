Received: from mail.virtlab.unibo.it (mail.virtlab.unibo.it [130.136.161.50])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C262A3D412B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.136.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165417; cv=none; b=ByeJO0H06MRqJaU+uEyTA3vGxtGQoj5V46/rR0QVZEw39d6YJIq0wFOztoGigCKa+iY0iqxoo4RSJRePthcL4Wv1SKGajWFrDZv+Y3PZWHh4AgU/3JK/DuZF+fbAG8ADMC9CRJSbXWxokmJj0sKdaibOqspgtVBa+lW/OFCS7/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165417; c=relaxed/simple;
	bh=bOsOongfDRWRHM0lKmtkOm275q3SNfQ1Kb8ZCW3Pp7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0263IXK1lL2PCPakjFOQf5tXSQ9RYByBdlDiZmc8Ju0WgHMxY84Ff/yKdTjEQoAOUsI85Fg3mRYMQ8vdZLeTzQtB9zgzz8JlteLXGiGPQc8zm7NlhiIIFuKaeqsUGgBRCKcxMzciS91Pr+86XMCFAKMo7xt6pJ59d/7jXWfNDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it; spf=pass smtp.mailfrom=cs.unibo.it; dkim=pass (1024-bit key) header.d=cs.unibo.it header.i=@cs.unibo.it header.b=F/1UswWI; arc=none smtp.client-ip=130.136.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cs.unibo.it header.i=@cs.unibo.it header.b="F/1UswWI"
Received: from eipi10.cs.unibo.it (unknown [94.32.99.206])
	by mail.virtlab.unibo.it (Postfix) with ESMTPA id EDA241C024E;
	Mon, 31 Aug 2026 10:28:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cs.unibo.it;
	s=virtlab; t=1788164888;
	bh=bOsOongfDRWRHM0lKmtkOm275q3SNfQ1Kb8ZCW3Pp7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F/1UswWIToJxt3NP/wmVQSlSv2EVBAWrWpPqr3AHPxInTOR8+qvSv+nq5ACXMZk9M
	 gNDxJxHSxCVrnjv1e8WAWo2brsdVSZHewZNS9aCaGrZgt1d5ycuPvzIxslfRIkw2yA
	 5dyuDMWmBo90QZA3oYNSSRMAIe5MiEVBpUZyXRtM=
From: Renzo Davoli <renzo@cs.unibo.it>
To: linux-kernel@vger.kernel.org
Cc: Renzo Davoli <renzo@cs.unibo.it>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io,
	"Dmitry V . Levin" <ldv@strace.io>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v7 1/2] ptrace: add PTRACE_SET_SYSCALL_INFO syscall skipping support
Date: Mon, 31 Aug 2026 10:27:52 +0200
Message-ID: <20260831082753.165731-2-renzo@cs.unibo.it>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831082753.165731-1-renzo@cs.unibo.it>
References: <20260831082753.165731-1-renzo@cs.unibo.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend PTRACE_SET_SYSCALL_INFO to support skipping a system call triggered
via seccomp.

When a tracer retrieves a ptrace_syscall_info structure with 'op' set to
PTRACE_SYSCALL_INFO_SECCOMP, it can now choose to skip the system call.
To do this, the tracer changes 'op' to PTRACE_SYSCALL_INFO_EXIT and
populates the exit union fields (rval and is_error) to define the return
value and error status for the tracee.

System call suppression via PTRACE_SYSCALL_INFO_ENTRY is currently not
implemented.  On some architectures (e.g. MIPS), when a system call is
skipped by setting the syscall number to -1 at the entry stop, the
architecture entry path unconditionally overwrites the return value
register with -ENOSYS, clobbering any custom return value set by the
tracer at the entry stop.

Signed-off-by: Renzo Davoli <renzo@cs.unibo.it>
Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Reviewed-by: Dmitry V. Levin <ldv@strace.io>
---
 kernel/ptrace.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/kernel/ptrace.c b/kernel/ptrace.c
index d041645d9d17..64fd1b455297 100644
--- a/kernel/ptrace.c
+++ b/kernel/ptrace.c
@@ -1099,7 +1099,7 @@ ptrace_set_syscall_info_seccomp(struct task_struct *child, struct pt_regs *regs,
 
 static int
 ptrace_set_syscall_info_exit(struct task_struct *child, struct pt_regs *regs,
-			     struct ptrace_syscall_info *info)
+			     struct ptrace_syscall_info *info, bool skip_syscall)
 {
 	long rval = info->exit.rval;
 
@@ -1111,6 +1111,9 @@ ptrace_set_syscall_info_exit(struct task_struct *child, struct pt_regs *regs,
 	if (rval != info->exit.rval)
 		return -ERANGE;
 
+	if (skip_syscall)
+		syscall_set_nr(child, regs, -1);
+
 	if (info->exit.is_error)
 		syscall_set_return_value(child, regs, rval, 0);
 	else
@@ -1125,6 +1128,8 @@ ptrace_set_syscall_info(struct task_struct *child, unsigned long user_size,
 {
 	struct pt_regs *regs = task_pt_regs(child);
 	struct ptrace_syscall_info info;
+	int op;
+	bool skip_syscall = false;
 
 	if (user_size < sizeof(info))
 		return -EINVAL;
@@ -1141,15 +1146,27 @@ ptrace_set_syscall_info(struct task_struct *child, unsigned long user_size,
 	if (info.flags || info.reserved)
 		return -EINVAL;
 
-	/* Changing the type of the system call stop is not supported yet. */
-	if (ptrace_get_syscall_info_op(child) != info.op)
-		return -EINVAL;
+	/*
+	 * Changing the type of the system call stop is not allowed, with the
+	 * following exception:
+	 * PTRACE_SYSCALL_INFO_SECCOMP can be changed to PTRACE_SYSCALL_INFO_EXIT
+	 * to skip the system call
+	 */
+
+	op = ptrace_get_syscall_info_op(child);
+	if (op != info.op) {
+		if (info.op == PTRACE_SYSCALL_INFO_EXIT &&
+				op == PTRACE_SYSCALL_INFO_SECCOMP)
+			skip_syscall = true;
+		else
+			return -EINVAL;
+	}
 
 	switch (info.op) {
 	case PTRACE_SYSCALL_INFO_ENTRY:
 		return ptrace_set_syscall_info_entry(child, regs, &info);
 	case PTRACE_SYSCALL_INFO_EXIT:
-		return ptrace_set_syscall_info_exit(child, regs, &info);
+		return ptrace_set_syscall_info_exit(child, regs, &info, skip_syscall);
 	case PTRACE_SYSCALL_INFO_SECCOMP:
 		return ptrace_set_syscall_info_seccomp(child, regs, &info);
 	default:
-- 
2.55.0

