Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CA449D599;
	Mon, 28 Sep 2026 11:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593673; cv=none; b=EIGDlg0Yw2pD+FGipDPhHgYgumpUr0jgT3O/BDdY2EFTODaJBCBn5ZLpVfYKh7XIMwm1Id6rb7vFNvofb+89dmfwUT3NJaol8IC4ZyvQrH//IauN4tuNUwi0Gz9nt3JhLm3MPy87mjgBsHbgoVHElLQcRytX0uYEipttypwvUlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593673; c=relaxed/simple;
	bh=m4PvMK4VX+MB11j/RiADDYFsg5+ujGw27t+5xqE4HE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+9WbEZMF18Qf+JgYmHYtdl6Rl/HyT4e3dfr0CmFC5EN2QikyM8ZoKJ67eOfDoz+pBG51lWPT/dKPcKQLh9qNwUDCLQD1HmlmpDTwHXU/t+jyPAavBle4cwx1BoTnwjlsPLrbb6Kt5mdI19+NNm2dseCiDetLYYnmxNKVisgi9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3PN2tjU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3PN2tjU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946191F000FF;
	Mon, 28 Sep 2026 11:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790593672;
	bh=sOdi9BIe63bL4YsD6CCNKfOhB89ulcYkBh5GOtw2ICo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=N3PN2tjUgmXqQNNpjYnaOtMeqUcQTsNt1qS8gtTqZy/GTfyVTd/72voLKedjy5DHK
	 yzk2aIQO4kIVxK2bzYc1OofFKLmQG7ES0hIu4XZ3Wx8zTLnKDBQPRgKB5NW07auwsR
	 e9c7rLyv6hLgBenqqKuQiOOdDLQWTkFpiVSHOTA5m8QXpjT51SEuYtpjpsMUdKp7ii
	 h3X+vwLH+dOJx6nAFzSnio3YqN9wYIBBtOJ3amOxieXAOHY+/8+NjmZPxWagLzzjUc
	 At/ZpbotLKWDnX6MWMGqrSy/l2+LjXwnFFpIIl7loyGMBRwrJlGOgbaG7lC1TEOOBF
	 thDsaL31inhqQ==
Message-ID: <71daf215-8c8c-4bfe-831d-68ce9f9cbfd4@kernel.org>
Date: Mon, 28 Sep 2026 13:07:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] media: uvcvideo: Use uvc_warn_once when it make
 sense
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
 <20260911-uvc-version-v3-2-604328d8a0dd@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260911-uvc-version-v3-2-604328d8a0dd@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Sep-26 15:22, Ricardo Ribalda wrote:
> If there are multiple cameras in the system affected by a compliance
> error now we only show an error message for one of them.
> 
> Use uvc_warn_once() to print an error message per device.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_video.c | 2 +-
>  drivers/media/usb/uvc/uvcvideo.h  | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index fc3536a4399f..2a3b7431cc68 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -95,7 +95,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	 */
>  	if (ret > 0 && query != UVC_GET_INFO) {
>  		memset(data + ret, 0, size - ret);
> -		dev_warn_once(&dev->intf->dev,
> +		uvc_warn_once(dev, UVC_WARN_QUERY_CTRL,
>  			      "UVC non compliance: %s control %u on unit %u returned %d bytes when we expected %u.\n",
>  			      uvc_query_name(query), cs, unit, ret, size);
>  		return 0;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index a80406f20beb..abcafd929c9e 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -661,6 +661,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
>  #define UVC_WARN_MINMAX		0
>  #define UVC_WARN_PROBE_DEF	1
>  #define UVC_WARN_XU_GET_RES	2
> +#define UVC_WARN_QUERY_CTRL	3
>  
>  extern unsigned int uvc_clock_param;
>  extern unsigned int uvc_no_drop_param;
> 

