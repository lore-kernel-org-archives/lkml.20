Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD3A3BB67F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792178674; cv=pass; b=OnycWeHmki+jpJHCH8vEWU22g9kyquBnwMisxScEJRYRn/cvUJ9Lpk3ZtO04MIEytvpSd1Ean6PHV6AIBnfHmTp5ziPst4bxTaLmILMfhgGAivGi8OEiDvSr/yynlV8LdIty9w45Ax6VZKz3ptzymcn2WvTFMjaOfv9XE/A0C+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792178674; c=relaxed/simple;
	bh=d5o2v0NGUWbRJN1f/BoF/CoGKfRWIDyZQTL0ydZSSo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C2E5Y7uycLyjOkB84C3ajn8+/uwVSUuPRSxO+ZwosFgMwm3v8HPWLPEF+6LDGWCcEF0+9t7ios1Rf/tlPCMzCf65vQYoQgIbc0COEbkMTdoMW+q6ZLCu8rxKCMGGsQwWR582C1/txR2S/kO2iuaGDQWxfjiRNSb91RV90KKAChg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GxnpEy+w; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GxnpEy+w"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso2351a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:24:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792178672; cv=none;
        d=google.com; s=arc-20260327;
        b=bCsMgnmUTMwZNWyG5aaNIFZkkbIC+wxS+qLtT9IIaV8TFpQh7eINhBkd/Mlyt2/vg4
         Mi4kaJK33218kJsr9ISqIGOkEUgYf7OlQajYtH15NiGUlHZeCCUXNFeU1bBfeLrPgT84
         MRyXfGWEDhDxCTvH4nbRL6YhER8JR8lbh73J0VlE+9gBtJeKUxv9wYjajv+oxZZkveMA
         Dusr1QKv8VhRYRCle4JQ6BQZ3ktS8c892Lx1FuB5yRXAekI+y4tdjPS+LoWDe6EuSfyr
         D1AfFKdexS2Ml8FeOcfA2ZXZaqPJjcQYxjiU/WzhuD54GxEpVHR/2bcGl1VNUZms7cXh
         UhkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0AUHybqnK5COco/Ujbmue1fB/qGf6BnUtW0x4jmlSGs=;
        fh=vLqYRl5ZoYbGuDhTStFcRyXdVjNi9vAVs21K4AJnOTQ=;
        b=VH/yt6FjRrPefY7+PZcbFBoJerDX6HsEAFdCuuZd/Ov+5UcvVU3FGKzK/kTxC3H3fW
         0jJU5Jefuc69xE9ka/DclCo1eNKuO7jqmZiPLHfVUzU8C+Y5sfbx9TQ21D6D3PUX5itq
         jAdq88OUkqUG0ZbW7fjqY7fD7FYz1Sz83K7UXsaymd83f/XwlGlU0z6Rtr+z4EQ3p9om
         7510iJ9O2tAOE5bd9xfJcZRh5kaBEafB8julj7w8CcYBhsHRMSI3UkIeFy0egQac0aFi
         9sa7uExM9CovjzSULiSg0NwBdwPJTojQI3rgF0Qc2Rk6WqLZj4ILlvY4AE3Nh6D2AgDl
         /JgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792178672; x=1792783472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0AUHybqnK5COco/Ujbmue1fB/qGf6BnUtW0x4jmlSGs=;
        b=GxnpEy+wqXUWZlSBTaXQg7FehcHHrB7eto7QrfunRv/PqUEbQZIHsBGJrPkBhv1a9p
         4+6Pqk6YQAuwzXlwVoPXwtqE/1jy2naUr/PEmcjQOfC8Q80LtIDm4bkpyA4P265r2zzb
         skvXAVStWFgEPjkwz8A51Ynpt+0lpIiz+W7Xtb5p8PC/8w4+q25fgZzkQ5TEJMBxN3lF
         cJGYwp2d6DgSL80UGMUHpIsatfSlx3yW+TP3bALW7Iw+o3Imc//cO4B8A0aVuKsufmKo
         MCCVcQ58/5GbDAeoAJaFBgCUXCm2Zofx4vLLMNxq3l7g1AMiCXvtNImaWM6CW5EnEzCQ
         FqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792178672; x=1792783472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0AUHybqnK5COco/Ujbmue1fB/qGf6BnUtW0x4jmlSGs=;
        b=QjrCJxRqzDYrUu/DB3Q0B8nzRs0mMCIdh4crN+UtHbJysf/8QD7+Y5xPrsC3ClQLZS
         5mZggpr6GehSYrXrCLsV5wU9EIuV199jmSggbPzQrB05DIHniqAdqGTbwhB5nXNeFZNt
         Xz93y/0umrfhF00viTNQCySxEzV4FZmmDBpUWSwXrca7K4b8/VHdRfKMwemQFcFkL5UX
         oXrPy0oQX6Snt4zHa7LSrMxWLsOXZ7IvX0O7jR601uxfVRDtUJCxAqZ/+shzVMtElTrz
         BRHRdq9EWwb+98tvj5BbUTBAHpEm0U5hlNfIZUnibAgXmSDTE8nKEeDn4FCkQm1ZS7yf
         tOVA==
X-Forwarded-Encrypted: i=1; AKwUvBycR2IBIuUbZvdwm5zxdRSUJNLxkmkZPOe+r2C88J4fRVhl7aAuI/rWmuU2h9hegnZRxPfumYg+5hg/8/s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJY3MNxxcMFw3+CBCOXMPHtLBSRZ0K3vTFblFszSgWg2R+RtSdQ
	r7qILVCMH+kOx/r7la3BOPndjhyIlxgr+YQZl3Wc8+bhwH0PrijTuEgh/hRu27Phh+PlvxkkKif
	Aye0wGy0QO1ujhqn1Fp8B9gsaQusVODLmdDe13Z2h
X-Gm-Gg: AYBFou0KBwKikfuvUUHOqKISa25prLfnfFOLJBkmWa+da9LW09nFyk0EBBbF22v20m8
	PxSfyfj8Z/EOLBQstB8/gueiA2PLIulYNuam8dHGt6swnRD9K2UB0fjGs7F7ackYLpoUBL2dw9q
	6/eYswawmUFEmbN0mp7SnfaX3v6jJ1aBVX9l5+HPpN4/DBk3Du1gMLXe/kP2SY5t3iNbfgeFi7V
	zgfKcI12ACOyjwLVPt93s/KqtFQ8aTEpP+Yhyy7oTCabB9Sbkj3EwADumrcc6UxipBd2zu3dFt+
	WegR291BYoDuPMtlKyau3blETEgMdJa12oearjsGkcWmXbcmkOU08MbDhlaPwgYWMPTJmSXApBW
	QiJX3BrG0OWuKrncOXwb/7hF0T2v7YayqULU7
X-Received: by 2002:a05:6402:5177:b0:6b1:bce6:1220 with SMTP id
 4fb4d7f45d1cf-6b3a8c0a97dmr6753a12.12.1792178671324; Fri, 16 Oct 2026
 12:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-23-yosry@kernel.org>
 <CALMp9eSv9a23si8rtWd_XGRJxVWE96aWdSzE_Ram5Bu6G_pb+w@mail.gmail.com>
 <CAO9r8zMkRADNhRCBoxKCPNM90H0uqB5Jyt7oB4RDmbhgY_UM-g@mail.gmail.com>
 <CALMp9eTM23iFdrbZE8qw9kuJ2va+Mahv5wZDmgs1TZrAREh=gw@mail.gmail.com> <CAO9r8zNFYNR904b0NahKj=vwoc1tRZdr2wwUYpTVwUdwvYAtpg@mail.gmail.com>
In-Reply-To: <CAO9r8zNFYNR904b0NahKj=vwoc1tRZdr2wwUYpTVwUdwvYAtpg@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 16 Oct 2026 12:24:19 -0700
X-Gm-Features: AclHuK_uq-6OVpi-FVRpkc7oAce-IC9tDELOgFS6cf7jgJLt2-ErHr0_9UIrtVM
Message-ID: <CALMp9eSTHi+Y+opUpu5ihH92ULKqFA2D5hucrgNgSd25NZUktA@mail.gmail.com>
Subject: Re: [PATCH v3 22/27] KVM: nSVM: Flush the TLB if L1 changes L2's ASID
 in vmcb12
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 4:56=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> > > > > @@ -691,23 +689,35 @@ static void nested_save_pending_event_to_vm=
cb12(struct vcpu_svm *svm,
> > > > >  static void nested_svm_entry_tlb_flush(struct kvm_vcpu *vcpu)
> > > > >  {
> > > > >         struct vcpu_svm *svm =3D to_svm(vcpu);
> > > > > +       bool new_asid =3D false;
> > > > >
> > > > >         /* Handle pending Hyper-V TLB flush requests */
> > > > >         kvm_hv_nested_transtion_tlb_flush(vcpu, npt_enabled);
> > > > >
> > > > > +       if (svm->nested.ctl.asid !=3D svm->nested.last_asid) {
> > > > > +               svm->nested.last_asid =3D svm->nested.ctl.asid;
> > > > > +               new_asid =3D true;
> > > > > +       }
> > > >
> > > > To make sure we don't miss a flush after restore, do we need to cle=
ar
> > > > last_asid in svm_set_nested_state()?
> > >
> > > In [1], we set svm->nested.vmcb02.cpu =3D -1 in svm_allocate_nested()=
,
> > > which should be called when EFER.SVME is set on restore, and should
> > > force a TLB flush on the first vCPU run. That being said, if EFER.SVM=
E
> > > was already set (not a fresh vCPU), we won't necessarily flush the
> > > TLB. KVM_SET_SREGS will _probably_ flush the TLB, but I don't think
> > > it's guaranteed.
> >
> > I'm pretty sure that restoring nested state on an existing vCPU with
> > the same asid12 and no TLB_CONTROL skips the flush.
>
> I can clear last_asid in svm_set_nested_state() to make sure we don't
> break this.
>
> >
> > > But wouldn't this also affect non-nested? Are we guaranteed to flush
> > > L1's ASID after restore?
> >
> > That may be a bug too.
>
> It's tricky. KVM_SET_SREGS will only flush (with 64-bit vCPUs) if
> CR0/CR3/CR4/EFER are changed apparently. But it's not just the TLB
> flush, the entire MMU context wouldn't be reset?
>
> I am not sure if there is a practical use case for restoring on an
> existing vCPU tho.

KVM APIs make me want to kill myself.
