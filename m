Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4846351C2E;
	Thu, 17 Sep 2026 02:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789610412; cv=none; b=MN7UIfU/2JkIY+ijlGB27iEx/jagEQPB017l8xjaE/spwIjm+6Zi/RmFsjDZsb3repTlhR6JZAuAFOtSWUmuiMHs5hFiSdWKfotOYzOjHZk0iwkt0IgC7LrPqg3u2uODT7ian8bp9PYB2rmNI1Yb0VhrD5qqc5yl3Rw/6BMEHmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789610412; c=relaxed/simple;
	bh=66nRGvVue7yxITQfRjkMRaaoiGoCxloORIWhztOpPRk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=iFYNkmEPZCI7DSf4hF4t3aL3K6BVDcHhJ+z+GPAtvLXjJaMk864yWX8sgg76Omc158EWCgCUW7g2S3YApzdo8w5NmpIJrSPIU3vUyy1iV83uAe5fDUNqx87U9JKl0hIjH1zX2cYA6NTX7I2pF/uOd8nrFUSNHrrJS4TA2/ljrXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WcvMCnRN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R8CC9YPm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WcvMCnRN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="R8CC9YPm"
Date: Thu, 17 Sep 2026 02:00:06 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789610408;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nl+J7EdJkNMd0L9vMAiD0OTe5p0q0vgVXMINX1p2ZJ4=;
	b=WcvMCnRNA+qeAYFnhTh4bImRrxq9cCRO1UNQQEai9ery03gRF1gm4piIzZN2As5sekgvcQ
	W7/dFaFEOSY7WE/G3M0KFvJA7X1r3prqx7FSDv3q8K3qkoY4e2w6SmUIkdnKNy/kya4PiK
	ls6+cfjr/I1sSBVel/xTKhOjIuzZt9SFM7E9ukEmK7aG/kl/M2UhV4glPD8nAg6CEE+zox
	Wo5lr2jqVqn5hww3r3Cnm7hHLZUFPogcDSR0Yv3ZY7KpjslfWlh74ix0HxQoVYTYQqd83f
	18aA1qAs5LX3C+AF0JXexVd0n71BNNRC/c/EIUCz3XzflDgaLs/YxyeAjMx3zA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789610408;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nl+J7EdJkNMd0L9vMAiD0OTe5p0q0vgVXMINX1p2ZJ4=;
	b=R8CC9YPmppQGXOps1WxgHkZO5uuTB/P9LDaOZu6BUziu8I08SWEewLaqUwMTP/7w1QHZs4
	nyCrfEVqnkM+qgCA==
From: "tip-bot2 for Ihor Solodrai" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/cpu] x86/cpu: Don't transiently clear the boot CPU's capabilities
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916195203.1099646-6-ihor.solodrai@linux.dev>
References: <20260916195203.1099646-6-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178961040663.1720534.16515337025931220992.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cpu branch of tip:

Commit-ID:     2711d67bc3a776abcfc651ad87be5d29ada19166
Gitweb:        https://git.kernel.org/tip/2711d67bc3a776abcfc651ad87be5d29ada=
19166
Author:        Ihor Solodrai <ihor.solodrai@linux.dev>
AuthorDate:    Wed, 16 Sep 2026 12:52:03 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Thu, 17 Sep 2026 02:05:39 +02:00

x86/cpu: Don't transiently clear the boot CPU's capabilities

On the boot CPU, identify_cpu() runs from arch_cpu_finalize_init(), with
interrupts enabled and before alternatives are patched. So
cpu_feature_enabled() still evaluates against boot_cpu_data.

identify_cpu() rebuilds c->x86_capability from scratch: the reset zeroes the
array and the CPUID rescan fills it in again. An interrupt delivered in that
window finds X86_FEATURE_LA57 clear in boot_cpu_data, so pgtable_l5_enabled()
is false and KASAN checks a 5-level address against the 4-level addressability
limit. The result is a bogus "wild-memory-access" report, and under
kasan_multi_shot a report storm that wedges the boot.

The boot CPU has already been scanned by early_identify_cpu(), with interrupts
disabled, and its capabilities cannot have changed since. Reset only the CPUs
which have not been scanned yet.

The window is as old as identify_cpu() rebuilding the capabilities.  Commit

  39b9552281ab ("x86/mm: Optimize boot-time paging mode switching cost")

merely let KASAN notice it by making pgtable_l5_enabled() read the feature
bit. So no Fixes: tag.

Closes: https://lore.kernel.org/bpf/20260610175651.647515-1-ihor.solodrai@lin=
ux.dev/
Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/20260916195203.1099646-6-ihor.solodrai@linux.d=
ev
---
 arch/x86/kernel/cpu/common.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 156a7b8..7d4ff29 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2000,8 +2000,6 @@ static void identify_cpu(struct cpuinfo_x86 *c)
=20
 	c->loops_per_jiffy =3D loops_per_jiffy;
=20
-	init_cpu_info(c);
-
 	if (!cpuid_feature())
 		identify_cpu_without_cpuid(c);
=20
@@ -2186,6 +2184,7 @@ void identify_secondary_cpu(unsigned int cpu)
 		*c =3D boot_cpu_data;
 	c->cpu_index =3D cpu;
=20
+	init_cpu_info(c);
 	identify_cpu(c);
 	x86_spec_ctrl_setup_ap();
 	update_srbds_msr();
