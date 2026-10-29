Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264397;
	b=aKnK8p5XO9vSj6mmPeqhzv6HzSypJlOcEarYej+vizCpkp3/ygOZXQ1UlwkClSHp/6O2
	 8s0Mhszxm+vG0wKMSKkIJY7Gb6eB/Xsvs5hBeBsL0NHSrgtx9VjZNUGVg40baifMah/mY
	 d3KbMtqU+NAXM9O/8Q4SMXWEcOZdrBRnmSb4O3skGOm5SauLEGwE+vmtdcrUpOxS91H0i
	 tph9rBXE5q7YXDMIrwpP3GlJCpZ0PsbZ9E56zAGqMu0JIe0s3rpWhupb/plnZLsUZnlWU
	 QCsxy95dIXxpbzCeOk8fupnaGlb3M7pf2+0f/SlB43dpzG+BHAmiVH8DeWwh17H552g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264397;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=MfZsiPR9z6Giv1Nay+HsSdw6MpOIDutAzqAQVq0AcZo=;
	b=E5ZwyQhoi1/F0ta1erBgUE8c1fPcQY482F0W++aeshIvuGJaUtXZ5rq0zgS0+efqOll7
	 67wvHhouK8IKEnZfXtzS408WGILiLWAnfzgq56raIWhc8Yhw6l1BMnaOBtNAkCaPC/uoq
	 K7uJnRvubNQtIm+v7bmoa+Yrf8+QGcCHGJFtvoRXdOHy0OHGn5fl8+vdlS1ygDhVwFIQZ
	 U4xPiFQNlGzb0lYvcs+WchqkeJIOnl2PLx0/4x5sHExFst0jPY4N1d8yOoyOnT+/PAvH5
	 vbMjn4uJx0bb/0rypjCn+Hsk/JOS5FHxuwdJABTm36SbwWQ8gQaaT+F+VAje1Y7hmtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nLIWCviT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB56606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nLIWCviT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFE41F01825;
	Thu, 29 Oct 2026 08:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793264396;
	bh=MfZsiPR9z6Giv1Nay+HsSdw6MpOIDutAzqAQVq0AcZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nLIWCviT4VYVZ40Is/cPJ+WahIS91fZhzRCp4zqICNJjUSc/5rocLhfPknIOHWbVY
	 sg6jT2MJX/F8VeK/rw+NsrdUNLdKOeXxBtUPmt41+nZ2wzrjmOxYI5dMHBaXhzqdR9
	 AnfeNlAo0NprTw/81wkVCYdjiS4CND2e9YGk8AX0=
Date: Thu, 29 Oct 2026 09:59:53 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5r2Y54Wc5p2t?= <panyuhang@hdu.edu.cn>
Cc: zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: Re: reject PRIME export without TTM backing
Message-ID: <2026102940-unlivable-cytoplast-352a@gregkh>
References: <ACEAWQCGLEhWF5vMItAIpqoW.1.1793262795047.Hmail.242270054@hdu.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ACEAWQCGLEhWF5vMItAIpqoW.1.1793262795047.Hmail.242270054@hdu.edu.cn>

On Thu, Oct 29, 2026 at 04:33:15PM +0800, 潘煜杭 wrote:
> Hello,
> 
> GPT-5 assisted with the initial analysis and drafting the proposed fix. I am
> responsible for this report and patch.
> 
> While fuzzing the vmwgfx PRIME import path, I observed a kernel NULL pointer
> dereference in vmw_gem_object_get_sg_table(). The userspace operation was
> DRM_IOCTL_PRIME_FD_TO_HANDLE. The call path was:
> 
>   __x64_sys_ioctl()
>     -> vmw_unlocked_ioctl()
>     -> vmw_generic_ioctl()
>     -> drm_ioctl()
>     -> drm_prime_fd_to_handle_ioctl()
>     -> vmw_prime_fd_to_handle()
>     -> drm_gem_prime_fd_to_handle()
>     -> drm_gem_prime_import_dev()
>     -> dma_buf_map_attachment()
>     -> drm_gem_map_dma_buf()
>     -> vmw_gem_object_get_sg_table()
> 
> The vmwgfx callback obtains the TTM buffer object and uses bo->ttm as the
> embedded dma_ttm member of struct vmw_ttm_tt. In the crashing path, bo->ttm
> was NULL. container_of() consequently produced a NULL-based vmw_ttm_tt
> pointer, and reading vmw_tt->vsgt.sgt faulted at offset 0x88:
> 
>   BUG: kernel NULL pointer dereference, address: 0000000000000088
>   RIP: 0010:vmw_gem_object_get_sg_table+0x2f/0xa0
>   RBP: 0000000000000000
>   CR2: 0000000000000088
> 
> The faulting instruction reads from [RBP + 0x88]; with RBP equal to zero,
> this matches the reported address. The callback requires a vmwgfx TTM
> translation table, so it must reject an object without bo->ttm before
> container_of() and member access. This patch returns -EINVAL in that case.
> 
> The patch below is against the Linux 7.3 source tree; it
> applies cleanly and passes checkpatch.pl --strict.
> 
> Assisted-by: OpenAI Codex (GPT-5)
> Signed-off-by: Yuhang Pan <242270054@hdu.edu.cn>

No Fixes: or cc: stable tags?

thanks,

greg k-h
