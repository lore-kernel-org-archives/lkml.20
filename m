Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651602;
	b=z85ZNP9xduXt//7YSPO8jPKUp6Fl9V0WE5g6kRWV3nYJvtoYDu6h/ihaN+km3tTLJgg4
	 cNTvyZBUu7BxE4jLlYfzknbQInTRsCH1ROSdYYlgqgv6WzuojOWn/91yOBQg/6UodXtir
	 COUCeApmZIjJOojZNmTCMiCKa47NlMeoGPBPhpGr/0j3915rL5BZ1HRSt/mtUmKBu0sue
	 ywJtm1rVjPs+mvqeReSzoA8GxBa77x5cegyssAhmEkgar1k4t7MUGb1gLIwHGeFYZFWXn
	 YkV5aC4MW+4t3C+vCKP3sQnCXnzY5cCki2Ba8m4WMq6af5dpwg8OZGlWywqdjZcMSww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6hyPiRO1YLgh5z7vpK+8rbMGtfzuaM8kNLxgiQL1q1o=;
	b=2MDhkZSlpLF+NhAhlENoEkbUIm/9dCk1swZAQsCv6j5nwAPg6kwMGA89xE9QNvPpzuk9
	 E4FtPHNJQXqTXOzUP6nWZ3RC+C+AVB8Jp5a39Kky9xZ6nJoRpf4NTf+FwIJZ7VUpHNcnL
	 38G765srUQaLfsv0xpil+u/nuobMfgqBAilkdmSei9VVcCRnxdYLfwvZ45IMB/L4KOxdk
	 HjEF+EJP6BM7xkan7B81Y+PJqU9L8SfODERzy9+WtI2XPiNxkScc7gIvWBSPCM1bAOsZJ
	 Df6K42wBhAFwmtvoQYOIzjvzlwDo25RfMYnNDtTfHTxVPXC+pGgdilHqFgwoSpTOIDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mMySRvdX;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DC3606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71DC3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mMySRvdX
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b001cd92bso824517f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651601; x=1793256401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hyPiRO1YLgh5z7vpK+8rbMGtfzuaM8kNLxgiQL1q1o=;
        b=mMySRvdXD81ZSX+EmqQQax9e08NSFdSVvtDJrnGftqpYE6a93r82F63dH+Tkd82jBa
         GgT4Zfv95T4LDj5VnmnNA3YjHSyHe1Dis7FTnnCqLkIFJzWQ+ssLIr/8glFXUkVq8GiC
         R31Axf1dUG3ksK5Wx3Hjsi9avVUsruDwwp7gES60syWHlxFTaW3R5tP2HEVnx1VerfaH
         t67nu3Emp5dluNDA94fEcxvq40FUhc7PGWdk81mljEP9ws44z9qurveXPhSJ4hFxh4Tp
         +ISKJsbRnJ9DK9K30cf2orP0ykx7QykPP0+pb89/nF4M+fNz6ZsX80CC9opqF8AZ4McP
         trzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651601; x=1793256401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hyPiRO1YLgh5z7vpK+8rbMGtfzuaM8kNLxgiQL1q1o=;
        b=pnqBgGvnmGqdqr5zvpkNmiP3HFlBXNqmy4f7jL5+rld60zFlA97Ith42q+Wt07ulPr
         0xb6z/6ZfUAqCiWMduuRawShSTsPyYayALjVQwJTn+AbTiazzfPnTE1NAT7yXZzAhy+k
         T5vsiAx/XcT1bQAVbkDa4mXoFmoqhTIiAtvokaluDjPiA/fiK89wqkTHK7qTDQfflEsm
         EMfsx6pFKu/GhIde2egT1+8IMhhg00UHa9V5sZdPuKlMxA6bXHGYOa8QRznSzxAuZp4L
         3aI3pyS3RQH2/hB6Fk3MOqeyQu8+mygIZpLI6n1ltHcKd/FtNN7/t3gg6YhCSB6TS1E+
         PJiA==
X-Forwarded-Encrypted: i=1; AKwUvBwblhEvZJO9rrAUtHZ5/A49umzW8AvsIu/miXxomSCG50/zgrEkcs3cA90zInRPnYYHLmbofbWVM2ueXiU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+r72tq7u2u2kKp4ymI/5coG751CyPTVHSPZCrFfUzq3GnNv2v
	Wuc40eLTcP6W/zz7m1UvGGmYHQP3sWdXPF9e5i39xSsH2YRsw27KBm2e
X-Gm-Gg: AYBFou1LOYBTxhXGtUmiJWa3B5zNOgUgeF2RNvsBtqt03KCfWbuZR+b3It0BhijZHMQ
	WWElklOBllrsjIGdrt4yKwIyODcBvYQIFCei6VfeCCMSLMFptyYrLvIvwL+mLM07iAL0isWGpOG
	Q3tqPFZx9uc0Zf9T/jC8cEw43lE9zqUF+yv0MInGfWWXnrKTe+lZTNAG+eg/gimo1CDwGnNMbTw
	UXlDIh1d5z+d7PhDz+UVGCfZbFJluPSzD7A1csxeAvDhzYK4MrfBlCoguG3rR/yaXGOee+G+uRW
	58i6Vkrho5GS3z3rHaQjvUMEe6W05q7oTCuG9NXR/WO4uk/Nwata9CMWgTGTh6RYXJ8OuAn/x7i
	sqOe1458szOdTSIEfrNqBUA3jxFWuYYUHr/P49Yt0ilkg6s6FHwridlQUKMEv7wPkcvhQrfkJLK
	Zh/oY5W/DM+lGcRwOu5/A7Tvmm5uQ28cMGRCMvMv8cunMFZZLA12cKydJ4PcrmQH1LBhMTakt1j
	6tB+gAWhYkrN72Z5AEcBeKWf7WhCAUCGWRTDIUC/6Q/vR39Mq39ecwRPeJRQ9r3ZwN2aiHcowRg
	nWAvtDNT3dKD3kCnPmsjsrfF8vMl9WNTiE52h5IAo3usqJVzotFyAlOyh529rFw/YTDNqoGayrK
	tNNUG9uf2Fjwnv3xrR2ra8HWKYOseYQ2vMCyA3m4sSn4dcI4UPomARbd4f7W2u/hd
X-Received: by 2002:a5d:64e4:0:b0:48b:118e:7454 with SMTP id ffacd0b85a97d-48e264bd971mr9315929f8f.31.1792651600585;
        Wed, 21 Oct 2026 23:46:40 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm10215624f8f.22.2026.10.21.23.46.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 23:46:39 -0700 (PDT)
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
Subject: [RFC PATCH 0/3] KVM: arm64: Preserve level IRQ re-pending
Date: Thu, 22 Oct 2026 08:46:25 +0200
Message-Id: <20261022064628.4206-1-kmehltretter@gmail.com>
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
state used to populate the LR from a later ISPENDR write. This series
records the later write and preserves it across deactivation. The last
patch adds a two-vCPU GICv3 selftest.

The awkward case, and the reason for the RFC, is a write from another
vCPU while the interrupt remains in an LR. KVM cannot know whether the
write preceded or followed the guest ack. This series preserves the
write. A pre-ack write can therefore cause one extra delivery, while a
post-ack write is no longer lost.

The exact alternative is to stop and synchronize the target vCPU
before applying such a write, as the active-state accessors do. Is the
conservative replay acceptable here, or should ISPENDR pay that
synchronization cost?

The issue was reproduced with Zephyr, NuttX and RT-Thread guests. On a
Raspberry Pi 400 host with a GIC-400, each GICv2 guest handled the SPI
once before the fix and twice afterwards. A direct GIC-400 register
test also delivered the interrupt twice. With a QEMU TCG GICv3 host
running KVM, the new selftest failed before the fix and passed
afterwards. Existing vgic_irq and kvm-unit-tests GIC cases passed on
both versions. Those runtime tests used 8623551a424d.

The series applies without conflicts to kvmarm/next at dd0bc00e3e92.
The modified VGIC objects pass an arm64 GCC 14 W=1 build there, and the
selftest builds natively on arm64. GICv5 does not use the LR path
changed here. I have not tested a mapped physical interrupt or VFIO.

Karl Mehltretter (3):
  KVM: arm64: vgic-v2: Don't drop pending writes to active level IRQs
  KVM: arm64: vgic-v3: Don't drop pending writes to active level IRQs
  KVM: selftests: arm64: Test pending writes to active level IRQs

 arch/arm64/kvm/vgic/vgic-mmio.c              |   9 ++
 arch/arm64/kvm/vgic/vgic-v2.c                |  13 ++-
 arch/arm64/kvm/vgic/vgic-v3.c                |  13 ++-
 include/kvm/arm_vgic.h                       |   1 +
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 101 +++++++++++++++++++
 5 files changed, 131 insertions(+), 6 deletions(-)


base-commit: dd0bc00e3e9201fd49b62ff9cc07890c89003afe
-- 
2.39.5 (Apple Git-154)

