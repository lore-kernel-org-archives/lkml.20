Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E6F4BA1EF;
	Mon, 28 Sep 2026 12:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597320; cv=none; b=FrxtPzNcN9ItNDCcGbJ2njWB+KXEPUlDORbO27YWxMeJFjRa1eXd4f0/oDcnEt4Hhgnawd3qSjrpbZJ9G9wTAU/cJGGkOwPrwgs4O3gG9XXV2q4PjwXcB0ekKcRf8MZPCegyhr/Jf+84ziA1CGJKXSyNco2LkfEZCp9fRuUBjY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597320; c=relaxed/simple;
	bh=YKy20Vcd0/wOZherZOCV70tKzD+KK7kaNe/Yz498EMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gd8lj969N7ddfpKt1daI4sag/8+ruF4mWlWWGkzIYDISn9jF8W+bhX31SIo24mhuE0X4YLJ1b2tNELdoULfD5qdNCkUU7lpbcIuT4d/8NZE5wxA9/h+wiCH83lhBBCxJbKPEHZsF7e5BXg42QY6Z+K9dn+vSLlkrbykORcWBtGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vRG7vXf6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vRG7vXf6"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C2965E;
	Mon, 28 Sep 2026 14:06:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790597206;
	bh=YKy20Vcd0/wOZherZOCV70tKzD+KK7kaNe/Yz498EMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vRG7vXf6yLznyMKI4sDbj5LJncCJWUxPmIoZpg4AGSE1n7HIFMty8EKuisNSLGOZ6
	 2GWo8ha5Nu/wO+RXtotf9HgLef0f/2UAYvRVM5t6+zkFnguyxkPCD4v/qDM1r6u2Fm
	 avbboscISlhi1j9FysKokFb+1sPb54HDPXm53vUI=
Date: Mon, 28 Sep 2026 15:08:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Edwin Gatier <edwin.gatier@protonmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v3 1/5] media: uvcvideo: uvc_warn should warn not info
Message-ID: <20260928120835.GC4406@killaraus.ideasonboard.com>
References: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
 <20260911-uvc-version-v3-1-604328d8a0dd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911-uvc-version-v3-1-604328d8a0dd@chromium.org>

On Fri, Sep 11, 2026 at 01:22:25PM +0000, Ricardo Ribalda wrote:
> Now the uvc_warn_once macro triggers a info message. Use the correct
> level.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvcvideo.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b6bcee4a222f..a80406f20beb 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -685,7 +685,7 @@ do {									\
>  #define uvc_warn_once(_dev, warn, fmt, ...)				\
>  do {									\
>  	if (!test_and_set_bit(warn, &(_dev)->warnings))			\
> -		dev_info(&(_dev)->intf->dev, fmt, ##__VA_ARGS__);	\
> +		dev_warn(&(_dev)->intf->dev, fmt, ##__VA_ARGS__);	\

uvc_warn_once() is used to report UVC non-compliance, KERN_WARN makes
sense.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  } while (0)
>  
>  /* --------------------------------------------------------------------------
> 

-- 
Regards,

Laurent Pinchart
