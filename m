Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C5E418363
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736387; cv=none; b=TbOCnaiel39mznDtlt8tzOjf1YGQiQwU+UQPAY68JS0MO8BnAvxF5WOhmqHzHi+TEWY8Kd71UpC4DPQ9XLDs1iwMgI0amAU9AUcoUNu61VJdO9ABDiQi7IaDvgYzgSGVIgOgZql2rw56HCsnUjyySmPzGCAx7whWAGt3qfmY2oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736387; c=relaxed/simple;
	bh=s8+to8b6/VG7HeoYZ/5GPm0QwBM8JYFg2rpjNk6m82E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tXJW3dst3qq73E5zWTVLvx06t2hAzHCH45UipFu32BeQi6QgsqtlzuQkiY/y5Bj8rck9pKO2DRwQIbXfM4mZMRAHAmTZnxYFceMZLjLsNkmSLYYbeu0ZyUkQqUeXkb6BSDGb41TXHTgTeUAx4KcK5iq1MDVeJk37hO73nzS97fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j93l1hPV; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j93l1hPV"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so580696a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789736385; x=1790341185; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxzpoScGk5dDKPya4LxeNVRbV4selBUM8DEhCYq8QJg=;
        b=j93l1hPVM7eYnrT4DudiPGTclmMZQhiE7xtf5CB2uphMYEsQkRxxUNg7MTh3XHiFb1
         cHfklfs07nDTYl0cIDGgOaGflSyr7hTwyXjUEJj8coPkRmidlbAibceAv63FBcdcHwKB
         t0mq9Scsqw7GoSdwKOcDa51naH4DBMpfwYjpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789736385; x=1790341185;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nxzpoScGk5dDKPya4LxeNVRbV4selBUM8DEhCYq8QJg=;
        b=aqtgrO2UFPVkqPcHcbvdQBXlzJKA3eCD2qrm8BaB9XeWqbYOYXdMl8R+wbrSmeMfDf
         DVLOkIrsGQtPdH3u+DEQ0NuUNjbLFtEgMPbXrdfWxiGNZbIrlWonxzdNwXnNirYhbC4i
         xTFK518EwzSJWn2EdrsIb8iTh/OwD16PuO5NXm46coQRzzI7DzStA4UD5ExgESn4MeAm
         DhbrUPxxfpPEPCH2nT7HkTxMPL+PnSIe0D/6Wtdob5wPOimw6IERiSQVg9qzeLMmtPbA
         6I6L/KJcR/J6kRCTiMokDJq12DrDYvM3uE8nkezCjC8bB3GLQoBwMFFzEgc5Yy9J6kCT
         FQqA==
X-Forwarded-Encrypted: i=1; AKwUvBzDYIJsY/M3XyvFFr+fEOACBlkYjzdF8hm970AUvAwi3diqLBHDBLtkNh4aX2acw4t0MVZokmwsOksaydk=@vger.kernel.org
X-Gm-Message-State: AFuF++lkdIbBNYUNR6+yUofmmiZRWKzPMqDAox76+7Ihhotpah1MYeqh
	m54WYPXGu2G6vMaHqjWN0bM3eont4Cbe6+HZJHNxyKmh7ZAzCvS47689ogmjKAH+GOaz2pP4/1h
	wPQY=
X-Gm-Gg: AYBFou3bmoV2rjJooK8Q0tusejYRp8kJ60Zn2sr6+eBZEkSnO3xUrcDUuHsT0oVk73A
	Vx4mgt59gL3FtEY56LL3UmgbUPebT9Azm6n5Oge+ot1BQ3eLpevyKC/AZhhZxwdduwhoAIEgAzm
	3Lv7eknlt5B6QlPMYD/GflE0+u4re1JR75e2HQB42Cp6VymNFq39lr1QIMoEKgydqIHvhJoWDUe
	ctSy71lOkMxY2g2uJCzXHsxisMGQ/UH/loair4eXaqIrcmDCCAV8uvJ4L+ioNbrXN/1I/EJ3Y/s
	annC+0u/16Jn8mdph4e/8f9q0m0FYNI6FGyEwIUhG+jCt91asfVPCKZqJYN5k7cc9jRikUGJsG4
	v8aZExOde/DERc6a+VRRxvkwwJIzuDLK+pPH0GWmg+aSANNEUfzU/I2sTnJFePqRveyDuZPic8n
	IIWXeY/BzA1eIhw98EFe0/+Ir93m9Vt39GJ3BbkcG7FhvV7u+pkbzTQ3YnCBfY9QfarwfU7hSiw
	jTFfUXI3ZC1ZHt0HH0cPMkg7zXwfijMwBRN
X-Received: by 2002:a17:90b:2dc3:b0:39d:e9b6:cec9 with SMTP id 98e67ed59e1d1-39e54d36756mr9761730a91.7.1789736385408;
        Fri, 18 Sep 2026 05:59:45 -0700 (PDT)
Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com. [74.125.228.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e36116884sm10630143a91.6.2026.09.18.05.59.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 05:59:44 -0700 (PDT)
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc50bcf87b2so392591a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:59:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByc9oK7r2n1hig6PPhb98vBt8iFnKd4jQLFVWVr7FRvVWyILWMD8IE6w9was7bfrFd3ZDBbiiTe5UPhslk=@vger.kernel.org
X-Received: by 2002:a05:6a20:6a28:b0:3d3:adbf:7782 with SMTP id
 adf61e73a8af0-3dd8c41a46cmr4668333637.23.1789736383919; Fri, 18 Sep 2026
 05:59:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aq0siVcghDe6x9cs@stanley.mountain>
In-Reply-To: <aq0siVcghDe6x9cs@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 18 Sep 2026 14:59:29 +0200
X-Gmail-Original-Message-ID: <CANiDSCtiVU1PJh7=Pb56PNGF0s=cxfe1kVjwW+7O9JOT5CrDAw@mail.gmail.com>
X-Gm-Features: AcwNN1VZ_6ZbCrR1Mp4y7JmQBXOuD4YG-BKylmDeJzSZ3dkgiXG_e6jgcK3ZpuQ
Message-ID: <CANiDSCtiVU1PJh7=Pb56PNGF0s=cxfe1kVjwW+7O9JOT5CrDAw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix buffer overflow in uvc_mapping_get_menu_value()
To: Dan Carpenter <error27@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

I believe that for all the uses of uvc_mapping_get_menu_value we are
already doing bound checks:

index >= BITS_PER_TYPE(mapping->menu_mask) in uvc_query_v4l2_menu()
value> fls(mapping->menu_mask) -1 in uvc_ctrl_clamp()
BIT(i) <= mapping->menu_mask in uvc_menu_to_v4l2_menu()

In any case, I think this patch is still worthwhile. It will help us
avoiding bugs in the future (have you found this with a new test for
smatch?)
and if we go that way it is probably a good idea to also "fix"
uvc_mapping_get_menu_name()


On Fri, 18 Sept 2026 at 14:20, Dan Carpenter <error27@gmail.com> wrote:
>
> The "idx" value is a user controlled u32 so we have to bounds check it
> before calling test_bit() to avoid reading beyond the end of the bitmap.
Maybe change the commit message as well to avoid stable cherry picking
it blindly (sorry seems like I am more picky than usual  :) )

>
> Fixes: 4e15c535659b ("media: uvcvideo: Support any size for mapping get/set")
I believe this should be:
Fixes: 40140eda661e ("media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU")
or no Fixes at all.



> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 3ca108b83f1d..f157ed99be4e 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -538,7 +538,7 @@ static void uvc_mapping_set_s32(struct uvc_control_mapping *mapping,
>  static int uvc_mapping_get_menu_value(const struct uvc_control_mapping *mapping,
>                                       u32 idx)
>  {
> -       if (!test_bit(idx, &mapping->menu_mask))
> +       if (idx >= BITS_PER_LONG || !test_bit(idx, &mapping->menu_mask))
>                 return -EINVAL;

What about using BITS_PER_TYPE(mapping->menu_mask) to be consistent?

>
>         if (mapping->menu_mapping)
> --
> 2.53.0
>

with those changes:
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
-- 
Ricardo Ribalda
