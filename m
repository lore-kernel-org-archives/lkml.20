Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006898;
	b=SXXM0rvo3qlN+gjej4GEooZ44jhQr0qehJgYitbRXG/VDCmyKwHvL/LFKkHinUeQfEqU
	 0dz62cM2+oI9lJ5AXEh2K1bjEdbULxnRuWwVWpOZeMdNXuhOeYaN2tQdwXyQEn442vxRL
	 IzaM2kJlxvUTMRISW83OePTT2N7Nt9INO4qvvqbQJY1jv1QH4sorktZLGUECsz+1Xou3o
	 xi3Y/M1xc1HXxg/Z6YijlVjmiOi7+UymfAmFYJh8IlELADfVhlco3Ag5EDQ/fNFExunrd
	 V8I6exWH7ev+LQO/y4NYhQAecgTY8YyXv5Zioz/GFf3DN/CrLC/vpkgw3ujwdwv33kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006898;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aaO1/o6pnxKsiPjftPSn0VyBdqvDP2CrGJI/wXBPKS8=;
	b=G08fYq5cY5cfYTbD/jvMpEmkkZjLVv5GnPXXlCwoROFDYL9vBg26Dck/YOiXYjZWNlYA
	 mUcXheERMoFiZrKq2Zln2Pdq9XSyX68XPCyv1XAejSvZASt8fPZ2zUSdhFxg5CtLejuyi
	 CHGhlNlutRUosRQJLbO/EctbH22pJq05LooGvYMdCwFzwGphwPPruoykbqzYc2xDw4Wz0
	 OComgCqJST9zWWKb1NED6gaBWt1hS2BQYTP00IG6mYZkxWi1JutXiJawkHt8FH2l25p5b
	 Q1uUsqbtu5C4HWbHun0SVb61mVbu5Ow1BP0SjhTH8VuVqhCTuZNrqZhmjJYGgdPvqlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZI1b3+Ym;
	arc=none smtp.remote-ip=95.215.58.201
Received: from mta1.migadu.com (out-201.mta1.migadu.com [95.215.58.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99AB606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E99AB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZI1b3+Ym
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=b7FM/+nMXV/x5ioStkPEzar8jxQ92kribfVG8dU4gAE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793006893; v=1; x=1793611693;
 b=ZI1b3+YmBcniunr4Qu1nsNf54JpKpeAMrtsN6v8B/LjP0mCxq0EwF6WpS4VVaS5B+PQy/Y5s
 J6Ddnw5Qwmt7op4mqWJoT61/DwewX3EVTtrG8fms5CByH30F3r63gxT1/utrGdGeyfqIdPzzrqo
 +s3FjTdhlqUNyyf+Oys+DKdo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4732a03f7734264c;
	Mon, 26 Oct 2026 09:28:13 +0000
X-Mizu-Trace-ID: 4732a03f7734264c
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
Subject: [PATCH 2/2] KVM: arm64: vgic-v3: Don't drop a pending LPI mapped with LPIs disabled
Date: Mon, 26 Oct 2026 09:28:02 +0000
Message-ID: <20261026092802.2636798-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026092802.2636798-1-fuad.tabba@linux.dev>
References: <20261026092802.2636798-1-fuad.tabba@linux.dev>
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

When an LPI is mapped, or restored with the ITS tables,
vgic_v3_lpi_sync_pending_status() moves its bit in the target
redistributor's pending table into the LPI's pending latch. Enabling
LPIs on that redistributor resets the latch of every LPI that targets it
from the table (its_sync_lpi_pending_table()), which no longer has the
bit. So an LPI mapped while its redistributor has LPIs disabled loses
its pending state, and the guest never takes it.

While the redistributor has LPIs disabled, copy the bit into the latch
rather than move it, so that enabling LPIs reads it again from the
table. It's still copied into the latch, since saving the pending tables
would otherwise write the empty latch over the bit.

Fixes: 06bd5359549d7 ("KVM: arm64: vgic-its: Read config and pending bit in add_lpi()")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-v3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 346bacb3198f2..65b77fb35be37 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -552,7 +552,8 @@ int vgic_v3_lpi_sync_pending_status(struct kvm *kvm, struct vgic_irq *irq)
 	irq->pending_latch = status;
 	vgic_queue_irq_unlock(vcpu->kvm, irq, flags);
 
-	if (status) {
+	/* Enabling LPIs resets the latch from the table: leave the bit for it */
+	if (status && vgic_lpis_enabled(vcpu)) {
 		/* clear consumed data */
 		val &= ~(1 << bit_nr);
 		ret = vgic_write_guest_lock(kvm, ptr, &val, 1);
-- 
2.47.3

