Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573234;
	b=qbaTmLlq4ikU0XF3NMSi6w0IqHaOCvOpUFf01BCMOmzQqxv9ld+dGLyS3JbugeJvgusJ
	 RNrZaHvJ2lcZDtpMdfAg49xmswKza8Iype8y8zern4gIpXitlP219jk3Xa5gP0GHoQ7Df
	 ZsBszE5PRTo+ghMQ0IYePTFp72uFfmXZ5NISurTjBDDbseQr7k39hA7wcPdGrbr3QEZJ9
	 +TQMZaVhPgzaeFDN9r6Idaui+D+A4ifgcnS8gOWET3utb5J5n/nVR8HDI49o8eVB6kRhl
	 qMXtMaONBqD37LPNEyxGR4qTBqTdE5NPdkBOaFihJX40NUNofg0Y/+A2QcC+j2+XUEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573234;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=31GXLHRGzEmf7ucrd38cvnTMt23b9j7ABg/sUlx/25o=;
	b=Ls1SZfcPIMMSjV2KqFgJdYhOZRDZKNuNJk4cszrD2nJk0+KakFK6/nKu8KS30hUKPhLo
	 Tedtp60tqmZ8K3v6kapAzQXM+j7fkn5uHLVQRpj/6Oi0NU12OUn69ix4J3wBXFUVoh+5x
	 YCHpx9jDs5xyxEdV1ajMkLyT7ufBybOt3g6XL6gqjyYeS27+1mdoUn9Kzl9E8mAUxzlOJ
	 vzu9XYcN1rTlKqMo32KRz0J5XogsQPzY3P5NV/uvfwXaeNPNJvR1dcGi9gErI0eFMWjLk
	 aSDrCPHuouXB0RgiKAtVwdbkpYwOuvIweUA/0G+5mI3kZIdWi7g/ktzZ2TzjbFH8zdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Vt3O0fBO;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D54A606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D54A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Vt3O0fBO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792573232;
	bh=H7p27qBaRykO9J3UirR+NcOdu3gZupUcmj4LzIbI0bw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Vt3O0fBOSKzdcw6L55tdnAvijLkm6sDLPZ8EgtMMXPf3cQZGdwOdEqczFHmXpgaI7
	 iY7IFiXju/qhTmMqfBUluCZYQwc5xhkY9MbbWTCtUsy44vVYab3hixtK9u1K4v9egP
	 rJbXzUOCLUQbOVKEBEU+yhDVb7kKXXNAcDqNizlLDzOa8y8C+Ag1Y+sMWDt6oK0qCz
	 d4FGCTIQJBTZH1nmJgIqpbHz6I90GP/YVR46nZLzgqmX8iQRqmnwKEUNwBDWYR/yOK
	 fvMM0GJk3xNvQv8tT3e9RQD3v/n0dQ7ZswRN88Cjfufl6k6jVAvLh0eajtcsz4ZHM6
	 qDZJN/TC3vEzA==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DDD6017E053E;
	Wed, 21 Oct 2026 11:00:31 +0200 (CEST)
Date: Wed, 21 Oct 2026 11:00:27 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/12] drm/panthor: Bump version to expose protm
 feature
Message-ID: <20261021110027.68da72b7@fedora-21.home>
In-Reply-To: <20261012125940.3291951-13-ketil.johnsen@arm.com>
References: <20261012125940.3291951-1-ketil.johnsen@arm.com>
	<20261012125940.3291951-13-ketil.johnsen@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 14:59:40 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> Bumps version to expose previously added:
> - DRM_IOCTL_PANTHOR_PROTM_INIT ioctl
> - DRM_PANTHOR_DEV_QUERY_PROTM_INFO query
> - drm_panthor_group_create::protected_suspend_bo_handle
> 
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
> ---
> 
> v4:
> - First version of this change as a separate commit
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index cc1c050ea3806..2da7bdb9a6bef 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1801,6 +1801,9 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>   * - 1.8 - extends DEV_QUERY_TIMESTAMP_INFO with flags
>   * - 1.9 - adds DRM_PANTHOR_DEV_QUERY_MMU_INFO query
>   *       - adds DRM_PANTHOR_VM_BIND_OP_MAP_SPARSE flag
> + * - 1.10 - adds DRM_IOCTL_PANTHOR_PROTM_INIT ioctl
> + *        - adds DRM_PANTHOR_DEV_QUERY_PROTM_INFO query
> + *        - adds drm_panthor_group_create::protected_suspend_bo_handle
>   */
>  static const struct drm_driver panthor_drm_driver = {
>  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> @@ -1814,7 +1817,7 @@ static const struct drm_driver panthor_drm_driver = {
>  	.name = "panthor",
>  	.desc = "Panthor DRM driver",
>  	.major = 1,
> -	.minor = 9,
> +	.minor = 10,
>  
>  	.gem_prime_import_sg_table = panthor_gem_prime_import_sg_table,
>  	.gem_prime_import = panthor_gem_prime_import,

