Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DFB52E05C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699392; cv=none; b=qE2pzf/mivKa0A913Q5k21wV8BtsaTtsc1wYqpL08tU8+t7bYo3leDV43PAeULfcx1qMNRwdDNngN9cXgbWolrlyIjyVhnzSi7kysn5an+BWpZ+gOp00bBHmnbsW+31UXau31bBMCgDQqyW7djyCLKd6KizkWAJPYl+yS5tP0+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699392; c=relaxed/simple;
	bh=at9caQSNlDirzi19HDDan4Y2L3uJCRt9I9RlxktvPA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HVNpwdPCyHktqkMTeoLl4xTy4EskV0s/FO59N/8CvrdwLaKWE/twFK1BrOUgTGhcOycnGQd2pxswTgyE5KUrAtSmePHztNDoaXTjEZHEfsY5BsC3kGWxXMsZCSp0BOaIOVyf11QxfcdyhW0BTTiYVaHO1nVFbMMgHoM7KlfAbdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBR5IXRm; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBR5IXRm"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so2119190a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790699389; x=1791304189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tH7cezq+gJXVplHNKlxZez1fJO97a08MzeloZBiVfiI=;
        b=TBR5IXRmomUpK6uuo+27sfEnZuB9z+QyyX8PQNBGyA9EofMqSFJ4CzTvYilbflTLXA
         YDkJQ5KHZezf3pP9kfsLw6h7c+Yd4wXq/ktDQHOc1T+4De2u5ufNhg8qIKOzPNkJ3cYL
         QXoprhz0+JkE3Tm/YlJQwtsqea+JO6yj4KimQ6qQdPGOb2bI/+/A8eB1+1wxZ13JNTdc
         vy3XSsNm73eWblGUVQapLKtnO7uSEtCeTkzB6XjFfonUv/o5DzePowvWRO1l+87W1kQ2
         wRJFgz0Ukunx3Avf8/n517AgyLENjuSLwpUXVnN/2BLmEZL23W+x2Dz3hvZ9t9wGPhev
         soXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699389; x=1791304189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tH7cezq+gJXVplHNKlxZez1fJO97a08MzeloZBiVfiI=;
        b=pCoy4WRQxEnvChWsTX/1A5OXILPoSghkk1xDpwdyP6QhcMFBxqS1tUmQ4/GP/Y5Wny
         iYE59tudMh6BAnw+VcuxhDZnW76apGTud/bmNb2RFdRJKVoLskWPg8P64/eUJUQ8JExV
         xeqi4vAGYFVlVOomODy0MeYANtXf8CicWZAdOTh1cgISBgnK1hYfB31EXyahDeGvsSLZ
         GFmc+EHWNHbS9vLwt8OE1I94NjqsBd0fHdDOlP0BzdO+6E6zWuP56XuhcNn2KL4NiMak
         lmQ+jqM5taflBSJd0nfLBEf6SKudcYH8xoIosypP6v1/c46IFkWTds3FMR5CnDoD/miM
         9mAw==
X-Forwarded-Encrypted: i=1; AKwUvBxJaDVMX+OaLqDquzCbC/40AX1Ju7NcbgAeUulIIL2mGVP2YziWXps/dZk7XW2OJPYh/wsBPJwYOldVSh0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3MvWLOx1zevk5l3wF+utZ9BLDZWfwQqvLEXU797Yq8/yODU7z
	EKz+9JcOVn6Wcc/8nlDGOPXT0soaCnlvknz+foBOxIfdUfhaxvEjdeW4
X-Gm-Gg: AYBFou1fOH7Q45Ii2wkL+ZxEE/UBUg4bENRc1L3JoheBD1inX5JXMtxBO3uiQO5XHrL
	oL+VJLlKm2R80ynI478fBvl0mzwITezsDVhL78sqED50c91QOQrdSaC+1boCBsdyAFLx8lS7Dxu
	hSFiZy9pLzSkWKHKWIou5GzNvS83eAUwAFHfpb/8S/VsrbJ1XWJiY8vFnfX1KKPCbMnX0QXFoik
	j31ccrb4ZbB4dcbVBQMqkTA3W5IAxDQGogVN0dIFBFVa1HZmCaCkiFyRKgTRKFbHCYfkrJZ+4iI
	F209mePO/74dngzwGiUn9iC6eatYbBHgF0r6aksxqZOpXCDxgcl+mcUizUGWZaXb4bjoHdWYf6S
	O9jXSj78f+lbwq69qGnocdsguaHByKM4+1Qn5hdGIcjV2ai1/xJ9DcoNbSmjRpGNs6ROPDLJ/Og
	gdM7yNzJzop0BFD/eC9H0i5WoMn7Q3jZ2tZjRDU6rXgRZb071yHuSnEVPn6Nnupk88MNRfVVFeI
	cQ2z+jSp4UNrrv0nk5wQA==
X-Received: by 2002:a17:90b:2882:b0:3a4:b8fd:5d67 with SMTP id 98e67ed59e1d1-3a4b8fd5e29mr379785a91.50.1790699389050;
        Tue, 29 Sep 2026 09:29:49 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:8c3c:36b:3374:1c96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497ecef67sm6481678a91.6.2026.09.29.09.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:29:48 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v2] KVM: selftests: Verify KVM_MSR_EXIT_REASON_INVAL on non-canonical FS_BASE write
Date: Tue, 29 Sep 2026 23:29:40 +0700
Message-ID: <20260929162940.14610-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The msr_filter_deny test covers the FILTER and UNKNOWN MSR exit
reasons, but nothing exercises KVM_MSR_EXIT_REASON_INVAL.

Have the guest write a non-canonical value to FS_BASE and verify
that the write exits to userspace with KVM_MSR_EXIT_REASON_INVAL along
with the attempted value.

FS_BASE writes are passed through to hardware, i.e. a plain WRMSR
takes #GP directly without exiting, so use forced emulation to route
the write through KVM.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
v2:
 - Use a write of non-canonical to FS_BASE value instead of 
   reserved EFER bit 63 because writing non-canonical can't 
   become valid without massive architectural changes unlike EFER reserved bit
   (suggested by Sean).
Tested on Intel Core i5-10210U (VMX). Not tested on AMD.
---
 .../kvm/x86/userspace_msr_exit_test.c         | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c b/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
index 2808ce727e5f..40b084cba2c0 100644
--- a/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
+++ b/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
@@ -309,6 +309,14 @@ static void guest_msr_calls(bool trapped)
 	/* Invalid MSR, should always be handled by user space exit */
 	GUEST_ASSERT(rdmsr(0xdeadbeef) == 0xdeadbeef);
 	wrmsr(0xdeadbeef, 0x1234);
+
+	/*
+	 * Writing a non-canonical value to FS_BASE is rejected by KVM, but
+	 * FS_BASE writes are passed through to hardware, so force emulation
+	 * to route the write through KVM and get an INVAL exit.
+	 */
+	if (is_forced_emulation_enabled)
+		test_em_wrmsr(MSR_FS_BASE, NONCANONICAL);
 }
 
 static void guest_code_filter_deny(void)
@@ -627,6 +635,13 @@ static void handle_wrmsr(struct kvm_run *run)
 		TEST_ASSERT(run->msr.reason == KVM_MSR_EXIT_REASON_UNKNOWN,
 			    "deadbeef trap w/o inval fault");
 	}
+
+	if (run->msr.index == MSR_FS_BASE) {
+		TEST_ASSERT(run->msr.data == NONCANONICAL,
+			    "MSR_FS_BASE data is not NONCANONICAL");
+		TEST_ASSERT(run->msr.reason == KVM_MSR_EXIT_REASON_INVAL,
+			    "MSR_FS_BASE trap w/o inval fault");
+	}
 }
 
 KVM_ONE_VCPU_TEST(user_msr, msr_filter_deny, guest_code_filter_deny)
@@ -667,7 +682,9 @@ KVM_ONE_VCPU_TEST(user_msr, msr_filter_deny, guest_code_filter_deny)
 
 done:
 	TEST_ASSERT(msr_reads == 4, "Handled 4 rdmsr in user space");
-	TEST_ASSERT(msr_writes == 3, "Handled 3 wrmsr in user space");
+	TEST_ASSERT(msr_writes == (is_forced_emulation_enabled ? 5 : 3),
+		    "Handled %u wrmsr in user space, expected %u",
+		    msr_writes, is_forced_emulation_enabled ? 5 : 3);
 }
 
 KVM_ONE_VCPU_TEST(user_msr, msr_permission_bitmap, guest_code_permission_bitmap)
-- 
2.53.0

