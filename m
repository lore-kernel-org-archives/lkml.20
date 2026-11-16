Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854449;
	b=OM5+g0JaJ/jkPJ90KElwew8Xi3hAZb5O7g6wtbDnwt8A6e09yMG4ho8dHhxaukN3kPLT
	 ynh0Tgn670SBPnbaF316iPMEpf6UldUY93qUYVuFXSz70BMRMprdBBt4iZfgV9fXOVqOa
	 keLN+PkeMhIYq1dukPdur5qiFOMsaIUaTPmkIHeaXFj4PMore5iAhNqfpa4x4vkJcPK84
	 bSy1qtpLpsD7E01unedm00EGV8LMy46WGRT6vLV/AqvnQ76187pwOthOEfHayP9xnxz9/
	 bDXWSc1gqrsgRZSCKVH3VSsCaIacELX3ms0/rvYmoO0dvSB59GBoJTpDRraInYr8Gww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854449;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Rspamd-Queue-Id:
	 X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spamd-Result:X-Spam-Score;
	bh=aCgbVlXBBG462Kk204vAjZ5oUZkdWUVGljhn7KIg8Y8=;
	b=zYsDZcgV2uz4nuihT0Cq+g5Q/bnWYv7E4cmIP2+6W2Kxa4YKCNRJqwR5dICXh7b2g571
	 xgg/T7wzTvpj94SoIG9PW9rD2l451WUy/tSi2P3hxK/gnba8lPwb8uanyCp47ga1uOysx
	 KLNc5y84aksPFpHgrS7gCMcw2/UYmfrNa8REgRmER60SKRtIteb7BhzTxiiPZLaZt4PU2
	 pjOFyogkoAPR2ylVwXdvga1cuApNY8H4UPR0+5qcGN3HG1E8dENyLMKiFYKHohPF/Zabs
	 t7nICdy2tf3Pk6HAr4KHaD2q6zuPEbBm6zs8j5HdMkBryAUgq3J4itPT/jd5v75V0Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b="N9V5KH/8";
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b="N9V5KH/8";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D431606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D431606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=N9V5KH/8;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=N9V5KH/8
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7F11322321;
	Mon, 16 Nov 2026 18:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794854447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aCgbVlXBBG462Kk204vAjZ5oUZkdWUVGljhn7KIg8Y8=;
	b=N9V5KH/8nCZf2Ory8gEH3yDSHI1zAmU5kA0sHkVe1r3MeOIYfS20nqVghbHni0p0ZM3dme
	tPkocVB1tVyrcGaLX6Q/PSxLgzFENXBIzyw2h3yM7jR2jXn7ZHV0ca49we8UjKxioyNpuZ
	9WHwPwD/hc86CnPeiDyeGiwON7/Wz14=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="N9V5KH/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794854447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aCgbVlXBBG462Kk204vAjZ5oUZkdWUVGljhn7KIg8Y8=;
	b=N9V5KH/8nCZf2Ory8gEH3yDSHI1zAmU5kA0sHkVe1r3MeOIYfS20nqVghbHni0p0ZM3dme
	tPkocVB1tVyrcGaLX6Q/PSxLgzFENXBIzyw2h3yM7jR2jXn7ZHV0ca49we8UjKxioyNpuZ
	9WHwPwD/hc86CnPeiDyeGiwON7/Wz14=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 20C121334C;
	Mon, 16 Nov 2026 18:40:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id N21yOi5O+2pZeQAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 16 Nov 2026 18:40:47 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v6 17/17] x86/msr: Make all MSR access functions __always_inline
Date: Mon, 16 Nov 2026 19:39:05 +0100
Message-ID: <20261116183905.1591611-18-jgross@suse.com>
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
X-Rspamd-Queue-Id: 7F11322321
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
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
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:email];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:email]
X-Spam-Score: -12.01

There are a few MSR access functions left which are not yet marked as
__always_inline. Do the conversion.

Remove a leftover comment no longer being true related to this.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V4:
- new patch
---
 arch/x86/include/asm/msr.h | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 9cd0ff3315de..8c0f5595970b 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -269,13 +269,12 @@ static __always_inline void native_wrmsrq(u32 msr, u64 val)
 	__wrmsrq(msr, val);
 }
 
-static inline int native_read_msr_safe(u32 msr, u64 *val)
+static __always_inline int native_read_msr_safe(u32 msr, u64 *val)
 {
 	return __rdmsr(msr, val, EX_TYPE_RDMSR_SAFE) ? -EIO : 0;
 }
 
-/* Can be uninlined because referenced by paravirt */
-static inline int notrace native_write_msr_safe(u32 msr, u64 val)
+static __always_inline int notrace native_write_msr_safe(u32 msr, u64 val)
 {
 	int err;
 
@@ -301,7 +300,7 @@ static __always_inline int native_wrmsrns_safe(u32 msr, u64 val)
 extern int rdmsr_safe_regs(u32 regs[8]);
 extern int wrmsr_safe_regs(u32 regs[8]);
 
-static inline u64 native_read_pmc(int counter)
+static __always_inline u64 native_read_pmc(int counter)
 {
 	EAX_EDX_DECLARE_ARGS(val, low, high);
 
@@ -362,7 +361,7 @@ static __always_inline u64 rdmsrq(u32 msr)
 }
 
 /* rdmsr with exception handling */
-static inline int rdmsrq_safe(u32 msr, u64 *p)
+static __always_inline int rdmsrq_safe(u32 msr, u64 *p)
 {
 	int err;
 
@@ -374,7 +373,7 @@ static inline int rdmsrq_safe(u32 msr, u64 *p)
 	return err;
 }
 
-static inline void wrmsrq(u32 msr, u64 val)
+static __always_inline void wrmsrq(u32 msr, u64 val)
 {
 	write_msr(msr, val);
 
@@ -383,7 +382,7 @@ static inline void wrmsrq(u32 msr, u64 val)
 }
 
 /* wrmsr with exception handling */
-static inline int wrmsrq_safe(u32 msr, u64 val)
+static __always_inline int wrmsrq_safe(u32 msr, u64 val)
 {
 	int err;
 
-- 
2.56.0

