Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786456;
	b=VxIjUd++N9T3KkoTOxfvnusl8ptHAlYDTl2lmls86Xzk9eUe1mMFL8I3yee6tfVgXg71
	 EjCQdTBRQGk4l3uU0+LfA9vOCky1Op648IkfbWJyuSaxZDgCLaudZ8bMq3BbtX4WDMYn/
	 r/+bT1mMHNecfAIxCWfBoogSlZViYMppIJ4cuDJh7rwPXChQUE373KLgJlumU7xQRi7P1
	 DX1VSTy1Aboc9IMuY7uLUVLMZmFSae2X2MSCmNgnSdw9UkyDNTdFOJ69RRyBhvl/yKpfK
	 pU7KJQvVAi/TGjZjFFT6SSyCFuOmpxDpBfof0kheZ3EYf75u+uTPOe8JoygbgYeAOTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786456;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=TLGga1XJaEBstF4brRpspjABd42fAO01T3Tfq+b3WRY=;
	b=wik0h5F3UoE4qYewI4Y1AnZLrLjOxXomMPPoXBIbPjS4Lm/bljmrHkEnLzmoHTIihbU6
	 1B84NMhSdN6+cdf+iClkDQ7nT5vhP7huEglonjz3a6aEdiXJitD8nShF+vWxAKN4m9o7B
	 nmRGXKAYLCN97kKOABgP0ewpPinl6tdJsnf+cuaTWZ6H7sAozEJoXviagZRI4pgGa6Mgs
	 g0D/BWA6/hsmRWfoLJ5LT+w7iFpXCbNbLiTrC0r1mAcbDNso6V6pi6SyDI4EST3tVDKet
	 AMvDPqHCl908SXJsY/xD1r0ANsRPqrGNAdd41TRwYE5pCr3MV82G2RagfUIDY+hqvCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W2Ev9q08;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1DB606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W2Ev9q08
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E546D1F00919;
	Wed,  4 Nov 2026 10:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793786455;
	bh=TLGga1XJaEBstF4brRpspjABd42fAO01T3Tfq+b3WRY=;
	h=From:To:Cc:Subject:Date;
	b=W2Ev9q08vDAgiRgNTKq5Un4MTwLYES1RVB+l2k5R9G/f+jDIKOGXck7brNysxlGFh
	 2E77lBCeSt3j6p6BmUbOW0XRHAY+0Xh7bKouztiSYawKHtfPHmLcBy5AJ1ZPL0aZKJ
	 mahuY6wwahSnpiqjfRmHYGiR9yDS+USenR929FFlv3aZSPagKN5lnqa/4XssMKAvUS
	 ZKLbgkUggUovr6kXJB4mdVmAcZh1noRKtQ7odm7eJh/PcXZpcYzKvOMaTCZ5Ws5HwD
	 V1mWg1CBFqg8BmXTHdC5IS9pQYK0eGobHf23phDdLXjXYT4AHHEjRcNnpG8BV0q9q6
	 f4aB+hKwAUJZg==
From: Thorsten Blum <blum@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thorsten Blum <blum@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: patching: Use uintptr_t in aarch64_insn_patch_text_nosync()
Date: Wed,  4 Nov 2026 10:59:43 +0100
Message-ID: <20261104095943.97344-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058; i=blum@kernel.org; h=from:subject; bh=ZO7mmyFV27Y400PIzYZNqMgtJo/xFwDj+vG/tyF0qNI=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmvmfhLb1xWOha/ZM3zMO2AJ5M/R7vNTZj7nP+qWIVI5 /bdGyWPdpSyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBENNYwMnSePBEj9boz8E/T j3N7j9b7zpgdu1nO+8TjlSkG050mX7Nm+KdxumL2+ZItqcEe7lud9wodFXcqvbV5vf3taDO/KT7 bbjACAA==
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Use uintptr_t for tp instead of casting it multiple times and pass addr
directly to aarch64_insn_write().

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/arm64/kernel/patching.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index 09f019c6547a..24333419a8f1 100644
--- a/arch/arm64/kernel/patching.c
+++ b/arch/arm64/kernel/patching.c
@@ -178,17 +178,16 @@ noinstr void *aarch64_insn_set(void *dst, u32 insn, size_t len)
 
 int __kprobes aarch64_insn_patch_text_nosync(void *addr, u32 insn)
 {
-	u32 *tp = addr;
+	uintptr_t tp = (uintptr_t)addr;
 	int ret;
 
 	/* A64 instructions must be word aligned */
-	if ((uintptr_t)tp & 0x3)
+	if (tp & 0x3)
 		return -EINVAL;
 
-	ret = aarch64_insn_write(tp, insn);
+	ret = aarch64_insn_write(addr, insn);
 	if (ret == 0)
-		caches_clean_inval_pou((uintptr_t)tp,
-				     (uintptr_t)tp + AARCH64_INSN_SIZE);
+		caches_clean_inval_pou(tp, tp + AARCH64_INSN_SIZE);
 
 	return ret;
 }
