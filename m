Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87934BA9E5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531445; cv=none; b=VDMD52xBCxI5XUX4CImjtnUQ4XKGg9UlrgrQehbqis6mSAZuNyUnuVazE2xHt3eoB5Y94yiM+X6tk+7o9kT5q6So4nhbbzZxiN7tt0Czv+4/c/OXqVrM/QRDd6EtE6y0/MSxmYvwVeiPoFlH4u0mYVsnV80ZdpLpivYU9LZksGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531445; c=relaxed/simple;
	bh=D2t6B1YS33bYDK84WqJqNPxeuOe8w02R1XfEYryLAhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEiJKHlXHxEqofDsKoGuCYK/Cn2GDJ2vh7/Vp0UqiwgDHp/IFXJWR/nLGxvAB3oheZL69xUwlwbzJuEoqM1XmxI8uUxbFgmff2cOaWKk0FFEo+hhVtN31zgcvcdmbo4jnqXZl4MFYCRuEzLLMIL6AQdpoaupeBjoSllY276qeVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MyScEaj5; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MyScEaj5"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff3aca07so97325ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788531443; x=1789136243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=60ByTjtXefcxnqfTN2YbLnHfehKM3hxAEVNuYOtMxjU=;
        b=MyScEaj5nKVAXEo7j+AgSvNFk3FyevLaQijrZ4qQhnj54PaVyoFnydjwij5MaX+n7Z
         /rGsbPB7+Jy9P+/9cFfmrs4ZeRJ2gGum8tlp7x2CMDPqoBpcTaoK4oY1cp8W4Eva3EMO
         PFvg1yzH8WCSvJ2CGIUZDAVhwypkxdQ1usZxMhLH/zSQ4BPFN8I6RzEf2ouhQo5dkK60
         uzz7Jzgj1k5j0ijbf37gJBN93EHGhrbsfGoDc6BbFoKswHQWwDXYRP+bz+3xLJg/d/mQ
         QIAwRiEicmDTtTtehDJEmPnQg+z+v1SkMKT2Q13arDcN7dsCdpqfdgLHR8tpfup7pyVe
         3A+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531443; x=1789136243;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60ByTjtXefcxnqfTN2YbLnHfehKM3hxAEVNuYOtMxjU=;
        b=NPwkMhNefcplUybn5IeRF+pzrF2+KxsVLsZcW5M7wlAg1KEsKBxZ+lSZ8crMW6xn6J
         uudlWrO0VyZDovazNuQ+nDliX82gsEaQRD0ucvOJ0sFS+mUplH9E6QH/2s1UJcwjdAzz
         vBD02y3YfjFAc2z3Z/fs7dAFbe1ByPtnjFCFx8rfGZrYrachY7Gg2HWypIkMqb5JOC9P
         YMgjn276WarVxMCBXjuwHLVJgHNJHujyUGjNVF5N0ZsU0hlULI8ut9Jk62oz240a4LWa
         vdZo03v+vLGIlLYoQYxx63GoPATGYh/dnqq4juodcLN19XQzBDZ0kzptRqOfvVMAG7bu
         b7XQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGQAKgL1cilMmw8QmBOWYZlSKe1ZY13OgirbE3GQFgK/1WMk61a4PAHrRN/KY2wLA9EZ1IvoPiAKZqxXQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nMEQqyouYvK3QUQJc4DGUPMHKQBb4EEN7zeYmEofmwi52aurXx
	28PNfhuoRNk3qi38GdPQjecIsVuy1DO1vB8aZMPx78q34XWeERiSsMiqFOUv1pdtzg==
X-Gm-Gg: AYBFou1zoi7liWs+lHZ3kPlHtXwdzAWIRLXUfYyA0rkJBHFNYUsy3r42R+qdCw/5xJt
	qx2rF8b06NeVQVu+cok1gGzT53zz9o0fuZ211Q+1i4IKgX9aLTTkzg6Xsf+UrL+hoyoZxh5RHfK
	3e0ctvYcG/YnHYPx9JP35hbzMLfrUyUEuVvw1DjB//hHC5EttUtmYtqtg0mb+w7PtQJccGJHror
	+aoShOeHWfk9k1J7HuIKF7c2X9P8ezzDAQA+V582HH6J5EX2a2KrL4SYlGs7toyeTs9QJFwOwpi
	Te+vL9AXL+yKsLZaWXL1OlOKjFTFZ6S+RAW+NtYezbDqaP0i0HuRrmaljxE+IjFvzNWxUizgFWO
	7yb3fC5roZN3tGAo+dE/QtiDFgK5AQ3vro87T8DqVJ99afaDENGCTV9u9fNLKklWrMhu8udUkb3
	AKBAzBo6hcRsC4sjiup4SopoX9E2kmniBfDgirmKWRXgGINwPruqT5UFaUKUtrJMEVo1JwDFdUe
	9W8HrGtQFtlNTG/tEeWlC+d3MAI3KpA5kVH
X-Received: by 2002:a17:903:3c2b:b0:2db:2225:d2fd with SMTP id d9443c01a7336-2db2225d395mr1063405ad.16.1788531441093;
        Fri, 04 Sep 2026 07:17:21 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f8d2c5sm5029514a91.2.2026.09.04.07.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:17:20 -0700 (PDT)
Date: Fri, 4 Sep 2026 14:17:15 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Abdifatah Suruur <suruurism@gmail.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alex Williamson <alex@shazbot.org>
Subject: Re: [PATCH v3] vfio/platform: prevent read-only region mappings from
 becoming writable
Message-ID: <aprS65nZ3vi6TPxY@google.com>
References: <20260903092907.419-1-suruurism@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903092907.419-1-suruurism@gmail.com>

On Thu, Sep 03, 2026 at 12:29:07PM +0300, Abdifatah Suruur wrote:
> vfio_platform_mmap() rejects writable mappings of regions without the
> WRITE flag, but leaves VM_MAYWRITE set.  Userspace can map such a region
> read-only and then upgrade the mapping to writable with mprotect().
> 
> Clear VM_MAYWRITE for regions without the WRITE flag, as i915 does for
> its read-only objects and as fixed in drm/vc4 (CVE-2026-68445),
> drm/panthor (CVE-2024-53071) and commit a5edadbae57e ("ptp: vmclock:
> prevent read-only mappings from becoming writable").
> 
> Note this is defensive hardening: no in-tree platform driver currently
> publishes a region without the WRITE flag.  The guard costs nothing and
> keeps the mmap() interface honest if a read-only region ever appears.
> 
> Fixes: fad4d5b1f042 ("vfio/platform: support MMAP of MMIO regions")
> Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
> Reviewed-by: Mostafa Saleh <smostafa@google.com>
> ---
> v2: commit log now states plainly that the read-only path is
> unreachable in practice, per Alex's review; dropped Cc: stable as
> there is no reachable issue to backport.
> v3: use 'commit <sha> ("<title>")' style for the vmclock reference
> and point Fixes at the MMAP support commit, per Mostafa's review.
> 
> --- a/drivers/vfio/platform/vfio_platform_common.c
> +++ b/drivers/vfio/platform/vfio_platform_common.c
> @@ -594,7 +594,11 @@
>  	if (!(vdev->regions[index].flags & VFIO_REGION_INFO_FLAG_WRITE)
>  			&& (vma->vm_flags & VM_WRITE))
>  		return -EINVAL;
> 
> +	/* Prevent read-only region mappings from being upgraded with mprotect() */
> +	if (!(vdev->regions[index].flags & VFIO_REGION_INFO_FLAG_WRITE))
> +		vm_flags_clear(vma, VM_MAYWRITE);
> +

Minor Nit: We seem to be evaluating this condition twice, back-to-back:

if (!(vdev->regions[index].flags & VFIO_REGION_INFO_FLAG_WRITE))

We could consolidate this into a single block to make the intent and
flow cleaner:

        /* Prevent read-only region mappings from [...] */
        if (!(vdev->regions[index].flags & VFIO_REGION_INFO_FLAG_WRITE)) {
            if (vma->vm_flags & VM_WRITE)
                return -EINVAL;
            vm_flags_clear(vma, VM_MAYWRITE);
        }

Apart from that,

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
