Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45264329391;
	Wed,  2 Sep 2026 02:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788315228; cv=none; b=ITr3wHsRc4Em970+j0arv+LMcDLVg9tm9hKW6EZyt1Hr3o0HxdDlREtpFmjSk3bo2ybBr8BP+kzE+meBhDuCb2dF0yPUeOEZ7AkL4dc4AWtoqqIFMruCzdWJsl/K1HCiPoQOE1G8XxWmLR2jFJYLnvRy1rGtRdOa+Ddps3f6h5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788315228; c=relaxed/simple;
	bh=uJ6FB8g3PqWmYRAL4kVTzUPUOKXq4N44y6xFzPphJpo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=E9FqqHPTUTbPyJSJN7+/vD3AsDtuZICzvUkoWpat56+iHBlAugEP2AN4mmYjnfwGyqPs0idRNy3yq0P7CwkB5a7LdLTwUaZnHuIXsMwBk8anZCAXDE3hl28z6Wfc/d5MfToOMsdaWpSpvLIijdgTkwBqzPnsrb0s3EGPvDu6cEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nqYx+mnU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qIHeyvD5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nqYx+mnU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qIHeyvD5"
Date: Wed, 02 Sep 2026 02:13:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788315222;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PPlz3wkrMj0aGm8Z97nIskvBT75cOM/WJ4CIJxKXmQ4=;
	b=nqYx+mnUzEcqcgbE6IiqxnEYCUaHQ/RLxhc7lx5aBzLsPPaks56t7ODXFtOckc0nr4IpYd
	5sECbOjiheM+uOBZ8GZ831tsckLrEQQ1hVsgw/5pdsruXP3xBqxmvJhHKZhCdlTrwF8llL
	WjtMLvq85yM4HVNo+gZPanQPZ+s34Rn/4oIWj6YTpI1p8HF29RfFjbJovcTvKFdEse1hGC
	WBZEf+TvO63BxJUos87MzMmUmZkXiJLgDhTjkKUyFwLG7VaNzgGLC4O4DPMPurC8fR+O7h
	mti5OoVw2tFmjsE2YDBENCF0rvVUE0/bSEqUwH3OLJF6GqCy35TOo2iXr1pb0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788315222;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PPlz3wkrMj0aGm8Z97nIskvBT75cOM/WJ4CIJxKXmQ4=;
	b=qIHeyvD5x3doF5JrB585hr7NTozDpPu2r85gspZE/ls+mX8arAJZdzz8YRW1aZ6DaF867y
	GEXkdKD43Go1HdDA==
From: "tip-bot2 for Borislav Petkov (AMD)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/bugs] x86/bugs: Adapt SRSO mitigation to Zen6
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260822013231.1109255-1-bp@kernel.org>
References: <20260822013231.1109255-1-bp@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178831522018.3717435.4614880863111399202.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/bugs branch of tip:

Commit-ID:     ae1d2082d93bc04604dc08e9b7f9cdba5e0c28e6
Gitweb:        https://git.kernel.org/tip/ae1d2082d93bc04604dc08e9b7f9cdba5e0=
c28e6
Author:        Borislav Petkov (AMD) <bp@alien8.de>
AuthorDate:    Fri, 21 Aug 2026 18:32:31 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Tue, 01 Sep 2026 18:45:46 -07:00

x86/bugs: Adapt SRSO mitigation to Zen6

Zen6 has BTB protection which isolates the different contexts
(user/kernel, guest/host) from one another. This makes the SafeRET
mitigation there unnecessary leaving the user/user and guest/guest
attack vectors open, whose protection is handled by the Spectre v2
mitigation setting to do IBPB on a context switch.

Detect that setting and report it with a new mitigation string.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/20260822013231.1109255-1-bp@kernel.org
---
 arch/x86/include/asm/cpufeatures.h |  1 +
 arch/x86/kernel/cpu/bugs.c         | 18 ++++++++++++++++--
 arch/x86/kernel/cpu/scattered.c    |  1 +
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufea=
tures.h
index f70ee74..ee7066c 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -430,6 +430,7 @@
 #define X86_FEATURE_SUCCOR		(17*32+ 1) /* "succor" Uncorrectable error conta=
inment and recovery */
 #define X86_FEATURE_CPPC_PERF_PRIO	(17*32+ 2) /* CPPC Floor Perf support */
 #define X86_FEATURE_SMCA		(17*32+ 3) /* "smca" Scalable MCA */
+#define X86_FEATURE_BTB_CTX_ISOLATION	(17*32+ 4) /* AMD: Branch predictions =
contexts isolated */
=20
 /* Intel-defined CPU features, CPUID level 0x00000007:0 (EDX), word 18 */
 #define X86_FEATURE_AVX512_4VNNIW	(18*32+ 2) /* "avx512_4vnniw" AVX-512 Neur=
al Network Instructions */
diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 56eac56..1b2381d 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1175,6 +1175,7 @@ enum srso_mitigation {
 	SRSO_MITIGATION_IBPB,
 	SRSO_MITIGATION_IBPB_ON_VMEXIT,
 	SRSO_MITIGATION_BP_SPEC_REDUCE,
+	SRSO_MITIGATION_USER_IBPB,
 };
=20
 static enum srso_mitigation srso_mitigation __ro_after_init =3D SRSO_MITIGAT=
ION_AUTO;
@@ -2908,7 +2909,8 @@ static const char * const srso_strings[] =3D {
 	[SRSO_MITIGATION_SAFE_RET]		=3D "Mitigation: Safe RET",
 	[SRSO_MITIGATION_IBPB]			=3D "Mitigation: IBPB",
 	[SRSO_MITIGATION_IBPB_ON_VMEXIT]	=3D "Mitigation: IBPB on VMEXIT only",
-	[SRSO_MITIGATION_BP_SPEC_REDUCE]	=3D "Mitigation: Reduced Speculation"
+	[SRSO_MITIGATION_BP_SPEC_REDUCE]	=3D "Mitigation: Reduced Speculation",
+	[SRSO_MITIGATION_USER_IBPB]		=3D "Mitigation: IBPB on context switch",
 };
=20
 static int __init srso_parse_cmdline(char *str)
@@ -2948,7 +2950,9 @@ static void __init srso_select_mitigation(void)
 		 * required.  Otherwise the 'microcode' mitigation is sufficient
 		 * to protect the user->user and guest->guest vectors.
 		 */
-		if (cpu_attack_vector_mitigated(CPU_MITIGATE_GUEST_HOST) ||
+		if ((cpu_attack_vector_mitigated(CPU_MITIGATE_GUEST_HOST) &&
+		    !boot_cpu_has(X86_FEATURE_BTB_CTX_ISOLATION))
+					||
 		    (cpu_attack_vector_mitigated(CPU_MITIGATE_USER_KERNEL) &&
 		     !boot_cpu_has(X86_FEATURE_SRSO_USER_KERNEL_NO))) {
 			srso_mitigation =3D SRSO_MITIGATION_SAFE_RET;
@@ -3024,6 +3028,16 @@ static void __init srso_update_mitigation(void)
 	    boot_cpu_has(X86_FEATURE_IBPB_BRTYPE))
 		srso_mitigation =3D SRSO_MITIGATION_IBPB;
=20
+	/*
+	 * See if IBPB on context switch is the only thing needed to address
+	 * GUEST/GUEST and USER/USER vectors.
+	 */
+	if (srso_mitigation =3D=3D SRSO_MITIGATION_MICROCODE  &&
+	    boot_cpu_has(X86_FEATURE_SRSO_USER_KERNEL_NO) &&
+	    boot_cpu_has(X86_FEATURE_BTB_CTX_ISOLATION) &&
+	    spectre_v2_user_ibpb !=3D SPECTRE_V2_USER_NONE)
+		srso_mitigation =3D SRSO_MITIGATION_USER_IBPB;
+
 	pr_info("%s\n", srso_strings[srso_mitigation]);
 }
=20
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index 8665a64..41b4880 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -64,6 +64,7 @@ static const struct cpuid_bit cpuid_bits[] =3D {
 	{ X86_FEATURE_AMD_WORKLOAD_CLASS,	CPUID_EAX, 22, 0x80000021, 0 },
 	{ X86_FEATURE_TSA_SQ_NO,		CPUID_ECX,  1, 0x80000021, 0 },
 	{ X86_FEATURE_TSA_L1_NO,		CPUID_ECX,  2, 0x80000021, 0 },
+	{ X86_FEATURE_BTB_CTX_ISOLATION,	CPUID_ECX,  8, 0x80000021, 0 },
 	{ X86_FEATURE_PERFMON_V2,		CPUID_EAX,  0, 0x80000022, 0 },
 	{ X86_FEATURE_AMD_LBR_V2,		CPUID_EAX,  1, 0x80000022, 0 },
 	{ X86_FEATURE_AMD_LBR_PMC_FREEZE,	CPUID_EAX,  2, 0x80000022, 0 },
