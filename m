Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC0C3CBE8F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792340263; cv=none; b=IOIR/+dDCa0mSfan0KJUfWk3VViUXv2SiWE+Kp0ZYy7G4L5b/DjSg7u8/oUAydOUMw73UpdrEmCqUcvn0UIr275mGFFet2haMO1LUDKEGWykUgD8AJQR/AFFQt9W1xgITO36JbJqgf+N7eEmvU/MvqOs78iYeOfd0tGuT/oDTP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792340263; c=relaxed/simple;
	bh=TOGRDFbFCs4Kw4XD0aiILNVJEpyYivpLcrVbrqcEghk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ltYcRXP0jJxZ2pQY7L2+JOdexS/xF47yDOFJXLiHLCNw0ZjKl2oPFhf6Eb4DsM5jMK6EPIDRjYbmmTulxb5x+oMLX1FvAwVSRQOGvmaGOBsmis77FlcnbD/E2LDqIm833e5WyD/XWy1RsTKvrmmqC2sve6NXnczyY2D/xel6XiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPZ3grpg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPZ3grpg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1df146015so5529905e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792340260; x=1792945060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZTfsVeABUBSFy3HVBXCMegGi7+UD9ADpc6dIspx0V50=;
        b=CPZ3grpg4VEzFvrFjS+LW5+YkOuCn74UzHHUInlgGPwfJde8bBzI2LvZQDk9W79xKu
         IQW+wCBBCQ34zqxx+VDgwqG8yXRFOTGkpR8aNZldYuro3QN94qKNgBJSwJ8Pnp+nnsZm
         I+RxI74hsCWGqWoB2/BPgY+G1C2qnmMDN9HO0DeGhAW3K8dskfQ5DUerdldvU4MdE+7E
         j9NZAngjwXSEpvNTTBxIGUPUOCmk04PUPr+Gz36NM5KYapZMKL/njrNigtVifsfIabXj
         ZtXxtbgZTH7+x7tI+3ijqFk2z504I9mQLMRp7iFq0VNjhm2mZVLAbpJR1uTJ9W4XxiTb
         pRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792340260; x=1792945060;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZTfsVeABUBSFy3HVBXCMegGi7+UD9ADpc6dIspx0V50=;
        b=Fun5+HeIEETEhLlnTpcE7GgaL6iSQecUZpjjZdd938+GZLwwQDtR34Ci/3vZkJVq8B
         k6MHytGxwXttr6J/8Re4fkH/hoK7RVYr31kSk4Yxv2wsubXPuIfWs0wOgciXVfLNhvhY
         EUwd3Ob8zMCYpBJqWEzq0fNltUU+EoJUAlDMhhk6G39HyuveGz9sR5EDDI7/xjJ5Kgl8
         NqbaTqVqG2or+j/kx8ZvLd4XJsnmRVX69cPDitWgQDRyKMKOAnMO5mCpJZ7bZEHnbzXA
         ZeG/KZ9/JWJCa7bwZCCuudYdMrY8HcJlLfy2sYRGYWj6q6TWLa9ylk7NHGhMoeGLLIxf
         qGQA==
X-Forwarded-Encrypted: i=1; AKwUvBz1nCscOI97NPk8IXBh+szgV4HcgDH8Z9WraHiCr2tvn53ll1ktJq0fX8tF/e3LUutpg/aY+vuSrzkUDpI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzlRS0MyGZMcP8FPwem6pmPls52ufESJVKvtvUcfzchpdyrGw2
	3Mu7HaHZhgkb44aq56J1JXmzFQqM5xX+d4KETzl1xwvvMfKsConf5MOw
X-Gm-Gg: AYBFou0T3zYXqbvl85FhNMi71ctN0cSrP4z57ehadgQoXr1d0LgPeyuFcxUyZOu948u
	AOkni4gk9hlGf+H/1BPCXvt4qwBZC5+1pjGptiJuhIUQSl6CtYP47+EQyuc0JDhSlwb/bJejwSb
	QUhUBszMhhffr3FHYkyt/AFOJgnE3XyytYaH2vfShK2gvpIEpvWXmkmLdTv2LXwiCPIM/RQOjzj
	/kAl8LA+448ja+iV9FvuceWJXUAS9SLpG48J+dqAdkSQKcDmicU/NVp+z0fUezY9DpgIh7h8aii
	dFJ6to4qN+3M62lAmpRxQCHSJaG18AqwtPRt3SD/vjEEfGKT0cuNOlQxkDtOFh5VOK8XNJrFNHg
	g6H60ZnQHQi9nyXHsEDK+h4GlcMxCXkaVlxyqbMVnYEgSJJJlmNI954q1dmEu85XMpKuGLnttFw
	amJJlPksyuIheg0sscILvJV2kfKzlliNHQEXFNV7GAnzGCRDFjlSfMP7kaJlLDZ0hVSR8JEYOC9
	aBAp+SBPVRR4iO1Qpe72QA0MM4WBXz5sGMlisYnmtCCJowDmRqXjnZdfqfefEY=
X-Received: by 2002:a05:600c:1f86:b0:4a1:93fd:8f8 with SMTP id 5b1f17b1804b1-4a1d75ab363mr119735965e9.4.1792340260358;
        Sun, 18 Oct 2026 09:17:40 -0700 (PDT)
Received: from home-desktop (dynamic-002-214-000-206.2.214.pool.telefonica.de. [2.214.0.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df164777sm119463445e9.5.2026.10.18.09.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:17:39 -0700 (PDT)
Date: Sun, 18 Oct 2026 18:17:37 +0200
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
Message-ID: <atTxIeLq1VspA70F@home-desktop>
References: <20260929070714.169412-1-abhinjoses@gmail.com>
 <asxz0Xvv5jO9gAol@home-desktop>
 <537679fc-8aea-472f-a7af-b15bd3cf27fd@collabora.com>
 <as_drl4kYXmgOfRn@home-desktop>
 <8e193dd9-4ceb-4bd0-a28f-f4af084b73e8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e193dd9-4ceb-4bd0-a28f-f4af084b73e8@collabora.com>

On Thu, Oct 15, 2026 at 12:03:32AM +0300, Dmitry Osipenko wrote:
> On 10/14/26 22:53, Abhin Parekadan Jose wrote:
> > On Wed, Oct 14, 2026 at 01:16:57AM +0300, Dmitry Osipenko wrote:
> >> On 10/12/26 08:44, Abhin Parekadan Jose wrote:
> >>> Gentle ping on this fix for the syzbot report.
> >>>
> >>> Dmitry, Gerd, do you have a preference between moving mutex_destroy()
> >>> to virtio_gpu_release() (this patch) and using drmm_mutex_init()? I can
> >>> send a v2 with the other option if you prefer it.
> >>>
> >>> Thanks,
> >>> Abhin
> >>>
> >>> On Tue, Sep 29, 2026 at 07:07:14AM +0000, Abhin Parekadan Jose wrote:
> >> Calling virtio_gpu_deinit() from virtio_gpu_release() might be a better
> >> option
> > 
> > Wouldn't that end up freeing the virtqueues twice, or using them after
> > they are freed? virtio_gpu_deinit() would then run from both the
> > virtio_gpu_remove() path and the virtio_gpu_release() path.
> > or do you mean removing it from virtio_gpu_remove() and calling it only
> > from virtio_gpu_release()?
> > This is only from a high-level look so far. I'll look into it more
> > closely and get back to you.
> 
> Remove from virtio_gpu_remove() and call only from virtio_gpu_release().

I tried this out and here are my findings.

That would undo b1df3a2b24a9 ("drm/virtio: add drm_driver.release
callback."), which split virtio_gpu_deinit() on purpose: "move the drm
shutdown and release to virtio_gpu_release() ... use
drm_dev_{enter,exit,unplug} to avoid touching hardware after device
removal". That matches what the documentation asks for. drm_dev_unplug()
exists so the device can be unplugged "while there are still open users
of @dev", and Documentation/gpu/drm-uapi.rst (Device Hot-Unplug) says
the DRM instance is torn down only after userspace has closed all
descriptors and mmaps. Meanwhile the virtio side has to be gone when
->remove() returns: the example in
Documentation/driver-api/virtio/writing_virtio_drivers.rst resets the
device and deletes the vqs in remove(), and virtio_dev_remove() warns
("Driver should have reset device") if the driver did not.

So the virtio teardown (reset, flushing the vq workers, del_vqs) has to
stay in remove(), and everything that open files and GEM objects can
still reach has to wait for release(). I tried moving the deinit call
into release() to be sure: the virtio core warns that the device was
not reset and that the vq MSI vectors are still allocated at PCI
removal, and the deferred reset then runs on a virtio_device that
virtio_pci_remove() already freed (KASAN use-after-free in
virtio_reset_device()). It only makes things more complicated.

obj_restore_lock is on the wrong side of that split. It is only used
from GEM paths (the ->free callbacks via
virtio_gpu_remove_from_restore_list(), object creation, and the PM
freeze/restore ops), and the free callbacks can run after unplug, like
the vbuf cache and host_visible_mm that release() already handles. So
the mutex belongs in virtio_gpu_release(), which is what this patch
does.

It only looks like the mutex_destroy(...) landed in the wrong function
virtio_gpu_deinit() instead of virtio_gpu_release() in 54a970048296.

Is there something I am missing in the framework, or have I understood
it wrong?

Regards,
Abhin
