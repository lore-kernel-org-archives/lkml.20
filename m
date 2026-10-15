Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3431254CF66;
	Thu, 15 Oct 2026 15:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078693; cv=none; b=OMwtgxl8Utuk/N00t3FgJVx2y8TMshEekvcJW6KhNx+5EAFoIfQfh8PdZj6yJJe/Sx2JqFMCsdEo62Dd8oYliXONCu5yB5tRil7KwmddkNvNI2A/YBamCGYhgSqbJyHJtdK1abU8IJu5LASnFkhVKTt0YuoGQt4rBtVGlML34RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078693; c=relaxed/simple;
	bh=aVPGT/04pt96m0eSlBKLu25H9ZjWU10rl20c2UBM0qo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=HCml6jOiUCd4rUs/DfGKPRghonE1iyVXRkm6+9Tp9gR55PeYHHQPDQoa6DAnHmvwVx/KyQNKxjrDlsAlGAhvcRn9Md55/5ZaZ0EkBRMguT0cpR1PlYlG7+UzIPK1Cx86hwVDteQZj7cjFDNaFBNvxmL6y4GPFzAFTi/CyVISdbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cRQRcEeF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=F4nxVnKp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cRQRcEeF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="F4nxVnKp"
Date: Thu, 15 Oct 2026 15:37:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792078672;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IiJRywyCBOx8hrvplHrhtszOF1+cH6PQNYUXC9ztKQs=;
	b=cRQRcEeFo5H1cIWjVEg9tZ8g3Q01UKU4XRCtnVIpJpQpTBoa+b6e1IJ3WlQo33dixQq+2f
	C/4rVG/jXREK/8lZyMPNubBvxk9CMlrazucP1OrDD9RzdUJVFrjU24RKuptkYG6jbKRYZ8
	ztEO0y/wS4IUpWYJeYGC2ik+b6O1jbuvmmumJWFR50W05YhrFhWnBLTeLpMpoVGH84LkMg
	cKszNu4nKGOmJXeDZ1lFluFFvgs5jtH5U+0OLSm5QnDdy0b7XgMOquTFf7cS4D+TsjX1KM
	7nvBA47ulTu2FRqwA0+CiAbocSBz7dMGUHGh0ReNkItpZdbU9/wbwAIyoGUs2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792078672;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IiJRywyCBOx8hrvplHrhtszOF1+cH6PQNYUXC9ztKQs=;
	b=F4nxVnKpL772ZYLyQswOzpLWK9d0skKOeCMfaILNIeiq4/6v2efto0lU3vThxy0P4XMEas
	+N9e/ryWQ6Hpt4CA==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] vdso/vsyscall: Define fallback time
 synchronization functions in vsyscall.c
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <20260909-vdso-asm-generic-vsyscall-h-v1-4-63ae856cc659@linutronix.de>
References:
 <20260909-vdso-asm-generic-vsyscall-h-v1-4-63ae856cc659@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179207867058.2666988.5665638823250249587.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     e4eeeaa14d8dd19613c5254afb335c685039778f
Gitweb:        https://git.kernel.org/tip/e4eeeaa14d8dd19613c5254afb335c68503=
9778f
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Wed, 09 Sep 2026 10:51:17 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 17:33:19 +02:00

vdso/vsyscall: Define fallback time synchronization functions in vsyscall.c

__arch_update_vdso_clock() and __arch_sync_vdso_time_data() are only
used in vsyscall.c. vsyscall.h has become a dumping ground for different
kinds of fallbacks.

Move the fallback function definitions into vsyscall.c.

Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260909-vdso-asm-generic-vsyscall-h-v1-4-63ae=
856cc659@linutronix.de
---
 include/asm-generic/vdso/vsyscall.h | 11 -----------
 kernel/time/vsyscall.c              | 12 ++++++++++++
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/asm-generic/vdso/vsyscall.h b/include/asm-generic/vdso/v=
syscall.h
index cdf7b39..cfb740e 100644
--- a/include/asm-generic/vdso/vsyscall.h
+++ b/include/asm-generic/vdso/vsyscall.h
@@ -4,17 +4,6 @@
=20
 #ifndef __ASSEMBLER__
=20
-#ifndef __arch_update_vdso_clock
-static __always_inline void __arch_update_vdso_clock(struct vdso_clock *vc)
-{
-}
-#endif /* __arch_update_vdso_clock */
-
-#ifndef __arch_sync_vdso_time_data
-static __always_inline void __arch_sync_vdso_time_data(struct vdso_time_data=
 *vdata)
-{
-}
-#endif /* __arch_sync_vdso_time_data */
=20
 #endif /* !__ASSEMBLER__ */
=20
diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index 4b96a8b..b314d6d 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -16,6 +16,18 @@
=20
 #include "timekeeping_internal.h"
=20
+#ifndef __arch_update_vdso_clock
+static __always_inline void __arch_update_vdso_clock(struct vdso_clock *vc)
+{
+}
+#endif /* __arch_update_vdso_clock */
+
+#ifndef __arch_sync_vdso_time_data
+static __always_inline void __arch_sync_vdso_time_data(struct vdso_time_data=
 *vdata)
+{
+}
+#endif /* __arch_sync_vdso_time_data */
+
 static inline void fill_clock_configuration(struct vdso_clock *vc, const str=
uct tk_read_base *base)
 {
 	vc->cycle_last	=3D base->cycle_last;
