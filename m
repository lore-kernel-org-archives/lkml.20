Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.234
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782241;
	b=RdkqJSp2MQmzuL37wAym4cz6oLFMRa8k5lZa60z/paLvww6K6lYqN4fW8zejRUcDQ2ph
	 W/ZAr1DLelqTvdKlR1teX77BHHv5rz9+RoK2bfcEr2mNYBQFfaC/zBp/7G/KwINDQ2aPq
	 LrxeWYwoSJjgTtr80psLN0jy+ts1oOB910edcsVaFmkpm6GzB0Sz8ftBDm3XFe354gVVq
	 mx+L53RO+98UoHG9XiRA27YmKtvKxUTSE/gYxWM8W7MH2UOL4Xz6xR6alc+VLeZLR5ZmU
	 dIxDuqwLQnqNtpRlZS8wcFe78f8FhzEseAZHbySQ6SI+6ybpbTbqD60qckDiiVZuqVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782241;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U2XBWSBfcfQCqve1wrsykzKjay5QUHR6JzVkYSHce1U=;
	b=vNN8GXSRkkOJUfmxSP7MsSmI82ZJodl3bJtNz/m8/2OYA5W9vnBfIrksMfBFZ/KzRyrx
	 s2gZvrZGol/PQoWH7rIjsJ0o5pD4ZveDeEmIEXJvHi7fAo+AXunK+zxOsWsdpKi5JMUTt
	 lqHVDabqYrPzZHkKwUUqhspXPhJSXLPnaTZGAlrm7MU0BjdcRCWsX05gwsnUeTTeSs8lq
	 AzbkgTVRbfYZFDOb85vZOTr/gDvoNRjnjWCgY4Fxw1WL8LGjBrb7FGVbX43iUo/Kh9vXd
	 yKzqZzX9XXNUncqcrn7t73M+SBP0sKNNQ92+IMABC+PlEb611nAWsaSdwHhR8as0yDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nBZAeV24;
	arc=none smtp.remote-ip=95.215.58.234
Received: from mta1.migadu.com (out-234.mta1.migadu.com [95.215.58.234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCAA606D803
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBCAA606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nBZAeV24
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=p3Len8xL7Q9ENP4Ztv32/RbG11wP2iP1K8oXCC/ZeVA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793782239; v=1; x=1794387039;
 b=nBZAeV24BizL3hYLqFVzpAzWVwpnQB4WFabcCIRe7chyqZnK3StyqxSMjPkeruouE9Extzxl
 ffqHVPU/9Na6LfPt0RrBuq9cytahn1YkUwGzeIqTfs6s82XLrv8PD3c0UegGM1VtimLBkDnMqfP
 d0rljpawOHfN6bS/NtQBdQnI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ad119996fe61293c;
	Wed, 04 Nov 2026 08:50:39 +0000
X-Mizu-Trace-ID: ad119996fe61293c
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/16] KVM: arm64: selftests: Add pkvm_lifecycle teardown test
Date: Wed,  4 Nov 2026 08:48:41 +0000
Message-ID: <20261104084842.132944-16-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104084842.132944-1-fuad.tabba@linux.dev>
References: <20261104084842.132944-1-fuad.tabba@linux.dev>
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

Each protected VM holds an entry in EL2's table of KVM_MAX_PVMS (255)
VMs until teardown has reclaimed its pages, so if teardown leaks
entries, KVM_CREATE_VM eventually fails.

Create, run and free twice that many VMs, four alive at once and freed
in random order. Check that each VM's memory survives the others'
teardown, and that freeing a VM drops the process's locked memory by
what its runs added.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/pkvm_lifecycle.c      | 110 ++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_lifecycle.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 68bdd01f62270..214f38e3f67a7 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -194,6 +194,7 @@ TEST_GEN_PROGS_arm64 += arm64/pkvm_host_abi
 TEST_GEN_PROGS_arm64 += arm64/pkvm_id_regs
 TEST_GEN_PROGS_arm64 += arm64/pkvm_irq
 TEST_GEN_PROGS_arm64 += arm64/pkvm_isolation
+TEST_GEN_PROGS_arm64 += arm64/pkvm_lifecycle
 TEST_GEN_PROGS_arm64 += arm64/pkvm_mem_share
 TEST_GEN_PROGS_arm64 += arm64/pkvm_psci
 TEST_GEN_PROGS_arm64 += arm64/pkvm_smccc
diff --git a/tools/testing/selftests/kvm/arm64/pkvm_lifecycle.c b/tools/testing/selftests/kvm/arm64/pkvm_lifecycle.c
new file mode 100644
index 0000000000000..0ee475799abc5
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/pkvm_lifecycle.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pkvm_lifecycle - more protected VMs than EL2's VM table holds, freed out of order.
+ *
+ * Copyright (C) 2026 Google LLC
+ * Author: Fuad Tabba <fuad.tabba@linux.dev>
+ */
+
+#include <stdlib.h>
+
+#include "kvm_util.h"
+#include "pkvm.h"
+#include "processor.h"
+#include "test_util.h"
+
+/* EL2's VM table has KVM_MAX_PVMS entries, and a VM holds one until it's freed. */
+#define VM_TABLE_SIZE	255
+/* Enough that leaking the entry of one VM in two fills the table. */
+#define NR_VMS		(2 * VM_TABLE_SIZE)
+#define NR_ALIVE	4
+
+struct pvm {
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+	u64 tag;
+	size_t locked;
+};
+
+/* Set in the guest's copy by the host before the first run. */
+static u64 tag;
+
+static void guest_code(void)
+{
+	pkvm_guest_init();
+	for (;;)
+		GUEST_SYNC(READ_ONCE(tag));
+}
+
+/* The tag comes from the guest's own memory, so the VM must survive the others' teardown. */
+static void run_vm(struct pvm *p)
+{
+	size_t locked = pkvm_host_locked_vm();
+	struct ucall uc;
+	u64 cmd;
+
+	vcpu_run(p->vcpu);
+
+	switch (cmd = get_ucall(p->vcpu, &uc)) {
+	case UCALL_SYNC:
+		break;
+	case UCALL_ABORT:
+		REPORT_GUEST_ASSERT(uc);
+		break;
+	default:
+		TEST_FAIL("Unexpected guest exit: ucall %lu", cmd);
+	}
+	TEST_ASSERT_EQ(uc.args[1], p->tag);
+
+	p->locked += pkvm_host_locked_vm() - locked;
+}
+
+static void create_vm(struct pvm *p, u64 tag_val)
+{
+	p->vm = pkvm_vm_create_with_one_vcpu(&p->vcpu, guest_code);
+	p->tag = tag_val;
+	p->locked = 0;
+	write_guest_global(p->vm, tag, tag_val);
+
+	run_vm(p);
+	TEST_ASSERT(p->locked, "VM %lu pinned no memory", tag_val);
+}
+
+static void free_vm(struct pvm *p)
+{
+	size_t locked = pkvm_host_locked_vm();
+
+	kvm_vm_free(p->vm);
+	TEST_ASSERT_EQ(locked - pkvm_host_locked_vm(), p->locked);
+}
+
+int main(void)
+{
+	struct pvm vms[NR_ALIVE];
+	int i, j;
+
+	TEST_REQUIRE(pkvm_supported());
+
+	ksft_print_header();
+	ksft_set_plan(1);
+
+	for (i = 0; i < NR_ALIVE; i++)
+		create_vm(&vms[i], i + 1);
+
+	for (; i < NR_VMS; i++) {
+		struct pvm *victim = &vms[random() % NR_ALIVE];
+
+		for (j = 0; j < NR_ALIVE; j++)
+			run_vm(&vms[j]);
+
+		free_vm(victim);
+		create_vm(victim, i + 1);
+	}
+
+	for (j = 0; j < NR_ALIVE; j++)
+		free_vm(&vms[j]);
+
+	ksft_test_result_pass("%d VMs, %d alive at once, freed in random order\n",
+			      NR_VMS, NR_ALIVE);
+	ksft_finished();
+}
-- 
2.47.3

