Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF36E470451;
	Wed, 30 Sep 2026 08:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757358; cv=none; b=Td+ZGV8QDizQKukw9W7Zfglj9QAwgjOVbXGrUSkmmUSqQHUoCGmqfXO57xMYpyPr6giciLpq86Dki2D8oN+sJRlKvEavEzPOzKAFaBp5myAh/XQCCflmLueIGKO47sEQ0dKwteqDrskIsXpHpw4ZQeVWb02H/lQOe0lTMTcYoCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757358; c=relaxed/simple;
	bh=SnWkcHeOaGP1ytXHTnP6hvRlHcFVdMsa2RSd9cPXu68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GoTWKgC4+mk4D4Cm5oq7fhjJHCsTravE2kM1xNkPl+/c1OxxLNFgYrpTU8CT4C5S0xOGluhFcg3o58Jv4EBMlDCn+TQ30TG6AMstD1GpzkGMUqBdXhEDuq4jcsZF4U36LF1xm88yJBw3gK2XglRj532Nd2JuTvGhQnK8t5u1ees=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tbo4jHyr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tbo4jHyr"
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 719041F10;
	Wed, 30 Sep 2026 10:33:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790757232;
	bh=SnWkcHeOaGP1ytXHTnP6hvRlHcFVdMsa2RSd9cPXu68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tbo4jHyrCF6RR7sAbTKas+CD/HOrAXRxlrMv+eVJsO6/d6BABSGSAMTp5gXhwRwbw
	 0v2TUy03JnxVtKnd5Vg6+qdl982YHADNFSUPe14ddYUhQa/7PW/kh3u7JzKFuAh3HF
	 8QMT/qc6HPs03yiXGcoZ2tI7NZEgmjL0xVrE9iq0=
Date: Wed, 30 Sep 2026 10:35:40 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: add padding to mali_c55_params_ccm
 structure
Message-ID: <arzI_vOl9OXmP9-N@zed>
References: <20260915202458.3673504-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915202458.3673504-1-arnd@kernel.org>

Hi Arnd

On Tue, Sep 15, 2026 at 10:24:48PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The newly added structure has extra padding on the on
> some architectures, which triggers a pedantic uapi check:
>
> ./usr/include/linux/media/arm/mali-c55-config.h:807:1: error: padding struct size to alignment boundary with 2 bytes [-Werror=padded]
>
> Add explicit padding here to avoid risking information leaks
> and incompatibilities between architectures.
>
> Fixes: bb401df68c06 ("media: mali-c55: Add support for CCM")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

The documentation of the newly added field is missing, triggering a
warning when building the documentation

https://gitlab.freedesktop.org/linux-media/users/patchwork/-/jobs/110343884
WARNING: ./include/uapi/linux/media/arm/mali-c55-config.h:803 struct member '__pad' not described in 'mali_c55_params_ccm'

I am about to send a PR collecting all mali-related changes, I can add

 * @__pad:	Padding bytes

To the documentation of struct mali_c55_params_ccm.

> ---
>  include/uapi/linux/media/arm/mali-c55-config.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
> index 84d8f3901405..9c922290e035 100644
> --- a/include/uapi/linux/media/arm/mali-c55-config.h
> +++ b/include/uapi/linux/media/arm/mali-c55-config.h
> @@ -804,6 +804,7 @@ struct mali_c55_params_ccm {
>  	__u16 coeffs[3][3];
>  	__u16 gains[3];
>  	__u16 offs[3];
> +	__u16 __pad;
>  };
>
>  /**
> --
> 2.53.0
>
>
