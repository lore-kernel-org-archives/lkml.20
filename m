Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD42531B0B;
	Wed,  9 Sep 2026 23:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788998282; cv=none; b=qHD0KiiO//Uq2RJKpmhz8psawTeFOvtdNdst/svG0TP3eHs7joaNQc8Lc9+vt+W14D0VxOPCam/UuPNVeIIFPH+c/pgC0oAHIiQLsgL6v9eVTXGdJEiEuOdwldV14pfnkIz+p3d1Mt1msRQOyhpF9+5cYZ0/tp8HV6jsU7LpCuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788998282; c=relaxed/simple;
	bh=8s8ujiEQafhuRdDubcaAhu5p1lgdkPD3Rp/b+htDlho=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=L82B/Zcabtae7HIwsxAhBsWqPNic+ouiOd1TjahCocuu4m+YhN1Ry/qRHyDXQM/Gg1QjJZES4wZONXt2UIF1DGxoA1jwKSDAz0REi9ewBsu7Jp2QW+k5LFmpl7+GTClVfEB/HZ9zG7or7v6/mLdMUiYzvpRjmV9hMFzWWpuxvCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4Nlqi1rH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zwWQPDO/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4Nlqi1rH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zwWQPDO/"
Date: Wed, 09 Sep 2026 23:57:56 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788998278;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wjX2ookWASYjpiHdkKM4DkQWc8+fvmh3ENr6Dc/S6WE=;
	b=4Nlqi1rHFyijAFj7S4a/f5zNxn4bKU/cnVzpgkBHjPc3UQ+xg4mzbItqavY4y7HE/MO8BM
	8rUuFaos6C1BintoqB8C5E7BeQLxZMjlEtrBgZLc2xZN9U/FBBL7lenvkVOta1Sjc5Bx4J
	VbJaAlQp4v4s890F8u69gPIQjV14Do+rQPnHVLHqXfpwUqwQEX7omqSBJuIs+Kp+jzV64L
	iiLOt21DuGhaPvMPVvqdZMTPMDhd9AMIVkN4TdrrirnQKmAmkFnnj4W0ojKFb11Zcv+Vs9
	xVzdEE3bTrNpqCfvOKZH2hP7921ON4Sw3E+AiIapIyyaUxentgAtfAAL6iz14Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788998278;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wjX2ookWASYjpiHdkKM4DkQWc8+fvmh3ENr6Dc/S6WE=;
	b=zwWQPDO//f/kHAuh13jpB444b/jEwt5TNNiwtaOEmFEYglKZfu8cyV0cVaPuu2/pmXwBWq
	HJJeknktedxcOnDw==
From: "tip-bot2 for Eric Biggers" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/fpu] x86/fpu: Remove cpu_has_xfeatures()
Cc: Eric Biggers <ebiggers@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Christoph Hellwig <hch@lst.de>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260901145740.42337-7-ebiggers@kernel.org>
References: <20260901145740.42337-7-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178899827671.623050.8514464749794445362.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/fpu branch of tip:

Commit-ID:     a5f7ae47667cc69738b2483e085cb0b2d819a9ce
Gitweb:        https://git.kernel.org/tip/a5f7ae47667cc69738b2483e085cb0b2d81=
9a9ce
Author:        Eric Biggers <ebiggers@kernel.org>
AuthorDate:    Tue, 01 Sep 2026 07:57:38 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Wed, 09 Sep 2026 14:15:12 -07:00

x86/fpu: Remove cpu_has_xfeatures()

The only remaining caller of cpu_has_xfeatures() is print_xstate_features(),
which uses it only to check and get the name of a single feature.

Remove it and just inline the needed code into print_xstate_features().

This also makes the "unknown xstate feature" entry at index XFEATURE_MAX of
xfeature_names[] unnecessary, so remove that too.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Acked-by: Christoph Hellwig <hch@lst.de>
Link: https://patch.msgid.link/20260901145740.42337-7-ebiggers@kernel.org
---
 arch/x86/include/asm/fpu/api.h |  9 +-------
 arch/x86/kernel/fpu/xstate.c   | 44 ++-------------------------------
 2 files changed, 3 insertions(+), 50 deletions(-)

diff --git a/arch/x86/include/asm/fpu/api.h b/arch/x86/include/asm/fpu/api.h
index 90c63fe..cfed8b2 100644
--- a/arch/x86/include/asm/fpu/api.h
+++ b/arch/x86/include/asm/fpu/api.h
@@ -99,15 +99,6 @@ static inline void fpregs_assert_state_consistent(void) { }
  */
 extern void switch_fpu_return(void);
=20
-/*
- * Query the presence of one or more xfeatures. Works on any legacy CPU as w=
ell.
- *
- * If 'feature_name' is set then put a human-readable description of
- * the feature there as well - this can be used to print error (or success)
- * messages.
- */
-extern int cpu_has_xfeatures(u64 xfeatures_mask, const char **feature_name);
-
 /* Trap handling */
 extern int  fpu__exception_code(struct fpu *fpu, int trap_nr);
 extern void fpu_sync_fpstate(struct fpu *fpu);
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index 97cfd4f..0b17452 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -66,8 +66,8 @@ static const char *xfeature_names[] =3D
 	"AMX Tile config",
 	"AMX Tile data",
 	"APX registers",
-	"unknown xstate feature",
 };
+static_assert(ARRAY_SIZE(xfeature_names) =3D=3D XFEATURE_MAX);
=20
 static unsigned short xsave_cpuid_features[] __initdata =3D {
 	[XFEATURE_FP]				=3D X86_FEATURE_FPU,
@@ -122,44 +122,6 @@ static inline unsigned int next_xfeature_order(unsigned =
int i, u64 mask)
 #define XSTATE_FLAG_SUPERVISOR	BIT(0)
 #define XSTATE_FLAG_ALIGNED64	BIT(1)
=20
-/*
- * Return whether the system supports a given xfeature.
- *
- * Also return the name of the (most advanced) feature that the caller reque=
sted:
- */
-int cpu_has_xfeatures(u64 xfeatures_needed, const char **feature_name)
-{
-	u64 xfeatures_missing =3D xfeatures_needed & ~fpu_kernel_cfg.max_features;
-
-	if (unlikely(feature_name)) {
-		long xfeature_idx, max_idx;
-		u64 xfeatures_print;
-		/*
-		 * So we use FLS here to be able to print the most advanced
-		 * feature that was requested but is missing. So if a driver
-		 * asks about "XFEATURE_MASK_SSE | XFEATURE_MASK_YMM" we'll print the
-		 * missing AVX feature - this is the most informative message
-		 * to users:
-		 */
-		if (xfeatures_missing)
-			xfeatures_print =3D xfeatures_missing;
-		else
-			xfeatures_print =3D xfeatures_needed;
-
-		xfeature_idx =3D fls64(xfeatures_print)-1;
-		max_idx =3D ARRAY_SIZE(xfeature_names)-1;
-		xfeature_idx =3D min(xfeature_idx, max_idx);
-
-		*feature_name =3D xfeature_names[xfeature_idx];
-	}
-
-	if (xfeatures_missing)
-		return 0;
-
-	return 1;
-}
-EXPORT_SYMBOL_GPL(cpu_has_xfeatures);
-
 static bool xfeature_is_aligned64(int xfeature_nr)
 {
 	return xstate_flags[xfeature_nr] & XSTATE_FLAG_ALIGNED64;
@@ -302,9 +264,9 @@ static void __init print_xstate_features(void)
=20
 	for (i =3D 0; i < XFEATURE_MAX; i++) {
 		u64 mask =3D BIT_ULL(i);
-		const char *name;
+		const char *name =3D xfeature_names[i];
=20
-		if (cpu_has_xfeatures(mask, &name))
+		if (fpu_kernel_cfg.max_features & mask)
 			pr_info("x86/fpu: Supporting XSAVE feature 0x%03Lx: '%s'\n", mask, name);
 	}
 }
