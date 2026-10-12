Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5A23A6F0B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791849503; cv=pass; b=XhOz2KOd3KJpv7+3zLN5BvVfwHc+cRuxp0I80WoL3W9NuGsaedVCSa56I5zW1lJYrccrL+fXogfO4uTDVBbuBbw0KnYxJ8vgwM9hbrmxLdxkJ5cJa3b18Yknl9BaiyOY3ggnvVj6pKsNYKwWZEBMhutlrykLx42B2j2y2rQlgsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791849503; c=relaxed/simple;
	bh=TIKNEtSSZZwsgEqG1OHBoYhHPulcgW5G9lXX9ggjeUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDD97couNzjrt7VgdkLA8XOKwFtjTaHNz4+jrx3Lo8eOC/rz98KqVBlWBCR1WFFdzfU4XPv6N420/pan8kxPQcFoBMi9apjmSBToW1CB3X7OwzqURRJqzJXfR8wpVgAoG9tRjC6ROIc7HDZVniHrFmLdPavPJJ7b+gV9CHOpQ7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wF1WxYBp; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wF1WxYBp"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso17211a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791849500; cv=none;
        d=google.com; s=arc-20260327;
        b=hY7Ovm3IVeZmpupRFn8kpAkjyIpeNZoqjyrqPk8EIfbsD23U5UjLSgFBaLqGXRuyYI
         JDpxtLMHYAm7zZoNNTIwdWqJIoz+gfC8E5SaFy+aMh2rpVfWV6Jb8drgmjsrHKVF9x2Q
         ICGrb6aeuTsx164zX1arNUN8eTlHLp8Pjr6rt3HRSLh1iMRhGnSWwdOt9F5RrVjag6jE
         P94FdNS3OunpQFkmwdSGiqhuPLnjg3PApKw7nWe/57rSvoze5wR3lB9QUNqjJQMSeFaI
         WOskiGfpLJ+phO9zEX0sez9LJTHkMaHjIYdoud4GS1g5DoXWDam9+stvdyvops+kyvq/
         08Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jke8sZvl/cOH5/M2fMJSe4QmNznKAe9ZWNvWwbINTQg=;
        fh=UqUzKsnQIbCpNnwFyQdD09XuCov+M0EKwsshF1qzBdY=;
        b=rrABn5BxbjAk8Z0RIHdmScqnBPExvj814GAo4FtKE2giWNUWP7JP4fo1ysKLfGP3v2
         +9V3ldOq+aiYyFbLJE0lKhoJZVsksOaq3TGq5nE+jGJ6g0OtIKp6xO7H07B5+XzOsUrm
         2KIi8awmN2G1nMU6AuLpIVPwOJSnrTNj0lqBSwuzjial6iNOd/D1S7fBfFNyRVYB7NG7
         0CpDhHDcu8DUKR4RoawVwZ4k9pm14/LoLgfOoO9iTjpWf/p4mAryoYHscxJxhy82E4/A
         ciYi9NKmEIEwD88h0Yb1ozWRU7PSYiBzfYbMLm1tR4Fzz/ZQHa3b2haRbIj6Kag+Xwv7
         7Cpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791849500; x=1792454300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jke8sZvl/cOH5/M2fMJSe4QmNznKAe9ZWNvWwbINTQg=;
        b=wF1WxYBp4orfIRTGTI0Mvux02f0J6r1jR8uGj9ruWSeLuvUV/05FWTQG1y64tTZaC2
         /T2iB3YXssW9fFJsgoIalFvdSexYxzwaEGbkmINrVRKB5b0Aug7d10DBnODufnKdTTug
         TlOTVGP/PozQmqAR9pNvPVXeEeZK1uVKdoWxIh3mHNzb/uwWc2uqPOdkxFU/KBY5m97P
         BAbd/kl+ief0Qrbiw/oH7dLDr6X63CHzZn3+infmOiI53B2jGXdmW+WshoAHO0cSv/iW
         9lIWIlDRziUKEka/HD4FPLYv6GgVyse6lqAuD1Y+gOrMfzqMndnWDuOVmm86m0tVlFnw
         qXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791849500; x=1792454300;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jke8sZvl/cOH5/M2fMJSe4QmNznKAe9ZWNvWwbINTQg=;
        b=z9Jpvzao+U1PAIyD/nsBhOIim5Sb96AOEEjTn2DyaSv5y1vbVM/2kjO/jGvkHSp7oP
         mugh/gxJc0QkkhGOpmP4LH2tnMBASQomGmfYmhnv94vLRBDm5Nf3IKTOXhw0AXFpWhK2
         xzJI7GxsTAECyjCRXlufxkLC6SJJAgcLbtOxxJ8LfDlE3rQRqR5BHsBALSI5rWVVwOYX
         B3zA8+lc1OFdiKDzhGVg6eNNA7LHDvA/mhi2Q1kYMCDMH4777QsPGG4lspFnArp3kkFm
         3RkGQYHMnNDoViVjuZvBPCnJYobQA8XA2KW/mOh/ZbDPdu58fYIVgfO38a7JdUbP5zwI
         aTuw==
X-Forwarded-Encrypted: i=1; AKwUvBwvi0W1CRcsB1P+xb9WfdG4x0RbA85/VhrWKyNHhE/1lxN7KuqXa1oTqgGSwWjF76j+7OXGHr5PqDEFWlE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrPMZwZOkWbxCS61ex2upYN63eiYw5cc4e/yv4TxqkX69iBkP0
	+WRbc5atJwq6dci2CGY7TVtrTjytB6KP7Gy8N9AIe6wCPMrBEpZFTQZpUvRgMFV/RBTvGWsvBIR
	XubrPA/DJNPCiv4NAt4aM1NdIwXe2CKQ4smpTjeqN
X-Gm-Gg: AYBFou0QTWoY3RcPFmNtRcpV4BALXD9WTAaAXPCxUFxxp15oFbK+8HRTrT5n8ooGKPb
	fDkZC34zUSrsspJuqRH3hbFcblQ/SRxE3S15a9ZN+VIVcFiQE5apoiiscLqKRjbuwK6/6g16jcl
	zSTprprpktiey3fUqWAm6lzuajxUpZuaPBvIx/zBxoeyt75POcgSGbYT1GLk/OYqJCp+fKs85Dv
	5EkiRFndEDwS/VxierhlmzvuFM45chqCqCVwUfTqRm9bjXQNlvoaUV8j2N++0tTTRa6hMBb++9X
	C23qNFpifuImcOt890RavL5XNTNzq3SCoU+SIqkh0l8TmnW1ZWUlyPM=
X-Received: by 2002:a05:6402:20d1:20b0:6af:97c0:ce51 with SMTP id
 4fb4d7f45d1cf-6b199a7e653mr81874a12.13.1791849499352; Mon, 12 Oct 2026
 16:58:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012224736.2306637-1-yosry@kernel.org>
In-Reply-To: <20261012224736.2306637-1-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 12 Oct 2026 16:58:07 -0700
X-Gm-Features: AclHuK_xvWgK5Pyi-Cy4y6lMrx0iKf50IEOBsBnEGOqjLi6FdmtUTEnp7aghPX4
Message-ID: <CALMp9eT6eJSDaJVJ_1mrn8-sP6F88q-OcGrEgUWy-YpAkuA9vg@mail.gmail.com>
Subject: Re: [PATCH] KVM: SVM: Update tracked pCPU on pCPU switch
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 3:47=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> When a pCPU switch is detected in pre_svm_run(), update the tracked pCPU
> and mark all fields dirty in both VMCBs (if nested is initialized), in
> addition to resetting the ASID generation in both VMCBs.
>
> Commit bf260dc9e7b8 ("KVM: SVM: Trigger new ASID allocation in both
> VMCBs on pCPU switch") reset the ASID generation in both VMCBs on a pCPU
> switch, but only updated the tracked pCPU for the active VMCB to avoid
> unnecessarily dirtying the inactive VMCB. Leaving the inactive VMCB's
> tracked pCPU set to an old pCPU still allows an ASID allocated on one
> pCPU to be used on another:
>
> - vCPU runs with both vmcb01 and vmcb02 on pCPU A (both track cpu=3DA).
> - With vmcb01 active, vCPU migrates to pCPU B. vmcb01.cpu is updated to
> B, asid_generation is reset to 0 in both VMCBs, and a new ASID is
> allocated on pCPU B (setting vmcb01.asid_generation =3D gen_B).
> vmcb02.cpu remains A.
> - vCPU switches to vmcb02 and migrates back to pCPU A before
> pre_svm_run(). Because vmcb02.cpu is still A, no pCPU switch is
> detected, leaving vmcb01 with cpu=3DB and asid_generation=3Dgen_B.
> Because vmcb02.asid_generation is 0, a new ASID (asid_A) is allocated
> on pCPU A.
> - vCPU switches back to vmcb01 and migrates to pCPU B. Neither a pCPU
> change nor a generation mismatch is detected for vmcb01, so VMRUN on
> pCPU B uses asid_A (allocated on pCPU A), which may collide with
> another vCPU on pCPU B.

By "collide," you mean that two vCPUs, potentially from different VMs,
will share TLB and paging-structure cache entries? Yikes!

> Because the per-VMCB cpu tracking is shared between ASID management and
> per-pCPU hardware VMCB clean bits, also mark both VMCBs dirty when
> updating their tracked pCPU so that the inactive VMCB does not run with
> stale clean bits when later entered on the new pCPU.
>
> Fixes: bf260dc9e7b8 ("KVM: SVM: Trigger new ASID allocation in both VMCBs=
 on pCPU switch")

Commit bf260dc9e7b8 hasn't made it to Linus yet, has it? Perhaps Sean
can just squash this in, rather than carrying a fix for a fix.

> Cc: stable@vger.kernel.org
> Reported-by: Stefan Teodorescu <fane@google.com>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
> ---
>  arch/x86/kvm/svm/svm.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 136069dfcd44f..0a0af0cbb6bba 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -3880,7 +3880,8 @@ static int pre_svm_run(struct kvm_vcpu *vcpu)
>
>         /*
>          * If the previous VMRUN of the VMCB occurred on a different phys=
ical
> -        * cpu, then mark the VMCB dirty as hardware's clean bits are per=
 pCPU.
> +        * cpu, mark the VMCB dirty and reset the ASID generation, as har=
dware's
> +        * clean bits and ASIDs are per pCPU.
>          *
>          * Reset the ASID generation in both VMCBs. This will lead to ass=
igning
>          * a new ASID now, and then again when switching to the other VMC=
B.
> @@ -3892,13 +3893,22 @@ static int pre_svm_run(struct kvm_vcpu *vcpu)
>          * - The new VMCB does not detect a pCPU change and runs on pCPU =
A with
>          *   the new ASID allocated on pCPU B, which is potentially used =
by
>          *   another vCPU/VM.
> +        *
> +        * Note that dirtying both VMCBs is not strictly needed, but the =
per-CPU
> +        * tracking is shared for both ASID and clean bits, and that CPU =
must
> +        * match where the ASID was allocated.

Is dirtying both VMCBs not strictly needed?

Per APM vol. 2 (rev. 3.45), section 15.15.2:

> The hypervisor must clear the entire VMCB [Clean] field to 0 for a guest,=
 under the following circumstances:
> ...
>  - The hypervisor executes the guest on a different CPU core than one use=
d the last time that guest was executed.
> ...
> Failure to clear the VMCB Clean bits to zero in these cases may result in=
 undefined behavior.

Suppose vmcb02 runs on pCPU A, migrates to (and runs on) pCPU B, and
then migrates back to pCPU A with some clean bits set. At the next
VMRUN, pCPU A will happily load stale state for anything marked clean.

At some point before that VMRUN, something has to clear the clean bits!
