Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB400448CF6
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975447; cv=none; b=cWJVDvCqOPVh0oVGcLJR699uSYsSjbWEWRCnKieL34hC6lEiukeoSCrSRduNH9hmTLRI+8WQAaG36JTaOhvCQR25Es3iZ5dEb9C/tEAjAUwST6pBuJPhBzijqGIyjghShtvWqvYScy+cuMi3bVxn8yVrlyJVHP/T4C5Q5Iqrn5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975447; c=relaxed/simple;
	bh=Vzgc4GQ6v8LJBLje/CCPKo/aEGgkQ+V4Jo/F5iolqEM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hfwVB9NJqnCxuz5B4aGwuTD2Xi3DM9lgIPXV/FWnZHtF4Go1hgqQ5z1MWaOOWIYyLqTk77U2+RVI7wgNojtZg4lcILyOicAe5JzQXLAsTSiZpzt6Mc6EK02D833LniQ8GzwU5oDp9Xz9Esi5ih91xLBrwj5ctsMDnjF+RfnZ8a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i4eMFdtP; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i4eMFdtP"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a4a053dcadso323479a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790975445; x=1791580245; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zj2KoOS6UMT82E67JqicQ3aNNrgjAhnNc2EUzwuzI9Y=;
        b=i4eMFdtPFH5RKd8FcjqZD3l9jx8Xq4dYjpjGnWJUOY1z62jZ5NxlsdUOTGNonO6fBQ
         mdkLVf1aV5qBfFaK+6LIxyiazMz9YxsIjWc22kkDqwuTjyOEbJb9e8X9Ojs+cC8+Kucn
         ltT3mB6Onpt5lKqugwgAHzsLfo8Samwvf1FtRXJLuC4mHeX1C7BHlad0U/GSiYGg738M
         Y7iEPTaRCqQVwDle/UlGQD34ReuDtX+Tn5PZeKQVbk7tmg96BX68Yrwu0+unQWrTpOQR
         xDAUJA9b4F5brl49zc0ZDzNaNqH7QPvyfiafS7Tazp1SN1DMb7G4fO0Bv7pWgqLLjWGa
         Xj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975445; x=1791580245;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zj2KoOS6UMT82E67JqicQ3aNNrgjAhnNc2EUzwuzI9Y=;
        b=ssHXx25tBXU1ibxCR8RwsdjuzGhTyY2eAO1LUx9cB0mEO3IbDNOpGSIvXasaXQ0xmv
         ZYWJNiAz2CacyqAIPc00ZKcaYXNu1V2bHEI7RDTehXFz7Xa5L6aFLproiREIB/hUAdmf
         QX+iFoKnBRpyF6Zer3Eg2qqioZpz3BrGRxrSdj0mT0RPrvoo0mytAbpV/cFMG0A8LOX/
         WD6EDI4KYQxFdi+5s6LMNcwsJC7V/9EUvWaVJvnoTI2jPycIZz/ghQSoEa7tq0CxdQNU
         ouAlk6QodsPn9HQCvBVjJPmu74dzqehhTUkMM9NiYKrIgRoX/Ks61eAc86SCw8NpNic5
         2gsg==
X-Forwarded-Encrypted: i=1; AKwUvBzObjkhFaK1gzlJeptOk9Yb2ukvJ3LEALxsT9CE0+htT0fAc5olKLgqTy6xXwSyYIBSE1H9xjuwVJGApc0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ5/CGrFAMkaPPSsj2xzHM7mmKghkEic29i7+OdNTflWNPbi/4
	4GBvL4NnhdlMiGHmx54LAk6ZFRUBoR+F1ZuxGpyxc8Pf9J5z6ryyrwkEYhjNMJmO4vYy9xTIapV
	GWxPdng==
X-Received: from pjzr16.prod.google.com ([2002:a17:90b:510:b0:3a4:ac59:c8c1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfd0:b0:3a4:f75d:d194
 with SMTP id 98e67ed59e1d1-3a6cec99dacmr3255802a91.36.1790975445008; Fri, 02
 Oct 2026 14:10:45 -0700 (PDT)
Date: Fri,  2 Oct 2026 14:07:22 -0700
In-Reply-To: <20260923155108.1550622-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923155108.1550622-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179097481958.4075691.8656886891917845607.b4-ty@b4>
Subject: Re: [PATCH v2 0/3] KVM: SVM: Fix AVIC Physical ID table UAF
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Naveen N Rao <naveen@kernel.org>, Atish Patra <atishp@meta.com>
Content-Type: text/plain; charset="utf-8"

On Wed, 23 Sep 2026 08:51:05 -0700, Sean Christopherson wrote:
> Naveen's fix to clear AVIC Physical ID table entries if vCPU creation fails,
> to ensure the CPU doesn't access the freed virtual  APIC state.
> 
> v2: Add prep patches to consolidate the table bounds checks.
> 
> v1: https://lore.kernel.org/all/20260903062856.2090499-1-naveen@kernel.org
> 
> [...]

Applied to kvm-x86 fixes, thanks!

[1/3] KVM: SVM: Add paranoid helper for checking if vCPU is AVIC-addressable
      https://github.com/kvm-x86/linux/commit/86a24feec191
[2/3] KVM: SVM: Use "is AVIC-addressable" helper to sanity check load()/put()
      https://github.com/kvm-x86/linux/commit/12e0d427c335
[3/3] KVM: SVM: Clear AVIC Physical ID table entry if vCPU creation fails
      https://github.com/kvm-x86/linux/commit/88c15bbd43ae

--
https://github.com/kvm-x86/kvm-unit-tests/tree/next
