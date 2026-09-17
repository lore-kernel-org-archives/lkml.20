Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E770379EEF;
	Thu, 17 Sep 2026 02:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789610416; cv=none; b=Jtg3v5v/E87zVRNtHziNA5knidDyw5SN1zne+10EmeqMJlxWHKlR7+NV0pua2iYYdVYIfOSx6VovqPFCtbPEFnVcavoVFY1yitv+t5TdlT/60ey5a7JhjatRkG+nnwNhHWYPeWLKRONE9PDOK3JGsIvHc3F5aLr1KTIqsHgM8/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789610416; c=relaxed/simple;
	bh=d55caUXMz4/lw33DPw44XQ05LW+My1EQaHaa2gFg6O4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=iYD0RNiSE71Eb7GTCUbpQiFXwlRRVS2DtRyfzXCMQABhv6R+CCCp3HIX/Mpqon6ssjkn7eFEbdIK30//vRBxmEtvuAV/L6sx7jMG07MYnIxe9Fe2g6GA1ze/lzt+jmcijX3R+sHFF2zOhPgyEpcb5IZmwrWH/732t6oVBd1ZDQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vk4yTu2W; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tysLViZC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vk4yTu2W";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tysLViZC"
Date: Thu, 17 Sep 2026 02:00:09 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789610411;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K9044PxFd7nxBCU83aqF3GD3HeVG6oMyNiVO0kF6T9I=;
	b=vk4yTu2WezK/dk97gvR35gpe8I1wN1un9S/BYZEgn+TLQ2EhT3CctcYKg2cByMPG1LwubD
	tGoJOoImjZAVgK/+suLllxOd7hKyh8NZpVgQYAkSjOxO6vYkzhWnqRW1vA3moF6+MVoyJE
	yGoJDY2xsZ4VMfZLH4PtIK3gFfBmqcmbSYhoYEXheXQTfC9q8XSyXn6ZEY94mPEwQ4dU0u
	PJsOmtoUqCDCxVv6Bzhv4nF3Hi0sCB+ONcDjgWFYNhJfCndKNlvWKRgHBzLWgy7tjvgHnj
	dAVxMRgQx3HGtpgmEVAHIRrwYqS0pW+lZdxrZVbkTzlrfqYl3hRDfG8VqwTebw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789610411;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K9044PxFd7nxBCU83aqF3GD3HeVG6oMyNiVO0kF6T9I=;
	b=tysLViZCZp13u9z6NqeMBCo/hsNO3y9SsClJXSdfS1JnFkAsQB1W6Xoanunmem4FhT8iwv
	fIGTPfsGjspuLZAQ==
From: "tip-bot2 for Ihor Solodrai" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cpu] x86/cpu: Inline generic_identify() into identify_cpu()
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916195203.1099646-4-ihor.solodrai@linux.dev>
References: <20260916195203.1099646-4-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178961040987.1720534.8307818314522775654.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cpu branch of tip:

Commit-ID:     ad86fe2134ccdc97a967693d2723a731c99fb7bc
Gitweb:        https://git.kernel.org/tip/ad86fe2134ccdc97a967693d2723a731c99=
fb7bc
Author:        Ihor Solodrai <ihor.solodrai@linux.dev>
AuthorDate:    Wed, 16 Sep 2026 12:52:01 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Thu, 17 Sep 2026 02:00:25 +02:00

x86/cpu: Inline generic_identify() into identify_cpu()

generic_identify() has exactly one call site: at the top of
identify_cpu(). Fold it into identify_cpu() so that a single function
does the job for both the boot CPU and the secondary CPUs.

While at it, fix up both copies of the Cyrix comment.

No functional changes.

Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/20260916195203.1099646-4-ihor.solodrai@linux.d=
ev
---
 arch/x86/kernel/cpu/common.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index d1a949a..79a1260 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1827,7 +1827,7 @@ static void __init early_identify_cpu(struct cpuinfo_x8=
6 *c)
 	if (!cpuid_feature())
 		identify_cpu_without_cpuid(c);
=20
-	/* cyrix could have cpuid enabled via c_identify()*/
+	/* Cyrix could have CPUID enabled via c_identify(). */
 	if (cpuid_feature()) {
 		cpuid_scan_cpu(c);
 		cpu_detect(c);
@@ -1991,14 +1991,23 @@ void check_null_seg_clears_base(struct cpuinfo_x86 *c)
 	set_cpu_bug(c, X86_BUG_NULL_SEG);
 }
=20
-static void generic_identify(struct cpuinfo_x86 *c)
+/*
+ * This does the hard work of actually picking apart the CPU stuff...
+ */
+static void identify_cpu(struct cpuinfo_x86 *c)
 {
+	int i;
+
+	c->loops_per_jiffy =3D loops_per_jiffy;
+
+	init_cpu_info(c);
+
 	if (!cpuid_feature())
 		identify_cpu_without_cpuid(c);
=20
-	/* cyrix could have cpuid enabled via c_identify()*/
+	/* Cyrix could have CPUID enabled via c_identify(). */
 	if (!cpuid_feature())
-		return;
+		goto no_cpuid;
=20
 	cpuid_scan_cpu(c);
 	cpu_detect(c);
@@ -2026,21 +2035,8 @@ static void generic_identify(struct cpuinfo_x86 *c)
 #ifdef CONFIG_X86_32
 	set_cpu_bug(c, X86_BUG_ESPFIX);
 #endif
-}
-
-/*
- * This does the hard work of actually picking apart the CPU stuff...
- */
-static void identify_cpu(struct cpuinfo_x86 *c)
-{
-	int i;
-
-	c->loops_per_jiffy =3D loops_per_jiffy;
-
-	init_cpu_info(c);
-
-	generic_identify(c);
=20
+no_cpuid:
 	cpu_parse_topology(c);
=20
 	if (this_cpu->c_identify)
