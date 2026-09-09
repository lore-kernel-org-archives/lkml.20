Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1DD3ACA77
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935603; cv=none; b=SxrAI4ZEmXnjsbiBL5NFT5rtoUwN5ydy9vUANpwQqHseQztsm89uRc18L9kj7SRDKKExN1PCNyMPfvn9fvMfYD0y9qZDbkSond+sU2VNRfH3O2FMOe/oEPc7XK10ciXp7XvxUfrKsxohLBqqMiiizjJ4a6eyb8ydj/5EH8el8K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935603; c=relaxed/simple;
	bh=krSppx0TcOsuOQJ7CYM8RgsVBRhBOK+EVkbPK7tCfNE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CDHaXymbZcytxBj59UDctYiOET8Wf/KdV8ZpVGshgy/VP46AsclzU4JoWbvkuTPR4QSN7kHncKtCsL/SpuHDRq3LGeZS0wtKG7sp/5kkyIi4IyF1qS+3X6ad0XObqbpBbvzgRqm0Kt+Hz3dqB6SISUNHt2z8MWx8WPrja7r7cnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/jyG58R; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/jyG58R"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482e257a23aso3706290f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788935599; x=1789540399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eDa29l8MMaO9ypybeVRSRc5/JD7r0AQ1OrapMHcmZ2g=;
        b=M/jyG58RJ/HBmCbpvxqafmDbhn3Mzzm/SsjywxEIOPCrxNTYLeEtj/OKSiiW9nPgxL
         eQN9tUxiZ4uZa/u2Dwq/tn3TSKQSB7ZvfkmLNDRN5vo2viEyFwj7KLrl7rCt1SsUCYzf
         yFD8XimkIFREiM2NthpMK2lA7TkWMBv5xmI59NvS7bUkBzaL9Oi5YntmzyeQQJtfCIKw
         0CuEKY8izSL8ofNTcG/w48Dou/v2zIw0JKDhhmXcVIv5Mq1OIh+bDdMT0plFOiXLOajW
         IHzfw2SkKDIM97poBmxJ1CFdfeS5loDzY2jpzCMHPK1OPCuPjgYA2N4Ie69rwIVhFXFU
         N9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788935599; x=1789540399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eDa29l8MMaO9ypybeVRSRc5/JD7r0AQ1OrapMHcmZ2g=;
        b=PleV5ucMjeSQKUPQxHN3cU1qVjQ3cBQB3vtHIwnpekyZleQ0x+H/6ZZJ1w3Elpd/G8
         Kssq7LKc1c5EA7bXyItE5PnftOKmi2cJmXfLKcBlokcJUlTYRytyp/uuys1mgCljljxC
         VN+wAEmCjijzEnLypEO11rW9pPKxEMW/fUDwZstCEkp1VoMCS8Y6zGEC64Imx28BeWtO
         /ZZngyrWeQCsescaxb0OH7tUR2GhGVh62riI0b+HZecp+8qN7UWX5rObMYRJqSf69rqp
         u24T93+zs9QotFdb3l17/zSeF5Cwi5DwINSAo4E3KIhIO/cQI1wjWUPdrgSJLqPmCqy2
         xFeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxUS/m2VENl/kfiS7igycQBEeHBkySKjniByXaNbc3DtBZkg6Iz0/VN79uQqVMJJouf0iRydZw3N4sIYA=@vger.kernel.org
X-Gm-Message-State: AFuF++mcTSAlKMmn950shuu1GySfN4SZRlKcyXEU4C0VXuQKwfYLMsZk
	kk6dI/+JpacT1HHx/s2SGlTV9Nkb3XlYXLNlkspd81ElHaBL+BeLRf7L
X-Gm-Gg: AYBFou0bo9uFH2Glua6jUKVCR2GQuLVJLdmtNfutK9erVjZkLhuFNbUozZeKJKkQi+A
	27M6beRIRlif/bFuGQoTTRM+vZaKpCBnQckjZ2JputVtQvOucDaj8c/ItKY7bBp76/hCmafaNVb
	HyVqPCg7CCEeLTgeDyoHiH0X73mNQT/N+8VMU38LdaxuCIcNH59B3t7WKiG0WqannPROvMzR3I9
	kB+1pV9c6ZQ+kx+wEEekveakFgD2nDwWWASKDbLPva+R2oGjZpbUglMWcocyup+MS5k8zaQkmg2
	OFXhKhJ2cFCO8LkxAI/D21eOy2TD86FASulQa8snJNYKJZDpFAYIC6duIdPLsVttNR9C8eG+ayf
	zhKGIOdSg7J6alk3g3U1r0Ur7VFEbHqeHoqmj+2vmNO0faZany1vMC4VwB38/Lwqk7ewbmOKnmr
	kKcEG7vk2lTA5Kn4ixClZfONhGAzT08gDqcAiavCq8uRvewMt8Si8OMw84N5iHJS5xKQf/fw2+M
	829NHHI6GXxew08eVHbOjADnxxLwn0qACM56i3O8AOiqd1O+64LIAgmSx51I7+09MRq2iVlPKDD
	0b4QP3XpTd3i5HnBByTfxb+krC7Sy5gvoWiF07n/Fzt6oLSF2btV
X-Received: by 2002:a05:6000:2885:b0:485:ac55:dca1 with SMTP id ffacd0b85a97d-485ac55dddamr2682301f8f.50.1788935598707;
        Tue, 08 Sep 2026 23:33:18 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-114-212-219.95.114.pool.telefonica.de. [95.114.212.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ab73c2bsm39734495f8f.22.2026.09.08.23.33.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 08 Sep 2026 23:33:18 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: Fix kvm_get_vtcr() kernel-doc
Date: Wed,  9 Sep 2026 08:31:56 +0200
Message-Id: <20260909063156.89636-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvm_get_vtcr() takes a parameter named phys_shift, but its kernel-doc
describes phys_shfit. This leaves the real parameter undescribed and
adds an excess parameter description to the generated documentation.

Correct the spelling.

Fixes: bcb25a2b86b4 ("KVM: arm64: Refactor kvm_arm_setup_stage2()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 41a8687938eb..c078cfedce19 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -532,7 +532,7 @@ u64 kvm_pgtable_hyp_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
  * kvm_get_vtcr() - Helper to construct VTCR_EL2
  * @mmfr0:	Sanitized value of SYS_ID_AA64MMFR0_EL1 register.
  * @mmfr1:	Sanitized value of SYS_ID_AA64MMFR1_EL1 register.
- * @phys_shfit:	Value to set in VTCR_EL2.T0SZ.
+ * @phys_shift:	Value to set in VTCR_EL2.T0SZ.
  *
  * The VTCR value is common across all the physical CPUs on the system.
  * We use system wide sanitised values to fill in different fields,

base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
-- 
2.53.0
