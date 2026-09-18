Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B721515985
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748130; cv=none; b=qnE4S3KnK29a85EjsM70mEz2avsR1YdxD1LNX9o9FnJ5dJ2KMTRSm6pQFmNWAwdrFwCoyRgifr9EMcsHSskpDNimrzkhUNzqFVOmE1H3u6oYzUekbR0ST0xLxWeFOYv+umVcK1dajUnIwxGNhS0/UqSldtg7KxBJa7W0szgU324=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748130; c=relaxed/simple;
	bh=plIVOrd3fTl4D3hxRhJU17B1fyw4S/NMTdnntp9Zj1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o23lpnCSdSWX21vIyeCvD/YcyoxbK0ntmJWXt2l+idKIntzUUN4ge8sWvnAZl6VjzwDQ7r3nsMQ/FAgdgDtRfwL27cbaxLxM/vWklsY2YgI8DKPL7BkyKFViuIolSldfbgR+W8P80jveda2khIfUgmQO4Jao6cgUGmr/N/uwtIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OET/BcYv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OET/BcYv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4161F00898;
	Fri, 18 Sep 2026 16:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748126;
	bh=/mfIbyB+KiTZj/ummjBpFJweWa08M4vk6DdFzOZra/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OET/BcYvAijGn3Z+EJenGnwlssJv3P030zZZexQ37E4gCoO2NAKf5wH6uvLZPo3V0
	 7sX8CHwaxf/9tM8pxb83Bmjqqq1dZUJeh2zuw/S0YI/LXvTjzg62MFByp7SZc/NPCO
	 DOjfIMzKVMiMvGZ1p1fFPIPs8ujtGd7Hh5DAJVPRG5Dvf8re2hONSRyr39h5iEzI1v
	 QYRmOdU3ouaAC9sSpHV1y0U0Ojp0V9+P1+oBFSVBaQ7cl4CteT9srIcwHV+t1lZCK0
	 aqWDlJZCo0OZTTJTCpXKQzV0NeYONwzvmW8tXmYCKAWN8XAVoFioWCCqfe8rtPd6Mv
	 +MlSxVi4AOaRw==
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
Subject: [PATCH v2 20/21] arm64: tracing: Advertise a mode of EL1t in synthetic kernel regs
Date: Fri, 18 Sep 2026 17:14:04 +0100
Message-ID: <20260918161407.2300-21-will@kernel.org>
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
2.55.0.1082.g2b9226bbc0-goog

