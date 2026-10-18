Received: from mta0.migadu.com (out-54.mta0.migadu.com [91.218.175.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548B53630BA
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792291664; cv=none; b=uhJrhh26clyeaNzsOoCYKu49suDj+ppZrrxfMXsLAJBQJZroRi7Km8VlmwtiUP9tILza2U+MLa0HE0reCvF9a6De85qp3lJ3XoYY67bb8HFyM5GMuvijCd8CR4NnrueNZiJuv4yJ3d2++ptRkb+a1CntOXmWfD6a1vZFes51stY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792291664; c=relaxed/simple;
	bh=WxS+3TCBeYHG9YmEk6LXKBqRk8R44++B6wq4kI6AY2Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=akpRFxbTq8Uqv4iGONEmFFMu3FSgEIf598g3ByI/xMZCaGwJwUxinivAoHNHG5p+0lClh4KbPb+YJ/8NEpIInsZH/SifqBXso8GBqjt96u8bJO04dsSIXUtvrn0aFvo9O7IGhIrzSZwyFVgyVabHMccZG6O/H+4pwyn10dpa4kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Pdqa4RLF; arc=none smtp.client-ip=91.218.175.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Pdqa4RLF"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WxS+3TCBeYHG9YmEk6LXKBqRk8R44++B6wq4kI6AY2Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792291658; v=1; x=1792896458;
 b=Pdqa4RLFOnbuxY+Xb+MSWhrOPMcH7DHresjNYuviQOXB2S1RnSNPd5mKO2+GEq1g89KBAXF7
 laMS8BEg3HQYIbQ0boLUECaLfYcgGJFw+PJvEnQIOORWoWT8m+Kx2+l/MP3cHK9k/2YjX9B9U/g
 1UlvmiCZahYuGI4k0LbnHikw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 84e66a0eb75a294c;
	Sun, 18 Oct 2026 02:47:38 +0000
X-Mizu-Trace-ID: 84e66a0eb75a294c
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v1] riscv: mm: Define PAGE_KERNEL_RO
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261018023649.798595-1-nickolai@csail.mit.edu>
Date: Sun, 18 Oct 2026 10:47:24 +0800
Cc: Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A6833B23-4C60-4201-942C-5B68733866DD@linux.dev>
References: <20261018023649.798595-1-nickolai@csail.mit.edu>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 18, 2026, at 10:36, Nickolai Zeldovich <nickolai@csail.mit.edu> =
wrote:
>=20
> Kernel mappings that generic code creates read-only are writable on
> riscv. With HugeTLB vmemmap optimization (selected by riscv and on by
> default with CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON), the =
tail
> vmemmap pages of every optimized huge page are remapped to one shared
> page with PAGE_KERNEL_RO so that a stray write to a tail struct page
> faults. On riscv that remap keeps _PAGE_WRITE, so such a write =
silently
> changes the struct pages of every optimized huge page instead.

Yeah, I knew, I also have a similar fix locally to resolve this issue.

> early_memremap_ro() (EFI system and configuration tables), the
> firmware loader's vmap() of the loaded image, and acpi_os_ioremap() =
for
> EFI runtime code and NOMAP regions, which asks for a read-only mapping
> precisely to avoid a writable mapping of executable code, are affected
> the same way.

So it also does affect other components other than HVO, right?

>=20
> riscv defines PAGE_KERNEL_READ but not PAGE_KERNEL_RO, so
> include/linux/pgtable.h falls back to "#define PAGE_KERNEL_RO
> PAGE_KERNEL". Define PAGE_KERNEL_RO as PAGE_KERNEL_READ. =
FIXMAP_PAGE_RO
> then follows from asm-generic/fixmap.h: early_memremap_ro() now passes
> 0xe3 instead of 0xe7 to __early_ioremap().
>=20
> Tested on QEMU virt (riscv64, defconfig with
> CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON and =
CONFIG_PTDUMP_DEBUGFS,
> booted with hugepages=3D8): before, every vmemmap entry in
> /sys/kernel/debug/kernel_page_tables has W set; after, the 28K of tail
> vmemmap of each huge page is mapped R without W.
>=20
> Fixes: a3c7d6b642e4 ("riscv: mm: hugetlb: Enable =
ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP")

If yes, so there may be earlier, more suitable Fixes commits?

> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> ---
>=20
> Notes:
>    Reproducer (riscv64 defconfig + =
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=3Dy
>    CONFIG_PTDUMP_DEBUGFS=3Dy, QEMU virt): a static /init that prints =
the vmemmap
>    part of the kernel page table dump.
>=20
>      #include <stdio.h>
>      #include <string.h>
>      #include <sys/mount.h>
>      #include <sys/reboot.h>
>=20
>      int main(void)
>      {
>       	char line[256];
>       	int in =3D 0;
>       	FILE *f;
>=20
>       	mount("sysfs", "/sys", "sysfs", 0, NULL);
>       	mount("debugfs", "/sys/kernel/debug", "debugfs", 0, =
NULL);
>       	f =3D fopen("/sys/kernel/debug/kernel_page_tables", =
"r");
>       	while (f && fgets(line, sizeof(line), f)) {
>       		if (strstr(line, "---[ "))
>       			in =3D strstr(line, "vmemmap start") !=3D =
NULL;
>       		if (in)
>       			fputs(line, stdout);
>       	}
>       	fflush(stdout);
>       	reboot(RB_POWER_OFF);
>       	return 0;
>      }
>=20
>      riscv64-linux-gnu-gcc -static -O2 -o init init.c
>      qemu-system-riscv64 -M virt -cpu max -smp 2 -m 1G -nographic =
-kernel Image \
>        -initrd initramfs.cpio -append "console=3DttyS0 hugepages=3D8"
>=20
>    Before (all vmemmap entries writable):
>      0xff1c000002000000-0xff1c000002200000  0xbec00000  2M PTE  D A G =
. . W R V
>      0xff1c000002200000-0xff1c000002800000  0xbea00000  6M PMD  D A G =
. . W R V
>=20
>    After (each huge page: 4K head W, 28K tail read-only, shared page =
0x81fd0000):
>      0xff1c0000020a1000-0xff1c0000020a8000  0x81fd0000  28K PTE D A G =
. . . R V
>      0xff1c0000020a8000-0xff1c0000020a9000  0x81fd6000   4K PTE D A G =
. . W R V
>      0xff1c0000020a9000-0xff1c0000020b0000  0x81fd0000  28K PTE D A G =
. . . R V
>=20
> arch/riscv/include/asm/pgtable.h | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/include/asm/pgtable.h =
b/arch/riscv/include/asm/pgtable.h
> index 40b1ed4f3ea8..13447181ceb7 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -189,6 +189,7 @@ extern struct pt_alloc_ops pt_ops __meminitdata;
>=20
> #define PAGE_KERNEL __pgprot(_PAGE_KERNEL)
> #define PAGE_KERNEL_READ __pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
> +#define PAGE_KERNEL_RO PAGE_KERNEL_READ
> #define PAGE_KERNEL_EXEC __pgprot(_PAGE_KERNEL | _PAGE_EXEC)
> #define PAGE_KERNEL_READ_EXEC __pgprot((_PAGE_KERNEL & ~_PAGE_WRITE) \
> 					| _PAGE_EXEC)

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

>=20
> base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
> --=20
> 2.53.0
>=20

