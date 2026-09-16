Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7853538CFF8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534082; cv=none; b=o62lY0mzLqZdjNah4h6AjyhkabjiAYJsqzL8XlyLsxVnbiuhWfy/NOuntWIA/bAPfSBBgYtuvrt2ajRJ5GR+iyGDL4j3EBieMICAElkpl1V/8DEaqkyLjBMMCL2spv6Uvi8Y7YulRismCUouufkTeQ09SeRqfZBzj93ueg3j5Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534082; c=relaxed/simple;
	bh=yzHgKJdCRSyY1U25rdYgozih5Sf7HLQ1uA6rNQnzFXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiyK1MULTwFdMqpVnTh5tBX5gb6Jv5qKuObHSRoL6vY9FvwpGOpig/xsJe+SR7LsdWb8dDDGESxtN7n7GKlGo8vUZuk4ak7gl2f/ffcnKIwVsXt/xBO9v2A7GMw1IOVmZwBlggsyNMvnlk1WQxQ2kKZzUjPi87bBWp9d5UF/So0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p9nco0Qh; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p9nco0Qh"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso468335a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534079; x=1790138879; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HbDQlN24R23DyDmW4DbzXR/gB6YrFxHcO7yoyli6aGg=;
        b=p9nco0QhxN4b1wdKZ3BFfzNENw3OK9/yhu5rz2nvZM/VYrcKMk3zzc04QlaCjVhfkL
         1p5okPk8L6cJPm0Wb3kZT39zMH1OLzgUVC5b+sYBwwgKJP+K12bf4BQERR8hTGL78T1L
         0ORuPTM1vMwu4g4l1iRkNU7IOki8dnxG78DEIPw8wXYAJ7/b5dpcjlNhrxtt6a57h+p5
         dAbrT3V7Q93BwaQ/tRsaL6+PJUqK09pq+iGowUabKcLnXg+DFjW/cOM8hdIgHsX3QDDX
         6JRQBmvIRTtRavs7Jdg9Xcr8JSC+rkb/h/nZ5igQxWReFZOhbdwzX6qC0xnt+v/sXdP/
         EVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534079; x=1790138879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HbDQlN24R23DyDmW4DbzXR/gB6YrFxHcO7yoyli6aGg=;
        b=Rw5Tx4qsdJ682R4J1FzG7AqRQzCKcvuaNInbtqKvDzzK58oy5Xk2vVvgHIV5OQ6TUI
         HQUkB1p1EVm4yc8bn2e08pz629o+yh0EbgFxaZ9MPJXnqKwhpJfRzrhiz+J09RbGEDCm
         7MLiDS2CFYjzm1gcxjBGqLA7/lHZTlcSDM4KZvvJrbBHAIH/tAOeU8uRJB7c3bWcJDN3
         8nR0+wSITR9fA5A97OC1ShkCW4/+bSqljZZG8BFD+CDwlWb92i7mRZXNGWgRa4vmO4za
         oPj395eTNpYVavokfA+ejLGK8twpcOwJMx/BT9OeKSS3qwnMhxuCYYrf97PQLt2eIpw6
         RK+A==
X-Forwarded-Encrypted: i=1; AKwUvBzekKsgmFHuAYl0nZGsYzOhufcZAPQa1YCIoxbTMfYJt6RumtRErGUHegP33Cx1IM+EGimSYYT/xbxbFEc=@vger.kernel.org
X-Gm-Message-State: AFuF++lYw4ITvhBpymyow5Ic86vr0E9oOH5Iff6Ujsf+7RmRBvcE0QUe
	PuEAEqDEGdMgU6AgLfzoXzbnrDnI2J/DjVlf5m+jNKXLFiH9Pr5PzvwB
X-Gm-Gg: AYBFou0H5a0dgmqUIVz7Q26rBbhXFpVS3RQsW9QxyPam5NYBg9+vkxLohBgHH5dGSvH
	nYs/ChL/ilmTyjpwsMSQ3mGn8rgAGkh+MbBHhoZIlYnyS/HOne3Aa8ZQuQVwx+Q3pAzeOLjQnJp
	gth5/PI50SdhD8ldOVwLkXaz9lKvMfRl01iWYMNJa/Ggo9jJPiHj3XI5S8qRC1xPKFARMiwILVt
	zB1u+0OoTL7GPQDQTA1XPykr3j3C7isRVLXk8BeXR2sTG2YXCsYop/uFT6ukbK6tlv/mqgi0t5T
	i+qpT132yB0cVgl4oD+KReR1E0NAFmmmQJ3KLARn77ohWyDVpHNKE8fhXupWLKclyUj64O9xYJp
	yYXWXDX/JRXHFT0UK9LITXSjXykJniYEWq3NFSwxuvOvIoiYB3STrlYplSjFkKn01DJ6ByxVhD8
	3i6YcPl1uNtmrf9aUQbmBAgy2lUWRn9Hw5hBqGR/qAp8X7JUH681Tqje0HKEda7Q67tIXs7eutH
	86oiq9sO3x0oCvNm0fzUKyxUXtaQqifMA==
X-Received: by 2002:a17:90b:3c41:b0:39d:fe64:5733 with SMTP id 98e67ed59e1d1-39e1e5612demr3407209a91.24.1789534078512;
        Tue, 15 Sep 2026 21:47:58 -0700 (PDT)
Received: from blinky ([67.174.242.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d13cb7sm3142992c88.7.2026.09.15.21.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:47:57 -0700 (PDT)
Date: Tue, 15 Sep 2026 21:47:55 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Jesse Taube <jtaubepe@redhat.com>, linux-riscv@lists.infradead.org,
	qingfang.deng@linux.dev, alex@ghiti.fr, aou@eecs.berkeley.edu,
	palmer@dabbelt.com, pjw@kernel.org, shuah@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/5] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <aqofe_pdCdPhpRpD@blinky>
References: <20260803134913.2013674-1-himanshu.chauhan@oss.qualcomm.com>
 <CADRr4be9p14tQcx=v-jVwfXwka0eBV8MWPfj1G4qcqv=yfxjfg@mail.gmail.com>
 <CA+Ht8=Y3CJA0jq3o0j--jA-avcBm576zm-54+BxoRfm6JB72Hw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+Ht8=Y3CJA0jq3o0j--jA-avcBm576zm-54+BxoRfm6JB72Hw@mail.gmail.com>

On Fri, Aug 07, 2026 at 01:30:09PM +0530, Himanshu Chauhan wrote:
> On Tue, Aug 4, 2026 at 10:42 PM Jesse Taube <jtaubepe@redhat.com> wrote:
> >
> > On Mon, Aug 3, 2026 at 9:49 AM Himanshu Chauhan
> > <himanshu.chauhan@oss.qualcomm.com> wrote:
> > >
> > > This patchset adds support for hardware breakpoints and watchpoints in the
> > > RISC-V architecture. The framework is built on top of the perf subsystem and
> > > the SBI debug trigger extension (Sdtrig).
> > >
> > > v6 extends v5 with two new patches:
> > >
> > >   - ptrace support: debuggers can now set and query hardware debug triggers
> > >     through the standard PTRACE_GETREGSET/SETREGSET interface using new
> > >     NT_RISCV_HW_BREAK/WATCH note types. A simpler PTRACE_GETHBPREGS/SETHBPREGS
> > >     request pair is also provided for direct single-trigger access without going
> > >     through the regset machinery. Thread flush/copy hooks are wired up so
> > >     per-task breakpoints are cleaned up across fork/exec.
> > >
> > >   - Extended selftest: the existing perf_event-based selftest is extended to
> > >     also exercise the new ptrace GETREGSET/SETREGSET regset path and the raw
> > >     PTRACE_GETHBPREGS/SETHBPREGS interface.
> >
> > I would recoment addaping
> > `tools/testing/selftests/breakpoints/breakpoint_test_arm64.c` as a
> > test.
> > I set up a test repository here
> > https://github.com/Mr-Bossman/dbtr-buildroot for anyone else to test
> > this set.
> >
> > Unfortunatly this set fails `perf test 15 16 17 18`. I would like
> > those tests to pass
> > before accepting this set. My set addresses the perf failures which is why it is
> > more complicated.
> >
> > I would highly recommend basing your set off of it as it fixes many of
> > the issues that
> > I commented on in V5. The first two commits in my series are
> > refactoring duplicate code,
> > and can technically be dropped. Even if you don't go forward with using my set,
> > I would at least recommend taking a look at it, especially
> > `riscv: ptrace: Add hw breakpoint regset`
> > and
> > `riscv: ptrace: Add hw breakpoint support`
> > as they are significantly simpler.
> >
> 
> All that is taken care of. There is a problem with icount triggers in
> Qemu. Once I fix that, I will send v7 and It will contain single
> stepping.
> 
> Regards
> Himanshu

Why did you decide to renew this patch series without pulling in Jesse's
patches?

- Charlie

> 
> > https://github.com/Mr-Bossman/linux/commits/dev/jesse/sdtrig-rebase/
> >
> > Thanks,
> > Jesse Taube
> >
> > > Single stepping is ready and test but to follow this patch set.
> > > Virtualization of debug triggers are pending
> > >
> > > The SBI debug trigger extension is specified in Chapter 19 of the SBI
> > > specification:
> > >   https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0/riscv-sbi.pdf
> > >
> > > The Sdtrig ISA is part of the RISC-V debug specification:
> > >   https://github.com/riscv/riscv-debug-spec
> > >
> > > Changes from v5:
> > >   - Rebased to v7.2-rc6
> > >   - Simplified Macros in hw_breakpoint.h
> > >   - Took care of the review comments
> > >   - Added ptrace support for hardware break/watchpoints (new patch)
> > >     - PTRACE_GETREGSET/SETREGSET via NT_RISCV_HW_BREAK / NT_RISCV_HW_WATCH
> > >     - PTRACE_GETHBPREGS / SETHBPREGS for direct single-trigger access
> > >     - HAVE_MIXED_BREAKPOINTS_REGS selected (break/watch share trigger pool)
> > >     - flush_ptrace_hw_breakpoint / ptrace_hw_copy_thread wired up
> > >   - Extended selftest to cover ptrace-based hw break/watchpoint paths (new patch)
> > >
> > > Changes from v4:
> > >   - Rebased to v7.2-rc4
> > >   - Fixed rv32 build error
> > >   - Added pr_fmt to print KBUILD_MODNAME
> > >   - Changed type of shmem_pa to phys_addr_t
> > >   - Use per_cpu_ptr_to_phys instead of __pa for per-cpu allocated memory
> > >   - Print successful registration/unregistration message when no error
> > >   - Added RISC-V DEBUGGING section in MAINTAINERS and added myself as maintainer
> > >   - Fixed warnings from checkpatch.pl --strict run
> > >
> > > Changes from v3:
> > >   - Rebased to v7.1-rc3
> > >   - For watchpoints, check tdata1.hit via SBI_EXT_DBTR_TRIG_READ and keep
> > >     STVAL-based matching as fallback
> > >   - Improved watchpoint matching when STVAL reports the lowest accessed address
> > >     for wider memory accesses
> > >   - Program execute breakpoints with SIZE=0 (match any size) to avoid misses
> > >     with 16-bit/compressed instruction addresses
> > >   - Updated selftest to avoid deadlock by replacing unbounded sem_wait() with
> > >     sem_timedwait() timeout handling
> > >   - Updated selftest breakpoint function so it cannot be inlined or optimized away
> > >
> > > Changes from v2:
> > >   - Rebased to v7.0-rc1
> > >   - Fixed warnings from checkpatch.pl --strict run
> > >
> > > Changes from v1:
> > >   - The patch adding the SBI extension and function IDs is already merged; this
> > >     series builds on top of that
> > >   - Added breakpoint selftest in tools/testing/selftests/breakpoints/
> > >
> > > How to use:
> > > ~~~~~~~~~~~
> > > OpenSBI:
> > >   https://github.com/riscv-software-src/opensbi.git
> > >
> > > QEMU:
> > >   https://github.com/qemu/qemu.git
> > >
> > > Linux Kernel:
> > >   Apply these patches on top of v7.2-rc6.
> > >
> > > How to test:
> > > ~~~~~~~~~~~
> > > From the Linux kernel directory, first install the UAPI headers (required on a
> > > fresh tree so the compiler can locate <asm/ptrace.h> and the new
> > > NT_RISCV_HW_BREAK/WATCH definitions via KHDR_INCLUDES):
> > >
> > >   make headers
> > >
> > > Then build the selftest:
> > >
> > >   make -C tools/testing/selftests/breakpoints/
> > >
> > > This produces breakpoint_test_riscv under the same directory. Load it on the
> > > target and run. Sample output:
> > >
> > >   # /apps/breakpoint_test_riscv
> > >   # [perf_event]: Breakpoint test passed!
> > >   # [perf_event]: Watchpoint test passed!
> > >   # [ptrace]: Breakpoint test passed!
> > >   # ptrace(PTRACE_GETREGSET): Number of watchpoints: 2
> > >   # ptrace(PTRACE_GETREGSet): addr: 0x82888 control: 0x8080
> > >   # [ptrace]: Watchpoint test passed!
> > >   # [hbpregs] breakpoint readback: addr=0x10472 type=4 len=4 ctrl=0
> > >   # [hbpregs]: Breakpoint test passed!
> > >   # [hbpregs] watchpoint readback: addr=0x82888 type=2 len=8 ctrl=0
> > >   # [hbpregs]: Watchpoint test passed!
> > >
> > > Himanshu Chauhan (5):
> > >   riscv: Introduce support for hardware break/watchpoints
> > >   riscv: Add breakpoint and watchpoint test for riscv
> > >   riscv: ptrace support for hardware break/watchpoints
> > >   selftests/breakpoints: extend riscv test for ptrace hw
> > >     break/watchpoints
> > >   MAINTAINERS: Add entry for RISC-V Debugging
> > >
> > >  MAINTAINERS                                   |   9 +
> > >  arch/riscv/Kconfig                            |   2 +
> > >  arch/riscv/include/asm/hw_breakpoint.h        | 299 +++++++
> > >  arch/riscv/include/asm/kdebug.h               |   3 +-
> > >  arch/riscv/include/asm/processor.h            |  18 +
> > >  arch/riscv/include/uapi/asm/ptrace.h          |  53 ++
> > >  arch/riscv/kernel/Makefile                    |   1 +
> > >  arch/riscv/kernel/hw_breakpoint.c             | 677 ++++++++++++++++
> > >  arch/riscv/kernel/process.c                   |   5 +
> > >  arch/riscv/kernel/ptrace.c                    | 507 ++++++++++++
> > >  arch/riscv/kernel/traps.c                     |   6 +
> > >  include/uapi/linux/elf.h                      |   4 +
> > >  tools/include/uapi/linux/elf.h                |   2 +
> > >  tools/testing/selftests/breakpoints/Makefile  |   5 +
> > >  .../breakpoints/breakpoint_test_riscv.c       | 765 ++++++++++++++++++
> > >  15 files changed, 2355 insertions(+), 1 deletion(-)
> > >  create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
> > >  create mode 100644 arch/riscv/kernel/hw_breakpoint.c
> > >  create mode 100644 tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
> > >
> > > --
> > > 2.43.0
> > >
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
