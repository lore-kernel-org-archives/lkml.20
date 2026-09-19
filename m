Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106B059B56;
	Sat, 19 Sep 2026 00:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789776723; cv=none; b=HQMX7EljcNPOZkp2YD4254aNUkdstsWJmBDtThOS0Te74iM6ATOrKlJPdQxTiV4v6XRG5HOyWXey8AhSlQ35EIhjNKng4OW/qBskefr3nqx8W6ekcHQJo28vPGVgQbajQoG3TV/oYQfhW7lBLqb/nwJmAwdefiy0G2zm/iv0S/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789776723; c=relaxed/simple;
	bh=x7FmC6+28JtQ58orCzmBLtb0XQNdPt5YyyEa04uayVE=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ci4thOXCKpEV7IZrYEL4TLEwwxwX+E7GOq0EOI/kNJVxR1teik02orq9wfNa7N8zW50DwQ2vwgSIjiVCZGlCBBpPbyJi4UCJbrxG/iavedpw0c2t1iq8MTlRAmdjIhwlsWBRxWgNRocedz07jrQzzgvttx27TrM9wr0xVjWrwvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dR9qUXG1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IxdNyEJn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dR9qUXG1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IxdNyEJn"
Date: Sat, 19 Sep 2026 00:11:58 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789776720;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0mf7II5ZtlZjNmKADmRO33MJ4j/lC0fhHLO1Fzlgpw8=;
	b=dR9qUXG1Ai5G/kgMMr1N5nYcU1/9DG142LOmMcQxwamNkqYTuPYO1E/aY7str3aYI3BxQz
	xR3XiOi6V2Dj/CcjCnyLqUHXq/IfNSKeXvUQzN5OPzJCKfa9QX+Cl5TS2/TaM6Z01C706D
	V7AVTJyxn8V7Yx0E4PtCN94k3L0hXs3FLCI/g7YZHUC6R/AMcmk14KJJ9Q2HGBh4BquaAc
	5X4dL1dyQhh0o2UqgaayZZPslLxK0n15jcruHOYxR3ha47q1vmCwqIJZX4Om8WDrqg0Gux
	GWvKNvSSN2gLhim+HTAk9t791UN4+xVZIJbeFp240CNgZl6CxUxe7BTBnHpScg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789776720;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0mf7II5ZtlZjNmKADmRO33MJ4j/lC0fhHLO1Fzlgpw8=;
	b=IxdNyEJnl7UAEPLbbJryo7PIuZKcbFMvyx44VYz+RPUaELATqF1UbiloLTQOdOwcD1BfFu
	aNj1EkO571EebYAw==
From: "tip-bot2 for Ashish Kalra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/sev] x86/cpufeatures: Add X86_FEATURE_RMPOPT feature flag
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>,
 Ashish Kalra <ashish.kalra@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Ackerley Tng <ackerleytng@google.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3C39e9ee269a572c516a3f4e937bfe12d00697d5e6=2E1782841?=
 =?utf-8?q?284=2Egit=2Eashish=2Ekalra=40amd=2Ecom=3E?=
References: =?utf-8?q?=3C39e9ee269a572c516a3f4e937bfe12d00697d5e6=2E17828412?=
 =?utf-8?q?84=2Egit=2Eashish=2Ekalra=40amd=2Ecom=3E?=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178977671859.1720534.6123134899269063933.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/sev branch of tip:

Commit-ID:     1ee97d0f7b20e1f71bdb9edf5950c8751538180a
Gitweb:        https://git.kernel.org/tip/1ee97d0f7b20e1f71bdb9edf5950c875153=
8180a
Author:        Ashish Kalra <ashish.kalra@amd.com>
AuthorDate:    Mon, 10 Aug 2026 19:21:17=20
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Fri, 18 Sep 2026 15:50:58 -07:00

x86/cpufeatures: Add X86_FEATURE_RMPOPT feature flag

Add a flag indicating whether RMPOPT instruction is supported.

RMPOPT is a new instruction that reduces the performance overhead of RMP
checks for the hypervisor and non-SNP guests by allowing those checks to be
skipped when 1-GB memory regions are known to contain no SEV-SNP guest memory.

For more information on the RMPOPT instruction, see the AMD64 RMPOPT
technical documentation.

  [ bp: Zap respective tools/ change. ]

Suggested-by: Borislav Petkov (AMD) <bp@alien8.de>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Link: https://patch.msgid.link/39e9ee269a572c516a3f4e937bfe12d00697d5e6.17828=
41284.git.ashish.kalra@amd.com
---
 arch/x86/include/asm/cpufeatures.h | 2 +-
 arch/x86/kernel/cpu/scattered.c    | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufea=
tures.h
index f70ee74..3b5b32d 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -76,7 +76,7 @@
 #define X86_FEATURE_K8			( 3*32+ 4) /* Opteron, Athlon64 */
 #define X86_FEATURE_ZEN5		( 3*32+ 5) /* CPU based on Zen5 microarchitecture =
*/
 #define X86_FEATURE_ZEN6		( 3*32+ 6) /* CPU based on Zen6 microarchitecture =
*/
-/* Free                                 ( 3*32+ 7) */
+#define X86_FEATURE_RMPOPT		( 3*32+ 7) /* Support for AMD RMPOPT instruction=
 */
 #define X86_FEATURE_CONSTANT_TSC	( 3*32+ 8) /* "constant_tsc" TSC ticks at a=
 constant rate */
 /* free: was #define X86_FEATURE_UP	( 3*32+ 9) * "up" SMP kernel running on =
UP */
 #define X86_FEATURE_ART			( 3*32+10) /* "art" Always running timer (ART) */
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index 8665a64..d1795ce 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -67,6 +67,7 @@ static const struct cpuid_bit cpuid_bits[] =3D {
 	{ X86_FEATURE_PERFMON_V2,		CPUID_EAX,  0, 0x80000022, 0 },
 	{ X86_FEATURE_AMD_LBR_V2,		CPUID_EAX,  1, 0x80000022, 0 },
 	{ X86_FEATURE_AMD_LBR_PMC_FREEZE,	CPUID_EAX,  2, 0x80000022, 0 },
+	{ X86_FEATURE_RMPOPT,			CPUID_EDX,  0, 0x80000025, 0 },
 	{ X86_FEATURE_AMD_HTR_CORES,		CPUID_EAX, 30, 0x80000026, 0 },
 	{ 0, 0, 0, 0, 0 }
 };
