Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023903;
	b=AdQ6vBE5HQk2Wnvo7G4mRXIBLeruck5NPaJiz0lykJ3O+LPh9ih/ylmkGZTT/sZFvfF1
	 pc0pG8m8RRvuzooEkAS41Uk940gQAGk+4yyl0GwaFTwtdHpiwNNZr4xHqJ1tF+wAP7d3t
	 4AigYkNEtcjNiU1uf3pjPcF/+ZSgBa0ecGt1F3ALPM9cVxaW0aqW4wCzuM8Tta5xRggDh
	 T97Y9/h+w5CP6mdsLtz1triq+83nPuKJ3d3ZsQz+8rUNLbcyEM+Ezj2wY6ZpyZKZGVSCV
	 /cZNwMxXQ03/V4BHk/Mc4oEdx0AC039sZNYT7u0Zu0h7pzBv8SZXCD8UnfN2XHTtRFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023903;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=HSoTJR0escZOmXQpgBHoen0JojHZeXrEQphMnwyZLSc=;
	b=m4DdIeVL5fgQuyoCXXBbkQbauu739GyFdYZw2y9YIwMdf5g6U7py0v7fUjhkoEKc7Ttp
	 j34UHElfxYaM8M35X3De/CbrVFswgeCt5CMHFmyGEM++wd1fIy7LOUmsecmolKKiKXEjA
	 rXArJl0P1+LMHBzDjVJvc6yJKbEXf0Ib7OJhWAnQqk5NJLN0YmBwSByklDdB8Q6d74b3s
	 Cj9DwkGo6p4mSZ95J8SlK8SFFc4LhdN0/apFIlC8eaa81ewlc8TAHUnBz/RE28BtuB5bo
	 rR4gwyQqTYvavkwqDIdXI6mFtj5BX7uWm/sGLM3F2yueuFSH9k7/EktVFmqkmRffuEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=S27c5n2t;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=S27c5n2t;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AD5606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6AD5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=S27c5n2t;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=S27c5n2t
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0DD6321F7B;
	Mon, 26 Oct 2026 14:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1793023901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HSoTJR0escZOmXQpgBHoen0JojHZeXrEQphMnwyZLSc=;
	b=S27c5n2t1OSZX9gePiq6uCYx97IDywSC4dar6BItps2F8qkWNU/xfyjhtJSQhf4XsEQGuA
	Ezem1P6f1kyybauZ5Q1L7AZCPlvWxpMGF4jAhX6k27zYCaIP7D87WBRPr7oyvT/c1vtbdF
	nEG66O66j96tzKZdxxkaM/ltYZz2iKQ=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1793023901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HSoTJR0escZOmXQpgBHoen0JojHZeXrEQphMnwyZLSc=;
	b=S27c5n2t1OSZX9gePiq6uCYx97IDywSC4dar6BItps2F8qkWNU/xfyjhtJSQhf4XsEQGuA
	Ezem1P6f1kyybauZ5Q1L7AZCPlvWxpMGF4jAhX6k27zYCaIP7D87WBRPr7oyvT/c1vtbdF
	nEG66O66j96tzKZdxxkaM/ltYZz2iKQ=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A48A713319;
	Mon, 26 Oct 2026 14:11:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eUb9Hpxf32pdJQAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 26 Oct 2026 14:11:40 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 3/5] x86/msr: Switch users of native_rdmsr() to native_rdmsrq()
Date: Mon, 26 Oct 2026 15:11:18 +0100
Message-ID: <20261026141120.780172-4-jgross@suse.com>
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
X-Spamd-Result: default: False [-15.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -15.80
X-Spam-Level: 
X-Spam-Flag: NO

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
2.56.0

