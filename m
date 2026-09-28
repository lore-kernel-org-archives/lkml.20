Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FC54E433A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611428; cv=none; b=Mo8mfTMhMK6EIMdJqFHm+zYk8jNytiGh5NZvN4uyWbXCaEHgX38EdkUBSUyUIyAcIJQ3DjBHC7bfjSJA/IrqkWJE4yLFtqioAoFtKF8zX/ku7EWH1YX+okXSiRUCaNenE0jv1uBnbIorp4IADMsqwvYzlVsPXACWR6mhe8nZTqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611428; c=relaxed/simple;
	bh=6poYT8wvzWkPYzInGtP84uQbg/EtBuWlXkrE61GqvwI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W7ALfc8xZVA+UnNKXS8aB0La4Yc3nfeLk7QNSITyggUXQN6jh6RQMhK7jWBCBtA1l973x7xfabpQxE7aEMkz5JR3vJvF5k5Y+pE2HPp4HkXnTGPQ2lqcHk+f4UWCj7g6iRG29+s20KuPTrRiS9G4/U5qRl7xwx7OW34r94QKZuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gPizLoQw; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gPizLoQw"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df375fb9b2so33782945ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790611426; x=1791216226; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MIPSTOx/1qgMkL0+FjIuD+pgiQqqd0H+a8WED9RskN4=;
        b=gPizLoQwK4RlawtsLGzyrNK4iXihIt2wX9GpAuBj6c387A9wQfRkUcndAwG9ESexuE
         N5WcCHtWgJ1ahIdKv5X089dZKmaQuoajHahw07zFvgh9wBOsanaDrE4fm/meTo/sz8Ed
         9zfMrZJmEkSAHx6hcf1NAHMBeWr7+u9JKUzdxcWIwwG/W7SUDZfaEyghDjkdukhbL76i
         yDCNCHGwjG2L8jjbuoSjdU5sj6cZYCKCxVQKugGiIytjTsh/cbYohkiqdNapsgH/QUY9
         4ti6dndzdaJfTtti0tnYg2xzdO4Qsj/0kIc4MjAGTo11eQIY4NIjS/fBBIkSn2LjZZhJ
         TAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790611426; x=1791216226;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MIPSTOx/1qgMkL0+FjIuD+pgiQqqd0H+a8WED9RskN4=;
        b=2GkSlUJdCokGwqKW3n9ytu5T9+YM+1EVjcnw8DyiLd+penL/A0x0uB972vo+BHwlpI
         UjHQAVNgUpxL5n3Iocho2ZKojIHO68rJdF+wFMiZalVBMBbqjNuwUbZdPQLCu/OLka1N
         hDwr9WrPskleWD9W8BoAz7DbkU9uuNcRKnLnTyxn8/9+EfcFpIgfDU/k+n8Vx8AY4JWY
         IXNX42N4/DMbK35mON7oxHhY6c69s+TycTbp0Fyr1iwmwg+hGTcecpYNU9xnMJqRMhfW
         hfMrNxYelcRnB8+4zHhJacyC8g40aCkKhR7MbwiKlVSyWVSloeWktAUEkHczt3QHYR5a
         ey5A==
X-Forwarded-Encrypted: i=1; AKwUvBxfmDLb3sOcVXywiJGAZvUr6YVO31aa1aSvxFmI27wptiWuM6MSfp82UCIlExsvwYHGHRbieBLsfSm+hqM=@vger.kernel.org
X-Gm-Message-State: AFuF++kCFLFIfgsViSnEfqw4OPHDpVAzhw/FoBGT55ExghaeMZahSNC0
	EMKIckw8oXI49KACKlltvAP1hOJlaUxRvAbnBFTSY4m59OzM+dvitHBRGDJPsdtmWcMutA3x6Vw
	S/EEBPw==
X-Received: from pgdg6.prod.google.com ([2002:a05:6a02:51c6:b0:cc7:a826:e274])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:48f:b0:3de:5e37:26b9
 with SMTP id adf61e73a8af0-3de5e3727camr3390215637.52.1790611425928; Mon, 28
 Sep 2026 09:03:45 -0700 (PDT)
Date: Mon, 28 Sep 2026 09:03:45 -0700
In-Reply-To: <20260926063721.1471741-1-bestswngs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260926063721.1471741-1-bestswngs@gmail.com>
Message-ID: <arqP4TM9pRTw7SOG@google.com>
Subject: Re: [PATCH] KVM: nVMX: Rebuild MSR bitmap after eVMCS control changes
From: Sean Christopherson <seanjc@google.com>
To: Weiming Shi <bestswngs@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zhong Wang <wangzhong.c0ss4ck@bytedance.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, Sep 26, 2026, Weiming Shi wrote:
> The Enlightened MSR Bitmap shortcut reuses vmcs02's bitmap when L1 marks
> MSR_BITMAP clean, but the bitmap also depends on execution controls in
> CONTROL_GRP1 and CONTROL_PROC.  L1 can change either group while leaving
> MSR_BITMAP clean, preserving stale APIC_TASKPRI passthrough for L2.
> 
> Reusing the bitmap after a failed rebuild is unsafe too.  The failed entry
> disables hardware MSR bitmaps, but KVM subsequently marks the eVMCS clean,
> allowing the next entry to reactivate the old vmcs02 bitmap.
> 
> Require both control groups to be clean before reusing the bitmap, and keep
> force_msr_bitmap_recalc set until a rebuild succeeds.
> 
> Fixes: 502d2bf5f2fd ("KVM: nVMX: Implement Enlightened MSR Bitmap feature")
> Cc: stable@vger.kernel.org
> Reported-by: Zhong Wang <wangzhong.c0ss4ck@bytedance.com>
> Assisted-by: LLM
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>

Fix already posted[*] and applied (I cheated a bit and sent it to Paolo off-list
a while back).

[*] https://lore.kernel.org/all/20260926053253.195597-7-pbonzini@redhat.com

> ---
>  arch/x86/kvm/vmx/nested.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> index 151873407abd3..0f0e677d99482 100644
> --- a/arch/x86/kvm/vmx/nested.c
> +++ b/arch/x86/kvm/vmx/nested.c
> @@ -755,13 +755,17 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
>  		struct hv_enlightened_vmcs *evmcs = nested_vmx_evmcs(vmx);
>  
>  		if (evmcs && evmcs->hv_enlightenments_control.msr_bitmap &&
> -		    evmcs->hv_clean_fields & HV_VMX_ENLIGHTENED_CLEAN_FIELD_MSR_BITMAP)
> +		    evmcs->hv_clean_fields & HV_VMX_ENLIGHTENED_CLEAN_FIELD_MSR_BITMAP &&
> +		    evmcs->hv_clean_fields & HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP1 &&
> +		    evmcs->hv_clean_fields & HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_PROC)
>  			return true;
>  	}
>  
>  	CLASS(kvm_vcpu_map_local_readonly, m)(vcpu, gpa_to_gfn(vmcs12->msr_bitmap));
> -	if (m.ret)
> +	if (m.ret) {
> +		vmx->nested.force_msr_bitmap_recalc = true;

Copy+pasting a comment I made off-list in reponse to a suggestion to fix this as
you propose here (though you obviously caught the early return issue I pointed out):

 : Hmm, I like the idea from a "what's logical", but it's wildly unsafe.  Even if we
 : fixed all of the paths that could cause problems (and there are a lot), the code
 : would be extremely brittle, i.e. we'd always be at a higher risk of reintroducing
 : the bug.
 : 
 : Specifically, if nested_vmx_prepare_msr_bitmap() doesn't run to completion and
 : actually update the bitmaps, then L1 can re-run L2 in the future *without*
 : changing the control fields, and once again consume the stale bitmap.  E.g. if
 : CPU_BASED_USE_MSR_BITMAPS is clear, if hv_enlightenments_control.msr_bitmap is
 : disabled, if mapping vmcs12->msr_bitmap fails, or most problematically, if
 : anything between updating the control fields in copy_enlightened_to_vmcs12()
 : causes KVM to bail from nested VM-Enter.  The window for that last one could be
 : shrinked by detecting control changes in prepare_vmcs02_early(), but there would
 : still be a bug.
 : 
 : In other words, the only input from L1 that can be safely consumed on-demand
 : HV_VMX_ENLIGHTENED_CLEAN_FIELD_MSR_BITMAP, because that's L1's responsibility to
 : get right.  For everything else, KVM needs to well and truly force an update
 : when *KVM* detects a need to update the bitmaps.

Thanks for the fix though!

>  		return false;
> +	}
>  
>  	msr_bitmap_l1 = (unsigned long *)m.map.hva;
>  
> -- 
> 2.55.0
> 
> 
