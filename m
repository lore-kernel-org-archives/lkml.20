Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C9C3C1D66
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041916; cv=none; b=uKr7jqwadZoo31Kt2Xr/+RMvYVePZ6ltuPwOzGh1rHCBIZd1pFGiyZ4nxh7+jE3YVJ2iiVK9jeyFMDGZ/2/VeZy+OznMO666Fw3XuAoBPRcNgLnFRNHQ0SYh6RfbZM5kKfQvUvJ81nG9JNCAM6XphRX9gHk97odtJIYEt9+2plM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041916; c=relaxed/simple;
	bh=Dh+C1CEpDvzrLhBURpSG+mXOgu6jlIQl2Pl47TDrIBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7iJRNP/k0GsNU8gpC1vkqF8Hz3yoSdj41L9TmJxasuOd9vbMpoaikvD0Qp1F/JGSN0v/9StZ5Yw2i4KIDT+audFzURiV2wZDM9mMyKgkT5yR4J8g+V94kwhwm4cgDh1sSeJs/rBhAloj4fUJXQy4hmN4OmxvXfcmGIJa8sTar4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNjaEXfP; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNjaEXfP"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2db710396ffso37450155ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792041915; x=1792646715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x3DSX4Qza6d2uuaZQntx7y2v2J0oEf5jt6hMhwGI1ew=;
        b=gNjaEXfPgH2TtLh1WD84eyKJlPcV4BduhjuAud9Tm9t6OA87jvM5jgDXH7Lchjc2qB
         pFdNFFbQtffBmsASZ0XGexkBA/h4o7MYI0sX+GtSPw7rHPwXoKYMBydUrkMy3bnBzvQb
         yZFrfSMlrbXNRhfKnBp08jrudbPgvaBaCkNLDaLTpCeLs4MF6IcUbNDI5GiWji6REVu9
         rlI+b4eUdymLv7un2OS39TVyBQVm136y8RY8f87Wac0HFEQxOSQImOmysAQxQ7P52kg9
         HurdIeYfNnZQPsr9f6rPg3cLT+FNS7jIb1hfBWnEmQUkcnWp1A4jPXXSpeTWESVpZvRX
         9O9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041915; x=1792646715;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3DSX4Qza6d2uuaZQntx7y2v2J0oEf5jt6hMhwGI1ew=;
        b=oFMXE5+K3VrS5xJ6f1wMBQqfBaJfUqVTsmWDAvEvkhVa4TMvpkZ0LvF8Kx9WH7I5SL
         NAFEGeb5z/B6J/E1nxBEL3D0E8pUqE4zalRm0ID3H+1COvAXI9TwJwZsXtMNwU4cvqFC
         tMYhoax4XEN984V8GPhmQBeMQUti/nY9PkD1dhmp+4pmB36LzUo01vTVlWLMDdHFYuho
         gqqsi6leD+sySVRX76QR/m5GewH8zPnnPCDdcYJF9AyOND2R3q8roEEbilcZMIQYvmvu
         SpEyHIi2YXJMcRN+oHGYQY+n4V/QkhPLDJ9RV41yF/ePu2j5C1sWrY1/0fKDJRg3BVMl
         e+yA==
X-Forwarded-Encrypted: i=1; AKwUvBwg2rQjBPdIB3NpPiytQIfKadnjq89fUpib6z2DZffFT2E9vp+WkyZO7Wak4lzL4gUM0Vq+9SdDnumESMY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5CyHEoUYRarKkzX2GASqHaN4MyJS23eb2k7Ov12oquxSQQqma
	XWJ33EC2okLp6qJZ+cEbexXBE5GqojUx3RZGLD/9IhnEKoKNFKcoRvJ7
X-Gm-Gg: AYBFou1Cqr/U4VJphrQJOPss204u7QdgmcOtm69L66O0m6NmJUuV70ysmLUYCvGAnw4
	N/t+iOlI/jnYQqxgXM1MXx2FJ9yVwHK4IiV3+jo6vY1vw2b/P4IMUiwgblM7v7NBO8VvVZifEfI
	31N+Aj8zdD9lpj15fjccthX/dmBPm0IgICUSfnbzeQLAMbJbanINbbSu6NmyLP3WQsvtWcWgCUg
	CXVVUYMLP9uwyTcQO+5+Yx7TcW7g6mOBn5lkmpZZWSgu8fyGNJK0+3P1nm57YiPNygRyRwGrTG7
	U4lmLLlHYEi72meYlpVBDXr6dmlKS1ItEAOkJlcmXjFsA1N2KzZLTOSisM9N2TbhAcBXj8ctqNh
	g645fWu1qvbISfoqbFeYM4hVUvd909d5gbBgXBk0DhY2FYb35FmvtlnalXn5PE/Bh3BVK5ysmIS
	RgrKn2MMAV1owqGUkepFtpdZS/6qpe+c+IowrPe5kfwf9KYLE/nHQek5J1J/xyoWIfZYzjFqb3K
	mb2VPblXewWI9DxSjHUcN6GYjrguwa2LGSw8Bf2JYyi
X-Received: by 2002:a17:90a:d44d:b0:3a2:bb9f:f87d with SMTP id 98e67ed59e1d1-3ab3a9f2d87mr10362341a91.21.1792041914556;
        Wed, 14 Oct 2026 22:25:14 -0700 (PDT)
Received: from localhost (softbank126159121187.bbtec.net. [126.159.121.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e74bcsm2625793a91.3.2026.10.14.22.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:25:13 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:25:10 +0900
From: Zhenyu Wang <zhenyuw.linux@gmail.com>
To: Matt Evans <matt@ozlabs.org>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Zhi Wang <zhi.wang.linux@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, Alex Mastro <amastro@fb.com>,
	Alex Williamson <alex@shazbot.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/3] drm/i915/gvt: Read dmabuf->file only while valid
Message-ID: <atBjtqQTCxLuomi2@dell-wzy>
References: <20261013120211.135807-1-matt@ozlabs.org>
 <20261013120211.135807-3-matt@ozlabs.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013120211.135807-3-matt@ozlabs.org>

On Tue, Oct 13, 2026 at 01:02:05PM +0100, Matt Evans wrote:
> After 4ab59c3c638c6 ("dma-buf: Move dma_buf_release() from fops to
> dentry_ops"), dmabuf->file can close prior to the .release callback
> being invoked.
> 
> intel_vgpu_get_dmabuf() exports the dmabuf, then dma_buf_fd()
> effectively transfers its file's reference to the fd.  A debug print
> dereferences dmabuf->file after the dma_buf_fd(); however, the fd
> could be closed by another thread, making dmabuf->file stale.
> 
> Read file_count() while the reference to dmabuf->file is still held,
> for later debug printing.
> 
> Cc: stable@vger.kernel.org
> Fixes: 4ab59c3c638c6 ("dma-buf: Move dma_buf_release() from fops to dentry_ops")
> Signed-off-by: Matt Evans <matt@ozlabs.org>
> ---
>  drivers/gpu/drm/i915/gvt/dmabuf.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
> index 8a1d6c5636c2..b6f50f2b912d 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -503,6 +503,7 @@ int intel_vgpu_get_dmabuf(struct intel_vgpu *vgpu, unsigned int dmabuf_id)
>  	struct drm_device *dev = &vgpu->gvt->gt->i915->drm;
>  	struct intel_vgpu_dmabuf_obj *dmabuf_obj;
>  	struct drm_i915_gem_object *obj;
> +	unsigned long db_fcount;
>  	struct dma_buf *dmabuf;
>  	int dmabuf_fd;
>  	int ret = 0;
> @@ -531,6 +532,7 @@ int intel_vgpu_get_dmabuf(struct intel_vgpu *vgpu, unsigned int dmabuf_id)
>  		ret = PTR_ERR(dmabuf);
>  		goto out_free_gem;
>  	}
> +	db_fcount = file_count(dmabuf->file);
>  
>  	ret = dma_buf_fd(dmabuf, DRM_CLOEXEC | DRM_RDWR);
>  	if (ret < 0) {
> @@ -552,8 +554,7 @@ int intel_vgpu_get_dmabuf(struct intel_vgpu *vgpu, unsigned int dmabuf_id)
>  		    "        file count: %ld, GEM ref: %d\n",
>  		    vgpu->id, dmabuf_obj->dmabuf_id,
>  		    kref_read(&dmabuf_obj->kref),
> -		    dmabuf_fd,
> -		    file_count(dmabuf->file),
> +		    dmabuf_fd, db_fcount,
>  		    kref_read(&obj->base.refcount));
>  
>  	i915_gem_object_put(obj);
> -- 
> 2.47.3

Acked-by: Zhenyu Wang <zhenyuw.linux@gmail.com>
