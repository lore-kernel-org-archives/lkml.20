Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922093;
	b=pLMP3nj/pSJQ7iGJcLtjs3miIuR+lNGC9Yi0StvZI8cpZTFvemCRHC+XwfGcqOmRZjgG
	 HXYOAlZmgty5HDwX/uOYOlswgdhED/+mLhg0AOZ5107xRVr88gOt3i5sQERV7JdkecNlJ
	 6rvSo+ZC0ID+1x09VvTFFxsWYTFvSiBGvkBiS3uwqhElA3pR8GQiOsiT36TmskzJEVhMk
	 ZS8Jv2xUZuVjXxm6dxvgiOU4hZTj4kZQT13HFAtjU5qZToRsF2DF1COpqdR84j6cMZni2
	 a/fAzAqtmUJS4+dv/FW/9h+ZPumwoFF1LH3YGkSz4YkcUso8orsKemPGOQrlmh0YE6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type:Content-Transfer-Encoding;
	bh=HmHcMuLKVgfh8wwUH/FjH41O+keWBBkDEmkWD7YDblc=;
	b=e+FE4Zn+DBOy9lbh6LddStWRKBH88QWzd9yZ3G2u4KcxxxduvCmIylXko12bBi9iK6u3
	 2ulMOGg/vMDCbUTOgXl0BvWEu0EEVdAMpBs+V2Y72q62ofgDmqNaAttmucO2nJj3RCdLT
	 idhUT9482GgyqmV4QdR7xDAl3duSqombDcFa8SGod7HrLku/w9NzNQyrdw5/xzvQ6NFwK
	 46HAv+5TF8Wt9ZAZ/OXRpm4nCOkOfSw8GgpBsIxY8GAyt+HEitm27sRrlWMG5fqtHaiAO
	 5S6CMn55DICDlnZDD8lItSjFUp19iLmrVbS818d4z7atc+tYxXDVfy0kzC5dw1nO56Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rl7MA5Mf;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5977606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5977606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rl7MA5Mf
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so11730028eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794922092; x=1795526892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HmHcMuLKVgfh8wwUH/FjH41O+keWBBkDEmkWD7YDblc=;
        b=Rl7MA5Mf/iFdgqBv0Cb/cboqtSkoAej6IAlilcbNk8VtwP/SGwO9Zme0L2x3K46OhY
         5gQnzEtKrAjjstWX/DfluqRY8fBTII0Zyy8Qct5vO6uS7zCPrrmMGvVlMPhFVI6MU8oP
         w0fmoAGjhn9UEFpeMpBMEU3ZgYk2dSwALu3ygKbb+5n9cfTJtDhN/kNjsSJKwsz51fzT
         S7V7Jnqg7+nS2AJKPu4SLuD4E/Tg1PCUYozct7mF69CyoCNJzY16R6PB2Lb1oJM2Oq2Q
         zbdrM/1izgtQeB55FPXsR6xt5pNcepHorIxadKsl4EeN/aWHVbdrcW/eHB43akOpn4k3
         0VeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922092; x=1795526892;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HmHcMuLKVgfh8wwUH/FjH41O+keWBBkDEmkWD7YDblc=;
        b=J9WyQ6loSL5KqOrPkSr5DTNYyNJTpYOThnQwdef4tmjCkqGRaB/3cs3EiqXwPTYvFl
         EUdC+bHWyiLci4PtGBV/oIZibDjLTWvDIqXeyhAZZkBknAOLvicH1Ws8ArOFB+KRqhuR
         lWxWNxPHX7aO1q2dN1NolZl85orO0INOw8xaSsHe2jULPwwK5xMzf/vHKEZEFtb1q9UI
         tlOQ3djUCDof6RvN5pYPERcXLCGZoBK3qJ82B1KkKxNZ+IbK1Sr2uO35eFb527YPy32z
         9wTa3ZcowDAzlPt5FHC3gdV0Drc5qJhmZHYTc2OPyH5FGFVqP8q0DfNBSDiS+RrDUaBU
         RdiA==
X-Forwarded-Encrypted: i=1; AL+hErHpSsPCHvXnTpKPqxFMi6zs8+38QfuEVJM8ZEME4mrq/+oAfGWRiFRbfmVx5GC/jTaomthVckoDQ+9yGv4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HOSR75QWUCWHYICHKx6rxepRZ4U6tUk97HrCuwZnwETTu5t/2
	HfX8OohCIBzOUsQJAEUerAEV/SHh/8emQDTorZqeP0e4Fw8wLFUQd0ZI
X-Gm-Gg: AZFdTZcfigJ6IFged+MiAUOP9nR6JvsLiRHOUEwaTbsZGJjdfOXw5SoGgNSYkGwlpJS
	5qm9AfZJjx71HVRVhLOVAD0Ay3knF5i6mdyWAGYBRi7xXtlRJYV4GhESowE51QGcbwuRQS4fOp5
	nCDX6j3fvGwlUy5XhV2SFWIZ7NfF9QfaRopiuDD9UQTW4bSsSPyAbms0UUa5Pgn5rNX0QBEs7JM
	9Fb3XgNvo7Ve1VRvjyuXj0nL55MGRixmY6xFeI1Sg16uuqAAZD8EtO/wDx/+wEduXAeji+hcWBB
	6/XeNyCtVqUiadmHiyqoecrwcO6+/FylX5UG/Nip1vUA/hzYDUmK4mDDmeySpxPa16v/zM75Uwd
	OH70fMqUg5M2YGM+fP+w6vI7shc95ol+e3Y07gZM7eJoJoqaucMAzHYGgj8tb1WBSfUcr5kis4Y
	yA31KLllVmkqazG7cpUL6hzZFGvR/wkIxcCJ5r80k06LCDpwZC0LUyoUTjdSDGJgydX1P4YzzkZ
	27WLQHJgJ1iVEEfcton7N5l0Uc42YiBcDarcoD7ehkAEVEidbfayq/a2kYpfSsMR+jTlSu/szuD
	04o88uUUuIl47ASCpI79QX1uIxY=
X-Received: by 2002:a05:7301:d185:b0:370:1652:5ff4 with SMTP id 5a478bee46e88-37966387cb3mr12902348eec.6.1794922091687;
        Tue, 17 Nov 2026 05:28:11 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm46077098eec.28.2026.11.17.05.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:28:10 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Mike Rapoport <rppt@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCHv2 2/3] powerpc/execmem: Allocate kprobes insn pages from the modules area on book3s/32
In-Reply-To: <avsn7Kn4a8wbB2QH@kernel.org>
Date: Tue, 17 Nov 2026 18:03:37 +0530
Message-ID: <zev77i3i.ritesh.list@gmail.com>
References: <cover.1794572365.git.ritesh.list@gmail.com> <82c4973addebd82923c460cb44221f5b76146afe.1794572365.git.ritesh.list@gmail.com> <avltdwzlh07VZSFC@kernel.org> <f7834f3e-6c43-4b58-806d-fe4c07a93457@kernel.org> <avsn7Kn4a8wbB2QH@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Mike Rapoport <rppt@kernel.org> writes:

> On Mon, Nov 16, 2026 at 04:11:07PM +0100, Christophe Leroy (CS GROUP) wrote:
>> Hi Mike,
>> 
>> Le 15/11/2026 à 09:29, Mike Rapoport a écrit :
>> > On Fri, Nov 13, 2026 at 06:01:37PM +0530, Ritesh Harjani (IBM) wrote:
>> > > On book3s/32, a kprobe on an instruction that can't be emulated and has
>> > > to be single stepped out of line, crashes the kernel. For e.g. with the
>> > > following cmds...
>> > >      ~> echo 9 > /proc/sys/kernel/printk
>> > >      ~> mount -t debugfs debugfs /sys/kernel/debug
>> > >      ~> echo 'p:wx filldir64+0xb8' > /sys/kernel/debug/tracing/kprobe_events
>> > >      ~> echo 1 > /sys/kernel/debug/tracing/events/kprobes/wx/enable
>> > >      ~> echo 1 > /sys/kernel/debug/tracing/events/kprobes/enable
>> > > 
>> > > ...we can see the following crash:
>> > >      kernel tried to execute exec-protected page (f101a008) - exploit attempt? (uid: 0)
>> > >      BUG: Unable to handle kernel instruction fetch
>> > >      Faulting instruction address: 0xc02b919c
>> > >      Vector: 400 (Instruction Access) at [f19a9d60]
>> > >          pc: c02b919c: filldir64+0xb8/0x2dc
>> > >          lr: c02b9148: filldir64+0x64/0x2dc
>> > >          sp: f19a9e20
>> > >         msr: 10029032
>> > >        current = 0xc112e900
>> > >          pid   = 102, comm = ls
>> > >      enter ? for help
>> > >      [f19a9e20] c1a8d420 (unreliable)
>> > >      [f19a9e50] c02e4074 dcache_readdir+0x208/0x2a8
>> > >      [f19a9e90] c02b8c5c iterate_dir+0x88/0x1fc
>> > >      [f19a9ec0] c02b96e0 sys_getdents64+0x88/0x198
>> > >      [f19a9f10] c0014400 system_call_exception+0xf8/0x20c
>> > >      [f19a9f30] c00191ac ret_from_syscall+0x0/0x2c
>> > >      ---- Exception: c00 (System Call) at a7596164
>> > >      SP (af802310) is in userspace
>> > > 
>> > > This happens because on book3s/32 the exec permission is per segment
>> > > (256MB), not per page. The page tables have no hardware exec bit, only
>> > > the segment registers have a no-execute (N) bit. mmu_mark_initmem_nx()
>> > > sets N on all the kernel segments except the ones of the modules area.
>> > > So nothing in the vmalloc area can be executed, even when the page is
>> > > mapped with PAGE_KERNEL_ROX or PAGE_KERNEL_EXEC, because _PAGE_EXEC is
>> > > a software only bit there and the segment's N bit is what the MMU
>> > > enforces.
>> > > 
>> > > Before commit 1b750c2fbf82 ("powerpc: extend execmem_params for kprobes
>> > > allocations"), the kprobes insn pages came from module_alloc(). That
>> > > commit moved them to the whole of the vmalloc space, on the grounds
>> > > that kprobes use a breakpoint and don't need to be near the kernel
>> > > text. That is fine on platforms where the exec permission is per page,
>> > > as PAGE_KERNEL_ROX is then enough to make a vmalloc page executable.
>> > > It is not on book3s/32, where the modules area is not only close to
>> > > the kernel text but is also the only page-mapped area whose segment is
>> > > left executable. So the insn pages must keep coming from there.
>> > > 
>> > > Hence, use the modules area for EXECMEM_KPROBES on book3s/32.
>> > Right, I missed that on book3s/32 does vmalloc is not executable and its
>> > protection can't be changed.
>> > 
>> > Could it be that 8xx also need a special treatment for kprobes?
>> 
>> Yes indeed, not for the same reasons but because 8xx ITLB-miss handler
>> doesn't expect any instruction TLB miss on kernel addresses other than the
>> ones from the module area:
>> 
>> Commit 4afb0be7ccda ("powerpc/8xx: Avoid testing for kernel space in ITLB
>> Miss.")
>> Commit 16a71c045186 ("powerpc/8xx: Preallocate execmem page tables")
>> Commit 33c527522f39 ("powerpc/8xx: Inconditionally use task PGDIR in ITLB
>> misses")
>> 

Right. I looked at the above series which added all of this support [1].
So looks like 603 might also have this related problem (other than the
per segment N bit issue), since it's iTLB miss handler only walks the
task's PGDIR, unlike it's dTLB handler which falls back to reloading the
missing kernel PGD entry from swapper_pg_dir. So what I meant to say is
that, similar to 8xx, a new PGD entry created in the kernel's vmalloc
area for an insn page does not get copied over after the task is
created (/PGDIR allocated), on 603 as well.
But since MODLUES_VADDR is defined for both BOOK3S/32 and 8xx, so I guess it
gets covered by the same change anyways.

[1]: https://lore.kernel.org/linuxppc-dev/cover.1724173828.git.christophe.leroy@csgroup.eu/

>> So at the end as MODULES_VADDR/MODULES_END only exist on book3s/32 and 8xx I
>> think when they exist they should be used as follows:
>> 
>> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
>> index b617b69452cd..856f4609c488 100644
>> --- a/arch/powerpc/mm/mem.c
>> +++ b/arch/powerpc/mm/mem.c
>> @@ -428,8 +428,13 @@ struct execmem_info __init *execmem_arch_setup(void)
>>  				.fallback_end	= fallback_end,
>>  			},
>>  			[EXECMEM_KPROBES] = {
>> +#ifdef MODULES_VADDR
>> +				.start	= MODULES_VADDR,
>> +				.end	= MODULES_END,
>> +#else
>>  				.start	= VMALLOC_START,
>>  				.end	= VMALLOC_END,
>> +#endif
>
> We already have #ifdef MODULES_VADDR a few lines above, I think the
> assignment of kprobes_start and kprobes_end could go there instead of if
> (IS_ENABLED(CONFIG_PPC_BOOK3S_32)).
>

Right. So let me use the following diff then? 

Please let me know if this diff looks good to you? If yes, then I can
send a v3.

Also - it will be good to know if patch-1 and patch-3 looks ok too,
before I spin a next revision?

Thanks Christophe & Mike, for reviewing and pointing this out!


diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 77b63b52d8f2..547120a30bee 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -391,6 +391,7 @@ struct execmem_info __init *execmem_arch_setup(void)
        pgprot_t kprobes_prot = strict_kernel_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
        pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
        unsigned long fallback_start = 0, fallback_end = 0;
+       unsigned long kprobes_start = VMALLOC_START, kprobes_end = VMALLOC_END;
        unsigned long start, end;

        /*
@@ -410,6 +411,9 @@ struct execmem_info __init *execmem_arch_setup(void)
        }

        end = MODULES_END;
+
+       kprobes_start = MODULES_VADDR;
+       kprobes_end = MODULES_END;
 #else
        start = VMALLOC_START;
        end = VMALLOC_END;
@@ -428,8 +432,8 @@ struct execmem_info __init *execmem_arch_setup(void)
                                .fallback_end   = fallback_end,
                        },
                        [EXECMEM_KPROBES] = {
-                               .start  = VMALLOC_START,
-                               .end    = VMALLOC_END,
+                               .start  = kprobes_start,
+                               .end    = kprobes_end,
                                .pgprot = kprobes_prot,
                                .alignment = 1,
                        },



-ritesh


>>  				.pgprot	= kprobes_prot,
>>  				.alignment = 1,
>>  			},
>> 
>> 
>> > 
>> > > Fixes: 1b750c2fbf82 ("powerpc: extend execmem_params for kprobes allocations")
>> > > Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> > 
>> > Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> > 
>> > > ---
>> > >   arch/powerpc/mm/mem.c | 10 ++++++++--
>> > >   1 file changed, 8 insertions(+), 2 deletions(-)
>> > > 
>> > > diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
>> > > index 77b63b52d8f2..ae1bc7359353 100644
>> > > --- a/arch/powerpc/mm/mem.c
>> > > +++ b/arch/powerpc/mm/mem.c
>> > > @@ -391,6 +391,7 @@ struct execmem_info __init *execmem_arch_setup(void)
>> > >   	pgprot_t kprobes_prot = strict_kernel_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
>> > >   	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
>> > >   	unsigned long fallback_start = 0, fallback_end = 0;
>> > > +	unsigned long kprobes_start = VMALLOC_START, kprobes_end = VMALLOC_END;
>> > >   	unsigned long start, end;
>> > > 
>> > >   	/*
>> > > @@ -410,6 +411,11 @@ struct execmem_info __init *execmem_arch_setup(void)
>> > >   	}
>> > > 
>> > >   	end = MODULES_END;
>> > > +
>> > > +	if (IS_ENABLED(CONFIG_PPC_BOOK3S_32)) {
>> > > +		kprobes_start = MODULES_VADDR;
>> > > +		kprobes_end = MODULES_END;
>> > > +	}
>> > >   #else
>> > >   	start = VMALLOC_START;
>> > >   	end = VMALLOC_END;
>> > > @@ -428,8 +434,8 @@ struct execmem_info __init *execmem_arch_setup(void)
>> > >   				.fallback_end	= fallback_end,
>> > >   			},
>> > >   			[EXECMEM_KPROBES] = {
>> > > -				.start	= VMALLOC_START,
>> > > -				.end	= VMALLOC_END,
>> > > +				.start	= kprobes_start,
>> > > +				.end	= kprobes_end,
>> > >   				.pgprot	= kprobes_prot,
>> > >   				.alignment = 1,
>> > >   			},
>> > > --
>> > > 2.39.5
>> > > 
>> > > 
>> > 
>> 
>
> -- 
> Sincerely yours,
> Mike.
