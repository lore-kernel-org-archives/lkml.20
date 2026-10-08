Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2BA3DF01F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443992; cv=none; b=SaQdV8V2a1NU9dWVdzJjrgA3cuSyPvKMxTm7u8A1N16zH7Z0x3BhuWV9zS4DaN2i8Ry9628Df466NQqIdM/oVokBY+fKFiWLCJJOF6B2AK52Ibik4CMCkGRV0MBfqb3jgQKOnnElxco9geKAAXbKX0cacU7oSNc8F1E/HP9kY/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443992; c=relaxed/simple;
	bh=/kzVoVk5PsNlCLxCkKXedZDtmSZUJBXARrSyIWflFsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rs5/uVuKbD2t3yoMlf1UpsAFsc6KI0kpb+LMVqKzhXyF+i/bwCEB1OUZkPoWG3dPPWzmkRiNmpCEwEwhzh6F12UHhXh882tCPr+hjfPMN35y89V75+IyazlMXCLhPk7Vuvuc5nfI0XbDIE33z11ntuTWBJqofk3CVsvPwJ6hxEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6D3F221B5A;
	Thu,  8 Oct 2026 07:19:42 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB12913354;
	Thu,  8 Oct 2026 07:19:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lKZxJw1Ex2rAcQAAD6G6ig
	(envelope-from <jgross@suse.com>); Thu, 08 Oct 2026 07:19:41 +0000
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
Subject: [PATCH v4 10/13] x86/msr: Remove wrmsr()
Date: Thu,  8 Oct 2026 09:18:36 +0200
Message-ID: <20261008071839.2247074-11-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008071839.2247074-1-jgross@suse.com>
References: <20261008071839.2247074-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 6D3F221B5A
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
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
2.55.0

