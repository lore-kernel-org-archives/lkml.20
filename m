Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D644381E92
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269826; cv=none; b=SV5sQ9uHmRAoTP1OY9582t9Aq9dMUlesE6xs7xK5fXVbDKWZ+/03gHqmZqF//ljPrpIXuWhKTo4ySFzrvKs1LKx+Ap+XW0brS7zV59dCvrOaD3bwCY00TCNUG6GeDrBDXIdVBBQogbjNPdxavSCrRnijlk3QY/c4B4C905tjHD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269826; c=relaxed/simple;
	bh=xT64NIlMh8pIe5ecVgBrXsUOxFiPNMLxtcPdfQhZyIs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mN+tIazCZBxAlJOepUhZXySPj7+Qo8NwpEr1Emc26a1NqPb4IJHt1z/nxGmfRxXr/d9+QD15xVbyOgpv/HTd+VpjUKA1yO2EXGPMMtJPQctUqeX35da2D5jdBdTyu0qpaYRg5LmQH+hB+a6Yw73nlgF31Qu9gIFRnagExNBaW/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dw+mJNvn; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dw+mJNvn"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so1524629a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790269824; x=1790874624; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1o1i2f/hTrS1n0Ninzv8Gte0+MRdXhRWFBn8i4nuoHM=;
        b=dw+mJNvnSwqqZLAWgwkUb7J5ZGKuFg33lIK7PMZKFvaJ7vcgStinZYYymPjpw/U/bc
         yI2Niq+tI3gE3Z+D9jI7Asxeboi9GoFEwa/gmRSEtxKuz81u5IaI9kqMI/uON7Oj4D8t
         /jJVaPXhbY6naad/vti5mm0F6r0LCNpEOm3AE4a5H3X5LoXH+/xl3YooQSrGoB/fjzJl
         siZFm0BcIOcfZKfoRe6BCdoKqy2MyqO0goTJonV2Cro6wu1N5EzFiQRdUGyyp3ve3ly3
         2cK2Cr/AS7WDm8x+x90anv4dz2JSE8fhC9mxhJ43MYogdS7fFXZio+k+zgOzBhQ68/Vn
         Wc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269824; x=1790874624;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1o1i2f/hTrS1n0Ninzv8Gte0+MRdXhRWFBn8i4nuoHM=;
        b=WsiaEnWorHPgpxWz7+GildpCy79c8I+fYnVCBKsw3O9H0N+VJAoB7PH1Dm3M/jOLi3
         eWw2GaBjRZY97aE0T2MvDpCvfBoCXqujv0DPdTZC3kYKpuWqByeOr/U3xaj90dqJki9Z
         bqNYKtLYdPeUbWJZpIiN4rbcAxN/xd/WcnWqlfUaVhVXwICaVl0noxzKdri3ckCpDZvx
         V5xtAHnYrT+8pKldA7yKDNusksWvHHaX9Xx2k82tjVss6/QdtX+UB4d301+J75IXwIg8
         23aFCcA47hb7B8duWtmxkg6HfQGtNigQIWjXD8shLLE9Ndw64BpD/7oYjcqzmYD3misR
         J1mQ==
X-Gm-Message-State: AFuF++k+eT/h/9bFENDlcoV+G4YN+GPzOO3WnzoXhwko6gZiZmbgA0js
	nxcQrsIxNrdYcdPDFmsWxnXWSAverjrwES2JyteOLSTkI7QLRV44Xq0zAp8jbsn+vjXEFV78f05
	1lH9X3w==
X-Received: from pgbfp2.prod.google.com ([2002:a05:6a02:2ce2:b0:cc4:ac62:d4ef])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3408:b0:3dd:85a8:4c5f
 with SMTP id adf61e73a8af0-3de0e76286amr3010885637.38.1790269823517; Thu, 24
 Sep 2026 10:10:23 -0700 (PDT)
Date: Thu, 24 Sep 2026 10:10:22 -0700
In-Reply-To: <daily-reply-0006-re-kvm-mmu-derive-child-role-5-15@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260913155523.7423-4-k@mgml.me> <daily-reply-0006-re-kvm-mmu-derive-child-role-5-15@kernel.org>
Message-ID: <arVZfjUskXC54OKZ@google.com>
Subject: Re: [PATCH 5.15.y v3 3/7] KVM: x86/mmu: Derive shadow MMU page role
 from parent
From: Sean Christopherson <seanjc@google.com>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, stable@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Kenta Akagi <k@mgml.me>
Content-Type: text/plain; charset="us-ascii"

On Mon, Sep 14, 2026, Sasha Levin wrote:
> > -	role.direct = direct;
> > -	if (role.direct)
> > -		role.gpte_is_8_bytes = true;
> > [...]
> > +	if (!role.gpte_is_8_bytes) {
> > +		struct kvm_mmu_page *parent_sp = sptep_to_sp(sptep);
> > +		role.quadrant = (sptep - parent_sp->spt) % 2;
> 
> The "if (role.direct) role.gpte_is_8_bytes = true;" that kvm_mmu_get_page()
> used to do is removed here, and kvm_mmu_child_role() does not put it back.
> 
> That works upstream because the field there is has_4_byte_gpte, which
> defaults to 0. On 5.15 the field is gpte_is_8_bytes, the inverse, so the
> translation flips: for a non-paging guest
> kvm_calc_shadow_root_page_role_common() leaves gpte_is_8_bytes at 0 while
> kvm_calc_shadow_mmu_root_page_role() sets direct to 1, and a direct shadow
> page ends up with a quadrant stamped onto it.
> 
> Keeping "if (role.direct) role.gpte_is_8_bytes = true;" in
> kvm_mmu_child_role() preserves the upstream behaviour. The alternative is to
> backport the upstream role-computation change first so the field carries the
> mainline sense.

I vote to backport the relevant upstream commits.  Reviewing this without those
commits is a pain.  I think it's these, to get fairly clean cherry-picks?

  dc1ce45575b3401102568dd60ba8894849d1d64b KVM: MMU: update comment on the number of page role combinations
  41e35604eaff2266ba8523787ebe99c5ca4c4045 KVM: X86: Remove useless code to set role.gpte_is_8_bytes when role.direct
  b46a13cb7ea1137b2e01dfaafcacd5cd79db8390 KVM: X86: Calculate quadrant when !role.gpte_is_8_bytes
  bb3b394d35e80d7a58ce015191e4960a13f54ba5 KVM: X86: Rename gpte_is_8_bytes to has_4_byte_gpte and invert the direction
