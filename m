Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57E033F5BE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787814675; cv=none; b=gwvc3kWB/lvOuKy9hNPFvBWpyaBaHzcvgnNySzmxCF6B4DSq2g+WauGbN90oXxteTXkWukBkS1lnpIIEdRehQr0menpfyqLpbq1jZil7BmgsrUU/tCKfP1EB+4Yi7iSI+CbDQ9MzEiR/VjBwAYus4R7YrZKYeO/B2vZ8gN2qubo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787814675; c=relaxed/simple;
	bh=ycV+Iu2I+NY+3NDzkSKAuqVH8KRrVEzQ6FbwTrYHwiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZHCBWbEXsMxcIObS7aVfnRkUUfXR3cQAFlkHF2fJvNENBfnfdiWPDpZM42Lj8jJnmwDjsD+fKOy60xTN09Rm1g+c93pk5Kbn66o1fF/5YEGK2QUGQXY41TfHTgda0h+xHfIi/KHPwfhVse9kTU+uMRIm+YLqq0ho1PsIumIhgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2cP/iXT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2cP/iXT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF331F000E9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787814674;
	bh=hqj+RfiLDu19gqQ0Qg3YFfBzwNpsf6QkmPJkGL0DbZ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=n2cP/iXTOjzrpoe1h5HlITt+FOCqeIr53QJUcnkiU73z+qiKnUkA+M62hQi0ubPnG
	 H4rRDhIBYyUmf5TQCnx5y07iE8F40VGNLPO6BM1ENz6M+jqxGbMpCKgWxQYCNvPsGr
	 MQ9+vDwNUPlR8XNBQHDizTDk/HpspaJZqdIzDKttNvl16kGNjsGe9ssU9eG1S2p8xN
	 UT826Mhh0hywfp+btnSNIMUKY6blOrgKwVDt6KBlQawOEkr/MFwtctsRgO7FLvnzxN
	 52RhKDlL/VolsLnuZp1f15N2y0ztYsJhdoxte+MrIhqb+OTLU/FxZEHO88hd/11uNf
	 6P91qyEj2vI9w==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso704869a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:11:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpnzfiqIL5bPdvBYFdiQHESxeVUqGsSJg7OJHzqH00xz+4OgnqKurDfEY2PVoY4ArsjodgeB68QbppciSk=@vger.kernel.org
X-Gm-Message-State: AFuF++nonX0RykddCBMCaWrB8gtqi5vY6HXDd3ZaTKoLr6RKtYRuaohv
	1SRD2XsFKyY4PXj5mjqt/4NkMSjS6336dHM52ZF2L7ceTgjm5XUfeqTPJHgPk50AIVbkxfR6TKk
	EXbXXs4gI9MhimT0kkc2ieoJNJRjnHc8=
X-Received: by 2002:a17:906:6290:b0:c25:32b0:e56c with SMTP id
 a640c23a62f3a-c2532b0ef77mr658146666b.4.1787814673281; Thu, 27 Aug 2026
 00:11:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826211844.884951-1-seanjc@google.com> <20260826211844.884951-5-seanjc@google.com>
In-Reply-To: <20260826211844.884951-5-seanjc@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 27 Aug 2026 00:11:02 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMx1W9drF_Uv_6FbBQ_GmL00yXaDNLMazyGQOCF0jTwXg@mail.gmail.com>
X-Gm-Features: AcwNN1W2Yybhwf5Lly9_JTRJ25B3ZsQ1NkCuFungFPr0X5My8RFs9nziSZ_RcME
Message-ID: <CAO9r8zMx1W9drF_Uv_6FbBQ_GmL00yXaDNLMazyGQOCF0jTwXg@mail.gmail.com>
Subject: Re: [PATCH 4/4] KVM: x86/mmu: Convert MMU walker's bounds check from
 BUG_ON() to KVM_BUG_ON()
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 2:18=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Bug the VM, not the host, if KVM's sanity check that walking guest PTEs
> doesn't underflow the walker's level fires.  Bugging the host while holdi=
ng
> mmu_lock is all but guaranteed to panic the host, KVM hasn't _yet_ consum=
ed
> the out-of-bounds level (i.e. hasn't corrupted memory), and KVM is alread=
y
> committed to bugging the VM and synthesizing a guest page fault if a fata=
l
> MMU error occurs while walking guest PTEs.  I.e. there's no reason to kee=
p
> the BUG_ON() at this point.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Yosry Ahmed <yosry@kernel.org>

> ---
>  arch/x86/kvm/mmu/paging_tmpl.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmp=
l.h
> index 46a0f7796e55..2cf5e733aba4 100644
> --- a/arch/x86/kvm/mmu/paging_tmpl.h
> +++ b/arch/x86/kvm/mmu/paging_tmpl.h
> @@ -392,7 +392,9 @@ static int FNAME(walk_addr_generic)(struct guest_walk=
er *walker,
>                 offset    =3D index * sizeof(pt_element_t);
>                 pte_gpa   =3D gfn_to_gpa(table_gfn) + offset;
>
> -               BUG_ON(walker->level < 1);
> +               if (KVM_BUG_ON(walker->level < 1, vcpu->kvm))
> +                       goto error;
> +
>                 walker->table_gfn[walker->level - 1] =3D table_gfn;
>                 walker->pte_gpa[walker->level - 1] =3D pte_gpa;
>
> --
> 2.55.0.887.g758fc8c411-goog
>
