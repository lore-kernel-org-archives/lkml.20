Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854391;
	b=NAUZsy0h2LB9FsEe+hxIxpFCOk6tiDrr246fe+UF+56Y+EzQnD6AROD+h+OlWIRYhWBC
	 E83VO35BxUEj9Fcm6Ra+y0qqwb2BbN80lyx+VFbKL6/T41EQuRtNcIlhZIvjBmLLDlkUp
	 06XF74Gx+u0qna0GDgEgal1wfsOiJ2hkGO9QiXkgEkLLRccg8ekpPQ2nhLediuTcyQK8Z
	 IxvryOz1QOUga9kk/6k5SU0E/kpRcRFwUJ3qRKmDiB1dzTrSxq5OWLiZcvamuI2HlcOib
	 xjCNQ7eyfpGtOEicHUIjQhH9D0lKkE1+LBKlysS6KaASE5r/K9ZjGQ9pn7FpJow/lIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854391;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=TmJvBYJw0buLEbEP+xxP8sIq7U2WMQ70g8C4zUPUY/w=;
	b=xwhY1yYBkeBTcutN2XDOHKE85NgOJ0vezJFDoLDajbWthWCrJlTAAXCcoUAOVZTD+Yw3
	 QvR2xqCopfzDkNSdXFHk9pWPFkbzvhS46tudnX4ulakkn9BwpiNHDE+XqUq7J65oBmwr6
	 aui6MV57TNoZi4rgC1xC+xPjWyKUue/tjR8wsras09S+dUTBwbfGJp0OWwVcQWon3iYZE
	 mNMkmDJ3JSZG7YZ80YRMuETFRZ142xoJ4pwsg6rOmVqfEpeIuFwT+ms2E+A8aSwR31cxm
	 6Dj2+LM14EgzsvDU0trSdtsCal/C8bkvQY1ica9jZjLfhQAudhfdAaSTQCWXC7QZFrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=gZMmfca1;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=gZMmfca1;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA567606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA567606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=gZMmfca1;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=gZMmfca1
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3E1401F899;
	Mon, 16 Nov 2026 18:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794854389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TmJvBYJw0buLEbEP+xxP8sIq7U2WMQ70g8C4zUPUY/w=;
	b=gZMmfca1A4PIWbBLwL/fqC0hSVrGB6ZwYXpzgs3gCnCd2p4k1mVpy7VyPMD7tJWKxNiy0d
	T+Yg15zznUdRGN0pseVRdZhpTwqD66ZQzFtf8hu8noVGTKnpj03iTrN3l7wqJMKRVEQWno
	qMlJecPtE0TS4PZr/LRl7c+LROW8cVI=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794854389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TmJvBYJw0buLEbEP+xxP8sIq7U2WMQ70g8C4zUPUY/w=;
	b=gZMmfca1A4PIWbBLwL/fqC0hSVrGB6ZwYXpzgs3gCnCd2p4k1mVpy7VyPMD7tJWKxNiy0d
	T+Yg15zznUdRGN0pseVRdZhpTwqD66ZQzFtf8hu8noVGTKnpj03iTrN3l7wqJMKRVEQWno
	qMlJecPtE0TS4PZr/LRl7c+LROW8cVI=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF4BE1334C;
	Mon, 16 Nov 2026 18:39:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nhqUJfRN+2pjeAAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 16 Nov 2026 18:39:48 +0000
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
Subject: [PATCH v6 07/17] x86/extable: Add support for immediate form MSR instructions
Date: Mon, 16 Nov 2026 19:38:55 +0100
Message-ID: <20261116183905.1591611-8-jgross@suse.com>
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
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,zytor.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zytor.com:email,imap1.dmz-prg2.suse.org:helo,suse.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80
X-Spam-Level: 
X-Spam-Flag: NO

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
2.56.0

