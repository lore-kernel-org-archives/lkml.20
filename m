Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1774483BC4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350578; cv=none; b=kTNNuG3Yk0YuyIWpWJZjcIhP5EnOgNjdw0ENTWfPMqayc101CfIR8otGBKA7eteg7JdqntP9QfDEnQEyLYwwNFOUKEGRUlJms+Qu28S70SKbagMZczkRtO9eLn5qejD6njBfSsi2hlg7cBEnCuALGYzCoa/w5Hwg1CJIeoivS2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350578; c=relaxed/simple;
	bh=m0JjFRX4svUQp6KRJp+je69oUc0P9aiIdfo5Oe4XjWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ALWV4w2/alkqakIWZyJf78RjhJRbG5GsuJ8uzj3QqTJCPSCLLNl0akRSXnYS4FYamyMeN+TFR6BijasnzXqaq3nhNP9BVS3KBmY5WQAIIWEcYtPXszAY1uHxZH7HIrDHTPz3egE9vFbDlQDSM51iwLDmI2Yjtz8DKFfwxle/SHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlfLTDO6; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlfLTDO6"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so1663702a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788350561; x=1788955361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I6Md0+LJRDnI+rQO3Uvm4S5xh/BVG8Mf7Z6azFky85k=;
        b=QlfLTDO67GnAgA09KgHd6vVHj7fliwjQQUyglyoEwayG/r08elxySkq1ekNgPwn104
         WnThyK3v1QSVmvvxQncA2DWyIl+u0II8cQQtJzuwu9VY1Utz4DUQcI7MbDqdoO4S3sQO
         Uw2FH0WJ/NKQn0wnYIY0ltAtrZluB9lPkb+4R6pFhCO8zTrgUu8+5yFjN4Qp1ZeOOLuX
         zdY6YLyG9uk6BMBfXs0+EkjbFzUXum/KcHZWbwuqf8ETW0itqwZPm2nbXX9B5Ymq91dH
         nJLSfeuctDorDS3nZ5a9NlWFtSxltVlq2JYlZvGd3+FmgygTIxOGTnmA4NAnMNn5BOSf
         LB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350561; x=1788955361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6Md0+LJRDnI+rQO3Uvm4S5xh/BVG8Mf7Z6azFky85k=;
        b=iqyH+BDSPrjzxXZ96n8bmOhVoClvhBk7LI66Gn5Nzg/+Qk0loaYefTFXhvv42NATM1
         wJbqUest7An4a2xfeholZQ1DlCSVw/Db1Im16qs5AUWv9fhF/KnYpL0UGpsn5w1ArQqU
         fXzEdFK/zSDDAYCzTzPlR2zTMNkUpIm9zDf7/9bl2JAADKr1LJLbT+RkGqA+q+XUVenG
         ScwbQeG94QHyorITYbW9c640ONRuRx7V8s4yM7CypEk9pmjy2AEt9mHrONYcswDPWd6F
         qfssul/VnPNOABdwao86yADe0Kldf1CqtrW0lElJnASQi5Gn0XT/ctJU7M5d1M+snVfy
         MHwA==
X-Forwarded-Encrypted: i=1; AKwUvBxu1A+DSHwRvaKbQVHEV7EKlA4T9sr963h92BcghOb/7bdstFRajad6CLDiKbA1N5Rz4qVISFAOsLarTm4=@vger.kernel.org
X-Gm-Message-State: AFuF++lN/ES08qFdGC2x1vfipMHohRCuJzRLY9PM1rk+/tiTZlda6PaA
	w8Gxqqh08YXX4QQEfKoAkaM23cIrSno8SAMOOVfQLTG8jLEnLuTUkj5L
X-Gm-Gg: AYBFou3UFAa4Q6wBy/Jech9PrnCGl6U8occnXBi2mUOlnuNbrQpuB8VTexR3cj3wM7N
	F7MYnw2oy/+sblq8YO5RW9munVKZCAj1Rp/xVmg54K9P7FCdDGp6xt+aCLSYx31IHVmLAlV9eUi
	V9TohH4j3KnEz86hlSn0/oxu3gT7Wwqs60YiJxDss3idbzHGGJO6YLmVX0adQGb7o4WRH3TlLQj
	T3Vme07TA68RNK8iDxGbWj5fUoYRfMh3O9RR0LavN8RaZWw1kQIwt4D5O4fBFHnz5rMswUWNUbK
	c3Qe8hzJswNvpcGwld80edHCx+XM8QrFa9iI1C8myDHkBaCwutol7G3xojw4tD3eWHzuHAnqtiS
	9dcUXWs+plGELR5qtoaNZxSuuwStHIvLa9oKXYJvF6aApPG7zJEdaSku6HYhYceBysygRyx9tbi
	k4DUdRYv+8x5+kGv0XMugPN2yCQKkWNPpJ4iLk10xDu2JtRI+7IGL88jST53HGUeQA5v6iKKYqU
	xZh2/nzTW0=
X-Received: by 2002:a17:90b:3c09:b0:398:c0a2:8f8e with SMTP id 98e67ed59e1d1-39af64f9205mr2885148a91.26.1788350560968;
        Wed, 02 Sep 2026 05:02:40 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079c33e9sm6897044eec.4.2026.09.02.05.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:02:40 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/2] KVM: selftests: Verify sregs and events in sync_regs_test
Date: Wed,  2 Sep 2026 17:32:33 +0530
Message-ID: <20260902120235.18486-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sync_regs_test has never actually checked the sregs and events halves of
the kvm_run sync region.  compare_sregs() and compare_vcpu_events() have
had empty bodies since the test was written, so the checks run after
every KVM_RUN only ever compared the general purpose registers, and the
events half was never written to at all, hence the standing TODO in
set_and_verify_various().

Patch 1 fills in both comparison helpers.  Patch 2 exercises the events
half by masking NMIs through the sync region and verifying KVM applies
it.

To confirm the new checks catch something rather than merely passing,
the same faults were injected before and after the series on an AMD
host:

  fault injected                      before    after
  sregs.cr4 mismatch                  ignored   caught
  sregs.cs.dpl mismatch               ignored   caught
  events.interrupt.shadow mismatch    ignored   caught
  KVM_SYNC_X86_EVENTS left clean      n/a       caught

Every corruption goes unnoticed before the series and is reported after
it, e.g.

  x86/sync_regs_test.c:128: left->cr4 == right->cr4
  Register cr4 values did not match: 0x41221, 0x41220

Unmodified, the test passes 20/20 consecutive runs with the series
applied, each patch builds and passes on its own, and the remaining x86
selftests are unchanged either way (61 passed, 24 skipped, with
set_sregs_test failing identically before and after for unrelated
reasons).

Hemanth Selam (2):
  KVM: selftests: Actually compare sregs and events in sync_regs_test
  KVM: selftests: Verify the events half of the sync regs region

 .../selftests/kvm/x86/sync_regs_test.c        | 100 +++++++++++++++++-
 1 file changed, 98 insertions(+), 2 deletions(-)

-- 
2.43.7

