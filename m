Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9F351FCA4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799388; cv=none; b=E2Rbjbc/yn/TNmJVV0WJSbufuzGfl3Vm96PZ8urfM7A1+No0FZXDHKLLDwJkkdXUxD7OE2dyUjufRU6ymF7nUbDpXXC3n4L9SDTjDcg6Nqv6lB4L2kzIts0ZesWOmxdvO3Irmyfejg37rWvUo3Xu720pHEcpNb45nDJb2SUTiHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799388; c=relaxed/simple;
	bh=T0AGVyN1eYv+zr11+s5U3YSKlu3+XotRoLe2H25gaVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qVXqCa7coWC+Mr+Eol+eps6wmLRTW1D/P6qPt9XNHNhyU4uejgrkjGn0b5HMC3UWd/Adth82p0bhf+Wu2JsrQXHvb57AgL3x7qnLuTesS+5QC4FSwe/HA9m5/qL1VcWj8fxpgMvHABp9A7Xo9UmqbJw8WrexA+6Dxrm6bMZAk0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cr7pWeK6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cr7pWeK6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE131F00A3A;
	Mon,  7 Sep 2026 16:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799387;
	bh=lMcv+fJIFUpeFRCmf9ya4J/neAxp4gqF2gal+tnA2+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cr7pWeK6EldNr1h/xUgngyA4ZLJ0dgvByNM6MeAoptHgqtSNTGn291nm6gxD7VRXg
	 M+jZxwgy4hu2Cyk1NOmEKWjcKJHdSBJ2YlP+H1eBCz78ruzLy2/8XIbRc6kGTBRpqw
	 LC2K8CyxlDoQYI/j+ULq7KdTDdKep4tSElijKtOQQzNAIqNpY1pg4A2qJ+n3uVW3yf
	 n/yXMGHOAJkMycYxkwGOGoysHB1zhQUfpomZiVAY2DKQT10cMLFoECo8ZDp0Ozque9
	 9mBnlbtRwC27zWvUlGOwPi5Fp0YAP/rNYk5Kye8CFPEUqlrW4wLeZy85Tgp0HYHMN1
	 wnaRaZVmL657Q==
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
Subject: [PATCH 02/21] arm64: entry: Only check for stack overflow on exceptions from EL1
Date: Mon,  7 Sep 2026 17:42:27 +0100
Message-ID: <20260907164247.17223-3-will@kernel.org>
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

Checking for kernel stack overflow on entry from EL0 is largely
pointless and gets in the way of using SPSel to switch to the overflow
stack. If the kernel stack overflows on entry from userspace, that
implies that it was unbalanced on the last exception return which means
we can't sensibly reason about the state of the system given that we
could've returned to an arbitrary virtual address in an arbitrary mode.

Remove the stack overflow check from the EL0 exception entry path.

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/entry.S | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 59f045e496ec..b5d8277f608a 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -54,6 +54,8 @@
 	.endif
 
 	sub	sp, sp, #PT_REGS_SIZE
+
+	.if	\el == 1
 	/*
 	 * Test whether the SP has overflowed, without corrupting a GPR.
 	 * Task and IRQ stacks are aligned so that SP & (1 << THREAD_SHIFT)
@@ -64,8 +66,11 @@
 	tbnz	x0, #THREAD_SHIFT, 0f
 	sub	x0, sp, x0			// x0'' = sp' - x0' = (sp + x0) - sp = x0
 	sub	sp, sp, x0			// sp'' = sp' - x0 = (sp + x0) - x0 = sp
+	.endif
+
 	b	el\el\ht\()_\regsize\()_\label
 
+	.if	\el == 1
 0:
 	/*
 	 * Either we've just detected an overflow, or we've taken an exception
@@ -96,6 +101,7 @@
 	sub	sp, sp, x0
 	mrs	x0, tpidrro_el0
 	b	el\el\ht\()_\regsize\()_\label
+	.endif
 .org .Lventry_start\@ + 128	// Did we overflow the ventry slot?
 	.endm
 
-- 
2.55.0.979.g7e5102b832-goog

