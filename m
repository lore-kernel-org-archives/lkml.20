Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782130;
	b=iXTl68cr/aiC0Ajs/ZuS8JHXtXD1sF6C6K2QVlmnE6+mIaHIoh6XEH3Rhvp6BQ/MJusP
	 CpnpNb7dw4Y/w6pMKh5AP1LgZ7Qqh1Al33BoNbtGMLPx1D/J44pkgDaDH0Rq7a2a3je3r
	 O3TySyNp2NucDIOIdV3iaop+7pEQcZ2wRxVNZWe5Ff8eYzfd0lhnHwvbFD++OTYTiQAs2
	 P8Dj5Eq7CMLaNgV3hs5PClq6Td6qxrvHCT1eB9m8sS7jlntkSqau2r8MSNm3hJ2kN3H33
	 nWtYMwQ5xIVl446jieFO9TVcejN0z9MqxwZX+VGNGZuD1PZ6J4UP1Kn44PnP6scLw6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782130;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=tVLelWtOiKs5gOhdKa6hRa5lDxrUmzH5vqTxLffuKAk=;
	b=tTYP5f8RLf2daRprxbFrvodI8lc+gZ8JkdT5oAzKx9I3ZI2iy8ePDiqQyBuXqjJ/3hqf
	 BlhJnEM69DXbOBGy9Giexi7/JY75HhXImk4jD4gOWpUUFAZ/oMoX8pqeGTufimiIEVfN8
	 oN02eftbitWOuOkqQ8wZeASPH6NpZlQCXVLOJvDpadyumLHNzJgv/1Dgp77ZekMz1r3OE
	 XJU5sMz7gh68xS03HvaFnKHgEq2qPtL0fCuU7+iBTaDbgwZnhzHcO4ZN/PipG/wsBaRSG
	 PuRExeEHJuCB+I3NXHSvcqvBwPT4cOUZz+rGyrqa119N45vw87x9WRk4dEAyML3aFEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YFufWwhi;
	arc=none smtp.remote-ip=91.218.175.209
Received: from mta0.migadu.com (out-209.mta0.migadu.com [91.218.175.209])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC3B606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CC3B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YFufWwhi
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Le2HnV1cWaxWKIp2IUyJdv0RZTylQe/ImxfQDvmHubg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793782127; v=1; x=1794386927;
 b=YFufWwhil8zG4Fa3kITYq+rKwV4Ack7CtQ+xPrM9cvVg58wzeiLIp5Lo1qFw/deOO5V6JwDz
 XJZz9vt5rSdTSLc4dkVk7ylGm5Q4ZosUvNWaIgf/OGq46+uLf41F1APHXRyRixWipHxHv/2fahj
 edGLy5mExidRDZqzasyUF760=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 293ca65f55a86fc9;
	Wed, 04 Nov 2026 08:48:47 +0000
X-Mizu-Trace-ID: 293ca65f55a86fc9
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/16] KVM: arm64: selftests: Tests for protected VMs
Date: Wed,  4 Nov 2026 08:48:26 +0000
Message-ID: <20261104084842.132944-1-fuad.tabba@linux.dev>
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
Content-Transfer-Encoding: 8bit

Hi folks,

This series adds selftests for protected VMs. A test skips on a host
without pKVM, and so does any case where the host doesn't have the
required feature, e.g., PtrAuth, SVE or hugetlb pages.

A couple of points:

- Each area gets its own test rather than cases folded into existing
  tests such as psci_test, hypercalls, set_id_regs, etc. A protected
  guest requires its own boot path, and has to share the ucall pool
  before its first ucall. On top of that, a protected guest gets the
  opposite result for many of those tests' checks.

- pkvm_exceptions skips its breakpoint, watchpoint and single-step cases
  while a protected guest's ID_AA64DFR0_EL1.DebugVer is 0. pkvm_id_regs
  reads the same field to choose between the hidden and the exposed
  debug view. With the patch that adds self-hosted debug to protected
  guests [1], both tests run the debug cases with no change.

The series is structured as follows:

  01:     external_aborts: an abort injected before a vCPU's first run.
  02-04:  Generic selftest changes: creating a protected VM, the pKVM
          function IDs and the ucall pool's address.
  05-06:  Protected-VM library: boot trampoline and helpers.
  07-16:  The tests, one per area.

Based on Linux 7.4-rc1 (6628e7d4c6b25).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261102093950.2922035-1-fuad.tabba@linux.dev/

Fuad Tabba (16):
  KVM: arm64: selftests: Inject an abort before a vCPU's first run
  KVM: selftests: Allow arm64 tests to create protected VMs
  tools: arm-smccc: Add the pKVM memory sharing function IDs
  KVM: selftests: Export the ucall pool's guest physical address
  KVM: arm64: selftests: Add protected-VM boot trampoline
  KVM: arm64: selftests: Add protected-VM library helpers
  KVM: arm64: selftests: Add pkvm_host_abi host-interface test
  KVM: arm64: selftests: Add pkvm_psci multi-vCPU PSCI test
  KVM: arm64: selftests: Add pkvm_mem_share hypercall test
  KVM: arm64: selftests: Add pkvm_smccc hypercall test
  KVM: arm64: selftests: Add pkvm_id_regs register and trap test
  KVM: arm64: selftests: Add pkvm_vcpu_regs register-state test
  KVM: arm64: selftests: Add pkvm_irq interrupt test
  KVM: arm64: selftests: Add pkvm_isolation host-access test
  KVM: arm64: selftests: Add pkvm_lifecycle teardown test
  KVM: arm64: selftests: Add pkvm_exceptions debug and SError test

 tools/include/linux/arm-smccc.h               |  22 +
 tools/testing/selftests/kvm/Makefile.kvm      |  12 +
 .../selftests/kvm/arm64/external_aborts.c     |  21 +
 .../selftests/kvm/arm64/pkvm_exceptions.c     | 261 ++++++++
 .../selftests/kvm/arm64/pkvm_host_abi.c       | 428 ++++++++++++
 .../selftests/kvm/arm64/pkvm_id_regs.c        | 306 +++++++++
 tools/testing/selftests/kvm/arm64/pkvm_irq.c  | 268 ++++++++
 .../selftests/kvm/arm64/pkvm_isolation.c      | 225 +++++++
 .../selftests/kvm/arm64/pkvm_lifecycle.c      | 110 +++
 .../selftests/kvm/arm64/pkvm_mem_share.c      | 394 +++++++++++
 tools/testing/selftests/kvm/arm64/pkvm_psci.c | 632 ++++++++++++++++++
 .../testing/selftests/kvm/arm64/pkvm_smccc.c  | 117 ++++
 .../selftests/kvm/arm64/pkvm_vcpu_regs.c      | 221 ++++++
 .../selftests/kvm/include/arm64/pkvm.h        |  74 ++
 .../selftests/kvm/include/ucall_common.h      |   1 +
 tools/testing/selftests/kvm/lib/arm64/pkvm.c  | 245 +++++++
 .../selftests/kvm/lib/arm64/pvm-entry.S       |  58 ++
 tools/testing/selftests/kvm/lib/kvm_util.c    |   5 +-
 .../testing/selftests/kvm/lib/ucall_common.c  |   9 +-
 19 files changed, 3406 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_exceptions.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_host_abi.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_id_regs.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_irq.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_isolation.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_lifecycle.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_mem_share.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_psci.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_smccc.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_vcpu_regs.c
 create mode 100644 tools/testing/selftests/kvm/include/arm64/pkvm.h
 create mode 100644 tools/testing/selftests/kvm/lib/arm64/pkvm.c
 create mode 100644 tools/testing/selftests/kvm/lib/arm64/pvm-entry.S


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

