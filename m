Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB6B3A16AE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125868; cv=none; b=OxRfSB8xTiGORVZO9xUVcR9HZybUpU60LSwemO00BYCvoY84E6bmZPZDjYlKvfkeM+sQd89WEyYSBxX31hy2+on3SA3Q9UJAAxLgnjbAuPbA4h9BXfehM0cyUOBrOCMGC97BK967Fe/i6LDNbn7YdKYwQVmMkZEaxBqWH249pPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125868; c=relaxed/simple;
	bh=C26sClaZbUXgd0PrBqN/AS1KIh378gDtVpu0XQIQmI8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oiEd3IQK3oCJHP7dBZKUo7H/DR6s8ywRzBwytglT9JciG5jg7iRVS62LeqGB1/7dqTqMKmx/ApMS8W+Tr7tMM4tOi6844bJ4aisXfUe9lbCJLyAWZDM7xbN9/XQEU9cgYqCVah5dgKFe81K0TyMJowAOzUnpptfz6Q1cV20N9qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SNzwzmmO; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SNzwzmmO"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86fa6b15ed3so8390850b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792125866; x=1792730666; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pirFeDtKxCRO5e9HqLTzyJ57dzgRJHoIjjnsjCYMn8s=;
        b=SNzwzmmOxNiZ6VMVQJohLl59fiXKKe0UmXLSAZr5KSk6RmzEFcn0WEh5kZw6SDk+5M
         keKR5D5b84WhwGvPu85GR+ikbRkjwm7nF9rflJMoUEPL3RCdsVckSQPRSlopWfdILfYB
         6s4q/SEOe8sGuCBMGH3Y+fHqSIMSVUWLqA+TLI00hwWTJGh1IP7CWWrQSR6wyquMWKh4
         Ho58rjgknpIrkBJpHllVByr1A0vy4fx0+foqBhPkc2S7TUXLuveX3OQJK8KyZzjF7aaZ
         HGEPIBsxTk0VORJm7k9Sf+9lUtuhq8vzCcGMZWSQkLr7nSP2vg0FbudxRoF/KmQvd/JV
         QT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792125866; x=1792730666;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pirFeDtKxCRO5e9HqLTzyJ57dzgRJHoIjjnsjCYMn8s=;
        b=qhMw4kTpcY5qMDgho/Pad55LrZSfExvJGdWAkOU00D34Ub6n4Va8NeYuvAvJcdPIOa
         kC8ThJAeCurXxe31eqM9kYriv+7IR3B8UhuVn1qhI3y+iiDsJjaVvpcntmpY9YWPdfg8
         5OeJPeBWQPOd5oyeuWMAjA35J4Anzsc6Q0G4YzJfsZoHYlTHjAx7t+Uvs/BcIrXA4pvG
         OidskhnFwZ9vMJF198u64SvIxCtfDCtyXJ98lcXZ+hOyt7shH6jCCGVFEJ1/c1Sv12fx
         I61qf7iLYni4GML86VOK9mGEMDNR5E9SbrCw4WDQnWu4ZTLzOEsks+T1NOaMyjCkd1lL
         vVGQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0Dr0+p0VBoUFYcYz+qMpIYz28qOqbpngLJ83iDrUWKtfBmgV4Od2G5E4VMtAeuLpm8XRtoXFR2q00oW8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOTuXHvuPMmqDCDsdTOmvZXGxfI6B1VabidavZ/l6ldEVp9zMH
	TBdBXCNrWYiY/7K++sy/S2RQShoAY7BhqPti5QygkIw4I3gQTlFqnWWGFY3F2b91WOIS2EAS8YN
	R1tL7GA==
X-Received: from pfbfa35.prod.google.com ([2002:a05:6a00:2d23:b0:89e:9c7f:5a1f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3ccb:b0:89e:779b:d0f
 with SMTP id d2e1a72fcca58-89e779b0f07mr4005294b3a.37.1792125865955; Thu, 15
 Oct 2026 21:44:25 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 15 Oct 2026 21:44:12 -0700
In-Reply-To: <20261016044415.958618-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261016044415.958618-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261016044415.958618-8-seanjc@google.com>
Subject: [GIT PULL] KVM: x86: SVM changes for 7.4
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

Not much this time around, mainly because PML and Bus Lock virtualization
support went in through the "misc" branch due to making significant changes
to common x86 code.

The following changes since commit d4b7fb647204f0c81dfeae2d1a708e4d858e0c94:

  Merge branch 'kvm-xen-longmode' into HEAD (2026-09-04 17:35:03 +0200)

are available in the Git repository at:

  https://github.com/kvm-x86/linux.git tags/kvm-x86-svm-7.4

for you to fetch changes up to 003892d6e802a1c08ad03e8ea793453465cae7f4:

  KVM: SEV: Return INVALID_INPUT on SNP req/resp buffer access failure (2026-09-28 17:55:11 -0700)

----------------------------------------------------------------
KVM SVM changes for 7.4

 - Fix a benign-in-practice bug where KVM unintentionally sets a non-zero
   error code when delivering exceptions to SEV-ES+ guests.

 - Force a new ASID in both VMCBs on pCPU migration to fix a bug where KVM can
   run a VMCB with a stale ASID due to the tracking being per-CPU, not per-VMCB.

 - Return INVALID_INPUT to the guest instead of exiting to userspace with -EIO
   if KVM can't access "guest request" buffer, i.e. try to keep the guest alive
   if the guest or userspace goofs.

----------------------------------------------------------------
Chaithanya Lagisetty (1):
      x86/svm: Avoid sign extension of SVM_EVTINJ_VALID in 64-bit expressions

Jacky Li (1):
      KVM: SEV: Return INVALID_INPUT on SNP req/resp buffer access failure

Yosry Ahmed (1):
      KVM: SVM: Trigger new ASID allocation in both VMCBs on pCPU switch

 arch/x86/include/asm/svm.h |  4 ++--
 arch/x86/kvm/svm/nested.c  |  1 +
 arch/x86/kvm/svm/sev.c     | 37 +++++++++++++++++++++++++++++++------
 arch/x86/kvm/svm/svm.c     | 19 +++++++++++++++----
 4 files changed, 49 insertions(+), 12 deletions(-)
