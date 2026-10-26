Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019801;
	b=NQoI3ghHc8DuElDnVBt34r8jSNP6T9Hsya0q0NcqilZ92OmrDvG2VHC68tXC+ciubXoM
	 Cw8Zzp55vNk72WcBfcY1i4bmu0nDuH5XvmrMbF6s1coFGuujosIrQQLToHD5yELePIKoT
	 CA2sxnUAVDvIm5nVQmwFlvY1neNIPwu5vMVDWDQavmvoxKJEOonnWytiwNIOakzJX9o59
	 uHrQeI15qlAvIffOBDUMgkwRbBCQE4qUrBIGPL0jv2cv3YJh6oKTvi3q1seLEBcQ0B93E
	 np8EUK1J5xbytqV1FNaibom205VTn3sRH/UltxMyk02NoeOOf73j6nzCquwYH78t2cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019801;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Server:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id:X-Rspamd-Pre-Result:X-Rspamd-Action;
	bh=YnPuilh2RpPWZzk8l1KEkPhcgPz+FSvpgZ6Mkcple3g=;
	b=B2qIFNZzlKxrt6iXiU3o6dGMcW4LBzLpQBO8J9rP3IUz7x+4P2I0yXA6k9HBG/My5zIT
	 yirSQiWKU+JPU70jJkZZ61r9SWx8GiRArRmjbnbPdRskoJu5kG8exhBlZ1ecl8x7nOzdc
	 rNgbrCHIOS4CfU9lJkgm9HqVHOMdaS5EO36RDgxxU78/nCewDxIz8mEt9Ed5Ijb2RcOQT
	 jndbcYHk4UDarblgkd2Kt9n9IO3tg8qyufcaH2I/9iquU2G7Xb/hGrf/BuyXhyzPA7ZEy
	 93tRPvObAeBVgcdOZ0qVt+OVlNdFqo8iq5pqwYEqrK1F2iqaulHSLcJvCx/H8ZLRoLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D906E606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D906E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 759BE2217D;
	Mon, 26 Oct 2026 13:03:19 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 056C513408;
	Mon, 26 Oct 2026 13:03:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QNc1M5ZP32pKWwAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 26 Oct 2026 13:03:18 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: [PATCH v5 09/12] x86/msr: Remove wrmsr()
Date: Mon, 26 Oct 2026 14:02:20 +0100
Message-ID: <20261026130223.773129-10-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026130223.773129-1-jgross@suse.com>
References: <20261026130223.773129-1-jgross@suse.com>
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
	REPLY(-4.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLkdkdrsxe9hqhhs5ask8616i6)]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Queue-Id: 759BE2217D
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action

wrmsr() has no users left. Delete it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/msr.h      | 5 -----
 arch/x86/include/asm/paravirt.h | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 776a2daa2ba2..badab5762f3a 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -186,11 +186,6 @@ do {								\
 	(void)((high) = (u32)(__val >> 32));			\
 } while (0)
 
-static inline void wrmsr(u32 msr, u32 low, u32 high)
-{
-	native_write_msr(msr, (u64)high << 32 | low);
-}
-
 #define rdmsrq(msr, val)			\
 	((val) = native_read_msr((msr)))
 
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 97b082095572..47d4e36d14cb 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -157,11 +157,6 @@ do {						\
 	val2 = _l >> 32;			\
 } while (0)
 
-static __always_inline void wrmsr(u32 msr, u32 low, u32 high)
-{
-	paravirt_write_msr(msr, (u64)high << 32 | low);
-}
-
 #define rdmsrq(msr, val)			\
 do {						\
 	val = paravirt_read_msr(msr);		\
-- 
2.56.0

