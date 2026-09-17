Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C8D377563;
	Thu, 17 Sep 2026 02:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789610413; cv=none; b=EO1tex0tbqH6rUh+VXL1UENb1KXogMgqvb3+ccYNT1J6CLgGlaYHOUBWRThLgeTQEkLBkSBic8NiNP3oDmX2a9bypoeH/M5Y9F/s+Iv1z2TVpv9yxkeSM5vxL9dQt/rVdFL/OSW9q6J9JgHLvOh8aWAwpgaGq6mSnKgaiqfY0+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789610413; c=relaxed/simple;
	bh=pYZkoy7QVxe/4p4E33pbVtANmmOIfy7NTVghJ0XnBck=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=PS4XjyJF2867IOePVnJPvFlTF8HHlFXHOdhmy4yiG4h6ApI8+/EJU4TUVS27hGPEeu9fpxvjtjinpwEAJ/80ckA/LojSDsukc4uhuXxAJzvVTsP6JJKZKKA12QJMfl9RfuHXxdX4UFGoNIXNrSgNsbMvE8BVDkRB3kK5Aj7bTvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Kt67QHH+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/KJKjhGt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Kt67QHH+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/KJKjhGt"
Date: Thu, 17 Sep 2026 02:00:08 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789610410;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NQLQixg7Ctq+ToTymQE2LtvUDZJTkChQzM2Mwu0fOwU=;
	b=Kt67QHH+60uyqPlS/szp66sn9BA3MJIOHpva9rj1M9KZYX6urZMhw0Kaqo8v5kUMnXFdgc
	RMZdeRMxQFqYF7WGJBD5ofhLa8HdDD9pjnDZ6bgEXJvVAARNO0M+mitq8T7ARAQ18WGRFj
	h1a+qLmzJ3XHRiDn+/8KQNySQ3Paz5gZZgfq6Kc4qIWq0/ro1ODiHffAZt63O418HwbnOt
	sMSL+/xzY6k8R4FdC7nlE1339dpyYAMh6ATEQHJv/Z8QXwcseZNkRtemFS3yLjjfwvuMUB
	4uKr10rrte/PF3N/9SP0BFllcqNDDhG8yceVxvUkaH/0dXLjmI5aOekV95TE6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789610410;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NQLQixg7Ctq+ToTymQE2LtvUDZJTkChQzM2Mwu0fOwU=;
	b=/KJKjhGtfLUU+ltV5Ql5h782ATyu6TcbXquancjVGJXh5bRn//XrgGVpfyPgoFww+ByiFE
	EKadQte1JRDi+uBA==
From: "tip-bot2 for Ihor Solodrai" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cpu] x86/cpu: Move 32-bit SEP setup into identify_cpu()
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Nikolay Borisov <nik.borisov@suse.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916195203.1099646-5-ihor.solodrai@linux.dev>
References: <20260916195203.1099646-5-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178961040821.1720534.10158787074095798094.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cpu branch of tip:

Commit-ID:     db349783ca7aa99345f3809523bff2db8f8714de
Gitweb:        https://git.kernel.org/tip/db349783ca7aa99345f3809523bff2db8f8=
714de
Author:        Ihor Solodrai <ihor.solodrai@linux.dev>
AuthorDate:    Wed, 16 Sep 2026 12:52:02 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Thu, 17 Sep 2026 02:02:18 +02:00

x86/cpu: Move 32-bit SEP setup into identify_cpu()

identify_boot_cpu() and identify_secondary_cpu() both call
enable_sep_cpu() under CONFIG_X86_32 immediately after identify_cpu().

Do it once and drop the ifdefs while at it.

No functional changes.

Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
Link: https://patch.msgid.link/20260916195203.1099646-5-ihor.solodrai@linux.d=
ev
---
 arch/x86/kernel/cpu/common.c |  9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 79a1260..156a7b8 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2128,6 +2128,9 @@ no_cpuid:
 	mcheck_cpu_init(c);
=20
 	numa_add_cpu(smp_processor_id());
+
+	if (IS_ENABLED(CONFIG_X86_32))
+		enable_sep_cpu();
 }
=20
 /*
@@ -2165,9 +2168,6 @@ static __init void identify_boot_cpu(void)
 	identify_cpu(&boot_cpu_data);
 	if (HAS_KERNEL_IBT && cpu_feature_enabled(X86_FEATURE_IBT))
 		pr_info("CET detected: Indirect Branch Tracking enabled\n");
-#ifdef CONFIG_X86_32
-	enable_sep_cpu();
-#endif
 	cpu_detect_tlb(&boot_cpu_data);
 	setup_cr_pinning();
=20
@@ -2187,9 +2187,6 @@ void identify_secondary_cpu(unsigned int cpu)
 	c->cpu_index =3D cpu;
=20
 	identify_cpu(c);
-#ifdef CONFIG_X86_32
-	enable_sep_cpu();
-#endif
 	x86_spec_ctrl_setup_ap();
 	update_srbds_msr();
 	if (boot_cpu_has_bug(X86_BUG_GDS))
