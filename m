Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD287515895
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748099; cv=none; b=CgGtXmnIHd0nOepWr95Csf27HZGwUnBR6Y+uZyeOYjrbCr+i6sIzgLyqP78IG/rOS7IXZu/j0rpUOodXMYg6kqBZlj4HSCunQ6Z/2naPyF1DjyH5qFkrz4IC/u/XKvv44wZB5OITML1cSYTTf89i8EN8Wt9oiUquNjC1s6R09J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748099; c=relaxed/simple;
	bh=Vr7db0umz6Dh0P5DWn6iaRKwA4WHAyRAxkpJpgZhULY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gwhY2M5E0GBhWlRH30N6f9I+G6D+wLM0e2tSar8GFO3XZV6ksf2SgKBVHKMKItEisNz9LUqZugLHVldeUCzCkxAOl0OAOGsIgy59/ZlzMBYHaH6+q4n3UUxAcKG+/DrG7I4FjhrwsJeGYkjOJpxxZHaYVUESy4fhLXUNnSCbS/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KjrujF6I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KjrujF6I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF6371F00899;
	Fri, 18 Sep 2026 16:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748097;
	bh=OPmtMvErDChPnAkncAvX9/4lDdnZXVCa66ctdGe0lWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KjrujF6I8y3AN56jW7bSdjLKy8uypi9i70m0KIMGyZzzAZOpzq6tSGxK4t1tdRAml
	 j4isO93RUuPAhEifUXnYxsswhXO4mAj1efZp0KL+1wnE47A1YQcZwkN43GqxvstJ5s
	 wed0kDmZZwVnlLug6QXUj2vwe/lpG6HT5LU4TtMHOpn3q54KSDwvaCEmB7JzJOvSxY
	 3D2EWtoM5pjXNy4ZFI91JATLqj+mSK+cKzU5H60uiRzkkhxalzeQ2UEk4w1iAhqPQ1
	 WSFKUUfUSXJtSP/EtGUdrszLLl+2ce2vYjHztTN2vPLJdGhNQYwwwSMD3pYUwziXg6
	 PHiiyoYRz7N5g==
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
Subject: [PATCH v2 12/21] KVM: arm64: Preserve handler/thread bit of EL1 mode in __finalise_el2()
Date: Fri, 18 Sep 2026 17:13:56 +0100
Message-ID: <20260918161407.2300-13-will@kernel.org>
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

__finalise_el2() unconditionally returns to EL2h when VHE is being used.
In preparation for handling callers from both EL1h and EL1t, preserve
the handler/thread bit of the calling mode when rewriting the exception
level in the SPSR.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/uapi/asm/ptrace.h | 1 +
 arch/arm64/kernel/hyp-stub.S         | 7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/uapi/asm/ptrace.h
index 15649a253a57..25d9d9a0a6f7 100644
--- a/arch/arm64/include/uapi/asm/ptrace.h
+++ b/arch/arm64/include/uapi/asm/ptrace.h
@@ -37,6 +37,7 @@
 #define PSR_MODE_EL3t	0x0000000c
 #define PSR_MODE_EL3h	0x0000000d
 #define PSR_MODE_MASK	0x0000000f
+#define PSR_MODE_h_BIT	0x00000001
 
 /* AArch32 CPSR bits */
 #define PSR_MODE32_BIT		0x00000010
diff --git a/arch/arm64/kernel/hyp-stub.S b/arch/arm64/kernel/hyp-stub.S
index 37c6976e44a4..f61778cccd3c 100644
--- a/arch/arm64/kernel/hyp-stub.S
+++ b/arch/arm64/kernel/hyp-stub.S
@@ -149,10 +149,11 @@ SYM_CODE_START_LOCAL(__finalise_el2)
 
 	isb
 
-	// Hack the exception return to stay at EL2
+	// Hack the exception return to stay at EL2 ...
 	mrs	x0, spsr_el1
-	and	x0, x0, #~PSR_MODE_MASK
-	mov	x1, #PSR_MODE_EL2h
+	// ... preserving the 'h' bit so we don't swizzle SP.
+	and	x0, x0, #(~PSR_MODE_MASK | PSR_MODE_h_BIT)
+	mov	x1, #PSR_MODE_EL2t
 	orr	x0, x0, x1
 	msr	spsr_el1, x0
 
-- 
2.55.0.1082.g2b9226bbc0-goog

