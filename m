Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6002037DAAE
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993440; cv=none; b=RdRzLLsh1lQawAIFhLEJUjuJoKk/xc+MhhKBvM4Yz+IE/Bc6AR0HhjHEEHAMv25TZhUnp06OF9vKZOQZ6aOfPIWRfj4E9wfujP7kz+8Kd9UEh+7snRl7+RsiOLoh7dKNe2LaOzGl2f4t1PGVsmzmgAV0shqyAflnGwuUg7M0BAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993440; c=relaxed/simple;
	bh=tms9HLbn8I7pFVxbnZ7zROcqVKYVzS65ADGUXGMatKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cmuu/VrseLSU8bKyoc/XPRHQoaYtsFVe5JGrydOgQ6T6VL93l1oas5zYznV7hpFJfzVEAOYI6wsmn95oja9R2GX7ACwW6d8TlRf2FRvV1s1Q+PjO1oBfHKSlp/qYj4535j7GyzxNooJbUAYU7cWZVPbpe2cEO2eCbU2cjwEGMkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nWB4pAZM; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nWB4pAZM"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EDC114BF;
	Wed, 14 Oct 2026 08:57:15 -0700 (PDT)
Received: from [10.57.57.120] (unknown [10.57.57.120])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A35993F7B4;
	Wed, 14 Oct 2026 08:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791993438; bh=tms9HLbn8I7pFVxbnZ7zROcqVKYVzS65ADGUXGMatKk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nWB4pAZM4vTLFwe4u9hyhLMYnRQwZRQlq4tXnFRaR93w3XnobClu7mpqbcL1DLAVP
	 5XiU6DqN3r41HLlTc45y+w8SFDwp/iEspmbVApXIU6i1Zax+7yAp2eQ/HXWrrwEoB8
	 poN7z76xirucaHUrjD+YCNgArcm5SAgvHDhSyjhg=
Message-ID: <193c0b24-5b75-4a77-9736-4bb5345a2d1e@arm.com>
Date: Wed, 14 Oct 2026 16:57:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: fix immortalis condition
To: Erik Faye-Lund <erik.faye-lund@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261014070902.169273-1-erik.faye-lund@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20261014070902.169273-1-erik.faye-lund@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/10/2026 08:09, Erik Faye-Lund wrote:
> Exactly 10 cores is also valid for an Immortalis configuration,
> according to the public documentation:
> 
> https://support.arm.com/compute-ip/immortalis-g715
> 
> So let's report this G715 with 10 cores as Immortalis as well, as long
> as it supports the ray-intersection feature. This matches what we do for
> more recent GPUs as well.
> 
> Fixes: 3b1dc21d6d80 ("drm/panthor: Add support for Mali-Gx15 family of GPUs")
> Signed-off-by: Erik Faye-Lund <erik.faye-lund@arm.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

I'll push this to drm-misc-fixes.

Thanks,
Steve

> ---
> Changes since v1:
> - Fixed typo in subject.
> - Added missing SoB line.
> - Applied Reviewed-by tags.
> 
>  drivers/gpu/drm/panthor/panthor_hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index 7e315708ca7c..ea1e222ef121 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -136,7 +136,7 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
>  	case GPU_PROD_ID_MAKE(10, 7):
>  		return "Mali-G610";
>  	case GPU_PROD_ID_MAKE(11, 2):
> -		if (shader_core_count > 10 && ray_intersection)
> +		if (shader_core_count >= 10 && ray_intersection)
>  			return "Mali-G715-Immortalis";
>  		else if (shader_core_count >= 7)
>  			return "Mali-G715";

