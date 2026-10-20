Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460941;
	b=lFt7Pf0ETQFmYJWiGX1RRILxHlQF+/TpUE0R8HTmlXTpaURpSlvEqKYAbwxuFOvXI0Mr
	 YcegYxQYEpr0M0VrZl3b2cWSBfED8ABaZmgm0HZYvbkngus2RphmeSXtwo4m+FEcijQsF
	 lwvhx9sS9lKFezCGwyy64LPckoKjhKbG0tvWslEFLHFgf0S22+Hpk2rPx0+4fWIRztxD1
	 nX8cTSQgIblejEB6jjSxScOChVX203802ooQxC/K0LGhGRp2o3HETNpNXWNeYUpoERGlK
	 f11ik2FoEioHRF+ZapRGdcWTDbKwWDJcfKH8QTFZROUzdKRB9OtkXL/FYfYYpro8gvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460941;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vWuv+g6YMwm8Pkj5cSlXWYyt4r7CaiX7obNleT+9GD4=;
	b=j/PGVlelUv0X6wKTr3tROgKaTSxrXaO2p5xa66L1nR/PaYqcSh+ESsjC8aWSm9zUyHb5
	 Yxn81F96QPp4o8+5ai8zueLOf2NIoJsqfTFdaIT5fLOkxM0fNcYlz85fYGUANOVCA8DLL
	 yI0mtzH2wB4w8BDJAFBPgvHv6Bj0Nh3dQuKtZMG9T6bmPMJiz1yVCgUIz9zo1sYYuHy31
	 pD3pTfSONPDeKuswGlkBB23c7MfBxOt4Mo20+ZeCHBiaRVfICWQW24G/VMjD9rLIDLeDT
	 wKF/sFHhfKxLocxIEmZH2Sjqiu9DQ8hTOXfHAhSyfmQT39t3aFzDEDj54vy/Jveyy5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c3QFRNLS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD30606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c3QFRNLS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878B11F000CC;
	Tue, 20 Oct 2026 01:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792460940;
	bh=vWuv+g6YMwm8Pkj5cSlXWYyt4r7CaiX7obNleT+9GD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c3QFRNLS/dqRYbyr0rVazlU8AkrWzxo8HLfAoWyV87M2LCrRnNLFuaKPAdOhGjBUn
	 zV3A0YSGAXqo5QuHJOmj9xd9JUWe1l4MZpaPGMR68+yByjWmKGocUlsYgKVPtAcWbc
	 CkAjwUiPeHFpcoPvWrgBH6z5R7OyXIMnyd0RtIkk3eK567SOX6ucptmlWJNzTU96Kw
	 hnQF7HfwITl0xDVLQuRJiwP7EFf2K0ac2rzM9QPR+t0g0i6GSEywYY5nl7hGVBq/1g
	 D2UJxXr40bFZSsovqZO7YqIr4rwJRNzxI8JdNjL5LkVPR1zY8pxK4dLtyIXGpptL5P
	 5uA1KWEYloS/w==
Date: Tue, 20 Oct 2026 09:28:55 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: mm: Do not make execute-only PTEs readable in
 pte_wrprotect()
Message-ID: <atbD14yBffqVLQ3Z@xhacker>
References: <20261017162229.796020-1-nickolai@csail.mit.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261017162229.796020-1-nickolai@csail.mit.edu>

On Sat, Oct 17, 2026 at 12:22:28PM -0400, Nickolai Zeldovich wrote:
> On riscv, a user page mapped execute-only becomes readable when the
> kernel write-protects its PTE. An unprivileged process that writes to
> a MAP_SHARED file mapping, changes it to PROT_EXEC with mprotect() and
> then has the page written back (msync(), or any writeback of the file)
> can read the page afterwards, although every load from it faulted
> before the writeback; the same happens to an execute-only anonymous
> THP in the parent and the child of a fork(). The mapping stays
> readable until the next mprotect(). Nothing else breaks, but
> execute-only memory loses its point: code that relies on it not being
> readable from user space can be read. This affects every kernel since
> v7.0.
> 
> Since commit 540de7ade1e1 ("riscv/mm: update write protect to work on
> shadow stacks"), pte_wrprotect() sets _PAGE_READ unconditionally, so
> that a shadow stack PTE (XWR = 010) becomes XWR = 001 rather than the
> non-leaf encoding 000. That commit assumed that every other PTE it is
> applied to already has _PAGE_READ. Execute-only PTEs (XWR = 100,
> PAGE_EXEC, used for PROT_EXEC mappings) do not, and pte_wrprotect() is
> applied to PTEs that are not writable: the writeback path
> folio_mkclean() -> page_vma_mkclean_one() write-protects every present
> PTE that is dirty or writable, and mprotect() keeps _PAGE_DIRTY in the
> PTE (_PAGE_CHG_MASK), so a written page that was made execute-only is
> turned into XWR = 101. copy_huge_pmd() write protects an anonymous huge
> PMD whether or not it is writable, through pmdp_set_wrprotect() ->
> ptep_set_wrprotect() for the parent, which open-codes the same
> expression, and pmd_wrprotect() for the child.
> 
> Set _PAGE_READ only when the PTE is writable, which is the shadow stack
> case the bit was added for (a writable PTE without _PAGE_READ is only
> ever a shadow stack PTE), and use pte_wrprotect() in
> ptep_set_wrprotect() instead of repeating the expression. For a PTE
> that is not writable pte_wrprotect() is a no-op again, as it was before
> 540de7ade1e1.
> 
> Tested under QEMU (riscv64 virt, defconfig with an ext4 disk): after
> write, mprotect(PROT_EXEC) and msync(MS_SYNC) a load from the shared
> file page succeeds without this patch and faults with it; with
> CONFIG_TRANSPARENT_HUGEPAGE the execute-only anonymous THP is readable
> after fork() without this patch and not with it.
> 
> Fixes: 540de7ade1e1 ("riscv/mm: update write protect to work on shadow stacks")
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
> 
> Notes:
>     The second hunk (ptep_set_wrprotect()) conflicts with "riscv: mm: Make
>     ptep_set_wrprotect() atomic again" (posted 2026-10-16), which already
>     computes the new PTE with pte_wrprotect(); if that patch is applied
>     first, only the pte_wrprotect() hunk of this one is needed, and the
>     fork/THP case is fixed through it.
>     
>     Reproducer (riscv64; the file case needs a block-backed filesystem such
>     as ext4, the THP case CONFIG_TRANSPARENT_HUGEPAGE; no privileges):
>     
>         /* An execute-only mapping must not become readable through writeback or fork. */
>         #include <fcntl.h>
>         #include <setjmp.h>
>         #include <signal.h>
>         #include <stdio.h>
>         #include <sys/mman.h>
>         #include <sys/wait.h>
>         #include <unistd.h>
>     
>         static sigjmp_buf env;
>     
>         static void segv(int sig)
>         {
>         	siglongjmp(env, 1);
>         }
>     
>         /* 1 if a user load from p succeeds */
>         static int readable(volatile char *p)
>         {
>         	if (sigsetjmp(env, 1))
>         		return 0;
>         	(void)*p;
>         	return 1;
>         }
>     
>         int main(int argc, char **argv)
>         {
>         	const char *path = argc > 1 ? argv[1] : "/mnt/xom";
>         	size_t thp = 2UL << 20;
>         	int fd, bad = 0;
>         	char *p, *a;
>     
>         	signal(SIGSEGV, segv);
>     
>         	/* Shared file mapping: write, make it execute-only, write back. */
>         	fd = open(path, O_RDWR | O_CREAT | O_TRUNC, 0600);
>         	if (fd < 0 || ftruncate(fd, 4096))
>         		return perror(path), 2;
>         	p = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
>         	if (p == MAP_FAILED)
>         		return perror("mmap"), 2;
>         	p[0] = 1;
>         	mprotect(p, 4096, PROT_EXEC);
>         	printf("file: before msync readable=%d\n", readable(p));
>         	msync(p, 4096, MS_SYNC);
>         	printf("file: after msync  readable=%d\n", readable(p));
>         	bad |= readable(p);
>     
>         	/* Anonymous THP: write, make it execute-only, fork. */
>         	a = mmap(NULL, 2 * thp, PROT_READ | PROT_WRITE,
>         		 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>         	a = (char *)(((unsigned long)a + thp - 1) & ~(thp - 1));
>         	madvise(a, thp, MADV_HUGEPAGE);
>         	a[0] = 1;
>         	mprotect(a, thp, PROT_EXEC);
>         	printf("thp:  before fork  readable=%d\n", readable(a));
>         	if (fork() == 0)
>         		_exit(0);
>         	wait(NULL);
>         	printf("thp:  after fork   readable=%d\n", readable(a));
>         	bad |= readable(a);
>     
>         	printf("%s\n", bad ? "FAIL: execute-only page became readable" : "PASS");
>         	return bad;
>         }
>     
>         riscv64-linux-gnu-gcc -O2 -static -o xom xom_min.c
>         ./xom /mnt/ext4/xom
>     
>     Before (mainline 70dd4ee72eb2, defconfig + THP, QEMU virt):
>         file: before msync readable=0
>         file: after msync  readable=1
>         thp:  before fork  readable=0
>         thp:  after fork   readable=1
>         FAIL: execute-only page became readable
>     
>     After:
>         file: before msync readable=0
>         file: after msync  readable=0
>         thp:  before fork  readable=0
>         thp:  after fork   readable=0
>         PASS
> 
>  arch/riscv/include/asm/pgtable.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 40b1ed4f3ea8..872b8b6a944b 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -406,7 +406,11 @@ static inline int pte_special(pte_t pte)
>  
>  static inline pte_t pte_wrprotect(pte_t pte)
>  {
> -	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
> +	/* Shadow stack is XWR = 010: keep a leaf by making it readable */
> +	if (pte_val(pte) & _PAGE_WRITE)
> +		pte = __pte(pte_val(pte) | _PAGE_READ);
> +
> +	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
>  }
>  
>  #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
> @@ -692,8 +696,7 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm,
>  	 * encoding 000b which is wrong encoding with V = 1. This should lead to page fault
>  	 * but we dont want this wrong configuration to be set in page tables.
>  	 */
> -	atomic_long_set((atomic_long_t *)ptep,
> -			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
> +	atomic_long_set((atomic_long_t *)ptep, pte_val(pte_wrprotect(read_pte)));
>  }
>  
>  #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
> 
> base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
> -- 
> 2.53.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
