Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0AA3F0AAD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113174; cv=none; b=rX37/EaXjp6hPk38VjcItykhMYkuJ/FEtbSYSslToo4uAVZkgCs+k9g0lORHulEge8EsQCqAtplynVO4YwETQZrIKJMDPSTgW4SldpYBMcfQUTECtnPQQV5IIBSIDA9BiJ9jn/G1sQJ1cja9CA6IbZZF+mZYfV9kJO4jeTjBTyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113174; c=relaxed/simple;
	bh=8Iogk9KLodMF4GGMjy5vPpqbNzNgs7ak5plzwfUfoms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dgpI7urq7CavJMHGlXkHZV5WZJSp7thTxI4N+J3OcbBDX1cIok68NdAqw0I2XMkFiYeB6bFPRXhIvluUTAX8QQYtKNLSEaLYdFzX8QerDA/Wj12lf6mTYm1rq+7Tg1Y4SqFpdvk2V5eizTTcf6fnMGBWZnF7hWGdQvdEPGxAetg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=dLupT2YF; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=iJiY9HcU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="dLupT2YF";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="iJiY9HcU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5779D1FD61;
	Fri, 11 Sep 2026 07:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789113166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZMupU525lLrXKAybBefTtO02qEIUgoa32p4Va8M9Oo=;
	b=dLupT2YF3LnBpmc3dJs6C7/77Ec3e0dxsSTL7JfzwjLxCQRtqlfgx5+ww3MmPWaasvli/k
	m40BRMww/R6Fu9R6JP3txGuisswOy8wdWAC7CGeUpTTjz3XCjpdCfAZE/Rsji+C30lXsL4
	X/7ATMEoEna0ZdPaGCCaSsWUhtL13hI=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=iJiY9HcU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789113162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZMupU525lLrXKAybBefTtO02qEIUgoa32p4Va8M9Oo=;
	b=iJiY9HcUbv+HUGzlUlJ1r5PzebQE9QK7Z8GmLTp6XGIsf+uh1iJVeHbc8uw6iyUV0O+HGN
	fiCukdBwB4dWClltrXAizxMHxkP+dyx+XZH+et6tmSpmpPbpub1Iyw73nC6P7wpDDvWqDT
	sKYM7gTZw/Tx6ohW1o6e7+5fYaxw3gQ=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EED64136ED;
	Fri, 11 Sep 2026 07:52:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sobnOEmzo2oaYAAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 11 Sep 2026 07:52:41 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 4/5] x86/msr: Remove native_rdmsr()
Date: Fri, 11 Sep 2026 09:52:15 +0200
Message-ID: <20260911075216.3142309-5-jgross@suse.com>
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
X-Rspamd-Queue-Id: 5779D1FD61
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLkdkdrsxe9hqhhs5ask8616i6)];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Flag: NO

As native_rdmsr() has no users left, remove it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/msr.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index bfad2b96a892..7bb5bf408fa6 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -83,13 +83,6 @@ static __always_inline void __wrmsrq(u32 msr, u64 val)
 		     : : "c" (msr), "a" ((u32)val), "d" ((u32)(val >> 32)) : "memory");
 }
 
-#define native_rdmsr(msr, val1, val2)			\
-do {							\
-	u64 __val = __rdmsr((msr));			\
-	(void)((val1) = (u32)__val);			\
-	(void)((val2) = (u32)(__val >> 32));		\
-} while (0)
-
 static __always_inline u64 native_rdmsrq(u32 msr)
 {
 	return __rdmsr(msr);
-- 
2.55.0

