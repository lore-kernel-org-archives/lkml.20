Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED58051D530
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799089; cv=none; b=rpW/yLOX5NOtEf8snsWaTFw6NlfhKprsPCY+gqMkBoy5fROBqld2JOi/mvcfe1BRYm8qgTSzalgHdAgZYkls3E5f8Hu61uYPJ2yU0364wj0ZTBl+LMnTbXVFsbGaUD9WvwXYos0iWv56YupsaPE0ZHripbMs2FkSrPHMw7m1ka0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799089; c=relaxed/simple;
	bh=lRU37Z3CS5Ukfa/69eEFglkL3ie2C/ZZ/lu9FPU2XP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jpFR92weU7shrBKw7Lbpch6Q5WvkzBCYj+0ZhLNGnY4NUD9x+Tikxa/2cVZeREkjQcDxex800Ca8XKhJ8gfBz8DCbMIHCEZc4GjWX9wQzPqXPS3D42TEPvH6mUcEcK0TtXWcpeU6BEOoEpACT3HKH/vz6Ui/RVqTQ7G9sQzCW8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IHkUFoHA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHkUFoHA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F46D1F00A3D;
	Mon,  7 Sep 2026 16:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799087;
	bh=cW6vuPa9TzUzmzyF3037nhED0lin8odzpcp8o8tSD7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IHkUFoHAWoATMA9skBKckKJbiStepXVxgZlqQCyIApc8bvESREAz3EHmC8ixRVLIA
	 /5ddaccV3CJw9u9CAMQF9S0c3nglJ2Xjm6FzHoTAx3jRy9ljbsVhj1ahzn284lqe9P
	 BlcWMsBiCGq6JQ54fR1INvZp42VCQk8ebmWheedEH1C/WXQ+zSwEZneae0ZyXKsAm+
	 /9wqMcALM9ld9E4ZtZtWhEnMbVGAsMFCrHwsgd5gCAJ2MERzur3eTzxpG5H1vuzmzj
	 3igibfbDMp2YRH3rTve/RNHBPr0SReAPZ3eXY7/fXCZHy17r3Nvv3p17bXqToTEucv
	 sdG8qa9f02vQA==
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
Subject: [PATCH v2 09/14] KVM: arm64: Remove support for a big-endian hypervisor object
Date: Mon,  7 Sep 2026 17:37:20 +0100
Message-ID: <20260907163726.17104-10-will@kernel.org>
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
2.55.0.979.g7e5102b832-goog

