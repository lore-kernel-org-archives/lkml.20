Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9585434CCE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789019599; cv=none; b=VSKHSEzFQgGCzwPck2jJyVviq1OkkrDn4a17/IwqmzHNDNYzJrJsJehog16xah7Jv1XTVma7juoKzZ05NRFA47nSta1v0GxR6eGHY1WlIxkufhKkKDs/NJm1ou9AXTr7F7allODbp5FaJ/hE3E2pW2OfKgEEVhx++U6nGcYLqLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789019599; c=relaxed/simple;
	bh=H0YWLVNt1VspJyW++/mL2xiGGQ1f0zXMz1fyGHmQyZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UOrYexGSgT3CR6O9I3m4WbZwMTsaQnU+NihUkEmd9yFf0Vd2pFOij2jYbdoh27+hyjtHgBFw6cLKYeJuUdoef1jTxEnEXLJ0YE8Sygpo+eILElWeSWEv3AtF9jn5XsB8Ow6mylKRAgwuBEvTX8TyovbSOEvknyH7SeaY/iEqNJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YL6xqdsf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kl0upvzk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YL6xqdsf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kl0upvzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789019596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aMvkKeYrjNymKP3nzuev6PMvw+A1W0w+cadnXyWgZ8s=;
	b=YL6xqdsfu3wSii8TSKIcYYLnf7o/aCHfaKwYd66rfmHv1SbtqK4z8NNOWJIzJq9YXmWBrW
	788biDknj/LrErgK1ysDLOR2JnnsGNmsbn7QyR0rN+/kvO0h5Ag7Xq6Ge3DfFkM33XuUQ2
	0JPU1/3s4gjDofFxz0ZY2b/fSKJVSlk=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-Sx12B7BEOiOK-xaxx1cXhQ-1; Thu, 10 Sep 2026 01:53:15 -0400
X-MC-Unique: Sx12B7BEOiOK-xaxx1cXhQ-1
X-Mimecast-MFC-AGG-ID: Sx12B7BEOiOK-xaxx1cXhQ_1789019594
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so8435239a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 22:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789019594; x=1789624394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aMvkKeYrjNymKP3nzuev6PMvw+A1W0w+cadnXyWgZ8s=;
        b=Kl0upvzkNScSvwSVY8x5ZZ0PSkVpt14VtcO/p7EJt2gwvyTmOqyI8AkJ+4/sQlyDqu
         IaGT2CcO9+RD7o8Qq/0yXPQNVrxeU/fGgx12f+GPBjasMGJYXTKsjZzZvwZ1ufTCpW0U
         vRIMkjWIXp3cOJaX5EUplUPSuYjr6LI1+QcEqL+n6SmOdRJM5/vf5Cyxv9Vs4eZbKEfg
         GXcTZNyktRkqEClIjQ+VOaBlH8SQBZe5PA2+sWXemjwdpLzhjQK74ikuYeaQNpjOa001
         Y7giqkjk+rNXt2PvTztsqISwyJrwFDSdMf8HgwHJ4U6UPE/1CjGQk94oQDDhvtIigWJh
         7j+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789019594; x=1789624394;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMvkKeYrjNymKP3nzuev6PMvw+A1W0w+cadnXyWgZ8s=;
        b=rGmzikv03+a0Fb8TOXmXq+lcYSqjjcZCJ9bLbMbx/0blgFBh6tmQMrfoK/fq6vSkAP
         hg3kSb98uxquoR7JxmB0X8HNQbr9nzduGySSj8kMJZVQb22kLS6Bta2scecXk3OsSFiW
         FXK2MMtDbh4UhUJJENzQaN50aowK/lnJKV+FvpzJ2lO3dhEiuKQkpxPzGZ3K2JWac3WT
         MGrXX3KMGd0fxDT4O2nz/gLUkJHx62AjH1RzdYkzIljF/BUCvzk0qiek+YokdBq3k8uv
         I8SM5dJviHSGTTgeKXYFJ2RPo8rO8o75WpTwn+KWoywvDi3CkoYnnyHj8gBKdzyBsMjV
         WqFQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1SqB/29mwR82TXRn8l1hFWO1ex5pEhV93H7Iw/+XHhG4qJle+xvuf18y3jHsH90TBVUX/XYaMWTiZOus=@vger.kernel.org
X-Gm-Message-State: AFuF++ni2rYXjUoL8YuK2bEcngiV1h9Cli4ErcaGeb1lTLJGh2qotThH
	RieYam4n0T83yU6QyIEsqBXr93LkoDbh+weeQGXTtbsNo93OYNVZfe479NQnFiU/pX7VzpjEirb
	2rPGn0f2j1tVhfFt/36KGXaCBQx5cl6ZMsvleBArlIPHYmYoUzi57QuSWaFQjZ0cVkw==
X-Gm-Gg: AYBFou1INO/+riOV77jeRqg5UAUWdIkqGOLpNzfgJ3BFk2eAGrs1JE5IQ+mPINaJSzG
	KmvqP5KKy1mfmEcdQPZ7zUXj/RlMP7KZvpM8BCgBl73dDST8/5HzSVDKS96RcM9ny8+xVm1K4U3
	5wmsvInFJ1q3C4bc2D7+JkuaDWIe/iFawmrgeGCG1lqq9vWmE1pqv/MMM9wO7GaR61Bkln8Hm8x
	ZHW+nO5c6MoJ0G9OJnOewIhwTQj3OL/uttX1pVHOWRU7Idkd1u6d2albjiBCyzHmYzhBsuKO5TH
	mc7ytwpr/yknExzm5W3eRvN0eMblnS8nYTSG0VTUgq696G3lzUFWmrG5p1vXrhbYTFwWQceXIiF
	ZbXrrtL+Cnr2QfKjFNgsmKeOjyO155kkOUAczLuaWEA==
X-Received: by 2002:a17:90b:5905:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39b262133ccmr56583385a91.18.1789019593821;
        Wed, 09 Sep 2026 22:53:13 -0700 (PDT)
X-Received: by 2002:a17:90b:5905:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39b262133ccmr56583277a91.18.1789019593097;
        Wed, 09 Sep 2026 22:53:13 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39bae615657sm2525614a91.0.2026.09.09.22.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 22:53:12 -0700 (PDT)
Message-ID: <e66698e1-e582-4ff8-9881-4ddda5bc1d94@redhat.com>
Date: Thu, 10 Sep 2026 15:53:00 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 06/20] KVM: arm64: CCA: Add a new mode for supporting
 Realm guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-7-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260908162223.1683432-7-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Suzuki,

On 9/9/26 2:22 AM, Suzuki K Poulose wrote:
> Add an explicit mode to support Arm CCA guests.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   Documentation/admin-guide/kernel-parameters.txt | 3 +++
>   arch/arm64/include/asm/kvm_host.h               | 1 +
>   arch/arm64/kvm/arm.c                            | 5 +++++
>   3 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 68647ff4bdd24..1afe3df3b923e 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3256,6 +3256,9 @@ Kernel parameters
>   			nested: VHE-based mode with support for nested
>   				virtualization. Requires at least ARMv8.4
>   				hardware (with FEAT_NV2).
> +			rmm: Support for running confidential guests in Realm
> +			     world using RMM, as defined by Arm Confidential
> +			     Compute Architecture (CCA)
> 

I'm not sure, but 'realm' would be more appropriate name. rmm (Real Management Monitor) is
the term limited to the firmware to me. Besides, we have been using 'realm' broadly in this
series like kvm_vm_is_realm(), kvm_realm_state() and so on.

   
>   			Defaults to VHE/nVHE based on hardware support. Setting
>   			mode to "protected" will disable kexec and hibernation
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index b2e99c5cb1cd3..31ae9d8d8e92f 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -69,6 +69,7 @@ enum kvm_mode {
>   	KVM_MODE_DEFAULT,
>   	KVM_MODE_PROTECTED,
>   	KVM_MODE_NV,
> +	KVM_MODE_RMM,
>   	KVM_MODE_NONE,
>   };
>   #ifdef CONFIG_KVM
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 9af3bbb2f8c24..50f0adfadab38 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -3264,6 +3264,11 @@ static int __init early_kvm_mode_cfg(char *arg)
>   		return 0;
>   	}
>   
> +	if (strcmp(arg, "rmm") == 0 && !WARN_ON(!is_kernel_in_hyp_mode())) {
> +		kvm_mode = KVM_MODE_RMM;
> +		return 0;
> +	}
> +
>   	return -EINVAL;
>   }
>   early_param("kvm-arm.mode", early_kvm_mode_cfg);

Thanks,
Gavin

