Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD70469837
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116203; cv=none; b=PbuSwz5jEwFXoFmkB3qJMuR4k0E0H5jqAY/B5j/auUSzr8uPLEmHHcw3PddBQZ/PzKMaqE01GtI3jgrO6JfZUvrtdCsCxovnBgSBdvMoccgq3ZnnSetQwUN2MSLjXCLkazMSgSEHYAIRg16wSZkh5hGK7cVfroFlvYjzsv4IFz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116203; c=relaxed/simple;
	bh=ontcEXkDbFy7JwkRdKB40Ym3C+KkYq1GoyIpXWhamS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UNq6PlCfRZNWMPCE4CrwQMW4KUU0WNPSCeLUzxRQMMaIQ2BvQ6T9mCcf742sk2oSNkphda22G66rEd0iDo4rsIY4/+F5IdaMk7yVhMe2aU5tl5QUuA5l5n+Jf2XkEComYOv0Q5hr/Ed3ClXXLzjW0buLc6gEfjHJRj3lhZSqlNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=GA0TsnTC; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=kuO22aTv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="GA0TsnTC";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="kuO22aTv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 16B3F21B99;
	Fri, 11 Sep 2026 08:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789116196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=onATD3825dr/qGywcpPOAESP/jRljWMh7Oxh2o1ufUs=;
	b=GA0TsnTCR900IGNolrV6hBtfHqBtk8d+xkvA/Mcg4DMx4KrXwE7Z9TfLkpJ5ZPkV1gC2fX
	t9o8aeX6lN7CG6qDHV3bC6OZrpnr2NHzkpCZ0hPxFs/Oawj3HC2+DVafRsp1CSmv3UfYuc
	IzCthQncv+34Ukb/AnXXF+co01TBlh0=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789116192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=onATD3825dr/qGywcpPOAESP/jRljWMh7Oxh2o1ufUs=;
	b=kuO22aTvwQJCV6uJeNWPyvqZ6Vk4Pw6IMMWi/btvCxlkILOdAokL09RVNRTaRilHJ37jqL
	5OPpkbOdS8ZlHz5AnpVZwtAE6sYGLQs7aWPz96gyTsHxAD2QotKMzreVCp97SH9jpVPV4u
	FEnLmBlRYw4WGo8cIXy6yg63+o4U53w=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A719E132D3;
	Fri, 11 Sep 2026 08:43:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PjdnJx+/o2oSFgAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 11 Sep 2026 08:43:11 +0000
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
Subject: [PATCH v5 10/17] x86/msr: Use the alternatives mechanism for RDMSR
Date: Fri, 11 Sep 2026 10:42:04 +0200
Message-ID: <20260911084211.3149957-11-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911084211.3149957-1-jgross@suse.com>
References: <20260911084211.3149957-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

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
---
 arch/x86/include/asm/msr.h | 106 +++++++++++++++++++++++++++++--------
 1 file changed, 84 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 6ae8a49f9c07..fb1027dc7f64 100644
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
+	" .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]"
 #define ASM_WRMSRNS_IMM				\
 	" .byte 0xc4,0xe7,0x7a,0xf6,0xc0; .long %c[msr]"
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
2.55.0

