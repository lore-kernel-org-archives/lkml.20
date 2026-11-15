Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732910;
	b=uyTrrwKAyV5YrL4PCpbBt+yA5Ioc1yNDxkQ2QbcljVptp4/tMpJ0mtcZYUHezWt6O52k
	 h9R2HCOYVZC3hDV+N3TSxSOagieQoLSRd/zLJwEZaIswqWyryEVLRoJTAh1iUEzZ/QpiI
	 NfwFd52hh90CQHSeTdKPHtKnyx6nCCgpaRPsW/IQqFvo7SG46tlejDaD5av4xxGtKKafq
	 rmkOv9HdWflxI1WJ5ZDz6DQwhRLfI1/bUBRQobqLI2hmkZPKtghHSsZMe+QjL50YKCrJ7
	 t83e5qvmVeaaV6xB09h6iJ4o0p67Ge4Cn3zPeei9K6wPfQmFXRPwmuLD5/2X7hRgz3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2W9g589hYI/qXRjeFg9GTGFNeMUzzFOuJrEl7Zvx7OU=;
	b=mfjL7DgHkfW4+yL/BWf8Sd48dvbMBQFv3WUq6el0Nc2VOjeAUQOzy/9Xt507yf//R5+T
	 oJYINQ2/ggmwfiA0wU+QdVzDXgSFsKEGjZMcTLEE3M1EW4zF8GWY5CSu/Z7K1Kisz5fWD
	 ApVZKlYy0m8cShNzWhcV0jHV5DTcbveIYASIzKu86uWmutapSWPDkvit19o0GwlAXMTaW
	 Crig6ilfY3WcSSDHGWIwwCfJA44CIN9Lc00P/iXRsPau5qwvFb8EuyQOysgBQ46CTcrZj
	 +v8OkzHsLJ4FefyH6a62B/HUV0/XAmDKaV9UPDn0jD88GLsPblOUbMgkjwsNlTJtHvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="SGeRgf/z";
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00D9606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A00D9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SGeRgf/z
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2e96b8bfb43so7618005ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794732909; x=1795337709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2W9g589hYI/qXRjeFg9GTGFNeMUzzFOuJrEl7Zvx7OU=;
        b=SGeRgf/zTmXTFO/Meao9ef7XXArdfTx4NyVqdNIY9tHGowAM1YFhGCePO7ukhUTHtc
         KsorIap36rJYj+xZ8ecqWCUOkcNPt81shI9WXLvZ8A8hnPSOnDr34sIoOv4Lt00Wz6CZ
         FMG2N6Kp0j6488k2DV5SMxPPgrR6qaxgyRrWLXTM3PulbdXlqFwwSxy11s6MmTnGJODE
         hTym7EYH+wdwCreK/Id6ZuNjACN74YvvsJoMFdq82shwi0u6ZIbuWQuAznKtmdAn0PMH
         4lK10Sxai10BsDEd5NJ6V4HuPYxYw2vg6Lgngx/5OsoMbMzzscc2kSpGvB5C94gPpa0/
         SAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732909; x=1795337709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2W9g589hYI/qXRjeFg9GTGFNeMUzzFOuJrEl7Zvx7OU=;
        b=WU+V8TOkUYibq4FsltWP0e3X+f5l6EOd0jXLvWLW745TOqKA2ghUapnpSulLbc8AOG
         xJhYF0hNyLAdqs9iHaYoKFGoUb6rqOFoQ9AAldR0l3sP0dF9291kc0kz6xPrjK2MsUnI
         924ZRKhDIWenSzXH4g9XT3vNfiSf+ZKo+zRSxmKKVP54JCG/u3AnLPkm6Z2Bl+BmuyJs
         C5gB0W/LAlBy4qLvRQJWFoUXVtrtLmI+Y66MhcgHUeTFF2EpEF0wNP3rNv+a3yLfmly9
         9Go95e50b04gE2VE9COgu9vD2G+XVCRWODw/HRK0PmHRDcvoP3f61su44OPL+v+Jfm0j
         DNSQ==
X-Forwarded-Encrypted: i=1; AL+hErHSAzY1aHspqTgzazCNQ9qau6Ymib7Udujb9+UxKImDXkEzQUCo7F7fTWryS9eGC2Hw2K6vmV/M0MYALrU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4Md7JzDoGYnaqRBGw76CRzVQBgL1Vr6reMlUZ9sLes2e5ActH
	KTh9NwxoeVBIVjFR9YjfO3p8rwgWdoeSg7u34sL2+LUCKevHH5yNFzCe
X-Gm-Gg: AYBFou119zHy/gntr6ZDffVamllK66a0nmSXNopWsVnWsM8N3CEt1/plTRyKJ2eUI8x
	BeDznFN+VH53YlpsRzRccAUyrPKfKhqgdFtAbaneBDM1WsOS6V2gEQedu3u1fgm9lGvB32cs2a6
	8yQPuFHCWR7InPA3uvAOjyiSpATeVgIIt02WfET2RHixxg6tDomP1HaAlGy+rcVwxx6JMrPDjHY
	wvimEDaNgQPhTQlj64pC1O7qjd1KoHPQBD+7GPXOHKpar8GUFv5po3n7Y96KqEw6m5VAJPojE33
	zt1kE2JY4OyN2bhS5FGptLQ2Tu+9sfyzGImOQEYVykuNHu+yFqprc1tH3l9Cv9EOCKM5glzTEZV
	3rOckL9uUNg2xI6CSU+LtRWFuR981e8EbKD5iNrNhKh9CX4VsL/HB3zFC01SExxejRPJ/CqKYq4
	cjpb9VCt40+nlSO0uYrzaRNnxgA6rwX7IjHGLDR0o9TElvO203DYMHC7Q7JyvvUiZEex6fXRG9y
	YWDJqCMGC1wQIQ4ZFl3g8yLebCk1ouzUQPGaCm/V+0N9wyYUWJHcbVg9bPyxyGgCmhL5QpGEhDQ
	Zlb7ujNN11OY577P8W+vTz/KfW1Ca4nn+8jokUt2l7g=
X-Received: by 2002:a17:90b:48c3:b0:3b0:b36b:66fc with SMTP id 98e67ed59e1d1-3b1b0cac932mr7318329a91.63.1794732908821;
        Sun, 15 Nov 2026 00:55:08 -0800 (PST)
Received: from q-Legion-Y7000-IRX9.. ([113.54.187.246])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc160a190sm2879089a12.2.2026.11.15.00.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:55:08 -0800 (PST)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhouquan@iscas.ac.cn,
	shanbeeyoo@gmail.com,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	pbonzini@redhat.com,
	seanjc@google.com
Subject: [PATCH] KVM: selftests: riscv: Test the SBI STA shared memory lifecycle
Date: Sun, 15 Nov 2026 16:54:57 +0800
Message-Id: <20261115085457.889873-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The RISC-V steal-time test checks the UAPI alignment constraints and
compares stolen time with the host run delay. It does not exercise
changes to the shared page after accounting has been enabled.

Extend the existing test to check that disabling STA stops shared-page
updates and that reconfiguring it leaves the old shared page unchanged.
Place the second STA structure at the end of another page and verify
that updates mark the appropriate page dirty.

Discard the second backing page with MADV_DONTNEED and check that a
subsequent KVM_RUN resumes STA updates on the replacement page and
marks it dirty. Read the replacement page before KVM_RUN so that a
stale write into the old backing page cannot satisfy the assertions.

Keep these checks in steal_time instead of adding another test binary.
The test does not depend on a gfn-to-pfn cache implementation.

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: bingyu.xian <shanbeenyoo@gmail.com>
---
Tested with a freshly built RISC-V kernel and KVM module from the base
commit below, running as a QEMU TCG guest with H extension enabled:
  - steal_time: 4 lifecycle checks and the existing 4 vCPU cases pass
  - CONFIG_DEBUG_ATOMIC_SLEEP=y and CONFIG_PROVE_LOCKING=y
  - no kernel diagnostics observed
  - x86 steal_time build also passes (not run)

This exercises baseline STA behavior and does not depend on an STA
caching implementation. The lifecycle checks also apply cleanly to
riscv_kvm_next at 633b3931a87438282d6454646ff40c669a6896cb.

Test logs (verbatim excerpt from the 2026-11-15 QEMU run):
  STA_LIFECYCLE_KERNEL=7.4.0-rc2-sta-lifecycle+
  Random seed: 0x35d6f94c
  TAP version 13
  1..8
  ok 1 STA shared page updates and is marked dirty
  ok 2 STA disable stops shared page updates
  ok 3 STA reconfiguration updates only the new page
  ok 4 STA updates recover after backing page invalidation
  # VCPU0: total-stolen-time=3269800 test-stolen-time=3269800
  VCPU0:
      sequence:  6
      flags:     0
      steal:     3269800
      preempted: 0
      pad:      00000000000000000000000000000000000000000000000
  ok 5 vcpu0
  # VCPU1: total-stolen-time=898700 test-stolen-time=898700 (BONUS: guest test-stolen-time even exactly matches test-run_delay)
  VCPU1:
      sequence:  4
      flags:     0
      steal:     898700
      preempted: 0
      pad:      00000000000000000000000000000000000000000000000
  ok 6 vcpu1
  # VCPU2: total-stolen-time=654000 test-stolen-time=654000 (BONUS: guest test-stolen-time even exactly matches test-run_delay)
  VCPU2:
      sequence:  4
      flags:     0
      steal:     654000
      preempted: 0
      pad:      00000000000000000000000000000000000000000000000
  ok 7 vcpu2
  # VCPU3: total-stolen-time=800700 test-stolen-time=800700 (BONUS: guest test-stolen-time even exactly matches test-run_delay)
  VCPU3:
      sequence:  4
      flags:     0
      steal:     800700
      preempted: 0
      pad:      00000000000000000000000000000000000000000000000
  ok 8 vcpu3
  # Totals: pass:8 fail:0 xfail:0 xpass:0 skip:0 error:0
  STA_LIFECYCLE_STATUS=0
  STA_LIFECYCLE_PASS

 tools/testing/selftests/kvm/steal_time.c | 113 +++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index 82b94a82d..059f7fa60 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -8,6 +8,7 @@
 #include <time.h>
 #include <sched.h>
 #include <pthread.h>
+#include <sys/mman.h>
 #include <linux/kernel.h>
 #include <asm/kvm.h>
 #ifdef __riscv
@@ -329,6 +330,111 @@ static void steal_time_dump(struct kvm_vm *vm, u32 vcpu_idx)
 	pr_info("\n");
 }
 
+static gpa_t lifecycle_second_gpa;
+
+static void sta_lifecycle_guest(void)
+{
+	sta_set_shmem(ST_GPA_BASE, 0);
+	GUEST_SYNC(0);
+	/* The first update takes place on the next KVM_RUN. */
+	GUEST_SYNC(1);
+
+	sta_set_shmem(INVALID_GPA, 0);
+	GUEST_SYNC(2);
+	GUEST_SYNC(3);
+
+	sta_set_shmem(lifecycle_second_gpa, 0);
+	GUEST_SYNC(4);
+	GUEST_SYNC(5);
+
+	/* Userspace discards the second backing page before resuming us. */
+	GUEST_SYNC(6);
+	sta_set_shmem(INVALID_GPA, 0);
+	GUEST_DONE();
+}
+
+static void sta_lifecycle_run(struct kvm_vcpu *vcpu, unsigned int stage)
+{
+	struct ucall uc;
+
+	vcpu_run(vcpu);
+	switch (get_ucall(vcpu, &uc)) {
+	case UCALL_SYNC:
+		TEST_ASSERT_EQ(uc.args[1], stage);
+		break;
+	case UCALL_DONE:
+		TEST_ASSERT_EQ(stage, 7);
+		break;
+	case UCALL_ABORT:
+		REPORT_GUEST_ASSERT(uc);
+	default:
+		TEST_FAIL("Unexpected STA lifecycle exit at stage %u", stage);
+	}
+}
+
+static void check_sta_page(struct sta_struct *st)
+{
+	TEST_ASSERT(st->sequence && !(st->sequence & 1),
+		    "Expected a completed STA update, sequence=%u", st->sequence);
+	TEST_ASSERT_EQ(st->flags, 0);
+	TEST_ASSERT_EQ(st->preempted, 0);
+}
+
+static void check_sta_lifecycle(void)
+{
+	struct sta_struct snapshot, *first, *second;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	unsigned long dirty = 0;
+	void *second_page;
+
+	vm = vm_create_with_one_vcpu(&vcpu, sta_lifecycle_guest);
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE,
+				    1, 2, KVM_MEM_LOG_DIRTY_PAGES);
+	/* Also exercise an STA structure ending exactly at a page boundary. */
+	WRITE_AND_SYNC_TO_GUEST(vm, lifecycle_second_gpa,
+				ST_GPA_BASE + 2 * vm->page_size - sizeof(struct sta_struct));
+	first = addr_gpa2hva(vm, ST_GPA_BASE);
+	second = addr_gpa2hva(vm, lifecycle_second_gpa);
+	second_page = addr_gpa2hva(vm, ST_GPA_BASE + vm->page_size);
+
+	sta_lifecycle_run(vcpu, 0);
+	sta_lifecycle_run(vcpu, 1);
+	check_sta_page(first);
+	kvm_vm_get_dirty_log(vm, 1, &dirty);
+	TEST_ASSERT(dirty & BIT(0), "STA update did not dirty the first page");
+	ksft_test_result_pass("STA shared page updates and is marked dirty\n");
+
+	sta_lifecycle_run(vcpu, 2);
+	snapshot = *first;
+	sta_lifecycle_run(vcpu, 3);
+	TEST_ASSERT(!memcmp(first, &snapshot, sizeof(snapshot)),
+		    "Disabled STA shared page was modified");
+	ksft_test_result_pass("STA disable stops shared page updates\n");
+
+	sta_lifecycle_run(vcpu, 4);
+	sta_lifecycle_run(vcpu, 5);
+	check_sta_page(second);
+	TEST_ASSERT(!memcmp(first, &snapshot, sizeof(snapshot)),
+		    "Old STA shared page was modified after reconfiguration");
+	dirty = 0;
+	kvm_vm_get_dirty_log(vm, 1, &dirty);
+	TEST_ASSERT(dirty & BIT(1), "STA update did not dirty the new page");
+	ksft_test_result_pass("STA reconfiguration updates only the new page\n");
+
+	TEST_ASSERT_EQ(madvise(second_page, vm->page_size, MADV_DONTNEED), 0);
+	TEST_ASSERT_EQ(second->sequence, 0);
+	sta_lifecycle_run(vcpu, 6);
+	check_sta_page(second);
+	dirty = 0;
+	kvm_vm_get_dirty_log(vm, 1, &dirty);
+	TEST_ASSERT(dirty & BIT(1), "Recovered STA update did not dirty the page");
+	ksft_test_result_pass("STA updates recover after backing page invalidation\n");
+
+	sta_lifecycle_run(vcpu, 7);
+	kvm_vm_free(vm);
+}
+
 static void check_steal_time_uapi(void)
 {
 	struct kvm_vm *vm;
@@ -535,9 +641,16 @@ int main(int ac, char **av)
 
 	ksft_print_header();
 	TEST_REQUIRE(is_steal_time_supported(vcpus[0]));
+#ifdef __riscv
+	ksft_set_plan(NR_VCPUS + 4);
+#else
 	ksft_set_plan(NR_VCPUS);
+#endif
 
 	check_steal_time_uapi();
+#ifdef __riscv
+	check_sta_lifecycle();
+#endif
 
 	/* Run test on each VCPU */
 	for (i = 0; i < NR_VCPUS; ++i) {

base-commit: 23c62304dde29abe92013d85910d03a77dada35d
-- 
2.34.1

