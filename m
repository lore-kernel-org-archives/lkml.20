Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09557521226
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799395; cv=none; b=gwmWq0fhKcPSMUL0uGXVYPeS7MmgPbFj52ZM0sRaa5SLVX8pyinQSQQbuc4/2W1QGjVeun1j1qHl74TzlcrCu9Q8aV4DY5SkHTl3F/gLN0sOEDcs8uB5fEsVcunmrXGpYD6dPECOppeILvtzneEbCLbLx88thWKfMnD2xJa2dlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799395; c=relaxed/simple;
	bh=uLgf45738HTyKOGxONf2L12nrejh1+P0hDijSifdIKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UkzWI81qMxob+wJEL/pyGbzwF4RMQutCgyh0HtWjOKdDH40Shg2+mZjX/s/BaPiQ1NPcsBgXjk0XJhnmQ2viCR8M5ZmmH4+Bw/cZ00eTGIKqIfKhgCK0ppYLyfc3oi+/2zHqnOaaKwPqhy6Lcyz5Yj8rwynBi2k4WAiyAQTS4WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CocsL0/a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CocsL0/a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1832E1F00A3F;
	Mon,  7 Sep 2026 16:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799393;
	bh=VHSmidgSt8AbjYT2raXqIZZYXGrQJOWrMI3DNUPT/To=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CocsL0/aIfzLSNLpwpHRNrvHm73Fw4AxTaKa1B5XmrTYXs2CzVdSXLcHcOp+COqUY
	 29ibwMG4DS8UME1PQwp8zvZv/2x+NtEiqr0oEn0CpLBYqjXjvlcDvQRGZUp+ofcGYf
	 3VjlMrzyLNTmvw5JYTd6XM1ylg5FA1vlDmYxlB9x9et/IjlI5thJhC/5INjTfElgmn
	 c7++bVGH+cQfjkEmRAOPFFn478E4rlNbDyNRVFtVSAAtq5Cj9o+6ThvZu3SN5aAAkx
	 BqwSOoqJOq2sNHFJ/kZn6TWGgFep2pJrbeUxslZxvN/quGadOAcC5RPW6VLZalg2A0
	 53aV0tlsCEEow==
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
Subject: [PATCH 04/21] arm64: bpf: Add support for generating reads of TPIDRRO_EL0
Date: Mon,  7 Sep 2026 17:42:29 +0100
Message-ID: <20260907164247.17223-5-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164247.17223-1-will@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
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
2.55.0.979.g7e5102b832-goog

