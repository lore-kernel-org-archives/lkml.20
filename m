Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479A44AC17E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059850; cv=none; b=XhPWR9TdniBfHzTukh/e3gmrjQ9Dip7MNj6mfPGUAPY7ehgQGzc6+j1jx94HVrUeb/0XcQ1unwX5JnlujBodnS4z/+6gxbgQycpYa1PKbcoOlM/rfRueryGNlYUnWtScBZFqdtLfIZVOo0ET0CtZ89hB2MGvkSWuQkY6rYQYqYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059850; c=relaxed/simple;
	bh=0Dams8yhDKRdt2LapkcleFLfxS6mpwRM4s1oYHTD54s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIF0bK/EPIww4XxytuYl7imGie4xm0JvHYX3HQwtdpHc9aXeZefkHkQnihwHsIdnndMk9Eb/AKXoSw0DAUsyUZVlPcg1NSJNYkFmijFGvji4COMw9KyLEaRzDkk6zdSurCaEg6Lmz/RS78Xtmh06DG4Ik6yFgcwWFu9PE6Oi54M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekV7gGL5; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekV7gGL5"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so295715666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792059847; x=1792664647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjcAwhXe9YAn5uo+Rr2PV+mZ56EMyAKAQzi8CgIvfOg=;
        b=ekV7gGL508Iu6wNHLNY1kbfjkYz75LVA3HrzUgzJSxt7bbcRevCvKcbEIl67+6fgpd
         dxbh68HrDjpV41CnzU0D5dGhI6u93UlHpUuUdgLB8WnWAG9hKGjv2M8XwKg7lF8aEubS
         p8jYP8NZt+VlLM2FER5nPJ1nUzYoCYOBT05DeXtZEnXBt5VjYhRe+MhsYSjL+8SJGF2W
         yUuFs6N5Strw+3Lgiz7Z/ZaMSmdce1okmmOfUx/fH50OCDFp2mgcsn6Z4DssjyoUk9OC
         dQWIpSerh5nQLHb9fspMpI2w8DLYnMLqdhcbHyb/6+RQIeoPTJqFKRs0IIOUPiOEv+n/
         FdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059847; x=1792664647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZjcAwhXe9YAn5uo+Rr2PV+mZ56EMyAKAQzi8CgIvfOg=;
        b=FCXc+gjHDj0mlP95Bi9itfduMwKGM2sNsh2HTlp5IsFRi2tbHIAnwMOZfQdvqpdtML
         WRZymkO2apxL/FcBffUmAtl8EezFNkcOyC+7LpOHJ1FU6WfzDngHt+i5wtlRC981/VoU
         w0dUmmsCMaQkkXE/yotY3KolK40cgPMxEeoMhnDPYliWKMTxulZT2nFx91KG237SfH4l
         T+bgLEvxUTs7G5pulx+0uFKbkijw6QK7mGn8ZDCLQVKhIMcn4EgixFToZKVM9790NoD7
         Wbl71eSlDxw9RnvoKMsNoIFhKdbGM2RHTDncG/7TQjc5v6q0+JVTqKio0v/HY37LvYjY
         iimw==
X-Forwarded-Encrypted: i=1; AKwUvBxCB1zw9ugLPOHgR9DG5YgBaGNmearJwHGGvWfizZfkMX1ThwMFW9tTS/Kq4DUlLRla6QKZETNZ320fEYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxfK14n9I6rLz+Nv1XfnZh9AEQVn0dQ0MHlRyJRfktr50D7G1t
	/PPwA/Hz6/3x6AnIWd3t0lzoc51E6LbLCej+4+D0tTjwbK4mUhgDH9HY
X-Gm-Gg: AYBFou1FPBON9irWqVfPR3qaD0uq+5g9hYIdhnqCtWLIL1dzaAfjHxnyKU0WaDHD3zo
	tp6ZN+iKqp7Njcpazrx9w7LCS8X3+lVSCpSiGONe+6oUoQBe3uT67ekIGIQV8cvbx4oAyBVeRdK
	dFgcFcTUzOk8ozghJn1fBYkJREWx6/DLzkTO2OPnTvEXDrptRegzTv3Su8G0ge8GcygWQKm1QQj
	+Jfn/CAddG1YT36yw30XpK+6Iv5Llq+qKu6lPi5aAzBDsh+4YIJyljSnagKJor/BLaPu9V2rPUR
	f+w1E+ZvRYu/HSQlnhH84fVCDe9GvaMjPUuAj6NhzTfbQJ0Deqb3R9uaPZWvWcemNd1xiudpNke
	CA7vVQ8+Qb83ykCET1r2SpuJnvGY44c0OMXl1emM+dHw9tUh+sbZGLVAaQwO5Y7D16zxYkbrFUN
	3BQL3NIYMZPdC7oZlq8CRKfqIHwDYNQC9XgDw25P8kntfhux9mqx4hibwa8rxur+yDzgmQfQ20s
	lelgTQlZ3LdeIVhtXXgeAX5nI2CtyfwCbA2TNiL
X-Received: by 2002:a17:906:4796:b0:c34:d75b:dde0 with SMTP id a640c23a62f3a-c34d75be9famr1139276466b.20.1792059847402;
        Thu, 15 Oct 2026 03:24:07 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3edab13f4esm108371766b.87.2026.10.15.03.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:24:06 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v8 1/6] alpha: move Tsunami machine check handling to err_tsunami.c
Date: Thu, 15 Oct 2026 12:22:50 +0200
Message-ID: <20261015102353.999695-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015102353.999695-1-linmag7@gmail.com>
References: <20261015102353.999695-1-linmag7@gmail.com>
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

