Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3D54E9C30
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743172; cv=none; b=j8pMR8hW7nOIBNJ0yI2R7AlBM97BGTZh7jssua9+gy/HX8Z3/zg9qC+YzhEyqZyQfQn3EK174F/1X56SpyDSohapCkmGoAoEe/LQBBPQJys5aEwyxXfqSgXjvW+tSI1vlX3egywfeuN7yyiCdO6vmlnoQrNM1+OrDRjG1EhOsZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743172; c=relaxed/simple;
	bh=BoUmYnWOYfnAaRUJUlnuX7RJ0UQZ3a6vkCMSMrOLZEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JHEJef1hu9mWleiprrlt4qVF2hUQq5iwOl/TuSGxFFECDYczoOXWanhha+NHgqT4v/fBK7WT/7Fp0o9mGMV6Mt15y2Vo0thvG+HsVIJB9nEm80+0e2YqinEsGDO+5Yus3zi8H6Y2Zffsc1zZimHwUcSPlzhEie8duRO3mKV3WnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPQ+3eDy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPQ+3eDy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10541F0089A;
	Fri, 18 Sep 2026 14:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743169;
	bh=GrCX0Ti81C+Hj7BQSUz+xSZkyEBawt04a27wa3CMR0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jPQ+3eDyMb1tGAyKTnqkOK0d5jdyAmFqtpGBFAcbieLdNArtPmnDyQSbvyrgFD5Lf
	 UbDpYnyeLdPl/2xXf1/jaQVVUq8tr84uiaq5z+RlQFzve283UrWne6MIir3b7Adj6O
	 nuMkt+/okgIva3YEYH95Sgu46BGc9iF6zYPqlZp2PNoYlXrnKjRCCC2WuqqpxD7ng+
	 wKidpV95DH12OBKZ1yLNbx6Y/ug0kd/4OzMSSQj48mD/+x2SASOY/NV1tuEBOZWd9X
	 NztHacHhd4Ym4E8VZ8eqqqBairuZU/0vXhAVmdSH8H/imojDwUzV7U8eoSw0WsI25H
	 eT/Qz71aMquiw==
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
Subject: [PATCH v3 08/13] KVM: arm64: Remove support for a big-endian hypervisor object
Date: Fri, 18 Sep 2026 15:52:10 +0100
Message-ID: <20260918145217.1669-9-will@kernel.org>
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
removing the dead code altogether, remove the support for generating
ELF relocations for a big-endian hypervisor object and drop the unused
big-endian spinlock definition from nVHE.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/include/nvhe/spinlock.h |  4 ----
 arch/arm64/kvm/hyp/nvhe/gen-hyprel.c       | 16 ----------------
 2 files changed, 20 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/spinlock.h b/arch/arm64/kvm/hyp/include/nvhe/spinlock.h
index 7c7ea8c55405..b6978f03e86a 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/spinlock.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/spinlock.h
@@ -20,11 +20,7 @@
 typedef union hyp_spinlock {
 	u32	__val;
 	struct {
-#ifdef __AARCH64EB__
-		u16 next, owner;
-#else
 		u16 owner, next;
-#endif
 	};
 } hyp_spinlock_t;
 
diff --git a/arch/arm64/kvm/hyp/nvhe/gen-hyprel.c b/arch/arm64/kvm/hyp/nvhe/gen-hyprel.c
index b63f4e1c1033..99243e0fefb0 100644
--- a/arch/arm64/kvm/hyp/nvhe/gen-hyprel.c
+++ b/arch/arm64/kvm/hyp/nvhe/gen-hyprel.c
@@ -139,28 +139,12 @@ static struct {
 	const char	*sh_string;
 } elf;
 
-#if defined(CONFIG_CPU_LITTLE_ENDIAN)
-
 #define elf16toh(x)	le16toh(x)
 #define elf32toh(x)	le32toh(x)
 #define elf64toh(x)	le64toh(x)
 
 #define ELFENDIAN	ELFDATA2LSB
 
-#elif defined(CONFIG_CPU_BIG_ENDIAN)
-
-#define elf16toh(x)	be16toh(x)
-#define elf32toh(x)	be32toh(x)
-#define elf64toh(x)	be64toh(x)
-
-#define ELFENDIAN	ELFDATA2MSB
-
-#else
-
-#error PDP-endian sadly unsupported...
-
-#endif
-
 #define fatal_error(fmt, ...)						\
 	({								\
 		fprintf(stderr, "error: %s: " fmt "\n",			\
-- 
2.55.0.1082.g2b9226bbc0-goog

