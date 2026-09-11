Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17878469841
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116151; cv=none; b=GES7ycb52RFGJl7/2ckFL3AJ4tDo4X7OadPWShKYlGTLRFPaeExLRi2ZA249PYqL+yrntOgf3SpTz1KnbY+WTYnA/txbnKpHB25UQjf05OnXQqkKxo1Y50EdL+25qbuJPStX1FfBXfrcx4qP85FN+hupUpNmpC3rXUMSeOG2bho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116151; c=relaxed/simple;
	bh=LX+A6VgPX9lxvMo56pNqg0+pa1O8AHjF0QF+HbhsOrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGRj2uZT9YsSp4wqZAh1XWSpPrJKLVHDUrNTOYVXowEGlA65A780B3NxGfxHHIbtjeITjKtf5srXQznalB7Fq/iOqwJjWPl+SBKi4CnJ713xgjCkeGyYeOJaT8Rn/z8rgz27oFdIgSLF4mKkGRD2nAYfTqnB3ofhb1oBSrZp/q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=cDijsZJR; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=K+bwPBP3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="cDijsZJR";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="K+bwPBP3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D4C5E21CF1;
	Fri, 11 Sep 2026 08:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789116144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BzrAx3yxPavJQCsLnX9Vo+7mzy98OyMU3LWrB3XEpuI=;
	b=cDijsZJRui7zdmmTBn5lPXgu29Nwi+TO9eIeHmGz+CukCA40G7OmybwUmjpxHxtH3jnhfY
	pbxH55SIOvZP74c07LF4hRk4cj5Y2DjPfD+aVAgs3l2l2GlhwCDg2FgIZSfBhfw6V2KXn0
	cJOfapRitNoaNoojj7mWRIzYWQfwdOk=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789116139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BzrAx3yxPavJQCsLnX9Vo+7mzy98OyMU3LWrB3XEpuI=;
	b=K+bwPBP3rnjxpixdK0WWDK5gp3JRkduA4DSMj0aFP4phxl2o5SoFrOqfCLEr46hMVPXPvJ
	Xp/dV1KimCfZakT3/BoXu9AnCLxDUw6I4FqEquQWVcQ+XTpFDL6hQ0ZkzLAzSVlT+baOej
	1taEEkv21Tmv0yz0MJESJThZS0PX77E=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 788AC137CA;
	Fri, 11 Sep 2026 08:42:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZIoUHOu+o2q6FAAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 11 Sep 2026 08:42:19 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v5 01/17] x86/alternative: Support alt_replace_call() with instructions after call
Date: Fri, 11 Sep 2026 10:41:55 +0200
Message-ID: <20260911084211.3149957-2-jgross@suse.com>
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
X-Spam-Level: 
X-Spam-Score: -6.80
X-Spam-Flag: NO
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[]

Today alt_replace_call() requires the initial indirect call not to be
followed by any further instructions, including padding NOPs. In case
any replacement is longer than 6 bytes, a subsequent replacement of
the indirect call with a direct one will result in a crash.

Fix that by crashing only if the original instruction is less than
6 bytes long or not a known indirect call.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/kernel/alternative.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 91b1cdd16569..21b344761ee2 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -525,6 +525,7 @@ noinstr void BUG_func(void)
 }
 EXPORT_SYMBOL(BUG_func);
 
+#define CALL_RIP_INSTRLEN	6
 #define CALL_RIP_REL_OPCODE	0xff
 #define CALL_RIP_REL_MODRM	0x15
 
@@ -542,7 +543,7 @@ static unsigned int alt_replace_call(u8 *instr, u8 *insn_buff, struct alt_instr
 		BUG();
 	}
 
-	if (a->instrlen != 6 ||
+	if (a->instrlen < CALL_RIP_INSTRLEN ||
 	    instr[0] != CALL_RIP_REL_OPCODE ||
 	    instr[1] != CALL_RIP_REL_MODRM) {
 		pr_err("ALT_FLAG_DIRECT_CALL set for unrecognized indirect call\n");
@@ -554,7 +555,7 @@ static unsigned int alt_replace_call(u8 *instr, u8 *insn_buff, struct alt_instr
 #ifdef CONFIG_X86_64
 	/* ff 15 00 00 00 00   call   *0x0(%rip) */
 	/* target address is stored at "next instruction + disp". */
-	target = *(void **)(instr + a->instrlen + disp);
+	target = *(void **)(instr + CALL_RIP_INSTRLEN + disp);
 #else
 	/* ff 15 00 00 00 00   call   *0x0 */
 	/* target address is stored at disp. */
-- 
2.55.0

