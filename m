Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023908;
	b=EzemgiGg6J24Pbwn5aal8E/1anEuRLL7s1rLYC8EZUuJQQc8YXsIe5bLQvZYQ+eyzDtS
	 YCsegH6zWZXDrwKrCOvAPzUK6fHOjrt4R374vBHWrp4YUKjqe04V0z2PtpFMPOO9qVX5y
	 L3TRgWe77qxiwKSE3anddgWqpnnR/hPPhAM5hRNzXn7AlsRpmh3pb2HjJhScTgLNnA8pB
	 OXum2zXEh+akkrMUvlNw//Z5TkbG+4o3UzoKuo3GLfcXkoFC4D3vY6ppaLxDpBu5orSNP
	 yov2AE3E/kYq60nQyjo3HegFSIwfEBGGBYm47x+mTcqYDlGyhArnkWw+fyRjqsg8Apg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023908;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Server:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id:X-Rspamd-Pre-Result:X-Rspamd-Action;
	bh=XkqPB03SAz7WZka/YffSghw9wnh55+GSjFw+ElTS6gY=;
	b=P4xcdmm4SODMPAdfwHkIdOtcClwDveJ5y1OrSjUi5LSRyQnEdJ3RIUXWlSwi7BL2lCCj
	 bprgPNkI+bTJUXvgW2yJvJXZgvi/P0kyxIgNTkuxsaberyGVuzkxMi6ErxY5kVFjHKY2T
	 F1u56Jt5wSdx42hHqq/k7lissrzh52r+Ws9JfYAoo0HJal5NWBl/H2KCl7urBS6/ZsMci
	 bzIQcpicc+DtmEFtkLOAJqaQCl02xC0gWVwjCr+5KaD7KJr4gZ4Ay5HTvFiKgIRgmsmlD
	 Fs7BZZQbeWXXfvQZKBUyUVyLM3YdsggvllY8OMb4tyDRmBa3cK+80wSW2cQxHvn8VVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE5F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FE5F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B3F3F1F7E0;
	Mon, 26 Oct 2026 14:11:46 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5962913319;
	Mon, 26 Oct 2026 14:11:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +I24DKJf32rpJQAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 26 Oct 2026 14:11:46 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 4/5] x86/msr: Remove native_rdmsr()
Date: Mon, 26 Oct 2026 15:11:19 +0100
Message-ID: <20261026141120.780172-5-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026141120.780172-1-jgross@suse.com>
References: <20261026141120.780172-1-jgross@suse.com>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Queue-Id: B3F3F1F7E0
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action

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

