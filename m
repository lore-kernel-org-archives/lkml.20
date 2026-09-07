Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B875D46F4BD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788790255; cv=none; b=cevrxsbnXBVFKnf3qPzTXFIdU6/u1HrxzJjeyJZYfaqqMom4JduRN9IFpJ9pthk4JJJRVBFY1QeRnfpbuENgwMvNSD8z9hHfbw2/aiQYOMm2PwQ90xhcP9DWTCRJFtImlyswAPwWO83H8Jc/sc9y5p/rEOd7rzPyy/deAYDgoq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788790255; c=relaxed/simple;
	bh=0vgyKgm7Ju4DhvTSNHaMWk44o631ldKHVMXJr8tSp4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2DEHM8yl0DoDpIlLB1FnJqNTg+nfiMZWr8nGwyUnXR/A/dJB+kxUzQDxvM4kYeGGuYdezoNOniGovzvSY63phprNJzWNQW9MuwzbA1wTlnhwYiqngHoY8BNLAeiMjXlZwvkYndGSLkISVgK+p8pA7IsRHJYMxy6y502b5p/I/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SpPRIox5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SpPRIox5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788790252;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fGAbXgift4P8mLmChfWdJgoXpNqo/L2DoPwMTNYzRVg=;
	b=SpPRIox5FqqkY859KGUW4/dMDjQ/dXxn8KEJ4EZT7gRCuLj4C9lJ627CRds6o39NXQXoSc
	C9y3p6xR1WWhIrxosHADGGOusZ9ouxP9xJ0tPWMxKaA4ifS91gM5dW07PZZOcwvEJZcI7e
	CHF0SPFGDn9SiDFD+w3Q/BBI++ELMfQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-_4UJUZppPoKmcl4LqtkVlA-1; Mon, 07 Sep 2026 10:10:51 -0400
X-MC-Unique: _4UJUZppPoKmcl4LqtkVlA-1
X-Mimecast-MFC-AGG-ID: _4UJUZppPoKmcl4LqtkVlA_1788790250
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so24895175e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788790250; x=1789395050;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fGAbXgift4P8mLmChfWdJgoXpNqo/L2DoPwMTNYzRVg=;
        b=ZNIpDSiFA0LFPF2AQq7MDaTzUBEVWOlh2MXs7mbpTMtcc7yo4dhtt3bG7Tqk72EpLR
         uHIX/3Jo79sNVW8EW4lq4x7X5EcvlNencH1klDLj39ES/52JRlP4Eg6ke14gXs1H0iMH
         rTFnQZ+fMmJjc0gS0hYmtAV0b2MTqEZ6S3lh+XLt81c3XpYeHvgYMPsKRDGHbxjaSwDD
         BGEOE4jZ3+nkzEBxWYuuGR/AP3fxJgZa4+4HzmC8VIin1a8VecQ5Na5KVN4lZLv3vJL3
         OqqxnOJUlL6kGgGspDJrZDd7H3EJgbmYMkTmP4nmT0gEHY2pkFQuPhmSpvuWS1Q0NLZB
         nvUQ==
X-Forwarded-Encrypted: i=1; AKwUvByHw7wXGZGdZDKhS/fK4QtVHyyHqrfdKgPNFOzbFYZE2MfqVtm2jHC5XcvK3g93aunOrYk17PcqSbnnGxg=@vger.kernel.org
X-Gm-Message-State: AFuF++n7mYTR032L2V7aaGSfQfJ4jxrAnV+lmIs6HoDSZuyA6/TqaD/m
	eU5AeOaYyQ5cNUT4GDbUVDOUqqDrJLNYcq+qwc23yI+CsQc0+97VVBJYvW+CVelNk00sTuLE6BO
	04cyAZ9hYp9EtAk9IIzQf11mOuyb6lXiVwsmXbZXdpuibzxf73YbAJBYGcSzHIeIksg==
X-Gm-Gg: AYBFou1SpKmllalYvYp+NH0ubsuRxvrZ01p6XYfoxhUnGlDfIiMgCULFKi2paKDbo1z
	DyUkuaLqOqQewGVQW5uNT/ezIvFYCAO3zVuVU3WjW7lZXsrX2RqM7FXHC4aHXtSaBoJS0nCxWef
	Ms/CEmGyrToCA9d2yKuUe9uZk54ygwJO3a7SAyHwljfYrDvEPUyi3kZyeb1pBGrBzKB/uEZaOi3
	ST8r1qgwe9J+BXYTNGxR0AHhB0IAg4px5TBeSpXCa2zUJl9eo7S88z7pnHy5HaX2WfUO+7ivwXh
	f8idXmlOc4eBEYUHlnQ/Nx1TrUnQ50WhvcUk4KZeZ/jQ6IZsp4Gy2ypSHsUNn2Ga/b58pkMI8gk
	K9NXnp8vI0Zg2OCbdAeTp0XOtU1ptVZaw6qc5srCq2IGyRwO4
X-Received: by 2002:a05:600d:8445:10b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-49cf825d77amr167663375e9.11.1788790250071;
        Mon, 07 Sep 2026 07:10:50 -0700 (PDT)
X-Received: by 2002:a05:600d:8445:10b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-49cf825d77amr167662955e9.11.1788790249583;
        Mon, 07 Sep 2026 07:10:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm839353095e9.0.2026.09.07.07.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 07:10:48 -0700 (PDT)
Message-ID: <21fda51a-6974-487d-874a-387dd73e2346@redhat.com>
Date: Mon, 7 Sep 2026 16:10:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH] vfio/platform: keep logical vm_pgoff in MMIO region mmap
Content-Language: en-US
To: Abdifatah Suruur <suruurism@gmail.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Mostafa Saleh <smostafa@google.com>,
 Pranjal Shrivastava <praan@google.com>, Alex Williamson <alex@shazbot.org>
References: <20260903092927.502-1-suruurism@gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260903092927.502-1-suruurism@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/3/26 11:29 AM, Abdifatah Suruur wrote:
> vfio_platform_mmap_mmio() overwrites vma->vm_pgoff with the physical
> frame number of the MMIO region and passes it to remap_pfn_range().
> The VMA is inserted into the device file's mapping->i_mmap interval
> tree keyed by vm_pgoff, which VFIO expects to be the logical file
> offset: the core links every device mmap to the device inode's
> i_mapping precisely so that unmap_mapping_range() can revoke all
> mappings associated with a device (see vfio_device_cdev_open()).
>
> With a raw PFN in vm_pgoff the interval tree entry lands in the wrong
> coordinate space and unmap_mapping_range() cannot find the VMA,
> leaving stale MMIO mappings behind any revocation attempt.  Keep
> vm_pgoff in the logical VFIO offset space, as vfio-pci does, and pass
> the physical PFN to remap_pfn_range() explicitly.
>
> Fixes: fad4d5b1f042a ("vfio/platform: support MMAP of MMIO regions")
> Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
>
> ---
> --- a/drivers/vfio/platform/vfio_platform_common.c
> +++ b/drivers/vfio/platform/vfio_platform_common.c
> @@ -559,6 +559,5 @@
>  	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> -	vma->vm_pgoff = (region.addr >> PAGE_SHIFT) + pgoff;
> -
> -	return remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
> +	return remap_pfn_range(vma, vma->vm_start,
> +			       (region.addr >> PAGE_SHIFT) + pgoff,
>  			       req_len, vma->vm_page_prot);
>  }
>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

