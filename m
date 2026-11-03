Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670779;
	b=odP4HIsOLUU8pBtrR1oyxRNZ/f/jYVnvb3od7BNWNZHhDlnNMk2ZIh7sbJUeKmeUxAqU
	 97z4f1Ne1WRMXfCQoJYiNR6ideBWIldsNxTiU86Tad20whPruhy5mYX0Lx7lrsdrOOtfp
	 9Krlem+OjdFGzc+nmYB9GSicihs8NAVc8Kd9cuZf+OPiS/knlO30ripGRJjm0559WD9tx
	 pslhftSYMSbv+Vx6g98VWKV4xIwmtdqCUMrhv9lNC5pW5SasaL/obbuIakW0nrs3Ec0zr
	 zvPPITwD0tasGqjo0WzJ987IyvHLrpaHEonGJ4Z4rzsN1QHuYnGT0kNkbKk4/d1Uw+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670779;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=SMLLDo6VVdlvW0r3w2RJurfeIqoziXptyv9h4bz6tPs=;
	b=2E/gICZeS2muD/VH/O3SaqgjOV047avnEKns45lac6RmoH4K+MQ+YSy5LUBNPAC82/Ln
	 NHCDuVOG4UtfuOs3MWlaxtuQhgd5+f0lLkdLrO5N2pSd3o6g1GTmVYYH0BQJkx06t6LfA
	 qrOovfdpGkyhS1OtrLvwBvpHi4aO0i/ip3pl/iD4Uj3EetwX+lMiMBBiM52MbnS7MAdKR
	 DVM6oqKszgZ5mR4I3cBOX40LH2U9JDpN1l5KiPVhQRYEUe1zvI0dxyOKkjSDujWp/3+Dp
	 SQ+Z93sACgCN9MauSvcWJAjUChfpqzYAXICYx2nZtBuhKupaa06O4iDu4c2x82VN0kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DvRH3EH7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634F0606D807
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DvRH3EH7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497981F000C1;
	Tue,  3 Nov 2026 01:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793670779;
	bh=SMLLDo6VVdlvW0r3w2RJurfeIqoziXptyv9h4bz6tPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DvRH3EH7bqznDfktDcFYfRpihT8PqKJDlzFKOq/wX6g8cHXKJg67EmhfCDq9kRC7w
	 /FBzf0yKEjSb7xBMWU18++i45JL1bSFcUgF4W/o5ZO4LQW2Ng2DXzNdf54DDcrppcg
	 Nwvc2pAwFKlMb6qdHWyOkjYkUm/B7T73hPSrQek4Ky/DIuSxNgD9bZK+n6+5WoP77A
	 QViBsPFf2rArEo2zqFlbbNdxxxOluPboN080Xr79jd6ndSN+uMVlxKQU0/Oz5zOF/M
	 WQ8qGfrNGT4j7A8VAKbox1marf2BTalRU8tCh2E4t/Ubs/pRGq9hSaXTkoRBvna8aR
	 OzemCPpQoRlgA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Chuck Wolber <chuck@wolber.net>,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH v2 08/20] rseq: Always inline the empty stubs called from noinstr code
Date: Mon,  2 Nov 2026 20:52:26 -0500
Message-ID: <20261103015238.3780910-9-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103015238.3780910-1-sashal@kernel.org>
References: <20261103015238.3780910-1-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The !CONFIG_RSEQ stubs in rseq_entry.h, and the !CONFIG_GENERIC_ENTRY
version of rseq_exit_to_user_mode_restart(), are plain static inline
functions, while their counterparts are __always_inline. They are called
from noinstr entry code, directly or through the __always_inline exit to
user mode helpers, and the compiler won't inline them there when
building with code coverage instrumentation.

On x86 that's rseq_note_user_irq_entry(). arm64 calls the exit to user
mode helpers from noinstr code outside of instrumentation_begin()
sections, so with Clang, asm_exit_to_user_mode() and the el0 exception
handlers end up calling rseq_syscall_exit_to_user_mode() and
rseq_irqentry_exit_to_user_mode() out of line.

Make the stubs __always_inline as well.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/linux/rseq_entry.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/rseq_entry.h b/include/linux/rseq_entry.h
index 31ce349ed42ce..7f9f1590d73fd 100644
--- a/include/linux/rseq_entry.h
+++ b/include/linux/rseq_entry.h
@@ -716,7 +716,7 @@ rseq_exit_to_user_mode_restart(struct pt_regs *regs, unsigned long ti_work)
 }
 
 #else /* CONFIG_GENERIC_ENTRY */
-static inline bool rseq_exit_to_user_mode_restart(struct pt_regs *regs, unsigned long ti_work)
+static __always_inline bool rseq_exit_to_user_mode_restart(struct pt_regs *regs, unsigned long ti_work)
 {
 	return false;
 }
@@ -759,15 +759,15 @@ static __always_inline void rseq_debug_syscall_return(struct pt_regs *regs)
 		__rseq_debug_syscall_return(regs);
 }
 #else /* CONFIG_RSEQ */
-static inline void rseq_note_user_irq_entry(void) { }
-static inline bool rseq_exit_to_user_mode_restart(struct pt_regs *regs, unsigned long ti_work)
+static __always_inline void rseq_note_user_irq_entry(void) { }
+static __always_inline bool rseq_exit_to_user_mode_restart(struct pt_regs *regs, unsigned long ti_work)
 {
 	return false;
 }
-static inline void rseq_syscall_exit_to_user_mode(void) { }
-static inline void rseq_irqentry_exit_to_user_mode(void) { }
-static inline void rseq_debug_syscall_return(struct pt_regs *regs) { }
-static inline bool rseq_grant_slice_extension(unsigned long ti_work, unsigned long mask) { return false; }
+static __always_inline void rseq_syscall_exit_to_user_mode(void) { }
+static __always_inline void rseq_irqentry_exit_to_user_mode(void) { }
+static __always_inline void rseq_debug_syscall_return(struct pt_regs *regs) { }
+static __always_inline bool rseq_grant_slice_extension(unsigned long ti_work, unsigned long mask) { return false; }
 #endif /* !CONFIG_RSEQ */
 
 #endif /* _LINUX_RSEQ_ENTRY_H */
-- 
2.53.0

