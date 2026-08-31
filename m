Received: from mail.virtlab.unibo.it (mail.virtlab.unibo.it [130.136.161.50])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1D9282F16
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.136.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788175825; cv=none; b=USOley0tXXIM+4rXnSveavXDLMf60/wbSE+f4VIdM5aF0vv43IFkFJMLY8QaiQNSINdRv0gSa2VnC9Ju6Hw5krqfuC7Ghy/JeBHJDcXGSjEUvn+Q6pmwaM/RR/v0Q8tDIQpj3mvQ0oLjFFPX13pAJqUPmXAP7dL6VLVtA8tl9/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788175825; c=relaxed/simple;
	bh=4ywa7uDPMt5wvv6eCmU4CDmJLUpEMNAeJ75LRTodfWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=enFSRfgLS3wbO9A1HXprjizP7P6IQrUqgeAuBzmwcGJORFIHqGF065nYux2qP9A49s7MNTalDxgxdocOoCSCIJfqXRTysWTcJhTGzK1PIWOg+bgq5xKSY6msuOmSFkPXSpgtjVZX+Lpm3P4i0udQo6wLyrZBT4gKP1Eaa2445Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it; spf=pass smtp.mailfrom=cs.unibo.it; dkim=pass (1024-bit key) header.d=cs.unibo.it header.i=@cs.unibo.it header.b=nEzlccRo; arc=none smtp.client-ip=130.136.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cs.unibo.it header.i=@cs.unibo.it header.b="nEzlccRo"
Received: from eipi10.cs.unibo.it (unknown [94.32.99.206])
	by mail.virtlab.unibo.it (Postfix) with ESMTPA id B47C01C024E;
	Mon, 31 Aug 2026 13:30:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cs.unibo.it;
	s=virtlab; t=1788175821;
	bh=4ywa7uDPMt5wvv6eCmU4CDmJLUpEMNAeJ75LRTodfWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nEzlccRoHDGmkZ2JY7MAjUDbXxUEJEn6oiDIf4eZqXciik/8yWfr4NcKyEEiK7YCr
	 vYyDuqOvsX6PVY8+9T3Qm2G5s6BdA4k6VFv79Ercm/NPZZ55d83l/wJTMZD0gzPLXZ
	 QLOTh7yaMMQyVRUfNWyjAlNSIrbbLdGsX6AV2E1k=
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
Subject: [PATCH v3 2/3] ptrace: add PTRACE_SYSCALL_INFO_FLAG_SET_IP
Date: Mon, 31 Aug 2026 13:30:03 +0200
Message-ID: <20260831113004.259991-3-renzo@cs.unibo.it>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831113004.259991-1-renzo@cs.unibo.it>
References: <20260831113004.259991-1-renzo@cs.unibo.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag adds support for modifying the tracee's instruction pointer.

To do this, the tracer stores the new instruction pointer value in the
instruction_pointer field of the ptrace_syscall_info structure and
sets the PTRACE_SYSCALL_INFO_FLAG_SET_IP flag in the flags field.

This flag is introduced to avoid breaking existing code that uses
PTRACE_SET_SYSCALL_INFO and currently ignores the
instruction_pointer field.

The proposal does not add any new ptrace capability. It merely provides a
portable interface for a capability that already exists and is already relied
upon by existing applications.

WHY

PTRACE_SYSCALL_INFO_FLAG_SET_IP completes the set of actions that a tracer can
request when intercepting a system call.

A tracer can currently instruct a tracee to:

* execute the original system call;
* execute a different system call (or the same system call with modified arguments);
* skip the system call and provide the desired return value and/or errno.

The proposed PTRACE_SYSCALL_INFO_FLAG_SET_IP adds a fourth possibility:
* execute an arbitrary sequence of two or more system calls in place of the original one.

The mechanism is straightforward. During a PTRACE_SYSCALL_INFO_EXIT stop, the
tracer rewinds the instruction pointer to the system call instruction (e.g. by
2 bytes on x86-64 for syscall, or by the appropriate amount on other
architectures). When the tracee resumes, it immediately generates a new
syscall-entry stop, allowing the tracer to provide a new system call number and
arguments. By repeating this process, a tracer can transparently replace a
single system call with any sequence of system calls.

This capability already exists on all architectures through
architecture-specific interfaces such as PTRACE_POKEUSER, PTRACE_SETREGS, or
PTRACE_SETREGSET. PTRACE_SYSCALL_INFO_FLAG_SET_IP does not introduce a new
capability; it merely exposes an existing one through the portable
PTRACE_GET_SYSCALL_INFO/PTRACE_SET_SYSCALL_INFO API.

WHO

The VUOS project uses this mechanism extensively.
VUOS provides namespace-like execution environments implemented entirely in
user space, without relying on kernel namespaces.
https://wiki.virtualsquare.org/#/tutorials/vuosbasics

For example, VUOS allows unprivileged processes to use user-space
implementations of filesystems (FUSE), networking stacks, virtual devices, and
other resources.

To improve scalability on multicore systems, VUOS implements what we call the
guardian angel model: each traced thread has its own dedicated tracer thread.
This avoids a single tracer becoming a bottleneck.

When a traced thread creates a child, ownership of the new tracee must be
transferred to a newly created guardian angel. This requires delaying execution
of the child's first system call until the new tracer has attached.

The current implementation proceeds as follows:
* save the original system call number and arguments;
* replace the system call with a blocking ppoll(NULL, 0, NULL, NULL) call;
* detach the original tracer;
* attach the new guardian angel using PTRACE_SEIZE;
* interrupt the blocking ppoll() with PTRACE_INTERRUPT;
* at the subsequent syscall-exit stop, rewind the instruction pointer to the system call instruction;
* at the following syscall-entry stop, restore the original system call number and arguments.

This mechanism is currently implemented using architecture-specific register
manipulation. PTRACE_SYSCALL_INFO_FLAG_SET_IP would allow the same
implementation to be written using the portable ptrace syscall information API.

Although VUOS is the primary motivation for this proposal, the feature is
generally useful for any project implementing ptrace-based system call
interposition, including PRoot, strace's syscall injection machinery, and
similar frameworks.

Signed-off-by: Renzo Davoli <renzo@cs.unibo.it>
---
 include/uapi/linux/ptrace.h |  4 ++++
 kernel/ptrace.c             | 25 ++++++++++++++++++++-----
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/include/uapi/linux/ptrace.h b/include/uapi/linux/ptrace.h
index 5f8ef6156752..6f62cb812875 100644
--- a/include/uapi/linux/ptrace.h
+++ b/include/uapi/linux/ptrace.h
@@ -80,6 +80,10 @@ struct seccomp_metadata {
 #define PTRACE_SYSCALL_INFO_EXIT	2
 #define PTRACE_SYSCALL_INFO_SECCOMP	3
 
+#define PTRACE_SYSCALL_INFO_FLAG_SET_IP (1 << 0)
+#define PTRACE_SYSCALL_INFO_FLAG_ALL \
+	(PTRACE_SYSCALL_INFO_FLAG_SET_IP)
+
 struct ptrace_syscall_info {
 	__u8 op;	/* PTRACE_SYSCALL_INFO_* */
 	__u8 reserved;
diff --git a/kernel/ptrace.c b/kernel/ptrace.c
index 64fd1b455297..6df38f139a2d 100644
--- a/kernel/ptrace.c
+++ b/kernel/ptrace.c
@@ -1130,6 +1130,7 @@ ptrace_set_syscall_info(struct task_struct *child, unsigned long user_size,
 	struct ptrace_syscall_info info;
 	int op;
 	bool skip_syscall = false;
+	int ret;
 
 	if (user_size < sizeof(info))
 		return -EINVAL;
@@ -1142,8 +1143,8 @@ ptrace_set_syscall_info(struct task_struct *child, unsigned long user_size,
 	if (copy_from_user(&info, datavp, sizeof(info)))
 		return -EFAULT;
 
-	/* Reserved for future use. */
-	if (info.flags || info.reserved)
+	/* Unused flags and fields reserved for future use. */
+	if ((info.flags & ~PTRACE_SYSCALL_INFO_FLAG_ALL) || info.reserved)
 		return -EINVAL;
 
 	/*
@@ -1164,15 +1165,29 @@ ptrace_set_syscall_info(struct task_struct *child, unsigned long user_size,
 
 	switch (info.op) {
 	case PTRACE_SYSCALL_INFO_ENTRY:
-		return ptrace_set_syscall_info_entry(child, regs, &info);
+		ret = ptrace_set_syscall_info_entry(child, regs, &info);
+		break;
 	case PTRACE_SYSCALL_INFO_EXIT:
-		return ptrace_set_syscall_info_exit(child, regs, &info, skip_syscall);
+		ret = ptrace_set_syscall_info_exit(child, regs, &info, skip_syscall);
+		break;
 	case PTRACE_SYSCALL_INFO_SECCOMP:
-		return ptrace_set_syscall_info_seccomp(child, regs, &info);
+		ret = ptrace_set_syscall_info_seccomp(child, regs, &info);
+		break;
 	default:
 		/* Other types of system call stops are not supported yet. */
 		return -EINVAL;
 	}
+
+	if (ret== 0) {
+		if (info.flags & PTRACE_SYSCALL_INFO_FLAG_SET_IP) {
+			unsigned long ip = info.instruction_pointer;
+			if (ip != info.instruction_pointer)
+				return -ERANGE;
+			instruction_pointer_set(regs, ip);
+		}
+	}
+
+	return ret;
 }
 #endif /* CONFIG_HAVE_ARCH_TRACEHOOK */
 
-- 
2.55.0

