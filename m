Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ACF3C76BE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975349; cv=none; b=JmuF19wyhXQFkeJLQrNjJNGC9CGMRXFAMo8kNO87e6Al6YWFSz5S3fUuugxNrGMxKWq3kBFiafFUFMpM6R4fAIP+jUlm0Y7l6LY8iyn1oZgnxYwIFOzeotlANXKUzxKoPat+O1SCGzul02hpCGKcZe3RLeuUfTjQ0Kxs2FwagEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975349; c=relaxed/simple;
	bh=j6Zi+zurKgGTj9uxNivX3xHdmyUkwa9fstnJW+COgfE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ozJVmh5owj5s/xkCUMyrjoys+tpVdwhYmc1cchWByYpmXmBVqPKfFz6EcZgebnLlz0vLomAdzf+O4p237OmGKnuwHPiWjJai+xbEuOrtMrhZsE4Li3XtN5dBLTrdZd3HPfPJllypyhuYFLsJ/nbwt43RPDNq0Uyw8sQfZudofAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eWDtOtkD; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eWDtOtkD"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cca35cf9f77so11652a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790975348; x=1791580148; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n/VbMTC4ZRFEznC5PpElWsFqhiwp/RHv/s55T+07JOw=;
        b=eWDtOtkDzG+1p0AMt8cOgQEdTmHutjLKAC/OhKBUkOFF1cvB2WHJGqjYWc6uK/MlMW
         l4c+GEe/PFsSgqdDnkbO9fi27yhGNBcDdBHqViRBpsNNrnr4d1W3aZob+5CgOBhm+2x0
         2OExJKSFNfgGf0b+a+ut/y3Zw0a/KsiryLqW+X0V8swWa549KuqFoZ3PPAko166p1AMI
         ZDM4TvBi0iH0v/NexNzRzbnRQWy17g4oxJOQbXzRC2iV8cNIh7rA5AFcot1la3b8gSgL
         INyqJpKYZKw+qS8R4g9aPLcHUuj6LljOcNZe0fNJl5fexAX3GUrdjLFY6k8+d2NLBJ5b
         Kpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975348; x=1791580148;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/VbMTC4ZRFEznC5PpElWsFqhiwp/RHv/s55T+07JOw=;
        b=sgsoBTNYzYcZrZMMSwGiJANyNZLKM9lxRuHmomCo0sB38ZXg+v5mylTcvpd88JPizN
         YsmMm/ag26J3VAMcQwnSUsEgrS+fXxQLBofBpKhEpfslyVlc/FmIlc5JhDJMBj2xRRuq
         TDhWpavYoP5uDNCNPjF1SMCtIWuPe5MUiE4m0/YOk/yF0LdhuoMBKr2hW4zjOkTDo9kr
         yT9+v3clSLY+fJDAJ9gbr7uNaZNVxH9KuA4W96YD164C1lZRPTxOpQ4Vo4aDYfXTWC/r
         tYVFS8vv6I1MHgBocrEFUm7b88UV+cYdKmaDrbLCLZY8OEmjYwHho0Lm+6L9D2jGfQHF
         av9A==
X-Forwarded-Encrypted: i=1; AKwUvByCdkTlmeN7SFZwX64W57cSJjckK0E3+8cXgWMIAE/6/DdUw8bagAikbDya7D8y+Ee3YEl78GgsAce1sBs=@vger.kernel.org
X-Gm-Message-State: AFuF++k4pQ+fPCzGFexuBOdJ4RQgc5XUj1yIfU06hojfVAvN/uqgddZ+
	4pc/RnzV2BHRZRE0Gyrob4lYYNDD0u9p5HGpxSfPAavV9y6ex7wB4B/lIOADDMkTaMekE9Pq9KA
	InMghVQ==
X-Received: from pggi24.prod.google.com ([2002:a63:cd18:0:b0:cc7:924e:a5e0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:748c:b0:3dd:a195:dd55
 with SMTP id adf61e73a8af0-3e0bcfd7d44mr3688239637.55.1790975347673; Fri, 02
 Oct 2026 14:09:07 -0700 (PDT)
Date: Fri,  2 Oct 2026 14:07:12 -0700
In-Reply-To: <20260920072459.3485710-1-mike.malyshev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260920072459.3485710-1-mike.malyshev@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179097512748.4084228.12636308685024078577.b4-ty@b4>
Subject: Re: [PATCH v2 0/2] KVM: x86/mmu: Fill memory_fault for unresolvable
 guest page faults
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, kvm@vger.kernel.org, 
	mike.malyshev@gmail.com
Cc: amoorthy@google.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, x86@kernel.org, 
	chao.p.peng@linux.intel.com, xiaoyao.li@intel.com, yu.c.zhang@linux.intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, 20 Sep 2026 07:24:57 +0000, mike.malyshev@gmail.com wrote:
> From: Mikhail Malyshev <mike.malyshev@gmail.com>
> 
> When KVM cannot resolve a guest page fault, kvm_handle_error_pfn() returns
> a bare -EFAULT.  KVM_CAP_MEMORY_FAULT_INFO documents the opposite: that
> KVM_RUN fills kvm_run.memory_fault "if KVM cannot resolve a guest page
> fault VM-Exit, e.g. if there is a valid memslot but no backing VMA for the
> corresponding host virtual address".
> 
> [...]

Applied to kvm-x86 mmu, thanks!

[1/2] KVM: x86/mmu: Report a memory fault exit when the fault handler EFAULTs
      https://github.com/kvm-x86/linux/commit/64f1cf288440
[2/2] KVM: x86/mmu: Convert can't-happen fault path EFAULTs to KVM_BUG_ON() + -EIO
      https://github.com/kvm-x86/linux/commit/98a843669196

--
https://github.com/kvm-x86/linux/tree/next
