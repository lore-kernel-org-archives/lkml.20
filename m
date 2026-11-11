Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405953;
	b=eOeZ06pxGL1rIgvEnDVhNPFAHwspHNdmAXk81DFXqrPjDsSPlVHhyELoFYsek+Ph7JGQ
	 83o2nllpeqNlkKrDrqejSERApuILbB4i9akUTm0hdqm4zVbfRq+mGeU5m97jAu+DsWbJh
	 fzECcyBImAdQOS7x5UsY4rO1PZwUHAFw3FnhDKyN2msj9HpLWV4zzJew18TauesAbmni9
	 rUo2fvjn5Uc4mEthqMmWiVFTOLO34mybUWo2lj8LgwOGIzVQaetqIXWFKF3CbtCP4Mf+J
	 hGUq/8mNSAP2158Y3YpHtggLlx3goO4A3L4p/PHlzw4Eri/uig8QVg/vsNGfzNrB1iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405953;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=YmrcfgcwkxKNZg0iNiiDr2NYN6573L8YQrdPEwtnUro=;
	b=nA+EL88taFz2t/iE42l4W0m/2ENfjgG7t4nqDoSO3f0SUALDgkrsnD8xFGu7D+Gjf5ec
	 3rDK0QSKdp4plIAaAvMBPQOBf4j/uZBMW7lEYmkQqMZWMEV1dl5xTvpDd5Q9teeaDjQEZ
	 b2XPYIOfbTgnzUH+PoOwuULcPLuWquE4/hhO6LLitF4m8phAmJIL1UG+dHiX3X/iwn2n0
	 0wawQw5JaxMRjzhxgm3mi3DT3IsYmb2TGti6oi7P/VBUjB/qFZdltE+wSbaOEX2KCxdjY
	 qYJjPLA7Mu/72+FaeWjsrsSQBuf1jZs4iOApNKX+71maXHj8BFGl4kLdGYIJt3smS7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252A4606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 252A4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8BxLNI8dvRq2o8eAA--.22595S3;
	Wed, 11 Nov 2026 22:05:48 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJCxtMw3dvRqALwzAA--.13124S2;
	Wed, 11 Nov 2026 22:05:47 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch fixes for v7.4-rc3
Date: Wed, 11 Nov 2026 22:05:34 +0800
Message-ID: <20261111140535.3899978-1-chenhuacai@loongson.cn>
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
X-CM-TRANSID:qMiowJCxtMw3dvRqALwzAA--.13124S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tw1DWr1ftrW3Cr1xXr4fJFc_yoW8uF4Upr
	y3uFnxGF4DGry3JrnIk34Uur15Jr1xG34fXF47Cry8CF15Ar1UJry7XrykXa4UA3yrJry0
	qF1rG3WYgF1UJagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU8CksDUUUUU==

The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:

  Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-7.4-1

for you to fetch changes up to 422e532809572ba1043192bf6a0c653bc68b3140:

  LoongArch: KVM: Reject repeated PCH-PIC CTRL_INIT (2026-11-10 17:20:42 +0800)

----------------------------------------------------------------
LoongArch fixes for v7.4-rc3

Fix several bugs about ACPI IOVT, KEXEC, Hibernation, BPF JIT and KVM.
----------------------------------------------------------------
Bibo Mao (2):
      ACPI: LoongArch: Fix incorrect pointer in acpi_iovt_init()
      ACPI: LoongArch: Add checksum validation for ACPI IOVT table

Huacai Chen (1):
      ACPI: LoongArch: Validate ACPI IOVT device entries

Jinjie Ruan (2):
      LoongArch: kexec_file: Fix a modified cmdline leak
      LoongArch: kexec_file: Fix elf_headers memory leak in retry loop

Mike Rapoport (Microsoft) (1):
      LoongArch: Restore KFENCE pages through DMW on resume

Tao Cui (3):
      LoongArch: KVM: Clear device pointer in irqchip destroy callbacks
      LoongArch: KVM: Propagate real error code in kvm_pch_pic_create()
      LoongArch: KVM: Reject repeated PCH-PIC CTRL_INIT

Tiezhu Yang (2):
      LoongArch: BPF: Make arena support depend on 128-bit cmpxchg
      LoongArch: BPF: Make use of beqz and bnez for trampoline branches

 arch/loongarch/include/asm/inst.h          | 21 +++++++++
 arch/loongarch/kernel/inst.c               | 28 +++++++++++
 arch/loongarch/kernel/machine_kexec.c      |  2 +
 arch/loongarch/kernel/machine_kexec_file.c |  4 ++
 arch/loongarch/kvm/intc/dmsintc.c          |  1 +
 arch/loongarch/kvm/intc/eiointc.c          |  1 +
 arch/loongarch/kvm/intc/ipi.c              |  1 +
 arch/loongarch/kvm/intc/pch_pic.c          | 18 +++++--
 arch/loongarch/net/bpf_jit.c               | 16 +++++--
 arch/loongarch/power/hibernate.c           |  6 +++
 drivers/acpi/loongarch/iovt.c              | 76 +++++++++++++++++++++++++-----
 11 files changed, 156 insertions(+), 18 deletions(-)

