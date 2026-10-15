Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDB9542EDD;
	Thu, 15 Oct 2026 15:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078700; cv=none; b=Usu+gKmmO7sFgl+9oSN69Cn6G2thGYbAbe40tNeE27tpGrwimPKTKkzpXTQ0Y4Yd8/LabOXZT41eefkP5+7WN/QlJHOlTKPq1ZlM7Qgbd+U04fCeZssCeM6E6LAcRYgYQJN/lFHqvMgwxjCfgxvW8PM3RlyiZ4WsoLmP0sKoHnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078700; c=relaxed/simple;
	bh=FjtLU2kEJ5rUZr7z63tUdKeRScr3aSkXWMunHn7KJUc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=hNTKbCXCfC9axG0kYNBB1hTuZBDetPVJ73g9s1XJSXdpZrLYWNVLhVB/cvlyKPKLS6uSvaBmyd16bcmUjuBBcidLDxHT+VQgHZmHxyUrRXOflJBY0H7AgKoD6/ho2k0Rkap0BieGNb4fpatDQyeirYJqOdUTfDrvGPrjs9wuDyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rALJ+gUC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=faQSkV3v; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rALJ+gUC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="faQSkV3v"
Date: Thu, 15 Oct 2026 15:37:55 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792078676;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3unRgOj/RPm5HMzqvFQhBVoE4+Muue5pDaRXoDAz0Ko=;
	b=rALJ+gUCkf4cA8QSgwtNbZcQfx0d5G+PtakJv8ReUFwKYRgGHG3EbH/REcUItXKmr7h+xk
	HTAB0PWdg6FvgglYEmgPHqX5s6cQqexz4BfR5XW/7FfU/GSYosnA93sja+MsE8TrWvzfC7
	C3ZNqHQtDFoJXGRpAwlhLj94lzUt0yqap0SWa3p6hx0XeM2YdJHeMBFt1+HKiAlJN4miiZ
	Fr0+ynDlcH5IwO3BMA9Dtq+37F69323ic696B3oGx/AIJ51sufwntS06ZlEhqrYhFhzoyK
	bvUkmwHW8HCDSf9SUyURC3estV8mQibfRr3deO9M58e1U7ioNGAyd2bGxYAOCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792078676;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3unRgOj/RPm5HMzqvFQhBVoE4+Muue5pDaRXoDAz0Ko=;
	b=faQSkV3vWmmmd2EnEArykcJcdT06c/wanW6PRSEzscvuoIzUcHM9T8pLTPx8ZB4HJAobJC
	/rviNy7m04fIFVAA==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] vdso: Move the kernel-side time update helpers to
 a new header
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <20260909-vdso-asm-generic-vsyscall-h-v1-1-63ae856cc659@linutronix.de>
References:
 <20260909-vdso-asm-generic-vsyscall-h-v1-1-63ae856cc659@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179207867512.2666988.11615034822149571441.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     35f0a96848a730495ff310645387578ca68934cd
Gitweb:        https://git.kernel.org/tip/35f0a96848a730495ff310645387578ca68=
934cd
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Wed, 09 Sep 2026 10:51:14 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 17:33:18 +02:00

vdso: Move the kernel-side time update helpers to a new header

The vdso/ header namespace is meant for symbols which are usable from
vDSO userspace code. However vdso_update_begin() and vdso_update_end()
are only usable from the kernel.

Move them into a new header in the linux/ namespace. Also rename them to
make clear that they are only for time-related data.

Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260909-vdso-asm-generic-vsyscall-h-v1-1-63ae=
856cc659@linutronix.de
---
 MAINTAINERS               |  1 +
 arch/s390/kernel/time.c   |  5 +++--
 include/linux/vdso_time.h |  8 ++++++++
 include/vdso/vsyscall.h   |  3 ---
 kernel/time/vsyscall.c    | 15 ++++++++-------
 5 files changed, 20 insertions(+), 12 deletions(-)
 create mode 100644 include/linux/vdso_time.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 72294dd..879089f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11064,6 +11064,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
 F:	include/asm-generic/vdso/vsyscall.h
 F:	include/linux/vdso_datastore.h
+F:	include/linux/vdso_time.h
 F:	include/vdso/
 F:	kernel/time/namespace_vdso.c
 F:	kernel/time/vsyscall.c
diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
index 2b989be..161628f 100644
--- a/arch/s390/kernel/time.c
+++ b/arch/s390/kernel/time.c
@@ -39,6 +39,7 @@
 #include <linux/gfp.h>
 #include <linux/kprobes.h>
 #include <linux/uaccess.h>
+#include <linux/vdso_time.h>
 #include <vdso/vsyscall.h>
 #include <vdso/clocksource.h>
 #include <vdso/helpers.h>
@@ -527,7 +528,7 @@ static int stp_sync_clock(void *data)
 			cpu_relax();
 		rc =3D 0;
 		if (stp_info.todoff || stp_info.tmd !=3D 2) {
-			flags =3D vdso_update_begin();
+			flags =3D vdso_time_update_begin();
 			rc =3D chsc_sstpc(stp_page, STP_OP_SYNC, 0,
 					&clock_delta);
 			if (rc =3D=3D 0) {
@@ -537,7 +538,7 @@ static int stp_sync_clock(void *data)
 				if (rc =3D=3D 0 && stp_info.tmd !=3D 2)
 					rc =3D -EAGAIN;
 			}
-			vdso_update_end(flags);
+			vdso_time_update_end(flags);
 		}
 		sync->in_sync =3D rc ? -EAGAIN : 1;
 		xchg(&first, 0);
diff --git a/include/linux/vdso_time.h b/include/linux/vdso_time.h
new file mode 100644
index 0000000..6d81ee3
--- /dev/null
+++ b/include/linux/vdso_time.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_VDSO_TIME_H
+#define _LINUX_VDSO_TIME_H
+
+unsigned long vdso_time_update_begin(void);
+void vdso_time_update_end(unsigned long flags);
+
+#endif /* _LINUX_VDSO_TIME_H */
diff --git a/include/vdso/vsyscall.h b/include/vdso/vsyscall.h
index c5c2a2c..29dd4e0 100644
--- a/include/vdso/vsyscall.h
+++ b/include/vdso/vsyscall.h
@@ -6,9 +6,6 @@
=20
 #include <asm/vdso/vsyscall.h>
=20
-unsigned long vdso_update_begin(void);
-void vdso_update_end(unsigned long flags);
-
 #endif /* !__ASSEMBLER__ */
=20
 #endif /* __VDSO_VSYSCALL_H */
diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index aa59919..4b96a8b 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -9,6 +9,7 @@
=20
 #include <linux/hrtimer.h>
 #include <linux/timekeeper_internal.h>
+#include <linux/vdso_time.h>
 #include <vdso/datapage.h>
 #include <vdso/helpers.h>
 #include <vdso/vsyscall.h>
@@ -177,7 +178,7 @@ void vdso_time_update_aux(struct timekeeper *tk)
 #endif
=20
 /**
- * vdso_update_begin - Start of a VDSO update section
+ * vdso_time_update_begin - Start of a VDSO update section
  *
  * Allows architecture code to safely update the architecture specific VDSO
  * data. Disables interrupts, acquires timekeeper lock to serialize against
@@ -186,9 +187,9 @@ void vdso_time_update_aux(struct timekeeper *tk)
  * inconsistent data.
  *
  * Returns: Saved interrupt flags which need to be handed in to
- * vdso_update_end().
+ * vdso_time_update_end().
  */
-unsigned long vdso_update_begin(void)
+unsigned long vdso_time_update_begin(void)
 {
 	struct vdso_time_data *vdata =3D vdso_k_time_data;
 	unsigned long flags =3D timekeeper_lock_irqsave();
@@ -198,14 +199,14 @@ unsigned long vdso_update_begin(void)
 }
=20
 /**
- * vdso_update_end - End of a VDSO update section
- * @flags:	Interrupt flags as returned from vdso_update_begin()
+ * vdso_time_update_end - End of a VDSO update section
+ * @flags:	Interrupt flags as returned from vdso_time_update_begin()
  *
- * Pairs with vdso_update_begin(). Marks vdso data consistent, invokes data
+ * Pairs with vdso_time_update_begin(). Marks vdso data consistent, invokes =
data
  * synchronization if the architecture requires it, drops timekeeper lock
  * and restores interrupt flags.
  */
-void vdso_update_end(unsigned long flags)
+void vdso_time_update_end(unsigned long flags)
 {
 	struct vdso_time_data *vdata =3D vdso_k_time_data;
=20
