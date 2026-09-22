Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EA026ED41
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790040975; cv=none; b=CA4boAABl+KIlfWViYztuk6shhZLVUUEveVMzskX4rUYHGK0Qq6h1BtUYD//Bx5PApmY9lVW05s2MibzV4cnnkK+gmJAmNGqPl2LNoUrD20WMfTidrGLtU7cw/YdhAnakzv8j7Brbqvx75yZUhSpqn4TYgngqF8S9IfiU21MgiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790040975; c=relaxed/simple;
	bh=XEOESxvM5mpVoeiFW7YvibHTQmd/mAaWdnvG2R9EN4A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NwObZixOVYX1rnnadN53ThNC/BGlEgucZ04eW2ZEZQdg0GdFFRboqr1p2Ag2/9d/g3Ob96UwR6U+2zhoJgHmgGo0DbtOfLDAevynXHD3rO/uIdXB+lmzN3aC+z/ih050LVdDRpaDt+0TGzflyICI3hfdx+NaFgXJGXvoza71XXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=mJpvDkNf; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="mJpvDkNf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:From:Reply-To;
	bh=S1EgHIylds1ROVkxx4WLm8LwHoN49L9fR7QZ0PSDjlM=; b=mJpvDkNfkVfqiiMatI5KEUuKqI
	Nk71VHx66H0j9T9L/fZnd403I9wLGzc6TUuCO9rzxO6V82sBQne0ln70rjx1C8q/sQO3kafqcWwqr
	vOIzMoQ4aWA3HlxxsLi3WqfzLmxQxm5YeYRgNjYl4iDammiYbdGcyCGH4xTnXmlF5wdRZTmTRzSBV
	aQgmksxVJnZPQ2eihbLUNnsWosZrr/vXGI86fPFcyVU9o1Hlfkja/6nGtVGe+F861XohfkfRImSU0
	iAlEXVy+0dsFMJx8b6gywB/MkUqcMk1eSJ4u05ILjaAmHF/UzUSFGjQSt03XYpvfI7M8+IJbTK1JS
	IiVlsSGg==;
Received: from 186-249-150-130.shared.desktop.com.br ([186.249.150.130] helo=[127.0.1.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x8pQL-005NkF-NW; Tue, 22 Sep 2026 03:35:58 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Subject: [PATCH v10 0/4] x86/pvh: fix unbootable VMs again (PVH + KASAN)
Date: Mon, 21 Sep 2026 22:36:31 -0300
Message-Id: <20260921-pvh-kasan-inline-v10-0-08da47943d8e@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ/bsWoC/33SwW7DIAwA0F+pOI8JDNhhp/3HtAMhpkXrkiqZo
 k1V/320l0QD7WhLfrZlX8XCc+ZFvByuYuY1L3kaS6DV00HEUxiPLPNQEgIUoLIA8rKe5EdYwij
 zeM4jS+QUIlHSPZAoZZeZU/5+mG/vJT7l5Wuafx4tVn3P/oOtWipJjNpbY2308JqP4ZzDc5w+x
 V1bYS9QQ4AiQHTUd0NMCUMlmE1woBqCKULPAxP6iBypEuxewIZgixCMVowBHMehEtwmoGnN4Ir
 gIKToyffc6UrATSClGwLetwjeK+uGFHyqBNoJ0BKoCKYrAwSnIidVCd1eMA2hK0LUCSFqh8nV1
 /Sb0DX/wReBSXEyPbn+zzVvt9svp9zQCcICAAA=
X-Change-ID: 20260422-pvh-kasan-inline-6efac77f1b27
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2

The issue of unbootable VMs with CONFIG_PVH due to CONFIG_KASAN is back.

Booting directly from vmlinux (instead of bzImage) now fails with gcc-14/15
(but works with gcc-12/13) if CONFIG_KASAN_GENERIC is set, on Ubuntu 25.10.

The PVH code is required/supposed not to use the KASAN memory access check
in the kernel entry point as KASAN has not yet been setup, or an exception
is hit and the boot fails.

This was previously described and addressed with __builtin_mem{cmp,set}():
- commit 661362e3dcab ("xen, pvh: fix unbootable VMs (PVH + KASAN - AMD_MEM_ENCRYPT)")
- commit 416a33c9afce ("x86/cpu: fix unbootable VMs by inlining memcmp() in hypervisor_cpuid_base()")
- commit fbe5a6dfe492 ("xen, pvh: fix unbootable VMs by inlining memset() in xen_prepare_pvh()")

However, even with __builtin the compiler may decide to use the out of line
function instead of the inline implementation. So, that does not really fix
the issue unconditionally; see details below.

In order to address this, it's required to switch to inline implementations
that do not depend on the compiler.

There's such a memset() in <asm/string.h> and memcmp() in 'boot/string.c'.
Use them instead of builtins in PVH entry.

Testing:

- Booting from vmlinux (fixed) and bzImage (still works) using
  allnoconfig + CONFIG_PVH + CONFIG_KASAN with gcc-12/13/14/15.

- Building with CONFIG_KEXEC_FILE, CONFIG_CFI and !CONFIG_KASAN with LLVM 20
  (check for a build error not caught previously).

Details/Debugging:

- Only CONFIG_PVH (works):

  make allnoconfig
  ./scripts/config \
    -e 64BIT -e HYPERVISOR_GUEST -e PVH \
    -e SERIAL_8250 -e SERIAL_8250_CONSOLE
  make olddefconfig
  make -j$(nproc) vmlinux

  qemu-system-x86_64 \
    -accel kvm -nodefaults -nographic -serial stdio \
    -kernel vmlinux -append 'console=ttyS0'
  ...
  SeaBIOS (version ...)
  Booting from ROM...
  Linux version ...
  ...
  <Ctrl-C>

- With CONFIG_KASAN (fails)

  ./scripts/config -e KASAN
  make olddefconfig
  make -j$(nproc) vmlinux

  qemu-system-x86_64 \
    -accel kvm -nodefaults -nographic -serial stdio \
    -kernel vmlinux -append 'console=ttyS0'
  ...
  SeaBIOS (version ...)
  Booting from ROM...
  <QEMU reboot loop, flashing the text above>

- Debugging:

  Enable debug info and rebuild.

  QEMU: enable and wait for GDB, stop rebooting, remain running.

  qemu-system-x86_64 \
    -s -S -no-reboot -no-shutdown \
    <other options>

  gdb vmlinux
  (gdb) target remote localhost:1234
  ...
  (gdb) c
  ...
  Thread 2 received signal SIGQUIT, Quit.
  ...
  (gdb) info threads
    Id   Target Id                    Frame
    1    Thread 1.1 (CPU#0 [running]) bytes_is_nonzero (
      start=0xfffffbfff031eebe <error: Cannot access memory at address 0xfffffbfff031eebe>, size=1)
      at .../linux/mm/kasan/generic.c:98
  * 2    Thread 1.2 (CPU#1 [halted ]) 0x00000000000fd0a9 in ?? ()
  ...
  (gdb) thr 1
  ...
  (gdb) bt
  #0  bytes_is_nonzero (start=0xfffffbfff031eebe <error: Cannot access memory at address 0xfffffbfff031eebe>, size=1)
      at .../linux/mm/kasan/generic.c:98
  #1  memory_is_nonzero (start=0xfffffbfff031eebe, end=0xfffffbfff031eebf) at .../linux/mm/kasan/generic.c:115
  #2  memory_is_poisoned_n (addr=0xffffffff818f75f0, size=8) at .../linux/mm/kasan/generic.c:140
  #3  memory_is_poisoned (addr=0xffffffff818f75f0, size=8) at .../linux/mm/kasan/generic.c:172
  #4  check_region_inline (addr=0xffffffff818f75f0, size=8, write=false, ret_ip=18446744071585002062)
      at .../linux/mm/kasan/generic.c:191
  #5  kasan_check_range (addr=addr@entry=0xffffffff818f75f0, size=size@entry=8, write=write@entry=false,
      ret_ip=18446744071585002062) at .../linux/mm/kasan/generic.c:200
  #6  0xffffffff813eb283 in __asan_loadN (addr=addr@entry=0xffffffff818f75f0, size=size@entry=8)
      at .../linux/mm/kasan/generic.c:278
  #7  0xffffffff815df24e in memcmp (cs=cs@entry=0xffffffff818f75f0, ct=ct@entry=0x1be2fe4, count=<optimized out>,
      count@entry=12) at .../linux/lib/string.c:683
  #8  0xffffffff81ba2323 in cpuid_base_hypervisor (sig=0xffffffff818f75f0 "XenVMMXenVMM", leaves=2)
      at .../linux/arch/x86/include/asm/cpuid/api.h:206
  #9  xen_cpuid_base () at .../linux/arch/x86/include/asm/xen/hypervisor.h:46
  #10 xen_prepare_pvh () at .../linux/arch/x86/platform/pvh/enlighten.c:119
  #11 0x0000000001ba2588 in ?? ()
  #12 0x0000000000000000 in ?? ()
  (gdb)

  Frames #7-#8 show the non-builtin memcmp() (lib/string.c) was called
  even with __builtin_memcmp() being used in cpuid_base_hypervisor().

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
Changes in v10:
- Patch 1:
  - retain the "cc" clobber commented out (Borislav Petkov)
  - explain based on compiler implementation, not documentation (Borislav Petkov, Michael Matz)
- Patch 2:
  - remove single quotes from filenames in commit message (Borislav Petkov)
  - simplify function comment (Borislav Petkov)
- Patch 4:
  - combine Patch 5 from v9 (Borislav Petkov)
  - update function name: s/hypervisor_base_cpuid/cpuid_base_hypervisor/g
  - slightly modify the commit message.
- Link to v9: https://lore.kernel.org/r/20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com

Changes in v9:
- Patch 1: new patch in v9 to fix the patch submitted separately in v8.
- Rebased to next-20260821.
- Link to v8: https://lore.kernel.org/r/20260723-pvh-kasan-inline-v8-0-c1f62c156f52@igalia.com

Changes in v8:
- Patch 2 in v7 was submitted separately as requested, and the
  rest of this series was rebased on top of it (Borislav Petkov).
  Link: https://lore.kernel.org/all/20260723-x86-memcmp-asm-v2-1-d93ecb43797f@igalia.com/
- Patch 2 in v8:
  - Mention 'No functional changes' (Borislav Petkov).
  - Remove comment at the top of the header (Borislav Petkov).
- Link to v7: https://lore.kernel.org/r/20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com

Changes in v7:
- Patch 2 (added):
  - Address pre-existing issues in 'asm' (Borislav Petkov, Sashiko).
- Link to v6: https://lore.kernel.org/r/20260701-pvh-kasan-inline-v6-0-ba99045dfa9f@igalia.com

Changes in v6:
- Patch 1:
  - Explain the return value difference between __inline_memcmp() and memcmp().
- Patch 2 (added):
  - Group __inline string functions in <asm/shared/string.h>.
- Link to v5: https://lore.kernel.org/r/20260630-pvh-kasan-inline-v5-0-52afc979be81@igalia.com

Changes in v5:
- Create a minimal separate header in <asm/shared/string.h> instead,
  to be used by 'boot/setup.c' and <asm/string.h> (Borislav Petkov).
- Patch 1 (in v4/v3) is no longer needed; removed.
- Patch 1 (in v5):
  - Briefly mention there are issues with <asm/string.h>.
  - Remove 'Reviewed-by: Jurgen Gross' to be conservative
    (same code change and result, but the means changed).
- Link to v4: https://lore.kernel.org/r/20260526-pvh-kasan-inline-v4-0-a310e6a25ecd@igalia.com

Changes in v4:
- Patch 1: address Juergen's feedback:
  - s/In next patch/In a future patch/.
  - Move footnote (Reasons not to include...) after "---".
- Add 'Reviewed-by: Juergen Gross' in patches 1 and 2 as well.
- Link to v3: https://lore.kernel.org/r/20260520-pvh-kasan-inline-v3-0-bede769c6ec7@igalia.com

Changes in v3:
- Create and use a separate header for inline string functions
  to fix a build error reported by kernel test robot (patch 1).
- That also removes '#ifndef _SETUP/#endif' in <asm/string.h>.
- Link to v2: https://lore.kernel.org/r/20260427-pvh-kasan-inline-v2-0-2c57b8dcff6a@igalia.com

Changes in v2:
- Add comment about the return value of __inline_memcmp() in patch 1. (v3: now 2)
- Add 'Reviewed-by: Juergen Gross' in patches 2 and 3 (v3: now 3 and 4).
- Link to v1: https://lore.kernel.org/r/20260422-pvh-kasan-inline-v1-0-7e6194344c92@igalia.com

---
Mauricio Faria de Oliveira (4):
      x86/boot: comment out and document redundant "cc" clobber in memcmp()
      x86/asm, x86/boot: expose inline memcmp()
      x86/asm: group inline string functions
      x86/cpuid: fix unbootable VMs by really inlining memcmp() in cpuid_base_hypervisor() and xen_prepare_pvh()

 arch/x86/boot/string.c               | 13 ++-------
 arch/x86/include/asm/cpuid/api.h     |  2 +-
 arch/x86/include/asm/shared/string.h | 52 ++++++++++++++++++++++++++++++++++++
 arch/x86/include/asm/string.h        | 21 +--------------
 arch/x86/platform/pvh/enlighten.c    |  3 ++-
 5 files changed, 58 insertions(+), 33 deletions(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260422-pvh-kasan-inline-6efac77f1b27

Best regards,
-- 
Mauricio Faria de Oliveira <mfo@igalia.com>

