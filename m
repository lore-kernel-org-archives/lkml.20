Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5099B51588D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748071; cv=none; b=nnWEHy8UWXcEgBuOc4OaqiIbzOAJh2Mw+nPaLWx9/Pyp2WIrZkMmf4+Vj9JCQHbV+aM9OhakdQTZh0LDhnGhvEfi74/V66EfJ0vzUHUmbWqwvJ0lZz8jpD+Y4zit0I5Lv2wFhAA+3MQepR0i3c1kxT5RcMSei1U4C4ezuvPo2+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748071; c=relaxed/simple;
	bh=qskTDOTZ3X/eC+QtrSnYkRmfA8VXtYLdU8LszGaACHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FFbvKjB8SqmHExhPZM7W5dUxwOD5xTI8y8eneLRhI0wcqLyTHzlYruY/l8C/Do3uGmf5vp0xgL2ZQ9mQqtyaFbKg5iVXoSG3ZpSgCw8omLOpNJ/GrLK8flT01esyDnorqsnQiZvZMXYEm7N8sw/Q+Gf93IbyjUnn0i/RZRMnxyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Edp8R+bB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Edp8R+bB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07361F000FF;
	Fri, 18 Sep 2026 16:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748069;
	bh=aHMoz1vySQvYeQW+hJXZKhFp+T//bo0AG/CTIQJNNJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Edp8R+bBPQqImx1+AnsYjmOnuRIOuZBNv9WinTHaoT2DaiptqJx27nbkcCY8+1zLU
	 peekFHkhOw2J1WKN44ohH3bDuRpgH1lqV8GkyKcFKG1KjapgQHnyVDf0Sslq++JjFa
	 2kRTowqnTeUg37ewHZQ7yuWYaGpnjk4GrQ6UN/jeec3jsd/wCXHG8NF475UmF3JIPI
	 +NqXQs5Mow6EX4NSCPmfNjqJmyTm5paYlW2mbLzrjMxhw/HWMXejN/5sONfC8hsm9g
	 qKS8tHj98Eh8MQxxT0DUmDbARLdqk3QEXt+tCJIfBgSM+KErRj8J243E/rwLS/pYfG
	 tY0NDIM1gutHg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 04/21] arm64: bpf: Add support for generating reads of TPIDRRO_EL0
Date: Fri, 18 Sep 2026 17:13:48 +0100
Message-ID: <20260918161407.2300-5-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for storing 'current' in TPIDRRO_EL0, add support for the
instruction encoding of "MRS Rt, TPIDRRO_EL0" to the BPF JIT.

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/insn.h | 1 +
 arch/arm64/net/bpf_jit.h      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index 1ce75a442638..0e739740513d 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -136,6 +136,7 @@ enum aarch64_insn_special_register {
 };
 
 enum aarch64_insn_system_register {
+	AARCH64_INSN_SYSREG_TPIDRRO_EL0	= 0x5e83,
 	AARCH64_INSN_SYSREG_TPIDR_EL1	= 0x4684,
 	AARCH64_INSN_SYSREG_TPIDR_EL2	= 0x6682,
 	AARCH64_INSN_SYSREG_SP_EL0	= 0x4208,
diff --git a/arch/arm64/net/bpf_jit.h b/arch/arm64/net/bpf_jit.h
index b2fe6e6dcf44..df469a005373 100644
--- a/arch/arm64/net/bpf_jit.h
+++ b/arch/arm64/net/bpf_jit.h
@@ -331,6 +331,8 @@
 	aarch64_insn_gen_adr(0, offset, Rd, AARCH64_INSN_ADR_TYPE_ADR)
 
 /* MRS */
+#define A64_MRS_TPIDRRO_EL0(Rt) \
+	aarch64_insn_gen_mrs(Rt, AARCH64_INSN_SYSREG_TPIDRRO_EL0)
 #define A64_MRS_TPIDR_EL1(Rt) \
 	aarch64_insn_gen_mrs(Rt, AARCH64_INSN_SYSREG_TPIDR_EL1)
 #define A64_MRS_TPIDR_EL2(Rt) \
-- 
2.55.0.1082.g2b9226bbc0-goog

