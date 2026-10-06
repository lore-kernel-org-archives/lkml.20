Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2582C08BB
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 05:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791264191; cv=none; b=lgYU49euCcUQtwK1m/3wFqSPyF6N/k+6Q/SyKnEwdJv8uNC4pKez9wPhDljSFAQtD+BmhWDLRDKOF9NXoukKFHpNPc4kPBn9VzZXfUByj22qiiBhK6ydf2KuEU8ja0reOueEvpaIlb/4+TTc4CE+M+83D6yzH2u0+el/A3I8uEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791264191; c=relaxed/simple;
	bh=5CvX4CaLAI1cl5Ua4CFmGWcyr0aXnSoTcPE3NaoLL2E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kzZ+zGtJRExdRYcX3Vei4icjTfa6F6hMyOrZXMZpzHffjaXiED7aihFPck2+dHPFzBjl6DB0wAFrPmYjWbJrZb38iEEiWhdKKL/oKLWl2G3LQf0nHEPFFzxs3/iX5A1oxPkbEbfan9BymH0jA1oWL14/ffzRtal1EKuwav5LCkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V2zPOYjU; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V2zPOYjU"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so2487993a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 22:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791264190; x=1791868990; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ayb5/D9Gva1Fg3zHF+BlyoDquA39jM9u/UjlBSYX5c4=;
        b=V2zPOYjUtPMOnmXGNST0GoXI/9qIV/2tNWiDIJqWuKuSgDXWCuCh0XKESnSHBAJZzI
         4aa+q90B/eWJuh/qq7ohKc9O4ftQAJydwIjWFL/JvVTZkr3ocNmliBtXgyGY3ZaYCH1p
         oW80c85Eja0DdPUci7QfQgFx4OIABykHi0QMcuN1z/We6mR4290jhoxhYkUr1jNkX4Xn
         +dDO+BgGOvrA/BT6TInKa/gWCa8WHEUrkyYNYfh7/BDjQVHjgmidKTaLTWPjqhyXtsWx
         /OVv44hi/zMWTIIL9aX8fUZZPKU+60gITDZtVlmGHVB64I5hgATUE2/AVadobPL2eYxv
         y2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791264190; x=1791868990;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ayb5/D9Gva1Fg3zHF+BlyoDquA39jM9u/UjlBSYX5c4=;
        b=Hia5sCc1yjIHz6Om7QqcltcOQLb+HjI5hUvKjkw339pWV4O4CB0r53cAobcHSklXw9
         9F+kZ2SsYq6EB/HTXg1Dp0uhflb5ELdUiJ+0heqmvwro1Nsr/Jn+YzizBqmgBRIB43j/
         W40Aen9ONe5u/6hfynM7zvsh8wvvypGdxxQco63GGCNbi2agZHlQLuj0qoekfGl4NXbX
         UvGturh7qx//ujhvE2lifiuBD306O8/+gs+PFqJXPx468edO3OuOToHvI3xIkDKM3adK
         18g8swS9/aBOS8mYVq7w3XUERUoG/NFRwVSVk/hZPd4yLvCcaVGGTwnpiCxDjxEuPMtr
         2eiw==
X-Forwarded-Encrypted: i=1; AKwUvBx3co776BH2XSh2UP83MzHDmf8QRGWGtaEBmeDGWF5N9Rnt5B7NBch97/rB6I3ynMWzEVACSXC+rF/gFNk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqIfWLDEx6wfC3b98Fg1v7a4ye4g/ytbMKjUpMQIzrYbj2wykC
	aHoW6bRJPur0q/eOxHiQT70VO9r318eEnIaIYg7tO0QyVBiKkuWUqm09AdvqinVTWQLyIUK029B
	TT2lIIA==
X-Received: from pjbgw6.prod.google.com ([2002:a17:90b:a46:b0:3a2:ae7b:1cbe])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1846:b0:3a0:c276:1ec2
 with SMTP id 98e67ed59e1d1-3a873505c1bmr107106a91.19.1791264189395; Mon, 05
 Oct 2026 22:23:09 -0700 (PDT)
Date: Mon, 5 Oct 2026 22:23:08 -0700
In-Reply-To: <20261005192010.66037-1-hmushi@amazon.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261005192010.66037-1-hmushi@amazon.co.uk>
Message-ID: <asSFvLmurPm2O8wY@google.com>
Subject: Re: [PATCH] KVM: x86/mmu: Fail nested EPT walks for GPAs beyond the
 EPT width
From: Sean Christopherson <seanjc@google.com>
To: Mushahid Hussain <hmushi@amazon.co.uk>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nh-open-source@amazon.com, mushi.shar@gmail.com
Content-Type: text/plain; charset="us-ascii"

On Mon, Oct 05, 2026, Mushahid Hussain wrote:
> Fail the nested EPT walk when the L2 guest-physical address has bits
> above the width of L1's EPT. The width is 48 bits for a 4-level EPT
> and 57 bits for a 5-level EPT. Report no RWX bits in the exit
> qualification, as for a translation that no table entry provides. L1
> then handles the EPT violation itself.
> 
> Hardware signals an EPT violation for such an address without a table
> walk.

No, hardware does not do that.  See commit b628cb523c65 ("KVM: x86: Advertise
max mappable GPA in CPUID.0x80000008.GuestPhysBits").

> KVM's shadow walker instead indexes the tables with PT_INDEX(),
> which drops the high bits. The walk resolves the aliased address and
> KVM installs a shadow mapping for the alias. The CPU faults on the
> original address again, and KVM repeats the walk without end. L1 does
> not see an EPT violation for the access, and the L2 vCPU is stuck.
> 
> Any L2 that references an address at or above 2^48 under a 4-level
> EPT triggers the hang. The easy way to get there is a MAXPHYADDR that
> differs between L1 and the host. Take L1 MAXPHYADDR 48 on a 52-bit
> host with KVM's default allow_smaller_maxphyaddr=0.

Which isn't supported when allow_smaller_maxphyaddr=0.  And allow_smaller_maxphyaddr=1
is basically a failed experiment.

> A PTE bit that L1 treats as reserved is then valid for the CPU.
> kvm-unit-tests "access" and "vmx_pf_exception_test", run as L2 under an L1
> KVM with MAXPHYADDR 48, hang at the first present PTE with bit 51 set.
> 
> Fixes: 37406aaaeebc ("nEPT: Add EPT tables support to paging_tmpl.h")
> Assisted-by: Claude:claude-fable-5.1
> Signed-off-by: Mushahid Hussain <hmushi@amazon.co.uk>
> ---
> Reproducer:
>   L1: KVM, CPUID MAXPHYADDR 48, 4-level EPT.
>   Host: 52-bit MAXPHYADDR, allow_smaller_maxphyaddr=0.

As above, this is an unsupported, invalid configuration.

>   L2: kvm-unit-tests "access" and "vmx_pf_exception_test" under QEMU.
>       Both set a PTE with bit 51, which L1 treats as reserved and the
>       CPU treats as an address bit.
