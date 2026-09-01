Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A92047DD50;
	Tue,  1 Sep 2026 09:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255650; cv=none; b=uE7XqxOxOlgfXR3ACWYbMiytI38f9ovZniVmtIfhY5JdEmIHbgwoqGlgO907NhCxyzF2gcQ5gNwVFTAEjzfVVJXTOGXeZfpMMc7G78rd7u0ND6Yb6ZByINKlWPrtEeP51WDBFP5uAaC9pDtOfwIwFGlucepRDhdF7ZL/+89S+6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255650; c=relaxed/simple;
	bh=u8zg0kxXO5dNcshMD/1vHepH7WIKo3/XSNJN88jaGg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWQt3WSf17cn/R8DNsQ7/mWRFWSQ+hAvCoiTIhPfIZJxWxrik1VkkFbHHuOHqfz0PWW81koOVVEZG0KaMONNH0lRD6B99kibWYfbppX/R/cbA/uK/EhB01xBcOMoG16ZPUUaYGT71GiniJmfng4RLw1S7jOdibvYzHsNxTJnpO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e3HiFpI+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e3HiFpI+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1746A1F000E9;
	Tue,  1 Sep 2026 09:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788255639;
	bh=SsNgKLbJLb9DwPD9hkfdr6aYypQHtyGtr4Bb4ouAYKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e3HiFpI+Yu6DFwGPpNzz81xBw0iRGkU0Y3akZQ/5ye9c1DrL0ztgjhkx6AKsyKcJM
	 APvcSqdz1oaYgI3YWVoPIVh9qliEyXPc4ofqGUZ4Mq17Addg/DtmhG99WqgfHvBdg3
	 Z45diSo+CLy+YGFfs1c+Vn8+0CVjux7DueoE1QWw=
Date: Tue, 1 Sep 2026 11:40:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lucas Jeffrey <luquijeffrey@gmail.com>
Cc: florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vc04_services: preserve bcm2835_audio_write
 errors
Message-ID: <2026090127-unafraid-vantage-966f@gregkh>
References: <20260803040928.12453-1-luquijeffrey@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803040928.12453-1-luquijeffrey@gmail.com>

On Mon, Aug 03, 2026 at 01:09:28AM -0300, Lucas Jeffrey wrote:
> When sending audio data in multiple packets, a successful later packet
> could overwrite an earlier failure in status. This caused the function
> to report success even if one packet was not queued.
> 
> Stop sending packets after the first failure to preserve the error.
> 
> Signed-off-by: Lucas Jeffrey <luquijeffrey@gmail.com>
> ---
>  drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
> index 3156cb8392f4..5ac23cfa7983 100644
> --- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
> +++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
> @@ -365,6 +365,9 @@ int bcm2835_audio_write(struct bcm2835_alsa_stream *alsa_stream,
>  
>  			status = vchiq_queue_kernel_message(vchiq_instance,
>  							    instance->service_handle, src, bytes);
> +			if (status)
> +				break;
> +
>  			src += bytes;
>  			count -= bytes;
>  		}
> -- 
> 2.43.0
> 
> 

Was this tested on the real hardware?

thanks,

greg k-h
