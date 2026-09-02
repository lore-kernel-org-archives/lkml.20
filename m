Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9111547D926
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350580; cv=none; b=jsRgBiNEeLooWgLqgYbNkGczX9Vqe0xWwDCAtrLsCziy9NCVAMYcTKMiWNCxC6d4e/rCsFsyp97r2eobbJkSMuLRLRsZ/CMq/4Wzx9Q/6iux2z7LPvegMkLxm/0XAsAFbD34ElJY+UXd3TOwastSf8Gsd6SAf68L69KtwyOAl2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350580; c=relaxed/simple;
	bh=AGaIpcp+iWekGqGY2bGrZVtNl5AoK9nvCgMbIqwXrtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mIwEv/K8+CWXHRxAIVQhwcmcUgXOUNDEhmabteLq0MCw91e7J2cnNvOTuKpn+mYOC4EdDIg6fa4jTq2KLuKiqwiPwjmYg8u5ho7Su5U5t4IafvnQZmtiehsHGJUc0SlHGGeAgynaSZh3OTTFwNvOCABmMvSxViYBB4HXHP2X8ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9BFeqfJ; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9BFeqfJ"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7eb6573bd52so829007a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788350570; x=1788955370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tv+F4kWm687aqLU+RFHaw3qmL/A9BNH3QtDc0f8Db2k=;
        b=P9BFeqfJ8CUsZ1g8ik8ZAO8z/s7ygGDrqsoGEg2qtfIEElYNS74xhNR1vpi57Rt20h
         6CtZOPZetMkB1O/XT7JcGjcTqN9XjYBB4fZO+nEP25uTax7+CtycvAdiHdquqoygFzde
         hUczakBmPPIJd/p121aYMYEJoATE409LPU0WtXxtHfOTH3uhnTYods+RQcRLuaCc39Nj
         6Y5407DfvYnBtKYuPuf0hDeg07uDTCqfaXRFq3PtS4sN/26KFqz/YeHUt14pH0zO+TVR
         UH2uMAd5+P60fJdgxCpaJoG9rYkVFhP8hLCpvyJ3QV34ijjY6iwqC3L/w5zKm6zhhFcN
         OUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350570; x=1788955370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tv+F4kWm687aqLU+RFHaw3qmL/A9BNH3QtDc0f8Db2k=;
        b=UYl1ZhQ9ofisaOcrjbyGEMbnYsPybsF31Fz9aBiEIxIN7rSSXA0xM+vpSjmPTj19RX
         tfE3z5QkFz3+k/+95bAPg+xQLwrlNIxSMZcvF3yFaxFq84J8wid0PJbo2kOStyGGFyjW
         cO833pjPfeSfWwbrLi03BMUAlk047+f6+zq85hPnSex6wfFAH3CRoDMRB4kNlkzH84TE
         K20m6JHzEUNsEzOYZ5JZogCwzS+E8zbqJWCR39d0YPWJGs53f1T/BNUvmgEf4XoLa+FW
         dHRs8msbPx+1KAQGoq409Zg2r4OCFmd4biayYm/3212qi4T1/76cQPc2G+ux+bRddPcd
         pkGg==
X-Forwarded-Encrypted: i=1; AHgh+Rrbmp1Qgo/HfV1fVQ0mY0isrsWz1xTmpbucJwz0j1cN4hZsHuHaADWh2PKfmBkYNNjt+/btKkLSOZN+lPw=@vger.kernel.org
X-Gm-Message-State: AFuF++nqTl65QRQFJTPWjjFrOsd4wVODnDqcEbVWzF3Gb+Ora8Q26rg6
	1+d+bPPa+iiq+/2kjWR2ILy9+04fllNSJGzcyS9HTdDUG/w8Rh8sXwjZ
X-Gm-Gg: AR+sD12w4MGVV2wZGXaya4nQvKKTWSXv7Qcbgm1gh9le9zrGj49bFOXyaXtIY5blXuu
	XW03bRelXfKVPPm50fumYsqCmE8XVrfN/BAN2xbCblLv1Pv4BQSyw8xjgOi6xmj2mQlqT8MkcE6
	8rZpk99PNEyyCN/ipm+kXZfy3/+LN/8j3+nA27aJTNUaWlPpheYN2g1o5G/x0AejwghoZCWoG2g
	9jaorGJJGlLTykiEjvk4BS/Qq7uo5tNxXM9Y4MlltH1b537h/M2sC3u5EblMyquoP9mBtH/h7y0
	Pm81e9u49bLD/ufmZWaoCEGveODXnwbdJVgyaYVzKAp10L1kXgpAVcqUG8BGL13wWRbJELkZrAZ
	VCveKfpwThu+Lj0UAgDp4Vu93pdbilKjL/usEnUUzCo/vbgO8e6OOH5ct4AK0eeJntFEE8Gvd4x
	IxRKhSdMFrSgiPGkXNa68rCcHGSUFkipj18snHS4Ixr2XL0aqq0e0JTdN3aRpLxFp6ljELQnB8f
	SAGoepS/jrG0lNvzugPDg==
X-Received: by 2002:a05:6820:c8f:b0:6b1:a0b6:72d9 with SMTP id 006d021491bc7-6b47e6c352emr2967558eaf.25.1788350569690;
        Wed, 02 Sep 2026 05:02:49 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079c33e9sm6897044eec.4.2026.09.02.05.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:02:49 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/2] KVM: selftests: Verify the events half of the sync regs region
Date: Wed,  2 Sep 2026 17:32:35 +0530
Message-ID: <20260902120235.18486-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260902120235.18486-1-hemanth.selam@gmail.com>
References: <20260902120235.18486-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_and_verify_various() writes to the regs and sregs halves of the
kvm_run sync region and checks that KVM picks them up, but it has never
done the same for events, hence the TODO.

Mask NMIs through the sync region and verify KVM applies it.  Masking is
a state change rather than an injected event, and the guest is a tight
loop that never executes IRET, so nothing can unmask NMIs behind the
test's back and the check does not depend on timing.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/selftests/kvm/x86/sync_regs_test.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/sync_regs_test.c b/tools/testing/selftests/kvm/x86/sync_regs_test.c
index c7d1f3cca16e..b417eb0ab0f0 100644
--- a/tools/testing/selftests/kvm/x86/sync_regs_test.c
+++ b/tools/testing/selftests/kvm/x86/sync_regs_test.c
@@ -372,10 +372,15 @@ KVM_ONE_VCPU_TEST(sync_regs_test, set_and_verify_various, guest_code)
 	/* Set and verify various register values. */
 	run->s.regs.regs.rbx = 0xBAD1DEA;
 	run->s.regs.sregs.apic_base = 1 << 11;
-	/* TODO run->s.regs.events.XYZ = ABC; */
+	/*
+	 * The guest never executes IRET, so masking NMIs is a state change
+	 * KVM has to hand back unchanged, without needing an event injected.
+	 */
+	run->s.regs.events.nmi.masked = 1;
+	run->s.regs.events.flags = 0;
 
 	run->kvm_valid_regs = TEST_SYNC_FIELDS;
-	run->kvm_dirty_regs = KVM_SYNC_X86_REGS | KVM_SYNC_X86_SREGS;
+	run->kvm_dirty_regs = TEST_SYNC_FIELDS;
 	vcpu_run(vcpu);
 	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
 	TEST_ASSERT(run->s.regs.regs.rbx == 0xBAD1DEA + 1,
@@ -384,6 +389,8 @@ KVM_ONE_VCPU_TEST(sync_regs_test, set_and_verify_various, guest_code)
 	TEST_ASSERT(run->s.regs.sregs.apic_base == 1 << 11,
 		    "apic_base sync regs value incorrect 0x%llx.",
 		    run->s.regs.sregs.apic_base);
+	TEST_ASSERT(run->s.regs.events.nmi.masked,
+		    "events sync regs value incorrect, NMIs not masked");
 
 	vcpu_regs_get(vcpu, &regs);
 	compare_regs(&regs, &run->s.regs.regs);
-- 
2.43.7

