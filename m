Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C1C371D1F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426471; cv=none; b=mQbqZoRN1F8Qf7w9XUZI2LOVbJEUVallJjSiPOqmH+H6gbXa7h47ZM6V3Cy6xw2JjguXk3poO1+HPumltEhBi58jx3ddxCvy2+Y7KbXYLZb7/52gB1teHQDfeOLbmUbhNi1mGScy2v/3rr/FBvQHW+O+4iFbd2uZ+WzUvQfzq8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426471; c=relaxed/simple;
	bh=FJHEpPAs0Mp3w0fAF9kOYo+s54kGqv5ubvECN7wuy1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEGN1Xziw2IMYqSLreszWlK0CxKLpfQ+HHJ52rXs7gDofW6WNBrg56XShv4uKHtG58KC7I5hgqKDqeiBU7b7Wdh7FxYEGpG9cGW/C/ZlSCgdbZwfc3JOGBNP4hgVm5fblcmHZ4OB6C3wO3L/sQQx/cJpNdVq/cf1oUn6YzIrn2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pZk3qqRu; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pZk3qqRu"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3bc34cso30415e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788426469; x=1789031269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gzPjC7D68idIVmlMUaOMP6Qao8mYdB0Lqfy2NnmqJjM=;
        b=pZk3qqRuLqVewij5bFXi6ROGsemdQtGd+0C1IVzdcIsA9HT31jbRwjKoyoySCRoGTB
         JyzeWOta9g0/0LOzi2ZCPdCSVZncaL1YLRYq+20u4QGW97nQiHn/ztBbmNcAgWWTVljo
         jjEXp29mEjnwzCyUHTX+qvbXKFuepMllxAukK7Y3A4BGWOVkOyP2y97/WHj4/8J79DHO
         dw6wv8IMzDdW9Pz/e9quEDsNeoEt0SPa+j1zpg5O/AGGZdHu9N6kY/ZeLBu6agNDX1rK
         BlcAhwo8WEBhUcM27SHiE0qWVl6kFg97z/gtCiKEMqhsUqGq3SNOzzI01eptzqZSQ2oI
         hKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788426469; x=1789031269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gzPjC7D68idIVmlMUaOMP6Qao8mYdB0Lqfy2NnmqJjM=;
        b=KKfCz/6/XxJ96GbuWXLNAVU9bW9+4IJ0sGt2L2uPAKSYsKLLaEKRG5mRZ1/KVQVEun
         +FTOrTZJ8HM8ELWzzgDdjmVhqxwdMPWkzYdX/iz8+d9knKmcgnDzAGwbrOfQQm/yML1b
         Ylczr62lbNl3s9J7CSl0n+Q470aliAmdsU3WHgfsAf1V8xkTkhu504N4bZ0QgE/kmm2B
         VpqNg3h+dEiqtN5h4bugANMoSyLFTc27UUtvWMiVr6sd37p52CzODm+ZWAA/Pk/s4ADH
         NKGzw4mDMvT8/UeZDWAdq62Wkv+hS8ok4gBa5qGcbFwOcHCKEuUYnlf/ZWeanwqaH/uc
         VOkA==
X-Forwarded-Encrypted: i=1; AKwUvBwqg4DY/QG6iCfIorRHEBZrLVo3EZDjGUQhvrcMOqe2mECyp27oClyTSpe2LgDWP11u/0SXLKz6ZAEn5Vc=@vger.kernel.org
X-Gm-Message-State: AFuF++n6oKgFiU4TYyRSvjU9EtrTdyjQF/Su3sHbHIyD/LfPadu9JIWR
	HmeXJPCtqHAjBiUMa3PtA6yK1cX+UzRjSp8ZiPo9WbT0K9LGqj7oc4dzRsIyDpYFpA==
X-Gm-Gg: AYBFou1Mg/ReadhwKQLikhr2GXwuTRQ9LtW/RSjVZOPI+fuLNgkMrOjA1WAhWP3Zs4P
	l4boW1tfUDQlTggDqZbRND9VAvE/RdiTBQxFrwYwpQ2KRArG4ymQbRgoQDmmox/W5x3BfTlFJ+1
	hdHKiHq6qcsWEFMRX9ibK0xr/zyxCVTKIaGcs5nyz4/VGimEegei9RqlGatJyAqTm5KrBuG/C7r
	JjUX63BbCKxq8IZizRX8HSWuAZV4MYyv7c/qdYrg94mM3tPMD4LCnB7zFNAq+UnwVZZ1LwQNUoj
	H4pGEZ2U9QeaWOJcNoipArOdRauSSF0xQPVpspIFJaaI8BmSay9A2qXoQczWNeh+/V8GUeD7z7q
	u2GYHAoqZzMDl3bs5NPUk3vrkGG43oVvnTPiihjYH3wbfSjtyTob/1sAmb3spEtjziO0OXjy9qa
	rmdHbW9V4xGW9wZbZFkSaK57nNIzAqYTq64kyPLVrp09tg3LUGVDfM3YD9TEDD4Y8uWA5JcUTGX
	KWhFwlf5aSvJsdZXT9Oq1Q2YFewNA==
X-Received: by 2002:a05:600c:26c5:b0:49c:cee4:dbc7 with SMTP id 5b1f17b1804b1-49cf0806508mr335085e9.15.1788426468158;
        Thu, 03 Sep 2026 02:07:48 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d9c6sm56979455e9.11.2026.09.03.02.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:07:47 -0700 (PDT)
Date: Thu, 3 Sep 2026 09:07:43 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Abdifatah Suruur <suruurism@gmail.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Pranjal Shrivastava <praan@google.com>,
	Alex Williamson <alex@shazbot.org>
Subject: Re: [PATCH v2] vfio/platform: prevent read-only region mappings from
 becoming writable
Message-ID: <apk43xFwqAAwdd3s@google.com>
References: <20260903071955.13144-1-suruurism@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903071955.13144-1-suruurism@gmail.com>

On Thu, Sep 03, 2026 at 10:19:55AM +0300, Abdifatah Suruur wrote:
> vfio_platform_mmap() rejects writable mappings of regions without the
> WRITE flag, but leaves VM_MAYWRITE set.  Userspace can map such a region
> read-only and then upgrade the mapping to writable with mprotect().
> 
> Clear VM_MAYWRITE for regions without the WRITE flag, as i915 does for
> its read-only objects and as fixed in drm/vc4 (CVE-2026-68445),
> drm/panthor (CVE-2024-53071) and ptp: vmclock (commit
> a5edadbae57e2298a56cf7a4e774a027905a331f).

nit: checkpatch(--strict) fails with:
Please use git commit description style 'commit <12+ chars of sha1>
("<title line>")' - ie:
'commit a5edadbae57e ("ptp: vmclock: prevent read-only mappings from becoming writable")'

> 
> Note this is defensive hardening: no in-tree platform driver currently
> publishes a region without the WRITE flag.  The guard costs nothing and
> keeps the mmap() interface honest if a read-only region ever appears.
> 
> Fixes: de49fc0d99e6a ("vfio/platform: initial skeleton of VFIO support for platform devices")

This only adds a stub for vfio_platform_mmap(), The right one is
Fixes: fad4d5b1f042 ("vfio/platform: support MMAP of MMIO regions")

> Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
> v2: commit log now states plainly that the read-only path is
> unreachable in practice, per Alex's review; dropped Cc: stable as
> there is no reachable issue to backport.
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
>  	vma->vm_private_data = vdev;
> 
>  	if (vdev->regions[index].type & VFIO_PLATFORM_REGION_TYPE_MMIO)
>  		return vfio_platform_mmap_mmio(vdev->regions[index], vma);
