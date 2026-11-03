Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742205;
	b=bohodHZ3FsdU3DZ/uVvi6ufPPlSsR7nvS+D3eh3DnxcsFqEuH8PxfZqIPynXANZRAIaK
	 JfTtaFz/l1Lib8dImLakB3G4YCnJldLdoUQDZuYSpNHIXOgGEI3sujYm+YPdMHov5n1Lf
	 JSqGyfWoc7lNtmXg54vtzR0zdScwpUvQaErbTVe2eXkxN4JUw4ye13gbHo/0pCIb299I4
	 JzPnuGpWV5GZbOI8jd+VIGuOOo3BKBsllGdYWdcnpMf3POegKMHpNxheqWKjQfagTSv0t
	 KiHhIKTdnhfQBlxm9Z/MFZGGASyUXcdx5YOFa1pF5O6v4XfZvhdd7r5L+n1c+BYvd+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=phZqWrY72D5zfdvKPezSUNuebg1PLzdXZPva3nxMKAE=;
	b=K8yOaWinmRV27ZzSQ00xEX9D/k4rV3MldPOU7W9UvG7eBEHIhpHXzrzFqAwkYZSfHCmv
	 0Mn0eDxg/H+dNn3BOmARmBnQRNwEPe6nAFhlG5n3ggq6XK/7LmYQZ2q2EJKx+dCTKhfBq
	 XgDlnyovcPQpwyvhh//H5YRQpY4Hx8ihhI84ugQtDrOO7rEhsFq8u7C5Bs21KlTw3KsS2
	 KMVirnhzHFslJL7luEZKbydY7O4cdY86eYn5YT4rDZLQnrRVnAfPI0J93AKUPldzTN4LG
	 k0pBbnr8cKrLwRScOQRtmx3A1r4cNFLxzTQ663UGBZ1qq1pPAmfB4bpX9HwTG7EXKqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZDmG54c+;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91A2606D801
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E91A2606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZDmG54c+
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so7471447a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742203; x=1794347003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phZqWrY72D5zfdvKPezSUNuebg1PLzdXZPva3nxMKAE=;
        b=ZDmG54c+LQ5k6OfboDVA+TjFiX2IZjaQmH64+coIPokR/vOiTTkf2dJDJAV75ND+O8
         CQg1afduzVGSXbwmB818Xgqqyyii6/yG8vEdYEiIjAIsIW3xt7MS4J8rJjXamT3Id+B7
         nNPvV9rLL/tpW909sfl5ao+u3Vb7XX5q4nCx/9BOtDsdQNfX2/2xQd/rZkhuJ2Ox3jo6
         9UFPc6vvFC6+yS4FHGDBXa88dB6KMPKPOwa4fumCX2jxFifIkpUZPEVdK4riuVzdyzts
         C5FqNH/ilhiBwyqMiGUDP343KtGvB9t4bLP0Ms3/3NLUHvftToAu14DF0DdLTJcaONLA
         HhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742203; x=1794347003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=phZqWrY72D5zfdvKPezSUNuebg1PLzdXZPva3nxMKAE=;
        b=XrU7ezL4cDHoFs/aXbei1FC6vp5ZRVUYKm6SHHrdP8qcz6iO9IayyUeg5Oykb0SaGo
         QrqoH9KqhVHzU71ECS1WdrNwQnr1UFvd5wx1NtNOThRVdre0VFQZLN7IaQzfl7MtFgnU
         idq1TsgRDaNg+DYuMjW0R6v6Ud1OuwnOL0UeWAGPK2G50N3HVDIUEPryJdrzPZuPuviW
         STsTSlpssoVmKGPA0mADpaWnushQYL5reiSnZ5z2b1HwoMIZfCrb8qy5nWkdNl7V4cAd
         B1J+g7OIaisIlyTNy8jZ/7notoW/oS7t3OEfpZabQc6+wTCZOQIZOZgfsMc7UckviOwT
         ssqw==
X-Forwarded-Encrypted: i=1; AKwUvByZhfvZA5h6ij2ykNiyKPbBYNVHkg07zhA0Q4RpDLLmPCkI0vEVVb19zCrBUzv81jwA19ONj//r0KQQ3Ls=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BKoh/HU7c4Qlt2q2K5pIQPD9aHusTXgsBxA+kL7HuaTnt3oHl
	M1+XbhzNDLc79AkhZOpPI3xNeyD+rKmviPAu02O/K6L/aaMephPI/sfd
X-Gm-Gg: AYBFou2FX1n5D1aqDYxds++ncs+0mgya7ffuUJkfUx2rSgOf51IitWnciIkFP2UhRPi
	2zOjDht3RaWOHjShDB6kpV3Cq4pAn7tkL4Mf//onJA+A0jVO0vY/ZZ3XCFmcWD00RFdgn93zaQl
	XwwBDlIl2oSqcAQsBSvHueIJlNvZdQwB7ZGkXdpd00tO6NZenpuymok3cHpO3cUdhk3JsNOMCnT
	SIhU7YY2Z6Rb40sFaLY5bQMWSancDQa5jek2tjXhX3kBr+f04/173AHXdFPaGKbQZR49KjfLPCt
	W/3BO+HVksbA0iVIAXHA+kw2UBYua15JvZgQth92PfsFQUc4bMqAdr8FUKg8N+vDR4hFuJ4u6vW
	XSiLVbceyQCVtndGJZRlOE5oUMW0l6SGrEuj6cHpny+s5Y4QIrwjrxE1OHFYTUHR5AFPPcFiiil
	FYNl/U35IP18r1E/2wGi2kr23jDW+dKVTp1vliNylZgK6noPvI2UwBBkyezPhYpJaKHeSi+ZTAQ
	VLNDXrfpI2CCqMI4eM9DwnV3mnBxOqikJRptHqhvplkg7tO2pYH9xz+AmuSwg+Up6+7V0oHM0NH
	oIT87gxiqM/smxJB/wP90lTHAAxK87Zix5aXkGbRYSlC9EV3JyRE2y26x/gSxcsVmTZAt/Y=
X-Received: by 2002:a05:6402:2348:b0:6b4:d80a:3043 with SMTP id 4fb4d7f45d1cf-6b4d80a3491mr10123937a12.3.1793742203396;
        Tue, 03 Nov 2026 13:43:23 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:22 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 10/14] alpha: use generic syscall audit classification
Date: Tue,  3 Nov 2026 22:35:16 +0100
Message-ID: <20261103214120.1099893-11-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103214120.1099893-1-linmag7@gmail.com>
References: <20261103214120.1099893-1-linmag7@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace Alpha's duplicate audit classes and classifier with
AUDIT_GENERIC. Alpha has no compat syscall ABI requiring a private
implementation.

The generic classifier also makes execveat match execute-permission
rules, as execve already does.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig         |  4 ---
 arch/alpha/kernel/Makefile |  1 -
 arch/alpha/kernel/audit.c  | 62 ----------------------------------------------
 3 files changed, 67 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 19ed083d4f0617218e37a3bac516ec82c5423d7e..014a52e63dec88d72c51c93b3d1c254839ecf33c 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -53,7 +53,6 @@ config ALPHA
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
-	select AUDIT_ARCH
 	select EDAC_SUPPORT
 	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_SMP_IDLE_THREAD
@@ -110,9 +109,6 @@ config PGTABLE_LEVELS
 	int
 	default 3
 
-config AUDIT_ARCH
-	bool
-
 config STACKTRACE_SUPPORT
 	def_bool y
 
diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
index 668556d8496c0c3ee03996cf5a4a0ee56b980891..850f1265cc55db5e0472c37b693dc952bdc75421 100644
--- a/arch/alpha/kernel/Makefile
+++ b/arch/alpha/kernel/Makefile
@@ -20,7 +20,6 @@ obj-$(CONFIG_MODULES)	+= module.o
 obj-$(CONFIG_PERF_EVENTS) += perf_event.o
 obj-$(CONFIG_HAVE_PERF_REGS) += perf_regs.o
 obj-$(CONFIG_RTC_DRV_ALPHA) += rtc.o
-obj-$(CONFIG_AUDIT)	+= audit.o
 
 ifdef CONFIG_ALPHA_GENERIC
 
diff --git a/arch/alpha/kernel/audit.c b/arch/alpha/kernel/audit.c
deleted file mode 100644
index 3ab04709784a225e1a325cd68f8a1fa3865bd170..0000000000000000000000000000000000000000
--- a/arch/alpha/kernel/audit.c
+++ /dev/null
@@ -1,62 +0,0 @@
-#include <linux/init.h>
-#include <linux/types.h>
-#include <linux/audit.h>
-#include <asm/unistd.h>
-
-static unsigned dir_class[] = {
-#include <asm-generic/audit_dir_write.h>
-~0U
-};
-
-static unsigned read_class[] = {
-#include <asm-generic/audit_read.h>
-~0U
-};
-
-static unsigned write_class[] = {
-#include <asm-generic/audit_write.h>
-~0U
-};
-
-static unsigned chattr_class[] = {
-#include <asm-generic/audit_change_attr.h>
-~0U
-};
-
-static unsigned signal_class[] = {
-#include <asm-generic/audit_signal.h>
-~0U
-};
-
-int audit_classify_arch(int arch)
-{
-	return 0;
-}
-
-int audit_classify_syscall(int abi, unsigned syscall)
-{
-	switch(syscall) {
-	case __NR_open:
-		return AUDITSC_OPEN;
-	case __NR_openat:
-		return AUDITSC_OPENAT;
-	case __NR_execve:
-		return AUDITSC_EXECVE;
-	case __NR_openat2:
-		return AUDITSC_OPENAT2;
-	default:
-		return AUDITSC_NATIVE;
-	}
-}
-
-static int __init audit_classes_init(void)
-{
-	audit_register_class(AUDIT_CLASS_WRITE, write_class);
-	audit_register_class(AUDIT_CLASS_READ, read_class);
-	audit_register_class(AUDIT_CLASS_DIR_WRITE, dir_class);
-	audit_register_class(AUDIT_CLASS_CHATTR, chattr_class);
-	audit_register_class(AUDIT_CLASS_SIGNAL, signal_class);
-	return 0;
-}
-
-__initcall(audit_classes_init);
-- 
2.43.0

