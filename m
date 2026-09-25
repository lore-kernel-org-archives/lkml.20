Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174634D9F72
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353660; cv=none; b=Cup1dZm8ugouIpjANs3sDArtjeOWyRGo+QOI294Vrz5FkPEZ3UP2NvMFQe9FojO6SlLX719ThOIU8t1IydUVwXUU4Gi6XnKgxXdKK65H9ZJODmj4SU8eAMIgNdgj7C/mYzOoB8rtv+voM1TjnVqjcWGzDL51h4VRWdhnNHbZG4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353660; c=relaxed/simple;
	bh=CIH6x3pG9pcHkmtrIukjSRkaBfqhBr5KDiQUcPCOad8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gplXBOYxSqy7TcEHN2e4PB1Akku0krV+z9uvdECZbEX+TSyZeNJssfKASIRkOSfUaGsYNTEqA3rGPHz8qMKq2POYljPlm7e7u56N9sIDCTfuQ3m6AHxTYAc/BWmPAMbf4nUpWqrWUutaCgjbUr79cIa7f510hpJTZBKoTIyp+Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JeZFXN8I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JeZFXN8I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A981F000FF;
	Fri, 25 Sep 2026 16:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790353658;
	bh=4yCblUehuTFZyURu+8slT87aj0SRzqHNHoXe7qggIys=;
	h=From:To:Cc:Subject:Date;
	b=JeZFXN8IzkaX86PLOWOPqDmiNkNX49CZupRV/BJQuQUVdSqGM2MFOCByCeTWh1ZnQ
	 kWLn3p8Cn4zA/7ju7564mf5ENS+F9Ha/ydodDoBz75RJ33A+K6UdXeObDySghsGXBW
	 Q1orHpmELgNtOYamoh+yRwTXwuAbBJx/yXyg272OoKXV1oi2o6qez1XPm6FfhFCY79
	 hY1etjg+MN/xvvvTyQhsvQku9fn+zRZnmQ+qu6crSnqeRdb7uQLaPx7CXtn68qTvLA
	 +XSzYNt1hu+6dQ+CxEjBAfZ1d5zZcJylt1BGTfKX4Ty+hFVwloXULeTrA031ALxD6M
	 7oXv9lq/WWCRA==
From: "Naveen N Rao (AMD)" <naveen@kernel.org>
To: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Bharata B Rao <bharata@amd.com>,
	Manali Shukla <manali.shukla@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Robert Richter <rrichter@amd.com>,
	Christian Ludloff <ludloff@gmail.com>
Subject: [PATCH v5] x86/apic: Use EILVT register count from APIC_EFEAT
Date: Fri, 25 Sep 2026 21:47:06 +0530
Message-ID: <20260925161706.1619042-1-naveen@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Future AMD processors will be increasing the number of EILVT registers.
Rather than hardcoding the maximum EILVT register count and using that
everywhere, introduce a variable in 'struct apic' to track the EILVT
register count.

The number of EILVT registers is exposed through the extended APIC
Feature Register (APIC_EFEAT) bits 23:16 on platforms that support the
AMD Extended APIC Register space (X86_FEATURE_EXTAPIC).  Use this to
initialize the count and fall back to the current default from AMD
family 0x10 (APIC_EILVT_NR_AMD_10H, which is 4) otherwise. Since this
value is no longer a compile-time constant, update eilvt_offsets to be
dynamically allocated.

Drop the now-redundant APIC_EILVT_NR_MAX macro. Other than during EILVT
register offset allocation (which now uses apic->eilvt_regs_count), that
macro was being used in the IBS driver for determining the EILVT offset
for AMD family 0x10 since the EILVT offsets were not assigned by the
BIOS. Switch that to use APIC_EILVT_NR_AMD_10H, which reflects the
correct EILVT register count for that family.

Note: because the EILVT register count is now derived from APIC_EFEAT,
it is possible that the register count is less than 4 (1 or 0 even) on
some AMD K8 parts (rather than the previous default of 4), which should
more accurately reflect the correct EILVT register count on those parts.


Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
Tested-by: Manali Shukla <manali.shukla@amd.com>
Tested-by: Bharata B Rao <bharata@amd.com>
---
Changes since v4 (*):
- Squash into a single patch (Boris)
- Use the value from APIC_EFEAT rather than forcing the previous default 
  if the EILVT register count in APCI_EFEAT is zero (Boris)
- Pick up Bharata's Tested-by, and retain Manali's tag since the change 
  is minimal


- Naveen

(*) http://lore.kernel.org/r/cover.1788425679.git.naveen@kernel.org


 arch/x86/include/asm/apic.h    |  2 ++
 arch/x86/include/asm/apicdef.h |  2 +-
 arch/x86/events/amd/ibs.c      |  4 ++--
 arch/x86/kernel/apic/apic.c    | 16 ++++++++++++++--
 4 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index 9cd493d467d4..578cc28b3134 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -317,6 +317,8 @@ struct apic {
 
 	void	(*update_vector)(unsigned int cpu, unsigned int vector, bool set);
 
+	u32	eilvt_regs_count;
+
 	char	*name;
 };
 
diff --git a/arch/x86/include/asm/apicdef.h b/arch/x86/include/asm/apicdef.h
index bc125c4429dc..32a242ae0455 100644
--- a/arch/x86/include/asm/apicdef.h
+++ b/arch/x86/include/asm/apicdef.h
@@ -134,12 +134,12 @@
 #define		APIC_TDR_DIV_64		0x9
 #define		APIC_TDR_DIV_128	0xA
 #define	APIC_EFEAT	0x400
+#define		APIC_EFEAT_XLC(x)	(((x) >> 16) & 0xff)
 #define	APIC_ECTRL	0x410
 #define APIC_SEOI	0x420
 #define APIC_IER	0x480
 #define APIC_EILVTn(n)	(0x500 + 0x10 * n)
 #define		APIC_EILVT_NR_AMD_10H	4
-#define		APIC_EILVT_NR_MAX	APIC_EILVT_NR_AMD_10H
 
 #define APIC_BASE (fix_to_virt(FIX_APIC_BASE))
 #define APIC_BASE_MSR		0x800
diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
index 3531f9c23b8c..555912ac520f 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -1839,13 +1839,13 @@ static void force_ibs_eilvt_setup(void)
 
 	preempt_disable();
 	/* find the next free available EILVT entry, skip offset 0 */
-	for (offset = 1; offset < APIC_EILVT_NR_MAX; offset++) {
+	for (offset = 1; offset < APIC_EILVT_NR_AMD_10H; offset++) {
 		if (get_eilvt(offset))
 			break;
 	}
 	preempt_enable();
 
-	if (offset == APIC_EILVT_NR_MAX) {
+	if (offset == APIC_EILVT_NR_AMD_10H) {
 		pr_debug("No EILVT entry available\n");
 		return;
 	}
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 90025451ace2..434e118b71c8 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -341,7 +341,7 @@ static void __setup_APIC_LVTT(unsigned int clocks, int oneshot, int irqen)
  * necessarily a BIOS bug.
  */
 
-static atomic_t eilvt_offsets[APIC_EILVT_NR_MAX];
+static atomic_t *eilvt_offsets;
 
 static inline int eilvt_entry_is_changeable(unsigned int old, unsigned int new)
 {
@@ -354,7 +354,7 @@ static unsigned int reserve_eilvt_offset(int offset, unsigned int new)
 {
 	unsigned int rsvd, vector;
 
-	if (offset >= APIC_EILVT_NR_MAX)
+	if (!eilvt_offsets || offset >= apic->eilvt_regs_count)
 		return ~0;
 
 	rsvd = atomic_read(&eilvt_offsets[offset]);
@@ -410,6 +410,17 @@ int setup_APIC_eilvt(u8 offset, u8 vector, u8 msg_type, u8 mask)
 }
 EXPORT_SYMBOL_GPL(setup_APIC_eilvt);
 
+static __init void init_eilvt(void)
+{
+	if (cpu_feature_enabled(X86_FEATURE_EXTAPIC))
+		apic->eilvt_regs_count = APIC_EFEAT_XLC(apic_read(APIC_EFEAT));
+	else if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD)
+		apic->eilvt_regs_count = APIC_EILVT_NR_AMD_10H;
+
+	if (apic->eilvt_regs_count)
+		eilvt_offsets = kzalloc_objs(atomic_t, apic->eilvt_regs_count);
+}
+
 /*
  * Program the next event, relative to now
  */
@@ -2345,6 +2356,7 @@ static void __init apic_bsp_setup(bool upmode)
 	if (upmode)
 		apic_bsp_up_setup();
 	setup_local_APIC();
+	init_eilvt();
 
 	enable_IO_APIC();
 	end_local_APIC_setup();

base-commit: 630761837841036e97af4af09a77fda2e6a28347
-- 
2.55.0

