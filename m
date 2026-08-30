Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCEC1E51E0
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788076543; cv=none; b=NHTB96XRau3Hrv+szSgO7+Hn7B5n8LNGAPq/n+hAFPDiX28g3FtKuhh1WkU9OvSSKH6FyuPjY3Y20ziWcIjeAqi+/aEt8z/AGgb+hUqkru+W6NtxXC6ybWvwTofJnUS18SxQdG+NKVR7kuRxMGMR3UBlgVilbHzM9DXtqA3GxMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788076543; c=relaxed/simple;
	bh=qdgOvI9ZfoXBgad9Bu6vpvpaB75XjF0VCfNp3WoOhk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=aDqMG+h0qmozEz7MyszmIu4p+VzOs1LaIpP3ainUbTN62Swyn+wDcWkuHo2/2SW+Yi2hWqnuBexzF2bU5M5Kd76Cq9LEhjzCADhFUYrMU+Dyb9nUWTz+qx9WlFGfZ56UPQHRsa/Na3VfEaF7Cil2sMlOLGDGe3lnab3+tKDylhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b2f2b8d88fso4753697b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788076541; x=1788681341;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IyWKVtx2DmQgfl0T4AIbgWKHxP9LYOliY6XtyNUqPz8=;
        b=q81cH184j5vSzHvCw0G94hPkc5vfeNk6KPGYF8D6Et30wy6s6gJeDULXq1ghzvEekS
         ICgfn43si0JX67MDTCi9I5yduRx+cXXouDBOf1glwcN5JtCtAbLncrgYDtZIhcMxauAU
         gamDcYKrV/Z+lTO3gtn8B65YEDhsImk+FVYglrDoqrXYL+l5tL1BlB8BECn8TgB99S+X
         8zjWJLfpI2BHbw22PZ+Aakn5ucz+uw+0WYmyIun/FHz5IBV5O3VY+aGQ2VlNM8Rc+WWc
         hWGQGfFaooADdOIWqvFRp8l/44eaO2sCoGayTLvIuoJhv+zuFVPy5b3ErYjY/c5dF2zN
         suzw==
X-Forwarded-Encrypted: i=1; AHgh+Rrzt4k5M6YVxae6KDKeD12sOEQ6uhX1u3CKzkIGXQLtVtyVS4hr/PCb8CQo007cIzSiu/M00Y7ababy4vA=@vger.kernel.org
X-Gm-Message-State: AFuF++kPrujBvaJ+w77DNUk+20FQtGb5jHeLdFNPq9BU8uFKnZ/V1LBx
	Q4U3PeWIT5zFdl/vkc8UthYgMLr1QDobBw+XqFDY9ndaNHITGzuqDsQ0hWHD8Y7fOZYzty2LAK0
	aLahs20XiGWNusYvrO4AvhZsYYLUJigXoXwBSfgDNuZYZSsXuQcPOpYlx9hk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f52:b0:4b3:79ae:14a3 with SMTP id
 5614622812f47-4b397f557e3mr21183014b6e.3.1788076540856; Sun, 30 Aug 2026
 00:55:40 -0700 (PDT)
Date: Sun, 30 Aug 2026 00:55:40 -0700
In-Reply-To: <20260830075523.16233-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a93e1fc.1d9ded08.62e62.0117.GAE@google.com>
Subject: Re: [PATCH] media: vidtv: fix mutex use-after-destroy in vidtv_bridge_remove()
From: syzbot <syzbot+3157015c6bd85395cddc@syzkaller.appspotmail.com>
To: kartikey406@gmail.com
Cc: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

This crash does not have a reproducer. I cannot test it.

>
>
> mutex_destroy(&dvb->feed_lock) is called too early in
> vidtv_bridge_remove(), before dvb_dmxdev_release() and
> dvb_dmx_release(). Both of these can still trigger vidtv_stop_feed(),
> which locks feed_lock, causing DEBUG_LOCKS_WARN_ON(lock->magic !=
> lock) in __mutex_lock().
>
> Fix by moving mutex_destroy() to after dvb_dmxdev_release() and
> dvb_dmx_release() return, and by stopping any active streaming under
> feed_lock beforehand so a late vidtv_stop_feed() call sees
> dvb->streaming == false and returns early.
>
> Reported-by: syzbot+3157015c6bd85395cddc@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3157015c6bd85395cddc
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/media/test-drivers/vidtv/vidtv_bridge.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
> index fd69b4ee16f4..6bebf4617100 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
> @@ -548,7 +548,14 @@ static void vidtv_bridge_remove(struct platform_device *pdev)
>  	media_device_cleanup(&dvb->mdev);
>  #endif /* CONFIG_MEDIA_CONTROLLER_DVB */
>  
> -	mutex_destroy(&dvb->feed_lock);
> +	mutex_lock(&dvb->feed_lock);
> +	if (dvb->streaming) {
> +		dvb->streaming = false;
> +		vidtv_mux_stop_thread(dvb->mux);
> +		vidtv_mux_destroy(dvb->mux);
> +		dvb->mux = NULL;
> +	}
> +	mutex_unlock(&dvb->feed_lock);
>  
>  	for (i = 0; i < NUM_FE; ++i) {
>  		dvb_unregister_frontend(dvb->fe[i]);
> @@ -559,6 +566,9 @@ static void vidtv_bridge_remove(struct platform_device *pdev)
>  	dvb_dmxdev_release(&dvb->dmx_dev);
>  	dvb_dmx_release(&dvb->demux);
>  	dvb_unregister_adapter(&dvb->adapter);
> +
> +	mutex_destroy(&dvb->feed_lock);
> +
>  	dev_info(&pdev->dev, "Successfully removed vidtv\n");
>  }
>  
> -- 
> 2.43.0
>
