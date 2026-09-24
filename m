Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EB34AA57D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278285; cv=none; b=sJ77r5fbeNumLjXE03+7zccdRpfGTwB73fLYeGl9VRx4hg4QxeF1yGEmPocg9B+2Ce7Ookw7u56LJYAtZu/712hbZHIpq/DbaI4MxLYmBLvyB/gxtOOSThjD2RVAIpSaYQumfNf+PVo/58JLVir3dANzbefcOrW0/iu5dmv5iLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278285; c=relaxed/simple;
	bh=txJl1oJlY1HfCTDHKVlJKaDfK1HSsEon/R55tm1AHg0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NfNl/FXsaIf7c+zhgv92GR/F0q30b473f2pC9uMhGADVgAfxxUY7usnmHsDN/eeDbisp6nR3SfIuTFH95WKOlgcJPcIeunUU9NIxf9zce2/vSouGE5wXyMKJebpwu3uq9mQlw2DVQd9GacJmyweCUJmonRL0i8ZncIL0G3ELsaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GzYpfxVO; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GzYpfxVO"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so499156a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790278283; x=1790883083; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALQC4er69yx7dd2XTgWkYiqR7jj7zG+FNhYnzxEYYzQ=;
        b=GzYpfxVOF0B3QCsZMSzIqkvPAiVh08R2R9fQn34Rig8w2sgoa7Rrnw6mizpzSwt2JE
         ykmQH/1cQAxzXPHcIzuRCAKDruDpxICvmqEaj/BQ9v1WUVu/ZMv2XGPsgBMEGflXR1Wp
         aailSGxgz0DuWPBibuFuDPW6ZxmlO54eWPG27WzJwr7R/YwW+OZivewxYSvg+epfRHLG
         uu3OcWVspZ8yzxegqw5Hp4Zz607CwgXiGFOWPb02Fc0Brh75DGTt2AVjvi21Ra/cdiTJ
         HCBe4v7U4N//FoEN/7evPTdHDygE9LNZuoUxOkcmwxCIi4gKWz6e3XVovT4u914XZZUP
         D24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278283; x=1790883083;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALQC4er69yx7dd2XTgWkYiqR7jj7zG+FNhYnzxEYYzQ=;
        b=FWG17z+gBGaIUeVbEx84s6NoWNTOb98pTcFRq3KzzxFQQnKG4LON1PHklEr2sJZDtf
         ARlSwf1x+Mv200BSoKjdlaZLc2+VIkBQ3ierc0+GgmhfnVGhDwq3MhRvSZlEFVPPP9/f
         FkCxVXK1l1rF7pe+kA/8YiPKIxmV5XWsJ9fLXzlhSbwYGi4+p89cAZvWyxSuzyJB0n/c
         BLeuMkf4Q9g6QU6utgWddwnDAjDZw2urSUVXChX2SEGnfirFpHY02ip7G8A7rTPPaYst
         +/HJ8VbMEhgAh1cVrZTFWjM3uF/JP6ydawyzAbtnDK8NJ1lA1jfuHC3xeZWrYkmebXFP
         mAWg==
X-Forwarded-Encrypted: i=1; AKwUvBy7jHlPJW3wYCZiETFOLSnB1DZPajMVuJlNMe8YxKcb71u97PLNpj5kgvXel6CJ8x0JH0YZdAxs5MCIjiA=@vger.kernel.org
X-Gm-Message-State: AFuF++lixWnPqnfFCJhX4CEY0Te4WoYlHG0ONYVULwQK5wNJF2HFDV7X
	+BNWwvl3B4ad11P+8J6SFb2PU40kWl+pCCiIBKaszRkjiT0N7TnPdlTDYOa1UMgZGjEMKzdP3y6
	z/Ft08w==
X-Received: from pjbbd18.prod.google.com ([2002:a17:90b:b92:b0:3a0:b2bd:2bef])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5544:b0:3a0:ad24:c0aa
 with SMTP id 98e67ed59e1d1-3a0ad24c0f7mr1285295a91.25.1790278283293; Thu, 24
 Sep 2026 12:31:23 -0700 (PDT)
Date: Thu, 24 Sep 2026 12:31:22 -0700
In-Reply-To: <arV4SS8FHwd6Qjs1@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922001332.1121266-1-seanjc@google.com> <20260922001332.1121266-5-seanjc@google.com>
 <CAEvNRgH6w_a9+2rOr6r+47JqWc+-8cHq=c7r76nYG2i5deOxSg@mail.gmail.com> <arV4SS8FHwd6Qjs1@google.com>
Message-ID: <arV6iiz4kB8LrByl@google.com>
Subject: Re: [PATCH v5 4/6] KVM: guest_memfd: Split bind() into
 prepare()+commit() phases
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stefan Teodorescu <fane@google.com>, 
	Dennis Tighe <dtighe@google.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 24, 2026, Sean Christopherson wrote:
> On Thu, Sep 24, 2026, Ackerley Tng wrote:
> But after fiddling with this for an hour or so, I realized that if we fully commit
> to configuring new.gmem in kvm_set_memory_region(), then we can move the prepare()
> call into kvm_prepare_memory_region() without needing to plumb extra parameters,
> and make the gmem stuff look a lot more like the rest of the memslot code.  E.g.
> 
> 	if (mem->flags & KVM_MEM_GUEST_MEMFD) {
> #ifdef CONFIG_KVM_GUEST_MEMFD
> 		new->gmem.file = fget(mem->guest_memfd);
> 		if (!new->gmem.file) {
> 			r = -EBADF;
> 			goto out;
> 		}
> 
> 		new->gmem.pgoff = mem->guest_memfd_offset >> PAGE_SHIFT;
> #endif
> 	}
> 
> 	r = kvm_set_memslot(kvm, old, new, change);
> 
> 	/*
> 	 * Drop the reference to the gmem file, even on success.  The file pins
> 	 * KVM, not the other way 'round.  Active bindings are invalidated if
> 	 * the file is closed before memslots are destroyed.
> 	 */
> #ifdef CONFIG_KVM_GUEST_MEMFD
> 	if (new->gmem.file)
> 		fput(new->gmem.file);
> #endif
> 
> Not being able to get rid of the #ifdefs is a shame, but from a control flow
> perspective, this feels more right than anything else.  Full diff (not fully
> tested, and would need to be split into 3+ patches):

Actually, plumbing in @old and @change can wait.  As much as I want to make the
calls match the other prepare()+commit() hooks, @old and @change aren't needed
until flags-only updates come along, and adding them at that time provide a better
git history as the additional plumbing will directly precede their usage (or maybe
even be in the same patch).

> -	if (!PAGE_ALIGNED(offset) || offset + size > i_size_read(inode))
> -		goto err;
> +	if (new->gmem.pgoff + new->npages  > i_size_read(inode) >> PAGE_SHIFT)
> +		return -EINVAL;

...

> +	if (mem->flags & KVM_MEM_GUEST_MEMFD) {
> +#ifdef CONFIG_KVM_GUEST_MEMFD
> +		new->gmem.file = fget(mem->guest_memfd);
> +		if (!new->gmem.file) {
> +			r = -EBADF;
>  			goto out;
> +		}

Note, I didn't lose the offset check, the existing one in
kvm_gmem_prepare_memory_region() (nee bind()) is redundant with this one in
kvm_set_memory_region():

	if (mem->flags & KVM_MEM_GUEST_MEMFD &&
	    (mem->guest_memfd_offset & (PAGE_SIZE - 1) ||  <========
	     mem->guest_memfd_offset + mem->memory_size < mem->guest_memfd_offset))
		return -EINVAL;
> +
> +		new->gmem.pgoff = mem->guest_memfd_offset >> PAGE_SHIFT;
> +#endif
>  	}
>  
>  	r = kvm_set_memslot(kvm, old, new, change);
> @@ -2148,7 +2159,7 @@ static int kvm_set_memory_region(struct kvm *kvm,
>  	 * the file is closed before memslots are destroyed.
>  	 */
>  #ifdef CONFIG_KVM_GUEST_MEMFD
> -	if (change == KVM_MR_CREATE && (mem->flags & KVM_MEM_GUEST_MEMFD))
> +	if (new->gmem.file)
>  		fput(new->gmem.file);
>  #endif
> 
