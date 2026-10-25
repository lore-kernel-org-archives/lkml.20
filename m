Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792914746;
	b=K+KwIlVxoRIYXqAAAe1U5Z+ypeyE3DLA/Wj0foSV6YvGkEwsDsCbQ62Qt10Pi8yPv/0n
	 pDS6ffxEpaOP4KVXET3JrsCacl9+1twFcZLudSpd5bQzZbAHAm3KVvA0w6mFDeyNGdy0G
	 8+lwoosBLgBoGcgU7FzQ5WYvmvvPgN1nOy6EV7YpMSq3hOxS2/e/fst+LiKkac5LrPMR8
	 6oYcib6L+xtjpQL4I8cfc+Sj70K0uComGYzse7D+7dzs3ueivDix27BeZSpqFQD9GsR1W
	 VYHwllh5EF8RIC1q3BVhIGDcbP5tMb6jrv9fI15bDdiCziJ54YczemmWUBazPW/aFbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792914746;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P3hdhOQZUT2FZ6Hh3e1FpgfLP6uVmzP7OGnEQtYKL48=;
	b=LnUe2NO9YiVzSjwAAE2vBfUXtmu1GVQnBlP97854kjEP89u4QkppoTUdRhOSLQW+0TFo
	 GLNO2wwpuv4kTFGJ0hHxQcCha4+GXeUPq4JBP5kNLiooyqWdSZEJFRlififihUXPjcEWX
	 Jkhaed4IX861OH6jXRjNzLOK/Hf4J82GymZz5ZK/bFX7/B1f8nTpzjHYSe4i34mCnmNhR
	 ogktw2hHf2+x+Z5n/CVNahzIYb4am+sOTF02xSDl6bQECSLN7DXa8zcGAsq+qcTINAonG
	 TmkhrVtYLyh0BJtfj5t4V0zbywEqB7nL6DmAYkRf9CMXa+3AeYqKzHMJ52+GTT2AJIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ipervbUn;
	arc=none smtp.remote-ip=95.215.58.134
Received: from mta1.migadu.com (out-134.mta1.migadu.com [95.215.58.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70D9606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A70D9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ipervbUn
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9tdQc3XLASUSgtohD1Zmp8zbuiOyq7kuHVLMF2vvkJs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792914743; v=1; x=1793519543;
 b=ipervbUnrzjwf6Sk2LT0ZYsSAmZCf4nZQ/SMcmVXK73Sw8GgcCvmFAbC3tJMzAtkNTfnvbpW
 5BRRKM6vl34yLhmvxfR+r5dvGvBHDHxvd6YIhjEBSLi4gBo9V2xQinRNMtjrTNbe/IvTHzq2x1W
 gEWJmxqhabe7axdoTqdsV8hs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c302dc059e47d3f9;
	Sun, 25 Oct 2026 07:52:23 +0000
X-Mizu-Trace-ID: c302dc059e47d3f9
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
Subject: [PATCH v2 5/5] KVM: arm64: selftests: Add ACCDATA_EL1 to get-reg-list
Date: Sun, 25 Oct 2026 07:51:38 +0000
Message-ID: <20261025075138.2919734-6-fuad.tabba@linux.dev>
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

KVM exposes ACCDATA_EL1 to userspace when the guest has
FEAT_LS64_ACCDATA. Add it to get-reg-list, conditioned on
ID_AA64ISAR1_EL1.LS64, so that the test still passes on hosts that
implement the feature.

Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/arm64/get-reg-list.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/get-reg-list.c b/tools/testing/selftests/kvm/arm64/get-reg-list.c
index 533994687b5d8..912590f9b0c2b 100644
--- a/tools/testing/selftests/kvm/arm64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/arm64/get-reg-list.c
@@ -49,6 +49,7 @@ static struct feature_id_reg feat_id_regs[] = {
 	REG_FEAT(POR_EL1,	ID_AA64MMFR3_EL1, S1POE, IMP),
 	REG_FEAT(POR_EL0,	ID_AA64MMFR3_EL1, S1POE, IMP),
 	REG_FEAT(POR_EL2,	ID_AA64MMFR3_EL1, S1POE, IMP),
+	REG_FEAT(ACCDATA_EL1,	ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA),
 	REG_FEAT(HCRX_EL2,	ID_AA64MMFR1_EL1, HCX, IMP),
 	REG_FEAT(HFGRTR_EL2,	ID_AA64MMFR0_EL1, FGT, IMP),
 	REG_FEAT(HFGWTR_EL2,	ID_AA64MMFR0_EL1, FGT, IMP),
@@ -517,6 +518,7 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 12, 1, 1),	/* DISR_EL1 */
 	ARM64_SYS_REG(3, 0, 13, 0, 1),	/* CONTEXTIDR_EL1 */
 	ARM64_SYS_REG(3, 0, 13, 0, 4),	/* TPIDR_EL1 */
+	ARM64_SYS_REG(3, 0, 13, 0, 5),	/* ACCDATA_EL1 */
 	ARM64_SYS_REG(3, 0, 14, 1, 0),	/* CNTKCTL_EL1 */
 	ARM64_SYS_REG(3, 2, 0, 0, 0),	/* CSSELR_EL1 */
 	ARM64_SYS_REG(3, 3, 10, 2, 4),	/* POR_EL0 */
-- 
2.47.3

