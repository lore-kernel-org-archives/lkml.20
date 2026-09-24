Received: from mta0.migadu.com (out-83.mta0.migadu.com [91.218.175.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33333D45FA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790216617; cv=none; b=lXjk/YqkPEjtYGGKQ6FEKTXxQjvLHa/QKqnEvGB4WK70zIqtozoZxNn0KbTJePeoLBd8GdYEEp/m1vfImGJ/HprQj9vU5hI7baz9aZwcU1OK4STqgTXQRfAYq1sBz8t7OgxMfJubEjY4A2EWzOJmyTnqpAYV0ACR5URwqF4AzsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790216617; c=relaxed/simple;
	bh=dVSnRPKzueHKvn3hxd2iOxG1Y/XRDHty4kMGTAfCYuE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=M8hMAmURnM/ETDPrBF0n4Tmz5fiMy1s+JRVkZF2jDQPAFWMMW2Ert5Mem6Qn2tzAsg1gbIMyn6nfoaz1q/ulgA++B34zK5VABTVwF2wHCcQIvpRDk4BWWhTg12rT0Htn6l2MN3QVdK75Myuw8/EOxIJXcIcm3ajFj8BXOV1tAGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KV0NPMmX; arc=none smtp.client-ip=91.218.175.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KV0NPMmX"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dVSnRPKzueHKvn3hxd2iOxG1Y/XRDHty4kMGTAfCYuE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790216609; v=1; x=1790821409;
 b=KV0NPMmXKlSbD3NqqO70WLCyWuFE2YcWHiMEul4EbcdTvFLSJ6tsDgeSpbfEsUa5GCJ3sseG
 opHEeih/98a7pwSimS2iOs7k6wkO/gyLVJLua1MAdbmYof8Mw5qNsNAM2bTOGWs81DJvFXhb6oz
 UL/rHE/qYU7fqPmZXjbHU/xE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b8187a07f47f8b8e;
	Thu, 24 Sep 2026 02:23:19 +0000
X-Mizu-Trace-ID: b8187a07f47f8b8e
X-Migadu-Flow: FLOW_OUT
Message-ID: <5151137f-da51-4428-83a5-0ea355e511ca@linux.dev>
Date: Thu, 24 Sep 2026 10:23:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: cui.tao@linux.dev, Dave Young <ruirui.yang@linux.dev>,
 WANG Xuerui <kernel@xen0n.name>, kexec@lists.infradead.org,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 Haoran Jiang <jianghaoran@kylinos.cn>, George Guo <guodongtai@kylinos.cn>
Subject: Re: [PATCH] LoongArch: kdump: add arch_crash_save_vmcoreinfo()
 support
To: Yangyang Lian <lianyangyang@kylinos.cn>,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He
 <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
References: <20260923060349.146780-1-lianyangyang@kylinos.cn>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <20260923060349.146780-1-lianyangyang@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Yangyang,

在 2026/9/23 14:03, Yangyang Lian 写道:
> Since commit 23c85094fe18 ("proc/kcore: add vmcoreinfo note to
> /proc/kcore") the kernel has exported the vmcoreinfo PT_NOTE on
> /proc/kcore as wellas /proc/vmcore.
> 
> LoongArch does not provide arch_crash_save_vmcoreinfo(), so the
> arch-specific values are missing from the vmcoreinfo PT_NOTE. The
> generic exporter in kernel/vmcore_info.c already provides
> NUMBER(VMALLOC_START), but tools like crash cannot derive the module
> and vmemmap ranges, VA_BITS, or the KASLR offset of a LoongArch dump.
> 
> Since commit 18210a104bb9 ("LoongArch: Expand module virtual address
> space to 2GB") the vmalloc and module boundaries are no longer stable
> across kernel versions either, so vmcoreinfo is the only reliable
> source for them.
> 

I gave this patch a run on a Loongson-3A6000 box: built next-20260922
with it applied and booted the kernel as a KVM guest. Without the
patch /proc/kcore only has the generic fields (OSRELEASE, PAGESIZE,
NUMBER(VMALLOC_START) and the usual symbols/offsets). With it, the
note now looks like:

  OSRELEASE=7.3.0-rc4-next-20260922-eagersplit+
  PAGESIZE=16384
  NUMBER(VMALLOC_START)=0xffff800082008000
  NUMBER(VA_BITS)=47
  NUMBER(VMALLOC_END)=0xfffffebffd7f8000
  NUMBER(MODULES_VADDR)=0xffff800002008000
  NUMBER(MODULES_END)=0xffff800082008000
  NUMBER(VMEMMAP_START)=0xfffffebffe000000
  NUMBER(VMEMMAP_END)=0xfffffffffdffffff
  NUMBER(PHYS_OFFSET)=0x0
  KERNELOFFSET=0

(KASLR is off in my guest cmdline, hence KERNELOFFSET=0.)

One thing worth a look: as also pointed out in the sashiko review,
VMEMMAP_END on LoongArch is an inclusive bound (note the ...fdffffff
above), while the doc added in this patch says
VMEMMAP_START ~ VMEMMAP_END-1, and tools like makedumpfile compute
the size as VMEMMAP_END - VMEMMAP_START. So exporting VMEMMAP_END + 1
would probably match what consumers expect.

Works fine otherwise.

Tested-by: Tao Cui <cuitao@kylinos.cn>

> Provide this function in a separate file that is built at the same time
> as its caller in kernel/vmcore_info.c, and add a LOONGARCH64 section to
> Documentation/admin-guide/kdump/vmcoreinfo.rst.
> 
> Reported-by: Haoran Jiang <jianghaoran@kylinos.cn>
> Suggested-by: Haoran Jiang <jianghaoran@kylinos.cn>
> Co-developed-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: Yangyang Lian <lianyangyang@kylinos.cn>
> ---
>  .../admin-guide/kdump/vmcoreinfo.rst          | 29 +++++++++++++++++++
>  arch/loongarch/kernel/Makefile                |  1 +
>  arch/loongarch/kernel/vmcore_info.c           | 21 ++++++++++++++
>  3 files changed, 51 insertions(+)
>  create mode 100644 arch/loongarch/kernel/vmcore_info.c
> 
> diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation/admin-guide/kdump/vmcoreinfo.rst
> index 7663c610fe90..2ff921232616 100644
> --- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
> +++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
> @@ -594,3 +594,32 @@ va_kernel_pa_offset
>  
>  Indicates the offset between the kernel virtual and physical mappings.
>  Used to translate virtual to physical addresses.
> +
> +LOONGARCH64
> +===========
> +
> +VA_BITS
> +-------
> +
> +The maximum number of bits for virtual addresses. Used to compute the
> +virtual memory ranges.
> +
> +PHYS_OFFSET
> +-----------
> +
> +Indicates the physical address of the start of memory. Used to translate
> +virtual to physical addresses.
> +
> +KERNELOFFSET
> +------------
> +
> +The kernel randomization offset. Used to locate the kernel text in
> +virtual memory. If KASLR is disabled, this value is zero.
> +
> +MODULES_VADDR|MODULES_END|VMALLOC_START|VMALLOC_END|VMEMMAP_START|VMEMMAP_END
> +-----------------------------------------------------------------------------
> +
> +Used to get the correct ranges:
> +	MODULES_VADDR ~ MODULES_END-1 : Kernel module space.
> +	VMALLOC_START ~ VMALLOC_END-1 : vmalloc() / ioremap() space.
> +	VMEMMAP_START ~ VMEMMAP_END-1 : vmemmap region, used for struct page array.
> diff --git a/arch/loongarch/kernel/Makefile b/arch/loongarch/kernel/Makefile
> index 001924877772..6260c15adaba 100644
> --- a/arch/loongarch/kernel/Makefile
> +++ b/arch/loongarch/kernel/Makefile
> @@ -64,6 +64,7 @@ obj-$(CONFIG_RELOCATABLE)	+= relocate.o
>  obj-$(CONFIG_KEXEC_CORE)	+= machine_kexec.o relocate_kernel.o
>  obj-$(CONFIG_KEXEC_FILE)	+= machine_kexec_file.o kexec_efi.o kexec_elf.o
>  obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
> +obj-$(CONFIG_VMCORE_INFO)	+= vmcore_info.o
>  
>  obj-$(CONFIG_UNWINDER_GUESS)	+= unwind_guess.o
>  obj-$(CONFIG_UNWINDER_PROLOGUE) += unwind_prologue.o
> diff --git a/arch/loongarch/kernel/vmcore_info.c b/arch/loongarch/kernel/vmcore_info.c
> new file mode 100644
> index 000000000000..1128f6cdfe0d
> --- /dev/null
> +++ b/arch/loongarch/kernel/vmcore_info.c
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/vmcore_info.h>
> +#include <asm/addrspace.h>
> +#include <asm/pgtable.h>
> +#include <asm/setup.h>
> +
> +void arch_crash_save_vmcoreinfo(void)
> +{
> +	VMCOREINFO_NUMBER(VA_BITS);
> +	/* NUMBER(VMALLOC_START) is exported by the generic code */
> +	vmcoreinfo_append_str("NUMBER(VMALLOC_END)=0x%lx\n", VMALLOC_END);
> +#ifdef CONFIG_64BIT
> +	vmcoreinfo_append_str("NUMBER(MODULES_VADDR)=0x%lx\n", MODULES_VADDR);
> +	vmcoreinfo_append_str("NUMBER(MODULES_END)=0x%lx\n", MODULES_END);
> +	vmcoreinfo_append_str("NUMBER(VMEMMAP_START)=0x%lx\n", (unsigned long)vmemmap);
> +	vmcoreinfo_append_str("NUMBER(VMEMMAP_END)=0x%lx\n", VMEMMAP_END);
> +#endif
> +	vmcoreinfo_append_str("NUMBER(PHYS_OFFSET)=0x%lx\n", PHYS_OFFSET);
> +	vmcoreinfo_append_str("KERNELOFFSET=%lx\n", kaslr_offset());
> +}

