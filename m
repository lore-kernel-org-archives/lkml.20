Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F157456DE1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792101358; cv=pass; b=VZh9iBvK0tZ+6TTNsYcTtUBMdneSxP4IYWgyirRJfoa2LHyC6tTuFZrdXSJLwS1EIlhZYqTVAu3TcQqcWYFEIeJUBZpgimH/fUloqrXiRmyTNNRi90oguIoQID1trkqTgh7cLW4L4PX3Cl1UYslw45zTLqOotYtDhtKyyxpVbvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792101358; c=relaxed/simple;
	bh=79g5ogA0I1GdHv/JPvhhzq91Q8Tf1OOh8jZbsYg+F80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AhGUsyzlUgmaIGtcp5qRnILeBT64VlgPt/3lya1IWW52rO1TmRh5G7aCfIDrR/c3vzBYqUKj8nD76lErb+gT5/kI3FSZawMzi/XJLhQjM1iNsXqWtlnA/EFZMRJb+m3RH9gg9HN6/eEhSvyWUtI9KKAuPLfQrmZstOxQEECLjz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=retiS23H; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="retiS23H"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso4280a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:55:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792101355; cv=none;
        d=google.com; s=arc-20260327;
        b=pgcjZ+gM9RNYS2DFBPdWXhwvimX+RbyHnnvaDz/pv1FANBBnXddxbkdsGWhxawplR3
         vFPT6NeAne/SORIX0FA1BhDeO1aMiJXUetkFYYa0Kz8aMLZ8UebhXrEVXgAjyytqXkjM
         RDYTpcDsvZ5eTr2LdzYm4BwYaBaytPv2xvKFwBlOxEkV+74+7+FLJfOISoTfqML4c4m6
         iWbSfodJbWBKuAEcYEhViwAzWw+fZ30HBHFnOKwGqG8uF0pgie67X/mx/FSfxc3nVflt
         ihFOT9+wfd6uQxGbQYYhXLMliS4NY5uf7nP+bp/mp4AakjddOAq+ZuoqSGJqvs9PnMdo
         UPfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AncdyNWulj2gORzp3e0kx2tc7Zdn14X5aLncnwklBvo=;
        fh=Da54KIX9nmzc3La//0Qp8TcPAipFmCw7xb+0kmulNqM=;
        b=n5WXPz1KOGqzQtNrcmn2b2ZPtwuTSQPRRMsKFMvIReHMg8XWnI4l+vEJRA6r2e3jt9
         K7m/Hq8WeJJYQH74f7quPfPDRBsy3DZUuvHQKGmUe+i3U/bz99j2ypnOdnOc7odOUnGg
         vs+aMoHbi0CXqSd7D3Mrurd3BYS+gixJju+pIqfc52eMHpbk2b4HumXb9vGBxY/kbIu4
         nGe1M+SOdtvXF4jaNeay8m5uAoLaU9lnQeJIclsNzOJbswXNwcYJcko9JusoxnV9EbVV
         KvoLiZ4XMiEwJqs91iyd9cs0CfQqFr9ZYhAIEM3ZLshDh7wd7crjCQkIt8PV4uUXck9q
         ax8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792101355; x=1792706155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AncdyNWulj2gORzp3e0kx2tc7Zdn14X5aLncnwklBvo=;
        b=retiS23HlkYiY+UIuSk5FX4gatelO7J9TLQi2mX3Mq3bRAv2SY07SMY5Ax0Lj5++Ow
         33rLaFtjZtfh/MVRShyrFMXT0uLIRyhhXqV2hzwFujUOmA2+GRM/ekY9aS6emLeoypx9
         XwrX3To3uBCa3fNugA0r+YZng+kmlxg1gUlPkkp27sMk12n9rbwBaj+/gmtTVg5ZV+6q
         aWSXtMYxzTkl752Pg3AB4HdM+PodqNMOUmUh7ytPwVrllYgyWEyclHOUdEaEnfjhrtAA
         U96j0Gc1nnYHrirrnARNJMjJF0Crilva9e8cy0vNeqaN3ZHXYyyOcxoCWGrKWxhS+59c
         E+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792101355; x=1792706155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AncdyNWulj2gORzp3e0kx2tc7Zdn14X5aLncnwklBvo=;
        b=cxQwXbof0W65TV5dHEnGag/fdlx9GLim5hTcPllFifLfSpPNm6As62ubeWh9v3OhUg
         Z831XfFOFd+0WqV1w9rxQp40Tsp75INTq0YekLXBwWjAlX1/pldcKma/KQkr1MRjbPvf
         NzqxddiT0/zNc/Gnl91MY6CO+zw71aELTBZogjbfAnKlLVyNyLivEujZnkVwcn5maOUb
         QI/n/msd7fecCzP93M6cOTryUqgxHAkPtXGLAZmklUTGUS65Xk5qi1syXQBchek6SUrn
         bRLA8RaFsg/lQUnxPkDRtB/HR1ouMQMO1FKRaReQmOOr31gZtPjbYY3f/nGabHEtn2Et
         Iiqw==
X-Forwarded-Encrypted: i=1; AKwUvBxZL114tyPD0gAiJ+q8YMe+6y+0ggYNd5ErBoU4bxuawmSfww/C7o/2q8OEv52rwy8Ugx0LhfEKZLvQVfg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMmPjQ0r6+obImsqJS89cUa79kESL29eilizQ5RwTooHF9uTNU
	UQEzOSg+GFHB3J00zuUTs42bW/ejwPyDLqRHLJGmuTyHSftH3kRISXO2vXuiPzCDbGXRRCUNxdo
	rdNIdiSbIc07EUg+6okMCBYB6WPmYsRgu31ZGKNkF
X-Gm-Gg: AYBFou0K6PRbwLrrYvJU25fT38saJVp1gdmllSZj0alkNM7cOFF3uJYsRx7a9tkS8hh
	9HW1ik4tAb6m2pGFy4WTPGHGLIiXFe+5BcHA7FqY8j3G+hPvML3e1hkHnWX3jRpoJnrl4ydM6E6
	BbZ3nPODwl/GLnB6cJiTdyWQ4YLdLt0lAhI1DrxqBbx1ebEC7Ojb+LO9OO0LWE7Dr//gwAXxgME
	T4IwMbxk8c5oqGbk91PKkCaJEsCHPpajNaclpFLBZm86ZOEyq4Bmlw0mX7Sa1yckoTRp2XDbqoO
	L36vh7+vwHn1s2EQBunYqMF5tFZ3Dmsb6mt7wfBhNVivI75vJuY52cKN4naUdjwJhg==
X-Received: by 2002:a05:6402:461b:10b0:6b1:b607:a5db with SMTP id
 4fb4d7f45d1cf-6b38bee8277mr7482a12.3.1792101354190; Thu, 15 Oct 2026 14:55:54
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-14-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-14-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 15 Oct 2026 14:55:42 -0700
X-Gm-Features: AclHuK9gcJUHdFVjiS-NT8eUvgfHYnlNZI3clKtFMVjRkrs5A4QiIfSLdfLqFP0
Message-ID: <CALMp9eSV0ikZ8CDoah_vCKYFXEm5syYh_sCMQ8wXhGB0+E=vcg@mail.gmail.com>
Subject: Re: [PATCH v3 13/27] KVM: nSVM: Add a placeholder ASID for L2
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> In preparation for introducing a separate ASID for L2, introduce a
> 'placeholder' ASID that is still the same as L1's ASID. This will
> facilitate future changes that need to distinguish L1 and L2's ASIDs,
> before actually using a different ASID for L1 and L2.
>
> On SEV VM migration, copy the new SEV ASID into asid02 and vmcb02, in
> case nested was already initialized on the destination vCPU before
> migration.
>
> No functional change intended.
>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
> ---
>  arch/x86/kvm/svm/nested.c | 5 +++--
>  arch/x86/kvm/svm/sev.c    | 9 +++++++++
>  arch/x86/kvm/svm/svm.h    | 2 ++
>  3 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index bfb297b7d71ab..780132725bb79 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -701,7 +701,6 @@ static void nested_svm_transition_tlb_flush(struct kv=
m_vcpu *vcpu)
>          *  - Honor L1's request to flush an ASID on nested VMRUN
>          *  - Sync nested NPT MMU on VMRUN that flushes L2's ASID[*]
>          *  - Don't crush a pending TLB flush in vmcb02 on nested VMRUN
> -        *  - Flush L1's ASID on KVM_REQ_TLB_FLUSH_GUEST

Um...How does this patch either do this TODO or render it moot?

>          *
>          * [*] Unlike nested EPT, SVM's ASID management can invalidate ne=
sted
>          *     NPT guest-physical mappings on VMRUN.

[ ... ]

> +       /*
> +        * If nested is already initialized on the destination vCPU, also=
 update
> +        * the nested ASID to match the new SEV ASID.
> +        */
> +       if (dst_svm->nested.vmcb02.ptr) {
> +               dst_svm->nested.asid02 =3D asid;
> +               dst_svm->nested.vmcb02.ptr->control.asid =3D asid;

+1 to Sashiko.
