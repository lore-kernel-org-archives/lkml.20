Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E9629AAEA
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929965; cv=pass; b=uxc0h1jJaORq7WLu+CIjc2998su3ly0TVg1f7boTVf5+B0wRqyChZQOO1rH7V31bfhHqYz6iOClHlNBd9sP5jTpD6GiJAfo3tTTiptMd0rpk29pj86pnOtr511yPriBGZf35382tNJoeQjxB3jUAW4H9gyrtiYKqPlIrBcOF59E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929965; c=relaxed/simple;
	bh=F6Y+MLDM+JXL8rqq6czB9z3rR0ghazSWPr88YnvLbZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NOBiOdteMX7viF4vzqPksP6lmjPKbLgOgp5GLcy5/SUvzd3UUIPi5VwHKLFEKW7r+UPNV3tzVS3TVsjXZ+N8Yjrcg2St+YTSG0uzxBurYyng1j0OSNPgVzFqUU4M3doUF6/LK2tfg3k8s37xamKt8uCyGdnNa5vchIsluR7gpQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=CleB2wtH; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="CleB2wtH"
ARC-Seal: i=1; a=rsa-sha256; t=1789929947; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NRs2clTLgJnqv+/Ul8ZlDdkM2YQwTKjanW2Z6g+UY3Nmegewgmbwhle+m7yOaDO/h3z1LuhfYj+4GE/ggx4O5X7dXOkDXmo7qPgOOnKORz1Ode4W/1aOy0GTRcSbP6hImDE/R2lLbccAEfQr85kzcVPukT8vD1//K5Fzpo8GkVc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789929947; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zWAkdkaXr2A8v4MHHNCbpflBVmDpPextgR9D9yVTBlA=; 
	b=lo+uGESDs0YOWH+CtTG9gGDtS2Elz5zstTgD+Ji4VQWc6fL3RnM5QWsPE2znZj0IJthqyrmHIwvmhfFPInkdRYuy4TxYHaIyBcKtRYvOoBCCYauVYu5g/yhKeTPxl5KbGoKMC8DqMwpQeA7KkGv+KI8w2ZzTGZJxjPt3MUOoPfY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789929947;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=zWAkdkaXr2A8v4MHHNCbpflBVmDpPextgR9D9yVTBlA=;
	b=CleB2wtHYGBVkkhtyX1yMBOcy9SuQdaervBmSOSujVZluJ6RzxSYIldJJwStOpHP
	MHhRR4IiXROJ3GomeabF/YvLO+ETFE7QvUS9BNaza1CIWXXigT/5oDPYtkLApJNZpR8
	Lwmx6in06nKSy1HW6lRZYkvO6+IytdzI1cm4IIpc=
Received: by smtp.zohomail.com with SMTPS id 1789929945502743.9803323265289;
	Sun, 20 Sep 2026 11:45:45 -0700 (PDT)
Message-ID: <aff09e71-e105-44c4-845b-90f33bfe26b6@collabora.com>
Date: Sun, 20 Sep 2026 21:45:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: fix 0-byte blob ZERO_SIZE_PTR, GEM leak, and
 context_init rollback
To: Hui Peng <benquike@gmail.com>, airlied@redhat.com, kraxel@redhat.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com, tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260919215232.3470178-1-benquike@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260919215232.3470178-1-benquike@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 9/20/26 00:52, Hui Peng wrote:
> Fix multiple issues in virtio-gpu VRAM mapping, blob creation, and context
> initialization:
> 
> 1. In virtio_gpu_vram_mmap(), set vram->map_state = STATE_ERR if deferred
>    virtio_gpu_vram_map() fails so callers do not treat an unmapped VRAM
>    node as valid.
> 2. In verify_blob(), reject rc_blob->size == 0 or size values that wrap
>    PAGE_ALIGN() to prevent kvmalloc_array(0, ...) from returning
>    ZERO_SIZE_PTR.
> 3. In virtio_gpu_gem_create(), virtio_gpu_resource_create_ioctl(), and
>    virtio_gpu_resource_create_blob_ioctl(), use drm_gem_object_put()
>    instead of drm_gem_object_release() on error so the BO's free callback
>    is properly invoked.
> 4. In virtio_gpu_context_init_ioctl(), stage context parameters into local
>    variables and only commit them to vfpriv after all parameters and
>    ring_idx_mask have been validated.
> 
> Fixes: 16845c5d5409 ("drm/virtio: implement blob resources: implement vram object")
> Fixes: 85c83ea915ed ("drm/virtio: implement context init: allocate an array of fence contexts")
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---

Please split this patch to have one fix per one patch and make a v2. The
same for your other patch.

-- 
Best regards,
Dmitry
