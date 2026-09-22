Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9704C56855C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790097826; cv=none; b=WER5j+P/EvPbZUyX3kf/7e1M0LNVMpawAOz/rplx2AkzkkpnKdJf+0+D7LvbPaW81vYvF/PA3re+uEkrlhNx2Cx7l5dL2V27s/QzPENS/Rf/Q+4B2LRVazzMiXbR8cvN3xdEi1jORIhbtNriRnwH5KVyxXj1C+0Uu7Xewhp0owY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790097826; c=relaxed/simple;
	bh=YagJ7G/Lr2bkyPLb96nex2Ieu1fELferKNmlqik77Pg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YogpRZdfb05huRCU38pSI9RwqNNKquEgzbo9jhPOJ4qJJCu8T8br3nifrhTvbzKRHCpF5PKCATxTmCqEVu8zski4WACjd3Wgjyyui03MXxfVJ1lYwR8GTwGb3T+/vHucLEakyuWFJ7YSgqwphVffU9naOzAwIwTglyqS3d/X58Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dxRdjVco; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dxRdjVco"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so237740a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790097825; x=1790702625; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ql6e6uyZc8xZzxZ3KoRlBfpeEOGwWkJ5hNC8a9M29d8=;
        b=dxRdjVcoLsnFcCZhSW7boiZa9GWAyA9oTvoHs3GxJSiw+lm0gVHBSZpJFnOSOJaD0s
         NgeHv4VUPkENZPxLcU90YFpkfTGPZqlOoySmejuRj+TVuID6Aq35g8g/x9FiEnnO/Cn6
         ojebIkvtr083C+t0fZSS0oFJ3c09BBVH2C5tVe06Ewgxd4e/3y+Ms6wR+zTIIKlBd2gI
         QFCH36SibkjBuclExMD6fhGVYo1vJczPVTTOk3eEQIiCyj1e/lWrNDbiappama75zVQq
         gUEzxrclcY+iy80WgXqNMm9HIRlEdqFmLYAznae7+oqPeW+rt5qUIIYf9opBKN7KEamE
         tdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790097825; x=1790702625;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ql6e6uyZc8xZzxZ3KoRlBfpeEOGwWkJ5hNC8a9M29d8=;
        b=T3zaUkkcB75hsemvXWVDesToju/F5isMxaIusVkYATxDWVL40wJ0Vuf6WJJyYbeW/p
         UGEtzbyhK6Cgy1g4U2gLG7CJa/eDaBzLm/JmPlDEJQcqBB5vcVCLVEVWgXLUzqTTJW7v
         sW7VKfvSllggw0wO67g8JGgd1qx0N4daT3lJc8yDCPZh/RdAHjUYCw301DkQmtvVHTr+
         PdC02RwUq4JvolSzdZOVly4/agrHyxsCys99l9Ix9Rup5O44lzpg5XLW8YGmO2g+nbTO
         sAEo+FJqcnVRfdmVKS5vy09pI/HrSHy3eF+GBcC6j/QJ3fFsiYCFh/kedlqoDUY8c3Rd
         KAoA==
X-Forwarded-Encrypted: i=1; AKwUvBzPRS3aELg4Wfbhithqiu8+aOBRkq/6UuzKCOseciS9/1kkS9ckUKbvcqHIIFKK/3YygpdxeYUNsu8ASX8=@vger.kernel.org
X-Gm-Message-State: AFuF++lKbCPHdTddIy6hUnBI0D6eigwR9+PCuk/Mu8KK7I6kGGM50nsu
	xN4n54iiUbxy4azvb//rtwvoV0NpPQesMxowbG6o3CasknnxdmmjDEdbeL14/7oaD52jcJHInFO
	5/gp2jQ==
X-Received: from pgdg5.prod.google.com ([2002:a05:6a02:51c5:b0:cc5:111b:b53f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1848:b0:2dd:c100:7cb7
 with SMTP id d9443c01a7336-2df69de9aaamr563645ad.51.1790097824659; Tue, 22
 Sep 2026 10:23:44 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:23:43 -0700
In-Reply-To: <arKxjsxuO1F5ExrY@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-1-787bd3bc7e3f@kernel.org> <arKxjsxuO1F5ExrY@kernel.org>
Message-ID: <arK5n9HrbZMCOHOt@google.com>
Subject: Re: [PATCH v3 01/14] KVM: Allow architectures to disallow pre-fault
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Sep 22, 2026, Oliver Upton wrote:
> Hi Lorenzo,
> 
> On Tue, Sep 22, 2026 at 03:17:55PM +0100, Lorenzo Stoakes (ARM) wrote:
> > +bool __weak kvm_arch_vcpu_allow_pre_fault_memory(struct kvm_vcpu *vcpu)
> > +{
> > +	return true;
> > +}
> > +
> >  void kvm_vcpu_on_spin(struct kvm_vcpu *me, bool yield_to_kernel_mode)
> >  {
> >  	int nr_vcpus, start, i, idx, yielded;
> > @@ -4365,6 +4370,9 @@ static int kvm_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> >  	    range->gpa + range->size <= range->gpa)
> >  		return -EINVAL;
> >  
> > +	if (!kvm_arch_vcpu_allow_pre_fault_memory(vcpu))
> > +		return -ENOEXEC;
> > +
> 
> nit: it'd be better to let the arch hook return an error of its choosing
> but in reality this is only going to be used by arm64.

Heh, except x86 already has something similar.

	if (!vcpu->kvm->arch.pre_fault_allowed)
		return -EOPNOTSUPP;

As does s390:
	
	if (kvm_is_ucontrol(vcpu->kvm))
		return -EINVAL;

I also don't like that this is subtly about avoiding vcpu_load(); it will be all
too easy to overlook that detail in the future.

Rather than have kvm_arch_vcpu_allow_pre_fault_memory(), what if we add a more
generic kvm_is_vcpu_loadable()?  That way we don't need to worry as much about
the return value, the connection to vcpu_load() is obvious, and we don't need to
add another pre-check if future (or cleaned-up existing?) ioctls want to do
vcpu_load() in common code.

I'd also be tempted to say it can be a macro, not a __weak function.  E.g.

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 27fe0cd5b2d7..99613df254cf 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1533,6 +1533,7 @@ static inline bool __vcpu_has_feature(const struct kvm_arch *ka, int feature)
 #define vcpu_has_feature(v, f)	__vcpu_has_feature(&(v)->kvm->arch, (f))
 
 #define kvm_vcpu_initialized(v) vcpu_get_flag(v, VCPU_INITIALIZED)
+#define kvm_is_vcpu_loadable kvm_vcpu_initialized
 
 int kvm_trng_call(struct kvm_vcpu *vcpu);
 #ifdef CONFIG_KVM
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3dd04605f2e5..02401b080507 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1053,6 +1053,9 @@ int kvm_trylock_all_vcpus(struct kvm *kvm);
 int kvm_lock_all_vcpus(struct kvm *kvm);
 void kvm_unlock_all_vcpus(struct kvm *kvm);
 
+#ifndef kvm_is_vcpu_loadable
+#define kvm_is_vcpu_loadable(v) true
+#endif
 void vcpu_load(struct kvm_vcpu *vcpu);
 void vcpu_put(struct kvm_vcpu *vcpu);
