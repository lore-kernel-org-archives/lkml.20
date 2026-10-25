Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792914716;
	b=II1bAYAqJCb+yYpdiSpRTfCgPaB8j92oK3S+ZoVp9nw7f0sxignSJGpUm1BAjsagcd/5
	 elxJ9wpeaJUtYATLhraMYnynKFSo4pG4bbNzA2SUPsCYO/SWD6NqWE3HWsPDMR3DL35h6
	 Vw2ghNfnviMJg5w7u8lbw2aTyIMzaKRMZnc4u45pOEzSW+TxFULM+mTsO/OqYJwmxTlrz
	 lh9EBIJ2EdiSk5jChGXhd5GEAviez8EI0lMoknFzL2aY1fK4TnM4NnlEQZouUNwZs91kf
	 Y+gzlb17+H+KIY51jOXp1h1QR8IOUF5PGICOObVywxQyrcpLo0hxebk03JCjLDBKpyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792914716;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZBJQD9CEX8BSoBmqxIKznqV9jSK1F+2qL8QO29Cd7to=;
	b=uqOSl64lpMZYMn8aopMXi5ejwBXy5tyAMmF9NXq9Qw3H4aUuFwo3QgVmMrm3qN8pNRF2
	 s+hrwN3KkSnz3wq/4bX6ztmBLk7anYp3FLugRUZTntaNCCJWflLYqiVsEtw1sAVadnQO1
	 lUV9rMSQyQj7AQJ0OhWDKrXTEMeqI7abRt8ANRbWYtHdd+dP8fz/hVpivvAxWVM+bfK0x
	 MNKBHvKs7YsI336EdiwSlBOJ0yMe6srjRwhvnI0G1Dpkpl55sYQcLtdYg5E+sFg3PzjSs
	 Q8yFgo4v+T0r1bxfm0yO1jRTb9/rupdnohvf8JWZtHOiBVEAbwjQ9kG1MKvV3jAot+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="n/kLLYr8";
	arc=none smtp.remote-ip=95.215.58.98
Received: from mta1.migadu.com (out-98.mta1.migadu.com [95.215.58.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F5D606A320
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62F5D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n/kLLYr8
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4/HL2d4Nrhce67FzGis9vXGrK25cQYCUC9c0XAxPHEk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792914713; v=1; x=1793519513;
 b=n/kLLYr8dscJbvlScpg92+xPBfNLNwxn35iqvYOUP/RSRSYfC1M+Aa649LCqbY1/ND4BdHbM
 wrhM3EvT/dAMsjaHqhxhD7ii2xHbi5fib28O2wpkQUvNFuBJPeJWFoVpMjMsI89WzpH9WKOpafZ
 r3Tdzh08BXpsgpTcaStnMY+c=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0235f86465034b12;
	Sun, 25 Oct 2026 07:51:53 +0000
X-Mizu-Trace-ID: 0235f86465034b12
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] KVM: arm64: Add ACCDATA_EL1 to the sysreg array
Date: Sun, 25 Oct 2026 07:51:35 +0000
Message-ID: <20261025075138.2919734-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025075138.2919734-1-fuad.tabba@linux.dev>
References: <20261025075138.2919734-1-fuad.tabba@linux.dev>
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

From: Marc Zyngier <maz@kernel.org>

Make ACCDATA_EL1 a first-class citizen, and add it to the sysreg
array. Visibility is conditioned on the feature being enabled.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20240815125959.2097734-4-maz@kernel.org
[Fuad: rebased]
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_host.h |  3 +++
 arch/arm64/kvm/sys_regs.c         | 12 +++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 27fe0cd5b2d7a..5b1cd1f502b7d 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -498,6 +498,9 @@ enum vcpu_sysreg {
 	GCR_EL1,	/* Tag Control Register */
 	TFSRE0_EL1,	/* Tag Fault Status Register (EL0) */
 
+	/* Random stuff */
+	ACCDATA_EL1,	/* Accelerator Data */
+
 	POR_EL0,	/* Permission Overlay Register 0 (EL0) */
 
 	/* FP/SIMD/SVE */
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 44aae52c473d7..40f8be41da3a4 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2914,6 +2914,15 @@ static unsigned int sve_el2_visibility(const struct kvm_vcpu *vcpu,
 	return __el2_visibility(vcpu, rd, sve_visibility);
 }
 
+static unsigned int accdata_visibility(const struct kvm_vcpu *vcpu,
+				       const struct sys_reg_desc *rd)
+{
+	if (kvm_has_feat(vcpu->kvm, ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA))
+		return 0;
+
+	return REG_HIDDEN;
+}
+
 static unsigned int vncr_el2_visibility(const struct kvm_vcpu *vcpu,
 					const struct sys_reg_desc *rd)
 {
@@ -3601,7 +3610,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_CONTEXTIDR_EL1), access_vm_reg, reset_val, CONTEXTIDR_EL1, 0 },
 	{ SYS_DESC(SYS_TPIDR_EL1), NULL, reset_unknown, TPIDR_EL1 },
 
-	{ SYS_DESC(SYS_ACCDATA_EL1), undef_access },
+	{ SYS_DESC(SYS_ACCDATA_EL1), undef_access, reset_val, ACCDATA_EL1, 0,
+	  .visibility = accdata_visibility},
 
 	{ SYS_DESC(SYS_SCXTNUM_EL1), undef_access },
 
-- 
2.47.3

