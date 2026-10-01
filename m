Received: from mail-oi2-f41.google.com (mail-oi2-f41.google.com [74.125.231.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C165349D5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790888947; cv=pass; b=VdHvydta/r0hSGwO4G+gz/qUpG7EC3GGzDzefj9vzt9Ej8hGbMS2Y5GCZ8Vw4EumFAUkZkOPxeW80K/m8fER18wopm3hJcqR+kPHpcWiVwNEAu80vq44hkGRd6+jOdxK8XHaBgs6BrcbUNrUsd4B5K1Wnxk3nEPXLGnyZDYoqRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790888947; c=relaxed/simple;
	bh=msNjM8JCH160FpndWx5PPKjxcUatum5lPEo2xPvWifA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YqIf8XLnk20NaFJxuN6HVs7Sx02gi2scKt3eq2tC7VE5O9BWafO6mT8NQeF404HfzQ6QmETaWkgfwRM1CEBtPjorwRwCWx86BrYNCCxGop4FitF4ofOa9EUEvax8gwpGU+RbsAn8dpKpTNpsflErzGK+z4LF9pbbZxHXsjuA1Rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hvUjgrPy; arc=pass smtp.client-ip=74.125.231.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hvUjgrPy"
Received: by mail-oi2-f41.google.com with SMTP id 5614622812f47-4f50193fd21so256282b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:09:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790888945; cv=none;
        d=google.com; s=arc-20260327;
        b=LAs8qI/QjyBY6kry/YlY9EfqqOVuGeqPxa5K1q7b/hTmlwTmfoxjZgGNLIDVKPK2M6
         GpUbHaizi5DtBf/cz3kdEijCT9EMkPaNLsq6/sFu+yBPi4vBu+INFF88RzA/mQISWYfO
         687yaEZ1fVzk3Hgqxu9xXww78Hw7p13a+FNZCuhr5E4jcrLXkKhqT/6MkpL8k+7FRtdB
         lTsjtqK4jvBftQ/5S5wMr35tXZ4YKup4eYcUb4MiUPuqP7Odc3InzCEohCE5ourjmn3n
         jN3XBSNgis4v5Wd0UNfsfG+xGX875D0wEK7WoU4JyfX2cIFuJAgWroDz7WkXQR4Bda0l
         IR5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aFokuiRNz9wJ8Ezep4PHoXeKqh3XHPyJk48utuNejfc=;
        fh=5WAKhECTbmn+w/oTmhZDKUyoHWJ7VlVxwKoj6wA9Kpg=;
        b=aXIZzlK4HQ/bcmn0oMBzX4NpQ3cI8fNCaq+PCYGuyIdyxHI9TvNbJECwSUjHDGkiSY
         vdtu+++ZnumBSDHqkSeTODZ2GAojJr52XYriHU7SLx/32xAWYyQ+k6UAB41Lqq9qEY8M
         NOTltJcZ0lfpazpVxGgMIl8tqsC6sAzMBiP4WEjXqkOHv6pIUVk/YrTqW1/pOm5655wS
         xHf9QuPsa2PCyd3/Wy918JbWNfx5b+8hGAXH9tj6+Xo5t9yc/wrgNqh9EpnELkhog7u5
         ir3rgVYLsWecvFwPJ18pB/il5VSQeoXI3mWiCv59oAEbBqM9cTqbftk254FsD1uAaSSq
         1Niw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790888945; x=1791493745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aFokuiRNz9wJ8Ezep4PHoXeKqh3XHPyJk48utuNejfc=;
        b=hvUjgrPy7vbTN57RSm6OJJFLJUEcN4EDY5ruHEhA0OuSiqnlqFs1ZksILOUPy8pS5i
         +fhRMmFqE4HLRIecedefa/zdSpEURtPpw1yewQzgBx6FFdcoUiNfMJ9bK/KqpyBjC4H7
         LuQ3hd5zmFr17bFsi02hPc2f2YXUbr1sntjRxyYRFqPMDladbHiKCCwdKIrjai9hgx6L
         2Rfy07F2bgjHPt70LZU/F5tCaXR5L1DwPAipT2IlVLfpi2w5JWMUiDSTSlXyzEVLFDbL
         8A3Hs0K5dR3yQrAEnkRbj27DrwaSgyKIaqcw/iX7WPnRMLEue9DV/eSrIgy+G+VO7OmA
         fe2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790888945; x=1791493745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFokuiRNz9wJ8Ezep4PHoXeKqh3XHPyJk48utuNejfc=;
        b=DQOjH+3Eg7QJZRvjTBvMohRz5rRnJQT6GZsBthMn/t+lz7RDemMDfxbEOAaOCuY6pO
         Tvd3lj8izNAc6b5e9WNK9pzBnmA8CTYiTOCSn/SMovlTprxQr1z3ECv2/T/vtjUuhjj4
         NIQxr0hMcwI1n9gZdYKWXoBOUhk6aw3sEwmQUPgAnSkUkTdLFHYrqGpOjSw5SkFbFuuu
         XQqS/32jd/09SHpwTEtQMr+0XsqW8ZjpHsWX+OZvUPOm+GBHiRLZlPVeUZkNgcNQmWRU
         B0huUrQdua96iXi6s9HyR10P1FbJgI9R7zdbEuz+7D2rIVnyN3ZhF2pDQ77RcT6F1klg
         avRA==
X-Forwarded-Encrypted: i=1; AKwUvBzzfURtkgMKCEvoXQ0zCbtqMSlfHpmSR2ecyjB4ccnnn63WAYyEUAOxygVa4ee2LlnnwkgVnM0tjU9NTbI=@vger.kernel.org
X-Gm-Message-State: AFuF++kWhqAWMWi1CheBw7ewJUnq8/54Xdm8W8wL7IpAbVmGfCE7B161
	fEhY0y1As8ybW5tPiewX6vicLhtU5Yjo8LWVxbehF7mlaO7P4ETXMl53bl0rtGRqtIc18/RiNHd
	2yet62dsMad7EIPrCWwB9yhAbmH9334IEkBfDA2JQJ6OmTBu72Itfn7Co
X-Gm-Gg: AYBFou2wTdNZC9B0k6OqV8HEgXT2heRBlvUuDIqu8bShYGvCHCgh1d5Cc0VBm4mU+um
	q9gDklveo6bd2/B4HUjoSTqlgAyS4RxZUOythzmCrvyWo9DzsCiAhh0z6HqDIZLf6pE2b/CxSoy
	bGW9p4PRf04es/ZvQYubH5Bawh+fvRRnl56s/+8qH0mrJT3v38XyftqIlyKBe2lxvBCITwaFKYA
	g0JruKST/ZDOY4Fs7Vcq2/6YXKtYCy4ZSavrBRmZ+45RilPnrFuPnxW8wOax/rwxkG81kMDIuO0
	6/43b0G+ZpXBKlV7eeWq7uW1TMCtttFUl6SqW4mbMDAQm5r9aRYDUo5d6hrRPm0bbGkctF+aoPX
	SOXq5Pzt2oZ1KpNYebnRDpN6TZuQ/Cb9YZ27XSwGWppViSzzTtxBqjPhJE5QrB2XY5qjhm0wjoK
	efcLQmk+YqfGkd4Gv9kncNuJUk0LRsQFP+kw==
X-Received: by 2002:a05:6808:178f:b0:4d6:93e2:5bc1 with SMTP id
 5614622812f47-4f52bac82a4mr335961b6e.66.1790888943910; Thu, 01 Oct 2026
 14:09:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001202234.3794060-1-seanjc@google.com> <20261001202234.3794060-2-seanjc@google.com>
In-Reply-To: <20261001202234.3794060-2-seanjc@google.com>
From: James Houghton <jthoughton@google.com>
Date: Thu, 1 Oct 2026 14:08:26 -0700
X-Gm-Features: AclHuK9qRTMsBWUaBrJsyydGSs8bKMO-n0iK8nixdC2P8OF7DD2-ohxFc2SMwec
Message-ID: <CADrL8HWDy64UH0N4RCtvgL6zP93jnwr91xjkWerEs1MBV9JH_w@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] KVM: Reject user accesses to guest memory if
 current->mm != kvm->mm
To: Sean Christopherson <seanjc@google.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 1:24=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> Reject user accesses to guest memory, which are supposed to be done only
> in the context of KVM_RUN or similar operations, if the current address
> space is not the VM's (host userspace) address space.  If KVM writes to
> guest memory after the owning host process has exited, or if the VM is
> being destroyed in the context of a different process, then writing using
> the wrong address space will corrupt a different process' memory.
>
> Reject the access but don't WARN() or KVM_BUG_ON() event though attemptin=
g
> to access guest memory with a mismatched address space is a blatant KVM
> bug, because unfortunately KVM is buggy.  On KVM VMX, when a vCPU is
> destroyed while L2 is active, KVM synthesizes a nested VM-Exit to force t=
he
> vCPU out of L2 in order to free the nested VMX assets, and a side effect =
of
> a nested VM-Exit is that it flushes the cached shadow VMCS12 back to gues=
t
> memory:
>
>   vmx_vcpu_free()
>   |-> nested_vmx_free_vcpu()
>       |-> vmx_leave_nested()
>           |-> nested_vmx_vmexit(vcpu, -1, 0, 0)
>               |-> nested_flush_cached_shadow_vmcs12()
>                   |-> kvm_write_guest_cached()
>                       |-> __copy_to_user(ghc->hva, ...)
>
> Fix the bug broadly even though the "real" bug is that KVM abuses the
> nested VM-Exit flow for non-architectural purposes, as there may be other
> such violations lurking.  For now, punt on fixing individual bugs and
> hardening the common flows, e.g. with WARNs.
>
> Opportunistically provide wrappers in anticipation of adding more checks
> and hardening, i.e. growing the logic beyond checking current->mm.
>
> Fixes: 61ada7488ffd ("KVM: nVMX: Cache shadow vmcs12 on VMEntry and flush=
 to memory on VMExit")
> Cc: stable@vger.kernel.org
> Reported-by: Jim Mattson <jmattson@google.com>
> Closes: https://lore.kernel.org/all/20260908132838.2116068-1-jmattson@goo=
gle.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Thanks, Sean. Feel free to add:

Reviewed-by: James Houghton <jthoughton@google.com>

I wonder if it makes sense to add similar hardening to
kvm_faultin_pfn(). What do you think?
