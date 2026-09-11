Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB1A46AA8C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116178; cv=none; b=UbVedvHBU6vfXXEIk4qPR15uFl3ow0VwcME7/uwMc3xD5GEHg+6Qt8fdBH0Gp9mGtdbp/sRCZILqufurdcnE6LsKZRdgtuhuem3mnw+hZTrXfgwxKkk9MQUApmD0mvn6RAHmvRK5VuQNCChz9T8OdSmnFNzX5lY7i66z3POx6cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116178; c=relaxed/simple;
	bh=77GANFjWcqwhVtpGw/MgOtZNGBT/sIhGX/n+xps2/iQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=absssZoAzHC9b2RT8JdU30A8HbCaYXhu0QLNpwbmGp9e6Vtm8wleszvurdlLmalIQZKCpFD5hhWUkrBULyvDXEd+XSkoyJQdrejVhbhGMfHruy2QybPzalTCSLwUZ4d3FJB+aZI92CgeSSdKiWeO1jsj8ghQ96eRYxFOa1gWIx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B1ED71FE50;
	Fri, 11 Sep 2026 08:42:54 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44592132D3;
	Fri, 11 Sep 2026 08:42:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id e81SDw6/o2r6FQAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 11 Sep 2026 08:42:54 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Xin Li (Intel)" <xin@zytor.com>
Subject: [PATCH v5 07/17] x86/extable: Add support for immediate form MSR instructions
Date: Fri, 11 Sep 2026 10:42:01 +0200
Message-ID: <20260911084211.3149957-8-jgross@suse.com>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B1ED71FE50
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch, taken from the RFC v2 MSR refactor series by Xin Li
V3:
- use instruction decoder (Peter Zijlstra)
V4:
- don't assume %rax for immediate form (Andrew Cooper)
V5:
- drop stale comment (H. Peter Anvin)
---
 arch/x86/mm/extable.c | 41 +++++++++++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/arch/x86/mm/extable.c b/arch/x86/mm/extable.c
index fa6eebe6a69e..9976ed01ce62 100644
--- a/arch/x86/mm/extable.c
+++ b/arch/x86/mm/extable.c
@@ -166,25 +166,54 @@ static bool ex_handler_uaccess(const struct exception_table_entry *fixup,
 static bool ex_handler_msr(const struct exception_table_entry *fixup,
 			   struct pt_regs *regs, bool wrmsr, bool safe, int reg)
 {
+	unsigned long *regptr;
+	struct insn insn;
+	bool imm_insn;
+	u32 msr;
+
+	imm_insn = insn_decode_kernel(&insn, (void *)regs->ip) &&
+		   insn.vex_prefix.nbytes;
+	msr = imm_insn ? insn.immediate.value : (u32)regs->cx;
+	regptr = imm_insn ? insn_get_modrm_reg_ptr(&insn, regs) : &regs->ax;
+	if (unlikely(!regptr)) {
+		pr_err("Inconsistent %sMSR access instruction data at rIP: 0x%lx (%pS)!\n",
+		       wrmsr ? "WR" : "RD", regs->ip, (void *)regs->ip);
+		show_stack_regs(regs);
+		goto out;
+	}
+
 	if (__ONCE_LITE_IF(!safe && wrmsr)) {
-		pr_warn("unchecked MSR access error: WRMSR to 0x%x (tried to write 0x%08x%08x) at rIP: 0x%lx (%pS)\n",
-			(unsigned int)regs->cx, (unsigned int)regs->dx,
-			(unsigned int)regs->ax,  regs->ip, (void *)regs->ip);
+		u64 msr_val = *regptr;
+
+		if (!imm_insn) {
+			/*
+			 * On processors that support the Intel 64 architecture, the
+			 * high-order 32 bits of each of RAX and RDX are ignored.
+			 */
+			msr_val &= 0xffffffff;
+			msr_val |= (u64)regs->dx << 32;
+		}
+
+		pr_warn("unchecked MSR access error: WRMSR to 0x%x (tried to write 0x%016llx) at rIP: 0x%lx (%pS)\n",
+			msr, msr_val, regs->ip, (void *)regs->ip);
 		show_stack_regs(regs);
 	}
 
 	if (__ONCE_LITE_IF(!safe && !wrmsr)) {
 		pr_warn("unchecked MSR access error: RDMSR from 0x%x at rIP: 0x%lx (%pS)\n",
-			(unsigned int)regs->cx, regs->ip, (void *)regs->ip);
+			msr, regs->ip, (void *)regs->ip);
 		show_stack_regs(regs);
 	}
 
 	if (!wrmsr) {
 		/* Pretend that the read succeeded and returned 0. */
-		regs->ax = 0;
-		regs->dx = 0;
+		*regptr = 0;
+
+		if (!imm_insn)
+			regs->dx = 0;
 	}
 
+ out:
 	if (safe)
 		*pt_regs_nr(regs, reg) = -EIO;
 
-- 
2.55.0

