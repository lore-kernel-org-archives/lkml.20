Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292AB453A25
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113179; cv=none; b=Zv1twLbxdMEWHho2qxvbid7M+jslB9HGPSA9RdWPxNSNAQP1NXWQwnw1BVhmvlz8Sxl8hRrFHqAxaE3+Ng6BtoGhQdzYTP04CNN5VxRrEaz9nAXT5f+L14hXawCWpexBmv+0ZCBcTHV0jnSkCIJo9Ruq3Y6pEH9lAc9rlftS4dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113179; c=relaxed/simple;
	bh=e090XTB4dKHKZm4Zq6/wgXMv7Sal9G3m0Ch+mz7Dc+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mgYyvhXjG9flpW2iXb+aB6MdrTx1XBpmQAYcwQDUlDEskcAr0RBL1bIkwqhhX1tqrMdIR5b+w5zKO/3PVsIA348XBgnadlk11u4li4DKSJyill273zgskI0Vf0kp9MOaUFwulWQOL3VjI4nAECT0s3yFe5839ECpW1XG6FPHbyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=pWh6v8XH; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=H0o27yPc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="pWh6v8XH";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="H0o27yPc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1566F21CAA;
	Fri, 11 Sep 2026 07:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789113172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=49cvmy5kfzS7XnLM3V5cF4E+2KSFFLx0PUqQvEkMqvQ=;
	b=pWh6v8XH/AKpDke5uGwOR3kFL6/FUE2zvwzfixkXEiQSvmhiqzELSwWnGAJzpbAKptHwRe
	P/wR8icPG5OJtnKdg89QD9oHOCzkIc++qYe7usrMGc8D0/Q6HHjXtVyu+0EaVwwkscD3mH
	iNFD+4Yit3gE14ggMq/SeO8i8rGNOM8=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=H0o27yPc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789113168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=49cvmy5kfzS7XnLM3V5cF4E+2KSFFLx0PUqQvEkMqvQ=;
	b=H0o27yPc4ALFmUjsCm1AGYA+yxAd142sHB6Uy6WLFbv/laykjI6bz8dmL+Togi5UJAS3tE
	4qS0oa3c6T5fDgi6efxqEsAKD6r9AhTdOcP50iZj+UuO1ZkJ7uHHQnZN4leqnm+Lt4RyQI
	id7/xMDQ+EuBPMPDO1cqtCijAu3gyGo=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3E6013715;
	Fri, 11 Sep 2026 07:52:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ih68Jk+zo2qhYAAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 11 Sep 2026 07:52:47 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 5/5] x86/msr: Switch native_wrmsrq() from macro to inline function
Date: Fri, 11 Sep 2026 09:52:16 +0200
Message-ID: <20260911075216.3142309-6-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911075216.3142309-1-jgross@suse.com>
References: <20260911075216.3142309-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 1566F21CAA
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_RATELIMIT(0.00)[to_ip_from(RLkdkdrsxe9hqhhs5ask8616i6)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid]
X-Spam-Flag: NO

Make native_wrmsrq() an inline function.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/msr.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 7bb5bf408fa6..3b33d432bc24 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -88,8 +88,10 @@ static __always_inline u64 native_rdmsrq(u32 msr)
 	return __rdmsr(msr);
 }
 
-#define native_wrmsrq(msr, val)				\
-	__wrmsrq((msr), (val))
+static __always_inline void native_wrmsrq(u32 msr, u64 val)
+{
+	__wrmsrq(msr, val);
+}
 
 static inline u64 native_read_msr(u32 msr)
 {
-- 
2.55.0

