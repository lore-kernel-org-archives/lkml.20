Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922462;
	b=atDDmtFdBVdgoatDdw78VfJZjLOreu+0nzVJ3g+ml4aNTIV099JX8eNbaJ52gOBsDCuc
	 RvgiXaeSm+r6x5EQsv9XeCBGrjNXfwkdgevCW0da/miysjwuXnreERCcMPFbdtdgX5iGx
	 idS8XjRBIYmVLT0276UYZ5XKZI1v4SlmSe5dGQKc/ARLyAiJkpRE69UVqeTPWkNNAm2ff
	 NvzsbRw8edrZ7TLkuvrLxWEH0rjCcU1Bi850S5zkElBQyUuWgvjNSiqdioU63W+WkqLVO
	 ez4ZNzrbCr+G10FT7f94ki9BCSwDxRW3ofP6Ps9f33T8bPFqoBW6ysOyG6rgT9a7+qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=tDICajUls+MVU3nlT8BKXeQcBxsJx76UetcWcsPTkIY=;
	b=Nntql0f+WYZL0GL5Hf4S3M5S5bscHiphLE5N8t1qgH9CY5zC5Yy5+H1op+fZXAx0YnX2
	 Ta1OuTRpNg7s7Exhtq8inCW6C1yBmiH3KA777R0s4pvFsTGjX9QH539Wbeh9UTcNiYIoV
	 vO6NaSygPD6FDOK7pmN5Itp/himz1gq1NO1TldjIM9UAgVN6kzIGkjQL48+7xV+OMpN8+
	 YFNSURFpFY2yQ7hFHdk2LC0gJjBmCnux36jswWyFnzMTC2CR6JvJvE8gqNHcHFI+AyALk
	 FU76Hv+tIkyzPPv3i4ON+7jXl0Z/XJtBlcGoxLPZVHvOyie5U1/CF6tnl/Bl2wez1HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pmYE2HT1;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8373E606D806
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8373E606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pmYE2HT1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eaae62796dso729095ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922457; x=1794527257; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDICajUls+MVU3nlT8BKXeQcBxsJx76UetcWcsPTkIY=;
        b=pmYE2HT1PcVqgvrHLgIWEZZ4qCR42Qv5bXVeM0Ng6q3xKckEHuH3f9g9uGfYCn99KT
         SHygWaI543l/yPFyrn/F0fmmf+vYazoCH7f/RyabX1NfE1QWfBh+tr5Vbl5PMVcBCwiv
         QTShbBl5edW/s9FoKS8LQ0+T8pPOC9aQGq1UTcC8X/vX+Vvp/pbwPH0aFYumdy0LK7Mm
         oHUAO0svgUzV3FogLfObgK91My4FlJ4kqk+eleB5xhz1FVypxOV6IK9AOHrN6FoqomWo
         FkjE432E8IR4YXhPER8IJ6hrX5jZYVlvucNTKMVcdszmG8c3wU926rCTXRyR38LULWGR
         J+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922457; x=1794527257;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDICajUls+MVU3nlT8BKXeQcBxsJx76UetcWcsPTkIY=;
        b=rEp9TZBVdENfqkUBNhF2J49Yq7lAqk47g2m0m9Otvk+PiOvXsOpQAIziGxFbttrbxV
         4J/V+8ditC62Z6GmxNoV8tcSa7tr1dscuOlD4Kl/hJRwqSB0oXyKKqXrtgSWATD0X4jU
         oCUBIicmMYUVp4AKazCp9Pe5+R3h8XAmMI3FCdIZ55mEBK+WRUDKykQIH+RrKkoup5Tz
         nfXjMGkzogyy/DAr54MgFQnRAIkFxfK09fvuycdrbz5r0EtZKcVUsi8auVEwNZBcz8fU
         ggSjoLDrQaD0TndpSXUuiGyIA7hfhBu+5uEr9wj+4ifyIgNfTTm2LVsuH+8b1edTLvsY
         5rpA==
X-Forwarded-Encrypted: i=1; AKwUvBwtLsNdXPWxFcgLK01sOPkVfbYkZeXnRN2fcalm8juPh86lHEPC+pNjFkU2WRgTrGm2XJabVYhjK1St1Ac=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LccCU8/qxMcV8bdTm6QS9GmJa55PuZrp1j/VTKo1x0YZP3Ye1
	Vn/q9voppTg38N/U3ad+otV0ry/AXkRkI13em+7TNVtHyirtrZ53W/TuLdH7LwCbzL3BeJw6mpI
	cPY037g==
X-Received: from plby6.prod.google.com ([2002:a17:902:ed46:b0:2e9:6f2c:71c3])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d586:b0:2ed:1df2:8b3c
 with SMTP id d9443c01a7336-2ed40bfdea1mr11999425ad.35.1793922456623; Thu, 05
 Nov 2026 15:47:36 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:48 +0000
In-Reply-To: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=1874;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=IUPFZFhS7USNqKMmulO0C0asUQ2Oci8U479LkW/s9KA=; b=AR5YKEO3dhz9+FQd/gbj96lSfiYyiK9uIPX1gpsBLe2AZJFI3pI8PL/ZgFBfiz3mTltPh4Eqr
 JHjwka7cH0lCTq6KIBdUR42ALzeVAoz1L0b2N2Rzd7iP7yvVyB1wpHE
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-4-2024e8fa517a@google.com>
Subject: [PATCH v16 04/20] KVM: selftests: Expose segment definitions to
 assembly files
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>, 
	Ira Weiny <iweiny@kernel.org>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Extract kernel segment definitions into a separate header for assembly
files.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/kvm/include/x86/processor_asm.h | 12 ++++++++++++
 tools/testing/selftests/kvm/lib/x86/processor.c         |  5 +----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor_asm.h b/tools/testing/selftests/kvm/include/x86/processor_asm.h
new file mode 100644
index 000000000000..713b6bc0aeb7
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/x86/processor_asm.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Used for storing defines used by both c and assembly code.
+ */
+#ifndef SELFTEST_KVM_PROCESSOR_ASM_H
+#define SELFTEST_KVM_PROCESSOR_ASM_H
+
+#define KERNEL_CS	0x8
+#define KERNEL_DS	0x10
+#define KERNEL_TSS	0x18
+
+#endif  /* SELFTEST_KVM_PROCESSOR_ASM_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 7bbc0df49a18..fe56df0c7aa4 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -8,6 +8,7 @@
 #include "kvm_util.h"
 #include "pmu.h"
 #include "processor.h"
+#include "processor_asm.h"
 #include "smm.h"
 #include "svm_util.h"
 #include "sev.h"
@@ -18,10 +19,6 @@
 #define NUM_INTERRUPTS 256
 #endif
 
-#define KERNEL_CS	0x8
-#define KERNEL_DS	0x10
-#define KERNEL_TSS	0x18
-
 gva_t exception_handlers;
 bool host_cpu_is_amd;
 bool host_cpu_is_intel;

-- 
2.56.0.455.g6c5a503b38-goog

