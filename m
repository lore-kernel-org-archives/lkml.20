Received: from mail.virtlab.unibo.it (mail.virtlab.unibo.it [130.136.161.50])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CB63DD879
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.136.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165420; cv=none; b=G3IbLmSrnSdH0V0/t1r1hD5ZQSnFIKYXGMCeWBFCUbAgpaw2ePS65qJdgIV/J+xiO38U7yl3oI5+Vq6vFSRdz7LwkgzzGDugn31EfWUI9bRFXEzu2Z/zH25HOlq0jb3MiHlMdgui/jLHDnEZvZ7W7Wi9X2Xwky2R2pCocqnpK4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165420; c=relaxed/simple;
	bh=X51It36+DW31PyST3thn5ArRNJt1/h8eJ4IolJGJxMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YdEIxSOPP2scc0XQR4iN+0q+pZHVS4klvAu0aTntNUKMC/f/zGYeJd2EPRoEX72hO02uu56Y64jj/i4GRyU6wE2cGAOUJxhfNriYJW3kK9aeKGENrkjH8XvnuTKqmDKQtwl48Os5azg2r3oJjw1yMjmkhlPBO2EKCgRg27VdUXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it; spf=pass smtp.mailfrom=cs.unibo.it; dkim=pass (1024-bit key) header.d=cs.unibo.it header.i=@cs.unibo.it header.b=VLbp0c5n; arc=none smtp.client-ip=130.136.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cs.unibo.it header.i=@cs.unibo.it header.b="VLbp0c5n"
Received: from eipi10.cs.unibo.it (unknown [94.32.99.206])
	by mail.virtlab.unibo.it (Postfix) with ESMTPA id 9F8421C0249;
	Mon, 31 Aug 2026 10:28:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cs.unibo.it;
	s=virtlab; t=1788164885;
	bh=X51It36+DW31PyST3thn5ArRNJt1/h8eJ4IolJGJxMM=;
	h=From:To:Cc:Subject:Date:From;
	b=VLbp0c5nBomtSUkfbG8zfzvhMavqdTSJBvmhZV8wSz/eyGQ3CK0zmQKLUjb7DMAma
	 nPSjzSBeqAD7gSL1pPHCzQ0TgaWhbYs9YclBweWugAZ4LniqSjlKbPOuaAgNeknEIl
	 pg6ETRTW6LFa0ldZf8bsC2Yx+FbZRx+sph4sf6SI=
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
Subject: [PATCH v7 0/2] PTRACE_SET_SYSCALL_INFO: add support for seccomp syscall skipping
Date: Mon, 31 Aug 2026 10:27:51 +0200
Message-ID: <20260831082753.165731-1-renzo@cs.unibo.it>
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
skipping a system call.

When a seccomp filter returns SECCOMP_RET_TRACE, the tracer receives,
via PTRACE_GET_SYSCALL_INFO, a struct ptrace_syscall_info with
op == PTRACE_SYSCALL_INFO_SECCOMP.

The tracer can skip the system call by setting the system call number
to -1. However, the current PTRACE_SET_SYSCALL_INFO interface does not
provide a way to specify the return value or error code that should be
reported to the tracee after skipping the call.

This patchset extends PTRACE_SET_SYSCALL_INFO to support skipping a system call
triggered via seccomp.

When a tracer retrieves a ptrace_syscall_info structure with 'op' set to
PTRACE_SYSCALL_INFO_SECCOMP, it can now choose to skip the system call.  To do
this, the tracer changes 'op' to PTRACE_SYSCALL_INFO_EXIT and populates the
exit union fields (rval and is_error) to define the return value and error
status for the tracee.

System call suppression via PTRACE_SYSCALL_INFO_ENTRY is currently not
implemented.  On some architectures (e.g. MIPS), when a system call is
skipped by setting the syscall number to -1 at the entry stop, the
architecture entry path unconditionally overwrites the return value
register with -ENOSYS, clobbering any custom return value set by the
tracer at the entry stop.

This patchset is a new version of the proposed patchset entitled:
ptrace_set_syscall_info: add support for seccomp syscall skipping and
instruction pointer modification
The patchset has been split in two:
syscall skipping(this)
instruction pointer modification (it will be updated soon)

Changes in v7:
* rebased to Linux 7.3-rc1

Changes in v6:
* selftests/ptrace/set_syscall_info.c: improve messages in case of failure.

Changes in v5:
* reworded the explanation for not supporting PTRACE_SYSCALL_INFO_ENTRY yet.
* selftests/ptrace: removed a redundant check.

Changes in v4:
* Reworded the commit messages for clarity.
* Renamed the local variable child_op to op in ptrace_set_syscall_info()
* Clean up and improve the coding style of selftests/ptrace/set_syscall_info.c
  (suggested by Dmitry V. Levin)

Changes in v3:
* restrict the syscall skipping feature to PTRACE_SYSCALL_INFO_SECCOMP

Changes in v2:
bugfix: _NONE -> _EXIT transition was erroneously permitted

Changes since the previous patchset v2:
* bugfix: skip_syscall init value
* fix comments

Changes in (previous patchset) v2:
* use PTRACE_SYSCALL_INFO_EXIT instead of a new tag
* fixed most of the comments from sashiko.dev

Renzo Davoli (2):
  ptrace: add PTRACE_SET_SYSCALL_INFO syscall skipping support
  selftests/ptrace: add a test case for PTRACE_SET_SYSCALL_INFO syscall
    skipping

 kernel/ptrace.c                               |  27 ++-
 .../selftests/ptrace/set_syscall_info.c       | 184 +++++++++++++++++-
 2 files changed, 205 insertions(+), 6 deletions(-)

-- 
2.55.0

