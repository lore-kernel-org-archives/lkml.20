Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238194825AB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401203; cv=none; b=EWsGyjEYR18DJkgHEPgt8LZOIO0gXVmvlSykGJVPRuDZkGLdHLU0/7Oim7177mdPRlqcORT5kg+MyFAWOYCrcd5ZVV9TzHqg+iu01dtsLgNZx4hBl0AIitD97FVRXtc+5MvyNLlyqMaAw6WaOsDEfZLJCh6YIwOWVzOEC1c8Nhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401203; c=relaxed/simple;
	bh=crM3R9hRHTxMxzuPeb+4LXPev3iRD5Mq5JnkLkFMHiE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i+N2aDPZmsXXOnYMLxlLTdnnN1PAhWmPI7qBB08dVDkmCS052YUy3/f3pY1TabxFsrhn+iZKwKbXCkBxbnGh9pCytIKCT81aIUnFv13a5LHF9X7RuKUSMcDiizp8ZqIQwsx/P6FeHyirvLKpFadedHkNG/FDLjKMYfWrQ+nyuxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ddd62YMR; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ddd62YMR"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8692be1cda4so2841140b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789401200; x=1790006000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yZDlFBVOyLbSIx2cXxBcavLUPo8eOaYZf7Gr8V9kXY=;
        b=Ddd62YMRRTbQ/kWDkmhOG5xakWYXBCs6XOZjLDezh1pkQGApQ3ik+w343au6yOIsMo
         zRhP3pE9KF/rL0Igv+qZ/fBCju2nahW0kPUcifS/9D0RylL/0Yk0NDXS3RlB/tuZPr2x
         jIJf0+JDwipMCY7et+IsJX2TbGbzm2IFmPUA89jkb2jw6f9RxI/CoRHJMekTWnzmZP/X
         3ogjXI7nXhZdpMC+AvOYzTHWU+AKsbydxyQr/+iWMk//1K+UfBieQ3PUyY/wKZpKRE2E
         hxm6eTP6YEz+Koqpg7fkGb1dlprsCqrjlRqoJHPB4OWr09VqQNWcCt4QKqgfDQcVjhXC
         QK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401200; x=1790006000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yZDlFBVOyLbSIx2cXxBcavLUPo8eOaYZf7Gr8V9kXY=;
        b=YHNf9Es09SWN3Ccfjw/4nlNvxu19+Tm96m7iBqBGcY6+VzemLmQy8EZAbc+Whhtnwp
         p5syPBnFI2WDZY0BGFK8BZ9ajblM22xXwMoD5Nb1iDV4ydXMZne7E3Ucg5OK5sNjwXoE
         5GftzRlFQ4raAxrx9Ci4N+AwMIzGbYT4f5RDH+Y1Sp114EH9RMtAgGaQ/kJgtQEkbLu9
         fiwrTWWJSPNHsFe2G4hSGUwknpgl7FSsT2LWE254Fkd/I535M3r7j3zG3IWYOqbVSsjA
         GUK14oUfdJjGmfA/774CrCIUxEesFXgqu0pkqzG1yrEe/G4Cm0N9lahXrIM9osAxVMn4
         rToQ==
X-Forwarded-Encrypted: i=1; AKwUvByJNhAjuYnQkv+a/7pAs07mEJg45qpQnlsiSvFJIjQJXlgBEbcvqhJOG1dGt0yZVhLGY2QxymacuDikW5c=@vger.kernel.org
X-Gm-Message-State: AFuF++nHkHJgcHoV6mEcKFcTVltRJW2SakMAR0gbiKA0sL7PbPHXgBsD
	5OswiCOnv5kM3J+0Tp4dlxqvp4FId71lfvA4YICSdsVAvYe1sxsBuXao
X-Gm-Gg: AYBFou0pLxMdpCgiRczwPT7Lap4B6NRACWwo58N4kR/yAGdJeHwcyB2oskY2y72881S
	pUAn/XoTq3QvN+tXgkAda2zqhVZohdLcTfuBdsb9WzeypS5OZC6DtTzm8EZuWFHkzX/pavR4a3y
	cEJhemHJluonxfGgZq6jN7/GlGA9WKWGpO53nSLCydKw+OCf1QfS/GXAt1T6uDUdbgO1XWaSt+w
	5Qk+DWF6jYgOkAWF+VlLRMR+ootS7/hr8V3GJkIlfkJRTFKdWD9oTQUO0UGkW98XEJFv3gUa62J
	TfHrOys1jQTQcj8iC1YBKl+9twyoY0bjI5tw+s0OSzKebSU5Kfd7eAdCTWGeuGVQRjkBm9Edj2P
	imT+thhIp5CiBNlkPQC6vBpZ77KEPd7wK64+RwcSmVViHLRsLXTm3iBdbqUgXz0su6TM83FZo/g
	n5niYUeoCU+9wLcLrSEv9ga1uxQ/dzCve/Jinfkea2dbcKfpHpo8vcN/7if3E8+dHDMuzG19Hom
	b2i0J/bLfWd/JJxeKIRkxE=
X-Received: by 2002:a05:6a00:2403:b0:864:cbc5:b8c1 with SMTP id d2e1a72fcca58-86f83344128mr6350391b3a.2.1789401200037;
        Mon, 14 Sep 2026 08:53:20 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:f7d8:563c:bb30:8f02])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b6139e3bfsm4767999b3a.50.2026.09.14.08.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:53:19 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH] KVM: selftests: Test partial KVM_CLEAR_DIRTY_LOG requests
Date: Mon, 14 Sep 2026 22:53:01 +0700
Message-ID: <20260914155301.14499-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clear-log mode invokes KVM_CLEAR_DIRTY_LOG with first_page set to
zero and num_pages covering the entire memory slot. But the clear-log
allows targeted clearing. So, the test does not verify that KVM
correctly applies a bitmap relative to a nonzero first_page,
or that pages not selected by a partial request remain dirty.

Add a focused test that creates a memory slot with
KVM_DIRTY_LOG_INITIALLY_SET, then submits a 64-page clear request
starting at page 64 with only bitmap bit 1 set. Verify that memslot page
65 becomes clean while every other host-page bit remains dirty.

Write to page 65 from the guest and verify that dirty tracking was
re-enabled and the page becomes dirty again.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Tested on x86_64 with 4K host and guest pages:
	./dirty_log_test -M clear-log
	PASS
 
Tested on arm64 Rock 5B with 4K host pages, including 4K, 16K and
64K guest page modes:
	./dirty_log_test -M clear-log
	PASS
---
 tools/testing/selftests/kvm/dirty_log_test.c | 104 +++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/tools/testing/selftests/kvm/dirty_log_test.c b/tools/testing/selftests/kvm/dirty_log_test.c
index af5eb0334a74..a12b538c3144 100644
--- a/tools/testing/selftests/kvm/dirty_log_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_test.c
@@ -815,6 +815,106 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 	kvm_vm_free(vm);
 }
 
+/* Use the 2nd 64-page range to exercise a non-zero offset. */
+#define TEST_CLEAR_LOG_FIRST_PAGE	64
+#define TEST_CLEAR_LOG_NUM_PAGES	64
+#define TEST_CLEAR_LOG_BIT		1
+#define TEST_CLEAR_LOG_PAGE		(TEST_CLEAR_LOG_FIRST_PAGE + \
+					 TEST_CLEAR_LOG_BIT)
+static void guest_code_clear_log(void)
+{
+	u64 addr = guest_test_virt_mem + TEST_CLEAR_LOG_PAGE * host_page_size;
+
+	while (true) {
+		vcpu_arch_put_guest(*(u64 *)addr, 1);
+		GUEST_SYNC(1);
+	}
+}
+
+/*
+ * Verify KVM_CLEAR_DIRTY_LOG only clears (and re-arms) the requested range:
+ * with KVM_DIRTY_LOG_INITIALLY_SET every page starts dirty; clearing a single
+ * page must leave its neighbours dirty and must write-protect the page so the
+ * next guest write re-dirties it.
+ */
+static void run_clear_log_partial_test(enum vm_guest_mode mode, void *arg)
+{
+	unsigned long *bmap, *clear_bmap;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	u64 page;
+
+	guest_num_pages = vm_adjust_num_guest_pages(mode, 3 * BITS_PER_LONG);
+
+	vm = create_vm(mode, &vcpu, 2 * guest_num_pages, guest_code_clear_log);
+
+	guest_page_size = vm->page_size;
+	host_page_size = getpagesize();
+	host_num_pages = vm_num_host_pages(mode, guest_num_pages);
+
+	guest_test_virt_mem = DEFAULT_GUEST_TEST_MEM;
+	guest_test_phys_mem = (vm->max_gfn - guest_num_pages) * guest_page_size;
+	guest_test_phys_mem = align_down(guest_test_phys_mem, host_page_size);
+
+	bmap = bitmap_zalloc(host_num_pages);
+	clear_bmap = bitmap_zalloc(BITS_PER_LONG);
+
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+				    guest_test_phys_mem, TEST_MEM_SLOT_INDEX,
+				    guest_num_pages, KVM_MEM_LOG_DIRTY_PAGES);
+	virt_map(vm, guest_test_virt_mem, guest_test_phys_mem, guest_num_pages);
+
+	sync_global_to_guest(vm, host_page_size);
+	sync_global_to_guest(vm, guest_test_virt_mem);
+
+	kvm_vm_get_dirty_log(vm, TEST_MEM_SLOT_INDEX, bmap);
+	for (page = 0; page < host_num_pages; page++)
+		TEST_ASSERT(test_bit_le(page, bmap),
+			    "Page %lu should be dirty after INITIALLY_SET", page);
+
+	__set_bit_le(TEST_CLEAR_LOG_BIT, clear_bmap);
+	kvm_vm_clear_dirty_log(vm, TEST_MEM_SLOT_INDEX, clear_bmap,
+			       TEST_CLEAR_LOG_FIRST_PAGE,
+			       TEST_CLEAR_LOG_NUM_PAGES);
+
+	kvm_vm_get_dirty_log(vm, TEST_MEM_SLOT_INDEX, bmap);
+	for (page = 0; page < host_num_pages; page++) {
+		if (page == TEST_CLEAR_LOG_PAGE)
+			TEST_ASSERT(!test_bit_le(page, bmap),
+				    "Cleared page %lu should be clean", page);
+		else
+			TEST_ASSERT(test_bit_le(page, bmap),
+				    "Page %lu should still be dirty", page);
+	}
+
+	/* The cleared page is now write-protected; a guest write must re-arm it */
+	vcpu_run(vcpu);
+	TEST_ASSERT(get_ucall(vcpu, NULL) == UCALL_SYNC,
+		    "Unexpected guest exit: %s",
+		    exit_reason_str(vcpu->run->exit_reason));
+
+	kvm_vm_get_dirty_log(vm, TEST_MEM_SLOT_INDEX, bmap);
+	TEST_ASSERT(test_bit_le(TEST_CLEAR_LOG_PAGE, bmap),
+		    "Page %lu should be dirty again after re-arming",
+		    (u64)TEST_CLEAR_LOG_PAGE);
+
+	free(bmap);
+	free(clear_bmap);
+	kvm_vm_free(vm);
+}
+
+static void test_clear_log_partial(void)
+{
+	host_log_mode = LOG_MODE_CLEAR_LOG;
+	if (!log_mode_supported()) {
+		print_skip("Log mode '%s' not supported",
+			   log_modes[host_log_mode].name);
+		return;
+	}
+
+	for_each_guest_mode(run_clear_log_partial_test, NULL);
+}
+
 static void help(char *name)
 {
 	puts("");
@@ -913,5 +1013,9 @@ int main(int argc, char *argv[])
 		for_each_guest_mode(run_test, &p);
 	}
 
+	if (host_log_mode_option == LOG_MODE_ALL ||
+	    host_log_mode_option == LOG_MODE_CLEAR_LOG)
+		test_clear_log_partial();
+
 	return 0;
 }
-- 
2.53.0

