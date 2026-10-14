Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9133B357D00
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792007606; cv=none; b=Jm5X3xGlWGWWwtwir41S3Vvz3gXQxTLYi499XeHsstHW9x1P/vQQ8WlQjjJD0o3+b1sy6Viq9Z/PU/btToD5GX8Bh/4SKMGvObfaNyhW454GMBCU1BROE5fdHnCfSYHnTmus25QJcEm72+ILz5MQwtykU+3FyfMQ5o6vb9uP6Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792007606; c=relaxed/simple;
	bh=Sc8w6Gf1zm0CKPBLiqU85+5AnKipo2xEoc7dR05jPxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HoefCU5irCcQkYTPGK+lSNhCiRnnXB5uZDC3invTJOKs9Dy4fqdelOHouS+swRFjtmB0QcxL3HD6rCmZw/YrVmsFh1iFt67/okTRxNW1wiAglCjv1NggYn9nqh0fxmvpPj+Z3uCFBWm/No9uQlPtcTrIXG9xJkl1F9/fvt3tKYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n4jjbYmi; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n4jjbYmi"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso42522245e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792007602; x=1792612402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wRoKa+AOyjdQOl1cRipieu5Ib6igoe0K53YRH5w/Cro=;
        b=n4jjbYmibiKRjVZ2wbQS9nUGEELiy2L3PfJYWtQOYYZclAkqPmpCmhSRtrINOk3Tds
         wRMZkKOi0uw4KhBIZBIFC13VxWWhBU+SBZcQ+kCcIWLE9y0e5pKoFfPvZVl4/dLj4UDa
         AoH6BDG3ED/rUsvFQlFFXve/svOBA99f6RFkIcLjdgxIh+Zx1apMa/0GMdu5hx8tdVui
         Erf3tWv3thUPtKqQO0ioBvBNs3v79XmAp2BNzsCNpl6GIQYA5b/BCrdTOgT6Cg97S4vY
         YQ4bepfhfLoAKfEJHMKi9v8maHkDvVIDdBqfsd4BGjNunRVHkwTYMCI87idx/tYHtAd/
         6kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792007602; x=1792612402;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wRoKa+AOyjdQOl1cRipieu5Ib6igoe0K53YRH5w/Cro=;
        b=1msNlQQ/4cRbRIsikOYceXrAK/NJYnTWo0VruTmlB3zENTpmV1GFzj9zgJ6qj8Dbvz
         To2pQyngsAGvfJn/4WiazPKOl1Hm5z3dNYrppcXo8pVIlcSUgS8Z6QrR606hxqAnoGfV
         lD44+ozdO45DyErCeqTGKoICMwjOo/Dg2os62P0NtOJtA7fIPi/H3wFdOxsuTXgJDqhe
         FWSjoXWfyr+S4CAHySa2ULx/K6kkCx1+Iu+DPE2HiLhGhpk0VorFOv1jJ3CdK21Hzb31
         LANhF/7/XXcxa6Hz/HyLpMgocSS6pKh66qmK68UGK0AHzxr+2CXJ+h/maFMOHpOF3Din
         cbhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqMbcr74YqEg0xbYE2QilaM5WKwLIVcyN/rgT0MId2HZJ2I/VU/KZq97djVcemfIcmYJzIq1bw4PCxjvA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEjsQjHihyJeTytw/I0RxbVlWwR/uN9aytz1Knt6hE3L37nHaH
	StVtWr/tWXlhAbjVnyzJDQzBpcsQf8R3Xt2gygVm5ETRxHVz1TplTGGT
X-Gm-Gg: AYBFou2FVvFq9fv9SkhA0qUPe1zdMSWlg7L81yAJZLyQgit+5R3lHCZ/WNY1KQMQNyR
	1v+iqt+8QE71ii6vIyqr1saQCZT/g7/ic8moTIv2/h5GN5OEQVAI1K0nOr5psX2BsKddyrSeB70
	Ewdtikfw/L6obMCpdxXLysSK525ZC37LDV2z4hy51OXf7sOfy8e2uHGcdbIsUhgn83ERetegT3h
	zhEV7oG3gmDaBvISfkH2zf/AO9RceZ5Bi2ucF9Xre120t414I2HSGWFU9j4ETaIw+s3Q1uYV/Z4
	ss5kFKwO1wJwI60FH0+xGrCpE7sMIDrUUeyUT2+D+ZVG//g/IY1o44tTgUfdyO0cAMxtINy4npz
	ogs5J7orCGxvy7HmSDy+aQ+Ib9RC+918CA12d5AxABRQA/RfxFW75Amj52E0B6r0b9ConLMEvPw
	crijnJ/9npUqNCgrel5oZGGlK7jI517htDfwNg6hWDtXRYaQq/53umR81i9xUtxHRkBK3Oq9fsM
	1yBsjD8bzu5szpEsKa/HiVGvP+KmEJdO7bFbA6kJp0N4vpgrZ0=
X-Received: by 2002:a05:600c:8184:b0:49f:ffd0:4039 with SMTP id 5b1f17b1804b1-4a18e4f2221mr303055495e9.32.1792007601487;
        Wed, 14 Oct 2026 12:53:21 -0700 (PDT)
Received: from home-desktop (dynamic-002-214-008-050.2.214.pool.telefonica.de. [2.214.8.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm16638485e9.1.2026.10.14.12.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 12:53:21 -0700 (PDT)
Date: Wed, 14 Oct 2026 21:53:18 +0200
From: Abhin Parekadan Jose <abhinjoses@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
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
Message-ID: <as_drl4kYXmgOfRn@home-desktop>
References: <20260929070714.169412-1-abhinjoses@gmail.com>
 <asxz0Xvv5jO9gAol@home-desktop>
 <537679fc-8aea-472f-a7af-b15bd3cf27fd@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <537679fc-8aea-472f-a7af-b15bd3cf27fd@collabora.com>

On Wed, Oct 14, 2026 at 01:16:57AM +0300, Dmitry Osipenko wrote:
> On 10/12/26 08:44, Abhin Parekadan Jose wrote:
> > Gentle ping on this fix for the syzbot report.
> > 
> > Dmitry, Gerd, do you have a preference between moving mutex_destroy()
> > to virtio_gpu_release() (this patch) and using drmm_mutex_init()? I can
> > send a v2 with the other option if you prefer it.
> > 
> > Thanks,
> > Abhin
> > 
> > On Tue, Sep 29, 2026 at 07:07:14AM +0000, Abhin Parekadan Jose wrote:
> >> virtio_gpu_deinit() calls mutex_destroy() on obj_restore_lock, but
> >> deinit runs from virtio_gpu_remove() at unbind or PCI remove, and GEM
> >> objects can outlive that. An open /dev/fb0 keeps the fbdev buffer
> >> alive, and the fbdev DRM client holds a drm_device reference. When the
> >> fd is finally closed, the buffer is freed and takes the destroyed lock:
> >>
> >>   fb_release()
> >>     drm_fbdev_shmem_fb_destroy()
> >>       drm_client_buffer_delete()
> >>         virtio_gpu_free_object()
> >>           virtio_gpu_remove_from_restore_list()
> >>             mutex_lock(&vgdev->obj_restore_lock)
> >>
> >>   DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> >>   WARNING: kernel/locking/mutex.c:625 at __mutex_lock+0xf2c/0x12ec
> >>
> >> virtio_gpu_deinit() should only do hardware teardown in this case
> >> related virtio, its queues and others. Software state that GEM callbacks
> >> still use belongs in virtio_gpu_release(), which runs on the final
> >> drm_dev_put().
> >>
> >> There are two equivalent ways to tie the mutex lifetime to the
> >> drm_device:
> >>
> >>  1) Move mutex_destroy() from virtio_gpu_deinit() to the end of
> >>     virtio_gpu_release(). This is what this patch does. It is the
> >>     smallest change and keeps the teardown next to the rest of the
> >>     final-put software cleanup.
> >>
> >>  2) Initialise the lock with drmm_mutex_init() (checking its return
> >>     value) and drop mutex_destroy() from virtio_gpu_deinit(), so DRM's
> >>     managed release destroys it. This also covers the virtio_gpu_init()
> >>     error path, where release returns early because dev_private is
> >>     NULL. Skipping mutex_destroy() there is harmless, since it only
> >>     matters for mutex debugging.
> >>
> >> Either fix removes the WARN. Option 1 is sent as the smaller change,
> >> and option 2 can be done instead if preferred.
> >>
> >> Reproduced on arm64 QEMU (-device virtio-gpu-pci) with DEBUG_MUTEXES
> >> and PROVE_LOCKING: open /dev/fb0, write 1 to
> >> /sys/bus/pci/devices/0000:00:01.0/remove, then close the fd. With this
> >> patch the WARN is gone, and rebinding brings back /dev/fb0 and
> >> /dev/dri/card0.
> >>
> >> Fixes: 54a970048296 ("drm/virtio: Add support for saving and restoring virtio_gpu_objects")
> >> Reported-by: syzbot+3590d97d8a586fa955c2@syzkaller.appspotmail.com
> >> Closes: https://syzkaller.appspot.com/bug?extid=3590d97d8a586fa955c2
> >> Assisted-by: LLM
> >> Signed-off-by: Abhin Parekadan Jose <abhinjoses@gmail.com>
> >> ---
> >>  drivers/gpu/drm/virtio/virtgpu_kms.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> >> index 1d4d3bf46a20..0ec755c35050 100644
> >> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> >> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> >> @@ -354,7 +354,6 @@ void virtio_gpu_deinit(struct drm_device *dev)
> >>  	virtio_reset_device(vgdev->vdev);
> >>  	virtio_gpu_reclaim_vbufs(vgdev);
> >>  	vgdev->vdev->config->del_vqs(vgdev->vdev);
> >> -	mutex_destroy(&vgdev->obj_restore_lock);
> >>  }
> >>  
> >>  void virtio_gpu_release(struct drm_device *dev)
> >> @@ -370,6 +369,8 @@ void virtio_gpu_release(struct drm_device *dev)
> >>  
> >>  	if (vgdev->has_host_visible)
> >>  		drm_mm_takedown(&vgdev->host_visible_mm);
> >> +
> >> +	mutex_destroy(&vgdev->obj_restore_lock);
> >>  }
> >>  
> >>  int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
> Calling virtio_gpu_deinit() from virtio_gpu_release() might be a better
> option

Wouldn't that end up freeing the virtqueues twice, or using them after
they are freed? virtio_gpu_deinit() would then run from both the
virtio_gpu_remove() path and the virtio_gpu_release() path.
or do you mean removing it from virtio_gpu_remove() and calling it only
from virtio_gpu_release()?
This is only from a high-level look so far. I'll look into it more
closely and get back to you.

> 
> -- 
> Best regards,
> Dmitry
