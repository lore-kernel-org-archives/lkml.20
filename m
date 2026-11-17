Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924960;
	b=jClXO7CPtGsEsuOoBPMKeHRCG2YfkLXgsLDUdynS4GOSn8tCnLwN6WHcVBO+16WTF7wt
	 cMs8FJrIgXDgCv3yvHaQ2zANPjM8TZhRD8YLysWoFdzDiZJy/6jHYb/PL4fPBWHn4Tpjv
	 7FpcIUdJ3WX8DW97xpWv0i4xMUb0cTLtvd2iQQeLJDqz5q5WObXf3Nt/G3J3jhws/bRfb
	 RcIguS0c1k+eQkuO/92TtTPKjh1ZBhI/EJZF988EIUU/1/kTSR3RKFU+imMaCedVH7cro
	 pHtAE6WkzLa+drbvClQbgiiEYQzs2hRNhbaLJZDmtL9Zbu61EH13P1ghyYftCbiUV5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924960;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=aeDxw0dSGGlnGghiVGMTuuktj73iHEfNfkBG2eV9bYw=;
	b=KrLyZKnYlkPch3hM8Rx8idMC2O3Zxmu6qai5cZhBIptzJIYnUOOdGUvzF5QM1z9A9W9Q
	 sPrYlgQRYQSYVAsgsh0NWEDsghtQ4c95QnwjQR7Lvk95qGVq/4wtdI29nKDnChEQTlPFa
	 4huZC87NJPcjSs0s5ZFd851DHmEMQJM52rrKm2YX2AY2CYL37YGGcPNFoQvSeomfBuVoy
	 pA2v6TE8wNxXo6y91HaORbMvgkpFIksWOHrN4ZWE77OO1ELHVGIlB+eEEj1X3TlURAPTe
	 OBTv/TZeDGFAfP77sftrgsKnrKb14anox0BtUW9VfTB9MxTnoU5JtuckXGSvVb1Jz7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dPNVH0AX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B49606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dPNVH0AX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37EA61F000C5;
	Tue, 17 Nov 2026 14:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924960;
	bh=aeDxw0dSGGlnGghiVGMTuuktj73iHEfNfkBG2eV9bYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dPNVH0AXpNFa0FHwdRr6Z7/4yi5gjZRgwUrjrosl+dKdjTIuQg8SU4HEEHC2gyMOX
	 yENh+gcRkrWW+s4t2i7YuO3yqtgPtES/VilTxpkAyhqaTjBuw9XwLFN6greIaGdFm4
	 eM51fX/Ohbr+Z3ZgEyLA5AUMH9ccjukPUPSOC/rw9pdMH7TgsLalCLKE++WXAbPpNJ
	 X5SEvuZxWXxjyT6V4ZzxRpd3Sk6lPR1PFIAVEk5Ddo/oMbbiO0UdJKBruAQMgguiIB
	 zcmjsC7jTfLIYciA/tWXFzhphB8cK712SNihWdpWjePgRx9zMqC7GzyFbnFGjlKrRS
	 fuBnc5E31Y4EQ==
Date: Tue, 17 Nov 2026 16:15:53 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCHv2 2/3] powerpc/execmem: Allocate kprobes insn pages from
 the modules area on book3s/32
Message-ID: <avxhmaXa7lsQ86EA@kernel.org>
References: <cover.1794572365.git.ritesh.list@gmail.com>
 <82c4973addebd82923c460cb44221f5b76146afe.1794572365.git.ritesh.list@gmail.com>
 <avltdwzlh07VZSFC@kernel.org>
 <f7834f3e-6c43-4b58-806d-fe4c07a93457@kernel.org>
 <avsn7Kn4a8wbB2QH@kernel.org>
 <zev77i3i.ritesh.list@gmail.com>
 <eb634d1f-cb08-44a8-88c9-e3b559c399a3@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb634d1f-cb08-44a8-88c9-e3b559c399a3@kernel.org>

On Tue, Nov 17, 2026 at 03:04:49PM +0100, Christophe Leroy (CS GROUP) wrote:
> Le 17/11/2026 à 13:33, Ritesh Harjani a écrit :
> > Mike Rapoport <rppt@kernel.org> writes:
> > 
> > > > > > Hence, use the modules area for EXECMEM_KPROBES on book3s/32.
> > > > > Right, I missed that on book3s/32 does vmalloc is not executable and its
> > > > > protection can't be changed.
> > > > > 
> > > > > Could it be that 8xx also need a special treatment for kprobes?
> > > > 
> > > > Yes indeed, not for the same reasons but because 8xx ITLB-miss handler
> > > > doesn't expect any instruction TLB miss on kernel addresses other than the
> > > > ones from the module area:
> > > > 
> > > > Commit 4afb0be7ccda ("powerpc/8xx: Avoid testing for kernel space in ITLB
> > > > Miss.")
> > > > Commit 16a71c045186 ("powerpc/8xx: Preallocate execmem page tables")
> > > > Commit 33c527522f39 ("powerpc/8xx: Inconditionally use task PGDIR in ITLB
> > > > misses")
> > 
> > Right. I looked at the above series which added all of this support [1].
> > So looks like 603 might also have this related problem (other than the
> > per segment N bit issue), since it's iTLB miss handler only walks the
> > task's PGDIR, unlike it's dTLB handler which falls back to reloading the
> > missing kernel PGD entry from swapper_pg_dir. So what I meant to say is
> > that, similar to 8xx, a new PGD entry created in the kernel's vmalloc
> > area for an insn page does not get copied over after the task is
> > created (/PGDIR allocated), on 603 as well.
> > But since MODLUES_VADDR is defined for both BOOK3S/32 and 8xx, so I guess it
> > gets covered by the same change anyways.
> > 
> > > > So at the end as MODULES_VADDR/MODULES_END only exist on book3s/32 and 8xx I
> > > > think when they exist they should be used as follows:
> > > > 
> > > > diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> > > > index b617b69452cd..856f4609c488 100644
> > > > --- a/arch/powerpc/mm/mem.c
> > > > +++ b/arch/powerpc/mm/mem.c
> > > > @@ -428,8 +428,13 @@ struct execmem_info __init *execmem_arch_setup(void)
> > > >   				.fallback_end	= fallback_end,
> > > >   			},
> > > >   			[EXECMEM_KPROBES] = {
> > > > +#ifdef MODULES_VADDR
> > > > +				.start	= MODULES_VADDR,
> > > > +				.end	= MODULES_END,
> > > > +#else
> > > >   				.start	= VMALLOC_START,
> > > >   				.end	= VMALLOC_END,
> > > > +#endif
> > > 
> > > We already have #ifdef MODULES_VADDR a few lines above, I think the
> > > assignment of kprobes_start and kprobes_end could go there instead of if
> > > (IS_ENABLED(CONFIG_PPC_BOOK3S_32)).
> > > 
> > 
> > Right. So let me use the following diff then?
> > 
> > Please let me know if this diff looks good to you? If yes, then I can
> > send a v3.
> 
> My preference would go to something similar to 'start' and 'end', no init at
> declaration, kprobes_start and kprobes_end set to VMALLOC_START/VMALLOC_END
> inside the #else

I agree, it's more consistent this way.
 
> > Also - it will be good to know if patch-1 and patch-3 looks ok too,
> > before I spin a next revision?

Both make sense to me, feel free to add my

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.
