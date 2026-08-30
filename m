Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A0138BF9A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788076642; cv=none; b=jAyHDcJDd5bY+1Dz24xe/uVWn1MzjHv7GWrnS4K586iCVH5ITpXjza3FW+v8155LDfs7o3KjkmvfNR76MVfWnGMH6zF6wvKIaInwjlcVQSlx9Y6SHegJWgR+zQSdt03kmr+aEBlC9YhwJB8uvDXq9kVqJO+Xwi5dOzuu/QERATo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788076642; c=relaxed/simple;
	bh=qdgOvI9ZfoXBgad9Bu6vpvpaB75XjF0VCfNp3WoOhk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=LZv2RBvuKziMM/AXOl3p1+WF1wWOkTLpxcyiBUJKw65qTKKgqu7KFHnJyCGIQs1A66VnQKWq9nCN79fmH6i4NSw4kpgzBwbWQ/LRJERWy04RJm4mRVZHqCRnprbQw0KU1Xo140muXXwqHF4+ZJdnO1tTTTT2QjXBsndPgZLD/8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4667f641a98so3517506fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788076639; x=1788681439;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IyWKVtx2DmQgfl0T4AIbgWKHxP9LYOliY6XtyNUqPz8=;
        b=C8KfzQOvqrQxo2ldLioVUe9hVW//l8YGMjWqQQ2xebPC+Ikq7H8lCwmleetZNAWWor
         pnJ4XGohG5yKnC/zKASPXd2np5P5+am1NGabXXWprazxaukTtV26p1hQPgFTV3758jZi
         8UL4CV3ILgMpzWfuvKQ1GJ6aL6wQif6yjz+gQHzV8Fzoiq6Hwbx4qZGQYuidsel+fYJY
         0A6I8lL/N2HPa/vkzlWNfQnLLszr4sNHnsryWmHAar0cuTS44D896BmbFnzHti13e93R
         KrJjkFAuhyCsLLHC83QMY3EjLSS6zne8dKG03ZJ803KI7p7sqrrn2DQLDQLGRqKBXZLN
         klDw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/Z6PHCHChDDSLbyfZyJp6WM6dDgYKQQnymbk5AlbM/nNNeKC8Bbw6AQG/ArVz6BwYzwQ5r5C10AHPyI4=@vger.kernel.org
X-Gm-Message-State: AFuF++kqHPMTiZCPZivdpNn+fA6GPnLiPzYDDRqPC1/gCE2bL83fHD/B
	y3WYfngG3ekugvK5DeMyRYNn4FCqTGfFOClRBE6OCehSvCRHrwMnhJQ9/xyYfsGg0odXwwTE2uC
	4a/cTH0kbEcAQ3y5KYOkrY7M4LgZ5gC+GiBq+gV2wP7wOSnwxDTKIXSLikAE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1f06:b0:6b1:3663:8616 with SMTP id
 006d021491bc7-6b1c679f21cmr17021769eaf.33.1788076639666; Sun, 30 Aug 2026
 00:57:19 -0700 (PDT)
Date: Sun, 30 Aug 2026 00:57:19 -0700
In-Reply-To: <20260830075708.16258-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a93e25f.1d9ded08.62e62.0118.GAE@google.com>
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
