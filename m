Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794731390;
	b=F2/kT44winHjd+uZ1CZupfPE5kJEeDchcu+05JMS4PoQNay3dAK2PjmYrkchEKth5o/2
	 VLyr2VJXVira4g8yaHn/njDe4y8zU0Rpjdl11rf/gBuNK3XAB1bSCySUlk94nhg2jXAnc
	 ndff3QwN7Kg+n+uPlV/gY8AYEJZdAVZnkHmBmRaUS1FxPD8zszjcAf9obLVMfxUNjWqra
	 D3pyTyR4d70ZnNSFjvu8nLn/oBrGe1nYVKPUZysCaiCHj3aiwNiu5CnYF36eVMhH2lsmF
	 oVooPFygKWNmcovdsvpU/LoSshn3nxI+P3B9RL7UN7vLfDdnMexRBHQj5bY1wwn6y6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731390;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QzPme//cyiX49VO6uA8Flt6m5491fRh8VSxlOkepzoY=;
	b=AIlK3DJkjWHm1AXV2wdvY+ajw5JYKA2elTFRxMNvrE8Z+srJrGqq1hQ1Ezq5JVY30cKZ
	 A/FLtGFpTBtZ5gLk0xvS0K5gCqE1dtgmtP8BeHkfLsWgc2gKQ+CYsv0uo1z7bR5SmcfMR
	 XLGarzvsCVQsEdmqefLSnkW2HkwS/4eF902pDBmQrMd9eZ6c6GCVFj7Ml+A7Mg5bmD4e1
	 MnwkhURDXP5gdDJNF5QVqHAUffu20iJdAbUI5cRt7/g8tnirkfKRiC1BOgRhxda+AXW3f
	 cONAZG3WrcS7kRWZUCeqxoA5mMng8WjVcztXzqMOa/7p4JZzgHc+Cnv1El3mgELrVbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y+txibhR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF270606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y+txibhR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4977F1F000C4;
	Sun, 15 Nov 2026 08:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794731390;
	bh=QzPme//cyiX49VO6uA8Flt6m5491fRh8VSxlOkepzoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y+txibhRN/DMiOPMP2CxgHBq/Dxx/yckLFbem6Y3zqPsFSsBb73enuuGcLeZjxQlo
	 O+aflBQBktktJdWk269HxHkpawRHftRkZVtv9RD6oi9MVRy3USMt1ySEI5AwfFpLzb
	 UpHIQ8liNt2JRky7j2MkC4e+tSUZgXxbyMUknXTczUk8xs9Hg3M/Lebrg5f+Ab5A8O
	 VpMrBB8kt5Gx7S3dtP/bkJoQlc7jJ/2MRg1Z2NXQn00ODSncycqxNglDwztZ2xkVAI
	 VsaGX6yqNffTRj/3L1OeIsAagnUbs37bgRZB1+qPhC3CxjcPlxpr4NtrR+ErO+keA3
	 vOEwd+ubjwCbA==
Date: Sun, 15 Nov 2026 10:29:43 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org, chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCHv2 2/3] powerpc/execmem: Allocate kprobes insn pages from
 the modules area on book3s/32
Message-ID: <avltdwzlh07VZSFC@kernel.org>
References: <cover.1794572365.git.ritesh.list@gmail.com>
 <82c4973addebd82923c460cb44221f5b76146afe.1794572365.git.ritesh.list@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82c4973addebd82923c460cb44221f5b76146afe.1794572365.git.ritesh.list@gmail.com>

On Fri, Nov 13, 2026 at 06:01:37PM +0530, Ritesh Harjani (IBM) wrote:
> On book3s/32, a kprobe on an instruction that can't be emulated and has
> to be single stepped out of line, crashes the kernel. For e.g. with the
> following cmds...
>     ~> echo 9 > /proc/sys/kernel/printk
>     ~> mount -t debugfs debugfs /sys/kernel/debug
>     ~> echo 'p:wx filldir64+0xb8' > /sys/kernel/debug/tracing/kprobe_events
>     ~> echo 1 > /sys/kernel/debug/tracing/events/kprobes/wx/enable
>     ~> echo 1 > /sys/kernel/debug/tracing/events/kprobes/enable
> 
> ...we can see the following crash:
>     kernel tried to execute exec-protected page (f101a008) - exploit attempt? (uid: 0)
>     BUG: Unable to handle kernel instruction fetch
>     Faulting instruction address: 0xc02b919c
>     Vector: 400 (Instruction Access) at [f19a9d60]
>         pc: c02b919c: filldir64+0xb8/0x2dc
>         lr: c02b9148: filldir64+0x64/0x2dc
>         sp: f19a9e20
>        msr: 10029032
>       current = 0xc112e900
>         pid   = 102, comm = ls
>     enter ? for help
>     [f19a9e20] c1a8d420 (unreliable)
>     [f19a9e50] c02e4074 dcache_readdir+0x208/0x2a8
>     [f19a9e90] c02b8c5c iterate_dir+0x88/0x1fc
>     [f19a9ec0] c02b96e0 sys_getdents64+0x88/0x198
>     [f19a9f10] c0014400 system_call_exception+0xf8/0x20c
>     [f19a9f30] c00191ac ret_from_syscall+0x0/0x2c
>     ---- Exception: c00 (System Call) at a7596164
>     SP (af802310) is in userspace
> 
> This happens because on book3s/32 the exec permission is per segment
> (256MB), not per page. The page tables have no hardware exec bit, only
> the segment registers have a no-execute (N) bit. mmu_mark_initmem_nx()
> sets N on all the kernel segments except the ones of the modules area.
> So nothing in the vmalloc area can be executed, even when the page is
> mapped with PAGE_KERNEL_ROX or PAGE_KERNEL_EXEC, because _PAGE_EXEC is
> a software only bit there and the segment's N bit is what the MMU
> enforces.
> 
> Before commit 1b750c2fbf82 ("powerpc: extend execmem_params for kprobes
> allocations"), the kprobes insn pages came from module_alloc(). That
> commit moved them to the whole of the vmalloc space, on the grounds
> that kprobes use a breakpoint and don't need to be near the kernel
> text. That is fine on platforms where the exec permission is per page,
> as PAGE_KERNEL_ROX is then enough to make a vmalloc page executable.
> It is not on book3s/32, where the modules area is not only close to
> the kernel text but is also the only page-mapped area whose segment is
> left executable. So the insn pages must keep coming from there.
> 
> Hence, use the modules area for EXECMEM_KPROBES on book3s/32.
 
Right, I missed that on book3s/32 does vmalloc is not executable and its
protection can't be changed.

Could it be that 8xx also need a special treatment for kprobes?

> Fixes: 1b750c2fbf82 ("powerpc: extend execmem_params for kprobes allocations")
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  arch/powerpc/mm/mem.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 77b63b52d8f2..ae1bc7359353 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -391,6 +391,7 @@ struct execmem_info __init *execmem_arch_setup(void)
>  	pgprot_t kprobes_prot = strict_kernel_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
>  	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
>  	unsigned long fallback_start = 0, fallback_end = 0;
> +	unsigned long kprobes_start = VMALLOC_START, kprobes_end = VMALLOC_END;
>  	unsigned long start, end;
> 
>  	/*
> @@ -410,6 +411,11 @@ struct execmem_info __init *execmem_arch_setup(void)
>  	}
> 
>  	end = MODULES_END;
> +
> +	if (IS_ENABLED(CONFIG_PPC_BOOK3S_32)) {
> +		kprobes_start = MODULES_VADDR;
> +		kprobes_end = MODULES_END;
> +	}
>  #else
>  	start = VMALLOC_START;
>  	end = VMALLOC_END;
> @@ -428,8 +434,8 @@ struct execmem_info __init *execmem_arch_setup(void)
>  				.fallback_end	= fallback_end,
>  			},
>  			[EXECMEM_KPROBES] = {
> -				.start	= VMALLOC_START,
> -				.end	= VMALLOC_END,
> +				.start	= kprobes_start,
> +				.end	= kprobes_end,
>  				.pgprot	= kprobes_prot,
>  				.alignment = 1,
>  			},
> --
> 2.39.5
> 
> 

-- 
Sincerely yours,
Mike.
