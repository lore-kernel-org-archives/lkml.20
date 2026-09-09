Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6794352FE5A;
	Wed,  9 Sep 2026 23:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788998294; cv=none; b=KXvcqSrsQVmW7Zyj0HqwXBWCbXzQukzivdnVQTTU3ECtnjfIxd1A9EdSuhFH00APAlUN14kSnbBmzsBt4I4Ct+xKWDIDV1Bxekf9SX5LvLVT/66er8o6vY0Q3uDdMEPKdGdNxijSrDqjFVUHUV5PVXVm0XoO+Xm3EENg5jU2PTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788998294; c=relaxed/simple;
	bh=3ldf2RubOHXaLVieyPPbIPvefqN1Gr8SfV3HdCw7k5c=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ZoOne0GOh9nO8JI4uzsX4/Q/JRir42qAZt/WCtCqgeP1TjyhFRHFSjVWg1jH8Br3E9Y2hY0toZ2AGzndXQLCfQVeF5BnWOUVC+9mvj4TYzveC5LD8vLL16tg+BV7JW/TG7/0QzuOPf5oyDPfQbbWBBbjfkQ15H/hziIBfWymOXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kqQD1Tr4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tg254KzG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kqQD1Tr4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tg254KzG"
Date: Wed, 09 Sep 2026 23:58:04 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788998286;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NMOOdhqe0cMWnljQ/qeVzCY27so7kxxMRbXpMlioNA8=;
	b=kqQD1Tr44Ttu6/bE925Y7SuaK3z532oXyapR9L1X43UwzXGal/QPDQ2ax49GSw1Qk+wv+6
	5nL0b0IhZyVP18RP1yT2GiDb8N70O9Nj4IhzLbq2GmLGsU5l8wSe/MGPOwL5oXPtYHhaoP
	m8n2DLCQPTaEn+YR/w5YqH/gLdls5+2Q3MTXry9SLBiAO3e/7Q7QfcyFFMZc9yljjeci0g
	VjCq1FRzL+/iLEmFO11ggm6RjmAUp2A8yhzES1zYnIJTyHI13xOjPS4fapGVr8HfHjJd4z
	hDrXAVYsWsOuKyIJxz+LpBCxna6Nuf8GmeiIasykQmLhHxHMzhUDk5J+p2t6ZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788998286;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NMOOdhqe0cMWnljQ/qeVzCY27so7kxxMRbXpMlioNA8=;
	b=tg254KzG7Tc01r89k48pA2vT+B2WqNFQAzq/5wXqZpO8sp4MiJXUVHaQNJAoeYwJryspVr
	pzkblCMoAJ2cuGCw==
From: "tip-bot2 for Eric Biggers" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/fpu] x86/fpu: Check for missing AVX and AVX-512 xstate bits
Cc: Eric Biggers <ebiggers@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Christoph Hellwig <hch@lst.de>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260901145740.42337-2-ebiggers@kernel.org>
References: <20260901145740.42337-2-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178899828430.623050.8638024070858129406.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/fpu branch of tip:

Commit-ID:     518aa9948e4f2ba69b7066371d3ac8e4d31d604e
Gitweb:        https://git.kernel.org/tip/518aa9948e4f2ba69b7066371d3ac8e4d31=
d604e
Author:        Eric Biggers <ebiggers@kernel.org>
AuthorDate:    Tue, 01 Sep 2026 07:57:33 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Wed, 02 Sep 2026 10:35:40 -07:00

x86/fpu: Check for missing AVX and AVX-512 xstate bits

If the CPU declares AVX or AVX-512 support, verify that the corresponding
xstate bits are also set.  If not, warn and clear them.

This eliminates the perceived need for AVX and AVX-512 optimized code in the
kernel to call cpu_has_xfeatures().  That has never been universally done,
which strongly suggests that it has never really been needed in practice, but
this should remove any remaining doubt.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Acked-by: Christoph Hellwig <hch@lst.de>
Link: https://patch.msgid.link/20260901145740.42337-2-ebiggers@kernel.org
---
 arch/x86/kernel/fpu/xstate.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index a7b6524..97cfd4f 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -806,7 +806,7 @@ static u64 __init guest_default_mask(void)
 void __init fpu__init_system_xstate(unsigned int legacy_size)
 {
 	unsigned int eax, ebx, ecx, edx;
-	u64 xfeatures;
+	u64 xfeatures, mask;
 	int err;
 	int i;
=20
@@ -818,6 +818,8 @@ void __init fpu__init_system_xstate(unsigned int legacy_s=
ize)
 	if (!boot_cpu_has(X86_FEATURE_XSAVE)) {
 		pr_info("x86/fpu: x87 FPU will use %s\n",
 			boot_cpu_has(X86_FEATURE_FXSR) ? "FXSAVE" : "FSAVE");
+		/* Disable all dependent flags too */
+		setup_clear_cpu_cap(X86_FEATURE_XSAVE);
 		return;
 	}
=20
@@ -833,7 +835,8 @@ void __init fpu__init_system_xstate(unsigned int legacy_s=
ize)
 	cpuid_count(CPUID_LEAF_XSTATE, 1, &eax, &ebx, &ecx, &edx);
 	fpu_kernel_cfg.max_features |=3D ecx + ((u64)edx << 32);
=20
-	if ((fpu_kernel_cfg.max_features & XFEATURE_MASK_FPSSE) !=3D XFEATURE_MASK_=
FPSSE) {
+	mask =3D XFEATURE_MASK_FPSSE;
+	if ((fpu_kernel_cfg.max_features & mask) !=3D mask) {
 		/*
 		 * This indicates that something really unexpected happened
 		 * with the enumeration.  Disable XSAVE and try to continue
@@ -844,6 +847,24 @@ void __init fpu__init_system_xstate(unsigned int legacy_=
size)
 		goto out_disable;
 	}
=20
+	mask |=3D XFEATURE_MASK_YMM;
+	if (boot_cpu_has(X86_FEATURE_AVX)) {
+		if ((fpu_kernel_cfg.max_features & mask) !=3D mask) {
+			pr_err(FW_BUG
+			       "x86/fpu: Disabling AVX support due to missing xstate features\n");
+			setup_clear_cpu_cap(X86_FEATURE_AVX);
+		}
+	}
+
+	mask |=3D XFEATURE_MASK_AVX512;
+	if (boot_cpu_has(X86_FEATURE_AVX512F)) {
+		if ((fpu_kernel_cfg.max_features & mask) !=3D mask) {
+			pr_err(FW_BUG
+			       "x86/fpu: Disabling AVX-512 support due to missing xstate features=
\n");
+			setup_clear_cpu_cap(X86_FEATURE_AVX512F);
+		}
+	}
+
 	if (fpu_kernel_cfg.max_features & XFEATURE_MASK_APX &&
 	    fpu_kernel_cfg.max_features & (XFEATURE_MASK_BNDREGS | XFEATURE_MASK_BN=
DCSR)) {
 		/*
