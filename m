Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028416;
	b=EMiBVWfuccJWP5+98pNztMQquozK8S58afkIfnujbWpaZUdT1Gv2wpXgO9Gfm3m/J6lP
	 eokvj+Ne7RyRm/7lLAL+YuvHI/2jpIAzgvNctsr3OzN3S1uD9SBZBtcFTbhDNxElNvw7V
	 E8vD/SZ2WWRVyUH3Pv6VDYwDEofwVQSw9vH4Wuxv/5p8cG2x8bdlXqG6IloOfXKI1X6Cw
	 MEGFGUcCTpHgwz+AMwOWZFfoSw4TtgzcmzGacIt31XY77wriwR8m5YxW1n0Vm0ZJH+Q2z
	 70wmCmRZukmScJf+UQgF0AAADOkP1jnS7R1pNWnSoJW2/XGoRoSSyJn2umgQASv5BUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028416;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R+uyHs9ywIaM0i/9cYv3M9HNaFEltPzXJeKYyT3HeLQ=;
	b=PkN6Bkg/7YlbbrCvvyGs36XPuP2j+DEgV7LPd0dYCFI1//BBIV181EkFwEF2wwibflys
	 /p37IGb+7s3sT5Y/Vc0McWcEOabW8gleoqVoUj2HoaIQM2Gfp2m1Oig+CQAKbYgDnfiKJ
	 SAAJKB5B6tr51aUQTw0in/MFbQDpv0XsgujfQkp8fNn+EZEg2bwgwO1TyrSBSZMqKHEFk
	 F4aQCqHYzqT+OGWJLHpaO08JmD1Z0fFZ6KT+YYe0dlPVEFLsxGN1+vihrLBTyRwBddHZU
	 Bdv/jmY+zy9leq2AMymCJHe9/okYXVE0imHtMsoIxEtpAjag+88n7gKrAT/EwM3udHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GGcSxjh1;
	arc=none smtp.remote-ip=95.215.58.116
Received: from mta1.migadu.com (out-116.mta1.migadu.com [95.215.58.116])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13542606A327
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13542606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GGcSxjh1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HeX2/geBxz2dlu9U8tei1sYnbTS6/PpznfxzSmtORYY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793028413; v=1; x=1793633213;
 b=GGcSxjh1UC0cDCLlNJtR4af/Jfdu7XvwZolqns7vXAfIesqqt7TVSd7HO4oPf/+limgiRxdw
 DV0LNNzoxOi0BKQIM5w8+YSY284Gd3P5rFgj1nJFGGaXexmKRrjsNgRg/j8w9T9DVJeSk8kT8XY
 BkuAX/k18vmb9DWM3QRsX2pY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 069beff3eddbe141;
	Mon, 26 Oct 2026 15:26:53 +0000
X-Mizu-Trace-ID: 069beff3eddbe141
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Eric Auger <eric.auger@redhat.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] KVM: arm64: vgic-v4: Don't allocate vPEs when userspace clears nASSGIcap
Date: Mon, 26 Oct 2026 15:26:39 +0000
Message-ID: <20261026152639.3926498-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026152639.3926498-1-fuad.tabba@linux.dev>
References: <20261026152639.3926498-1-fuad.tabba@linux.dev>
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

Since commit c652887a92887 ("KVM: arm64: vgic-v3: Allow userspace to
write GICD_TYPER2.nASSGIcap"), userspace can disable vPE allocation for
a VM on a GICv4.1 host with vSGIs by clearing nASSGIcap before the vgic
is initialised. vgic_init() then skips vgic_v4_init(), and
kvm_vgic_dist_destroy() skips vgic_v4_teardown(). vgic_its_create()
still calls vgic_v4_init() for an ITS created after the vgic is
initialised, though, and vgic_v4_init() allocates the vPEs and requests
a doorbell IRQ for each vCPU. Destroying the VM leaks them, and leaves
each doorbell handler registered with a vCPU that's about to be freed.

Rather than gate on vgic_supports_direct_irqs(), which reads has_its
before vgic_its_create() sets it, check for a cleared nASSGIcap in
vgic_v4_init().

Fixes: c652887a92887 ("KVM: arm64: vgic-v3: Allow userspace to write GICD_TYPER2.nASSGIcap")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-v4.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index a01de4de608a6..12a57921f6af3 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -251,6 +251,10 @@ int vgic_v4_init(struct kvm *kvm)
 	if (!kvm_vgic_global_state.has_gicv4 || dist->vgic_model != KVM_DEV_TYPE_ARM_VGIC_V3)
 		return 0; /* Nothing to see here... move along. */
 
+	/* Userspace disabled vPE allocation by clearing nASSGIcap */
+	if (system_supports_direct_sgis() && !vgic_supports_direct_sgis(kvm))
+		return 0;
+
 	if (dist->its_vm.vpes)
 		return 0;
 
-- 
2.47.3

