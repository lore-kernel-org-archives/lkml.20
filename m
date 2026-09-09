Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B11B3D524C;
	Wed,  9 Sep 2026 07:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939782; cv=none; b=VP/Ibm7ROepd+2peuINanQwZdOEw9vslMyEynb5Jh5Yg1TBlepG2Z2UjG3klpQami3M0MYigjEJQWEPBnrekjnO4ftL9JXHj9HONi9nwg8H579KHHsbfx6xWGEzrZrzIFs9pcTuczKQvIrJsfAn6zWHn545sHhhG/d5mwOLo33Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939782; c=relaxed/simple;
	bh=RHDPYhIXnzkM9VdxKfp3iQzXkEWXHIHTMcQ8tuaamK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAX8nD3QQuSjPhkvYqDLSEK94dvaNULRVCOvuR9X6cDpShqxAPEduWiEALO9zsNlVXO1+9fEBofqEbIHyhtKK7tzpNQvhSQysRfpGstRJY1egietGLVKg8ppAaoabRlMntyRpuynl4ChEcctaOhzbzRMfyS7Cu++RhdSO7ytIPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j+AoZTsh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j+AoZTsh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C411F00A3A;
	Wed,  9 Sep 2026 07:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788939778;
	bh=BTABFxSSBfb8BQkSQbtZKa/mLs36mivw/IOYFe0V9zQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j+AoZTshQipn31vn/tFN+ebsN6Z7UCnNQUfpKFVUrWUB4W5AruR7CrsqUUBGC9G0Y
	 HS7S1y33PnQ3mpBD7B8xHaF2K5ohY8QGKju7YlQL/h2VlODFvFoqPnOB0WFfWK+FEo
	 K4ClRIXCq6HKvVhO3upDn+p1h4GTF6n5EC+x+7+0=
Date: Wed, 9 Sep 2026 09:42:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: camera: Fix function declaration
 alignment
Message-ID: <2026090928-playtime-carwash-eb07@gregkh>
References: <20260908171011.4122-1-tarun.k.lywait@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908171011.4122-1-tarun.k.lywait@gmail.com>

On Tue, Sep 08, 2026 at 10:40:11PM +0530, S Tarun Kumar Lywait wrote:
> Adhere to Linux kernel coding style. Reported by checkpatch:
> CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
> ---
>  drivers/staging/greybus/camera.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index 62b55bb28408..9853bd60ff27 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -263,9 +263,10 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
>   * Validate the stream configuration response verifying padding is correctly
>   * set and the returned number of streams is supported
>   */
> -static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
> -		struct gb_camera_configure_streams_response *resp,
> -		unsigned int nstreams)
> +static const int gb_camera_configure_streams_validate_response
> +	(struct gb_camera *gcam,

That does not look correct at all, what tool asked you to make this type
of change?

thanks,

greg k-h
