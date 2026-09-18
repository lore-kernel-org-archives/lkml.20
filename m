Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F0851597D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748122; cv=none; b=sn6dURQ9zhEq9fP4SfIv5hrgilIYHJoozstSpepwaDUUlWh9GE6QoBecrDQ3EALpZBAmqi+Eq5fadzyKtx0rHgJ3DWfoidL326sU2LdB74gYNB2RdPzqRx3hIHzR/iqDj8YVYhf1zh1JCXXPThFNlOFeAMlpcEUWIQBpuVpI9Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748122; c=relaxed/simple;
	bh=6NR6+Zh/GpAz+hIS+YmPj16Sh+A3Ww9Id+QKN9qMaGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lYGRBK7YnVKb3LTBVtjg0J47Nncvld5BwNC6tMbbo3dmFuvKmibyO/ilvU8CRwf4xlpU1WXaxT11lKtXV4RlM0QYdtT0AwE4yNPX2LqFBAxs6ygZX+4BV5HB3l4zKNLvQET43Ixe0Sob3jGEIgZRVCZdqMfLOTsnsLatskx6BEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5rqkejV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g5rqkejV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2ECA1F00898;
	Fri, 18 Sep 2026 16:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748118;
	bh=kfG+kuuPyslNrsAkX7LF5I0fyep8WFQ1NzuAK6CzMzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g5rqkejVYdUdMoiDminapFdGn8UZKRPghhfEdAHDNIIJh8mQeEPS90eBpC77m7Vl5
	 V5EgImJ3N50lroLBZoIL0lJdlmM6OUeMx6vMGUande27V3lnZd4H3iM+qlwcVwns92
	 5gF6y38Fh2Cj/ALk7KmMjRaQBbHQCz9tMsLnsTt8wTpM0N8GyAwXD1aiRNKzNAJqYy
	 4eVsD95h7xLGCQOzFjXSyyCWtBalX3hC5LKV4AcqW4LAYZVMGZdZICzWjKFKPtrDOm
	 366L3FJ1BPQWP+5zkwN0JP+lMTvDAvbFRYTSamQP0TJ911vcoEZPuwvDiS5H3WRDyV
	 wdoknujOpAGJA==
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
Subject: [PATCH v2 18/21] arm64: entry: Split up kernel_ventry macro into separate helper macros
Date: Fri, 18 Sep 2026 17:14:02 +0100
Message-ID: <20260918161407.2300-19-will@kernel.org>
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

Handling entry from EL0, EL1h and EL1t in the 'kernel_ventry' assembly
macro is getting a bit unwieldy as the control flow becomes increasingly
dependent on the macro arguments.

Split 'kernel_ventry' into three leaf helper macros for EL0, EL1h and
EL1t, which are then dispatched by simple wrappers.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/entry.S | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index b4df2f23ebe7..38f9327e6a0a 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -36,10 +36,7 @@
 	.endr
 	.endm
 
-	.macro kernel_ventry, el:req, ht:req, regsize:req, label:req
-	.align 7
-.Lventry_start\@:
-	.if	\el == 0
+	.macro kernel_ventry_el0, ht:req, regsize:req, label:req
 	/*
 	 * This must be the first instruction of the EL0 vector entries. It is
 	 * skipped by the trampoline vectors, to trigger the cleanup.
@@ -52,8 +49,10 @@
 	.endif
 .Lskip_tramp_vectors_cleanup\@:
 	sub	sp, sp, #PT_REGS_SIZE
-	.else	/* \el == 1 */
-	.ifc	\ht, h
+	b	el0\ht\()_\regsize\()_\label
+	.endm
+
+	.macro kernel_ventry_el1h, regsize:req, label:req
 	sub	sp, sp, #PT_REGS_SIZE
 
 	/*
@@ -66,13 +65,23 @@
 	tbnz	x0, #THREAD_SHIFT, __bad_stack
 	sub	x0, sp, x0			// x0'' = sp' - x0' = (sp + x0) - sp = x0
 	sub	sp, sp, x0			// sp'' = sp' - x0 = (sp + x0) - x0 = sp
-	.else	/* EL1t */
+	b	el1h_\regsize\()_\label
+	.endm
+
+	.macro kernel_ventry_el1t, regsize:req, label:req
 	msr	spsel, #0			// Stay on the overflow stack
 	sub	sp, sp, #PT_REGS_SIZE
-	.endif
-	.endif
+	b	el1t_\regsize\()_\label
+	.endm
 
-	b	el\el\ht\()_\regsize\()_\label
+	.macro kernel_ventry, el:req, ht:req, regsize:req, label:req
+	.align 7
+.Lventry_start\@:
+	.if	\el == 0
+	kernel_ventry_el0	\ht, \regsize, \label
+	.else
+	kernel_ventry_el1\ht	\regsize, \label
+	.endif
 .org .Lventry_start\@ + 128	// Did we overflow the ventry slot?
 	.endm
 
-- 
2.55.0.1082.g2b9226bbc0-goog

