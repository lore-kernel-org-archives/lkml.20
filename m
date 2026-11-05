Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841997;
	b=LsuJISoO6BpQ5rWEb9FYcq4+//FUK83HZV1riolQh4aOPCeBUi/rOpuYZS6u8wv2xRHA
	 Rtu+Z/hH7k9xZoHkLxYXx9PqVcQESB3J8o/Nv44iwVP+Kx8uhq0ZdwLYrif4WSkm8UpAZ
	 V+mRnyIsNXlWz0hcnHvoz0dwJAjFNHQw8qkaTrLpOVz7EauzEeuSPwBDAbnf8Z44ItEWm
	 3YrGZbK44dLbrRZfq+oUYlpZo0Vcw/0y3cdNHfNEc4LnlKrfLyUM5n9vgObCgOmoykSJP
	 IQIXTYx7P+qky2Orz69no4XmsInz5bovHxcTZxjNZNZxFKhWsTF1wXTSTtScyo8Uj2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841997;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=ShkU91swGs6ZlKH4djxN9AdrnRYsmo80Se5BbgY7wB4=;
	b=Q8CVpE1SF0IPMK4d+sne1TYW3QQ61enybrsUC91x033py0+ahzT6jn1JiDaLWontEN5l
	 vuL2cvZG8yFB3kXPyS5Rr/G3UVg+e0431IlxMnXEI8qQUBXZvxV0xgHnlQEKMqe+1EIv2
	 9Axa78CkyJE7RB4wVdws2JLh0xEWzkaCXIgR8YO3ADEjybiB09suDtbKobbESYgTvlWkq
	 QsxosSF44p/2X0nX1qhqKZiNK6fBrgu66Jm2egRHHhCP3voYOJQM/AcnpFEndHX/toJTO
	 +4AvBCKGbRUIn9EFhSUyWLLpwPf5WP2XVAGyKEueGUAv2IPTzGdCkxLfyL0PS1caXcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fc50o5ua;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Y7SdHmNk;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709F2606A32D;
	Thu,  5 Nov 2026 01:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 709F2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fc50o5ua;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Y7SdHmNk
Date: Thu, 05 Nov 2026 01:26:33 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793841994;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ShkU91swGs6ZlKH4djxN9AdrnRYsmo80Se5BbgY7wB4=;
	b=fc50o5ua6pzglErAWndBE4VNEV9uMK1wiUkOPKaMVpJAsrGxEHf0KJR31sQ1GYxHqczAp7
	OH8jnjSFJH/s1tyISulTJEmE0Ao5bpsQoKwuQTrg1sRl5jjwIFOgb9bvCdnW1z+aYFoZcl
	f7tiNW+LrF9d/UDdJfiv6a2wM26qTWMDMzX7pIYVuYNn/ja4Hycu/+Dx0XTBtP3egp4Y88
	sXHd1G/3zw6o6i1DQNW0UPi307LKwsASj3GyNzh3UZqWByOg2AbiCm+bv10+LsYSDSil07
	UtxPEA+5DaX9GPLTK1n+os99rokwdkz/FO05+J/pKGGqrf951q7GEMPI1W5MgQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793841994;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ShkU91swGs6ZlKH4djxN9AdrnRYsmo80Se5BbgY7wB4=;
	b=Y7SdHmNkp2HVpkk1zYy79y0ppbf7vh20K8T1Nza5xER9TmqKybdGP1hVz9d1rD/AqOAiqp
	6603qh5539+vskCQ==
From: "tip-bot2 for Ashish Kalra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] x86/sev: Clear RMPOPT when segmented RMP is
 disabled by firmware
Cc: Ashish Kalra <ashish.kalra@amd.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3C56da047d63b22f03a7e709fc172a5543da894d67=2E1793216?=
 =?utf-8?q?372=2Egit=2Eashish=2Ekalra=40amd=2Ecom=3E?=
References: =?utf-8?q?=3C56da047d63b22f03a7e709fc172a5543da894d67=2E17932163?=
 =?utf-8?q?72=2Egit=2Eashish=2Ekalra=40amd=2Ecom=3E?=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179384199318.1009794.10303980364024271360.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     2803a7993d4cd9354f851dfcab46991d676f4e6b
Gitweb:        https://git.kernel.org/tip/2803a7993d4cd9354f851dfcab46991d676=
f4e6b
Author:        Ashish Kalra <ashish.kalra@amd.com>
AuthorDate:    Wed, 28 Oct 2026 19:49:22=20
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Wed, 04 Nov 2026 17:09:14 -08:00

x86/sev: Clear RMPOPT when segmented RMP is disabled by firmware

Segmented RMP support is advertised via X86_FEATURE_SEGMENTED_RMP, and the
firmware enables it via MSR_AMD64_RMP_CFG[SEG_RMP_ENABLED]. The latter can be
cleared in platform BIOS by the user, in which case the system runs in
contiguous RMP setting.

snp_probe_rmptable_info() does not clear X86_FEATURE_RMPOPT in the
advertised-but-firmware-disabled case.

As a result, this does not prevent snp_enable_rmpopt() from trying to program
MSR_AMD64_RMPOPT_BASE, which raises a #GP on the MSR access.

Make sure X86_FEATURE_RMPOPT is cleared in all cases where segmented RMP is
not enabled.

  [ bp:
   - Put the commit message on Ozempic
   - Simplify snp_probe_rmptable_info()
   - Fix feature check order in snp_enable_rmpopt()
   - Add RMPOPT feature dependency on SEV_SNP ]

Fixes: 15d974be0a3b ("x86/sev: Initialize RMPOPT configuration MSRs")
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/56da047d63b22f03a7e709fc172a5543da894d67.17932=
16372.git.ashish.kalra@amd.com
---
 arch/x86/kernel/cpu/cpuid-deps.c |  1 +
 arch/x86/virt/svm/sev.c          | 17 +++++------------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-dep=
s.c
index 99801e8..acbcec3 100644
--- a/arch/x86/kernel/cpu/cpuid-deps.c
+++ b/arch/x86/kernel/cpu/cpuid-deps.c
@@ -93,6 +93,7 @@ static const struct cpuid_dep cpuid_deps[] =3D {
 	{ X86_FEATURE_SPEC_CTRL_SSBD,		X86_FEATURE_SPEC_CTRL },
 	{ X86_FEATURE_LASS,			X86_FEATURE_SMAP      },
 	{ X86_FEATURE_INVLPGB,			X86_FEATURE_PCID      },
+	{ X86_FEATURE_RMPOPT,			X86_FEATURE_SEV_SNP   },
 	{}
 };
=20
diff --git a/arch/x86/virt/svm/sev.c b/arch/x86/virt/svm/sev.c
index bd70c4d..417e6a4 100644
--- a/arch/x86/virt/svm/sev.c
+++ b/arch/x86/virt/svm/sev.c
@@ -669,10 +669,10 @@ void snp_enable_rmpopt(void)
 	u64 base;
 	int cpu;
=20
-	if (!cpu_feature_enabled(X86_FEATURE_RMPOPT))
+	if (!cc_platform_has(CC_ATTR_HOST_SEV_SNP))
 		return;
=20
-	if (!cc_platform_has(CC_ATTR_HOST_SEV_SNP))
+	if (!cpu_feature_enabled(X86_FEATURE_RMPOPT))
 		return;
=20
 	if (!rmpopt_soft_init)
@@ -819,18 +819,11 @@ bool snp_probe_rmptable_info(void)
 {
 	if (cpu_feature_enabled(X86_FEATURE_SEGMENTED_RMP)) {
 		rdmsrq(MSR_AMD64_RMP_CFG, rmp_cfg);
-
-		if (rmp_cfg & MSR_AMD64_SEG_RMP_ENABLED) {
-			if (probe_segmented_rmptable_info())
-				return true;
-
-			setup_clear_cpu_cap(X86_FEATURE_RMPOPT);
-			return false;
-		}
-	} else {
-		setup_clear_cpu_cap(X86_FEATURE_RMPOPT);
+		if (rmp_cfg & MSR_AMD64_SEG_RMP_ENABLED)
+			return probe_segmented_rmptable_info();
 	}
=20
+	setup_clear_cpu_cap(X86_FEATURE_RMPOPT);
 	return probe_contiguous_rmptable_info();
 }
=20
