Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659AA33A014
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789928422; cv=pass; b=qkQ7mUF6jtGnoVw7Jq1ztf7PDVJ8g89YXlL1t3X+8cQqr0k82VlP0LoGLJodjkgKp0MBKrbRsjLbTp83cDofMxHBRpxcQ44/7va+CUPLVetNW0gvkzHJq+xBxibP5dm4SWOflZl/ygS0SCL8OsgajqSPYTGd/5sXLzaNDPE46XU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789928422; c=relaxed/simple;
	bh=JfHYjYIRSXIZvQJQONzPvnsUhSj8vSIn5obRVD/LgV0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=b3tkynYmuq4w7DEugIfFj4zDmlmnqz1FnGBk2B1//KdgTRpvdutLLPB3DI47ZtX57mJP6K8JeEDiVTRIsJ7FRmQmqcMnmWywRFEX+4qTnfpLYFnisIO5ulhT2yQkq/CL2lvHnHRDXkmcMn+AOzSgCsW/XiOavkE0KkKWGQD+cAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=RVFFmfsi; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="RVFFmfsi"
ARC-Seal: i=1; a=rsa-sha256; t=1789928411; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RXeBJUrTjtPaDoaZu5nEGqyiZEW/yNlfT3GS7o5WhLt3cC41xS2Liv7/R8oWxM3bde9QWVca+ukiVJmAbDSZ5pHlfFEzAYyDDnnCgWjbVewGjd9V9lq1mLoZoLyv6zaOrWQr8rNM0R56NYEXd/7CDseJXZnHw7sMlmtx9YCjBT4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789928411; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WEohC9uGVeqfSdvTyVPRW3Wthtrhe9pXJk1AMrsyYPU=; 
	b=YkJ2T+/NtgUgtlJ9aqQq37r68FgiW/0/S5pE7lhy1mOL1K0u7m41nnrkGnnoxh6Qffhis2FMpkm5/eaOxdkNJGADC+3wQpOtokKREoaOaeffKY+Xlq0o5Gr5WxU8lPJ/eGSBIIARtF9xQHWMesaHVBh66WiAXZMqCq64Gf+PDGs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789928411;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WEohC9uGVeqfSdvTyVPRW3Wthtrhe9pXJk1AMrsyYPU=;
	b=RVFFmfsid5NTHsMIuqazzu+mnOl1gH1inHNGBoL1zTCqwy2zJZqFXl0I36F41yg+
	n2m5N/m6r5ucYlh3R3O86h61skAVmQQWaDfJrH44mDRtZjIccAx7BqqFag5GgPFqyEx
	RYgxGN3DYJL7HAYOzHnHMdvK64MjChhwr5tC60+E=
Received: by smtp.zohomail.com with SMTPS id 1789928410326934.5711448765459;
	Sun, 20 Sep 2026 11:20:10 -0700 (PDT)
Message-ID: <1803e07b-63d9-45f7-80d7-f52980c3b321@collabora.com>
Date: Sun, 20 Sep 2026 21:20:06 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Revert "drm/virtio: Allow importing prime buffers when
 3D is enabled"
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Val Packett <val@invisiblethingslab.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, Yiwei Zhang <zzyiwei@gmail.com>
References: <20260911144204.2089401-1-dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20260911144204.2089401-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 9/11/26 17:42, Dmitry Osipenko wrote:
> Guest userspace may import udmabuf to vrend. Vrend doesn't support guest
> blobs, and thus, further 3d operations with the imported blob are failing.
> Typical scenario of the problem shown with mouse cursor RGBA image imported
> into virtio-gpu, which previously was rejected by virtio-gpu driver.
> Revert enabling guest blobs importing into vrend to fix the regression.
> 
> Link: https://gitlab.freedesktop.org/virgl/virglrenderer/-/work_items/674
> Fixes: df4dc947c46b ("drm/virtio: Allow importing prime buffers when 3D is enabled")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index 149e6bcb5878..ebf471044d06 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -349,7 +349,7 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
>  		}
>  	}
>  
> -	if (!vgdev->has_resource_blob)
> +	if (!vgdev->has_resource_blob || vgdev->has_virgl_3d)
>  		return drm_gem_prime_import(dev, buf);
>  
>  	bo = kzalloc_obj(*bo);

Applied to misc-fixes

-- 
Best regards,
Dmitry
