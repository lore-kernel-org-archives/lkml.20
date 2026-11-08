Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794107732;
	b=aHpFhY1xifpWEFiOkGX7h4LJt8DAuqmuPVvLKAoAMLH7tXoIs7A3zI+H2QRQbliheZt9
	 6TpCgimKRtO67cldfbIb7kMXXzOgVQ17dw/JnZN2mIno7FXI4A3TF0YEPGHtcLXW61Bym
	 BtjThyuXaZBcIS23jB10do5bKpv/11oqvS7TG8WPsCJllvi5NSzFZ0mgvi63rpiKP13GB
	 +GnG7yw3j9IyTXnULvMN+n3iQd6BciS7dISJKtdVGjn8Abj79MM5+opCIOouoLWoXyHPI
	 ApKHIAQeDJUzhPjucscGe5DvjDUWxM2NRAf4zlNgbkmfW76n1tRIi6xdwa5Rk9RZZFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794107732;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=a/bZ5iXP4DDa9C3rE1j+9R8AKF/7AKe9/pell36SluI=;
	b=q4ZcdxCmA6ZEwE8MhR2IoXkd50qzYvz0hyLCJVBaPwgf7Cr1846iikW/A2ttJG+Y4vTr
	 8IWGd1lFK5sIZZGPUlKKdvDjBs1ZJS7N0UsTMrKg2L/q63syIq27WgTkXFBXv5C1B10nY
	 aW3rXynh949/2i+Vc76haWAhOI8O09ZnUlNQeT8X/If9kRYF8OOEwcxPONSTowRQvT9i2
	 1JE20uJbL5AHe7+3o7TVHhy8Z4oUPu69HfkqYqIIyiEG/ziM/+7Huu7fgvSvcZNtprJZO
	 UCgWIJ9d+7Bu1KTh43Ra2/9vNW1yu5U9zZvu1WmWqtuJKfx68ZQyKPTluJ79Pbrb0jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gQRE8BJc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96236606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 03:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gQRE8BJc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788341F008A3;
	Sun,  8 Nov 2026 03:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794107732;
	bh=a/bZ5iXP4DDa9C3rE1j+9R8AKF/7AKe9/pell36SluI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gQRE8BJcf8LvyLbU47fcRumukgkMk2dqVAt4858j0hUiHCefBAFkrZdi+AsmTUQpM
	 REhZREwjELCnrvmjsck9IssG56NK7j45N6PlBZwUQI4HE8GD8GThzFGrJwatPFYveQ
	 WUYJQ3kzP0NS3TlardL7VE0gJhHe+YXtLVveZ54B096kZV2NYo+n9PrdQ/Io8BHiRY
	 pwzdVWv9Dmbnmp8idhvLp37xFaPETNxvefnR5wlk+o0Pr7NiNKkKinqIL3LPiavF2l
	 kNmbqZshDFTAKlrtFQHiGT1UsyjKasBC/viuUerMhAO+8RxwoOyQyGpxQJ4H6S+SXT
	 c4/hVjEF/2okQ==
Date: Sun, 8 Nov 2026 10:55:19 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Waterman <andrew@sifive.com>,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: mm: Skip the icache flush for special PTEs
Message-ID: <au_klz4_971bxJ_c@xhacker>
References: <20261017013634.792220-1-nickolai@csail.mit.edu>
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
In-Reply-To: <20261017013634.792220-1-nickolai@csail.mit.edu>

On Fri, Oct 16, 2026 at 09:36:34PM -0400, Nickolai Zeldovich wrote:
> Mapping device memory executable crashes the kernel: an mmap() with
> PROT_EXEC of a physical range outside RAM, from /dev/mem, from a PCI
> BAR's sysfs resource file, from a frame buffer or from any driver whose
> mmap() uses remap_pfn_range(), io_remap_pfn_range() or vmf_insert_pfn(),
> oopses in flush_icache_pte() with the page table lock held; the task
> never completes its exit and its parent's wait() hangs. On QEMU virt
> with the riscv64 defconfig of v7.3-rc7, mapping the PCIe ECAM window
> from /dev/mem:
> 
> mmap(/dev/mem, phys 0x30000000, PROT_READ|PROT_EXEC, MAP_SHARED)
> Unable to handle kernel paging request at virtual address ff1c000000c00008
> Oops [#1]
> epc : flush_icache_pte+0x74/0xa0
>  ra : do_remap_pfn_range+0x2b2/0x3ee
> ...
> note: test[52] exited with preempt_count 2
> 
> With CONFIG_FLATMEM (32-bit, or a 64-bit configuration without
> SPARSEMEM) nothing faults: pte_page() of a pfn outside RAM is a pointer
> outside mem_map, and flush_icache_pte() tests and sets a bit of whatever
> memory it lands on. The privilege needed is that of the device file
> (root for /dev/mem and the PCI resource files). Present since the port
> was merged (v4.15).
> 
> __set_pte_at() calls flush_icache_pte() for every present executable
> PTE. flush_icache_pte() does the flush once per folio: it takes
> page_folio(pte_page(pte)) and tests and sets PG_dcache_clean. A special
> PTE (pte_mkspecial(), what remap_pfn_range() and vmf_insert_pfn() write
> into a VM_PFNMAP mapping) maps a frame the kernel does not manage as a
> page: there is no struct page behind it, so pte_page() returns a vmemmap
> address with no memory section, or with FLATMEM a pointer outside the
> array.
> 
> Skip the flush for special PTEs, as arm64 does since
> commit 71fdb6bf61bf ("arm64: Do not synchronise I and D caches for
> special ptes"). These mappings are device memory or buffers the kernel
> never wrote code into on the user's behalf; a user that writes code
> into one and executes it has to flush with the cache flush system
> call, as for any memory it writes itself.
> 
> Found while formally verifying remap_pte_range() against the kernel
> binary.
> 
> Fixes: 08f051eda33b ("RISC-V: Flush I$ when making a dirty page executable")
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>

this patch looks good to me, but the comment needs updating, see below
With that,
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
> 
> Notes:
>     Every pte_special() PTE goes through this path: remap_pfn_range() and
>     io_remap_pfn_range() (remap_pte_range() writes pte_mkspecial(pfn_pte())),
>     vmf_insert_pfn() (insert_pfn()), and the huge variants through
>     set_pmd_at()/set_pud_at(), which also land in __set_pte_at(). The
>     pte_special() bit is _PAGE_SPECIAL (RSW bit 8) on every riscv
>     configuration; ARCH_HAS_PTE_SPECIAL is selected unconditionally.
>     
>     Non-special PTEs are unchanged: anonymous, page cache and
>     vm_insert_page() mappings keep the per-folio flush. A RAM-backed
>     VM_PFNMAP mapping (dma_mmap_coherent() of an allocated buffer, /dev/mem
>     over RAM) loses the flush it used to get; nothing in the kernel writes
>     instructions into such a buffer for userspace to execute, and the
>     PG_dcache_clean state of those pages was never maintained for that use.
>     
>     Reproducer (QEMU virt, riscv64 defconfig, as /init with /dev/mem c 1 1
>     in the initramfs; the PCIe ECAM window is at 0x30000000, any non-RAM
>     range does):
>     
>       riscv64-linux-gnu-gcc -O2 -static -o test exec_mmio_mmap.c
>       qemu-system-riscv64 -M virt -cpu max -smp 2 -m 1G -nographic \
>           -bios /usr/share/qemu/opensbi-riscv64-generic-fw_dynamic.bin \
>           -kernel Image -initrd initramfs.cpio -append "console=ttyS0 rdinit=/init"
>     
>       unpatched: Unable to handle kernel paging request at virtual address
>                  ff1c000000c00008, epc : flush_icache_pte+0x74/0xa0,
>                  ra : do_remap_pfn_range+0x2b2/0x3ee; the task never exits
>       patched:   mapped at 0x7fffab55d000, first word 0x00081b36
>                  (the host bridge's vendor and device ID)
>     
>       #include <fcntl.h>
>       #include <stdint.h>
>       #include <stdio.h>
>       #include <stdlib.h>
>       #include <sys/mman.h>
>       #include <unistd.h>
>     
>       int main(int argc, char **argv)
>       {
>       	unsigned long phys = argc > 1 ? strtoul(argv[1], NULL, 0) : 0x30000000UL;
>       	volatile uint32_t *p;
>       	int fd;
>     
>       	fd = open("/dev/mem", O_RDONLY | O_SYNC);
>       	if (fd < 0) {
>       		perror("open /dev/mem");
>       		return 2;
>       	}
>       	printf("mmap(/dev/mem, phys 0x%lx, PROT_READ|PROT_EXEC, MAP_SHARED)\n", phys);
>       	fflush(stdout);
>       	p = mmap(NULL, 4096, PROT_READ | PROT_EXEC, MAP_SHARED, fd, phys);
>       	if (p == MAP_FAILED) {
>       		perror("mmap");
>       		return 2;
>       	}
>       	printf("mapped at %p, first word 0x%08x\n", p, p[0]);
>       	return 0;
>       }
> 
>  arch/riscv/include/asm/pgtable.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 40b1ed4f3ea8..7a4d60ccabb0 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -628,7 +628,8 @@ void flush_icache_pte(struct mm_struct *mm, pte_t pte);
>  
>  static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
>  {
> -	if (pte_present(pteval) && pte_exec(pteval))
> +	/* A special PTE has no struct page for flush_icache_pte() to track. */

what about "Special PTE mappings are not intended to be executable and
may not even have an associated struct page"?

> +	if (pte_present(pteval) && pte_exec(pteval) && !pte_special(pteval))
>  		flush_icache_pte(mm, pteval);
>  
>  	set_pte(ptep, pteval);
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
