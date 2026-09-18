Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93404516176
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748088; cv=none; b=pL+mw5ybao+AaZpXSz0Ksm5e530qRcOF8pXOfkNYfY228KCidUOBdvijW93Fwe3zfM7d6lwT8xglqIQ0hflvch25m4Dw64cWwkZtimJ2UzZimezxCvH7gAHRO04LQSpno26gYtDs+Amg+DI4q1ZuXYi7Vtz7lrfXSEfnmruQTkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748088; c=relaxed/simple;
	bh=JmhJGumalitAnkG+Of4OIu81PtkNzTEqVBPSWVBLvmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IBZmVSog9XduiHZMPDJl2K1d5fuiqccC0rfyJVFlRXw2vmAVBL2K/JQ46SjyrxviYzvGaQO+iuUwU/I1RGFFNDCxGMo7obq8cnLzTNxhPgaA1lIGgdH5iLYYoOoNNmoeT7T/L6MqPgICpHxoPWxipio81XwODJZpVW1a5NgjSrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qb0YxHlt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qb0YxHlt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650CE1F00898;
	Fri, 18 Sep 2026 16:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748087;
	bh=dtOLc80ZchH1SrJFHNt1KR4Dm3KMyagivA2zXxrs1go=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qb0YxHlt3q2DkGZ8Sdf5eTPdlGv44KUoKGREksMF7S+ufmYvYiQYiXZeo/ew3aUr3
	 4BtWfDhb/8qtxjgh1uAA7jqIAUiCI3k1MCNgIQRA9D/zNy1p8vG9szNXJod811+iX2
	 ltFzvp0/byPOhWY9lnSUdbO0nKnElVNG1C4vEh3LqYbuZNVFemTx1ddedSqmccvTdI
	 mUXS9g5py+KBJnKBFbz+FQkejtujW0lysjn7/7mqKoSL2BU+dd+IvncGgSmOECsljt
	 dV5UihvAzdi+mCEBychIY6zIeobzLCtiwlsZZ181aUFQA8iolhFMhQJtp+Kftj2Wbp
	 HVOW7lca2e+YA==
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
Subject: [PATCH v2 09/21] arm64: stackprotector: Re-enable per-task stackprotector
Date: Fri, 18 Sep 2026 17:13:53 +0100
Message-ID: <20260918161407.2300-10-will@kernel.org>
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
2.55.0.1082.g2b9226bbc0-goog

