Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.253
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006899;
	b=GcqFJsyJp2sV30os4yW0Nz1HvDFtIVhUOGMpA+kNJONQVfu082N6OVnxKlP3Bsevn8PV
	 G3y9PfO92BoaZjOeiIf8VrP2y6qp1JJB+X6MyHLsPO706zpJclmsJxT46NwIPON/0CBU/
	 gOKvq+KploZdpGCKP88JIrp7tYU3Br1+NPrnIxLa7B2fVpB/LeGssldOrdUsWYouhB5Nu
	 T3r9RSVen6RIUR1BDW1BJbBPpPayYFpNfnOlKD/syOpP+KMH0pfyYkc6AyGm7RTF0U/rQ
	 c+9AFMd+ledxfHGze4zDVkD3juqlu7N95ox3d92rRGekKnqUFbdaRQPauKKtKzT6BiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006899;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=x2kCiKkeOScUv4vRg+ADH3IUUv29+dTbC2OT5+HKXDc=;
	b=HAu3BGtFQHg+O+IlH/CorYjwUG+1vHfVNmX2zq3oVr1DZ8bsaFgi9sOH+ruNHwdbmwIr
	 Ol/wHP2vwHATVfy9dKKClOixbcgx2hSg/wgrvqEhS+NWWTRvIEKM9pMqXU9mvrvbJBUVB
	 G6+cjrA3qTwaFfGxmFl71rrTitdCX4nPP4dvnBifGHcBJCE37LFwFYLrVwdHr8XZt0JaQ
	 Z6R/B5OGcW6ITIssNZYriPPmnKv45rjJ2+UjvjO/rCz9vkH2AiIIbPcbyotISpAAtBtof
	 JGLT+YqH8kKBrLYGrFBo2rkGI768qj9ulGYIys/MwiOpVRRoIOu+yDSdaKiDw5NI4qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.253
Received: from mta0.migadu.com (out-253.mta0.migadu.com [91.218.175.253])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9D7606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE9D7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8LYCyZMI/ydZ4XMUTIjdTOfkLiQ3ZW2NdQjMgtJy9r0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793006887; v=1; x=1793611687;
 b=jHgz+9HGTK4xRN3DP7+8+Rb/pGUvSwYzPf7AvOFunZwinQwGQWams5T09sZU34UMrOIH7CiM
 W4+hO0O8/0MsyHOCpUQLai1ocniUUAQctYGrmxkwZIAbsytL+V0BWCvnB8sqvpjgVkmj4h0dKqm
 mNlwVKyYrbNcQvN9ubAmc0lA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 312a495375034eab;
	Mon, 26 Oct 2026 09:28:07 +0000
X-Mizu-Trace-ID: 312a495375034eab
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Yuchao Zhang <ndaugoing@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] KVM: arm64: vgic: LPI fixes for redistributors with LPIs disabled
Date: Mon, 26 Oct 2026 09:28:00 +0000
Message-ID: <20261026092802.2636798-1-fuad.tabba@linux.dev>
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

Two fixes on top of Marc's cross-CPU vcpu pausing series [1], for LPIs
whose redistributor has LPIs disabled. Without them, the guest can take
such an LPI with EnableLPIs clear, or lose one mapped before it enables
them.

The first is the vgic_target_oracle() change Oliver suggested on v2 of
that series [2]. It stops an LPI from being queued to a redistributor
with EnableLPIs clear once the disable path has retired the vCPU's AP
list. With that check, the path has to pause the vCPU before clearing
EnableLPIs, so that the retire still finds its LPIs.

With the second, an LPI mapped while its redistributor has LPIs
disabled keeps its pending bit when they're enabled. The second relies
on the first to keep such an LPI off the AP list until the enable.

Reproducers for the INVALL case in the first and the map in the second
fail in every run without the patch and pass with it.

Based on kvm-arm64/cross-vcpu-sync as merged in kvmarm/fixes, which the
first builds on (e99ff76f4a02b; also applies to kvmarm/fixes
309e1d2215255).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261015100539.1011760-1-maz@kernel.org/
[2] https://lore.kernel.org/all/asf87i2RDh-WksL-@kernel.org/

Fuad Tabba (2):
  KVM: arm64: vgic: Don't forward LPIs to a redistributor with LPIs
    disabled
  KVM: arm64: vgic-v3: Don't drop a pending LPI mapped with LPIs
    disabled

 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 31 ++++++++++++++++--------------
 arch/arm64/kvm/vgic/vgic-v3.c      |  3 ++-
 arch/arm64/kvm/vgic/vgic.c         | 12 ++++++++----
 3 files changed, 27 insertions(+), 19 deletions(-)


base-commit: e99ff76f4a02be8542e2c3ecc8843d7339a0200d
-- 
2.47.3

