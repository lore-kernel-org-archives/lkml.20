Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.109
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028410;
	b=aqwpGxfj9MB6WdM3U21E5TVPiJqUibr+/OsO0oxodkbTENohDOuHiudhYQ2JDZd43Nk8
	 k3wfIqwb4rl8ZkH35hQehwDAjv5L0xsu6f8v5yUbh3uVgoECwrR9pB9vM4oeGCY3WEG4J
	 oDUOQ6Aj2W0zEkcVYSk4rE26XI/Pj1Y/VAY7mqCjJ1RrEmuK6I/CekF+pebn3W9bJGuwX
	 d97750wSg4joLPtAQd2UIONZHkciK558AGTcRxYRvXFEMOL/Sz4sgmivSYwrrHM47FrmJ
	 dZFbh0phYsVTHzT3453u8BQzGE7hDlPMOEnVyTLf+wxOZHP8N7+oX83Sk2vRTV1tiBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028410;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dAFgr5GFVCUFPSyhlg3DUaZpfnARnQey3lMyxNdSf/I=;
	b=GU41JOMCGhLwWzyck603lBf9iobYInxQt2N5gCmmqnoo9Qqpru4RMRGJFGQXY6wsQfW2
	 wpebAMj6iDc2VQ6IjWLlmornBxG8h56MmReGewxcHHYZ9llNQjZj+UUnCtn+PyNofMFpf
	 I+xdi+M866t9ITCQlg9TYnsfqZx+XKzLQw2CoRnoeixC7NeRUBKo0O1Lc8Id61WsATMmG
	 knardQFh9ahjZUWBgesBPFDPvic9ew9MJHLiKTcC8DO3xDSxUhBvLzDL83wd09h2JYNtR
	 uQXE0zs7x6Ro4nSddZHP01oVw+JewxaCuPdsWdeCd+dQscAvV7xHf+aBve0V3Bby6lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lfvq+ASi;
	arc=none smtp.remote-ip=95.215.58.109
Received: from mta1.migadu.com (out-109.mta1.migadu.com [95.215.58.109])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907C1606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 907C1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lfvq+ASi
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Gpfg/CtXJGh5QbnPt7iVXc/Il3CyiL4OHB1+vx17vOU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793028407; v=1; x=1793633207;
 b=lfvq+ASiumxv1EPzTQfGbflJ5htPolqDQumFs20FyCg5RYvXBgDs4KRLcmAI9kRLsgulaSNb
 i36nGDemw02DdXpl7Tcs4S53ofD0IlYjpRnUmu32/BkKvGiWGXpqBdosR3BLHgNUpai5oIIkFGV
 qlz1fuO37/fI1/eesQp8H6Ms=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8be23b0417c64883;
	Mon, 26 Oct 2026 15:26:47 +0000
X-Mizu-Trace-ID: 8be23b0417c64883
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
Subject: [PATCH 1/2] KVM: arm64: vgic-v4: Don't allocate vPEs for a GICv2 VM
Date: Mon, 26 Oct 2026 15:26:38 +0000
Message-ID: <20261026152639.3926498-2-fuad.tabba@linux.dev>
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

KVM can run a GICv2 VM on a GICv4.0 host whose CPU interface supports
legacy operation. Such a VM has no LPIs and never uses vPEs, so
vgic_supports_direct_irqs() is false for it and kvm_vgic_dist_destroy()
never tears them down. However, userspace can still create an ITS for
it. Once the vgic is initialised, vgic_its_create() calls
vgic_v4_init(), which allocates the vPEs and requests a doorbell IRQ for
each vCPU. They're then never freed, and each doorbell handler stays
registered with a vCPU that's freed with the VM.

Only allocate vPEs for a GICv3 VM.

Fixes: 74fe55dc9ab77 ("KVM: arm/arm64: GICv4: Add init/teardown of the per-VM vPE irq domain")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-v4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index ed236f083f0d7..a01de4de608a6 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -248,7 +248,7 @@ int vgic_v4_init(struct kvm *kvm)
 
 	lockdep_assert_held(&kvm->arch.config_lock);
 
-	if (!kvm_vgic_global_state.has_gicv4)
+	if (!kvm_vgic_global_state.has_gicv4 || dist->vgic_model != KVM_DEV_TYPE_ARM_VGIC_V3)
 		return 0; /* Nothing to see here... move along. */
 
 	if (dist->its_vm.vpes)
-- 
2.47.3

