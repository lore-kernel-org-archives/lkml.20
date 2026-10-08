Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1323E483804
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453815; cv=none; b=Z5eJdtoOh4QILPG7Nx9USVJZiorH/phopQSMPKSAcqzE4LX8TxHkOmVKe4lSqZ4n0F78O/rLY0bBzFFR7j5z7pIa9RtNiIsijTUnLz8j5Xk9HgRx+HGMfNZI1RAc+cRHzimN+DPOsG9PG30LznbNEU4RklDXmxDXyUuobV4NfbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453815; c=relaxed/simple;
	bh=WNAJKn4CG1SjaBZQ0OuKZGJJcfPIxRyM7sawNyGWX2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2Uem7hgoGtAk0A17QRNh3fTYp6oVS4iK5pDa+LV75eXG+8ZEBKKkZ1cY7CjoR6NkIPv1aP+Ie+FbC3/Hr2PZOpLpASfufgwxTUf7tQvyFxv2KVMFh9g/6VaXsjIIagnZQNqGXszHObjolAbzKAzviCRgQEVft7bCDigMCh7c10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5Tifa1i; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5Tifa1i"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so23933165e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791453811; x=1792058611; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/z+e+2G8R9kjk4W08xr2uI7ifrsGMZWDh/5vOBTpZuM=;
        b=A5Tifa1irr3eQYm/JAePgPCC0+kZNJPFk69JthmGl+gwVQdluL63p4Dd5IMEIov2/T
         MSIR0SSQgpmjlM5/EkYBsAEm9G//gf+6nbmgdNGTe9jxLQV29SNwgPedmw6kpOX4ClU4
         erHqdRq6pI1JwRXaGYTxHIhbmYXAH6KhzXFgchA5yBmR77puge93m25wIw81lftngkPG
         IwZuvaZ0XJ+1A0AdD8HTsypee+WUxKm4C++LA2xZ6lHUByO4KoYzC5jSv6s1TFui4Z7f
         jO5tPEJJJCUcYv8Qm/+H024WMsaEFi3ayZiSvPV92p/2MQMS6BP7d94FaFUqzS2ZV+x/
         arlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453811; x=1792058611;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/z+e+2G8R9kjk4W08xr2uI7ifrsGMZWDh/5vOBTpZuM=;
        b=aAuURPKmHIPXZze6YGcArNyb0dGlz/mK3W8x9N9t8ELTz9Rjo70h0WGI+3GrHN7CRf
         GoEGS5CvLobhLeP1KiK4wLCo29mYxyma7+FHqdZw3hHOLq/FS2egkwytXw1qrh5B+/VN
         ZDLzYQ+8EgQ39Gz0F5RhUWbYsLNL2Ah3rsazMG3KUA7/BUaACfBUWCNtT14I3IjYFRdE
         /IKgZLizqMznshVsl2MtrdtQEkf1GX+uS4N6oORSSMrkj8pfNnWx7LB+AP+FNOjIpLNy
         wn+cUE2edHOKAQHNlWxttaau4aze6TrzhZ5CR3XBqZjGtYSfuDLGx6tKqVDTnQZIVRWK
         Gu0w==
X-Forwarded-Encrypted: i=1; AKwUvBxVZr45P9fTUfSTQjZA00+w6/cznqdgroIhfW4trUlGBUYYhhTIMbX63hwvgfyfqU6u15GUeQv35KxJxio=@vger.kernel.org
X-Gm-Message-State: AFuF++n5VEDyBiAzKT22RHwcZnE3aTeiYuN3z3nS5dGwcbAM+Aq6RNdD
	VRfk4XFK4Vy2BzeEEUYqCZ+jGmRGFIcaqNIJjnqt0M47mkgS9hmcxH6r
X-Gm-Gg: AYBFou1UlCVpdUICycVXYMX6fG75McBGUBN087f/hUShy1ESQj4uqMyteD7J2mgdsml
	TszzanRUWoaQwkb4BPThX1hjNqEAeKy7thFS/VpftABi69u4QKDKPvbHFSUDpaa2XuHWH8A8eNE
	eVvxchrMGUnSvFOeSGWEqhBnxcTvHGyOwtcfFnY9XnwN6cuVo23P0eF3SgWBbOHOUpddze1lHo4
	aDSBs36oFqWuvyHPSfScPfkVqVRMsBDUw7GYqJM0RK8X0KzsO7sfcrOfEfuQg55Uj4MahAg5yHc
	rfbeRFaJsXRqJXH+WAdRZhRJv2j6VXAyD2H863ZJEyuMRuSA/KPvs2CtdKRuJe1e2vEucVa8yAg
	V7EdRcKuGoTQmNnAiuWf24DzpX42gNlYvUTPdbKtAaVVk8s+e3X7HiS5HPbmkPOMS0W+G84tQxW
	sA67lpSnxSeGmo1fxaPbqyn6v6cCeR57pVyuMcq1MtyAJuR80NdMKb80ZikAuvRCXEIp1IzdJwp
	sqLb/ETIN888DzwZ4WJ3AfAb+MTd190
X-Received: by 2002:a05:600c:19d0:b0:4a0:1f51:ba2d with SMTP id 5b1f17b1804b1-4a18045373dmr81270255e9.22.1791453810672;
        Thu, 08 Oct 2026 03:03:30 -0700 (PDT)
Received: from osama ([2a02:908:182:d1a0:b456:28a3:bd59:abb6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d04c0fsm10290146f8f.10.2026.10.08.03.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:03:30 -0700 (PDT)
Date: Thu, 8 Oct 2026 12:03:28 +0200
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Akash Goel <akash.goel@arm.com>, Chia-I Wu <olvaffe@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Fix TOCTOU race between GROUP_REGISTERED
 check and erase
Message-ID: <asdqcHJDL6PzQ7gk@osama>
References: <20261007181220.2418060-1-osama.abdelkader@gmail.com>
 <asdaHi1t7i721Xfn@e142607>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <asdaHi1t7i721Xfn@e142607>

On Thu, Oct 08, 2026 at 09:53:50AM +0100, Liviu Dudau wrote:
> On Wed, Oct 07, 2026 at 08:12:19PM +0200, Osama Abdelkader wrote:
> > panthor_group_destroy() checks the GROUP_REGISTERED mark and then calls
> > xa_erase() without holding the xarray lock across both. If the handle is
> > destroyed by another thread in between, and a concurrent GROUP_CREATE
> > reuses the freed ID, the first destroy erases and releases the new,
> > still-initializing group, leading to a use-after-free in
> > panthor_group_create().
> > 
> > Do the mark check and erase atomically under xa_lock().
> > 
> > Fixes: eec7e23d848d ("drm/panthor: Prevent potential UAF in group creation")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> 
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> 
> As Boris mentioned, please let us know if LLM has assisted in finding the bug or in
> the creation of the patch before we can merge the fix.
> 

Hi Liviu and Boris,

Thanks for the review, an LLM has assisted to find the bug but I created the fix patch myself.
I think I have to add the tag nevertheless.

Thanks,
Osama

> Best regards,
> Liviu
> 
> > ---
> >  drivers/gpu/drm/panthor/panthor_sched.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> > index 0493858e55d7..a343c5180e01 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -3770,12 +3770,18 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
> >  	struct panthor_group_pool *gpool = pfile->groups;
> >  	struct panthor_device *ptdev = pfile->ptdev;
> >  	struct panthor_scheduler *sched = ptdev->scheduler;
> > -	struct panthor_group *group;
> > +	struct panthor_group *group = NULL;
> >  
> > -	if (!xa_get_mark(&gpool->xa, group_handle, GROUP_REGISTERED))
> > -		return -EINVAL;
> > +	/*
> > +	 * Check the mark and erase the entry atomically, so a concurrent
> > +	 * destroy + create can't make us erase a group that's still being
> > +	 * initialized and happens to reuse the same handle.
> > +	 */
> > +	xa_lock(&gpool->xa);
> > +	if (xa_get_mark(&gpool->xa, group_handle, GROUP_REGISTERED))
> > +		group = __xa_erase(&gpool->xa, group_handle);
> > +	xa_unlock(&gpool->xa);
> >  
> > -	group = xa_erase(&gpool->xa, group_handle);
> >  	if (!group)
> >  		return -EINVAL;
> >  
> > -- 
> > 2.53.0
> > 
> 
> -- 
> ====================
> | I would like to |
> | fix the world,  |
> | but they're not |
> | giving me the   |
>  \ source code!  /
>   ---------------
>     ¯\_(ツ)_/¯
