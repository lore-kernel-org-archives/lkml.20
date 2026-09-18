Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EE94EB86B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743171; cv=none; b=jtWx2QmZCek+6mYQAZhe8uw9ZpaG15mDS5tHDyhLR8y0EZSFZtwLKk6r7lXmz07XR3zAHPjeGezqIIwrPrim1juBqJJCfUukSOksRMOiWlMOr/4tQGBh24isM3K/hvPBc7mKRDliN/TK6+UWC0UnIZoHvAOXk9N9IPCShuDNplA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743171; c=relaxed/simple;
	bh=mWRZZ6BBAjqT1qv3Efrr6MczArWxlWU63jhZWwDXQ0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WupjZ1yM8v+AEWGG4AAJ0r642tVz7xqgj/ydgeW/41ul8KnLKHDJgNrzMwhDeMGQ8ubsWVOI+6gu1UzB5EIBIaU736FTLlDWmWj6cIBMJ0f5oDc4Jkf6WVgtPLqSaqIr4KBH/O573V/hGiDHp5krtzPsULprV9Zd4OOi/yaSHVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WRftyuq/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WRftyuq/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC8F81F000FF;
	Fri, 18 Sep 2026 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743166;
	bh=VCnnNwKBB0XRywr/Vc3O/6cLu3sgQ2JLHYFPLu8h1J0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WRftyuq/RmmC6cW0sRd0VLBJO62mJpS2v4GqQofsAPdZ+sjjCvWVYKjzupCjiQPKq
	 WEYXsmk8XlD+njTl+5J1ak/3mYADK6GHDIvesxTC3D2lKpLS09z5z9sXa14G7ogXuN
	 qOLRW8ttF/vNboxZLtAuDojS3MUrwEHrAO36b5Q+eFq6clx/ly5L1T9olPK8Trx0iO
	 VjB0QpjfoLmTQWf8cCcvcOVkBLSUN/dUMI6GElmdR0SbSijEO+FRYT5tBNaUpU2rT1
	 wNA66bH3tduO9jo/rnDU4JoMlNXg7cEevFEsi8a1Pzd9HTjBf2gMkUzH4fShkwxePH
	 OdJJaJm8j9m7A==
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
Subject: [PATCH v3 07/13] arm64: vdso32: Always build compat vDSO object as little-endian
Date: Fri, 18 Sep 2026 15:52:09 +0100
Message-ID: <20260918145217.1669-8-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918145217.1669-1-will@kernel.org>
References: <20260918145217.1669-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Big-endian support on arm64 depends on BROKEN. In preparation for
removing the dead code altogether, remove support for building a
big-endian 32-bit vDSO.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/vdso32/Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index bea3675fa668..00efdc5d2354 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -45,11 +45,7 @@ endif
 # From arm Makefile
 VDSO_CAFLAGS += $(call cc32-option,-fno-dwarf2-cfi-asm)
 VDSO_CAFLAGS += -mabi=aapcs-linux -mfloat-abi=soft
-ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)
-VDSO_CAFLAGS += -mbig-endian
-else
 VDSO_CAFLAGS += -mlittle-endian
-endif
 
 # From arm vDSO Makefile
 VDSO_CAFLAGS += -fPIC -fno-builtin -fno-stack-protector
-- 
2.55.0.1082.g2b9226bbc0-goog

