Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590556;
	b=au3ZRiFYMMYRElOElKULxG+3eARFD5VbHKOqdhvGAUom9c5mweLWWC184Z+BhBSE8jkN
	 rruH8RkhAV+lghx/fHzY0PMkdNCc6YQdSPWM6QtSvjiTHowgTQKDarQoI2/UWS1kGRAuQ
	 kIy2QnjHWZrm/gwRXSvItG10+2w9u94Z7x+aiqHWIZwXeX6g5D+dsNNXJGO91CN02gfDS
	 Yn/JZNKpgIG/sOxxM+NO0YJbTxbn5RWR1D2k1/FmvYBbyf8cGLzqAOtUPHuMRSIPyW5PI
	 uyyF+IkixqjK3UwJIpQQJbSkO0eGYqfN8T3FpDrW0fKX8h7P5dSAJsrzSyw8jnKmaZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590556;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=z43uFM3Pjo7vfGW2mID+1SupLltnf5Xt8DNDDQTTcdI=;
	b=MmxR/8O77W19hy/O8l7lsOoZyKXaZaQEv3og0L2Z2IjusvXHEXpC/w2C+ngdWFEQTFgu
	 aF6GCto0JyhOYSJGgBAWoAiljkOHj1bk7MqFpOvTO37C3BIb4YLTCjv7aXyxHyZeP+miU
	 aqtqQvoXdPF59VS4qLTSO2YPxtnsB2cCbDvNPlHNP9Vz7xQVEp3Xg7fPMaggpRrh40+Fr
	 sKlFUnimchCENL3a7UbAUHzTjgk11A9+R4AbMwz9trfD6x26BCYinJpVUukUUn0Der5hx
	 reUe1QfZPoM5ohniyoxwldGt1ismQDtg/ZPRr3aPxD4qz+QdEPxnj+x/Tl1jUA/CJSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=an7qNshc;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qXmGz5yr;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702CD606BD12
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 702CD606BD12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=an7qNshc;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qXmGz5yr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794590555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z43uFM3Pjo7vfGW2mID+1SupLltnf5Xt8DNDDQTTcdI=;
	b=an7qNshcty32otm5qc6CSPxErGcMnyUYWXQa8X2t7Wm7rmmS2RBjZ9GNdTNRIwjpIF8iAb
	UlezVmtgYquLGDTsS8QBdBAOiVnfOwFYZepup5h9hTPFUvP5uKAcP4efq2CvLNy2InrgLl
	VZC3e6d68eeiNBko8aMNA31HguofSvw=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-O62E6egQODG5kMMcvwka0g-1; Fri, 13 Nov 2026 12:22:34 -0500
X-MC-Unique: O62E6egQODG5kMMcvwka0g-1
X-Mimecast-MFC-AGG-ID: O62E6egQODG5kMMcvwka0g_1794590553
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e8dd9b9743so16115555ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794590553; x=1795195353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z43uFM3Pjo7vfGW2mID+1SupLltnf5Xt8DNDDQTTcdI=;
        b=qXmGz5yr9pHv4tTSpC58k+rWs53N4pUlkZjYvaIZ1egIj0YUNFoOF0Q0sNNJTdpMUX
         ixhfuM9a2c6J29rolLc7APuG+6qtFoDviJO9YmoliwG8Yqt5vTiLBgyBGIm3Ensog3Ru
         nmNHoOBnZzcD121DUbYrTGyijQofVxcNlBwIEUVHhcmXUhnCuK0CAyxgR2iYyee+ljg5
         Ou0rhvabqmruMVAyaIR4haauLRBp5rGpHHRWhN4C2jC1KHjZZjwSjUUaijYy2/kMfVp+
         Cx8G2V0vMqv3dQwMLZOOKP9tP0yfon29TPoUzr3Ld7m5NZvdifIiLugexTQtav6hrwHP
         Oa2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590553; x=1795195353;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z43uFM3Pjo7vfGW2mID+1SupLltnf5Xt8DNDDQTTcdI=;
        b=rcWKDzQPmhhLWMnr7WCB/JkqQRPLzkvDyIkDbizi1OiMc1enrVnt0vbH+OUDTYKbtZ
         K3pmExfy3KfK5jLzQvreRazlW1EXW9BtoY933UfgjkcGCtSGCMAgvXJYThmOAwAcA1Fg
         1t3oBYrevjC1ZHeFRJ90RfaByw6aYimEQ14naGY//yAkZbWDNcRlAqwuVd3hHcO5BSCs
         e8GMuP8siqpZAwUlFlB8zXdw5HGz8b4M0XwqudUg7A+cec8/xreiBUavIG1qmZxCSktp
         tuUsyzhuDTwIlGskGSpRdh8BqNXsJdA+dxN0MfBJi7V6szIFRVQkDLVla8vfAoG9NoLS
         ChNQ==
X-Forwarded-Encrypted: i=1; AL+hErH+uDPnibfj5Xb0mbBUpQmz4AGcyTWh40p8LnHUUuyI/Z7O4hTlcqFpVRxke2Pj1euu8Ss8K0UDce+2ZzA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pncXlriLHU5glrcvoxYYmqXT+H82GWQzRCjnPybHjSaeQIyvb
	y7LJp8jZSunNJ3qzgOJTCKbhMgBrRUAjXXoB1Qqra7XOK3ERmjuTGJMqvVZHS8z+jXE9i/JYjxQ
	m+zEPTqXasaC36kDmwlHv0+Qfnvu628QcjdtcAEltoa3EAfrCxxl/DkKIHB1GidaXqz7GDZORMA
	==
X-Gm-Gg: AYBFou2ZNxw0RWzdaWZobCnwCCQ+/r2fNSr7WU4dyYuoR4g45OHAaFzitMxTHXOdnqP
	bpJNOVkX5KDsniMGEp7nlj7MjuutkuOWwS14zBmDmBdVYcXyRiTxuZAmqfGDGrkJ4op9pJBpgu1
	XlrZM+w++hKW86iGU0/MBQfPpD+nv3571eWs9G4J7zYNpWqLXU9r+s5ykHVeOuDIKG4PhPtJZ3i
	HhZ9Y1QtJaHf9xkC+q5ASxJa4dhtyRYxadC2fANUh98eeWGUxQRsuWohUYWUVH0DV51IVU8YD4n
	WMuwc/kQGKf1HMu6WAnp745V8XlWLWnERE0lukxvlVxMy8Fd+IXRenfTPxFp+vNhqQIx8YcpcuO
	atm1NABpddnmTAOIWGOvhBNh0HhcuqR2x94r6hvYL2+PT3GRXft37T5YSb4+yTkHZaugnDw8=
X-Received: by 2002:a17:902:d550:b0:2e9:6f2c:71b9 with SMTP id d9443c01a7336-2ee0d6654a8mr33241595ad.1.1794590552888;
        Fri, 13 Nov 2026 09:22:32 -0800 (PST)
X-Received: by 2002:a17:902:d550:b0:2e9:6f2c:71b9 with SMTP id d9443c01a7336-2ee0d6654a8mr33241305ad.1.1794590552278;
        Fri, 13 Nov 2026 09:22:32 -0800 (PST)
Received: from [192.168.1.102] ([117.245.168.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f809867sm14050805ad.41.2026.11.13.09.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 09:22:31 -0800 (PST)
Message-ID: <9eac28b2-1931-434a-ad06-ceddf34869f1@redhat.com>
Date: Fri, 13 Nov 2026 22:52:24 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] kho: docs: update description of bootmem regions
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chen Pei <cp0613@linux.alibaba.com>, George Guo <guodongtai@kylinos.cn>,
 Kexin Liu <liukexin@kylinos.cn>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, kexec@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20261112-kho-bootmem-sizing-v3-0-f0c8d00295d5@kernel.org>
 <20261112-kho-bootmem-sizing-v3-5-f0c8d00295d5@kernel.org>
Content-Language: en-US
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <20261112-kho-bootmem-sizing-v3-5-f0c8d00295d5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/11/26 4:08 pm, Mike Rapoport (Microsoft) wrote:
> The description of the boot memory regions does not mention the low
> memory region and claims there is always a region per node plus a global
> region, while the low memory and the global regions are not allocated
> when they would be empty.
> 
> List all types of the boot memory regions and describe when they are not
> allocated.
> 
> While on it, fix grammar and split the description of the regions size
> and of the CMA usage into separate paragraphs.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  Documentation/core-api/kho/index.rst | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/core-api/kho/index.rst b/Documentation/core-api/kho/index.rst
> index e78a2bbe2be1d..ce2bf9cf66514 100644
> --- a/Documentation/core-api/kho/index.rst
> +++ b/Documentation/core-api/kho/index.rst
> @@ -52,17 +52,26 @@ allocations before during boot up to the initialization of the page allocator.
>  
>  We guarantee that we always have such regions through the boot memory regions:
>  On first boot KHO allocates several physically contiguous memory regions. Since
> -after kexec these regions will be used by early memory allocations, there is a
> -boot memory region per NUMA node plus a boot memory region to satisfy
> -allocations requests that do not require particular NUMA node assignment. By
> -default, size of the boot memory region is calculated based on amount of memory
> -allocated during boot. The ``kho_bootmem`` kernel command line option may be
> -used to explicitly define size of the boot memory regions. The boot memory
> -regions are declared as CMA when page allocator is initialized so that their
> -memory can be used during system lifetime. CMA gives us the guarantee that no
> -handover pages land in that region, because handover pages must be at a static
> -physical memory location and CMA enforces that only movable pages can be located
> -inside.
> +after kexec these regions will be used by early memory allocations, there are
> +several types of such regions to ensure that all boot-time allocations work:
> +
> +* a low memory region for allocations below ``ARCH_LOW_ADDRESS_LIMIT``
> +* a region per NUMA node
> +* a global region for allocations that do not require a particular NUMA node
> +
> +Regions that would be empty are not allocated. For example, there is no low
> +memory region when ``ARCH_LOW_ADDRESS_LIMIT`` covers all memory, and there is
> +no global region when ``CONFIG_NUMA`` is disabled.
> +
> +By default, the size of the boot memory regions is calculated based on the
> +amount of memory allocated during boot. The ``kho_bootmem`` kernel command line
> +option may be used to explicitly define the size of the boot memory regions.
> +
> +The boot memory regions are declared as CMA when the page allocator is
> +initialized so that their memory can be used during system lifetime. CMA gives
> +us the guarantee that no handover pages land in that region, because handover
> +pages must be at a static physical memory location and CMA enforces that only
> +movable pages can be located inside.
>  
>  After KHO kexec, we ignore the ``kho_bootmem`` kernel command line option and
>  instead reuse the exact same region that was originally allocated. This allows
> 
Reviewed-by: Mukesh Pilaniya <mpilaniy@redhat.com>

-- 
Regards,
Mukesh Pilaniya

