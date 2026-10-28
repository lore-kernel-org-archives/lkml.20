Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188867;
	b=c4x8R6CJzjLm/GfK6GBLnUhRexi+9JeYWQfQB4+ueWcCyySRLKjVMlxEc2+z0bp9kSa8
	 rYTHGSIEIS8pirL6WyX1EUrhwKqhbOI3PGqRSKZMBz5ww1J9hOUjpBvE1j+gZOqyFur8n
	 A/KpkWMn/i9WqnzgWfY/NIiMg2aATUhvG/CrIHz3sk+MckI1tIVM9IghIxU2Q80ZSeexk
	 fLOqOJOi9hyoFMIINVwigXkJfIWzzOI3l4btwFlWyPNi5PMAWnA6vUMkLMja1MxNqcQgt
	 W0IQf4yyMxXwvdnCZ68VpZF1MBPqk1MFwoa4cGhc0fkIbi23u32ViAPfNAvxRNZeSqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188867;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=x9VZATXZ2TGU3i1EvYBEjHFQgX6w0AaIaDMQW8Gdxbw=;
	b=eTe24O4XlaJgm5f8RUM+KkwKA4B+x6unXEKvzydPOIVG1BNul71UAtlHppMgX61GTfH9
	 KbWbJuUu9TBV5E0/8ur3cMGw2Vdr8rLZpS9+4/rYjTKWf9AAo311yRKeWEcwE9Q+3zAvX
	 q2XWkgvr/UMlLXf9MpHkNBFRU2zBTG7QG3Q64skScR931EfR0NdaTYGN4WJIA1eF592PT
	 k3zyxTgt4bxdWIv0fW2jkGHdyB47Y0cgZAd8KaLyPe2Vct2kjUbHa0tvI+N9sVi20CrTR
	 xT5VcKT2EWkTtBGg9El0sHlrY85iR3eeJyvjSJynn9IBUdnqV7dmCXOrkx+6ssflDgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PuZqC5hi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AEA606A325
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PuZqC5hi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6181F01828;
	Wed, 28 Oct 2026 12:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793188867;
	bh=x9VZATXZ2TGU3i1EvYBEjHFQgX6w0AaIaDMQW8Gdxbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PuZqC5hint880mdfeeZGaTdRbJL8zskbpjCSaEtNcXzdPlIKCu8d8RChl450G3bQ3
	 t5hlc5WIV+oDEst60+BSOJJyqztlDM9JN06iIUpbzhh3vwGVWHZD68wqU10XjiUIZd
	 RdmEThdxgoONPF7Ov9cef/lTLfYP3iTELNEZNF/BVqkf0IBPdMk6WR0O3fj7D6vtN2
	 aGrg+8a1Sg5FjI5u7arWxGH7v7syi1GdK4CTkTT0PERmrse0LgliSYz7m+B9piork/
	 eUwOnrWAviXfHQpMbAfH05PUg3w5L0VwcjDD+BMAajxrJAFVOA25GFkiTI+Ep6Of5C
	 oNicXDOsl76WQ==
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
Subject: [RFC PATCH 09/20] x86: Always inline empty stubs called from noinstr code
Date: Wed, 28 Oct 2026 07:59:33 -0400
Message-ID: <20261028120034.871983-10-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028120034.871983-1-sashal@kernel.org>
References: <20261028120034.871983-1-sashal@kernel.org>
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

