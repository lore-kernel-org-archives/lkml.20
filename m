Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922462;
	b=r6dQ5ScARg3yC72H3EQv2XyhyTCjSbhi5DmVdSpj31I3Wm1yY/Nqy1DT0FH9vzYvRhPl
	 AyWf8u+bmf95dTpEOBoufnGstLtiHo7K4pRxQgWXRUDORGVtm93Ueg/rLG2ZQVxpU0cSo
	 E+qy2PzRNFWEZNZWQgCEoiUKLLQApy/ArkOXERZQh/BkT5mfyl/heuDJr4lyT2PMvbI3M
	 q/lIRQEN2tXllZp3jh9KNzV+q9MygtLBf5e7mTyFD1e8DHUlve5k9cMZeLoAViPm43TLR
	 l7zlTO17eHqUXgjB/iHEdtf3Rpr1h1jqCiR1d/tkKINqSf1YsOruYQwaL9fhNIlD/zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=/PPvaaBpjQ4LAmKAr/nDM7dyBeUAO4dDwyjQLSk3qhc=;
	b=LUIQNhwiroX8wDWf9dN2fYzkAman+tYf5J1g7ZZEr/9eLa9n0NN48uDPShd/u/xprnUE
	 tVtRYustKYbYzcajnA5vnukD5AzbeiJWD/cGsYNS4rXpc0RyoADK6q6yyMBqtYn8piPTb
	 3c2CcBL2msd70GpQMChvYTy7iiI629tCp9HXR8N+e/pKBMRBZjaB/WNTNbI8caM4mVtdA
	 879SfWwz7+ZEIr5B3W3o0vmmrnNL4GM7DJ/qgQXFQ1vzFax3y94dKiGdAaCQpAkOjVwqO
	 BKcWfl7C8+psTuo5HIrs+3qA7ioTMedKt+5/X/+gv7KXLJ0npuIhfnb+pm5yB6Vn3ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kwrrsis2;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4887E606D81E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4887E606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kwrrsis2
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed05900df7so686515ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922459; x=1794527259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/PPvaaBpjQ4LAmKAr/nDM7dyBeUAO4dDwyjQLSk3qhc=;
        b=kwrrsis2TdRQbzuO1/DyOgFdUSNyKahewAeKlrR0sP3NpWkHpQ96FBgiA/7qUWqEpZ
         QP/sbHTC2vmqOnHNWDUQJuDJhPCugUF2XIzX2n4MB7g04p0nOXcBurJYpN1BsDV2Fp1Y
         inqeEKnEXJNMVETDf2fXFgWvXJF7PfaYxRYVa/S5nCPSw9F/FRVCIS5WxCN3Kpn1d/h6
         1W2KTxpv/2TVFWNNieqlt3lYv3qn96XKIX8Dg/S+FW/3Sz0EGa+50dDjcwRGCqtFCJEx
         VzXtVAYEZGpzDFGMzL4nwvAMJ5XOoAJW8e7VltxLMSadysAeSdJ1uMyDk8hnWF+RVQtV
         fqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922459; x=1794527259;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PPvaaBpjQ4LAmKAr/nDM7dyBeUAO4dDwyjQLSk3qhc=;
        b=pA5/IOfnDrUl1bQ3Q9O4jez4wpqPpCFfuR5ypQU0ce5i42RlCOvNttf8DAdDzqi8ju
         5yoZti66mBjLhyw27P3rT2Zy0PViHvvPbRXTgLk9YWzIB0dMnBpBk5yzz+j6182QOf88
         WMzFHfVinD0KyyuAzPoEfwJRs8UmuGJgKr/lUIVmL3kLHvA4THV4oUnlAKVXft4Wtdot
         g+z1xGDDvw/s9I6hZ144+wdQAuEs22LQes3M7bF/jpNrt78aq7ieh4LTqVAUIwQpWLoL
         A0xu9YvYG0rX6nzdwTyNPZ764UtGRqASLoksIGEPLPi+cxYTdug6Ubj7rMMO8z8DO/mz
         oJKA==
X-Forwarded-Encrypted: i=1; AKwUvBxLKb9/gWUQf2eiFztH5DzBJZPpozTLWsd2ebKcEGI2+iATCgzgdyVeQFs7Bfag+ngoJWyHTnYMyi6ns3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JNmF6zbfSjIaSO+KuM58uzJO0prMslkQWxaX8th3wC4Fto6ri
	iueC/bt7685P9kAguotfoNo0IotaIu5F8Ln1NuEKCniXl7YB3T0vyZl2AIKYKNNptesJor2Gz3O
	dd5/JBA==
X-Received: from play19.prod.google.com ([2002:a17:902:e193:b0:2e9:8ef0:cf73])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3790:b0:2e9:5ed2:c39d
 with SMTP id d9443c01a7336-2ed4197e54dmr12329355ad.36.1793922458497; Thu, 05
 Nov 2026 15:47:38 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:50 +0000
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=8799;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=i5g6AwEjfygxKF6P6L08tk46iH0CXLcawkkL19gl+zw=; b=e1XEKFBub+uWrohxz++XDcHhJRk6KEGax/2IRTj44NrEm7KEOgmYM/iWISCtbyrtppbmheZJI
 K29gxb0CdOmDNVvziYbGtk3aC905kJiLpS0dC8+YxOtAwIOpUupfZSO
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-6-2024e8fa517a@google.com>
Subject: [PATCH v16 06/20] KVM: selftests: Introduce structures for TDX guest
 boot parameters
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
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

From: Sagi Shahar <sagis@google.com>

Introduce `td_boot_parameters` and `td_per_vcpu_parameters`, and export
their offsets to assembly via the kbuild infrastructure.

TDX guest registers are private and must be initialized by guest-side
assembly. These structures allow the assembly code to retrieve boot
parameters and index into per-vCPU data based on the vCPU ID, while
keeping host and guest definitions synchronized.

Use kbuild.h to expose the offsets into the structs from c code to
assembly code.

Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Lisa Wang <wyihan@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 tools/testing/selftests/kvm/.gitignore             |  3 +-
 tools/testing/selftests/kvm/Makefile.kvm           | 29 +++++++++-
 .../selftests/kvm/include/x86/tdx/td_boot.h        | 66 ++++++++++++++++++=
++++
 .../selftests/kvm/lib/x86/tdx/td_boot_offsets.c    | 21 +++++++
 4 files changed, 116 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftes=
ts/kvm/.gitignore
index 1d41a046a7bf..055edc23ce9d 100644
--- a/tools/testing/selftests/kvm/.gitignore
+++ b/tools/testing/selftests/kvm/.gitignore
@@ -9,4 +9,5 @@
 !config
 !settings
 !Makefile
-!Makefile.kvm
\ No newline at end of file
+!Makefile.kvm
+include/x86/**/*_offsets.h
diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selft=
ests/kvm/Makefile.kvm
index e6e81f979bc8..08031ab1825b 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -19,6 +19,8 @@ LIBKVM +=3D lib/userfaultfd_util.c
=20
 LIBKVM_STRING +=3D lib/string_override.c
=20
+LIBKVM_ASM_DEFS +=3D lib/x86/tdx/td_boot_offsets.c
+
 LIBKVM_x86 +=3D lib/x86/apic.c
 LIBKVM_x86 +=3D lib/x86/handlers.S
 LIBKVM_x86 +=3D lib/x86/hyperv.c
@@ -284,6 +286,10 @@ OVERRIDE_TARGETS =3D 1
 include ../lib.mk
 include ../cgroup/lib/libcgroup.mk
=20
+# Enable Kbuild tools.
+include $(top_srcdir)/scripts/Kbuild.include
+include $(top_srcdir)/scripts/Makefile.lib
+
 ifeq ($(ARCH),x86)
 include ../vfio/lib/libvfio.mk
 endif
@@ -300,15 +306,24 @@ CFLAGS +=3D -Wall -Wstrict-prototypes -Wuninitialized=
 -O2 -g -std=3Dgnu99 \
 	-fno-stack-protector -fno-PIE -fno-strict-aliasing \
 	-I$(LINUX_TOOL_INCLUDE) -I$(LINUX_TOOL_ARCH_INCLUDE) \
 	-I$(LINUX_HDR_PATH) -Iinclude -I$(<D) -Iinclude/$(ARCH) \
-	-I ../rseq -I.. $(EXTRA_CFLAGS) $(KHDR_INCLUDES)
+	-I ../rseq -I.. -I$(OUTPUT)/include/$(ARCH) $(EXTRA_CFLAGS) $(KHDR_INCLUD=
ES)
 ifeq ($(ARCH),s390)
 	CFLAGS +=3D -march=3Dz10
 endif
+
 ifeq ($(ARCH),x86)
+
 ifeq ($(shell echo "void foo(void) { }" | $(CC) -march=3Dx86-64-v2 -x c - =
-c -o /dev/null 2>/dev/null; echo "$$?"),0)
 	CFLAGS +=3D -march=3Dx86-64-v2
 endif
+
+KVM_GEN_HDRS :=3D $(patsubst lib/x86/%.c, $(OUTPUT)/include/x86/%.h, $(fil=
ter lib/x86/%, $(LIBKVM_ASM_DEFS)))
+$(shell mkdir -p $(sort $(dir $(KVM_GEN_HDRS))))
+$(KVM_GEN_HDRS): GUARD =3D $(shell echo $(*F) | tr a-z A-Z | tr '.' '_')
+$(KVM_GEN_HDRS): $(OUTPUT)/include/x86/%.h: $(OUTPUT)/lib/x86/%.s FORCE
+	$(call filechk,offsets,__$(GUARD)_H__)
 endif
+
 ifeq ($(ARCH),arm64)
 tools_dir :=3D $(top_srcdir)/tools
 arm64_tools_dir :=3D $(tools_dir)/arch/arm64/tools/
@@ -341,6 +356,7 @@ LIBKVM_S :=3D $(filter %.S,$(LIBKVM))
 LIBKVM_C_OBJ :=3D $(patsubst %.c, $(OUTPUT)/%.o, $(LIBKVM_C))
 LIBKVM_S_OBJ :=3D $(patsubst %.S, $(OUTPUT)/%.o, $(LIBKVM_S))
 LIBKVM_STRING_OBJ :=3D $(patsubst %.c, $(OUTPUT)/%.o, $(LIBKVM_STRING))
+LIBKVM_ASM_DEFS_OBJ :=3D $(patsubst %.c, $(OUTPUT)/%.s, $(LIBKVM_ASM_DEFS)=
)
 LIBKVM_OBJS =3D $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ) $(LIBKVM_STRING_OBJ)
 LIBKVM_OBJS +=3D $(LIBCGROUP_O)
 ifeq ($(ARCH),x86)
@@ -370,7 +386,9 @@ $(SPLIT_TEST_GEN_OBJ): $(OUTPUT)/$(ARCH)/%.o: $(ARCH)/%=
.c
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
=20
 EXTRA_CLEAN +=3D $(GEN_HDRS) \
+	       $(KVM_GEN_HDRS) \
 	       $(LIBKVM_OBJS) \
+	       $(LIBKVM_ASM_DEFS_OBJ) \
 	       $(SPLIT_TEST_GEN_OBJ) \
 	       $(TEST_DEP_FILES) \
 	       $(TEST_GEN_OBJ) \
@@ -382,6 +400,9 @@ $(LIBKVM_C_OBJ): $(OUTPUT)/%.o: %.c $(GEN_HDRS)
 $(LIBKVM_S_OBJ): $(OUTPUT)/%.o: %.S $(GEN_HDRS)
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
=20
+$(LIBKVM_ASM_DEFS_OBJ): $(OUTPUT)/%.s: %.c FORCE
+	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -S $< -o $@
+
 # Compile the string overrides as freestanding to prevent the compiler fro=
m
 # generating self-referential code, e.g. without "freestanding" the compil=
er may
 # "optimize" memcmp() by invoking memcmp(), thus causing infinite recursio=
n.
@@ -390,11 +411,15 @@ $(LIBKVM_STRING_OBJ): $(OUTPUT)/%.o: %.c
=20
 $(shell mkdir -p $(sort $(dir $(TEST_GEN_PROGS))))
 $(SPLIT_TEST_GEN_OBJ): $(GEN_HDRS)
+$(LIBKVM_OBJS): $(KVM_GEN_HDRS)
 $(TEST_GEN_PROGS): $(LIBKVM_OBJS)
 $(TEST_GEN_PROGS_EXTENDED): $(LIBKVM_OBJS)
 $(TEST_GEN_OBJ): $(GEN_HDRS)
=20
-cscope: include_paths =3D $(LINUX_TOOL_INCLUDE) $(LINUX_HDR_PATH) include =
lib ..
+FORCE:
+
+cscope: include_paths =3D $(LINUX_TOOL_INCLUDE) $(LINUX_HDR_PATH) include =
lib .. \
+			$(wildcard $(sort $(dir $(KVM_GEN_HDRS))))
 cscope:
 	$(RM) cscope.*
 	(find $(include_paths) -name '*.h' \
diff --git a/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h b/tools/=
testing/selftests/kvm/include/x86/tdx/td_boot.h
new file mode 100644
index 000000000000..bf2282931d49
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTEST_TDX_TD_BOOT_H
+#define SELFTEST_TDX_TD_BOOT_H
+
+#include <linux/compiler.h>
+#include <linux/types.h>
+
+/*
+ * Layout for boot section (not to scale)
+ *
+ *                                   GPA
+ * _________________________________ 0x1_0000_0000 (4GB)
+ * |   Boot code trampoline    |
+ * |___________________________|____ 0x0_ffff_fff0: Reset vector (16B belo=
w 4GB)
+ * |   Boot code               |
+ * |___________________________|____ td_boot will be copied here, so that =
the
+ * |                           |     jmp to td_boot is exactly at the rese=
t vector
+ * |   Empty space             |
+ * |                           |
+ * |=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80|
+ * |                           |
+ * |                           |
+ * |   Boot parameters         |
+ * |                           |
+ * |                           |
+ * |___________________________|____ 0x0_ffff_0000: TD_BOOT_PARAMETERS_GPA
+ */
+
+/*
+ * The exact memory layout for LGDT or LIDT instructions.
+ */
+struct __packed td_boot_parameters_dtr {
+	u16 limit;
+	u32 base;
+};
+
+/*
+ * Allows each vCPU to be initialized with different rip and esp.
+ */
+struct td_per_vcpu_parameters {
+	u32 esp_gva;
+	u64 guest_code;
+};
+
+/*
+ * Boot parameters for the TD.
+ *
+ * Unlike a regular VM, KVM cannot set registers such as esp, eip, etc
+ * before boot, so to run selftests, these registers' values have to be
+ * initialized by the TD.
+ *
+ * This struct is loaded in TD private memory at TD_BOOT_PARAMETERS_GPA.
+ *
+ * The TD boot code will read off parameters from this struct and set up t=
he
+ * vCPU for executing selftests.
+ */
+struct td_boot_parameters {
+	u32 cr0;
+	u32 cr3;
+	u32 cr4;
+	struct td_boot_parameters_dtr gdtr;
+	struct td_boot_parameters_dtr idtr;
+	struct td_per_vcpu_parameters per_vcpu[];
+};
+
+#endif /* SELFTEST_TDX_TD_BOOT_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/td_boot_offsets.c b/to=
ols/testing/selftests/kvm/lib/x86/tdx/td_boot_offsets.c
new file mode 100644
index 000000000000..7f76a3585b99
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot_offsets.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+#define COMPILE_OFFSETS
+
+#include <linux/kbuild.h>
+
+#include "tdx/td_boot.h"
+
+static void __attribute__((used)) common(void)
+{
+	OFFSET(TD_BOOT_PARAMETERS_CR0, td_boot_parameters, cr0);
+	OFFSET(TD_BOOT_PARAMETERS_CR3, td_boot_parameters, cr3);
+	OFFSET(TD_BOOT_PARAMETERS_CR4, td_boot_parameters, cr4);
+	OFFSET(TD_BOOT_PARAMETERS_GDT, td_boot_parameters, gdtr);
+	OFFSET(TD_BOOT_PARAMETERS_IDT, td_boot_parameters, idtr);
+	OFFSET(TD_BOOT_PARAMETERS_PER_VCPU, td_boot_parameters, per_vcpu);
+	OFFSET(TD_PER_VCPU_PARAMETERS_ESP_GVA, td_per_vcpu_parameters, esp_gva);
+	OFFSET(TD_PER_VCPU_PARAMETERS_GUEST_CODE, td_per_vcpu_parameters,
+	       guest_code);
+	DEFINE(SIZEOF_TD_PER_VCPU_PARAMETERS,
+	       sizeof(struct td_per_vcpu_parameters));
+}

--=20
2.56.0.455.g6c5a503b38-goog

