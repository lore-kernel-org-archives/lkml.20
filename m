Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EB64CEE4D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163321; cv=none; b=bqMRyzApLKdnanL+7ct8Ug5EvYhcVso4PKYGo/8bSZLm+qftvAptSQEyBLKKTIJAGAXAr9du8H/qgT44ffvnZVq9Zt0JLuYp3xR8ePwfqT/hRobluNkTEkPYCIIDTc5y1D3sxN33CTctgzklxVMKw7VPlD944myh3YQ5mrYOnqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163321; c=relaxed/simple;
	bh=9U/kkAy5hwvAhwUg9vFQfRBjT/HphVatqeqejnZQ0kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6UX/r5k2kYpdbiCA4770RNTZOQHRjp+jl0d93Imp1TETLCKA/pBgVEwzaTQbvZJQz+gwFgDel0ZCwJzpB8H9/9DgqlNs+q98/th/gsPFh0fZX+epot5kwSNcb/0GAi7hsZCGC0DbMoT8b0krbCbRws0JQd9r18w+AyZAbJ415I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=vSU1U3N2; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="vSU1U3N2"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5351748222cso23585831cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792163319; x=1792768119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FTDTxc6bSklEDzSyt9fmhc+/XaQOcj48Uz7ol1WS8+Y=;
        b=vSU1U3N2Dsoit0P4c2DZqgt5QiWmKZ8WApW4JV+0f4E0DWWqlkb6sXQopVNwF+XuJQ
         1jCKJbI2S3iwbuEO6MPykVJbGxR34d28+3mbY4W07t4Vy+G5OTd0n9z+9upqpa9yRLro
         9n24XC9tkp5QDxNzrGnCsKWclSTf+2bSJg2NdVn8GRz0CI9XdUvEovhd3Vz8IaujcBXk
         enQgW3bPUm8MZDEuyTRMNmmPPCYw8K5qrI9ZeB593lRyF1jAnHWvFHpOZT1fJF9nwrTr
         17FcZW3i5tL96kpzlw8gtJF7mWy9QOl2b6VOoxqucKE/2vd+SWUBwvmkUdb3QsGnQ7nO
         paHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163319; x=1792768119;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTDTxc6bSklEDzSyt9fmhc+/XaQOcj48Uz7ol1WS8+Y=;
        b=ICIIoKZcN3cCzLcuEMxIqz4xyD43PNu3pz+yo1LUHtnO8wbFLxzycoIj7Ri8HFgKnz
         ZQAnGRhK7p0YEfiSKzJoWqZuUNX0bxrnJIYh2AE14mKTx0uC4582yFAbzKXS0W6d0OgQ
         9sE7vQWMF1FMWyDF5C4aCctzBnewc0CaltkdvX29J+9SWoLZt6xPRVlUIurz+vTIlhv3
         rw3NHreIG15WkFMOtzhFo2QuIP/EL+ZbpdOTnVsP6UCbZG/+MZdt5VvVIAF7WfatqRom
         L0nr8yB3c6F90jeqLJ22/uI7QVSuYzcIUvVFTuRDSAdfH80YWLdhFypOMDEy+z21wdyy
         o3OA==
X-Forwarded-Encrypted: i=1; AKwUvBwPcixhR+r050uCrmRXxrc2lmOVAuldTiiHBL2sSmHoH//QoN0OUHjddcrfwm68fiNFM6C7Mlev8BJCiBE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6GIWDETsZ92buYCD5YOBnRahlLgQaj16wsUl8CMe8EO2AZkX2
	JRJJGQ1oBG1kfl6OhTjvo6MD32M8UfNkKgPoH+7tbjrtxnQtZ8PoEpRSlGOBU3jUKg==
X-Gm-Gg: AYBFou2aFca247vuaUzDXcoObK83Ia+IDGPx3ER+LTgUh8Nt7UrgbmugdATqyfmODOy
	0Tv6R4r+e77eE56Vn8/2AgLq3CputXZ7/qGaTcVS8o9vMmtjYkhot5Qh5EJLAJ6B4sVYBqje1hC
	WKD/E+EUFxj5XMW0tNwiB4MTNwUQIFtO+uoZB/2hKNK3zmomKhRH4gZutcVgfLdhQbKvZR8VNo1
	Av28ZlStYvcyEXrwloKqQpsMvFiKLVCys2foilHF6Vro3iddZxJZpsMn6sPydcBd7vaqAgqWjQw
	jVPKVLia/dkr7+qe+HvMkEVk71chh2mymV3jBeYI1HhEw8e398+RUXtzK2qiZnaJkQUVIxFNLaw
	zEuFEawrYPpI3Bl8tku1Q5H5amXp8zE6eAXqB8P8bkhNX/wokg822lpekQt7fJ0KMzkZ9aHSBhK
	kmFZl+pa1GUtk4QHrd7UmgiYQj1Q6FozcEE7JUfbgQpAoXx1kU7B9bkgUusYJX+d+ZC8qh2Is=
X-Received: by 2002:a05:622a:2445:b0:535:6a51:1f71 with SMTP id d75a77b69052e-5359fb86868mr362986661cf.54.1792163318743;
        Fri, 16 Oct 2026 08:08:38 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb1af26sm24682156d6.33.2026.10.16.08.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:08:38 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:08:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bin Yu <byu@xidian.edu.cn>, Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH] usb: usbtest: reject transfer lengths the allocator
 cannot serve
Message-ID: <e75fa62c-80b3-4a8d-a82f-1b21033e0cd1@rowland.harvard.edu>
References: <20261016094848.38533-1-25031212351@stu.xidian.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016094848.38533-1-25031212351@stu.xidian.edu.cn>

On Fri, Oct 16, 2026 at 05:48:48PM +0800, YuanZhe Liu wrote:
> usbtest sizes every buffer it allocates from the user supplied
> struct usbtest_param::length, but it never bounds that value.  The
> scatterlist tests, the queued bulk tests and the unlink tests pass the
> length straight to kzalloc() and usb_alloc_coherent(), so a large value
> reaches the page allocator as an allocation order above MAX_PAGE_ORDER:
> 
>     WARNING: mm/page_alloc.c:5340 at alloc_order_allowed mm/page_alloc.c:5340 [inline]
>     WARNING: mm/page_alloc.c:5340 at __alloc_frozen_pages_noprof+0x4ae/0x1fd0 mm/page_alloc.c:5397
>     ...
>      alloc_sglist+0x331/0x500
>      usbtest_do_ioctl+0x2686/0x5880
>      usbtest_ioctl+0x440/0x720
> 
> A run of "TEST 7:  write/-7 -2147483648 sglists 3 entries
> 0..-2147483645 bytes" asks kzalloc() for more than 2 GiB.  The queued
> bulk tests reach the same warning through usb_alloc_coherent() and
> dma_direct_alloc().  The allocation fails after the warning and the
> driver then returns -ENOMEM, but the warning itself is driven by
> unvalidated user input.
> 
> Reject such lengths where the other parameter limits are already
> enforced.  KMALLOC_MAX_SIZE, that is PAGE_SIZE << MAX_PAGE_ORDER, is
> the largest contiguous allocation the page allocator is willing to
> serve, and the unaligned tests add at most one byte on top of the
> requested length.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
> ---
>  drivers/usb/misc/usbtest.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
> index 8759df49be28..8f2a4752b9c8 100644
> --- a/drivers/usb/misc/usbtest.c
> +++ b/drivers/usb/misc/usbtest.c
> @@ -2192,6 +2192,15 @@ usbtest_do_ioctl(struct usb_interface *intf, struct usbtest_param_32 *param)
>  		return -EINVAL;
>  	if (param->sglen > MAX_SGLEN)
>  		return -EINVAL;
> +	/*
> +	 * Every test case sizes its transfer buffers from param->length,
> +	 * using one contiguous allocation per URB or scatterlist entry.
> +	 * The page allocator cannot serve a length of KMALLOC_MAX_SIZE
> +	 * or more: the allocation order would exceed MAX_PAGE_ORDER and
> +	 * the allocator would warn before failing the allocation.
> +	 */

This comment is longer than it needs to be.  You can just say:

	/* Don't allow unreasonably large transfer-buffer allocations */

The details about contiguous allocation per URB, MAX_PAGE_ORDER, and 
allocator warnings don't really matter here.

Aside from that,

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

> +	if (param->length >= KMALLOC_MAX_SIZE)
> +		return -EINVAL;
>  	/*
>  	 * Just a bunch of test cases that every HCD is expected to handle.
>  	 *
> -- 
> 2.34.1
