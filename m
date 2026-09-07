Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFB35237B4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799422; cv=none; b=qyePl9P2kQf2cweLbqiSFkHYMEnxALj7ZiWwMK2axpuOD3z/b/kontTNEUdqQfwBQXc6qpN+JqJTOA7kHPAoMXky5xbRrmi+AScOkECXGbGxgxXMkiAJ3CWS2e9k1itmFEIKVNnJgXw6Y3noN7REWe62dwOS7qHpwefbMm/Mdg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799422; c=relaxed/simple;
	bh=VPWowJvK15xsXi1SZkwQMJUYNAEQsBs1HUGpzkBeg/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MjAiBCunoJKl6dvjLhlqog681yiUuiMBcC3JjD9XTk8j3/QFI9wwmqpnwqVg5yMHVzW7Knt8d1kvFYCzfQtAwl39MO5c4ahybqotOMaJZqEZp3xGzYRcPiLXd8pd3wHvNlXy4XELVT44Ai7Q+nRvfkQKvj6kqmeT9Hgey97XAYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jnfY20oN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jnfY20oN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6AC1F00A3D;
	Mon,  7 Sep 2026 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799421;
	bh=etbcsch4QcilvSyBQAF3RxNP3Gl+idZnVnuLeHsdrpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jnfY20oNgXj012V/khZlVSp+qpxna1T1uqFca5dEDuqQ4E8xQQrHqiiHTWssX7Umz
	 plmSMPw/pb/GwkN/X2j8SpZSdHMug2c+CNLxMxG/sjqQ3NYrJptOmUK7rmQRXvvQPI
	 qvTxufELRqMHo59cqDtmMXSVNgyYpPEtghSGOWYylSC68cJBaEgp32ZwWwhZsXlhvt
	 y0M2QAX3PeVvcd39+6+byr8isG9sI0zYqFqbzWDyKNAZ/e/i+mZ2NZp4U8Gv7eXTv9
	 wilPNCyR3xIbgyx559xkbB9MAXXkh/lpwA/RdJ/hgChf+0Q0KCT63nBZcbQCB54xCo
	 kimXZKgbO4gjQ==
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
Subject: [PATCH 12/21] KVM: arm64: Preserve handler/thread bit of EL1 mode in __finalise_el2()
Date: Mon,  7 Sep 2026 17:42:37 +0100
Message-ID: <20260907164247.17223-13-will@kernel.org>
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
2.55.0.979.g7e5102b832-goog

