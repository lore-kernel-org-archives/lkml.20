Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670781;
	b=DrZPTK9Di/E5qS0Zv6QJ/uGpRaaj1wxSgdgJk6nffhNdy3TydB4Fl+oP5RFGqZixQ8yn
	 c+pj50d1Iym4Ji3V+5TMEFTjHGCh4Kc1D2gBQ2CxMCZLJc0DEpxtrnw/OvveDhRhfRCNN
	 GrGo5Ye+dfR+CZMteUZ06aLpdkVKNOsu0aUZ9YmyCVw5sS3Bw0cV4f1JuPo8EKQWPY8ov
	 4Poq5jw8FFIikOff3IZ/oBEKw2288Q6T46TSm7eBCwXYzUPaOK+jNpmdsxbbSMLthyCqj
	 cAy7GcuB115fobFgeP/9JWgztt4ijv44/cFqKRMjudqOJsZ0X2XRj4hEgovdDEwZB9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670781;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=x9VZATXZ2TGU3i1EvYBEjHFQgX6w0AaIaDMQW8Gdxbw=;
	b=N3Q24cbzkHAKccUqQF6dXbJeEIM57YA6QQFj81sTVPrjyT+XBAfLxvCmRfESSh5A7q9G
	 eiYIUh/Lwx6CRrbpLwM9zSg+UXPvPfewq+AjMzChgPx9D5hx0wxo5nM6FZTOvCYMiCaev
	 poGaYMjMOBwZs9mUJe0wdsOTpCUv2KG8Wop131ccPRiRnjoDTPE6A2D63X5OGhsr+P37x
	 G51GYuR/4+hNZUOTqvLql36jaiPuiohbgMwdV/Nv4rQ/0ExFJYG16rmAW5vZ5hDVZMUMO
	 Eb3MbQFzLO6aBGv34251xNq6AkgSJu7pQthhodOu+LluE27zcBqhuM6ZqpUjYGMiWXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oycz3YMc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAD5606A33F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oycz3YMc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483021F00A1B;
	Tue,  3 Nov 2026 01:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793670780;
	bh=x9VZATXZ2TGU3i1EvYBEjHFQgX6w0AaIaDMQW8Gdxbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Oycz3YMc5zYGElr1idJfXYhpTDftPkXvJ/KPqJWIM71cmmFAC8xslaCau9Bim32sW
	 ZwZj9EGVnRsVZDvefd2YvNH/CJDjcRvPrbt2h5b3nND7RfmowZSwA0QNE8nBpEPnfC
	 AR+4P1cQZvwdmUyIrFIFysDnLezPU375w8egGEiVcWQuOjt/m+mKzNsXQfFfPTkfzM
	 STvQZWKRb0NHkUvT0QkUqA8x+Hb6SRwUhu6yA4/NEctQtKIzSw0O2ns5Z2NyOz7jX0
	 C9zMkGI0WxW1ykYxAA2RSIMrVNsGlbejP1SnO/yB4pGnSm9kmUZhAN6Q+9QnvGjsZo
	 AM5CRYLJHrVOQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>,
	Chuck Wolber <chuck@wolber.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Subject: [PATCH v2 09/20] x86: Always inline empty stubs called from noinstr code
Date: Mon,  2 Nov 2026 20:52:27 -0500
Message-ID: <20261103015238.3780910-10-sashal@kernel.org>
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

The !CONFIG_AMD_MEM_ENCRYPT stubs of sev_es_ist_enter(),
sev_es_ist_exit() and sev_es_nmi_complete(), and the !CONFIG_CPU_SUP_AMD
stub of amd_clear_divider(), are plain static inline functions, while
the real implementations are __always_inline. They are called from
noinstr code, which the compiler won't inline them into when building
with code coverage instrumentation:

  vmlinux.o: warning: objtool: exc_nmi+0x7: call to sev_es_nmi_complete() leaves .noinstr.text section

Make the stubs __always_inline as well.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/include/asm/processor.h | 2 +-
 arch/x86/include/asm/sev.h       | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 77488ff5eb8c7..f7f28c8a09ed8 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -735,7 +735,7 @@ static __always_inline void amd_clear_divider(void)
 
 extern void amd_check_microcode(void);
 #else
-static inline void amd_clear_divider(void)		{ }
+static __always_inline void amd_clear_divider(void)	{ }
 static inline void amd_check_microcode(void)		{ }
 #endif
 
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index c7ea9845351e3..52251ce42b666 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -601,10 +601,10 @@ static inline void sev_evict_cache(void *va, int npages)
 #else	/* !CONFIG_AMD_MEM_ENCRYPT */
 
 #define snp_vmpl 0
-static inline void sev_es_ist_enter(struct pt_regs *regs) { }
-static inline void sev_es_ist_exit(void) { }
+static __always_inline void sev_es_ist_enter(struct pt_regs *regs) { }
+static __always_inline void sev_es_ist_exit(void) { }
 static inline int sev_es_setup_ap_jump_table(struct real_mode_header *rmh) { return 0; }
-static inline void sev_es_nmi_complete(void) { }
+static __always_inline void sev_es_nmi_complete(void) { }
 static inline int sev_es_efi_map_ghcbs_cas(pgd_t *pgd) { return 0; }
 static inline void sev_enable(struct boot_params *bp) { }
 static inline int pvalidate(unsigned long vaddr, bool rmp_psize, bool validate) { return 0; }
-- 
2.53.0

