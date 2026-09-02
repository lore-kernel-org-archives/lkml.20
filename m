Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2EE49C4A7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353024; cv=none; b=JYOPMhSC+OH8I1z22gmoZxIEkFZh+Sg58R3/xZ6KP7BbpEkyAvTg0uHJt6WvggM/PnjoHnus027mCLFTRw4lafuAo4HtzDjNrS9+g3XxE0VTh9GR4c0nZp3TYQ7uKRe8q0+rgoBaDtmLbY39VLNYqmneKfsnIl9nRa6r0V4IYKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353024; c=relaxed/simple;
	bh=qgFa0CiH1bv1yxLezXqbsS7f0HGLYm+TETHbTLiEsz4=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JnFj6Fns5WMCK6JFnQ3elqisuqI1z7v4DHB7y5juzFoIbZSgNE2csqkGjUEEdDT+3ukLmrLirIm0H+cqAxy5EmImWhBSnKxKIL9/Ekq/Z1A4ktF+P7Q17fAf7iM4UN0wK5B5Z3c8cVzWC+n/LndgzmMsjhmZu7baGzMBHSTNWYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvdYC/Vm; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvdYC/Vm"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c20ce3c118aso201257866b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788353021; x=1788957821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y+y7hZC+VMnjw/gNt+VIRX6BpULMwiS0+R6doj5v4W0=;
        b=UvdYC/VmcnfKfn2NC89UsSdKcDMb+ef9LiEx5/d1jFOKYUuX6djQrc+rff5zrBR/xA
         dl20MbyO/tvN+Dk3XJSasEp/GfykOcVodBFQp8x1++0QcKifm9B2fblnfoNE+AI/48AK
         ORBMNqW3LaMyz/gpYcmyLJ3Ldi1flCiiOC7zhOmsTMS9zdC+xdh8bZThg2G4kKpGDGFV
         Aq4iSfWQqNJ2J5C4Uo/BJabrcJIoNzFPqY9AmNEgzCjTN5IXRcQc86MqD9fBMydMlOw+
         QHSkInqDo+d4mV1ek3ctYqKakNLaDefP52btWP4+KzKZRD2HjUarXwJwHjJ3H+fwPNJ6
         7VPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353021; x=1788957821;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y+y7hZC+VMnjw/gNt+VIRX6BpULMwiS0+R6doj5v4W0=;
        b=WMD6Sx4kFTktxyNQ1q3xZX/Worn1sCrkplPmDe6da94Qd8460qYWpzQglcmv0UrIzV
         Sfp7OkDewNO3r1B2w+IUi7b3na3ftPJNnx52y5a7EFU8BAD5+U04oJaStmobv8pOQ6Wu
         e/7L20N1QeNMcVr34Uq+JSwYiwxzXh5a1DB98m7R95bvreRk27bvfrV/N5HpyoFQtQpO
         +5rkeRqDLhPS16GN2ucWgV6iAySEk5qBhaWZkNu0+sp0uUgnLntvT7/gZtAx3ae6hiRh
         VdPnE09y9L4G7252dXiokajWFrsXXMvkL0RD2UPkXr2CoDawX4rClZmXZTxbHt7zIebG
         H8Xg==
X-Forwarded-Encrypted: i=1; AKwUvBwA/WksNL0vPSFMP2WnOxzEbv0wcrPmcEe6n7OZL9+q4qX5p4dgyOdN0CTJl3Dkoh61MUDfPcEFX/6ZMHc=@vger.kernel.org
X-Gm-Message-State: AFuF++mmrvdAf+lAVLtXMkEHUted1gafjoS46ffteFAMbyVY+nVspo8r
	mBDcR8VGTG5pnkM7V82Pxfp23EMUGFArFYShWnh9tEl4cNF852cXhHO1
X-Gm-Gg: AYBFou397MvUmD+pm0x8vtswNzbgxEzth4Vm1Izo4hvGTvs9pVV/DM+Le8evJL0nMQJ
	t5va+k00H+bHeq5tBWzn874tsKim6n5TqeeJHeMIEECR6Y70fJlAGbcy7yaNI/aj4BMVxeFNToE
	MklXZ/nHBWInpt+xgs3uZCV0SsAYLYDqGrTA5eknj9Ru7VaAs4pkFM6rFvgQfRsZVUhibpEhYZw
	PwgOHcq+QwBGNFs94dC74J/oefoAkpx4oKqXZuYdfD9VwH/RpE4sz/W2alQOPRPN96M3XfyA7KA
	vole84mqugN4UMYUalXqETr5U6XNl582UoqhGSTsFEtnX3k+iEzOT5EC5Y7J+7ov5g5lmbWsAgc
	R3j+aoVO9mWvOc5SyIbl3R+XD3Ive50I9az1GvTzk07l9ae8a7LO5t0T7JGL08rOnE18HVI94th
	gymHe+IBBjETmGdWzTTPX6KoU81541sJTYA7I77LQRYkATBZC9k38BMVQwYDFOunHO
X-Received: by 2002:a17:907:728f:b0:c12:3cbf:9f6d with SMTP id a640c23a62f3a-c25dc9c10e9mr187020766b.1.1788353020682;
        Wed, 02 Sep 2026 05:43:40 -0700 (PDT)
Received: from [10.45.18.37] ([15.248.3.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d039d796sm131254066b.40.2026.09.02.05.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:43:40 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <3cf0e66f-dc0a-483d-b95d-ea1511a2cb23@xen.org>
Date: Wed, 2 Sep 2026 13:43:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/13] KVM: x86/xen: Take kvm->srcu in
 __kvm_xen_has_interrupt()
To: David Woodhouse <dwmw2@infradead.org>, seanjc@google.com,
 pbonzini@redhat.com
Cc: joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
 ankur.a.arora@oracle.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, x86@kernel.org,
 syzbot+208f7f3e5f59c11aeb90@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, suryasaimadhu369@gmail.com, lkp@intel.com,
 nicoyip.dev@gmail.com, frn1furkan10@gmail.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, imv4bel@gmail.com
References: <20260831213632.81023-1-dwmw2@infradead.org>
 <20260831213632.81023-11-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20260831213632.81023-11-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/08/2026 22:26, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> kvm_gpc_check() checks the cached memslot generation against the current
> one, which dereferences kvm->memslots and therefore requires kvm->srcu to
> be held. __kvm_xen_has_interrupt() does not take it.
> 
> Most callers do happen to hold kvm->srcu, but not all of them:
> 
>   - kvm_emulate_halt() on the VM-Exit path, via kvm_vcpu_has_events() and
>     kvm_cpu_has_extint(). vcpu_enter_guest() drops the vCPU's SRCU lock
>     before entering the guest, so it is not held on the way back out.
> 
>   - kvm_vcpu_block() -> kvm_vcpu_check_block() -> kvm_arch_vcpu_runnable(),
>     which is the case the existing comment in this function describes.
> 
> On a PROVE_RCU kernel the former produces:
> 
>    WARNING: suspicious RCU usage
>    include/linux/kvm_host.h:1092 suspicious rcu_dereference_check() usage!
>    ...
>     kvm_gpc_check+0x344/0x3e0 [kvm]
>     __kvm_xen_has_interrupt+0x83/0x310 [kvm]
>     kvm_cpu_has_extint+0x1ff/0x370 [kvm]
>     kvm_cpu_has_interrupt+0x16/0x100 [kvm]
>     kvm_vcpu_has_events+0x4ce/0x690 [kvm]
>     kvm_emulate_halt+0x52/0x1f0 [kvm]
>     vmx_vcpu_run+0x988/0x2630 [kvm_intel]
> 
> Use guard(srcu) so that the three existing early returns don't each need
> an explicit unlock. SRCU read sections nest, so this is harmless on the
> paths which already hold it, and srcu_read_lock() does not sleep, so it
> is also safe in the atomic case which this function already handles.
> 
> Fixes: 7caf9571563e ("KVM: x86/xen: Use gfn_to_pfn_cache for vcpu_info")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Assisted-by: Claude:claude-mythos-5
> ---
>   arch/x86/kvm/xen.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
Reviewed-by: Paul Durrant <paul@xen.org>
