Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811089;
	b=ggIwF0DjPjNN8AT3RrFEIjFSVIzuHQXRIf+3sR+Bf5mFnE3JLK9m+Dp/tlf2DqcBeIMT
	 qXXmlN2acHRcHdPv9Kw2xV4l3v87qg1BxkhbeVQoWVE1p0pgdW5l2ce41qi/B8FRP0TZ/
	 LZ15xLMkanAEDv74un5iJkMGxyzPUVbbuSkxSQuhMhbB25ohfou3/eSZtNYKsfbF1/oYf
	 45Quq5bSNbjupy7XB7OMT/fXddOm+MtMqaVyGPUvqC4O5YVH89uKHXbfBs/W7OLOWhMTB
	 QI8WgJGTLOvLoeu9G0f0GOpX8R2qLtMf380FBg41dALqLhEprskx3HV2aBDeRZ3XS9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811089;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=sTAKxGq+Vne0P8mLmH8/G81XiJGWwd8N4+AkXGBpCAY=;
	b=4S/fEwc+qfl+FSRAT7F4+RE3WXFs64+Gku6xQRdgc2jh46BfPRTNH8rtab7Yj559Ik44
	 HXFc/EwxQ8p/6O0P1zmQYJOY3diJ0A180mlufkwkAcX1W/IgpvfxZ02X9aUNb1UFMpGHI
	 W+4JFOcO+Nr8hWm993gpVT+vaVHnxYn6MTOa1erc+jhOsNzv0Lln8b2P46FyKuv9MxLyx
	 GS/3xYV604ebjNSzuHIxNhztLVB43qbgVUgPe0Vp7IkLJnaveK2nuCVgzu6+U6CFR+I8U
	 d1r1M5mZPpfnRRWtjFRCrjrNDU1t5eU/pys4ode4osJrl8atAgmL6sC630baAfsDZxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="Z/e2E/kb";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02ED606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C02ED606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Z/e2E/kb
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CED81BB2;
	Wed,  4 Nov 2026 08:51:25 -0800 (PST)
Received: from [10.57.59.2] (unknown [10.57.59.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 206463F632;
	Wed,  4 Nov 2026 08:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793811088; bh=Lh7rDkvouK/vuqSyInprWh4+ip8k75YEg2GCpLVMSR0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z/e2E/kbvH8rD82LZ27OkDjGmeFEObgHYyFGg5USS+L1JFhcAjFec7AH5gnic7XwY
	 L/NL8ozwFwAKVxvCIlmc01QETyl5NRVP4ywB6ZDuZ/X0ZqCOzSUpZpLUTFCJquK6/R
	 cybc2Hl88uXmosAHfq/MgXC0DQt7HGuMVHZt5V20=
Message-ID: <731e4ce0-91df-4b50-8834-d8c9e0fc43a3@arm.com>
Date: Wed, 4 Nov 2026 16:51:25 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/panfrost: Fix race when restoring reset state
 in perfcnt
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261103-panfrost-reset-races-fixes-v2-0-454207b1d4e3@collabora.com>
 <20261103-panfrost-reset-races-fixes-v2-2-454207b1d4e3@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20261103-panfrost-reset-races-fixes-v2-2-454207b1d4e3@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/11/2026 20:36, Adrián Larumbe wrote:
> struct panfrost_perfcnt::state should always be updated atomically, both
> in the dump ioctl and the reset sequence.
> 
> Fixes: 9944dd07f3cf ("drm/panfrost: Fix races between perfcnt and reset sequence")
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> index b26da057a1a0..d50b6cc2ecfa 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> @@ -148,18 +148,17 @@ static int panfrost_perfcnt_dump_locked(struct panfrost_device *pfdev, u32 *stat
>  	 */
>  	ret = wait_for_completion_interruptible_timeout(&pfdev->perfcnt->dump_comp,
>  							msecs_to_jiffies(1000));
> -
>  	if (!ret)
>  		ret = -ETIMEDOUT;
>  
> -	/* We need to restore perfcnt state so the next successful dump can relay it to UM */
> -	if (ret < 0) {
> -		perfcnt->state |= *state;
> -		*state = 0;
> -		return ret;
> -	}
> -
>  	scoped_guard(rwsem_read, &pfdev->reset.lock) {
> +		/* Restore perfcnt state so the next successful dump can relay it to UM */
> +		if (ret < 0) {
> +			perfcnt->state |= *state;
> +			*state = 0;
> +			return ret;
> +		}
> +
>  		*state |= perfcnt->state;
>  
>  		/* UM must re-enable their session before requesting new dumps. */
> 

