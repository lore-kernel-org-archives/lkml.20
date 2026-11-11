Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385669;
	b=5mmbys51u+i0hnHYfHVNFBs403ayPTaqY3tyeXgHKNoO11I5EEpaKf1Z2Kl6xsoFlW0p
	 M/a9LAwIDXzbrNz4KEzZiAp4AzXakXl6gvlalywpgoFQBwkDGYh5FXsoZWVEdpUGo2uN4
	 Y7lGR4OuUpyPWWGArx4z61zynNZKoMNn1jcPSXMtAlW+ULQp19OMcpR8RLxZzgv8tln5v
	 NKJTSdSP+eqWIwJCrS2fyoFEHz//R+4F6AOxvOYg4ZJFZFA9RihGBDwTfyhAaLlhGDoas
	 9jpSgUPe4Do9TAVDc4jFXkMHJ1BeihP7aJQu6v/RXxHo+5/FJIJg+DQe88fqKHzoKYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385669;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=N91MbDTn6PrZLQH4j0EMDImQVrWd5RIhvpEq9PwZqyU=;
	b=180W/RKR/cXJCXyohnb2WbAmjx51cF8HfmTZa3XYDd94PiZPDSRc4GMtgkuz/gRiU/bo
	 X+EIKhcEfhtwJTL3WlnqqPiNRi/UTBCJJ4IBVu/0BEz/jn9xMtEUcZhmrmToIzlIEN/CV
	 nuHJmI2AsyifIc8wsOEq7xwMNj/0x2EwzNuodiHZQHwGx0l8bGbSwJ4eEbYnDOx7/sviV
	 ToO+6qmpVN70xVlZw6La6Mm3WvIl7+JjLQoqpkcWMDC3K2AOgAb3ECe0jf+CtadZAeHXU
	 J7p6rRy2i3+/j1Pta5n/bEDiyempqks3AQ3QINqbzLi8Jia8zAkcIZEMAXcc01oiJeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fUpnCIrZ;
	arc=none smtp.remote-ip=95.215.58.207
Received: from mta1.migadu.com (out-207.mta1.migadu.com [95.215.58.207])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC2C60A261F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEC2C60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fUpnCIrZ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=o5IReJ970IqTd3Q+Wne7cEMsCpUkcKmOzJbHBxuzgfo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794385667; v=1; x=1794990467;
 b=fUpnCIrZd23Io7qMIYZ6W9iazjztqKF2N73IFzTIBAt40sA91DmxYkB16ZxQWGDpu0lLYp3f
 EQMemSIcrVbY3zJolfqBxv0N3/Baza7+YU0yucIBL22zL/YU7J1B2KBRnE5LbhNm101vNbi2dzW
 HVT0jXXk/HQ+gMuK6nmYNCSc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8550fa73e993f6e8;
	Wed, 11 Nov 2026 08:27:46 +0000
X-Mizu-Trace-ID: 8550fa73e993f6e8
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH] KVM: arm64: Sync SCTLR_EL1 before a pVM's CPU_ON reads its endianness
Date: Wed, 11 Nov 2026 08:27:46 +0000
Message-ID: <20261111082746.1064567-1-fuad.tabba@linux.dev>
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

pKVM handles a protected guest's PSCI CPU_ON at EL2 before the guest's
EL1 sysregs are saved, so kvm_vcpu_is_be() reads a stale SCTLR_EL1. A
guest that changes SCTLR_EL1.EE and calls CPU_ON before its next exit
to the host starts the target vCPU with the old endianness.

Sync SCTLR_EL1 before the read, as inject_sync64() does.

Fixes: 9d4ec80be2eb4 ("KVM: arm64: Handle PSCI calls for protected VMs at EL2")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    inject_sync64() is the only other reader on a protected guest's exit
    path of a guest-writable EL1 sysreg's copy, and it syncs that register
    first. Saving SCTLR_EL1 before the in-loop exit handlers instead would
    put the save on every protected exit for two readers. A non-protected
    guest's CPU_ON is handled by the host, after the sysregs are saved.

 arch/arm64/kvm/hyp/nvhe/pkvm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index fc0475f0877d1..e421f45383e0d 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -1321,6 +1321,9 @@ static bool pvm_psci_vcpu_on(struct pkvm_hyp_vcpu *hyp_vcpu)
 		goto error;
 	}
 
+	/* Sync SCTLR_EL1 for kvm_vcpu_is_be(), as HVCs are handled before sysregs are resync'ed. */
+	__vcpu_assign_sys_reg(&hyp_vcpu->vcpu, SCTLR_EL1, read_sysreg_el1(SYS_SCTLR));
+
 	reset_state = &target->vcpu.arch.reset_state;
 	WRITE_ONCE(reset_state->pc, smccc_get_arg2(&hyp_vcpu->vcpu));
 	WRITE_ONCE(reset_state->r0, smccc_get_arg3(&hyp_vcpu->vcpu));

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.47.3

