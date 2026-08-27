Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED54433E34B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787805961; cv=none; b=psOzGj2rq+I0vt0IsvTXAfN54+I64lNSgwnd7JH8vMd2v0p9syL7mGxzpojx0sv7irBtciKCRT0XeLxUHxsQT6yfLvCXTWb155REqGWGU9L4l8iR5IFMEqJjLWWZad5ssO5mY6u1DpDYbN0noJ19eUAoPFpb6VSbMLLlQiK0gUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787805961; c=relaxed/simple;
	bh=1bR0L/i/r0ruNCYRAsQhnwMGkWpHML0zh6aU/+3swc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PYwnTIuHD56aVWZ/74nX7jdUTXx0P07fAQJXFqjoipbxlSh8X45OUiAogqschGCukRB0F/rx/SSLqNGRifDuSAIsU33yVR3yOe5ao67bmFS7zKZXo9cOMJsEJ0Ejao6tnDKRZJHVXKOwRRGRKFgfUretONcVIxoF2VvDuS/hh/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5sNm6Es; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5sNm6Es"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d7200b2e15so9386525ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787805958; x=1788410758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nKSTRHENFmZ28a4EDL5zBN3EU46+ZLuR2U8w20FjDuk=;
        b=H5sNm6Es3nDLYJpKey2VsIXbU6oSJ3bEwuoMCrJxAELD3U7/MQEagbTkl90Trjnban
         Pb6NeQMpNx88yOBhq6mFxC55EUxHk9kg9Z+doRITj0wIJDpKBSa3fHiq6BNDTEcNGJ+a
         oNfXECmA3tHWQkm9KUTNt2g/AiBLsD4rj1AoUtc+xP892Zvzdkiwj2Gg69nbevQDgVE7
         qiqiwA0htM5Ymin4g64Xeg1z3Dr6xHJ8cHIGIZ2kSHdo3ZdXMt0vmde5byL9ORxpc7iV
         lAgPsb0Rc2OfhoW45BK5SDbyHSUQ/6DnKZaxSM2lRml9xV8udUrT51Ub7wilVSndBBb4
         Rcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787805958; x=1788410758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKSTRHENFmZ28a4EDL5zBN3EU46+ZLuR2U8w20FjDuk=;
        b=EGmAskRHfLPr/JaV1s1ZdqeWat7e7S/D48dcTrfaMesqW3FlKw0jdxEE6rpm4wScIO
         65h4cDm/gWQ1th5QA7bPhKmiDkXLBr8inWjUdsuBJi7vveEGwPzqBpuv+I3BFivYXRB5
         98jmIwDZ1/QR1J27r3x55VlI1a3ndxsqBCclwhurk4CcHboIcXZ2iJeN6xz5QcSoXv99
         U3LjHykbqZMX3GI9F8XRKGKg7xFJXOoeFwxIwJlj1ogGD5zt/8WKrD83E2jUjv/zKzfb
         +09tBsmVDWjG/wbSx931L9IvJgZ8QB1kn416DuoQ1t96z5fcVFeGSUbFJNcmflTISYUk
         BBZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2kKKDwtlNfwe1P4KKaCJ6rHPsS+Ifhdr3OjNjF1IXqNUxNdX+4Nv30rScFLFuKjgGDes/O8C1Mn8sHBE=@vger.kernel.org
X-Gm-Message-State: AFuF++ktrC/rTddFa89RIUqpXSM3FXqn9G7tEWVDk6w06JDcnMzzz2p1
	Xv37mu3Eex3KmjN17K+c7+iEDvyocu9kEJxqMjyKkSkdS0Z338rKwNba
X-Gm-Gg: AR+sD10f67Ll0C5cjgYuk0J0n9v/SJ5vplQnB896+yCkUszbKzV3UnTN1DLULNbf/aW
	9FMLZlScg3mTidLj8q3jiXqD1GvBNw6U+3uYp+XxwaQrxAkvQSSMI42VJVrWQrcosC4LcNiibPp
	N6wulI6V0KOSeNW52fHXNTBA9xg/ekdBBwUMD4P4TXlvB7dyknCE2Rdk8Pp1nEOKvDOKRsRfgze
	HRWMzBc2SWy4sMd26Rv/1gwvyrD7silqzkXK8FpLe3cmTdap6PmEmGOTFgY4kdnlUfxe9c+7MOd
	X9tWtZ8ziC/e7RVimk8Ah+Rl3UdZJydkAVcx2NYGlyvT9SgFNeUmUzhuXKBDJpqFUORtV+Gjfkz
	Vd9rMESBHCz6xR0YZraXLZjaUvEQTitt5kZMLRiqA12iR7ruChofxUFYkMLgOvJ5u8gL4CMs0zW
	a3mMywLhzUBrvcT4YY3iO01YpBc+AlbcZiui/3Aojm6AVKMrFhTUyVMQMfRGi/G5qol4vf6UrQi
	+kXH5jMogM=
X-Received: by 2002:a17:90b:2885:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-3966d5c1a78mr25551800a91.15.1787805957924;
        Wed, 26 Aug 2026 21:45:57 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3285a5f96efsm2270583eec.11.2026.08.26.21.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:45:57 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] KVM: selftests: Actually test PV_UNHALT
Date: Thu, 27 Aug 2026 10:15:32 +0530
Message-ID: <20260827044534.2900285-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_pv_unhalt() only checks that KVM clears KVM_FEATURE_PV_UNHALT from
guest CPUID when HLT-exiting is disabled; the feature itself has never
been exercised, hence the FIXME.  Patch 2 tests it by halting one vCPU
with interrupts disabled and kicking it from another, so that reaching the
instruction after HLT is proof that KVM_HC_KICK_CPU was delivered.

Patch 1 adds the helper that patch 2 needs to learn a vCPU's APIC ID from
the host, rather than open coding KVM_GET_LAPIC as a few tests already do.

Changes in v3:
 - Handle x2APIC in the new helper.  v2 always applied the xAPIC shift and
   mask, so it returned 0 for a vCPU in x2APIC mode on a VM that enabled
   KVM_X2APIC_API_USE_32BIT_IDS, and truncated IDs above 255.  Reported by
   the Sashiko AI reviewer.

Changes in v2:
 - Pass the APIC ID to kick in a1, not a0.  KVM reads it from a1, as the
   in-kernel guest does in kvm_kick_cpu(), so v1 asked KVM to kick APIC ID
   0 and only passed because the halting vCPU happened to be vCPU 0.
   Also reported by the Sashiko AI reviewer.
 - Halt on a vCPU with a non-zero APIC ID, so that a kick sent to the wrong
   vCPU can no longer pass by accident, and enable that vCPU's APIC, as a
   guest using PV spinlocks would: KVM only routes the kick once the vCPU
   is in the APIC map, which is also why xapic_ipi_test enables it.
 - Move the APIC ID helper into apic.h instead of keeping it private to
   the test (new patch 1).
 - Report the return value of pthread_create()/pthread_join() rather than
   errno; they return the error directly and do not set errno.

Built and run on x86_64 (AMD).  Untested on Intel, though the kick is
handled in common code and delivered through the generic LAPIC path.

The helper was checked against every way KVM reports an APIC ID, comparing
it with what the v2 version returned:

  xAPIC vcpu 0..3                     want 0..3   got 0..3    v2: 0..3
  x2APIC vcpu 0..3, legacy ID format   want 0..3   got 0..3    v2: 0..3
  x2APIC vcpu 0..3, 32-bit ID format   want 0..3   got 0..3    v2: 0 0 0 0
  x2APIC vcpu 300                      want 300    got 300     v2: 0
  guest renamed its xAPIC ID to 0x2a   want 42     got 42      v2: 42

For the test itself:

 - On kvm-x86/next, the whole selftest suite builds warning-free and
   kvm_pv_test passed 10 of 10 runs.

 - Also run inside a VM booted on a kernel built from kvm-x86/next, i.e.
   against the KVM this targets rather than the host's.

 - Whole x86 suite with the series applied: 61 passed, 24 skipped, and
   set_sregs_test failed with "KVM allowed invalid efer bit (0x100)".  That
   one fails identically without the series, i.e. it is the host kernel.

The test was checked against four deliberate breakages, to make sure it
can only pass when the kick really works:

 - pass the APIC ID in a0, i.e. the v1 bug: the kick goes to the wrong
   vCPU and the test times out, so this version does catch it;

 - drop the KVM_HC_KICK_CPU call: the halted vCPU is never resumed and the
   test times out;

 - clear PV_UNHALT from the kicking vCPU's CPUID while enforcement is on:
   the hypercall returns -KVM_ENOSYS and the test fails with

     0xfffffffffffffc18 != 0x0 (kvm_hypercall(KVM_HC_KICK_CPU, ...) != 0)

 - remove the halt: the bounded wait trips and the test fails with
   "vCPU never halted" rather than hanging.

Hemanth Selam (2):
  KVM: selftests: Add a helper to read a vCPU's APIC ID
  KVM: selftests: Test the PV_UNHALT feature, not just its CPUID bit

 tools/testing/selftests/kvm/include/x86/apic.h | 20 +++++
 tools/testing/selftests/kvm/x86/kvm_pv_test.c  | 97 +++++++++++++++++++++-
 2 files changed, 116 insertions(+), 1 deletion(-)

-- 
2.43.7

