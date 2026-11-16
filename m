Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845002;
	b=5TtboQF82gtRD6sdxiA6kUgboojQYRgt64GN13yOBgRMGci51c+yiSO7YEQ8wC50OEiY
	 sH2FwqoEOVW2JggZZMNeoxA5QNwUs20whqDPWIeMRaik7ii7duhcUPqpH0NrmobSSAzA0
	 Pgzc4nb/VkWq6fNrAhnn/dGDh/t4sdgD4xLZEZR5RYYuNB4L5d9kcGZaJKc1ldv+6SDYN
	 c4av53JzwcT43TkIe7jA+wQqpT3qx22l4F5mM3yFoLC3i4VvWhKvY03zPAWe5ZOWo0CND
	 77s7rR/fePGW6/2bJJpHsnEZv2XydfqbxgkHfpis+I36dbxh1tw6Bw3Qf3+uP8hKw/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845002;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Server:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id:X-Rspamd-Pre-Result:X-Rspamd-Action;
	bh=HSoTJR0escZOmXQpgBHoen0JojHZeXrEQphMnwyZLSc=;
	b=bZUayKpLXjpDb8XzGRIZeysIORW0oeUuwkl1uBugx0PqtmKTXJOrtu+jBxEwFltOShtW
	 aP6YNsYg/DfHR8UeDqaNMbR+u/2Szgg9AwsgZhZwDWY1VrMSmnk4iGhXqC10KJ5hH19XD
	 ASr6ArRo9gWiwF9LYAOZjhlw3WBfpZUkmqGU0Ge+xVvI4UG939GfaKlwSFCWYet4X85d2
	 EVncbJ21Pm47wmFWlR5fZUGGxD6taIVn4YPOQoGCNC2HuR8JurVj75oo3cHw3Hfkwn82T
	 UFr/wQglAv/cH2CbMZxglqm1YeooM+OCjb/N020L1gQayNStwLbnLfxcLfghmbt1a1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2112F606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2112F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7413E1FD53;
	Mon, 16 Nov 2026 16:03:20 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 160401334C;
	Mon, 16 Nov 2026 16:03:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id laieN0cp+2pxUwAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 16 Nov 2026 16:03:20 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v4 3/5] x86/msr: Switch users of native_rdmsr() to native_rdmsrq()
Date: Mon, 16 Nov 2026 17:02:57 +0100
Message-ID: <20261116160259.1579333-4-jgross@suse.com>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Queue-Id: 7413E1FD53
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action

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

