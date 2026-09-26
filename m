Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4396640680A
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790419466; cv=none; b=XYSLPnv0YeILjxc73CS2dE0oFrMV2Wx7bibz4cb7ny38dvUt7C6pYPCy2eFTnWI3O4D7bDa+v5Y9nC+7yBcNQNQOKwIWACqicBBdSAnetGwpHvqI5w0w0tZie1ZsU9kRjSy8zYn4RVnLT6rbo45/n/7KiDJrMgEzhnvrL5CSqNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790419466; c=relaxed/simple;
	bh=6fpG91MXXQbhpol2AXqdF9dFywJtNWGjaLWU4oYG/WM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B99+L/6Stl9KuedBuu6RF5qZ4ngwKA+1iD7Ev2CfzpnNYVbGwVXiYhMePA2YXfJjf1DLd0pHvyAF9cKFsb7ut66ZGIMUSUdgYnadHAXaRpZUVcnm9qVw0gxhBzYZtIr53s9hsS3zXyQNmie1B72SuwH7maQR7+XvYCGdM19WIqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpPyjpE0; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpPyjpE0"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so881232a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 03:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790419447; x=1791024247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4odAGIPcyvnNWb4sPZdqKZBZfrGmbPznm9W/871R/J8=;
        b=gpPyjpE0W2/iAPPLe+T0ZBxcdXnLLgAw1ptx2Wd0eimx/Qx+jhrLJA/kIW5WXrtBpw
         HJ3Z+MKM3PTMOHNdvsKT4CvHd5nsa2IB7/Ro1rtHcoi3CTaLE/JLu1xdTMx1p7lSaliZ
         rs937LRjezREoomDOuciwdlR2SrefkeBkdyxWPH2GIF7jezpSc4oeL/FWTrpZYM6jwFI
         jQ4jO2RNovidbMbmE9i9IU2M+E0TYlD6u33L11AjuooVU3IvBFI+WvMY6nhM+8dGq8pR
         NhFpHgGxptetU7j+vay1tc3dau86ZnSuSoyCQCVH4gnC5zha+iEP2cI3GKO2huFyjAK8
         K9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790419447; x=1791024247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4odAGIPcyvnNWb4sPZdqKZBZfrGmbPznm9W/871R/J8=;
        b=fk9gIF1LhL2Uhu/nI1Lv7tN7+xx4IgEBzgc83bH3Nt/X3j6ooo7gFyf7yDeRVWptLK
         k3sn6NvCoYPZmUf99iI9jutvtO2Z0SnljMpK6JxTf1ASjG+0NMO2KZeAAb0eJZscxV4t
         mLbYRQDpPx08cn/hYucFCXyr9jHVrdRDFYfrXqH3VYhHhptPkr3Jh3zr4BB2/qhUrpC6
         wqvJU4suLV+1GBgliDeLHnfDnPxb+PXVwE5A+MTFc4yhOD141jH/Li991CLq+mfuqSyy
         fyWOGQXH1tLBMeN+M7dAuoj+HzpsvrqOeVrlgedaJhX8dco4caO/f3yRFX+Ih/yoj0L2
         ni8A==
X-Forwarded-Encrypted: i=1; AKwUvBxS4On90MiLLYIVNgRuvz7LZgcGHTI5yiObijJihFpFmAK5eOeayuOAyK8ORWWqr9UKZOm+uT05fmShqpA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSB+xZ1+iK0N4j/f48i/bZq4PAOarkkxFgrm0S5Q6dnZcEJHwv
	86t+9Yr4w3GR45IXEU40AiIr/PKhPQpUog4PiPfGUqcV1RTX/JmaYl3F
X-Gm-Gg: AYBFou2kB0c8RYLAtxfoixcFfcnxubRfaLV+A3jQP4mY8SeW/x+N2pkXDW7Oz1HXN6E
	BUNUAq3M4GpJbMjfe6OU5g2C9RhEQ4MR60eWMC2Q+pb+L1zzzYxM1wgNiCmt7bD2nvopQes1wNZ
	0A+EHo+SRiAHEs3FjAtf1eOV1YDXTPlNRlSPtgFrIDbl3YK9h0o8qyJPgBxbLhvVMSsi0lWGU3B
	TyWR3TYI5hWsJNoIyTcq32dxltwQf0hlhiRi0LRb2HwJre1FZ1hCSncXVtGIV/qHgVFBV9iFRl/
	bpWi/2ZIgX3zRyf/mIQPBID+jMFFnhM51juBkYMlxSGYIDwo1b6MMQWdvs/GnS+99AUjKKKT+an
	2KzX4I9Pd3mImghy0IrxbDoOBnTArAPx6AZhTCKgZSRdBAcst5VafhdH7kb+61/oO999wBVPsCA
	9giY8yslHIlpMdkWcZEhSZNtg7mhwK2BjnrYHqwIM9JhF8nohUcRG59kudELkuuDdxPCXfLHXW5
	0GgHeGuFicINedLnRt0jaoooQ37RwXYKw==
X-Received: by 2002:a17:90b:1f90:b0:39e:6c69:f47b with SMTP id 98e67ed59e1d1-3a098d4085dmr7176558a91.58.1790419446869;
        Sat, 26 Sep 2026 03:44:06 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:819f:6ccc:5ca5:5f73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec711sm15800578a91.6.2026.09.26.03.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 03:44:06 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH] KVM: selftests: Verify KVM_MSR_EXIT_REASON_INVAL on reserved EFER write
Date: Sat, 26 Sep 2026 17:43:55 +0700
Message-ID: <20260926104355.13697-1-tharitt97@gmail.com>
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

Have the guest set a reserved bit (bit 63) in EFER while preserving
the other bits, and verify that the write exits to userspace with
KVM_MSR_EXIT_REASON_INVAL along with the attempted value.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Tested on Intel Core i5-10210U (VMX). Not tested on AMD.
---
 .../selftests/kvm/x86/userspace_msr_exit_test.c      | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c b/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
index 2808ce727e5f..7446e1404264 100644
--- a/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
+++ b/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
@@ -309,6 +309,9 @@ static void guest_msr_calls(bool trapped)
 	/* Invalid MSR, should always be handled by user space exit */
 	GUEST_ASSERT(rdmsr(0xdeadbeef) == 0xdeadbeef);
 	wrmsr(0xdeadbeef, 0x1234);
+
+	/* Setting a reserved EFER bit is rejected by KVM, exit with INVAL */
+	wrmsr(MSR_EFER, rdmsr(MSR_EFER) | BIT_ULL(63));
 }
 
 static void guest_code_filter_deny(void)
@@ -627,6 +630,13 @@ static void handle_wrmsr(struct kvm_run *run)
 		TEST_ASSERT(run->msr.reason == KVM_MSR_EXIT_REASON_UNKNOWN,
 			    "deadbeef trap w/o inval fault");
 	}
+
+	if (run->msr.index == MSR_EFER) {
+		TEST_ASSERT(run->msr.data & BIT_ULL(63),
+			    "MSR_EFER data missing reserved bit");
+		TEST_ASSERT(run->msr.reason == KVM_MSR_EXIT_REASON_INVAL,
+			    "MSR_EFER trap w/o inval fault");
+	}
 }
 
 KVM_ONE_VCPU_TEST(user_msr, msr_filter_deny, guest_code_filter_deny)
@@ -667,7 +677,7 @@ KVM_ONE_VCPU_TEST(user_msr, msr_filter_deny, guest_code_filter_deny)
 
 done:
 	TEST_ASSERT(msr_reads == 4, "Handled 4 rdmsr in user space");
-	TEST_ASSERT(msr_writes == 3, "Handled 3 wrmsr in user space");
+	TEST_ASSERT(msr_writes == 5, "Handled 5 wrmsr in user space");
 }
 
 KVM_ONE_VCPU_TEST(user_msr, msr_permission_bitmap, guest_code_permission_bitmap)
-- 
2.53.0

