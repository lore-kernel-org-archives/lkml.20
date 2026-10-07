Received: from mail-108-mta0.mxroute.com (mail-108-mta0.mxroute.com [136.175.108.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9B437EFFD
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380291; cv=none; b=h7lFfrBia1cyDTyJlyj83Ieg6ecHXK2/GRMULODEFWfLihPXyMKuy10u42SgVwiRTIRNLe/0tEfKDXIfARKe6Dn45j6/KpRo+YTcz7e1Fac4hnZunmAmM+f+h5ilritOAO6G6JoYsvTnrZmcKNds69edsCb96+JS8k1LR8XG1c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380291; c=relaxed/simple;
	bh=uuQcam/hw5XW0Ld4ZNXBurTa55IKHavgCrYxBx1WA2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q+K4i+Rwx/AjB79TPOzJNTONJbNZkn/NaDh0aO8I/QHDKTFyzjA12B79R0ZD5212i+LGIrfGBaXa2hzm90JU1nPnqVuwrLnCLd7dVv/FheEbwb0bJJnYqdy2NqDjD4WhDSSmqqOtRh5c2iKOqEHuHiR972qKbbum2V9ZYTxquGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=v735DBv+; arc=none smtp.client-ip=136.175.108.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="v735DBv+"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta0.mxroute.com (ZoneMTA) with ESMTPSA id 1a116910d5a00028b2.00c
 for <linux-kernel@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 07 Oct 2026 13:32:47 +0000
X-Zone-Loop: 21fcd04df0bcfe7f386c8a2ce46c3da6dfaa0d4ee9e6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=X9OyUQPbDJJfFGqp4D600hHMGXWb/t7+axy2CYnitjU=; b=v
	735DBv+Vn8rwZUYei61Is0lGyWNjtBSM7ENMOrVF17X5GKjko+6P8LLDWf18+VLKXagxJJ5Kve0Qk
	e1TegviHbebOOlaJUmgm4bXXYFt5n5skWTuSbavwB51UTaYMakJBTY1kFNBO8Nh71BieSEKdcS70t
	1Ucg2QzF6YaKUv7bj2U832BJDHEjYoJ/Y3+3IA6Dqq3qjPZxRNamsyexvjbeIMDJtktMlYMdEgcSU
	M8fXkYjkPQGdcsPPOvi2neX93gB5DzppwQZS9HLnxXC5mXXWQKTQvTF5lqniBKFuNrzdxI5ugRJcX
	C6RnRh6/qBLRaWZV6IBpblT1du5moNgjg==;
Date: Wed, 7 Oct 2026 13:32:29 +0000
From: Richard Patel <ripatel@wii.dev>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Florian Weimer <fweimer@redhat.com>, x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	David Laight <david.laight.linux@gmail.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Xin Li <xin@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	David Rubin <david@vortan.dev>, linux-kernel@vger.kernel.org,
	libc-alpha@sourceware.org
Subject: [RFC] x86: usermode IBT and signal handling
Message-ID: <asZJ7Q1W+Fd/RFoO@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Authenticated-Id: ripatel@wii.dev

I'd like to request feedback for usermode IBT (indirect branch tracking)
support from the x86 and libc people before sending another series.
Also, thank you for the chat at LPC!

Questions:
1. Should the initial version preserve WAIT_FOR_ENDBR across signal
   delivery? (OpenBSD does not do that)
2. Where to preserve WAIT_FOR_ENDBR across signal? Options:
   - shstk signal frame
   - signal frame fpstate (carve out a bit in _fpx_sw_bytes)
   - uc_flags
3. OK to break legacy 32-bit sigreturn if IBT enabled?

For context, here the previous series:
- Intel (2021): https://lore.kernel.org/all/20210830182221.3535-1-yu-cheng.yu@intel.com/ 
- my v1: https://lore.kernel.org/lkml/20260517183024.16292-1-ripatel@wii.dev/T/
- my v2: https://lore.kernel.org/lkml/20260605184715.3383415-2-ripatel@wii.dev/T/

The uncontroversial parts of the kernel-side changes:
- usermode enables and locks IBT via RISC-V's
  prctl(PR_SET_CFI, PR_CFI_BRANCH_LANDING_PADS, ...) API
- IBT enablement is all-or-nothing process-wide (could extend later)
- IBT enablement sets both ENDBR_EN and NO_TRACK_EN
  (enforce endbr64 on indirect jumps, allow 'notrack' prefix to opt-out)
- vDSO polishing needed (add missing endbr64 markers, GNU property note)
- signal handler entrypoint does not need 'endbr64' (the signal handler
  entrypoint cannot easily be changed)

The libc side is analogous to shadow stack: a new tunable, tracking of
DSOs opting into IBT, prctl() on startup, etc. 
Florian seems fine with the prctl() approach as opposed to enabling IBT
automatically in the kernel.

Next, context switching:
1. kernel<->usermode (e.g. process switching, page faults, syscalls)
   require no changes (usermode shadow stack does all the work already)
2. usermode<->usermode (longjmp) is a glibc affair, no kernel changes
3. usermode<->kernel<->usermode (signal handling) is annoying

Signal handling (entering the handler and rt_sigreturn) is annoying
because x86 does not have hw support for unprivileged IBT state backup/
restore.

   500:  jmp rax   ; rax=1000
  1000:  nop       ; WAIT_FOR_ENDBR=1
  ** CET violation **

In OpenBSD and my v2 series, the signal frame does not back up IBT state
(the WAIT_FOR_ENDBR bit), and resets it to zero instead.

   500:  jmp rax   ; rax=1000
  ** Interrupt, signal handler called **
   100:  syscall   ; rt_sigreturn
  ** Return from signal handler **
  1000:  nop       ; WAIT_FOR_ENDBR=0
  ** CET bypassed! **

This race can be made deterministic for some apps (e.g. SIGBUS or
whatever).

But IBT with signals can be done, with two more pieces (see v1 series):

- space to back up IBT state (a single bit, WAIT_FOR_ENDBR).
  options are:
  - uc_flags, which is a uapi change (Intel's original series)
  - sigframe fpstate
    - decoupled from SHSTK
    - new bit in _fpx_sw_bytes (uapi/asm/sigcontext.h)
    - U_CET is supervisor state, so not saved by signal frame XSAVE
    - supports legacy ia32 sigframe
  - shadow stack signal frame
    - the LSB of the saved SSP is always zero, so we can use it
    - this makes IBT require SHSTK
    - awkward situation where SHSTK arch_prctl needs to be enabled
      before BRANCH_LANDING_PADS prctl is allowed
    - automatically bans 32-bit mode since SSP > 4G raises #GP
    - may confuse libgcc, CRIU, etc, depending on how we do it

- a primitive to change saved user state from kernel mode.
  when hardware switches from kernel to user, it loads IBT state from
  one of 3 places.  Since the kernel modifies this user state, it has
  to know what to modify.
  1. FRED exception frame (wfe bit)
  2. U_CET MSR (TIF_NEED_FPU_LOAD=0)
  3. task's fpstate save area

Let me know what you all think. My personal preference is:
1. preserve WAIT_FOR_ENDBR across signals.
2. back up the WAIT_FOR_ENDBR bit in signal frame fpstate
3. no special handling for 32-bit mode

Separately, I'll take a look at kernel shadow stacks unless someone else
is already working on it ...

Cheers,
-- Richard
