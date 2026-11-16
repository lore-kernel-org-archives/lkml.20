Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854427;
	b=GULvyMNURjMJ8qCMeg3LbNrESHwN6zbJuMDnGTb3dI4J9Zwj5Br+pnmbfwV2++9U3HDt
	 qiJbWtyRv1cfEC3qtG4e6Ey13l7TNFh8Gg/fA/xk4bZNaBbO/C2+iv/Vi58crBAWNS9ZF
	 EkOVA4s/91IQ9u6BtOHGF4VQ55AMD4jufl3AjXsL5/olQGXPN4NKBPJSW0Z3GTVkfSYdF
	 R69z1YQfaX/UXmcKtF70SIMCiQAZGzWZRC3KGeYYK/0qXfYZGXPfUyrwA7+4/x/FjXU0b
	 ptVE9mN/XcTkIimZo5SRUyyEFkM5JmwHWvS1jh1qgzavJhJJAhYhiG7O7xnTnF8LjnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854427;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=NiV3CI8arcXcxcg8lyj3Eaa6xyv25uYkkRPA9TITUDE=;
	b=EJQcbn1qifDigQxJwLH2YYLcqSHZaDKsFaQqMom6O0W3YQOwN7czJfotvDqUx9XVNaPm
	 xomrWvB+Y58UTZMDTYrvJzqtt+1Hl+D3ds9u0R3FC8QXfZRPe62Qx9acUaErhqCjxS9Fm
	 19ULK7dJBiK/joISClQ+Acu/B5smDQJpgBTqvOfVB/R5+03pkJa4jJojyIkt88vGeuHbP
	 5DnVXS4Yj5Rq5m46x6bMn26Obidw2CHsx6NhmpIhQgtbScw0hwBgP9dJKxZvwlw0KCWcz
	 Cf9mCqi+EYdiFyjC8MbRi0qMVlbSMVWy+YtLqrgK+zxepOp0O2c5uHOImk6iejQadWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b="SRkQF/zS";
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b="SRkQF/zS";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF366606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF366606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=SRkQF/zS;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=SRkQF/zS
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 301831F899;
	Mon, 16 Nov 2026 18:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794854424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NiV3CI8arcXcxcg8lyj3Eaa6xyv25uYkkRPA9TITUDE=;
	b=SRkQF/zSeBq1rIz4p7pbTO6SkJTLRSSAVvPoR8/0UY7Zw5zAjbAIqmynTw8x1Q1w8H5GTR
	/8543PBquBzqC7yj5zJCii/vgheHvn3nrAIGHFVrHuTRYVOrkhdWXPVGVo5qwEExNzeOtr
	iROcFjrOdn1X4Kuj2elbOh559kPmK3M=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="SRkQF/zS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794854424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NiV3CI8arcXcxcg8lyj3Eaa6xyv25uYkkRPA9TITUDE=;
	b=SRkQF/zSeBq1rIz4p7pbTO6SkJTLRSSAVvPoR8/0UY7Zw5zAjbAIqmynTw8x1Q1w8H5GTR
	/8543PBquBzqC7yj5zJCii/vgheHvn3nrAIGHFVrHuTRYVOrkhdWXPVGVo5qwEExNzeOtr
	iROcFjrOdn1X4Kuj2elbOh559kPmK3M=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE42C1334C;
	Mon, 16 Nov 2026 18:40:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6XxCIRdO+2qeeAAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 16 Nov 2026 18:40:23 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev
Cc: Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v6 13/17] x86/paravirt: Prepare support of MSR instruction interfaces
Date: Mon, 16 Nov 2026 19:39:01 +0100
Message-ID: <20261116183905.1591611-14-jgross@suse.com>
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
	RCPT_COUNT_TWELVE(0.00)[12];
	URIBL_BLOCKED(0.00)[suse.com:email,suse.com:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLkdkdrsxe9hqhhs5ask8616i6)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 301831F899

Make the paravirt callee-save infrastructure more generic by allowing
arbitrary register interfaces via prologue and epilogue helper macros.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- carved out from patch 5 of V1
---
 arch/x86/include/asm/paravirt_types.h     | 43 ++++++++++++++---------
 arch/x86/include/asm/qspinlock_paravirt.h |  4 +--
 2 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 2459163fa196..740ea819bbab 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -448,27 +448,38 @@ extern struct paravirt_patch_template pv_ops;
 #define PV_SAVE_ALL_CALLER_REGS		"pushl %ecx;"
 #define PV_RESTORE_ALL_CALLER_REGS	"popl  %ecx;"
 #else
+/* Save and restore caller-save registers, except %rax, %rcx and %rdx. */
+#define PV_SAVE_COMMON_CALLER_REGS	\
+	"push %rsi;"			\
+	"push %rdi;"			\
+	"push %r8;"			\
+	"push %r9;"			\
+	"push %r10;"			\
+	"push %r11;"
+
+#define PV_RESTORE_COMMON_CALLER_REGS	\
+	"pop %r11;"			\
+	"pop %r10;"			\
+	"pop %r9;"			\
+	"pop %r8;"			\
+	"pop %rdi;"			\
+	"pop %rsi;"
+
 /* save and restore all caller-save registers, except return value */
 #define PV_SAVE_ALL_CALLER_REGS						\
 	"push %rcx;"							\
 	"push %rdx;"							\
-	"push %rsi;"							\
-	"push %rdi;"							\
-	"push %r8;"							\
-	"push %r9;"							\
-	"push %r10;"							\
-	"push %r11;"
+	PV_SAVE_COMMON_CALLER_REGS
+
 #define PV_RESTORE_ALL_CALLER_REGS					\
-	"pop %r11;"							\
-	"pop %r10;"							\
-	"pop %r9;"							\
-	"pop %r8;"							\
-	"pop %rdi;"							\
-	"pop %rsi;"							\
+	PV_RESTORE_COMMON_CALLER_REGS					\
 	"pop %rdx;"							\
 	"pop %rcx;"
 #endif
 
+#define PV_PROLOGUE_ALL(func)	PV_SAVE_ALL_CALLER_REGS
+#define PV_EPILOGUE_ALL(func)	PV_RESTORE_ALL_CALLER_REGS
+
 /*
  * Generate a thunk around a function which saves all caller-save
  * registers except for the return value.  This allows C functions to
@@ -482,7 +493,7 @@ extern struct paravirt_patch_template pv_ops;
  * functions.
  */
 #define PV_THUNK_NAME(func) "__raw_callee_save_" #func
-#define __PV_CALLEE_SAVE_REGS_THUNK(func, section)			\
+#define __PV_CALLEE_SAVE_REGS_THUNK(func, section, helper)		\
 	extern typeof(func) __raw_callee_save_##func;			\
 									\
 	asm(".pushsection " section ", \"ax\";"				\
@@ -492,16 +503,16 @@ extern struct paravirt_patch_template pv_ops;
 	    PV_THUNK_NAME(func) ":"					\
 	    ASM_ENDBR							\
 	    FRAME_BEGIN							\
-	    PV_SAVE_ALL_CALLER_REGS					\
+	    PV_PROLOGUE_##helper(func)					\
 	    "call " #func ";"						\
-	    PV_RESTORE_ALL_CALLER_REGS					\
+	    PV_EPILOGUE_##helper(func)					\
 	    FRAME_END							\
 	    ASM_RET							\
 	    ".size " PV_THUNK_NAME(func) ", .-" PV_THUNK_NAME(func) ";"	\
 	    ".popsection")
 
 #define PV_CALLEE_SAVE_REGS_THUNK(func)			\
-	__PV_CALLEE_SAVE_REGS_THUNK(func, ".text")
+	__PV_CALLEE_SAVE_REGS_THUNK(func, ".text", ALL)
 
 /* Get a reference to a callee-save function */
 #define PV_CALLEE_SAVE(func)						\
diff --git a/arch/x86/include/asm/qspinlock_paravirt.h b/arch/x86/include/asm/qspinlock_paravirt.h
index 0a985784be9b..002b17f0735e 100644
--- a/arch/x86/include/asm/qspinlock_paravirt.h
+++ b/arch/x86/include/asm/qspinlock_paravirt.h
@@ -14,7 +14,7 @@ void __lockfunc __pv_queued_spin_unlock_slowpath(struct qspinlock *lock, u8 lock
  */
 #ifdef CONFIG_64BIT
 
-__PV_CALLEE_SAVE_REGS_THUNK(__pv_queued_spin_unlock_slowpath, ".spinlock.text");
+__PV_CALLEE_SAVE_REGS_THUNK(__pv_queued_spin_unlock_slowpath, ".spinlock.text", ALL);
 #define __pv_queued_spin_unlock	__pv_queued_spin_unlock
 
 /*
@@ -61,7 +61,7 @@ DEFINE_ASM_FUNC(__raw_callee_save___pv_queued_spin_unlock,
 #else /* CONFIG_64BIT */
 
 extern void __lockfunc __pv_queued_spin_unlock(struct qspinlock *lock);
-__PV_CALLEE_SAVE_REGS_THUNK(__pv_queued_spin_unlock, ".spinlock.text");
+__PV_CALLEE_SAVE_REGS_THUNK(__pv_queued_spin_unlock, ".spinlock.text", ALL);
 
 #endif /* CONFIG_64BIT */
 #endif
-- 
2.56.0

