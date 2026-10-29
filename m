Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305711;
	b=dKeSV7N4fdEGqsta331BikqTamuhuqWwgUD0yZaTQiTxeaW4au5+SF4ncVKe1jsgEcXm
	 UjNjvgJiV0xm02p1AbpPs2tq4+71mfobBH3WZ4feorRBnCGnMRWkwsdvhG7VLPcUhOuT1
	 tBK5JKeCQSqhDGk9qX3Y7vu4LcHFyIUGYGaQni6pI+3iQW4JCANU4hI+Nyx4eRDDByFzv
	 F0qbBZMCnN7iCMOau988byIqBC2aSccAr/Jb0J19+f/TBp5Z4lQQnM5Xq+Gi+auTaphp/
	 AFwVKFTnCaYmAFDaS021Qn+XPDECfB2nafw//eJi9P+fp8uf4ig15wmE4fAO2whU79g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=cZzrCOWTd2fbBwQmagh5NJOE4ckRSGpMrV8yJJh7s5c=;
	b=z1XR6GHvDvrXD0qBgc5SLzDYRjFYNZVfSJHPYCCrqqu3uUrCHGEnijTzp1bg/64EfnkE
	 DQSy9oPqtrK/VaY84JXNbh0xLuEBiHPiyF1wn3zhXyrgw7Fb5IltkVivupJc0M1AXUI0p
	 8MYMB2GzgTYG6H3UB7aTKgSeAZMTT/jEbqqPQB0fKsB2laziZhE5JhuiOa3qRG0++oOtP
	 qLyUXVdv8syC0Vlbia9lWuADnXoMcJKaYadzzczYtMxwSKFRHxpURniQVkY9Hdqr3bdyC
	 V7eQBDgEe+PzHA96FmH/z5n7Ra/V8IP1rjomZZNgxWLSEMjA3yMuKFXK3rJGvQxGgrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GkIJG07d;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64163606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64163606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GkIJG07d
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a079256596so2269626b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793305711; x=1793910511; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZzrCOWTd2fbBwQmagh5NJOE4ckRSGpMrV8yJJh7s5c=;
        b=GkIJG07dYY2I4Zo1h+fLgM7rJMxTsUZGXOkw5/HTO/H0iP6g9a2wid0vb49fwBh5gO
         LpRm8fPajjcPl0kZuDgM8M1+q0ZcMSikTeVQU9En4l6napt4g8yCV9NvB5wN0lI+1j2y
         1tHCn4ALUZh8r4f2rQX5N99rLaRP0hkbxpj6ykZAHDDCrMsT8M16h13GwoAmfzMv9syP
         I54PGEyOiXdkZ44ciSjmB8r/LF5puRt2vDlpw59ZhEXt258i4vSIb2JzpD/sSto1KYAV
         ZswYr19Z4qrdX5aJW47j5xxB5IsKND2Tpz3X8++nf+woe9WBNkLJFxlQgshuZkURVF4f
         yTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305711; x=1793910511;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZzrCOWTd2fbBwQmagh5NJOE4ckRSGpMrV8yJJh7s5c=;
        b=Do8C4fpXA+poGb3nK18xHYO86rO62fmDGbyNQQLXLY4K10iA6FxuwU5XiFCMrZJxLp
         KK2tHtaXY3eikxV79uPsgANNfV1rnWlDPdFo9Qq44Nu728HqSaHYPoUk3RpS9zkwkOcj
         IykAdfaOarbgCWAsp04OyvfdlIt+3Nh1lWBRVXhu+ehANvogEBEdsRjVw4ESywhdXfoc
         1W7cYNMc8e1zBbFa4B3asRxl3W6nSBQTiPz450gV+ctrvZPlOrDp5VD2oY3M5MpvCUXM
         qRLFnUauEK2UaUOeEnPafzJWR9Id8hZ/V9Ca1gxb/+2VMZwL2KPDPfHAT5D0FdtWAHiX
         UKYA==
X-Forwarded-Encrypted: i=1; AKwUvBzhDwz46aAqhN5ABfAbNjynagd5x8bpd0tXRMHKwsC4/JTpOfA+wFZESYC3g7K52/5fSQyFH4hTTzMDQYU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGC7NdXBO6kf25Lq3L0+0053chmcVMDFm2ftly2QGDFADabLr6
	/NwcGUk1oJeCZxxIthJz3HzMGMiJn7/xFmaRyskpZ9i72Ulhh5n80pDNCVqSN7HdLXJ9iEWJVwj
	Q34D0P98WQGqc4A==
X-Received: from pgbx22-n1.prod.google.com ([2002:a05:6a02:63d6:10b0:cd8:5a84:95f])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:c98d:b0:3cc:45cc:c401 with SMTP id adf61e73a8af0-3e928d4684bmr325145637.13.1793305710592;
 Thu, 29 Oct 2026 13:28:30 -0700 (PDT)
Date: Thu, 29 Oct 2026 13:28:15 -0700
In-Reply-To: <20261029202817.901145-1-jmattson@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029202817.901145-1-jmattson@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261029202817.901145-2-jmattson@google.com>
Subject: [PATCH 2/3] KVM: selftests: Rename svm_nested_efer_test to svm_msrs_test
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry@kernel.org>, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename svm_nested_efer_test.c to svm_msrs_test.c (matching
vmx_msrs_test.c), in preparation for testing other SVM MSRs.

No functional change intended.

Signed-off-by: Jim Mattson <jmattson@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm                        | 2 +-
 .../kvm/x86/{svm_nested_efer_test.c => svm_msrs_test.c}         | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tools/testing/selftests/kvm/x86/{svm_nested_efer_test.c => svm_msrs_test.c} (100%)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 888a7530a280..d1ddce584efe 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -122,7 +122,7 @@ TEST_GEN_PROGS_x86 += x86/state_test
 TEST_GEN_PROGS_x86 += x86/vmx_preemption_timer_test
 TEST_GEN_PROGS_x86 += x86/svm_vmcall_test
 TEST_GEN_PROGS_x86 += x86/svm_int_ctl_test
-TEST_GEN_PROGS_x86 += x86/svm_nested_efer_test
+TEST_GEN_PROGS_x86 += x86/svm_msrs_test
 TEST_GEN_PROGS_x86 += x86/svm_nested_shutdown_test
 TEST_GEN_PROGS_x86 += x86/svm_nested_soft_inject_test
 TEST_GEN_PROGS_x86 += x86/svm_nested_vmcb12_gpa
diff --git a/tools/testing/selftests/kvm/x86/svm_nested_efer_test.c b/tools/testing/selftests/kvm/x86/svm_msrs_test.c
similarity index 100%
rename from tools/testing/selftests/kvm/x86/svm_nested_efer_test.c
rename to tools/testing/selftests/kvm/x86/svm_msrs_test.c
-- 
2.56.0.317.g454f8302e1-goog

