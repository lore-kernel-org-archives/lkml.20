Received: from mail-wr2-f20.google.com (mail-wr2-f20.google.com [74.125.225.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6438E4E3229
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731385; cv=none; b=OJgFrBnp4iaFCqUo/wdg1j78O7qUdPjDa65/VCIy2XIjWRlQEdIDrmCUHxTV6fTSLiEPPCvYKVLI5a+SImzrq+B1acl4ebcRndc8booMSHFrVM6Yl8fe3i1zxaUzV6ehTDcJnX5srveGi0TKlHkeEE2VDwCralKwgSdC8l0Iu78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731385; c=relaxed/simple;
	bh=yDmYZdzaDioVDX9X2e7TnGQq8IFYjmjy7042bYxKD8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mXzNr0z8NlS1jJ9oGGH9MVcfOaeLh5LCyAVJXZeKUSReK92GVNCKRMUFuV+03ElyKI6nH54tNFdIKVnZKtQiGnz8cwNZlNL3wBvHh2RdgZqjSfXel1DKdbHQDUytua70DnKWzOkyUb47v6eAR9gexSTbSjIm/lT4g4PlC+r8W9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OF/iUJZW; arc=none smtp.client-ip=74.125.225.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OF/iUJZW"
Received: by mail-wr2-f20.google.com with SMTP id ffacd0b85a97d-482f6356256so238928f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789731380; x=1790336180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IP6xChHENNJOyQqL9WiJAvJ6RXBpoI6zx5HnY00kMu0=;
        b=OF/iUJZWg//vgNH0KQWweK56qsNeB1JQUhAUBfWET5XmNxM4FpwxSYMJkLCT8n9/5X
         EdCbyVy45ClpDid7jOBxKwvqMWTWq2AEaVBNGd9HW2Gvcmxq0oxG2Z+wAn5W2ER2SU1D
         m1FUPQunm8OYx3nAkPSKFXwhbVzh1krG3n9oc3pwnx47IWTka5m0BUtmUQWyKBS4Wgje
         VnduEQeNalFmtJdcC7LsCurT+M51ODUfRaNeg7QR6HQuzDoIFLTkQDTnP1C1QZNttoqh
         H5J1PpYe5LCd8FlsBRwtRWsVwWjiywOtfzNeD38/yEGybN35BrMzwY3zklFeAkvEwBpb
         hY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731380; x=1790336180;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IP6xChHENNJOyQqL9WiJAvJ6RXBpoI6zx5HnY00kMu0=;
        b=cR7hB+BhtN0+4W7ZkvQx/oEh3X9YmhsrTUJI1gpzWf6+i2ojERrx9p9ZAxM8j/xJh0
         i4fVhCEyw1hDEk6P84PKzChYidXgcAJyReMRGB5YFNdu64ID5l5Vltg+6sslzu7F38wo
         nZXVAR+a3umjghB00n7KT6tMftiXOPmC6DvHfph771aTJgTmUqBFe1IjMB/lXDbIIfvw
         JZsyrSKVZ2shd0VKsRE5bifCRFWwywdBrjQIeS67lM2p6r3nXv2GxJTa1o+aFY87nslv
         zermdJg28R/znmo0qkqfcdI+M2Hz1Na46TkCXu6AKlaLVMYYXutq25NKce/R0616uz+a
         kUKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDNi73QrHbnokbtCb5SgfPBcFJeJpCUJSgNR5ax3Yt/lVHah9aTKiTOkT6T2yaSx9G09D+aw7uQd+rqE8=@vger.kernel.org
X-Gm-Message-State: AFuF++nQVjj2skMftYXLB6n+s+JhYNq+EuPQa4wDrA+OaDB89XMus1AH
	x42cyzjszMmec8HV4qu1d9NPec5FS/gSZhMsvZIz3iEnQOzABJImDuB4giWhrVBI4VPtBqF1yUv
	tSIDI0y0=
X-Gm-Gg: AYBFou2eSBRUYN8Y/UJAWE18ia1hVVdLXwb9NSUV3WWihaPM5VNzlWBBoITpF6/91gh
	OGXGceZVULuQmv+TwMuTaDL6+3LG0fh5nkfhtRrZ9bmkbs0ukQRgEEg4VPC+4tGnDoW7mr6jSve
	LxZ9Q0eSNEX8IEKiN1boisV9SMdlYe8SyfExjWrTnhbWTmlWxVcrBCP+7BjEauEgWM21uen6Xvy
	l2BVS+pMcWyUAfo//+VxSzvVD0tVnc7PYSqTl4cys6KmKqT6ZBvSaYpfVGBTa7R2QQ2TLs6nZUU
	nXHp9GqauNsFSO1MvCdZ6Xrpm0SUnjNZaZTWXp/0gYTnGAXDiOfxvYEAHmTZSzRe6eKN1yqe3kw
	t6QYQmcPM7+w7OGDJJxtqXYy4cGd2VUx2AAxPScQPlAOqKAuVQ1J4OwJfa595MdYyagutrUWKwy
	zdc/fDkzF67HUqnrYo/ZHe9HIYObTUmUaDP6HHYEq9ChnPP2umouvn8uebLgCD3vlHDCzzOIxg/
	bjnGByO96r+f7UjewzFSCw3
X-Received: by 2002:a05:600c:83c9:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49fc4ff402cmr32578345e9.10.1789731380586;
        Fri, 18 Sep 2026 04:36:20 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd216028sm148975475e9.7.2026.09.18.04.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 04:36:19 -0700 (PDT)
Message-ID: <b519578d-60fb-4248-88eb-05bb9474762f@suse.com>
Date: Fri, 18 Sep 2026 14:36:18 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: TDX: Remove always true ifdef
To: seanjc@google.com
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260826100321.1309685-1-nik.borisov@suse.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260826100321.1309685-1-nik.borisov@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26.08.26 г. 13:03 ч., Nikolay Borisov wrote:
> CONFIG_KVM_INTEL_TDX depends on KVM_TDX_HOST, which in turn depends on
> CONFIG_X86_64. So it's guaranteed that any code under ifdef
> CONFIG_KVM_INTEL_TDX is also running under CONFIG_X86_64 being true,
> remove pointless ifdef guard.
> 
> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>

Gentle ping.


> ---
>   arch/x86/kvm/vmx/main.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
> index f204a0fc0a57..e9cca303c855 100644
> --- a/arch/x86/kvm/vmx/main.c
> +++ b/arch/x86/kvm/vmx/main.c
> @@ -799,7 +799,6 @@ static void vt_write_tsc_multiplier(struct kvm_vcpu *vcpu)
>   	vmx_write_tsc_multiplier(vcpu);
>   }
>   
> -#ifdef CONFIG_X86_64
>   static int vt_set_hv_timer(struct kvm_vcpu *vcpu, u64 guest_deadline_tsc,
>   			      bool *expired)
>   {
> @@ -818,7 +817,6 @@ static void vt_cancel_hv_timer(struct kvm_vcpu *vcpu)
>   
>   	vmx_cancel_hv_timer(vcpu);
>   }
> -#endif
>   
>   static void vt_setup_mce(struct kvm_vcpu *vcpu)
>   {

