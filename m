Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC90A321457
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791783895; cv=none; b=VvLplT3gyt3u4O7a+GgAbjJSAZdWLk0z2cdRmgsaR8QJdKgUO5c/OyCPFn7Y9cc2nyPqZOVy0L/4eB3DEe8yyFA9KRGbX3MjsUwI6syzm/RnS1z3CHoAHRwQQ2ZtnWfiO1IlbxpRhl1d6LOVbk39PNWg8BBK/w5C2SKMHAe3oLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791783895; c=relaxed/simple;
	bh=jOkeAbcKgUrvZorlr+tay1hGWHPBmlHApl1BltEE+iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVKBVXv2H+NAeka7ETNe+NGE+DdWoAwbJmwZLdiXy/ZiEh1AQqIz5YapywJv/HfhlB8QMV2pCEDC63dB6/jxnmhmcSHJGqt0umRzc/+RF2g/iSFZyLUa6qlumoH5RO8hS6xiC9YNIaO2JGqSKk3BIU4JaFPLI5acYkHibDEp38w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnOl37E0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnOl37E0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso9581295e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791783892; x=1792388692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=btW4jQ1y+/SiqS0gs878Y5z0xH+cJraR47l5WrmrTe4=;
        b=FnOl37E0NSF4IHC58l+hpwevQO6VycVvLpqzcW4jSmwdo6kSnP739harB/YJWWOTtM
         hE0ymccm794uWlbHn7pl9hI6t7lbU6nbzN55ZivFzqLCPUGMdEKwXRgNjDioxNBNG0Ds
         C/u+XbcXgYJMmxyKspCFzZgQerGAtf93xGahC7HOWjRc7LWxf4NzLWS9O39PKL90RRJs
         ggfp5j1Kdbp+vcIIGH0a000mp0RONRW2hcCG9cW9hbetNWMbD3iMPv0FoPBYCjbmP9Ui
         dJ0CflCs6D9+7PezGvfPaSBIgta29eJYdYZ4pxbBa6Vrzp403O0Bs6+yyO4jsJIdZVWS
         x0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791783892; x=1792388692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btW4jQ1y+/SiqS0gs878Y5z0xH+cJraR47l5WrmrTe4=;
        b=RiLtIKpSfY+WSv06PudQ7LqvPGqL8C+ThWgrLwtX92KiLC8JsmnyqXAKEGKZNH1/YR
         6mcBVmbLChlKUqUOyu/x+ChjHUNelzdzOiJC3pQLOC6a4riaQoBLqArpOzTb2pVwgLpH
         6a044U8NFfbo9SVpngst47ND6e+87U5Y15aNam8xr2kfyW4R9L5qrPyPiq1HE/Je1fjT
         t9Gk6OAzkzmti1E47w+7CHNymq2rBOEioJwpFtYGeMNZgUGK/HtslpbbkTdk5i5raO+v
         yB/FRb/kclaTs6AoaKwvBcQo9LET6EDlxJ6oWyTU92j5qngvYZOEbzxwjJs5NA5RZC1R
         n/SA==
X-Forwarded-Encrypted: i=1; AKwUvBzeNHqFztAY3iUxxFopo+XaC3LT8SwyWfaAFOFL+d/eNA0sVui38oNFxLSe8uMuGwfx1k4qHRTGvlDpeWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRSn+QNuKu7k/fxzN3gmmC/4ZndB0uYfCq8Q7dUdadVOceOhoR
	OSglF9OyBiVq1Q37t8vl/Oh6jnTuSdGE6GJQrGJg5/cn2dRYUUNDwXH/
X-Gm-Gg: AYBFou2gALtRUgu9PkqzGx+yskBNVYFk1lUHdfxF/DCyCIUr3SS2pFYdW1EuRLAha63
	/9uUg7D5tYxnfQJVTwlFxvyqtKUm6LAxoUvgAjWnra3zFvCb6v6/edCTJww9KM0cLuqFznR4BEb
	vGXqHrW0rlwRVe5XmPQ+/yV4bH8acm8t84Z6A3NP74Rng6FfWgrdJ9oeh0G9BSlIHhDek054w/p
	ZfE+pwH941MkMrlyePj9EUq81S7CBOiRooYsKb0qjzZCQFZwIIlnjjJuVtsdE3Me1LI9n/zlJNr
	uSDzDOK50nUzdK249xHKtNZfY+R0sxfCBkl06ILBGPwJWPl7ZvxXUFx0tVAMWEx6cDviFqOKSTC
	Rf6NrfkNJorYdVOO43ks3jS/HFfCHOmDBIRJipJ+RCSIk8WR69ki73nNoXw10CTUr+rEZlvd1fS
	EkSDgyUL2H6Jys5hXVJIES+wcb8GWm6qGbi3f7AZLUP2O583mkcbP2J/g1Uf8GgzJAHTAfmoKt3
	r6eEgNqfVLRSsNIsAUxUI0HRTn0nXNYlXL48mxNzMGsTUayTWdDBw==
X-Received: by 2002:a05:600c:6215:b0:4a0:eae0:b30e with SMTP id 5b1f17b1804b1-4a18e4ca157mr133079995e9.22.1791783891940;
        Sun, 11 Oct 2026 22:44:51 -0700 (PDT)
Received: from home-desktop (dynamic-002-214-019-128.2.214.pool.telefonica.de. [2.214.19.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf35930sm256330645e9.13.2026.10.11.22.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 22:44:51 -0700 (PDT)
Date: Mon, 12 Oct 2026 07:44:49 +0200
From: Abhin Parekadan Jose <abhinjoses@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	David Airlie <airlied@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Dongwon Kim <dongwon.kim@intel.com>,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+3590d97d8a586fa955c2@syzkaller.appspotmail.com
Subject: Re: [PATCH] drm/virtio: Destroy obj_restore_lock on the final
 drm_dev_put()
Message-ID: <asxz0Xvv5jO9gAol@home-desktop>
References: <20260929070714.169412-1-abhinjoses@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929070714.169412-1-abhinjoses@gmail.com>

Gentle ping on this fix for the syzbot report.

Dmitry, Gerd, do you have a preference between moving mutex_destroy()
to virtio_gpu_release() (this patch) and using drmm_mutex_init()? I can
send a v2 with the other option if you prefer it.

Thanks,
Abhin

On Tue, Sep 29, 2026 at 07:07:14AM +0000, Abhin Parekadan Jose wrote:
> virtio_gpu_deinit() calls mutex_destroy() on obj_restore_lock, but
> deinit runs from virtio_gpu_remove() at unbind or PCI remove, and GEM
> objects can outlive that. An open /dev/fb0 keeps the fbdev buffer
> alive, and the fbdev DRM client holds a drm_device reference. When the
> fd is finally closed, the buffer is freed and takes the destroyed lock:
> 
>   fb_release()
>     drm_fbdev_shmem_fb_destroy()
>       drm_client_buffer_delete()
>         virtio_gpu_free_object()
>           virtio_gpu_remove_from_restore_list()
>             mutex_lock(&vgdev->obj_restore_lock)
> 
>   DEBUG_LOCKS_WARN_ON(lock->magic != lock)
>   WARNING: kernel/locking/mutex.c:625 at __mutex_lock+0xf2c/0x12ec
> 
> virtio_gpu_deinit() should only do hardware teardown in this case
> related virtio, its queues and others. Software state that GEM callbacks
> still use belongs in virtio_gpu_release(), which runs on the final
> drm_dev_put().
> 
> There are two equivalent ways to tie the mutex lifetime to the
> drm_device:
> 
>  1) Move mutex_destroy() from virtio_gpu_deinit() to the end of
>     virtio_gpu_release(). This is what this patch does. It is the
>     smallest change and keeps the teardown next to the rest of the
>     final-put software cleanup.
> 
>  2) Initialise the lock with drmm_mutex_init() (checking its return
>     value) and drop mutex_destroy() from virtio_gpu_deinit(), so DRM's
>     managed release destroys it. This also covers the virtio_gpu_init()
>     error path, where release returns early because dev_private is
>     NULL. Skipping mutex_destroy() there is harmless, since it only
>     matters for mutex debugging.
> 
> Either fix removes the WARN. Option 1 is sent as the smaller change,
> and option 2 can be done instead if preferred.
> 
> Reproduced on arm64 QEMU (-device virtio-gpu-pci) with DEBUG_MUTEXES
> and PROVE_LOCKING: open /dev/fb0, write 1 to
> /sys/bus/pci/devices/0000:00:01.0/remove, then close the fd. With this
> patch the WARN is gone, and rebinding brings back /dev/fb0 and
> /dev/dri/card0.
> 
> Fixes: 54a970048296 ("drm/virtio: Add support for saving and restoring virtio_gpu_objects")
> Reported-by: syzbot+3590d97d8a586fa955c2@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3590d97d8a586fa955c2
> Assisted-by: LLM
> Signed-off-by: Abhin Parekadan Jose <abhinjoses@gmail.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_kms.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 1d4d3bf46a20..0ec755c35050 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -354,7 +354,6 @@ void virtio_gpu_deinit(struct drm_device *dev)
>  	virtio_reset_device(vgdev->vdev);
>  	virtio_gpu_reclaim_vbufs(vgdev);
>  	vgdev->vdev->config->del_vqs(vgdev->vdev);
> -	mutex_destroy(&vgdev->obj_restore_lock);
>  }
>  
>  void virtio_gpu_release(struct drm_device *dev)
> @@ -370,6 +369,8 @@ void virtio_gpu_release(struct drm_device *dev)
>  
>  	if (vgdev->has_host_visible)
>  		drm_mm_takedown(&vgdev->host_visible_mm);
> +
> +	mutex_destroy(&vgdev->obj_restore_lock);
>  }
>  
>  int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
> 
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> -- 
> 2.51.1
> 
