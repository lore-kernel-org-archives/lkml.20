Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10163C769B;
	Thu, 15 Oct 2026 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078668; cv=none; b=lIsElzKqgPH7AQaAhpjmb5c0gPm04AhID2AE0dNxU3bnIeDgXbkeET79P8w85TAsiwLoJYL96tHzykPshPI0LfBbBjo3D+gDoGuBLeaqV0HWExLRZSHiWKY5mgkSHYb9G6SMaJJwBTqL9xw0ky78ZT+HBvq2JQhNFgjxbKzohc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078668; c=relaxed/simple;
	bh=KCwLuXxtc5PyQygJSwK2YeWQCp2sPlYiXUe4Nl9shtE=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=boBvdpeLDw2A/QAjtotVl+L0lmIhPbYc4/IP1IhqO/2glk+6+byLrb1KlD6jphnzNlRYgFwXyZar8HdEUd3p7y5jM11rvlWxPE+xgZrc1D17pOssU+VXoJlEYEU4rF+HTsCZU2o8BDVQ+GS4x3mwbxNbL2KGYTYOXOr12MTIolQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cAmbAINt; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5pzbhBSi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cAmbAINt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5pzbhBSi"
Date: Thu, 15 Oct 2026 15:37:34 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792078655;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PLjPiqL7KXtDjAP06q6wJTwMApoKlr+hNFggeqvVoQA=;
	b=cAmbAINtCcOW6i7PyNaWFkOkM9TCp6jEsIB5oF8xXq6EilrY9qmva361Kdm/ZqDQYpA/Mn
	251EwAMxedpUZhphdQgcQ/rm4639x5FkwCNqksjvfnd14aADjtQH/6o5NM9iiqVXrr1lHH
	6+40k+5+M36E6C9TvTlzCSwk1jBy9f41ihDJGVTf1efdaDogx8GyVZXB3LDbWPiT+jIC3w
	GJDe7I8W89dQxCP/sbmJbXz5uuLEoayzA+Fea4dOEZLKXRUJLFYw8cI7v4AFTSiPHwAIHA
	n3ufLhAzTlVLDwY+XakMRyeYHljhMDvCzP/OgC79Vf8d7nAHTstc30hm4S94mg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792078655;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PLjPiqL7KXtDjAP06q6wJTwMApoKlr+hNFggeqvVoQA=;
	b=5pzbhBSiszN8Q7NskWE2Dg4uPxpjvxzvp2TojoPPsIisV39NysWX1YVP59AdVztUd8WDwh
	eFGiEKh46U1MQ1Cw==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] vdso: Remove __ASSEMBLER__ guards from vsyscall.h
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <20260909-vdso-asm-generic-vsyscall-h-v1-15-63ae856cc659@linutronix.de>
References:
 <20260909-vdso-asm-generic-vsyscall-h-v1-15-63ae856cc659@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179207865410.2666988.3214031288768711393.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     9e61cabcce2bdc14a5e4c0b08b2fbf5515f2ac23
Gitweb:        https://git.kernel.org/tip/9e61cabcce2bdc14a5e4c0b08b2fbf5515f=
2ac23
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Wed, 09 Sep 2026 10:51:28 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 17:33:20 +02:00

vdso: Remove __ASSEMBLER__ guards from vsyscall.h

These headers are only used from regular C code.

Remove the unnecessary guards.

Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260909-vdso-asm-generic-vsyscall-h-v1-15-63a=
e856cc659@linutronix.de
---
 arch/arm/include/asm/vdso/vsyscall.h   | 4 ----
 arch/arm64/include/asm/vdso/vsyscall.h | 4 ----
 include/vdso/vsyscall.h                | 4 ----
 3 files changed, 12 deletions(-)

diff --git a/arch/arm/include/asm/vdso/vsyscall.h b/arch/arm/include/asm/vdso=
/vsyscall.h
index 14f2ea9..b97dda1 100644
--- a/arch/arm/include/asm/vdso/vsyscall.h
+++ b/arch/arm/include/asm/vdso/vsyscall.h
@@ -2,8 +2,6 @@
 #ifndef __ASM_VDSO_VSYSCALL_H
 #define __ASM_VDSO_VSYSCALL_H
=20
-#ifndef __ASSEMBLY__
-
 #include <vdso/datapage.h>
 #include <asm/cacheflush.h>
=20
@@ -14,6 +12,4 @@ void __arch_sync_vdso_time_data(struct vdso_time_data *vdat=
a)
 }
 #define __arch_sync_vdso_time_data __arch_sync_vdso_time_data
=20
-#endif /* !__ASSEMBLY__ */
-
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/arm64/include/asm/vdso/vsyscall.h b/arch/arm64/include/asm/=
vdso/vsyscall.h
index 7d9d6bd..7c46c37 100644
--- a/arch/arm64/include/asm/vdso/vsyscall.h
+++ b/arch/arm64/include/asm/vdso/vsyscall.h
@@ -2,8 +2,6 @@
 #ifndef __ASM_VDSO_VSYSCALL_H
 #define __ASM_VDSO_VSYSCALL_H
=20
-#ifndef __ASSEMBLER__
-
 #include <vdso/datapage.h>
=20
 #define VDSO_PRECISION_MASK	~(0xFF00ULL<<48)
@@ -19,6 +17,4 @@ void __arch_update_vdso_clock(struct vdso_clock *vc)
 }
 #define __arch_update_vdso_clock __arch_update_vdso_clock
=20
-#endif /* !__ASSEMBLER__ */
-
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/include/vdso/vsyscall.h b/include/vdso/vsyscall.h
index 29dd4e0..af62bbf 100644
--- a/include/vdso/vsyscall.h
+++ b/include/vdso/vsyscall.h
@@ -2,10 +2,6 @@
 #ifndef __VDSO_VSYSCALL_H
 #define __VDSO_VSYSCALL_H
=20
-#ifndef __ASSEMBLER__
-
 #include <asm/vdso/vsyscall.h>
=20
-#endif /* !__ASSEMBLER__ */
-
 #endif /* __VDSO_VSYSCALL_H */
