Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC08347D456
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198320; cv=none; b=a4uOTr7/fdBvDfL1Z6aSH/kgNmiqxLvqMLeZBVBVtVF284kJ7sLdRdGmzt7meg+VEbvXhnhSSnKlGaF4xQrXrQQQzcDcTCl25bHrB1NYvLPvzR8eqvxZZuxpxSGzQ2qhe2EonYmCHVrRtlUVDDxmY8Yvd9yu5gdpEJ1ITrl2420=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198320; c=relaxed/simple;
	bh=sGWOsmsnvJgZPj1Kjh0LLD9eANshzDa+NV9aemuiw6w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hqpT/Cd9zInrcG3iJYKQtChIATcHwCn8H6Au+/KgURZls8HGEqzbi0Ht1s5tvLNGXti2xsP1QIHGvRp/apOlVB4MSx+CTX+7KB2sK66CyYH8Cdmkj0E9a27PMwVqX8Ynd/Puk1U3GovqGUkSWlzj5ZXyv8YplTTHCRjlExNHTgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DvcnQXMP; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DvcnQXMP"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a0101292baso18251585e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791198317; x=1791803117; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdnPjCTZFRIo6O5MYyfu9npWh/yGUWctau5xv/1z7VM=;
        b=DvcnQXMP5d7MJVrunI+d7eWOod4o5bXaQe90fQgzgOWwwOp8DpRZoMmOR/4NP27NeF
         KhtPnw1VucuI3wJwJ0ByiZ1fnmzS6ghkAG18eb8XiTruRGjWSDMl5b6eiJucK4vNVYlt
         WokgiuVtHC9GMykeym9PcrDFzSfHAY4EUnqnqTKS7JGCCzK7w2G024E7QP0do7oV8GaS
         Lb/5G4ImAltMnQs3kDRsgntwEGYEZqWtqHNuIEp4ChwBzavqg/SOsrSv4gXkyGGylven
         /AdiUEJZ/fUfm5g/yAN1X2wCYe5/xQuJ813n8JCNFJhRnAXeBRIIbCo7ux2yCLtOoWqF
         F7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198317; x=1791803117;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdnPjCTZFRIo6O5MYyfu9npWh/yGUWctau5xv/1z7VM=;
        b=AGwkgEr0htlMDnu7B1Er4ktxrkO54AcQR27U1sK+wmFx4IFPIQXtYXEIKAV4l8vyxA
         cLk2PKSbF6iyujmd8XvSOdBiuGbPjuBynT0IgUGpD3iN3Iv/IHNm0IaBc+aWxhLC6clC
         CW0uq1GabJsf3bta+G9YcuLTNtPu6SHpeWL8UqNSCCDCXJc4KhNmVz+yxAcvresNEjRg
         ZFXVbjkbyH/6xhs8+9yqEVPPJk7IHo1cDCP7y3TYfnZ3eSse9XBFl6L1ChjRtLQzDq2L
         h0z2P7AaBU9Nezx5VJzmEMOssOmKNMNdEQp9W9V/I9XWHqXcUcDhgG84e4ywosIhAPh8
         Yjpg==
X-Gm-Message-State: AFuF++lrvcKw5n1xHWrbwof8LLDpK4WN/4lWdXTBvjMGl2CppPz7tKd2
	Zi750q6djbnEBhKPdUvFS448DT2KuPK0KEIS6bF1qgM+DBRZ1ZF4XEjcP7oTZiutA5ZbOQtZTg=
	=
X-Received: from wmbeu9.prod.google.com ([2002:a05:600c:81c9:b0:4a1:66a7:8b3c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:46ca:b0:49f:fdca:c361
 with SMTP id 5b1f17b1804b1-4a0275790b7mr169835585e9.12.1791198316326; Mon, 05
 Oct 2026 04:05:16 -0700 (PDT)
Date: Mon,  5 Oct 2026 13:05:14 +0200
In-Reply-To: <20261005110511.157016-4-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261005110511.157016-4-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261005110511.157016-6-ardb+git@google.com>
Subject: [PATCH v2 2/2] DONOTMERGE: arm64: module: Test module for BTI veneers
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

This module has a tiny .text section with a static function, which is
called by the module init hook, which is placed in a ~128M init code
section, which is therefore guaranteed to be place out of direct
branching range when CONFIG_RANDOMIZE_MODULE_REGION_FULL is disabled.

When CONFIG_ARM64_BTI_KERNEL is enabled, this forces the use of a BTI
veneer, as recent GCCs and Clangs will elide BTI landing pads for static
functions that never have their address taken, even in the presence of
cross-section calls to those functions.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/Makefile          |  1 +
 arch/arm64/kernel/bti_veneer_test.c | 26 ++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index d2690c3ec528..b74e2dbd2d5f 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -72,6 +72,7 @@ obj-$(CONFIG_ARM64_MPAM)		+= mpam.o
 obj-$(CONFIG_ARM64_MTE)			+= mte.o
 obj-y					+= vdso-wrap.o
 obj-$(CONFIG_COMPAT_VDSO)		+= vdso32-wrap.o
+obj-m					+= bti_veneer_test.o
 
 # Force dependency (vdso*-wrap.S includes vdso.so through incbin)
 $(obj)/vdso-wrap.o: $(obj)/vdso/vdso.so
diff --git a/arch/arm64/kernel/bti_veneer_test.c b/arch/arm64/kernel/bti_veneer_test.c
new file mode 100644
index 000000000000..62c20e960d8d
--- /dev/null
+++ b/arch/arm64/kernel/bti_veneer_test.c
@@ -0,0 +1,26 @@
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/types.h>
+
+static int noinline static_noninit_function(void)
+{
+	static volatile int ret;
+	return ret;
+}
+
+static int __init bti_veneer_test_init(void)
+{
+	return static_noninit_function();
+}
+module_init(bti_veneer_test_init);
+
+static void bti_veneer_test_exit(void)
+{
+}
+module_exit(bti_veneer_test_exit);
+
+/* Make the init code region too big to fit in 128M 'near' module region */
+asm(".section .init.padding, \"ax\", %progbits; .space (128 << 20) - 64; .previous");
+
+MODULE_LICENSE("GPL");
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

