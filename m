Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D91C53A89C;
	Tue, 29 Sep 2026 15:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694036; cv=none; b=pBJfG0p97z0+vlu1j4PA9/WHfdQfXWCT2NLSPsz5AaozPQt4NduyGFefrHXtZ7XhN1FCk5r4ZvkTsFU69ftCBb8c02nbbuIw18yY6ncLFXmOAHoFQTuJRsB7t5gp5XcWjhTfOENyKxEQOk09eN4IF72turj7i89Ev7zp/MMw01M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694036; c=relaxed/simple;
	bh=t7O5J7BJnqCUlF1V/YlR7pUDqz3A6TPOQ+YNgmxF9cY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gqOd9vxjUHQOTUutdFCSt9R5sJNbqQ3hQfjw8iLzC9tSazdPPpHZF1gqeSNObsDyKI++RfsH4EzCBSzZe4h+NR8HhB7JN2CA1szfsTnkzTcNNmyBtWTdoF5RYFHnTwbNytAvfpsGExqL34nP8Rh5n0pXNgvSeJueLFmxSn0KK58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bC8XXsKW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bC8XXsKW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71BF11F000FF;
	Tue, 29 Sep 2026 15:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790694017;
	bh=R8tjJDCC85fQXo5tcD4aFsaYmpKcF1rwIaZnUiV7ALs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bC8XXsKWNInh+AQYb99cG6flJ9PCoij3MNTn6cRpzCy07vM+gfsCvjapJp7TXAVPI
	 Gjr3DeYowmyxw1tjqsbZUjgQ4I4yUevD7kxecWs0qGJBAlUdGmgK1/5LEs7JuPdSOd
	 G+HA55kneWeV4hJYMgdFBdlMNHadeTKAIzjjpG5awRp8zCFtjyuJ18GVNVz+xz1JB6
	 S/WfNRVZ5ythr4nNTibYAo54BSFSIMuG9eM64CLF2iNt1OficoUNTtgGttw34tKNLO
	 TZivcX9mF0/z/A4XCq1Zk77sYVnXsmYIKkC62jg/rVZ+/wT3mc5w55X8SyLatJ895c
	 Vgd8nOhInjDFQ==
Message-ID: <6845a928-3a62-4500-a6a8-ac34fa9c1680@kernel.org>
Date: Tue, 29 Sep 2026 17:00:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Add quirk for Luxvisions RGB Camera
 (30c9:0122)
To: Kean Ren <rh_king@163.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20260903081145.8382-1-rh_king@163.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260903081145.8382-1-rh_king@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3-Sep-26 10:11, Kean Ren wrote:
> The device binds cleanly but delivers no image data; USB autosuspend is
> suspending the streaming endpoint. Disable autosuspend for it.
> 
> Issue found on Lenovo ThinkPad X13 (codename Zelda, Intel); confirmed
> working with this quirk.
> 
> Tested-by: Kean Ren <rh_king@163.com>
> Signed-off-by: Kean Ren <rh_king@163.com>

Thank you for your patch.

I have merged this into:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/for-next/

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index e289cc71ba98..32bf353013a1 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3216,6 +3216,15 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +	/* Luxvisions Innotech Integrated RGB Camera (Lenovo laptops) */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x30c9,
> +	  .idProduct		= 0x0122,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
>  	/* Intel Realsense D435i depth camera */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
> --
> 2.40.0

