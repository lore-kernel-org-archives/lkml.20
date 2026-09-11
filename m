Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B7D459AD9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113168; cv=none; b=YBJ5YumBl5kDZkQtEfAdB2ztG+AdDea25ckcmQWv5d+n8Tz/sGE4x/Kw0Ylr2Ey8I2jCS2n2Cbo4Z6rrGFa+wLQmeOeg0zSe4+5YDraVrunEp/NAVeKtuAwdBiNemj0h06jJsjgIMZzC8shEVxJaeTLlLsruo5YN/8qxCBCKkSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113168; c=relaxed/simple;
	bh=/eWQeo9koRJgrBCgnEff44nXQQ2kUKsppO3UvLLD9yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mXe/OClAlPYqfSInqPaCHMIF5AEV/7PpRHXqUARrnF/XjO8xum8/IzYvdt9Bfvz13GWXBqH2U8k1MQFM5OcC8jrpNbiINYAslx5HwuwUGsSZd4O6VK6/qMzB0AnAmQji6CV/PR2KQXAEkK/eJ1ghlHBukdveE6+/SIVp/dHxC3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=GDWohYTr; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=fydkNycs; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="GDWohYTr";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="fydkNycs"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C265F21D30;
	Fri, 11 Sep 2026 07:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789113160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PS1lMat3e0bc2mKTSmwxcGje28XFS7xN8LQ1bb5HiWM=;
	b=GDWohYTr0FHX52oGS1Jhbv1yZopho/hnIDVORSm+FuL1uM58Xk11ys6xMnKCaNpljRo8Co
	KFOBLnwTllOU85OyAhYQFmNioBd5f6wMRKA7uGwI/jTto+eVOT5FZHiz1+BrG0ET2j+LOD
	O9iHWfO0Qnj0czBu8gRHtSulZd/D+Qk=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789113156; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PS1lMat3e0bc2mKTSmwxcGje28XFS7xN8LQ1bb5HiWM=;
	b=fydkNycsWyzL91yL2EsNY8rvGootfcYC+kzioJDFj8me0rFSlL3dk8JlQMuBFHsDiQX4wo
	M3EWFoAwsOkDXShyRBEK/PMmLUQxdF0e/iGPfNrX9xFKwPTecoDqswcHtZKEcwlkvkp1lP
	MRnc7bM2PRXKAjm9qwZSPKcJ8KEqbpc=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4072B13770;
	Fri, 11 Sep 2026 07:52:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3xpSDkSzo2oPYAAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 11 Sep 2026 07:52:36 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 3/5] x86/msr: Switch users of native_rdmsr() to native_rdmsrq()
Date: Fri, 11 Sep 2026 09:52:14 +0200
Message-ID: <20260911075216.3142309-4-jgross@suse.com>
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
X-Spam-Level: 
X-Spam-Score: -2.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

Switch all users of native_rdmsr() to native_rdmsrq() in order to
prepare removal of native_rdmsr().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/microcode.h     | 6 +-----
 arch/x86/kernel/cpu/intel.c          | 6 +++---
 arch/x86/kernel/cpu/microcode/amd.c  | 4 ++--
 arch/x86/kernel/cpu/microcode/core.c | 4 ++--
 4 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/microcode.h b/arch/x86/include/asm/microcode.h
index 645e65ac1586..6eef329def4b 100644
--- a/arch/x86/include/asm/microcode.h
+++ b/arch/x86/include/asm/microcode.h
@@ -64,17 +64,13 @@ static inline int intel_microcode_get_datasize(struct microcode_header_intel *hd
 
 static inline u32 intel_get_microcode_revision(void)
 {
-	u32 rev, dummy;
-
 	native_wrmsrq(MSR_IA32_UCODE_REV, 0);
 
 	/* As documented in the SDM: Do a CPUID 1 here */
 	native_cpuid_eax(1);
 
 	/* get the current revision from MSR 0x8B */
-	native_rdmsr(MSR_IA32_UCODE_REV, dummy, rev);
-
-	return rev;
+	return native_rdmsrq(MSR_IA32_UCODE_REV) >> 32;
 }
 #endif /* !CONFIG_CPU_SUP_INTEL */
 
diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 2aabe9affa0c..99474f160b86 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -214,7 +214,7 @@ static u32 intel_cpuid_vfm(void)
 
 u32 intel_get_platform_id(void)
 {
-	unsigned int val[2];
+	u64 val;
 
 	if (x86_hypervisor_present)
 		return 0;
@@ -229,9 +229,9 @@ u32 intel_get_platform_id(void)
 		return 0;
 
 	/* get processor flags from MSR 0x17 */
-	native_rdmsr(MSR_IA32_PLATFORM_ID, val[0], val[1]);
+	val = native_rdmsrq(MSR_IA32_PLATFORM_ID);
 
-	return (val[1] >> 18) & 7;
+	return (val >> 50) & 7;
 }
 
 static void early_init_intel(struct cpuinfo_x86 *c)
diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index 6cdc410e7547..f6dc79dd18dd 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -315,7 +315,7 @@ static union cpuid_1_eax ucode_rev_to_cpuid(unsigned int val)
 
 static u32 get_patch_level(void)
 {
-	u32 rev, dummy __always_unused;
+	u32 rev;
 
 	if (IS_ENABLED(CONFIG_MICROCODE_DBG) && x86_hypervisor_present) {
 		int cpu = smp_processor_id();
@@ -332,7 +332,7 @@ static u32 get_patch_level(void)
 		return microcode_rev[cpu];
 	}
 
-	native_rdmsr(MSR_AMD64_PATCH_LEVEL, rev, dummy);
+	rev = native_rdmsrq(MSR_AMD64_PATCH_LEVEL);
 	if (!rev) {
 		if (x86_family(bsp_cpuid_1_eax) < 0x17)
 			return rev;
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index 0dd0c7241c57..ea696a202c31 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -94,13 +94,13 @@ struct early_load_data early_data;
  */
 static bool amd_check_current_patch_level(void)
 {
-	u32 lvl, dummy, i;
+	u32 lvl, i;
 	u32 *levels;
 
 	if (x86_cpuid_vendor() != X86_VENDOR_AMD)
 		return false;
 
-	native_rdmsr(MSR_AMD64_PATCH_LEVEL, lvl, dummy);
+	lvl = native_rdmsrq(MSR_AMD64_PATCH_LEVEL);
 
 	levels = final_levels;
 
-- 
2.55.0

