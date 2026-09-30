Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF4A57C705
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789887; cv=none; b=uIiZXuE/ATMVNCcvgaDghtPbPC53kF2f0zPp5R3UJsejAOSkjULO/ZPOzocv5ce5FDIgDMMv86OQQW4DtxlDJ4gNzzVeT2WdYndDKv4e3tUTeZ2ThJ+91wP970g2PawQVnrlu/sX+Pl3xw/+4uIzjHYz2LyC48yA4wsmhDi49ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789887; c=relaxed/simple;
	bh=QcgaQIxwkGgbDJzektD+2FyTojDiIFPOqWUzYPn9BjM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ut9EBR+3xb9a8uFtqZQICZt7S71mVk933nAbiQ9GdcnvHfdu/CkshNElZII4ztY+TfXgTYswO/jZOSf+6MIM84nhrPRwv9ev7sq4mhfgKVAcUITSCiaY8hFJenuj0xKBDSyYTsuDIYi3utLyTXTT0yxqUmgQIyzecYVncqGh0PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cFXZWzb6; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cFXZWzb6"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-882776aae15so2999120b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790789885; x=1791394685; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xmhxxYvdvDBJUv8TOCQdJm2ntYWSx2CBx08ozuwPd1U=;
        b=cFXZWzb6uQDeGFMGY276M4mLZFshA4g5Fz7qXErJZX0698CEUqFeybURSDBqcx1mmN
         pW/oSBpeoOjsKwDjfZ2q5HcUX+vVm2au2OmYxfzA7xMTeI4TqUBUZjXFb3JGHFccyjuF
         tL36RZ6NBNy120SAiOe0hQXE+XvJBCT6kkh1sBvjXDhUTElJnlshW8MJSBHTn3JFLh6w
         siTmCi5zxgXcFFuXd9Fob6ADK7vpwNPqs8afZtgz+ctbPWBbfZF+m7+ywFmRMRFgXBbS
         nXz5WsZSLJWUtD8Xu3h3HmABh4yO8LsjDYZltqpEQ1FiiWibApGXem9BM+4H+9+NzIvi
         atiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790789885; x=1791394685;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xmhxxYvdvDBJUv8TOCQdJm2ntYWSx2CBx08ozuwPd1U=;
        b=cGLZrFcTHKyHsSsEErrXHAYKklpTTYJ0rqp8ZSQEIRbyMjnfl+dL5nhwWrkokB7wHe
         E3ndtV2MpSyOq6QXji5JzhHpl9CPMiWKl/9Mzgs+wjUTPzpSSrXWsjAV+d2creb+/Jk/
         MQQ+iaqqLUjwfuG4ohZtER6ZM7Kz9cKFQRNpC8XbAo4JPrT2+EWJVZiadWUi0V3YUw2h
         dBE3WfP0qudzDs2NHS1lnpVS//aMTDWJGxFJypf41aaPgf1e9i8yZhXmvov5/oKGKEKz
         s8lnAkMU02pHI4Oh4gsqDgBi0i6icnyWSxi+y8kxrtWyIDFUCTHOZZfCDMShfyO23OCu
         eaeA==
X-Forwarded-Encrypted: i=1; AKwUvBzS0TcdGU3yGteYLjzk5YSqTBRE2YcfTyYfpRTXglPLlUrHueFOR4Z+SUCdNyJyKXJTnyMjDUnR29kosEM=@vger.kernel.org
X-Gm-Message-State: AFuF++mxNM2lYsOagyAnpNc1SexL16HXyi7Sc5bAYa8kLxeI9k457/j1
	xK4/N9lL2OnVh9dAYA9uBg9kQ3ceIJIYw0xWveklWpc9WvDtscmo5jMS8k5tOeHl9HDViNU1hce
	98Q5RqA==
X-Received: from pgbeu25.prod.google.com ([2002:a05:6a02:4799:b0:cc7:d5c2:b58a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7001:b0:3dd:57bf:7242
 with SMTP id adf61e73a8af0-3de9e02b65bmr2424480637.8.1790789885264; Wed, 30
 Sep 2026 10:38:05 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Sep 2026 10:36:35 -0700
In-Reply-To: <20260930173635.3362655-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930173635.3362655-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930173635.3362655-22-seanjc@google.com>
Subject: [PATCH v3 21/21] KVM: selftests: Spell out UCALL in nested TSC
 scaling test's enums
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>, Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Explicitly spell out UCALL instead of prefixing only U in the nested TSC
scaling test's ucall commands, as it's all too easy to think USLEEP means
"do usleep()", when it actually means "do sleep() in userspace".

Opportunistically name the enum and take an enum instead of a bare integer
for the to-be-checked level, to make it more obvious that the fact that
the level values happen to correspond to '1' and '2' for the nesting level
is largely coincidental (or perhaps it was intentional, but it's not a hard
requirement for the test).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../kvm/x86/nested_tsc_scaling_test.c         | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
index b21f79e9ec71..bfb1ff441c78 100644
--- a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
@@ -17,7 +17,7 @@
 static u64 l2_multiplier;
 static u64 l2_offset;
 
-enum { USLEEP, UCHECK_L1, UCHECK_L2 };
+enum ucall_cmd { UCALL_SLEEP, UCALL_CHECK_L1, UCALL_CHECK_L2 };
 
 /*
  * This function checks whether the "actual" TSC frequency of a guest matches
@@ -38,7 +38,7 @@ static void host_check_tsc_freq(int level, u64 actual, u64 expected)
 		    level, actual, thresh_low, thresh_high);
 }
 
-static void guest_check_tsc_freq(int level)
+static void guest_check_tsc_freq(enum ucall_cmd check_level)
 {
 	u64 tsc_start, tsc_end, tsc_freq;
 
@@ -49,17 +49,17 @@ static void guest_check_tsc_freq(int level)
 	 * be good enough for the purposes of this test.
 	 */
 	tsc_start = rdmsr(MSR_IA32_TSC);
-	GUEST_SYNC2(USLEEP, 1);
+	GUEST_SYNC2(UCALL_SLEEP, 1);
 	tsc_end = rdmsr(MSR_IA32_TSC);
 
 	tsc_freq = tsc_end - tsc_start;
 
-	GUEST_SYNC2(level, tsc_freq);
+	GUEST_SYNC2(check_level, tsc_freq);
 }
 
 static void l2_guest_code(void)
 {
-	guest_check_tsc_freq(UCHECK_L2);
+	guest_check_tsc_freq(UCALL_CHECK_L2);
 
 	/* exit to L1 */
 	__asm__ __volatile__("vmcall");
@@ -68,7 +68,7 @@ static void l2_guest_code(void)
 static void l1_svm_code(struct svm_test_data *svm)
 {
 	/* check that L1's frequency looks alright before launching L2 */
-	guest_check_tsc_freq(UCHECK_L1);
+	guest_check_tsc_freq(UCALL_CHECK_L1);
 
 	generic_svm_setup(svm, l2_guest_code);
 	svm->vmcb->control.tsc_offset = l2_offset;
@@ -81,7 +81,7 @@ static void l1_svm_code(struct svm_test_data *svm)
 	GUEST_ASSERT(svm->vmcb->control.exit_code == SVM_EXIT_VMMCALL);
 
 	/* check that L1's frequency still looks good */
-	guest_check_tsc_freq(UCHECK_L1);
+	guest_check_tsc_freq(UCALL_CHECK_L1);
 
 	GUEST_DONE();
 }
@@ -91,7 +91,7 @@ static void l1_vmx_code(struct vmx_pages *vmx_pages)
 	u32 control;
 
 	/* check that L1's frequency looks alright before launching L2 */
-	guest_check_tsc_freq(UCHECK_L1);
+	guest_check_tsc_freq(UCALL_CHECK_L1);
 
 	prepare_for_vmx_operation(vmx_pages);
 	load_vmcs(vmx_pages);
@@ -116,7 +116,7 @@ static void l1_vmx_code(struct vmx_pages *vmx_pages)
 	GUEST_ASSERT(vmread(VM_EXIT_REASON) == EXIT_REASON_VMCALL);
 
 	/* check that L1's frequency still looks good */
-	guest_check_tsc_freq(UCHECK_L1);
+	guest_check_tsc_freq(UCALL_CHECK_L1);
 
 	GUEST_DONE();
 }
@@ -167,14 +167,14 @@ static void test_tsc_scaling(u64 l0_tsc_freq, u64 l1_tsc_freq, u64 l2_tsc_freq,
 			REPORT_GUEST_ASSERT(uc);
 		case UCALL_SYNC:
 			switch (uc.args[0]) {
-			case USLEEP:
+			case UCALL_SLEEP:
 				sleep(uc.args[1]);
 				break;
-			case UCHECK_L1:
+			case UCALL_CHECK_L1:
 				printf("L1's observed TSC frequency: %lu\n", uc.args[1]);
 				host_check_tsc_freq(1, uc.args[1], l1_tsc_freq);
 				break;
-			case UCHECK_L2:
+			case UCALL_CHECK_L2:
 				printf("L2's observed TSC frequency: %lu\n", uc.args[1]);
 				host_check_tsc_freq(2, uc.args[1], l2_tsc_freq);
 				break;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

