Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793937481;
	b=dXvlMQSQevMIi2nBtBBqVRiOdTzY7VnLm8TXAbQy60uPQXysub+6lga7o51J9RylIowh
	 tcUJk0u49LF/c1g02koqPK8hhbY0rrSfOI3VbqThjqn+Om7+E22hK5if+sak1dYgUoi87
	 0c35kwt6qWx5T1H2YCEmEm0zXcK4cusA13em5k/TnYv/7yTppZxEkFn+3Eu56tlCOuXHa
	 P+y0wxdELPTJuncxkNvp5buCBSAGRhoj0h8YhkoSrkPuXUGnf2RkouLWzgQNpVa3M4BJf
	 +9E1YlSrL3wXS8U1Pyl6Nc90728ECnnK/1J7G7nan8/Fq3TK2ANl76T3okaQ2zdZd6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793937481;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9akG+nDtIvJDcRYJ/oAtRMDaGCKBlqt1RbnUpTcKFrU=;
	b=hbJsuDfuW4Ioy2nEdeznGe/jRo1IDdqlpWE06PbloOrYoHW9t8tcsUsvrVMwtPBj/kRS
	 p6koottT5iwErgpzRipIGoiThLPlzIFrLfWFfESO/u6xFXtqFe9v26ca8SV3hrEWThaZU
	 Wl4ZAjIjtANlIaES7m4t8JBufR8inEYqK+f1C7anQKxJ6SMpx5KNYWU+2yX9eBJVXYXSQ
	 nKapIOR3275oShDycAkWows2wb4mdhjAJ4r3REyW3qa32ah896yo/R2IuhLFdKi2vrqsi
	 RHjPs3ispF/m2dX4ZToTENLPPdM25MXM+tuvIWCBYnSMnQR55i7+WQ5yoEiZxpGEMBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WkqpfmLb;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=i8oaZk4T;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A947606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A947606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WkqpfmLb;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=i8oaZk4T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793937480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9akG+nDtIvJDcRYJ/oAtRMDaGCKBlqt1RbnUpTcKFrU=;
	b=WkqpfmLb86STo6pkTZCgVlyjM8fHpT4OE0FMuHzSKSBdgnoyMuf/GlITl9h+0PL8XRmwCl
	Eb2NHC2uh7SqpC2sgeeWcgniXsv1SKxYVksWUdcMt/aB+uXuxzVGLsCcI4hk5fRpOISp/V
	YQvL4NZY/YsHTBmHvkHMXHxylitcO1Y=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-oNpLp67_MtiY2XqN8FHPhA-1; Thu, 05 Nov 2026 22:57:58 -0500
X-MC-Unique: oNpLp67_MtiY2XqN8FHPhA-1
X-Mimecast-MFC-AGG-ID: oNpLp67_MtiY2XqN8FHPhA_1793937478
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e987ec84afso2595005ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793937478; x=1794542278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9akG+nDtIvJDcRYJ/oAtRMDaGCKBlqt1RbnUpTcKFrU=;
        b=i8oaZk4TTB21suYy8Az3kKWolesCgWVj75d6y0zgSIcF0tl5NYD1CmEjHYKDQyJ/48
         lZq6oGBPN3v8xKNZ29P5koDokbOuZxQM/oZbB0Iz4YQXWPK6f5Tdx+CMwu1/swO6Hd4v
         n9gZbx+bsah2yaCtNVqrtYZZfx3fc1vPwFg+hWyCK8TWGBmsA2itclnMA5Icg2+6mPX2
         6Ms06iHG1LuyBwfqQqfywzaXNogGa0mx+pFhY0FzccjBjYJUXKLW/ANhP3/5n9qMxW/3
         mYggnthJB887VBJrs1FNzVknFYWcKktOBIrf2Ul241YKgYYC5EZue9z/0uRTHZ4DM0Iw
         NzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793937478; x=1794542278;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9akG+nDtIvJDcRYJ/oAtRMDaGCKBlqt1RbnUpTcKFrU=;
        b=E5ITM/7zzGRu9RxDH5Ux/vJJxlUbmQ78ZVP87IvqNg763MVYugKRtqioiwxF9qJ28E
         FICaIvnzwaMqHWDoEM/AiuhKM1JACl6qf5RG9/sXf8otEkQJAy9TX9y6wnInhR4b01sq
         aubvb55Hc9E2DUBPO82yA80POmNWd/dVJa2boFVnLAFdJKb0YaAHW1C+r47HmdekewsJ
         orgppH1lCNNsBPOLxrt4kmGpaFtjbMhnK+Guj8hk8Zx2XOlEiGdSqlRx+acH58rQV2q/
         pfFtt4iR0+xHJfcNup75ZSl79Kx2eUOQnQVzW7UXGPpfm+tEoYOz6a5A6+rb6aQDan3u
         RkYw==
X-Forwarded-Encrypted: i=1; AL+hErEf7cPPQmaPvZu552zrJjn05suq+gJ1ffxgvTg/9luU4q3y0jqZ8+sLHzGsPm1ZTloeKeg9wfbsaqweUbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z91cy9IfUHRSW988J4hbrwjdD0ggZlPBuNQTfmnFVkEWYXhS3pG
	F9Us+T5v9hBK+VIvXYP8whxuhBUrF+rWfybywVuptc/+e/mEXgR2xTRQ6qWnsf/wOwvTAsEVrgW
	NCx3sO543502+qG61bVEJIlOqkIhpQYmqphyPeXHxDaUpn0FeuJOXdGKQUR7HtEWqqA==
X-Gm-Gg: AYBFou1Mh75FIvxnv1uvdwx4QHp5+pSmrAAz2qjgw6oLzEtQ3hJtkuFzECndoi+LlJr
	etSoYPAheUQTI8nZXLDxcPW8VAmsl4WYziz/fugXbXi8nLFmBBIfAVCM7nU/j/tzWs4HZLc2yQ2
	mYAi65RkjoFL7Sjzj65dnJLzY9DiTByqxut8bYPM+s+2tnNoCNFd4Cltz8Dl+Mk5239tBqcTYvJ
	JEL/d5UYSk+EkrktCO8pzkqpLtvuSCpmA4TpYibNZl4QJ9ZAS+5sK/XoFk8Pr/zMDQI/zxuOf3q
	hdKn2y6bsup8QKnhdBuNolgVrvQ5azKCuJ4A5macjKx3FD9GQTm1+ZidmNxyQmkF66tL2alfRIc
	N/6SGMC4/tgQ7yBIENG6azUbnV/My2FMoDkM459FgktZaCnJdW2XuJYD3ba0OPfYssyTNP6XRav
	3nRBVb0OJzirVGfOUxVgBWZGrYGzST2WsiZFXCZA==
X-Received: by 2002:a17:903:3d10:b0:2ed:69b:9e76 with SMTP id d9443c01a7336-2ed40c59069mr18818645ad.28.1793937477700;
        Thu, 05 Nov 2026 19:57:57 -0800 (PST)
X-Received: by 2002:a17:903:3d10:b0:2ed:69b:9e76 with SMTP id d9443c01a7336-2ed40c59069mr18818435ad.28.1793937477119;
        Thu, 05 Nov 2026 19:57:57 -0800 (PST)
Received: from ?IPV6:2401:4900:1f28:63e0:a033:fd4:21a3:8f1? ([2401:4900:1f28:63e0:a033:fd4:21a3:8f1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed477a941csm1173495ad.18.2026.11.05.19.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 19:57:56 -0800 (PST)
Message-ID: <d928099c-4e43-4af8-a929-b510819967ce@redhat.com>
Date: Fri, 6 Nov 2026 09:27:50 +0530
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
Subject: Re: [PATCH v3] memblock: don't allocate new reserve_mem regions on a
 KHO boot
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Kees Cook <kees@kernel.org>, Changyuan Lyu <changyuanl@google.com>,
 Alexander Graf <graf@amazon.com>
Cc: Tony Luck <tony.luck@intel.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, linux-mm@kvack.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pratyush Yadav <pratyush@kernel.org>
References: <20261105213153.9572-1-azpijr@gmail.com>
Content-Language: en-US
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <20261105213153.9572-1-azpijr@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jose, Thanks for the patch!

On 06/11/26 3:01 am, Jose A. Perez de Azpillaga wrote:
> On a KHO boot, a reserve_mem region that can't be revived is allocated
> from KHO_NOPRSRV memory, which includes the bootmem the next kernel
> boots out of. With CONFIG_KEXEC_HANDOVER_DEBUG, preserving the region
> then fails:
> 
>   WARNING: kernel/liveupdate/kexec_handover.c:1245 at kho_preserve_pages+0x168/0x180
>   failed to prepare memblock FDT for KHO: -22
> 
> Without it, the next kernel puts its memmap on top of the region and
> the ramoops records in it are lost.
> 
> There is no use case for adding regions across a live update, so fail
> instead of allocating, and drop the TODO.
> 
> Add an is_kho_boot() stub so the memblock tests still build.
> 
> Fixes: f99230780211 ("memblock: add KHO support for reserve_mem")
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---
> Changes in v3:
> - add an is_kho_boot() stub to the memblock tests (Mike).
> - add Pasha's Reviewed-by.
> 
> Changes in v2:
> - fail on a KHO boot instead of allocating outside bootmem, as agreed
>   with Pratyush [1]. this drops v1's patch 1.
> - not an RFC anymore.
> - based on v7.4-rc1.
> 
> v2: https://lore.kernel.org/all/20261104204235.9066-1-azpijr@gmail.com/
> v1: https://lore.kernel.org/all/20261021211058.83483-3-azpijr@gmail.com/
> 
> [1] https://lore.kernel.org/all/2vxzfqxglrg6.fsf@kernel.org/
> 
>  mm/memblock.c                     | 11 ++++++++++-
>  tools/testing/memblock/internal.h |  5 +++++
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/memblock.c b/mm/memblock.c
> index a450092a80fb..e325e0542c9a 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -2827,7 +2827,16 @@ static int __init reserve_mem(char *p)
>  	if (reserve_mem_kho_revive(name, size, align))
>  		return 1;
>  
> -	/* TODO: Allocation must be outside of KHO_NOPRSRV region */
> +	/*
> +	 * On a KHO boot memblock only allocates from KHO_NOPRSRV memory here,
> +	 * which includes the bootmem the next kernel boots out of. Only regions
> +	 * handed over by the previous kernel are supported.
> +	 */
> +	if (is_kho_boot()) {
> +		pr_err("reserve_mem: can't allocate \"%s\" on a KHO boot\n", name);
> +		return -EOPNOTSUPP;
> +	}
I think this over-restricts when KHO is explicitly disabled. kho= is an
early_param parsed before reserve_mem=, but kho_populate records the
incoming FDT without checking kho_enable. So a KHO payload booted with
kho=off ends up with is_kho_boot() == true and kho_is_enabled() ==false.

In that config nothing can be handed over again; reserve_mem_init
returns early on !kho_is_enabled(), and kho_fill_kimage bails on
!kho_enable. Allocating the region from KHO_NOPRSRV is therefore
harmless, and the documented best-effort reserve_mem= behaviour is
preserved.
That said, a new reserve_mem= line is rejected and its ramoops/ftrace
boot-instance consumers lose their region.

So, Would

	if (kho_is_enabled() && is_kho_boot())

be better here? If so, the memblock tests will also need a
kho_is_enabled() stub, since
tools/testing/memblock/linux/kexec_handover.h is empty and reserve_mem()
sits outside the CONFIG_KEXEC_HANDOVER ifdef.

Otherwise, the patch looks good to me.
> +
>  	start = memblock_phys_alloc(size, align);
>  	if (!start) {
>  		pr_err("reserve_mem: memblock allocation failed\n");
> diff --git a/tools/testing/memblock/internal.h b/tools/testing/memblock/internal.h
> index ba4d1c02fde5..84f22a964510 100644
> --- a/tools/testing/memblock/internal.h
> +++ b/tools/testing/memblock/internal.h
> @@ -51,4 +51,9 @@ static inline bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
>  	return false;
>  }
>  
> +static inline bool is_kho_boot(void)
> +{
> +	return false;
> +}
> +
>  #endif
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

-- 
Regards,
Mukesh Pilaniya

