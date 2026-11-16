Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854437;
	b=qkqdezTA1m/XI8hlAqgtEfX6ZdfaSNWtJg3WtiLpfwZXuB14JCcwwYOdR7AqTqYYLbTD
	 pjbLQUgkRKNDCFIEwwYEeAkSlalZO14PEr4TCFX6w6bbeW9jgJ6jhuafyuAd3QUrETXw0
	 1Bsxc6t0upbwOvsBb77luLRhFbqqGXfo2Y5M6UGFbkfxrayK6PEvTy1TW6TMGWUlvZyIa
	 jQ7i4fubGjEy8/tZY+epSEmiO5+5ooD9bYiTjDK4m+kUBJQxnJOOKqfiN6YDcRFzlQb8p
	 qKy6FjUSuUey+ZzRlHwiJcP9KF+vEodizyo0slw7Tcrj+gaD4rknE7BnwtgCWd1HayA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854437;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=VS8wL9kkiYmRwabJ4JZMPCook2J6t7KFmcGdebum2vQ=;
	b=jHSnfmIevEoc6rgrg+aF9E00ZUxX1tLWJb9EGtjZo4lWdTBzxRIUrdh9K+1YdWWTKBYK
	 x2ZRyRdqrWcphjntXcn46opl5TxD0DUNlBhkM4AMDmW+PlDQQ7GsTGZ7KcNMTig3Ckjwu
	 c1uHHLlUgJsKu/1A13htmyfddrzMfoJ2ojcfPppJAGM7j7hUjj8zKcIkWbA0xJHmfk3qT
	 7e3Y6FBx+LhJ84/cTEprMZeqLdreOx8cIDpp0oxW2l5W0tgHG0ylx46k6ADiBcDLV6IR4
	 ba1DFohzbJamQr62zkUIRJvkKiZy1uCcROsZ5iFEa4RGwL9hnPQadqcWvA25cXVGnIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=eESRc8cK;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=eESRc8cK;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B33D606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B33D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=eESRc8cK;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=eESRc8cK
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CD7161F899;
	Mon, 16 Nov 2026 18:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794854435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VS8wL9kkiYmRwabJ4JZMPCook2J6t7KFmcGdebum2vQ=;
	b=eESRc8cKYmheJ4E50lA4zzybxR3RjeYlpPcKuTpgNcxF0nYL6Ylx8/WmF3ck62r+F7Bj9k
	q7hS5Gw6ztz37FDgj5bEFCyMxjFfpmdYQp/CdLUgd0ayAPqY/IEQ3UT4CidQ7jfTvdQvnc
	MFMrBjGUpEUrCabB1WD1pNt+skI1P9E=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794854435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VS8wL9kkiYmRwabJ4JZMPCook2J6t7KFmcGdebum2vQ=;
	b=eESRc8cKYmheJ4E50lA4zzybxR3RjeYlpPcKuTpgNcxF0nYL6Ylx8/WmF3ck62r+F7Bj9k
	q7hS5Gw6ztz37FDgj5bEFCyMxjFfpmdYQp/CdLUgd0ayAPqY/IEQ3UT4CidQ7jfTvdQvnc
	MFMrBjGUpEUrCabB1WD1pNt+skI1P9E=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 655B51334C;
	Mon, 16 Nov 2026 18:40:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id K+dGDyNO+2rCeAAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 16 Nov 2026 18:40:35 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v6 15/17] x86/msr: Reduce number of low level MSR access helpers
Date: Mon, 16 Nov 2026 19:39:03 +0100
Message-ID: <20261116183905.1591611-16-jgross@suse.com>
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
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	URIBL_BLOCKED(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80
X-Spam-Level: 
X-Spam-Flag: NO

Some MSR access helpers are redundant now, so remove the no longer
needed ones.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/msr.h  | 15 ++-------------
 arch/x86/xen/enlighten_pv.c |  4 ++--
 2 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 72f079df643d..9cd0ff3315de 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -269,22 +269,11 @@ static __always_inline void native_wrmsrq(u32 msr, u64 val)
 	__wrmsrq(msr, val);
 }
 
-static inline u64 native_read_msr(u32 msr)
-{
-	return native_rdmsrq(msr);
-}
-
 static inline int native_read_msr_safe(u32 msr, u64 *val)
 {
 	return __rdmsr(msr, val, EX_TYPE_RDMSR_SAFE) ? -EIO : 0;
 }
 
-/* Can be uninlined because referenced by paravirt */
-static inline void notrace native_write_msr(u32 msr, u64 val)
-{
-	native_wrmsrq(msr, val);
-}
-
 /* Can be uninlined because referenced by paravirt */
 static inline int notrace native_write_msr_safe(u32 msr, u64 val)
 {
@@ -326,7 +315,7 @@ static inline u64 native_read_pmc(int counter)
 #else
 static __always_inline u64 read_msr(u32 msr)
 {
-	return native_read_msr(msr);
+	return native_rdmsrq(msr);
 }
 
 static __always_inline int read_msr_safe(u32 msr, u64 *p)
@@ -336,7 +325,7 @@ static __always_inline int read_msr_safe(u32 msr, u64 *p)
 
 static __always_inline void write_msr(u32 msr, u64 val)
 {
-	native_write_msr(msr, val);
+	native_wrmsrq(msr, val);
 }
 
 static __always_inline int write_msr_safe(u32 msr, u64 val)
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 11814bc2633a..4752230a03b8 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1085,7 +1085,7 @@ static u64 xen_do_read_msr(u32 msr, int *err)
 	if (err)
 		*err = native_read_msr_safe(msr, &val);
 	else
-		val = native_read_msr(msr);
+		val = native_rdmsrq(msr);
 
 	switch (msr) {
 	case MSR_IA32_APICBASE:
@@ -1144,7 +1144,7 @@ static void xen_do_write_msr(u32 msr, u64 val, int *err)
 		if (err)
 			*err = native_write_msr_safe(msr, val);
 		else
-			native_write_msr(msr, val);
+			native_wrmsrq(msr, val);
 	}
 }
 
-- 
2.56.0

