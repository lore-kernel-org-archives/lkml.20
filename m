Received: from mail.virtlab.unibo.it (mail.virtlab.unibo.it [130.136.161.50])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0FD3537EE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.136.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788175825; cv=none; b=EqGaQEnuI3x1WucHWxGQ45stlSdsT1kK6TbGbcr/HM9H7qcO28Jk5tgVBsEea+oYUV0mFobcWyYO0HaYACULUtlfgn57lmRv6lIgpmSd7lJOefeHmXQhmAIugAvPw37ffuTnWBiVwMnb8BG7U6zFtexBwriwWDUzcmby1h6twVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788175825; c=relaxed/simple;
	bh=sMKECYlbbY+zJgtA1Bu5FPVwu63muDWThlWdRUcC0IQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oPVQNuetsbK2evKvZRFEPrwqgFfAmocccw7UcTdA+TwYFP5p+NUB65Aef+Hmkfr90Sn05+hnBOIawaYdgAAy/37DYxCm9Tw4uD6jMoDWjQomipgO5BS+Zh5164ulv8reemT/3WrNwzg2DKxsGjkhinrQct1GCuXpW0UwD13HBvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it; spf=pass smtp.mailfrom=cs.unibo.it; dkim=pass (1024-bit key) header.d=cs.unibo.it header.i=@cs.unibo.it header.b=PKhUscg1; arc=none smtp.client-ip=130.136.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cs.unibo.it header.i=@cs.unibo.it header.b="PKhUscg1"
Received: from eipi10.cs.unibo.it (unknown [94.32.99.206])
	by mail.virtlab.unibo.it (Postfix) with ESMTPA id 8B3041C0249;
	Mon, 31 Aug 2026 13:30:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cs.unibo.it;
	s=virtlab; t=1788175818;
	bh=sMKECYlbbY+zJgtA1Bu5FPVwu63muDWThlWdRUcC0IQ=;
	h=From:To:Cc:Subject:Date:From;
	b=PKhUscg1IL/CogGlTrXQwC7TOBWjRZ58pgTbbNsEghT1piFkI5lg9WaCrCTq1G7eq
	 UyoPsIHX+K+3YgnF9RTLuWpBTXeBVvtNL5VGWb8gqUBLDrqpfxlSnvz/qqyowMcWoI
	 qLzEotYIgtugHnhdAE+1zf2R4TihlOw0lGk34c/s=
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
Subject: [PATCH v3 0/3] ptrace_set_syscall_info: add support for instruction pointer modification
Date: Mon, 31 Aug 2026 13:30:01 +0200
Message-ID: <20260831113004.259991-1-renzo@cs.unibo.it>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PTRACE_SET_SYSCALL_INFO is a generic ptrace API that complements
PTRACE_GET_SYSCALL_INFO by allowing a tracer to modify details of a
system call in which the tracee is currently blocked.

The API is designed to let tracers inspect and modify system call
information in a simple, architecture-agnostic manner.

The current implementation only supports modifying the subset of
system call information needed by strace: the system call number,
arguments, and return value.

This patch set extends PTRACE_SET_SYSCALL_INFO with support for
modifying the tracee's instruction pointer.

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

This patchset is a new version of the proposed patchset entitled:
ptrace_set_syscall_info: add support for seccomp syscall skipping and
instruction pointer modification

The patchset has been split in two:
syscall skipping(previously sent)
instruction pointer modification (this)

This patch seried depends on the syscall-skipping series:
[PATCH v7 0/2] PTRACE_SET_SYSCALL_INFO: add support for seccomp syscall skipping
https://lore.kernel.org/lkml/20260831082753.165731-1-renzo@cs.unibo.it/

This series is based on top of v7 of that series and should be applied
after it.

The prerequisite series is currently not in mainline.

Changes in v03:
rebased to Linux 7.3-rc1

Changes in v02:
compatibility issues with updated syscall skipping
set_syscall_info selftest: improve error messages

Renzo Davoli (3):
  asm/ptrace.h: add instruction_pointer_set
  ptrace: add PTRACE_SYSCALL_INFO_FLAG_SET_IP
  selftests/ptrace: add a test case for PTRACE_SYSCALL_INFO_FLAG_SET_IP

 arch/alpha/include/asm/ptrace.h               |   6 +
 arch/hexagon/include/asm/ptrace.h             |   6 +
 arch/m68k/include/asm/ptrace.h                |   6 +
 arch/microblaze/include/asm/ptrace.h          |   6 +
 arch/nios2/include/asm/ptrace.h               |   6 +
 arch/um/include/asm/ptrace-generic.h          |   6 +
 arch/xtensa/include/asm/ptrace.h              |   6 +
 include/uapi/linux/ptrace.h                   |   4 +
 kernel/ptrace.c                               |  25 ++-
 .../selftests/ptrace/set_syscall_info.c       | 166 ++++++++++++++++++
 10 files changed, 232 insertions(+), 5 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
prerequisite-patch-id: 85c29843e62833d036e4a6b492ca77235b1f23d9
prerequisite-patch-id: 70c352bc91debf7841fec79077217efd9b20eece
-- 
2.55.0

