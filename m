Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BFC51D50B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799087; cv=none; b=r0e8oXwOFCWinNNCrrfU8vvXFSQLJf0mbUnBFo4hhQgKMq4Gkn/6yiJtO2LE+1Uvzp1JYVxrruizb24RFJbsTouPQkPP+7vnqUfST35fLq95mwpvDbhdlZlAzrirYFcQUWghyFlTRiLT96o1hKntpe69jKX2x7Gy7XGiZwsvw54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799087; c=relaxed/simple;
	bh=MnRPA9AN2CdwXmQGgMxKMsHnto++QWhAOF8Mj15Zo0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o4QvwgKV8CyuYo+LV/bbN311Fbd9f/9w8Kql9ypeVHLpat8ERpXO4QIw45mlx90dziVso6gnAib8BHi1Ih5x46Nc59B1GAhhre0Np+41D/FHwPx0pkI9eZAyFGNIaUM8SOFZ5StToQeNmH+rv/5dkfkNjRow8D3KuRINsTOuchU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WpfsWqlr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WpfsWqlr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48FF71F00A3F;
	Mon,  7 Sep 2026 16:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799081;
	bh=KGGBej+SQ1I6McGtzO0CVbCK2WO3o2hwjiZoBeg1MN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WpfsWqlrMUwBRR1EH5ZCqpwogDEm/CJPNWtWBEtBuooS4VzUmdPlxEaUpushCM7H3
	 4RMuouTvrtIiPlTeuOAPOLGdjR/y25iJ+JgiPnehcL99HHqvkRoOgsZUZD6+ODyN64
	 X4DqP50cqC+NYF5B1jLZcMFCvdPZRr5HiZiRhUdzjyRsWgboCMoekZ8atcIt4X/RA6
	 cFZI4IrN4aYpfO3mobi1Oei/S0m7KtXOtkDe2skzhJqGRepY7kmhVrfiK4VqOwUVyb
	 N8Lz4JPqQ01wgGQbH69mXYZZqbJR/ozVLBeaNHWUkqujrdE+kHmkSUdO1RrE6Z99uK
	 ZojZErFH/0zLg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 07/14] arm64: head: Force little-endian early during boot
Date: Mon,  7 Sep 2026 17:37:18 +0100
Message-ID: <20260907163726.17104-8-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907163726.17104-1-will@kernel.org>
References: <20260907163726.17104-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 2ced0f30a426 ("arm64: head: Switch endianness before populating
the ID map") configured SCTLR_ELx.EE at boot according to the endianness
of the kernel in case the bootloader had entered the image in the wrong
endianness. Additionally, if the MMU was enabled in such a case, logic
was added to turn it back off to prevent the hardware walker from
misinterpreting the idmap page-table.

Given that the MMU is only expected to be enabled when booting EFI, EFI
only supports little-endian and arm64 kernels cannot be built as
big-endian images, we can rip out this handling and simply force
SCTLR_ELx.EE to 0 (little-endian).

Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/head.S | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 8951ce693552..d5c1ea0c5b3c 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -138,29 +138,11 @@ SYM_CODE_START_LOCAL(record_mmu_state)
 	b.ne	0f
 	mrs	x19, sctlr_el2
 0:
-	tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f
+	bic	x19, x19, #SCTLR_ELx_EE		// Force little-endian
 	tst	x19, #SCTLR_ELx_C		// Z := (C == 0)
 	and	x19, x19, #SCTLR_ELx_M		// isolate M bit
 	csel	x19, xzr, x19, eq		// clear x19 if Z
 	ret
-
-	/*
-	 * Set the correct endianness early so all memory accesses issued
-	 * before init_kernel_el() occur in the correct byte order. Note that
-	 * this means the MMU must be disabled, or the active ID map will end
-	 * up getting interpreted with the wrong byte order.
-	 */
-1:	eor	x19, x19, #SCTLR_ELx_EE
-	bic	x19, x19, #SCTLR_ELx_M
-	b.ne	2f
-	pre_disable_mmu_workaround
-	msr	sctlr_el2, x19
-	b	3f
-2:	pre_disable_mmu_workaround
-	msr	sctlr_el1, x19
-3:	isb
-	mov	x19, xzr
-	ret
 SYM_CODE_END(record_mmu_state)
 
 /*
-- 
2.55.0.979.g7e5102b832-goog

