Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5EA3D8116
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443949; cv=none; b=Nm2jPZfSr29SkBIjD7giJLGXEDyWIrjwCZyoqNbDGg3aYDpAD+GwOtcXyFnhf8R3UyjpdQhXWgQ1rHPv4irUCzzWQ/zlQwktbDgVxa3ku50kHcZMHPvke2h77mY/Pe1BrQnqIUkZKamlBoU5msPH0v3ETRXPz5SpsoFf3V/XTYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443949; c=relaxed/simple;
	bh=OXckmZoORfCfsw1UPiKwxm+X1mTqVlMFf6dIPLsq7Xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Byf6KsYOA6MPHHIWBWiX5V7AZczKWqDKnPbQ+9T4BES2eZXLYXhmmHt833Y7nDPx26bYIK5ui2wmUxT1VRtPtYYGlsXzjsriPDbBNXQqbQgpxI8s8NcPpljAd90/aAaOABRnJse5ednwM9ekDrjgynvJxMwU23rSDjgB95z0Z8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=shalKE8x; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=shalKE8x; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="shalKE8x";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="shalKE8x"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C1F561F798;
	Thu,  8 Oct 2026 07:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1791443942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KEZF3yzq2dSvKZ0QOIEjn84/joS2N0z8mHCENm5CI9Q=;
	b=shalKE8xhn8Ji4UUC4lR0nXJOMjl0y+JW+iqOKbErcFJEoT091Uq3MI7QGTRQ1Woa9104k
	c5nYekkMXoAPk9UgBUlVUSEQwgPIV1HKMeAOO3Su5ZZz0QSlIcy7bVuZeIPenCx9a7Tpmo
	DFcBkhlKEvrkFRwmlP6y2QP1wLRuVFo=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1791443942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KEZF3yzq2dSvKZ0QOIEjn84/joS2N0z8mHCENm5CI9Q=;
	b=shalKE8xhn8Ji4UUC4lR0nXJOMjl0y+JW+iqOKbErcFJEoT091Uq3MI7QGTRQ1Woa9104k
	c5nYekkMXoAPk9UgBUlVUSEQwgPIV1HKMeAOO3Su5ZZz0QSlIcy7bVuZeIPenCx9a7Tpmo
	DFcBkhlKEvrkFRwmlP6y2QP1wLRuVFo=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2F78913354;
	Thu,  8 Oct 2026 07:19:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qb3SMuVDx2pVcQAAD6G6ig
	(envelope-from <jgross@suse.com>); Thu, 08 Oct 2026 07:19:02 +0000
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
Subject: [PATCH v4 03/13] x86/msr: Remove rdmsr_safe()
Date: Thu,  8 Oct 2026 09:18:29 +0200
Message-ID: <20261008071839.2247074-4-jgross@suse.com>
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
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
	RCVD_TLS_ALL(0.00)[]

rdmsr_safe() has no users left. Delete it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/msr.h      | 10 ----------
 arch/x86/include/asm/paravirt.h | 10 ----------
 2 files changed, 20 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 6fb7125608c7..776a2daa2ba2 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -205,16 +205,6 @@ static inline int wrmsrq_safe(u32 msr, u64 val)
 	return native_write_msr_safe(msr, val);
 }
 
-/* rdmsr with exception handling */
-#define rdmsr_safe(msr, low, high)				\
-({								\
-	u64 __val;						\
-	int __err = native_read_msr_safe((msr), &__val);	\
-	(*low) = (u32)__val;					\
-	(*high) = (u32)(__val >> 32);				\
-	__err;							\
-})
-
 static inline int rdmsrq_safe(u32 msr, u64 *p)
 {
 	return native_read_msr_safe(msr, p);
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 0591aa38fd85..97b082095572 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -177,16 +177,6 @@ static inline int wrmsrq_safe(u32 msr, u64 val)
 	return paravirt_write_msr_safe(msr, val);
 }
 
-/* rdmsr with exception handling */
-#define rdmsr_safe(msr, a, b)				\
-({							\
-	u64 _l;						\
-	int _err = paravirt_read_msr_safe((msr), &_l);	\
-	(*a) = (u32)_l;					\
-	(*b) = (u32)(_l >> 32);				\
-	_err;						\
-})
-
 static __always_inline int rdmsrq_safe(u32 msr, u64 *p)
 {
 	return paravirt_read_msr_safe(msr, p);
-- 
2.55.0

