Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B955D524AE3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799425; cv=none; b=UFzB0Yqs0ygozT7246Tk8kPXko8Zet7uK4YLecwcb93NoQiuhCwOmeK+5D6DZt1ReSOGTnWCYUmD3n+PcoTh8XcpoXACuBsMgWNprD+4eLYBRHhnvgmyhL8HLjs6NmJInwa2bKu2uRnvTnh5geCvUmHcn5JIAKtiCQz6BhuwC+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799425; c=relaxed/simple;
	bh=x0XDDGaaWxHFdmMETaK1MfWAAjUcBaZjEM1PMLXBU0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NAlfxMvrgG/9jEKqxsiWWDMVlEmCsW+jxV6byjms5brfudGnp7/u3tA8OWDfvPVEOHnlvFp+F2iugJqNDI13D9nhb95fN7iP6W1pamlbLKFLuDnEqSWSL0sIWfQ2bl1dwk1G+5hix/5QhEfOPARimpWJpQbc2T+rTvae9mcQQAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZAOrzDF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZAOrzDF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3631F00A3A;
	Mon,  7 Sep 2026 16:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799424;
	bh=BDzhVCGue3W4kwX6q3tsgotgwxJZX9yA0SsacigpNYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YZAOrzDFErWk3qZZVEGDOIMnCekrj4170ZlGWStK7PD50ym+iC3IY3aj+kuuwp9IY
	 B0avZObpJ/Y9ymL+p+BNseiK/9qb3m392BtWLOwUZXQDs/YReY54IZjdSRf84q26zX
	 FcpMciaj7TZay4t7sVRKnAXiTDVIqMHa6HiSNY892+M3ptpl+K3ulEwwBYWLjzrE9s
	 4MBO08lLI5NPBV6UGitz7r4Qo2yagHRQVTJ0d5M3blebpb+dvFNrSr/+VnbsRuL7N5
	 D3vMW4c7Yw+QKY4Mva6xFM8DpaUY1eR2uZTBOmsltFx5sCVdSYwPsmGthjIQC/4nJz
	 FxVi4mbwg3sSg==
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
	Marc Zyngier <maz@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 13/21] arm64: sdei: Guard most of asm/sdei.h with CONFIG_ARM_SDE_INTERFACE
Date: Mon,  7 Sep 2026 17:42:38 +0100
Message-ID: <20260907164247.17223-14-will@kernel.org>
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

The SDEI header includes are a bit of a mess: linux/arm_sdei.h only
includes asm/sdei.h if CONFIG_ARM_SDE_INTERFACE=y and then goes on to
provide a definition of the sdei_arch_get_entry_point() macro if it
hasn't already been defined. asm/sdei.h, however, defines the same macro
unconditionally and so this breaks the build if CONFIG_ARM_SDE_INTERFACE
is not set and asm/sdei.h is included after linux/arm_sdei.h.

The kbuild robot ran into this situation with randconfig testing, thanks
to the transitive inclusion of asm/sdei.h via asm/stacktrace.h.

Guard most of asm/sdei.h with CONFIG_ARM_SDE_INTERFACE to avoid
redefining macros provided by linux/arm_sdei.h.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/sdei.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/sdei.h b/arch/arm64/include/asm/sdei.h
index b2248bd3cb58..b96eb9e22d4b 100644
--- a/arch/arm64/include/asm/sdei.h
+++ b/arch/arm64/include/asm/sdei.h
@@ -9,6 +9,7 @@
 
 #define SDEI_STACK_SIZE		IRQ_STACK_SIZE
 
+#ifdef CONFIG_ARM_SDE_INTERFACE
 #ifndef __ASSEMBLER__
 
 #include <linux/linkage.h>
@@ -50,4 +51,5 @@ unsigned long sdei_arch_get_entry_point(int conduit);
 #define sdei_arch_get_entry_point(x)	sdei_arch_get_entry_point(x)
 
 #endif /* __ASSEMBLER__ */
+#endif /* CONFIG_ARM_SDE_INTERFACE */
 #endif	/* __ASM_SDEI_H */
-- 
2.55.0.979.g7e5102b832-goog

