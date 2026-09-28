Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E79F415F08;
	Mon, 28 Sep 2026 11:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593647; cv=none; b=rhONYfp1ZPn+iZm94uf3Huwb5Az1xn+wHuIDKArH+coFjrD9W37YO6k/+c/NrrmBUjK3ZXUTQV4lbdw+8VQmtEQD0AFhIPC7qNVdQUDZr4+xAfGkB491TO3IwQqEKH8yK9rVlT4VKAbi+N0OYAsDllpa8S4YchHMnKqmkph/rGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593647; c=relaxed/simple;
	bh=7ZOJQo0OzFYO6lc9QkioEaYKtzT/9nimexVJhtOqKYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHhyOINgJVjRXY8CwhFDGi3Oa8FaZieAWBgttToIK8HofSUMSMZjmzmF2Xt1GsDNWBdg8kAjdIihCJKxYKwTKJhKQy8xkW8w2Ez9mO2tBltqUQ7KeeUb5zCUaaXdhDlTvfpHb9Uj8nqwRJ7wBdFkDucx4hUkpRdaqm5TNWumbp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DoWfBjbV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DoWfBjbV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7671F000FF;
	Mon, 28 Sep 2026 11:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790593645;
	bh=c+Uaig1eX8foFi17dm1l7a9Kf0okwb+pXHR7QHclYak=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DoWfBjbVPXjc6FE+nYyPefnDDv73IZioGDKFHpURowEQ55PHhuAuz/6JLad5ZwPxq
	 AQzCuUB3gND0d4O0e422NrWULlufDXdyZgY6BVAZj48ji5yVL28ThR92AWvv4Cce7o
	 qb8p9qvIWpNy417IdLDNxJ3UQT2NmSw4iBP79iA/HaHquuKRjVnE9Jn5nw5JT+gsOq
	 /05E1rThOGkyr8L7ZmYmHAAWIVTK0NquRCfMlUjRkkl8vkFc+b9uuKNJrZ19Jd+Vb/
	 SyCei3gm+mFEkIQJGpn7MaBK5YLf/hUZFvoY2dumu5pF9eTwhN1NrD6R0w9ZOJoB0a
	 3tKYmr5P+PN5w==
Message-ID: <85cc100b-d3c6-419d-80e2-f4e850ca2b7a@kernel.org>
Date: Mon, 28 Sep 2026 13:07:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] media: uvcvideo: uvc_warn should warn not info
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
 <20260911-uvc-version-v3-1-604328d8a0dd@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260911-uvc-version-v3-1-604328d8a0dd@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Sep-26 15:22, Ricardo Ribalda wrote:
> Now the uvc_warn_once macro triggers a info message. Use the correct
> level.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



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
>  } while (0)
>  
>  /* --------------------------------------------------------------------------
> 

