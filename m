Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C2D517BCE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748103; cv=none; b=hvsoarY8twsm/hjzQ0Kb0M5/Sm4GYO4KlM9FJBXSxwh1G9uqDv+esyKZjrjxVDK16ywDckMOLkc7Ub79ECC36lpbcvyr6CnTNZJt/KCERpTI0/Q4ljjJIhOZxRgzKVEjqHGUr5aggXYJe7p806qRzbWfX6WPArX1ETprRcUsrTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748103; c=relaxed/simple;
	bh=DK9Y/UMpGFKL933fN/ZhyfaYUwcJNs/SMB/QpAPXVLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NSRPR7wSmw2I5f1p43NwBKuVOZ/oKh6bCEOT4FnJGyqmblG4cbCmnJuX/oFJPscG++KRCcQ8C3PjClvl0OAFjKkAltnf/vEgMGBz1DnO4rgAwKWiVSwYNkceJDSC3zDYCxK/yzVxP9/TiIO9EqauXNxVLOBzVt97q9/sNvK3omI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BpMwUcXt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BpMwUcXt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF501F000FF;
	Fri, 18 Sep 2026 16:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748101;
	bh=Tc8GR7rTTo27bA7yHyZhX9hh9yph2GkWra5UE2xqfbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BpMwUcXtxZXvVSt7IywpT3I566I5Wb9vA+b1HRQ0SPTXq31VO5Co5iAq1W1lssnp+
	 IRFyEi/tH1AwRv4wOS9f00oUX4wA4BGBgQYEFHmVRtbVwkEa7E9ynmxDJoyxPQHoza
	 FqFdiKbeyxonu1drcwS0+otlkvWbj/Cm3sc6R9u9TW3VMtSLcqnugO3TFIKBJ659P3
	 VIBg6/F5AoGPaTLb0A27uHciXsGIElTW00LAeCsI5a/w372TjfMF4FF4S2wb4RvnxS
	 h0aTrKhu6AtkY1O02DW3VjZqu+oUnMuAFU7prdjm+52PTI1QjUvir49tbHIunMVEVO
	 w1JYAxdBenYQg==
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
Subject: [PATCH v2 13/21] arm64: sdei: Guard most of asm/sdei.h with CONFIG_ARM_SDE_INTERFACE
Date: Fri, 18 Sep 2026 17:13:57 +0100
Message-ID: <20260918161407.2300-14-will@kernel.org>
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
2.55.0.1082.g2b9226bbc0-goog

