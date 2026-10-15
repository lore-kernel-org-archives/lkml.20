Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6261FE44A;
	Thu, 15 Oct 2026 15:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078677; cv=none; b=c9E0/1Srvji7k2BES9I9lujgWUgLfQHQBgKAAdT98T+jpO/1fvsd4W6vKhZLjRsG3VQ04fe5jCQeIZE3dTX4bMVUycuxPilGpI4oefRBd9kPMoi4xRuxAKcsJByLf0CPoxLI/GKI0IEvLKAQp8rHVF6OS/vNZX/JM06qCy3XwXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078677; c=relaxed/simple;
	bh=8BEjOx18wmfKTCDhmvG9Mx6hrw/g/Q3Ib+CR5F+SqWg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=biWasngBk/EtsMLwrY6uPhMs8vAr+RbrrsP2qm5MQVWAnpwiNicMINZvbTbNo2XZ2eUGE3XRGrOURT7D2v5MRlZz/rIWdrY9zs7VdTMaKrv1ZJa3nQHO8CnRbTuyVOJFIiMQVb96Cyqhcqxrq/0cOuGtVnkEsEVu8pwCFyjAqh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XXmxh3Lb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cchb4ANM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XXmxh3Lb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cchb4ANM"
Date: Thu, 15 Oct 2026 15:37:37 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792078658;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TtfuEk6pwx5aW8YgprkNdmOs1SvTmihnw9ek/qWJXnU=;
	b=XXmxh3LbOaihqAqGw/2u2i/KqZfXt0rZEeS1tCRDZ/Y/RZUS8FSibrJ9BtlxtlU5Abv31l
	/af5Cah3plI+gK+ruyrwFs90qn7sTsnB4TaMNXNtB7ck6Xki3FXFCadlVlJowdElaZ0KOS
	8goLyzymorIj0/oeYP18KUVxGNyHsJNA9x9gc7H+rhgW70z5nTwcpKltqyiu9tvtmcIFFc
	4dFFr4ZfVtQebuwYGRA6AOfsqGiOnwg1ggl+Y2QZ4qeIn0Eco2Y7qRnDy1ZjqhXw8BKcF4
	oi9wvKyX+GtN5RnC3qAavdVLLDGBg8xuseyYHdca1Mk3KyZoC+WzqUyLVS1/ew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792078658;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TtfuEk6pwx5aW8YgprkNdmOs1SvTmihnw9ek/qWJXnU=;
	b=cchb4ANM3+CMd6XPosxv6kIke18PNI6ymlNN6eiDjrQ15tlxMWU4NQ1hVeDolbkT1IRpje
	s++edQ9j8BIKZ0DQ==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] vdso: Remove unnecessary vdso/vsyscall.h includes
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <20260909-vdso-asm-generic-vsyscall-h-v1-13-63ae856cc659@linutronix.de>
References:
 <20260909-vdso-asm-generic-vsyscall-h-v1-13-63ae856cc659@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179207865715.2666988.9422599355640628171.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     d6df494a01351b1b757b7f1f559bcf696d03667d
Gitweb:        https://git.kernel.org/tip/d6df494a01351b1b757b7f1f559bcf696d0=
3667d
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Wed, 09 Sep 2026 10:51:26 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 17:33:20 +02:00

vdso: Remove unnecessary vdso/vsyscall.h includes

None of these files uses anything from the header.

Remove the inclusion.

Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260909-vdso-asm-generic-vsyscall-h-v1-13-63a=
e856cc659@linutronix.de
---
 arch/arm/kernel/vdso.c          | 1 -
 arch/arm64/kernel/vdso.c        | 1 -
 arch/loongarch/kernel/vdso.c    | 1 -
 arch/mips/kernel/vdso.c         | 1 -
 arch/riscv/kernel/sys_hwprobe.c | 1 -
 arch/riscv/kernel/vdso.c        | 1 -
 arch/s390/kernel/time.c         | 1 -
 lib/vdso/getrandom.c            | 3 ---
 lib/vdso/gettimeofday.c         | 3 ---
 9 files changed, 13 deletions(-)

diff --git a/arch/arm/kernel/vdso.c b/arch/arm/kernel/vdso.c
index e306d0c..7be871f 100644
--- a/arch/arm/kernel/vdso.c
+++ b/arch/arm/kernel/vdso.c
@@ -23,7 +23,6 @@
 #include <asm/vdso.h>
 #include <clocksource/arm_arch_timer.h>
 #include <vdso/helpers.h>
-#include <vdso/vsyscall.h>
=20
 #define MAX_SYMNAME	64
=20
diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 592dd86..50596da 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -22,7 +22,6 @@
 #include <linux/vmalloc.h>
 #include <vdso/datapage.h>
 #include <vdso/helpers.h>
-#include <vdso/vsyscall.h>
=20
 #include <asm/cacheflush.h>
 #include <asm/signal32.h>
diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
index 8ce8159..1edc8fb 100644
--- a/arch/loongarch/kernel/vdso.c
+++ b/arch/loongarch/kernel/vdso.c
@@ -20,7 +20,6 @@
 #include <asm/vdso.h>
 #include <asm/vdso/vdso.h>
 #include <vdso/helpers.h>
-#include <vdso/vsyscall.h>
 #include <vdso/datapage.h>
 #include <generated/vdso-offsets.h>
=20
diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index 8165dd3..8eb1760 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -23,7 +23,6 @@
 #include <asm/vdso.h>
 #include <asm/vdso/vdso.h>
 #include <vdso/helpers.h>
-#include <vdso/vsyscall.h>
=20
 static_assert(VDSO_NR_PAGES =3D=3D __VDSO_PAGES);
=20
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 5c440ec..d427d2f 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -19,7 +19,6 @@
 #include <asm/vendor_extensions/sifive_hwprobe.h>
 #include <asm/vendor_extensions/thead_hwprobe.h>
 #include <vdso/datapage.h>
-#include <vdso/vsyscall.h>
=20
=20
 #define EXT_KEY(isa_arg, ext, pv, missing)					\
diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index 9c2f5e4..5666cec 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -15,7 +15,6 @@
 #include <asm/vdso.h>
 #include <linux/vdso_datastore.h>
 #include <vdso/datapage.h>
-#include <vdso/vsyscall.h>
=20
 #define VVAR_SIZE  (VDSO_NR_PAGES << PAGE_SHIFT)
=20
diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
index 161628f..bca65bf 100644
--- a/arch/s390/kernel/time.c
+++ b/arch/s390/kernel/time.c
@@ -40,7 +40,6 @@
 #include <linux/kprobes.h>
 #include <linux/uaccess.h>
 #include <linux/vdso_time.h>
-#include <vdso/vsyscall.h>
 #include <vdso/clocksource.h>
 #include <vdso/helpers.h>
 #include <asm/facility.h>
diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index 6ff4654..e0fa10b 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -16,9 +16,6 @@
 #include <uapi/linux/mman.h>
 #include <uapi/linux/random.h>
=20
-/* Bring in default accessors */
-#include <vdso/vsyscall.h>
-
 #ifndef __arch_get_vdso_u_rng_data
 static __always_inline const struct vdso_rng_data *__arch_get_vdso_u_rng_dat=
a(void)
 {
diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index b867c23..728fed1 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -27,9 +27,6 @@
=20
 #include <linux/build_bug.h>
=20
-/* Bring in default accessors */
-#include <vdso/vsyscall.h>
-
 #ifndef vdso_calc_ns
=20
 #ifdef VDSO_DELTA_NOMASK
