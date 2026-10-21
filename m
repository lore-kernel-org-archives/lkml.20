Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792586212;
	b=xJejpzlC/FsIBChm0DRRDq/UoB9gCmBLaiWgXR4tEKH7uRWO3Wz28eFjITS5gVDfOqhv
	 ZMhAjA6gluPaTZ0BryebVN7PdpcoevpRSMmvG6QhShlwaJhIWE0cDhmetffNIR7jpPINB
	 b/2Fr8KxUOivmxgpI1Pl/X8fCwBeApvLUOmEskNPPk7GWSJAVdgx1B1LGYpY/ClzTCcYb
	 V5bVPuJ4NVrX9aw1QodNHaUZWLnkqC1mBzL+4UYsBkbf8Qc0gSWiSgZeiqI/QXnJAg7vU
	 8RUnLjVNH1/UhQFgqgDgW8a0c6z/Rn+OsoJ5gpFsUIl9/sLta0kK0EF3fVzV0fHPchg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vp+dVFBwYXmRjQyumKZLewi3+rD7rnAjQOTAkzTLD1s=;
	b=ajcJs+l5n3nEudp27KuhJ0EtrT6rcVKKGD5IpGWbME++hjgXp25soastZ3YSmBiFeSAT
	 muTyroEZ24Z33Iu/c/WEl2+A3dbFpi0IKNZhDNCmxnAt5cqkbDxqMmICFDgm8Eau0BTB2
	 eNBxqlorWrdKCePquR2twdun+KC9iHD/D2fXEXmzDkHtrhLzFN1StpTuRBM+lYcnUF9FH
	 bm1k4vx+mqrzUIj4a91cbs6z0kDQ83ci1SYSfcdgETq5fSubPdtoAfCCU01ZGPMVy3TrO
	 E6ECJQXbTtMnhWaxhlQQN0/d5/m++X523JSLvQrDu9Lt/ozuPHkdG3gRTV9+vmt0ROw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=VfIFDj1U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385FC606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 385FC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=VfIFDj1U
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91ba702cceaso8373036d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:36:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792586211; cv=none;
        d=google.com; s=arc-20260327;
        b=KmfO69PKbY6wXbYRa9njSMcf5LqBPFbZ+DeII5EVN8GEtQiVv41mCrxcoOds9a0zrC
         5Y06xv9G+M3lAeIIYvnJQnCvTqffmlIBGUi3wN/AE1Y2T6STi8CeY8OgxJVOnY6ozDoV
         K12AA3j1/lj5SQD5axyn5t7qEHezyP1cZgHsGFwZNK1W/bk7g+NzvCTlUnBeL3uFic9V
         wtVBd5Wla/K9Xzht9asxaRZF0T1mbfRGodO78BOfCmywb/NIJM5/90crqVkEhVQz00+s
         lLG8XCvfwPZK2Wzxopgp5yW5IhEfR4N2+7YH9yNBIs0RyLun0K3vuVflk2fGKsJygi28
         a9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=vp+dVFBwYXmRjQyumKZLewi3+rD7rnAjQOTAkzTLD1s=;
        fh=yFpIMnd0FK9tLfA+8Y2Wyy7UBViRRxvQMDSzFnDl+os=;
        b=IY99n0sy0/Cs/TVMxHjxXhNB4aKecsTfZO2Fk9NRmgL0O7yRCCCwnIqzZUdXRoVZaM
         k+gZiv5vlgXqBedXyXMPTtAKoq1PeZRnstR2hta5XU2hmdzD8MZW/mQM4ThQPRojUEMO
         +rGGFOAIyrO+kSKn6K2KR6M4uv42RwxPWdtygliwnlcC1KOAteGUKizPy0GhuLTykKVf
         3NiBq/nX9YrfygVQVAjgJj0iJc//Zp7jCSw89FF4bN89MYcI4iL+DNV7fKTiLrGZ02+Q
         O9nyxtNygEqxysYyc9KPKHqxI1R4JzDQEyMkxyKCFVp4EzHAG8TnAuE5IfD+/tSooA+Z
         43rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792586211; x=1793191011; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vp+dVFBwYXmRjQyumKZLewi3+rD7rnAjQOTAkzTLD1s=;
        b=VfIFDj1U1wx7mgWjIhtPYJRlL+/Ei885Ww1NZCDi+DxR1li7ARReqjbVU9kcM0ZY8D
         T+BA5Mvf+GG39KNVUP3PG+7IY/2kh4N3DjOLdujIE2tdp+Kpl0XINjVn0JjfXvhX3kGQ
         ChSfRHSkPJqFvDzqAEuXEsnCFojfdH+2a0lqPTZMAhnF/lt+owm3lV3lFQHMbm9CkGnU
         fiutRbPKq/3g6NbSwv/vb9TiYG1eHsJOU274cfkYX2vqqp5M7F+LmHSLTHPz1bapSyHx
         gHdSmZ2ztnE+O991Orcln1ukNv/1ZlXyOUBeAQW+TA0Lc0P/yY7c5Psm4kCBojTtEEg3
         szFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586211; x=1793191011;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vp+dVFBwYXmRjQyumKZLewi3+rD7rnAjQOTAkzTLD1s=;
        b=yKB5gGKhb0P2IXsfnO450IQURHKHZAPHH2Uo+TlyjMKZNH2l4IuRimd3x8iAE8zuP5
         /ceKmPiZ0p8wCie174208w5gUQHsfOv27xkfM0J98chjlC+RFo5Ew/DxGtMiMieQYfG6
         /BpjtkVgkEKi1MvAp892gMrui2aS79S7ZlY49qMXlVDyKGuMyzPojZCNlI3yd7Tz2EGr
         ion+UMj8igP+9nBLez4q++UFia0h4s0/azJpIbhZAL7j5uT/odtoXCqV+Xuz9iDxfU9F
         H3ASKmQiL5L6dqQQ3NdQzmeWm1I25pJQIh3A9pGk1KxgUuETrcYMBtfABm/VDgyf53KH
         hWkA==
X-Forwarded-Encrypted: i=1; AKwUvBwFZHstoSt58seA9mIMJwjqO8iTBHXnf9gS+9CGjW2ei3u8fOskmwY7nUhA3lvDMPvvP7eqBT80FejmvDc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIV9TrUO8zbXiBtm7wgJJNdNlZsiBzfGEqIldxZGOEvxabiiDGn
	lDwH4u+eHbHI5XtuwRXli6uPGoWrXPELfSdASCDNm7Md/j75J2wMjd5sVVgvHRiAznkAfzzjmmX
	Waai5qhCv/RbMIqw9g85CyDDo0sHCHu185R3c+Ne9
X-Gm-Gg: AYBFou1aDeMteIuzvKth3hVn9hVPOrlTOwUHDJTRfvanAV/tWrXUUmF7XBC4jcLO5CA
	nHCzqs9DgzR2jPHauKhH+362TKOHTtGrDVYJQg+fa3td/zU5TV3vqg/8s+0C4NIOUqYawY/PbkZ
	vCJxAfxUVGkSnul8jk6HefbqHqMRL2+8ENSMeyB+XUTTwjF9YvNFgBQJo68ORmFAYc8PYUIBm1a
	oCMxUWDJmdut1UPw5kUm0AgKegzMKMrMONklfYap3LDhGQJkSnHJYjx7NzAb6DG8FEtdX3h2qkU
	E1B2N/8dXkAnOfcBveX1tuSlktMfGXp/vVo5UI7XZBkIS5kKP3cjPMH702AVtwKIjt7Zwpyk7bA
	2JbF53RgQ/t02MABM+/xCCnQGMYiFbKFIsO6/5LSrBgbAhscETwHazKy00FxEAti8uck=
X-Received: by 2002:ad4:5ded:0:b0:91b:8b2b:5a0 with SMTP id
 6a1803df08f44-91c12ed7f7fmr33692636d6.23.1792586210014; Wed, 21 Oct 2026
 05:36:50 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:36:48 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:36:48 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261020131447.122096-4-pbonzini@redhat.com>
References: <20261020131447.122096-1-pbonzini@redhat.com> <20261020131447.122096-4-pbonzini@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 21 Oct 2026 05:36:48 -0700
X-Gm-Features: AclHuK8oqUEgIxjh5FUdJlLrxelycGduv-SDb4dxrbObth2hRi4LViUrvz_cFxw
Message-ID: <CAEvNRgGstgi3vo4Z1vqoXXQfbg8fDd608+JuMnmEtF_FiQF5Dg@mail.gmail.com>
Subject: Re: [PATCH 3/3] KVM: always make in-place conversion a compile-time
 constant when possible
To: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Cc: Fuad Tabba <tabba@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Shivank Garg <shivankg@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

Paolo Bonzini <pbonzini@redhat.com> writes:

> Remove the unnecessary static call indirection and make
> gmem_in_place_conversion a constant if CONFIG_KVM_PRIVATE_MEMATTR_VM
> is false.
>
> Require that CONFIG_KVM_PRIVATE_MEMATTR_VM is y only if
> kvm_arch_has_private_mem is also defined.  This way, the three
> possible cases can be expressed without nested #ifs.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/linux/kvm_host.h | 13 +++++--------
>  virt/kvm/kvm_main.c      | 13 +++++++------
>  2 files changed, 12 insertions(+), 14 deletions(-)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 09c57d31d153..e7fc94e2910a 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2585,15 +2585,7 @@ bool kvm_arch_post_set_vm_memory_attributes(struct kvm *kvm,
>  #endif  /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>
>  #ifdef CONFIG_KVM_PRIVATE_MEMATTR_VM
> -static inline bool kvm_vm_is_private_gfn(struct kvm *kvm, gfn_t gfn)
> -{
> -	return kvm_get_vm_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
> -}
> -#endif  /* CONFIG_KVM_PRIVATE_MEMATTR_VM */
> -
> -#ifdef kvm_arch_has_private_mem
>  extern bool gmem_in_place_conversion;
> -
>  typedef bool (kvm_is_private_gfn_t)(struct kvm *kvm, gfn_t gfn);
>  DECLARE_STATIC_CALL(__kvm_is_private_gfn, kvm_is_private_gfn_t);
>
> @@ -2601,6 +2593,11 @@ static inline bool kvm_is_private_gfn(struct kvm *kvm, gfn_t gfn)
>  {
>  	return static_call(__kvm_is_private_gfn)(kvm, gfn);
>  }
> +
> +#elif defined kvm_arch_has_private_mem
> +#define gmem_in_place_conversion true
> +#define kvm_is_private_gfn kvm_gmem_is_private_gfn
> +
>  #else
>  #define gmem_in_place_conversion false
>

There's a #endif just below here where the comment says

  #endif /* kvm_arch_has_private_mem */

Not sure if the convention is to align with the first #if
(CONFIG_KVM_PRIVATE_MEMATTR_VM) or the #elif (kvm_arch_has_private_mem)
or something in-between.

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

>
> [...snip...]
>
