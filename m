Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793308757;
	b=ElXIKVabojy3iFk3YqaZtYusnyavXQCR/UXjxI8zRq+FdGf35pFdJZoLUgpzdwVjkPzc
	 NS4wF2AbxC+KNBd0u4n3hDjSRVmTDZJErMxyY6wpB3CokCWLbjiiLyXOtJr0U7urx/oPA
	 +1TFGcuKjCYCjvpo/zvIWLssxK1JW01h1JmunaZ/b8wDVkp5L3JDBuc/P/XhFQCXzWcxt
	 zzbm6pnswniWA6SQ4zgoJ2UM2I6Shg2TPNipspOy0YK2N+yUk9mRpuzsfXvC/ow1H0UZn
	 /ntqznYA7kNvuc0jpNKuGZ9+7h/EFPHai90Y+0BuJfssXTcuQLgbnW1X11q+k8I02cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793308757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=XrOdXK5MJaZc6vQPZfGn1tZxemfMdTWyC26Qnw17Sz4=;
	b=UsFCL8ZvuXTs3dklnn8ur0fuFUKkCJO24KIwJ98ISS66LsWTj5XPxVPCmF6e5kWTmLQk
	 tGYrDjkVml4X3EuNaCOb0hDKqyxyqGcsybbhGsxFoQZI+9CzkUUvmOXe7OJB+Tl9vnAke
	 NOShSAD3knpfEhkp9Lrwl75lS8A2R0f8wKKlI2jn+Ax+AK/pv8TxcTBVc5V1GpvzRnUTa
	 pUfYIxHlfaQgcueMBW2E0sfZF++8aSwB0sorjAe9OZu97DeGEjrq8NyAXOCepcFIaXnOQ
	 XWh066W+JMKqnU/duB9XDYD9fLBEPnVIpYFdMG9CcsNF+LTWT6xq9eDL8nl4Y3i9d6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T3a8whui;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5FB606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F5FB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T3a8whui
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so31856a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793308756; x=1793913556; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XrOdXK5MJaZc6vQPZfGn1tZxemfMdTWyC26Qnw17Sz4=;
        b=T3a8whuihdDx7Y3dZu/J4WSUiyuHu9KemApWFzyeBszF2peBcDP0C4EVAQxN66wsxM
         f57YGcJyXwcqZYHYEcJyAuGT5gPucJgoGtBuFR4A5gDnw135fTcGfr5LQFFF5maUGKMY
         BYNp9IACZYfJfyMBXwCwAGv0voFPGfKsdLgYwn9J60/sYbfzsBQcXdD5+yhpq72eAtj8
         Bp+mdAMNzG18sJa2M60ABls83VarqTu9yyXxQReLWvZOWIZsHhQPLgus1oEi6RdQrgTL
         xGHdFiyJ4gR40o86k1jf3G5nS0x9aR8LftC+LdEG9O7dUx0UXCrpcIaR+Xpr7wvEZYSf
         BlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793308756; x=1793913556;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrOdXK5MJaZc6vQPZfGn1tZxemfMdTWyC26Qnw17Sz4=;
        b=1sTSgKEsw7UnjuJa+rrztusi0duu6AbsT/D+BuqoGck0ZeUrdwF1+S6NKtqheV+JRl
         YcEMQSFQaoCfbuYbELdx5knN/1mzviFoERgrCw+DAkr4+o/xUganWVmRzoK92+ga5DOE
         fO4fMucB+Xku6QaQ+bdyBwnhLGPjTLPsQO22oGsg1jmrVz0sv7qwPsLuWndpIpuHMFN7
         EQLxJfyyDfDYDV2GwE8vAUGs0YCo16MMdR1YJ82QGRvqC3AGRWXkYJhsJTpXaidPrsP1
         xgiwKM91y4wBXgHiJqjI6fo6jjpzrZ5OgAZXK5XxTXQyCu0qyflUDelqMaqDGo+7qEz6
         9qnw==
X-Forwarded-Encrypted: i=1; AKwUvBx6bapgooo73Oam6Q3SiLV8EE3xydAn+RCUWJ4n33mXz3wZGKLf3Q46nxxczoW7thMVZ+AbfOUmKfmiMI0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwC6Dl1OmGv+cQcdVzCvFLtwe3a9wmsVhKDBrqslfmWDGtXgWi
	2dPCQSebN5bp2xGUepIoOkPCz6SLmGtcyXlAplO1+ahTBzAnSwdtZTP4OEdDczZETC8zAIjsH+Q
	aqI8Iig==
X-Received: from pgfd7-n1.prod.google.com ([2002:a05:6a02:6547:10b0:cc7:e6e5:e624])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4cc8:b0:3a0:c276:1ec0
 with SMTP id 98e67ed59e1d1-3ae897f673emr156104a91.28.1793308755622; Thu, 29
 Oct 2026 14:19:15 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:19:14 -0700
In-Reply-To: <20261029202817.901145-1-jmattson@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029202817.901145-1-jmattson@google.com>
Message-ID: <auO4UueaV0mTVzzB@google.com>
Subject: Re: [PATCH 1/3] KVM: SVM: Check EFER.SVME before updating MSR_VM_CR
 on guest writes
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, Oct 29, 2026, Jim Mattson wrote:
> (Host- initiated writes are allowed to set any valid MSR_VM_CR bits.)

Eww.  Why?  If we allow this, then we'll end up with the mess where the guest
can't write back the current value (if userspace is being weird).  I get that
we want to avoid ordering issues, but there's *already* a required order here,
unless userspace ignores the failure from svm_set_vm_cr() and continues on.

KVM doesn't advertise the MSR as something to be saved/restored, and none of
QEMU, CHV, CrosVM, or our VMM appear to save/restore it.  So why make trouble
for ourselves?

> Fixes: 4a810181c8bc ("KVM: SVM: Implement emulation of vm_cr msr")
> Signed-off-by: Jim Mattson <jmattson@google.com>
> ---
>  arch/x86/kvm/svm/svm.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 136069dfcd44..3a0a507c94b2 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -3015,14 +3015,24 @@ static int svm_complete_emulated_msr(struct kvm_vcpu *vcpu, int err)
>  	return 1;
>  }
>  
> -static int svm_set_vm_cr(struct kvm_vcpu *vcpu, u64 data)
> +static int svm_set_vm_cr(struct kvm_vcpu *vcpu, struct msr_data *msr)
>  {
>  	struct vcpu_svm *svm = to_svm(vcpu);
> -	int svm_dis, chg_mask;
> +	u64 data = msr->data;
> +	int chg_mask;
>  
>  	if (data & ~SVM_VM_CR_VALID_MASK)
>  		return 1;
>  
> +	if (msr->host_initiated) {
> +		svm->nested.vm_cr_msr = data;
> +		return 0;
> +	}
> +
> +	/* check for svm_disable while efer.svme is set */
> +	if ((data & SVM_VM_CR_SVM_DIS_MASK) && (vcpu->arch.efer & EFER_SVME))
> +		return 1;
> +
>  	chg_mask = SVM_VM_CR_VALID_MASK;
>  
>  	if (svm->nested.vm_cr_msr & SVM_VM_CR_SVM_DIS_MASK)
> @@ -3031,12 +3041,6 @@ static int svm_set_vm_cr(struct kvm_vcpu *vcpu, u64 data)
>  	svm->nested.vm_cr_msr &= ~chg_mask;
>  	svm->nested.vm_cr_msr |= (data & chg_mask);
>  
> -	svm_dis = svm->nested.vm_cr_msr & SVM_VM_CR_SVM_DIS_MASK;
> -
> -	/* check for svm_disable while efer.svme is set */
> -	if (svm_dis && (vcpu->arch.efer & EFER_SVME))
> -		return 1;
> -
>  	return 0;
>  }
>  
> @@ -3262,7 +3266,7 @@ static int svm_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr)
>  		svm->nested.hsave_msr = data & PAGE_MASK;
>  		break;
>  	case MSR_VM_CR:
> -		return svm_set_vm_cr(vcpu, data);
> +		return svm_set_vm_cr(vcpu, msr);
>  	case MSR_VM_IGNNE:
>  		kvm_pr_unimpl_wrmsr(vcpu, ecx, data);
>  		break;
> -- 
> 2.56.0.317.g454f8302e1-goog
> 
