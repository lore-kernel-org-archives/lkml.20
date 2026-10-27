Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793131023;
	b=wdJU6uaMBxPQUyqPFDPBSwV970W6ecjkVpBtfPOG6GYN4mCYnVKaUF1sQ8XY6mTuOKsG
	 PUyyAJZW5c/L5pMQiabaSGrlhbCLWbl15uYa6t8ZHmV4lIslMR55OAc6Z/ntQFaDE9w1Y
	 6X//fNnNEnqGiJyXGyd8D2Bv0OzpnwE6Ws7BeXsvY2/YNDzDW0JzRAMGrstSLV7AzI2/o
	 qR03AH2pT/hBcbuJ3u4v8OQ/PW+vQUIPTKLrx5WIK4QwuLwkKJol6tzpKwrWlBCL05MxB
	 hMsGlAsGIEdCzt+BK9YX5wf+OzwA5mx52UgRRWPqgwqszDek3mGyXHTM+cc/FXI+d/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793131023;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding;
	bh=D+j8vussuX24sRS6D0PknwPrpWxpe1hpJSMo0M9lmug=;
	b=zBfEBdT1qnnLVUh7yn1LSZZQh5K1xIhSlJtj8zwCOV+DPiI1FwtyTwD+avxztY6b2XvQ
	 il1S7wVzagdMEWBBLCBa2luzZcTh9CZG8VKOUqZJUHO0ycYOcTvUyNLzbTYSQbQoEmyR8
	 T/Ba1RY5c9z0eXs4RDub5DG84ed1EK4ZFWswuuFdUII9niXCqqxLMb393dyLcQaBERTKL
	 j16qe6GMe82ppFDvBBSNPo5lexq3TmyIR0dndz31XkfswcapmmV69w5OFa2/nRmnBYmqI
	 0iA2yDv7pzPDTqXbJIpcu//X7SgsX2gRs3Cvk6JNr/RSnA0yS690JLseWEIOVOHdQsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b5ZgUb4X;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SVXE1DR+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815DE606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 815DE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b5ZgUb4X;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SVXE1DR+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793131021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+j8vussuX24sRS6D0PknwPrpWxpe1hpJSMo0M9lmug=;
	b=b5ZgUb4XrlB+gO7I7jDwVdOkJgD0gEPUKcd2B12cjCe4ILcor8RcWBW9WJOdp2ZXN8BSCY
	jl5AsbrwlXXdzgcFtvNJjWL148K6YiIJVh/4vKFeLJrUk0rtX6QgMVoOElgDfyAqPcf7h4
	hPCpL+llEcLRDHnxTNqfuvh/4xvzJW0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-m_qtTMKQMlmUvf_bEH6bJQ-1; Tue, 27 Oct 2026 15:56:58 -0400
X-MC-Unique: m_qtTMKQMlmUvf_bEH6bJQ-1
X-Mimecast-MFC-AGG-ID: m_qtTMKQMlmUvf_bEH6bJQ_1793131018
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48c6a1d4034so187641f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:56:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793131017; cv=none;
        d=google.com; s=arc-20260327;
        b=IIDfJ9riuhH0O7yYxIKeAeUu4j8mZ2AulN/i59AqYLpIe+SpTgVhCFdI73hRRccejn
         H1dWHSEwXnqKBjIlean6JgT2SfkjUNNk6Qa5loZvlfiETH1SUG2kbVLzwHwOiEbjkYlG
         HNWQQhUTk1Qpmu2FNsOdr4TRsXg6zChOOcBc5QaHSEfODSb7upHRoR1tEf+IiG3uxBW3
         tfjBynKD9oc1VItkM4auhDdRfa9sUNmChmLxlKF4wYg41rEDqFYh8nGlV7liNdn1DI5e
         5mf7QR9s2CVW/btKuz0hRH4GOiImRY2h2nq+5nPSt0oQvfXN3zqaWPfiA8NUmYFkNB/l
         UG3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D+j8vussuX24sRS6D0PknwPrpWxpe1hpJSMo0M9lmug=;
        fh=SHgn8Tmzfkw3NcSpFx2BmurDq/1pqRYcCyFXhVQaQJk=;
        b=TDQ/FgRFYx0ftq3E0ji5y1LclSDBPf3ka43RWcnNpqzYWI6gBKkuPVvtIdJCpKn1WH
         xo7iX+RcAFU9hsfEMrs2/wff4fbBGHKeAzabV9+Rl0YJ9svCqDLkBKciYsJp9JlcJbyv
         DV9ivvwDWPJ6CiJu/QYh2UzhwOT7aBA7IikqRPEncfVKVNS2Nwsiy5LsYkP+CdKdfdQe
         n+Wp1goAiS3hMXNk1SNzydiBfnVJt99/JP4XEsA4tEqDkt0fTpSn6x4ISRVeiiD81ywH
         VxASFvo5xfb9cLuDPJd0ouICN5kJVkOU5kKYF/QYOeGI0Q6LjNDIhMP1bvZmDIIdYcy2
         900Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793131017; x=1793735817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D+j8vussuX24sRS6D0PknwPrpWxpe1hpJSMo0M9lmug=;
        b=SVXE1DR+m9o03wVvqdx5FFCzys5kUHb28iyLFscl0NOwn9Ab+MMfkocBkTS4pEHT8z
         pjdCj0vHNGExw4clRXPEN112mM3dUr76eQuoMgU5KmhRnAcLvBzMn5jsd29IpKxLi7jj
         SE7toaowuciM4JOVoOLqn+xqsa/bFQhTCwplkpJDayAUcL7g465Lp0GZeLyC6wAEe3mz
         0fbYaR8dvDCzYVAycw3JgXNw7xEAP6JCJCpDD+ptPUtgljoBGC+LL2WZTyIFRMHWwume
         5xAz8CMLt5BI22zlN+5GwRkGtqR/kxu99Orc+h7VxEiAFmosn6F6SH4nLogEMvduVQgC
         5W7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793131017; x=1793735817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D+j8vussuX24sRS6D0PknwPrpWxpe1hpJSMo0M9lmug=;
        b=uQdlLLDEr7O9uk1FXBR3qX6XR7pPyJY1n0vteDGVQuN8cR+GNxG3bI1iYw3WB7ZA2X
         SrK4lFL1sdXtRjSlMG2KttsXh9ZxtRo5xIu3HC7Zyhp3oJSU1vUUx/gpc2caBg6QtXkI
         6iKFYi5hR6w1cVNxqNjSOunV+gCLUUOnVVhRlMxhWcBhBO6cs9D0otkwHfOUdpnq0f8a
         vok6LUZJOZgWh09Rjx5++GHruSCe4W2YuLl6iGn7mjHgDrbfZY3YJbOFZ/Xo/Awhzlio
         qp+TTCvx7dlXMRbCRG+RKWSxmM6M4i4yh6dCg7n5qnE/UNpxd8R8mW3ULJ0pseLsKX7V
         /Q8Q==
X-Gm-Message-State: AFq9FYKmMc2wPMayTmdUWpbuNfBwem+zvS9h7HYkb4EgmefnS6B86VBe
	uskqwwYFB+aQFV7akcjQAQUa96g52Bk65usBy/WevE/lh/dU04IrLkGJypHKSo8Y4H0eV8sItH4
	awq6KDTVGLhK9A/2ASWYpphygWCU2IgrS+FodRYWL5lBEyi6XC5WvGE/ZxqlF6wBKBtkaToeea/
	vJP3fhDhKOKu+4RhZGdqMGBYC+OurIxNfNLrMW2ctD4krcBp6z0U8=
X-Gm-Gg: AYBFou16c8ifEp3cC5qn8vvbTst/pZtxjXHqMRTsNEnxIW1t8sw0X3MxhRbhCbiBmJL
	1h+Fq1JNc+6Mxw5tjoHlm9yXSSg9s5VMb3H3M8TOi8Lta7VAKUQ1A5HEpEoOf3Kw2kdG09PjcYa
	uf3Te19I7NiT48FnpHm6OumGQUWI7swCq4Oo5RCP9P1FX0Uyx4ncPr/AruhlZrC7Pa4uFeghicE
	r0+ScNxjWzhLlS24g==
X-Received: by 2002:a5d:6f04:0:b0:48d:f7ef:cd1d with SMTP id ffacd0b85a97d-48e5d2e7526mr1186673f8f.9.1793131017561;
        Tue, 27 Oct 2026 12:56:57 -0700 (PDT)
X-Received: by 2002:a5d:6f04:0:b0:48d:f7ef:cd1d with SMTP id
 ffacd0b85a97d-48e5d2e7526mr1186634f8f.9.1793131017140; Tue, 27 Oct 2026
 12:56:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Tue, 27 Oct 2026 15:56:43 -0400
X-Gm-Features: AclHuK-lqklbDhOzhOwUlRaNa3EOHyRR5yyvs5msGAGwIR1j6q2MQbBTAlwUQTU
Message-ID: <CADRr4bcoMn2oq99psho5v3rqvtF0ZamTNGmozb2wMDUns0x4sQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] riscv: Introduce support for hardware break/watchpoints
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, 
	alex@ghiti.fr, aou@eecs.berkeley.edu, palmer@dabbelt.com, pjw@kernel.org, 
	qingfang.deng@linux.dev, shuah@kernel.org, thecharlesjenkins@gmail.com, 
	cp0613@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:39=E2=80=AFAM Himanshu Chauhan
<himanshu.chauhan@oss.qualcomm.com> wrote:
>
> This patchset adds support for hardware breakpoints and watchpoints in th=
e
> RISC-V architecture. The framework is built on top of the perf/ptrace sub=
system
> and the SBI debug trigger extension (Sdtrig).
>
> Single stepping is ready with software support and mc6. Once, icount is f=
ixed, the software
> supported single stepping will be put under a Kconfig option. Until then =
its default.
>
> Virtualization of debug triggers are pending. Patch set is ready but need=
s testing.
>
> Changes from v6:
>   - Rebased to v7.3-rc5
>   - Added HIT0/1 bit check/clear in breakpoint handler with EPC/Bp addres=
s check
>   - Removed dbtr_shmem null check as pointed by Qinfang Deng
>   - Fixed MEM_HI/MEM_LO macros to work both on rv64/32
>   - Changed unsigned long to __u64 from hwdebug state struct and dropped =
packing
>   - Gated HAVE_MIXED_BREAKPOINT_REGS with PERF_EVENTS
>   - Software base single stepping with mcontrol6 trigger type.
>   - icount is still under development.
>   - Moved and and reworked instruction decoding code to a common file.
>   - perf test suite now supported.
>         - Breakpoint overflow signal handler
>         - Breakpoint overflow sampling
>         - Breakpoint accounting (needs sudo)
>         - Watchpoint
>           - Read Only Watchpoint
>           - Write Only Watchpoint
>           - Read / Write Watchpoint
>           - Modify Watchpoint
>   - __test_function in "Breakpoint overflow signal handler" is name noinl=
ine
>   - Fixed warnings from checkpatch.pl --strict
>
> Changes from v5:
>   - Rebased to v7.2-rc6
>   - Simplified Macros in hw_breakpoint.h
>   - Took care of the review comments
>   - Added ptrace support for hardware break/watchpoints (new patch)
>     - PTRACE_GETREGSET/SETREGSET via NT_RISCV_HW_BREAK / NT_RISCV_HW_WATC=
H
>     - PTRACE_GETHBPREGS / SETHBPREGS for direct single-trigger access
>     - HAVE_MIXED_BREAKPOINTS_REGS selected (break/watch share trigger poo=
l)
>     - flush_ptrace_hw_breakpoint / ptrace_hw_copy_thread wired up
>   - Extended selftest to cover ptrace-based hw break/watchpoint paths (ne=
w patch)
>
> Changes from v4:
>   - Rebased to v7.2-rc4
>   - Fixed rv32 build error
>   - Added pr_fmt to print KBUILD_MODNAME
>   - Changed type of shmem_pa to phys_addr_t
>   - Use per_cpu_ptr_to_phys instead of __pa for per-cpu allocated memory
>   - Print successful registration/unregistration message when no error
>   - Added RISC-V DEBUGGING section in MAINTAINERS and added myself as mai=
ntainer
>   - Fixed warnings from checkpatch.pl --strict run
>
> Changes from v3:
>   - Rebased to v7.1-rc3
>   - For watchpoints, check tdata1.hit via SBI_EXT_DBTR_TRIG_READ and keep
>     STVAL-based matching as fallback
>   - Improved watchpoint matching when STVAL reports the lowest accessed a=
ddress
>     for wider memory accesses
>   - Program execute breakpoints with SIZE=3D0 (match any size) to avoid m=
isses
>     with 16-bit/compressed instruction addresses
>   - Updated selftest to avoid deadlock by replacing unbounded sem_wait() =
with
>     sem_timedwait() timeout handling
>   - Updated selftest breakpoint function so it cannot be inlined or optim=
ized away
>
> Changes from v2:
>   - Rebased to v7.0-rc1
>   - Fixed warnings from checkpatch.pl --strict run
>
> Changes from v1:
>   - The patch adding the SBI extension and function IDs is already merged=
; this
>     series builds on top of that
>   - Added breakpoint selftest in tools/testing/selftests/breakpoints/
>
> Specifications:
> ~~~~~~~~~~~~~~
> The SBI debug trigger extension is specified in Chapter 19 of the SBI
> specification:
>   https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0/r=
iscv-sbi.pdf
>
> The Sdtrig ISA is part of the RISC-V debug specification:
>   https://github.com/riscv/riscv-debug-spec
>
> How to use:
> ~~~~~~~~~~~
> OpenSBI:
>   https://github.com/riscv-software-src/opensbi.git
>
> QEMU:
>   https://github.com/qemu/qemu.git
>
> Linux Kernel:
>   Apply these patches on top of v7.3-rc5
>
> How to test:
> ~~~~~~~~~~~
> From the Linux kernel directory, first install the UAPI headers (required=
 on a
> fresh tree so the compiler can locate <asm/ptrace.h> and the new
> NT_RISCV_HW_BREAK/WATCH definitions via KHDR_INCLUDES):
>
>   make headers
>
> Then build the selftest:
>
>   make -C tools/testing/selftests/breakpoints/
>
> This produces breakpoint_test_riscv under the same directory. Load it on =
the
> target and run. Sample output:
>
>   # /apps/breakpoint_test_riscv
>   # [perf_event]: Breakpoint test passed!
>   # [perf_event]: Watchpoint test passed!
>   # [ptrace]: Breakpoint test passed!
>   # ptrace(PTRACE_GETREGSET): Number of watchpoints: 2
>   # ptrace(PTRACE_GETREGSet): addr: 0x82888 control: 0x8080
>   # [ptrace]: Watchpoint test passed!
>   # [hbpregs] breakpoint readback: addr=3D0x10472 type=3D4 len=3D4 ctrl=
=3D0
>   # [hbpregs]: Breakpoint test passed!
>   # [hbpregs] watchpoint readback: addr=3D0x82888 type=3D2 len=3D8 ctrl=
=3D0
>   # [hbpregs]: Watchpoint test passed!
>
> Perf Test Suite:
> ~~~~~~~~~~~~~~~
> ~ # /apps/perf test -v 16 17 18 19
>  16: Breakpoint overflow signal handler           : Ok
>  17: Breakpoint overflow sampling                 : Ok
>  18: Breakpoint accounting                        : Ok
>  19: Watchpoint                                   :
>  19.1: Read Only Watchpoint                       : Ok
>  19.2: Write Only Watchpoint                      : Ok
>  19.3: Read / Write Watchpoint                    : Ok
>  19.4: Modify Watchpoint                          : Ok
>
> =3D=3D=3D Test Summary =3D=3D=3D
> Passed main tests : 3
> Passed subtests   : 4
> Skipped tests     : 0
> Failed tests      : 0

Thanks for these fixes! Sorry for the late reply.
If I dont review the next set within week send me an email to remind me.
It might also be a good idea to add icount like I did here
https://github.com/Mr-Bossman/linux/commit/eb0dbb8f87fe7e5df49d6f562ccff409=
7c41f362

Thanks,
Jesse Taube

> Himanshu Chauhan (8):
>   riscv: Introduce support for hardware break/watchpoints
>   riscv: Add breakpoint and watchpoint test for riscv
>   riscv: ptrace support for hardware break/watchpoints
>   selftests/breakpoints: extend riscv test for ptrace hw
>     break/watchpoints
>   RISC-V: Add fetch and decode helpers to a common file
>   riscv: Add software supported single stepping with mc/mc6 triggers
>   perf tests: add noinline to __test_function
>   MAINTAINERS: Add entry for RISC-V Debugging
>
>  MAINTAINERS                                   |  11 +
>  arch/riscv/Kconfig                            |   3 +
>  arch/riscv/include/asm/hw_breakpoint.h        | 331 +++++++
>  arch/riscv/include/asm/insn.h                 |  15 +
>  arch/riscv/include/asm/kdebug.h               |   3 +-
>  arch/riscv/include/asm/processor.h            |  18 +
>  arch/riscv/include/uapi/asm/ptrace.h          |  50 +
>  arch/riscv/kernel/Makefile                    |   1 +
>  arch/riscv/kernel/hw_breakpoint.c             | 879 ++++++++++++++++++
>  arch/riscv/kernel/process.c                   |   5 +
>  arch/riscv/kernel/ptrace.c                    | 507 ++++++++++
>  arch/riscv/kernel/traps.c                     |   6 +
>  arch/riscv/kernel/traps_misaligned.c          |  52 +-
>  arch/riscv/lib/Makefile                       |   1 +
>  arch/riscv/lib/insn.c                         | 263 ++++++
>  include/uapi/linux/elf.h                      |   4 +
>  tools/include/uapi/linux/elf.h                |   2 +
>  tools/perf/tests/bp_signal.c                  |   2 +-
>  tools/testing/selftests/breakpoints/Makefile  |   5 +
>  .../breakpoints/breakpoint_test_riscv.c       | 769 +++++++++++++++
>  20 files changed, 2874 insertions(+), 53 deletions(-)
>  create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
>  create mode 100644 arch/riscv/kernel/hw_breakpoint.c
>  create mode 100644 arch/riscv/lib/insn.c
>  create mode 100644 tools/testing/selftests/breakpoints/breakpoint_test_r=
iscv.c
>
> --
> 2.43.0
>

