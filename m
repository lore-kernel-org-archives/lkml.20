Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.136.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348299;
	b=Okb4zF5YsfVNx+dhtIy0TyRqLbqUhdjiaomZLro3/NbMEc/Be2/B0s5tLWeVUsHerY1X
	 zDRVy6jzcKvBXq0y1yn83vm6UMvzrCw2PYTi2InyrQtjQam3qIOyc6n4mzfBgY2mM5geI
	 kC/U3nXeqXwTMAfZeY2aw8HJDLz5m3gHvb9B926jVkLd/3CG9OeW4kWIbMD69ZA/84BGB
	 TxT3YHrzLYe1GnQE59QkPKGIE9V6NkAjqi7fJNKe91B6OlP7uBqgZqXJcLINCbSzvGaPn
	 2owPXHGpYRA2LAbZR9e7l5Iac1GX7IA3gbLzpiccFveY/pcgl2IUbOUkcqRxK3rqHGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348299;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ObwGFit3UU3D1k7FJoLE7Rk8Vud49AulHNT/pROT5iU=;
	b=vOJrxWHUpNyh2YsqQhofrq1ero/ygTzsq71Vuj+0bpeTYlZL+a53qHNpsrmTYmvkCXe7
	 +CEoa+xGPmg5LKQC9GEpRNy/3lrLXbqAEb92fyBsnf2a/emvIQQRYxluXHHZGqNnP6xKM
	 tahyyGU0JdMIn/SXkMF6CsN9CMqHe80zsJxZK6mcjnA2Eu8Yza5CG1WTncgU3qY1s6iZx
	 fIgJuEPftaYaRSsfSsWmVRw3uTYsIoofFFb0M0qQrmquyQw3oemspeg8/Ck1ixHOITQ06
	 xaExyqTruOu/cVt9FldqrRBWMiy9dRc0mjkicLOCUUHV/aUqnpiogO8tquGyWf7dStA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unibo.it;
	spf=pass smtp.mailfrom=cs.unibo.it;
	dkim=pass header.d=cs.unibo.it header.i=@cs.unibo.it header.a=rsa-sha256 header.s=virtlab header.b=OoTodfeL;
	arc=none smtp.remote-ip=130.136.161.50
Received: from mail.virtlab.unibo.it (mail.virtlab.unibo.it [130.136.161.50])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640F1606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 640F1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cs.unibo.it header.i=@cs.unibo.it header.a=rsa-sha256 header.s=virtlab header.b=OoTodfeL
Received: from eipi10.cs.unibo.it (unknown [94.32.99.206])
	by mail.virtlab.unibo.it (Postfix) with ESMTPA id B97D71C0043;
	Fri, 30 Oct 2026 09:18:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cs.unibo.it;
	s=virtlab; t=1793348295;
	bh=o+9ASTpYwoNfBlSWNdqTGEVvnobhYXlVi0xXeRuWCfk=;
	h=From:To:Cc:Subject:Date:From;
	b=OoTodfeL2SM/MZ6/XpMgR/fakswsVWwYnc6G8r8W6JM0wLSYJY+wrL9maocR6voe4
	 28d4Ug8vSgHX3W7G4YKApA/Z3QiKVPf97SHsceBLEdkyIgRj3hKGA3uAuRLc/G7xHt
	 ntZBaFyZ/Sm26XgUJ+hsiK4tPjqjdEZ0cirj2R3s=
From: Renzo Davoli <renzo@cs.unibo.it>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: Renzo Davoli <renzo@cs.unibo.it>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	=?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	"Dmitry V . Levin" <ldv@strace.io>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] powerpc/syscall: Fix the return value of skipped syscalls
Date: Fri, 30 Oct 2026 09:17:53 +0100
Message-ID: <20261030081757.1065832-1-renzo@cs.unibo.it>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When ptrace or seccomp skip a system call on powerpc, the return value
they set is lost or the tracer is affected:

 - syscall_set_return_value() sets TIF_SYSCALL_RET on current, which is
   the tracer when called through PTRACE_SET_SYSCALL_INFO, so the next
   system call of the tracer is silently skipped (1/2);

 - system_call_exception() returns syscall_get_error() for a skipped
   system call, which is 0 for any non-error value, so a success value
   set by a tracer or by a SECCOMP_RET_USER_NOTIF listener is replaced
   with 0 (2/2).

Both problems are in v7.3.  1/2 does not apply as is to v7.3, which
still has the two separate TIF_SYSCALL_RET checks from before commit
66236558dfac ("powerpc/syscall: Avoid atomic test_and_clear_thread_flag
on fast path"); the code it leaves behind is the same, and 2/2 then
applies on top.

Tested on QEMU pseries (TCG, -cpu power9), ppc64le guest config, on
mainline 734bef548a96, with ppc_skip_repro.c [1] (a tracer sets the
return value with PTRACE_SET_SYSCALL_INFO and then makes a system call;
a tracer skips a system call at a PTRACE_EVENT_SECCOMP stop with
PTRACE_POKEUSER, with both "sc" and "scv 0") and with the ptrace and
seccomp selftests:

                                           mainline    + 1/2       + 2/2
  tracer syscall after SET_SYSCALL_INFO    not run     correct     correct
  skipped syscall, success value, sc/scv   returns 0   returns 0   correct
  skipped syscall, error value, sc/scv     correct     correct     correct
  selftests/ptrace set_syscall_info        FAIL        pass        pass
  selftests/seccomp/seccomp_bpf (*)        14 FAIL     14 FAIL     all pass

  failing in mainline and with 1/2 only:
  user_notification_{basic,child_pid_ns,sibling_pid_ns,fault_recv,addfd,
  addfd_opath,addfd_rlimit,addfd_send_interrupted,sync,fifo,
  wait_killable}, TRACE_syscall.seccomp.syscall_faked,
  notification_restart.{killable,both}.after_receive

(*) not counting user_notification_wait_killable_after_reply (100000
    notifications with a 1 ms itimer), which hits the 30 s harness
    timeout under emulation on all three kernels.

Build-tested with W=1: ppc64le guest config, ppc64_defconfig (BE),
pmac32_defconfig.

Changes in v3:
- Split in two patches, one per Fixes: tag: 1/2 removes TIF_SYSCALL_RET
  (suggested by Michal), 2/2 fixes the return value.
- 2/2 returns syscall_get_error() ?: regs->gpr[3] instead of
  regs->gpr[3], so the error path is unchanged (suggested by Mukesh).
- Applies unchanged to current mainline (d89e1d186ec9).
- Link to v2:
  https://lore.kernel.org/lkml/20261023180735.853655-1-renzo@cs.unibo.it/

Changes in v2:
- Rebased on mainline 734bef548a96, after commit 66236558dfac.
- Link to v1:
  https://lore.kernel.org/lkml/20261018151539.440213-1-renzo@cs.unibo.it/

[1] https://lore.kernel.org/lkml/ato6Tq0aKdqqdqyJ@cs.unibo.it/

Renzo Davoli (2):
  powerpc/syscall: Remove TIF_SYSCALL_RET
  powerpc/syscall: Return the preset value of skipped syscalls

 arch/powerpc/include/asm/syscall.h     |  6 ------
 arch/powerpc/include/asm/thread_info.h |  1 -
 arch/powerpc/kernel/syscall.c          | 13 +++++++++----
 3 files changed, 9 insertions(+), 11 deletions(-)


base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.55.0

