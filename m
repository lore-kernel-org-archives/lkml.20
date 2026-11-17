Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899233;
	b=ntePAn7HHMcKSOsO3AQphPmK/xpeoRcMf9miTXWTKWPG+qq0rzRCPnRJULsAzDla81kk
	 KS/H+b7u7GZGa0cSCPWZHsxuI9XVO58lpHoW7ATkjOlaZgKIPhmSU9iTCyJIkB9plPlXJ
	 g2P4kEECf3OKYnBBoRVorB+3UMYyfSU3GXnrKl1jhW1/yMJfkdyLFrfxd8bFuQIy6AcCT
	 GTVNscJQR7ZL/8flVLMwFcQMgb6gzmoZoAx60cWn6WfGKjLDz7OvFoFthXqMDsOjAp+8Z
	 heJGpJoulo2NMn20ndFHjQeOHCCZaRGpOuqZPE3RUt0R/vsH/r/go+9Nd98ATN0HdLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899233;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mTjrX8BPMgEQvF/l76KpwD+d59uY8XaGkIgLG0DayPI=;
	b=r1AVoNzO/n6+GaAG+KPwhPKCTcGYSPLXkNYZh63OMz2GdurRduTYn5/Xe3euSd8V+633
	 fQ9vNhEGzRQ5Gra74doIXkX0KTitPRBWtf88qplNYbJh7SOXcSwUcuHD3pDJgD1AMsL7P
	 FpJ6ckBYdVxoKBNmmy24sCOINKvTGTFUHLuBjCPoMpqRV1XUrEWvb1WTElaRF/W7IHQuw
	 KpbsFMiWE/8wZNXWxH9v7CUtJVOK0yfu6FlRPyThGVuFl2eS+XI0OHRtKENQrCjC2Lc5n
	 kfhj9tfR23MhHJB2ObpH68qSpqvXfar6zCBmzOFDE9i4qy+MZELvxVZ9rOyCNNbNNUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=rYq6QArb;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F191B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F191B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=rYq6QArb
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C1D21476;
	Mon, 16 Nov 2026 23:07:09 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A32693F763;
	Mon, 16 Nov 2026 23:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794899232; bh=rJVnBpFL56QP0tzbwghdHJEf9E+Td6sJ8tYNwYNyfgc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rYq6QArbfWSLm8uS4OkY1zm8Ij6CSl/yN+vvIKSfIqJ+H9evA70BjDxNkdbkDldEp
	 eXRqqVIRMJQMqFwLfnwstjodMH4kyKA1Ac5jzWKcjLNGqKROOSWRcuOro4tf7HXTU2
	 HA2E7d0rj1VNO/iTkODSsEKMM85G5R99qliEUCJI=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V3 13/14] arm64/mm: Make ARM64_D128 selectable
Date: Tue, 17 Nov 2026 12:36:12 +0530
Message-ID: <20261117070613.1183243-14-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117070613.1183243-1-anshuman.khandual@arm.com>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All required changes are already in place including the TLBIP instruction
support for enabling D128 translation. Just make this new ARM64_D128 user
selectable, after ensuring necessary tools chain support required for the
new instructions being used for D128.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/Kconfig | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e54cff118f8a8..83faac63e5612 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -272,6 +272,10 @@ config GCC_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS
 	def_bool CC_IS_GCC
 	depends on $(cc-option,-fpatchable-function-entry=2)
 
+config CC_SUPPORTS_LSE128
+	def_bool CC_IS_GCC
+	depends on $(cc-option, -march=armv8.1-a+lse128)
+
 config 64BIT
 	def_bool y
 
@@ -2385,8 +2389,17 @@ endmenu # "ARMv8.9 architectural features"
 
 menu "ARMv9.3 architectural features"
 
+config AS_HAS_ARMV9_3
+	def_bool $(cc-option,-Wa$(comma)-march=armv9.3-a)
+
 config ARM64_D128
-	bool
+	bool "Enable support for 128 bit page table (FEAT_D128)"
+	depends on ARCH_SUPPORTS_INT128
+	depends on CC_SUPPORTS_LSE128
+	depends on AS_HAS_ARMV9_3
+	depends on EXPERT
+	depends on !VIRTUALIZATION
+	depends on !UNMAP_KERNEL_AT_EL0
 	default n
 	help
 	  ARMv9.3 introduces FEAT_D128, which provides a 128 bit page
-- 
2.43.0

