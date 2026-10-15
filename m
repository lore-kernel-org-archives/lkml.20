Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1D04C9E06
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792105785; cv=pass; b=rcGlaN3nhjq1wC8VXDCqUsK7FPqsasr8T2MiLU7YB8CSyVgZa0XmfQZyn31sekVlS3HfPNhovOm0s7I51TbhuxF7GrwdgszIn7lNoMCrJnP2IqjRrU9FvDFL33dRnxEn24YFQwp8Ktky3+t6kXup4Lixn2tVfdeTJzzpZ+LeWq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792105785; c=relaxed/simple;
	bh=zUbjl0cr2j/SM+XS1+leflyMjWShNVaXhhl3fNVkSVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RoQ2KyYDs+O+VMkwH22VoMv7KzQYhWDqb8TTEP8ZtiWv/0vZIrbtKoP4qqWwSukhnPbA8Qwo4sdFz2Ce5NhLLziCxRd6hIB80DOrGFjuaJzQZx2Oi059i029InB+q+C/SsLG9W3et83YIZ7TFPpH4j59ZU5VT9a0PgTPNhFw02I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EugyFxbv; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EugyFxbv"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so4666a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792105781; cv=none;
        d=google.com; s=arc-20260327;
        b=MutQzIpxpJCEYFpY46VDtSA/YYmCwR+xMZSV16w416xwuYU9R0ssfLNEkyHNOgUc71
         ThqrsHOJcrIzCLJP338yaEOx0YF3H37UGFiOejmfRvvBnuaReNOsxubYP/aRAdFzVYzL
         y2IA6pNs0zRDShLgcB2/w1JpY25zXNgS0vJjJgHrJGN/jlIsfVcW9zLWUxFMbriivTu8
         H/5abONYeHmI1q4WBY36jrh+qPAsyNm1nLpAanrkEKFfwnTGtN6HXPFwLpGoQ7K5spGL
         Co9YRK/+YrJoOWELepASoOtjb3G/vOVGeuxHZA+Ae239bI3WS90LdqSph2b2FBzi72S9
         mXOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2gAh1LE3Uytz1fFZ+ecGu7AVbqVWDFJvRMe4B+KimgI=;
        fh=HOvfs4dmAt0IzeQPE7MdUABwEPZ62TGaMHLYPb/MFWo=;
        b=eppIx2rN3PlKLYK730haMvbCw0OyfSHy6LR0spXIcy7u48s+F8kvHADa0D4dhDTsm8
         2i1D0IpqBmkgmCrT3o0InOw2sjU/rTNadA4pZGs0e2ajbDTuUc0UF4RkfNbq/WSm0xoz
         iF3RkTiM8uvD2LQ0nN+l7HWt8ZGhFy4hXnUAsELyj+dOqvwWXinI44eX6c0PpEYEQvII
         VVyjQXLQ9WwRILdpyvz7pHZ0mzpYmqWsvem3RQ9ptdCFt5y+x1PeYzINItKvKnfdBEeC
         I9zDWR1mf9Whq5CPYYxv7wOto7pcboK1i0hnqU1cJNqHFZIBKFTt/xZWvMshQNrjJBJ8
         f0RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792105781; x=1792710581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2gAh1LE3Uytz1fFZ+ecGu7AVbqVWDFJvRMe4B+KimgI=;
        b=EugyFxbvNHYP/0ncbOux8m1LCUkjwMmi0TAyDBHqDnW4Au+W44QMTUmL6cYQKBahXe
         +gPtMv6xJnsc4tMqflh1qKZd7mCKK8BZOzaq5la07zVaRvURVU+lmBYxfB6Wt7jXh2LD
         Y4ANWHNqMOsRvc6DbMS+nosUnbWWvdEEcB8hv5xG8C9Wy4tZ58Z/CbN5HUoFxpPgDxC6
         8Pg6NS4gv/BPZKd2nYLKp5TqyoMtpQGYA2eCyINbwUipA7LpjGnZsIPfqqcw9XECakyJ
         11SXQvNyTYTOHFaBINNbJhKfhhb05a8BWWy8t7RFnKvPMqUtsxr1MUGhBxl+YFU7MPDl
         NgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792105781; x=1792710581;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2gAh1LE3Uytz1fFZ+ecGu7AVbqVWDFJvRMe4B+KimgI=;
        b=XZTRN1Dn7VlNVXX/JHF/1IKzblt6MQjwDBYJ61UCSEEEvBAtVrJWGB3tpmZLLAUH1j
         odKU6KiRCKHzu6M6MDPj5GKzNpIpw12khPGEXEAefETLoej6xmKRH4LGpZMKYbDT8mxj
         3WAKvd9DEdvhPZq/nnPyhPqwIG4iUwW0stTLoWwVfPNDRuywULUt03ybqk4dBRGMwryJ
         z4j4JXauMJZNpAg4niW9Nm1q+bYTX5xiSzNoopwbXwcvZo9o91k/+bU+3krlwBg0Ce/4
         +28Q2LpyN07uiWii2lfnfX+8wB913FqH3WnSodQAUNtvj04/nrNtoCfF6Mz5IyRsUr4e
         vX+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzqgoEXb/TTstWht95Lv9y5fS4nKtQNqnEinZf7MoZ81yY3N9ekV5N2oJ92zR61+32bt2i1t4HSaW+q7dM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWjC+vczNgo5FQ5t6bLhuQW/bE7Tid3RatBkyCD0GCLPB4vQMc
	x2grDifLVyIsHZbXNBdpUnoF+yaW9SW1ctkDzu/hkkA+rndGvZuDTuFlm7bZCdJtvlG0wi88laM
	F7Ahi9pJnkF6QHyJVW9v3qggrn6fbU5xGIDaU/9d7
X-Gm-Gg: AYBFou3cHVanRRAbnnlcR/HxgXVxcXeZ52Ur1op3cYZ3jDCMaXltAmEFzZkl2n91VEW
	qYLFgVHzrfCKb2R02a9vifuP9whWdUGAgPYtC/4tNJrlsxS1rOU1t1PyRx6Wn0kHZKKdnyw+mmI
	UmNwSYzQJXDD1VGvoISiS3pc+Bp6WYCuloMR2yifHvhaDTPTKtS/XjSt7s1I1mmoHYg4/y/o5O+
	Ze6oInmZDXX5wCq/BorktYoPTSdIIgauuSkyQH/WzoBAVTJZvjkr49Y2sa6V7Twdu4WvMsL1GRx
	bh2QXfvfdgH2saIkjY7tjn6RwKALb1R90oL4OfNvP6lm7wA9K7cGDtX/maDEBvyM2Q==
X-Received: by 2002:a05:6402:a2cf:10b0:6b1:bce6:1220 with SMTP id
 4fb4d7f45d1cf-6b38c5bebb5mr13497a12.12.1792105780206; Thu, 15 Oct 2026
 16:09:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-23-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-23-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 15 Oct 2026 16:09:28 -0700
X-Gm-Features: AclHuK-3WnnpL9zskmCDLgKncxTa4NxXNzR6dgZzJcSAYQThmRG_OB-LaJ7queg
Message-ID: <CALMp9eSv9a23si8rtWd_XGRJxVWE96aWdSzE_Ram5Bu6G_pb+w@mail.gmail.com>
Subject: Re: [PATCH v3 22/27] KVM: nSVM: Flush the TLB if L1 changes L2's ASID
 in vmcb12
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> KVM uses a single ASID for L2 guests per-vCPU. Hence, when L1 changes
> L2's ASID in vmcb12 (e.g. due to switching to a different L2
> vCPU or simply to avoid flushing an existing ASID), KVM needs to flush
> the L2 ASID to correctly emulate different ASIDs as different TLB
> domains.
>
> Additionally, the nested NPT needs to be resync'd, as the MMU context
> is not tagged by ASID, and KVM cannot reuse nested NPT entries across
> different L2 ASIDs.
>
> Essentially, L1 switching L2's ASID is treated exactly the same as L1
> flushing L2's ASID, which is consistent with the APM:
>
>   Software may effectively flush the guest's TLB entries by allocating a
>   new ASID for the guest and not reusing the old ASID until the entire
>   TLB has been flushed at least once.
>
> This is similar to nVMX's handling of last_vpid, except that when L1
> changes VPID12, KVM does *not* need to resync the nested EPT, because
> VMX VPIDs, unlike SVM ASIDs, do not tag guest-physical translations
> (i.e. nGPA to GPA translations).
>
> Reset last_asid when nested VMRUN fails to force a flush and sync on the
> next nested VMRUN. The TLB flush request survives the failure, but the
> request to sync the nested NPT does not, as it ends up being serviced in
> L1's MMU context after the synthesized VM-Exit.
>
> Drop the commentary about vmcb12's ASID being copied around only for the
> consistency checks, as they no longer apply, and opportunistically fix
> whitespace alignment.
>
> This is currently functionally a noop, as a full flush and sync is
> triggered on every nested transition, but is a step toward eliminating
> that.
>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
> ---
>  arch/x86/kvm/svm/nested.c | 29 +++++++++++++++++++++++------
>  arch/x86/kvm/svm/svm.h    |  2 ++
>  2 files changed, 25 insertions(+), 6 deletions(-)
>
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index e04cc4f7669ea..8e4686b0d603a 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -556,10 +556,8 @@ void __nested_copy_vmcb_control_to_cache(struct kvm_=
vcpu *vcpu,
>         to->nested_cr3          =3D from->nested_cr3;
>         to->pause_filter_count  =3D from->pause_filter_count;
>         to->pause_filter_thresh =3D from->pause_filter_thresh;
> -
> -       /* Copy asid here because nested_vmcb_check_controls() will check=
 it */
> -       to->asid           =3D from->asid;
> -       to->clean =3D from->clean;
> +       to->asid                =3D from->asid;
> +       to->clean               =3D from->clean;
>
>  #ifdef CONFIG_KVM_HYPERV
>         /* Hyper-V extensions (Enlightened VMCB) */
> @@ -691,23 +689,35 @@ static void nested_save_pending_event_to_vmcb12(str=
uct vcpu_svm *svm,
>  static void nested_svm_entry_tlb_flush(struct kvm_vcpu *vcpu)
>  {
>         struct vcpu_svm *svm =3D to_svm(vcpu);
> +       bool new_asid =3D false;
>
>         /* Handle pending Hyper-V TLB flush requests */
>         kvm_hv_nested_transtion_tlb_flush(vcpu, npt_enabled);
>
> +       if (svm->nested.ctl.asid !=3D svm->nested.last_asid) {
> +               svm->nested.last_asid =3D svm->nested.ctl.asid;
> +               new_asid =3D true;
> +       }

To make sure we don't miss a flush after restore, do we need to clear
last_asid in svm_set_nested_state()?
