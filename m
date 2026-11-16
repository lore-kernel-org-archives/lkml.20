Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854403;
	b=re75lNjEh/NdXm6QWWNGCkcUdsfPDwbaRYqd9M+qepJ7iUz7mzgR+AGwtXA9wm/qgj0s
	 pUbUbp7mYNlwc04PTJCMEDEqYen1W6J1lVVVAHPGebtbjz3AdF2GWAysnKziezwTuPzTa
	 lJ2jOTZ0nZS61PH9GuUK0j+ENk9tqa1ZNQSYq6Ze+nVK+LMAbj1B4WPHha1F4JYq4QOnF
	 yz/SHacLFg766FZeeCdvAcMJqtzn1R3ad0xYFPZ4jBBjQhralmS16N3WzCgH/DFoT1GWY
	 1GCC25IBJzBOs0p7VKF6dAH7nB7KRsB7RTX77yAOtGfRCfay84Ktq26WBHjMG9pBK9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854403;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Spam-Flag:
	 X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=+W/peW931ks1NitI7gAwZygwrsosWHRkgrBp6o5KG4Q=;
	b=q68ruCmdBNz0P7P/NeKWLYssz7REe8gCQbIG22OtpH673IO+126br1A8cLv2mZZOA+bu
	 udObO8qQRIObHWNc0E+mfpykD/LUoEdRtz/YgiiRoLr4XnYitK+oUgiSNtSP0YyEtiz/a
	 rcDhMIYyk/9x5J0l5CWRhR73HcTguNJXCx7n893R6omPCUFQYqx02p4gW96Tepwf+2M0t
	 CbwMRnipNnFKNwtHUUDOn4aV7j4q4Pq28sLdiu47zlJA60AA3Z+ieCjnEGLbIbzvDvVzw
	 usUEtbPhJoQqgaa/0Ojl8mnLppLbagV4jzQRs3iLDWyvVzc3Z/m0OM6n0MGew03b8fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=YMAHk1hd;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=lbT3pVeC;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED92606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ED92606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=YMAHk1hd;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=lbT3pVeC
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E91DE1F899;
	Mon, 16 Nov 2026 18:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794854401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+W/peW931ks1NitI7gAwZygwrsosWHRkgrBp6o5KG4Q=;
	b=YMAHk1hdTBGZzYSq8Ea4hb5qNPb1nHsTvTVNINxMphhtL7r7G/c3T3iTY78V25CbAZhC0l
	Bclhr6SagTmDR1btbXhRi8/fTwaOrnaFsD3ZfPXIIRHIQ7daPMuvKv/SgH1owmR3IuvR2k
	9URG9/t4Fxa5J04kqz7lbgEkBJMAZoY=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794854400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+W/peW931ks1NitI7gAwZygwrsosWHRkgrBp6o5KG4Q=;
	b=lbT3pVeCWV0Gt4e/I94ZyFHjknNT7w0s0UrR3HrqgBZa1qapPUAkO6aIsJYeZMI2rVPgKh
	HAwsLqgzFWHBuEe+wLLijdl2TtfE/yjxmLDDs0F2q8utcaN/mVrUGgpcSwZa1g/h7wEf+u
	2XFDCJyuSBaOloIZY2qCvErTby8DJKw=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86C911334C;
	Mon, 16 Nov 2026 18:40:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jFO/FwBO+2p5eAAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 16 Nov 2026 18:40:00 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v6 09/17] x86/msr: Introduce sync_cpu_after_wrmsrns()
Date: Mon, 16 Nov 2026 19:38:57 +0100
Message-ID: <20261116183905.1591611-10-jgross@suse.com>
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
	URIBL_BLOCKED(0.00)[zytor.com:email,imap1.dmz-prg2.suse.org:helo,suse.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zytor.com:email,suse.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80

In order to allow using wrmsrns() for multiple MSR register writes
introduce sync_cpu_after_wrmsrns() which will then do a CPU serialize
operation, if the hardware does support the WRMSRNS instruction. In
case the hardware doesn't support WRMSRNS, sync_cpu_after_wrmsrns()
will be a NOP.

Suggested-by: H. Peter Anvin <hpa@zytor.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V4:
- new patch
---
 arch/x86/include/asm/msr.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 99d4e07165e9..12e94aba992b 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -14,6 +14,7 @@
 #include <linux/errno.h>
 #include <linux/types.h>
 #include <linux/percpu.h>
+#include <asm/special_insns.h>
 
 struct msr_info {
 	u32			msr_no;
@@ -361,6 +362,12 @@ static __always_inline int wrmsrns_safe(u32 msr, u64 val)
 	return err;
 }
 
+static __always_inline void sync_cpu_after_wrmsrns(void)
+{
+	if (cpu_feature_enabled(X86_FEATURE_WRMSRNS))
+		serialize();
+}
+
 static __always_inline u64 rdpmc(int counter)
 {
 	u64 val;
-- 
2.56.0

