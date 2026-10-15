Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1493F9294
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100694; cv=pass; b=a5qmyye+n6Gq3CfzGcyQ2IBMtdcLZKQFqZOhxyIxYwPkCF9IRoEqNrPhf/8vJ+i0ctY7PmfVmp+9Glvc5GBJ7PqB7m0inaiiOm3J1TMFRpCoB+69ld5l40/uVInnlBSCWDznhaf8LfOLOHsxXsJaE8qHakBMeTvIIFxRfu4q6NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100694; c=relaxed/simple;
	bh=VulLeIoBX7+WvSRBYrLJb/oaYRWw1efO4iiCwh0SFJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6c6BeV0AiHsfaVXYcCXkKj94GtKrGM4pQsGiVmj0VeNZToCLkK/T0IS+DaC6Ew7/OQU9jYWbl4EhxGdwhKfO9DJGeKVODLrbN+ZlGKEFFC+fg3pZNTyaP5ovq2sT6tL7cZPhwJeTnjThDFoMwl+dGzt9a1/AeX7W6wCdyoBpQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jzXCWKWy; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jzXCWKWy"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso4181a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792100691; cv=none;
        d=google.com; s=arc-20260327;
        b=djnjMF0dKfLMiSFK3Dd2shvwqwTXm/vCIEFeAMAGRg28J4ADUFDKz0geCMUMgCnf0Z
         uTHR9fSMC1LZe73JW8we0GHJvg1Sqv+5MQ/GJidcVKCXro7J0zHzxJoCNWmUjnXL5Nkp
         xtHmcQu1vXUD8h6+b8bRDEFiTia/haHRK+sN9RcSh2pe0/7iHStaPs+G86bDcyklJL8E
         T7uqLp2keIDNhO7o1ZD01Ehkf/mp4+kKvLjb7196yloxz0jNwOTMl3YJrH44Z7YF+hAp
         P6TmiGHv+gWNazcoOwueH5CR66HqqhCgHFGLvBib7WfnZVNqVezhYid7HksWgKY1fnKA
         eyhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J2tauij8/FIv+ZF83BeJIOnsdUbtSr9TFwP9qp1j+qc=;
        fh=PKvZy5X7+iDwckiLoOymU6Xg2LZzDEtDlqV5s4DcPpM=;
        b=Jp7pfJLueUFzyTSPbI28+0bcSmlLSHbeFWfMzprlWJzwE0DeeogMAVQu53HQSHVtRT
         kSRecC+FevQzAKZK7sqPjfIXsDw1lZEtsMaoCaPcO8qWt4KwBvUZZJYzfsbZSCDg+o5y
         aXoF/vZHOGTBqvvvbvbahxite1KYagpbkGFcxGVceNEEgu6CdF/E3LzkZCof1XqVWRFN
         91bIB6Nsj3vFN4hs8RH2VhmXPaXLGu1/OHga55NOhqy8cwvfo6Nw2faStqLcbkzg/DJ8
         uYgndlBURLeHJzVMMi4mwXp2Sunu1AolFBx6i0zt+KV/hcMZyDgrH0rOuIWo2xEzlEUw
         l62Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792100691; x=1792705491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J2tauij8/FIv+ZF83BeJIOnsdUbtSr9TFwP9qp1j+qc=;
        b=jzXCWKWyaDFlRuMMnhI3ZqqdAquVIdxYPkoqnQk869dEpzvCEZorU7aJoFtUZ5Rkmz
         4MnHAoEc2CJpb8OT3tbpDndbqhq6FAHw9Meev3IMCJ3vTySTz9uDOX9QdyJHdymTrL3U
         6PTtb09H4VYi5sJtx0ru8WnhyXxpESGdebxtOk93YVkrAMVG6/NqJqUQPOi7C3hgG0nr
         jX5haikwzcrgoxE6B3WYnymKGx7Dt+7a6oRjRJ+36eTOBCmbZ4tYKpXU4Y0Jd+2ETsd0
         DZkLYD+AktD8bHn48kwr8X8N+sXGcP39HTI+3D9BiDPT/10o5//oufK9fejj3kUs487s
         Y/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792100691; x=1792705491;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2tauij8/FIv+ZF83BeJIOnsdUbtSr9TFwP9qp1j+qc=;
        b=IQeJ1bH51o6Ox3Gboi0H40eQqpr2X3o2LQ0IJo51SBIM2XVZ3qEpCv0FRvfuPNxbtH
         zt3YKiIz8zrTXTpTmcvoGiJfzjagT06EZsEBH19LRkMmUgKutQUZwmYej4KrB/tbp1hZ
         cYJ74pG5fk4VVjZL8uFNk4/pyQAguoIPXOtGrfYw3b2XUADv9sKGzZ+zCXMgIfUPzjxf
         n2BolGlYJzAKPWibrgb93mN9fcwmh9r/JxxUV5y+S6Gg6SWRn5yHliuuzKB5kqiMYImM
         fdyhi5qD8tJ6QNBlifvk46liUw4Hv63ElrQTRFFoAd0ZRGw3Gq5XHUq6k5zk6aCWvf7Y
         iVkQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1D489DOIZJnqPjy533cJiCmUkiKXlAjUIsme0TXtAazaxgY2H013PVYLf12iS3UO5otKoeTa6qLFfx04=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrZWN7ioGCD+Cxf4mLUHJKCwAf5gf97iZdRKkNS+lRKmMVBT8V
	SOpl7yU6WJxkkuq3BN2Gl9NkvEbBU/1uj2FPJsXpvxZTt2NoEQhhHocL7VbqgQx9T9nr65vtaic
	RWw8K5KNbTuAFT/Mm4Segkz5SAeGVsrinVIGdoP2x
X-Gm-Gg: AYBFou3Z8bEStNx4IAC4sqO9acnSo4EgJZq91Rmsh1ZcS8b5ZgEWlmNrYQ+sA86D2lH
	VulDJDZzaxA1cdf0H62Wc5x0J9MwSFlM8BId2j+k12p8WLCqhOuWMySKSCWOLMkPEp8VvrCL3S+
	nH+4dXkdgxOFVwpLbATG1V65MUjn9hD5Loc5I9DenIjGCP1uYwdTD58+2ncxtcBFulg83OVEPIT
	jo2LBIWgPmhgjD3TJCuu5x25W9kSDes6vNZR0w9bY5xM8kCrI044GrBPz5WQwrlOGPvBq1tGKzm
	bNID4mGFeZOdt+PYw97S29ZMP6k0AY5KxQ1Bsc6Rnm4As/+tITfloLU=
X-Received: by 2002:a05:6402:512:b0:6b1:bc48:2238 with SMTP id
 4fb4d7f45d1cf-6b3894961d1mr19975a12.11.1792100690504; Thu, 15 Oct 2026
 14:44:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-12-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-12-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 15 Oct 2026 14:44:38 -0700
X-Gm-Features: AclHuK8Uq8sH_z4Z0am-zDBj0JfGwxILB64drxWhh9TWDwz6VRj3Ca40Gs607RU
Message-ID: <CALMp9eThakVB_zqPQX=fQLrKh13BR33jmGg__rncOLDa2ZkXWw@mail.gmail.com>
Subject: Re: [PATCH v3 11/27] KVM: SVM: Only flush the fallback ASID when used
 by a different vCPU
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> Instead of always flushing the fallback ASID on every vCPU run, only
> flush it if the last vCPU that used it on the pCPU changes. This avoids
> constant TLB flushing on a vCPU using the fallback ASID if no other
> vCPUs that use the same ASID ran on the same pCPU.
>
> Note that checking (and flushing) the current ASID on vCPU load is not
> sufficient, as it is possible that a vCPU is using the fallback ASID
> only for L1 or only for L2. To do this correctly on vCPU load, both L1
> and L2 ASIDs would need to be checked, and the respective VMCB would
> need to be flushed. This would not be much simpler, and would perform
> unnecessary flushes in some cases (e.g.  loading a vCPU that uses the
> fallback ASID for L2, but L2 doesn't actually run until the vCPU is
> unloaded).
>
> Another alternative is always flushing on vCPU load if the current ASID
> is the fallback ASID, and flushing on nested transitions if the new ASID
> is the fallback ASID. Again, this is not much simpler and also incurs
> unnecessary flushes in some cases.
>
> Do the logical thing and track the vCPU using the fallback ASID instead.

Wouldn't it be simpler to track the VMCB associated with the fallback
ASID on each pCPU? Then, you avoid any confusion regarding whether L1,
L2, or both have been assigned the fallback ASID.
