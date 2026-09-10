Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924964CB8B2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057828; cv=none; b=sHrKnnQBwPPPQwdCvrNKewxZaDOtJqfKWCVW01jGdi8gP/JDyCLuNQR9YIgGtU0IntGlLhP4IZe5X3/5k/DE045eV9Cr4zSIEFMi4nYGBDkcIiVCgK1gRkLfhvg9WBSVaD6IMVcU35lmbgEhQIdeIfjFKyUiIBx5R7j/b/Xe/W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057828; c=relaxed/simple;
	bh=wZ3LykXDLiXZdcN2B90HGOb4AiKilHNsRIIn78r352U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Io5ElkiRorsye1cXfuxfA1XW+ow+ePymXL2C3tcJx7f4k4prSppUeWS494y67RN7UnXfLTwn1AkP6Yx1TgmlMTL7Q2dKPoFmaU1aGli8bHCP+eC2VJmZ1HE0d441M3g8xNxKpqvPxt4iWLbuevhRWaVRY3QLCDDhresRrKljMIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U49mev5Q; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U49mev5Q"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so11296279a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789057824; x=1789662624; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnJnwdOYGIGCcjx8YGUUXxvfpBjYI69LyTf3vI3u8ek=;
        b=U49mev5Qh4L2dNyaLHKWR51jr7ucv9HSEXXNNgPRNHeAweqUbvN/QyuY74gWgKQpUW
         PsBlEnEOBPy6moNn+B28WZ7JLUA0bI9sjer99mM9NEB5Zsvd/moxucnzWL9qMNkNgnvC
         DuYG7p48buLQNORzABL1o8tjpJdkXbvq5QbA4dwzOLaXfoCDzURa8V3IX8AvPdfe83fS
         GFQvs+am9MUaZvK6N1mtc7wQoDGG1cHOeppfK+RWN52o/ikWjXUPG9g7V7PL9EVjEkFE
         ZR0msZ+N8Q0IXrBiA4NN6GNb0NHNnvcMNwm+5Im4Lhsfgef0zSZG9gHd5/qvlKDrfnAt
         O1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057824; x=1789662624;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VnJnwdOYGIGCcjx8YGUUXxvfpBjYI69LyTf3vI3u8ek=;
        b=kHh6qMtivg2bltuo5Lrd4q2HYWfMzhYs+vGUe3XzWK6EDNwb8TSMdKPBZiOS9a7QJe
         4BgT25w+s3Km4o1glY1888vnw3fBUfCBbyeJaIcyvgDJLwyFm+LHaSr8cGGlkzaObM1O
         2kKb0siQk/J4EG7RP8R8Uycn1g2Tj/PnkasUaNwUTtX4FIf3P5BXp9GaNAFHn4wHyF+9
         waW7XwIYaj4Aknk1ka0P4Ob9KoSwKB2LuprEu4eLTcSl/+rcvBSllaWdbX02SSMR/o83
         FSFrxxmKkzIVsjtLa8pvt6tLXrOZ2AxmJs89SVEPj8vyeN3vFHCZEj9enOFVYYYhjpdt
         9Gag==
X-Forwarded-Encrypted: i=1; AKwUvBzVKRIvyzHa1JdtepN6gX0SJVA5BpYMC0sGAb4hN/A0+s590VWwvYclkQXR/UIqhXU76O+TF5Wmjr3I9aI=@vger.kernel.org
X-Gm-Message-State: AFuF++mQEtWGSeSHkMtdplj48PWmPLabFdIK7+1unX1g5blcXKOlJ7Pu
	QJdDkcuxWUam458uzXdNiKYVko4qpx0JK1EksAH2LZzh34sPd7WDoDaVZ1mxYaIxoizNkXqZiQ6
	XYgMbxQ==
X-Received: from pjbdw14.prod.google.com ([2002:a17:90b:94e:b0:39d:631c:22bf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:64f:b0:39d:83d0:41b2
 with SMTP id 98e67ed59e1d1-39d83d046d3mr3518065a91.15.1789057823466; Thu, 10
 Sep 2026 09:30:23 -0700 (PDT)
Date: Thu, 10 Sep 2026 09:30:22 -0700
In-Reply-To: <20260910162343.4092060-3-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com> <20260910162343.4092060-3-elver@google.com>
Message-ID: <aqLbHvD5lqQP8PRd@google.com>
Subject: Re: [PATCH RFC 02/10] KVM: Allow reading memslots while holding slots_arch_lock
From: Sean Christopherson <seanjc@google.com>
To: Marco Elver <elver@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 10, 2026, Marco Elver wrote:
> kvm_swap_active_memslots() updates kvm->memslots[as_id] while holding both
> kvm->slots_lock and kvm->slots_arch_lock. Holding either lock guarantees
> that memslots cannot be concurrently modified.

Sure, but that's irrelevant.  The goal of the srcu_dereference_check() is to
ensure that readers see a stable view of the VM's overall memory, not simply that
kvm->memslots can't be written.

> Allow reading memslots in __kvm_memslots() when kvm->slots_arch_lock is
> held.

Why?

> 
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  include/linux/kvm_host.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 03bfc92864b6..5ed8260ef01f 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1089,6 +1089,7 @@ static inline struct kvm_memslots *__kvm_memslots(struct kvm *kvm, int as_id)
>  	as_id = array_index_nospec(as_id, KVM_MAX_NR_ADDRESS_SPACES);
>  	return srcu_dereference_check(kvm->memslots[as_id], &kvm->srcu,
>  			lockdep_is_held(&kvm->slots_lock) ||
> +			lockdep_is_held(&kvm->slots_arch_lock) ||
>  			!refcount_read(&kvm->users_count));
>  }
>  
> -- 
> 2.55.0.1003.g10538fe699-goog
> 
