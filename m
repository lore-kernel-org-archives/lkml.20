Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF63521216
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799449; cv=none; b=NfRteHuQYoO25/XQ+qf+Ywn14+VnSyyb6PHK3BZGi1KT2xcTl3YgLecOe6OdAaq3FdULMu9bJz5+qlX/p4YMR8YmSd24Otn6ZKC+c8Zd7jws/GOk+C6riYoegKlmqTW6zUiCsdU2/S5HvgmwhwLuAaGLf7uxELblUjQuFhVlJ20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799449; c=relaxed/simple;
	bh=5w+w9N7qo/Kr9St2C3GcFvaWy+IiY4pdFryRAKuO59s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nAiobTQ/GU9UtBbNGHMLl5E6s3IckSQr6c5g2IkNtc0/yDe6vKGEQb4Cf/8xhWNNCzTnWAVAiz+PfzggdBiDTxXKEKD+QoWqGbQLatLNkein1VSDXzczFFhuf55teCWGJyzKJXKlNEL0oufEyExOZnifRVMd0kF6c0TlKZOzFuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AV+pENzp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AV+pENzp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8816F1F00A3A;
	Mon,  7 Sep 2026 16:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799448;
	bh=3E+XhQ30UlSW21cfmh1kLGlFL8sP6bIE+ExxMayVkkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AV+pENzpNe27jKIRoaSpGRhj+K6DyKrFuqwdK17SPFXT/5AnsIBfBSBdwOfMzKxpc
	 fusF7opzvBzOf7cEAO6mmO7nv5qm4yVYIEcgBdRBcjlL31LxlCCQpO0WsjYxFTg13+
	 lVmir353ArSW6V665gZcFE65Gk3hwLNY+jUcI5V/6CsMsrd4+o9PmeowL3qS17szVs
	 /Lxe197LqGIm0k6NR0uwjgf7XBhAoBlUoAoJZP98KSunln7jRO/oO3NtbJ/AN6HSf9
	 x1eGknKxlfOcI0XbD87xwF5z5nnEdEFNmeHbZyMYLYckUfcINTLyIZb1UYb0nhsJ37
	 hY9RTEhQGMqtg==
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
Subject: [PATCH 20/21] arm64: tracing: Advertise a mode of EL1t in synthetic kernel regs
Date: Mon,  7 Sep 2026 17:42:45 +0100
Message-ID: <20260907164247.17223-21-will@kernel.org>
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

When synthesising a kernel regs structure for ftrace or perf, advertise
a mode of EL1t to reflect the mode in which the kernel runs for the vast
majority of the time.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/ftrace.h     | 4 ++--
 arch/arm64/include/asm/perf_event.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
index 1621c84f44b3..d55a019cdf0a 100644
--- a/arch/arm64/include/asm/ftrace.h
+++ b/arch/arm64/include/asm/ftrace.h
@@ -153,7 +153,7 @@ ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
 	regs->pc = afregs->pc;
 	regs->regs[29] = afregs->fp;
 	regs->regs[30] = afregs->lr;
-	regs->pstate = PSR_MODE_EL1h;
+	regs->pstate = PSR_MODE_EL1t;
 	return regs;
 }
 
@@ -161,7 +161,7 @@ ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
 		(_regs)->pc = arch_ftrace_regs(fregs)->pc;			\
 		(_regs)->regs[29] = arch_ftrace_regs(fregs)->fp;		\
 		(_regs)->sp = arch_ftrace_regs(fregs)->sp;			\
-		(_regs)->pstate = PSR_MODE_EL1h;		\
+		(_regs)->pstate = PSR_MODE_EL1t;		\
 	} while (0)
 
 int ftrace_regs_query_register_offset(const char *name);
diff --git a/arch/arm64/include/asm/perf_event.h b/arch/arm64/include/asm/perf_event.h
index ee45b4e77347..b3e7c24a5aab 100644
--- a/arch/arm64/include/asm/perf_event.h
+++ b/arch/arm64/include/asm/perf_event.h
@@ -17,7 +17,7 @@
 	(regs)->pc = (__ip);    \
 	(regs)->regs[29] = (unsigned long) __builtin_frame_address(0); \
 	(regs)->sp = current_stack_pointer; \
-	(regs)->pstate = PSR_MODE_EL1h;	\
+	(regs)->pstate = PSR_MODE_EL1t;	\
 }
 
 #endif
-- 
2.55.0.979.g7e5102b832-goog

