Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CDA3D9023
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529929; cv=none; b=pVLCSIaJOSC4AEIOJt7wOip4SumkdYktkIVsk9OGhcl4VqINjJCzNm6awXrp6KtcGP8xf6t3M1bBzpGb8X3a/hMYEXtlOwBiUWPSDnD3r0dARrwJfRuSqrCuIeFYL4M02e6v11w8LrE+Md8m4lV3uNURJTLMrJpZI1hh8yRsC2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529929; c=relaxed/simple;
	bh=jHnLUWIESbcX49x//Q4q7Bwcagr68GVUnUN7YIG+4NE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GB4f+NV/rfYkmvOmDnSwmnT29PbCS968Xu10NfnsYhfVVGocUaWXE6CQjgQJYqmzjWwPLLZwFkaj37vJr/ABS/N+1PPGtOvfiY5FNU4Y4U3jKhZgiBp3ZBD+wGUGhVXRTcB4Jh6V4ck1B10qavN7v5qHx1ArRnd4p0oFpf6PNJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eqlbIxHm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eqlbIxHm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788529926;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IhhXcRIecUQqwiCbMDmvIAEilzEU8sFSDbKFkRHxEJU=;
	b=eqlbIxHm1BXgDYYa5qbjXVDwpAZCIO3zsQBsageKCvLuL06OdE6j7jqLWJtazO/+byc1Zd
	J/IoNxy9bHUPEgqeLjJTQQtlD7JhkvCrCb5Mky4DR5R9zQh5NsepCfQAY5R7hEm2cc55uW
	wXXHm197/Wx2KtvonrfTDef70hAzTzY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-V-iKjlLsPb2y22KCVwCK-Q-1; Fri, 04 Sep 2026 09:52:05 -0400
X-MC-Unique: V-iKjlLsPb2y22KCVwCK-Q-1
X-Mimecast-MFC-AGG-ID: V-iKjlLsPb2y22KCVwCK-Q_1788529924
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49a1b4ea633so10259545e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529924; x=1789134724;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IhhXcRIecUQqwiCbMDmvIAEilzEU8sFSDbKFkRHxEJU=;
        b=njD/9jzNdq2sWEAsplfBynRFmxLLUavJfXE8EnCpIW/AAtJ/waQIrl2gkol0OkGljN
         /LOT8JpFKdfDSI4YUHswGMi25npspEkfEGN+7Sm4dcdxDMV0Oh7mpTk4IF74KuzM1mQa
         rzbAGGlDD4bivvu7C/VhFn71UxMIlduDW6rEoIaXZGz3QCK0I+mBqlHAgtzmKyxuoCs9
         RRidOL2BJQtJKDT1GydkSdMv0hRiJX1ArAoH2RghgiJ5un4B311AVyYUTfDwYOAFwM9P
         /Bfk3rJMHZmW3iK6ElsEhmLz2j/7OxjZbEtqqBPjOdLZjHNZwfjrcB9OR4DydgkA1Y1k
         bnxw==
X-Forwarded-Encrypted: i=1; AKwUvBzfiYCjrDLCdc3RsAnYRlrPe88uULvkt0hgGWLrk598Me8pal/Eu8Vbh8oevikzjsMS1XvMIVgFfVutEPI=@vger.kernel.org
X-Gm-Message-State: AFuF++nltOwZLJgDIM1A1V9K5fIc7dP4E/pZkXx7bw13tW+NLQjD7cn2
	Dh8dLOWekotl+kIR+IEE4hQKdtQvx8co/6UJU+kwpdorC9wcp8HiQvFCYGCgrwfmY5UvVE32vmN
	By0fZ3tKN/4Jgzo/rj6GtigWnD5eClaQSbJYIZt9MNBG00nqvb4+UxZToMJKDj294LQ==
X-Gm-Gg: AYBFou3Wra8y+vc6MpKjOjs+KwCxU/qOVd7hpeeD6rFX1EavCqAXVTOphhwdNoG07vv
	gnh1cz76EyK0ozJgUpA3slcn53kCS4u2IgrqBw5MVOYRJmWP20uKHQs0lwNgpkRG+wHvjk5nKm4
	6YOmKg1GiYa/pu1Aa7X2VYpgBhT4TpKbzihRHGqWAqPS+6LG61JAtKZPhDTg3oBwBaU0sQIn/a8
	n6VjISwZWeMtSrtUYMldlbQtg9WYJET0qO2sQWh+85sT66wWFBCKYB1cjfzItr7AddIsypyFLbC
	1AVqw+gsoZQM5P88u756a9biL1RCXQ06Cy2sF3Dk1FTtipWgaVVV93UAs7MJApcf3L+FchWf9DK
	h6gmiqLSLBKAAg8ByZPZRXGNdF+8Ql5PSBw==
X-Received: by 2002:a05:600c:8b09:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49cf823f57fmr113368275e9.10.1788529924242;
        Fri, 04 Sep 2026 06:52:04 -0700 (PDT)
X-Received: by 2002:a05:600c:8b09:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49cf823f57fmr113367165e9.10.1788529923865;
        Fri, 04 Sep 2026 06:52:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6024a8sm160985535e9.6.2026.09.04.06.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:52:03 -0700 (PDT)
Message-ID: <882503c8-6993-452a-98e5-2eb72faff58b@redhat.com>
Date: Fri, 4 Sep 2026 15:52:01 +0200
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

Hi Abdifatah,

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
While at it, don't you want to fix the same pattern in cdx/main.c,
fsl-mc/vfio_fsl_mc.c?

Thanks

Eric

