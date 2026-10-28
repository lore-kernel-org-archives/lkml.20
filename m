Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793163688;
	b=ixnZLbvG1ObnkxE6hn2ivpyOJmZrqHNs1yYhyXFC8xNOx1a8nLo9iX6D1PrkhyCrsN60
	 l0F9/2FYBWdP5knW2rzyfXvldU1EUOqpB1r21whLWIwJWB3v/wm4YM07MaQqqZokXUe7F
	 Z+7IoPm/mgPnsckGVfhujaWALiKnJ9/OqrX+U/Lrtkq51KZ6Zl2U3TZ0AhBLlkYVoBkxJ
	 XyKOncm0sdaCvTjh0hTbHJihIR7SBMgyBYYH3W9giI8K3kQ4UZ4DlGkNfXiwF4Iod4FJS
	 htkV0ZC5VRhnmWa/cauWfQoUAI2reoydMug0xNGD4/UiZYSDldhaNFH++3X8xMp0Gvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793163688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MsI8OZZh9dKz1v392dtfILjaERE3/nyinId1eBUI+OM=;
	b=q7/0Smiz9grv8WQK2u7TMJkAmN+ZyKtQHBmW+jA85aoPK3bzJGPXpIQxbbkuHQrCDuUt
	 iI0igsGFv7Da5Curmlwp6oyAw56gMsRD7CHFyS6mdUrdLSbMwtKt/euwJ1Q8srerT/tdZ
	 arw7eiNcs/YOasBSXK9ZQwG4d9g9ZOJVNPzpPoiS/HM3N+zkHcC3LD25CETxsrnC2jbzN
	 ZbK3chRaU0Frv0fyVpzYLvn9vtoSoPfbbKYMxLSn9EeYO5lnCkSPEODuJSc0zHJTvlTg4
	 f9s7COgW8bVtdRp0mfnAyyeNEl3SFKXKlWKs65frxOuWhRBdtVpV+a1cE0Y6zCi9JYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0YrwKb5+;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17D960A261D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F17D960A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0YrwKb5+
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so3990025e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793163686; x=1793768486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MsI8OZZh9dKz1v392dtfILjaERE3/nyinId1eBUI+OM=;
        b=0YrwKb5+jvPDDNM7+U5lrwnlzNjBYxvjeWxJHiksh0eQmBD4YSGwJSD7epdsbzMUHV
         VLYQBWcOsXd2QguIaPDq5LO2SUKHPS5If5gH0xbgAGqerx3VN6jvYyXkBT6EOrZmaAK1
         RspwV8mGvhNGZ4ZMMu2VfNRhzA41fVOoYFST7Gka4vceEHb4gVduEGHPKUVeStk/IwiW
         Pdh+inWUtIbg9cAO8EnAOI8lsYG5/BtV212TMf7Ek9ZRxyUe/KjD5iVF38uKM0K2Sgq7
         ed+UYJ9hB9lwPeEsOyIHk5bJk1kxggD324tx50rEm5GZC40xUc152Y/yUfC23nouTQMB
         geKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793163686; x=1793768486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsI8OZZh9dKz1v392dtfILjaERE3/nyinId1eBUI+OM=;
        b=QaLPTbaoXfyVWYNV3NMCev3qb6cBMDJ0HvivExGDGHHDZ7Ps7qH94LDVRCVR2tMEOs
         +bFeX64A1k220O4lQbvjagBj/SzijYchrfgHyFZkPSY849yIwNhgnBQofGlQhrkoIe9+
         eWumPnPhK+2+TzXGEM7xqDgP4Z0CmjoJCLNuYBSeokgbdH/a+z1tkEJxgOwDjum6Yw/s
         XYtAZBweaf+6d8J1F5eYZlJv4GroqavUFgIOAMlGENP2mwa4g7w1Cj+R0QNhSYPeLt31
         SgkUNot6Xq9OwZPYtsX681QI6dGQJq+RbWrU9+DY8If9RHNAtkgMRhR4rplO6hqV45ki
         u6Ag==
X-Forwarded-Encrypted: i=1; AKwUvBzcgDcFlHXLlRXCQlXemJERLrvmE968lLWL8DrH38kPJlag/N6PdvVh5PMEhcCQbBIJ5oZzZYt1Nv84cUk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKY//GAGaK5rM/O2QYAfcPBdesHasRTLmM8NcSt0ZXxk7KrzFZU
	TwhUD8ifZa4vpvctB+U9NoCdoIBElB7edoMbm5xDhWfqo16km/aYercU
X-Gm-Gg: AYBFou1EudSthQfCVdnyN3gajk4bQt50MEMyUK2DFjkMNwMF7eWllk5J85uvuEfccKl
	oJNA64rIz2y7lnC2miSYzT9dG2RfPHE/mPFa7nZUww0mlUoDZi/mQfvOLbP12QYiA20EDmmjgiB
	OG9n8u7JFQ4LG5W+Uv19nECYX0Y+oOAeTKk5gu/uDpYEX4TFUSRnnNUP/2Q5TJhy8V4AJq2Rntx
	S/JlYQBSP76TxFqRCQwX6EvGFuOC7kPoPJSYXEqvRLABwGf1G8lv8nb9GBo+QI1qQdvHReTTerU
	YbjNj1wTYQvtlwY/8G+AO5W/xTE2hPpn581Cr236UBf9xYk0/hT4RVxesJTQfu0e5w2xxBgl+xw
	e/cJv6itQ4XynyuRhgxA4zYUWfcKcx7Gb06vySXnrXa5b9povvuVIBM9Lc+BB+kCRiamWj4b9gK
	aNwMFa3oStN2TD13j3kSLvKWt+dLBrF+a/MPshde9PJK/lXETCEgWevri7VVJUmB/uPFZZbZkG5
	hz+XaqqmECHLixBQq04txTXc6I6YFD8G0UpEYgdac53fRiYgvolu5O7mHmcqpssItai9DRddRiU
	tzycfUuJn3PIX0iD7kd3nOERwu0FwnQJVXJpQgdR3MF4r11TBrhxodSCFCVt20sOvvu/URffPfr
	Clt0lDT+jzRWcbzlIJguZtBd5VSzZgUMhNfPUqTCKOror/q5I57fnljWrDmSp0D0DynFGN3gEOe
	RO6z6RLlXEy+Q07t48alo8NQ8c9bCFPWAKxE5RvQ==
X-Received: by 2002:a05:600c:c117:b0:4a2:cbe:beac with SMTP id 5b1f17b1804b1-4a9672f814emr15602045e9.23.1793163686125;
        Tue, 27 Oct 2026 22:01:26 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94eb8a60fsm13523365e9.3.2026.10.27.22.01.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 22:01:25 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] KVM: arm64: Preserve level IRQ re-pending
Date: Wed, 28 Oct 2026 06:01:10 +0100
Message-Id: <20261028050113.10046-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

A guest can set a level interrupt pending again while handling it. The
GIC records Active and Pending and delivers the interrupt after
deactivation. KVM instead drops the second pending state for both the
GICv2 and GICv3 backends.

The VGIC keeps software pending state outside the LR because commit
67b5b673ad4d stopped placing Pending and Active together for level
interrupts. When the LR is folded, KVM cannot distinguish the pending
state used to populate the LR from a later ISPENDR write.

Synchronize the target vCPU's LRs in vgic_mmio_write_spending() with
vgic_access_active_prepare() and vgic_access_active_finish() under
config_lock before setting pending_latch, as suggested by Oliver Upton.
When a vCPU writes its own GICR_ISPENDR0, this synchronization is a
no-op. For shared interrupts or remote redistributor writes, stopping
the guest folds any prior ack from the target vCPU's LRs before the
new pending state is recorded. In the v2 and v3 fold paths, clear
pending_latch when an LR populated for an inactive interrupt no longer
reports a pending state, and preserve a latch written while the
interrupt was active.

The last patch adds a two-vCPU GICv3 selftest covering same-vCPU and
cross-vCPU re-pending while active, as well as a cross-vCPU ISPENDR
write before the ack.

The issue was reproduced with Zephyr, NuttX and RT-Thread test harnesses
that configure an unused SPI as level-sensitive, pend it via
GICD_ISPENDR, and re-pend it once from the ISR before deactivation. On a
Raspberry Pi 400 host with a GIC-400, each GICv2 guest handled the SPI
once on the baseline and twice with the RFC fix. A native RT-Thread run
on the same GIC-400 also delivered the re-pended interrupt.

The v2 change was A/B tested with RT-Thread's direct and mailbox-pic
reproducers on Linux/KVM hosts running under QEMU TCG with GICv2 and
GICv3. The baseline lost the second event and v2 delivered it. The new
GICv3 selftest also passes in that setup. I do not have a physical GICv3
host, so the GICv3 testing is emulated.

Changes in v2:
- Synchronize target vCPU LRs in vgic_mmio_write_spending() via
  vgic_access_active_prepare() and vgic_access_active_finish() under
  config_lock instead of tracking on-LR writes with a separate
  latch_written flag (Oliver Upton).
- Extend the selftest to verify that a cross-vCPU GICD_ISPENDR write
  before the ack merges with the initial pending state without causing
  a second delivery.
- Drop RFC prefix.
- Link to v1: https://lore.kernel.org/r/20261022064628.4206-1-kmehltretter@gmail.com

Karl Mehltretter (3):
  KVM: arm64: vgic-v2: Don't drop pending writes to active level IRQs
  KVM: arm64: vgic-v3: Don't drop pending writes to active level IRQs
  KVM: selftests: arm64: Test pending writes to active level IRQs

 arch/arm64/kvm/vgic/vgic-mmio.c              |  76 +++++-----
 arch/arm64/kvm/vgic/vgic-v2.c                |  10 +-
 arch/arm64/kvm/vgic/vgic-v3.c                |  10 +-
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 140 +++++++++++++++++++
 4 files changed, 197 insertions(+), 39 deletions(-)


base-commit: dd0bc00e3e9201fd49b62ff9cc07890c89003afe
-- 
2.39.5 (Apple Git-154)

