Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742AF46D552
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428258; cv=none; b=kS3M46WcWoGdrt5Gu52utp5WDsD++K77z3NvdxWoV9FKa593O/uLFEf2HA4iOvcnR3HDf96AukBtsl7MV1nRokx+eG8mY+/DZcGfMLIsKlTzHjia7rScxbUXiFB0+5ij9oTgId+NuzOlaVh1NmFw9ep7gZsiVsJYGyLwB2/pIrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428258; c=relaxed/simple;
	bh=Ve1UukKaTRMTWk1OzSrqOkIWqW7aQLynB/FBoCo/y+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YqNHxF7zmF+iO759HzMZnNioMogUvYArw/blfR9AH2OYbcFJg0edZT5kgdFSoWV9LvcSPfgLoiTpHDwv3a5fbtwEKI0DMN+OzdnLKCpbrTliTCURCGrIYbvbE90sdD28/u2hS2LOynOzQ4+t3ZXs/G/TkEo2mzN8t3qfayerMzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XGRR4/S3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XGRR4/S3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BBBD1F000E9;
	Thu,  3 Sep 2026 09:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788428257;
	bh=gT8qheyLCfNNv7qBQIGJfyOX1nEvEoKdEqVcT/s71ME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XGRR4/S3KFLoU34suH+YOkAWgPinBK+2ApyFvxZKP2kf2qBtXvpfgCrmNtkr3lvwi
	 EKOfmEXdU8vleLQG4df18zdoOf3O8SiIy/Gc1lJiQF1yeUByyNLt4up8GWPH8l+NLU
	 BrwPSAGuTe197eTaDzG328ZlB0lZVetViZ5QGl9ThM83vHyYPuq9OmVVg7wzuUUSi6
	 GEIOHxHVVxLSVtUBnOGPo4cwp4ULoFb+wXJAt51/Qfuff6h0orjpohN7jS5Oie5exm
	 w4ZkilLqgs2h3eFd8/XaBnQDs2wPMpVgsYDozldUARSpzLaZtKrD59V0SAMiRJr8AS
	 bQ+yyNyn3IcLQ==
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
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH RESEND v4 3/3] x86/apic: Drop APIC_EILVT_NR_MAX
Date: Thu,  3 Sep 2026 14:58:41 +0530
Message-ID: <406d5c26819c0feb03cd9a3f42b592dd37ade05d.1788425679.git.naveen@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788425679.git.naveen@kernel.org>
References: <cover.1788425679.git.naveen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to using apic->eilvt_regs_count as the maximum EILVT register
count. Since this value is no longer a compile-time constant, update
eilvt_offsets to be dynamically allocated.

Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
Tested-by: Manali Shukla <manali.shukla@amd.com>
---
 arch/x86/include/asm/apicdef.h | 1 -
 arch/x86/kernel/apic/apic.c    | 7 +++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/apicdef.h b/arch/x86/include/asm/apicdef.h
index ba7657e75ad1..32a242ae0455 100644
--- a/arch/x86/include/asm/apicdef.h
+++ b/arch/x86/include/asm/apicdef.h
@@ -140,7 +140,6 @@
 #define APIC_IER	0x480
 #define APIC_EILVTn(n)	(0x500 + 0x10 * n)
 #define		APIC_EILVT_NR_AMD_10H	4
-#define		APIC_EILVT_NR_MAX	APIC_EILVT_NR_AMD_10H
 
 #define APIC_BASE (fix_to_virt(FIX_APIC_BASE))
 #define APIC_BASE_MSR		0x800
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index c990f403ec7f..dd734c58b780 100644
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
@@ -417,6 +417,9 @@ static __init void init_eilvt(void)
 
 	if (!apic->eilvt_regs_count && boot_cpu_data.x86_vendor == X86_VENDOR_AMD)
 		apic->eilvt_regs_count = APIC_EILVT_NR_AMD_10H;
+
+	if (apic->eilvt_regs_count)
+		eilvt_offsets = kzalloc_objs(atomic_t, apic->eilvt_regs_count);
 }
 
 /*
-- 
2.55.0

