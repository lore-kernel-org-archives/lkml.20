Received: from mta0.migadu.com (out-18.mta0.migadu.com [91.218.175.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4670345725
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672465; cv=none; b=CE/65EjI2Wa73rGanzMPB8ssEtCi4KpVQMYTnXeiRHk58mmaOgPf9w7NVwCrxyVx8TOoYooqZWrVdELn/Mcr9gT4v/SxpkCfCo6TUsP+u/SH5X1PgmrKL18A+3EHk1GWHzPqdmfc+HlGvhA+wTjcvihqN/4VooHB+OhimsebuoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672465; c=relaxed/simple;
	bh=Xy7APjAm9vxgY3BoNnyG8EPgyVpnG+Ucz22DNIrqlo4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pb+YrajaGdrO+CAyFXXBzSmCINgkcMP2Ii2t4zv/NhVgwYHCmqnNf9h66vOshLe1E0eusP478TuGE4ag4n8CUPCwYoYsEbwOxlkTGZWzuCqtRxJcgcwaSeRl/oTGfrf4WhsLUWrDZdAnhqp7K+wG4UW8p8Lc90yjesAZfHY3lSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DxqYHijC; arc=none smtp.client-ip=91.218.175.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DxqYHijC"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Xy7APjAm9vxgY3BoNnyG8EPgyVpnG+Ucz22DNIrqlo4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790672461; v=1; x=1791277261;
 b=DxqYHijCoaJOUinzidpUueGW+VcVaLt22yd5bEMaSaVLoCdaASYBDbg2fhLirgmRFL0otqQf
 OeBIjZqVbY6lvBaYoJ8vR2dIgYjoXelPg6y0QYlKb13EghT+pIspEe1yjBTwButa3D5eF34vSWd
 sQH86xv0AP167QKGHZr5jick=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 939f88d67d5e6d8b;
	Tue, 29 Sep 2026 09:00:59 +0000
X-Mizu-Trace-ID: 939f88d67d5e6d8b
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Venkata Rao Kakani <venkata.kakani@oss.qualcomm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] KVM: arm64: Apply the fine-grained UNDEFs without FEAT_FGT
Date: Tue, 29 Sep 2026 10:00:28 +0100
Message-Id: <20260929090031.3829185-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260929090031.3829185-1-fuad.tabba@linux.dev>
References: <20260929090031.3829185-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

triage_sysreg_trap() applies the FGU bits through the encoding's FGT
entry in the trap xarray, and populate_nv_trap_config() only adds those
entries on a CPU with FEAT_FGT. Without it, a hidden feature that still
traps reaches its handler instead: a TLBI OS trapped through
HCR_EL2.TTLBOS lands in handle_tlbi_el1(), which expects an EL1 TLBI
only from vEL2 and WARNs before the guest gets its UNDEF. A VMM can
trigger the WARN by hiding TLBI OS and having the guest execute one.

kvm_calculate_traps() computes the FGU bits with or without FEAT_FGT,
and the entries map an encoding to its FGT bit whatever the CPU
implements. Add them unconditionally, so that a hidden feature that
traps is UNDEFINED on any CPU.

Fixes: f5a5a406b4b8b ("KVM: arm64: Propagate and handle Fine-Grained UNDEF bits")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    For a nested guest on a CPU without FGT, check_fgt_bit() now runs too,
    but it forwards nothing: a guest without FEAT_FGT has its FGT registers
    RES0.
    
    f5a5a406b4b8b added the FGU check to triage_sysreg_trap() behind an
    ARM64_HAS_FGT gate that populate_nv_trap_config() already had, so the
    check never fired without FGT.

 arch/arm64/kvm/emulate-nested.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 625604019fb32..b8529532b6e78 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2386,9 +2386,6 @@ int __init populate_nv_trap_config(void)
 				print_nv_trap_error(fgt, "FGT bit is reserved", ret);
 			}
 
-			if (!cpus_have_final_cap(ARM64_HAS_FGT))
-				continue;
-
 			prev = xa_store(&sr_forward_xa, enc,
 					xa_mk_value(tc.val), GFP_KERNEL);
 
-- 
2.39.5

