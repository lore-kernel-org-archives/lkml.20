Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CD24A92DF;
	Mon, 28 Sep 2026 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595203; cv=none; b=SheTuhxdAg4VGPBv/YYu2jqQ0EK6MuwZLlr5vhnTd8KYUVKFNgRgCVejqA7Rmch0LZqe6iQRuYVu2EJxisRYX8O8PMozVu555EoAFgcdUI/4N2fLHHsqEsE95AlbrHpwGwzSoWWWgUpqJjctAS4Lj4wzLxrhk86onFQes1QT4j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595203; c=relaxed/simple;
	bh=v/PlDSqTFONWylnxTRDwCMzFJYe24WF91onEl0USYc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XfWdxXiuCDtd81Py2HA/Odz22y0mHzcKldTAuUCcLpDuNJWbzuj66i1OdQmW9BPoxXvk+bugMYcx5vnULFiEpv/jDHYMRuFceYAg0/T8GTckQdcPT24qtVTczffykHNbsDxrSZgLlZAl1wj5Hp7R7bCx2IZovEobxJkZnDsZWzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvqzSNxG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvqzSNxG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08FF91F000FF;
	Mon, 28 Sep 2026 11:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790595202;
	bh=MEn2qOFsUitkYJQilaVJgyMN2FnlykwebahY3dRB+B4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JvqzSNxGJwtWtuIDki8UTCKrxrFWAAqRHKz07+scX8scMJ4yEPSAKDj9s6TetnlMj
	 YjFjiom/mup+haINQtfE2XdNu4qe8itQwUSbc7DuYk8cejZi1rrpk8iW/M+sONMVKp
	 yzdNQSJc/5/t6d8osOBN/lyZUZ5R4LLWE/63xZrlypCQ+Fn0NoL0abXrIerokawnQa
	 Uu0wGgpNThUj8Qrzu9NoH1nLYEmJvNz1eQjcoXp2Gi3etdOnGn7N4iOCNjtXKh9Bhx
	 6RGY/UQ9vijAj9a3tUJsLRKgC7JJWsCNRUUzwbtbdjqf3q7ac/mhcEYC/bOMnXWsh1
	 sZvn8+HwXcNww==
Message-ID: <5ad6b296-a336-457b-bcbd-31680c79c6d2@kernel.org>
Date: Mon, 28 Sep 2026 13:33:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] media: uvcvideo: Do not parse bmVideoStandards
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
 <20260911-uvc-version-v3-4-604328d8a0dd@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260911-uvc-version-v3-4-604328d8a0dd@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Sep-26 15:22, Ricardo Ribalda wrote:
> bmVideoStandards is write only, so there is no need to parse it.
> 
> Remove it.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
>  drivers/media/usb/uvc/uvc_driver.c | 7 -------
>  drivers/media/usb/uvc/uvcvideo.h   | 1 -
>  2 files changed, 8 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index ca75f8d1ec46..adec9d1aa653 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1187,13 +1187,6 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		unit->processing.bmControls = (u8 *)unit + sizeof(*unit);
>  		memcpy(unit->processing.bmControls, &buffer[8], n);
>  
> -		/*
> -		 * We are not using bmVideoStandards, so there is no need to
> -		 * warn the user if it is missing.
> -		 */
> -		if (dev->uvc_version >= 0x0110 && buflen >= (n + 10))
> -			unit->processing.bmVideoStandards = buffer[9+n];
> -
>  		uvc_entity_set_name(dev, unit, "Processing", buffer[8+n]);
>  
>  		list_add_tail(&unit->list, &dev->entities);
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 8d99e857a69f..65f232de7821 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -228,7 +228,6 @@ struct uvc_entity {
>  			u16 wMaxMultiplier;
>  			u8  bControlSize;
>  			u8  *bmControls;
> -			u8  bmVideoStandards;
>  		} processing;
>  
>  		struct {
> 

