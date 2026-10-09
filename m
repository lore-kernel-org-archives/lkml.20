Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF87E4D8DBD
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547091; cv=none; b=Yxk2rvaycCZeYWnCnUya7Os8LEYy39r/I6Rp/d2c3Aw4KY0JUZnuML94uX4mGXk/hnuaWQysNBopPKVp+Sp/qIIDzsPtqLkfTI6p1UQuwY1i5dy3YIzCd0YmjP/ni5vpJhBJwrNJjfp/rUEj2jyfppxMz9KGaz+m2l76LgH2iug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547091; c=relaxed/simple;
	bh=XDySDTNwX6H1MTJbq+EAvdLRMNrsL7YM7XtuGU4OEnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DQUsCvxE5RILLVRCkji8vHbhbZt78aB6QKYKzStPj4rwjmLyaUun0sLzteRrPjpLFd9EVW2CQzHlkeSAXObcb2XbX5IbUFD3+dH0XafPKcV9KUHvIX158bhj4ffWxtqsQePNzx5vXZROCdK1u5OoaeiBGDODX6VLqX4BxmNY61E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2yPSuTN; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2yPSuTN"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2acc1e170cso660061266b.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791547085; x=1792151885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sckN3jMhSrmNfzGlD10SNVVC7d6wpU51+YncLQdIbpc=;
        b=b2yPSuTN+6NSmjlBmBTjwUtt+AERHP+jhgAqq3n3C2sjlsq+ijos9R2UlsatQgIy9Q
         P1tHWXXC/kkyQThOj46FpwZtg4UsM4UNuIyHS3BWqKkT3MYKykmaWOVP9vsv1q1sOfSd
         KR3E3yAqwhC4/RBYX2EVNsSGPcOlppAmZesY6RRFqtr4mxQLzYAODpAip/2CzWBw7Izs
         3i9TXsyMQmWosx+mRHVn1c3WbXyI/NthQ41fR4Ltzbhw8ADhMh1IMn7nIBmFuSapiV+Q
         cZHYaMtcXsiDLM6ObEE+QyI9A5R5zarBRaUr6ai71n4+jhtpriDRXRMl0uz0BA/seSWM
         0X4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791547085; x=1792151885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sckN3jMhSrmNfzGlD10SNVVC7d6wpU51+YncLQdIbpc=;
        b=z4I9v2G71StQw3QaUb5NuY4DlNumatbKFrsiRXfnpzgFdiFWZ8oDYTVIO4J3gEopeH
         0sw2IJug2pVEgdL0mslonvHmivIENBM420BoAZDslZJf5ubE5EBf2gSyqJocc8wOvTul
         WRU9AcJYP1mrV09fWAmKXHbqWywG4ZIT5IsHV8Z8ESOle98W2HbysPaXUq6U7KIay29o
         PuOtjduQpyhUWhFZ5LaC1EbzodYq0U/UA4BWy9tNpECWtGC9tAmMMHRMQS2LAKILMx0M
         JemAXWpa3bl5vsuJ+zrzFzUA//2GuSQ7lpr6YMWskTUF+KNecwSyBlntMlFJk+bVlWxw
         JDqA==
X-Forwarded-Encrypted: i=1; AKwUvBzRvBWty298EPeU3GDu1WfMMlEQJTt6zrC7FFkPiK8dPwKwczUpCCJHFgPvwBFCrQ0FqNIY6cOpi/DSndM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI41Uh/gN1hRqZ313wc4JQdLQtxd+FmviwhcyK0nMwxf5zeYaJM
	M+jeUjN25lzugQejw7zmP5RdzofCDz7Hlp5cxBeDV6s6FyquQrmX6woAzFt9CUpb
X-Gm-Gg: AYBFou0Rp3L140SgN2YiBx1E4+uFwGMcqRVwodVuoIRBKPxt3K/UXH463Ddh8Mwk22L
	dgWqyzLG/R28v7HW5iFO6M138Rykpng8hnw8vwaPbwr85C0e1U4IkAmLkUmiGQtO9vItvy2lAcn
	3c+eomRE/YKBuuX/v4zhjD1xXqoVleXFqDBEOvXmGV2KPmpBE/4vZA5+5HHvtnSqIqf/clVoSzz
	vzAUx0JWqs5OwWe2DeZnb0OcfiNvm7K3rL/nOJ8/UYmsepYnlIVKwJQByV2/Qoatzxj4VYc9f8Z
	Ha+Uu02aK0UhlpuFCcOFEfX/Wr84pDxgFZvY4j2ffNm3mlpqHbPh3zFCJwvBYHC9sVpejK8GhtA
	+xquuD2acnlR9xqY7cADBS6IAPbqwR4Izt8Jrdk0j3nMok4S14PnxoxZzlJ0Jj90ePH1lCVRsE2
	d5iGp+vhJPKISu1Vaa0vhRrWo94dewxEPyM7PJ5wrfX3JjOFFMAB3s4LW8GvZwxVUWcXRSfjdUM
	gozQopL99laQydneHzOPghcipjxMYsgjVv3fcCJ
X-Received: by 2002:a17:907:948f:b0:c31:9a1c:de76 with SMTP id a640c23a62f3a-c31a9fd424emr175988566b.14.1791547084622;
        Fri, 09 Oct 2026 04:58:04 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31aa825e4bsm78525966b.9.2026.10.09.04.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:58:03 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v5 1/5] alpha: move Tsunami machine check handling to err_tsunami.c
Date: Fri,  9 Oct 2026 13:54:37 +0200
Message-ID: <20261009115627.969047-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009115627.969047-1-linmag7@gmail.com>
References: <20261009115627.969047-1-linmag7@gmail.com>
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
---
 arch/alpha/kernel/Makefile       |  4 ++-
 arch/alpha/kernel/core_tsunami.c | 34 -----------------------
 arch/alpha/kernel/err_tsunami.c  | 47 ++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 35 deletions(-)
 create mode 100644 arch/alpha/kernel/err_tsunami.c

diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
index 4ea5c189e60e..0178f6a5bdb8 100644
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
 
+obj-$(CONFIG_ALPHA_TSUNAMI)	+= err_ev6.o err_tsunami.o
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

