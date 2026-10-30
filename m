Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334495;
	b=wLQO4mm2ya6qxi/Twk4g2acCpAcU9NFu6gtwna6KC0R4Qai+NDWOknHmmoF0n5k5jREq
	 qZ9CssE7bn4kZS1SoZehuS66A4g0GCqBt1DWzu/158a38hoE1LZU4ySAwHhAsucvVHDd1
	 eUf7wZwkcoZUsNXBH4ZRglJe/B9M13GR6wOEMl4ePMhy9BG0a/8dnlRrM8flXN7qS3ymA
	 712SdHMvpZ9Meyrg0o5CHC43AeJP+v2BjS9+yIsQG79GQxDZq1M5yairqCu0afeIu8R5q
	 G+HkUnUIuNKsxViCzT0zDVDRM8sTyGMKnnjOrK0fG/cCA7sk4ytpktRj8hS3CQ/CNAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334495;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=Wj/dMWvg+CDNhErFyJLe4n2dTXyZswYCo05dqZCmf7Y=;
	b=ZZyjO435X5a/M6iHJ4KJtr+Mv1nZcjkI5MVg448E3ZFxOK6/83CbVpXRGhbtROHg5lzM
	 vXl142KixUDikjsBn5ICqxxSWYqQEND4uBg0AYd9j5Y/5DGfq7MyYRiE4uMi1zw1+vC1K
	 dc64PpO/K9g3UdlqsGyPm8ZQA0w7X+jgqjoiW8eurxXi30t602R43KtGXjkNF0dhbn3xp
	 pUGNlX3oOGEmg5q7OldPMv3NB+Od3P8aEFM4bDgHqgKscXthBghRM6GxHtKgAf6/yKspK
	 eDOjKsAKjUDg3Wz2wJTLi+/OGEWHAJD+lDiEGIuc7XApvOdPKHmb4lVaCN/jvKZYQiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E7C606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36E7C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8AxYdHVHORqmbgaAA--.12657S3;
	Fri, 30 Oct 2026 12:28:05 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJAx3c7RHORq114xAA--.37149S2;
	Fri, 30 Oct 2026 12:28:03 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch changes for v7.4
Date: Fri, 30 Oct 2026 12:27:53 +0800
Message-ID: <20261030042753.2101956-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx3c7RHORq114xAA--.37149S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCFWkAF1DKF1DuF13AFy3WrX_yoW7Gr47pF
	W3urn3GF4UGrZxAw1Dt34Uur98tF1xCryaga4ak348CFnF9r1UZr1kXF97XF98A3y5Jry0
	qrn5Gw1jgF1UJacCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU90b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVj
	vjDU0xZFpf9x07jepB-UUUUU=

The following changes since commit c03c1a14507dfaf8b856c2608f9ac216021fc222:

  Linux 7.3 (2026-10-18 13:14:58 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-7.4

for you to fetch changes up to 6f8d12bb1a1231dbba579932772701880745a21d:

  soc: loongson: loongson2_guts: Use of_root instead of own reference (2026-10-28 15:09:27 +0800)

----------------------------------------------------------------
LoongArch changes for v7.4

1, Add LoongArch-specific ACPI initialization;
2, Set NX compat flag in PE/COFF efi header;
3, Use pa_to_nid()/nid_to_addrbase() rather than hard-code;
4, Detect and expose LAMCAS/DIV32 feature existence;
5, Fix and improve perf hardware breakpoints;
6, Fix and improve BPF JIT (trampoline and 32-bit operations);
7, Add arch_crash_save_vmcoreinfo() support;
8, Some bug fixes and other small changes.

----------------------------------------------------------------
Bibo Mao (3):
      ACPI: LoongArch: Add acpi_arch_[late]_init()
      ACPI: LoongArch: Add support for acpi_iommu_configure_id()
      MAINTAINERS: Add entry for drivers/acpi/loongarch

Binbin Zhou (1):
      soc: loongson: loongson2_guts: Use of_root instead of own reference

Heinrich Schuchardt (1):
      LoongArch: Set NX compat flag in PE/COFF efi header

Huacai Chen (5):
      Merge tag 'acpi-7.4-rc1' into loongarch-next
      LoongArch: Call cpu_final_simd() with pure_initcall()
      LoongArch: Don't init & online empty nodes
      LoongArch: Use pa_to_nid()/nid_to_addrbase() rather than hard-code
      soc: loongson: loongson2_pm: Fix build warnings for 32BIT

Krzysztof Kozlowski (1):
      LoongArch: dts: loongson-2k0500: Drop unsupported bus_id in DWMAC

Kumar Kartikeya Dwivedi (1):
      LoongArch: BPF: Fix stack arguments for indirect trampolines

Peng Fan (1):
      LoongArch: Use assign_bit() API where applicable

Rong Bao (1):
      LoongArch: Detect and expose LAMCAS feature existence

Tiezhu Yang (10):
      LoongArch: Detect and expose DIV32 feature existence
      LoongArch: Remove arch-specific __smp_mb__{before,after}_atomic()
      LoongArch: Remove redundant call in update_bp_registers()
      LoongArch: Fix bitmask corruption in update_bp_registers()
      LoongArch: Fix architectural naming typo for CSR_FWPS_SKIP
      LoongArch: Only send SIGTRAP signal if necessary in do_watch()
      LoongArch: Fix perf hardware breakpoint failure via installation
      LoongArch: Fix one-shot limitation for perf hardware breakpoints
      LoongArch: BPF: Clean up and decouple is32 parameter from move_imm()
      LoongArch: BPF: Optimize 32-bit operations using native instructions

Yangyang Lian (1):
      LoongArch: Add arch_crash_save_vmcoreinfo() support

 Documentation/admin-guide/kdump/vmcoreinfo.rst  |  36 +++
 MAINTAINERS                                     |   9 +
 arch/loongarch/Kconfig                          |   1 +
 arch/loongarch/boot/dts/loongson-2k0500-ref.dts |   2 -
 arch/loongarch/include/asm/barrier.h            |   3 -
 arch/loongarch/include/asm/cpu-features.h       |   2 +
 arch/loongarch/include/asm/cpu.h                |  66 ++--
 arch/loongarch/include/asm/hw_breakpoint.h      |   8 +-
 arch/loongarch/include/asm/inst.h               |   6 +
 arch/loongarch/include/asm/loongarch.h          |   7 +-
 arch/loongarch/include/asm/numa.h               |   2 +-
 arch/loongarch/include/asm/processor.h          |   1 +
 arch/loongarch/include/asm/switch_to.h          |   2 +-
 arch/loongarch/include/uapi/asm/hwcap.h         |   2 +
 arch/loongarch/kernel/Makefile                  |   1 +
 arch/loongarch/kernel/cpu-probe.c               |  10 +-
 arch/loongarch/kernel/efi-header.S              |   2 +-
 arch/loongarch/kernel/env.c                     |   5 +-
 arch/loongarch/kernel/hw_breakpoint.c           |  66 +++-
 arch/loongarch/kernel/irq.c                     |   3 +-
 arch/loongarch/kernel/numa.c                    |   8 +-
 arch/loongarch/kernel/proc.c                    |   4 +
 arch/loongarch/kernel/traps.c                   |  13 +-
 arch/loongarch/kernel/vmcore_info.c             |  22 ++
 arch/loongarch/net/bpf_jit.c                    | 391 +++++++++++++-----------
 arch/loongarch/net/bpf_jit.h                    |  25 +-
 arch/loongarch/pci/pci.c                        |   3 +-
 drivers/acpi/Kconfig                            |   4 +
 drivers/acpi/Makefile                           |   2 +-
 drivers/acpi/bus.c                              |   2 +
 drivers/acpi/loongarch/Kconfig                  |   7 +
 drivers/acpi/loongarch/Makefile                 |   3 +
 drivers/acpi/loongarch/init.c                   |  16 +
 drivers/acpi/loongarch/init.h                   |   5 +
 drivers/acpi/loongarch/iovt.c                   | 258 ++++++++++++++++
 drivers/acpi/scan.c                             |   3 +
 drivers/soc/loongson/loongson2_guts.c           |   9 +-
 drivers/soc/loongson/loongson2_pm.c             |   2 +-
 include/linux/acpi.h                            |   1 +
 include/linux/acpi_iovt.h                       |  13 +
 40 files changed, 753 insertions(+), 272 deletions(-)
 create mode 100644 arch/loongarch/kernel/vmcore_info.c
 create mode 100644 drivers/acpi/loongarch/Kconfig
 create mode 100644 drivers/acpi/loongarch/Makefile
 create mode 100644 drivers/acpi/loongarch/init.c
 create mode 100644 drivers/acpi/loongarch/init.h
 create mode 100644 drivers/acpi/loongarch/iovt.c
 create mode 100644 include/linux/acpi_iovt.h

