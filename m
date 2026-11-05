Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922482;
	b=0x7g9TGhSeKBGyOmA73sE8dXMmYhKB91zhUFusBm4gpZRdbi8wyz1xLwbBZaklLSKnOd
	 MQh+DkvT0i4YaVNamTDpg/D9YH2PnzqOg102W5JzoCMLExnh/QjAYSgmXjP9plzkUpmTg
	 kO9TgU/GVpC1qrKxf7cG1JhiZmfFWmXtsGYDyJNm5nTPplSMomuCt5d67vEq4qNJYIi23
	 db2B8qeuOehi9y5iXJhaZ3V9cV9AELvz+VJMeAUAW9R1RZ/n2weGpkq/RGzpmEjID18FZ
	 oAA4MRKx4It0rCG/DRJ1dFNGjl5u0CL2MXDLUdTRkJFBSulDo3YvU6VSIddNJ/YzLeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=3APDwUUBO5Tor+FhWze8o86U6Ry1uRslwxSo4XqrbcE=;
	b=l7xOTajfiJOLNLBXT5O/rq0FQyp1IpR6W2aC97y6F7fuMsfHqScTZbZ2Mw4Iel8Qv+bd
	 NMOw9J0iYh7ONu8rthw3g00NS0ArLcCz4oR+oWOq6QoJNKkkgaHJ0hQ3UpbCjCNFlXk4G
	 jVcsNJbDTst6N+3PURde2dU8/hSjz/cUqXqMBo4U87/0Dv1hHTS2OQurtM/28ksOkaum/
	 a5POclH0qpEVblxohU3pLx8+3wC5Jtugl+lOqj0VncwyT0EWhW/KEHR3/7Kb3hm5F5VUM
	 v+XIsAVW814MHGHzKCbZ8JIbiT+zKedDy7LfZU1KLML0Obh2goJ+U6eCv9C9RqJnPBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SldGp000;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C993360A3823
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C993360A3823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SldGp000
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea71803effso566405ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922481; x=1794527281; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3APDwUUBO5Tor+FhWze8o86U6Ry1uRslwxSo4XqrbcE=;
        b=SldGp000HO5eYKjIRruXFswTpb6V1OGSqMIcrnjFZXW7kUNy/vXs8/Hq4QHe/gd+gg
         Mg24FAXAhzpIVuJ79O4Dzf3JFw6pIuPGwlPmd26hoDR7NqDF25v6hxzw3Ps5/UP/Q90D
         RLU1kI4B+HCifskeaktSTDNt8GvBCNkkEXPIs+iZ1qRhbpIgkIz5241nCzPR0ft75tKw
         NFdBN3ObNvp3o/cfZ09my/dGLRzG+fHQIBxbotX6O07/xsIGQvLX/W86DOaaijpH4j2I
         Craf1CS+CzbIh8gkg5HUA9unt/lDNRlM6yoTWjd6rf6OWUNNUmj3AtvZtD+EP0UvCIk1
         MGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922481; x=1794527281;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3APDwUUBO5Tor+FhWze8o86U6Ry1uRslwxSo4XqrbcE=;
        b=QdlmNRWt9NhP0LzUA9himvisp0vF6vktuWdbMKji2/Zamp3LpHKM18fwrhEjwsK1zU
         wkdO/2z5uzzzP28cBN4pwpxfdSmYyoPF9HHKpOVL8iBdspLTGp/JXNrvxIOqFr+xqZNL
         JxOhh/yEIO/e5D9lr4MoqoRw1VFByeS9/uc0rP0pq6HAinu8TqWONOPj99Gx2vDrPQyl
         Vq/RclHfTF+xSX29pm/0LLQnk7nwrJ5zOaGGE4DtSiYi8XAYC8XxN/60s/ZMlOsC2EPT
         zBOz+6bc6JEKPdC6Z8fiwJmIkvvysscxVEJuNzqpTcHZHXOhFSORzMlkTTKypN23fhSq
         3I4g==
X-Forwarded-Encrypted: i=1; AKwUvBxzG25T5hHtWTglmSD3b5mk4nzz3jUDa9G8S2fuJCqBRkKwbbe96u+TFE+HKqMQVNOqcCd9y6twe3D9VxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lCQnTku6q9cR4SJO9ucINWUeiIfLzHCX+IWuxmevlHOrVmGWR
	ZJ9bPJEwq8rWv0Mid1UGz394DJEk4TO0vi2MmIpjly9/F1qduE3FZyETse670sjpgdVuLaVYuKl
	neegN1g==
X-Received: from plhn7.prod.google.com ([2002:a17:903:1107:b0:2ea:775e:19b7])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ecd0:b0:2e9:9522:ed3b
 with SMTP id d9443c01a7336-2ed40e0f220mr10754625ad.70.1793922480859; Thu, 05
 Nov 2026 15:48:00 -0800 (PST)
Date: Thu, 05 Nov 2026 23:47:04 +0000
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=3389;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=rtaSAm22wUuQqMoCfkhcKnDPwilIcSWfTJAYTINBIKY=; b=q/dD+BNThuDw5f3at4kbEcwCii+6ek0wqsmjTN3LQGQmhXgtKQX6+UCbiVQitmA5mNX1BEa4R
 9z2eYcAE3KgA05oLcdk6QFkljZrZqgcF5VZUP/WWlOV1hgn5CBvSC7J
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-20-2024e8fa517a@google.com>
Subject: [PATCH v16 20/20] KVM: selftests: Add TDX lifecycle test
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

From: Sagi Shahar <sagis@google.com>

Add a test to verify TDX lifecycle by creating a simple TDX VM.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
---
 tools/testing/selftests/kvm/Makefile.kvm           |  1 +
 .../testing/selftests/kvm/include/x86/processor.h  |  1 +
 .../selftests/kvm/include/x86/tdx/tdx_util.h       |  5 ++++
 tools/testing/selftests/kvm/x86/tdx_vm_test.c      | 33 ++++++++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index ab797c8dd497..1ea7b42db22d 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -166,6 +166,7 @@ TEST_GEN_PROGS_x86 += x86/triple_fault_event_test
 TEST_GEN_PROGS_x86 += x86/recalc_apic_map_test
 TEST_GEN_PROGS_x86 += x86/aperfmperf_test
 TEST_GEN_PROGS_x86 += x86/guest_memfd_conversions_test
+TEST_GEN_PROGS_x86 += x86/tdx_vm_test
 TEST_GEN_PROGS_x86 += access_tracking_perf_test
 TEST_GEN_PROGS_x86 += coalesced_io_test
 TEST_GEN_PROGS_x86 += dirty_log_perf_test
diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 4db0c7009876..4c390edb634b 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -396,6 +396,7 @@ static inline unsigned int x86_model(unsigned int eax)
 #define VM_SHAPE_SEV		VM_TYPE(KVM_X86_SEV_VM)
 #define VM_SHAPE_SEV_ES		VM_TYPE(KVM_X86_SEV_ES_VM)
 #define VM_SHAPE_SNP		VM_TYPE(KVM_X86_SNP_VM)
+#define VM_SHAPE_TDX		VM_TYPE(KVM_X86_TDX_VM)
 
 #define PHYSICAL_PAGE_MASK      GENMASK_ULL(51, 12)
 
diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index 67e717521409..cef54d2676bf 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -12,6 +12,11 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
 	return vm->type == KVM_X86_TDX_VM;
 }
 
+static inline bool is_tdx_supported(void)
+{
+	return !!(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_TDX_VM));
+}
+
 /*
  * TDX ioctls
  * Use underscores to avoid collisions with struct member names.
diff --git a/tools/testing/selftests/kvm/x86/tdx_vm_test.c b/tools/testing/selftests/kvm/x86/tdx_vm_test.c
new file mode 100644
index 000000000000..7cdcaf33b585
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86/tdx_vm_test.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "processor.h"
+#include "kvm_util.h"
+#include "tdx/tdx_util.h"
+#include "ucall_common.h"
+#include "kselftest_harness.h"
+
+static void guest_code_lifecycle(void)
+{
+	GUEST_DONE();
+}
+
+TEST(verify_td_lifecycle)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct ucall uc;
+
+	vm = vm_create_shape_with_one_vcpu(VM_SHAPE_TDX, &vcpu,
+					   guest_code_lifecycle);
+
+	vcpu_run(vcpu);
+	TEST_ASSERT_EQ(get_ucall(vcpu, &uc), UCALL_DONE);
+
+	kvm_vm_free(vm);
+}
+
+int main(int argc, char **argv)
+{
+	TEST_REQUIRE(is_tdx_supported());
+	return test_harness_run(argc, argv);
+}

-- 
2.56.0.455.g6c5a503b38-goog

