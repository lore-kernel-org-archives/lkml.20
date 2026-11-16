Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854410;
	b=BWt5hzLwWBooT2NDIHUzviSpOZ9U/Ee1gMyHkgKSfx74R7odEVGI+/VPzuZkO3/BQ1fD
	 joZ+2N5ZssjZUyESG+I3Z+un8RyKtY2xEv+JvjtikUUjk88Bm7606CikhNjUG11SADXdq
	 J/Skk+YhPEACm9Wqbq6Unj5FcAWM+zOj4q/IAPg9mPhVXVDAAFR+1mhGM83q38ZqHlSua
	 ILXs8+KMjRhTBDZMiDuADnHSXKjC+gWlrqBw1g4oj/NlXioOdj8yigrUjd443Vjodo6IY
	 XPNtgu2YSQku1badnvQaEmlfLlEQ7iEHywA5Y0XZFxq5aUwmfVxUd4dheK3n6oklKqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854410;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=Cm34Xpmw6Gj11olqzkPPOgI3dtfmn/aHtneSuzqqRR8=;
	b=f7k+nGSEJsJd2s7ZK/Bxx8cUzD+RCq75WxD1ZScOw0CP6K5oWuSoNXb+pjVw8QzVaYJL
	 62WLI6EB2hWEM4kMDd290SkKdpbT7d79v9pH/FxiYNs+ynN6/Pc8lwsCOvHCljQOhOBtY
	 TuXQwUJvE9Kfb59QdohephTEcrJcDEMcfefSuNyaXFaXfhLl2u0VVP+47vek0wkyZZnTC
	 TImaNxxFuW8X/4mZLzSi0HWm3RPASh2l+s4SKRoizJvT9Vppjd/oQ4NOe4bhbD2P10Krl
	 6wmSJrOduuQzHqnUBS/UZ4zGlCPDNZxsyJDeQpTeOF4xahPjD9KxzkuGDofNSmGHTTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=hXo0sn4N;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b="c8ttK/ea";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16A3606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E16A3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=hXo0sn4N;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=c8ttK/ea
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A7E1B1F8AE;
	Mon, 16 Nov 2026 18:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794854408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cm34Xpmw6Gj11olqzkPPOgI3dtfmn/aHtneSuzqqRR8=;
	b=hXo0sn4NEQCRr/a4RanthSXuBCuU+Vhq9aajyf8wpihAFzTralP89FKXViLuU4fEPiXtqW
	gSmq1qQ5LgdqgTfDOZWM+B3z0DiE9mBYT/RFJEPKRBnyUEfqui6v54w6WOLKTWxWUDzCVH
	XXDWyCn+UJovaFHeI8QSMq9ZRgzK4Lw=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="c8ttK/ea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794854406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cm34Xpmw6Gj11olqzkPPOgI3dtfmn/aHtneSuzqqRR8=;
	b=c8ttK/easJ8GHOY2oBHCN9PFEWfZuecDFoj+SCco/BSJ1vNYWKtDYRzaB5T/sMhJfvtqW+
	FNOEiarwrTcJOaNisNFaRw0FxbFhbUkuTAdT3/LN4hYTJkxt+3FNOS1QMrp6ZSDuqC/bx2
	ZIoCJQ70h5Rlj0yHanTvbeIvGb4ASto=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4316B1334C;
	Mon, 16 Nov 2026 18:40:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pOZIBwZO+2qEeAAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 16 Nov 2026 18:40:06 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Xin Li (Intel)" <xin@zytor.com>
Subject: [PATCH v6 10/17] x86/msr: Use the alternatives mechanism for RDMSR
Date: Mon, 16 Nov 2026 19:38:58 +0100
Message-ID: <20261116183905.1591611-11-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116183905.1591611-1-jgross@suse.com>
References: <20261116183905.1591611-1-jgross@suse.com>
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
X-Spamd-Result: default: False [-12.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,zytor.com:email,suse.com:email,suse.com:dkim];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLkdkdrsxe9hqhhs5ask8616i6)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,zytor.com:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.01
X-Spam-Level: 
X-Rspamd-Queue-Id: A7E1B1F8AE

When available use the immediate variant of RDMSR in __rdmsr().

For the safe/unsafe variants make __rdmsr() to be a common base
function instead of duplicating the ALTERNATIVE*() macros.

Modify native_rdmsr() and native_read_msr() to use native_rdmsrq().

The paravirt case will be handled later.

Originally-by: Xin Li (Intel) <xin@zytor.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch, partially taken from "[RFC PATCH v2 22/34] x86/msr: Utilize
  the alternatives mechanism to read MSR" by Xin Li
V6:
- add instruction delimiter in macro (Shreshth Srivastava)
---
 arch/x86/include/asm/msr.h | 106 +++++++++++++++++++++++++++++--------
 1 file changed, 84 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 12e94aba992b..36c80fcec71e 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -66,6 +66,8 @@ static inline void do_trace_rdpmc(u32 msr, u64 val, int failed) {}
 
 /* The GNU Assembler (Gas) with Binutils 2.41 adds the .insn directive support */
 #if defined(CONFIG_AS_IS_GNU) && CONFIG_AS_VERSION >= 24100
+#define ASM_RDMSR_IMM				\
+	" .insn VEX.128.F2.M7.W0 0xf6 /0, %[msr]%{:u32}, %[val]\n\t"
 #define ASM_WRMSRNS_IMM				\
 	" .insn VEX.128.F3.M7.W0 0xf6 /0, %[val], %[msr]%{:u32}\n\t"
 #else
@@ -75,10 +77,17 @@ static inline void do_trace_rdpmc(u32 msr, u64 val, int failed) {}
  * The register operand is encoded as %rax because all uses of the immediate
  * form MSR access instructions reference %rax as the register operand.
  */
+#define ASM_RDMSR_IMM				\
+	" .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]\n\t"
 #define ASM_WRMSRNS_IMM				\
 	" .byte 0xc4,0xe7,0x7a,0xf6,0xc0; .long %c[msr]\n\t"
 #endif
 
+#define RDMSR_AND_SAVE_RESULT			\
+	"rdmsr\n\t"				\
+	"shl $0x20, %%rdx\n\t"			\
+	"or %%rdx, %%rax\n\t"
+
 #define PREPARE_RDX_FOR_WRMSR			\
 	"mov %%rax, %%rdx\n\t"			\
 	"shr $0x20, %%rdx\n\t"
@@ -94,16 +103,76 @@ static inline void do_trace_rdpmc(u32 msr, u64 val, int failed) {}
  * think of extending them - you will be slapped with a stinking trout or a frozen
  * shark will reach you, wherever you are! You've been warned.
  */
-static __always_inline u64 __rdmsr(u32 msr)
+static __always_inline bool __rdmsrq_variable(u32 msr, u64 *val, int type)
+ {
+#ifdef CONFIG_X86_64
+	BUILD_BUG_ON(__builtin_constant_p(msr));
+
+	asm_inline volatile goto(
+		"1:\n"
+		RDMSR_AND_SAVE_RESULT
+		_ASM_EXTABLE_TYPE(1b, %l[badmsr], %c[type])	/* For RDMSR */
+
+		: [val] "=a" (*val)
+		: "c" (msr), [type] "i" (type)
+		: "rdx"
+		: badmsr);
+#else
+	asm_inline volatile goto(
+		"1: rdmsr\n\t"
+		_ASM_EXTABLE_TYPE(1b, %l[badmsr], %c[type])	/* For RDMSR */
+
+		: "=A" (*val)
+		: "c" (msr), [type] "i" (type)
+		:
+		: badmsr);
+#endif
+
+	return false;
+
+badmsr:
+	*val = 0;
+
+	return true;
+}
+
+#ifdef CONFIG_X86_64
+static __always_inline bool __rdmsrq_constant(u32 msr, u64 *val, int type)
 {
-	EAX_EDX_DECLARE_ARGS(val, low, high);
+	BUILD_BUG_ON(!__builtin_constant_p(msr));
 
-	asm volatile("1: rdmsr\n"
-		     "2:\n"
-		     _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_RDMSR)
-		     : EAX_EDX_RET(val, low, high) : "c" (msr));
+	asm_inline volatile goto(
+		"1:\n"
+		ALTERNATIVE("mov %[msr], %%ecx\n\t"
+			    "2:\n"
+			    RDMSR_AND_SAVE_RESULT,
+			    ASM_RDMSR_IMM,
+			    X86_FEATURE_MSR_IMM)
+		_ASM_EXTABLE_TYPE(1b, %l[badmsr], %c[type])	/* For RDMSR immediate */
+		_ASM_EXTABLE_TYPE(2b, %l[badmsr], %c[type])	/* For RDMSR */
+
+		: [val] "=a" (*val)
+		: [msr] "i" (msr), [type] "i" (type)
+		: "ecx", "rdx"
+		: badmsr);
 
-	return EAX_EDX_VAL(val, low, high);
+	return false;
+
+badmsr:
+	*val = 0;
+
+	return true;
+}
+#endif
+
+static __always_inline bool __rdmsr(u32 msr, u64 *val, int type)
+{
+#ifdef CONFIG_X86_64
+	if (__builtin_constant_p(msr))
+		return __rdmsrq_constant(msr, val, type);
+#endif
+
+	return __rdmsrq_variable(msr, val, type);
 }
 
 static __always_inline void __wrmsrq(u32 msr, u64 val)
@@ -188,7 +257,11 @@ static __always_inline bool __wrmsrns(u32 msr, u64 val, int type)
 
 static __always_inline u64 native_rdmsrq(u32 msr)
 {
-	return __rdmsr(msr);
+	u64 val;
+
+	__rdmsr(msr, &val, EX_TYPE_RDMSR);
+
+	return val;
 }
 
 static __always_inline void native_wrmsrq(u32 msr, u64 val)
@@ -198,23 +271,12 @@ static __always_inline void native_wrmsrq(u32 msr, u64 val)
 
 static inline u64 native_read_msr(u32 msr)
 {
-	return __rdmsr(msr);
+	return native_rdmsrq(msr);
 }
 
-static inline int native_read_msr_safe(u32 msr, u64 *p)
+static inline int native_read_msr_safe(u32 msr, u64 *val)
 {
-	int err;
-	EAX_EDX_DECLARE_ARGS(val, low, high);
-
-	asm volatile("1: rdmsr ; xor %[err],%[err]\n"
-		     "2:\n\t"
-		     _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_RDMSR_SAFE, %[err])
-		     : [err] "=r" (err), EAX_EDX_RET(val, low, high)
-		     : "c" (msr));
-
-	*p = EAX_EDX_VAL(val, low, high);
-
-	return err;
+	return __rdmsr(msr, val, EX_TYPE_RDMSR_SAFE) ? -EIO : 0;
 }
 
 /* Can be uninlined because referenced by paravirt */
-- 
2.56.0

