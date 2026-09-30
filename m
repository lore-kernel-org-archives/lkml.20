Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D474E1C9A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783139; cv=none; b=ZviXV2bnn7t0MZY0lWBOX2Ix6X9+LFNObwwEzN4ISnVrMfnHOyfxGuxzcp+3Y4S5DIF6Po7dWKo/8x4cNW939/T2LGq6NqcxUGCVc/2zo3bS7LV4YIwRMUwvgdtCfYjJd7K8engHAMSSlX1R1mYd6H168Gwi+gJMLgd2AC0ADAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783139; c=relaxed/simple;
	bh=+E3nu9cp5XTg7fUnblx7dymG1E3XKTDKsq+/0nB3mAY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LTdUtJWNYoCLYSFCbA7yEGWI5u6mGLVZkPSf+Qet9SZrj0mUWX7f/pNiACLoebnnUJc5hHPJ7KYJm3zdG+Afij7M29BUZxQFeOK6zF+RowCNcMnFE+zumA7NRuW0fv0LRjNqKBfCIfLITXQ0MWluobeDMGUVGufJPCKyISmUc80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ak600XQZ; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ak600XQZ"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso3350761a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790783129; x=1791387929; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2DlYQ7GMNGNdg9PlylvSRmsL7W6iomB+l9xX198ogw=;
        b=Ak600XQZZRQ9aWZ5Cs38TRVJfQy6Kz+eqLXcsLc1siC4NbaamlJlYL2GIXWgQQXOpb
         4IgRTUr+6fbsuU9Dr7R6iq5eDfNtSDe9k2HFEb7golGc0S/6rFFKz/0y6vYe+yhCWWmI
         +8ctcRvmIKdIAaP4Qcz9YGdgZmtzTH0VAqd6fGt/V/7eQ1FxfloYx48GeFM9BAh+vbxj
         3Di44P8+1LScYMONeUx2UKMvJ1OP/LB5M22FptoiCARThaFbbrQ3kIoHPsmdrD6eqkV2
         9Jn3UbRlSc52RagQjDTxUy6iAPcgn9LB+x7NgsJzlw5aalcptaRGItmIN+46QuPmXE3q
         3zYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783129; x=1791387929;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n2DlYQ7GMNGNdg9PlylvSRmsL7W6iomB+l9xX198ogw=;
        b=d5BlUYYk5De1BHgUzjFJj+WbtL0cKifUD+enDXAfmEx8CCuBktrHSVyDXqw3/h9XNY
         YfuQ67hleIwCoFOseEjnmqnTrojAH9citchagLSGbYLAuakQzfkwDExG1Qkd7D+Fun3y
         aX8X1+s63vl6GpBLKPJqajzfcV+5x7B1+YrnL8JoEzCzCrpYm5KZq4NC1Y4VwEB1tEtT
         np5T3l8dyNGbya36mZw1fvMntX1xnI68XcbenwdssCg6iAm63RG1hVpWonyieeum60dR
         jp7pkKpClrRfLRvqxPXoKmiBcy6YVRXwBMZ2SG8FLxVrstkUHvcdePBf3s3OQM5kA6Zo
         8gcg==
X-Forwarded-Encrypted: i=1; AKwUvByw2Gbkw68p+brR6w1lWL8yhkf0XY1srRod51ce16FnnThOrNCeuQxR4Cv9yXtHDvBsJik/xXl+mVbVXP8=@vger.kernel.org
X-Gm-Message-State: AFuF++nTcYIWr/8uPAg/wzWafHJXQMkbTVBRp95tFwIYdPxDK39XaaOk
	xtAKhOTivasAgwy0xNdGZ7MMsTtfyNSpGrYmt9+T7CN16P7PbUEZkrWHuOmtQyU9T0l9mMAaWBE
	e0Z1BcQ==
X-Received: from pgbfq17.prod.google.com ([2002:a05:6a02:2991:b0:cc7:9b89:2a72])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:748f:b0:3dd:57bf:7248
 with SMTP id adf61e73a8af0-3de9e6e51fdmr1732868637.18.1790783128364; Wed, 30
 Sep 2026 08:45:28 -0700 (PDT)
Date: Wed, 30 Sep 2026 08:45:27 -0700
In-Reply-To: <arzns-SbdhuGntwm@blrnaveerao1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1783490022.git.naveen@kernel.org> <c0f9fdc27f3d9a1e63f2d39a40989d66b6facee3.1783490022.git.naveen@kernel.org>
 <ao8PtliwDo8H49sa@google.com> <arKHLaVluCNCTaau@blrnaveerao1> <arzns-SbdhuGntwm@blrnaveerao1>
Message-ID: <ar0ul9g3bvHI3VOV@google.com>
Subject: Re: [RFC PATCH v3 16/27] KVM: SVM: Add handler for VMGEXIT Secure
 AVIC NAE event
From: Sean Christopherson <seanjc@google.com>
To: Naveen N Rao <naveen@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Tianyu Lan <tiala@microsoft.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@kernel.org>, 
	David Kaplan <david.kaplan@amd.com>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 30, 2026, Naveen N Rao wrote:
> On Tue, Sep 22, 2026 at 08:31:45PM +0530, Naveen N Rao wrote:
> With the below hunk, I think we should be able to catch invalidations 
> due to PUNCH_HOLE, HWPOISON, memslot DELETE and to-SHARED conversions, 
> and should help make the source of the invalidation clear:
> 
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 96992d10cb2b..3c8daa876045 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -5571,11 +5571,36 @@ void sev_gmem_invalidate_range(struct kvm *kvm, struct kvm_gfn_range *range)
>                  * vCPU to re-establish its VMSA.
>                  */
>                 gpa_t gpa = READ_ONCE(to_svm(vcpu)->sev_es.snp_guest_vmsa_gpa);
> +               gpa_t savic_gpa = READ_ONCE(to_svm(vcpu)->sev_es.snp_guest_savic_gpa);
> 
>                 if (VALID_PAGE(gpa) &&
>                     gpa_to_gfn(gpa) >= range->start &&
>                     gpa_to_gfn(gpa) < range->end)
>                         kvm_make_request_and_kick(KVM_REQ_VMSA_PAGE_RELOAD, vcpu);
> +
> +               /*
> +                * All PRIVATE invalidations that hit the Secure AVIC backing page in
> +                * this path will result in a subsequent access by the Secure AVIC HW
> +                * to cause a not-restartable #NPF killing the VM. Catch such
> +                * invalidations here so that the source of those invalidations is
> +                * clear, rather than a subsequent guest access resulting in a
> +                * unrecoverable #NPF.
> +                *
> +                * This is expected on guest teardown, so check if there is a valid
> +                * gmem.file before killing the VM.
> +                */
> +               if (VALID_PAGE(savic_gpa) &&
> +                   READ_ONCE(range->slot->gmem.file) &&
> +                   (range->attr_filter & KVM_FILTER_PRIVATE) &&
> +                   gpa_to_gfn(savic_gpa) >= range->start &&
> +                   gpa_to_gfn(savic_gpa) < range->end) {
> +                       if (!kvm->vm_dead) {
> +                               vcpu_err(vcpu, "Secure AVIC backing page invalidated, GPA 0x%llx!\n", savic_gpa);
> +                               dump_stack();
> +                               kvm_vm_dead(vcpu->kvm);
> +                               return;
> +                       }
> +               }

This is beyond gross.  If anything, this is just soldifying my opinion that Secure
AVIC is poorly architected in order to accomodate limitations in hardware/microcode,
and that KVM should not support Secure AVIC in its current form.

I'll take another look at some point, but I want to be very transparent that this
is about as far down on my priority list as something can get without falling off
entirely.
