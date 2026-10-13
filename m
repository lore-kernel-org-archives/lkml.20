Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342003FB07B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884633; cv=none; b=pdFVnwI0El+94xngoUvrbbbo3O3B8Jzq2XcWMRuuPLLYt5+lG33XhyR3er1jZTM8syTw107UUrClVsRR8HNAvg0wTNMM65VDmuynRZE2FcuLBibIYKru5bSp1E7ri1k+676A1qfBRv9+bo9NzBxB6o5q7IOMkceYHmtBpE97BJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884633; c=relaxed/simple;
	bh=NvpLVMdJax3SN0J99Py6TeKJe6+SZcjABcJxWLxyEhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPP5QgmpdauYiE/jkBtkOb0jWFq2SJqrE8IEJTaDH6/iwyzsod/n0YuXUSfoc8utRaKupm6/r5ASVitNRfEsi0pEmmp6ec0ORLZSGg3sm+Q5IZ5YY8UISlOrP0KkRbTjI/NReyDVdXLilUoueL9D4N+ng4IjxucAUH8sLcHPdyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=sYE7b5yT; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="sYE7b5yT"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10498169E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:43:48 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 293B63F7B4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791884631; bh=NvpLVMdJax3SN0J99Py6TeKJe6+SZcjABcJxWLxyEhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sYE7b5yTWm60eObw0Rll+G3c6QA7i+Xbh3lqyqnnsa9892TfbIrR4Y4t2LLHU9QPr
	 eF/sLpR9qdlb87erOo2ugGjsVvLDLNO+CgnktTXWbWU5X8telUzbc2ArTpbz8DcEPN
	 yTOteTA9QIPSMIZa5xASDwsLa5e5WZizP1SUVdKM=
Date: Tue, 13 Oct 2026 10:43:38 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Erik Faye-Lund <erik.faye-lund@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Karunika Choo <karunika.choo@arm.com>,
	Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] odrm/panthor: fix immortalis condition
Message-ID: <as39SlIbaPfwfsUJ@e142607>
References: <20261013093150.4186117-1-erik.faye-lund@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261013093150.4186117-1-erik.faye-lund@arm.com>

On Tue, Oct 13, 2026 at 11:31:50AM +0200, Erik Faye-Lund wrote:
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

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
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
> -- 
> 2.47.3
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
