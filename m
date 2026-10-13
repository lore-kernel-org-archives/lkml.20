Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C3754281D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926164; cv=none; b=lrvGDHa3qYYzO+oaqzD/BIHa6QkjjqpFtc0CmwDDVsg9mPUEQ3ZJm/l4nqbFQI6emfN5CcXxP9/cBBVgWOGi8GAbN2O3nc8pKtCIiPrJfhpdemaDZHk0pqlG+3AiD3hbyZaJd4P/S2RK8h1FHSjuKW1xLjDUBXzT2VM4Hk2n5ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926164; c=relaxed/simple;
	bh=0Dams8yhDKRdt2LapkcleFLfxS6mpwRM4s1oYHTD54s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GAZYPw2ZmOmfzDOfqoauVXDpEYG3uCkGmxct1/oByARZwYX2Z7aeMlqPeohe+w6HWXAv3WTTlce1K7jghmDIAw4X/G159YmWdoCmFh7Iojdefy6SJ1NA5rn0l5D9sfrF26+7jmRXmAPyHCFvMIkouaTp7goSLBy1XFnj7wlqSiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B16pY2p9; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B16pY2p9"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b170129413so526047a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791926160; x=1792530960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjcAwhXe9YAn5uo+Rr2PV+mZ56EMyAKAQzi8CgIvfOg=;
        b=B16pY2p9bgdmMv9oO0SrcHdN4flFbM1AKgFe6nQmvy1qKHE8rkc3IKGskeyRep3un3
         6TQFP9bYoqsg+EAyBT5HSiaVFJOjoXIr+i2T1FNOqBhSvcNcu9v4IR+N6j3pxbg+C/DP
         H+p7yZ50arYJ5kSoO7kHM7puz79tYoz3IdUFVjax3dO/2ZQI4nGfvkt3AuL/878KX9de
         ufqnk1mbCTDdd4XD/5hkPn3RBr7NITOFDufB2cgzg100aaFhVCP67qL4s+d/U7WOYp0o
         Xnl/riAZzzBttc7c79T5XD6179+ys2TRhm2dIknPgpjZtgwD4slVktVMBHXA9syHXK2D
         1XyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791926160; x=1792530960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZjcAwhXe9YAn5uo+Rr2PV+mZ56EMyAKAQzi8CgIvfOg=;
        b=BMBGjZjbe5pGsw3OPMkuklT7FL514MHMMwbiysbuqYd2bbKvESHU8zs9usb9AtubDc
         JXAYzlfSAYbq8iKS6fl3Bkl+IaZoQYLjJGnCeDSG/ygOft2wtx6Pxj0MNpfH8T3gweeb
         Ycw/twDjAqxTgotTvf1ktoWL1QC34shjvlgYpegA4QhrcVFzcXPond2VYotX6rpN3g88
         Pt0K6pEaWUX2UVizNSY8CkA/gyDPEeTT1MGkU5ZvH1Y4tBFUf8v+Q7BmWMTm7cUhiYcm
         kKTUUljtpVMhmaEND0jHzflLCcrZszZzKFdUa4hyM0RqTqZHqOb1yC6geb2FqW6PbAYO
         2Hxw==
X-Forwarded-Encrypted: i=1; AKwUvBzN0rlg+v+ImGz1D2/1h/VHVMq05MUB9bxtrhHiTLkeqaEz7xKd2hbhypMSBNXb7D55k2eDo/KRsb7/Vc4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIm13ldhUjeJQ+jFzTaYmcmqHZX8Wm7QM0w5/BIWA4CVOjwEgiQ
	ghHodWnDs/U67FMTMi5dUi3twlXWrLvuOPnVgqWrWIMVsP401Sv0bTd1
X-Gm-Gg: AYBFou18Syw+9QCbebmsJ+wKCdp/V51nJjA35isj0BiaqDP3HjbQxTogwtRusyuDxaf
	Tbll+/NJyi6ipx8xOKJu8eZUmZWuKGOD2eRFk6vwPjKfztDzvW2G4AXYtGn14ZnB9CEcTYUtCkn
	FhthzWGJp+S98Z4WTV8IykgBQPQ9BnWqcaOBrVCceC1I9yIklA3iqha5IXsYJk8SgLthEG3S8X+
	HRRp6EqT/wDQC7EFt8KL83QQUO29444XxcuZoqK54CVQV+qO3RXgjfw28DbuRDPTPr8PX3SRJzs
	/vCzop2nP79kV4+cmLIH0+J9i1DPgDFCaMr2evcYlCVG98QeKiJ7H83f4PaMDlHSJKH8ohwMkQg
	J6FBsZ/70wHh9v2IuVwqI2NPGJ60V4n/j1adSh9LitOw9g7PqYrTDF22DI5cGD1SQYBQt9BgPkE
	s3vDfX2ajsJWaC3RDmK+qVIFCON9/UMVDFFScCFIXCw09m4p2b8kCVfZpCnAe2oxI7qdWpuP65H
	Y9c78T5vAVpqYDDgnmJGLvlFvoSznsLMUQsnMdQ
X-Received: by 2002:a17:906:794c:b0:c26:19de:913a with SMTP id a640c23a62f3a-c31aa0d1ee7mr1285571966b.45.1791926159965;
        Tue, 13 Oct 2026 14:15:59 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c355555f483sm256776766b.23.2026.10.13.14.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 14:15:58 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v7 1/5] alpha: move Tsunami machine check handling to err_tsunami.c
Date: Tue, 13 Oct 2026 23:15:34 +0200
Message-ID: <20261013211551.991723-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013211551.991723-1-linmag7@gmail.com>
References: <20261013211551.991723-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the existing handler and PCI error clearing helpers without changing
their behavior. Build the error objects for ALPHA_TSUNAMI so that all
Tsunami configurations, including non-generic Shark, can use them.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/Makefile       |  4 ++-
 arch/alpha/kernel/core_tsunami.c | 34 -----------------------
 arch/alpha/kernel/err_tsunami.c  | 47 ++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 35 deletions(-)
 create mode 100644 arch/alpha/kernel/err_tsunami.c

diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
index 4ea5c189e60e..a453e487b9d0 100644
--- a/arch/alpha/kernel/Makefile
+++ b/arch/alpha/kernel/Makefile
@@ -39,7 +39,7 @@ obj-y    += err_ev7.o err_titan.o err_marvel.o
 endif
 
 obj-y	 += irq_pyxis.o irq_i8259.o irq_srm.o
-obj-y	 += err_ev6.o
+obj-y	 += err_ev6.o err_tsunami.o
 obj-y	 += es1888.o smc37c669.o smc37c93x.o pc873xx.o gct.o
 obj-y    += srmcons.o
 
@@ -89,4 +89,6 @@ obj-$(CONFIG_ALPHA_MARVEL)	+= err_ev7.o err_marvel.o
 obj-$(CONFIG_ALPHA_NAUTILUS)	+= err_ev6.o
 obj-$(CONFIG_ALPHA_TITAN)	+= err_ev6.o err_titan.o
 
+obj-$(CONFIG_ALPHA_TSUNAMI)	+= err_tsunami.o
+
 endif # GENERIC
diff --git a/arch/alpha/kernel/core_tsunami.c b/arch/alpha/kernel/core_tsunami.c
index fc1ab73f23de..d435ec9fb828 100644
--- a/arch/alpha/kernel/core_tsunami.c
+++ b/arch/alpha/kernel/core_tsunami.c
@@ -448,37 +448,3 @@ tsunami_kill_arch(int mode)
 	if (TSUNAMI_cchip->csc.csr & 1L<<14)
 		tsunami_kill_one_pchip(TSUNAMI_pchip1, 1);
 }
-
-static inline void
-tsunami_pci_clr_err_1(tsunami_pchip *pchip)
-{
-	pchip->perror.csr;
-	pchip->perror.csr = 0x040;
-	mb();
-	pchip->perror.csr;
-}
-
-static inline void
-tsunami_pci_clr_err(void)
-{
-	tsunami_pci_clr_err_1(TSUNAMI_pchip0);
-
-	/* TSUNAMI and TYPHOON can have 2, but might only have 1 (DS10) */
-	if (TSUNAMI_cchip->csc.csr & 1L<<14)
-		tsunami_pci_clr_err_1(TSUNAMI_pchip1);
-}
-
-void
-tsunami_machine_check(unsigned long vector, unsigned long la_ptr)
-{
-	/* Clear error before any reporting.  */
-	mb();
-	mb();  /* magic */
-	draina();
-	tsunami_pci_clr_err();
-	wrmces(0x7);
-	mb();
-
-	process_mcheck_info(vector, la_ptr, "TSUNAMI",
-			    mcheck_expected(smp_processor_id()));
-}
diff --git a/arch/alpha/kernel/err_tsunami.c b/arch/alpha/kernel/err_tsunami.c
new file mode 100644
index 000000000000..1045b920fa6b
--- /dev/null
+++ b/arch/alpha/kernel/err_tsunami.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Machine check handling for Tsunami/Typhoon systems. */
+#include <linux/init.h>
+#include <linux/pci.h>
+#include <linux/sched.h>
+#include <asm/io.h>
+#include <asm/core_tsunami.h>
+#include <asm/smp.h>
+#include <asm/err_common.h>
+#include <asm/irq_regs.h>
+#include "err_impl.h"
+#include "proto.h"
+#include "pci_impl.h"
+
+static inline void
+tsunami_pci_clr_err_1(tsunami_pchip *pchip)
+{
+	pchip->perror.csr;
+	pchip->perror.csr = 0x040;
+	mb();
+	pchip->perror.csr;
+}
+
+static inline void
+tsunami_pci_clr_err(void)
+{
+	tsunami_pci_clr_err_1(TSUNAMI_pchip0);
+
+	/* TSUNAMI and TYPHOON can have 2, but might only have 1 (DS10) */
+	if (TSUNAMI_cchip->csc.csr & 1L<<14)
+		tsunami_pci_clr_err_1(TSUNAMI_pchip1);
+}
+
+void
+tsunami_machine_check(unsigned long vector, unsigned long la_ptr)
+{
+	/* Clear error before any reporting.  */
+	mb();
+	mb();  /* magic */
+	draina();
+	tsunami_pci_clr_err();
+	wrmces(0x7);
+	mb();
+
+	process_mcheck_info(vector, la_ptr, "TSUNAMI",
+			    mcheck_expected(smp_processor_id()));
+}
-- 
2.43.0

