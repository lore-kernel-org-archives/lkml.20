Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D9B4C10DD;
	Wed, 30 Sep 2026 15:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782977; cv=none; b=tvEkNB3iuaI6bnrulvX+0mrx74XBVvllUvyIllazkvq7qGOVa+rBSvotahBJBo+7W0Rgp/kSPssF9PbxrL7MJwX59Y6cXU0MG20ZpHAZmDNlt3mhbTWsiSSbaRICx84gVUdPBDk/nRpZCXJN2fYteoJG+0+Denb3OnIlnt4tvB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782977; c=relaxed/simple;
	bh=X+MS5SRZwgMqqOOLs6CQlGLCMoIYnACDuOXrQeMDXC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzMEUGdtlBz6mHc+WBFEe0tCbz8x/ibebotUQcSkREPNfaQN5C2kbJkkV/JtMX28+680CQA+tbPgqivWqJyZi9M4vuY6KEMbhOJjjgMtgLSszbYnxHEP/+uCj8S02dlwZkUhIb3yPFMk2iF0IlGluF3myiuImxWM6JJUdIjCm2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FA0Un4in; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FA0Un4in"
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C53C3593;
	Wed, 30 Sep 2026 17:40:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790782858;
	bh=X+MS5SRZwgMqqOOLs6CQlGLCMoIYnACDuOXrQeMDXC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FA0Un4inhbFbu6GOt8x7le4ULXIDAkkKBYNnGAP2PMBO0+F7Viq4F9qsQaYe9/f7d
	 LqZqCHAtz2qLmkqswTzJekY3uKuqJH62Zo9WgMSTJv6TmW3JmTjewosHK5CwtHBQen
	 4mDC6sYuW7YTl+9LH2Rogta5fp7M9cMJY6eG0fAM=
Date: Wed, 30 Sep 2026 17:42:47 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: fail power-on when safe stop times out
Message-ID: <ar0t2x3M-4-CNOU0@zed>
References: <20260830134609.9886-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260830134609.9886-1-pengpeng@iscas.ac.cn>

Hello Pengpeng

On Sun, Aug 30, 2026 at 09:46:09PM +0800, Pengpeng Hou wrote:
> The power-on path requests safe stop to establish a non-streaming state but
> ignores the polling result and publishes runtime resume success.
>
> Power the block back off and propagate a safe-stop timeout.
>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")

I'll add
Cc: stable@vger.kernel.org

> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index f28e9f4354aca..288fba4831808 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -730,8 +730,13 @@ static int __mali_c55_power_on(struct mali_c55 *mali_c55)
>  	/* Set safe stop to ensure we're in a non-streaming state */
>  	mali_c55_write(mali_c55, MALI_C55_REG_INPUT_MODE_REQUEST,
>  		       MALI_C55_INPUT_SAFE_STOP);
> -	readl_poll_timeout(mali_c55->base + MALI_C55_REG_MODE_STATUS,
> -			   val, !val, 10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
> +	ret = readl_poll_timeout(mali_c55->base + MALI_C55_REG_MODE_STATUS,
> +				 val, !val, 10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
> +	if (ret) {
> +		dev_err(mali_c55->dev, "safe stop timed out\n");
> +		__mali_c55_power_off(mali_c55);
> +		return ret;
> +	}
>
>  	return 0;
>  }
>
> base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
> --
> 2.50.1
>
>
