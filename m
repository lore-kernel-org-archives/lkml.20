Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841347;
	b=1upcFwni7gUqNE5kYOADqJFP4aJGD635nbf9EqxaNFgv/HYVTEjg3a3mTxOxA0vKh9Pr
	 6cCIsyURcwYPpiDNFNTkdDfDWfLZgnf4TBnk5tdLRkUkyhw/Rt0cUtPucJN0jTMZw+2Am
	 FYV2m4lWq3IJjoKfdLAcv6mvQDpfKsr7JX/B/rBF48KD20zbhUcNXovhURqsNDz3NygwX
	 Usdyih+3SG8MrOQzOLXeHnGPxG080TdgTA+congQCc22g1XfN4OF0+0T11NCsjOpJJFUj
	 vQ1gJzB22Qn+9MgnVWOBOdTHBAqLS0XS4FNODw6A6t74rK496Pr4GC4Dj4ll/RXtieQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841347;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Spam-Flag:
	 X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=2p6abf5vLX68oJH4sT6bwzN15J56l3lN59+GsPjE5eY=;
	b=yrYyDk+KZtHqKPK8cbRUeScjSUJ/P50sz5FTORiLqiqMIwZfAItOkTHN/maRn5dLhWtQ
	 dLnyEvY4lsixNMY2maHxM8L68Ri8ee815looOnaOp/EAiaGcrlr+75F1w+21ncuzRH9nF
	 Z7rVqDmgotEJJw+1D73gD2kNa7r90ejqXuD3IarZsPQiseU9/QnzB3nFDoBg4VflcbBti
	 JKjhU+CmyZdjzWWL86M0tqPsiullzWNn/qL3KbFax7iBDCe18q9Ex+0UoF5bFn2lMvkcF
	 XE2DZkgKnse9PwY3vDXyinhhz1tz1ES+UHbHb1RZe120jfuVdMkiXVPgUv6kl2Wea/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=SG35dbCm;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=SG35dbCm;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481E2606A898
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 481E2606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=SG35dbCm;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=SG35dbCm
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8AEE0221FF;
	Mon, 16 Nov 2026 15:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794841345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2p6abf5vLX68oJH4sT6bwzN15J56l3lN59+GsPjE5eY=;
	b=SG35dbCmlOxvsreUcQsSKL/q2q/UMkDhMy3uudnOisjG3w39pVnxyHVE1iAePqBYifZaSg
	AVhj2jffCLZdqZ7eVpd++LOqUMgWyzNiHWFjbtYwvKFjMR0ppEsygDRoa7tkO8wNP5YLGt
	3ICoiS6B3hPzpnKX681tuODpkLIu2Fo=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794841345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2p6abf5vLX68oJH4sT6bwzN15J56l3lN59+GsPjE5eY=;
	b=SG35dbCmlOxvsreUcQsSKL/q2q/UMkDhMy3uudnOisjG3w39pVnxyHVE1iAePqBYifZaSg
	AVhj2jffCLZdqZ7eVpd++LOqUMgWyzNiHWFjbtYwvKFjMR0ppEsygDRoa7tkO8wNP5YLGt
	3ICoiS6B3hPzpnKX681tuODpkLIu2Fo=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2E4E613408;
	Mon, 16 Nov 2026 15:02:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fBzEAQEb+2rFDwAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 16 Nov 2026 15:02:25 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v6 02/12] x86/msr: Remove wrmsr_safe()
Date: Mon, 16 Nov 2026 16:01:58 +0100
Message-ID: <20261116150208.1572254-3-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116150208.1572254-1-jgross@suse.com>
References: <20261116150208.1572254-1-jgross@suse.com>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	URIBL_BLOCKED(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80

wrmsr_safe() has no users left. Delete it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/msr.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 2f41a9289d79..6fb7125608c7 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -242,14 +242,6 @@ static __always_inline void wrmsrns(u32 msr, u64 val)
 		     : : "c" (msr), "a" ((u32)val), "d" ((u32)(val >> 32)));
 }
 
-/*
- * Dual u32 version of wrmsrq_safe():
- */
-static inline int wrmsr_safe(u32 msr, u32 low, u32 high)
-{
-	return wrmsrq_safe(msr, (u64)high << 32 | low);
-}
-
 struct msr __percpu *msrs_alloc(void);
 void msrs_free(struct msr __percpu *msrs);
 int msr_set_bit(u32 msr, u8 bit);
-- 
2.56.0

