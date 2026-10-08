Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA6740F753
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451207; cv=none; b=tyK4qpxqqSn/+3bWsSIsHKfu2a5w1nnVfagugsw7WOQOSV3TooRUSiK8IsSi1bIUbfkz8S/NFHTnFt6NRYpsGeIl3Vmmr/6TrkTqXU/aW0ljXIvS2Zh1stGHbHBd4x+oreQ7dZUTuUW0jYPU9q47FPfGWahnRi9Zv7eZp51BYLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451207; c=relaxed/simple;
	bh=+eihVRxaxW+9GQU7Cue0gZtkeGMjI018ChmYhZZexkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jh5ZHs9sCT/4mdo++eoJdqP2HShKHYSu1U50x3SCO0Pe7wU7d4jI/l5of32eG1MyD4ChzFd+zQA9g17wN/no8vOZxCyG/ja5jQHtKphiaaQKL+DoT8ZIKUYvMCk/cF25QSuz8ePMDd4aguRXoy1gCJ7jJmwvaUZ9EVhfbU+GZ0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nR/MavKn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nR/MavKn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753B91F000FF;
	Thu,  8 Oct 2026 09:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791451195;
	bh=vEs/oPb9wuYNpwlsGrDJDJYpXvx1kETjreyaxzMbMv0=;
	h=From:To:Cc:Subject:Date;
	b=nR/MavKn0fvliWt9V0dBNqUCVAcu5m6awfiwnNL78QVUWj3pUqh9t20Dpwp8CyeCn
	 gG74MR7TL6VFTk0IcAEOIkssEiFsn2zb6clIiFgFWvqbCx61DABfprO+2UX8lY2v5U
	 TGvDC1aKP21SAvRn9z6e/HsJ9Xa1JvcrZLG/03CJfRXhlDrygFu8CsQPTMkcU6njFw
	 lmaBq6aQfSI7acG5iCwYJ/GBX/E83978NxmKxAVazV9g60klIk9jXkSSxNXx2f5r32
	 YGYvxqweTnry42k7RLX2aujjK0HNIx7ayDsHOKCT+DqxmMmaHtMxnFQ+wRJEeFTsIV
	 QKlsDv3K9xxWA==
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
Subject: [PATCH v6] x86/apic: Use EILVT register count from APIC_EFEAT
Date: Thu,  8 Oct 2026 14:48:50 +0530
Message-ID: <20261008091850.1453093-1-naveen@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Future AMD processors will increase the number of EILVT registers. Track
the EILVT register max count in a variable. Use the current default of 4
EILVT max count from F10h times as the fallback.

Use the APIC_EILVT_NR_AMD_10H macro only in force_ibs_eilvt_setup()
which is F10 specific anyway.

Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
---
Since v5 (http://lore.kernel.org/r/20260925161706.1619042-1-naveen@kernel.org):
- Simplify commit log (Boris)
- Drop Tested-by tags (Boris)

- Naveen


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

base-commit: 48437a9ff10dc31e479822d5efbf637690a215e9
-- 
2.55.0

