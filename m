Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE957415B67;
	Wed, 23 Sep 2026 05:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142755; cv=none; b=spFENNZnaR1KH8X4fZxNtzPf3Jk8/qGiJKh0nF7t8PzHbira0GM9tWUBzq0dKXnNjiFpWD4hfw9y3fI222lH2oUjLt8MIpMAFlEZs+poGKqGDVuZgqP8Cw+SOKGilgzU0J+WrMcDS+S1IL6v+x/0KLAVLQYbkaGIxNw9fUxp6Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142755; c=relaxed/simple;
	bh=L2G4Ps55oCQPnSXqjeM9QAtdPSng2Hq2D/RLud5kIcQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=oRBJ8U+XkVf7NKfgyJZb6zRFxSIAYHkEQoBcC6WuPkzeh2MwtsSHBar0IlH0ETv7pb45l20KLSSZPJk2G7junghK/ZE2baQH+1ljZmoztm7Deqz9pyF+izBE4rMQcisxNlavsy/QX/3uV7vuHqNtgALgw+t8Mff1klL55eKCsR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rmlQiru9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1WQLOyGI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rmlQiru9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1WQLOyGI"
Date: Wed, 23 Sep 2026 05:52:29 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790142751;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3RLfJVLTSUX3NVDHiuPSbLDtIiyYZED11fjuPPRsthI=;
	b=rmlQiru9Wz5i20uLB5lksBZa1S6NDqgBqEKd3LynKpzED/2v7azTVgU75a6JIpVnAFMmO8
	SfdOavMgxLtvJut3JONcOFhsddIQTcn5pOLtmyVDwyfB4AzK248OQZlzq5CH3NqxN46GH4
	CIiisKsIRamfAkYeb6JXa294sg6nEkY/jr8UQivPwwsEY3Spbdqn2jfzbGQGmgWgZwB+jR
	XQ1UcBaWDfjv3uWIzSN7B4qfTwwiJBFQ2LIxaiIREe/P83miIY4dlpxPmK+4XTn0hFcOKb
	Igwgu0JLIid2P6Cz+g99V+ppmof/mfKZ7dzVtExumGiEjaMHte1Y6W5VSdYO9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790142751;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3RLfJVLTSUX3NVDHiuPSbLDtIiyYZED11fjuPPRsthI=;
	b=1WQLOyGIl6nTV+oxr4flCtDJ+rSuvoq2g75qlw5gI4kOjnwaa1sc9/5C9E6EFezKvSkSLE
	//4+HpNuFn2NFGAQ==
From: "tip-bot2 for Mauricio Faria de Oliveira" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/boot] x86/pvh: Really inline memcmp() and memset() to fix
 unbootable VMs
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260921-pvh-kasan-inline-v10-4-08da47943d8e@igalia.com>
References: <20260921-pvh-kasan-inline-v10-4-08da47943d8e@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179014274948.2819794.12599070386669343649.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/boot branch of tip:

Commit-ID:     b24bc9dec9c89d01ccb675a55cda6831dc048ce9
Gitweb:        https://git.kernel.org/tip/b24bc9dec9c89d01ccb675a55cda6831dc0=
48ce9
Author:        Mauricio Faria de Oliveira <mfo@igalia.com>
AuthorDate:    Mon, 21 Sep 2026 22:36:35 -03:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Tue, 22 Sep 2026 19:03:57 -07:00

x86/pvh: Really inline memcmp() and memset() to fix unbootable VMs

Even with __builtin the compiler may decide to use the out of line function
instead of the inline implementation.

The existing code is broken with gcc-14/15 but not gcc-12/13 (Ubuntu 25.10)
and vmlinux no longer boots with CONFIG_PVH if CONFIG_KASAN_GENERIC is set.
The instrumented out of line function performs a memory access to a region not
yet initialized by KASAN, as it is still in the PVH kernel entry point.

For testing purposes, if the size argument in cpuid_base_hypervisor() is
reduced from 12 to 8 the compiler decides to use the inline implementation.
In xen_prepare_pvh(), it (still) decides to use the inline implementation
(at least in these compiler versions), but it is not guaranteed to remain.

Switch the builtin to the inline implementation to address this.

  [ bp: Massage commit message. ]

Fixes: 416a33c9afce ("x86/cpu: fix unbootable VMs by inlining memcmp() in hyp=
ervisor_cpuid_base()")
Fixes: fbe5a6dfe492 ("xen, pvh: fix unbootable VMs by inlining memset() in xe=
n_prepare_pvh()")
Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
Link: https://patch.msgid.link/20260921-pvh-kasan-inline-v10-4-08da47943d8e@i=
galia.com
---
 arch/x86/include/asm/cpuid/api.h  | 2 +-
 arch/x86/platform/pvh/enlighten.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/ap=
i.h
index 82eddfa..2d9f3d4 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -204,7 +204,7 @@ static inline u32 cpuid_base_hypervisor(const char *sig, =
u32 leaves)
 		 * from PVH early boot code before instrumentation is set up
 		 * and memcmp() itself may be instrumented.
 		 */
-		if (!__builtin_memcmp(sig, signature, 12) &&
+		if (!__inline_memcmp(sig, signature, 12) &&
 		    (leaves =3D=3D 0 || ((eax - base) >=3D leaves)))
 			return base;
 	}
diff --git a/arch/x86/platform/pvh/enlighten.c b/arch/x86/platform/pvh/enligh=
ten.c
index f2053cb..cb442cb 100644
--- a/arch/x86/platform/pvh/enlighten.c
+++ b/arch/x86/platform/pvh/enlighten.c
@@ -8,6 +8,7 @@
 #include <asm/hypervisor.h>
 #include <asm/e820/api.h>
 #include <asm/x86_init.h>
+#include <asm/string.h>
=20
 #include <asm/xen/interface.h>
=20
@@ -129,7 +130,7 @@ void __init xen_prepare_pvh(void)
 	 * This must not compile to "call memset" because memset() may be
 	 * instrumented.
 	 */
-	__builtin_memset(&pvh_bootparams, 0, sizeof(pvh_bootparams));
+	__inline_memset(&pvh_bootparams, 0, sizeof(pvh_bootparams));
=20
 	hypervisor_specific_init(xen_guest);
=20
