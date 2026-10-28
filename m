Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202678;
	b=Jap+6bgHNsfvswVdZ8niY/oRoZB2I/rK0Mxx7A206IU0evn/W+ooRKqAkIt78VqJQ7mk
	 Sp7nWiwMehBw0mAB/wtpWJbxqgZ4kCpYk/cuUDpGo8VzjSFqCEHaBUOxN6i2dR3djmHac
	 gh380dLBM7VVm42zL5HCC46yp43F18f7U5XPEj9mNreM2NDYIjC+FmqajMKTSDVmRfZ6C
	 pjEONuBchiE4TVASgpWwyFWl/wezwqUxlBi2eShZxnq3Vojr9r67b13eMwRPlJdhCmFkk
	 WZmH3PXJa+H/Zuk3G6lOWjDGpdIGOTnPpSZs1JUGaduM+D/eWl7bJiQYknFH3ZuVYOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202678;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=mMPK9qYI50Gun6EbAuhVfvIshMIUGWAEDh+aFNRMKIE=;
	b=hZ2U1UxvKBur7rGlLcVuV0hHE/Kk3qzbhGAR74atLiyFCjzV3/ZOyVvenTeRWcSIXK85
	 DeuZEoVj6pKwu93fGDFKIa5LUVZ9aTJSRECyJksaJMDn3JLDgRUyy9bB5oqdyIw4eELsL
	 13pRXH36K5pitvavCg69bZnoGQFxM1DhUs2ZZ0I78ok93Rd5gokEN5m3HmQZ5vRYTwiZ0
	 Tn+seapL/9uW6QlmilWBwBlnUaDBNrijXVc0mQHTEqvfRSvCrnrbq+wyJPilSkLuhPZzx
	 fY2gUwlS+jdm99CSfEchMDznwXGcSoNxpIhEVIm+g384WK5x3EaJfGfiX/O501P2/Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DOfnPtvh;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C07606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4C07606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DOfnPtvh
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5975175D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:51:12 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A5BC73F673
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793202675; bh=QHIk/uWzcHH5EhNGbfwfN7gO5R91eIxjJbKUe2LX8Uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DOfnPtvhrgcbGGM6pONSlcqpnzw08ucqeSZ0DNgKxtMWKUUGn4HUz692AnmycCPdM
	 BNvq18ArkCcwbnFwFqnMmLC/wJjCbBXmTZI8hg77Nqrf87ii2jzpyJ7a8WWZcwAdAC
	 SCFnJ4S6l/f6b4tX2x8PXA/G1yesjzREVsRAXptA=
Date: Wed, 28 Oct 2026 15:51:10 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>, linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v1 01/27] drm/panthor: Ignore -EOPNOTSUPP for
 shader-present nvmem lookup
Message-ID: <auIZ7rtnOPVXnFHw@e142607>
References: <20260922204535.2850094-1-karunika.choo@arm.com>
 <20260922204535.2850094-2-karunika.choo@arm.com>
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
In-Reply-To: <20260922204535.2850094-2-karunika.choo@arm.com>

On Tue, Sep 22, 2026 at 09:44:55PM +0100, Karunika Choo wrote:
> When CONFIG_NVMEM is disabled, reading the optional "shader-present"
> nvmem cell can return -EOPNOTSUPP.
> 
> Treat this the same as the cell being absent so panthor can continue
> probing on platforms that do not provide shader-present fuses through
> nvmem.
> 
> Fixes: c40b50c3cfbe ("drm/panthor: Implement reading shader_present from nvmem")
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

I will probably pick some fixes from this series and apply them regardless.

Best regards,
Liviu

> ---
> v1:
> - Picked up R-bs from Boris and Steve
> - Added Fixes tag
> 
>  drivers/gpu/drm/panthor/panthor_hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index 7e315708ca7ca..4c96573b649a1 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -182,7 +182,7 @@ static int overload_shader_present(struct panthor_device *ptdev)
>  					      &contents);
>  	if (!ret)
>  		ptdev->gpu_info.shader_present = contents;
> -	else if (ret == -ENOENT)
> +	else if (ret == -ENOENT || ret == -EOPNOTSUPP)
>  		return 0;
>  	else
>  		return dev_err_probe(ptdev->base.dev, ret,
> --
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
