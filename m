Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABAA3FC5D1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428254; cv=none; b=pDDSiJeTZ1JVh+gmXTwJ/0VAu1pPJ16ydt0fFwGBAoMFbLIsSl21CVWL55RP9BWguqsZQsVzM75wq8/lEJJjhCrLiUaYTDHb0PGvXhWDDGt/8WwEdC2j4DatBd+JxlykDBllR4AQkWz42u9cZ/cIcH2T+vOVlGYDzyUAjQpHjvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428254; c=relaxed/simple;
	bh=jfM3ScicYPP0SrV21xKeYSEymaHuVJRmoihPjdjNXqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R1q0vfwMoKkZX6btOy12ge/KItp8PUFekUL8MVA/b8eBa1A0K2e6/pKd31UPfpvzYPly0HEVsja4OQREJoLy4Z7EV4vSJLIDrX+12f1A8xp6S0iL8F4yFjfOGjr0qKWg7a65bcZOhKZZRK/6qX/gYY+8DEE9u7tfKudYDs/n6Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Au/HX0VZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Au/HX0VZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C89A1F000E9;
	Thu,  3 Sep 2026 09:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788428252;
	bh=EJlpAjjukovaP33sFaRz4P/8jdBPh9hnKwFIkSpiK/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Au/HX0VZBaSItRIBE2PHX+uRg+uCD8rY9GczqtQnA4N9HlfTOYz6klgl6c2WNqRNl
	 rVgOSCW1Z/aGKzvxyzp/YS9WXovAZm7SK50sArSYSEyO6OYKd/f7g+hufUeu6GQfgz
	 JZULlLYVqJfbLmupvKaYzk1kVfal4PQ8IM/2ybOt3EZM/bFsqzQVtdDCLYgb5Ci+jG
	 /aLpZbbHTCPguirqvhFeqKxAsA4Pips6l+8m/glH9F0kkxYqKKw2iUko2aa7gS5W/2
	 w5Cy60PzOT38d0iEjDhNAiJJu2xeXjf6s+/9tfN3XZ+gmO9b7yhU9vhv6M6517YPBH
	 n+lpJiBjlRdag==
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
Subject: [PATCH RESEND v4 2/3] x86/apic: Introduce a variable to track the number of EILVT registers
Date: Thu,  3 Sep 2026 14:58:40 +0530
Message-ID: <99275fc7531b5c8708e2be8459251c9169b0ce63.1788425679.git.naveen@kernel.org>
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

Future AMD processors will be increasing the number of EILVT registers.
Rather than hardcoding the maximum EILVT register count and using that
everywhere, introduce a variable in 'struct apic' to track the EILVT
register count.

The number of EILVT registers is exposed through the extended APIC
Feature Register (APIC_EFEAT) bits 23:16. Use this to initialize the
count and fall back to the current default (APIC_EILVT_NR_AMD_10H) if
the count is not available.

Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
Tested-by: Manali Shukla <manali.shukla@amd.com>
---
 arch/x86/include/asm/apic.h    |  2 ++
 arch/x86/include/asm/apicdef.h |  1 +
 arch/x86/kernel/apic/apic.c    | 10 ++++++++++
 3 files changed, 13 insertions(+)

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
index bc125c4429dc..ba7657e75ad1 100644
--- a/arch/x86/include/asm/apicdef.h
+++ b/arch/x86/include/asm/apicdef.h
@@ -134,6 +134,7 @@
 #define		APIC_TDR_DIV_64		0x9
 #define		APIC_TDR_DIV_128	0xA
 #define	APIC_EFEAT	0x400
+#define		APIC_EFEAT_XLC(x)	(((x) >> 16) & 0xff)
 #define	APIC_ECTRL	0x410
 #define APIC_SEOI	0x420
 #define APIC_IER	0x480
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 90025451ace2..c990f403ec7f 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -410,6 +410,15 @@ int setup_APIC_eilvt(u8 offset, u8 vector, u8 msg_type, u8 mask)
 }
 EXPORT_SYMBOL_GPL(setup_APIC_eilvt);
 
+static __init void init_eilvt(void)
+{
+	if (cpu_feature_enabled(X86_FEATURE_EXTAPIC))
+		apic->eilvt_regs_count = APIC_EFEAT_XLC(apic_read(APIC_EFEAT));
+
+	if (!apic->eilvt_regs_count && boot_cpu_data.x86_vendor == X86_VENDOR_AMD)
+		apic->eilvt_regs_count = APIC_EILVT_NR_AMD_10H;
+}
+
 /*
  * Program the next event, relative to now
  */
@@ -2345,6 +2354,7 @@ static void __init apic_bsp_setup(bool upmode)
 	if (upmode)
 		apic_bsp_up_setup();
 	setup_local_APIC();
+	init_eilvt();
 
 	enable_IO_APIC();
 	end_local_APIC_setup();
-- 
2.55.0

