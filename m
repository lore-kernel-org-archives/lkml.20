Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8945221E8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799412; cv=none; b=rJ/XGb4trjrzzlj9iQHZHmOVRs7T/VoNNEowVgbR7caL10UI+CBFyFgmYzazT4k6S2w4JxgvMjnsXXGtYysyD1T1rBcXhTAmFj/WToz50lUj0zqzmuDsfXaUmwHFw+rY1S0ucYxFsDSKKFsSDA0Jg0sVUppFF3XYY3UDC51I7gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799412; c=relaxed/simple;
	bh=6RQZewVhm6Oiv8hNrNgoANtVVMSOgPWcOO8HlIfY+RM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3yZ7rjK1eJG6EFGpLTaw+5bK282D9pEIKTBPNexc2k27ds1WPFUBYMWvckQCveEzrL2DjWy995q9RvojY98uY9GbvozYHOasfKwLlnoOLQEbGHiKbEcmFf6E8ffk3Hj+I/l0yovE9mY6Up1RiSyaQCrLdsESCdREy8cRZydnjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NTWw5g9E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NTWw5g9E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12ECB1F00A3A;
	Mon,  7 Sep 2026 16:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799410;
	bh=33ikSkJFX7Vey/KunqKuY1Z4p4KTCUzmgh5gA1LOfSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NTWw5g9EYJc4qx5bnJPDjgft6wRNu+H5aoJU2ti+7HObaCaoC+7/h4BrXra3BA0tL
	 IGPDCHxwjGtg6yc1AnPO5SxXZCewBIU7aPPnHJ6WoRp49HQyOO7QBUui3geNafL4ht
	 5Qqcma/fvoVwt3ipbTrTz7QpMmQZey0QO0dPRDxigxBw8mVBwz1y0Uzt8OGaOECGXY
	 nsdJtu7rPtzl2udDSFux6/TdsN7FgFwlIcXl191lBPX7J8I2JgqrwfKwmxAN14BKxn
	 uvrP7n9a9k/Uz1/ATlMWSHXCjHSmIZ/LcyAOmUFpD8dt8Ln5U/EOMErPWOHaNO12Ir
	 L7VoAuUET005w==
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
Subject: [PATCH 09/21] arm64: stackprotector: Re-enable per-task stackprotector
Date: Mon,  7 Sep 2026 17:42:34 +0100
Message-ID: <20260907164247.17223-10-will@kernel.org>
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

Now that 'current' resides in TPIDRRO_EL0, update the per-task
stackprotector compiler invocation to use the new register.

Note that this requires a very recent build of clang [1], as (unlike
GCC), it historically rejected all registers other than SP_EL0.

Cc: Mark Rutland <mark.rutland@arm.com>
Link: https://github.com/llvm/llvm-project/pull/188054 [1]
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/Kconfig  | 3 +--
 arch/arm64/Makefile | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b8270b301809..020fcaf36b1b 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2450,12 +2450,11 @@ config RANDOMIZE_MODULE_REGION_FULL
 	  exhaustion, modules might be able to fall back to a larger 2GB area.
 
 config CC_HAVE_STACKPROTECTOR_SYSREG
-	def_bool $(cc-option,-mstack-protector-guard=sysreg -mstack-protector-guard-reg=sp_el0 -mstack-protector-guard-offset=0)
+	def_bool $(cc-option,-mstack-protector-guard=sysreg -mstack-protector-guard-reg=tpidrro_el0 -mstack-protector-guard-offset=0)
 
 config STACKPROTECTOR_PER_TASK
 	def_bool y
 	depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_SYSREG
-	depends on BROKEN
 
 config UNWIND_PATCH_PAC_INTO_SCS
 	bool "Enable shadow call stack dynamically using code patching"
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 6b005c8fef70..a293ab67818f 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -72,7 +72,7 @@ ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
 prepare: stack_protector_prepare
 stack_protector_prepare: prepare0
 	$(eval KBUILD_CFLAGS += -mstack-protector-guard=sysreg		  \
-				-mstack-protector-guard-reg=sp_el0	  \
+				-mstack-protector-guard-reg=tpidrro_el0	  \
 				-mstack-protector-guard-offset=$(shell	  \
 			awk '{if ($$2 == "TSK_STACK_CANARY") print $$3;}' \
 				$(objtree)/include/generated/asm-offsets.h))
-- 
2.55.0.979.g7e5102b832-goog

