Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845008;
	b=dxCrDh0wOoNaRyEPJQOp5TIwTobksAuxVphza1gTF9TMTcXL07v5MJyksFu5gzKhXTY5
	 EBRk7bhSyo/rYSv6VcK1WZS5O5c5l2nfv7OPv124g9chuU0SBym8b/X451F1xReMbDGqT
	 bfkGMioLWgK5AHINCQZf84QxSmgF0RSDm4OMLhBh85ls3wQEp/E2oRopeI6iC6B2mwjv+
	 U3qyXXAFS2Fto1W7YbeOkifirg3U1l5Wj0WSJPSbWlGRu6H4GzE2dZQg9xXKFiSrnFkCR
	 M7SuTzst+3PvxJfxA90lF2ckiYj7iSgmEjfcvqgOtibsqbzScPwaWWks+dlhyzUcXkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845008;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Spam-Flag:
	 X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=XkqPB03SAz7WZka/YffSghw9wnh55+GSjFw+ElTS6gY=;
	b=LU8S59Fm8YHMinW3vSQ7mDlPiyaNVzoUWNhMBG//u5qWzwxAkYdJqKXJQyZn3k/UqBpU
	 yVkMqkU5tlQ+xbEQabN/757KuHloCKKmDF/s8ZYDmPwySCOF7cnnRe3o4Y0vP8UXASEuV
	 LEgn8iHhy/ArL5lkczGOTugwJXOikfItPtpOoT6X77n4XUvb0/NLpQ8r5N3qnkpVamBl5
	 /Q84Gp3x5o48kOEEsR0vYh5a6TKoRC0/xnWA04K9Qo5/iVetwWTnrKJoPyGq8+DZYuRT0
	 SW630MHcgMQvQPxqCV3jhSRacwCvxRCBNiEMwvnjz9Le69IL6WNR2O/dMYA/zR0Opqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Sn2gIe4K;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Sn2gIe4K;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C926D606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C926D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Sn2gIe4K;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Sn2gIe4K
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 26FC52230F;
	Mon, 16 Nov 2026 16:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794845006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XkqPB03SAz7WZka/YffSghw9wnh55+GSjFw+ElTS6gY=;
	b=Sn2gIe4KnN9hXRrVJnK62vpkdEeXa+ONfho9hCU7cPF66qCgAykDIDjE30lppRh4DSVO5b
	VdzH0MrijrndhPAwZqhxvnFSrtYVE7ObNeRUPIMjDc76fxELjRTt4vjbxYReeV6HK6XCmF
	aWP6JmXt13px5n7UBE2ssHDANNIkPLo=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794845006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XkqPB03SAz7WZka/YffSghw9wnh55+GSjFw+ElTS6gY=;
	b=Sn2gIe4KnN9hXRrVJnK62vpkdEeXa+ONfho9hCU7cPF66qCgAykDIDjE30lppRh4DSVO5b
	VdzH0MrijrndhPAwZqhxvnFSrtYVE7ObNeRUPIMjDc76fxELjRTt4vjbxYReeV6HK6XCmF
	aWP6JmXt13px5n7UBE2ssHDANNIkPLo=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C12B01334C;
	Mon, 16 Nov 2026 16:03:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fdyXJU0p+2qJUwAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 16 Nov 2026 16:03:25 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v4 4/5] x86/msr: Remove native_rdmsr()
Date: Mon, 16 Nov 2026 17:02:58 +0100
Message-ID: <20261116160259.1579333-5-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116160259.1579333-1-jgross@suse.com>
References: <20261116160259.1579333-1-jgross@suse.com>
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
X-Spamd-Result: default: False [-15.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -15.80

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
2.56.0

