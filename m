Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.136.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350177;
	b=uGp4QG6Es+CntxTTte2t5dFr+eeZg4KL7nywnzPQaxSefzr6od/GcunyowiZ+OznYEHN
	 fqyBV64WW6O2WcZ7scYUty2cOCCAbGnSnLxfTFmxgfjxsDGZPzXj1/gxcsp4YJHtt3zwG
	 iEOQ3WNaK+urk8KnstdDt39+p10m2/dO5xEUaPpCRrVETR05ctsEbrdNgTr2auNNSTsr9
	 ZlCyLhUpC9ay3DaqFwSvtbxzaEhbgz5lUDuHMGlbTEiH5WBHtpHSDW4hwKlI0eHgKkcnc
	 HUIF7Y4RI/IbpNZLHUC2Zzn71dyVgNrrrMp4qCPl0H7/1ffxylhf9xloTaBW7L5OUqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350177;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ObwGFit3UU3D1k7FJoLE7Rk8Vud49AulHNT/pROT5iU=;
	b=EZNoTvcQG9uPF+MFk07ietz2v7AYMC6fJ2aeiTBumH5ZLPUpjz2eD+g2OhkSXZTki2O6
	 vwRSHlGAqW/mRHiCSn/tJl49lUpzdmG3qecLsKuVx2z12NQ6DSVCVocENuVVasM8DuPcJ
	 VOyxMuIsYwb+1L+Vs851L8ham1dGX8m6tPDuekOQXHBH6MG3LG43BDgcIv76Zx1of8aJB
	 ax2/YPC/xy4wgnSJqzammwONLxR2mlbREWoCyUEd+W+zUdjZrB1VkolRk1QufreiuUWlr
	 RHBd3L6+AcVWq8Xz3Q2IRvmDxNpDp7/VTzvkCdrC2SztrzH5AlL1ot7e9qNBEzgwjXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unibo.it;
	spf=pass smtp.mailfrom=cs.unibo.it;
	dkim=pass header.d=cs.unibo.it header.i=@cs.unibo.it header.a=rsa-sha256 header.s=virtlab header.b=B9LoJ2de;
	arc=none smtp.remote-ip=130.136.161.50
Received: from mail.virtlab.unibo.it (mail.virtlab.unibo.it [130.136.161.50])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9654D606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9654D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cs.unibo.it header.i=@cs.unibo.it header.a=rsa-sha256 header.s=virtlab header.b=B9LoJ2de
Received: from eipi10.cs.unibo.it (unknown [94.32.99.206])
	by mail.virtlab.unibo.it (Postfix) with ESMTPA id C348C1C0043;
	Fri, 30 Oct 2026 09:49:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cs.unibo.it;
	s=virtlab; t=1793350174;
	bh=o+9ASTpYwoNfBlSWNdqTGEVvnobhYXlVi0xXeRuWCfk=;
	h=From:To:Cc:Subject:Date:From;
	b=B9LoJ2dehm/kHnztNVkX6m++gYauePuZ9vsR5niYTBUPeA4z7srTslbx8Gi0zxGfv
	 hpe8d75Mk9YNxZZtfycHeDoubQVyUYuJjmDIcD+vTb0hKjF6BTBWfKCAMqcS8+oPZ1
	 jRvaNv/iF3zfeCskTZt3nxXmV3d3HFYjYZ4CCMvc=
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
Date: Fri, 30 Oct 2026 09:49:23 +0100
Message-ID: <20261030084926.1068384-1-renzo@cs.unibo.it>
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

