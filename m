Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624501;
	b=lkvnVuDJZLYnvdg5/Wjw7218orDtVtBXna4WwNVFt81ma4cxhgw9hG31EDHuZOGwEwnf
	 +208zCvgWC6mqwdM07xunIMP9EzukMeseCiRUN8vmHcjRc0hM0MU4NjB0Vka3Ft8yzn71
	 yhAFwDl1jt97RUr4haYGzkKupJ8bZIWsi9gROOrhBFxMEE9Dxge9tWM9VCKManfp2409X
	 OPbobgDEOgWZTtGxpFTV+WL98qa5hVMWaGwu0HMbxHmzDmVJ1M4jdo0wRfwpj/0ed574i
	 +qR4uah3zQh3MICQazmvaouYLoKWlmb5TnsbO9WjsvCtwNF+jPs12BH1fnwNVbGDjcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624501;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=cBC7srJMZfkKBmSIaxASX5h7RvkEOMv1BFV9kmI3PJo=;
	b=rmXfEKxg9uQ7j0jYVV5SyqL4e3mVxoxM3x6mwZrykGnUdm3xNx+DP7kyWkTiWT+WP6GS
	 uiwcliaiqIHpRi4YPLlL+tE80MDr0HVcqliaNrPtVfSIqhuwOj4leHI2dOI817U8QXTDk
	 078EkxPpSU70IUnAj5VRUcv3k2WuAKo6lkrrbqzQjHWGmuwvLQmeD4gEqw1Kehl+ZqoyW
	 O47o/U/vwakN4S/3wP0KEZgwgp63xJUOMpWUEvf44YqRgT/W4uy/w/PrzYiKbYGK7h36S
	 LCcJwx5oQdEXOyxqSd4XIXYQurYxMEQALEFkKTb9SZcaZm8KxpLSntd+ltfd8upS00A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mi+ipPC1;
	arc=none smtp.remote-ip=91.218.175.231
Received: from mta0.migadu.com (out-231.mta0.migadu.com [91.218.175.231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75294606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75294606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mi+ipPC1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oaewjRBjkq9+BUbIscHYddd1XYcswqnQ9DXIMebK79Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793624498; v=1; x=1794229298;
 b=mi+ipPC16wf8eFieOnvJlUYlgPHcZj/4z7oGx4Msn6LnpF+IGVAvqNs8nX5a0l8wq7YKS+eK
 LuC39CqBdgLPiwKdEgQ3Lm589UlrXhVlH6Xh61BnkqyQbDoEnJ1ZiLigsZSnBbrN9UhIV0F9Y+k
 W5LwVYgmVJJ/eoj2Pp1x6c2Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9df1652454d8c181;
	Mon, 02 Nov 2026 13:01:38 +0000
X-Mizu-Trace-ID: 9df1652454d8c181
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	=?UTF-8?q?Bart=C5=82omiej=20Grzesik?= <bgrzesik@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Radu Rendec <radu@rendec.net>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/13] KVM: ITS hardening for pKVM
Date: Mon,  2 Nov 2026 13:01:20 +0000
Message-ID: <20261102130133.3684226-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi folks,

Changes since v2 [1]:
  - Redesigned: the takeover, the register handling, the command checks,
    and how the tables and ITTs are taken. The new design is described
    below, and each patch from v2 lists its changes below its ---.
  - Restructured the patches, merging and redoing some of them.

This is v3 of the ITS hardening series [1], which I'm carrying while
Seb is on leave. Much of the design and the code were redone, so it's
described whole here.

The ITS writes to the memory its command queue and tables point to, and
the host owns all of it, so host control of the ITS is a write
primitive into hypervisor and protected-VM memory.

When the hypervisor initialises, it takes ownership of each ITS's
control frame. Inside the stop_machine() that deprivileges the host, it
takes the command queue and tables the ITS registers point to, and the
ITTs of the devices already mapped. If that fails, no CPU is
deprivileged and KVM_CREATE_VM fails.

From then on, every host access to the control frame traps
(GITS_TRANSLATER stays host-mapped). The hypervisor checks each command
before copying it into the hardware queue, takes each ITT for as long
as its device is mapped, and writes each level-1 device table entry
only once. A command or register write it rejects aborts the host's
access.

This is the ITS part. The redistributor part follows as its own series.

A few points for discussion:

  - GICv4 is off for the host in protected mode (patch 3): the vLPI
    commands aren't emulated yet, and VMAPP's VPT_base is a host-chosen
    address the ITS and the redistributors write to. The host loses
    direct injection for its non-protected guests. The ITS part stands
    on its own, and what the host gives up is a feature that is off by
    default (kvm-arm.vgic_v4_enable).

  - The hypervisor's device tracker lives in the eight pages the driver
    gives it at setup, which hold about a thousand devices per ITS on a
    4K host. Past that, its_create_device() fails as it would on running
    out of LPIs. I've left growing it for when a platform needs more.

  - KVM doesn't initialise in protected mode on a host with more than
    eight ITSes, as each ITS takes one of the eight MMIO region slots
    (patch 9).

Tested on QEMU with a reproducer that writes to the ITS through /dev/mem
from the host's userspace, as a hostile host would. The hypervisor
rejects forged level-1 entries, out-of-range MAPTIs, MAPTIs queued after
their device's unmap and the register writes it doesn't allow, and
still forwards the commands queued before a rejected one.

A PCIe device hot-added after deprivilege, then unbound and rebound,
exercises publishing a level-1 entry and taking and releasing the ITT,
and is clean under PROVE_LOCKING. Hosts with 16K or 64K pages, or with
GICv3 and no GICv4, boot and run a non-protected guest, and
vgic_lpi_stress passes with and without pKVM.

In a debug build that caps the tracker, the driver fails the extra
device. In one that forces the takeover to fail, the host boots and
KVM_CREATE_VM fails. Not tested: hardware, two ITSes, and suspend and
resume (QEMU's PSCI has no SYSTEM_SUSPEND).

The series is structured as follows:

  01:     MMIO donation.
  02:     Taking host-registered MMIO regions at finalisation.
  03-06:  Driver preparation: GICv4 off, page-aligned ITTs, the wait
          target under the ITS lock, the shared command accessors.
  07:     Deprivileging the host under stop_machine().
  08-09:  The takeover: the driver's entry points, then the hypervisor
          trapping the control frame, taking the command queue and
          emulating GITS_CTLR and GITS_CBASER.
  10-11:  The tables and GITS_BASER<n>, then the ITTs.
  12:     Bounding the IDs that select what the ITS writes.
  13:     Documentation.

Based on v7.4-rc1.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260807164322.2970811-2-sebastianene@google.com/

Bartłomiej Grzesik (2):
  irqchip/gic-v3: Disable GICv4 features in protected KVM mode
  irqchip/gic-v3-its: Page-align ITT allocations under protected KVM

Fuad Tabba (7):
  irqchip/gic-v3-its: Compute the wait target under the ITS lock
  KVM: arm64: Share the ITS command field accessors with the hypervisor
  KVM: arm64: Deprivilege the host under stop_machine()
  KVM: arm64: Take the ITS tables and restrict GITS_BASER<n>
  KVM: arm64: Take the ITT for the lifetime of a device mapping
  KVM: arm64: Reject ITS commands whose IDs are out of range
  Documentation: KVM: arm64: Describe the ITS hardening

Mostafa Saleh (1):
  KVM: arm64: Donate MMIO to the hypervisor

Sebastian Ene (3):
  KVM: arm64: Take host-registered MMIO regions at pKVM finalisation
  irqchip/gic-v3-its: Add the protected-KVM takeover entry points
  KVM: arm64: Emulate the ITS command queue

 .../admin-guide/kernel-parameters.txt         |   8 +-
 Documentation/virt/kvm/arm/pkvm.rst           |  32 +
 arch/arm64/include/asm/kvm_asm.h              |   2 +
 arch/arm64/include/asm/kvm_hcall.h            |   2 +
 arch/arm64/include/asm/kvm_pgtable.h          |   2 +
 arch/arm64/include/asm/kvm_pkvm.h             |  16 +
 arch/arm64/kvm/arm.c                          |   4 +
 arch/arm64/kvm/hyp/include/nvhe/its_emulate.h |  16 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   5 +
 arch/arm64/kvm/hyp/nvhe/Makefile              |   3 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |   8 +
 arch/arm64/kvm/hyp/nvhe/its_emulate.c         | 777 ++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 130 ++-
 arch/arm64/kvm/hyp/nvhe/setup.c               |  22 +
 arch/arm64/kvm/hyp/pgtable.c                  |   8 +-
 arch/arm64/kvm/pkvm.c                         | 105 ++-
 arch/arm64/kvm/vgic/vgic-its.c                |  15 -
 drivers/irqchip/irq-gic-common.h              |  13 +
 drivers/irqchip/irq-gic-v3-its.c              | 256 +++++-
 drivers/irqchip/irq-gic-v3.c                  |   8 +
 include/linux/irqchip/arm-gic-v3.h            |  60 ++
 21 files changed, 1439 insertions(+), 53 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/its_emulate.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/its_emulate.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

