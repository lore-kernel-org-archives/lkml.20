Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854356;
	b=vkkLuWsgG/frpOhIM8qJJRyquqPxtNFFLv4vX3HeM0MKUujIOrfnMJmoOP/f7ZnNnrPp
	 sjRE0sZRUXfMXWOeyROLR5aSn+TfPvMkUcIkwIFhLeC0XAj+fq8JBIryETcnFDH63Kahr
	 9kQKsNQkXxi7xs/HY2Vg4FwIYjgmU9HmL1+TPIuNIzxalrGCflznN2FLb1VRZ12l1/g21
	 ulhQi2zng4ENOJyAkNNj0NvD9p02ri6nA9H1v5n6iNZR9D2wZHK5kusYWgFFoYHkov+er
	 oJK1OZ9ycZJOjRIjHlPDHJwJVE6WoMWcvC9ldNGLfAhtQowhwgw040JNG+UfWordeaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854356;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=loFnhoHz29UVL2D9Wr97WIPYSG/7+Uo4ucMXrnSzPNA=;
	b=ndXUXoKC8G7XDbhrpLqKyuCYG6LE4J6jdGDk8KME7UbKNgvZI+RuIXLhQeIuurUAGz1N
	 DalSzfw3qzm/mF5oYz/Nd9Zrr/g93OmvtCp0++rSKOFHItN5GjiZbxmUJIGGUvENw814U
	 5Ihd5MBDIH4Q/crk1rL0UxVJ8+dTuBautkvxGBPdt0XQuLuP+QAkvX6Tbi5nT57ZI+xdx
	 T5XsapWxo40pNOF/iYlOb97SJwxerStPU7tPpXVE8sTJTwvCxYLQ4y/vDyRRtjM1iFItm
	 iKifegLFn+EUls96gdOattkoUaxXQND5moPii+jmfLLbJgUFgalMji0kCsgWQlmF2wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=tyg7CTQW;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=tyg7CTQW;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C6A606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37C6A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=tyg7CTQW;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=tyg7CTQW
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3BB1D2212D;
	Mon, 16 Nov 2026 18:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794854354; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=loFnhoHz29UVL2D9Wr97WIPYSG/7+Uo4ucMXrnSzPNA=;
	b=tyg7CTQW/V3NtVl47zFmmYPrnLHj35ea/DJG/Q7vvUbfw8+IW+g+pGpG6q31D3CBz6r2kV
	ZSBjkAyG8Lp9FyICDQ/NVyPi//fe1dLeVSKmvLpUmdRZ23Rs/WvUtc+xhSPLTPabTRpagN
	4shRkqpQ2EwSApoMKCJRyxVTTSg3IFQ=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=tyg7CTQW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794854354; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=loFnhoHz29UVL2D9Wr97WIPYSG/7+Uo4ucMXrnSzPNA=;
	b=tyg7CTQW/V3NtVl47zFmmYPrnLHj35ea/DJG/Q7vvUbfw8+IW+g+pGpG6q31D3CBz6r2kV
	ZSBjkAyG8Lp9FyICDQ/NVyPi//fe1dLeVSKmvLpUmdRZ23Rs/WvUtc+xhSPLTPabTRpagN
	4shRkqpQ2EwSApoMKCJRyxVTTSg3IFQ=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D27D91334C;
	Mon, 16 Nov 2026 18:39:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HgE4KtFN+2ordwAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 16 Nov 2026 18:39:13 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v6 01/17] x86/alternative: Support alt_replace_call() with instructions after call
Date: Mon, 16 Nov 2026 19:38:49 +0100
Message-ID: <20261116183905.1591611-2-jgross@suse.com>
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
	URIBL_BLOCKED(0.00)[suse.com:email,suse.com:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLkdkdrsxe9hqhhs5ask8616i6)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 3BB1D2212D

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
index efbc11f8c336..90ca4947833e 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -528,6 +528,7 @@ noinstr void BUG_func(void)
 }
 EXPORT_SYMBOL(BUG_func);
 
+#define CALL_RIP_INSTRLEN	6
 #define CALL_RIP_REL_OPCODE	0xff
 #define CALL_RIP_REL_MODRM	0x15
 
@@ -545,7 +546,7 @@ static unsigned int alt_replace_call(u8 *instr, u8 *insn_buff, struct alt_instr
 		BUG();
 	}
 
-	if (a->instrlen != 6 ||
+	if (a->instrlen < CALL_RIP_INSTRLEN ||
 	    instr[0] != CALL_RIP_REL_OPCODE ||
 	    instr[1] != CALL_RIP_REL_MODRM) {
 		pr_err("ALT_FLAG_DIRECT_CALL set for unrecognized indirect call\n");
@@ -557,7 +558,7 @@ static unsigned int alt_replace_call(u8 *instr, u8 *insn_buff, struct alt_instr
 #ifdef CONFIG_X86_64
 	/* ff 15 00 00 00 00   call   *0x0(%rip) */
 	/* target address is stored at "next instruction + disp". */
-	target = *(void **)(instr + a->instrlen + disp);
+	target = *(void **)(instr + CALL_RIP_INSTRLEN + disp);
 #else
 	/* ff 15 00 00 00 00   call   *0x0 */
 	/* target address is stored at disp. */
-- 
2.56.0

