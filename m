Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBA3490C03
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353158; cv=none; b=ZKYQhiNFGaDFjE16Mb27tf6+JO3y+RCRyGsrs88bKRmCnoyMzQLYuuHGhJ+laBkWw/DhA25284iRU4dWe1YJ4KYMTPOljP5fbw+BJgWFUHLIlPksR+QJmm9SSuaUEHoSfY/BKmWjzm/AYAyilk8SzuZoUUILzIv7IvwVffL+m5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353158; c=relaxed/simple;
	bh=GnuHiQyTdp78PQzDdaVnnxIGr8+30tXBtoElXZAmxa0=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VcvyE0xnsBEiK7cKok/8ciLcor8qJDCf/PP1OkEdp0CZtrrAjcK/qyT+WIVIyX0RW/60poWB3czVviGLZ6DVLX7oakudm8h4xAs9mcWjd5KAYJ0VJTJH3nW0Eq0jnQ7sGbZNRASMWCiQQ30SQReQFH450g1DIzcRmIKUhz63hP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InQy+DnV; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InQy+DnV"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c25344a8c6cso126109766b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788353155; x=1788957955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dLevOcKYkdOnauiVP1IJjwSB8dtI7d/lY5+V+H8fLSI=;
        b=InQy+DnV+kgT70cenM3G2xykTMHw/BfdKYjRHYmYzdvJbjB4qRA8sM+XKUs84QolIr
         EJ68+ddzEUIAL90O5CYm5Hfs2gKmNa0jWdyr9JMo2JDoTChZCXUUenQuXTJ4tbeoNwtk
         /ZjFN4trUFEbo5yv71wprGCzRLZwqeP0pYrYczTDrRRhBcuvttmm6UfirETetxyeVF3b
         vSri8W1bc9BHHeER1a0XnLLqRDwgNW6U/xiJ6xhZmvvI+zg4vwLE7PIUmnupYjVJ63YC
         6lqUl0bsMka7wyrprCBvqXI069nUHUGnUkZ1uwyFcBAlkrc2Dpr8UgnYTKxatT7wyCns
         cSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353155; x=1788957955;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dLevOcKYkdOnauiVP1IJjwSB8dtI7d/lY5+V+H8fLSI=;
        b=YKYZr9TrVsmpXmjqOxBAx+/pdntSccwx4a395kBZ+hANyejvPiPCj5jmeeEMMfsnAl
         DWI447z6jEs1BAUOZ6sTWVEfEp+3pzsO8mG/0xeWewA6KD09DAZ5132Jswmi1RpQmGn5
         lKK8oiamjak90dL53kOH5LI96wpiPLu7hxJPgE2UpVkM7ci6Z420hTRR4p1LiuWIPMq9
         1Nt/AzfnZLYbbo4rwsFTGEn3JvCWRrzEsbQixUSkWwulNktPzD+M2t/LqiPV6/MkUtnv
         nPYcgVyh9gJtuTG1iBocmN65An1WILW8vk4uh32zBqdaMKX5SoYT3m62fTtxqdO1gwGk
         2cKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzc1B1/WtOEyHXoSUPX1wQbiiVL1ZcdVC7jaRgVFzoAaFZunJpzCvH734uPJuCPKtPvk+g+/+ix8YUUsV8=@vger.kernel.org
X-Gm-Message-State: AFuF++nVdGG1dEtyjIrCL/RYRGawpMkMPhrniy1RDnvZHUHeC65gRfUq
	6CRZWVRECPjslVRTCTRhfxVxGLxmyc41nDct1FC38l/brC2SYZfHNDOV
X-Gm-Gg: AYBFou1HNHvyG7Yqc2UcWwa/Q9OXbL7KzC4+m4nI7RGrpBgDNA6mfh37yhdqmNa9RDt
	yGARQtkUNDcXTz1Mh1LGAAcK2OPRtjLoT0ovJc+VO8v3xKdk2S/dE9LT9o4m3olOlBf5Zfi1DRG
	FsqdolAfoUeGQgyKLYWUMdO5iRnJnRDDjpmjFjkR/L/1XaeyaofJnR5I8jIv/Tx2OO23Rbd7HU1
	n170VRvsSB7HkZOIQXLqqjQKrP8to5JjssvjhW1SIMy7WH/nSn4ZZdSEbhU+AHFbYlH0xF+jDbM
	iFG2qFoZaQFBSvY6aZj1L4KkWpC/aOlnUnOfvDC6KcBTGWMtLWb2lDF0gWj5gRA4ZnrnTlWlleq
	ly2/ZZWXLzZ3miz7IK4PrmBlrjSn4gfgIdiZwOnLBLbQmt+iRKobqhuCRqMH9X0zylyq9VIxgCD
	NkZ/9Hp3ErkOYfH/yyHQ76XXW3u0ejD+LvXg70R+FX7TWeTDR3RkcBconwGqfE433Ssw5v01KRP
	Bo=
X-Received: by 2002:a17:907:3d44:b0:c1f:1520:4de5 with SMTP id a640c23a62f3a-c25d5289c2fmr230616466b.1.1788353154604;
        Wed, 02 Sep 2026 05:45:54 -0700 (PDT)
Received: from [10.45.18.37] ([15.248.3.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc5cc3sm128026266b.7.2026.09.02.05.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:45:53 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <fa5a18af-acb9-4459-846e-c9c3f74177da@xen.org>
Date: Wed, 2 Sep 2026 13:45:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] KVM: x86/xen: Mark poll_evtchn accesses with
 READ_ONCE()/WRITE_ONCE()
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
 <20260831213632.81023-12-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20260831213632.81023-12-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/08/2026 22:26, David Woodhouse wrote:
> From: Chengfeng Ye <nicoyip.dev@gmail.com>
> 
> Use READ_ONCE() and WRITE_ONCE() for runtime accesses to poll_evtchn.
> This marks the intentionally concurrent scalar accesses and prevents the
> compiler from splitting, merging, or inventing accesses.
> 
> kvm_xen_schedop_poll() publishes the single port, or -1 for multiple
> ports, before setting poll_mask and halting the vCPU.  Event delivery can
> call kvm_xen_check_poller() on another CPU while the vCPU thread publishes
> that value or resets the field to zero after returning from
> kvm_vcpu_halt():
> 
>    vCPU thread                         event delivery thread
>    -----------                         ---------------------
>    poll_evtchn = port
>    set_bit(poll_mask)
>    kvm_vcpu_halt()
>                                        poll_evtchn = READ
>    poll_evtchn = 0
>    clear_bit(poll_mask)
> 
> The plain read and writes therefore race.  KCSAN reported:
> 
>    BUG: KCSAN: data-race in kvm_xen_hypercall / kvm_xen_set_evtchn_fast
> 
>    read to 0xffff888112f55af0 of 4 bytes by task 98:
>     kvm_xen_set_evtchn_fast+0x204/0x7c0
>     kvm_xen_hvm_evtchn_send+0xab/0x100
>     kvm_arch_vm_ioctl+0xb31/0xd90
>     kvm_vm_ioctl+0xf42/0x16c0
> 
>    write to 0xffff888112f55af0 of 4 bytes by task 96:
>     kvm_xen_hypercall+0xd8d/0xf50
>     kvm_emulate_hypercall+0x157/0x1d0
>     vmx_handle_exit+0x40f/0xae0
>     vcpu_run+0x137f/0x27d0
>     kvm_arch_vcpu_ioctl_run+0x5a5/0x970
> 
> The field is an aligned int on x86.  Access annotations preserve the
> existing matching, callback, and poll-mask control flow while making the
> single-copy access requirement explicit.
> 
> Fixes: 1a65105a5aba ("KVM: x86/xen: handle PV spinlocks slowpath")
> Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   arch/x86/kvm/xen.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
Reviewed-by: Paul Durrant <paul@xen.org>
