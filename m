Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792587228;
	b=iSx3dcFwduLOuObAW20JL2KQ4I+YPmV7xfDSqv7rnt4zoq+0Gqp8YSu2/nC0+XnxUaiB
	 luHAIvnUh4s6ZhF1+T45NtcLgmvwZzBY8fNlxSPsZXGs783tKRZnAMza7cmnMX9iVaJRn
	 0UKK1C/LA0LBF/l85vPumFP3ETtjR0R/9JV3njV5fzT9uGGNq80Hav/1SXr6Rx/hgh9xa
	 FAcOqvEF0dK0Wbe+kXtukmGssXkWF4DA8uank1zGvgHnGFCqn3TkcGWEmnAxk6rypm35q
	 FUI30K2IT8as0d+5O88e2xq+s+TPnnHQ+l2XVuL8VcHYBSq6A+eiWCjlyjtDIT+mrvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vVQV8bQ7dJZGlG+AnyXvGIO0abFwqKNBWUl84ZSQwZE=;
	b=ntf8KItXs8mDkKXfqNghmcOsrCt1uHSHtFd0vO5YEWwJDtSBABAVGx9O1gvZ7y2j7rBA
	 prGnsUPqaPxNNwtGfUw4ujzmGFWSBh+lGCReCr0RpVhX0klcEX+I+jaxJMqoYe1qcz3X8
	 VSErOo53B5dcAp6kX4y5bClnwQK3pBtD5mDXsSefUcikGvSZBkLjS275Gp91YjRP2REHC
	 z0uvG0jmtKOU4qb+8hdMeVOVlMmwGQConhgNXrLvthkh1M68z77T6vFRRkUzeUw5dAQcc
	 +Wb1H6ewZ/QCIpnz9olsKtE86j+xCOtXps79Ac0Fj4yRnhBbc9+kO26tpIpmD4RNK5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QGeRoihD;
	arc=fail smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1318C606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1318C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QGeRoihD
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5365b48238dso6108351cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792587227; cv=none;
        d=google.com; s=arc-20260327;
        b=YlFh5i5b/OAGusZjuBFvyTRwnBikVol8wTHieMrOiWgkGepP/MbOZlvD4qr6rezLOl
         qrgSLtCObwA0l1Ac9/psOAyagm1opXSt8GQEaiTqGLm5bF26mpohSUuxmEHc0WmXAWFO
         zD+ORhlJT56obUyfx6bcTlimZ65CJbLTxA+GI/ITg2fOOgetMr8//fL8zo04BqC7O0S0
         iHzDpuh/aT1Sppm2bwChKhbysBPt0Fi70hkC5XXB1AbHnlKFWls+aV0BYc2V8trKe2GU
         iFZOvptzWq8lLm22M01IBf4BWnf33GvYiH8r1L8IKNanNmV+8KItugyd4dGN1SQ7zC3D
         bZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=vVQV8bQ7dJZGlG+AnyXvGIO0abFwqKNBWUl84ZSQwZE=;
        fh=qxjUgc8AaO48YAk33IHX+1KyfezlyCaHQ74yuH+9UqA=;
        b=cplg1XeUur7du99DnQhi4SEv+ylFHMP5r2r4gCMlzXF/vZe6mBHcQ75zNCUmyCf+t4
         r3wVC2pZJCkuH90FF4AZ5DjYoW17ydCKDuQqea5JAdbxbtEaM0ilobaeWyWOUVnRxcca
         st4BSkNDSf5gXa27PABW/NFgeh9CspyKaEK8jHBXsAgcFtI8cX/kmP6Bv0h/hZG5dFxm
         EDP9jpJQEIXq9g5BhJ4lCDP3J0B8WieEaq3pycEGGHUQTXq4gdy6LMLHH0V+SZ7hYAcl
         JDfySoJTyITNDLzm+0b4wiAPvm/yI6atbnhpf4JsCdg+ZVIAaxXRpPRbmdD1Q7RePxJy
         HOJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792587227; x=1793192027; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vVQV8bQ7dJZGlG+AnyXvGIO0abFwqKNBWUl84ZSQwZE=;
        b=QGeRoihD65FQdc8RvPozpgQSjV7yOWDU7rcZKasvivK+eBB4yUw8nHpwWFtGAsIy7n
         8hlP8ZksN9BUyilV0cFLqYUE9yiEc2JIqwkFJ5/fnFcUL1b87UUOrYqcnHNMyJFeU3uf
         EI5GaVjyB3nxUuKvKC9hCVvXt/J98q0dCLiYmupDCIRjPDv+4G/YtQgM4P87YebLDKuu
         rnnCReSmi9jI35inLq4N511Uwijd2OPH5XmV3lJcBOvPlmoB7aEDxslrlRgSKHqef8o7
         W8zc/Np8u04T1qU38zEOTtyeaIDz0NVYFsLdE8zTeSd+tewXXzGzVQ/q4IQhd7lv31XX
         K0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587227; x=1793192027;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vVQV8bQ7dJZGlG+AnyXvGIO0abFwqKNBWUl84ZSQwZE=;
        b=rDWB4B13BupjQXnAXN/jM1+uksJa8EN8VKiN4kb52JBKr+PdEiUCSvy42k3Wn+KmjH
         FghIxp2qArQAejLinLeZwiK7l4jarh5mWIqVGRtXbDRDdyO3iJK0VSzhXjZsCAQq7vmz
         AMCHqZ+PrCsjXZG6lnxNH8VXph+RDDBV2AzpVci3kQ2f3WbTjLaPcQFwOFW3q8tWpnGU
         6bZKEyn5jMM/sTYC0uc+2nMq9hwmYq27jT3HH/T7R0n1A0lTy0i5y+gRmcEf/326PbMa
         3SgyF6QFgSQhWO7L0G8cFIV4qkBrooLE1pLsAffKSvK9O0PLpKcG6fVmvPyymHQfddeV
         daeA==
X-Forwarded-Encrypted: i=1; AKwUvBwyPcW4Hm4fh9uCfMUZeUsImRup154ikyj83HIcUl7IDlImR/P+PyX/k+JwOZTubE4jEGjpSjlnhr89tKA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7n3a47EtNh594rICoxmsgsTVlCAx0wRDv+qIm6RcW8YyCG8V7
	wdZtJJ7L2mN1nx/odmvF6o99/xbhiwNoNBO/+9g/mqFCS3b+eqm1uZ9b8KLqhuhclEciCmdu+/r
	H7NmgDUn/spEFvqTKGfN8OiffdMIxWS0j7ahRpbFy
X-Gm-Gg: AYBFou15lCTTml81tlXN0WEVBiMWaNyKnMZpJMAVeOyTTsFYj/OhJoCtKPSlPHgMz5I
	QH53jtCfsJasYSDWKjeLa1kA50kvY6ZeT7P6ns29/psX8UmXFsMIqbvoH1GHlBVK3DjaAhM1IoN
	te7JYDMrwqi/c0PgQ3eQsPHdf7FMm3M8mFj6OfqZEd9qPRwMSLPIMD47OMOEWxEpoKW5Bgw8BG4
	lLxOSs15egqE/InPtzJT5blbLrUFZ7n8WQ+kQam8AXtQp7YUt8CuYRiT0bASh3TaQXnLZyIJZ6W
	8WMh7EtMGE3Y5Ob3j2MgPTZRmVlh6BJ2qWJR6EjIRhJyfKkZe6ki299Bo0ImpKHRkKvhMoN/K0u
	TEYreOZ4vVEe/NuDh4DT2jxWPrvC5QAjJriSxmARrtaHvMXdFh4Y2ldrFu2zQLOulkLs=
X-Received: by 2002:a05:622a:2298:b0:535:1cbe:375e with SMTP id
 d75a77b69052e-5369b86a007mr26318971cf.59.1792587226044; Wed, 21 Oct 2026
 05:53:46 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:53:45 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:53:45 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261020131447.122096-3-pbonzini@redhat.com>
References: <20261020131447.122096-1-pbonzini@redhat.com> <20261020131447.122096-3-pbonzini@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 21 Oct 2026 05:53:45 -0700
X-Gm-Features: AclHuK_cQy3FIEKPEYLrrT0unEbP9o3cNdKisHPXC0klQRVgJdOZliD266c8PeQ
Message-ID: <CAEvNRgGceF8m5GFV0aE2ALkVEY=mvWevGmaCrgoxcLznadOF4Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: x86: leave the legacy private attribute in for
 TDX and SEV
To: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Cc: Fuad Tabba <tabba@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Shivank Garg <shivankg@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Sean Christopherson <seanjc@google.com>, vannapurve@google.com
Content-Type: text/plain; charset="UTF-8"

Paolo Bonzini <pbonzini@redhat.com> writes:

> As of today, and presumably as of Linux 7.4's release date, there
> is hardly any VMM that supports guest_memfd attributes.  Support the
> legacy VM attribute for private memory if SEV or TDX are requested;
> default it to disabled if only the software-protected VM is requested,
> since it is only used by guest_memfd selftests.
>
> While in-place conversion is the best option, it is way too
> early to enable it by default.
>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  arch/x86/kvm/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index 01a683a9042a..4f7d75ec8c40 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -80,6 +80,7 @@ config KVM_PRIVATE_MEMATTR_VM
>  	bool "Enable per-VM PRIVATE vs. SHARED attributes (for CoCo VMs)"
>  	depends on KVM_SW_PROTECTED_VM || KVM_INTEL_TDX || KVM_AMD_SEV
>  	select KVM_VM_MEMORY_ATTRIBUTES
> +	default KVM_INTEL_TDX || KVM_AMD_SEV
>  	help
>  	  Enable support for tracking PRIVATE vs. SHARED memory using per-VM
>  	  memory attributes.  Using per-VM attributes is deprecated in favor of
> @@ -87,7 +88,7 @@ config KVM_PRIVATE_MEMATTR_VM
>  	  CoCo VMs using a VMM that doesn't support guest_memfd memory
>  	  attributes.
>
> -	  If unsure, say N.
> +	  If unsure, say "Y".
>
>  config KVM_SW_PROTECTED_VM
>  	bool "Enable support for KVM software-protected VMs"
> --
> 2.52.0
