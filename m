Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93E347013F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116244; cv=none; b=XX9eeFlFTHUKCzTYvH2J7i/TVg1x0dwKwNsPOZNlMTKQeakyN1FfZyzxUuXuxql10LfE1wtr2MgX0OnrsaPOBPqzW+RmwTcYVi/tdmPIeVKYhzpD2MOyXvZrldPxzdjk0EtQ+8Rz8EmQudyGVvQbIQLygOU6gOypbxbyqgQwwJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116244; c=relaxed/simple;
	bh=wJWqEHwy7j9/i8GKo0O0AOxVIOUYMdsOWt7xdHEydCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bzTbpDIs6HIR025pES1MeKodWVEG9P7G7G+ZyVT9KhojRjVEA2EuIoqwJR4WMeIl5/vTx1VXXJRnfl1aZZmIdFoP4wff6hwnY6tKrPyCmW/n5zbc+hlGJIeHO+JroHXlhnb3xzX38u42c43vWg9HVxhNGm1FEsoBmHz2pShIFzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=XN4Rwe42; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=qs0F2eX3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="XN4Rwe42";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="qs0F2eX3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 91DD521B99;
	Fri, 11 Sep 2026 08:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789116236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMtn8gIOOZq8LpmnTYdOLRi0OEDFsg/HRAFdQKVEh9Q=;
	b=XN4Rwe42zwHxXM4SAYNwr1TGeujBpOoyv7lNQC1mi0QW2v6F7NsoLBeEJsqxZUyEs4nF0O
	JsEHjlt9j2Kq8XPed5f/SZMELdKlslng2OwyDhdfU1iyYaEKIVUDNZRNGq/VBC1sNT7ntn
	SZyfc5xaszwGCf7cXCtCnjs0eR8MeZA=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789116232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMtn8gIOOZq8LpmnTYdOLRi0OEDFsg/HRAFdQKVEh9Q=;
	b=qs0F2eX326efsXMlaO58fButBtJy7r5O6vJE8DNDXPICBcyCzyogrPsVo9a/0/P7jyteAm
	pfXn3m0AL2Sv4zPdGiJex/euLArPCI7bkhdTfokUyuqQfG2c9/OusARv5zn4ULcWqvU3WU
	eevSek0OyYZBQw9qLkNiac7pF1sP3bA=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 34C6513794;
	Fri, 11 Sep 2026 08:43:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Y2eTC0i/o2rcFgAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 11 Sep 2026 08:43:52 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v5 17/17] x86/msr: Make all MSR access functions __always_inline
Date: Fri, 11 Sep 2026 10:42:11 +0200
Message-ID: <20260911084211.3149957-18-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911084211.3149957-1-jgross@suse.com>
References: <20260911084211.3149957-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

There are a few MSR access functions left which are not yet marked as
__always_inline. Do the conversion.

Remove a leftover comment no longer being true related to this.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V4:
- new patch
---
 arch/x86/include/asm/msr.h | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index dbc24550a504..eba325ecfe4c 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -269,13 +269,12 @@ static __always_inline void native_wrmsrq(u32 msr, u64 val)
 	__wrmsrq(msr, val);
 }
 
-static inline int native_read_msr_safe(u32 msr, u64 *val)
+static __always_inline int native_read_msr_safe(u32 msr, u64 *val)
 {
 	return __rdmsr(msr, val, EX_TYPE_RDMSR_SAFE) ? -EIO : 0;
 }
 
-/* Can be uninlined because referenced by paravirt */
-static inline int notrace native_write_msr_safe(u32 msr, u64 val)
+static __always_inline int notrace native_write_msr_safe(u32 msr, u64 val)
 {
 	int err;
 
@@ -301,7 +300,7 @@ static __always_inline int native_wrmsrns_safe(u32 msr, u64 val)
 extern int rdmsr_safe_regs(u32 regs[8]);
 extern int wrmsr_safe_regs(u32 regs[8]);
 
-static inline u64 native_read_pmc(int counter)
+static __always_inline u64 native_read_pmc(int counter)
 {
 	EAX_EDX_DECLARE_ARGS(val, low, high);
 
@@ -363,7 +362,7 @@ static __always_inline u64 rdmsrq(u32 msr)
 }
 
 /* rdmsr with exception handling */
-static inline int rdmsrq_safe(u32 msr, u64 *p)
+static __always_inline int rdmsrq_safe(u32 msr, u64 *p)
 {
 	int err;
 
@@ -375,7 +374,7 @@ static inline int rdmsrq_safe(u32 msr, u64 *p)
 	return err;
 }
 
-static inline void wrmsrq(u32 msr, u64 val)
+static __always_inline void wrmsrq(u32 msr, u64 val)
 {
 	write_msr(msr, val);
 
@@ -384,7 +383,7 @@ static inline void wrmsrq(u32 msr, u64 val)
 }
 
 /* wrmsr with exception handling */
-static inline int wrmsrq_safe(u32 msr, u64 val)
+static __always_inline int wrmsrq_safe(u32 msr, u64 val)
 {
 	int err;
 
-- 
2.55.0

