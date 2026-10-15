Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAED5476EA;
	Thu, 15 Oct 2026 15:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078686; cv=none; b=AZO/3Pr8Kz50iPo9SSA7jxjHQLZnbw1A3AIgB8IeQ+TcDK/3dhTEiP7H5ftc0WY4a8PvRLGfqkN5wlr+eDK6f41KP5RNEMEK9jX92go7zC+mg3SgJMDuQJvOkB341PB6sQFnbfLoSFh5lYF9QB2CKn62uzcDwAqBT2jJFA2x5H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078686; c=relaxed/simple;
	bh=3Q1mwHifEPq7Pj4DXf/3PeDqPiigyUsBn1arxvHkEEA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=bvp/qMLXXoNtmgZnOZlMzt1Kh3+CyRUVJev6Y+yZO9CbO3e5ug4cHSdCfbpNjsieyuK61+6SORlpCm+7KFsVXxLiDpuYXvRQRg0qnoAj3oaqNfCLRBSfFveWZlH/JYVj5c+4cO3tjyDAezv18ftxUxyOnQpygFwiVJn4V5mr9is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=COLi7v64; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fBPiDbz1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="COLi7v64";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fBPiDbz1"
Date: Thu, 15 Oct 2026 15:37:46 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792078667;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P7v1liQqa1CnvjHKn+iTAv8ajTcKGIilPbc55o/RXZg=;
	b=COLi7v649BrXl6nA8U6noQDejJVgIx9U613jU0dAuwn5aiouPfdvyxYlYXOYyTdw2YlyUd
	0Y5ad/sOy4nhciAiwU7uKIym8stGU08+W5hsq6u6BpoSpuFxlutVNfYlEEKGjrMtpzuVw8
	WiPV+rVKD5Rhsex7IBeLYxqskwPp+5UNwvXhYXtQJtlFceBY8FAvyv2yQsd5LURO4YFfRp
	b/ANeM/lH3rVrZQcjT2avByb5tkhknJbVcwn8yN/aYyyUesw/0ReufrjX9Wf1jMtly4LKv
	LZWyEseCgBYWPMYlkyW9X2pDUSpRYyTGHFrRktiRD/bbVvDfOyg0o/CF/0oJXA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792078667;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P7v1liQqa1CnvjHKn+iTAv8ajTcKGIilPbc55o/RXZg=;
	b=fBPiDbz1a1wlg9oG6sHpYPKak2sG6zTCC/U+e0PNHFSm9WiHT9Qza1+1v3WbM2CsRy73w0
	OSOhoKJFG2Th0QCw==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] sparc/vdso: Move __VDSO_PAGES to asm/vdso.h
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <20260909-vdso-asm-generic-vsyscall-h-v1-7-63ae856cc659@linutronix.de>
References:
 <20260909-vdso-asm-generic-vsyscall-h-v1-7-63ae856cc659@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179207866603.2666988.1813331189016751615.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     782478555fc637bf0677940922bf64e7daaa0410
Gitweb:        https://git.kernel.org/tip/782478555fc637bf0677940922bf64e7daa=
a0410
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Wed, 09 Sep 2026 10:51:20 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 17:33:19 +02:00

sparc/vdso: Move __VDSO_PAGES to asm/vdso.h

Most architectures define the __VDSO_PAGES page macro in asm/vdso.h.

Align the SPARC headers.

Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260909-vdso-asm-generic-vsyscall-h-v1-7-63ae=
856cc659@linutronix.de
---
 arch/sparc/include/asm/vdso.h          | 6 ++++++
 arch/sparc/include/asm/vdso/vsyscall.h | 2 --
 arch/sparc/vdso/vdso-layout.lds.S      | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/sparc/include/asm/vdso.h b/arch/sparc/include/asm/vdso.h
index f08562d..b17c37c 100644
--- a/arch/sparc/include/asm/vdso.h
+++ b/arch/sparc/include/asm/vdso.h
@@ -5,6 +5,10 @@
 #ifndef _ASM_SPARC_VDSO_H
 #define _ASM_SPARC_VDSO_H
=20
+#define __VDSO_PAGES 4
+
+#ifndef __ASSEMBLER__
+
 struct vdso_image {
 	void *data;
 	unsigned long size;   /* Always a multiple of PAGE_SIZE */
@@ -17,4 +21,6 @@ extern const struct vdso_image vdso_image_64_builtin;
 extern const struct vdso_image vdso_image_32_builtin;
 #endif
=20
+#endif /* __ASSEMBLER__ */
+
 #endif /* _ASM_SPARC_VDSO_H */
diff --git a/arch/sparc/include/asm/vdso/vsyscall.h b/arch/sparc/include/asm/=
vdso/vsyscall.h
index b08e0bd..ff62b29 100644
--- a/arch/sparc/include/asm/vdso/vsyscall.h
+++ b/arch/sparc/include/asm/vdso/vsyscall.h
@@ -3,6 +3,4 @@
 #ifndef _ASM_SPARC_VDSO_VSYSCALL_H
 #define _ASM_SPARC_VDSO_VSYSCALL_H
=20
-#define __VDSO_PAGES 4
-
 #endif /* _ASM_SPARC_VDSO_VSYSCALL_H */
diff --git a/arch/sparc/vdso/vdso-layout.lds.S b/arch/sparc/vdso/vdso-layout.=
lds.S
index 180e5d0..9203962 100644
--- a/arch/sparc/vdso/vdso-layout.lds.S
+++ b/arch/sparc/vdso/vdso-layout.lds.S
@@ -6,7 +6,7 @@
=20
 #include <vdso/datapage.h>
 #include <vdso/page.h>
-#include <asm/vdso/vsyscall.h>
+#include <asm/vdso.h>
=20
 SECTIONS
 {
