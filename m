Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFAF470EA9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116224; cv=none; b=XhyDRO1D15Li9a/AX9AstzgfFZXI9l2HLEL2hufBb0535fxCoVozxvCEzn+au8JqFjMLJ6iuG0//JUp2gv6gGOQTvZTW+2L3v0Bl03GSPuvvRnZhLtgkyU/UmH4wlxlMe0+s6Y4MoTDqSkk009xNfnNemWJGNcDyNUyZIja1Vtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116224; c=relaxed/simple;
	bh=bcyAHxAz0I8xy8M6NO6+RcsmZci9/CkmYb7oMZrhOjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tkHdhePn09y95BfJ7eYZcNNlLvG5IuK58YJAeZ0SX9dSpypLYG9qJcR8N5jSFMNzNxqpooQlCKYhy/aimx88jGqwS5lTxpJTEOl+doH8xJdU7DAcGZbOvyGloFAVL5H0ez3PZkQqi1r+xwbCW/LtphFDk1/F5qiKKP2/g9fBp1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ED47721B99;
	Fri, 11 Sep 2026 08:43:40 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 84F33132D3;
	Fri, 11 Sep 2026 08:43:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RvYTHzy/o2pSFgAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 11 Sep 2026 08:43:40 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v5 15/17] x86/msr: Reduce number of low level MSR access helpers
Date: Fri, 11 Sep 2026 10:42:09 +0200
Message-ID: <20260911084211.3149957-16-jgross@suse.com>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: ED47721B99
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00

Some MSR access helpers are redundant now, so remove the no longer
needed ones.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/msr.h  | 15 ++-------------
 arch/x86/xen/enlighten_pv.c |  4 ++--
 2 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index f7ad6d25bb65..dbc24550a504 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -269,22 +269,11 @@ static __always_inline void native_wrmsrq(u32 msr, u64 val)
 	__wrmsrq(msr, val);
 }
 
-static inline u64 native_read_msr(u32 msr)
-{
-	return native_rdmsrq(msr);
-}
-
 static inline int native_read_msr_safe(u32 msr, u64 *val)
 {
 	return __rdmsr(msr, val, EX_TYPE_RDMSR_SAFE) ? -EIO : 0;
 }
 
-/* Can be uninlined because referenced by paravirt */
-static inline void notrace native_write_msr(u32 msr, u64 val)
-{
-	native_wrmsrq(msr, val);
-}
-
 /* Can be uninlined because referenced by paravirt */
 static inline int notrace native_write_msr_safe(u32 msr, u64 val)
 {
@@ -327,7 +316,7 @@ static inline u64 native_read_pmc(int counter)
 #else
 static __always_inline u64 read_msr(u32 msr)
 {
-	return native_read_msr(msr);
+	return native_rdmsrq(msr);
 }
 
 static __always_inline int read_msr_safe(u32 msr, u64 *p)
@@ -337,7 +326,7 @@ static __always_inline int read_msr_safe(u32 msr, u64 *p)
 
 static __always_inline void write_msr(u32 msr, u64 val)
 {
-	native_write_msr(msr, val);
+	native_wrmsrq(msr, val);
 }
 
 static __always_inline int write_msr_safe(u32 msr, u64 val)
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 505a85c3869e..bc572ca49a2c 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1085,7 +1085,7 @@ static u64 xen_do_read_msr(u32 msr, int *err)
 	if (err)
 		*err = native_read_msr_safe(msr, &val);
 	else
-		val = native_read_msr(msr);
+		val = native_rdmsrq(msr);
 
 	switch (msr) {
 	case MSR_IA32_APICBASE:
@@ -1144,7 +1144,7 @@ static void xen_do_write_msr(u32 msr, u64 val, int *err)
 		if (err)
 			*err = native_write_msr_safe(msr, val);
 		else
-			native_write_msr(msr, val);
+			native_wrmsrq(msr, val);
 	}
 }
 
-- 
2.55.0

