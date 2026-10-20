Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460410;
	b=FEtWoZq1otYluhZFut+uCgxoOqp2BLIWOA8PioRwOX0TIGH6DZBAJJNWwx8h7xssOaUN
	 Gdl7uXVgjkYB2wJ1JuSC7JK8ekDw8EdApsE3sIoLqo5aYKWrMnJfeCdEMOzr9SQ444Jdt
	 zvR0t4P8k69QR+w40jorHtRchrgvbTj60DcaCYSC49wKggk8abJxHKDmOR4NH8awcXaF6
	 hTkjGdvpp1mM8RKfaZQNXfEB0K6qjt1V1z1B5TNvV9aM072fE45AuoY5NwOsaERaicSkv
	 SOaOLWipboDknxBZGpWtWQSXKlZmVN+xWtGcERp7MHtXLm9xVnTELJj3w04osYtUoHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460410;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mBl/6I4IOSTLA74DSv40eiDjHIj1nVsm5kjlfI7vITY=;
	b=gxjoB82ouHkZZ/ryPfl/5cxOI6Du8XIq23XyuGVjjK5w+tti2akkyCDrupNQpUlKoyJH
	 Ol0bFOZ5QgJkHS/hkTBRl4gNJxWUz63WreCTixayVT/tjXy9j7+5f4JkCJfbPgnIujWc+
	 1d9Q9Bita27v7rqs+4kup8s+8f2rr3X26UKT1QE8wYLmIBAb3grOfWE0QMUEHCSD1K+it
	 69RMEhPQt4ReFwR56dvhuE+/gt2Mun+54ZfxdpOGWy5RM0mQnkbikPeVGpbGPlG5AvZM+
	 tB1X6XHGVsMX6k2mHKKJSA00Mk5xpjIofS9gSM6YcwA/D3mkRnLEi7FkJqcfJ0fUD4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ogPLk0II;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12520606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ogPLk0II
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8A11F000C4;
	Tue, 20 Oct 2026 01:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792460409;
	bh=mBl/6I4IOSTLA74DSv40eiDjHIj1nVsm5kjlfI7vITY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ogPLk0IIMeO9s5iQ8iJXEV6pBDSwYjg8PK8FgvIOYCksZw30tWBExD9/mZAizetv8
	 4p9aEAntjySmIJBlh/fmrOtahPJ5ZsTk3J7m2aQpK4rStqcY0dqojylCzhQ8KzdEtL
	 iP61f9/PLvmhSPvDc8ONjwxgSLp6lHoYM/vmUe0IoVWcsyn5ZXXI3ODZAnnJ6Jee6h
	 /Qnf297/xU6UFbYbriY2jTK0d3G4Ls5mVDDyyCUocGstWKda1QYodRp+LqnsR8LpmV
	 2BhZL1hUSlEGaTe4Xq+S/+TKBZcG5krj1bC0HOPa2rdw0ATEU38voGijfvJ9NuuGBl
	 u5iyrQmOhCJFg==
Date: Tue, 20 Oct 2026 09:20:05 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Muchun Song <muchun.song@linux.dev>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: mm: Define PAGE_KERNEL_RO
Message-ID: <atbBxX-kCkB5pgsk@xhacker>
References: <20261018023649.798595-1-nickolai@csail.mit.edu>
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
In-Reply-To: <20261018023649.798595-1-nickolai@csail.mit.edu>

On Sat, Oct 17, 2026 at 10:36:49PM -0400, Nickolai Zeldovich wrote:
> Kernel mappings that generic code creates read-only are writable on
> riscv. With HugeTLB vmemmap optimization (selected by riscv and on by
> default with CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON), the tail
> vmemmap pages of every optimized huge page are remapped to one shared
> page with PAGE_KERNEL_RO so that a stray write to a tail struct page
> faults. On riscv that remap keeps _PAGE_WRITE, so such a write silently
> changes the struct pages of every optimized huge page instead.
> early_memremap_ro() (EFI system and configuration tables), the
> firmware loader's vmap() of the loaded image, and acpi_os_ioremap() for
> EFI runtime code and NOMAP regions, which asks for a read-only mapping
> precisely to avoid a writable mapping of executable code, are affected
> the same way.
> 
> riscv defines PAGE_KERNEL_READ but not PAGE_KERNEL_RO, so
> include/linux/pgtable.h falls back to "#define PAGE_KERNEL_RO
> PAGE_KERNEL". Define PAGE_KERNEL_RO as PAGE_KERNEL_READ. FIXMAP_PAGE_RO
> then follows from asm-generic/fixmap.h: early_memremap_ro() now passes
> 0xe3 instead of 0xe7 to __early_ioremap().
> 
> Tested on QEMU virt (riscv64, defconfig with
> CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON and CONFIG_PTDUMP_DEBUGFS,
> booted with hugepages=8): before, every vmemmap entry in
> /sys/kernel/debug/kernel_page_tables has W set; after, the 28K of tail
> vmemmap of each huge page is mapped R without W.
> 
> Fixes: a3c7d6b642e4 ("riscv: mm: hugetlb: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP")
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
> 
> Notes:
>     Reproducer (riscv64 defconfig + CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=y
>     CONFIG_PTDUMP_DEBUGFS=y, QEMU virt): a static /init that prints the vmemmap
>     part of the kernel page table dump.
>     
>       #include <stdio.h>
>       #include <string.h>
>       #include <sys/mount.h>
>       #include <sys/reboot.h>
>     
>       int main(void)
>       {
>       	char line[256];
>       	int in = 0;
>       	FILE *f;
>     
>       	mount("sysfs", "/sys", "sysfs", 0, NULL);
>       	mount("debugfs", "/sys/kernel/debug", "debugfs", 0, NULL);
>       	f = fopen("/sys/kernel/debug/kernel_page_tables", "r");
>       	while (f && fgets(line, sizeof(line), f)) {
>       		if (strstr(line, "---[ "))
>       			in = strstr(line, "vmemmap start") != NULL;
>       		if (in)
>       			fputs(line, stdout);
>       	}
>       	fflush(stdout);
>       	reboot(RB_POWER_OFF);
>       	return 0;
>       }
>     
>       riscv64-linux-gnu-gcc -static -O2 -o init init.c
>       qemu-system-riscv64 -M virt -cpu max -smp 2 -m 1G -nographic -kernel Image \
>         -initrd initramfs.cpio -append "console=ttyS0 hugepages=8"
>     
>     Before (all vmemmap entries writable):
>       0xff1c000002000000-0xff1c000002200000  0xbec00000  2M PTE  D A G . . W R V
>       0xff1c000002200000-0xff1c000002800000  0xbea00000  6M PMD  D A G . . W R V
>     
>     After (each huge page: 4K head W, 28K tail read-only, shared page 0x81fd0000):
>       0xff1c0000020a1000-0xff1c0000020a8000  0x81fd0000  28K PTE D A G . . . R V
>       0xff1c0000020a8000-0xff1c0000020a9000  0x81fd6000   4K PTE D A G . . W R V
>       0xff1c0000020a9000-0xff1c0000020b0000  0x81fd0000  28K PTE D A G . . . R V
> 
>  arch/riscv/include/asm/pgtable.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 40b1ed4f3ea8..13447181ceb7 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -189,6 +189,7 @@ extern struct pt_alloc_ops pt_ops __meminitdata;
>  
>  #define PAGE_KERNEL		__pgprot(_PAGE_KERNEL)
>  #define PAGE_KERNEL_READ	__pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
> +#define PAGE_KERNEL_RO		PAGE_KERNEL_READ
>  #define PAGE_KERNEL_EXEC	__pgprot(_PAGE_KERNEL | _PAGE_EXEC)
>  #define PAGE_KERNEL_READ_EXEC	__pgprot((_PAGE_KERNEL & ~_PAGE_WRITE) \
>  					 | _PAGE_EXEC)
> 
> base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
> -- 
> 2.53.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
