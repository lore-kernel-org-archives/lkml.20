Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B17151D528
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799089; cv=none; b=BT3asH+ATq2P8NsxNCHzJ7DlsUPKn44YstRHhfjOWLVllPvVUGrLwL5Kh/Xp8uIsvdR+PqI9BKT/ZLbYI8Im7Q+Xep0kPzRKgDLF1slNpe52teooYaziLCY+63BK5n8XIcXRoBaJxI/mD9IpdC/Typ+RclJc5xmfaTHaHzRVqzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799089; c=relaxed/simple;
	bh=p4M6lxpHCBw3T7rMN4mFvzOcMlbgI5M8bXkMstTaB+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uXQ+n83AX/2iDpGn/Ejr9rr4z3TpiEIc/4iinO+roJugNuPtpWtiBPxkHRVf3mTo08qpFLY93YIdTchlRUUbkAJbNRf1QIplNUbuXrErFtgcB4tR3PgkO05gFMp4BpWE6Qe8qq1J56s5V4jP/Hx2MUF5ymFLfJUPQvPAabInF1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PwXXppz8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PwXXppz8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9F91F00A3A;
	Mon,  7 Sep 2026 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799084;
	bh=+JfwpOYvAv8ZYnfU3oq0MU6ImzI/HXu9p9BUtiuN48U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PwXXppz8RiCXsg/CuFuJF0bBs9LDVedC1gXhgY5HBFLvAcscR8NH11AAGkm+CkuCA
	 hBq0lhTVQECU9NWzI5G1gy7A7cGRhhafyU/9l7NJpTFaP28H96V6eaQcN+3CLZqNDn
	 DcNII+pNZNz/QdNTYhYnAHmGLQma0Rk17zm4Svm4m/C9ucEZ6OlgE06YD9D08Ls0Eq
	 3xtosPAj6UlWRoIaKwnner/gYH0QdlJfmX5VNb1s6PrKLfDC45oLPfS0OJ4O7kuNOZ
	 nu53RvlGLQ1BxVPY/yWQly0VFRbe1wQrGeyHHzXqUXUrLOhOASpnj9I7IDaDol9fvp
	 GY+R/B89W0+zA==
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
Subject: [PATCH v2 08/14] arm64: vdso32: Always build compat vDSO object as little-endian
Date: Mon,  7 Sep 2026 17:37:19 +0100
Message-ID: <20260907163726.17104-9-will@kernel.org>
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
2.55.0.979.g7e5102b832-goog

