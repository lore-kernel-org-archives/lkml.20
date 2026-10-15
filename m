Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FF652758B;
	Thu, 15 Oct 2026 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078689; cv=none; b=QGcj2jdTRi++rfVEQVHJlHUETRc/QXaZsiPWwGSGo1oWKLEARUDSIffzeU7AvkG9qu9/tP5jU62B3rNQKu8PpD7R/FxWYMaC8lwNOpjNAOStrN+4K8fNXYvz+fD/2RmnrtCcSAvteOfxvQ7ukS1l0ynXP3Ojggvmb4ufVbYOXuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078689; c=relaxed/simple;
	bh=fLVvFYLbb73u10JY2H6ml3dDlzmg/duyaoFLnKuEqBs=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=rp1gnOcWT0K/mtApovV9THEUCqEh4i+85QHcQDwT7rr/bnnRJDgLuP5U7HUQPrp/5C9iPdCo2LMaYHyhSIVKlOM4BNsg4h15oa0rKyTCpIVuT+7eWRaVypWUxzp162TprJQh4YFW/WRkCsTkGMSYP/84DvNv+O8wySt5NrKRaq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Jk4EYSXG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ceLXflks; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Jk4EYSXG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ceLXflks"
Date: Thu, 15 Oct 2026 15:37:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792078669;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=An8vSis9l6Va08SlA/7gbzGUlSPiZ/uFnvh1uCsAmpc=;
	b=Jk4EYSXGovmuzZYGy9Byq1ngo3v7E/zXFryizqVi23iXJ0deCgd7t0SHvEPLZrTOungJEk
	U1k/apamlW3DdSyY9NWimqnNnSInfYwR4C6Yjzn5MCO7uIEmHR6uLQ2s5W32vQmxr6A7qG
	QwW8p1ualX//k31PHd1H86JPRyMD15JJMhZbsQWb8Se/kPnGxTkreN0il4YflynK8xuF2x
	nT5ww6L29gl8UrqkfOnXD4Ced4sHzBSH+h0v85QvOqzWEcFNixTvdaQZeBwo6FS+6/daw4
	lmF6SEIi7I1rBTf/ctIWBdiKbEA6+zO8ObDc3/kA5JP3DuRlQPPNjMN4qquCHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792078669;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=An8vSis9l6Va08SlA/7gbzGUlSPiZ/uFnvh1uCsAmpc=;
	b=ceLXflks8rqRZ9/T9vnNkjUM6gPkUvQa0ZJ0iHYW3WXaoi5xv3cwsFadFYddRBF0HYlfO1
	NHHbWRJ+f43vb9AQ==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] x86/vdso: Move vDSO page definitions to asm/vdso.h
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <20260909-vdso-asm-generic-vsyscall-h-v1-6-63ae856cc659@linutronix.de>
References:
 <20260909-vdso-asm-generic-vsyscall-h-v1-6-63ae856cc659@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179207866763.2666988.13940541406468536107.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     8051a0f482e6039b257f534a39d820547e7c82bd
Gitweb:        https://git.kernel.org/tip/8051a0f482e6039b257f534a39d820547e7=
c82bd
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Wed, 09 Sep 2026 10:51:19 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 17:33:19 +02:00

x86/vdso: Move vDSO page definitions to asm/vdso.h

Most architectures define the vDSO page macros in asm/vdso.h.

Align the x86 headers.

Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260909-vdso-asm-generic-vsyscall-h-v1-6-63ae=
856cc659@linutronix.de
---
 arch/x86/include/asm/vdso.h          | 7 +++++++
 arch/x86/include/asm/vdso/vsyscall.h | 7 -------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/vdso.h b/arch/x86/include/asm/vdso.h
index 4e73515..071e4a2 100644
--- a/arch/x86/include/asm/vdso.h
+++ b/arch/x86/include/asm/vdso.h
@@ -6,6 +6,13 @@
 #include <linux/linkage.h>
 #include <linux/init.h>
=20
+#define __VDSO_PAGES	6
+
+#define VDSO_NR_VCLOCK_PAGES	2
+#define VDSO_VCLOCK_PAGES_START(_b)	((_b) + (__VDSO_PAGES - VDSO_NR_VCLOCK_P=
AGES) * PAGE_SIZE)
+#define VDSO_PAGE_PVCLOCK_OFFSET	0
+#define VDSO_PAGE_HVCLOCK_OFFSET	1
+
 #ifndef __ASSEMBLER__
=20
 #include <linux/mm_types.h>
diff --git a/arch/x86/include/asm/vdso/vsyscall.h b/arch/x86/include/asm/vdso=
/vsyscall.h
index 57598db..65d10f4 100644
--- a/arch/x86/include/asm/vdso/vsyscall.h
+++ b/arch/x86/include/asm/vdso/vsyscall.h
@@ -2,13 +2,6 @@
 #ifndef __ASM_VDSO_VSYSCALL_H
 #define __ASM_VDSO_VSYSCALL_H
=20
-#define __VDSO_PAGES	6
-
-#define VDSO_NR_VCLOCK_PAGES	2
-#define VDSO_VCLOCK_PAGES_START(_b)	((_b) + (__VDSO_PAGES - VDSO_NR_VCLOCK_P=
AGES) * PAGE_SIZE)
-#define VDSO_PAGE_PVCLOCK_OFFSET	0
-#define VDSO_PAGE_HVCLOCK_OFFSET	1
-
 #ifndef __ASSEMBLER__
=20
 #include <vdso/datapage.h>
