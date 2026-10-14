Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653B24D09E4
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017946; cv=pass; b=NreZN9rksEPYQt2uXydihK0p8TJ/YRIi0oAHcdeK3oFF+fr98eXFHXrXiQJzfNyrzkQWLfUC0Jbz1ThVPR7kIQvSaDqMG4vSeL/srvSJp7732UJBzTZfK8Zypsd9PZzfLN4tnBFEEDbuyxvc/ZMBKtMKJWIWX+dxWFPxwMFVKpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017946; c=relaxed/simple;
	bh=FaLLI17eGdjyn5N84JJJAxyH9MytVJDuiLxXqWyVw5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j3DZxqdlUvLgQupqIoEKqLsaQbMc65GYJdsTofrHO5aN6R0AfE1WH27bU64wO7vfdE/9g/4F6T8BSKv/BTYTbC4n6wHWO2e/iTERrzKsZp/fL6a4kM1SFYnAJ6nNt5BQL7uFpedNWZ+lx1jHv6ra1yFc2RY+flc4uuza8p7vdH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lu9ZiAqR; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lu9ZiAqR"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso682a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792017943; cv=none;
        d=google.com; s=arc-20260327;
        b=GK1p2MTI//lyA4WiLsR42j2XzdrjpwZaXE+qioQxpFV83FssbT1e0Hq7xzBICq+AZB
         0yEainG+5lDNWaVWCaUbtvIwSClBQX9Ko+wAjRq+Ro5evj0YHestO9AkK7KfKhRwZjLL
         ZdB1UUWmFvidSCnUMlljobksa+H3xDU9J7mc7bbauga/24iYuFLmxOV+OG4jPWHP+7Vt
         +UvWpCEli0bdaTpSpTBZJLRqq3SW3B9i86+eg+BFAalvj75K5NqrTXVFKbLgWsAUrUYg
         UUng3eWb807rlv/UQ/iMvK98Vk0QVdeWDdKqSezjWWBWT9oT2n756ps2C3OYJ6BX45cT
         ZcNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vNhlAzluPgq2vRINJzjMs3q40Gz5dj3N3e0lDI/4Izo=;
        fh=dESTwZW/Sa4CO8k8wdjrbLd9YJGXPoEex8ErT6p3WA8=;
        b=kunhm68g9BYehvhUsmrQHzHi31Y7Y6zH1IPVMSlarkq2J/Q7fdJAUSf+/dTALDIrHq
         45qIn9MPCJzQcyNt81Aqmyv4xvl1FxBZK0uWudmVmWi0lnZUkYKDlB/XlC+yThXCbH69
         rRROPFifKtsvht05uS7rHHsQG6uHLipvrhwHfkGNLJkI8UbaUxX+IHpjPYIwTleOaI1z
         /Pq2yrmthPaSwOHQtfEHoGG2ReZkYAG55WsAtWGI2qJo+Y06HivSQ8Bm1sKhovXst02b
         pS67cHPofSk061/k4hIeLE+S0udYfykZtfGUqodmwFTY6hsGt6MoRL0SyBgwc3ehdcKk
         OkiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792017943; x=1792622743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vNhlAzluPgq2vRINJzjMs3q40Gz5dj3N3e0lDI/4Izo=;
        b=Lu9ZiAqRlEqCUZgxmyzxtFyuXYNYS/9nYP5xjXZa3ZzY3Ew+pG2wYM9s5v98O9gJTH
         LW2iSzGgeklAc25V9Y+YGwmPqgKaOFonOE7ShrLuENRm5bSNKtHj+bt4HyQK3yC1suwz
         F1gC2aAIsQBuG+5r/qkgQowjI3sZXnIv2HaR23+EemtnheyYMmVscCfL7dXkPVpk4ony
         voZywp2r33mQH6fBieoPk7lj5XyAzywcnyoeey+UfHH/KBlxqrLFjhHc5/YG3IY5hlqD
         Hyb77gyZ0rsm1n8YSWl1i31OGDUrNgCJGjJxf/AmI4KCpJ/gcWUSF/feBtp5qFHNLnwn
         YmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792017943; x=1792622743;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vNhlAzluPgq2vRINJzjMs3q40Gz5dj3N3e0lDI/4Izo=;
        b=TJhd9H0k1igCYN/7n8bEHzuwTXPDFSxzvrg3Q4teYoe9yGFHcFCm0dmfbBotTb0Qj3
         OM+Z2fhY+pR3BknrAOEgsqHC9DGF2rFF3UcNjZdF5qnDhxKItRcrHfbNcNxEA6OnoOff
         Hwdl00C2VhAdzlDuNcS357nWmYrjNIuTP0Ajd32dbTKvPKyzKW7iOn9icYqOubGZCO0b
         MOC+y2mrht3m40NVWohaZxv6c+4XmrZBFJGG2nIfdqbOjh5ObGzoCCUbEQJaZlVOc60S
         YUbFZHZgG66NDqHcmvCEm/0yUxobry6dAYtzyRpuz4hhZzphcTuo5sAXn1/REdZ4Za/E
         0kPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmygN0W8RTzoRG+PWXjaXUsO+LijX6dEeZLKUOaWqdk8yTR0naYEGIhCxk1ygBC/43PF6v4ILPoUwnDOk=@vger.kernel.org
X-Gm-Message-State: AFq9FYICX3l0IrEAo88ao27k3KmYGXmdo6xo8WRTjC6iDrhItpkhlWAX
	fkSnAxHmbtnpUTfVmowVQJAJMoDli+Hv2RkRKygNc0Xx9Df1oKmY90S+guATd9OD16nN7Lq31gn
	XIRP8zPR2cLzP8Qn0fDjIcICUzjXxNDeWP2JJg9Mx
X-Gm-Gg: AYBFou3iVoRffPP9T5iO6reRmtBcsOGzVxAd0St7WF1/O8bZF+uoA9UJMkYGJp3n74Y
	gX5sWGU3g4F2YdqqTipgBFIE6fKFFdRl69lv2qNfFjN6OaI+9PttU/zQMQbwrUuX+kuxfj8nE/o
	1YbWudevfqpO4Wcs0559BXnoQmrQiKo5hOdJUHMgF5bOjuEIjwpMCBWIMlXiGejpU0YrTAgEiIt
	5G0SguQerI3690iWsIh3yWM2xDun3t3iT+KlVcrFs6q7ZTVzpTfW0B+FYj6inf4sXW8ghNjP8db
	5k0A6x0EBTbJ3FVLzWyK2AnJY3mqMiXMMf9bvUNlg+xRv0Y6grnvKac=
X-Received: by 2002:a05:6402:a404:b0:6b1:bce6:1220 with SMTP id
 4fb4d7f45d1cf-6b20aae70bamr66662a12.12.1792017943090; Wed, 14 Oct 2026
 15:45:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-7-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-7-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 14 Oct 2026 15:45:30 -0700
X-Gm-Features: AclHuK_hKX_7RdeZVUGVmuxSKV88-Xz0CNGEMSKYVg4EtYtL0Qk7Zdmva1Zm8aE
Message-ID: <CALMp9eSZoXs8vAswymwdiX-0ge-EOef8TR2nZw814wa63LpR-A@mail.gmail.com>
Subject: Re: [PATCH v3 06/27] KVM: SVM: Fallback to flush everything if
 FLUSHBYASID is not available
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> Currently, if FLUSHBYASID is not available when performing a TLB flush,
> the fallback is decrementing the ASID generation to trigger allocating a
> new ASID. In preparation for using a static ASID per vCPU (like VMX),
> just fallback to flushing everything if FLUSHBYASID is not available.
> This is probably worse from a performance perspective, but FLUSHBYASID
> has been around for ~15 years and it's not worth carrying the
> complexity.
>
> Move the fallback logic into vmcb_set_flush_asid(), as more callers will
> be added and will need the fallback as well. The only other current
> caller is from SEV code, and no CPUs support SEV but not FLUSHBYASID (at
> least according to AI).

A more compelling argument is that sev_hardware_setup() requires FLUSHBYASI=
D.

> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
> ---
>  arch/x86/kvm/svm/svm.c | 5 +----
>  arch/x86/kvm/svm/svm.h | 5 ++++-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index ad4f172f170d9..0c3befd9bc850 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -4326,10 +4326,7 @@ static void svm_flush_tlb_asid(struct kvm_vcpu *vc=
pu)
>          * unconditionally does a TLB flush on both nested VM-Enter and n=
ested
>          * VM-Exit (via kvm_mmu_reset_context()).
>          */
> -       if (cpu_feature_enabled(X86_FEATURE_FLUSHBYASID))
> -               vmcb_set_flush_asid(svm->vmcb);
> -       else
> -               svm->current_vmcb->asid_generation--;
> +       vmcb_set_flush_asid(svm->vmcb);
>  }
>
>  static void svm_flush_tlb_current(struct kvm_vcpu *vcpu)
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index ba5077b9838c0..3b59561d6cc2c 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -482,7 +482,10 @@ static inline void vmcb_set_gpat(struct vmcb *vmcb, =
u64 data)
>
>  static inline void vmcb_set_flush_asid(struct vmcb *vmcb)
>  {
> -       vmcb->control.tlb_ctl =3D TLB_CONTROL_FLUSH_ASID;
> +       if (cpu_feature_enabled(X86_FEATURE_FLUSHBYASID))
> +               vmcb->control.tlb_ctl =3D TLB_CONTROL_FLUSH_ASID;
> +       else
> +               vmcb->control.tlb_ctl =3D TLB_CONTROL_FLUSH_ALL_ASID;

This is unnecessary. Hardware that doesn't have FLUSHBYASID only looks
at tlb_ctl bit 0 to decide whether or not to flush the entire TLB.
The other bits are ignored.

>  }
>
>  static inline void vmcb_clr_flush_asid(struct vmcb *vmcb)
> --
> 2.56.0.385.gd3acb90ef8-goog
>
