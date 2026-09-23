Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A354D515965
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178679; cv=none; b=KfA6SxK8FZVrj7yJxgA0FwuvIJzoHwt6dq+dAckuyL8nPrWZfsTQ8JF5TIBZrgfk+S1tlOR3f9EwoOKPcBPpG4rtdbi/xQbs7NVoECSUP/m92IoqSN/mZarBwcjycUJXBP6UuL64FEu4nIy2lcnDfpyLrIt118cqs3UM58cXWDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178679; c=relaxed/simple;
	bh=rO6mF9C1/9+cpGzYv8g9ZVAJGUoWGKMEqjgarRG1Aa0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=YzxLVV70zI0xCMNL39ZV76Zr1l+JmoDMlm8ev5TF+eBZU6h9U7PB6eDlBNH7q1zCkft89C8Zc4phPbxWAFYPixX2+DQ09n76yiPHGjrXs/8JfGmad4jQQwCUTAi+fytxIF5f+gzPhCuJ2T6MjZw3dslBWeclkEIHwXWVatWylSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WB7+PcEP; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WB7+PcEP"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so1249437a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790178670; x=1790783470; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3luqRKcCingagn8NYFaqWEw14KPOvu6+rw5gV+maomE=;
        b=WB7+PcEPjHKHDiLuIpjswpcvYCHKjun1YdQYx80GulmnGkPqBjptUEKvN3uLnEv3K5
         AYv+yuG7gFD1jyQZ7Wx8cCGCsyoPtmEp2eyfhZ5X1tLdA/Ie53FhwFVab7d6ZGPWB2+y
         a7BU481W0YLry8s8sLF3Bw8qJNCDBSJ7ulv5Dj+4x5a13sgD7a4GcOtZevnqxJcl5RG2
         Am56AoaNGuEcWhT2FF54+C0XOTGXFEa4fytnX0+umbe5lsj6tEnsevbRtovjpDB4mz2H
         2bKLPOVpZIyCh17HnjoVKBs9+Zvnn5adYKiYHF+2OIr6A+EocEbXILFLUpYkZWEmTo88
         yQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178670; x=1790783470;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3luqRKcCingagn8NYFaqWEw14KPOvu6+rw5gV+maomE=;
        b=U/zLd2dgeXkb372kRoMOxrZ5VHbR0ACgbkuXSSh2wRD1letKStYoW7HD0VTqK2Qoj3
         ggQXkjL1pDAW35FLAKobLbCSK6ZKJYU2OUJnfF/LpiSyUBAb4YJRFpKcqqjBSW8pl/fO
         lZFrh4B4kPGbT7bSEGAFA8jj10riQS3G1hEMXYNtCzt2mkoYyZ/baXiIE8QXgowLnXX2
         IZRZ7pUJ1VYqsocyg9am5HiOm38/u8tSrO+SR2w4KeC5gYm79KS2y6vuPnWTdouOHyqk
         5bGvGU3KiiA9UasJzO6KjGl59vcafznYtptBXdjiHYRlB95eLvajiDqgHVqdqpOequb7
         iYAg==
X-Forwarded-Encrypted: i=1; AKwUvByXq+Yb7LdEaIT0cF1HoFC93Wbnl5V2mMLY8tjcDZBueEZIv1hSra1AtUZXPt+tWVh13NWZI/JEFRR1KuY=@vger.kernel.org
X-Gm-Message-State: AFuF++lSc7hQo9FgzHDZJ40vqiCCgXHhnjL6tRXVoS1S5/SoxMiSWNQR
	aNp700IoV3Q8nEj1g8XM0KI43AF1QZXQMOrf+kvtCizitGO8/KMw5CRoKTatYXyvKPIgFqkZ1cl
	D68A7VQ==
X-Received: from pgdf25.prod.google.com ([2002:a05:6a02:5159:b0:cc7:5367:5720])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a1d:b0:3da:755f:a031
 with SMTP id adf61e73a8af0-3ddf7cfbfdbmr2722797637.12.1790178670395; Wed, 23
 Sep 2026 08:51:10 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 23 Sep 2026 08:51:05 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260923155108.1550622-1-seanjc@google.com>
Subject: [PATCH v2 0/3] KVM: SVM: Fix AVIC Physical ID table UAF
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Naveen N Rao <naveen@kernel.org>, Atish Patra <atishp@meta.com>
Content-Type: text/plain; charset="UTF-8"

Naveen's fix to clear AVIC Physical ID table entries if vCPU creation fails,
to ensure the CPU doesn't access the freed virtual  APIC state.

v2: Add prep patches to consolidate the table bounds checks.

v1: https://lore.kernel.org/all/20260903062856.2090499-1-naveen@kernel.org

Naveen N Rao (1):
  KVM: SVM: Clear AVIC Physical ID table entry if vCPU creation fails

Sean Christopherson (2):
  KVM: SVM: Add paranoid helper for checking if vCPU is AVIC-addressable
  KVM: SVM: Use "is AVIC-addressable" helper to sanity check
    load()/put()

 arch/x86/kvm/svm/avic.c | 22 ++++++++++++++++------
 arch/x86/kvm/svm/svm.c  |  6 +++++-
 arch/x86/kvm/svm/svm.h  |  1 +
 3 files changed, 22 insertions(+), 7 deletions(-)


base-commit: d4b7fb647204f0c81dfeae2d1a708e4d858e0c94
-- 
2.55.0.1082.g2b9226bbc0-goog

