Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2F83B992A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791395150; cv=none; b=dFpJUPyZ431Wqc8ahK/HBy/Yk01UolVh56XdxIhmAeCjKpRMnCVoeGcmDuN6LGAmVrhXIabKW6kgjYNcj36K0j09seP3MoA+Jn5GZ+ERg/dF8uvBZMUdXtoISXAP5SuJaJOvkzWzMJg+lE2HwF9iE/NQjZkOiCYYbi3FfMAvv9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791395150; c=relaxed/simple;
	bh=yXLQVmlK56kMhfGA7pFsBChp6pb13jdPGNScIbDKUoA=;
	h=From:To:Cc:Message-ID:Date:Subject; b=RnZ+XfoeaRBD6KemWcYNw2O2NAUPLuKY/SmnagOjVSigOILRVcy2YA8BpJncGsqWJNtN7MA/40/QGQ67Hgb6Cl12kUNZNwAnx1T019IscbbkWk4rWjS7TvaxjfLm6czTeV83wMQP9i3ucsonOftFQG4pRJqd+8/6unfBOVnqUCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=kWFdxRr9; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=USJ5AV2n; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="kWFdxRr9";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="USJ5AV2n"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Subject:Date:Message-ID:To:From; t=1791395136; bh=SkQ7J4HiIfhy5GjsiFNBhrW
	02z8RN1b9lERk9Mw2U7k=; b=kWFdxRr9VSO3G2dy8wPeBCVWP7MbuBCH549r5/0KHTwr2XBKb5
	rk6b/t1XVuSVnG5mqIAFGvEZXD3BFGK903ducAW5aq3HbIeH7asK11E+SskL8OzOOsx/Gk8TZLs
	5QnJylE501BpHi/K81vx0+wsLZhazq5KRoP84gzk8YEH2f1NFb7ffPZv/Fm5KAorWmHnwsub5K0
	weyFI4cH2EoCaXj2+DFcubOdDPaGffIJDnOdvGmpWq1oEILeu8GFbiwbfbVkMvutBO1RBnJKjkJ
	tbxphcolfOO+Ef9yXvhHaJo6FuEdwttim7e1k0b6e0Fcs9HQYf3TVXE6xNmKJBtvzBA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Subject:Date:Message-ID:To:From; t=1791395136; bh=SkQ7J4HiIfhy5GjsiFNBhrW
	02z8RN1b9lERk9Mw2U7k=; b=USJ5AV2n589YtAUYrSVhS8CziHjElDlwgCxLplG8cOEF8hYQoQ
	j/vSimlDpu+jvJpIcr2ljIyyq+KKlzfeb6Ag==;
From: Bradley Morgan <brads@mainlining.org>
To: catalin.marinas@arm.com, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, brads@mainlining.org
Message-ID: <20261007175231.1.mte-tmp2@mainlining.org>
Date: Wed, 7 Oct 2026 17:45:01 +0000
Subject: [PATCH] arm64: entry: drop the unused tmp2 argument of
 mte_set_kernel_gcr()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

mte_set_kernel_gcr() takes a tmp2 argument the macro never uses. It
used to, the body passed \tmp and \tmp2 to mte_set_gcr, then
commit 82868247897b ("arm64: kasan: mte: use a constant kernel
GCR_EL1 value") swapped that for

    mov     \tmp, KERNEL_GCR_EL1

and tmp2 stayed in the declaration and in the one caller, which
passes x23 for it.

Drop it, both places.

Signed-off-by: Bradley Morgan <brads@mainlining.org>

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 0e1d9c3c6a93..2baefe7a82d3 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -171,7 +171,7 @@
 #endif
 	.endm

-	.macro mte_set_kernel_gcr, tmp, tmp2
+	.macro mte_set_kernel_gcr, tmp
 #ifdef CONFIG_KASAN_HW_TAGS
 alternative_cb	ARM64_ALWAYS_SYSTEM, kasan_hw_tags_enable
 	b	1f
@@ -258,7 +258,7 @@

 	apply_ssbd 1, x22, x23

-	mte_set_kernel_gcr x22, x23
+	mte_set_kernel_gcr x22

 	/*
 	 * Any non-self-synchronizing system register updates required for
---
 arch/arm64/kernel/entry.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index f63049ac32dc..c3106dee61e1 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -171,7 +171,7 @@ alternative_else_nop_endif
 #endif
 	.endm
 
-	.macro mte_set_kernel_gcr, tmp, tmp2
+	.macro mte_set_kernel_gcr, tmp
 #ifdef CONFIG_KASAN_HW_TAGS
 alternative_cb	ARM64_ALWAYS_SYSTEM, kasan_hw_tags_enable
 	b	1f
@@ -258,7 +258,7 @@ alternative_else_nop_endif
 
 	apply_ssbd 1, x22, x23
 
-	mte_set_kernel_gcr x22, x23
+	mte_set_kernel_gcr x22
 
 	/*
 	 * Any non-self-synchronizing system register updates required for
-- 
2.53.0

